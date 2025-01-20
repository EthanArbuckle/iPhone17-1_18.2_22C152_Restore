@interface RPPrivateAdvertiser
+ (BOOL)supportsSecureCoding;
- (NSDictionary)serviceInfo;
- (NSString)accessGroup;
- (NSString)label;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPPrivateAdvertiser)init;
- (RPPrivateAdvertiser)initWithCoder:(id)a3;
- (id)description;
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
- (void)setAccessGroup:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setServiceInfo:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation RPPrivateAdvertiser

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPPrivateAdvertiser)init
{
  if (gRPPrivateAdvertiserClientIDOnce != -1) {
    dispatch_once(&gRPPrivateAdvertiserClientIDOnce, &__block_literal_global_10);
  }
  v7.receiver = self;
  v7.super_class = (Class)RPPrivateAdvertiser;
  v3 = [(RPPrivateAdvertiser *)&v7 init];
  v4 = v3;
  if (v3)
  {
    v3->_clientID = atomic_fetch_add((atomic_uint *volatile)&gRPPrivateAdvertiserClientIDNext, 1u) + 1;
    objc_storeStrong((id *)&v3->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4->_ucat = (LogCategory *)&gLogCategory_RPPrivateAdvertiser;
    v5 = v4;
  }

  return v4;
}

uint64_t __27__RPPrivateAdvertiser_init__block_invoke()
{
  uint64_t result = RandomBytes();
  gRPPrivateAdvertiserClientIDNext = (unsigned __int16)word_1E9CD56F2 << 16;
  return result;
}

- (RPPrivateAdvertiser)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPPrivateAdvertiser;
  v5 = [(RPPrivateAdvertiser *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPPrivateAdvertiser;
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v13 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_clientID = v13;
    }
    id v8 = v7;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  accessGroup = self->_accessGroup;
  id v9 = v4;
  if (accessGroup)
  {
    [v4 encodeObject:accessGroup forKey:@"ag"];
    id v4 = v9;
  }
  uint64_t clientID = self->_clientID;
  if (clientID)
  {
    [v9 encodeInt64:clientID forKey:@"cid"];
    id v4 = v9;
  }
  serviceInfo = self->_serviceInfo;
  if (serviceInfo)
  {
    [v9 encodeObject:serviceInfo forKey:@"si"];
    id v4 = v9;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v9 encodeObject:serviceType forKey:@"st"];
    id v4 = v9;
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
  v4.super_class = (Class)RPPrivateAdvertiser;
  [(RPPrivateAdvertiser *)&v4 dealloc];
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  objc_super v4 = v3;
  accessGroup = self->_accessGroup;
  if (accessGroup)
  {
    id v9 = v3;
    id v8 = accessGroup;
    NSAppendPrintF();
    id v6 = v9;

    objc_super v4 = v6;
  }
  return v4;
}

- (void)setAccessGroup:(id)a3
{
  objc_super v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__RPPrivateAdvertiser_setAccessGroup___block_invoke;
  v6[3] = &unk_1E605D3B8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(RPPrivateAdvertiser *)self _updateIfNeededWithBlock:v6];
}

uint64_t __38__RPPrivateAdvertiser_setAccessGroup___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 40) + 40);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    goto LABEL_6;
  }
  id v5 = v4;
  if ((v3 == 0) == (v4 != 0))
  {

    uint64_t v7 = 0;
    goto LABEL_8;
  }
  int v6 = [v3 isEqual:v4];

  if (v6)
  {
LABEL_6:
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = v8;
    id v3 = *(id *)(v9 + 40);
    *(void *)(v9 + 40) = v10;
    uint64_t v7 = 1;
LABEL_8:

    return v7;
  }
  return 0;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setServiceInfo:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__RPPrivateAdvertiser_setServiceInfo___block_invoke;
  v6[3] = &unk_1E605D3B8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(RPPrivateAdvertiser *)self _updateIfNeededWithBlock:v6];
}

uint64_t __38__RPPrivateAdvertiser_setServiceInfo___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 40) + 88);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (v3 == v4)
  {

    goto LABEL_6;
  }
  id v5 = v4;
  if ((v3 == 0) == (v4 != 0))
  {

    uint64_t v7 = 0;
    goto LABEL_8;
  }
  int v6 = [v3 isEqual:v4];

  if (v6)
  {
LABEL_6:
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = v8;
    id v3 = *(id *)(v9 + 88);
    *(void *)(v9 + 88) = v10;
    uint64_t v7 = 1;
LABEL_8:

    return v7;
  }
  return 0;
}

- (void)activate
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activateCalled)
  {
    v2->_activateCalled = 1;
    dispatchQueue = v2->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__RPPrivateAdvertiser_activate__block_invoke;
    block[3] = &unk_1E605B540;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v2);
}

uint64_t __31__RPPrivateAdvertiser_activate__block_invoke(uint64_t result)
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
    v2 = *(unsigned char **)(result + 32);
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
  v6[2] = __38__RPPrivateAdvertiser__activateDirect__block_invoke;
  v6[3] = &unk_1E605B5B0;
  void v6[4] = self;
  objc_msgSend((id)gRPPrivateDaemon, "addAdvertiser:completion:", self, v6, clientID, serviceType);
}

void __38__RPPrivateAdvertiser__activateDirect__block_invoke(uint64_t a1, void *a2)
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
    uint64_t v7 = MEMORY[0x1B3EBCC80](*(void *)(v4 + 56));
    id v8 = (void *)v7;
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);
    }

    goto LABEL_12;
  }
  if (v5 <= 30)
  {
    id v10 = 0;
    if (v5 != -1 || (int v9 = _LogCategory_Initialize(), v3 = 0, v9))
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
  [(RPPrivateAdvertiser *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__RPPrivateAdvertiser__activateXPC___block_invoke;
  v12[3] = &unk_1E605D3E0;
  BOOL v13 = a3;
  v12[4] = self;
  uint64_t v7 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__RPPrivateAdvertiser__activateXPC___block_invoke_2;
  v10[3] = &unk_1E605D3E0;
  BOOL v11 = a3;
  v10[4] = self;
  [v7 xpcPrivateAdvertiserActivate:self completion:v10];
}

void __36__RPPrivateAdvertiser__activateXPC___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v4 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 56));
  int v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

void __36__RPPrivateAdvertiser__activateXPC___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v5 = MEMORY[0x1B3EBCC80](*(void *)(*(void *)(a1 + 32) + 56));
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
    v8[2] = __40__RPPrivateAdvertiser__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__RPPrivateAdvertiser__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E605B540;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C48200];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
}

uint64_t __40__RPPrivateAdvertiser__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __40__RPPrivateAdvertiser__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  [(RPPrivateAdvertiser *)self _activateXPC:1];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__RPPrivateAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__RPPrivateAdvertiser_invalidate__block_invoke(uint64_t result)
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

uint64_t __40__RPPrivateAdvertiser__invalidateDirect__block_invoke(uint64_t a1)
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
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v6 = self->_invalidationHandler;
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
    block[2] = __48__RPPrivateAdvertiser__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E605B540;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

uint64_t __48__RPPrivateAdvertiser__updateIfNeededWithBlock___block_invoke(uint64_t a1)
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
      v9[2] = __30__RPPrivateAdvertiser__update__block_invoke;
      v9[3] = &unk_1E605B5B0;
      v9[4] = v2;
      id v6 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v9, v7);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __30__RPPrivateAdvertiser__update__block_invoke_2;
      v8[3] = &unk_1E605B5B0;
      v8[4] = v2;
      [v6 xpcPrivateAdvertiserUpdate:v2 completion:v8];
    }
    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

void __30__RPPrivateAdvertiser__update__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v7 = MEMORY[0x1B3EBCC80](*(void *)(v4 + 56));
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
  }
}

void __30__RPPrivateAdvertiser__update__block_invoke_2(uint64_t a1, void *a2)
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
    uint64_t v7 = MEMORY[0x1B3EBCC80](*(void *)(v4 + 56));
    id v8 = (void *)v7;
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    }
  }
  else if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (NSString)accessGroup
{
  return self->_accessGroup;
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

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
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
  objc_storeStrong((id *)&self->_serviceInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end