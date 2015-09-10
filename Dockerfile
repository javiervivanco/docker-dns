FROM alpine:latest
MAINTAINER Javier Vivanco <javier123mendoza (at) gmail (dot) com>
RUN apk update
RUN apk add dnsmasq
ADD dnsmasq.conf /etc/
EXPOSE 53
ENTRYPOINT  ["dnsmasq", "-d"]
