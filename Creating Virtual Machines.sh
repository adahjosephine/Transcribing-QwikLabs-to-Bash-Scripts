#!/bin/bash

#josephine.adah6@gmail.com
 
#Task 1 - Create a utility VM
gcloud compute instances create jossie-utility --zone=us-central1-c --machine-type=n1-standard-1 --image-project=debian-cloud --image=debian-10-buster-v20221102 --network-interface=no-address

gcloud compute instances describe jossie-utility --zone=us-central1-c   #explore vm details

gcloud logging logs list  #explore vm logs

#Task 2 - Create a Windows VM
gcloud compute instances create jossie-windows --zone=europe-west1-c --machine-type=n1-standard-1 --image-project=windows-cloud --image=windows-server-2016-dc-core-v20221109
--boot-disk-size=100 --boot-disk-type=pd-ssd --tags=http-server,https-server 

y | gcloud compute reset-windows-password jossie-windows --zone=europe-west1-c #set password for the vm

#Task 3 - Create a Custom VM
gcloud compute instances create jossie-custom --zone=europe-west1-c --machine-type e2-custom-2-4096 --image-project=debian-cloud --image=debian-10-buster-v20221102

y | gcloud compute ssh jossie-custom --zone=europe-west1-c  #generates encryption key-pair

gcloud compute ssh jossie-custom --zone=europe-west1-c       #ssh into the machine

free                      #unused and used memory and swap space

sudo dmidecode -t 17      #details about the RAM

nproc                      #verify the number of processors

lscpu                       #list the details of CPU installed

exit                         #terminate ssh terminal

