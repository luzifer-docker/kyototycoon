FROM alpine

LABEL maintainer Knut Ahlers <knut@ahlers.me>
ENV VERSION=9a8fb5c

RUN set -ex \
 && apk --no-cache add zlib-dev lzo-dev lua5.1-dev libstdc++ \
 && apk --no-cache add --virtual build-deps git build-base \
 && git clone https://github.com/carlosefr/kyoto.git /tmp/build \
 && cd /tmp/build && git reset --hard ${VERSION} && make PREFIX=/usr && make install \
 && rm -rf /tmp/kyoto.tgz /tmp/build \
 && apk del build-deps

VOLUME /data
EXPOSE 3000

ENTRYPOINT ["ktserver"]
CMD ["-ls", "-th", "16", "-port", "3000", "-pid", "/data/kyoto.pid", \
     "-oat", "-uasi", "10", "-asi", "10", "-ash", \
     "-sid", "1001", "-ulog", "/data/db", "-ulim", "104857600", \
     "/data/db/db.kct#opts=c#pccap=256m#dfunit=8"]
