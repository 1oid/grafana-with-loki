FROM nginx:alpine

# 安装 htpasswd
RUN apk add --no-cache apache2-utils

# 拷贝 nginx 配置
COPY loki.conf /etc/nginx/conf.d/default.conf

# 拷贝 entrypoint 脚本
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 设置环境变量默认值（可覆盖）
ENV LOKI_USER=admin
ENV LOKI_PASS=123456

ENTRYPOINT ["/entrypoint.sh"]
