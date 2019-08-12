FROM debian:stretch-slim

ENV USERNAME=northwind

RUN useradd ${USERNAME} --create-home --shell /bin/bash

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
        bash locales \
        gcc \
        git git-core \
        jq \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        python3-venv \
        python3-dev \
        python3-gdbm \
        mariadb-client \
        vim unzip curl wget openssh-client \
        && \
    apt-get clean && \
    find /var/lib/apt/lists -type f -delete

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ADD util /util
ADD run /run

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LANG C.UTF-8

USER ${USERNAME}