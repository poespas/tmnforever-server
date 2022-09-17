## Wortel538/tmnforever-server

Goal of this docker is to have as tiny, no-bullshit, and versitile docker for Trackmania Nations Forever

Also available on Dockerhub at [wortel538/tmnforever-server](https://hub.docker.com/wortel538/tmnforever-server).

### Usage

Docker-compose.yml
```
version: '3.5'
services:
    tmserver:
        image: 'wortel538/tmnationsforever-server:latest'
        restart: unless-stopped
        ports:
            - '2350:2350'
            - '3450:3450'
#            - '5000:5000'
        environment:
            - MASTERSERVER_LOGIN=myusername
            - MASTERSERVER_PASSWORD=computer123
```

Or cli
```
docker run -d \
  --name=tmserver \
  --restart unless-stopped \
  -e MASTERSERVER_LOGIN=myusername \
  -e MASTERSERVER_PASSWORD=computer123 \
  -p 2350:2350 \
  -p 3450:3450 \
  wortel538/tmnationsforever-server:latest
```

### Environment variables

| **Env variable**        	| **Description**                                                           	| **Default**                            	| **Required?** 	|
|-------------------------	|---------------------------------------------------------------------------	|----------------------------------------	|---------------	|
| `SERVER_SA_PASSWORD`    	| Server SuperAdmin password                                                	| SuperAdmin                             	| No            	|
| `MASTERSERVER_LOGIN`    	| Masterserver login                                                        	| _(none)_                               	| Yes           	|
| `MASTERSERVER_PASSWORD` 	| Masterserver password                                                     	| _(none)_                               	| Yes           	|
| `MASTERSERVER_VALKEY`   	| Masterserver validation key (used  for United)                            	| _(none)_                               	| Yes           	|
| `SERVER_NAME`           	| Server name                                                               	| My Docker Trackmania server!           	| No            	|
| `SERVER_COMMENT`        	| Server comment                                                            	| I love Docker                          	| No            	|
| `SERVER_PASSWORD`       	| Server password                                                           	| _(none)_                               	| No            	|
| `FILE_DEDICATED_CFG`    	| File to dedicated cfg,  _this value is relative to GameData/Config/_      	| dedicated_cfg.txt                      	| No            	|
| `FILE_MATCHSETTINGS`    	| File to Matchsettings config _this value is relative to GameData/Tracks/_ 	| MatchSettings/Nations/NationsGreen.txt 	| No            	|
| `XMLRPC_ALLOWREMOTE`    	| Allow XMLRPC to be reached remotely                                       	| False                                 	| No            	|

### Tiny?

This docker is about 49 MB, compared to [lduriez/tmserver](https://hub.docker.com/r/lduriez/tmserver) (111 MB), that's **about 44% smaller!**
