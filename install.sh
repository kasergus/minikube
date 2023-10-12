#!/bin/bash

minikube start -p wizard-school  # создание кластера

docker build -t wizard-db ./images/wizard-db  # создание образа базы данных
docker build -t wizard-server ./images/wizard-server  # создание образа сервера
minikube image load wizard-db wizard-server -p wizard-school  # загрузка образов в кластер

kubectl apply -f yamlconfig/wizard-db-config.yaml  # ──────────╮
kubectl apply -f yamlconfig/wizard-db-secret.yaml  # ──────────┼──╼ применение конфигураций
kubectl apply -f yamlconfig/wizard-db-deployment.yaml  # ──────┤
kubectl apply -f yamlconfig/wizard-server-deployment.yaml  # ──╯

echo 'Done!'
echo 'Do you want to run the server? [y/n]'
read answer

if [[ $answer == 'y' || $answer == 'Y' ]]
then
	minikube service wizard-server-service -p wizard-school  # запуск сервера при согласии пользователя
fi