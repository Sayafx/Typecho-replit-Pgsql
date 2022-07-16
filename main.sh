sh startpg.sh
pg_ctl stop
pg_ctl -l ./postgresql.log start

if [ ! -f "typecho" ];then
#PG创建数据库：typecho
create -h 127.0.0.1 -p 5432 user admin with password 'admin';
createdb -h 127.0.0.1 -p 5432 typecho
git clone https://github.com/typecho/typecho

fi


a=$(awk '{print $1}' run.sh)
b=1

#插件Snow

#判断文件存在，判断是否为文件夹等

Snow="typecho/usr/plugins/Snow"

#testFile="/Volumes/MacBookProHD/Mr.Wen/08 shell命令/fileWen"

  

#判断文件夹是否存在 -d

if [[ ! -d "$Snow" ]]; then

echo "Snow文件夹不存在，安装插件Snow"

cd typecho/usr/plugins
mkdir Snow
cd Snow
git clone https://github.com/journey-ad/Snow-Typecho-Plugin.git && mv -b Snow-Typecho-Plugin/* ./ && mv -b Snow-Typecho-Plugin/.[^.]* ./ && rm -rf *~ && rm -rf Snow-Typecho-Plugin
cd ../../..

else

echo "Snow文件夹存在，不进行安装"

fi

#插件LoginDesigner

#判断文件存在，判断是否为文件夹等

LoginDesigner="typecho/usr/plugins/LoginDesigner"

#testFile="/Volumes/MacBookProHD/Mr.Wen/08 shell命令/fileWen"

  

#判断文件夹是否存在 -d

if [[ ! -d "$LoginDesigner" ]]; then

cd typecho/usr/plugins

echo "LoginDesigner文件夹不存在，安装插件LoginDesigner"


mkdir LoginDesigner
cd LoginDesigner
git clone https://github.com/Sayafx/LoginDesigner/ && mv -b LoginDesigner/* ./ && mv -b LoginDesigner/.[^.]* ./ && rm -rf *~ && rm -rf LoginDesigner
cd ../../../..
php -S 0.0.0.0:8000 -t typecho

else

echo "LoginDesigner文件夹存在，不进行安装"

fi

if [ $a == $b ];then
echo "初始化完毕"
echo "将文件run.sh第一行的1删去之后单击绿色 ▶ Run按钮"
echo "等待小窗口出现后，开始在shell中手动配置数据库"
else 
sh run.sh
fi

