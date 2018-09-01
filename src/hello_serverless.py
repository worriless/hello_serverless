# -*- coding: UTF-8 -*-
from faker import Faker

def handler(event, context):
	faker = Faker()
	return {
		'message': 'This is just hello world! ()' + faker.name()
	}

# print(handler([], ''))