echo "Install Container runtime (CRI-O)"

sudo apt update
sudo apt install cri-o cri-o-runc

# check if CRI-O is installed
# apt-cache policy cri-o

sudo systemctl enable crio --now

# Start and enable CRI-O
sudo systemctl daemon-reload
sudo systemctl enable crio --now

lsmod | grep br_netfilter
sudo systemctl enable kubelet
sudo kubeadm config images pull

sudo kubeadm init \
  --pod-network-cidr=10.10.0.0/16

echo " if ports are used follow this guide to reset ports https://stackoverflow.com/questions/41732265/how-to-use-kubeadm-to-create-kubernetes-cluster"

mkdir -p $HOME/.kube
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "check if cluster is working"
echo "kubectl cluster-info"

echo " Scheduling pods on Master"
kubectl taint nodes --all node-role.kubernetes.io/master-