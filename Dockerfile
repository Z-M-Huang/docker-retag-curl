FROM alpine:latest

LABEL maintainer="Mark Huang admin@zh-code.com"
LABEL description="CURL retag Docker images. Supports multi-arch images."

ADD entrypoint.sh /entrypoint.sh

RUN apk add --no-cache curl jq
RUN chmod +x entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]