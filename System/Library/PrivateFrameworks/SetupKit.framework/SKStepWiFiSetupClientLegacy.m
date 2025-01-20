@interface SKStepWiFiSetupClientLegacy
- (BOOL)_runInit;
- (CUMessaging)skMessaging;
- (NSString)description;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (SKSetupBase)skSetupObject;
- (SKStepWiFiSetupClientLegacy)init;
- (double)metricTotalSeconds;
- (double)metricWiFiSetupSeconds;
- (id)skCompletionHandler;
- (void)_completeWithError:(id)a3;
- (void)_invalidateCore;
- (void)_invalidated;
- (void)_run;
- (void)_runInternetReachabilityStart;
- (void)_runWiFiSetupStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSkCompletionHandler:(id)a3;
- (void)setSkMessaging:(id)a3;
- (void)setSkSetupObject:(id)a3;
@end

@implementation SKStepWiFiSetupClientLegacy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_internetReachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourTimer, 0);
  objc_storeStrong((id *)&self->_bonjourTestID, 0);

  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
}

- (double)metricWiFiSetupSeconds
{
  return self->_metricWiFiSetupSeconds;
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
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

- (void)_runWiFiSetupStart
{
  v38[1] = *MEMORY[0x263EF8340];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2105;
  v35 = __Block_byref_object_dispose__2106;
  id v36 = 0;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke;
  v30[3] = &unk_2645494E8;
  v30[4] = self;
  v30[5] = &v31;
  v26 = (void (**)(void))MEMORY[0x223C632B0](v30, a2);
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = self->_wifiInterface;
  if (!v4)
  {
    v4 = (CWFInterface *)objc_alloc_init(MEMORY[0x263F386E0]);
    objc_storeStrong((id *)&self->_wifiInterface, v4);
    [(CWFInterface *)v4 activate];
  }
  v5 = [(CWFInterface *)v4 currentKnownNetworkProfile];
  if (v5)
  {
    v6 = [(CWFInterface *)v4 channel];
    uint64_t v7 = [v6 channel];

    if (v7)
    {
      v8 = [NSNumber numberWithUnsignedInteger:v7];
      [v27 setObject:v8 forKeyedSubscript:@"_wiCh"];
    }
    uint64_t v9 = [v5 SSID];
    v10 = (void *)v9;
    if (v9)
    {
      id v29 = 0;
      MEMORY[0x223C62DA0](v9, &v29);
      id v11 = v29;
      if (v11) {
        [v27 setObject:v11 forKeyedSubscript:@"_wiPW"];
      }
      v12 = [v5 networkName];
      if (v12)
      {
        [v27 setObject:v12 forKeyedSubscript:@"_wiSS"];
        v13 = self->_skMessaging;
        if (v13)
        {
          int var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v15 = CUPrintNSObject();
            v16 = (void *)v15;
            v17 = "yes";
            if (!v11) {
              v17 = "no";
            }
            uint64_t v24 = v7;
            v25 = v17;
            uint64_t v23 = v15;
            LogPrintF();
          }
          v37 = @"timeoutSeconds";
          v38[0] = &unk_26D1D0490;
          v18 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, &v37, 1, v23, v24, v25);
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke_43;
          v28[3] = &unk_264549518;
          v28[4] = self;
          [(CUMessaging *)v13 sendRequestID:@"_wiSU" requestMessage:v27 options:v18 responseHandler:v28];
        }
        else
        {
          uint64_t v22 = NSErrorF_safe();
          v18 = (void *)v32[5];
          v32[5] = v22;
        }
      }
      else
      {
        uint64_t v21 = NSErrorF_safe();
        v13 = (CUMessaging *)v32[5];
        v32[5] = v21;
      }
    }
    else
    {
      uint64_t v20 = NSErrorF_safe();
      id v11 = (id)v32[5];
      v32[5] = v20;
    }
  }
  else
  {
    uint64_t v19 = NSErrorF_safe();
    v10 = (void *)v32[5];
    v32[5] = v19;
  }

  v26[2](v26);
  _Block_object_dispose(&v31, 8);
}

void __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(v2 + 8) + 40))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = **(_DWORD **)(v3 + 96);
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(void *)(a1 + 32), uint64_t v2 = *(void *)(a1 + 40), v5))
      {
        uint64_t v7 = CUPrintNSError();
        LogPrintF();

        uint64_t v3 = *(void *)(a1 + 32);
        uint64_t v2 = *(void *)(a1 + 40);
      }
    }
    v6 = *(void **)(*(void *)(v2 + 8) + 40);
    objc_storeStrong((id *)(v3 + 80), v6);
  }
}

void __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke_43(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v14 = a2;
  id v6 = a4;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 160) = v7;
    id v8 = v14;
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = **(_DWORD **)(v9 + 96);
    if (!v8 || v6)
    {
      if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
      {
        v13 = CUPrintNSError();
        LogPrintF();
      }
      v12 = v6;
      if (!v6)
      {
        v12 = NSErrorF_safe();
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), v12);
      if (!v6) {
    }
      }
    else
    {
      if (v10 <= 30)
      {
        if (v10 != -1 || (v11 = _LogCategory_Initialize(), uint64_t v9 = *(void *)(a1 + 32), v11))
        {
          v13 = *(void **)(v9 + 160);
          LogPrintF();
          uint64_t v9 = *(void *)(a1 + 32);
        }
      }
      *(unsigned char *)(v9 + 72) = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "_run", v13);
  }
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
    int v5 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x263F385B0]);
    internetReachabilityMonitor = self->_internetReachabilityMonitor;
    self->_internetReachabilityMonitor = v5;
    uint64_t v7 = v5;

    [(CUReachabilityMonitor *)v7 setDispatchQueue:self->_dispatchQueue];
    [(CUReachabilityMonitor *)v7 setTimeout:20.0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__SKStepWiFiSetupClientLegacy__runInternetReachabilityStart__block_invoke;
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
    id v8 = self->_stepError;
    self->_stepError = 0;
  }
}

void __60__SKStepWiFiSetupClientLegacy__runInternetReachabilityStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4 == *(void **)(v5 + 40))
  {
    *(void *)(v5 + 40) = 0;
    id v12 = v3;

    if (v12)
    {
      uint64_t v6 = NSErrorNestedF();
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v6;

      int v9 = **(_DWORD **)(*(void *)(a1 + 40) + 96);
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        int v11 = CUPrintNSError();
        LogPrintF();
      }
    }
    else
    {
      int v10 = **(_DWORD **)(*(void *)(a1 + 40) + 96);
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 72) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_run", v11);
    id v3 = v12;
  }
}

- (BOOL)_runInit
{
  self->_startTicks = mach_absolute_time();
  id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v3;
  uint64_t v5 = v3;

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SKStepWiFiSetupClientLegacy__runInit__block_invoke;
  v7[3] = &unk_2645494C0;
  v7[4] = v5;
  v7[5] = self;
  dispatch_source_set_event_handler(v5, v7);
  CUDispatchTimerSet();
  dispatch_activate((dispatch_object_t)self->_timeoutTimer);

  return 1;
}

uint64_t __39__SKStepWiFiSetupClientLegacy__runInit__block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(a1 + 40);
  if (v3 == *(void *)(result + 88))
  {
    int v4 = **(_DWORD **)(result + 96);
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), result = *(void *)(a1 + 40), v5))
      {
        LogPrintF();
        uint64_t result = *(void *)(a1 + 40);
      }
    }
    if (!*(void *)(result + 80))
    {
      uint64_t v6 = NSErrorF_safe();
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v6;

      uint64_t result = *(void *)(a1 + 40);
    }
    return [(id)result _run];
  }
  return result;
}

- (void)_run
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          unint64_t runState = self->_runState;
          switch((int)runState)
          {
            case 0:
              self->_unint64_t runState = 10;
              if ([(SKStepWiFiSetupClientLegacy *)self _runInit])
              {
                int v4 = self->_runState + 1;
                goto LABEL_20;
              }
              break;
            case 11:
              self->_unint64_t runState = 12;
              [(SKStepWiFiSetupClientLegacy *)self _runInternetReachabilityStart];
              break;
            case 12:
              if (self->_stepError) {
                goto LABEL_12;
              }
              if (self->_stepDone)
              {
                int v4 = 13;
                goto LABEL_20;
              }
              break;
            case 13:
              self->_unint64_t runState = 14;
              [(SKStepWiFiSetupClientLegacy *)self _runWiFiSetupStart];
              break;
            case 14:
              if (self->_stepError)
              {
LABEL_12:
                self->_unint64_t runState = 16;
              }
              else if (self->_stepDone)
              {
                int v4 = 15;
LABEL_20:
                self->_unint64_t runState = v4;
              }
              break;
            case 15:
              int v5 = self;
              stepError = 0;
              goto LABEL_17;
            case 16:
              stepError = self->_stepError;
              if (!stepError)
              {
                NSErrorF_safe();
                uint64_t v7 = (NSError *)objc_claimAutoreleasedReturnValue();
                id v8 = self->_stepError;
                self->_stepError = v7;

                stepError = self->_stepError;
              }
              int v5 = self;
LABEL_17:
              -[SKStepWiFiSetupClientLegacy _completeWithError:](v5, "_completeWithError:", stepError, v13, v14);
              break;
            default:
              break;
          }
          unint64_t v9 = self->_runState;
          if (v9 == runState) {
            return;
          }
          int var0 = self->_ucat->var0;
        }
        while (var0 > 30);
        if (var0 == -1) {
          break;
        }
LABEL_24:
        if (runState < 0x11 && ((0x1F8FFuLL >> runState) & 1) != 0)
        {
          int v11 = off_264549538[runState];
        }
        else if ((int)runState <= 9)
        {
          int v11 = "?";
        }
        else
        {
          int v11 = "User";
        }
        if (v9 < 0x11 && ((0x1F8FFuLL >> v9) & 1) != 0)
        {
          id v12 = off_264549538[v9];
        }
        else if ((int)v9 <= 9)
        {
          id v12 = "?";
        }
        else
        {
          id v12 = "User";
        }
        v13 = v11;
        id v14 = v12;
        LogPrintF();
      }
      if (_LogCategory_Initialize())
      {
        unint64_t v9 = self->_runState;
        goto LABEL_24;
      }
    }
  }
}

- (void)_completeWithError:(id)a3
{
  id v12 = a3;
  if (v12) {
    int v4 = 3;
  }
  else {
    int v4 = 4;
  }
  self->_unint64_t runState = v4;
  mach_absolute_time();
  UpTicksToSecondsF();
  double v6 = v5;
  self->_metricTotalSeconds = v5;
  int var0 = self->_ucat->var0;
  if (v12)
  {
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      int v11 = CUPrintNSError();
      double v10 = v6;
      LogPrintF();
    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    double v10 = v6;
    LogPrintF();
  }
  [(SKStepWiFiSetupClientLegacy *)self _invalidateCore];
  id v8 = (void (**)(void, void))MEMORY[0x223C632B0](self->_skCompletionHandler);
  id skCompletionHandler = self->_skCompletionHandler;
  self->_id skCompletionHandler = 0;

  if (v8) {
    ((void (**)(void, id))v8)[2](v8, v12);
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    double v6 = (void (**)(id, void *))MEMORY[0x223C632B0](self->_skCompletionHandler, a2);
    id skCompletionHandler = self->_skCompletionHandler;
    self->_id skCompletionHandler = 0;

    if (v6)
    {
      int v4 = NSErrorF_safe();
      v6[2](v6, v4);
    }
    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_invalidateCore
{
  [(CUBonjourBrowser *)self->_bonjourBrowser invalidate];
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = 0;

  bonjourTimer = self->_bonjourTimer;
  if (bonjourTimer)
  {
    double v5 = bonjourTimer;
    dispatch_source_cancel(v5);
    double v6 = self->_bonjourTimer;
    self->_bonjourTimer = 0;
  }
  [(CUReachabilityMonitor *)self->_internetReachabilityMonitor invalidate];
  internetReachabilityMonitor = self->_internetReachabilityMonitor;
  self->_internetReachabilityMonitor = 0;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    unint64_t v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    double v10 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  [(CWFInterface *)self->_wifiInterface invalidate];
  wifiInterface = self->_wifiInterface;
  self->_wifiInterface = 0;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SKStepWiFiSetupClientLegacy_invalidate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SKStepWiFiSetupClientLegacy_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 48) = 1;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[12];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(_DWORD ***)(v2 + 32);
      }
    }
    [v3 _invalidateCore];
    double v6 = *(void **)(v2 + 32);
    return [v6 _invalidated];
  }
  return result;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SKStepWiFiSetupClientLegacy_activate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SKStepWiFiSetupClientLegacy_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = **(_DWORD **)(v2 + 96);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v4))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(unsigned char *)(v2 + 32) = 1;
  int v5 = *(void **)(a1 + 32);

  return [v5 _run];
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
  v4.super_class = (Class)SKStepWiFiSetupClientLegacy;
  [(SKStepWiFiSetupClientLegacy *)&v4 dealloc];
}

- (SKStepWiFiSetupClientLegacy)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKStepWiFiSetupClientLegacy;
  uint64_t v2 = [(SKStepWiFiSetupClientLegacy *)&v6 init];
  int v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3->_ucat = (LogCategory *)&gLogCategory_SKStepWiFiSetupClientLegacy;
    objc_super v4 = v3;
  }

  return v3;
}

@end