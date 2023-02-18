# FROM quay.io/keycloak/keycloak:20.0.3 as builder

# ENV KC_HEALTH_ENABLED=true
# ENV KC_METRICS_ENABLED=true
# RUN curl -sL https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.5.3/keycloak-metrics-spi-2.5.3.jar -o /opt/keycloak/providers/keycloak-metrics-spi-2.5.3.jar
# RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:20.0.3
# COPY flyio-cache-config.xml /opt/keycloak/conf/flyio-cache-config.xml
# COPY --from=builder /opt/keycloak/ /opt/keycloak/
# WORKDIR /opt/keycloak
# RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]