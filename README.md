## DEPLOYING WEB PAGE ON DIGITAL OCEAN USING TERRAFORM

### DESCRIPTION

The present project is a basic guide to use terraform and digital ocean as
tools to deploy our infrastructure.

In this case we deploy a web page using nginx and nginx as proxy using containers inside a droplet.

We spin up the droplet and provision docker and some configuration files to bring the server up.

This is infrastructure as code, we have all the configuration that we need on
a repository and we always be able to keep track of any changes, making this process repeatable 
with the same outcome every time.

We need and ssh key to access droplet within our project, so we generate one

```
    ssh-keygen -f mykey
```
The provision makes an ssh connection and create a directory and move some files to setup 
everything.

The project has the following files
* dns.tf -> has digitalocean dns record
* docker-compose.yml -> has the nginx and nginx proxy container configuration
* droplet.tf -> has all the droplet configuration to be deployed
* mykey -> private key 
* mykey.pub -> public key
* provider.tf -> has all the provider configuration to be used
* ssh_key.tf -> has public key configuration to be passed to the droplet
* terraform.tfvars -> has the DigitalOcean API key, file never uploaded to the repository
* userdata.yaml -> has all software provisioning inside the droplet and executes some commands
* www -> file that contains the static resources to be served
```
    terraform init
```

We use terraform to download all the components needed for the provider specified

```
    terraform plan
```

We use terraform to generate an output describing all changes to be executed on our
infrastructure.

```
    terraform apply
```
To finish we apply all the changes on our infrastructure as we planned

In case you need to understand the variables used in the configuration 
we supply the **terraform.tfvars** structure

```
    do_token="DIGITAL_OCEAN_API_KEY"
    file_path="file/path/from/source/project"
    domain="your.domain"

```

In case you need to access the server for the first time you need to ssh into the droplet

```
   ssh -i mykey root@droplet_ip_address
```

