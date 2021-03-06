FROM golang:1.8.3
COPY . /go/src/github.com/keel-hq/keel
WORKDIR /go/src/github.com/keel-hq/keel
RUN make build

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=0 /go/src/github.com/keel-hq/keel/keel /bin/keel
ENTRYPOINT ["/bin/keel"]

EXPOSE 9300