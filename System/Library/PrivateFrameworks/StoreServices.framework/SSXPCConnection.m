@interface SSXPCConnection
- (SSXPCConnection)init;
- (SSXPCConnection)initWithServiceName:(id)a3;
- (SSXPCConnection)initWithXPCConnection:(id)a3;
- (id)_initSSXPCConnection;
- (id)copyReplyQueue;
- (id)createXPCEndpoint;
- (id)disconnectBlock;
- (id)messageBlock;
- (void)_reloadEventHandler;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4;
- (void)setDisconnectBlock:(id)a3;
- (void)setMessageBlock:(id)a3;
- (void)setReplyQueue:(id)a3;
@end

@implementation SSXPCConnection

- (void)sendMessage:(id)a3
{
}

- (id)createXPCEndpoint
{
  return xpc_endpoint_create(self->_connection);
}

- (SSXPCConnection)initWithServiceName:(id)a3
{
  if (a3) {
    v4 = (const char *)[a3 UTF8String];
  }
  else {
    v4 = 0;
  }
  xpc_connection_t v5 = xpc_connection_create(v4, 0);
  xpc_connection_set_legacy();
  v6 = [(SSXPCConnection *)self initWithXPCConnection:v5];

  return v6;
}

- (SSXPCConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v6 = [(SSXPCConnection *)self _initSSXPCConnection];
  v7 = (SSXPCConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    [(SSXPCConnection *)v7 _reloadEventHandler];
    xpc_connection_resume(v7->_connection);
  }

  return v7;
}

- (void)_reloadEventHandler
{
  v3 = (void *)MEMORY[0x1A6268200](self->_disconnectBlock, a2);
  v4 = (void *)MEMORY[0x1A6268200](self->_messageBlock);
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SSXPCConnection__reloadEventHandler__block_invoke;
  v8[3] = &unk_1E5BAB570;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  xpc_connection_set_event_handler(connection, v8);
}

- (id)_initSSXPCConnection
{
  v6.receiver = self;
  v6.super_class = (Class)SSXPCConnection;
  v2 = [(SSXPCConnection *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storeservices.SSXPCConnection", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)setMessageBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SSXPCConnection_setMessageBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (SSXPCConnection)init
{
  return [(SSXPCConnection *)self initWithServiceName:0];
}

void __38__SSXPCConnection__reloadEventHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528])
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6) {
      goto LABEL_10;
    }
  }
  id v7 = v4;
  (*(void (**)(void))(v6 + 16))();
  id v4 = v7;
LABEL_10:
}

void *__38__SSXPCConnection_setDisconnectBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    id v7 = *(void **)(a1 + 32);
    return (void *)[v7 _reloadEventHandler];
  }
  return result;
}

void *__35__SSXPCConnection_setMessageBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 40) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = *(void **)(a1 + 32);
    return (void *)[v7 _reloadEventHandler];
  }
  return result;
}

- (void)setDisconnectBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SSXPCConnection_setDisconnectBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __38__SSXPCConnection__reloadEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
  else if (MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14578])
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __38__SSXPCConnection__reloadEventHandler__block_invoke_2;
    handler[3] = &unk_1E5BAB548;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v7 = v4;
    id v9 = v7;
    xpc_connection_set_event_handler((xpc_connection_t)v7, handler);
    xpc_connection_resume((xpc_connection_t)v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageBlock, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
}

- (id)disconnectBlock
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__29;
  id v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSXPCConnection_disconnectBlock__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (void *)MEMORY[0x1A6268200](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__SSXPCConnection_disconnectBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1A6268200](*(void *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)messageBlock
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__29;
    id v11 = __Block_byref_object_dispose__29;
    id v12 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __31__SSXPCConnection_messageBlock__block_invoke;
    v6[3] = &unk_1E5BA6F30;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(dispatchQueue, v6);
    id v4 = (void *)MEMORY[0x1A6268200](v8[5]);
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

void __31__SSXPCConnection_messageBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1A6268200](*(void *)(*(void *)(a1 + 32) + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)copyReplyQueue
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SSXPCConnection_copyReplyQueue__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__SSXPCConnection_copyReplyQueue__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v1) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v1);
  }
}

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  uint64_t v7 = (void (**)(id, xpc_object_t))a4;
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(self->_connection, a3);
  if (v7) {
    v7[2](v7, v6);
  }
}

- (void)setReplyQueue:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SSXPCConnection_setReplyQueue___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __33__SSXPCConnection_setReplyQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(v2 + 32);
  id v4 = (id *)(v2 + 32);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

@end