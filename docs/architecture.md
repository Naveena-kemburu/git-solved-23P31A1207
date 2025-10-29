 # System Architecture

## Overview
DevOps Simulator follows a microservices architecture designed for high availability and scalability.  
This document describes both **Production** and **Development** environments.

---

## 🏭 Production Architecture

### 1. Application Server
- **Technology**: Node.js + Express  
- **Port**: 8080  
- **Scaling**: Horizontal auto-scaling enabled  

### 2. Database Layer
- **Database**: PostgreSQL 14  
- **Configuration**: Master-slave replication  
- **Backup**: Daily automated backups  

### 3. Monitoring System
- **Tool**: Prometheus + Grafana  
- **Metrics**: CPU, Memory, Disk, Network  
- **Alerts**: Email notifications for critical issues  

### Deployment Strategy
- **Method**: Rolling updates  
- **Zero-downtime**: ✅ Yes  
- **Rollback**: Automated on failure  

### Security
- SSL/TLS encryption  
- Database connection encryption  
- Regular security audits  

---

## 💻 Development Architecture

### 1. Application Server
- **Technology**: Node.js + Express (with hot reload)  
- **Port**: 3000  
- **Scaling**: Manual (single instance)  
- **Debug**: Chrome DevTools debugger on port 9229  

### 2. Database Layer
- **Database**: PostgreSQL 14 (local instance)  
- **Configuration**: Single instance (no replication)  
- **Backup**: Manual backups  
- **Seeding**: Auto-seed with test data  

### 3. Monitoring System
- **Tool**: Console logging + optional Prometheus  
- **Metrics**: CPU, Memory, Disk, Network, Build time  
- **Alerts**: Console warnings  
- **Dashboard**: In-development web dashboard  

### 4. Container Orchestration
- **Tool**: Docker Compose  
- **Services**: App, Database, Redis cache  
- **Volume Mounts**: Code directory for hot reload  

### 5. Authentication System (Beta)
- **Method**: OAuth2 + JWT  
- **Providers**: Google, GitHub  
- **Sessions**: Redis-based session storage  

### Deployment Strategy
- **Method**: Docker Compose hot reload  
- **Zero-downtime**: ❌ Not applicable  
- **Rollback**: Git checkout previous commit  

### Security
- SSL/TLS disabled (local use only)  
- Credentials stored in plain text  
- CORS enabled for all origins  
- Debug endpoints exposed  

### Experimental Features
⚠️ *Experimental only:*  
- Multi-cloud deployment  
- AI-powered log analysis  
- Automatic rollback on anomaly detection  
