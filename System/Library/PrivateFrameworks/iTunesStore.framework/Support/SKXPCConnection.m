@interface SKXPCConnection
- (SKXPCConnection)init;
- (SKXPCConnection)initWithServiceName:(id)a3;
- (SKXPCConnection)initWithXPCConnection:(id)a3;
- (id)_initSKXPCConnection;
- (id)createXPCEndpoint;
- (id)disconnectBlock;
- (id)messageBlock;
- (void)_reloadEventHandler;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4;
- (void)setDisconnectBlock:(id)a3;
- (void)setMessageBlock:(id)a3;
@end

@implementation SKXPCConnection

- (id)_initSKXPCConnection
{
  v6.receiver = self;
  v6.super_class = (Class)SKXPCConnection;
  v2 = [(SKXPCConnection *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreKit.SKXPCConnection", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (SKXPCConnection)init
{
  return [(SKXPCConnection *)self initWithServiceName:0];
}

- (SKXPCConnection)initWithServiceName:(id)a3
{
  if (a3) {
    v4 = (const char *)[a3 UTF8String];
  }
  else {
    v4 = 0;
  }
  xpc_connection_t v5 = xpc_connection_create(v4, 0);
  xpc_connection_set_legacy();
  objc_super v6 = [(SKXPCConnection *)self initWithXPCConnection:v5];

  return v6;
}

- (SKXPCConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(SKXPCConnection *)self _initSKXPCConnection];
  v7 = (SKXPCConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    [(SKXPCConnection *)v7 _reloadEventHandler];
    xpc_connection_resume(v7->_connection);
  }

  return v7;
}

- (id)createXPCEndpoint
{
  return xpc_endpoint_create(self->_connection);
}

- (id)disconnectBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1001B0A0C;
  v10 = sub_1001B0A38;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B0A40;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)messageBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1001B0A0C;
  v10 = sub_1001B0A38;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B0B7C;
  v5[3] = &unk_1003A34F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)sendMessage:(id)a3
{
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  connection = self->_connection;
  v7 = dispatch_get_global_queue(0, 0);
  xpc_connection_send_message_with_reply(connection, a3, v7, a4);
}

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001B0D24;
  v10[3] = &unk_1003A9160;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = v6;
  uint64_t v8 = v11;
  id v9 = v6;
  [(SKXPCConnection *)self sendMessage:v7 withReply:v10];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)setDisconnectBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B0E00;
  v7[3] = &unk_1003A31F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)setMessageBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B0EFC;
  v7[3] = &unk_1003A31F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)_reloadEventHandler
{
  id v3 = objc_retainBlock(self->_disconnectBlock);
  id v4 = objc_retainBlock(self->_messageBlock);
  connection = self->_connection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001B1024;
  v8[3] = &unk_1003A91B0;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  xpc_connection_set_event_handler(connection, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageBlock, 0);
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end