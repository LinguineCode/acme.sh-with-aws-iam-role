# acme.sh-with-aws-iam-role

This is a wrapper docker image because [acme.sh](https://github.com/Neilpang/acme.sh) requires both `$AWS_ACCESS_KEY_ID` and `$AWS_SECRET_ACCESS_KEY` to be set. It does not use the AWS API and therefore it cannot make use of IAM roles itself. So we use `aws sts assume-role` to retrieve the credentials and then set them as environment variables prior to executing `acme.sh`.

This wrapper docker image will be rendered obsolete one day soon. Keep an eye on either/both of these feature requests:
  1. https://github.com/Neilpang/acme.sh/issues/1238 (preferred)
  1. https://github.com/aws/aws-cli/issues/1390

### Usage
```
sudo docker run -it \
-e AWS_ROLE_ARN="arn:aws:iam::123456789:role/myrole" \
-e AWS_ROLE_NAME="myrole" \
seanscottking\acme.sh-with-aws-iam-role \
--issue --dns dns_aws -d mywebsite.mydomain.com
```

### Credits
  *. https://github.com/Neilpang/acme.sh
  *. https://github.com/FernandoMiguel
  *. https://github.com/myoung34
