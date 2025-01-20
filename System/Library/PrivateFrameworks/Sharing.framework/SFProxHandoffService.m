@interface SFProxHandoffService
- (OS_dispatch_queue)dispatchQueue;
- (SFProxHandoffService)init;
- (id)description;
- (void)_activateWithCompletion:(id)a3;
- (void)_activated;
- (void)_cleanup;
- (void)_completedWithError:(id)a3;
- (void)_serviceStart;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
@end

@implementation SFProxHandoffService

- (SFProxHandoffService)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFProxHandoffService;
  v2 = [(SFProxHandoffService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFProxHandoffService *)FatalErrorF();
    [(SFProxHandoffService *)v3 description];
  }
  else
  {
    [(SFProxHandoffService *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFProxHandoffService;
    [(SFProxHandoffService *)&v5 dealloc];
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"SFProxHandoffService"];
  if (self->_activateCalled)
  {
    SEL v4 = @", activated";
  }
  else
  {
    if (!self->_invalidateCalled) {
      goto LABEL_6;
    }
    SEL v4 = @", invalidated";
  }
  [v3 appendString:v4];
LABEL_6:
  if (self->_service) {
    [v3 appendFormat:@", %@", self->_service];
  }

  return v3;
}

- (void)_cleanup
{
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  self->_serviceState = 0;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SFProxHandoffService_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __47__SFProxHandoffService_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id aBlock = a3;
  if (gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_activateCalled = 1;
  id v4 = _Block_copy(aBlock);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = v4;

  [(SFProxHandoffService *)self _serviceStart];
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int serviceState = self->_serviceState;
  BOOL v4 = serviceState == 4 || serviceState == 2;
  if (v4 && self->_service)
  {
    if (gLogCategory_SFProxHandoffService <= 30
      && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id activateCompletion = (void (**)(id, void))self->_activateCompletion;
    if (activateCompletion)
    {
      activateCompletion[2](activateCompletion, 0);
      id activateCompletion = (void (**)(id, void))self->_activateCompletion;
    }
    self->_id activateCompletion = 0;
  }
  else if (gLogCategory_SFProxHandoffService <= 30 {
         && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SFProxHandoffService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__SFProxHandoffService_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24)
    && gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  BOOL v4 = *(void **)(a1 + 32);

  return [v4 _cleanup];
}

- (void)_completedWithError:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    if (gLogCategory_SFProxHandoffService <= 60)
    {
      id v6 = v3;
      if (gLogCategory_SFProxHandoffService != -1 || (v5 = _LogCategory_Initialize(), BOOL v4 = v6, v5))
      {
        LogPrintF();
        BOOL v4 = v6;
      }
    }
  }
}

- (void)_serviceStart
{
  if (!self->_service)
  {
    if (gLogCategory_SFProxHandoffService <= 30
      && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int serviceState = 1;
    id v3 = objc_alloc_init(SFService);
    service = self->_service;
    self->_service = v3;

    [(SFService *)self->_service setAdvertiseRate:50];
    [(SFService *)self->_service setDispatchQueue:self->_dispatchQueue];
    [(SFService *)self->_service setIdentifier:@"com.apple.sharing.ProxHandoff"];
    [(SFService *)self->_service setLabel:@"HandoffService"];
    [(SFService *)self->_service setSessionFlags:512];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__SFProxHandoffService__serviceStart__block_invoke;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(SFService *)self->_service setInterruptionHandler:v7];
    [(SFService *)self->_service setInvalidationHandler:&__block_literal_global_35];
    [(SFService *)self->_service setSessionEndedHandler:&__block_literal_global_156];
    [(SFService *)self->_service setSessionStartedHandler:&__block_literal_global_160];
    [(SFService *)self->_service setSessionSecuredHandler:&__block_literal_global_163];
    int v5 = self->_service;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__SFProxHandoffService__serviceStart__block_invoke_6;
    v6[3] = &unk_1E5BBC8E8;
    v6[4] = self;
    [(SFService *)v5 activateWithCompletion:v6];
  }
}

uint64_t __37__SFProxHandoffService__serviceStart__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

void __37__SFProxHandoffService__serviceStart__block_invoke_2()
{
  if (gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __37__SFProxHandoffService__serviceStart__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  if (gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    int v5 = [v6 peer];
    LogPrintF();
  }
}

void __37__SFProxHandoffService__serviceStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_SFProxHandoffService <= 30)
  {
    id v6 = v2;
    if (gLogCategory_SFProxHandoffService != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      int v5 = [v3 peer];
      LogPrintF();

      id v3 = v6;
    }
  }
}

void __37__SFProxHandoffService__serviceStart__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_SFProxHandoffService <= 30)
  {
    id v6 = v2;
    if (gLogCategory_SFProxHandoffService != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      int v5 = [v3 peer];
      LogPrintF();

      id v3 = v6;
    }
  }
}

void __37__SFProxHandoffService__serviceStart__block_invoke_6(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFProxHandoffService <= 90
      && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 40) = 3;
    id v3 = *(void **)(a1 + 32);
    int v4 = NSErrorWithOSStatusF();
    [v3 _completedWithError:v4];
  }
  else
  {
    if (gLogCategory_SFProxHandoffService <= 30
      && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 40) = 4;
    [*(id *)(a1 + 32) _activated];
  }
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
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end