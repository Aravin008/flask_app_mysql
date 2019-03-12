curl -fsSL https://get.docker.com -o get-docker.sh
yes | sudo sh get-docker.sh
sudo systemctl start docker
#sudo docker container stop flapdb
sudo docker container stop my-sql
sudo docker rm flapdb
#sudo docker rm my-sql
sudo docker rmi aravin008/flaskapp
#sudo docker rmi aravin008/my-sql
sudo docker pull aravin008/my-sql
sudo docker run --detach --name=my-sql --env="MYSQL_ROOT_PASSWORD=mysql" aravin008/my-sql
sudo docker run --detach --name flapdb --publish 80:5000 --link my-sql:mysql aravin008/flaskapp
mysql -u root -p 'mysql' BucketList < createtable.sql
mysql -u root -p 'mysql' BucketList < storedProcedure.sql

