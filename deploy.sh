#!/bin/bash
# virtualenv env
# source env/bin/activate
# pip install -r requirements.txt

rm -R dist
cp -rf src dist
cp -rf env/lib/python3.6/site-packages/* dist
cd dist

rm ./hello_serverless.zip
zip -r hello_serverless.zip .

string=$(aws lambda list-functions)
if [[ $string = *"HelloServerless"* ]]; then
	aws lambda update-function-code --region $AWSREGION --function-name HelloServerless --zip-file fileb://hello_serverless.zip 
else 
	aws lambda create-function --region $AWSREGION --function-name HelloServerless --zip-file fileb://hello_serverless.zip --role arn:aws:iam::$AWSACCOUNTID:role/lambda_basic_execution  --handler hello_serverless.handler --runtime python3.6 --timeout 15 --memory-size 512
fi