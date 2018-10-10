# Docker builder for Golang
FROM golang:1.9 as builder
LABEL maintainer "BAP Engineering <engineering@bureauxapartager.com>"

WORKDIR /go/src/github.com/bureaux-a-partager/dummy-webhook
COPY . .
RUN set -x && \
    go get -d -v ./... && \
    CGO_ENABLED=0 GOOS=linux go build -a -o dummy-webhook . && \
    apt-get install -y ca-certificates

# Docker run Golang app
FROM busybox
LABEL maintainer "BAP Engineering <engineering@bureauxapartager.com>"

WORKDIR /workspace/
COPY --from=builder /go/src/github.com/bureaux-a-partager/dummy-webhook/dummy-webhook .
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
CMD ["./dummy-webhook"]
