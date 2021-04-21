#!/bin/bash
#
# Customized Node.js installer script, include yarn, pm2, nrm

# 设置默认安装目录
install_dir=/usr/local/node-v12.18.4

# 判断是否有传入安装目录的参数, 有则使用传入的参数
if [[ $1 = --prefix=* ]]; then
    # 从参数 $1 的第 9 个字符截取后面的内容, 获取 --prefix= 后的安装目录
    install_dir=${1:9}
fi

# 创建安装目录
if [ ! -d $install_dir ]; then
    mkdir -p $install_dir
fi

echo The installation directory is created: $install_dir

package_name=node-v12.18.4-linux-x64-nrm-yarn-pm2.tar.xz
shard_package=${package_name}_[0-1]

echo Download Node.js package...
curl -sO https://cdn.jsdelivr.net/gh/hxulin/node/$shard_package
cat $shard_package > $package_name
echo $shard_package | xargs rm

echo Extract package and install Node.js...
tar -xf $package_name -C $install_dir --strip-components 1
rm -f $package_name

echo Modify PATH variables file: /etc/profile
cat << EOF >> /etc/profile
export NODE_HOME=$install_dir
export PATH=\$NODE_HOME/bin:\$PATH
EOF

export NODE_HOME=$install_dir
export PATH=$NODE_HOME/bin:$PATH

echo Customized Node.js installation is complete.
echo "It's include yarn, pm2, nrm"
echo Check the detail information, you can enter:
echo node -v
echo npm -v
echo npx -v
echo yarn -v
echo pm2 -v
echo nrm -V
echo Thanks for using, goodbye.
