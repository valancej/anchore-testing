# Anchore testing

[kind](https://kind.sigs.k8s.io/) and [Helm](https://helm.sh/). 

## Prerequisites

- [Docker](https://docs.docker.com/engine/install/)
- [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- [Helm](https://helm.sh/docs/intro/install/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### Step 1: Deploy Kind cluster

`kind create cluster --config=kind-config.yaml`

### Step 2: Install NGINX Ingress controller

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml`

### Step 3: Install Prom Stack

`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`

`k create ns monitoring`

`helm install prom-stack prometheus-community/kube-prometheus-stack -n monitoring`

Grafana available at port 80

### Step 4: Install Anchore

`helm repo add anchore https://charts.anchore.io`

#### Helm install

`helm install anchore anchore/anchore-engine -f values.yaml -n anchore --no-hooks`

#### Kustomize

`helm template anchore anchore/anchore-engine -f values.yaml > template.yaml --no-hooks`

`k apply -k .`