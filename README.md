# Creating VM and installing kubernetes

## Introduction

This guide will show you how to create a VM in the vmware EXSI dashboard.

## 1. Creating VM in vmware EXSI dashboard

a) Enter `172.16.2.64` in the browser and sign in using your details.

b) On the left side of the dashboard select the `Virtual Machines` option. A list of created virtual machines should be listed.

c) Above the list of created virtual machines select the `Create / Register VM` option.

d) Click "Next" and create a new virtual machine using the following details:

    - Name: any appropriate name

    - Comptability: ESXi 6.5 virtual machine

    - Guest OS family: Linux

    - Guest OS version: Ubuntu Linux (64-bit)

    Click "Next"

e) For Select Storage select `macmini2 datastore`. Click next.

f) Set the Customize setting to the following details:

    - CPU: 2

    - 4024 MB

    - 32 GB

    - CD/DVD Drive 1: Datastore ISO file > ubuntu-20.04.4-live-server-amd64.iso > click `select`

g) Ready to complete: click `Back`. Click `Finish`

h) Now that you that created a VM, double click on your VM.

![Creating vm](gifs/create-vm.gif)

## 2. Configuring Ubuntu OS

a) Click on the display image of the VM to access the vm. Wait a few minutes for the VM to start.

b) Select `English as the language`

c) Key configuration: Select `Done`

e) Network Connections: Select the ens160 interface and then select `Edit IPv4` from the drop down menu. Then for the IPv4 method select `Manual` from the drop down menu.

f) Configure the IPv4 method using the following details:

    - Subnet: 172.16.2.0/24 (This has to be the same as your address but the after the 3rd "." should end with "0/2411")

    - Address: 172.16.2.16 (This has to be a unique ip address)

    - Gateway: 172.16.2.1

    - Name server: 8.8.8.8

    - Search domains: *leave blank*

    - Select `Save`

g) After configuring the IPv4 method select `Continue without netowrk`

h) Configure proxy: Select `Done` (leave Proxy address empty)

i) Configure Ubuntu archive mirror: Select `Done` (leave Mirror address to its default value)

j) Checking for installer updates: Select `Continue without update` or wait for check to complete

k) Storage configuration: Guided storage configuration: Select `Done` > Select `Continue`

l) Profile setup: Set all fields to `dev`. You could set "Your server's name" to bt-project. All fields should be set to `dev` as it makes later configurations and permissions easier. Select `Done`

m) Enable Ubuntu Advantage: Select `Done` _leave blank_

n) SSH setup: Select `Install OpenSSH server` > Select `Done`

o) Select `Reeboot Now`

p) After a few minutes the terminal should stop displaying messages. Press `Enter` button on your keyboard to continue and log in. Username and password is `dev`.

e) Enter `curl www.google.com`. If command does not return a response back then it means that you did not configure the network correctly. If that is the case go back to step 1) f) and make sure your ip address is unique and the gateway is 172.16.2.1

## 2. Setting up ssh connection

I reccomend ssh into the vm as it will allow you to use the terminal more efficiently. It also allows for copy and pasting.

a) In your selected terminal enter the `ssh root@172.16.2.64` and enter the password you used to enter into the vmware ESXI dashboard.

b)