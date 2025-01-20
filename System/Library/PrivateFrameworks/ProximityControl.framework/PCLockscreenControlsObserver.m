@interface PCLockscreenControlsObserver
+ (BOOL)supportsSecureCoding;
- (NSString)processName;
- (OS_dispatch_queue)dispatchQueue;
- (PCLockscreenControlsObserver)init;
- (PCLockscreenControlsObserver)initWithCoder:(id)a3;
- (id)description;
- (id)deviceLost;
- (id)deviceUpdated;
- (id)invalidationHandler;
- (id)knownDevices;
- (void)_interrupted;
- (void)_invalidateWithError:(id)a3;
- (void)_xpcEnsureStarted;
- (void)_xpcEnsureStopped;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)deviceLost:(id)a3;
- (void)deviceUpdated:(id)a3;
- (void)didSwitchRouteToDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setDeviceLost:(id)a3;
- (void)setDeviceUpdated:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation PCLockscreenControlsObserver

- (id)knownDevices
{
  devices = self->_devices;
  if (devices)
  {
    v3 = [(NSMutableDictionary *)devices allValues];
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCLockscreenControlsObserver)init
{
  v13.receiver = self;
  v13.super_class = (Class)PCLockscreenControlsObserver;
  v2 = [(PCLockscreenControlsObserver *)&v13 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_ucat = (LogCategory *)LogCategoryCreateEx();
    v5 = [MEMORY[0x263F08AB0] processInfo];
    v6 = [v5 processName];

    v7 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v8 = [v7 processIdentifier];

    uint64_t v9 = [NSString stringWithFormat:@"%@:%d", v6, v8];

    processName = v2->_processName;
    v2->_processName = (NSString *)v9;

    v11 = v2;
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
  id deviceLost = self->_deviceLost;
  self->_id deviceLost = 0;

  id deviceUpdated = self->_deviceUpdated;
  self->_id deviceUpdated = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  v7.receiver = self;
  v7.super_class = (Class)PCLockscreenControlsObserver;
  [(PCLockscreenControlsObserver *)&v7 dealloc];
}

- (void)_interrupted
{
  NSErrorWithOSStatusF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PCLockscreenControlsObserver *)self _invalidateWithError:v3];
}

- (void)_xpcEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD98698];
    v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD98808];
    id v5 = objc_alloc(MEMORY[0x263F08D68]);
    v6 = (NSXPCConnection *)[v5 initWithMachServiceName:PCXPCServiceName options:0];
    [(NSXPCConnection *)v6 _setQueue:self->_dispatchQueue];
    [(NSXPCConnection *)v6 setExportedInterface:v3];
    [(NSXPCConnection *)v6 setExportedObject:self];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__PCLockscreenControlsObserver__xpcEnsureStarted__block_invoke;
    v11[3] = &unk_26443DDA0;
    v11[4] = self;
    [(NSXPCConnection *)v6 setInterruptionHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__PCLockscreenControlsObserver__xpcEnsureStarted__block_invoke_2;
    v10[3] = &unk_26443DDA0;
    v10[4] = self;
    [(NSXPCConnection *)v6 setInvalidationHandler:v10];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v4];
    objc_super v7 = [(NSXPCConnection *)v6 _xpcConnection];
    xpc_connection_set_non_launching();

    [(NSXPCConnection *)v6 resume];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v6;
    uint64_t v9 = v6;
  }
}

uint64_t __49__PCLockscreenControlsObserver__xpcEnsureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

void __49__PCLockscreenControlsObserver__xpcEnsureStarted__block_invoke_2(uint64_t a1)
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
  v7[2] = __55__PCLockscreenControlsObserver_activateWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __55__PCLockscreenControlsObserver_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    id v3 = (void (**)(id, void *))MEMORY[0x21D4BA1D0](*(void *)(a1 + 40));
    if (v3)
    {
      v10 = v3;
      id v4 = NSErrorWithOSStatusF();
      v10[2](v10, v4);

      id v3 = v10;
    }
  }
  else
  {
    *(unsigned char *)(v2 + 8) = 1;
    [*(id *)(a1 + 32) _xpcEnsureStarted];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = **(_DWORD **)(v5 + 32);
    if (v6 <= 30)
    {
      if (v6 != -1 || (int v7 = _LogCategory_Initialize(), v5 = *(void *)(a1 + 32), v7))
      {
        LogPrintF();
        uint64_t v5 = *(void *)(a1 + 32);
      }
    }
    id v8 = [*(id *)(v5 + 40) remoteObjectProxy];
    [v8 activateObserver:*(void *)(a1 + 32)];

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v9();
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PCLockscreenControlsObserver %p, %lu devices", self, -[NSMutableDictionary count](self->_devices, "count")];
}

- (void)didSwitchRouteToDevice:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__PCLockscreenControlsObserver_didSwitchRouteToDevice___block_invoke;
  v7[3] = &unk_26443DE18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __55__PCLockscreenControlsObserver_didSwitchRouteToDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[4];
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      LogPrintF();
      uint64_t v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_xpcEnsureStarted", v8);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__PCLockscreenControlsObserver_didSwitchRouteToDevice___block_invoke_2;
  v9[3] = &unk_26443DDF0;
  v9[4] = v5;
  int v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v7 didSwitchRouteToDevice:*(void *)(a1 + 40)];
}

uint64_t __55__PCLockscreenControlsObserver_didSwitchRouteToDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(int **)(*(void *)(a1 + 32) + 32);
  if (*v4 <= 90)
  {
    id v6 = v3;
    if (*v4 != -1 || (v4 = (int *)_LogCategory_Initialize(), id v3 = v6, v4))
    {
      int v4 = (int *)LogPrintF();
      id v3 = v6;
    }
  }
  return MEMORY[0x270F9A758](v4, v3);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__PCLockscreenControlsObserver_invalidate__block_invoke;
  block[3] = &unk_26443DDA0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __42__PCLockscreenControlsObserver_invalidate__block_invoke(uint64_t a1)
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
    [(PCLockscreenControlsObserver *)self _xpcEnsureStopped];
    uint64_t v6 = MEMORY[0x21D4BA1D0](self->_invalidationHandler);
    int v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
    }

    id v4 = v8;
  }
}

- (PCLockscreenControlsObserver)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PCLockscreenControlsObserver *)self init];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    uint64_t v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  processName = self->_processName;
  if (processName) {
    [a3 encodeObject:processName forKey:@"pn"];
  }
}

- (void)deviceLost:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v12, v6))
    {
      id v11 = v4;
      LogPrintF();
      id v4 = v12;
    }
  }
  devices = self->_devices;
  id v8 = objc_msgSend(v4, "mediaRouteID", v11);
  [(NSMutableDictionary *)devices removeObjectForKey:v8];

  uint64_t v9 = MEMORY[0x21D4BA1D0](self->_deviceLost);
  v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v12);
  }
}

- (void)deviceUpdated:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v14 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v14, v6))
    {
      id v13 = v4;
      LogPrintF();
      id v4 = v14;
    }
  }
  devices = self->_devices;
  if (!devices)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v9 = self->_devices;
    self->_devices = v8;

    id v4 = v14;
    devices = self->_devices;
  }
  v10 = objc_msgSend(v4, "mediaRouteID", v13);
  [(NSMutableDictionary *)devices setObject:v14 forKeyedSubscript:v10];

  uint64_t v11 = MEMORY[0x21D4BA1D0](self->_deviceUpdated);
  id v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v14);
  }
}

- (id)deviceLost
{
  return self->_deviceLost;
}

- (void)setDeviceLost:(id)a3
{
}

- (id)deviceUpdated
{
  return self->_deviceUpdated;
}

- (void)setDeviceUpdated:(id)a3
{
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

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceUpdated, 0);
  objc_storeStrong(&self->_deviceLost, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end