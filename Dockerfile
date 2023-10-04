# 阶段1：构建项目
FROM node:14-alpine3.17:14 as build
WORKDIR /app

# 将 package.json 和 package-lock.json 复制到容器中
COPY package*.json ./

# 安装项目的依赖
RUN npm install

# 复制应用程序代码到容器中
COPY . .

# 构建项目
RUN npm run build

# 阶段2：运行时镜像
FROM node:14-alpine3.17:14
WORKDIR /app

# 从构建阶段1中复制编译后的代码
COPY --from=build /app/node_modules ./node_modules
COPY index.js /app/

# 设置环境变量
ENV NODE_ENV=production

# 启动应用程序
CMD ["node", "/app/index.js"]
