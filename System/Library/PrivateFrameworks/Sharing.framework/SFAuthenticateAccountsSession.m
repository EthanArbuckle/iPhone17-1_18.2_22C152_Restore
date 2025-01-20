@interface SFAuthenticateAccountsSession
+ (id)_myGameCenterAccount;
- (OS_dispatch_queue)dispatchQueue;
- (SFAuthenticateAccountsSession)init;
- (SFDevice)peerDevice;
- (UIViewController)presentingViewController;
- (id)_availableAccountsToSignIn;
- (id)_trTargetedServices;
- (id)progressHandler;
- (id)promptForPINHandler;
- (int)__validateAccountsWithAccountStore:(id)a3;
- (int)_runFinish;
- (int)_runHomeKitSetup;
- (int)_runInfoExchange;
- (int)_runPairSetup;
- (int)_runPairVerify;
- (int)_runRepairCDP;
- (int)_runSFSessionStart;
- (int)_runTRAuthentication;
- (int)_runTRSessionStart;
- (int)_validateAccounts;
- (int)_validateiCloudAccountTerms;
- (void)__runFinishWithSFSession:(id)a3;
- (void)_cleanup;
- (void)_handleShowTermsUI:(id)a3 responseHandler:(id)a4;
- (void)_presentiCloudTermsUIWithAccount:(id)a3;
- (void)_reportError:(id)a3;
- (void)_run;
- (void)_runInfoExchangeRequest;
- (void)_runInfoExchangeResponse:(id)a3 error:(id)a4;
- (void)activate;
- (void)dealloc;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)invalidate;
- (void)pairSetupTryPIN:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
@end

@implementation SFAuthenticateAccountsSession

- (SFAuthenticateAccountsSession)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFAuthenticateAccountsSession;
  v2 = [(SFAuthenticateAccountsSession *)&v8 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F179C8] defaultStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v5;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    uint64_t v3 = (SFAuthenticateAccountsSession *)FatalErrorF();
    [(SFAuthenticateAccountsSession *)v3 _cleanup];
  }
  else
  {
    [(SFAuthenticateAccountsSession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFAuthenticateAccountsSession;
    [(SFAuthenticateAccountsSession *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self->_targetedAccountTypes = 0;
  [(TROperationQueue *)self->_trOperationQueue invalidate];
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  SEL v4 = self->_trOperations;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "cancel", (void)v18);
        [v9 setCompletionBlock:0];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_trOperations removeAllObjects];
  trOperations = self->_trOperations;
  self->_trOperations = 0;

  trSession = self->_trSession;
  self->_trSession = 0;

  [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation invalidate];
  homeKitSetupOperation = self->_homeKitSetupOperation;
  self->_homeKitSetupOperation = 0;

  [(SFSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    id v15 = self->_progressHandler;
  }
  else
  {
    id v15 = 0;
  }
  self->_progressHandler = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SFAuthenticateAccountsSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __41__SFAuthenticateAccountsSession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  *(void *)(*(void *)(a1 + 32) + 16) = mach_absolute_time();
  id v7 = [(Class)getHMHomeManagerConfigurationClass[0]() defaultPrivateConfiguration];
  uint64_t v2 = [objc_alloc((Class)getHMHomeManagerClass[0]()) initWithHomeMangerConfiguration:v7];
  uint64_t v3 = *(void *)(a1 + 32);
  SEL v4 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[27];
  if (v6)
  {
    (*(void (**)(void, uint64_t, void))(v6 + 16))(v5[27], 10, 0);
    uint64_t v5 = *(void **)(a1 + 32);
  }
  [v5 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SFAuthenticateAccountsSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__SFAuthenticateAccountsSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9)
    && gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _cleanup];
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SFAuthenticateAccountsSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __49__SFAuthenticateAccountsSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) pairSetupTryPIN:*(void *)(a1 + 40)];
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    int v3 = [(SFAuthenticateAccountsSession *)self _validateAccounts];
    if (v3 == 4 || v3 == 2)
    {
      int v4 = [(SFAuthenticateAccountsSession *)self _validateiCloudAccountTerms];
      if (v4 == 4 || v4 == 2)
      {
        int v5 = [(SFAuthenticateAccountsSession *)self _runSFSessionStart];
        if (v5 == 4 || v5 == 2)
        {
          int v6 = [(SFAuthenticateAccountsSession *)self _runPairVerify];
          if (v6 == 4 || v6 == 2)
          {
            if (self->_sessionSecured
              || (int v12 = [(SFAuthenticateAccountsSession *)self _runPairSetup], v12 == 4)
              || v12 == 2)
            {
              int v7 = [(SFAuthenticateAccountsSession *)self _runInfoExchange];
              if (v7 == 4 || v7 == 2)
              {
                int v8 = [(SFAuthenticateAccountsSession *)self _runTRSessionStart];
                if (v8 == 4 || v8 == 2)
                {
                  if (!self->_trAuthenticationEnabled
                    || (int v9 = [(SFAuthenticateAccountsSession *)self _runTRAuthentication], v9 == 4)
                    || v9 == 2)
                  {
                    if ((self->_problemFlags & 0x20000) == 0 && !self->_isSigningInNewiCloud
                      || (int v10 = [(SFAuthenticateAccountsSession *)self _runRepairCDP], v10 == 4)
                      || v10 == 2)
                    {
                      if ((self->_problemFlags & 8) == 0
                        || (int v11 = [(SFAuthenticateAccountsSession *)self _runHomeKitSetup], v11 == 4)
                        || v11 == 2)
                      {
                        [(SFAuthenticateAccountsSession *)self _runFinish];
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
}

- (void)_reportError:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (gLogCategory_SFAuthenticateAccountsSession <= 90
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    id v14 = v6;
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v17 = @"eo";
    int v8 = v6;
    if (!v6)
    {
      int v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28760];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
      int v3 = (void *)v11;
      int v12 = @"?";
      if (v11) {
        int v12 = (__CFString *)v11;
      }
      v16 = v12;
      int v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1, v14);
      int v8 = [v9 errorWithDomain:v10 code:-6700 userInfo:v4];
    }
    v18[0] = v8;
    v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1, v14, v15);
    progressHandler[2](progressHandler, 30, v13);

    if (!v6)
    {
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
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int sfSessionState = 1;
      [(SFSession *)self->_sfSession invalidate];
      int v4 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v4;

      [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
      [(SFSession *)self->_sfSession setLabel:@"AuthenticateAccounts"];
      [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
      [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.AuthenticateAccounts"];
      [(SFSession *)self->_sfSession setSessionFlags:4097];
      [(SFSession *)self->_sfSession setTouchRemoteEnabled:1];
      id location = 0;
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke;
      v15[3] = &unk_1E5BBCB58;
      objc_copyWeak(&v16, &location);
      [(SFSession *)self->_sfSession setErrorHandler:v15];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_2;
      v13[3] = &unk_1E5BBCB80;
      objc_copyWeak(&v14, &location);
      [(SFSession *)self->_sfSession setInterruptionHandler:v13];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_3;
      v11[3] = &unk_1E5BBCB80;
      objc_copyWeak(&v12, &location);
      [(SFSession *)self->_sfSession setInvalidationHandler:v11];
      if (self->_promptForPINHandler) {
        -[SFSession setPromptForPINHandler:](self->_sfSession, "setPromptForPINHandler:");
      }
      id v6 = self->_sfSession;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_4;
      v10[3] = &unk_1E5BBCBA8;
      v10[4] = self;
      [(SFSession *)v6 registerRequestID:@"_aaTerms" options:0 handler:v10];
      int v7 = self->_sfSession;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_5;
      v9[3] = &unk_1E5BBC8E8;
      v9[4] = self;
      [(SFSession *)v7 activateWithCompletion:v9];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  return self->_sfSessionState;
}

void __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (gLogCategory_SFAuthenticateAccountsSession <= 90
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportError:v4];
}

void __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F28760];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  uint64_t v4 = [NSString stringWithUTF8String:DebugGetErrorString()];
  int v5 = (void *)v4;
  id v6 = @"?";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  v10[0] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v8 = [v2 errorWithDomain:v3 code:-6762 userInfo:v7];
  [WeakRetained _reportError:v8];
}

void __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 9))
  {
    id v4 = objc_loadWeakRetained(v1);
    int v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28760];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    uint64_t v7 = [NSString stringWithUTF8String:DebugGetErrorString()];
    int v8 = (void *)v7;
    uint64_t v9 = @"?";
    if (v7) {
      uint64_t v9 = (__CFString *)v7;
    }
    v13[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v11 = [v5 errorWithDomain:v6 code:-6736 userInfo:v10];
    [v4 _reportError:v11];
  }
}

uint64_t __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleShowTermsUI:responseHandler:");
}

uint64_t __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    *(_DWORD *)(v2 + 64) = 3;
    return [*(id *)(a1 + 32) _reportError:a2];
  }
  else
  {
    *(_DWORD *)(v2 + 64) = 4;
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
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
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
      v7[2] = __47__SFAuthenticateAccountsSession__runPairVerify__block_invoke;
      v7[3] = &unk_1E5BBC8E8;
      v7[4] = self;
      [(SFSession *)sfSession pairVerifyWithFlags:8 completion:v7];
    }
  }
  return self->_pairVerifyState;
}

void __47__SFAuthenticateAccountsSession__runPairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    if (gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = a1 + 32;
    *(_DWORD *)(v4 + 72) = 2;
    goto LABEL_13;
  }
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v3 = a1 + 32;
  *(unsigned char *)(v5 + 68) = 1;
  *(_DWORD *)(*(void *)v3 + 72) = 4;
  uint64_t v6 = *(void **)v3;
  uint64_t v7 = *(void *)(*(void *)v3 + 216);
  if (v7)
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))(*(void *)(*(void *)v3 + 216), 70, 0);
LABEL_13:
    uint64_t v6 = *(void **)v3;
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
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
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
      v7[2] = __46__SFAuthenticateAccountsSession__runPairSetup__block_invoke;
      v7[3] = &unk_1E5BBC8E8;
      v7[4] = self;
      [(SFSession *)sfSession pairSetupWithFlags:8 completion:v7];
    }
  }
  return self->_pairSetupState;
}

void __46__SFAuthenticateAccountsSession__runPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  if (v3)
  {
    *(_DWORD *)(v4 + 76) = 3;
    [*(id *)(a1 + 32) _reportError:v3];
  }
  else
  {
    *(unsigned char *)(v4 + 68) = 1;
    *(_DWORD *)(*(void *)(a1 + 32) + 76) = 4;
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[27];
    if (v6)
    {
      (*(void (**)(void, uint64_t, void))(v6 + 16))(v5[27], 70, 0);
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
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int infoExchangeState = 1;
      [(SFAuthenticateAccountsSession *)self _runInfoExchangeRequest];
      self->_trAuthenticationEnabled = 1;
      [(SFAuthenticateAccountsSession *)self _run];
    }
  }
  return self->_infoExchangeState;
}

- (void)_runInfoExchangeRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v5 firstObject];
    [v3 setObject:v6 forKeyedSubscript:@"lang"];

    [v3 setObject:v5 forKeyedSubscript:@"langs"];
  }
  else if (gLogCategory_SFAuthenticateAccountsSession <= 60 {
         && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v8 = [v7 localeIdentifier];

  if (v8)
  {
    [v3 setObject:v8 forKeyedSubscript:@"locale"];
  }
  else if (gLogCategory_SFAuthenticateAccountsSession <= 60 {
         && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  int v22 = 0;
  CFArrayGetTypeID();
  uint64_t v9 = CFPrefs_CopyTypedValue();
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    [v3 setObject:v9 forKeyedSubscript:@"kbs"];
  }
  else if (gLogCategory_SFAuthenticateAccountsSession <= 60 {
         && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v11 = [(SFAuthenticateAccountsSession *)self _availableAccountsToSignIn];
  if ([v11 count]) {
    [v3 addEntriesFromDictionary:v11];
  }
  uint64_t v12 = SFDeviceSetupHomeKitCurrentUserIdentifiers(self->_homeManager);
  if ([v12 count]) {
    [v3 setObject:v12 forKeyedSubscript:@"hkcuis"];
  }
  v13 = SFDeviceSetupHomeKitRMVEnabledForAllHomes(self->_homeManager);
  if ([v13 count]) {
    [v3 setObject:v13 forKeyedSubscript:@"hkhrmve"];
  }
  id v14 = [(Class)getVTPreferencesClass_0[0]() sharedPreferences];
  uint64_t v15 = [v14 voiceTriggerEnabled];

  id v16 = [NSNumber numberWithBool:v15];
  [v3 setObject:v16 forKeyedSubscript:@"siriVP"];

  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    id v20 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  long long v18 = objc_msgSend(v3, "copy", v20);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__SFAuthenticateAccountsSession__runInfoExchangeRequest__block_invoke;
  v21[3] = &unk_1E5BBCBF8;
  v21[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_info" options:0 request:v18 responseHandler:v21];
}

uint64_t __56__SFAuthenticateAccountsSession__runInfoExchangeRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runInfoExchangeResponse:a4 error:a2];
}

- (id)_availableAccountsToSignIn
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "aa_altDSID");
    [v3 setObject:v6 forKeyedSubscript:@"aaiCloudAltDSID"];
  }
  id v7 = [(ACAccountStore *)self->_accountStore ams_activeiTunesAccount];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = objc_msgSend(v7, "aa_altDSID");
    [v3 setObject:v9 forKeyedSubscript:@"aaiTunesAltDSID"];
  }
  uint64_t v10 = [(id)objc_opt_class() _myGameCenterAccount];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v10, "aa_altDSID");
    [v3 setObject:v12 forKeyedSubscript:@"aaGameCenterAltDSID"];
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (void)_runInfoExchangeResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6 || v7)
  {
    self->_int infoExchangeState = 3;
    if (!v7) {
      goto LABEL_13;
    }
    [(SFAuthenticateAccountsSession *)self _reportError:v7];
    goto LABEL_27;
  }
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    id v20 = v6;
    LogPrintF();
  }
  self->_peerFeatureFlags = CFDictionaryGetInt64();
  char Int64Ranged = CFDictionaryGetInt64Ranged();
  unsigned int v10 = CFDictionaryGetInt64Ranged();
  if (!v10 && (Int64Ranged & 2) == 0)
  {
    self->_int infoExchangeState = 3;
LABEL_13:
    uint64_t v11 = NSErrorWithOSStatusF();
    [(SFAuthenticateAccountsSession *)self _reportError:v11];

    goto LABEL_27;
  }
  self->_unsigned int targetedAccountTypes = v10;
  unint64_t Int64 = CFDictionaryGetInt64();
  self->_problemFlags = Int64;
  if ((self->_peerFeatureFlags & 0x10) == 0) {
    goto LABEL_24;
  }
  int v13 = Int64;
  CFStringGetTypeID();
  id v14 = CFDictionaryGetTypedValue();
  if (v14)
  {
    self->_isSigningInNewiCloud = 0;
  }
  else
  {
    unsigned int targetedAccountTypes = self->_targetedAccountTypes;
    self->_isSigningInNewiCloud = targetedAccountTypes & 1;
    if (targetedAccountTypes)
    {
LABEL_23:

LABEL_24:
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 800, 0);
      }
      self->_int infoExchangeState = 4;
      [(SFAuthenticateAccountsSession *)self _run];
      goto LABEL_27;
    }
  }
  if ((v13 & 0x20000) == 0) {
    goto LABEL_23;
  }
  id v16 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
  v17 = objc_msgSend(v16, "aa_altDSID");

  if (v14 && v17 && [v14 isEqual:v17])
  {

    goto LABEL_23;
  }
  if (gLogCategory_SFAuthenticateAccountsSession <= 90
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_int infoExchangeState = 3;
  uint64_t v19 = NSErrorWithOSStatusF();
  [(SFAuthenticateAccountsSession *)self _reportError:v19];

LABEL_27:
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
    if (gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int trSessionState = 1;
    uint64_t v4 = [(SFSession *)self->_sfSession trSession];
    trSession = self->_trSession;
    self->_trSession = v4;

    if (self->_trSession)
    {
      id v6 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass[0]());
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
      if (gLogCategory_SFAuthenticateAccountsSession > 90
        || gLogCategory_SFAuthenticateAccountsSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_25;
      }
    }
    else if (gLogCategory_SFAuthenticateAccountsSession > 90 {
           || gLogCategory_SFAuthenticateAccountsSession == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_25;
    }
    LogPrintF();
LABEL_25:
    self->_int trSessionState = 3;
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
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
    [(SFAuthenticateAccountsSession *)self _reportError:v17];

    return self->_trSessionState;
  }
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_trSessionState;
}

- (int)_runTRAuthentication
{
  id v3 = [(SFAuthenticateAccountsSession *)self _trTargetedServices];
  uint64_t v4 = v3;
  int trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState)
  {
LABEL_2:
    BOOL v6 = trAuthenticationState == 2 || trAuthenticationState == 4;
    if (!v6
      && gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_25;
  }
  if ([v3 count])
  {
    int trAuthenticationState = self->_trAuthenticationState;
    if (trAuthenticationState) {
      goto LABEL_2;
    }
    if (gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int trAuthenticationState = 1;
    id v7 = (void *)[objc_alloc((Class)getTRAuthenticationOperationClass[0]()) initWithSession:self->_trSession];
    [v7 setShouldIgnoreAuthFailures:0];
    [(NSMutableArray *)self->_trOperations addObject:v7];
    [v7 setTargetedServices:v4];
    if (self->_presentingViewController) {
      objc_msgSend(v7, "setPresentingViewController:");
    }
    id location = 0;
    objc_initWeak(&location, v7);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __53__SFAuthenticateAccountsSession__runTRAuthentication__block_invoke;
    v10[3] = &unk_1E5BBC5B8;
    v10[4] = self;
    objc_copyWeak(&v11, &location);
    [v7 setCompletionBlock:v10];
    [(TROperationQueue *)self->_trOperationQueue addOperation:v7];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsSession <= 40
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int trAuthenticationState = 2;
  }
LABEL_25:
  int v8 = self->_trAuthenticationState;

  return v8;
}

void __53__SFAuthenticateAccountsSession__runTRAuthentication__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 192);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__SFAuthenticateAccountsSession__runTRAuthentication__block_invoke_2;
  v3[3] = &unk_1E5BBC5B8;
  v3[4] = v1;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __53__SFAuthenticateAccountsSession__runTRAuthentication__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 128))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v2 = [WeakRetained result];
    if (v2)
    {
      id v3 = getTRAuthenticationOperationUnauthenticatedServicesKey[0]();
      id v4 = [v2 objectForKeyedSubscript:v3];

      if ([v4 count])
      {
        uint64_t v5 = WeakRetained;
        if (gLogCategory_SFAuthenticateAccountsSession <= 60)
        {
          if (gLogCategory_SFAuthenticateAccountsSession != -1
            || (v6 = _LogCategory_Initialize(), uint64_t v5 = WeakRetained, v6))
          {
            int v8 = v4;
            LogPrintF();
            uint64_t v5 = WeakRetained;
          }
        }
        *(_DWORD *)(*(void *)(a1 + 32) + 156) = 3;
        id v7 = objc_msgSend(v5, "error", v8);
        if (!v7)
        {
          getTRAuthenticationOperationErrorKey[0]();
          CFErrorGetTypeID();
          id v7 = CFDictionaryGetTypedValue();
          if (!v7)
          {
            id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-6736 userInfo:0];
          }
        }
        [*(id *)(a1 + 32) _reportError:v7];
      }
      else
      {
        if (gLogCategory_SFAuthenticateAccountsSession <= 30
          && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        *(_DWORD *)(*(void *)(a1 + 32) + 156) = 4;
        [*(id *)(a1 + 32) _run];
      }
    }
    else
    {
      id v4 = [WeakRetained error];
      if (gLogCategory_SFAuthenticateAccountsSession <= 60
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        int v8 = v4;
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 156) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v4, v8);
    }
  }
}

- (id)_trTargetedServices
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = v3;
  unsigned int targetedAccountTypes = self->_targetedAccountTypes;
  if (targetedAccountTypes)
  {
    [v3 addObject:&unk_1EFA09530];
    unsigned int targetedAccountTypes = self->_targetedAccountTypes;
    if ((targetedAccountTypes & 2) == 0)
    {
LABEL_3:
      if ((targetedAccountTypes & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((targetedAccountTypes & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:&unk_1EFA09548];
  if ((self->_targetedAccountTypes & 4) != 0) {
LABEL_4:
  }
    [v4 addObject:&unk_1EFA09560];
LABEL_5:
  int v6 = (void *)[v4 copy];

  return v6;
}

- (int)_runRepairCDP
{
  int cdpState = self->_cdpState;
  if (cdpState != 4)
  {
    if (cdpState)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int cdpState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 236, 0);
      }
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation invalidate];
      uint64_t v5 = objc_alloc_init(SFDeviceOperationCDPSetup);
      cdpSetupOperation = self->_cdpSetupOperation;
      self->_cdpSetupOperation = v5;

      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setSfSession:self->_sfSession];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setIsRepair:!self->_isSigningInNewiCloud];
      if (self->_presentingViewController) {
        -[SFDeviceOperationCDPSetup setPresentingViewController:](self->_cdpSetupOperation, "setPresentingViewController:");
      }
      id location = 0;
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __46__SFAuthenticateAccountsSession__runRepairCDP__block_invoke;
      v8[3] = &unk_1E5BBE608;
      objc_copyWeak(&v9, &location);
      v8[4] = self;
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setCompletionHandler:v8];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation activate];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  return self->_cdpState;
}

void __46__SFAuthenticateAccountsSession__runRepairCDP__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 20))
  {
    if (v5)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 90
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 168) = 3;
      [v4 _reportError:v5];
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 168) = 4;
      [v4 _run];
    }
  }
}

- (int)_runHomeKitSetup
{
  int homeKitSetupState = self->_homeKitSetupState;
  if (homeKitSetupState != 4)
  {
    if (homeKitSetupState)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int homeKitSetupState = 1;
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation invalidate];
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 234, 0);
      }
      id v5 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      homeKitSetupOperation = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v5;

      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setKeyExchangeOnly:1];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setUserInteractive:1];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setTrSession:self->_trSession];
      id location = 0;
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__SFAuthenticateAccountsSession__runHomeKitSetup__block_invoke;
      v8[3] = &unk_1E5BBCB58;
      objc_copyWeak(&v9, &location);
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setCompletionHandler:v8];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation activate];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  return self->_homeKitSetupState;
}

void __49__SFAuthenticateAccountsSession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = v8;
    if (v8)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30)
      {
        if (gLogCategory_SFAuthenticateAccountsSession != -1 || (int v5 = _LogCategory_Initialize(), v4 = v8, v5))
        {
          id v7 = v4;
          LogPrintF();
        }
      }
      int v6 = 2;
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      int v6 = 4;
    }
    WeakRetained[46] = v6;
    objc_msgSend(WeakRetained, "_run", v7);
  }
}

- (int)_runFinish
{
  int finishState = self->_finishState;
  if (finishState != 4 && finishState != 2)
  {
    if (finishState)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int finishState = 1;
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v5 setObject:&unk_1EFA09578 forKeyedSubscript:@"op"];
      if ((self->_problemFlags & 8) != 0)
      {
        int v6 = [NSNumber numberWithInt:self->_homeKitSetupState == 4];
        [v5 setObject:v6 forKeyedSubscript:@"aaHKSetup"];
      }
      sfSession = self->_sfSession;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __43__SFAuthenticateAccountsSession__runFinish__block_invoke;
      v9[3] = &unk_1E5BBE630;
      v9[4] = self;
      [(SFSession *)sfSession sendRequestWithFlags:1 object:v5 responseHandler:v9];
      self->_int finishState = 4;
    }
  }
  return self->_finishState;
}

void __43__SFAuthenticateAccountsSession__runFinish__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  int v6 = a3;
  id v7 = a4;
  if (v6) {
    goto LABEL_21;
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!Int64Ranged) {
    goto LABEL_22;
  }
  id v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28760];
  uint64_t v11 = Int64Ranged;
  uint64_t v22 = *MEMORY[0x1E4F28568];
  uint64_t v12 = [NSString stringWithUTF8String:DebugGetErrorString()];
  uint64_t v13 = (void *)v12;
  id v14 = @"?";
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  v23[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  int v6 = [v9 errorWithDomain:v10 code:v11 userInfo:v15];

  if (v6)
  {
LABEL_21:
    if (gLogCategory_SFAuthenticateAccountsSession <= 90
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = v6;
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 188) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v6, v19);
  }
  else
  {
LABEL_22:
    if (gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v16 = objc_alloc_init(SFClient);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43__SFAuthenticateAccountsSession__runFinish__block_invoke_2;
    v20[3] = &unk_1E5BBC8E8;
    int v6 = v16;
    long long v21 = v6;
    [(SFClient *)v6 reenableProxCardType:32 completion:v20];
    v17 = *(void **)(a1 + 32);
    uint64_t v18 = v17[27];
    if (v18)
    {
      (*(void (**)(void, uint64_t, void))(v18 + 16))(v17[27], 96, 0);
      v17 = *(void **)(a1 + 32);
    }
    [v17 _cleanup];
  }
}

void __43__SFAuthenticateAccountsSession__runFinish__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    id v3 = v4;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v3);
}

- (void)__runFinishWithSFSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);

  [(SFAuthenticateAccountsSession *)self _runFinish];
}

- (int)_validateAccounts
{
  int accountsState = self->_accountsState;
  if (accountsState != 4 && accountsState != 2)
  {
    if (accountsState)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      id v5 = [(SFAuthenticateAccountsSession *)self _availableAccountsToSignIn];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        self->_int accountsState = 4;
      }
      else
      {
        self->_int accountsState = 3;
        id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UserErrorDomain" code:301005 userInfo:0];
        [(SFAuthenticateAccountsSession *)self _reportError:v7];
      }
    }
  }
  return self->_accountsState;
}

- (int)__validateAccountsWithAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);

  return [(SFAuthenticateAccountsSession *)self _validateAccounts];
}

- (void)_handleShowTermsUI:(id)a3 responseHandler:(id)a4
{
  (*((void (**)(id, void, void, void))a4 + 2))(a4, 0, 0, MEMORY[0x1E4F1CC08]);
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_int trSessionState = 0;
  self->_int trAuthenticationState = 0;
  id v5 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
  [(SFAuthenticateAccountsSession *)self _presentiCloudTermsUIWithAccount:v5];
}

- (int)_validateiCloudAccountTerms
{
  switch(self->_iCloudTermsState)
  {
    case 0:
      id v3 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
      if (objc_msgSend(v3, "aa_needsToVerifyTerms"))
      {
        if (gLogCategory_SFAuthenticateAccountsSession <= 50
          && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        [(SFAuthenticateAccountsSession *)self _presentiCloudTermsUIWithAccount:v3];
      }
      else
      {
        self->_iCloudTermsState = 4;
      }
      goto LABEL_15;
    case 2:
    case 4:
      return self->_iCloudTermsState;
    case 3:
      id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UserErrorDomain" code:301025 userInfo:0];
      [(SFAuthenticateAccountsSession *)self _reportError:v3];
LABEL_15:

      break;
    default:
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
  return self->_iCloudTermsState;
}

- (void)_presentiCloudTermsUIWithAccount:(id)a3
{
  id v4 = (Class (__cdecl *)())getAAUIGenericTermsRemoteUIClass[0];
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc(v4()) initWithAccount:v5 inStore:self->_accountStore];

  [v6 setDelegate:self];
  [v6 presentFromViewController:self->_presentingViewController modal:1];
  termsRemoteUI = self->_termsRemoteUI;
  self->_termsRemoteUI = (AAUIGenericTermsRemoteUI *)v6;

  self->_iCloudTermsState = 1;
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (gLogCategory_SFAuthenticateAccountsSession <= 50
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  termsRemoteUI = self->_termsRemoteUI;
  self->_termsRemoteUI = 0;

  if (v4) {
    int v8 = 4;
  }
  else {
    int v8 = 3;
  }
  self->_iCloudTermsState = v8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SFAuthenticateAccountsSession_genericTermsRemoteUI_didFinishWithSuccess___block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __75__SFAuthenticateAccountsSession_genericTermsRemoteUI_didFinishWithSuccess___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run];
}

+ (id)_myGameCenterAccount
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F179C8] defaultStore];
  id v3 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F177B8]];
  BOOL v4 = [v2 accountsWithAccountType:v3];
  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = (void *)MEMORY[0x1E4F29008];
    id v6 = NSStringFromSelector(sel_creationDate);
    id v7 = [v5 sortDescriptorWithKey:v6 ascending:0];

    v12[0] = v7;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v9 = [v4 sortedArrayUsingDescriptors:v8];

    BOOL v4 = (void *)v9;
  }
  uint64_t v10 = [v4 firstObject];

  return v10;
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

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_homeKitSetupOperation, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_termsRemoteUI, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end