# docker build -t goPost .
# docker run -it goPost

FROM golang:1.17.7-alpine3.14 AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

RUN mkdir /pro
ADD ./usePost05.go /pro/
ADD ./go.mod ./go.sum /pro/
ADD .git /pro/
WORKDIR /pro
RUN go get -d -v ./...
RUN export VERSION=$(git rev-list -1 HEAD)
RUN go build -ldflags "-X main.VERSION=$VERSION" -o server usePost05.go

FROM alpine:latest

RUN mkdir /pro
COPY --from=builder /pro/server /pro/server
WORKDIR /pro
CMD ["/pro/server", "version"]