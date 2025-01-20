@interface SKSetupServer
- (BOOL)_bleAdvertiserShouldRun;
- (BOOL)skipWifi;
- (NSDictionary)serverConfig;
- (SKSetupServer)init;
- (id)authCompletionHandler;
- (id)authHidePasswordHandler;
- (id)authShowPasswordHandler;
- (id)invalidationHandler;
- (id)overallCompletionHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_bleAdvertiserEnsureStarted;
- (void)_bleAdvertiserEnsureStopped;
- (void)_bleServerEnsureStarted;
- (void)_bleServerEnsureStopped;
- (void)_handleAcceptBLEConnection:(id)a3;
- (void)_handleAcceptCommon:(id)a3;
- (void)_handleAcceptNANData:(id)a3 endpoint:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_nanPublisherEnsureStarted;
- (void)_nanPublisherEnsureStopped;
- (void)_prepareSteps;
- (void)_prepareStepsOSRecovery;
- (void)_update;
- (void)_wifiKeepAliveEnsureStarted;
- (void)_wifiKeepAliveEnsureStopped;
- (void)activateWithCompletion:(id)a3;
- (void)reset;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setAuthHidePasswordHandler:(id)a3;
- (void)setAuthShowPasswordHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setOverallCompletionHandler:(id)a3;
- (void)setServerConfig:(id)a3;
- (void)setSkipWifi:(BOOL)a3;
@end

@implementation SKSetupServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong(&self->_overallCompletionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_authShowPasswordHandler, 0);
  objc_storeStrong(&self->_authHidePasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_wifiKeepAliveInterface, 0);
  objc_storeStrong((id *)&self->_wifiKeepAliveActivity, 0);
  objc_storeStrong((id *)&self->_nanPublisher, 0);
  objc_storeStrong((id *)&self->_nanEndpointID, 0);
  objc_storeStrong((id *)&self->_bleServer, 0);

  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

- (void)setSkipWifi:(BOOL)a3
{
  self->_skipWifi = a3;
}

- (BOOL)skipWifi
{
  return self->_skipWifi;
}

- (void)setServerConfig:(id)a3
{
}

- (NSDictionary)serverConfig
{
  return self->_serverConfig;
}

- (void)setOverallCompletionHandler:(id)a3
{
}

- (id)overallCompletionHandler
{
  return self->_overallCompletionHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setAuthShowPasswordHandler:(id)a3
{
}

- (id)authShowPasswordHandler
{
  return self->_authShowPasswordHandler;
}

- (void)setAuthHidePasswordHandler:(id)a3
{
}

- (id)authHidePasswordHandler
{
  return self->_authHidePasswordHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)_handleAcceptCommon:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->super._skCnx, a3);
  objc_msgSend(v5, "setConditionalPersistent:", -[SKSetupBase conditionalPersistent](self, "conditionalPersistent"));
  [v5 setDispatchQueue:self->super._dispatchQueue];
  [v5 setPassword:self->super._password];
  objc_msgSend(v5, "setPersistentPairing:", -[SKSetupBase persistentPairing](self, "persistentPairing"));
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke;
  v34[3] = &unk_2645491E8;
  v34[4] = self;
  [v5 setAuthCompletionHandler:v34];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_2;
  v33[3] = &unk_264549238;
  v33[4] = self;
  [v5 setAuthPromptHandler:v33];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_3;
  v32[3] = &unk_264549260;
  v32[4] = self;
  [v5 setAuthShowPasswordHandler:v32];
  [v5 setAuthHidePasswordHandler:self->_authHidePasswordHandler];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_4;
  v29[3] = &unk_2645496B0;
  id v6 = v5;
  id v30 = v6;
  v31 = self;
  [v6 setErrorHandler:v29];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_5;
  v26[3] = &unk_2645494C0;
  id v7 = v6;
  id v27 = v7;
  v28 = self;
  [v7 setInvalidationHandler:v26];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_6;
  v25[3] = &unk_264549288;
  v25[4] = self;
  [v7 setPairSetupConfigHandler:v25];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_7;
  v22[3] = &unk_2645492B0;
  id v8 = v7;
  id v23 = v8;
  v24 = self;
  [v8 setReceivedEventHandler:v22];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_8;
  v19[3] = &unk_264549688;
  id v9 = v8;
  id v20 = v9;
  v21 = self;
  [v9 setReceivedRequestHandler:v19];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_9;
  v16[3] = &unk_2645494C0;
  id v10 = v9;
  id v17 = v10;
  v18 = self;
  [v10 setStateChangedHandler:v16];
  int var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_10;
  v13[3] = &unk_2645496B0;
  id v14 = v10;
  v15 = self;
  id v12 = v10;
  [v12 activateWithCompletion:v13];
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [[SKEvent alloc] initWithEventType:140 error:v6];
  [*(id *)(a1 + 32) _reportEvent:v3];
  uint64_t v4 = MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 32) + 288));
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [[SKAuthenticationRequestEvent alloc] initWithPasswordType:a2 pairingFlags:a3 throttleSeconds:a4];
  [*(id *)(a1 + 32) _reportEvent:v5];
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [[SKAuthenticationPresentEvent alloc] initWithPasswordType:a2 password:v8];
  [*(id *)(a1 + 32) _reportEvent:v5];
  uint64_t v6 = MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 32) + 304));
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    id v9 = v3;
    int v5 = **(_DWORD **)(v4 + 144);
    if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintNSError();
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 120);
    *(void *)(v6 + 120) = 0;

    [*(id *)(a1 + 40) _update];
    id v3 = v9;
  }
}

uint64_t __37__SKSetupServer__handleAcceptCommon___block_invoke_5(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 120))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    int v5 = *(void **)(v1 + 120);
    *(void *)(v1 + 120) = 0;

    uint64_t v6 = *(void *)(v2 + 40);
    id v7 = *(void **)(v6 + 240);
    *(void *)(v6 + 240) = 0;

    [*(id *)(v2 + 40) _connectionEnded:*(void *)(v2 + 32)];
    [*(id *)(v2 + 40) _reportEventType:41];
    id v8 = *(void **)(v2 + 40);
    return [v8 _update];
  }
  return result;
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[18];
  id v8 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (int v6 = _LogCategory_Initialize(), v4 = *(_DWORD ***)(a1 + 32), v6))
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

void *__37__SKSetupServer__handleAcceptCommon___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v5 == result[15]) {
    return (void *)[result _receivedEventID:a2 event:a3 options:a4];
  }
  return result;
}

void *__37__SKSetupServer__handleAcceptCommon___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v6 == result[15]) {
    return (void *)[result _receivedRequestID:a2 request:a3 options:a4 responseHandler:a5];
  }
  return result;
}

void *__37__SKSetupServer__handleAcceptCommon___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[15]) {
    return (void *)[result _update];
  }
  return result;
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v14 = v3;
  if (*(void *)(a1 + 32) == *(void *)(v4 + 120))
  {
    int v8 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
      {
        v13 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v13);
      uint64_t v10 = *(void *)(a1 + 40);
      v11 = *(void **)(v10 + 120);
      *(void *)(v10 + 120) = 0;
    }
    else
    {
      if (v8 <= 30)
      {
        if (v8 != -1 || (int v12 = _LogCategory_Initialize(), v4 = *(void *)(a1 + 40), v12))
        {
          LogPrintF();
          uint64_t v4 = *(void *)(a1 + 40);
        }
      }
      [(id)v4 _reportEventType:40];
    }
    [*(id *)(a1 + 40) _update];
  }
  else
  {
    uint64_t v5 = NSErrorF_safe();
    uint64_t v6 = *(_DWORD ***)(a1 + 40);
    int v7 = *v6[18];
    if (v7 <= 90)
    {
      if (v7 != -1 || (v9 = _LogCategory_Initialize(), uint64_t v6 = *(_DWORD ***)(a1 + 40), v9))
      {
        v13 = CUPrintNSError();
        LogPrintF();

        uint64_t v6 = *(_DWORD ***)(a1 + 40);
      }
    }
    objc_msgSend(v6, "_update", v13);
  }
}

- (void)_handleAcceptNANData:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self->super._skCnx;
  if (!v8)
  {
    int v9 = objc_alloc_init(SKConnection);
    objc_storeStrong((id *)&self->super._skCnx, v9);
    v16 = [v7 identifier];
    nanEndpointID = self->_nanEndpointID;
    self->_nanEndpointID = v16;

    int v12 = self->_nanPublisher;
    if (v12)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke;
      v19[3] = &unk_264548850;
      id v20 = v9;
      v21 = self;
      v22 = v12;
      id v23 = v7;
      [(SKConnection *)v20 setSendDataHandler:v19];
    }
    [(SKSetupServer *)self _handleAcceptCommon:v9];
    goto LABEL_10;
  }
  int v9 = v8;
  uint64_t v10 = [v7 identifier];
  v11 = self->_nanEndpointID;
  int v12 = v10;
  v13 = v11;
  if (v12 == (CUNANPublisher *)v13)
  {

    goto LABEL_10;
  }
  id v14 = v13;
  if ((v12 == 0) != (v13 != 0))
  {
    int v15 = [(CUNANPublisher *)v12 isEqual:v13];

    if (!v15) {
      goto LABEL_13;
    }
LABEL_10:
    [(SKConnection *)v9 receivedData:v6];
    goto LABEL_11;
  }

LABEL_13:
  int var0 = self->super._ucat->var0;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_11:
}

void __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[5];
  if (a1[4] == *(void *)(v4 + 120))
  {
    uint64_t v5 = (void *)a1[6];
    if (v5 == *(void **)(v4 + 248))
    {
      uint64_t v6 = a1[7];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke_2;
      v7[3] = &unk_2645491E8;
      v7[4] = v4;
      [v5 sendMessageData:v3 endpoint:v6 completionHandler:v7];
    }
  }
}

uint64_t __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    int v3 = **(_DWORD **)(*(void *)(a1 + 32) + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = CUPrintNSError();
      LogPrintF();
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)_handleAcceptBLEConnection:(id)a3
{
  id v11 = a3;
  uint64_t v4 = self->super._skCnx;
  if (v4)
  {
    uint64_t v5 = v4;
    int var0 = self->super._ucat->var0;
    if (var0 <= 90)
    {
      id v7 = v11;
      if (var0 != -1)
      {
LABEL_4:
        id v9 = v7;
        LogPrintF();
        objc_msgSend(v11, "invalidate", v9, v5);
        goto LABEL_8;
      }
      if (_LogCategory_Initialize())
      {
        id v7 = v11;
        goto LABEL_4;
      }
    }
    objc_msgSend(v11, "invalidate", v8, v10);
  }
  else
  {
    uint64_t v5 = objc_alloc_init(SKConnection);
    [(SKConnection *)v5 setBleConnection:v11];
    [(SKSetupServer *)self _handleAcceptCommon:v5];
  }
LABEL_8:
}

- (void)_wifiKeepAliveEnsureStopped
{
  if (self->_wifiKeepAliveInterface)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [(CWFInterface *)self->_wifiKeepAliveInterface invalidate];
  wifiKeepAliveInterface = self->_wifiKeepAliveInterface;
  self->_wifiKeepAliveInterface = 0;

  wifiKeepAliveActivity = self->_wifiKeepAliveActivity;
  self->_wifiKeepAliveActivity = 0;

  wifiManager = self->_wifiManager;
  if (wifiManager)
  {
    CFRelease(wifiManager);
    self->_wifiManager = 0;
  }
}

- (void)_wifiKeepAliveEnsureStarted
{
  if (!self->_wifiManager)
  {
    self->_wifiManager = (__WiFiManagerClient *)WiFiManagerClientCreate();
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_nanPublisherEnsureStopped
{
  if (self->_nanPublisher)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [(CUNANPublisher *)self->_nanPublisher invalidate];
  nanPublisher = self->_nanPublisher;
  self->_nanPublisher = 0;
}

- (void)_nanPublisherEnsureStarted
{
  p_nanPublisher = &self->_nanPublisher;
  if (!self->_nanPublisher)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F38580]);
    objc_storeStrong((id *)p_nanPublisher, v4);
    [v4 setControlFlags:1];
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setServiceType:@"com.apple.setup"];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__SKSetupServer__nanPublisherEnsureStarted__block_invoke;
    v7[3] = &unk_264548828;
    v7[4] = v4;
    void v7[5] = self;
    [v4 setReceiveHandler:v7];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__SKSetupServer__nanPublisherEnsureStarted__block_invoke_2;
    v6[3] = &unk_2645496B0;
    v6[4] = v4;
    v6[5] = self;
    [v4 activateWithCompletion:v6];
  }
}

void *__43__SKSetupServer__nanPublisherEnsureStarted__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v4 == result[31]) {
    return (void *)[result _handleAcceptNANData:a2 endpoint:a3];
  }
  return result;
}

uint64_t __43__SKSetupServer__nanPublisherEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 248))
  {
    int v5 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      id v12 = v3;
      if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
      {
        id v11 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v11);
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = *(void **)(v6 + 248);
      *(void *)(v6 + 248) = 0;

      uint64_t v8 = *(void **)(a1 + 40);
      id v9 = [[SKEvent alloc] initWithEventType:42 error:v12];
      [v8 _reportEvent:v9];
    }
    else if (v5 <= 30)
    {
      if (v5 != -1 || (id v3 = (id)_LogCategory_Initialize(), v3)) {
        id v3 = (id)LogPrintF();
      }
    }
  }

  return MEMORY[0x270F9A790](v3);
}

- (void)_bleServerEnsureStopped
{
  if (self->_bleServer)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  [(CBServer *)self->_bleServer invalidate];
  bleServer = self->_bleServer;
  self->_bleServer = 0;
}

- (void)_bleServerEnsureStarted
{
  p_bleServer = &self->_bleServer;
  if (!self->_bleServer)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFEF78]);
    objc_storeStrong((id *)p_bleServer, v4);
    [v4 setDispatchQueue:self->super._dispatchQueue];
    [v4 setBleListenPSM:130];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__SKSetupServer__bleServerEnsureStarted__block_invoke;
    v7[3] = &unk_264548FF8;
    v7[4] = v4;
    void v7[5] = self;
    [v4 setAcceptHandler:v7];
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__SKSetupServer__bleServerEnsureStarted__block_invoke_2;
    v6[3] = &unk_2645496B0;
    v6[4] = v4;
    v6[5] = self;
    [v4 activateWithCompletion:v6];
  }
}

void __40__SKSetupServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  int v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) != *(void *)(v6 + 224))
  {
    id v7 = NSErrorF_safe();
    v5[2](v5, v7);

    goto LABEL_9;
  }
  int v8 = **(_DWORD **)(v6 + 144);
  id v9 = v12;
  if (v8 <= 30)
  {
    if (v8 == -1)
    {
      int v10 = _LogCategory_Initialize();
      uint64_t v6 = *(void *)(a1 + 40);
      if (!v10)
      {
        id v9 = v12;
        goto LABEL_8;
      }
      id v9 = v12;
    }
    id v11 = v9;
    LogPrintF();
    id v9 = v12;
    uint64_t v6 = *(void *)(a1 + 40);
  }
LABEL_8:
  objc_msgSend((id)v6, "_handleAcceptBLEConnection:", v9, v11);
  [*(id *)(a1 + 40) _update];
  v5[2](v5, 0);
LABEL_9:
}

uint64_t __40__SKSetupServer__bleServerEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4 == *(void **)(v5 + 224))
  {
    int v6 = **(_DWORD **)(v5 + 144);
    id v15 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        v13 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v13);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = *(void **)(v7 + 224);
      *(void *)(v7 + 224) = 0;

      id v9 = *(void **)(a1 + 40);
      int v10 = [[SKEvent alloc] initWithEventType:42 error:v15];
      [v9 _reportEvent:v10];

      goto LABEL_13;
    }
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        uint64_t v14 = [v4 bleListeningPSM];
        LogPrintF();
        id v4 = objc_msgSend(*(id *)(a1 + 40), "_update", v14);
LABEL_13:
        id v3 = v15;
        goto LABEL_14;
      }
      int v11 = _LogCategory_Initialize();
      uint64_t v5 = *(void *)(a1 + 40);
      if (v11)
      {
        id v4 = *(void **)(a1 + 32);
        goto LABEL_8;
      }
    }
    id v4 = objc_msgSend((id)v5, "_update", v13);
    goto LABEL_13;
  }
LABEL_14:

  return MEMORY[0x270F9A758](v4, v3);
}

- (void)_bleAdvertiserEnsureStopped
{
  bleAdvertiser = self->_bleAdvertiser;
  if (bleAdvertiser)
  {
    int var0 = self->super._ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (int v5 = _LogCategory_Initialize(), bleAdvertiser = self->_bleAdvertiser, v5))
      {
        uint64_t v7 = bleAdvertiser;
        LogPrintF();
        bleAdvertiser = self->_bleAdvertiser;
      }
    }
  }
  [(CBAdvertiser *)bleAdvertiser invalidate];
  int v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0;

  self->_bleAdvertisePSM = 0;
}

- (void)_bleAdvertiserEnsureStarted
{
  uint64_t v3 = [(CBServer *)self->_bleServer bleListeningPSM];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int bleAdvertisePSM = self->_bleAdvertisePSM;
    if (v3 == bleAdvertisePSM || (bleAdvertiser = self->_bleAdvertiser) == 0)
    {
LABEL_9:
      self->_unsigned int bleAdvertisePSM = v4;
      int v10 = self->_bleAdvertiser;
      if (v10)
      {
LABEL_27:

        return;
      }
      id v11 = objc_alloc_init(MEMORY[0x263EFEEF8]);
      objc_storeStrong((id *)&self->_bleAdvertiser, v11);
      [v11 setDispatchQueue:self->super._dispatchQueue];
      [v11 setNearbyActionFlags:!self->_skipWifi << 6];
      int setupType = self->super._setupType;
      switch(setupType)
      {
        case 1:
          v13 = v11;
          uint64_t v14 = 37;
          break;
        case 5:
          v13 = v11;
          uint64_t v14 = 85;
          break;
        case 2:
          v13 = v11;
          uint64_t v14 = 39;
          break;
        default:
          int var0 = self->super._ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_17;
      }
      [v13 setNearbyActionType:v14];
LABEL_17:
      if (self->super._authTagOverride)
      {
        objc_msgSend(v11, "setNearbyActionFlags:", objc_msgSend(v11, "nearbyActionFlags") | 0x80);
        [v11 setNearbyActionAuthTagData:self->super._authTagOverride];
      }
      int v15 = self->super._ucat->var0;
      if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __44__SKSetupServer__bleAdvertiserEnsureStarted__block_invoke;
      v20[3] = &unk_2645496B0;
      int v10 = (CBAdvertiser *)v11;
      v21 = v10;
      v22 = self;
      [(CBAdvertiser *)v10 activateWithCompletion:v20];

      goto LABEL_27;
    }
    int v7 = self->super._ucat->var0;
    if (v7 <= 30)
    {
      if (v7 == -1)
      {
        int v8 = _LogCategory_Initialize();
        bleAdvertiser = self->_bleAdvertiser;
        if (!v8) {
          goto LABEL_8;
        }
        unsigned int bleAdvertisePSM = self->_bleAdvertisePSM;
      }
      uint64_t v18 = v4;
      v19 = bleAdvertiser;
      uint64_t v17 = bleAdvertisePSM;
      LogPrintF();
      bleAdvertiser = self->_bleAdvertiser;
    }
LABEL_8:
    [(CBAdvertiser *)bleAdvertiser invalidate];
    id v9 = self->_bleAdvertiser;
    self->_bleAdvertiser = 0;

    goto LABEL_9;
  }
}

uint64_t __44__SKSetupServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v5 == *(void *)(v4 + 216))
  {
    int v6 = **(_DWORD **)(v4 + 144);
    id v15 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        v13 = CUPrintNSError();
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v13);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = *(void **)(v7 + 216);
      *(void *)(v7 + 216) = 0;

      id v9 = *(void **)(a1 + 40);
      int v10 = [[SKEvent alloc] initWithEventType:42 error:v15];
      [v9 _reportEvent:v10];

      goto LABEL_13;
    }
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        uint64_t v14 = v5;
        LogPrintF();
        uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "_update", v14);
LABEL_13:
        id v3 = v15;
        goto LABEL_14;
      }
      int v11 = _LogCategory_Initialize();
      uint64_t v4 = *(void *)(a1 + 40);
      if (v11)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        goto LABEL_8;
      }
    }
    uint64_t v4 = objc_msgSend((id)v4, "_update", v13);
    goto LABEL_13;
  }
LABEL_14:

  return MEMORY[0x270F9A758](v4, v3);
}

- (BOOL)_bleAdvertiserShouldRun
{
  if (self->_completed || (self->super._controlFlags & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = [(CBServer *)self->_bleServer bleListeningPSM];
    if (v3) {
      LOBYTE(v3) = self->super._skCnx == 0;
    }
  }
  return v3;
}

- (void)_prepareStepsOSRecovery
{
  [(SKSetupServer *)self _wifiKeepAliveEnsureStarted];
  int v3 = objc_alloc_init(SKStepBasicConfigServer);
  [(SKStepBasicConfigServer *)v3 setDispatchQueue:self->super._dispatchQueue];
  [(SKStepBasicConfigServer *)v3 setSkMessaging:self];
  uint64_t v4 = [(SKSetupServer *)self serverConfig];
  [(SKStepBasicConfigServer *)v3 setServerConfig:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SKSetupServer__prepareStepsOSRecovery__block_invoke;
  v7[3] = &unk_2645491E8;
  v7[4] = self;
  [(SKStepBasicConfigServer *)v3 setSkCompletionHandler:v7];
  [(SKSetupBase *)self _addStep:v3];
  [(SKStepBasicConfigServer *)v3 activate];

  if (!self->_skipWifi)
  {
    uint64_t v5 = objc_alloc_init(SKStepWiFiSetupServerLegacy);
    [(SKStepWiFiSetupServerLegacy *)v5 setDispatchQueue:self->super._dispatchQueue];
    [(SKStepWiFiSetupServerLegacy *)v5 setSkMessaging:self];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__SKSetupServer__prepareStepsOSRecovery__block_invoke_2;
    v6[3] = &unk_2645491E8;
    v6[4] = self;
    [(SKStepWiFiSetupServerLegacy *)v5 setSkCompletionHandler:v6];
    [(SKSetupBase *)self _addStep:v5];
    [(SKStepWiFiSetupServerLegacy *)v5 activate];
  }
}

uint64_t __40__SKSetupServer__prepareStepsOSRecovery__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (*(unsigned char *)(v2 + 280)) {
      *(unsigned char *)(v2 + 232) = 1;
    }
  }
  return result;
}

void __40__SKSetupServer__prepareStepsOSRecovery__block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [[SKEvent alloc] initWithEventType:20 error:v4];

  [v3 _reportEvent:v5];
  if (!v4) {
    *(unsigned char *)(*(void *)(a1 + 32) + 232) = 1;
  }
}

- (void)_prepareSteps
{
  [(SKSetupBase *)self _invalidateSteps];
  if ((self->super._setupType | 4) == 5)
  {
    [(SKSetupServer *)self _prepareStepsOSRecovery];
  }
}

- (void)_update
{
  if (!self->super._invalidateCalled)
  {
    if (self->super._controlFlags) {
      [(SKSetupServer *)self _bleServerEnsureStopped];
    }
    else {
      [(SKSetupServer *)self _bleServerEnsureStarted];
    }
    if ([(SKSetupServer *)self _bleAdvertiserShouldRun]) {
      [(SKSetupServer *)self _bleAdvertiserEnsureStarted];
    }
    else {
      [(SKSetupServer *)self _bleAdvertiserEnsureStopped];
    }
    if ((self->super._controlFlags & 2) != 0)
    {
      [(SKSetupServer *)self _nanPublisherEnsureStarted];
    }
    else
    {
      [(SKSetupServer *)self _nanPublisherEnsureStopped];
    }
  }
}

- (void)reset
{
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__SKSetupServer_reset__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__SKSetupServer_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 144);
  if (v3 <= 30)
  {
    if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v2 + 232) = 0;
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 _update];
}

- (void)_invalidated
{
  if (self->super._invalidateCalled)
  {
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0;

    id authShowPasswordHandler = self->_authShowPasswordHandler;
    self->_id authShowPasswordHandler = 0;

    id authHidePasswordHandler = self->_authHidePasswordHandler;
    self->_id authHidePasswordHandler = 0;

    int v6 = (void (**)(void, void))MEMORY[0x223C632B0](self->_overallCompletionHandler);
    id overallCompletionHandler = self->_overallCompletionHandler;
    self->_id overallCompletionHandler = 0;

    if (v6)
    {
      int v8 = NSErrorF_safe();
      ((void (**)(void, void *))v6)[2](v6, v8);
    }
    id v9 = (void (**)(void))MEMORY[0x223C632B0](self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v9) {
      v9[2](v9);
    }
    v11.receiver = self;
    v11.super_class = (Class)SKSetupServer;
    [(SKSetupBase *)&v11 _invalidated];
  }
}

- (void)_invalidate
{
  [(SKSetupServer *)self _bleAdvertiserEnsureStopped];
  [(SKSetupServer *)self _bleServerEnsureStopped];
  [(SKSetupServer *)self _nanPublisherEnsureStopped];
  [(SKSetupServer *)self _wifiKeepAliveEnsureStopped];
  v3.receiver = self;
  v3.super_class = (Class)SKSetupServer;
  [(SKSetupBase *)&v3 _invalidate];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __41__SKSetupServer__activateWithCompletion___block_invoke;
  uint64_t v14 = &unk_264549378;
  uint64_t v17 = &v18;
  id v15 = self;
  id v5 = v4;
  id v16 = v5;
  int v6 = (void (**)(void))MEMORY[0x223C632B0](&v11);
  if (self->super._activateCalled || self->super._invalidateCalled)
  {
    uint64_t v8 = NSErrorF_safe();
    id v9 = (void *)v19[5];
    v19[5] = v8;
  }
  else
  {
    self->super._activateCalled = 1;
    int var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      int v10 = CUDescriptionWithLevel();
      LogPrintF();
    }
    [(SKSetupServer *)self _prepareSteps];
    [(SKSetupServer *)self _update];
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
  v6[2](v6);

  _Block_object_dispose(&v18, 8);
}

uint64_t __41__SKSetupServer__activateWithCompletion___block_invoke(void *a1)
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
  v7[2] = __40__SKSetupServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_264549148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __40__SKSetupServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (SKSetupServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKSetupServer;
  uint64_t v2 = [(SKSetupBase *)&v6 initWithLogCategory:&gLogCategory_SKSetupServer];
  int v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

@end