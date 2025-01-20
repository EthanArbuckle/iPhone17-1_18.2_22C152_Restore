@interface PCMediaTransferObserver
+ (BOOL)supportsSecureCoding;
- (OS_dispatch_queue)dispatchQueue;
- (PCMediaTransferObserver)init;
- (PCMediaTransferObserver)initWithCoder:(id)a3;
- (id)description;
- (id)invalidationHandler;
- (id)transferBeganHandler;
- (id)transferEndedHandler;
- (void)_interrupted;
- (void)_invalidateWithError:(id)a3;
- (void)_xpcEnsureStarted;
- (void)_xpcEnsureStopped;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTransferBeganHandler:(id)a3;
- (void)setTransferEndedHandler:(id)a3;
- (void)transferBeganWithContext:(id)a3;
- (void)transferEnded;
@end

@implementation PCMediaTransferObserver

- (PCMediaTransferObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)PCMediaTransferObserver;
  v2 = [(PCMediaTransferObserver *)&v7 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_ucat = (LogCategory *)LogCategoryCreateEx();
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  id transferBeganHandler = self->_transferBeganHandler;
  self->_id transferBeganHandler = 0;

  id transferEndedHandler = self->_transferEndedHandler;
  self->_id transferEndedHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  v7.receiver = self;
  v7.super_class = (Class)PCMediaTransferObserver;
  [(PCMediaTransferObserver *)&v7 dealloc];
}

- (void)_xpcEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    uint64_t v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD986F8];
    v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD98868];
    id v5 = objc_alloc(MEMORY[0x263F08D68]);
    v6 = (NSXPCConnection *)[v5 initWithMachServiceName:PCXPCLaunchingServiceName options:0];
    [(NSXPCConnection *)v6 _setQueue:self->_dispatchQueue];
    [(NSXPCConnection *)v6 setExportedInterface:v3];
    [(NSXPCConnection *)v6 setExportedObject:self];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__PCMediaTransferObserver__xpcEnsureStarted__block_invoke;
    v10[3] = &unk_26443DDA0;
    v10[4] = self;
    [(NSXPCConnection *)v6 setInterruptionHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__PCMediaTransferObserver__xpcEnsureStarted__block_invoke_2;
    v9[3] = &unk_26443DDA0;
    v9[4] = self;
    [(NSXPCConnection *)v6 setInvalidationHandler:v9];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v4];
    [(NSXPCConnection *)v6 resume];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v6;
    v8 = v6;
  }
}

uint64_t __44__PCMediaTransferObserver__xpcEnsureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

void __44__PCMediaTransferObserver__xpcEnsureStarted__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _invalidateWithError:v2];
}

- (void)_xpcEnsureStopped
{
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    [(NSXPCConnection *)xpcCnx invalidate];
    v4 = self->_xpcCnx;
    self->_xpcCnx = 0;
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__PCMediaTransferObserver_activateWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __50__PCMediaTransferObserver_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    uint64_t v3 = (void (**)(id, void *))MEMORY[0x21D4BA1D0](*(void *)(a1 + 40));
    if (v3)
    {
      v11 = v3;
      id v4 = NSErrorWithOSStatusF();
      v11[2](v11, v4);

      uint64_t v3 = v11;
    }
  }
  else
  {
    *(unsigned char *)(v2 + 8) = 1;
    [*(id *)(a1 + 32) _xpcEnsureStarted];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = **(_DWORD **)(v5 + 16);
    if (v6 <= 30)
    {
      if (v6 != -1 || (int v7 = _LogCategory_Initialize(), v5 = *(void *)(a1 + 32), v7))
      {
        LogPrintF();
        uint64_t v5 = *(void *)(a1 + 32);
      }
    }
    id v8 = *(void **)(v5 + 24);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__PCMediaTransferObserver_activateWithCompletion___block_invoke_2;
    v14[3] = &unk_26443E000;
    v14[4] = v5;
    id v15 = *(id *)(a1 + 40);
    v9 = [v8 remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__PCMediaTransferObserver_activateWithCompletion___block_invoke_3;
    v12[3] = &unk_26443DEC0;
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    [v9 mediaTransferObserver:v10 activateWithCompletion:v12];
  }
}

void __50__PCMediaTransferObserver_activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[2];
  id v10 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v9 = v3;
      LogPrintF();
      id v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    int v6 = _LogCategory_Initialize();
    id v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      id v3 = v10;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v9);
  uint64_t v7 = MEMORY[0x21D4BA1D0](*(void *)(a1 + 40));
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);
  }
}

void __50__PCMediaTransferObserver_activateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"PCMediaTransferObserver %p", self);
}

- (void)_interrupted
{
  NSErrorWithOSStatusF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PCMediaTransferObserver *)self _invalidateWithError:v3];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__PCMediaTransferObserver_invalidate__block_invoke;
  block[3] = &unk_26443DDA0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__PCMediaTransferObserver_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithError:0];
}

- (void)_invalidateWithError:(id)a3
{
  id v4 = a3;
  if (!self->_invalidated)
  {
    id v8 = v4;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    self->_invalidated = 1;
    [(PCMediaTransferObserver *)self _xpcEnsureStopped];
    uint64_t v6 = MEMORY[0x21D4BA1D0](self->_invalidationHandler);
    uint64_t v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
    }

    id v4 = v8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCMediaTransferObserver)initWithCoder:(id)a3
{
  id v3 = [(PCMediaTransferObserver *)self init];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (void)transferBeganWithContext:(id)a3
{
  id v7 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v5 = MEMORY[0x21D4BA1D0](self->_transferBeganHandler);
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }
}

- (void)transferEnded
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = (void (**)(void))MEMORY[0x21D4BA1D0](self->_transferEndedHandler);
  if (v4)
  {
    uint64_t v5 = v4;
    v4[2]();
    id v4 = v5;
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)transferBeganHandler
{
  return self->_transferBeganHandler;
}

- (void)setTransferBeganHandler:(id)a3
{
}

- (id)transferEndedHandler
{
  return self->_transferEndedHandler;
}

- (void)setTransferEndedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferEndedHandler, 0);
  objc_storeStrong(&self->_transferBeganHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end