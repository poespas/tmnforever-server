#!/bin/sh

echo "Setting ENV/ARG variables"
sed -i "s/%SERVER_SA_PASSWORD%/${SERVER_SA_PASSWORD}/" /opt/tmserver/GameData/Config/${FILE_DEDICATED_CFG}
sed -i "s/%MASTERSERVER_LOGIN%/${MASTERSERVER_LOGIN}/" /opt/tmserver/GameData/Config/${FILE_DEDICATED_CFG}
sed -i "s/%MASTERSERVER_PASSWORD%/${MASTERSERVER_PASSWORD}/" /opt/tmserver/GameData/Config/${FILE_DEDICATED_CFG}
sed -i "s/%MASTERSERVER_VALKEY%/${MASTERSERVER_VALKEY}/" /opt/tmserver/GameData/Config/${FILE_DEDICATED_CFG}
sed -i "s/%SERVER_NAME%/${SERVER_NAME}/" /opt/tmserver/GameData/Config/${FILE_DEDICATED_CFG}
sed -i "s/%SERVER_COMMENT%/${SERVER_COMMENT}/" /opt/tmserver/GameData/Config/${FILE_DEDICATED_CFG}
sed -i "s/%SERVER_PASSWORD%/${SERVER_PASSWORD}/" /opt/tmserver/GameData/Config/${FILE_DEDICATED_CFG}

echo "Launching Server.."
exec /opt/tmserver/TrackmaniaServer /dedicated_cfg=${FILE_DEDICATED_CFG} /game_settings=${FILE_MATCHSETTINGS} /nodaemon
