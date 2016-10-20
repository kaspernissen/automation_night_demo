#!/bin/bash

kubectl create -f demo/prometheus-configmap-2.yaml
kubectl create -f demo/prometheus-deployment.yaml
kubectl create -f demo/node-exporter.yaml
kubectl create -f demo/grafana-deployment.yaml