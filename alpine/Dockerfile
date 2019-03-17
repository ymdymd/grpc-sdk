# Usage:
#   Run docker command as follows
#       % docker build -t {image_name}:{tag} {Dockerfile location}
#   e.g.,
#       % docker build -t ymdymd/grpc-sdk .
#
#       % docker run -it -v $PWD:/root/$PWD --rm -net host ymdymd/grpc-sdk 


FROM alpine:edge
RUN apk add --update --no-cache alpine-sdk autoconf automake libtool c-ares-dev

RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc.git /tmp/grpc

RUN (cd /tmp/grpc \
    && git submodule update --init --recursive \
    && (cd third_party/protobuf && ./autogen.sh && ./configure && make install) \
    && make \
    && make install \
    && make install-grpc-cli \
    ) && rm -rf /tmp/grpc

ENV LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:$LD_LIBRARY_PATH
