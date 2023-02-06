aws s3 cp s3://mongo-backup-ec2/$1  $1 --recursive

docker cp $1 routerchain-db:/$1 

docker exec -it routerchain-db mongorestore --uri=mongodb://routerchain:Router2022@localhost:27017/routerchain-db --db routerchain-db $1/routerchain-db --authenticationDatabase=admin
