# Demo for Automation Night Aarhus (1. November 2016)

This is a demo that illustrates how Prometheus can be used to monitor a Kubernetes cluster. The demo is built by leveraging the awesome guide that [CoreOS](https://coreos.com/blog/prometheus-and-kubernetes-up-and-running.html) provides to setup a local Kubernetes cluster, along with there other guide to deploy Prometheus on the cluster to start monitoring.

Additions to the guide has been created to add Grafana, to show of the visualization of the metrics scrape by Prometheus. 


To run: (make sure you have vagrant and kubectl installed)

```bash
$ cd coreos-kubernetes/multi-node/vagrant
$ vagrant up
$ export KUBECONFIG="${KUBECONFIG}:$(pwd)/kubeconfig"

$ kubectl config use-context vagrant-multi
$ kubectl config set-cluster vagrant-multi-cluster --server=https://172.17.4.101:443 --certificate-authority=${PWD}/ssl/ca.pem
$ kubectl config set-credentials vagrant-multi-admin --certificate-authority=${PWD}/ssl/ca.pem --client-key=${PWD}/ssl/admin-key.pem --client-certificate=${PWD}/ssl/admin.pem
$ kubectl config set-context vagrant-multi --cluster=vagrant-multi-cluster --user=vagrant-multi-admin
$ kubectl config use-context vagrant-multi
```

Once the kubernetes cluster is up and running. Verify with

```
kubectl get nodes
```

We can now deploy Prometheus and Grafana on the cluster as follows:

```bash
$ ./prom_graf_up.sh
```

Shortly here after, you should be able to login:

Grafana:
http://172.17.4.101:30300/login

Prometheus:
http://172.17.4.101:30900


To add dashboards in Grafana, first add Prometheus as a datasource, see the image:

![Prometheus Datasource](https://github.com/kaspernissen/automation_night_demo/blob/master/prometheus_ds.png "How to setup Prometheus Datasource") 

Once Prometheus is installed as a datasource, add the dashboards by clicking on the dashboard menu, and choose "Import", next "Upload .json File", locate the file in the dashboard directory and press OK and Load. 

