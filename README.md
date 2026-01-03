# Trend DevOps Deployment

# 🚀 Trend DevOps CI/CD Pipeline (Jenkins + Docker + EKS)

## 📌 Project Overview

This project demonstrates a **complete CI/CD pipeline** for a frontend application using **Jenkins, Docker, GitHub Webhooks, and AWS EKS**.

The pipeline is **fully automated**:

* Any code change pushed to GitHub
* Automatically triggers Jenkins via Webhook
* Builds a Docker image
* Pushes the image to Docker Hub
* Deploys the application to an AWS EKS Kubernetes cluster

---

## 🧱 Architecture Overview

```
GitHub (Code Push)
        │
        ▼
GitHub Webhook
        │
        ▼
Jenkins (CI/CD Pipeline)
 ├─ Build Docker Image
 ├─ Push Image to Docker Hub
 └─ Deploy to AWS EKS
        │
        ▼
Kubernetes (Pods & Services)
```

---

## 🛠️ Tech Stack Used

| Category         | Tools                                   |
| ---------------- | --------------------------------------- |
| CI/CD            | Jenkins                                 |
| Containerization | Docker                                  |
| Orchestration    | Kubernetes (EKS)                        |
| Cloud            | AWS (EC2, EKS, IAM)                     |
| SCM              | GitHub                                  |
| Monitoring       | Kubernetes Metrics Server (Open Source) |

---

## 📂 Project Structure

```
trend-devops-deployment/
│
├── dist/                     # Frontend build output
├── k8s/
│   ├── deployment.yaml       # Kubernetes Deployment
│   └── service.yaml          # Kubernetes Service
│
├── terraform/                # Infrastructure as Code (AWS)
│   ├── main.tf
│   └── terraform.tfstate
│
├── Dockerfile                # Docker image definition
├── Jenkinsfile               # Jenkins pipeline
├── .dockerignore
├── .gitignore
└── README.md
```

---

## 🔁 CI/CD Pipeline Flow (Detailed)

### 1️⃣ Code Push

* Developer pushes code to GitHub (`main` branch)

### 2️⃣ Webhook Trigger

* GitHub Webhook notifies Jenkins
* Jenkins job starts **automatically** (no manual build)

### 3️⃣ Build Stage

* Jenkins builds Docker image from `Dockerfile`

### 4️⃣ Push Stage

* Image is pushed to Docker Hub repository

### 5️⃣ Deploy Stage

* Jenkins deploys updated image to AWS EKS
* Kubernetes updates pods automatically

---

## 🧾 Jenkins Pipeline Stages

* **Checkout Source Code**
* **Build Docker Image**
* **Push Docker Image to Docker Hub**
* **Deploy to AWS EKS using kubectl**

---

## 🔐 AWS & Security Configuration

* Jenkins runs on **AWS EC2**
* IAM Role attached to Jenkins EC2:

  * EKS access
  * ECR/Docker permissions
* Kubernetes authentication handled using:

  * `aws eks update-kubeconfig`
  * `aws-auth` ConfigMap

---

## 📊 Monitoring (Open Source)

### 🔹 Kubernetes Metrics Server

The cluster health is monitored using **Metrics Server**, an open-source Kubernetes component.

**Monitored Metrics:**

* Node CPU & Memory usage
* Pod resource usage

### 🔹 Verification Commands

```bash
kubectl top nodes
kubectl top pods -A
```

This confirms real-time cluster health and workload status.

---

## 🧪 Proof of Automation (CI/CD Validation)

The following confirms **true CI/CD automation**:

* Jenkins build shows:
  **“Started by GitHub push”**
* GitHub Webhook logs show successful delivery
* Jenkins GitHub Hook Log confirms trigger event
* No manual Jenkins build required

---

## ✅ Final Outcome

✔ Fully automated CI/CD pipeline
✔ Dockerized application
✔ Deployed on AWS EKS
✔ Open-source monitoring enabled
✔ GitHub → Jenkins → Kubernetes integration proven

---

## 👤 Author

**Bhavadesh Arul**
DevOps & Cloud Enthusiast
GitHub: [https://github.com/bhavadesh-arul](https://github.com/bhavadesh-arul)

---

## 🏁 Conclusion

This project demonstrates real-world DevOps practices including **automation, containerization, cloud deployment, and monitoring** using industry-standard tools. The pipeline is production-oriented and follows best practices.

---
Say **what you want next**.

