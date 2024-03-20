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
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.forwarding=1" >> /etc/sysctl.conf
```

```javascript copy
sysctl -p /etc/sysctl.conf
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
grep -qE '^[ ]*precedence[ ]*::ffff:0:0/96[ ]*100' /etc/gai.conf || echo 'precedence ::ffff:0:0/96  100' | sudo tee -a /etc/gai.conf
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
