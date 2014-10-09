#!/bin/bash  
#haproxy_hot_reload_config.sh  
#the program will restart the haproxy by using  its hot reconfiguration  
  
config="./examples/qiye.cfg"  
pidfile="haproxy.pid" 
pid=`cat $pidfile`  
status=-2  
 
if [ -e /proc/$pid/exe ]; then  
   ./haproxy -D -f  $config -p haproxy.pid -sf $pid  
   status=0  
else  
   rm haproxy.pid
   ./haproxy -D -f  $config -p haproxy.pid 
   status=1  
fi  
echo "ello" 
echo $status  
exit $status 
