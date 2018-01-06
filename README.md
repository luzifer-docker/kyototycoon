# luzifer-docker / kyototycoon

This image contains a build of the [Kyototycoon](http://fallabs.com/kyototycoon/) fork by [carlosefr](https://github.com/carlosefr/kyoto) based on [Alpine Linux](https://alpinelinux.org/).

## Usage

```
$ docker run --rm -ti \
    -p 127.0.0.1:3000:3000 \
    luzifer/kyototycoon

$ curl -X PUT -d 'test' http://127.0.0.1:3000/test

$ curl -X GET http://127.0.0.1:3000/test
test
```
