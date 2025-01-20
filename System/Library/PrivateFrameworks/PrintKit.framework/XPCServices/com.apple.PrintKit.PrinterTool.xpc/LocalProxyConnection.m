@interface LocalProxyConnection
- (LocalProxyConnection)initWithConnection:(id)a3 path:(id)a4 queue:(id)a5;
- (id)cleanupBlock;
- (void)_canReadFromSocket;
- (void)_canWriteToSocket;
- (void)_checkWrite;
- (void)_httpReceive;
- (void)_receiveFromHTTP:(id)a3;
- (void)_shutdown;
- (void)_start;
- (void)cancel;
- (void)setCleanupBlock:(id)a3;
- (void)start;
@end

@implementation LocalProxyConnection

- (LocalProxyConnection)initWithConnection:(id)a3 path:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LocalProxyConnection;
  v12 = [(LocalProxyConnection *)&v17 init];
  if (v12)
  {
    id v13 = v10;
    nw_content_context_t v14 = nw_content_context_create((const char *)[v13 UTF8String]);
    context = v12->_context;
    v12->_context = (OS_nw_content_context *)v14;

    objc_storeStrong((id *)&v12->_conn, a3);
    objc_storeStrong((id *)&v12->_queue, a5);
    objc_storeStrong((id *)&v12->_path, v13);
  }

  return v12;
}

- (void)start
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000292C8;
  v4[3] = &unk_1000A2308;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_receiveFromHTTP:(id)a3
{
  v4 = a3;
  dataToSendToSocket = self->_dataToSendToSocket;
  v8 = v4;
  if (dataToSendToSocket) {
    concat = (OS_dispatch_data *)dispatch_data_create_concat(dataToSendToSocket, v4);
  }
  else {
    concat = v4;
  }
  v7 = self->_dataToSendToSocket;
  self->_dataToSendToSocket = concat;

  [(LocalProxyConnection *)self _checkWrite];
}

- (void)_checkWrite
{
  if (self->_writeOK)
  {
    dataToSendToSocket = self->_dataToSendToSocket;
    if (dataToSendToSocket)
    {
      self->_writeOK = 0;
      if (self->_ws_suspended)
      {
        self->_ws_suspended = 0;
        dispatch_resume((dispatch_object_t)self->_ws);
        dataToSendToSocket = self->_dataToSendToSocket;
      }
      v4 = dataToSendToSocket;
      id v5 = self->_dataToSendToSocket;
      self->_dataToSendToSocket = 0;

      uint64_t v12 = 0;
      id v13 = &v12;
      uint64_t v14 = 0x2020000000;
      uint64_t v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000294F4;
      v11[3] = &unk_1000A2330;
      v11[4] = self;
      v11[5] = &v12;
      dispatch_data_apply(v4, v11);
      size_t size = dispatch_data_get_size(v4);
      size_t v7 = v13[3];
      if (v7 < size)
      {
        subrange = (OS_dispatch_data *)dispatch_data_create_subrange(v4, v7, size);
        id v9 = self->_dataToSendToSocket;
        self->_dataToSendToSocket = subrange;
      }
      _Block_object_dispose(&v12, 8);
    }
    else if (!self->_ws_suspended)
    {
      self->_ws_suspended = 1;
      ws = self->_ws;
      dispatch_suspend(ws);
    }
  }
}

- (void)_httpReceive
{
  objc_initWeak(&location, self);
  conn = self->_conn;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029678;
  v4[3] = &unk_1000A2358;
  objc_copyWeak(&v5, &location);
  nw_connection_receive(conn, 1u, 0x4000u, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_canReadFromSocket
{
  ssize_t v3 = read(self->_fd, buffer, 0x4000uLL);
  if (v3 <= 0)
  {
    [(LocalProxyConnection *)self _shutdown];
  }
  else
  {
    v4 = dispatch_data_create(buffer, v3, 0, 0);
    nw_connection_send((nw_connection_t)self->_conn, v4, (nw_content_context_t)self->_context, 0, &stru_1000A2398);
  }
}

- (void)_canWriteToSocket
{
  self->_writeOK = 1;
  [(LocalProxyConnection *)self _checkWrite];
}

- (void)_start
{
  ssize_t v3 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LocalProxyConnection _start", buf, 2u);
  }

  nw_connection_set_queue((nw_connection_t)self->_conn, (dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  conn = self->_conn;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100029CE4;
  handler[3] = &unk_1000A23C0;
  objc_copyWeak(&v27, &location);
  nw_connection_set_state_changed_handler(conn, handler);
  id v5 = [(NSString *)self->_path UTF8String];
  long long v33 = 0u;
  memset(v34, 0, sizeof(v34));
  long long v31 = 0u;
  long long v32 = 0u;
  *(_OWORD *)buf = 0u;
  long long v30 = 0u;
  unsigned int v6 = socket(1, 1, 0);
  if ((v6 & 0x80000000) != 0
    || (buf[1] = 1, snprintf((char *)&buf[2], 0x68uLL, "%s", v5), connect(v6, (const sockaddr *)buf, 0x6Au) < 0))
  {
    self->_int fd = -1;
  }
  else
  {
    self->_int fd = v6;
    size_t v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v6, 0, (dispatch_queue_t)self->_queue);
    rs = self->_rs;
    self->_rs = v7;

    id v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, self->_fd, 0, (dispatch_queue_t)self->_queue);
    ws = self->_ws;
    self->_ws = v9;

    int fd = self->_fd;
    uint64_t v12 = self->_rs;
    id v13 = self->_ws;
    uint64_t v14 = self->_rs;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100029D58;
    v22[3] = &unk_1000A23E8;
    int v25 = fd;
    v23 = v12;
    objc_super v17 = v12;
    objc_copyWeak(&v24, &location);
    dispatch_source_set_event_handler(v14, v22);
    uint64_t v15 = self->_ws;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100029E48;
    v18[3] = &unk_1000A23E8;
    int v21 = fd;
    v19 = v13;
    v16 = v13;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v15, v18);
    dispatch_resume((dispatch_object_t)self->_rs);
    dispatch_resume((dispatch_object_t)self->_ws);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v24);
  }
  nw_connection_start((nw_connection_t)self->_conn);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)_shutdown
{
  rs = self->_rs;
  if (rs)
  {
    dispatch_source_cancel(rs);
    v4 = self->_rs;
    self->_rs = 0;
  }
  ws = self->_ws;
  if (ws)
  {
    if (self->_ws_suspended)
    {
      self->_ws_suspended = 0;
      dispatch_resume(ws);
      ws = self->_ws;
    }
    dispatch_source_cancel(ws);
    unsigned int v6 = self->_ws;
    self->_ws = 0;
  }
  conn = self->_conn;
  if (conn)
  {
    nw_connection_cancel(conn);
    v8 = self->_conn;
    self->_conn = 0;
  }
  int fd = self->_fd;
  if (fd != -1)
  {
    close(fd);
    self->_int fd = -1;
  }
  id cleanupBlock = self->_cleanupBlock;
  if (cleanupBlock)
  {
    uint64_t v12 = (void (**)(id, LocalProxyConnection *))objc_retainBlock(cleanupBlock);
    id v11 = self->_cleanupBlock;
    self->_id cleanupBlock = 0;

    v12[2](v12, self);
  }
}

- (void)cancel
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002A0E4;
  v4[3] = &unk_1000A2308;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)cleanupBlock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setCleanupBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cleanupBlock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_wd, 0);
  objc_storeStrong((id *)&self->_ws, 0);
  objc_storeStrong((id *)&self->_dataToSendToSocket, 0);
  objc_storeStrong((id *)&self->_rs, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_conn, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end