FROM mongo:3.0
MAINTAINER Martin Stabenfeldt <martins@sol.no>

ENTRYPOINT  curl ${RIVER_MAPPING} -o mapping.json && \
            sleep 30 && \
            curl http://elasticsearch:9200/_river/${RIVER_NAME}/_meta -d @mapping.json
