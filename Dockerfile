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

RUN curl https://get.acme.sh | sh -s email=my@example.com \
    && ln -s /root/.acme.sh/acme.sh /usr/bin \
    && mkdir -p /etc/nginx/ssl
