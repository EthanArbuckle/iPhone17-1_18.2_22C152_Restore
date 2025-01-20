@interface RPPrivateDiscovery
+ (BOOL)supportsSecureCoding;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPPrivateDiscovery)init;
- (RPPrivateDiscovery)initWithCoder:(id)a3;
- (id)description;
- (id)endpointChangedHandler;
- (id)endpointFoundHandler;
- (id)endpointLostHandler;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)clientID;
- (void)_activateDirect;
- (void)_activateXPC:(BOOL)a3;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setClientID:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEndpointChangedHandler:(id)a3;
- (void)setEndpointFoundHandler:(id)a3;
- (void)setEndpointLostHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation RPPrivateDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPPrivateDiscovery)init
{
  if (gRPPrivateDiscoveryClientIDOnce != -1) {
    dispatch_once(&gRPPrivateDiscoveryClientIDOnce, &__block_literal_global_11);
  }
  v7.receiver = self;
  v7.super_class = (Class)RPPrivateDiscovery;
  v3 = [(RPPrivateDiscovery *)&v7 init];
  v4 = v3;
  if (v3)
  {
    v3->_clientID = atomic_fetch_add((atomic_uint *volatile)&gRPPrivateDiscoveryClientIDNext, 1u) + 1;
    objc_storeStrong((id *)&v3->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4->_ucat = (LogCategory *)&gLogCategory_RPPrivateDiscovery;
    v5 = v4;
  }

  return v4;
}

uint64_t __26__RPPrivateDiscovery_init__block_invoke()
{
  uint64_t result = RandomBytes();
  gRPPrivateDiscoveryClientIDNext = (unsigned __int16)word_1E9CD5702 << 16;
  return result;
}

- (RPPrivateDiscovery)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPPrivateDiscovery;
  v5 = [(RPPrivateDiscovery *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPPrivateDiscovery;
    uint64_t v11 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_clientID = v11;
    }
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t clientID = self->_clientID;
  id v7 = v4;
  if (clientID)
  {
    [v4 encodeInt64:clientID forKey:@"cid"];
    id v4 = v7;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v7 encodeObject:serviceType forKey:@"st"];
    id v4 = v7;
  }
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
  v4.super_class = (Class)RPPrivateDiscovery;
  [(RPPrivateDiscovery *)&v4 dealloc];
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;
  return v2;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activate
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activateCalled)
  {
    v2->_activateCalled = 1;
    dispatchQueue = v2->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__RPPrivateDiscovery_activate__block_invoke;
    block[3] = &unk_1E605B540;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v2);
}

uint64_t __30__RPPrivateDiscovery_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 11))
  {
    int v3 = **(_DWORD **)(v1 + 16);
    if (v3 <= 115)
    {
      if (v3 != -1 || (uint64_t result = _LogCategory_Initialize(), result))
      {
        return LogPrintF();
      }
    }
  }
  else
  {
    *(unsigned char *)(v1 + 10) = gRPPrivateDaemon != 0;
    id v2 = *(unsigned char **)(result + 32);
    if (v2[10])
    {
      return [v2 _activateDirect];
    }
    else
    {
      return [v2 _activateXPC:0];
    }
  }
  return result;
}

- (void)_activateDirect
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    serviceType = self->_serviceType;
    LogPrintF();
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__RPPrivateDiscovery__activateDirect__block_invoke;
  v6[3] = &unk_1E605B5B0;
  v6[4] = self;
  objc_msgSend((id)gRPPrivateDaemon, "addDiscovery:completion:", self, v6, clientID, serviceType);
}

void __37__RPPrivateDiscovery__activateDirect__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = **(_DWORD **)(v4 + 16);
  if (v3)
  {
    id v10 = v3;
    if (v5 <= 90)
    {
      if (v5 != -1 || (v6 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 32), v6))
      {
        LogPrintF();
        uint64_t v4 = *(void *)(a1 + 32);
      }
    }
    uint64_t v7 = MEMORY[0x1B3EBCC80](*(void *)(v4 + 72));
    v8 = (void *)v7;
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);
    }

    goto LABEL_12;
  }
  if (v5 <= 30)
  {
    id v10 = 0;
    if (v5 != -1 || (v9 = _LogCategory_Initialize(), id v3 = 0, v9))
    {
      LogPrintF();
LABEL_12:
      id v3 = v10;
    }
  }
}

- (void)_activateXPC:(BOOL)a3
{
  int var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t clientID = self->_clientID;
      serviceType = self->_serviceType;
LABEL_8:
      LogPrintF();
    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    serviceType = self->_serviceType;
    goto LABEL_8;
  }
  [(RPPrivateDiscovery *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__RPPrivateDiscovery__activateXPC___block_invoke;
  v12[3] = &unk_1E605D3E0;
  BOOL v13 = a3;
  v12[4] = self;
  uint64_t v7 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__RPPrivateDiscovery__activateXPC___block_invoke_2;
  v10[3] = &unk_1E605D3E0;
  BOOL v11 = a3;
  v10[4] = self;
  [v7 xpcPrivateDiscoveryActivate:self completion:v10];
}

void __35__RPPrivateDiscovery__activateXPC___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = **(_DWORD **)(*(void *)(a1 + 32) + 16);
  if (*(unsigned char *)(a1 + 40))
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  uint64_t v4 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 72));
  int v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

void __35__RPPrivateDiscovery__activateXPC___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16);
  id v7 = v3;
  if (!v3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (v4 > 30 || v4 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_24;
      }
    }
    else if (v4 > 30 || v4 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_24;
    }
    LogPrintF();
    goto LABEL_24;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (v4 > 90 || v4 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_21;
    }
  }
  else if (v4 > 90 || v4 == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_21;
  }
  LogPrintF();
LABEL_21:
  uint64_t v5 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 72));
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }

LABEL_24:
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.rapport.private-discovery" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C42038];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__RPPrivateDiscovery__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__RPPrivateDiscovery__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E605B540;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C48200];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
}

uint64_t __39__RPPrivateDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __39__RPPrivateDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  int v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_interrupted
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(RPPrivateDiscovery *)self _activateXPC:1];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__RPPrivateDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPPrivateDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 11))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 11) = 1;
    uint64_t v3 = *(void *)(result + 32);
    int v4 = **(_DWORD **)(v3 + 16);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v3 = *(void *)(v2 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(v2 + 32);
      }
    }
    if (*(unsigned char *)(v3 + 10))
    {
      [(id)v3 _invalidateDirect];
      uint64_t v3 = *(void *)(v2 + 32);
    }
    if (*(void *)(v3 + 24))
    {
      [*(id *)(v3 + 24) invalidate];
      uint64_t v3 = *(void *)(v2 + 32);
    }
    return [(id)v3 _invalidated];
  }
  return result;
}

- (void)_invalidateDirect
{
}

uint64_t __39__RPPrivateDiscovery__invalidateDirect__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct && !self->_xpcCnx)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id endpointFoundHandler = self->_endpointFoundHandler;
    self->_id endpointFoundHandler = 0;

    id endpointLostHandler = self->_endpointLostHandler;
    self->_id endpointLostHandler = 0;

    id endpointChangedHandler = self->_endpointChangedHandler;
    self->_id endpointChangedHandler = 0;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v9 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  int v4 = (uint64_t (**)(void))a3;
  int v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__RPPrivateDiscovery__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E605B540;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

uint64_t __47__RPPrivateDiscovery__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    uint64_t v2 = self;
    objc_sync_enter(v2);
    BOOL changesPending = v2->_changesPending;
    v2->_BOOL changesPending = 0;
    objc_sync_exit(v2);

    int var0 = v2->_ucat->var0;
    if (changesPending)
    {
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        id v7 = v2;
        LogPrintF();
      }
      xpcCnx = v2->_xpcCnx;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __29__RPPrivateDiscovery__update__block_invoke;
      v9[3] = &unk_1E605B5B0;
      v9[4] = v2;
      id v6 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v9, v7);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __29__RPPrivateDiscovery__update__block_invoke_2;
      v8[3] = &unk_1E605B5B0;
      v8[4] = v2;
      [v6 xpcPrivateDiscoveryUpdate:v2 completion:v8];
    }
    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

void __29__RPPrivateDiscovery__update__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = **(_DWORD **)(v4 + 16);
  id v9 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 32), v6))
    {
      LogPrintF();
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  uint64_t v7 = MEMORY[0x1B3EBCC80](*(void *)(v4 + 72));
  v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
  }
}

void __29__RPPrivateDiscovery__update__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = **(_DWORD **)(v4 + 16);
  id v9 = v3;
  if (v3)
  {
    if (v5 <= 90)
    {
      if (v5 != -1 || (v6 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 32), v6))
      {
        LogPrintF();
        uint64_t v4 = *(void *)(a1 + 32);
      }
    }
    uint64_t v7 = MEMORY[0x1B3EBCC80](*(void *)(v4 + 72));
    v8 = (void *)v7;
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    }
  }
  else if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)endpointFoundHandler
{
  return self->_endpointFoundHandler;
}

- (void)setEndpointFoundHandler:(id)a3
{
}

- (id)endpointLostHandler
{
  return self->_endpointLostHandler;
}

- (void)setEndpointLostHandler:(id)a3
{
}

- (id)endpointChangedHandler
{
  return self->_endpointChangedHandler;
}

- (void)setEndpointChangedHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
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

- (NSString)label
{
  return self->_label;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_endpointChangedHandler, 0);
  objc_storeStrong(&self->_endpointLostHandler, 0);
  objc_storeStrong(&self->_endpointFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end