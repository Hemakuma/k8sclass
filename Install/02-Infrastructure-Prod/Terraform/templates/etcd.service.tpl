[Unit]
Description=etcd
Documentation=https://github.com/coreos

[Service]
ExecStart=/usr/bin/etcd --name ${hostname} --cert-file=/etc/etcd/kubernetes.pem --key-file=/etc/etcd/kubernetes-key.pem --peer-cert-file=/etc/etcd/kubernetes.pem --peer-key-file=/etc/etcd/kubernetes-key.pem --trusted-ca-file=/etc/etcd/ca.pem --peer-trusted-ca-file=/etc/etcd/ca.pem --initial-advertise-peer-urls https://${hostip}:2380 --listen-peer-urls https://${hostip}:2380   --listen-client-urls https://${hostip}:2379,http://127.0.0.1:2379   --advertise-client-urls https://${hostip}:2379 --initial-cluster-token etcd-cluster-0 --initial-cluster ${cluster} --initial-cluster-state new --data-dir=/var/lib/etcd  
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
