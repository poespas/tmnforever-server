FROM alpine:latest

RUN mkdir /opt/tmserver

WORKDIR /opt/tmserver

RUN apk add unzip wget
RUN wget -O /opt/tmserver/TrackmaniaServer.zip http://files2.trackmaniaforever.com/TrackmaniaServer_2011-02-21.zip
RUN unzip /opt/tmserver/TrackmaniaServer.zip -d /opt/tmserver
RUN rm /opt/tmserver/TrackmaniaServer.zip

COPY templates/dedicated_cfg.xml /opt/tmserver/GameData/Config/dedicated_cfg.txt
COPY start.sh /opt/tmserver/

ENV SERVER_SA_PASSWORD="SuperAdmin"
ENV FILE_DEDICATED_CFG="dedicated_cfg.txt"
ENV FILE_MATCHSETTINGS="MatchSettings/Nations/NationsGreen.txt"

ENV MASTERSERVER_LOGIN=""
ENV MASTERSERVER_PASSWORD=""
ENV MASTERSERVER_VALKEY=""

ENV SERVER_NAME="My Docker Trackmania Server!"
ENV SERVER_COMMENT="I love Docker"
ENV SERVER_PASSWORD=""

EXPOSE 5000/tcp
EXPOSE 2350/tcp
EXPOSE 2350/udp
EXPOSE 3450/tcp

CMD ["/opt/tmserver/start.sh"]
