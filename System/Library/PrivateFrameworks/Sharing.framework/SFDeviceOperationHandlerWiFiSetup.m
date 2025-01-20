@interface SFDeviceOperationHandlerWiFiSetup
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceOperationHandlerWiFiSetup)init;
- (SFSession)sfSession;
- (id)createWiFiRetryMetricEvent:(id)a3 duration:(double)a4 channel:(int)a5 isScan:(BOOL)a6;
- (void)_activate;
- (void)_cleanupOldWiFiNetworks;
- (void)_completeError:(id)a3;
- (void)_handleRequestBonjourTestDone:(id)a3 responseHandler:(id)a4;
- (void)_handleRequestBonjourTestStart:(id)a3 responseHandler:(id)a4;
- (void)_handleWiFiSetupRequest:(id)a3 responseHandler:(id)a4;
- (void)_run;
- (void)_runIP4AvailableStart;
- (void)_runJoinStart:(int)a3;
- (void)_runReachabilityStart;
- (void)_runScanResults:(id)a3 error:(id)a4 channel:(int)a5;
- (void)_runScanStart:(int)a3;
- (void)activate;
- (void)addRetryMetric:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setSfSession:(id)a3;
@end

@implementation SFDeviceOperationHandlerWiFiSetup

- (SFDeviceOperationHandlerWiFiSetup)init
{
  v9.receiver = self;
  v9.super_class = (Class)SFDeviceOperationHandlerWiFiSetup;
  v2 = [(SFDeviceOperationHandlerWiFiSetup *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    wiFiRetryMetrics = v3->_wiFiRetryMetrics;
    v3->_wiFiRetryMetrics = (NSMutableArray *)v6;
  }
  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SFDeviceOperationHandlerWiFiSetup_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __45__SFDeviceOperationHandlerWiFiSetup_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _activate];
}

- (void)_activate
{
  if (self->_sfSession)
  {
    int v12 = 0;
    self->_reachabilityEnabled = CFPrefs_GetInt64() != 0;
    uint64_t Int64 = CFPrefs_GetInt64();
    if (v12) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = Int64 == 0;
    }
    BOOL v5 = !v4;
    self->_ensureIP4Configured = v5;
    sfSession = self->_sfSession;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke;
    v11[3] = &unk_1E5BBCBA8;
    v11[4] = self;
    [(SFSession *)sfSession registerRequestID:@"_bjtS" options:0 handler:v11];
    v7 = self->_sfSession;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke_2;
    v10[3] = &unk_1E5BBCBA8;
    v10[4] = self;
    [(SFSession *)v7 registerRequestID:@"_bjtD" options:0 handler:v10];
    v8 = self->_sfSession;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke_3;
    v9[3] = &unk_1E5BBCBA8;
    v9[4] = self;
    [(SFSession *)v8 registerRequestID:@"_ws" options:0 handler:v9];
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup <= 60 {
         && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestBonjourTestStart:responseHandler:");
}

uint64_t __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestBonjourTestDone:responseHandler:");
}

uint64_t __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWiFiSetupRequest:responseHandler:");
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SFDeviceOperationHandlerWiFiSetup_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __47__SFDeviceOperationHandlerWiFiSetup_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  if (v3)
  {
    BOOL v4 = NSErrorWithOSStatusF();
    (*(void (**)(uint64_t, void *, void, void))(v3 + 16))(v3, v4, 0, 0);

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 8) invalidate];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = 0;

  objc_super v9 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v9)
  {
    v10 = v9;
    dispatch_source_cancel(v10);
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 24);
  *(void *)(v13 + 24) = 0;

  [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 48);
  *(void *)(v15 + 48) = 0;

  [*(id *)(*(void *)(a1 + 32) + 256) deregisterRequestID:@"_ws"];
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 256);
  *(void *)(v17 + 256) = 0;
}

- (void)_completeError:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup > 60
      || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_11;
    }
    v14 = WiFiSetupStateToString(self->_state);
    id v13 = v15;
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup > 30 {
         || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
  }
  {
    goto LABEL_11;
  }
  LogPrintF();
LABEL_11:
  self->_state = 0;
  BOOL v4 = objc_opt_new();
  [v4 setObject:self->_wiFiRetryMetrics forKeyedSubscript:@"wifiRM"];
  if ([v15 code])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "code"));
    [v4 setObject:v5 forKeyedSubscript:@"wifiEC"];
  }
  else
  {
    [v4 setObject:0 forKeyedSubscript:@"wifiEC"];
  }
  uint64_t v6 = objc_msgSend(v15, "domain", v13, v14);
  if (v6)
  {
    uint64_t v7 = [v15 domain];
    [v4 setObject:v7 forKeyedSubscript:@"wifiED"];
  }
  else
  {
    [v4 setObject:@"Unknown" forKeyedSubscript:@"wifiED"];
  }

  v8 = [v15 description];
  if (v8)
  {
    objc_super v9 = [v15 description];
    [v4 setObject:v9 forKeyedSubscript:@"wifiEL"];
  }
  else
  {
    [v4 setObject:@"Unknown" forKeyedSubscript:@"wifiEL"];
  }

  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v10 = (NSMutableArray *)objc_opt_new();
  wiFiRetryMetrics = self->_wiFiRetryMetrics;
  self->_wiFiRetryMetrics = v10;

  if (self->_responseHandler)
  {
    if (self->_isRetrySetup)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup > 30
        || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_39;
      }
    }
    else if (gLogCategory_SFDeviceOperationWiFiSetup > 30 {
           || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_39;
    }
    LogPrintF();
LABEL_39:
    (*((void (**)(id))self->_responseHandler + 2))(self->_responseHandler);
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0;
  }
}

- (void)_handleRequestBonjourTestStart:(id)a3 responseHandler:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  v8 = CFDictionaryGetTypedValue();
  if (v8)
  {
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser invalidate];
    objc_super v9 = (CUBonjourAdvertiser *)objc_alloc_init(MEMORY[0x1E4F5E0E8]);
    bonjourAdvertiser = self->_bonjourAdvertiser;
    self->_bonjourAdvertiser = v9;

    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setDispatchQueue:self->_dispatchQueue];
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setDomain:@"local."];
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setLabel:@"SFDeviceOperationWiFi"];
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setName:v8];
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setPort:9];
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setServiceType:@"_bonjourtest._tcp"];
    id v13 = @"rpBA";
    v14[0] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser setTxtDictionary:v11];

    [(CUBonjourAdvertiser *)self->_bonjourAdvertiser activate];
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, MEMORY[0x1E4F1CC08]);
  }
  else
  {
    int v12 = NSErrorWithOSStatusF();
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 90
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v12, 0, 0);
  }
}

- (void)_handleRequestBonjourTestDone:(id)a3 responseHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    id v8 = v9;
    LogPrintF();
  }
  [(CUBonjourAdvertiser *)self->_bonjourAdvertiser invalidate];
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0;

  (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, MEMORY[0x1E4F1CC08]);
}

- (void)_handleWiFiSetupRequest:(id)a3 responseHandler:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_state)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28760];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    uint64_t v23 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v24 = (void *)v23;
    v25 = @"?";
    if (v23) {
      v25 = (__CFString *)v23;
    }
    v28[0] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v20 = [v21 errorWithDomain:v22 code:-6721 userInfo:v26];
  }
  else
  {
    self->_wifiChannel = CFDictionaryGetInt64Ranged();
    self->_wifiDirected = CFDictionaryGetInt64() != 0;
    id v8 = [v6 objectForKeyedSubscript:@"wifiEAPConfig"];
    id wifiEAPConfig = self->_wifiEAPConfig;
    self->_id wifiEAPConfig = v8;

    v10 = [v6 objectForKeyedSubscript:@"wifiEAPTE"];
    id wifiEAPTrustExceptions = self->_wifiEAPTrustExceptions;
    self->_id wifiEAPTrustExceptions = v10;

    self->_wifiHomeNetwork = CFDictionaryGetInt64() != 0;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    int v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    wifiPassword = self->_wifiPassword;
    self->_wifiPassword = v12;

    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = (NSData *)objc_claimAutoreleasedReturnValue();
    wifiPSK = self->_wifiPSK;
    self->_wifiPSK = v14;

    self->_wifiSkipReachbility = CFDictionaryGetInt64() != 0;
    self->_repairFlags = CFDictionaryGetInt64Ranged();
    self->_setupFlags = CFDictionaryGetInt64Ranged();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    wifiSSID = self->_wifiSSID;
    self->_wifiSSID = v16;

    if (self->_wifiSSID)
    {
      self->_wiFiJoinLimit = CFDictionaryGetInt64Ranged();
      self->_wiFiScanLimit = CFDictionaryGetInt64Ranged();
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_isRetrySetup = CFDictionaryGetInt64() != 0;
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30)
      {
        if (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()) {
          LogPrintF();
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
          && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      v18 = _Block_copy(v7);
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = v18;

      [(SFDeviceOperationHandlerWiFiSetup *)self _run];
      v20 = 0;
      goto LABEL_16;
    }
    v20 = NSErrorWithOSStatusF();
  }
  if (v7 && v20)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v20, 0, 0);
  }
LABEL_16:
}

- (void)_run
{
  while (!self->_invalidateCalled)
  {
    int state = self->_state;
    switch(state)
    {
      case 0:
        if (self->_responseHandler)
        {
          if (self->_wifiChannel >= 1) {
            goto LABEL_19;
          }
          goto LABEL_31;
        }
        goto LABEL_62;
      case 3:
        stepError = self->_stepError;
        if (!stepError)
        {
          NSErrorWithOSStatusF();
          id v6 = (NSError *)objc_claimAutoreleasedReturnValue();
          id v7 = self->_stepError;
          self->_stepError = v6;

          stepError = self->_stepError;
        }
        id v8 = self;
        goto LABEL_13;
      case 4:
        id v8 = self;
        stepError = 0;
LABEL_13:
        -[SFDeviceOperationHandlerWiFiSetup _completeError:](v8, "_completeError:", stepError, v18, v19);
        goto LABEL_62;
      case 11:
        dispatch_time_t v9 = dispatch_time(0, 2000000000);
        dispatchQueue = self->_dispatchQueue;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke;
        v23[3] = &unk_1E5BBC870;
        v23[4] = self;
        uint64_t v11 = v23;
        goto LABEL_33;
      case 12:
        if (self->_scanResult) {
          goto LABEL_25;
        }
        if (self->_stepDone)
        {
          unint64_t currentWiFiScanChannelCount = self->_currentWiFiScanChannelCount;
          if (currentWiFiScanChannelCount >= self->_wiFiScanLimit) {
            goto LABEL_31;
          }
          self->_unint64_t currentWiFiScanChannelCount = currentWiFiScanChannelCount + 1;
LABEL_19:
          int v13 = 11;
          goto LABEL_61;
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup > 30) {
          goto LABEL_62;
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
        {
          int v17 = 12;
          goto LABEL_72;
        }
        goto LABEL_73;
      case 13:
        dispatch_time_t v9 = dispatch_time(0, 2000000000);
        dispatchQueue = self->_dispatchQueue;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_2;
        v22[3] = &unk_1E5BBC870;
        v22[4] = self;
        uint64_t v11 = v22;
        goto LABEL_33;
      case 14:
        if (!self->_stepDone)
        {
          if (gLogCategory_SFDeviceOperationWiFiSetup > 30) {
            goto LABEL_62;
          }
          if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
          {
            int v17 = 14;
            goto LABEL_72;
          }
          goto LABEL_73;
        }
        if (!self->_stepError) {
          goto LABEL_47;
        }
        unint64_t currentWiFiJoinChannelCount = self->_currentWiFiJoinChannelCount;
        if (currentWiFiJoinChannelCount < self->_wiFiJoinLimit)
        {
          self->_unint64_t currentWiFiJoinChannelCount = currentWiFiJoinChannelCount + 1;
LABEL_25:
          int v13 = 13;
          goto LABEL_61;
        }
        goto LABEL_31;
      case 15:
        dispatch_time_t v9 = dispatch_time(0, 2000000000);
        dispatchQueue = self->_dispatchQueue;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_3;
        v21[3] = &unk_1E5BBC870;
        v21[4] = self;
        uint64_t v11 = v21;
        goto LABEL_33;
      case 16:
        if (self->_scanResult) {
          goto LABEL_38;
        }
        if (self->_stepDone)
        {
          unint64_t currentWiFiScanNoChannelCount = self->_currentWiFiScanNoChannelCount;
          if (currentWiFiScanNoChannelCount >= self->_wiFiScanLimit) {
            goto LABEL_46;
          }
          self->_unint64_t currentWiFiScanNoChannelCount = currentWiFiScanNoChannelCount + 1;
LABEL_31:
          int v13 = 15;
          goto LABEL_61;
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup > 30) {
          goto LABEL_62;
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
        {
          int v17 = 16;
          goto LABEL_72;
        }
        goto LABEL_73;
      case 17:
        dispatch_time_t v9 = dispatch_time(0, 2000000000);
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_4;
        block[3] = &unk_1E5BBC870;
        block[4] = self;
        uint64_t v11 = block;
LABEL_33:
        dispatch_after(v9, dispatchQueue, v11);
        goto LABEL_62;
      case 18:
        if (self->_stepDone)
        {
          if (self->_stepError)
          {
            unint64_t currentWiFiJoinNoChannelCount = self->_currentWiFiJoinNoChannelCount;
            if (currentWiFiJoinNoChannelCount >= self->_wiFiJoinLimit) {
              goto LABEL_46;
            }
            self->_unint64_t currentWiFiJoinNoChannelCount = currentWiFiJoinNoChannelCount + 1;
LABEL_38:
            int v13 = 17;
          }
          else
          {
LABEL_47:
            int v13 = 19;
          }
          goto LABEL_61;
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup > 30) {
          goto LABEL_62;
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
        {
          int v17 = 18;
          goto LABEL_72;
        }
        goto LABEL_73;
      case 19:
        self->_int state = 20;
        [(SFDeviceOperationHandlerWiFiSetup *)self _runIP4AvailableStart];
        goto LABEL_62;
      case 20:
        if (self->_stepDone)
        {
          if (self->_stepError) {
            goto LABEL_46;
          }
          int v13 = 21;
          goto LABEL_61;
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup > 30) {
          goto LABEL_62;
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
        {
          int v17 = 20;
          goto LABEL_72;
        }
        goto LABEL_73;
      case 21:
        self->_int state = 22;
        [(SFDeviceOperationHandlerWiFiSetup *)self _runReachabilityStart];
        goto LABEL_62;
      case 22:
        if (self->_stepDone)
        {
          if (self->_stepError) {
LABEL_46:
          }
            int v13 = 3;
          else {
            int v13 = 4;
          }
LABEL_61:
          self->_int state = v13;
        }
        else
        {
          if (gLogCategory_SFDeviceOperationWiFiSetup > 30) {
            goto LABEL_62;
          }
          if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
          {
            int v17 = 22;
LABEL_72:
            v18 = WiFiSetupStateToString(v17);
            LogPrintF();
            goto LABEL_62;
          }
LABEL_73:
          if (_LogCategory_Initialize())
          {
            int v17 = self->_state;
            goto LABEL_72;
          }
        }
LABEL_62:
        if (self->_state == state) {
          return;
        }
        break;
      default:
        if (gLogCategory_SFDeviceOperationWiFiSetup > 90) {
          goto LABEL_62;
        }
        BOOL v4 = (const char *)self->_state;
        if (gLogCategory_SFDeviceOperationWiFiSetup != -1) {
          goto LABEL_8;
        }
        if (_LogCategory_Initialize())
        {
          BOOL v4 = (const char *)self->_state;
LABEL_8:
          v18 = v4;
          v19 = WiFiSetupStateToString((int)v4);
          LogPrintF();
        }
        goto LABEL_62;
    }
  }
}

uint64_t __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 72) = 12;
  return [*(id *)(a1 + 32) _runScanStart:*(unsigned int *)(*(void *)(a1 + 32) + 100)];
}

uint64_t __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 72) = 14;
  return [*(id *)(a1 + 32) _runJoinStart:*(unsigned int *)(*(void *)(a1 + 32) + 100)];
}

uint64_t __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_3(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 72) = 16;
  return [*(id *)(a1 + 32) _runScanStart:0];
}

uint64_t __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_4(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 72) = 18;
  return [*(id *)(a1 + 32) _runJoinStart:0];
}

- (void)_runScanStart:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  scanResult = self->_scanResult;
  self->_scanResult = 0;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((int)v3 >= 1)
  {
    id v8 = [NSNumber numberWithInt:v3];
    [v7 setObject:v8 forKeyedSubscript:@"channel"];
  }
  wifiSSID = self->_wifiSSID;
  if (!wifiSSID
    || ([v7 setObject:wifiSSID forKeyedSubscript:@"ssid"],
        [v7 setObject:&unk_1EFA09620 forKeyedSubscript:@"scanDwellTime"],
        self->_scanStartTicks = mach_absolute_time(),
        WiFiScan_b()))
  {
    NSErrorWithOSStatusF();
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_stepDone = 1;
      uint64_t v11 = self->_stepError;
      self->_stepError = v10;
      int v12 = v10;

      mach_absolute_time();
      UpTicksToSecondsF();
      int v13 = -[SFDeviceOperationHandlerWiFiSetup createWiFiRetryMetricEvent:duration:channel:isScan:](self, "createWiFiRetryMetricEvent:duration:channel:isScan:", v12, v3, 1);
      [(SFDeviceOperationHandlerWiFiSetup *)self addRetryMetric:v13];

      [(SFDeviceOperationHandlerWiFiSetup *)self _run];
    }
  }
}

void __51__SFDeviceOperationHandlerWiFiSetup__runScanStart___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 248));
  id v6 = *(unsigned char **)(a1 + 32);
  if (!v6[16])
  {
    if (a2)
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F28760];
      uint64_t v9 = a2;
      uint64_t v17 = *MEMORY[0x1E4F28568];
      uint64_t v10 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v11 = (void *)v10;
      int v12 = @"?";
      if (v10) {
        int v12 = (__CFString *)v10;
      }
      v18[0] = v12;
      int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      v14 = [v7 errorWithDomain:v8 code:v9 userInfo:v13];
      [v6 _runScanResults:a3 error:v14 channel:*(unsigned int *)(a1 + 40)];
    }
    else
    {
      uint64_t v15 = *(unsigned int *)(a1 + 40);
      v16 = *(void **)(a1 + 32);
      [v16 _runScanResults:a3 error:0 channel:v15];
    }
  }
}

- (void)_runScanResults:(id)a3 error:(id)a4 channel:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v19 = a3;
  uint64_t v8 = (NSError *)a4;
  mach_absolute_time();
  UpTicksToSecondsF();
  double v10 = v9;
  uint64_t v11 = [v19 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v8 || (isKindOfClass & 1) == 0)
  {
    if (!v8)
    {
      NSErrorWithOSStatusF();
      uint64_t v8 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      uint64_t v17 = v5;
      v18 = v8;
      LogPrintF();
    }
    scanResult = -[SFDeviceOperationHandlerWiFiSetup createWiFiRetryMetricEvent:duration:channel:isScan:](self, "createWiFiRetryMetricEvent:duration:channel:isScan:", v8, v5, 1, v10, v17, v18);
    [(SFDeviceOperationHandlerWiFiSetup *)self addRetryMetric:scanResult];
  }
  else
  {
    int v13 = [(SFDeviceOperationHandlerWiFiSetup *)self createWiFiRetryMetricEvent:0 duration:v5 channel:1 isScan:v10];
    [(SFDeviceOperationHandlerWiFiSetup *)self addRetryMetric:v13];

    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      [v19 count];
      LogPrintF();
    }
    v14 = v11;
    uint64_t v8 = 0;
    scanResult = self->_scanResult;
    self->_scanResult = v14;
  }

  self->_stepDone = 1;
  stepError = self->_stepError;
  self->_stepError = v8;

  [(SFDeviceOperationHandlerWiFiSetup *)self _run];
}

- (void)_runJoinStart:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = "yes";
    if (self->_wifiEAPConfig) {
      id v6 = "yes";
    }
    else {
      id v6 = "no";
    }
    if (self->_wifiEAPTrustExceptions) {
      id v7 = "yes";
    }
    else {
      id v7 = "no";
    }
    if (self->_wifiPassword) {
      uint64_t v8 = "yes";
    }
    else {
      uint64_t v8 = "no";
    }
    if (self->_wifiPSK) {
      double v9 = "yes";
    }
    else {
      double v9 = "no";
    }
    if (!self->_wifiHomeNetwork) {
      uint64_t v5 = "no";
    }
    uint64_t repairFlags = self->_repairFlags;
    v26 = &unk_1A56EAC00;
    uint64_t v23 = v9;
    v24 = v5;
    v21 = v7;
    uint64_t v22 = v8;
    uint64_t v19 = v3;
    v20 = v6;
    wifiSSID = self->_wifiSSID;
    LogPrintF();
  }
  stepError = self->_stepError;
  self->_stepDone = 0;
  self->_stepError = 0;

  if (self->_scanResult)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_scanResult];
    int v12 = v11;
    if (self->_wifiDirected) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"directed"];
    }
    id wifiEAPConfig = self->_wifiEAPConfig;
    if (wifiEAPConfig) {
      [v12 setObject:wifiEAPConfig forKeyedSubscript:@"eapConfig"];
    }
    id wifiEAPTrustExceptions = self->_wifiEAPTrustExceptions;
    if (wifiEAPTrustExceptions) {
      [v12 setObject:wifiEAPTrustExceptions forKeyedSubscript:@"eapTrustExceptions"];
    }
    if (self->_repairFlags) {
      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"forceFix"];
    }
    if (self->_wifiHomeNetwork) {
      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"homeNetwork"];
    }
    if (self->_wifiPassword || self->_wifiPSK) {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", wifiSSID, v19, v20, v21, v22, v23, v24, repairFlags, v26);
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], @"persistent", wifiSSID, v19);
    [v12 setObject:&unk_1EFA09620 forKeyedSubscript:@"scanDwellTime"];
    self->_joinStartTicks = mach_absolute_time();
    if (WiFiJoinNetwork_b())
    {
      uint64_t v15 = NSErrorWithOSStatusF();
      if (v15)
      {
        if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
          && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_stepDone = 1;
        objc_storeStrong((id *)&self->_stepError, v15);
        mach_absolute_time();
        UpTicksToSecondsF();
        uint64_t v17 = -[SFDeviceOperationHandlerWiFiSetup createWiFiRetryMetricEvent:duration:channel:isScan:](self, "createWiFiRetryMetricEvent:duration:channel:isScan:", v15, v3, 1);
        [(SFDeviceOperationHandlerWiFiSetup *)self addRetryMetric:v17];

        [(SFDeviceOperationHandlerWiFiSetup *)self _run];
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    id v16 = (id)NSErrorWithOSStatusF();
    uint64_t v15 = 0;
    int v12 = 0;
  }
}

uint64_t __51__SFDeviceOperationHandlerWiFiSetup__runJoinStart___block_invoke(uint64_t a1, int a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 248));
  mach_absolute_time();
  uint64_t result = UpTicksToSecondsF();
  if (*(unsigned char *)(*(void *)(a1 + 32) + 16)) {
    return result;
  }
  double v6 = v5;
  if (a2)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup > 60
      || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup > 30 {
         || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
  }
  {
    goto LABEL_12;
  }
  LogPrintF();
LABEL_12:
  *(unsigned char *)(*(void *)(a1 + 32) + 76) = 1;
  uint64_t v7 = NSErrorWithOSStatusF();
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(void **)(v8 + 80);
  *(void *)(v8 + 80) = v7;

  double v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v10 createWiFiRetryMetricEvent:v10[10] duration:*(unsigned int *)(a1 + 40) channel:0 isScan:v6];
  [v10 addRetryMetric:v11];

  if (!a2) {
    [*(id *)(a1 + 32) _cleanupOldWiFiNetworks];
  }
  int v12 = *(void **)(a1 + 32);

  return [v12 _run];
}

- (void)_runIP4AvailableStart
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  if (self->_ensureIP4Configured)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke;
    aBlock[3] = &unk_1E5BBC870;
    aBlock[4] = self;
    BOOL v4 = _Block_copy(aBlock);
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    double v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    ip4Timeout = self->_ip4Timeout;
    self->_ip4Timeout = v5;

    dispatch_source_set_event_handler((dispatch_source_t)self->_ip4Timeout, v4);
    SFDispatchTimerSet(self->_ip4Timeout, 10.0, -1.0, 0.0);
    dispatch_activate((dispatch_object_t)self->_ip4Timeout);
    [(CUNetInterfaceMonitor *)self->_interfaceMonitor invalidate];
    uint64_t v7 = (CUNetInterfaceMonitor *)objc_alloc_init(MEMORY[0x1E4F5E170]);
    interfaceMonitor = self->_interfaceMonitor;
    self->_interfaceMonitor = v7;

    [(CUNetInterfaceMonitor *)self->_interfaceMonitor setDispatchQueue:self->_dispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke_2;
    v14[3] = &unk_1E5BBC8C0;
    v14[4] = self;
    id v9 = v4;
    id v15 = v9;
    [(CUNetInterfaceMonitor *)self->_interfaceMonitor setPrimaryIPChangedHandler:v14];
    double v10 = self->_interfaceMonitor;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke_3;
    v12[3] = &unk_1E5BBC8C0;
    v12[4] = self;
    id v13 = v9;
    id v11 = v9;
    [(CUNetInterfaceMonitor *)v10 activateWithCompletion:v12];
  }
  else
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_stepDone = 1;
  }
}

uint64_t __58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    uint64_t v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 76) = 1;
  double v6 = *(void **)(a1 + 32);

  return [v6 _run];
}

void *__58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke_2(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 16) && !*(unsigned char *)(v1 + 40))
  {
    uint64_t result = *(void **)(v1 + 24);
    if (result) {
      uint64_t result = (void *)[result primaryIPv4Addr];
    }
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup != -1) {
        return (void *)LogPrintF();
      }
      uint64_t result = (void *)_LogCategory_Initialize();
      if (result) {
        return (void *)LogPrintF();
      }
    }
  }
  return result;
}

void *__58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 32) + 24);
  if (result) {
    uint64_t result = (void *)[result primaryIPv4Addr];
  }
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup != -1) {
      return (void *)LogPrintF();
    }
    uint64_t result = (void *)_LogCategory_Initialize();
    if (result) {
      return (void *)LogPrintF();
    }
  }
  return result;
}

- (void)_runReachabilityStart
{
  if (self->_reachabilityEnabled)
  {
    if (!self->_wifiSkipReachbility)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_stepDone = 0;
      stepError = self->_stepError;
      self->_stepError = 0;

      [(CUReachabilityMonitor *)self->_reachabilityMonitor invalidate];
      double v5 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x1E4F5E1C0]);
      reachabilityMonitor = self->_reachabilityMonitor;
      self->_reachabilityMonitor = v5;

      [(CUReachabilityMonitor *)self->_reachabilityMonitor setDispatchQueue:self->_dispatchQueue];
      [(CUReachabilityMonitor *)self->_reachabilityMonitor setTimeout:60.0];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __58__SFDeviceOperationHandlerWiFiSetup__runReachabilityStart__block_invoke;
      v7[3] = &unk_1E5BBC8E8;
      v7[4] = self;
      [(CUReachabilityMonitor *)self->_reachabilityMonitor setCompletionHandler:v7];
      [(CUReachabilityMonitor *)self->_reachabilityMonitor activate];
      return;
    }
    goto LABEL_7;
  }
  if (self->_wifiSkipReachbility)
  {
LABEL_7:
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
  self->_stepDone = 1;
  uint64_t v3 = self->_stepError;
  self->_stepError = 0;
}

void __58__SFDeviceOperationHandlerWiFiSetup__runReachabilityStart__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 248));
  uint64_t v3 = v10;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 16)) {
    goto LABEL_18;
  }
  if (v10)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup > 60
      || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup > 30 {
         || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
  }
  {
    goto LABEL_12;
  }
  LogPrintF();
LABEL_12:
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 76) = 1;
  if (v10)
  {
    if ([v10 code] == -6748) {
      [*(id *)(*(void *)(a1 + 32) + 256) sharingSourceVersion];
    }
    uint64_t v6 = NSErrorWithOSStatusF();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 80);
    *(void *)(v7 + 80) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v9 + 80);
    *(void *)(v9 + 80) = 0;
  }

  [*(id *)(a1 + 32) _run];
  uint64_t v3 = v10;
LABEL_18:
}

- (void)_cleanupOldWiFiNetworks
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F5E318]);
  [v3 activate];
  uint64_t v4 = [v3 currentKnownNetworkProfile];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v5 = [v3 knownNetworkProfilesWithProperties:0];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqual:", v4, v16, v17) & 1) == 0)
        {
          id v11 = [v10 networkName];
          char v12 = [v11 isEqual:self->_wifiSSID];

          if ((v12 & 1) == 0)
          {
            if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
              && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
            {
              id v16 = [v10 networkName];
              LogPrintF();
            }
            id v18 = 0;
            char v13 = objc_msgSend(v3, "removeKnownNetworkProfile:reason:error:", v10, 1, &v18, v16);
            id v14 = v18;
            if ((v13 & 1) == 0
              && gLogCategory_SFDeviceOperationWiFiSetup <= 90
              && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
            {
              id v15 = [v10 networkName];
              CUPrintNSError();
              uint64_t v17 = v16 = v15;
              LogPrintF();
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  [v3 invalidate];
}

- (id)createWiFiRetryMetricEvent:(id)a3 duration:(double)a4 channel:(int)a5 isScan:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = objc_opt_new();
  char v12 = [NSNumber numberWithDouble:a4];
  [v11 setObject:v12 forKeyedSubscript:@"wifiDN"];

  if ([v10 code])
  {
    char v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
    [v11 setObject:v13 forKeyedSubscript:@"wifiEC"];
  }
  else
  {
    [v11 setObject:0 forKeyedSubscript:@"wifiEC"];
  }
  id v14 = [v10 domain];
  if (v14)
  {
    id v15 = [v10 domain];
    [v11 setObject:v15 forKeyedSubscript:@"wifiED"];
  }
  else
  {
    [v11 setObject:@"Unknown" forKeyedSubscript:@"wifiED"];
  }

  id v16 = [v10 description];
  if (v16)
  {
    uint64_t v17 = [v10 description];
    [v11 setObject:v17 forKeyedSubscript:@"wifiEL"];
  }
  else
  {
    [v11 setObject:@"Unknown" forKeyedSubscript:@"wifiEL"];
  }

  uint64_t v18 = 200;
  if (v6) {
    uint64_t v18 = 208;
  }
  uint64_t v19 = 184;
  if (v6)
  {
    uint64_t v19 = 192;
    uint64_t v20 = 168;
  }
  else
  {
    uint64_t v20 = 176;
  }
  uint64_t v21 = 3;
  if (v6) {
    uint64_t v21 = 1;
  }
  uint64_t v22 = 2;
  if (v6) {
    uint64_t v22 = 0;
  }
  if (a5)
  {
    uint64_t v18 = v19;
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v23 = v21;
  }
  uint64_t v24 = [NSNumber numberWithUnsignedInteger:*(Class *)((char *)&self->super.isa + v18)];
  [v11 setObject:v24 forKeyedSubscript:@"wifiAT"];

  v25 = [NSNumber numberWithUnsignedInteger:*(Class *)((char *)&self->super.isa + v20)];
  [v11 setObject:v25 forKeyedSubscript:@"wifiLT"];

  v26 = [NSNumber numberWithInt:v10 == 0];
  [v11 setObject:v26 forKeyedSubscript:@"wifiSUCC"];

  uint64_t v27 = [NSNumber numberWithUnsignedInteger:v23];
  [v11 setObject:v27 forKeyedSubscript:@"wifiRT"];

  v28 = (void *)[v11 copy];

  return v28;
}

- (void)addRetryMetric:(id)a3
{
  id v4 = a3;
  wiFiRetryMetrics = self->_wiFiRetryMetrics;
  id v8 = v4;
  if (!wiFiRetryMetrics)
  {
    BOOL v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_wiFiRetryMetrics;
    self->_wiFiRetryMetrics = v6;

    id v4 = v8;
    wiFiRetryMetrics = self->_wiFiRetryMetrics;
  }
  [(NSMutableArray *)wiFiRetryMetrics addObject:v4];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wiFiRetryMetrics, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_wifiPSK, 0);
  objc_storeStrong((id *)&self->_wifiPassword, 0);
  objc_storeStrong(&self->_wifiEAPTrustExceptions, 0);
  objc_storeStrong(&self->_wifiEAPConfig, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_ip4Timeout, 0);
  objc_storeStrong((id *)&self->_interfaceMonitor, 0);

  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
}

@end