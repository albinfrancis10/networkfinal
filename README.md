Automated Dockerized Web Application Deployment
This project demonstrates the automation of a Dockerized web application deployment using modern DevOps tools. The workflow includes provisioning cloud infrastructure, configuring servers, containerizing the application, and implementing a CI/CD pipeline using Terraform, Docker, Ansible, and GitHub Actions.

Prerequisites
Before starting, ensure the following are installed and set up:

Terraform:

Install Terraform from the official website.

Docker Desktop:

Install Docker Desktop through WSL (Windows Subsystem for Linux).

Ansible:

Install Ansible on WSL and the EC2 instance:


sudo apt update
sudo apt install -y ansible
GitHub Repository:

Create a GitHub repository to host your project code.

AWS EC2 Instance:

Set up an EC2 instance with Amazon Linux 2 or a similar Linux distribution.

SSH Key:

Ensure you have an SSH key pair (docker-server-key.pem) for accessing the EC2 instance.

Project Workflow
The project follows these steps:

Provision Infrastructure with Terraform:

Use Terraform to create and manage AWS resources (EC2 instance, security groups).

Automate Docker Installation with Ansible:

Use Ansible to install Docker and Docker Compose on the EC2 instance.

Create and Deploy the Dockerized Web Application:

Build and deploy a simple web application using Docker.

Push Code to GitHub Repository:

Initialize a Git repository and push the code to GitHub.

Implement CI/CD Pipeline with GitHub Actions:

Automate the build, test, and deployment process using GitHub Actions.

Setup Instructions
1. Provision Infrastructure with Terraform
Navigate to the terraform folder:


cd D:\DBS\sem1\netproj\terraform
Update the main.tf file with your AWS region, AMI, and key pair name.

Run the following Terraform commands:


terraform init  # Initialize Terraform
terraform plan  # Preview the execution plan
terraform apply # Apply the changes and create the resources
After the EC2 instance is created, note its public IP address from the Terraform output.

2. Automate Docker Installation with Ansible
Navigate to the ansible folder:


cd D:\DBS\sem1\netproj\ansible
Update the inventory.ini file with the EC2 instance's public IP and SSH key path:

[all]
34.240.64.254 ansible_user=ec2-user ansible_ssh_private_key_file=/tmp/docker-server-key.pem
Run the Ansible playbook to install Docker and Docker Compose:

ansible-playbook -i inventory.ini docker_setup.yml -vvv
Verify the installations on the EC2 instance:


docker --version
docker-compose --version
3. Create and Deploy the Dockerized Web Application
Navigate to the sample-app folder:

cd D:\DBS\sem1\netproj\sample-app
Build and run the Docker container:


docker-compose up -d
Access the web application by navigating to http://34.240.64.254 in your browser.

4. Push Code to GitHub Repository
Initialize a Git repository:


git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <your-github-repository-url>
git push -u origin main
5. Implement CI/CD Pipeline with GitHub Actions
Navigate to the .github/workflows folder:


cd D:\DBS\sem1\netproj\.github\workflows
Update the docker-cicd.yml file with your Docker Hub credentials and EC2 instance details.

Push the workflow file to GitHub to trigger the pipeline:

git add .
git commit -m "Add GitHub Actions workflow"
git push origin main
Automated Deployment with CI/CD
Whenever changes are made to index.html and pushed to GitHub:

The CI/CD pipeline is triggered.

The Docker container is rebuilt and deployed.

Changes are automatically reflected in the web application running on the EC2 instance.

Project Structure
plaintext

D:\DBS\sem1\netproj\
├── terraform/
│   ├── main.tf                # Terraform configuration for AWS resources
│   ├── variables.tf           # Terraform variables
│   └── outputs.tf             # Terraform outputs (e.g., EC2 public IP)
├── ansible/
│   ├── inventory.ini          # Ansible inventory file
│   └── docker_setup.yml       # Ansible playbook for Docker installation
├── sample-app/
│   ├── Dockerfile             # Dockerfile for the web application
│   ├── docker-compose.yml     # Docker Compose configuration
│   └── index.html             # Sample HTML file for the web application
├── .github/workflows/
│   └── docker-cicd.yml        # GitHub Actions workflow for CI/CD
└── docker-server-key.pem      # SSH key for EC2 instance access
Conclusion
This project automates the deployment of a web application using Infrastructure as Code (Terraform), Configuration Management (Ansible), Containerization (Docker), and Continuous Deployment (GitHub Actions). The setup ensures a seamless workflow for updating and managing the application efficiently.
