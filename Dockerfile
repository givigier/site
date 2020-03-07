FROM alpine:latest
  RUN apk --no-cache add curl

  ENV HUGO_VERSION 0.66.0
  ENV HUGO_SITE /app

  RUN curl -SL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
        -o /tmp/hugo.tar.gz \
    && tar -xzf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && apk del curl \
    && mkdir -p ${HUGO_SITE} \
    && rm -rf /tmp/*

  WORKDIR ${HUGO_SITE}

  EXPOSE 1313

  CMD hugo server --bind 0.0.0.0
