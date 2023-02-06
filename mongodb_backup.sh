file_name1="router-chain-dump-backup";current_time=$(date "+%Y.%m.%d-%H.%M.%S")
echo "Current Time : $current_time"
new_fileName=$file_name1.$current_time
docker exec -it routerchain-db mongodump -d routerchain-db -o $new_fileName -u routerchain -p Router2022 --authenticationDatabase=admin
sleep 3m
docker cp routerchain-db:/$new_fileName .
aws s3 cp $new_fileName s3://mongo-backup-ec2/$new_fileName/ --recursive
