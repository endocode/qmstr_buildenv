FROM ubuntu:18.04

ENV GOROOT /opt/go
ENV GOPATH /tmp/go
ENV PATH ${GOPATH}/bin:/opt/go/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive
ENV JENKINS_HOME /var/jenkins_home

# install dependecies
RUN apt-get update && apt-get install -y \
    curl autoconf make git libgit2-dev libio-captureoutput-perl virtualenv tar build-essential pkg-config protobuf-compiler \
    && rm -rf /var/lib/apt/lists/*

ENV GO_VERSION=1.12.4
RUN curl -o /opt/go.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
RUN cd /opt && tar -xf go.tar.gz

RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins

VOLUME /var/jenkins_home
