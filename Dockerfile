FROM gliderlabs/alpine:3.1
MAINTAINER Martin Stabenfeldt <martins@sol.no>
USER root
RUN echo "Will execute: curl ${RIVER_MAPPING} -O mapping.json && " \
         curl http://elasticsearch:9200/_river/${RIVER_NAME}/_meta -d @mapping.json && \
         apk --update add curl

ENTRYPOINT curl ${RIVER_MAPPING} -o mapping.json && \
    curl http://elasticsearch:9200/_river/${RIVER_NAME}/_meta -d @mapping.json
