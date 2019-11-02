FROM ubuntu:18.04

LABEL email="davidodw.d@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - && \
    echo "deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main" > /etc/apt/sources.list.d/saltstack.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y salt-master && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["salt-master", "-l", "debug"]