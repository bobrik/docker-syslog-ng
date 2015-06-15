#!/bin/sh

set -e

echo "http://mirror.yandex.ru/mirrors/alpine/v3.2/main/"       > /etc/apk/repositories
echo "@3.1 http://mirror.yandex.ru/mirrors/alpine/v3.1/main/" >> /etc/apk/repositories

export SYSLOG_VERSION=3.6.3

export DOWNLOAD_URL="https://github.com/balabit/syslog-ng/releases/download/syslog-ng-${SYSLOG_VERSION}/syslog-ng-${SYSLOG_VERSION}.tar.gz"

apk update

apk add glib pcre libeventlog@3.1

apk add curl alpine-sdk glib-dev pcre-dev libeventlog-dev@3.1

cd /tmp
curl -L "${DOWNLOAD_URL}" > "syslog-ng-${SYSLOG_VERSION}.tar.gz"
tar zxf "syslog-ng-${SYSLOG_VERSION}.tar.gz"
cd "syslog-ng-${SYSLOG_VERSION}"
./configure --prefix=/usr
make
make install
cd ..
rm -rf "syslog-ng-${SYSLOG_VERSION}" "syslog-ng-${SYSLOG_VERSION}.tar.gz"

apk del curl alpine-sdk glib-dev pcre-dev libeventlog-dev
