#!/bin/bash


#########################################################################
#   Copyright (C) 2018 All rights reserved.
#   
#   FILE: docker_tag_gcr.sh
#   AUTHOR: Max Xu
#   MAIL: xuhuan@live.cn
#   DATE: 10/16/2018    TIME:19:45:56
#
#########################################################################


username=jsonbruce
images=("kube-apiserver:v1.13.1" "kube-controller-manager:v1.13.1" "kube-scheduler:v1.13.1" "kube-proxy:v1.13.1" "pause:3.1" "etcd:3.3.10" "coredns:1.2.6" \
     	"kubernetes-dashboard-amd64:v1.10.1" "heapster-amd64:v1.5.4" "heapster-influxdb-amd64:v1.5.2" "heapster-grafana-amd64:v5.0.4")

for image in ${images[@]};
do
    docker pull $username/$image
    docker tag $username/$image k8s.gcr.io/$image
    docker rmi $username/$image
done
