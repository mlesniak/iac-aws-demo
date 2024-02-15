#!/bin/sh

aws apigateway delete-base-path-mapping --domain-name dev.mlesniak.com --base-path "demo"
aws cloudformation delete-stack --stack-name demo
