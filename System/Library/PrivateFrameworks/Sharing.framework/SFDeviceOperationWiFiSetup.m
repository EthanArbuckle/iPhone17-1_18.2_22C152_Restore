@interface SFDeviceOperationWiFiSetup
- (BOOL)skipLocalReachability;
- (BOOL)skipReachability;
- (NSArray)wiFiRetryMetrics;
- (NSDictionary)preferredWiFiConfiguration;
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceOperationWiFiSetup)init;
- (SFSession)sfSession;
- (double)metricBonjourTestSeconds;
- (double)metricTotalSeconds;
- (double)metricWiFiSetupSeconds;
- (id)completionHandler;
- (id)createRequestFromWiFiConfig;
- (int)bonjourTestState;
- (unint64_t)retryJoinsCount;
- (unint64_t)retryScansCount;
- (unsigned)repairFlags;
- (unsigned)setupFlags;
- (void)_activate;
- (void)_activate2;
- (void)_bonjourTestFoundDevice:(id)a3;
- (void)_bonjourTestStart;
- (void)_bonjourTestTimeout;
- (void)_complete:(id)a3;
- (void)_setupResponse:(id)a3 inResponse:(id)a4;
- (void)activate;
- (void)invalidate;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreferredWiFiConfiguration:(id)a3;
- (void)setRepairFlags:(unsigned int)a3;
- (void)setRetryJoinsCount:(unint64_t)a3;
- (void)setRetryScansCount:(unint64_t)a3;
- (void)setSetupFlags:(unsigned int)a3;
- (void)setSfSession:(id)a3;
- (void)setSkipLocalReachability:(BOOL)a3;
- (void)setSkipReachability:(BOOL)a3;
- (void)setWiFiRetryMetrics:(id)a3;
@end

@implementation SFDeviceOperationWiFiSetup

- (SFDeviceOperationWiFiSetup)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceOperationWiFiSetup;
  v2 = [(SFDeviceOperationWiFiSetup *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SFDeviceOperationWiFiSetup_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__SFDeviceOperationWiFiSetup_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_startTicks = mach_absolute_time();
  unsigned int v14 = 0;
  self->_reachabilityEnabled = CFPrefs_GetInt64() != 0;
  uint64_t Int64 = CFPrefs_GetInt64();
  if (v14) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = Int64 == 0;
  }
  BOOL v5 = !v4;
  self->_forceFailScanWiFi = v5;
  uint64_t v6 = CFPrefs_GetInt64();
  if (v14) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  BOOL v8 = !v7;
  self->_forceFailJoinWiFi = v8;
  v9 = (void *)WiFiCopyCurrentNetworkInfoEx();
  if (!v9)
  {
    v10 = NSErrorWithOSStatusF();
    -[SFDeviceOperationWiFiSetup _complete:](self, "_complete:", v10, v14);

    goto LABEL_37;
  }
  if (self->_reachabilityEnabled)
  {
    if (!self->_skipLocalReachability)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v11 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x1E4F5E1C0]);
      reachabilityMonitor = self->_reachabilityMonitor;
      self->_reachabilityMonitor = v11;

      [(CUReachabilityMonitor *)self->_reachabilityMonitor setDispatchQueue:self->_dispatchQueue];
      [(CUReachabilityMonitor *)self->_reachabilityMonitor setTimeout:60.0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __39__SFDeviceOperationWiFiSetup__activate__block_invoke;
      v13[3] = &unk_1E5BBC8E8;
      v13[4] = self;
      [(CUReachabilityMonitor *)self->_reachabilityMonitor setCompletionHandler:v13];
      [(CUReachabilityMonitor *)self->_reachabilityMonitor activate];
      goto LABEL_37;
    }
    goto LABEL_25;
  }
  if (self->_skipLocalReachability)
  {
LABEL_25:
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!self->_reachabilityEnabled
    && gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFDeviceOperationWiFiSetup *)self _activate2];
LABEL_37:
}

void __39__SFDeviceOperationWiFiSetup__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 32))
  {
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
    id v7 = v3;

    if (v7)
    {
      uint64_t v6 = NSErrorNestedF();
      [*(id *)(a1 + 32) _complete:v6];
    }
    else
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [*(id *)(a1 + 32) _activate2];
    }
    id v3 = v7;
  }
}

- (void)_activate2
{
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  unsigned int v40 = 0;
  uint64_t v3 = [(SFDeviceOperationWiFiSetup *)self createRequestFromWiFiConfig];
  if (!v3)
  {
    BOOL v5 = (void *)WiFiCopyCurrentNetworkInfoEx();
    if (v5)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      CFStringGetTypeID();
      uint64_t v6 = CFDictionaryGetTypedValue();
      if (!v6)
      {
        v30 = NSErrorWithOSStatusF();

        v18 = 0;
        goto LABEL_75;
      }
      [v4 setObject:v6 forKeyedSubscript:@"wifiSSID"];
      id v7 = [v5 objectForKeyedSubscript:@"password"];
      if (v7
        || ([v5 objectForKeyedSubscript:@"open"],
            (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
      {

LABEL_14:
        uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
        if ((int)Int64Ranged >= 1)
        {
          if (self->_forceFailScanWiFi) {
            uint64_t v9 = 100;
          }
          else {
            uint64_t v9 = Int64Ranged;
          }
          v10 = [NSNumber numberWithInt:v9];
          [v4 setObject:v10 forKeyedSubscript:@"wifiCh"];
        }
        if (CFDictionaryGetInt64()) {
          [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"wifiDirected"];
        }
        if (CFDictionaryGetInt64())
        {
          v11 = [v5 objectForKeyedSubscript:@"eapConfig"];
          if (v11) {
            [v4 setObject:v11 forKeyedSubscript:@"wifiEAPConfig"];
          }
          v12 = [v5 objectForKeyedSubscript:@"eapTrustExceptions"];

          if (v12)
          {
            [v4 setObject:v12 forKeyedSubscript:@"wifiEAPTE"];
          }
        }
        uint64_t Int64 = CFDictionaryGetInt64();
        if (Int64) {
          [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"wifiHN"];
        }
        CFStringGetTypeID();
        uint64_t v14 = CFDictionaryGetTypedValue();
        v15 = (void *)v14;
        if (v14)
        {
          if (self->_forceFailJoinWiFi) {
            v16 = &stru_1EF9BDC68;
          }
          else {
            v16 = (__CFString *)v14;
          }
          [v4 setObject:v16 forKeyedSubscript:@"wifiPW"];
          v17 = "no";
          v18 = v15;
        }
        else
        {
          CFDataGetTypeID();
          v18 = CFDictionaryGetTypedValue();
          if (v18)
          {
            [v4 setObject:v18 forKeyedSubscript:@"wifiPSK"];
            v17 = "yes";
          }
          else
          {
            v17 = "no";
          }
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
          && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
        {
          v20 = "yes";
          if (v15) {
            v21 = "yes";
          }
          else {
            v21 = "no";
          }
          if (!Int64) {
            v20 = "no";
          }
          unint64_t retryScansCount = (unint64_t)v6;
          unint64_t retryJoinsCount = Int64Ranged;
          v36 = v17;
          v37 = v20;
          v35 = v21;
          LogPrintF();
        }

        goto LABEL_55;
      }
      v19 = [v5 objectForKeyedSubscript:@"enterprise"];

      if (v19) {
        goto LABEL_14;
      }
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 90
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v33 = v40;
      v31 = NSErrorWithOSStatusF();
    }
    else
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v33 = v40;
      v31 = NSErrorWithOSStatusF();
      uint64_t v6 = 0;
      id v4 = 0;
    }
    -[SFDeviceOperationWiFiSetup _complete:](self, "_complete:", v31, v33);

    v30 = 0;
    v18 = 0;
    goto LABEL_67;
  }
  id v4 = (id)v3;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v18 = 0;
  uint64_t v6 = 0;
LABEL_55:
  if (self->_repairFlags)
  {
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v4 setObject:v22 forKeyedSubscript:@"rpFl"];
  }
  if (self->_setupFlags)
  {
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v4 setObject:v23 forKeyedSubscript:@"suFl"];
  }
  if (self->_skipReachability) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"wifiSR"];
  }
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    unint64_t retryScansCount = self->_retryScansCount;
    unint64_t retryJoinsCount = self->_retryJoinsCount;
    LogPrintF();
  }
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_retryJoinsCount, retryScansCount, retryJoinsCount, v35, v36, v37);
  [v4 setObject:v24 forKeyedSubscript:@"wifiJC"];

  v25 = [NSNumber numberWithUnsignedInteger:self->_retryScansCount];
  [v4 setObject:v25 forKeyedSubscript:@"wifiRC"];

  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"wifiRS"];
  sfSession = self->_sfSession;
  if (sfSession)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __40__SFDeviceOperationWiFiSetup__activate2__block_invoke;
    v39[3] = &unk_1E5BBCBF8;
    v39[4] = self;
    [(SFSession *)sfSession sendRequestID:@"_ws" options:0 request:v4 responseHandler:v39];
    v27 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v27;

    v29 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__SFDeviceOperationWiFiSetup__activate2__block_invoke_2;
    handler[3] = &unk_1E5BBC870;
    handler[4] = self;
    dispatch_source_set_event_handler(v29, handler);
    SFDispatchTimerSet(self->_timeoutTimer, 60.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    v30 = 0;
    goto LABEL_67;
  }
  v30 = NSErrorWithOSStatusF();
LABEL_75:
  if (v30) {
    [(SFDeviceOperationWiFiSetup *)self _complete:v30];
  }
LABEL_67:
}

unsigned char *__40__SFDeviceOperationWiFiSetup__activate2__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[32]) {
    return (unsigned char *)objc_msgSend(result, "_setupResponse:inResponse:", a2);
  }
  return result;
}

void __40__SFDeviceOperationWiFiSetup__activate2__block_invoke_2(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[32])
  {
    NSErrorWithOSStatusF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v1 _complete:v2];
  }
}

- (id)createRequestFromWiFiConfig
{
  CFStringGetTypeID();
  uint64_t v3 = (void *)CFPrefs_CopyTypedValue();
  CFStringGetTypeID();
  id v4 = (void *)CFPrefs_CopyTypedValue();
  BOOL v5 = objc_opt_new();
  if (v3 && v4)
  {
    id preferredWiFiConfiguration = v3;
    id v7 = v4;
  }
  else
  {
    id preferredWiFiConfiguration = self->_preferredWiFiConfiguration;
    if (!preferredWiFiConfiguration)
    {
      BOOL v8 = 0;
      goto LABEL_14;
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id preferredWiFiConfiguration = (id)objc_claimAutoreleasedReturnValue();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  BOOL v8 = v7;
  id v9 = 0;
  if (!preferredWiFiConfiguration || !v7) {
    goto LABEL_25;
  }
  if (![preferredWiFiConfiguration length])
  {
LABEL_14:
    id v9 = 0;
    goto LABEL_25;
  }
  [v5 setObject:preferredWiFiConfiguration forKeyedSubscript:@"wifiSSID"];
  if ([(__CFString *)v8 length])
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_forceFailJoinWiFi) {
      v10 = &stru_1EF9BDC68;
    }
    else {
      v10 = v8;
    }
    [v5 setObject:v10 forKeyedSubscript:@"wifiPW"];
  }
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v9 = v5;
LABEL_25:

  return v9;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SFDeviceOperationWiFiSetup_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __40__SFDeviceOperationWiFiSetup_invalidate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 _complete:v7];
}

- (void)_bonjourTestStart
{
  v18[1] = *MEMORY[0x1E4F143B8];
  __int16 v16 = 0;
  int v15 = 0;
  RandomBytes();
  uint64_t v3 = NSStringWithMACAddress();
  objc_storeStrong((id *)&self->_bonjourTestID, v3);
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_bonjourTestState = 1;
  self->_startBonjourTestTicks = mach_absolute_time();
  [(CUBonjourBrowser *)self->_bonjourBrowser invalidate];
  uint64_t v4 = (CUBonjourBrowser *)objc_alloc_init(MEMORY[0x1E4F5E0F0]);
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = v4;

  [(CUBonjourBrowser *)self->_bonjourBrowser setChangeFlags:0xFFFFFFFFLL];
  [(CUBonjourBrowser *)self->_bonjourBrowser setDispatchQueue:self->_dispatchQueue];
  [(CUBonjourBrowser *)self->_bonjourBrowser setDomain:@"local."];
  [(CUBonjourBrowser *)self->_bonjourBrowser setLabel:@"SFDeviceOperationWiFi"];
  [(CUBonjourBrowser *)self->_bonjourBrowser setServiceType:@"_bonjourtest._tcp"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke;
  v14[3] = &unk_1E5BC03E0;
  v14[4] = self;
  [(CUBonjourBrowser *)self->_bonjourBrowser setDeviceFoundHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_2;
  v13[3] = &unk_1E5BC0408;
  v13[4] = self;
  [(CUBonjourBrowser *)self->_bonjourBrowser setDeviceChangedHandler:v13];
  [(CUBonjourBrowser *)self->_bonjourBrowser activate];
  v17 = @"bjtID";
  v18[0] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  sfSession = self->_sfSession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_3;
  v12[3] = &unk_1E5BBCBF8;
  v12[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_bjtS" options:0 request:v6 responseHandler:v12];
  BOOL v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  bonjourTimer = self->_bonjourTimer;
  self->_bonjourTimer = v8;

  v10 = self->_bonjourTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_4;
  handler[3] = &unk_1E5BBC870;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  SFDispatchTimerSet(self->_bonjourTimer, 16.0, -1.0, 1.0);
  dispatch_resume((dispatch_object_t)self->_bonjourTimer);
}

void *__47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[1]) {
    return (void *)[result _bonjourTestFoundDevice:a2];
  }
  return result;
}

void *__47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[1]) {
    return (void *)[result _bonjourTestFoundDevice:a2];
  }
  return result;
}

void __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 32)
    && gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bonjourTestTimeout];
}

- (void)_bonjourTestFoundDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 txtDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"rpBA"];

  if ([v6 isEqual:self->_bonjourTestID])
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      id v12 = v4;
      LogPrintF();
    }
    self->_bonjourTestState = 4;
    bonjourTimer = self->_bonjourTimer;
    if (bonjourTimer)
    {
      id v8 = bonjourTimer;
      dispatch_source_cancel(v8);
      id v9 = self->_bonjourTimer;
      self->_bonjourTimer = 0;
    }
    [(CUBonjourBrowser *)self->_bonjourBrowser invalidate];
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0;

    sfSession = self->_sfSession;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__SFDeviceOperationWiFiSetup__bonjourTestFoundDevice___block_invoke;
    v13[3] = &unk_1E5BBCBF8;
    v13[4] = self;
    [(SFSession *)sfSession sendRequestID:@"_bjtD" options:0 request:MEMORY[0x1E4F1CC08] responseHandler:v13];
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup <= 30 {
         && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __54__SFDeviceOperationWiFiSetup__bonjourTestFoundDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v6 = a4;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 104) = v7;
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 104);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_complete:", 0, v9, v6, v12);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_complete:", 0, v8, v10, v11);
    }
  }
}

- (void)_bonjourTestTimeout
{
  if (!self->_invalidateCalled)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricBonjourTestSeconds = v3;
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 90
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_bonjourTestState = 3;
    [(SFDeviceOperationWiFiSetup *)self _complete:0];
  }
}

- (void)_complete:(id)a3
{
  id v4 = a3;
  bonjourTimer = self->_bonjourTimer;
  id v13 = v4;
  if (bonjourTimer)
  {
    id v6 = bonjourTimer;
    dispatch_source_cancel(v6);
    uint64_t v7 = self->_bonjourTimer;
    self->_bonjourTimer = 0;

    id v4 = v13;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    uint64_t v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    uint64_t v10 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    id v4 = v13;
  }
  if (self->_completionHandler)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricTotalSeconds = v11;
    if (v13)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup > 60
        || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_16;
      }
    }
    else if (gLogCategory_SFDeviceOperationWiFiSetup > 30 {
           || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_16;
    }
    LogPrintF();
LABEL_16:
    (*((void (**)(id, id))self->_completionHandler + 2))(self->_completionHandler, v13);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    id v4 = v13;
  }
}

- (void)_setupResponse:(id)a3 inResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_double metricWiFiSetupSeconds = v8;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    double metricWiFiSetupSeconds = *(double *)&v7;
    LogPrintF();
  }
  if (v6)
  {
    id v9 = v6;
LABEL_13:
    -[SFDeviceOperationWiFiSetup _complete:](self, "_complete:", v9, *(void *)&metricWiFiSetupSeconds);

    goto LABEL_14;
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  CFStringGetTypeID();
  double v11 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  id v12 = CFDictionaryGetTypedValue();
  if (Int64Ranged)
  {
    [v12 UTF8String];
    NSErrorF();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  id v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  self->_wiFiRetryMetrics = v13;

  if (v9) {
    goto LABEL_13;
  }
  if ((self->_setupFlags & 1) == 0)
  {
    id v9 = 0;
    goto LABEL_13;
  }
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    double metricWiFiSetupSeconds = self->_metricWiFiSetupSeconds;
    LogPrintF();
  }
  [(SFDeviceOperationWiFiSetup *)self _bonjourTestStart];
LABEL_14:
}

- (int)bonjourTestState
{
  return self->_bonjourTestState;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (double)metricBonjourTestSeconds
{
  return self->_metricBonjourTestSeconds;
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (double)metricWiFiSetupSeconds
{
  return self->_metricWiFiSetupSeconds;
}

- (unsigned)repairFlags
{
  return self->_repairFlags;
}

- (void)setRepairFlags:(unsigned int)a3
{
  self->_repairFlags = a3;
}

- (unsigned)setupFlags
{
  return self->_setupFlags;
}

- (void)setSetupFlags:(unsigned int)a3
{
  self->_setupFlags = a3;
}

- (BOOL)skipReachability
{
  return self->_skipReachability;
}

- (void)setSkipReachability:(BOOL)a3
{
  self->_skipReachability = a3;
}

- (BOOL)skipLocalReachability
{
  return self->_skipLocalReachability;
}

- (void)setSkipLocalReachability:(BOOL)a3
{
  self->_skipLocalReachability = a3;
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (unint64_t)retryJoinsCount
{
  return self->_retryJoinsCount;
}

- (void)setRetryJoinsCount:(unint64_t)a3
{
  self->_unint64_t retryJoinsCount = a3;
}

- (unint64_t)retryScansCount
{
  return self->_retryScansCount;
}

- (void)setRetryScansCount:(unint64_t)a3
{
  self->_unint64_t retryScansCount = a3;
}

- (NSDictionary)preferredWiFiConfiguration
{
  return self->_preferredWiFiConfiguration;
}

- (void)setPreferredWiFiConfiguration:(id)a3
{
  self->_id preferredWiFiConfiguration = (NSDictionary *)a3;
}

- (NSArray)wiFiRetryMetrics
{
  return self->_wiFiRetryMetrics;
}

- (void)setWiFiRetryMetrics:(id)a3
{
  self->_wiFiRetryMetrics = (NSArray *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourTimer, 0);
  objc_storeStrong((id *)&self->_bonjourTestID, 0);

  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
}

@end