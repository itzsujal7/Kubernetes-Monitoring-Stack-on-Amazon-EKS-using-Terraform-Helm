#  Kubernetes Monitoring Stack on Amazon EKS using Terraform & Helm

##  Project Overview

This project demonstrates the deployment of a complete monitoring solution using **Prometheus and Grafana** on a Kubernetes cluster provisioned with **Amazon EKS**. The infrastructure is managed using **Terraform**, and applications are deployed using **Helm**.

---

##  Technologies Used

* Terraform
* Amazon EKS
* Kubernetes
* Helm
* Prometheus
* Grafana

---

##  Architecture

Terraform provisions the EKS cluster and worker nodes. Helm is used to deploy Prometheus and Grafana into the Kubernetes cluster.

User → Grafana → Prometheus → Kubernetes Cluster

---

##  Setup Instructions

### 1️ Clone Repository

```bash
git clone https://github.com/your-username/project-eks-monitoring.git
cd project-eks-monitoring
```

---

### 2️ Initialize Terraform

```bash
cd terraform
terraform init
terraform apply
```

---

### 3️ Configure kubectl

```bash
aws eks --region ap-south-1 update-kubeconfig --name monitoring-cluster
```

---

### 4️ Install Helm Charts

```bash
kubectl create namespace monitoring

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install prometheus prometheus-community/prometheus --namespace monitoring
helm install grafana grafana/grafana --namespace monitoring
```

---

### 5️ Access Services

#### Prometheus

```bash
kubectl port-forward svc/prometheus-server 9090:80 -n monitoring
```

Open: http://localhost:9090

#### Grafana

```bash
kubectl port-forward svc/grafana 3000:80 -n monitoring
```

Open: http://localhost:3000

---

##  Grafana Login

* Username: admin
* Password:

```bash
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode
```

---

##  Dashboard Setup

* Add Prometheus as data source
* Import dashboard ID: **1860**

---

## 📸 Screenshots

Screenshots are available in the `screenshots/` folder:

* Running Pods
* Prometheus UI
* Grafana Dashboard

---

##  Challenges Faced

* Kubernetes connection issues → Fixed using kubeconfig update
* Helm installation errors → Resolved by updating repo
* Grafana login issue → Retrieved password from Kubernetes secret

---

##  Outcome

* Successfully deployed monitoring stack
* Automated infrastructure using Terraform
* Visualized cluster metrics using Grafana

---

##  Author

Sujal Pandharpatte
