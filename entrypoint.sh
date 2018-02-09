#!/bin/sh

export AWS_STS_ASSUME_ROLE_OUTPUT="$(aws sts assume-role --role-arn $AWS_ROLE_ARN --role-session-name $AWS_ROLE_NAME)"

export AWS_ACCESS_KEY_ID="$(echo $AWS_STS_ASSUME_ROLE_OUTPUT | jq '.Credentials.AccessKeyId' -r)"
export AWS_SECRET_ACCESS_KEY="$(echo $AWS_STS_ASSUME_ROLE_OUTPUT | jq '.Credentials.SecretAccessKey' -r)"
export AWS_SESSION_TOKEN="$(echo $AWS_STS_ASSUME_ROLE_OUTPUT | jq '.Credentials.SessionToken' -r)"

/usr/local/bin/acme.sh $@
