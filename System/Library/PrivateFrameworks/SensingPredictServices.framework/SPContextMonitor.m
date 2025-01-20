@interface SPContextMonitor
+ (BOOL)supportsSecureCoding;
- (BOOL)isSystemContext;
- (OS_dispatch_queue)dispatchQueue;
- (SPContextMonitor)init;
- (SPContextMonitor)initWithCoder:(id)a3;
- (id)contextChangeHandler;
- (id)contextSignalUpdatedHandler;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)clientID;
- (unsigned)contextChangeFlags;
- (void)_activate:(BOOL)a3;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)contextMonitorContextChanged:(id)a3;
- (void)contextSignalUpdated:(id)a3 fusedState:(unsigned int)a4;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setClientID:(unsigned int)a3;
- (void)setContextChangeFlags:(unsigned int)a3;
- (void)setContextChangeHandler:(id)a3;
- (void)setContextSignalUpdatedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation SPContextMonitor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPContextMonitor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPContextMonitor *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_contextChangeFlags = 0;
    }
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t contextChangeFlags = self->_contextChangeFlags;
  if (contextChangeFlags) {
    [a3 encodeInt64:contextChangeFlags forKey:@"cmcf"];
  }
}

- (SPContextMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)SPContextMonitor;
  v2 = [(SPContextMonitor *)&v5 init];
  if (v2)
  {
    if (SPXPCGetNextClientID_sOnce != -1) {
      dispatch_once(&SPXPCGetNextClientID_sOnce, &__block_literal_global);
    }
    v2->_clientID = atomic_fetch_add((atomic_uint *volatile)&SPXPCGetNextClientID_sNext, 1u) + 1;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3 = v2;
  }

  return v2;
}

- (void)setContextChangeFlags:(unsigned int)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__SPContextMonitor_setContextChangeFlags___block_invoke;
    v6[3] = &unk_2654A8648;
    v6[4] = v4;
    unsigned int v7 = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_uint64_t contextChangeFlags = a3;
  }
  objc_sync_exit(v4);
}

void __42__SPContextMonitor_setContextChangeFlags___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = *(_DWORD *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
  [v2 contextMonitorUpdate:*(void *)(a1 + 32)];
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SPContextMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_2654A8670;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __43__SPContextMonitor_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    NSErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SPContextMonitor <= 90
      && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  else
  {
    *(unsigned char *)(v2 + 8) = 1;
    uint64_t v3 = MEMORY[0x2611792B0](*(void *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v6 = *(void **)(a1 + 32);
    [v6 _activate:0];
  }
}

- (void)_activate:(BOOL)a3
{
  if (!self->_invalidateCalled)
  {
    if (a3)
    {
      if (gLogCategory_SPContextMonitor > 30
        || gLogCategory_SPContextMonitor == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_21;
      }
    }
    else if (gLogCategory_SPContextMonitor > 30 {
           || gLogCategory_SPContextMonitor == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_21;
    }
    uint64_t clientID = self->_clientID;
    LogPrintF();
LABEL_21:
    [(SPContextMonitor *)self _ensureXPCStarted];
    xpcCnx = self->_xpcCnx;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __30__SPContextMonitor__activate___block_invoke;
    v13[3] = &unk_2654A8698;
    BOOL v14 = a3;
    v13[4] = self;
    id v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __30__SPContextMonitor__activate___block_invoke_2;
    v11[3] = &unk_2654A8698;
    v11[4] = self;
    BOOL v12 = a3;
    [v8 contextMonitorActivate:self completion:v11];

    return;
  }
  NSErrorF();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SPContextMonitor <= 90
    && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_super v5 = (void (**)(void, void))MEMORY[0x2611792B0](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v5) {
    ((void (**)(void, id))v5)[2](v5, v10);
  }
}

void __30__SPContextMonitor__activate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_SPContextMonitor <= 30)
    {
      if (gLogCategory_SPContextMonitor != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
        id v6 = v3;
LABEL_8:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_SPContextMonitor <= 90)
  {
    if (gLogCategory_SPContextMonitor != -1 || (int v5 = _LogCategory_Initialize(), v3 = v7, v5))
    {
      id v6 = v3;
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v6);
}

void __30__SPContextMonitor__activate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_SPContextMonitor <= 90)
    {
      if (gLogCategory_SPContextMonitor != -1 || (v5 = _LogCategory_Initialize(), id v4 = v10, v5))
      {
        id v9 = v4;
        LogPrintF();
        id v4 = v10;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v4, v9);
    goto LABEL_20;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_SPContextMonitor > 30
      || gLogCategory_SPContextMonitor == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
  }
  else if (gLogCategory_SPContextMonitor > 30 {
         || gLogCategory_SPContextMonitor == -1 && !_LogCategory_Initialize())
  }
  {
    goto LABEL_17;
  }
  LogPrintF();
LABEL_17:
  id v6 = (void (**)(void, void))MEMORY[0x2611792B0](*(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;

  if (v6) {
    v6[2](v6, 0);
  }

LABEL_20:
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SensingPredictXPCService"];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    int v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270970D00];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__SPContextMonitor__ensureXPCStarted__block_invoke;
    v8[3] = &unk_2654A86C0;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SPContextMonitor__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_2654A86C0;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270970D60];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
}

uint64_t __37__SPContextMonitor__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __37__SPContextMonitor__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SPContextMonitor <= 50
    && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = NSErrorF();
  [(SPContextMonitor *)self _reportError:v3];

  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    id v6 = (void (*)(void))*((void *)interruptionHandler + 2);
    v6();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SPContextMonitor_invalidate__block_invoke;
  block[3] = &unk_2654A86C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __30__SPContextMonitor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 25)
      && gLogCategory_SPContextMonitor <= 30
      && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    if (v4)
    {
      [v4 invalidate];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    id v8 = (void (**)(id, void *))MEMORY[0x2611792B0](*(void *)(v3 + 16));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;

    if (v8)
    {
      uint64_t v7 = NSErrorF();
      v8[2](v8, v7);
    }
    [*(id *)(a1 + 32) _invalidated];
  }
}

- (void)contextMonitorContextChanged:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  contextChangeHandler = (void (**)(id, id))self->_contextChangeHandler;
  if (contextChangeHandler)
  {
    contextChangeHandler[2](contextChangeHandler, v5);
  }
  else if (gLogCategory_SPContextMonitor <= 30 {
         && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)contextSignalUpdated:(id)a3 fusedState:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  contextSignalUpdatedHandler = (void (**)(id, void, id))self->_contextSignalUpdatedHandler;
  if (contextSignalUpdatedHandler)
  {
    contextSignalUpdatedHandler[2](contextSignalUpdatedHandler, v4, v7);
  }
  else if (gLogCategory_SPContextMonitor <= 30 {
         && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SPContextMonitor <= 50
      && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      id v8 = (void (**)(id, void *))MEMORY[0x2611792B0](self->_activateCompletion, a2);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0;

      if (v8)
      {
        uint64_t v4 = NSErrorF();
        v8[2](v8, v4);
      }
      id v5 = (void (**)(void))MEMORY[0x2611792B0](self->_invalidationHandler);
      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      if (v5) {
        v5[2](v5);
      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_SPContextMonitor <= 10
        && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (BOOL)isSystemContext
{
  if (isSystemContext_once != -1) {
    dispatch_once(&isSystemContext_once, &__block_literal_global_38);
  }
  return isSystemContext_result;
}

void __35__SPContextMonitor_isSystemContext__block_invoke()
{
  isSystemContext_result = 0;
}

- (void)_reportError:(id)a3
{
  id v6 = a3;
  if (gLogCategory_SPContextMonitor <= 90
    && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2611792B0](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v6);
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

- (id)contextChangeHandler
{
  return self->_contextChangeHandler;
}

- (void)setContextChangeHandler:(id)a3
{
}

- (id)contextSignalUpdatedHandler
{
  return self->_contextSignalUpdatedHandler;
}

- (void)setContextSignalUpdatedHandler:(id)a3
{
}

- (unsigned)contextChangeFlags
{
  return self->_contextChangeFlags;
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
  objc_storeStrong(&self->_contextSignalUpdatedHandler, 0);
  objc_storeStrong(&self->_contextChangeHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end