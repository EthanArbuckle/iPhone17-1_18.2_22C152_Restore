@interface SFDeviceOperationHandlerCNJSetup
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceOperationHandlerCNJSetup)init;
- (SFSession)sfSession;
- (void)_handleCaptiveJoinRequestWithResponseHandler:(id)a3;
- (void)_handleCaptiveJoinRequestWithResponseHandler:(id)a3 reachabilityError:(id)a4;
- (void)_runReachability:(id)a3 responseHandler:(id)a4;
- (void)_updateCaptiveState;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setSfSession:(id)a3;
@end

@implementation SFDeviceOperationHandlerCNJSetup

- (SFDeviceOperationHandlerCNJSetup)init
{
  v5.receiver = self;
  v5.super_class = (Class)SFDeviceOperationHandlerCNJSetup;
  v2 = [(SFDeviceOperationHandlerCNJSetup *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_cnsNotifyToken = -1;
  }
  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 48))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = (const char *)*MEMORY[0x1E4F57E90];
    uint64_t v3 = *(void *)(v1 + 32);
    v4 = *(NSObject **)(v3 + 56);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke_2;
    handler[3] = &unk_1E5BBE120;
    handler[4] = v3;
    notify_register_dispatch(v2, (int *)(v3 + 32), v4, handler);
    [*(id *)(v1 + 32) _updateCaptiveState];
    uint64_t v5 = *(void *)(v1 + 32);
    v6 = *(void **)(v5 + 48);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke_3;
    v7[3] = &unk_1E5BBCBA8;
    v7[4] = v5;
    return [v6 registerRequestID:@"_cnj" options:0 handler:v7];
  }
  else if (gLogCategory_SFDeviceOperationCNJ <= 60)
  {
    if (gLogCategory_SFDeviceOperationCNJ != -1 || (result = _LogCategory_Initialize(), result))
    {
      return LogPrintF();
    }
  }
  return result;
}

uint64_t __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCaptiveState];
}

uint64_t __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runReachability:responseHandler:");
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFDeviceOperationHandlerCNJSetup_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __46__SFDeviceOperationHandlerCNJSetup_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 32);
  if (v3 != -1)
  {
    notify_cancel(v3);
    *(_DWORD *)(*(void *)(a1 + 32) + 32) = -1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 48) deregisterRequestID:@"_cnj"];
  [*(id *)(*(void *)(a1 + 32) + 48) deregisterRequestID:@"_cnjExtIO"];
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)_updateCaptiveState
{
  if (!self->_invalidateCalled)
  {
    if (self->_reachabilityDone || !CNUserInteractionIsRequired())
    {
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_reachabilityDone = 1;
      if (self->_responseHandler)
      {
        if (gLogCategory_SFDeviceOperationCNJ <= 30
          && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id responseHandler = self->_responseHandler;
        [(SFDeviceOperationHandlerCNJSetup *)self _handleCaptiveJoinRequestWithResponseHandler:responseHandler];
      }
    }
  }
}

- (void)_runReachability:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (self->_reachabilityDone)
  {
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFDeviceOperationHandlerCNJSetup *)self _handleCaptiveJoinRequestWithResponseHandler:v8];
  }
  else
  {
    v9 = _Block_copy(v7);
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = v9;

    id location = 0;
    objc_initWeak(&location, self);
    [(CUReachabilityMonitor *)self->_reachabilityMonitor invalidate];
    v11 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x1E4F5E1C0]);
    reachabilityMonitor = self->_reachabilityMonitor;
    self->_reachabilityMonitor = v11;

    [(CUReachabilityMonitor *)self->_reachabilityMonitor setDispatchQueue:self->_dispatchQueue];
    [(CUReachabilityMonitor *)self->_reachabilityMonitor setTimeout:60.0];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __69__SFDeviceOperationHandlerCNJSetup__runReachability_responseHandler___block_invoke;
    v16 = &unk_1E5BC0BD0;
    v17 = self;
    id v18 = v8;
    objc_copyWeak(&v19, &location);
    [(CUReachabilityMonitor *)self->_reachabilityMonitor setCompletionHandler:&v13];
    [(CUReachabilityMonitor *)self->_reachabilityMonitor activate];
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
}

void __69__SFDeviceOperationHandlerCNJSetup__runReachability_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 16) && !*(unsigned char *)(v4 + 36))
  {
    *(unsigned char *)(v4 + 36) = 1;
    id v9 = v3;
    if (v3)
    {
      if ([v3 code] != -6722
        || ([v9 domain],
            uint64_t v5 = objc_claimAutoreleasedReturnValue(),
            id v6 = (void *)*MEMORY[0x1E4F28760],
            v5,
            v5 != v6))
      {
        if (gLogCategory_SFDeviceOperationCNJ <= 30
          && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        [WeakRetained _handleCaptiveJoinRequestWithResponseHandler:*(void *)(a1 + 40) reachabilityError:v9];

        goto LABEL_22;
      }
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v8();
LABEL_22:
    id v3 = v9;
  }
}

- (void)_handleCaptiveJoinRequestWithResponseHandler:(id)a3
{
}

- (void)_handleCaptiveJoinRequestWithResponseHandler:(id)a3 reachabilityError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = (SKSetupCaptiveNetworkJoinServer *)objc_alloc_init((Class)getSKSetupCaptiveNetworkJoinServerClass[0]());
  cnjServer = self->_cnjServer;
  self->_cnjServer = v8;

  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __99__SFDeviceOperationHandlerCNJSetup__handleCaptiveJoinRequestWithResponseHandler_reachabilityError___block_invoke;
  v16 = &unk_1E5BC0B80;
  objc_copyWeak(&v17, &location);
  [(SKSetupCaptiveNetworkJoinServer *)self->_cnjServer setSendDataHandler:&v13];
  -[SKSetupCaptiveNetworkJoinServer setEventHandler:](self->_cnjServer, "setEventHandler:", &__block_literal_global_268, v13, v14, v15, v16);
  v10 = [(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"A2A772B2-84C1-447A-B978-5793FF08E513" keyLength:32];
  if (v10)
  {
    [(SKSetupCaptiveNetworkJoinServer *)self->_cnjServer setPskData:v10];
    [(SFSession *)self->_sfSession registerForExternalIO:self->_cnjServer];
    [(SKSetupCaptiveNetworkJoinServer *)self->_cnjServer activate];
    v11 = objc_opt_new();
    if (v7)
    {
      v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
      [v11 setObject:v12 forKeyedSubscript:@"re"];
    }
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v11);
  }
  else
  {
    v11 = NSErrorWithOSStatusF();
    (*((void (**)(id, void *, void, void))v6 + 2))(v6, v11, 0, 0);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __99__SFDeviceOperationHandlerCNJSetup__handleCaptiveJoinRequestWithResponseHandler_reachabilityError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [WeakRetained sfSession];
  [v4 sendExternalIO:v3];
}

void __99__SFDeviceOperationHandlerCNJSetup__handleCaptiveJoinRequestWithResponseHandler_reachabilityError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_SFDeviceOperationCNJ <= 30)
  {
    id v5 = v2;
    if (gLogCategory_SFDeviceOperationCNJ != -1 || (v4 = _LogCategory_Initialize(), id v3 = v5, v4))
    {
      LogPrintF();
      id v3 = v5;
    }
  }
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
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
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);

  objc_storeStrong((id *)&self->_cnjServer, 0);
}

@end