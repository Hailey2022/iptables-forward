sysctl -w net.ipv4.ip_forward=1

localport=
remoteport=
localIP=
remotehost=
iptables -t nat -A PREROUTING -p tcp --dport $localport -j DNAT --to-destination $remotehost:$remoteport
iptables -t nat -A PREROUTING -p udp --dport $localport -j DNAT --to-destination $remotehost:$remoteport
iptables -t nat -A POSTROUTING -p tcp -d $remotehost --dport $remoteport -j SNAT --to-source $localIP
iptables -t nat -A POSTROUTING -p udp -d $remotehost --dport $remoteport -j SNAT --to-source $localIP
