FROM debian:stretch
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apt-get update &&\
  apt-get install -y ca-certificates curl gnupg2 &&\
  echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Debian_9.0/ /' > /etc/apt/sources.list.d/isv:ownCloud:desktop.list &&\
  curl -sL https://download.opensuse.org/repositories/isv:ownCloud:desktop/Debian_9.0/Release.key | apt-key add - &&\
  apt-get update &&\
  apt-get install -y owncloud-client &&\
  apt-get purge -y curl gnupg2 &&\
  apt-get autoremove -y &&\
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
