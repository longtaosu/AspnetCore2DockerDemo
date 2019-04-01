image_version=`date +%Y%m%d%H%M`;
project_name=`Jenkins2Docker`;
echo $image_version;
# cd Jenkins2Docker
git pull --rebase origin master;
docker stop $project_name;
docker rm $project_name;
docker build -t $project_name:$image_version .;
docker images;
docker run -p 10000:80 -d --name $project_name $project_name:$image_version;
# -v ~/docker-data/house-web/appsettings.json:/app/appsettings.json -v ~/docker-data/house-web/NLogFile/:/app/NLogFile   --restart=always
docker logs $project_name;
#删除build过程中产生的镜像    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)