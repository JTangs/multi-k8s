#!/bin/bash

docker build -t jntango/multi-client:latest -t jntango/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jntango/multi-server:latest -t jntango/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jntango/multi-worker:latest -t jntango/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jntango/multi-client:latest
docker push jntango/multi-server:latest
docker push jntango/multi-worker:latest

docker push jntango/multi-client:$SHA
docker push jntango/multi-server:$SHA
docker push jntango/multi-worker:$SHA

kubebctl apply -f ./k8s
kubebctl set image deployments/server-deployment server=jntango/multi-server:$SHA
kubebctl set image deployments/client-deployment server=jntango/multi-client:$SHA
kubebctl set image deployments/worker-deployment server=jntango/multi-worker:$SHA
