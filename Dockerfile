FROM golang:1.12-alpine

ENV GLIDE_VERSION 0.13.2
ENV GLIDE_ARCH linux-amd64

RUN apk add --update --no-cache \
        ca-certificates \
        git \
        openssh \
        curl \
  && update-ca-certificates

RUN mkdir -p $GOPATH/bin && \
  curl -L "https://github.com/Masterminds/glide/releases/download/v${GLIDE_VERSION}/glide-v${GLIDE_VERSION}-${GLIDE_ARCH}.tar.gz" | tar xz && \
  mv $GLIDE_ARCH/glide /usr/bin/glide && \
  rm -rf $GLIDE_ARCH
