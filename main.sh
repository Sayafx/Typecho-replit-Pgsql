sh startpg.sh
pg_ctl stop
pg_ctl -l ./postgresql.log start

if [ ! -f "typecho" ];then
#PG创建数据库：typecho
create -h 127.0.0.1 -p 5432 user admin with password 'admin';
createdb -h 127.0.0.1 -p 5432 typecho
git clone https://github.com/typecho/typecho

fi


#butterfly


#判断文件存在，判断是否为文件夹等

butterfly="typecho/usr/themes/butterfly"

#testFile="/Volumes/MacBookProHD/Mr.Wen/08 shell命令/fileWen"

  

#判断文件夹是否存在 -d

if [[ ! -d "$butterfly" ]]; then

echo "butterfly文件夹不存在，安装主题"
cd typecho/usr/themes
wget https://github.com/wehaox/Typecho-Butterfly/releases/download/1.5.3/butterfly_Release1.5.3-fix.zip
unzip butterfly_Release1.5.3-fix.zip
#after download if you dont have reCAPTCHA plugin del file usr/themes/butterfly/functions.php line 1528-1529 
rm -rf butterfly_Release1.5.3-fix.zip

else

echo "butterfly文件夹存在，不进行安装"

fi

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

else

echo "Snow文件夹存在，不进行安装"

fi

#插件LoginDesigner

#判断文件存在，判断是否为文件夹等

LoginDesigner="typecho/usr/plugins/LoginDesigner"

#testFile="/Volumes/MacBookProHD/Mr.Wen/08 shell命令/fileWen"

  

#判断文件夹是否存在 -d

if [[ ! -d "$LoginDesigner" ]]; then

echo "LoginDesigner文件夹不存在，安装插件LoginDesigner"
cd typecho/usr/plugins
mkdir LoginDesigner
cd LoginDesigner
git clone https://github.com/Sayafx/LoginDesigner/ && mv -b LoginDesigner/* ./ && mv -b LoginDesigner/.[^.]* ./ && rm -rf *~ && rm -rf LoginDesigner

else

echo "LoginDesigner文件夹存在，不进行安装"

fi





php -S 0.0.0.0:8000 -t typecho

