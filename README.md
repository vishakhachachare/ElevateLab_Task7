# 🚀 Task 7: Monitor System Resources Using Netdata

## 🎯 Objective
Install **Netdata** on an EC2 instance using Docker and visualize **system & container performance metrics** in real time.

---

## 🛠 Tools
- **AWS EC2** (Amazon Linux 2 / Ubuntu)
- **Docker**
- **Netdata (open-source monitoring tool)**

---

## 📦 Installation Steps

### 1️⃣ Launch an EC2 Instance
- OS: Amazon Linux 2 / Ubuntu
- Security Group: Open **Port 19999 (TCP)** for Netdata Dashboard

---

### 2️⃣ Install Docker
```bash
# Update packages
sudo apt-get update -y        # Ubuntu
# sudo yum update -y          # Amazon Linux

# Install Docker
sudo apt-get install -y docker.io   # Ubuntu
# sudo yum install -y docker        # Amazon Linux

# Start & enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Verify
docker --version
```

---

### 3️⃣ Run Netdata Container
```bash
docker run -d --name=netdata \
  -p 19999:19999 \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/passwd:/host/etc/passwd:ro \
  netdata/netdata
```

---

4️⃣ Access Netdata Dashboard

Open your browser and visit:
```bash
http://<EC2-Public-IP>:19999
```

---

### 📊 What You Can Monitor

- System Metrics

CPU, Memory, Disk, Network usage of EC2 host

- Docker Metrics

Per-container CPU, Memory, Disk, and Network stats

- Applications

Process-level monitoring

- Alerts

Auto-generated health alarms
