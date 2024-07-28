FROM nginx:stable-alpine

RUN apk --no-cache add -f \
    openssl \
    openssh-client \
    coreutils \
    bind-tools \
    curl \
    sed \
    socat \
    tzdata \
    oath-toolkit-oathtool \
    tar \
    libidn \
    jq \
    cronie

RUN curl https://get.acme.sh | sh -s email=my@example.com --config-home /etc/acme.sh \
    && echo -e '#!/bin/sh\n/root/.acme.sh/acme.sh --config-home /etc/acme.sh "$@"' > /usr/bin/acme.sh \
    && chmod +x /usr/bin/acme.sh \ 
    && mkdir -p /etc/nginx/ssl
