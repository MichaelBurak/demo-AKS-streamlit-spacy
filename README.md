# Streamlit Deployment on Docker Demo

This project uses [Maël Fabien's sample app and Dockerfile](https://maelfabien.github.io/project/Streamlit/) to illustrate deployment to AKS via. Docker of a sample Streamlit application.

## How to run this demo
```
- Requires Azure CLI and Docker installed 
- az login
- az group create -l eastus -n {resourceGroupName}
- az acr create --name {registryName} --resource-group {resourceGroupName} --sku basic --admin-enabled true
- az acr build --registry {registryName} --resource-group {resourceGroupName} --image {imageName} .
- az aks create --resource-group {resourceGroupName} --name {clusterName} --node-count 1 --generate-ssh-keys
- az aks get-credentials --resource-group {resourceGroupName} --name {clusterName}
- kubectl get nodes
- kubectl create secret docker-registry regcred --docker-server={registryURL} --docker-username={username} --docker-password={password} --docker-email={email}

https://docs.microsoft.com/en-us/azure/aks/ingress-basic
(helm install of ingress nginx needed for ingress.yaml)

- Access on ingress external IP
```

### Notes

## Places for improvement
- really long pip install 
- Spacy and Streamlit should be version constrained
- Streamline AKS process via. Terraform and Ansible
- Don't know if I need the config and credentials files, will try deploying again without them

---

### Sources
- https://github.com/streamlit/demo-self-driving
- https://github.com/MarcSkovMadsen/awesome-streamlit/tree/master/devops/docker
- https://towardsdatascience.com/create-an-awesome-streamlit-app-deploy-it-with-docker-a3d202a636e8
- https://discuss.streamlit.io/t/how-to-use-streamlit-in-docker/1067/8
- https://www.section.io/engineering-education/how-to-deploy-streamlit-app-with-docker/
- https://github.com/tzaffi/streamlit-cdk-fargate
- https://ruicosta.blog/2020/04/27/run-streamlit-io-on-google-cloud-kubernetes/
- https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough
- https://docs.microsoft.com/en-us/azure/aks/ingress-basic