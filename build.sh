#!/bin/sh

set -e

export SYSLOG_VERSION=3.6.2

apk-install glib libeventlog pcre

apk-install curl alpine-sdk libeventlog-dev glib-dev pcre-dev

cd /tmp
curl -L "https://github.com/balabit/syslog-ng/releases/download/syslog-ng-${SYSLOG_VERSION}/syslog-ng-3.6.2.tar.gz" > "syslog-ng-${SYSLOG_VERSION}.tar.gz"
tar zxf "syslog-ng-${SYSLOG_VERSION}.tar.gz"
cd "syslog-ng-${SYSLOG_VERSION}"
./configure --prefix=/usr
make
make install
cd ..
rm -rf "syslog-ng-${SYSLOG_VERSION}" "syslog-ng-${SYSLOG_VERSION}.tar.gz"

apk del curl alpine-sdk libeventlog-dev glib-dev pcre-dev
