docker build -t hemanth318/multi-client:latest -t hemanth318/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t hemanth318/multi-server:latest -t hemanth318/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t hemanth318/multi-worker:latest -t hemanth318/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push hemanth318/multi-client:latest
docker push hemanth318/multi-client:$SHA
docker push hemanth318/multi-server:latest
docker push hemanth318/multi-server:$SHA
docker push hemanth318/multi-worker:latest
docker push hemanth318/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=hemanth318/multi-server:latest
kubectl set image deployments/worker-deployment worker=hemanth318/multi-worker:latest
kubectl set image deployments/client-deployment client=hemanth318/multi-client:latest
