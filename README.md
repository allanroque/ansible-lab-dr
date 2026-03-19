# Ansible + Terraform — AWS RHEL Provisioning

Automacao para provisionar 3 instancias RHEL na AWS usando Ansible com o modulo `community.general.terraform`.

## Estrutura do Projeto

```
ansible-terraform-aws/
├── ansible.cfg              # Configuracao do Ansible
├── inventory                # Inventario local
├── provision.yml            # Playbook de provisionamento
├── destroy.yml              # Playbook de destruicao
├── requirements.yml         # Collections necessarias
├── group_vars/
│   └── all/
│       └── vars.yml         # Variaveis do projeto
├── roles/
│   └── provision_aws/
│       └── tasks/
│           └── main.yml     # Role principal (terraform apply)
└── terraform/
    ├── main.tf              # Recursos AWS (VPC, EC2, SG, etc.)
    ├── variables.tf         # Variaveis do Terraform
    └── outputs.tf           # Outputs (IPs, IDs, etc.)
```

## Pre-requisitos

- Ansible >= 2.15
- Terraform >= 1.0
- Collection `community.general` >= 9.0
- Credenciais AWS configuradas (`AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY` ou AWS CLI profile)
- Chave privada SSH correspondente a chave publica configurada

## Instalacao das Collections

```bash
ansible-galaxy collection install -r requirements.yml
```

## Uso

### Provisionar

```bash
ansible-playbook provision.yml
```

### Provisionar com variaveis customizadas

```bash
ansible-playbook provision.yml \
  -e "aws_instance_count=5" \
  -e "aws_instance_size=t3.medium"
```

### Destruir a infraestrutura

```bash
ansible-playbook destroy.yml
```

## Variaveis

| Variavel                  | Default      | Descricao                          |
|---------------------------|--------------|------------------------------------|
| `aws_region`              | `us-east-2`  | Regiao AWS                        |
| `aws_name_tag`            | `tfevm`      | Prefixo das tags Name             |
| `aws_instance_size`       | `t2.micro`   | Tipo da instancia EC2             |
| `aws_instance_count`      | `3`          | Quantidade de instancias          |
| `aws_instance_public_key` | (definida)   | Chave publica SSH para acesso     |

## O que sera provisionado

- 1 VPC com subnet publica, Internet Gateway e Route Table
- 1 Security Group liberando SSH (porta 22)
- 1 Key Pair com a chave publica fornecida
- 3 instancias EC2 RHEL 9 com IP publico
