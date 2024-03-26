//测试ipv6是否可以用
//在我的试验中，我拿到的子网为 2001:19f0:6001:48e4::/64，下面都以此为基础。
//ip route add local 2001:19f0:6001:48e4::/64 dev enp1s0
//sysctl net.ipv6.ip_nonlocal_bind=1
//apt install ndppd
//nano /etc/ndppd.conf
/*
route-ttl 30000
proxy enp1s0 {
    router no
    timeout 500
    ttl 30000
    rule 2001:19f0:6001:48e4::/64 {
        static
    }
}
*/


//systemctl start ndppd
//添加ipv6：（可以用https://bulianglin.com/archives/ipv6.html随机生成）
// ip addr add 2001:19f0:6001:48e4::2/64 dev eth0;

//curl --interface 2001:19f0:6001:48e4::2 ipv6.ip.sb

//接下来你可以验证一下了，用 curl --interface 指定出口 IP


#!/bin/bash


if [ $# -lt 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi


input_file="$1"


grep -o 'inet6 2409:[0-9a-fA-F:]\+/119' "$input_file" | sed 's/inet6 //' | sed 's/\/119//' | while read -r ipv6_address; do

    if ((i % 20 == 0)); then
        wait
    fi


    if curl --interface "$ipv6_address" --max-time 10 -s ipv6.ip.sb > /dev/null; then
        echo "$ipv6_address"
    fi
    ((i++))
done


wait
