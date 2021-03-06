#!/bin/sh
# move the jdbc to the correct location
if [ ! -d "$TEAMCITY_DATA_PATH/lib/jdbc" ];
then
  mkdir -p $TEAMCITY_DATA_PATH/lib/jdbc
fi
if [ -f /opt/$MYSQL_JDBC_PACKAGE/$MYSQL_JDBC_PACKAGE-bin.jar ]; then
  # if file jdbc package doesn't exist, the container was probably restarted and this is skipped
  mv /opt/$MYSQL_JDBC_PACKAGE/$MYSQL_JDBC_PACKAGE-bin.jar $TEAMCITY_DATA_PATH/lib/jdbc
fi
exec ${TEAM_CITY_INSTALL_DIR}TeamCity/bin/teamcity-server.sh run >>/var/log/teamcity-server.log 2>&1
