# Usage:
#   Run docker command as follows
#       % docker build -t {image_name}:{tag} {Dockerfile location}
#   e.g.,
#       % docker build -t ymdymd/alpine-grpc-sdk .
#
#       % docker run -it -v $PWD:/root/$PWD --rm -net host ymdymd/alpine-grpc-sdk 


FROM alpine
ENV LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:$LD_LIBRARY_PATH
RUN apk add --update alpine-sdk autoconf automake libtool file openssl curl c-ares-dev

RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc.git /tmp/grpc

RUN (cd /tmp/grpc \
    && git submodule update --init --recursive \
    && (cd third_party/protobuf && ./autogen.sh && ./configure && make install) \
    && make \
    && make install \
    && make install-grpc-cli \
    ) && rm -rf /tmp/grpc
