@interface SKSetupClient
- (BOOL)skipWifi;
- (NSDictionary)clientConfig;
- (SKSetupClient)init;
- (id)authCompletionHandler;
- (id)authPromptHandler;
- (id)invalidationHandler;
- (id)overallCompletionHandler;
- (void)_activateBLEWithCompletion:(id)a3;
- (void)_activateNANContinueWithError:(id)a3;
- (void)_activateNANWithCompletion:(id)a3;
- (void)_activateOOBWithCompletion:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_completeWithError:(id)a3;
- (void)_invalidate;
- (void)_invalidateSteps;
- (void)_invalidated;
- (void)_prepareSteps;
- (void)_prepareStepsOSRecovery;
- (void)_run;
- (void)_setupConnectionCommon:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setAuthPromptHandler:(id)a3;
- (void)setClientConfig:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setOverallCompletionHandler:(id)a3;
- (void)setSkipWifi:(BOOL)a3;
- (void)tryPassword:(id)a3;
@end

@implementation SKSetupClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overallCompletionHandler, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_authPromptHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_nanSubscriber, 0);
  objc_storeStrong((id *)&self->_nanEndpoint, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

- (void)setOverallCompletionHandler:(id)a3
{
}

- (id)overallCompletionHandler
{
  return self->_overallCompletionHandler;
}

- (void)setSkipWifi:(BOOL)a3
{
  self->_skipWifi = a3;
}

- (BOOL)skipWifi
{
  return self->_skipWifi;
}

- (void)setClientConfig:(id)a3
{
}

- (NSDictionary)clientConfig
{
  return self->_clientConfig;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setAuthPromptHandler:(id)a3
{
}

- (id)authPromptHandler
{
  return self->_authPromptHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      int runState = self->super._runState;
      if (runState > 11)
      {
        if (runState == 12)
        {
          BOOL v6 = [(SKSetupBase *)self _runSteps];
          int v5 = self->super._runState;
          if (!v6) {
            goto LABEL_15;
          }
LABEL_13:
          ++v5;
LABEL_14:
          self->super._int runState = v5;
          goto LABEL_15;
        }
        if (runState != 13) {
          return;
        }
        [(SKSetupClient *)self _completeWithError:0];
        int v5 = self->super._runState;
      }
      else
      {
        if (!runState)
        {
          int v5 = 11;
          goto LABEL_14;
        }
        if (runState != 11) {
          return;
        }
        int v4 = [(SKConnection *)self->super._skCnx state];
        int v5 = self->super._runState;
        if (v4 == 1) {
          goto LABEL_13;
        }
      }
LABEL_15:
      if (v5 == runState) {
        return;
      }
      int var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)tryPassword:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__SKSetupClient_tryPassword___block_invoke;
  v7[3] = &unk_2645494C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __29__SKSetupClient_tryPassword___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 120);
  v3 = *(int **)(*(void *)(a1 + 32) + 144);
  int v4 = *v3;
  id v7 = v2;
  if (v2)
  {
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v2 = v7, v5))
      {
        LogPrintF();
        id v2 = v7;
      }
    }
    v3 = (int *)[v2 tryPassword:*(void *)(a1 + 40)];
    goto LABEL_7;
  }
  if (v4 <= 90)
  {
    if (v4 != -1 || (v3 = (int *)_LogCategory_Initialize(), id v2 = 0, v3))
    {
      v3 = (int *)LogPrintF();
LABEL_7:
      id v2 = v7;
    }
  }

  return MEMORY[0x270F9A758](v3, v2);
}

- (void)_prepareStepsOSRecovery
{
  v3 = objc_alloc_init(SKStepBasicConfigClient);
  int v4 = [(SKSetupClient *)self clientConfig];
  [(SKStepBasicConfigClient *)v3 setClientConfig:v4];

  [(SKStepBasicConfigClient *)v3 setDispatchQueue:self->super._dispatchQueue];
  [(SKStepBasicConfigClient *)v3 setSkMessaging:self];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SKSetupClient__prepareStepsOSRecovery__block_invoke;
  v7[3] = &unk_2645496B0;
  v7[4] = self;
  void v7[5] = v3;
  [(SKStepBasicConfigClient *)v3 setSkCompletionHandler:v7];
  [(SKSetupBase *)self _addStep:v3];

  if (!self->_skipWifi)
  {
    int v5 = objc_alloc_init(SKStepWiFiSetupClientLegacy);
    [(SKStepWiFiSetupClientLegacy *)v5 setDispatchQueue:self->super._dispatchQueue];
    [(SKStepWiFiSetupClientLegacy *)v5 setSkMessaging:self];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__SKSetupClient__prepareStepsOSRecovery__block_invoke_2;
    v6[3] = &unk_2645496B0;
    v6[4] = self;
    v6[5] = v5;
    [(SKStepWiFiSetupClientLegacy *)v5 setSkCompletionHandler:v6];
    [(SKSetupBase *)self _addStep:v5];
  }
}

void __40__SKSetupClient__prepareStepsOSRecovery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  id v11 = v3;
  if (v3)
  {
    int v5 = *v4[18];
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
    {
      v9 = "-[SKSetupClient _prepareStepsOSRecovery]_block_invoke";
      id v10 = v11;
      LogPrintF();
    }
  }
  else
  {
    id v6 = [SKEventBasicConfigUpdated alloc];
    id v7 = [*(id *)(a1 + 40) outServerConfig];
    id v8 = [(SKEventBasicConfigUpdated *)v6 initWithBasicConfig:v7];
    [v4 _reportEvent:v8];
  }
  objc_msgSend(*(id *)(a1 + 32), "_completedStep:error:", *(void *)(a1 + 40), 0, v9, v10);
}

uint64_t __40__SKSetupClient__prepareStepsOSRecovery__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedStep:*(void *)(a1 + 40) error:a2];
}

- (void)_prepareSteps
{
  if (self->super._setupType == 1) {
    [(SKSetupClient *)self _prepareStepsOSRecovery];
  }
}

- (void)_invalidateSteps
{
  [(SKStepable *)self->super._stepCurrent setSkCompletionHandler:0];
  [(SKStepable *)self->super._stepCurrent invalidate];
  stepCurrent = self->super._stepCurrent;
  self->super._stepCurrent = 0;

  v4.receiver = self;
  v4.super_class = (Class)SKSetupClient;
  [(SKSetupBase *)&v4 _invalidateSteps];
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  int var0 = self->super._ucat->var0;
  id v13 = v4;
  if (v4)
  {
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v12 = CUPrintNSError();
      LogPrintF();
    }
    int v6 = 3;
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v6 = 4;
  }
  self->super._int runState = v6;
  id v7 = (void (**)(void, void))MEMORY[0x223C632B0](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v7) {
    ((void (**)(void, id))v7)[2](v7, v13);
  }
  v9 = [[SKEvent alloc] initWithEventType:20 error:v13];
  [(SKSetupBase *)self _reportEvent:v9];

  id v10 = (void (**)(void, void))MEMORY[0x223C632B0](self->_overallCompletionHandler);
  id overallCompletionHandler = self->_overallCompletionHandler;
  self->_id overallCompletionHandler = 0;

  if (v10) {
    ((void (**)(void, id))v10)[2](v10, v13);
  }
}

- (void)_invalidated
{
  if (self->super._invalidateCalled)
  {
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0;

    id authPromptHandler = self->_authPromptHandler;
    self->_id authPromptHandler = 0;

    int v5 = (void (**)(void, void))MEMORY[0x223C632B0](self->_overallCompletionHandler);
    id overallCompletionHandler = self->_overallCompletionHandler;
    self->_id overallCompletionHandler = 0;

    if (v5)
    {
      id v7 = NSErrorF_safe();
      ((void (**)(void, void *))v5)[2](v5, v7);
    }
    id v8 = (void (**)(void))MEMORY[0x223C632B0](self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v8) {
      v8[2](v8);
    }
    v10.receiver = self;
    v10.super_class = (Class)SKSetupClient;
    [(SKSetupBase *)&v10 _invalidated];
  }
}

- (void)_invalidate
{
  [(CUNANSubscriber *)self->_nanSubscriber invalidate];
  nanSubscriber = self->_nanSubscriber;
  self->_nanSubscriber = 0;

  id v4 = (void (**)(void, void))MEMORY[0x223C632B0](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v4)
  {
    int v6 = NSErrorF_safe();
    ((void (**)(void, void *))v4)[2](v4, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)SKSetupClient;
  [(SKSetupBase *)&v7 _invalidate];
}

- (void)_setupConnectionCommon:(id)a3
{
  id v4 = a3;
  [v4 setClientMode:1];
  objc_msgSend(v4, "setConditionalPersistent:", -[SKSetupBase conditionalPersistent](self, "conditionalPersistent"));
  [v4 setDispatchQueue:self->super._dispatchQueue];
  [v4 setPassword:self->super._password];
  objc_msgSend(v4, "setPersistentPairing:", -[SKSetupBase persistentPairing](self, "persistentPairing"));
  objc_msgSend(v4, "setReversePairing:", -[SKSetupBase reversePairing](self, "reversePairing"));
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke;
  v25[3] = &unk_2645491E8;
  v25[4] = self;
  [v4 setAuthCompletionHandler:v25];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_2;
  v24[3] = &unk_264549238;
  v24[4] = self;
  [v4 setAuthPromptHandler:v24];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_3;
  v23[3] = &unk_264549260;
  v23[4] = self;
  [v4 setAuthShowPasswordHandler:v23];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_4;
  v20[3] = &unk_2645496B0;
  id v5 = v4;
  id v21 = v5;
  v22 = self;
  [v5 setErrorHandler:v20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_5;
  v17[3] = &unk_2645494C0;
  id v6 = v5;
  id v18 = v6;
  v19 = self;
  [v6 setInvalidationHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_6;
  v16[3] = &unk_264549288;
  v16[4] = self;
  [v6 setPairSetupConfigHandler:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_7;
  v13[3] = &unk_2645492B0;
  id v7 = v6;
  id v14 = v7;
  v15 = self;
  [v7 setReceivedEventHandler:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_8;
  v10[3] = &unk_264549688;
  id v11 = v7;
  v12 = self;
  id v8 = v7;
  [v8 setReceivedRequestHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_9;
  v9[3] = &unk_264549660;
  v9[4] = self;
  [v8 setStateChangedHandler:v9];
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [[SKEvent alloc] initWithEventType:140 error:v6];
  [*(id *)(a1 + 32) _reportEvent:v3];
  uint64_t v4 = MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 32) + 240));
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_super v10 = [[SKAuthenticationRequestEvent alloc] initWithPasswordType:a2 pairingFlags:a3 throttleSeconds:a4];
  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:");
  uint64_t v8 = MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 32) + 248));
  v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, a3, a4);
  }
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [[SKAuthenticationPresentEvent alloc] initWithPasswordType:a2 password:v5];

  [*(id *)(a1 + 32) _reportEvent:v6];
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    id v9 = v3;
    int v5 = **(_DWORD **)(v4 + 144);
    if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = CUPrintNSError();
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 120);
    *(void *)(v6 + 120) = 0;

    id v3 = v9;
  }
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 120))
  {
    int v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(a1 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(a1 + 40);
      }
    }
    int v5 = *(void **)(v1 + 120);
    *(void *)(v1 + 120) = 0;
  }
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[18];
  id v8 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), int v4 = *(_DWORD ***)(a1 + 32), v6))
    {
      id v7 = CUPrintNSObjectOneLine();
      LogPrintF();

      id v3 = v8;
      int v4 = *(_DWORD ***)(a1 + 32);
    }
    else
    {
      id v3 = v8;
    }
  }
  objc_msgSend(v4, "_pairSetupConfig:", v3, v7);
}

void *__40__SKSetupClient__setupConnectionCommon___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v5 == result[15]) {
    return (void *)[result _receivedEventID:a2 event:a3 options:a4];
  }
  return result;
}

void *__40__SKSetupClient__setupConnectionCommon___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v6 == result[15]) {
    return (void *)[result _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
  }
  return result;
}

uint64_t __40__SKSetupClient__setupConnectionCommon___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run];
}

- (void)_activateOOBWithCompletion:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__1455;
  v15[4] = __Block_byref_object_dispose__1456;
  id v16 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__SKSetupClient__activateOOBWithCompletion___block_invoke;
  v12[3] = &unk_264549378;
  id v14 = v15;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x223C632B0](v12);
  id v7 = objc_alloc_init(SKConnection);
  objc_storeStrong((id *)&self->super._skCnx, v7);
  [(SKConnection *)v7 setSendDataHandler:self->super._sendDataHandler];
  [(SKSetupClient *)self _setupConnectionCommon:v7];
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__SKSetupClient__activateOOBWithCompletion___block_invoke_2;
  v10[3] = &unk_264549170;
  void v10[4] = v7;
  v10[5] = self;
  id v9 = v5;
  id v11 = v9;
  [(SKConnection *)v7 activateWithCompletion:v10];

  v6[2](v6);
  _Block_object_dispose(v15, 8);
}

uint64_t __44__SKSetupClient__activateOOBWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    id v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

void __44__SKSetupClient__activateOOBWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v12 = v3;
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    int v7 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
      {
        objc_super v10 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v10);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(void **)(v8 + 120);
      *(void *)(v8 + 120) = 0;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [*(id *)(a1 + 40) _run];
    }
  }
  else
  {
    id v5 = NSErrorF_safe();
    int v6 = **(_DWORD **)(*(void *)(a1 + 40) + 144);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      id v11 = CUPrintNSError();
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  }
}

- (void)_activateNANContinueWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (SKConnection *)MEMORY[0x223C632B0](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v5) {
      ((void (*)(SKConnection *, id))v5->_authThrottleDeadlineTicks)(v5, v4);
    }
  }
  else
  {
    id v5 = self->super._skCnx;
    if (v5)
    {
      [(SKSetupClient *)self _setupConnectionCommon:v5];
      int var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v8 = v5;
        LogPrintF();
      }
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __47__SKSetupClient__activateNANContinueWithError___block_invoke;
      v9[3] = &unk_2645496B0;
      v9[4] = v5;
      void v9[5] = self;
      -[SKConnection activateWithCompletion:](v5, "activateWithCompletion:", v9, v8);
    }
  }
}

void __47__SKSetupClient__activateNANContinueWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v22 = v3;
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    int v8 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
      {
        v20 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v20);
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = *(void **)(v13 + 120);
      *(void *)(v13 + 120) = 0;

      id v5 = (void (**)(void, void))MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 40) + 208));
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(void **)(v15 + 208);
      *(void *)(v15 + 208) = 0;

      if (v5) {
        ((void (**)(void, id))v5)[2](v5, v22);
      }
    }
    else
    {
      if (v8 <= 30)
      {
        if (v8 != -1 || (v17 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 40), v17))
        {
          LogPrintF();
          uint64_t v4 = *(void *)(a1 + 40);
        }
      }
      id v5 = (void (**)(void, void))MEMORY[0x223C632B0](*(void *)(v4 + 208));
      uint64_t v18 = *(void *)(a1 + 40);
      v19 = *(void **)(v18 + 208);
      *(void *)(v18 + 208) = 0;

      if (v5) {
        v5[2](v5, 0);
      }
      [*(id *)(a1 + 40) _run];
    }
  }
  else
  {
    NSErrorF_safe();
    id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = **(_DWORD **)(v6 + 144);
    if (v7 <= 90)
    {
      if (v7 != -1 || (v9 = _LogCategory_Initialize(), uint64_t v6 = *(void *)(a1 + 40), v9))
      {
        id v21 = CUPrintNSError();
        LogPrintF();

        uint64_t v6 = *(void *)(a1 + 40);
      }
    }
    objc_super v10 = (void (**)(void, void))MEMORY[0x223C632B0](*(void *)(v6 + 208));
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(v11 + 208);
    *(void *)(v11 + 208) = 0;

    if (v10) {
      v10[2](v10, v5);
    }
  }
}

- (void)_activateNANWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1455;
  v24 = __Block_byref_object_dispose__1456;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke;
  v17[3] = &unk_264549378;
  v19 = &v20;
  void v17[4] = self;
  id v5 = v4;
  id v18 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x223C632B0](v17);
  int v7 = objc_alloc_init(SKConnection);
  objc_storeStrong((id *)&self->super._skCnx, v7);
  [(SKConnection *)v7 setClientMode:1];
  [(SKConnection *)v7 setPassword:self->super._password];
  int v8 = [(SKDevice *)self->super._peerDevice identifier];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F38588]);
    objc_storeStrong((id *)&self->_nanSubscriber, v9);
    [v9 setControlFlags:1];
    [v9 setDispatchQueue:self->super._dispatchQueue];
    [v9 setServiceType:@"com.apple.setup"];
    objc_super v10 = (void *)MEMORY[0x223C632B0](v5);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = v10;

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_2;
    v16[3] = &unk_264549198;
    v16[4] = v8;
    void v16[5] = self;
    [v9 setEndpointFoundHandler:v16];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_3;
    v15[3] = &unk_2645491C0;
    v15[4] = v9;
    void v15[5] = self;
    v15[6] = v8;
    v15[7] = v7;
    [v9 setReceiveHandler:v15];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_4;
    v14[3] = &unk_264549210;
    v14[4] = v9;
    v14[5] = self;
    [(SKConnection *)v7 setSendDataHandler:v14];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_6;
    v13[3] = &unk_2645496B0;
    void v13[4] = v9;
    v13[5] = self;
    [v9 activateWithCompletion:v13];
  }
  else
  {
    uint64_t v12 = NSErrorF_safe();
    id v9 = (id)v21[5];
    v21[5] = v12;
  }

  v6[2](v6);
  _Block_object_dispose(&v20, 8);
}

uint64_t __44__SKSetupClient__activateNANWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    id v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v4 = [v15 identifier];
  id v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_6;
  }
  int v8 = v7;
  if ((v6 == 0) != (v7 != 0))
  {
    char v9 = [v6 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_6:
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 216), a2);
    objc_super v10 = *(_DWORD ***)(a1 + 40);
    int v11 = *v10[18];
    if (v11 <= 30 && (v11 != -1 || (v13 = _LogCategory_Initialize(), objc_super v10 = *(_DWORD ***)(a1 + 40), v13)))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 40), "_activateNANContinueWithError:", 0, v6);
    }
    else
    {
      objc_msgSend(v10, "_activateNANContinueWithError:", 0, v14);
    }
    goto LABEL_15;
  }

LABEL_10:
  int v12 = **(_DWORD **)(*(void *)(a1 + 40) + 144);
  if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_15:
}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = v5;
  if (*(void *)(a1 + 32) != *(void *)(*(void *)(a1 + 40) + 224)) {
    goto LABEL_13;
  }
  id v7 = [v5 identifier];
  int v8 = *(void **)(a1 + 48);
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  int v11 = v10;
  if ((v9 == 0) != (v10 != 0))
  {
    char v12 = [v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    [*(id *)(a1 + 56) receivedData:v15];
    goto LABEL_13;
  }

LABEL_9:
  int v13 = **(_DWORD **)(*(void *)(a1 + 40) + 144);
  if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = [v6 identifier];
    LogPrintF();
  }
LABEL_13:
}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v5 == *(void **)(v4 + 224))
  {
    id v6 = *(void **)(v4 + 216);
    if (v6)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_5;
      v8[3] = &unk_2645491E8;
      v8[4] = v4;
      id v7 = v6;
      [v5 sendMessageData:v3 endpoint:v7 completionHandler:v8];
    }
  }
}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(void *)(a1 + 32) == *(void *)(v4 + 224))
    {
      id v9 = v3;
      int v5 = **(_DWORD **)(v4 + 144);
      if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
      {
        int v8 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = *(void **)(v6 + 224);
      *(void *)(v6 + 224) = 0;

      [*(id *)(a1 + 40) _activateNANContinueWithError:v9];
      id v3 = v9;
    }
  }
}

uint64_t __44__SKSetupClient__activateNANWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    int v5 = **(_DWORD **)(*(void *)(a1 + 32) + 144);
    if (v5 <= 90)
    {
      id v8 = v3;
      if (v5 != -1 || (v3 = (id)_LogCategory_Initialize(), id v4 = v8, v3))
      {
        id v7 = CUPrintNSError();
        LogPrintF();

        id v4 = v8;
      }
    }
  }

  return MEMORY[0x270F9A758](v3, v4);
}

- (void)_activateBLEWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1455;
  id v21 = __Block_byref_object_dispose__1456;
  id v22 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__SKSetupClient__activateBLEWithCompletion___block_invoke;
  v14[3] = &unk_264549378;
  id v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x223C632B0](v14);
  id v7 = objc_alloc_init(SKConnection);
  objc_storeStrong((id *)&self->super._skCnx, v7);
  id v8 = self->super._peerDevice;
  if (v8)
  {
    [(SKConnection *)v7 setBlePeerDevice:v8];
    [(SKSetupClient *)self _setupConnectionCommon:v7];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __44__SKSetupClient__activateBLEWithCompletion___block_invoke_2;
    v12[3] = &unk_264549170;
    v12[4] = v7;
    void v12[5] = self;
    id v13 = v5;
    [(SKConnection *)v7 activateWithCompletion:v12];
  }
  else
  {
    uint64_t v10 = NSErrorF_safe();
    int v11 = (void *)v18[5];
    v18[5] = v10;
  }
  v6[2](v6);

  _Block_object_dispose(&v17, 8);
}

uint64_t __44__SKSetupClient__activateBLEWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    id v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

void __44__SKSetupClient__activateBLEWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v12 = v3;
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    int v7 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v10 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v10);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(void **)(v8 + 120);
      *(void *)(v8 + 120) = 0;

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [*(id *)(a1 + 40) _run];
    }
  }
  else
  {
    id v5 = NSErrorF_safe();
    int v6 = **(_DWORD **)(*(void *)(a1 + 40) + 144);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      int v11 = CUPrintNSError();
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  }
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1455;
  v32 = __Block_byref_object_dispose__1456;
  id v33 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __41__SKSetupClient__activateWithCompletion___block_invoke;
  v25[3] = &unk_264549378;
  v27 = &v28;
  v25[4] = self;
  id v5 = v4;
  id v26 = v5;
  int v6 = (void (**)(void))MEMORY[0x223C632B0](v25);
  if (self->super._activateCalled || self->super._invalidateCalled)
  {
    uint64_t v19 = NSErrorF_safe();
LABEL_24:
    uint64_t v14 = (SKStepWiFiPreflight *)v29[5];
    v29[5] = v19;
    goto LABEL_25;
  }
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t setupType = self->super._setupType;
    if (setupType > 5) {
      id v9 = "?";
    }
    else {
      id v9 = off_2645492D0[setupType];
    }
    uint64_t v10 = CUPrintFlags32();
    peerDevice = self->super._peerDevice;
    BOOL v12 = [(SKSetupBase *)self reversePairing];
    id v13 = "no";
    if (v12) {
      id v13 = "yes";
    }
    id v22 = peerDevice;
    v23 = v13;
    uint64_t v20 = v9;
    id v21 = v10;
    LogPrintF();
  }
  self->super._activateCalled = 1;
  if (self->super._setupType == 1)
  {
    uint64_t v14 = objc_alloc_init(SKStepWiFiPreflight);
    [(SKStepWiFiPreflight *)v14 setPreventAppleWiFi:0];
    id v15 = (id *)(v29 + 5);
    id obj = (id)v29[5];
    BOOL v16 = [(SKStepWiFiPreflight *)v14 checkWiFiAndReturnError:&obj];
    objc_storeStrong(v15, obj);
    if (!v16)
    {
      (*((void (**)(id, void))v5 + 2))(v5, 0);
      [(SKSetupClient *)self _completeWithError:v29[5]];
      id v18 = (void *)v29[5];
      v29[5] = 0;

LABEL_25:
      goto LABEL_26;
    }
  }
  [(SKSetupClient *)self _prepareSteps];
  if (!self->super._sendDataHandler)
  {
    unsigned int controlFlags = self->super._controlFlags;
    if ((controlFlags & 2) != 0)
    {
      [(SKSetupClient *)self _activateNANWithCompletion:v5];
      goto LABEL_26;
    }
    if ((controlFlags & 1) == 0)
    {
      [(SKSetupClient *)self _activateBLEWithCompletion:v5];
      goto LABEL_26;
    }
    uint64_t v19 = NSErrorF_safe();
    goto LABEL_24;
  }
  [(SKSetupClient *)self _activateOOBWithCompletion:v5];
LABEL_26:
  v6[2](v6);

  _Block_object_dispose(&v28, 8);
}

uint64_t __41__SKSetupClient__activateWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    id v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SKSetupClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_264549148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __40__SKSetupClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (SKSetupClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKSetupClient;
  id v2 = [(SKSetupBase *)&v6 initWithLogCategory:&gLogCategory_SKSetupClient];
  int v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

@end