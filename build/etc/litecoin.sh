#!/bin/sh
#
# litecoind      Start litecoind
#
# chkconfig: 2345 08 92
# description:  Starts, stops
#

# Source function library.
. /etc/init.d/functions
#
LITECOIN=/opt/litecoin
DAEMON=$LITECOIN/bin/litecoind
CONF=$LITECOIN/etc/litecoin.conf
DATA=$LITECOIN/data
start() {
        $DAEMON -conf=$CONF -datadir=$DATA -daemon
}
stop() {
        kill `ps -ef|grep $DAEMON|grep -v grep|awk '{print $2}'`
}
restart() {
    stop
    sleep 1
    start
}
case "$1" in
    start)
        start
        RETVAL=$?
        ;;
    stop)
        stop
        RETVAL=$?
        ;;
    restart|force-reload)
        restart
        RETVAL=$?
        ;;
    *)
        echo $"Usage: {start|stop|restart}"
        RETVAL=2
        ;;
esac

exit $RETVAL
