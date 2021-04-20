# Node.js installer

定制 Node.js 的安装包，版本：v12.18.4

此安装包附带了 yarn pm2 和 nrm 三个小工具

| 软件包    | 版本     |
| --------- | -------- |
| Node.js   | v12.18.4 |
| npm / npx | v6.14.6  |
| yarn      | v1.22.10 |
| pm2       | v4.5.5   |
| nrm       | v1.2.1   |

使用 GitHub + jsDelivr 完成安装包文件 cdn 分发，实现加速下载

Linux 一键安装命令：

```bash
curl https://cdn.jsdelivr.net/gh/hxulin/node/12.18.4/install.sh | bash && source /etc/profile
```

默认安装目录为：/usr/local/node-v12.18.4

若需要指定安装目录，可以使用 --prefix 参数：

```bash
bash <(curl https://cdn.jsdelivr.net/gh/hxulin/node/12.18.4/install.sh) --prefix=/opt/nodejs && source /etc/profile
```

查看是否安装成功：

```bash
node -v
npm -v
npx -v
yarn -v
pm2 -v
nrm -V
```

