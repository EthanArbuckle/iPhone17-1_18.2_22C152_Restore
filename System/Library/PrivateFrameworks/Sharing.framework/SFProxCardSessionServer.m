@interface SFProxCardSessionServer
- (NSString)label;
- (NSXPCListenerEndpoint)xpcEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (SFProxCardSessionServer)init;
- (SFProxCardXPCServerInterface)delegate;
- (id)errorHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)performAction:(int)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setXpcEndpoint:(id)a3;
@end

@implementation SFProxCardSessionServer

- (SFProxCardSessionServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFProxCardSessionServer;
  v2 = [(SFProxCardSessionServer *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_ucat = (LogCategory *)&gLogCategory_SFProxCardSessionServer;
    v6 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFProxCardSessionServer;
  [(SFProxCardSessionServer *)&v4 dealloc];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SFProxCardSessionServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __50__SFProxCardSessionServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[2];
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);

  return [v2 _activateWithCompletion:v5];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_xpcEndpoint;
  if (v5)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__12;
    v20[4] = __Block_byref_object_dispose__12;
    id v21 = 0;
    id v21 = _Block_copy(v4);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke;
    aBlock[3] = &unk_1E5BBD998;
    aBlock[4] = v20;
    id v6 = _Block_copy(aBlock);
    v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v5];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v7;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39320];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v9];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA16FF0];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v10];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_2;
    v18[3] = &unk_1E5BBC9C8;
    v18[4] = self;
    v18[5] = v6;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v18];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_3;
    v17[3] = &unk_1E5BBC9C8;
    v17[4] = self;
    v17[5] = v6;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v17];
    [(NSXPCConnection *)self->_xpcCnx resume];
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v13 = self->_xpcCnx;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_4;
    v16[3] = &unk_1E5BBE0F8;
    v16[4] = self;
    v16[5] = v6;
    v14 = [(NSXPCConnection *)v13 remoteObjectProxyWithErrorHandler:v16];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_5;
    v15[3] = &unk_1E5BBE0F8;
    v15[4] = self;
    v15[5] = v6;
    [v14 xpcCheckinWithCompletion:v15];

    _Block_object_dispose(v20, 8);
  }
  else
  {
    v12 = SFErrorF();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
    [(SFProxCardSessionServer *)self _reportError:v12];
  }
}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  SFErrorF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (!v2[9] && !v2[8]) {
    [v2 _reportError:v3];
  }
}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_3(uint64_t a1)
{
  SFErrorF();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 9) && !*(unsigned char *)(v2 + 8))
  {
    [(id)v2 _reportError:v4];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  [*(id *)(a1 + 32) _invalidated];
}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_4(uint64_t a1)
{
  SFNestedErrorF();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _reportError:v2];
}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id v3 = SFNestedErrorF();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _reportError:v3];
  }
  else
  {
    int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16);
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFProxCardSessionServer_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFProxCardSessionServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 16);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 32), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 32);
      }
    }
    *(unsigned char *)(v1 + 9) = 1;
    id v5 = *(void **)(v2 + 32);
    return [v5 _invalidate];
  }
  return result;
}

- (void)_invalidate
{
  delegate = self->_delegate;
  self->_delegate = 0;

  [(NSXPCConnection *)self->_xpcCnx invalidate];

  [(SFProxCardSessionServer *)self _invalidated];
}

- (void)_invalidated
{
  if (!self->_invalidateDone && self->_invalidateCalled && !self->_xpcCnx)
  {
    int v3 = _Block_copy(self->_invalidationHandler);
    int v4 = v3;
    if (v3) {
      (*((void (**)(void *))v3 + 2))(v3);
    }

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_reportError:(id)a3
{
  id v7 = a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = _Block_copy(self->_errorHandler);
  id v6 = v5;
  if (v5) {
    (*((void (**)(void *, id))v5 + 2))(v5, v7);
  }
}

- (void)performAction:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = self->_xpcCnx;
  if (v7)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__12;
    v20[4] = __Block_byref_object_dispose__12;
    id v21 = 0;
    id v21 = _Block_copy(v6);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__SFProxCardSessionServer_performAction_completion___block_invoke;
    aBlock[3] = &unk_1E5BBD998;
    aBlock[4] = v20;
    id v8 = _Block_copy(aBlock);
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      if (v4 > 3) {
        v10 = "?";
      }
      else {
        v10 = off_1E5BC0860[(int)v4];
      }
      v14 = v10;
      LogPrintF();
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__SFProxCardSessionServer_performAction_completion___block_invoke_2;
    v17[3] = &unk_1E5BC0840;
    int v18 = v4;
    v17[4] = self;
    v17[5] = v8;
    v13 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v7, "remoteObjectProxyWithErrorHandler:", v17, v14);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__SFProxCardSessionServer_performAction_completion___block_invoke_3;
    v15[3] = &unk_1E5BC0840;
    int v16 = v4;
    v15[4] = self;
    v15[5] = v8;
    [v13 xpcPerformAction:v4 completion:v15];

    _Block_object_dispose(v20, 8);
  }
  else
  {
    v11 = SFErrorF();
    int v12 = self->_ucat->var0;
    if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }
}

void __52__SFProxCardSessionServer_performAction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __52__SFProxCardSessionServer_performAction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16);
  id v6 = v3;
  if (v4 <= 90)
  {
    if (v4 != -1 || (v5 = _LogCategory_Initialize(), id v3 = v6, v5))
    {
      LogPrintF();
      id v3 = v6;
    }
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

void __52__SFProxCardSessionServer_performAction_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = **(_DWORD **)(v4 + 16);
  id v7 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 32), v6))
    {
      LogPrintF();
      id v3 = v7;
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      id v3 = v7;
    }
  }
  *(unsigned char *)(v4 + 8) = 1;
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (SFProxCardXPCServerInterface)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end