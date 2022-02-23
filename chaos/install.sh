#!/bin/sh
echo Adding helm chart
helm repo add chaos-mesh https://charts.chaos-mesh.org

echo Creating k8s namespace
kubectl create ns chaos-testing
helm install chaos-mesh chaos-mesh/chaos-mesh -n=chaos-testing --version 2.1.2

echo If everything fails run https://mirrors.chaos-mesh.org/latest/install.sh

echo Applying chaos RBAC
kubectl apply -n chaos-testing -f rbac.yaml

echo Getting chaos token
kubectl describe secrets account-cluster-manager-quoer
