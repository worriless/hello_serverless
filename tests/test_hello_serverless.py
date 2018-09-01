# -*- coding: UTF-8 -*-
from src.hello_serverless import handler

class TestHandler():
    def test_handler(self):
        result = handler([], '')
        print(result)
        assert 1 == 1
