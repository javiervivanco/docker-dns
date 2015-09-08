FROM alpine:latest
RUN apk update
RUN apk add dnsmasq
EXPOSE 53
ENTRYPOINT ["dnsmasq", "-d"]
