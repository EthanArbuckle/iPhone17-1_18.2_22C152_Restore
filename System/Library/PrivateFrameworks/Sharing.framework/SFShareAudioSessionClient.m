@interface SFShareAudioSessionClient
+ (BOOL)supportsSecureCoding;
- (OS_dispatch_queue)dispatchQueue;
- (SFShareAudioSessionClient)init;
- (SFShareAudioSessionClient)initWithCoder:(id)a3;
- (id)progressHandler;
- (void)_activate:(BOOL)a3;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)shareAudioProgressEvent:(int)a3 info:(id)a4;
- (void)userConfirmed;
@end

@implementation SFShareAudioSessionClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShareAudioSessionClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFShareAudioSessionClient;
  v2 = [(SFShareAudioSessionClient *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (SFShareAudioSessionClient)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFShareAudioSessionClient;
  v3 = [(SFShareAudioSessionClient *)&v9 init];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = SFMainQueue(v3);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = v4;
  }

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFShareAudioSessionClient_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFShareAudioSessionClient_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    return [*(id *)(result + 32) _activate:0];
  }
  return result;
}

- (void)_activate:(BOOL)a3
{
  if (a3)
  {
    if (gLogCategory_SFShareAudioSessionClient <= 30
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFShareAudioSessionClient <= 30 {
         && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  [(SFShareAudioSessionClient *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__SFShareAudioSessionClient__activate___block_invoke;
  v9[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  BOOL v10 = a3;
  v6 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SFShareAudioSessionClient__activate___block_invoke_2;
  v7[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  BOOL v8 = a3;
  [v6 shareAudioSessionActivate:self completion:v7];
}

void __39__SFShareAudioSessionClient__activate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32))
  {
    if (gLogCategory_SFShareAudioSessionClient <= 90)
    {
      if (gLogCategory_SFShareAudioSessionClient != -1 || (v7 = v3, int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        id v6 = v3;
        LogPrintF();
        id v3 = v6;
      }
    }
  }
  else if (gLogCategory_SFShareAudioSessionClient <= 90)
  {
    if (gLogCategory_SFShareAudioSessionClient != -1) {
      goto LABEL_7;
    }
    id v8 = v3;
    int v5 = _LogCategory_Initialize();
    id v3 = v8;
    if (v5) {
      goto LABEL_7;
    }
  }
}

void __39__SFShareAudioSessionClient__activate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 32))
    {
      if (gLogCategory_SFShareAudioSessionClient <= 90)
      {
        id v9 = v3;
        if (gLogCategory_SFShareAudioSessionClient != -1 || (v5 = _LogCategory_Initialize(), int v4 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          int v4 = v9;
        }
      }
    }
    else if (gLogCategory_SFShareAudioSessionClient <= 90)
    {
      id v9 = v3;
      if (gLogCategory_SFShareAudioSessionClient != -1) {
        goto LABEL_15;
      }
      int v7 = _LogCategory_Initialize();
      int v4 = v9;
      if (v7) {
        goto LABEL_15;
      }
    }
  }
  else if (*(unsigned char *)(a1 + 32))
  {
    if (gLogCategory_SFShareAudioSessionClient <= 30)
    {
      id v9 = 0;
      if (gLogCategory_SFShareAudioSessionClient != -1) {
        goto LABEL_15;
      }
      int v6 = _LogCategory_Initialize();
      int v4 = 0;
      if (v6) {
        goto LABEL_15;
      }
    }
  }
  else if (gLogCategory_SFShareAudioSessionClient <= 30)
  {
    id v9 = 0;
    if (gLogCategory_SFShareAudioSessionClient != -1) {
      goto LABEL_15;
    }
    int v8 = _LogCategory_Initialize();
    int v4 = 0;
    if (v8) {
      goto LABEL_15;
    }
  }
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA125E0];
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    [v16 setClasses:v14 forSelector:sel_shareAudioProgressEvent_info_ argumentIndex:1 ofReply:0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v16];
    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__SFShareAudioSessionClient__ensureXPCStarted__block_invoke;
    v18[3] = &unk_1E5BBC870;
    v18[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v18];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__SFShareAudioSessionClient__ensureXPCStarted__block_invoke_2;
    v17[3] = &unk_1E5BBC870;
    v17[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v17];
    v15 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39860];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v15];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFShareAudioSessionClient <= 30
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __46__SFShareAudioSessionClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __46__SFShareAudioSessionClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  int v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_SFShareAudioSessionClient <= 50
    && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = _Block_copy(self->_progressHandler);
  int v4 = v3;
  if (v3) {
    (*((void (**)(void *, uint64_t, void))v3 + 2))(v3, 30, 0);
  }

  if (self->_activateCalled)
  {
    [(SFShareAudioSessionClient *)self _activate:1];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFShareAudioSessionClient_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFShareAudioSessionClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 9) = 1;
    if (gLogCategory_SFShareAudioSessionClient <= 30
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(v2 + 32) + 16) invalidate];
    id v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFShareAudioSessionClient <= 50
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      id v3 = _Block_copy(self->_progressHandler);
      int v4 = v3;
      if (v3) {
        (*((void (**)(void *, uint64_t, void))v3 + 2))(v3, 20, 0);
      }

      id progressHandler = self->_progressHandler;
      self->_id progressHandler = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_SFShareAudioSessionClient <= 10
        && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)userConfirmed
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SFShareAudioSessionClient_userConfirmed__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __42__SFShareAudioSessionClient_userConfirmed__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    if (gLogCategory_SFShareAudioSessionClient <= 30
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
    [v2 shareAudioUserConfirmed];
  }
  else if (gLogCategory_SFShareAudioSessionClient <= 90 {
         && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)shareAudioProgressEvent:(int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFShareAudioSessionClient <= 30
    && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v6 = _Block_copy(self->_progressHandler);
  uint64_t v7 = v6;
  if (v6) {
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, v4, v8);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end