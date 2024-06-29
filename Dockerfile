FROM alpine:3.20.1


RUN apk update && apk add zip && apk add --no-cache bash


COPY entrypoint.sh /


ENTRYPOINT ["bash"]
CMD ["/entrypoint.sh"]
