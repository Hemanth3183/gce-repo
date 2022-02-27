docker build -t hemanth318/multi-client -f ./client/Dockerfile ./client
docker build -t hemanth318/multi-server -f ./server/Dockerfile ./server
docker build -t hemanth318/multi-worker -f ./worker/Dockerfile ./worker
docker push hemanth318/multi-client
docker push hemanth318/multi-server
docker push hemanth318/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=hemanth318/multi-server
