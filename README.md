
    export v=$(date +%s); cd src; zip -r ../src.zip *; .. ; aws s3 cp src.zip s3://code.mlesniak.com/src-$v.zip
    aws cloudformation update-stack --stack-name demo --template-body file://lambda.yaml --parameters ParameterKey=LambdaCodeVersion,ParameterValue=$v --capabilities CAPABILITY_IAM

    AWS_ACCESS_KEY_ID=...
    AWS_SECRET_ACCESS_KEY=...
    AWS_DEFAULT_REGION=eu-central-1
    

## TODO

Use https://github.com/aws-actions/configure-aws-credentials