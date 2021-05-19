FROM openjdk:11-jre

RUN mkdir -p /opt/shinyproxy/

RUN \
    wget -q https://www.shinyproxy.io/downloads/shinyproxy-2.5.0.jar \
    -O /opt/shinyproxy/shinyproxy.jar

# ADD templates /opt/shinyproxy/templates/

WORKDIR /opt/shinyproxy/

CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]
