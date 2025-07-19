# AWS EC2 開発環境

TerraformでAWS上にセキュアなEC2開発環境を構築するプロジェクトです。

## 概要

以下のAWSリソースを作成します：

- **VPC**: 独立したネットワーク環境（10.0.0.0/24）
- **EC2**: Ubuntu 24.04 LTS（t3.medium、128GB）
- **セキュリティ**: プレフィックスリストでIP制御
- **ネットワーク**: Elastic IPで固定パブリックIP


## 使用方法

### 1. 設定ファイル準備

```bash
cp terraform.tfvars.example terraform.tfvars
```

`terraform.tfvars`を編集：

```hcl
project     = "myproject"
environment = "dev"
tool        = "terraform"
key_name    = "existing-keypair-name"
aws_region  = "ap-northeast-1"

allowed_ip = [
  {
    cidr        = "1.2.3.4/32"
    description = "Office IP 1"
  },
  {
    cidr        = "5.6.7.8/32"
    description = "Office IP 2"
  }
]
```

### 2. デプロイ

```bash
terraform init
terraform plan
terraform apply
```

### 3. SSH接続

```bash
ssh -i ~/.ssh/your-key.pem ubuntu@$(terraform output -raw ec2_public_ip)
```

## 設定変数

| 変数名 | 説明 | 例 |
|--------|------|-----|
| `project` | プロジェクト名 | `"myproject"` |
| `environment` | 環境名 | `"dev"` |
| `tool` | ツール名 | `"terraform"` |
| `key_name` | 既存のSSHキーペア名 | `"my-keypair"` |
| `aws_region` | AWSリージョン | `"ap-northeast-1"` |
| `allowed_ip` | SSH接続許可IP | 上記参照 |
