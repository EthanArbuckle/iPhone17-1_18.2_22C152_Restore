@interface RPNearFieldClient
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldClient)init;
- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (id)_ensureXPCStarted;
- (id)connectionEstablishedHandler;
- (id)failedDiscovery;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)tapEventHandler;
- (void)_interrupted;
- (void)_invalidated;
- (void)didConnect;
- (void)failDiscoveryWithError:(id)a3;
- (void)invalidate;
- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3;
- (void)receivedTapEvent:(id)a3;
- (void)setConnectionEstablishedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFailedDiscovery:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTapEventHandler:(id)a3;
- (void)stopWithCompletion:(id)a3;
@end

@implementation RPNearFieldClient

- (RPNearFieldClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPNearFieldClient;
  v2 = [(RPNearFieldClient *)&v5 init];
  v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
  }
  return v3;
}

- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  objc_super v5 = (objc_class *)MEMORY[0x1E4F29268];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithMachServiceName:v6 options:a4];

  return v7;
}

- (id)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    v3 = [(RPNearFieldClient *)self _XPCConnectionWithMachServiceName:@"com.apple.rapport.nearfield" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    objc_super v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C39A48];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C48080];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__RPNearFieldClient__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E605B540;
    v9[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__RPNearFieldClient__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v8];
    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_RPNearFieldClient <= 10
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return 0;
}

uint64_t __38__RPNearFieldClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __38__RPNearFieldClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPNearFieldClient <= 50
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = (void (**)(void))MEMORY[0x1B3EBCC80](self->_interruptionHandler);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__RPNearFieldClient_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__RPNearFieldClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    *(unsigned char *)(v1 + 16) = 1;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 17)
      && gLogCategory_RPNearFieldClient <= 30
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(void **)(*(void *)(a1 + 32) + 64);
    if (v3)
    {
      [v3 invalidate];
      uint64_t v4 = *(void *)(a1 + 32);
      objc_super v5 = *(void **)(v4 + 64);
      *(void *)(v4 + 64) = 0;
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      [v6 _invalidated];
    }
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPNearFieldClient <= 50
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearFieldClient <= 10
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)stopWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(RPNearFieldClient *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__RPNearFieldClient_stopWithCompletion___block_invoke;
  v12[3] = &unk_1E605B600;
  id v7 = v4;
  id v13 = v7;
  v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__RPNearFieldClient_stopWithCompletion___block_invoke_2;
  v10[3] = &unk_1E605B600;
  id v11 = v7;
  id v9 = v7;
  [v8 stopDiscoveryWithCompletion:v10];
}

void __40__RPNearFieldClient_stopWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = MEMORY[0x1B3EBCC80](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __40__RPNearFieldClient_stopWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (gLogCategory_RPNearFieldClient <= 90
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNearFieldClient <= 40 {
         && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  uint64_t v3 = MEMORY[0x1B3EBCC80](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

- (void)failDiscoveryWithError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = MEMORY[0x1B3EBCC80](self->_failedDiscovery);
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (void)receivedTapEvent:(id)a3
{
  id v6 = a3;
  uint64_t v4 = MEMORY[0x1B3EBCC80](self->_tapEventHandler);
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3
{
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)didConnect
{
  v2 = (void (**)(void))MEMORY[0x1B3EBCC80](self->_connectionEstablishedHandler, a2);
  if (v2)
  {
    uint64_t v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
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

- (id)tapEventHandler
{
  return self->_tapEventHandler;
}

- (void)setTapEventHandler:(id)a3
{
}

- (id)failedDiscovery
{
  return self->_failedDiscovery;
}

- (void)setFailedDiscovery:(id)a3
{
}

- (id)connectionEstablishedHandler
{
  return self->_connectionEstablishedHandler;
}

- (void)setConnectionEstablishedHandler:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_connectionEstablishedHandler, 0);
  objc_storeStrong(&self->_failedDiscovery, 0);
  objc_storeStrong(&self->_tapEventHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end