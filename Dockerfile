FROM debian:stretch-slim

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        python3-venv \
        python3-dev \
        python3-gdbm 

ADD util /util
ADD provision /provision
ADD run /run

RUN provision/provision.sh