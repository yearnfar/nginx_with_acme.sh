# nginx_with_acme.sh
nginx 并自带 Acme.sh


## 授权证书
```shell

# 首次运行需要环境变量，例如:DP_Id、DP_Key
# 非首次运行，DP_Id、DP_Key 已经写入配置文件 ，可以不用
docker exec -it -e DP_Id=123 -e DP_Key=abcdefg you_container_name acme.sh --issue -d example.com -d "*.example.com"  --dns dns_dp

# 安装证书
docker exec -it you_container_name acme.sh --install-cert -d example.com --key-file /etc/nginx/ssl/example.com.key  --fullchain-file /etc/nginx/ssl/example.com.cer --reloadcmd  "nginx -s reload"
```