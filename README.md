# 🚀 Terraform Azure NAT Gateway (Variable-Based)

This project provisions an Azure NAT Gateway infrastructure using Terraform with reusable variables.
The configuration creates a complete networking setup including a Resource Group, Virtual Network, Subnet, Public IP, and NAT Gateway association.

---

## 📌 Project Overview

Azure NAT Gateway enables secure outbound internet connectivity for resources inside a virtual network without assigning Public IP addresses directly to Virtual Machines.

Using this Terraform project, you can:

✅ Create an Azure Resource Group
✅ Create a Virtual Network (VNet)
✅ Create a Subnet
✅ Create a Static Public IP
✅ Create an Azure NAT Gateway
✅ Associate Public IP with NAT Gateway
✅ Attach NAT Gateway to a Subnet

---

## 🏗 Architecture

```text
Internet
    │
    │
Public IP
    │
    │
NAT Gateway
    │
    │
Subnet
    │
    │
Virtual Machine / Resources
```

---

## 📁 Project Structure

```text
terraform-azure-nat-gateway-variable/
│
├── provider.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
└── .gitignore
```

---

## ⚙ Prerequisites

Before running this project, ensure you have:

* Azure Subscription
* Terraform installed
* Azure CLI installed
* Azure account access

---

## 🔑 Authenticate Azure

Login to Azure before deployment:

```bash
az login
```

Verify account:

```bash
az account show
```

---

## 📝 Variable Example

Example `terraform.tfvars`:

```hcl
resource_group_name = "nat-rg"

location = "Central India"

vnet_name = "nat-vnet"

vnet_address_space = [
  "10.0.0.0/16"
]

subnet_name = "nat-subnet"

subnet_prefix = [
  "10.0.1.0/24"
]

public_ip_name = "nat-public-ip"

nat_gateway_name = "my-nat-gateway"
```

---

## ▶ Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Create execution plan:

```bash
terraform plan
```

Deploy resources:

```bash
terraform apply
```

Destroy resources:

```bash
terraform destroy
```

---

## 📤 Outputs

The project returns:

* NAT Gateway ID
* Public IP Address

Example:

```bash
nat_gateway_id = "/subscriptions/xxxxx/resourceGroups/..."
public_ip_address = "20.xx.xx.xx"
```

---

## 🔒 Why Use NAT Gateway?

Azure NAT Gateway provides:

✔ Secure outbound internet connectivity
✔ No need to assign Public IP directly to VMs
✔ Better scalability
✔ Improved security
✔ High availability support

---

## 🎯 Use Cases

* Secure VM outbound access
* Private workloads internet connectivity
* Enterprise networking
* Production cloud environments
* Multi-tier applications

---

## 👨‍💻 Author

**Ranjeet Kumar**

DevOps | Azure | Terraform | Kubernetes | CI/CD Enthusiast
