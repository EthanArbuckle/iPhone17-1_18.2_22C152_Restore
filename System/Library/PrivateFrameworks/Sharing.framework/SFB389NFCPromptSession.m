@interface SFB389NFCPromptSession
- (OS_dispatch_queue)dispatchQueue;
- (SFB389NFCPromptSession)init;
- (SFB389NFCPromptSession)initWithInitialConfiguration:(id)a3;
- (id)_getRemoteObjectProxy;
- (id)errorHandler;
- (id)userResponseHandler;
- (void)_ensureXPCStarted;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setUserResponseHandler:(id)a3;
- (void)updateCardConfiguration:(id)a3;
@end

@implementation SFB389NFCPromptSession

- (SFB389NFCPromptSession)init
{
  v2 = (SFB389NFCPromptSession *)FatalErrorF();
  return [(SFB389NFCPromptSession *)v2 initWithInitialConfiguration:v4];
}

- (SFB389NFCPromptSession)initWithInitialConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFB389NFCPromptSession;
  v5 = [(SFB389NFCPromptSession *)&v11 init];
  if (v5)
  {
    uint64_t v6 = CUMainQueue();
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [v4 copy];
    config = v5->_config;
    v5->_config = (SFB389NFCPromptConfiguration *)v8;
  }
  return v5;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SFB389NFCPromptSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __34__SFB389NFCPromptSession_activate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = 1;
    if (gLogCategory_SFB389NFCPromptSession <= 30
      && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    SEL v3 = [*(id *)(a1 + 32) _getRemoteObjectProxy];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__SFB389NFCPromptSession_activate__block_invoke_2;
    v6[3] = &unk_1E5BBE228;
    v6[4] = v4;
    [v3 b389NFCPromptDidRequestPresentationWithConfiguration:v5 responseHandler:v6];
  }
}

void __34__SFB389NFCPromptSession_activate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v10 = a2;
  if (gLogCategory_SFB389NFCPromptSession <= 30
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = (void (**)(void *, id, void, double))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 40));
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    v7[2](v7, v10, a3, a4);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SFB389NFCPromptSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __36__SFB389NFCPromptSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    *(unsigned char *)(v1 + 9) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = [*(id *)(a1 + 32) _getRemoteObjectProxy];
    [v5 dismissCurrentB389NFCPrompt];

    if (gLogCategory_SFB389NFCPromptSession <= 30
      && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)dealloc
{
  if (!self->_invalidateCalled
    && gLogCategory_SFB389NFCPromptSession <= 115
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3.receiver = self;
  v3.super_class = (Class)SFB389NFCPromptSession;
  [(SFB389NFCPromptSession *)&v3 dealloc];
}

- (id)_getRemoteObjectProxy
{
  xpcCnx = self->_xpcCnx;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SFB389NFCPromptSession__getRemoteObjectProxy__block_invoke;
  v5[3] = &unk_1E5BBC8E8;
  v5[4] = self;
  objc_super v3 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v5];

  return v3;
}

void __47__SFB389NFCPromptSession__getRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (gLogCategory_SFB389NFCPromptSession <= 90
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_super v3 = (void (**)(void *, id, void, double))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 40));
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    v3[2](v3, v6, 0, -1.0);
  }
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    objc_super v3 = (objc_class *)MEMORY[0x1E4F29268];
    uint64_t v4 = self;
    uint64_t v5 = (NSXPCConnection *)[[v3 alloc] initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__SFB389NFCPromptSession__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5BBC870;
    v9[4] = v4;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__SFB389NFCPromptSession__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E5BBC870;
    v8[4] = v4;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v8];
    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA392C0];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
}

uint64_t __43__SFB389NFCPromptSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFB389NFCPromptSession <= 90
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

uint64_t __43__SFB389NFCPromptSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFB389NFCPromptSession <= 90
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (void)updateCardConfiguration:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SFB389NFCPromptSession_updateCardConfiguration___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __50__SFB389NFCPromptSession_updateCardConfiguration___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    id v3 = [v2 _getRemoteObjectProxy];
    [v3 b389NFCPromptUpdateConfiguration:*(void *)(*(void *)(a1 + 32) + 16)];
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)userResponseHandler
{
  return self->_userResponseHandler;
}

- (void)setUserResponseHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_userResponseHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end