#!/bin/bash

minikube stop -p wizard-school && minikube delete -p wizard-school

docker rmi wizard-server
docker rmi wizard-db
docker rmi php:7.4-apache
docker rmi mysql:5.7

echo 'Done!'