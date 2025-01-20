@interface SpatialAudioClient
+ (BOOL)supportsSecureCoding;
- (OS_dispatch_queue)dispatchQueue;
- (SpatialAudioClient)init;
- (SpatialAudioClient)initWithCoder:(id)a3;
- (id)_ensureXPCStarted;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_fetchSpatialSoundProfileRecordWithCompletion:(id)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)fetchSpatialSoundProfileRecordWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation SpatialAudioClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SpatialAudioClient)initWithCoder:(id)a3
{
  v3 = [(SpatialAudioClient *)self init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (SpatialAudioClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SpatialAudioClient;
  v2 = [(SpatialAudioClient *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (void)fetchSpatialSoundProfileRecordWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__SpatialAudioClient_fetchSpatialSoundProfileRecordWithCompletion___block_invoke;
  v7[3] = &unk_26551F7F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __67__SpatialAudioClient_fetchSpatialSoundProfileRecordWithCompletion___block_invoke(uint64_t a1)
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  id v10 = 0;
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  v5 = __67__SpatialAudioClient_fetchSpatialSoundProfileRecordWithCompletion___block_invoke_1;
  id v6 = &unk_26551F7C8;
  id v8 = v9;
  id v7 = *(id *)(a1 + 40);
  v2 = (void (**)(void))MEMORY[0x2611D1610](&v3);
  objc_msgSend(*(id *)(a1 + 32), "_fetchSpatialSoundProfileRecordWithCompletion:", *(void *)(a1 + 40), v3, v4, v5, v6);
  v2[2](v2);

  _Block_object_dispose(v9, 8);
}

uint64_t __67__SpatialAudioClient_fetchSpatialSoundProfileRecordWithCompletion___block_invoke_1(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_SpatialAudioClient <= 90
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

- (void)_fetchSpatialSoundProfileRecordWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_invalidateCalled)
  {
    v5 = NSErrorF();
    if (gLogCategory_SpatialAudioClient <= 90
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SpatialAudioClient <= 30
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = [(SpatialAudioClient *)self _ensureXPCStarted];
    if (!v5)
    {
      xpcCnx = self->_xpcCnx;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __68__SpatialAudioClient__fetchSpatialSoundProfileRecordWithCompletion___block_invoke;
      v9[3] = &unk_26551F818;
      id v7 = v4;
      id v10 = v7;
      id v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v9];
      [v8 fetchSpatialSoundProfileRecordForClient:self WithCompletion:v7];

      goto LABEL_14;
    }
  }
  if (v4) {
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v5);
  }
LABEL_14:
}

uint64_t __68__SpatialAudioClient__fetchSpatialSoundProfileRecordWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (gLogCategory_SpatialAudioClient <= 90
    && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
  return MEMORY[0x270F9A790]();
}

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.SpatialAudioXPCService"];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270B0BBB0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__SpatialAudioClient__ensureXPCStarted__block_invoke;
    v9[3] = &unk_26551F840;
    void v9[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v9];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__SpatialAudioClient__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_26551F840;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v8];
    id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270B0BC10];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  return 0;
}

uint64_t __39__SpatialAudioClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __39__SpatialAudioClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SpatialAudioClient <= 50
    && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    id v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SpatialAudioClient_invalidate__block_invoke;
  block[3] = &unk_26551F840;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__SpatialAudioClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8) = 1;
    if (!*(unsigned char *)(*(void *)(result + 32) + 9)
      && gLogCategory_SpatialAudioClient <= 30
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(id **)(v2 + 32);
    if (v3[2])
    {
      [v3[2] invalidate];
      uint64_t v3 = *(id **)(v2 + 32);
    }
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SpatialAudioClient <= 50
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      id v6 = (void (**)(void))MEMORY[0x2611D1610](self->_invalidationHandler, a2);
      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      if (v6) {
        v6[2](v6);
      }
      id interruptionHandler = self->_interruptionHandler;
      self->_id interruptionHandler = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_SpatialAudioClient <= 10
        && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
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

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end