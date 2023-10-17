# -
DD网络重装脚本：系统默认为debian12  leitbogioro

wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh && bash InstallNET.sh -debian 12 -pwd '密码'

BBR脚本:

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf

echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

sysctl -p

sysctl net.ipv4.tcp_available_congestion_control

lsmod | grep bbr

网络测试脚本:

wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh

流媒体测试脚本:

bash <(curl -L -s check.unlock.media)

X-:

bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)

Docker:

curl -sSL https://get.docker.com/ | sh

cloudflare warp脚本 添加IPv4/IPv6网络:

wget -N https://raw.githubusercontent.com/fscarmen/warp/main/menu.sh && bash menu.sh

测试 IPv4 优先还是 IPv6 优先:
curl ip.p3terx.com

acme生成免费证书:

curl https://get.acme.sh | sh

服务器综合测试脚本(融合怪):

curl -L https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh -o ecs.sh && chmod +x ecs.sh && bash ecs.sh


性能测试脚本:

wget -qO- yabs.sh | bash

流量稀缺的服务器（不测试iperf网络）:

curl -sL yabs.sh | bash -s -- -i

geekbench5（不测试geekbench6）:

curl -sL yabs.sh | bash -s -- -5

服务器流量稀缺（不测试geekbench6、不测试iperf网络）:

curl -sL yabs.sh | bash -s -- -5 -i

Bench 网络带宽及硬盘读写速率（国外部分+国内部分节点）:

wget -qO- bench.sh | bash

超售脚本:

wget --no-check-certificate -O memoryCheck.sh https://raw.githubusercontent.com/uselibrary/memoryCheck/main/memoryCheck.sh && chmod +x memoryCheck.sh && bash memoryCheck.sh
