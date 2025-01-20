@interface HSHostConnection
- (OS_dispatch_queue)listeningQueue;
- (OS_dispatch_queue)queue;
- (id)handler;
- (void)acceptConnectionsForService:(id)a3 InQueue:(id)a4 withHandler:(id)a5;
- (void)listen:(id)a3;
- (void)setHandler:(id)a3;
- (void)setListeningQueue:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HSHostConnection

- (void)listen:(id)a3
{
  *(void *)&v78.sa_len = 0;
  *(void *)&v78.sa_data[6] = 0;
  size_t cnt = 0;
  fds = 0;
  id v4 = a3;
  int v5 = launch_activate_socket((const char *)[v4 UTF8String], &fds, &cnt);
  if (v5)
  {
    int v6 = v5;
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"];
    v8 = [v7 lastPathComponent];
    v66 = +[NSString stringWithFormat:@"failed to launch_activate_socket with error %s. service Name %@\n", strerror(v6), v4];
    sub_100009790(4, @"[%@:%d] %@\n", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  }
  if (fds)
  {
    size_t v15 = cnt;
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"];
    v17 = [v16 lastPathComponent];
    if (v15)
    {
      v67 = +[NSString stringWithFormat:@"found %@ socket", v4];
      sub_100009790(2, @"[%@:%d] %@\n", v18, v19, v20, v21, v22, v23, (uint64_t)v17);

      v24 = fds;
      int v25 = *fds;
    }
    else
    {
      v68 = +[NSString stringWithFormat:@"could not find %@ socket", v4];
      sub_100009790(4, @"[%@:%d] %@\n", v26, v27, v28, v29, v30, v31, (uint64_t)v17);

      int v25 = 0;
      v24 = fds;
    }
    free(v24);
    fds = 0;
  }
  else
  {
    int v25 = 0;
  }
  socklen_t v75 = 16;
  while (1)
  {
    uint64_t v32 = accept(v25, &v78, &v75);
    if ((v32 & 0x80000000) != 0)
    {
      v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"];
      v34 = [v33 lastPathComponent];
      v69 = +[NSString stringWithFormat:@"ERROR on accept"];
      sub_100009790(4, @"[%@:%d] %@\n", v35, v36, v37, v38, v39, v40, (uint64_t)v34);
    }
    v41 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"];
    v42 = [v41 lastPathComponent];
    v70 = +[NSString stringWithFormat:@"Received connection from host."];
    sub_100009790(2, @"[%@:%d] %@\n", v43, v44, v45, v46, v47, v48, (uint64_t)v42);

    v49 = [(HSHostConnection *)self queue];
    v50 = (void *)xpc_remote_connection_create_with_connected_fd();

    v51 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"];
    v52 = [v51 lastPathComponent];
    if (v50)
    {
      v71 = +[NSString stringWithFormat:@"Created xpc remote connection 0x%lx from socket: %d", v50, v32, v70];
      sub_100009790(2, @"[%@:%d] %@\n", v53, v54, v55, v56, v57, v58, (uint64_t)v52);

      v59 = [(HSHostConnection *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005F9C;
      block[3] = &unk_1000105A0;
      block[4] = self;
      id v74 = v50;
      dispatch_async(v59, block);
    }
    else
    {
      v72 = +[NSString stringWithFormat:@"Cannot create xpc remote connection."];
      sub_100009790(4, @"[%@:%d] %@\n", v60, v61, v62, v63, v64, v65, (uint64_t)v52);
    }
  }
}

- (void)acceptConnectionsForService:(id)a3 InQueue:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(HSHostConnection *)self setQueue:a4];
  [(HSHostConnection *)self setHandler:v9];

  id v10 = [v8 stringByAppendingString:@".listen"];
  dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
  [(HSHostConnection *)self setListeningQueue:v11];

  uint64_t v12 = [(HSHostConnection *)self listeningQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000061E0;
  v14[3] = &unk_1000105A0;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  dispatch_async(v12, v14);
}

- (OS_dispatch_queue)listeningQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setListeningQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_listeningQueue, 0);
}

@end