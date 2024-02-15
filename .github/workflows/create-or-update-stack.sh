#!/bin/bash
STACK_NAME="demo"
TEMPLATE_FILE="lambda.yaml"

# Check if the stack exists
aws cloudformation describe-stacks --stack-name $STACK_NAME > /dev/null 2>&1

# Capture the exit code of the previous command
STATUS=$?

if [ $STATUS -eq 0 ]; then
  echo "Stack exists, updating stack..."
  aws cloudformation update-stack --stack-name $STACK_NAME \
    --template-body file://$TEMPLATE_FILE \
    --parameters ParameterKey=LambdaCodeVersion,ParameterValue=$CURRENT_TIME \
    --capabilities CAPABILITY_IAM
else
  echo "Stack does not exist, creating stack..."
  aws cloudformation create-stack --stack-name $STACK_NAME \
    --template-body file://$TEMPLATE_FILE \
    --parameters ParameterKey=LambdaCodeVersion,ParameterValue=$CURRENT_TIME \
    --capabilities CAPABILITY_IAM
fi