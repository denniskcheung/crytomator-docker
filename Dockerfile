# JDK could bloat the image size, only need JRE
# FROM openjdk:19-jdk
FROM openjdk:11-jre-slim

ENV TIMEOUT 2h
ENV VAULT_NAME demoVault
ENV VAULT_PATH /cryptomatorDir
ENV VAULT_PASS password
ENV CRYPTOMATOR_PORT 8181

EXPOSE 8181

COPY cryptomator-cli-0.5.1.jar /usr/local/bin/cryptomator-cli.jar

COPY boot.sh /usr/local/bin/boot.sh
# change permission
RUN chmod +x /usr/local/bin/boot.sh

# run at startup
CMD timeout $TIMEOUT /usr/local/bin/boot.sh
