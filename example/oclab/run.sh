#!/bin/sh

source /usr/local/etc/ocp4.config

oc login  -u ${RHT_OCP4_DEV_USER} -p ${RHT_OCP4_DEV_PASSWORD} ${RHT_OCP4_MASTER_API}

oc new-project  ${RHT_OCP4_DEV_USER}-oc-lab

oc new-app --name=temps php:7.3~https://github.com/RedHatTraining/DO180-apps/ --context-dir=temps -l flag=delete

service=$(oc get svc -l flag=delete -o name)

oc expose $service
