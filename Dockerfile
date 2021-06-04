FROM golang as go

RUN git clone https://github.com/drone/drone.git && \
    cd drone && \
    git checkout v2.0.1 && \
    go build -tags "oss nolimit" github.com/drone/drone/cmd/drone-server

VOLUME /data

ENV XDG_CACHE_HOME /data
ENV DRONE_DATABASE_DRIVER sqlite3
ENV DRONE_DATABASE_DATASOURCE /data/database.sqlite
ENV DRONE_RUNNER_OS=linux
ENV DRONE_RUNNER_ARCH=amd64

ENTRYPOINT ["/go/drone/drone-server"]

