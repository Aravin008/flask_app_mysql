# Download and install docker
curl -fsSL https://get.docker.com -o get-docker.sh
yes | sudo sh get-docker.sh
sudo systemctl start docker
sudo docker container stop flapdb
#sudo docker container stop my-sql
sudo docker rm flapdb
#sudo docker rm my-sql
sudo docker rmi aravin008/flaskapp
#sudo docker pull aravin008/my-sql
sudo docker run --detach --name=my-sql -p 3306:3306 --env="MYSQL_ROOT_PASSWORD=mysql" --env="MYSQL_DATABASE=BucketList" mysql
sudo docker run --detach --name flapdb --publish 80:5000 --link my-sql:mysql aravin008/flaskapp
yes | sudo apt-get update
yes | sudo apt-get install mysql-client || echo "my-sql client available"
if mysql -h "127.0.0.1" -u root -p'mysql' BucketList < createtable.sql; then
    echo "Successfully created table"
else 
    echo "Failed to run the command"
fi
if mysql -h "127.0.0.1" -u root -p'mysql' BucketList < storedProcedure.sql; then
    echo "Successfully created sp"
else
    echo "Required schema is available"
fi

