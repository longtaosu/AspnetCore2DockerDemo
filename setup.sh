image_version=`date +%Y%m%d%H%M`;
project_name=`Jenkins2Docker`;
echo $image_version;
# cd Jenkins2Docker
git pull --rebase origin master;
docker stop Jenkins2Docker;
docker rm Jenkins2Docker;
docker build -t Jenkins2Docker:$image_version .;
docker images;
docker run -p 10000:80 -d --name Jenkins2Docker Jenkins2Docker:$image_version;
# -v ~/docker-data/house-web/appsettings.json:/app/appsettings.json -v ~/docker-data/house-web/NLogFile/:/app/NLogFile   --restart=always
docker logs Jenkins2Docker;
#删除build过程中产生的镜像    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)