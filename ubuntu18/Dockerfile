# Usage:
#   Run docker command as follows
#       % docker build -t ymdymd/grpc-sdk .
#       % docker run -it -v $PWD:/root/$PWD --rm -net host ymdymd/grpc-sdk 
#

FROM ubuntu:18.04

ENV LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:$LD_LIBRARY_PATH

RUN apt-get update && apt-get install -y -qq \ 
    git curl \ 
    build-essential cmake \
    autoconf automake libtool pkg-config \
    libc-ares-dev libgflags-dev

RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc.git /tmp/grpc

RUN (cd /tmp/grpc \
    && git submodule update --init --recursive \
    && (cd third_party/protobuf && ./autogen.sh && ./configure && make install) \
    && make \
    && make install \
    && make install-grpc-cli \
    ) && rm -rf /tmp/grpc




