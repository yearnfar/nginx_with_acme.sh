FROM nginx:stable-alpine

ENV http_proxy=http://192.168.3.143:1087
ENV https_proxy=http://192.168.3.143:1087

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

RUN curl https://get.acme.sh | sh -s email=my@example.com \
    && ln -s /root/.acme.sh/acme.sh /usr/bin \
    && mkdir -p /etc/nginx/ssl
