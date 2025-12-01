#!/bin/sh
set -e

# 生成 htpasswd 文件
# -b 直接使用命令行密码
htpasswd -cb /etc/nginx/passwords "$LOKI_USER" "$LOKI_PASS"

# 启动 Nginx
nginx -g 'daemon off;'