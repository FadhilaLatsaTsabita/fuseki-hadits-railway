FROM stain/jena-fuseki:latest

USER root

ENV JVM_ARGS=-Xmx512m
ENV ADMIN_PASSWORD=admin123

RUN mkdir -p /staging

COPY dataset_hadits.ttl /fuseki/configuration/dataset_hadits.ttl
COPY data/ /staging/
COPY entrypoint.sh /entrypoint-custom.sh
RUN chmod +x /entrypoint-custom.sh

ENTRYPOINT ["/entrypoint-custom.sh"]