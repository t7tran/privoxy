FROM alpine:3.15

COPY --chown=100:101 ./rootfs /

RUN apk add --no-cache privoxy

USER privoxy

ENTRYPOINT ["privoxy"]
CMD ["--no-daemon", "/etc/privoxy.conf"]