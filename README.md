# Minikube

Всего тут есть два узла: сервер, который берёт данные из базы данных и выводит их на экран, а так же база данных. Вот краткое описание узлов в виде таблицы.

|      Узел     |   ОС  |                            Установленное ПО                           |     Роль    |         Адрес         |
|---------------|-------|-----------------------------------------------------------------------|-------------|-----------------------|
| wizard-db     | Linux | Всё из публичного образа mysq:5.7                                     | База данных | wizard-db-service     |
| wizard-server | Linux | Всё из публичного образа php:7.4-apache, default-mysql-client, mysqli | Сервер      | wizard-server-service |

> [!IMPORTANT]
> Перед установкой предварительно инсталируйте и настройте на исправную работу [docker](https://www.docker.com), [minikube](https://minikube.sigs.k8s.io/docs/start) и [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)..

## Установка

Всё, что надо сделать - запустить скрипт (обязательно из папки репозитория).
``` bash
cd [path-to-minikube-repo]
./install.sh
```


## Остановка и удаление

Для того, что бы остановить и удалить кластер введите следующую команду.

``` bash
minikube stop -p wizard-school && minikube delete -p wizard-school
```

Для удаления всех собранных образов введите следующие команды.
``` bash
docker rmi wizard-server
docker rmi wizard-db
docker rmi php:7.4-apache
docker rmi mysql:5.7
```

Или же можете сделать всё вышеописанное запустив скрипт.
``` bash
./uninstall.sh
```
