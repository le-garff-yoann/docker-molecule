FROM python:3.7-alpine3.11

LABEL maintainer="pe.weeble@yahoo.fr"

WORKDIR /tmp

ENV DEV_PACKAGES="gcc libffi-dev make musl-dev openssl-dev python3-dev"

RUN \
    apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/v3.11/main/ \
    $DEV_PACKAGES docker git openssh-client ruby docker-py py3-pip python3 \
    && pip3 install ansible==2.9.5 molecule==2.22 "molecule[docker,docs,windows]" \
    && apk del $DEV_PACKAGES
