@interface RPRemoteXPCConnection
- (NSString)serviceName;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)dispatchQueue;
- (RPEndpoint)endpoint;
- (RPRemoteXPCConnection)init;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation RPRemoteXPCConnection

- (RPRemoteXPCConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPRemoteXPCConnection;
  v2 = [(RPRemoteXPCConnection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4 = v3;
  }

  return v3;
}

- (NSXPCConnection)xpcConnection
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcConnection;
  if (!v3)
  {
    v3 = (NSXPCConnection *)objc_alloc_init(MEMORY[0x1E4F29268]);
    [(NSXPCConnection *)v3 _setQueue:v2->_dispatchQueue];
    objc_storeStrong((id *)&v2->_xpcConnection, v3);
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__RPRemoteXPCConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __48__RPRemoteXPCConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v3 = (void (**)(id, void))a3;
  v5 = v3;
  if (gLogCategory_RPRemoteXPC <= 30)
  {
    if (gLogCategory_RPRemoteXPC != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      v3 = v5;
    }
  }
  if (v3)
  {
    v3[2](v3, 0);
    v3 = v5;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RPRemoteXPCConnection_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPRemoteXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPRemoteXPC <= 30 && (gLogCategory_RPRemoteXPC != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPRemoteXPCConnection *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    uint64_t v3 = MEMORY[0x1B3EBCC80](self->_invalidationHandler);
    int v4 = (void *)v3;
    if (v3) {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPRemoteXPC <= 30 && (gLogCategory_RPRemoteXPC != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end