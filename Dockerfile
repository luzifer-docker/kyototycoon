FROM debian

RUN set -ex \
 && apt-get update \
 && apt-get install -y kyototycoon

VOLUME /data
EXPOSE 3000

ENTRYPOINT ["ktserver"]
CMD ["-ls", "-th", "16", "-port", "3000", "-pid", "/data/kyoto.pid", \
     "-oat", "-uasi", "10", "-asi", "10", "-ash", \
     "-sid", "1001", "-ulog", "/data/db", "-ulim", "104857600", \
     "/data/db/db.kct#opts=c#pccap=256m#dfunit=8"]
