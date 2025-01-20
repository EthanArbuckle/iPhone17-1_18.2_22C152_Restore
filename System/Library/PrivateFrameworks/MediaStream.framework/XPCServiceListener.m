@interface XPCServiceListener
- (NSMutableSet)serviceConnections;
- (NSString)serviceName;
- (OS_dispatch_queue)workQueue;
- (OS_xpc_object)listener;
- (XPCServiceListener)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5;
- (XPCServiceListenerDelegate)delegate;
- (id)debugDescription;
- (unint64_t)clientCount;
- (void)_workQueueShutDownServiceConnections:(id)a3 index:(unint64_t)a4 completionBlock:(id)a5;
- (void)serviceConnectionDidDisconnect:(id)a3;
- (void)setClientCount:(unint64_t)a3;
- (void)setListener:(id)a3;
- (void)setServiceConnections:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)shutDownCompletionBlock:(id)a3;
- (void)start;
- (void)workQueueHandleIncomingConnection:(id)a3;
@end

@implementation XPCServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)setClientCount:(unint64_t)a3
{
  self->_clientCount = a3;
}

- (unint64_t)clientCount
{
  return self->_clientCount;
}

- (void)setServiceConnections:(id)a3
{
}

- (NSMutableSet)serviceConnections
{
  return self->_serviceConnections;
}

- (void)setListener:(id)a3
{
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (XPCServiceListenerDelegate)delegate
{
  return self->_delegate;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)serviceConnectionDidDisconnect:(id)a3
{
  id v4 = a3;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    _XPCLog(6, @"%@: Service connection disconnected.", v5, v6, v7, v8, v9, v10, (uint64_t)self);
  }
  v11 = [(XPCServiceListener *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__XPCServiceListener_serviceConnectionDidDisconnect___block_invoke;
  block[3] = &unk_1E6CFCE40;
  block[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_async(v11, block);
}

uint64_t __53__XPCServiceListener_serviceConnectionDidDisconnect___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)workQueueHandleIncomingConnection:(id)a3
{
  connection = (_xpc_connection_s *)a3;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    _XPCLog(6, @"%@: Client connected: %p", v4, v5, v6, v7, v8, v9, (uint64_t)self);
  }
  uint64_t v10 = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![(XPCServiceListenerDelegate *)v10 XPCServiceListener:self shouldAcceptNewConnection:connection])
  {
    xpc_connection_cancel(connection);
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
    {
      xpc_connection_get_pid(connection);
      _XPCLog(6, @"%@: Rejecting client connection from PID %d", v20, v21, v22, v23, v24, v25, (uint64_t)self);
    }
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"XPCKit.%@.client.%lu", self->_serviceName, self->_clientCount];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    v13 = [[XPCServiceConnection alloc] initWithServiceName:self->_serviceName client:connection queue:v12];
    [(XPCServiceConnection *)v13 setServiceListener:self];
    [(NSMutableSet *)self->_serviceConnections addObject:v13];
    ++self->_clientCount;
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
    {
      xpc_connection_get_pid(connection);
      _XPCLog(6, @"%@: Established new client connection from PID %d", v14, v15, v16, v17, v18, v19, (uint64_t)self);
    }
    [(XPCServiceListenerDelegate *)v10 XPCServiceListener:self didReceiveNewConnection:v13];
    [(XPCServiceConnection *)v13 resume];
  }
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    _XPCLog(6, @"%@: Shutting down service listener for service name “%@”.", v5, v6, v7, v8, v9, v10, (uint64_t)self);
  }
  id v11 = [(XPCServiceListener *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__XPCServiceListener_shutDownCompletionBlock___block_invoke;
  block[3] = &unk_1E6CFCD50;
  block[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_async(v11, block);
}

void __46__XPCServiceListener_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(_xpc_connection_s **)(v2 + 32);
  if (v3)
  {
    xpc_connection_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v6 = [*(id *)(v2 + 40) allObjects];
  uint64_t v7 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__XPCServiceListener_shutDownCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E6CFCD50;
  v8[4] = v7;
  id v9 = *(id *)(a1 + 40);
  [v7 _workQueueShutDownServiceConnections:v6 index:0 completionBlock:v8];
}

uint64_t __46__XPCServiceListener_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    _XPCLog(6, @"%@: Shutdown complete.", v2, v3, v4, v5, v6, v7, *(void *)(a1 + 32));
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

- (void)_workQueueShutDownServiceConnections:(id)a3 index:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  if ([v8 count] <= a4)
  {
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    uint64_t v10 = [v8 objectAtIndex:a4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__XPCServiceListener__workQueueShutDownServiceConnections_index_completionBlock___block_invoke;
    v11[3] = &unk_1E6CFCE18;
    v11[4] = self;
    id v12 = v8;
    unint64_t v14 = a4;
    v13 = v9;
    [v10 shutDownCompletionBlock:v11];
  }
}

void __81__XPCServiceListener__workQueueShutDownServiceConnections_index_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__XPCServiceListener__workQueueShutDownServiceConnections_index_completionBlock___block_invoke_2;
  v7[3] = &unk_1E6CFCE18;
  uint64_t v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v4 = v3;
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = v4;
  uint64_t v10 = v5;
  id v9 = v6;
  dispatch_async(v2, v7);
}

uint64_t __81__XPCServiceListener__workQueueShutDownServiceConnections_index_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueueShutDownServiceConnections:*(void *)(a1 + 40) index:*(void *)(a1 + 56) + 1 completionBlock:*(void *)(a1 + 48)];
}

- (void)start
{
  uint64_t v3 = [(XPCServiceListener *)self listener];
  xpc_connection_resume(v3);

  if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
      _XPCLog(6, @"%@: Service listener now listening for events for service name %@.", v4, v5, v6, v7, v8, v9, (uint64_t)self);
    }
  }
}

- (XPCServiceListener)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (XPCServiceListenerDelegate *)a5;
  v31.receiver = self;
  v31.super_class = (Class)XPCServiceListener;
  id v12 = [(XPCServiceListener *)&v31 init];
  if (v12)
  {
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
      _XPCLog(6, @"Creating service listener for service name %@.", v13, v14, v15, v16, v17, v18, (uint64_t)v9);
    }
    uint64_t v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    serviceConnections = v12->_serviceConnections;
    v12->_serviceConnections = v19;

    objc_storeStrong((id *)&v12->_workQueue, a4);
    v12->_delegate = v11;
    objc_storeStrong((id *)&v12->_serviceName, a3);
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v9 UTF8String], (dispatch_queue_t)v12->_workQueue, 1uLL);
    listener = v12->_listener;
    v12->_listener = mach_service;

    objc_initWeak(&location, v12);
    uint64_t v23 = v12->_listener;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57__XPCServiceListener_initWithServiceName_queue_delegate___block_invoke;
    handler[3] = &unk_1E6CFCDF0;
    uint64_t v24 = v12;
    v28 = v24;
    objc_copyWeak(&v29, &location);
    xpc_connection_set_event_handler(v23, handler);
    uint64_t v25 = v24;
    objc_destroyWeak(&v29);

    objc_destroyWeak(&location);
  }

  return v12;
}

void __57__XPCServiceListener_initWithServiceName_queue_delegate___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  uint64_t v3 = MEMORY[0x1E01C1A80]();
  if (v3 == MEMORY[0x1E4F14578])
  {
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
      _XPCLog(6, @"%@: Received new client connection.", v10, v11, v12, v13, v14, v15, *(void *)(a1 + 32));
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained workQueueHandleIncomingConnection:xdict];
  }
  else if (v3 == MEMORY[0x1E4F145A8])
  {
    if (xdict == (xpc_object_t)MEMORY[0x1E4F14528])
    {
      if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
        _XPCLog(6, @"%@: Client disconnected.", v24, v25, v26, v27, v28, v29, *(void *)(a1 + 32));
      }
    }
    else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    {
      uint64_t v17 = *(void *)(a1 + 32);
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
      _XPCLog(3, @"%@: Found XPC error related to a client connection: %s", v18, v19, v20, v21, v22, v23, v17);
    }
    v30 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 32);
    if (v30)
    {
      xpc_connection_cancel(v30);
      uint64_t v31 = *(void *)(a1 + 32);
      v32 = *(void **)(v31 + 32);
      *(void *)(v31 + 32) = 0;
    }
  }
  else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
  {
    _XPCLog(3, @"%@: Ignoring unexpected XPC event type.", v4, v5, v6, v7, v8, v9, *(void *)(a1 + 32));
  }
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)XPCServiceListener;
  uint64_t v4 = [(XPCServiceListener *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: name %@, connection %p, delegate %p", v4, self->_serviceName, self->_listener, self->_delegate];

  return v5;
}

@end