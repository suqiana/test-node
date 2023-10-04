// 导入 http 模块
const http = require('http');

// 创建一个 HTTP 服务器
const server = http.createServer((req, res) => {
  // 设置 HTTP 响应头
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  
  // 发送 "Hello, World!" 到客户端
  res.end('Hello, World!\n');
});

// 监听端口 3000
server.listen(3000, () => {
  console.log('Server is running on http://localhost:3000/');
});
