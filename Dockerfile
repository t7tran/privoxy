FROM alpine:3.19.0

COPY --chown=100:101 ./rootfs /

RUN apk add --no-cache privoxy && \
    cd /etc/privoxy && \
    for f in `ls -1 *.new`; do mv $f ${f%.*}; done

USER privoxy

ENTRYPOINT ["privoxy"]
CMD ["--no-daemon", "/etc/privoxy.conf"]