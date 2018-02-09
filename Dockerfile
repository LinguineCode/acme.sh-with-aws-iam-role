FROM neilpang/acme.sh

RUN apk --no-cache add -f jq python py-pip && rm -rf /var/cache/apk/*
RUN pip install awscli

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

ENV AWS_ROLE_ARN $AWS_ROLE_ARN
ENV AWS_ROLE_NAME $AWS_ROLE_NAME

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["--help"]