FROM alpine:3.20.1


RUN apk update && apk add zip


COPY entrypoint.sh /


ENTRYPOINT ["bash"]
CMD ["/entrypoint.sh"]
