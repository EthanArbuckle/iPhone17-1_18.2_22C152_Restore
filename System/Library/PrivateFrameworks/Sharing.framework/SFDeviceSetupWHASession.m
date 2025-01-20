@interface SFDeviceSetupWHASession
- (BOOL)_verifyiCloudMatch:(unint64_t)a3 error:(id *)a4;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SFDeviceSetupWHASession)init;
- (UIViewController)presentingViewController;
- (id)progressHandler;
- (id)promptForHomeHandler;
- (id)promptForPINHandler;
- (id)promptForRoomHandler;
- (int)_runCDPSetup;
- (int)_runFinish;
- (int)_runHomeKitSetup;
- (int)_runInfoExchange;
- (int)_runPairSetup;
- (int)_runPairVerify;
- (int)_runSFSessionStart;
- (int)_runTRAuthentication;
- (int)_runTRSessionStart;
- (int)_runTRSetupConfiguration;
- (void)_cleanup;
- (void)_reportError:(id)a3;
- (void)_run;
- (void)_runInfoExchangeRequest;
- (void)_runInfoExchangeResponse:(id)a3 error:(id)a4;
- (void)activate;
- (void)dealloc;
- (void)homeKitSelectHome:(id)a3;
- (void)homeKitSelectRoom:(id)a3;
- (void)invalidate;
- (void)pairSetupTryPIN:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForHomeHandler:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setPromptForRoomHandler:(id)a3;
@end

@implementation SFDeviceSetupWHASession

- (SFDeviceSetupWHASession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupWHASession;
  v2 = [(SFDeviceSetupWHASession *)&v7 init];
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
    v3 = (SFDeviceSetupWHASession *)FatalErrorF();
    [(SFDeviceSetupWHASession *)v3 _cleanup];
  }
  else
  {
    [(SFDeviceSetupWHASession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupWHASession;
    [(SFDeviceSetupWHASession *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(TROperationQueue *)self->_trOperationQueue invalidate];
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  SEL v4 = self->_trOperations;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "cancel", (void)v21);
        [v9 setCompletionBlock:0];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_trOperations removeAllObjects];
  trOperations = self->_trOperations;
  self->_trOperations = 0;

  trSession = self->_trSession;
  self->_trSession = 0;

  [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation invalidate];
  cdpSetupOperation = self->_cdpSetupOperation;
  self->_cdpSetupOperation = 0;

  [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetup invalidate];
  homeKitSetup = self->_homeKitSetup;
  self->_homeKitSetup = 0;

  [(SFSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    id v16 = self->_progressHandler;
  }
  else
  {
    id v16 = 0;
  }
  self->_progressHandler = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

  id promptForHomeHandler = self->_promptForHomeHandler;
  self->_id promptForHomeHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;

  id promptForRoomHandler = self->_promptForRoomHandler;
  self->_id promptForRoomHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFDeviceSetupWHASession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceSetupWHASession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = CFPrefs_GetInt64() != 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 164) = CFPrefs_GetInt64() != 0;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[25];
  if (v3)
  {
    (*(void (**)(void, uint64_t, void))(v3 + 16))(v2[25], 10, 0);
    v2 = *(void **)(a1 + 32);
  }
  return [v2 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceSetupWHASession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceSetupWHASession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9)
    && gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 _cleanup];
}

- (void)homeKitSelectHome:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SFDeviceSetupWHASession_homeKitSelectHome___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __45__SFDeviceSetupWHASession_homeKitSelectHome___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) selectHome:*(void *)(a1 + 40)];
}

- (void)homeKitSelectRoom:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SFDeviceSetupWHASession_homeKitSelectRoom___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __45__SFDeviceSetupWHASession_homeKitSelectRoom___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) selectRoom:*(void *)(a1 + 40)];
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SFDeviceSetupWHASession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __43__SFDeviceSetupWHASession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) pairSetupTryPIN:*(void *)(a1 + 40)];
}

- (void)_reportError:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    id v14 = v6;
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v17 = @"eo";
    id v8 = v6;
    if (!v6)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28760];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v3 = (void *)v11;
      v12 = @"?";
      if (v11) {
        v12 = (__CFString *)v11;
      }
      id v16 = v12;
      id v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1, v14);
      id v8 = [v9 errorWithDomain:v10 code:-6700 userInfo:v4];
    }
    v18[0] = v8;
    v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1, v14, v15);
    progressHandler[2](progressHandler, 30, v13);

    if (!v6)
    {
    }
  }
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    int v3 = [(SFDeviceSetupWHASession *)self _runSFSessionStart];
    if (v3 == 4 || v3 == 2)
    {
      int v4 = [(SFDeviceSetupWHASession *)self _runPairVerify];
      if (v4 == 4 || v4 == 2)
      {
        if (self->_sessionSecured
          || (int v11 = [(SFDeviceSetupWHASession *)self _runPairSetup], v11 == 4)
          || v11 == 2)
        {
          int v5 = [(SFDeviceSetupWHASession *)self _runInfoExchange];
          if (v5 == 4 || v5 == 2)
          {
            int v6 = [(SFDeviceSetupWHASession *)self _runTRSessionStart];
            if (v6 == 4 || v6 == 2)
            {
              if (!self->_trSetupConfigurationEnabled
                || (int v7 = [(SFDeviceSetupWHASession *)self _runTRSetupConfiguration], v7 == 4)
                || v7 == 2)
              {
                if (!self->_trAuthenticationEnabled
                  || (int v8 = [(SFDeviceSetupWHASession *)self _runTRAuthentication], v8 == 4)
                  || v8 == 2)
                {
                  int v9 = [(SFDeviceSetupWHASession *)self _runHomeKitSetup];
                  if (v9 == 4 || v9 == 2)
                  {
                    if (!self->_cdpEnabled
                      || (self->_peerProblemsFlags & 0x20000) == 0
                      || (int v10 = [(SFDeviceSetupWHASession *)self _runCDPSetup], v10 == 4)
                      || v10 == 2)
                    {
                      [(SFDeviceSetupWHASession *)self _runFinish];
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (int)_runSFSessionStart
{
  int sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int sfSessionState = 1;
      [(SFSession *)self->_sfSession invalidate];
      int v4 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v4;

      [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
      [(SFSession *)self->_sfSession setLabel:@"WHASetup"];
      [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
      [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.WHASetup"];
      [(SFSession *)self->_sfSession setSessionFlags:1];
      [(SFSession *)self->_sfSession setTouchRemoteEnabled:1];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke;
      v11[3] = &unk_1E5BBC8E8;
      v11[4] = self;
      [(SFSession *)self->_sfSession setErrorHandler:v11];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_2;
      v10[3] = &unk_1E5BBC870;
      v10[4] = self;
      [(SFSession *)self->_sfSession setInterruptionHandler:v10];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_3;
      v9[3] = &unk_1E5BBC870;
      v9[4] = self;
      [(SFSession *)self->_sfSession setInvalidationHandler:v9];
      if (self->_promptForPINHandler) {
        -[SFSession setPromptForPINHandler:](self->_sfSession, "setPromptForPINHandler:");
      }
      int v6 = self->_sfSession;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_4;
      v8[3] = &unk_1E5BBC8E8;
      v8[4] = self;
      [(SFSession *)v6 activateWithCompletion:v8];
    }
  }
  return self->_sfSessionState;
}

void __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_SFDeviceSetupWHASession <= 60)
  {
    if (gLogCategory_SFDeviceSetupWHASession != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);
}

void __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F28760];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  uint64_t v4 = [NSString stringWithUTF8String:DebugGetErrorString()];
  id v5 = (void *)v4;
  id v6 = @"?";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  v10[0] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v8 = [v2 errorWithDomain:v3 code:-6762 userInfo:v7];
  [v1 _reportError:v8];
}

void __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[9])
  {
    v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *MEMORY[0x1E4F28760];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    uint64_t v4 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v5 = (void *)v4;
    id v6 = @"?";
    if (v4) {
      id v6 = (__CFString *)v4;
    }
    v10[0] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    int v8 = [v2 errorWithDomain:v3 code:-6736 userInfo:v7];
    [v1 _reportError:v8];
  }
}

uint64_t __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    *(_DWORD *)(v2 + 24) = 3;
    return [*(id *)(a1 + 32) _reportError:a2];
  }
  else
  {
    *(_DWORD *)(v2 + 24) = 4;
    return [*(id *)(a1 + 32) _run];
  }
}

- (int)_runPairVerify
{
  int pairVerifyState = self->_pairVerifyState;
  if (pairVerifyState != 4)
  {
    if (pairVerifyState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      self->_int pairVerifyState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 60, 0);
      }
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __41__SFDeviceSetupWHASession__runPairVerify__block_invoke;
      v7[3] = &unk_1E5BBC8E8;
      v7[4] = self;
      [(SFSession *)sfSession pairVerifyWithFlags:8 completion:v7];
    }
  }
  return self->_pairVerifyState;
}

void __41__SFDeviceSetupWHASession__runPairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = a1 + 32;
    *(_DWORD *)(v4 + 32) = 2;
    goto LABEL_13;
  }
  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v3 = a1 + 32;
  *(unsigned char *)(v5 + 28) = 1;
  *(_DWORD *)(*(void *)v3 + 32) = 4;
  id v6 = *(void **)v3;
  uint64_t v7 = *(void *)(*(void *)v3 + 200);
  if (v7)
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))(*(void *)(*(void *)v3 + 200), 70, 0);
LABEL_13:
    id v6 = *(void **)v3;
  }
  [v6 _run];
}

- (int)_runPairSetup
{
  int pairSetupState = self->_pairSetupState;
  if (pairSetupState != 4)
  {
    if (pairSetupState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      self->_int pairSetupState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 60, 0);
      }
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __40__SFDeviceSetupWHASession__runPairSetup__block_invoke;
      v7[3] = &unk_1E5BBC8E8;
      v7[4] = self;
      [(SFSession *)sfSession pairSetupWithFlags:8 completion:v7];
    }
  }
  return self->_pairSetupState;
}

void __40__SFDeviceSetupWHASession__runPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  if (v3)
  {
    *(_DWORD *)(v4 + 36) = 3;
    [*(id *)(a1 + 32) _reportError:v3];
  }
  else
  {
    *(unsigned char *)(v4 + 28) = 1;
    *(_DWORD *)(*(void *)(a1 + 32) + 36) = 4;
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[25];
    if (v6)
    {
      (*(void (**)(void, uint64_t, void))(v6 + 16))(v5[25], 70, 0);
      uint64_t v5 = *(void **)(a1 + 32);
    }
    [v5 _run];
  }
}

- (int)_runInfoExchange
{
  int infoExchangeState = self->_infoExchangeState;
  if (infoExchangeState != 4 && infoExchangeState != 2)
  {
    if (infoExchangeState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int infoExchangeState = 1;
      [(SFDeviceSetupWHASession *)self _runInfoExchangeRequest];
    }
  }
  return self->_infoExchangeState;
}

- (void)_runInfoExchangeRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    id v5 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SFDeviceSetupWHASession__runInfoExchangeRequest__block_invoke;
  v6[3] = &unk_1E5BBCBF8;
  v6[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_info", 0, v3, v6, v5 options request responseHandler];
}

uint64_t __50__SFDeviceSetupWHASession__runInfoExchangeRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runInfoExchangeResponse:a4 error:a2];
}

- (void)_runInfoExchangeResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  int v13 = 0;
  if (v6 && !v7)
  {
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      id v11 = v6;
      LogPrintF();
    }
    id v12 = 0;
    BOOL v10 = [(SFDeviceSetupWHASession *)self _verifyiCloudMatch:CFDictionaryGetInt64() error:&v12];
    id v9 = v12;
    if (v10)
    {
      self->_peerFeatureFlags = CFDictionaryGetInt64();
      self->_peerProblemsFlags = CFDictionaryGetInt64();
      self->_int infoExchangeState = 4;
      [(SFDeviceSetupWHASession *)self _run];
LABEL_14:

      goto LABEL_15;
    }
    self->_int infoExchangeState = 3;
LABEL_13:
    -[SFDeviceSetupWHASession _reportError:](self, "_reportError:", v9, v11);
    goto LABEL_14;
  }
  self->_int infoExchangeState = 3;
  if (!v7)
  {
    NSErrorWithOSStatusF();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  [(SFDeviceSetupWHASession *)self _reportError:v7];
LABEL_15:
}

- (int)_runTRSessionStart
{
  v19[1] = *MEMORY[0x1E4F143B8];
  int trSessionState = self->_trSessionState;
  if (trSessionState == 4) {
    return self->_trSessionState;
  }
  if (!trSessionState)
  {
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int trSessionState = 1;
    uint64_t v4 = [(SFSession *)self->_sfSession trSession];
    trSession = self->_trSession;
    self->_trSession = v4;

    if (self->_trSession)
    {
      id v6 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass_3[0]());
      trOperationQueue = self->_trOperationQueue;
      self->_trOperationQueue = v6;

      if (self->_trOperationQueue)
      {
        id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        trOperations = self->_trOperations;
        self->_trOperations = v8;

        self->_int trSessionState = 4;
        return self->_trSessionState;
      }
      if (gLogCategory_SFDeviceSetupWHASession > 90
        || gLogCategory_SFDeviceSetupWHASession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_25;
      }
    }
    else if (gLogCategory_SFDeviceSetupWHASession > 90 {
           || gLogCategory_SFDeviceSetupWHASession == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_25;
    }
    LogPrintF();
LABEL_25:
    self->_int trSessionState = 3;
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28760];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    uint64_t v13 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v14 = (void *)v13;
    uint64_t v15 = @"?";
    if (v13) {
      uint64_t v15 = (__CFString *)v13;
    }
    v19[0] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v17 = [v11 errorWithDomain:v12 code:-6700 userInfo:v16];
    [(SFDeviceSetupWHASession *)self _reportError:v17];

    return self->_trSessionState;
  }
  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_trSessionState;
}

- (int)_runTRSetupConfiguration
{
  int trSetupConfigurationState = self->_trSetupConfigurationState;
  if (trSetupConfigurationState != 4)
  {
    if (trSetupConfigurationState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trSetupConfigurationState = 1;
      uint64_t v4 = (void *)[objc_alloc((Class)getTRSetupConfigurationOperationClass_0[0]()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v4];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __51__SFDeviceSetupWHASession__runTRSetupConfiguration__block_invoke;
      v7[3] = &unk_1E5BBBD18;
      v7[4] = self;
      id v8 = v4;
      id v5 = v4;
      [v5 setCompletionBlock:v7];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v5];
    }
  }
  return self->_trSetupConfigurationState;
}

void __51__SFDeviceSetupWHASession__runTRSetupConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 176);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__SFDeviceSetupWHASession__runTRSetupConfiguration__block_invoke_2;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __51__SFDeviceSetupWHASession__runTRSetupConfiguration__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    id v7 = [*(id *)(a1 + 40) result];
    if (v7)
    {
      getTRSetupConfigurationOperationUnauthenticatedServicesKey_0[0]();
      CFSetGetTypeID();
      uint64_t v2 = CFDictionaryGetTypedValue();
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 104);
      *(void *)(v3 + 104) = v2;

      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        id v6 = *(void **)(*(void *)(a1 + 32) + 104);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 100) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v6);
    }
    else
    {
      id v5 = [*(id *)(a1 + 40) error];
      if (gLogCategory_SFDeviceSetupWHASession <= 60
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        id v6 = v5;
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 100) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v5, v6);
    }
  }
}

- (int)_runTRAuthentication
{
  int trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState != 4)
  {
    if (trAuthenticationState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trAuthenticationState = 1;
      id v4 = (void *)[objc_alloc((Class)getTRAuthenticationOperationClass_2[0]()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v4];
      [v4 setTargetedServices:self->_trUnauthServices];
      if (self->_presentingViewController) {
        objc_msgSend(v4, "setPresentingViewController:");
      }
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __47__SFDeviceSetupWHASession__runTRAuthentication__block_invoke;
      v7[3] = &unk_1E5BBBD18;
      v7[4] = self;
      id v8 = v4;
      id v5 = v4;
      [v5 setCompletionBlock:v7];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v5];
    }
  }
  return self->_trAuthenticationState;
}

void __47__SFDeviceSetupWHASession__runTRAuthentication__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 176);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__SFDeviceSetupWHASession__runTRAuthentication__block_invoke_2;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __47__SFDeviceSetupWHASession__runTRAuthentication__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    id v4 = [*(id *)(a1 + 40) result];
    if (v4)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 116) = 4;
      [*(id *)(a1 + 32) _run];
    }
    else
    {
      uint64_t v2 = [*(id *)(a1 + 40) error];
      if (gLogCategory_SFDeviceSetupWHASession <= 60
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v3 = v2;
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 116) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v2, v3);
    }
  }
}

- (int)_runCDPSetup
{
  int cdpState = self->_cdpState;
  if (cdpState != 4)
  {
    if (cdpState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int cdpState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 236, 0);
      }
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation invalidate];
      id v5 = objc_alloc_init(SFDeviceOperationCDPSetup);
      cdpSetupOperation = self->_cdpSetupOperation;
      self->_cdpSetupOperation = v5;

      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setSfSession:self->_sfSession];
      if (self->_presentingViewController) {
        -[SFDeviceOperationCDPSetup setPresentingViewController:](self->_cdpSetupOperation, "setPresentingViewController:");
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __39__SFDeviceSetupWHASession__runCDPSetup__block_invoke;
      v8[3] = &unk_1E5BBC8E8;
      v8[4] = self;
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setCompletionHandler:v8];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation activate];
    }
  }
  return self->_cdpState;
}

void __39__SFDeviceSetupWHASession__runCDPSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 128);
  if (v5)
  {
    id v10 = v3;
    if (v3)
    {
      *(_DWORD *)(v4 + 144) = 3;
      id v6 = *(void **)(a1 + 32);
      id v7 = SFNestedErrorF();
      [v6 _reportError:v7];
    }
    else
    {
      [v5 metricSeconds];
      *(void *)(*(void *)(a1 + 32) + 136) = v8;
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 136);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 144) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v9);
    }
    id v3 = v10;
  }
}

- (int)_runHomeKitSetup
{
  int homeKitState = self->_homeKitState;
  if (homeKitState != 4)
  {
    if (homeKitState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int homeKitState = 1;
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetup invalidate];
      uint64_t v4 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      homeKitSetup = self->_homeKitSetup;
      self->_homeKitSetup = v4;

      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetup setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetup setUserInteractive:1];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetup setTrSession:self->_trSession];
      if (self->_homeKitDoFullSetup)
      {
        if (self->_promptForHomeHandler) {
          -[SFDeviceOperationHomeKitSetup setPromptForHomeHandler:](self->_homeKitSetup, "setPromptForHomeHandler:");
        }
        if (self->_promptForRoomHandler) {
          -[SFDeviceOperationHomeKitSetup setPromptForRoomHandler:](self->_homeKitSetup, "setPromptForRoomHandler:");
        }
      }
      else
      {
        [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetup setKeyExchangeOnly:1];
      }
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __43__SFDeviceSetupWHASession__runHomeKitSetup__block_invoke;
      v7[3] = &unk_1E5BBC8E8;
      v7[4] = self;
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetup setCompletionHandler:v7];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetup activate];
    }
  }
  return self->_homeKitState;
}

void __43__SFDeviceSetupWHASession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 152);
  if (v5)
  {
    id v13 = v3;
    if (v3)
    {
      if ((*(unsigned char *)(v4 + 49) & 2) == 0)
      {
        *(_DWORD *)(v4 + 160) = 3;
        [*(id *)(a1 + 32) _reportError:v3];
LABEL_16:
        id v3 = v13;
        goto LABEL_17;
      }
      if (gLogCategory_SFDeviceSetupWHASession > 90) {
        goto LABEL_14;
      }
      if (gLogCategory_SFDeviceSetupWHASession == -1)
      {
        int v10 = _LogCategory_Initialize();
        uint64_t v4 = *(void *)(a1 + 32);
        if (!v10) {
          goto LABEL_14;
        }
        id v5 = *(void **)(v4 + 152);
      }
      [v5 metricNonUserSeconds];
      id v12 = v13;
      uint64_t v11 = v7;
      LogPrintF();
      uint64_t v4 = *(void *)(a1 + 32);
LABEL_14:
      int v9 = 2;
      goto LABEL_15;
    }
    if (gLogCategory_SFDeviceSetupWHASession <= 30)
    {
      if (gLogCategory_SFDeviceSetupWHASession == -1)
      {
        int v8 = _LogCategory_Initialize();
        uint64_t v4 = *(void *)(a1 + 32);
        if (!v8) {
          goto LABEL_12;
        }
        id v5 = *(void **)(v4 + 152);
      }
      [v5 metricNonUserSeconds];
      uint64_t v11 = v6;
      LogPrintF();
      uint64_t v4 = *(void *)(a1 + 32);
    }
LABEL_12:
    int v9 = 4;
LABEL_15:
    *(_DWORD *)(v4 + 160) = v9;
    objc_msgSend(*(id *)(a1 + 32), "_run", v11, v12);
    goto LABEL_16;
  }
LABEL_17:
}

- (int)_runFinish
{
  int result = self->_finishState;
  if (!result)
  {
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_finishState = 1;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 setObject:&unk_1EFA097E8 forKeyedSubscript:@"op"];
    sfSession = self->_sfSession;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__SFDeviceSetupWHASession__runFinish__block_invoke;
    v6[3] = &unk_1E5BBE630;
    v6[4] = self;
    [(SFSession *)sfSession sendRequestWithFlags:1 object:v4 responseHandler:v6];
    self->_finishState = 4;

    return self->_finishState;
  }
  return result;
}

void __37__SFDeviceSetupWHASession__runFinish__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    goto LABEL_19;
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!Int64Ranged) {
    goto LABEL_20;
  }
  int v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28760];
  uint64_t v11 = Int64Ranged;
  uint64_t v17 = *MEMORY[0x1E4F28568];
  uint64_t v12 = [NSString stringWithUTF8String:DebugGetErrorString()];
  id v13 = (void *)v12;
  id v14 = @"?";
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  v18[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v6 = [v9 errorWithDomain:v10 code:v11 userInfo:v15];

  if (v6)
  {
LABEL_19:
    if (gLogCategory_SFDeviceSetupWHASession <= 50
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      id v16 = v6;
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 168) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v6, v16, v17);
  }
  else
  {
LABEL_20:
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(a1 + 32) _cleanup];
  }
}

- (BOOL)_verifyiCloudMatch:(unint64_t)a3 error:(id *)a4
{
  SFMyAltDSID();
  id v7 = objc_claimAutoreleasedReturnValue();
  int v8 = (const char *)[v7 UTF8String];

  if (v8
    && ([(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"AltDSID" keyLength:16], (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = v9;
    [v10 bytes];
    strlen(v8);
    if (SipHash() == a3)
    {
      BOOL v11 = 0;
      id v12 = 0;
      goto LABEL_5;
    }
    NSErrorWithOSStatusF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSErrorWithOSStatusF();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0;
  }
  BOOL v11 = v12 != 0;
  if (a4 && v12)
  {
    id v12 = v12;
    *a4 = v12;
    BOOL v11 = 1;
  }
LABEL_5:
  BOOL v13 = !v11;

  return v13;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)promptForRoomHandler
{
  return self->_promptForRoomHandler;
}

- (void)setPromptForRoomHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForRoomHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_homeKitSetup, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_trUnauthServices, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);

  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end