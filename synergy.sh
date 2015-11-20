#!/bin/sh
# ps aux|grep synergy|cut -c 9-15|xargs kill -9
# nohup synergy > synergy.log 2>&1 &


    SERVICE="synergy" 

    start(){
        echo "starting..."
        nohup $SERVICE > /dev/null 2>&1 &   
        if [ $? -ne 0 ]
        then 
            echo "start failed, please check the log!"
            exit $?
        else
#            echo $! > $SERVICE.pid  
            echo "start success" 
        fi
		exit 0
    }

    stop(){
        echo "stopping..."
		#ps aux|grep synergy|grep -v "grep"|cut -c 9-15 > $SERVICE.pid
		#kill -9 `cat $SERVICE.pid` 
		kill -9 $(lsof -i:24800 |awk '{print $2}' | tail -n 1)
        if [ $? -ne 0 ]
        then 
            echo "stop failed, may be $SERVICE isn't running"
#            exit $? 
        else 
            rm -rf $SERVICE.pid  
            echo "stop success" 
        fi
    }

    restart(){
        stop&&start
    }

    status(){
        num=`ps -ef | grep $SERVICE | grep -v grep | wc -l`
        if [ $num -eq 0 ]
        then 
            echo "$SERVICE isn't running"
        else
            echo "$SERVICE is running"
        fi
    }

    case $1 in     
        start)      start ;;   
        stop)      stop ;;   
        restart)  restart ;; 
        status)  status ;; 
	*)	restart ;; 
#        *)          echo "Usage: $0 {start|stop|restart|status}" ;;      
    esac   
  
    exit 0  

