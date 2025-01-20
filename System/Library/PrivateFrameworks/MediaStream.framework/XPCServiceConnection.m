@interface XPCServiceConnection
- (NSObject)context;
- (NSString)serviceName;
- (OS_dispatch_queue)workQueue;
- (OS_xpc_object)client;
- (XPCServiceConnection)initWithServiceName:(id)a3 client:(id)a4 queue:(id)a5;
- (XPCServiceConnectionDelegate)delegate;
- (XPCServiceListener)serviceListener;
- (id)debugDescription;
- (void)resume;
- (void)sendMessage:(id)a3 withHandler:(id)a4;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setServiceListener:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)shutDownCompletionBlock:(id)a3;
- (void)workQueueHandleIncomingMessage:(id)a3;
- (void)workQueueShutDown;
@end

@implementation XPCServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_serviceListener);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setServiceListener:(id)a3
{
}

- (XPCServiceListener)serviceListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceListener);

  return (XPCServiceListener *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (NSObject)context
{
  return self->_context;
}

- (OS_xpc_object)client
{
  return self->_client;
}

- (void)setDelegate:(id)a3
{
}

- (XPCServiceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (XPCServiceConnectionDelegate *)WeakRetained;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(XPCServiceConnection *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__XPCServiceConnection_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E6CFCD50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__XPCServiceConnection_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) workQueueShutDown];
  if (*(void *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) workQueue];
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)sendMessage:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    __assert_rtn("-[XPCServiceConnection sendMessage:withHandler:]", "XPCKitBasic.m", 338, "handler");
  }
  id v8 = v7;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    _XPCLog(6, @"%@: Scheduling message to be sent to the client.", v9, v10, v11, v12, v13, v14, (uint64_t)self);
  }
  v15 = [(XPCServiceConnection *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__XPCServiceConnection_sendMessage_withHandler___block_invoke;
  block[3] = &unk_1E6CFCDC8;
  id v19 = v6;
  id v20 = v8;
  block[4] = self;
  id v16 = v6;
  id v17 = v8;
  dispatch_async(v15, block);
}

void __48__XPCServiceConnection_sendMessage_withHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    if (_shouldLogBlock)
    {
      if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
        _XPCLog(7, @"%@: Sending message.", v2, v3, v4, v5, v6, v7, *(void *)(a1 + 32));
      }
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
      {
        id v8 = (void *)MEMORY[0x1E01C19E0](*(void *)(a1 + 40));
        if (_shouldLogBlock)
        {
          if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7)) {
            _XPCLog(7, @"Message: %s", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
          }
        }
        free(v8);
      }
    }
    v15 = *(void **)(a1 + 32);
    id v16 = *(void **)(a1 + 40);
    id v17 = (_xpc_connection_s *)v15[3];
    v18 = [v15 workQueue];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __48__XPCServiceConnection_sendMessage_withHandler___block_invoke_2;
    handler[3] = &unk_1E6CFCDA0;
    handler[4] = *(void *)(a1 + 32);
    id v28 = *(id *)(a1 + 48);
    id v27 = *(id *)(a1 + 40);
    xpc_connection_send_message_with_reply(v17, v16, v18, handler);
  }
  else
  {
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
      _XPCLog(6, @"%@: Client has been torn down. Not sending message.", v19, v20, v21, v22, v23, v24, *(void *)(a1 + 32));
    }
    v25 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v25();
  }
}

void __48__XPCServiceConnection_sendMessage_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
      _XPCLog(7, @"%@: Message sent.", v4, v5, v6, v7, v8, v9, *(void *)(a1 + 32));
    }
    id v3 = xdict;
    if (_shouldLogBlock)
    {
      int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7);
      id v3 = xdict;
      if (v10)
      {
        uint64_t v11 = (void *)MEMORY[0x1E01C19E0](xdict);
        if (_shouldLogBlock
          && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
        {
          _XPCLog(7, @"Reply: %s", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
        }
        free(v11);
        id v3 = xdict;
      }
    }
  }
  uint64_t v18 = MEMORY[0x1E01C1A80](v3);
  if (v18 == MEMORY[0x1E4F145A8])
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
      _XPCLog(3, @"%@: Received an error when receiving reply. Error: %s", v28, v29, v30, v31, v32, v33, v27);
    }
    if (xdict == (xpc_object_t)MEMORY[0x1E4F14528])
    {
      if (_shouldLogBlock)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6)) {
          _XPCLog(6, @"%@: Connection invalid.", v47, v48, v49, v50, v51, v52, *(void *)(a1 + 32));
        }
        goto LABEL_36;
      }
    }
    else if (xdict == (xpc_object_t)MEMORY[0x1E4F14520])
    {
      if (_shouldLogBlock)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6)) {
          _XPCLog(6, @"%@: Connection interrupted.", v53, v54, v55, v56, v57, v58, *(void *)(a1 + 32));
        }
        goto LABEL_36;
      }
    }
    else if (_shouldLogBlock)
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
      {
        uint64_t v34 = *(void *)(a1 + 32);
        xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
        _XPCLog(3, @"%@: Unknown XPC error: %s", v35, v36, v37, v38, v39, v40, v34);
      }
LABEL_36:
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
      {
        _XPCLog(3, @"%@: Message send failed. Not retrying.", v59, v60, v61, v62, v63, v64, *(void *)(a1 + 32));
      }
    }
    v26 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_40;
  }
  if (v18 == MEMORY[0x1E4F14590])
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
    {
      _XPCLog(7, @"%@ Handling reply for message.", v41, v42, v43, v44, v45, v46, *(void *)(a1 + 32));
    }
    v26 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E01C19E0](xdict);
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
    {
      _XPCLog(3, @"%@ Received unknown XPC event type: %s", v20, v21, v22, v23, v24, v25, *(void *)(a1 + 32));
    }
    free(v19);
    v26 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
LABEL_40:
  v26();
}

- (void)workQueueShutDown
{
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    _XPCLog(7, @"%@: Shutting down.", v3, v4, v5, v6, v7, v8, (uint64_t)self);
  }
  client = self->_client;
  if (client)
  {
    xpc_connection_cancel(client);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, 0);
    int v10 = self->_client;
    self->_client = 0;

    serviceName = self->_serviceName;
    self->_serviceName = 0;

    id v12 = objc_loadWeakRetained((id *)&self->_serviceListener);
    [v12 serviceConnectionDidDisconnect:self];

    [WeakRetained XPCServiceConnectionDidDisconnect:self];
  }
}

- (void)resume
{
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    _XPCLog(6, @"%@: Resuming service connection.", v3, v4, v5, v6, v7, v8, (uint64_t)self);
  }
  client = self->_client;

  xpc_connection_resume(client);
}

- (void)workQueueHandleIncomingMessage:(id)a3
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "__xpcseq");
  uint64_t v7 = [[XPCRequest alloc] initWithMessage:v4 sequence:uint64 connection:self->_client];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained XPCServiceConnection:self didReceiveRequest:v7 sequenceNumber:uint64];
}

- (XPCServiceConnection)initWithServiceName:(id)a3 client:(id)a4 queue:(id)a5
{
  id v9 = a3;
  int v10 = (_xpc_connection_s *)a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)XPCServiceConnection;
  id v12 = [(XPCServiceConnection *)&v19 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_workQueue, a5);
    objc_storeStrong((id *)&v13->_client, a4);
    xpc_connection_set_target_queue(v10, (dispatch_queue_t)v13->_workQueue);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57__XPCServiceConnection_initWithServiceName_client_queue___block_invoke;
    handler[3] = &unk_1E6CFCD78;
    uint64_t v14 = v13;
    uint64_t v18 = v14;
    xpc_connection_set_event_handler(v10, handler);
    uint64_t v15 = v14;
  }
  return v13;
}

void __57__XPCServiceConnection_initWithServiceName_client_queue___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x1E01C1A80]();
  if (v3 == MEMORY[0x1E4F14590])
  {
    if (_shouldLogBlock)
    {
      if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
        _XPCLog(7, @"%@: Received message.", v11, v12, v13, v14, v15, v16, *(void *)(a1 + 32));
      }
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
      {
        uint64_t v17 = (void *)MEMORY[0x1E01C19E0](xdict);
        if (_shouldLogBlock
          && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
        {
          _XPCLog(7, @"Message: %s", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
        }
        free(v17);
      }
    }
    [*(id *)(a1 + 32) workQueueHandleIncomingMessage:xdict];
  }
  else
  {
    if (v3 == MEMORY[0x1E4F145A8])
    {
      if (xdict == (xpc_object_t)MEMORY[0x1E4F14528])
      {
        if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
          _XPCLog(6, @"%@: Client disconnected.", v31, v32, v33, v34, v35, v36, *(void *)(a1 + 32));
        }
      }
      else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      {
        uint64_t v24 = *(void *)(a1 + 32);
        xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
        _XPCLog(7, @"%@: Service connection received XPC Error: %s", v25, v26, v27, v28, v29, v30, v24);
      }
    }
    else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    {
      uint64_t v4 = *(void *)(a1 + 32);
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
      _XPCLog(3, @"%@: Service connection received unknown XPC event: %s", v5, v6, v7, v8, v9, v10, v4);
    }
    [*(id *)(a1 + 32) workQueueShutDown];
  }
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)XPCServiceConnection;
  uint64_t v4 = [(XPCServiceConnection *)&v9 description];
  serviceName = self->_serviceName;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = [v3 stringWithFormat:@"%@ name %@, delegate %p, client %p, queue %p", v4, serviceName, WeakRetained, self->_client, self->_workQueue];

  return v7;
}

@end