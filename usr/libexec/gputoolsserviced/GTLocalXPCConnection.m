@interface GTLocalXPCConnection
- (BOOL)isTrusted;
- (GTLocalXPCConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4;
- (GTLocalXPCConnection)initWithXPCConnection:(id)a3 messageQueue:(id)a4;
- (OS_xpc_object)connection;
- (OS_xpc_object)error;
- (id)sendMessageWithReplySync:(id)a3;
- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4;
- (unint64_t)registerDispatcher:(id)a3;
- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4;
- (void)cancel;
- (void)deregisterDispatcher:(unint64_t)a3;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 replyHandler:(id)a4;
- (void)sendMessageAndWaitForDelivery:(id)a3;
- (void)setError:(id)a3;
@end

@implementation GTLocalXPCConnection

- (GTLocalXPCConnection)initWithXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GTLocalXPCConnection;
  v9 = [(GTLocalXPCConnection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
  }

  return v10;
}

- (GTLocalXPCConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GTLocalXPCConnection;
  v9 = [(GTLocalXPCConnection *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
    uint64_t v13 = os_transaction_create();
    transaction = v10->_transaction;
    v10->_transaction = (OS_os_transaction *)v13;
  }
  return v10;
}

- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4
{
  id v6 = a3;
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018EB8;
  block[3] = &unk_100034CF0;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(messageQueue, block);
}

- (unint64_t)registerDispatcher:(id)a3
{
  id v4 = a3;
  unint64_t add = atomic_fetch_add(&qword_100041B58, 1uLL);
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018FF0;
  block[3] = &unk_100034CF0;
  id v10 = v4;
  unint64_t v11 = add;
  block[4] = self;
  id v7 = v4;
  dispatch_async(messageQueue, block);

  return add;
}

- (void)deregisterDispatcher:(unint64_t)a3
{
  messageQueue = self->_messageQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000190E4;
  v4[3] = &unk_100034D18;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(messageQueue, v4);
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019224;
  block[3] = &unk_100034D40;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(messageQueue, block);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)sendMessage:(id)a3
{
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  connection = self->_connection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000194E8;
  handler[3] = &unk_100034D68;
  id v11 = v6;
  id v9 = v6;
  xpc_connection_send_message_with_reply(connection, a3, v7, handler);
}

- (id)sendMessageWithReplySync:(id)a3
{
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(self->_connection, a3);

  return v3;
}

- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4
{
  v5 = [(GTLocalXPCConnection *)self sendMessageWithReplySync:a3];
  if (MessageIsValid(v5, a4)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)sendMessageAndWaitForDelivery:(id)a3
{
  [(GTLocalXPCConnection *)self sendMessage:a3];
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  connection = self->_connection;
  barrier[0] = _NSConcreteStackBlock;
  barrier[1] = 3221225472;
  barrier[2] = sub_1000196B8;
  barrier[3] = &unk_100034D90;
  id v9 = v4;
  id v6 = v4;
  xpc_connection_send_barrier(connection, barrier);
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v6, v7);
}

- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000197C0;
  v11[3] = &unk_100034DE0;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  xpc_connection_set_event_handler(connection, v11);
  xpc_connection_activate(self->_connection);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)cancel
{
  xpc_connection_cancel(self->_connection);
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000199A0;
  block[3] = &unk_100034D90;
  void block[4] = self;
  dispatch_async(messageQueue, block);
}

- (BOOL)isTrusted
{
  return 1;
}

- (OS_xpc_object)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dispatchers, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end