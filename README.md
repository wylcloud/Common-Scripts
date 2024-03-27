# **常用脚本**

## **DD网络重装脚本：系统默认为debian12  leitbogioro**

```javascript copy
wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh && bash InstallNET.sh -debian 12 -pwd '密码'
```
## **DD网络重装脚本：moeclue**

```javascript copy
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 12 -v 64 -p 密码 -port 端口 -a -firmware --mirror 'https://mirrors.cloud.tencent.com/debian/'

bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -u 20.04 -v 64 -p 密码 -port 端口 -a -firmware --mirror  'http://archive.ubuntu.com/ubuntu'
```

## **BBR脚本:**

```javascript copy
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf && echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf && sysctl -p && sysctl net.ipv4.tcp_available_congestion_control && lsmod | grep bbr
```

```javascript copy
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf && echo "net.ipv6.conf.all.forwarding=1" >> /etc/sysctl.conf
```

```javascript copy
sysctl -p /etc/sysctl.conf
```



```javascript copy
//nft list ruleset
//systemctl restart nftables
//nano /etc/nftables.conf
//# nft add table ip nat

//添加转发到外部ip的端口
//nft -- add chain inet filter prerouting { type nat hook prerouting priority -100 \; }
//nft add chain inet filter postrouting { type nat hook postrouting priority 100 \; }
//nft add rule inet filter postrouting ip6 daddr [2403:xx] masquerade
//nft add rule inet filter prerouting tcp dport 30000-40000 dnat ip6 to [2403:xx]:20000
//nft add rule inet filter prerouting udp dport 30000-40000 dnat ip6 to [2403:xx]:20000
//不同写法：（声明ip6）
//nft add rule inet filter prerouting ip6 daddr [::] tcp dport 30000-40000 dnat to [::]:20000
//得到结果：ip6 daddr :: tcp dport 30000-40000 dnat ip6 to [2403:xx]:20000


//添加转发到本机的端口
nft -- add chain inet filter prerouting { type nat hook prerouting priority dstnat - 5 \; }
nft add rule inet filter prerouting tcp dport 30001-35000 redirect to :30000
nft add rule inet filter prerouting udp dport 30001-35000 redirect to :30000




```
## **国内机换apt源（Debian 11）:**
```javascript copy
cat > /etc/apt/sources.list << EOF
deb https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ bullseye main contrib non-free

deb https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-updates main contrib non-free

deb https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian/ bullseye-backports main contrib non-free

deb https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
deb-src https://mirrors.ustc.edu.cn/debian-security/ bullseye-security main contrib non-free
EOF
```

```javascript copy

sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list
```
//开机自动更改dns，有些主机服务商每次重启自动更改dns
```javascript copy
@reboot echo -e "nameserver 2400:3200::1\nnameserver 2400:3200:baba::1" > /etc/resolv.conf
```
//设置dns
```javascript copy
nano /etc/dhcp/dhclient.conf
supersede domain-name-servers 223.5.5.5, 223.6.6.6;
supersede dhcp6.name-servers 2400:3200::1, 2400:3200:baba::1;
```
//设置静态v4v6
```javascript copy
nano nano /etc/network/interfaces

auto enp1s0
iface enp1s0 inet static
    address 192.168.1.2
    netmask 255.255.255.0
    gateway 192.168.1.1

iface enp1s0 inet6 static
    address 2400:xx:xx:xx::xx
    netmask 64
    gateway fe80::1

    dns-nameservers 223.5.5.5 223.6.6.6
    dns-nameservers 2400:3200::1 2400:3200:baba::1

```
## **网络测试脚本(回程):**

```javascript copy
wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh
```

## **测速脚本:**
```javascript copy
bash <(curl -Lso- https://bench.im/hyperspeed)
```

## **流媒体测试脚本:**
```javascript copy
bash <(curl -L -s check.unlock.media)
```
```javascript copy
bash <(curl -L -s media.ispvps.com)
```

## **X-:**

```javascript copy
bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)
```
```javascript copy
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
```
```javascript copy
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
```
## **Docker:**

```javascript copy
curl -sSL https://get.docker.com/ | sh
```
```javascript copy
docker run -d -p 6688:80 ilemonrain/html5-speedtest:latest
```
## **cloudflare warp脚本 添加IPv4/IPv6网络:**

```javascript copy
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh
```

## **为 IPv6 Only VPS 启用 IPv4 支持**
```javascript copy
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh 4
```
```javascript copy
bash <(curl -fsSL git.io/warp.sh) 4
```
## **测试 IPv4 优先还是 IPv6 优先:**

```javascript copy
curl ip.p3terx.com
```
## IPv4 优先
```javascript copy
grep -qE '^[ ]*precedence[ ]*::ffff:0:0/96[ ]*100' /etc/gai.conf || echo 'precedence ::ffff:0:0/96  100' | tee -a /etc/gai.conf
```
## **设置时区**

```javascript copy
timedatectl set-timezone Asia/Shanghai
```


## **acme生成免费证书:**

```javascript copy
curl https://get.acme.sh | sh
```

## **服务器综合测试脚本(融合怪):**

```javascript copy
curl -L https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh -o ecs.sh && chmod +x ecs.sh && bash ecs.sh
```

### **性能测试脚本:**

wget -qO- yabs.sh | bash
```javascript copy
curl -L https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh -o ecs.sh && chmod +x ecs.sh && bash ecs.sh
```

### **流量稀缺的服务器（不测试iperf网络）**:

```javascript copy
curl -sL yabs.sh | bash -s -- -i
```

### **geekbench5（不测试geekbench6）:**

```javascript copy
curl -sL yabs.sh | bash -s -- -5
```

### **服务器流量稀缺（不测试geekbench6、不测试iperf网络）:**

```javascript copy
curl -sL yabs.sh | bash -s -- -5 -i
```

### **Bench 网络带宽及硬盘读写速率（国外部分+国内部分节点）:**

```javascript copy
wget -qO- bench.sh | bash
```

### **超售测试脚本:**

```javascript copy
wget --no-check-certificate -O memoryCheck.sh https://raw.githubusercontent.com/uselibrary/memoryCheck/main/memoryCheck.sh && chmod +x memoryCheck.sh && bash memoryCheck.sh
```
