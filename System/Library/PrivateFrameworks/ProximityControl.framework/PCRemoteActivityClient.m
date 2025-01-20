@interface PCRemoteActivityClient
+ (BOOL)supportsSecureCoding;
- (NSXPCProxyCreating)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (PCRemoteActivityClient)init;
- (PCRemoteActivityClient)initWithCoder:(id)a3;
- (id)activityDataUpdateHandler;
- (id)homeKitUpdateHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)mediaRemoteUpdateHandler;
- (id)uiWillDismissHandler;
- (id)updateHandler;
- (id)userActivitySetFromData:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_xpcEnsureStarted;
- (void)_xpcEnsureStopped;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)interrupted;
- (void)invalidate;
- (void)setActivityDataUpdateHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHomeKitUpdateHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMediaRemoteUpdateHandler:(id)a3;
- (void)setUiWillDismissHandler:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)startObservingHomeKitIdentifier:(id)a3;
- (void)startObservingMediaRemoteIdentifier:(id)a3;
- (void)stopObservingAllDevices;
- (void)stopObservingHomeKitIdentifier:(id)a3;
- (void)stopObservingMediaRemoteIdentifier:(id)a3;
- (void)updateHomeKitID:(id)a3 mediaRemoteID:(id)a4 withActivities:(id)a5 disambiguationContext:(id)a6;
- (void)updateHomeKitID:(id)a3 withActivities:(id)a4 disambiguationContext:(id)a5;
- (void)updateMediaRemoteID:(id)a3 withActivities:(id)a4 disambiguationContext:(id)a5;
- (void)userTappedCloseButton;
- (void)userTappedDisambiguationButton:(id)a3;
@end

@implementation PCRemoteActivityClient

- (void)dealloc
{
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)PCRemoteActivityClient;
  [(PCRemoteActivityClient *)&v7 dealloc];
}

- (PCRemoteActivityClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)PCRemoteActivityClient;
  v2 = [(PCRemoteActivityClient *)&v7 init];
  if (v2)
  {
    v2->_ucat = (LogCategory *)LogCategoryCreateEx();
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)interrupted
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__PCRemoteActivityClient_interrupted__block_invoke;
  block[3] = &unk_26443DDA0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__PCRemoteActivityClient_interrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v3 = (void (**)(void))MEMORY[0x21D4BA1D0](self->_interruptionHandler);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    uint64_t v3 = v4;
  }
}

- (void)_xpcEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    uint64_t v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD985D8];
    v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD987A8];
    id v5 = objc_alloc(MEMORY[0x263F08D68]);
    v6 = (void *)[v5 initWithMachServiceName:PCXPCLaunchingServiceName options:0];
    [v6 _setQueue:self->_dispatchQueue];
    [v6 setExportedInterface:v3];
    [v6 setExportedObject:self];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__PCRemoteActivityClient__xpcEnsureStarted__block_invoke;
    v10[3] = &unk_26443DDA0;
    v10[4] = self;
    [v6 setInterruptionHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__PCRemoteActivityClient__xpcEnsureStarted__block_invoke_2;
    v9[3] = &unk_26443DDA0;
    v9[4] = self;
    [v6 setInvalidationHandler:v9];
    [v6 setRemoteObjectInterface:v4];
    [v6 resume];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = (NSXPCProxyCreating *)v6;
    id v8 = v6;
  }
}

uint64_t __43__PCRemoteActivityClient__xpcEnsureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __43__PCRemoteActivityClient__xpcEnsureStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_xpcEnsureStopped
{
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    id v5 = xpcCnx;
    if (objc_opt_respondsToSelector()) {
      [(NSXPCProxyCreating *)v5 invalidate];
    }
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
  v7[2] = __49__PCRemoteActivityClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __49__PCRemoteActivityClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(PCRemoteActivityClient *)self _xpcEnsureStarted];
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  xpcCnx = self->_xpcCnx;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__PCRemoteActivityClient__activateWithCompletion___block_invoke;
  v12[3] = &unk_26443E000;
  v12[4] = self;
  id v7 = v4;
  id v13 = v7;
  id v8 = [(NSXPCProxyCreating *)xpcCnx remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__PCRemoteActivityClient__activateWithCompletion___block_invoke_2;
  v10[3] = &unk_26443DEC0;
  id v11 = v7;
  id v9 = v7;
  [v8 client:self activateWithCompletion:v10];
}

void __50__PCRemoteActivityClient__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[1];
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

void __50__PCRemoteActivityClient__activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__PCRemoteActivityClient_invalidate__block_invoke;
  block[3] = &unk_26443DDA0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__PCRemoteActivityClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(PCRemoteActivityClient *)self _xpcEnsureStopped];
  [(PCRemoteActivityClient *)self _invalidated];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v3 = (void (**)(void))MEMORY[0x21D4BA1D0](self->_invalidationHandler);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    uint64_t v3 = v4;
  }
}

- (void)startObservingHomeKitIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__PCRemoteActivityClient_startObservingHomeKitIdentifier___block_invoke;
  v7[3] = &unk_26443DE18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __58__PCRemoteActivityClient_startObservingHomeKitIdentifier___block_invoke(uint64_t a1)
{
  v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_xpcEnsureStarted", v8);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__PCRemoteActivityClient_startObservingHomeKitIdentifier___block_invoke_2;
  v9[3] = &unk_26443DDF0;
  v9[4] = v5;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v7 startObservingHomeKitIdentifier:*(void *)(a1 + 40)];
}

void __58__PCRemoteActivityClient_startObservingHomeKitIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[1];
  id v8 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v7 = v3;
      LogPrintF();
      int v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    int v6 = _LogCategory_Initialize();
    int v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      id v3 = v8;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);
}

- (void)stopObservingHomeKitIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__PCRemoteActivityClient_stopObservingHomeKitIdentifier___block_invoke;
  v7[3] = &unk_26443DE18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __57__PCRemoteActivityClient_stopObservingHomeKitIdentifier___block_invoke(uint64_t a1)
{
  v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_xpcEnsureStarted", v8);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__PCRemoteActivityClient_stopObservingHomeKitIdentifier___block_invoke_2;
  v9[3] = &unk_26443DDF0;
  v9[4] = v5;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v7 stopObservingHomeKitIdentifier:*(void *)(a1 + 40)];
}

void __57__PCRemoteActivityClient_stopObservingHomeKitIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[1];
  id v8 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v7 = v3;
      LogPrintF();
      int v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    int v6 = _LogCategory_Initialize();
    int v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      id v3 = v8;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);
}

- (void)startObservingMediaRemoteIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__PCRemoteActivityClient_startObservingMediaRemoteIdentifier___block_invoke;
  v7[3] = &unk_26443DE18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __62__PCRemoteActivityClient_startObservingMediaRemoteIdentifier___block_invoke(uint64_t a1)
{
  v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_xpcEnsureStarted", v8);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__PCRemoteActivityClient_startObservingMediaRemoteIdentifier___block_invoke_2;
  v9[3] = &unk_26443DDF0;
  v9[4] = v5;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v7 startObservingMediaRemoteIdentifier:*(void *)(a1 + 40)];
}

void __62__PCRemoteActivityClient_startObservingMediaRemoteIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[1];
  id v8 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v7 = v3;
      LogPrintF();
      int v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    int v6 = _LogCategory_Initialize();
    int v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      id v3 = v8;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);
}

- (void)stopObservingMediaRemoteIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__PCRemoteActivityClient_stopObservingMediaRemoteIdentifier___block_invoke;
  v7[3] = &unk_26443DE18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __61__PCRemoteActivityClient_stopObservingMediaRemoteIdentifier___block_invoke(uint64_t a1)
{
  v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_xpcEnsureStarted", v8);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__PCRemoteActivityClient_stopObservingMediaRemoteIdentifier___block_invoke_2;
  v9[3] = &unk_26443DDF0;
  v9[4] = v5;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v7 stopObservingMediaRemoteIdentifier:*(void *)(a1 + 40)];
}

void __61__PCRemoteActivityClient_stopObservingMediaRemoteIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[1];
  id v8 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v7 = v3;
      LogPrintF();
      int v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    int v6 = _LogCategory_Initialize();
    int v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      id v3 = v8;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);
}

- (void)stopObservingAllDevices
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PCRemoteActivityClient_stopObservingAllDevices__block_invoke;
  block[3] = &unk_26443DDA0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __49__PCRemoteActivityClient_stopObservingAllDevices__block_invoke(uint64_t a1)
{
  v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  [v2 _xpcEnsureStarted];
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 80);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__PCRemoteActivityClient_stopObservingAllDevices__block_invoke_2;
  v8[3] = &unk_26443DDF0;
  v8[4] = v5;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v8];
  [v7 stopObservingAllDevices];
}

void __49__PCRemoteActivityClient_stopObservingAllDevices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[1];
  id v8 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v7 = v3;
      LogPrintF();
      int v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    int v6 = _LogCategory_Initialize();
    int v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      id v3 = v8;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);
}

- (void)userTappedCloseButton
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PCRemoteActivityClient_userTappedCloseButton__block_invoke;
  block[3] = &unk_26443DDA0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __47__PCRemoteActivityClient_userTappedCloseButton__block_invoke(uint64_t a1)
{
  v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  [v2 _xpcEnsureStarted];
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 80);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__PCRemoteActivityClient_userTappedCloseButton__block_invoke_2;
  v8[3] = &unk_26443DDF0;
  v8[4] = v5;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v8];
  [v7 userTappedCloseButton];
}

void __47__PCRemoteActivityClient_userTappedCloseButton__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[1];
  id v8 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v7 = v3;
      LogPrintF();
      int v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    int v6 = _LogCategory_Initialize();
    int v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      id v3 = v8;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);
}

- (void)userTappedDisambiguationButton:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__PCRemoteActivityClient_userTappedDisambiguationButton___block_invoke;
  v7[3] = &unk_26443DE18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __57__PCRemoteActivityClient_userTappedDisambiguationButton___block_invoke(uint64_t a1)
{
  v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  [v2 _xpcEnsureStarted];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__PCRemoteActivityClient_userTappedDisambiguationButton___block_invoke_2;
  v8[3] = &unk_26443DDF0;
  v8[4] = v5;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v8];
  [v7 userTappedDisambiguationButton:*(void *)(a1 + 40)];
}

void __57__PCRemoteActivityClient_userTappedDisambiguationButton___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[1];
  id v8 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v7 = v3;
      LogPrintF();
      int v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    int v6 = _LogCategory_Initialize();
    int v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      id v3 = v8;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);
}

- (void)updateHomeKitID:(id)a3 mediaRemoteID:(id)a4 withActivities:(id)a5 disambiguationContext:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v16)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(PCRemoteActivityClient *)self updateHomeKitID:v16 withActivities:v11 disambiguationContext:v12];
    if (v10) {
      goto LABEL_11;
    }
  }
  else
  {
    if (v10)
    {
LABEL_11:
      int v15 = self->_ucat->var0;
      if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [(PCRemoteActivityClient *)self updateMediaRemoteID:v10 withActivities:v11 disambiguationContext:v12];
      goto LABEL_16;
    }
    int v14 = self->_ucat->var0;
    if (v14 <= 90 && (v14 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_16:
}

- (void)updateHomeKitID:(id)a3 withActivities:(id)a4 disambiguationContext:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  id v9 = [(PCRemoteActivityClient *)self userActivitySetFromData:a4];
  uint64_t v10 = MEMORY[0x21D4BA1D0](self->_homeKitUpdateHandler);
  id v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id, void *, id))(v10 + 16))(v10, v16, v9, v8);
  }
  else
  {
    id v12 = (void (**)(void, void, void, void))MEMORY[0x21D4BA1D0](self->_updateHandler);
    if (v12)
    {
      int var0 = self->_ucat->var0;
      id v14 = v16;
      if (var0 <= 60)
      {
        if (var0 != -1 || (v15 = _LogCategory_Initialize(), id v14 = v16, v15))
        {
          LogPrintF();
          id v14 = v16;
        }
      }
      ((void (**)(void, id, void *, id))v12)[2](v12, v14, v9, v8);
    }
  }
}

- (void)updateMediaRemoteID:(id)a3 withActivities:(id)a4 disambiguationContext:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(void, void, void, void))MEMORY[0x21D4BA1D0](self->_mediaRemoteUpdateHandler);
  if (v10)
  {
    id v11 = [(PCRemoteActivityClient *)self userActivitySetFromData:v8];
    ((void (**)(void, id, void *, id))v10)[2](v10, v13, v11, v9);
  }
  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (id)userActivitySetFromData:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x263F08D38]);
        id v12 = objc_msgSend(v11, "_initWithUserActivityData:", v10, (void)v15);
        if (v12)
        {
          id v13 = +[PCActivityUtility activityFrom:v12];
          if (v13) {
            [v4 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCRemoteActivityClient)initWithCoder:(id)a3
{
  id v3 = [(PCRemoteActivityClient *)self init];
  int v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
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

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)homeKitUpdateHandler
{
  return self->_homeKitUpdateHandler;
}

- (void)setHomeKitUpdateHandler:(id)a3
{
}

- (id)mediaRemoteUpdateHandler
{
  return self->_mediaRemoteUpdateHandler;
}

- (void)setMediaRemoteUpdateHandler:(id)a3
{
}

- (id)uiWillDismissHandler
{
  return self->_uiWillDismissHandler;
}

- (void)setUiWillDismissHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (id)activityDataUpdateHandler
{
  return self->_activityDataUpdateHandler;
}

- (void)setActivityDataUpdateHandler:(id)a3
{
}

- (NSXPCProxyCreating)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activityDataUpdateHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_uiWillDismissHandler, 0);
  objc_storeStrong(&self->_mediaRemoteUpdateHandler, 0);
  objc_storeStrong(&self->_homeKitUpdateHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end