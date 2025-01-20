@interface SKStepWiFiSetupServerCW
- (CUMessaging)skMessaging;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepWiFiSetupServerCW)init;
- (id)skCompletionHandler;
- (void)_activate;
- (void)_completeWithError:(id)a3;
- (void)_handleRequestBonjourTestDone:(id)a3 responseHandler:(id)a4;
- (void)_handleRequestBonjourTestStart:(id)a3 responseHandler:(id)a4;
- (void)_handleRequestWiFiSetup:(id)a3 responseHandler:(id)a4;
- (void)_invalidated;
- (void)_run;
- (void)_runInternetReachabilityStart;
- (void)_runJoinStart:(int)a3;
- (void)_runScanResults:(id)a3 error:(id)a4 channel:(int)a5;
- (void)_runScanStart:(int)a3;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepWiFiSetupServerCW

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_wifiPSK, 0);
  objc_storeStrong((id *)&self->_wifiPassword, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong(&self->_wifiEAPTrustExceptions, 0);
  objc_storeStrong(&self->_wifiEAPConfig, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_internetReachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourTimeoutTimer, 0);

  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
}

- (void)setSkSetupObject:(id)a3
{
}

- (SKSetupBase)skSetupObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_skSetupObject);

  return (SKSetupBase *)WeakRetained;
}

- (void)setSkMessaging:(id)a3
{
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkCompletionHandler:(id)a3
{
}

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (NSString)label
{
  return self->_label;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_runInternetReachabilityStart
{
  int var0 = self->_ucat->var0;
  if (self->_internetReachabilityEnabled)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_stepDone = 0;
    stepError = self->_stepError;
    self->_stepError = 0;

    [(CUReachabilityMonitor *)self->_internetReachabilityMonitor invalidate];
    v5 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x263F385B0]);
    internetReachabilityMonitor = self->_internetReachabilityMonitor;
    self->_internetReachabilityMonitor = v5;
    v7 = v5;

    [(CUReachabilityMonitor *)v7 setDispatchQueue:self->_dispatchQueue];
    [(CUReachabilityMonitor *)v7 setTimeout:20.0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__SKStepWiFiSetupServerCW__runInternetReachabilityStart__block_invoke;
    v9[3] = &unk_2645496B0;
    v9[4] = v7;
    v9[5] = self;
    [(CUReachabilityMonitor *)v7 setCompletionHandler:v9];
    [(CUReachabilityMonitor *)v7 activate];
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_stepDone = 1;
    v8 = self->_stepError;
    self->_stepError = 0;
  }
}

void __56__SKStepWiFiSetupServerCW__runInternetReachabilityStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4 == *(void **)(v5 + 40))
  {
    *(void *)(v5 + 40) = 0;
    id v12 = v3;

    if (v12)
    {
      uint64_t v6 = NSErrorNestedF();
      uint64_t v7 = *(void *)(a1 + 40);
      v8 = *(void **)(v7 + 104);
      *(void *)(v7 + 104) = v6;

      int v9 = **(_DWORD **)(*(void *)(a1 + 40) + 112);
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        v11 = CUPrintNSError();
        LogPrintF();
      }
    }
    else
    {
      int v10 = **(_DWORD **)(*(void *)(a1 + 40) + 112);
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 96) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_run", v11);
    id v3 = v12;
  }
}

- (void)_runJoinStart:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__413;
  v34 = __Block_byref_object_dispose__414;
  id v35 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke;
  v28[3] = &unk_2645493A0;
  v28[4] = self;
  v28[5] = &v30;
  int v29 = a3;
  uint64_t v5 = (void (**)(void))MEMORY[0x223C632B0](v28, a2);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = CUPrintNSObject();
    v8 = (void *)v7;
    int v9 = "yes";
    if (self->_wifiEAPConfig) {
      int v10 = "yes";
    }
    else {
      int v10 = "no";
    }
    if (self->_wifiEAPTrustExceptions) {
      v11 = "yes";
    }
    else {
      v11 = "no";
    }
    if (self->_wifiPassword) {
      id v12 = "yes";
    }
    else {
      id v12 = "no";
    }
    if (self->_wifiPSK) {
      v13 = "yes";
    }
    else {
      v13 = "no";
    }
    if (!self->_wifiHomeNetwork) {
      int v9 = "no";
    }
    v24 = v13;
    v25 = v9;
    v22 = v11;
    v23 = v12;
    uint64_t v20 = v3;
    v21 = v10;
    uint64_t v19 = v7;
    LogPrintF();
  }
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  v15 = self->_scanResult;
  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F386C8]);
    [v16 setScanResult:v15];
    [v16 setPassword:self->_wifiPassword];
    v17 = self->_wifiInterface;
    if (!v17)
    {
      v17 = (CWFInterface *)objc_alloc_init(MEMORY[0x263F386E0]);
      objc_storeStrong((id *)&self->_wifiInterface, v17);
      [(CWFInterface *)v17 activate];
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke_2;
    v26[3] = &unk_264548CB0;
    v26[4] = self;
    int v27 = v3;
    -[CWFInterface associateWithParameters:reply:](v17, "associateWithParameters:reply:", v16, v26, v19, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    uint64_t v18 = NSErrorF_safe();
    id v16 = (id)v31[5];
    v31[5] = v18;
  }

  v5[2](v5);
  _Block_object_dispose(&v30, 8);
}

void __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = **(_DWORD **)(v2 + 112);
    if (v3 <= 90)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v4))
      {
        uint64_t v7 = CUPrintNSError();
        LogPrintF();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    *(unsigned char *)(v2 + 96) = 1;
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v6 = (id *)(*(void *)(a1 + 32) + 104);
    objc_storeStrong(v6, v5);
  }
}

void __41__SKStepWiFiSetupServerCW__runJoinStart___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 48))
  {
    int v6 = **(_DWORD **)(v5 + 112);
    id v8 = v4;
    if (v4)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v7 = CUPrintNSError();
        LogPrintF();
      }
    }
    else if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), a2);
    [*(id *)(a1 + 32) _run];
    id v4 = v8;
  }
}

- (void)_runScanResults:(id)a3 error:(id)a4 channel:(int)a5
{
  id v13 = a3;
  uint64_t v7 = (NSError *)a4;
  id v8 = [v13 firstObject];
  int var0 = self->_ucat->var0;
  if (!v7)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [v13 count];
      LogPrintF();
    }
    v11 = v8;
    scanResult = self->_scanResult;
    self->_scanResult = v11;
    goto LABEL_12;
  }
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
  {
    scanResult = CUPrintNSError();
    LogPrintF();
LABEL_12:
  }
  self->_stepDone = 1;
  stepError = self->_stepError;
  self->_stepError = v7;

  [(SKStepWiFiSetupServerCW *)self _run];
}

- (void)_runScanStart:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__413;
  v24 = __Block_byref_object_dispose__414;
  id v25 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __41__SKStepWiFiSetupServerCW__runScanStart___block_invoke;
  v18[3] = &unk_2645493A0;
  v18[4] = self;
  v18[5] = &v20;
  int v19 = a3;
  uint64_t v5 = (void (**)(void))MEMORY[0x223C632B0](v18, a2);
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = v3;
    LogPrintF();
  }
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  scanResult = self->_scanResult;
  self->_scanResult = 0;

  id v9 = objc_alloc_init(MEMORY[0x263F386F0]);
  if ((int)v3 >= 1)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F386D8]);
    [v10 setChannel:v3];
    [v10 setFlags:28];
    v26[0] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    [v9 setChannels:v11];
  }
  id v12 = self->_wifiSSID;
  if (v12)
  {
    [v9 setSSID:v12];
    id v13 = self->_wifiInterface;
    if (!v13)
    {
      id v13 = (CWFInterface *)objc_alloc_init(MEMORY[0x263F386E0]);
      objc_storeStrong((id *)&self->_wifiInterface, v13);
      [(CWFInterface *)v13 activate];
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __41__SKStepWiFiSetupServerCW__runScanStart___block_invoke_2;
    v16[3] = &unk_264548C88;
    v16[4] = self;
    int v17 = v3;
    -[CWFInterface performScanWithParameters:reply:](v13, "performScanWithParameters:reply:", v9, v16, v15);
  }
  else
  {
    uint64_t v14 = NSErrorF_safe();
    id v13 = (CWFInterface *)v21[5];
    v21[5] = v14;
  }

  v5[2](v5);
  _Block_object_dispose(&v20, 8);
}

void __41__SKStepWiFiSetupServerCW__runScanStart___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = **(_DWORD **)(v2 + 112);
    if (v3 <= 90)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v4))
      {
        uint64_t v7 = CUPrintNSError();
        LogPrintF();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    *(unsigned char *)(v2 + 96) = 1;
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v6 = (id *)(*(void *)(a1 + 32) + 104);
    objc_storeStrong(v6, v5);
  }
}

unsigned char *__41__SKStepWiFiSetupServerCW__runScanStart___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[48]) {
    return (unsigned char *)[result _runScanResults:a3 error:a2 channel:*(unsigned int *)(a1 + 40)];
  }
  return result;
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      unint64_t runState = self->_runState;
      switch((int)runState)
      {
        case 0:
          if (self->_responseHandler)
          {
            if (self->_wifiChannel < 1) {
              goto LABEL_33;
            }
            int v4 = 11;
            goto LABEL_34;
          }
          goto LABEL_61;
        case 3:
          stepError = self->_stepError;
          if (!stepError)
          {
            NSErrorF_safe();
            int v6 = (NSError *)objc_claimAutoreleasedReturnValue();
            uint64_t v7 = self->_stepError;
            self->_stepError = v6;

            stepError = self->_stepError;
          }
          id v8 = self;
          goto LABEL_11;
        case 4:
          id v8 = self;
          stepError = 0;
LABEL_11:
          -[SKStepWiFiSetupServerCW _completeWithError:](v8, "_completeWithError:", stepError, v24);
          goto LABEL_61;
        case 11:
          self->_unint64_t runState = 12;
          uint64_t wifiChannel = self->_wifiChannel;
          id v10 = self;
          goto LABEL_20;
        case 12:
          if (self->_scanResult)
          {
            int v4 = 13;
            goto LABEL_34;
          }
          if (self->_stepDone) {
            goto LABEL_33;
          }
          int var0 = self->_ucat->var0;
          if (var0 > 30) {
            goto LABEL_61;
          }
          if (var0 == -1) {
            goto LABEL_56;
          }
          uint64_t v14 = 12;
          goto LABEL_52;
        case 13:
          self->_unint64_t runState = 14;
          uint64_t v11 = self->_wifiChannel;
          id v12 = self;
          goto LABEL_24;
        case 14:
          if (self->_stepDone)
          {
            if (!self->_stepError) {
              goto LABEL_27;
            }
LABEL_33:
            int v4 = 15;
            goto LABEL_34;
          }
          int v13 = self->_ucat->var0;
          if (v13 > 30) {
            goto LABEL_61;
          }
          if (v13 != -1)
          {
            uint64_t v14 = 14;
            goto LABEL_52;
          }
          goto LABEL_56;
        case 15:
          self->_unint64_t runState = 16;
          id v10 = self;
          uint64_t wifiChannel = 0;
LABEL_20:
          -[SKStepWiFiSetupServerCW _runScanStart:](v10, "_runScanStart:", wifiChannel, v24);
          goto LABEL_61;
        case 16:
          if (self->_scanResult)
          {
            int v4 = 17;
            goto LABEL_34;
          }
          if (self->_stepDone) {
            goto LABEL_39;
          }
          int v18 = self->_ucat->var0;
          if (v18 > 30) {
            goto LABEL_61;
          }
          if (v18 == -1) {
            goto LABEL_56;
          }
          uint64_t v14 = 16;
          goto LABEL_52;
        case 17:
          self->_unint64_t runState = 18;
          id v12 = self;
          uint64_t v11 = 0;
LABEL_24:
          -[SKStepWiFiSetupServerCW _runJoinStart:](v12, "_runJoinStart:", v11, v24, v25);
          goto LABEL_61;
        case 18:
          if (self->_stepDone)
          {
            if (self->_stepError) {
              goto LABEL_39;
            }
LABEL_27:
            int v4 = 19;
            goto LABEL_34;
          }
          int v15 = self->_ucat->var0;
          if (v15 > 30) {
            goto LABEL_61;
          }
          if (v15 != -1)
          {
            uint64_t v14 = 18;
            goto LABEL_52;
          }
          goto LABEL_56;
        case 19:
          self->_unint64_t runState = 20;
          [(SKStepWiFiSetupServerCW *)self _runInternetReachabilityStart];
          goto LABEL_61;
        case 20:
          if (!self->_stepDone)
          {
            int v16 = self->_ucat->var0;
            if (v16 > 30) {
              goto LABEL_61;
            }
            if (v16 != -1)
            {
              uint64_t v14 = 20;
              goto LABEL_52;
            }
LABEL_56:
            if (!_LogCategory_Initialize()) {
              goto LABEL_61;
            }
            uint64_t v14 = self->_runState;
            if (v14 < 0x15)
            {
LABEL_52:
              if (((0x1FF8FFuLL >> v14) & 1) == 0) {
                goto LABEL_53;
              }
              int v19 = off_264549410[v14];
            }
            else
            {
LABEL_53:
              if ((int)v14 <= 9) {
                int v19 = "?";
              }
              else {
                int v19 = "User";
              }
            }
            v24 = v19;
            LogPrintF();
            goto LABEL_61;
          }
          if (self->_stepError)
          {
LABEL_39:
            self->_unint64_t runState = 3;
          }
          else
          {
            int v4 = 4;
LABEL_34:
            self->_unint64_t runState = v4;
          }
LABEL_61:
          unint64_t v20 = self->_runState;
          if (v20 == runState) {
            return;
          }
          int v21 = self->_ucat->var0;
          if (v21 > 30) {
            continue;
          }
          if (v21 != -1) {
            goto LABEL_64;
          }
          if (_LogCategory_Initialize())
          {
            unint64_t v20 = self->_runState;
LABEL_64:
            if (runState < 0x15 && ((0x1FF8FFuLL >> runState) & 1) != 0)
            {
              uint64_t v22 = off_264549410[runState];
            }
            else if ((int)runState <= 9)
            {
              uint64_t v22 = "?";
            }
            else
            {
              uint64_t v22 = "User";
            }
            if (v20 < 0x15 && ((0x1FF8FFuLL >> v20) & 1) != 0)
            {
              v23 = off_264549410[v20];
            }
            else if ((int)v20 <= 9)
            {
              v23 = "?";
            }
            else
            {
              v23 = "User";
            }
            v24 = v22;
            id v25 = v23;
            LogPrintF();
          }
          break;
        default:
          goto LABEL_61;
      }
    }
  }
}

- (void)_handleRequestWiFiSetup:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__413;
  id v35 = __Block_byref_object_dispose__414;
  id v36 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __67__SKStepWiFiSetupServerCW__handleRequestWiFiSetup_responseHandler___block_invoke;
  v28[3] = &unk_264549378;
  uint64_t v30 = &v31;
  v28[4] = self;
  id v8 = v7;
  id v29 = v8;
  id v9 = (void (**)(void))MEMORY[0x223C632B0](v28);
  if (self->_runState) {
    goto LABEL_9;
  }
  self->_uint64_t wifiChannel = CFDictionaryGetInt64Ranged();
  self->_wifiDirected = CFDictionaryGetInt64() != 0;
  id v10 = [v6 objectForKeyedSubscript:@"_wiEC"];
  id wifiEAPConfig = self->_wifiEAPConfig;
  self->_id wifiEAPConfig = v10;

  id v12 = [v6 objectForKeyedSubscript:@"_wiET"];
  id wifiEAPTrustExceptions = self->_wifiEAPTrustExceptions;
  self->_id wifiEAPTrustExceptions = v12;

  self->_wifiHomeNetwork = CFDictionaryGetInt64() != 0;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiPassword = self->_wifiPassword;
  self->_wifiPassword = v14;

  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  int v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  wifiPSK = self->_wifiPSK;
  self->_wifiPSK = v16;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  int v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v19 = self->_wifiPassword;
  self->_wifiPassword = v18;

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  unint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  wifiSSID = self->_wifiSSID;
  self->_wifiSSID = v20;

  if (!self->_wifiSSID)
  {
LABEL_9:
    uint64_t v26 = NSErrorF_safe();
    int v27 = (void *)v32[5];
    v32[5] = v26;
  }
  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v23 = CUPrintNSObject();
      LogPrintF();
    }
    v24 = (void *)MEMORY[0x223C632B0](v8);
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = v24;

    [(SKStepWiFiSetupServerCW *)self _run];
  }
  v9[2](v9);

  _Block_object_dispose(&v31, 8);
}

uint64_t __67__SKStepWiFiSetupServerCW__handleRequestWiFiSetup_responseHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 112);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = CUPrintNSError();
      LogPrintF();
    }
    int v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (void)_handleRequestBonjourTestDone:(id)a3 responseHandler:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v12 = CUPrintNSObjectOneLine();
    LogPrintF();
  }
  [(CUBonjourAdvertiser *)self->_bonjourAdvertiser invalidate];
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0;

  bonjourTimeoutTimer = self->_bonjourTimeoutTimer;
  if (bonjourTimeoutTimer)
  {
    id v10 = bonjourTimeoutTimer;
    dispatch_source_cancel(v10);
    uint64_t v11 = self->_bonjourTimeoutTimer;
    self->_bonjourTimeoutTimer = 0;
  }
  (*((void (**)(id, void, void, void, void *))v6 + 2))(v6, MEMORY[0x263EFFA78], 0, 0, &__block_literal_global_50);
}

- (void)_handleRequestBonjourTestStart:(id)a3 responseHandler:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    int v19 = CUPrintNSObjectOneLine();
    LogPrintF();
  }
  CFStringGetTypeID();
  id v9 = CFDictionaryGetTypedValue();
  if (v9)
  {
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser invalidate];
    id v10 = objc_alloc_init(MEMORY[0x263F38530]);
    objc_storeStrong((id *)&self->_bonjourAdvertiser, v10);
    [v10 setDispatchQueue:self->_dispatchQueue];
    [v10 setDomain:@"local."];
    [v10 setLabel:@"WiFiSetup"];
    [v10 setName:v9];
    [v10 setPort:9];
    [v10 setServiceType:@"_bonjourtest._tcp"];
    uint64_t v22 = @"bjID";
    v23[0] = v9;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [v10 setTxtDictionary:v11];

    [v10 activate];
    bonjourTimeoutTimer = self->_bonjourTimeoutTimer;
    if (bonjourTimeoutTimer)
    {
      id v13 = bonjourTimeoutTimer;
      dispatch_source_cancel(v13);
      uint64_t v14 = self->_bonjourTimeoutTimer;
      self->_bonjourTimeoutTimer = 0;
    }
    int v15 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    int v16 = self->_bonjourTimeoutTimer;
    self->_bonjourTimeoutTimer = v15;
    int v17 = v15;

    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __74__SKStepWiFiSetupServerCW__handleRequestBonjourTestStart_responseHandler___block_invoke_2;
    handler[3] = &unk_2645494C0;
    handler[4] = v17;
    handler[5] = self;
    dispatch_source_set_event_handler(v17, handler);
    CUDispatchTimerSet();
    dispatch_activate(v17);
    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, MEMORY[0x263EFFA78], 0, 0, &__block_literal_global_47);
  }
  else
  {
    NSErrorWithOSStatusF();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    int v18 = self->_ucat->var0;
    if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v20 = CUPrintNSError();
      LogPrintF();
    }
    (*((void (**)(id, void, void, id, void *))v7 + 2))(v7, 0, 0, v10, &__block_literal_global_34);
  }
}

void __74__SKStepWiFiSetupServerCW__handleRequestBonjourTestStart_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v2 == *(void **)(v1 + 24))
  {
    if (v2)
    {
      int v4 = v2;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = 0;

      uint64_t v1 = *(void *)(a1 + 40);
    }
    int v7 = **(_DWORD **)(v1 + 112);
    if (v7 <= 90)
    {
      if (v7 != -1 || (int v8 = _LogCategory_Initialize(), v1 = *(void *)(a1 + 40), v8))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(a1 + 40);
      }
    }
    [*(id *)(v1 + 16) invalidate];
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = 0;
  }
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  self->_unint64_t runState = 0;
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_metricTotalSeconds = v5;
  int var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v10 = CUPrintNSError();
      LogPrintF();
    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v7 = (void (**)(void, void, void, void, void))MEMORY[0x223C632B0](self->_responseHandler);
  id responseHandler = self->_responseHandler;
  self->_id responseHandler = 0;

  if (v7)
  {
    if (v4) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = MEMORY[0x263EFFA78];
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__SKStepWiFiSetupServerCW__completeWithError___block_invoke;
    v11[3] = &unk_2645496B0;
    v11[4] = self;
    id v12 = v4;
    ((void (**)(void, uint64_t, void, id, void *))v7)[2](v7, v9, 0, v12, v11);
  }
}

void __46__SKStepWiFiSetupServerCW__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = (void (**)(void, void))MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 32) + 200));
  if (v3)
  {
    if (*(void *)(a1 + 40)) {
      id v4 = *(id *)(a1 + 40);
    }
    else {
      id v4 = v5;
    }
    ((void (**)(void, id))v3)[2](v3, v4);
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    id v6 = (void (**)(id, void *))MEMORY[0x223C632B0](self->_skCompletionHandler, a2);
    id skCompletionHandler = self->_skCompletionHandler;
    self->_id skCompletionHandler = 0;

    if (v6)
    {
      id v4 = NSErrorF_safe();
      v6[2](v6, v4);
    }
    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SKStepWiFiSetupServerCW_invalidate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __37__SKStepWiFiSetupServerCW_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = **(_DWORD **)(v3 + 112);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v3 = *(void *)(a1 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(a1 + 32);
      }
    }
    id v20 = (id)MEMORY[0x223C632B0](*(void *)(v3 + 64));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = 0;

    if (v20)
    {
      int v8 = NSErrorF_safe();
      (*((void (**)(id, void, void, void *, void *))v20 + 2))(v20, 0, 0, v8, &__block_literal_global_479);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = 0;

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 24);
    if (v12)
    {
      id v13 = v12;
      dispatch_source_cancel(v13);
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = *(void **)(v14 + 24);
      *(void *)(v14 + 24) = 0;

      uint64_t v11 = *(void *)(a1 + 32);
    }
    [*(id *)(v11 + 40) invalidate];
    uint64_t v16 = *(void *)(a1 + 32);
    int v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    [*(id *)(*(void *)(a1 + 32) + 208) deregisterRequestID:@"_bjTS" completionHandler:&__block_literal_global_19];
    [*(id *)(*(void *)(a1 + 32) + 208) deregisterRequestID:@"_bjTD" completionHandler:&__block_literal_global_21];
    [*(id *)(*(void *)(a1 + 32) + 208) deregisterRequestID:@"_wiSU" completionHandler:&__block_literal_global_23];
    [*(id *)(*(void *)(a1 + 32) + 152) invalidate];
    uint64_t v18 = *(void *)(a1 + 32);
    int v19 = *(void **)(v18 + 152);
    *(void *)(v18 + 152) = 0;

    [*(id *)(a1 + 32) _invalidated];
  }
}

- (void)_activate
{
  self->_startTicks = mach_absolute_time();
  skMessaging = self->_skMessaging;
  if (skMessaging)
  {
    self->_internetReachabilityEnabled = 1;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke;
    v11[3] = &unk_264549688;
    v11[4] = skMessaging;
    void v11[5] = self;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_2;
    v10[3] = &unk_2645496B0;
    v10[4] = skMessaging;
    v10[5] = self;
    int v4 = skMessaging;
    [(CUMessaging *)v4 registerRequestID:@"_bjTS" options:0 requestHandler:v11 completionHandler:v10];
    v8[5] = self;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_3;
    v9[3] = &unk_264549688;
    v9[4] = v4;
    v9[5] = self;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_4;
    v8[3] = &unk_2645496B0;
    v8[4] = v4;
    [(CUMessaging *)v4 registerRequestID:@"_bjTD" options:0 requestHandler:v9 completionHandler:v8];
    v6[5] = self;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_5;
    v7[3] = &unk_264549688;
    v7[4] = v4;
    v7[5] = self;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__SKStepWiFiSetupServerCW__activate__block_invoke_6;
    v6[3] = &unk_2645496B0;
    v6[4] = v4;
    [(CUMessaging *)v4 registerRequestID:@"_wiSU" options:0 requestHandler:v7 completionHandler:v6];
  }
  else
  {
    NSErrorF_safe();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(SKStepWiFiSetupServerCW *)self _completeWithError:v5];
  }
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[26]) {
    return (void *)[result _handleRequestBonjourTestStart:a3 responseHandler:a5];
  }
  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_2(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result[4];
    uint64_t result = (void *)result[5];
    if (v2 == result[26]) {
      return (void *)[result _completeWithError:a2];
    }
  }
  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[26]) {
    return (void *)[result _handleRequestBonjourTestDone:a3 responseHandler:a5];
  }
  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_4(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result[4];
    uint64_t result = (void *)result[5];
    if (v2 == result[26]) {
      return (void *)[result _completeWithError:a2];
    }
  }
  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v6 == result[26]) {
    return (void *)[result _handleRequestWiFiSetup:a3 responseHandler:a5];
  }
  return result;
}

void *__36__SKStepWiFiSetupServerCW__activate__block_invoke_6(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result[4];
    uint64_t result = (void *)result[5];
    if (v2 == result[26]) {
      return (void *)[result _completeWithError:a2];
    }
  }
  return result;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SKStepWiFiSetupServerCW_activate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SKStepWiFiSetupServerCW_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_DWORD ***)(a1 + 32);
  int v3 = *v2[14];
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(_DWORD ***)(a1 + 32);
    }
  }

  return [v2 _activate];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (NSString)description
{
  id v4 = [(id)objc_opt_class() description];
  uint64_t v2 = NSPrintF();

  return (NSString *)v2;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKStepWiFiSetupServerCW;
  [(SKStepWiFiSetupServerCW *)&v4 dealloc];
}

- (SKStepWiFiSetupServerCW)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKStepWiFiSetupServerCW;
  uint64_t v2 = [(SKStepWiFiSetupServerCW *)&v6 init];
  int v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3->_ucat = (LogCategory *)&gLogCategory_SKStepWiFiSetupServerCW;
    objc_super v4 = v3;
  }

  return v3;
}

@end