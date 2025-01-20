@interface SFDeviceRepairService
- (BOOL)_localDeviceSupportsAppleIDSetup;
- (BOOL)_shouldRunAppleIDSetup;
- (NSString)altDSID;
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceRepairService)init;
- (id)_whenLastProblemWasRecorded;
- (id)progressHandler;
- (unint64_t)_lastProblemRecorded;
- (unint64_t)problemFlags;
- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleGetProblemsRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleSessionEnded:(id)a3;
- (void)_handleSessionStarted:(id)a3;
- (void)_invalidate;
- (void)_recordNewProblem:(unint64_t)a3;
- (void)_registerAppleIDSetupIfNecessary;
- (void)_registerCDPAndTouchRemoteIfNecessary;
- (void)_repairMetricsDailyPush;
- (void)_repairMetricsNewProblemFlags:(unint64_t)a3;
- (void)_sfServiceStart;
- (void)activate;
- (void)invalidate;
- (void)invalidateWithFlags:(unsigned int)a3;
- (void)setAltDSID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setProblemFlags:(unint64_t)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation SFDeviceRepairService

- (SFDeviceRepairService)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFDeviceRepairService;
  v2 = [(SFDeviceRepairService *)&v8 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFDeviceRepairService_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  if (!self->_repairMetricsTimer)
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    repairMetricsTimer = self->_repairMetricsTimer;
    self->_repairMetricsTimer = v4;

    v6 = self->_repairMetricsTimer;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__SFDeviceRepairService_activate__block_invoke_2;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    dispatch_source_set_event_handler(v6, v7);
    SFDispatchTimerSet(self->_repairMetricsTimer, 86400.0, 86400.0, -5.0);
    dispatch_resume((dispatch_object_t)self->_repairMetricsTimer);
  }
}

uint64_t __33__SFDeviceRepairService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = CFPrefs_GetInt64() != 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return [*(id *)(a1 + 32) _sfServiceStart];
}

uint64_t __33__SFDeviceRepairService_activate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _repairMetricsDailyPush];
}

- (void)setProblemFlags:(unint64_t)a3
{
  if ([(SFDeviceRepairService *)self _lastProblemRecorded] != a3)
  {
    [(SFDeviceRepairService *)self _repairMetricsNewProblemFlags:a3];
    [(SFDeviceRepairService *)self _recordNewProblem:a3];
  }
  self->_problemFlags = a3;
  if (a3) {
    uint64_t v5 = 10;
  }
  else {
    uint64_t v5 = 0;
  }
  [(SFService *)self->_sfService setDeviceActionType:v5];
  [(SFService *)self->_sfService setProblemFlags:a3];
  sfService = self->_sfService;

  [(SFService *)sfService setNeedsSetup:a3 != 0];
}

- (void)invalidate
{
}

- (void)invalidateWithFlags:(unsigned int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__SFDeviceRepairService_invalidateWithFlags___block_invoke;
  v4[3] = &unk_1E5BBEE88;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __45__SFDeviceRepairService_invalidateWithFlags___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 9))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = *(unsigned int *)(v1 + 40);
      unsigned int v5 = &unk_1A56EAC4D;
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 9) = 1;
    *(_DWORD *)(*(void *)(v1 + 32) + 12) = *(_DWORD *)(v1 + 40);
    v2 = *(void **)(v1 + 32);
    if ((*(unsigned char *)(v1 + 40) & 1) != 0 && v2[3])
    {
      if (gLogCategory_SFDeviceRepairService <= 30
        && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(*(id *)(*(void *)(v1 + 32) + 16), "setNeedsSetup:", 0, v4, v5);
      result = [*(id *)(*(void *)(v1 + 32) + 16) deviceActionType];
      if (result)
      {
        v3 = *(void **)(*(void *)(v1 + 32) + 16);
        return [v3 setDeviceActionType:0];
      }
    }
    else
    {
      return [v2 _invalidate];
    }
  }
  return result;
}

- (void)_invalidate
{
  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    [(SFDeviceRepairService *)self _handleSessionEnded:self->_sfSession];
    [(SFService *)self->_sfService invalidate];
    sfService = self->_sfService;
    self->_sfService = 0;

    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler)
    {
      progressHandler[2](progressHandler, 20, 0);
      id v5 = self->_progressHandler;
    }
    else
    {
      id v5 = 0;
    }
    self->_progressHandler = 0;

    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_sfServiceStart
{
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFService *)self->_sfService invalidate];
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  [(SFService *)self->_sfService setDispatchQueue:self->_dispatchQueue];
  [(SFService *)self->_sfService setIdentifier:@"com.apple.sharing.Repair"];
  [(SFService *)self->_sfService setLabel:@"TTF"];
  [(SFService *)self->_sfService setNeedsSetup:self->_problemFlags != 0];
  if (self->_problemFlags) {
    uint64_t v5 = 10;
  }
  else {
    uint64_t v5 = 0;
  }
  [(SFService *)self->_sfService setDeviceActionType:v5];
  [(SFService *)self->_sfService setOverrideScreenOff:1];
  [(SFService *)self->_sfService setPairSetupDisabled:1];
  [(SFService *)self->_sfService setProblemFlags:self->_problemFlags];
  [(SFService *)self->_sfService setSessionFlags:33];
  [(SFService *)self->_sfService setOverrideScreenOff:1];
  [(SFService *)self->_sfService setTouchRemoteEnabled:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__SFDeviceRepairService__sfServiceStart__block_invoke;
  v9[3] = &unk_1E5BBE028;
  v9[4] = self;
  [(SFService *)self->_sfService setSessionStartedHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__SFDeviceRepairService__sfServiceStart__block_invoke_2;
  v8[3] = &unk_1E5BBE050;
  v8[4] = self;
  [(SFService *)self->_sfService setSessionEndedHandler:v8];
  v6 = self->_sfService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SFDeviceRepairService__sfServiceStart__block_invoke_3;
  v7[3] = &unk_1E5BBC8E8;
  v7[4] = self;
  [(SFService *)v6 activateWithCompletion:v7];
}

uint64_t __40__SFDeviceRepairService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionStarted:a2];
}

uint64_t __40__SFDeviceRepairService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionEnded:a2];
}

void __40__SFDeviceRepairService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFDeviceRepairService <= 90
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 160);
    if (v4)
    {
      v6 = @"eo";
      v7[0] = v3;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
      (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 30, v5);
    }
  }
}

- (void)_repairMetricsDailyPush
{
  v17[2] = *MEMORY[0x1E4F143B8];
  unint64_t problemFlags = self->_problemFlags;
  NSAppendPrintF();
  id v3 = (__CFString *)0;
  v16[0] = @"rawflags";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_problemFlags, problemFlags, &unk_1A56EAC5E);
  v16[1] = @"problemFlags";
  v17[0] = v4;
  uint64_t v5 = &stru_1EF9BDC68;
  if (v3) {
    uint64_t v5 = v3;
  }
  v17[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v7 = (void *)[v6 mutableCopy];

  objc_super v8 = [(SFDeviceRepairService *)self _whenLastProblemWasRecorded];
  if (v8)
  {
    unint64_t v9 = self->_problemFlags;
    v10 = NSNumber;
    v11 = [MEMORY[0x1E4F1C9C8] now];
    [v11 timeIntervalSinceDate:v8];
    v12 = objc_msgSend(v10, "numberWithDouble:");
    if (v9) {
      v13 = @"timeInBad";
    }
    else {
      v13 = @"timeInGood";
    }
    [v7 setObject:v12 forKeyedSubscript:v13];
  }
  v14 = (void *)[v7 copy];
  SFMetricsLog(@"com.apple.sharing.ServiceProblemFlagsDaily", v14);
}

- (void)_repairMetricsNewProblemFlags:(unint64_t)a3
{
  v30[6] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(SFDeviceRepairService *)self _lastProblemRecorded];
  NSAppendPrintF();
  v6 = (__CFString *)0;
  NSAppendPrintF();
  v7 = (__CFString *)0;
  NSAppendPrintF();
  objc_super v8 = (__CFString *)0;
  v29[0] = @"flags";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3, v5, &unk_1A56EAC5E);
  v10 = (void *)v9;
  v28 = v6;
  if (v6) {
    v11 = v6;
  }
  else {
    v11 = &stru_1EF9BDC68;
  }
  v30[0] = v9;
  v30[1] = v11;
  v29[1] = @"problemFlags";
  v29[2] = @"prevFlags";
  uint64_t v12 = [NSNumber numberWithUnsignedLongLong:self->_problemFlags];
  v13 = (void *)v12;
  v27 = v7;
  if (v7) {
    v14 = v7;
  }
  else {
    v14 = &stru_1EF9BDC68;
  }
  v30[2] = v12;
  v30[3] = v14;
  v29[3] = @"prevFlagsStr";
  v29[4] = @"lastProblem";
  uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v5];
  v16 = (void *)v15;
  v29[5] = @"lastProblemStr";
  if (v8) {
    v17 = v8;
  }
  else {
    v17 = &stru_1EF9BDC68;
  }
  v30[4] = v15;
  v30[5] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:6];
  v19 = (void *)[v18 mutableCopy];

  v20 = [(SFDeviceRepairService *)self _whenLastProblemWasRecorded];
  if (v20)
  {
    if (a3 && !v5)
    {
      v21 = NSNumber;
      v22 = [MEMORY[0x1E4F1C9C8] now];
      [v22 timeIntervalSinceDate:v20];
      v23 = objc_msgSend(v21, "numberWithDouble:");
      v24 = @"timeInGood";
LABEL_17:
      [v19 setObject:v23 forKeyedSubscript:v24];

      goto LABEL_18;
    }
    if (!a3 && v5)
    {
      v25 = NSNumber;
      v22 = [MEMORY[0x1E4F1C9C8] now];
      [v22 timeIntervalSinceDate:v20];
      v23 = objc_msgSend(v25, "numberWithDouble:");
      v24 = @"timeInBad";
      goto LABEL_17;
    }
  }
LABEL_18:
  v26 = (void *)[v19 copy];
  SFMetricsLog(@"com.apple.sharing.ServiceProblemFlags", v26);
}

- (void)_recordNewProblem:(unint64_t)a3
{
  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = NSNumber;
  unint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  [v5 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  [v8 setObject:v6 forKey:@"lastProblemTimeIntervalSince1970"];

  v7 = [NSNumber numberWithUnsignedLongLong:a3];
  [v8 setObject:v7 forKey:@"lastProblemFlags"];
}

- (unint64_t)_lastProblemRecorded
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"lastProblemFlags"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_whenLastProblemWasRecorded
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"lastProblemTimeIntervalSince1970"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    unint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)_handleSessionStarted:(id)a3
{
  id v5 = a3;
  p_sfSession = &self->_sfSession;
  if (!self->_sfSession)
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      v20 = [v5 peer];
      LogPrintF();
    }
    uint64_t v8 = mach_absolute_time();
    unint64_t problemFlags = self->_problemFlags;
    self->_startTicks = v8;
    self->_startProblemFlags = problemFlags;
    objc_storeStrong((id *)&self->_sfSession, a3);
    v10 = (__WiFiManagerClient *)WiFiManagerClientCreate();
    self->_wifiManager = v10;
    if (v10)
    {
      WiFiManagerClientDisable();
    }
    else if (gLogCategory_SFDeviceRepairService <= 60 {
           && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    sfSession = self->_sfSession;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__SFDeviceRepairService__handleSessionStarted___block_invoke;
    v23[3] = &unk_1E5BBCBA8;
    v23[4] = self;
    [(SFSession *)sfSession registerRequestID:@"_getprob", 0, v23, v20 options handler];
    uint64_t v12 = objc_alloc_init(SFDeviceOperationHandlerWiFiSetup);
    wifiSetupHandler = self->_wifiSetupHandler;
    self->_wifiSetupHandler = v12;

    [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler setSfSession:v5];
    [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler activate];
    if (SFDeviceClassCodeGet() == 4)
    {
      v14 = objc_alloc_init(SFDeviceOperationHandlerCNJSetup);
      captiveNetworkHandler = self->_captiveNetworkHandler;
      self->_captiveNetworkHandler = v14;

      [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler setSfSession:v5];
      [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler activate];
    }
    v16 = self->_sfSession;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__SFDeviceRepairService__handleSessionStarted___block_invoke_2;
    v22[3] = &unk_1E5BBCBA8;
    v22[4] = self;
    [(SFSession *)v16 registerRequestID:@"_finish" options:0 handler:v22];
    v17 = (HMDeviceSetupOperationHandler *)objc_alloc_init((Class)getHMDeviceSetupOperationHandlerClass_0[0]());
    homeKitSetupHandler = self->_homeKitSetupHandler;
    self->_homeKitSetupHandler = v17;

    v19 = self->_homeKitSetupHandler;
    v7 = [(SFSession *)self->_sfSession trSession];
    [(HMDeviceSetupOperationHandler *)v19 registerMessageHandlersForSession:v7];
    goto LABEL_20;
  }
  if (gLogCategory_SFDeviceRepairService <= 60
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    v7 = [v5 peer];
    v21 = [(SFSession *)*p_sfSession peer];
    LogPrintF();

LABEL_20:
  }
}

uint64_t __47__SFDeviceRepairService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleGetProblemsRequest:responseHandler:");
}

uint64_t __47__SFDeviceRepairService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishRequest:responseHandler:");
}

- (void)_registerCDPAndTouchRemoteIfNecessary
{
  if (![(SFDeviceRepairService *)self _shouldRunAppleIDSetup])
  {
    if (self->_prefCDPEnabled)
    {
      id v3 = objc_alloc_init(SFDeviceOperationHandlerCDPSetup);
      cdpSetupHandler = self->_cdpSetupHandler;
      self->_cdpSetupHandler = v3;

      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setFailIfCDPNotEnabled:1];
      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setSfSession:self->_sfSession];
      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler activate];
    }
    id v5 = objc_alloc_init(SFTouchRemoteAccountServicesHandlerConfiguration);
    [(SFTouchRemoteAccountServicesHandlerConfiguration *)v5 setDispatchQueue:self->_dispatchQueue];
    v6 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFA0A0A0];
    [(SFTouchRemoteAccountServicesHandlerConfiguration *)v5 setSupportedTRAccountServices:v6];

    [(SFTouchRemoteAccountServicesHandlerConfiguration *)v5 setIsPrimaryAppleAccount:1];
    [(SFTouchRemoteAccountServicesHandlerConfiguration *)v5 setShouldActivateStoreAccount:SFDeviceClassCodeGet() == 4];
    [(SFTouchRemoteAccountServicesHandlerConfiguration *)v5 setShouldSuppressStoreSignInDialogs:1];
    [(SFTouchRemoteAccountServicesHandlerConfiguration *)v5 setShouldIgnoreStoreAccountConversion:1];
    v7 = [[SFTouchRemoteAccountServicesHandler alloc] initWithConfiguration:v5];
    touchRemoteHandler = self->_touchRemoteHandler;
    self->_touchRemoteHandler = v7;

    uint64_t v9 = self->_touchRemoteHandler;
    v10 = [(SFSession *)self->_sfSession trSession];
    id v12 = 0;
    LOBYTE(v9) = [(SFTouchRemoteAccountServicesHandler *)v9 activateWithSession:v10 error:&v12];
    id v11 = v12;

    if ((v9 & 1) == 0
      && gLogCategory_SFDeviceRepairService <= 90
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (BOOL)_localDeviceSupportsAppleIDSetup
{
  int v2 = _os_feature_enabled_impl();
  if (v2) {
    LOBYTE(v2) = SFDeviceClassCodeGet() == 6;
  }
  return v2;
}

- (BOOL)_shouldRunAppleIDSetup
{
  unint64_t v2 = (self->_peerFeatureFlags >> 15) & 1;
  return [(SFDeviceRepairService *)self _localDeviceSupportsAppleIDSetup] & v2;
}

- (void)_registerAppleIDSetupIfNecessary
{
  if (![(SFDeviceRepairService *)self _shouldRunAppleIDSetup]) {
    return;
  }
  if (self->_altDSID)
  {
    id v3 = [(SFSession *)self->_sfSession messageSessionTemplate];

    if (v3)
    {
      id v6 = objc_alloc_init(getAISRepairControllerClass());
      unint64_t v4 = (void *)[objc_alloc(getAISRepairContextClass()) initWithAltDSID:self->_altDSID];
      id v5 = [(SFSession *)self->_sfSession messageSessionTemplate];
      [v4 setMessageSessionTemplate:v5];

      [v4 setRemoteRole:4];
      if (gLogCategory_SFDeviceRepairService <= 30
        && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [v6 repairWithContext:v4 completionHandler:&__block_literal_global_46];

      return;
    }
    if (gLogCategory_SFDeviceRepairService > 90
      || gLogCategory_SFDeviceRepairService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
  }
  else if (gLogCategory_SFDeviceRepairService > 90 {
         || gLogCategory_SFDeviceRepairService == -1 && !_LogCategory_Initialize())
  }
  {
    return;
  }

  LogPrintF();
}

void __57__SFDeviceRepairService__registerAppleIDSetupIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (v4)
  {
    if (gLogCategory_SFDeviceRepairService <= 90
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFDeviceRepairService <= 30 {
         && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
}

- (void)_handleSessionEnded:(id)a3
{
  v26[5] = *MEMORY[0x1E4F143B8];
  sfSession = (SFSession *)a3;
  id v5 = sfSession;
  if (self->_sfSession != sfSession) {
    goto LABEL_23;
  }
  if (sfSession && gLogCategory_SFDeviceRepairService <= 30)
  {
    if (gLogCategory_SFDeviceRepairService == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_7;
      }
      sfSession = self->_sfSession;
    }
    v23 = [(SFSession *)sfSession peer];
    LogPrintF();
  }
LABEL_7:
  NSAppendPrintF();
  id v6 = (__CFString *)0;
  unint64_t startProblemFlags = self->_startProblemFlags;
  NSAppendPrintF();
  v7 = (__CFString *)0;
  v25[0] = @"flags";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_problemFlags, startProblemFlags, &unk_1A56EAC5E);
  uint64_t v9 = (void *)v8;
  if (v6) {
    v10 = v6;
  }
  else {
    v10 = &stru_1EF9BDC68;
  }
  v26[0] = v8;
  v26[1] = v10;
  v25[1] = @"problemFlags";
  v25[2] = @"startFlags";
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:self->_startProblemFlags];
  id v12 = (void *)v11;
  if (v7) {
    v13 = v7;
  }
  else {
    v13 = &stru_1EF9BDC68;
  }
  v26[2] = v11;
  v26[3] = v13;
  v25[3] = @"startFlagsStr";
  v25[4] = @"totalMs";
  v14 = NSNumber;
  mach_absolute_time();
  uint64_t v15 = [v14 numberWithUnsignedLongLong:UpTicksToMilliseconds()];
  v26[4] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];
  SFMetricsLog(@"com.apple.sharing.RepairPerformed", v16);

  [(SFSession *)self->_sfSession deregisterRequestID:@"_getprob"];
  [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler invalidate];
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = 0;

  [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler invalidate];
  wifiSetupHandler = self->_wifiSetupHandler;
  self->_wifiSetupHandler = 0;

  [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler invalidate];
  captiveNetworkHandler = self->_captiveNetworkHandler;
  self->_captiveNetworkHandler = 0;

  if (self->_wifiManager)
  {
    WiFiManagerClientEnable();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
  }
  [(SFTouchRemoteAccountServicesHandler *)self->_touchRemoteHandler invalidate];
  touchRemoteHandler = self->_touchRemoteHandler;
  self->_touchRemoteHandler = 0;

  v22 = self->_sfSession;
  self->_sfSession = 0;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFDeviceRepairService *)self _invalidate];
  }

LABEL_23:
}

- (void)_handleGetProblemsRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    id v28 = v6;
    LogPrintF();
  }
  uint64_t v8 = objc_msgSend(v6, "objectForKeyedSubscript:", @"ff", v28);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self->_peerFeatureFlags = [v8 unsignedLongLongValue];
  }
  [(SFDeviceRepairService *)self _registerAppleIDSetupIfNecessary];
  [(SFDeviceRepairService *)self _registerCDPAndTouchRemoteIfNecessary];
  unint64_t problemFlags = self->_problemFlags;
  if (CNUserInteractionIsRequired())
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    problemFlags |= 0x200000uLL;
  }
  if ([(SFDeviceRepairService *)self _localDeviceSupportsAppleIDSetup]) {
    uint64_t v10 = 40960;
  }
  else {
    uint64_t v10 = 0x2000;
  }
  if (!self->_akAccountManager)
  {
    uint64_t v11 = [(objc_class *)getAKAccountManagerClass() sharedInstance];
    akAccountManager = self->_akAccountManager;
    self->_akAccountManager = v11;
  }
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v14 = [(Class)getACAccountStoreClass_3[0]() defaultStore];
    uint64_t v15 = self->_accountStore;
    self->_accountStore = v14;

    accountStore = self->_accountStore;
  }
  v16 = [(ACAccountStore *)accountStore aa_primaryAppleAccount];
  v17 = objc_msgSend(v16, "aa_altDSID");

  v18 = [(AKAccountManager *)self->_akAccountManager authKitAccountWithAltDSID:v17];
  v19 = [(AKAccountManager *)self->_akAccountManager continuationTokenForAccount:v18];
  BOOL v20 = SFDeviceClassCodeGet() != 4 && SFDeviceClassCodeGet() != 6;
  v29 = v6;
  if (!v20 && !v19)
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    problemFlags |= 2uLL;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v22 = [NSNumber numberWithUnsignedLongLong:problemFlags];
  [v21 setObject:v22 forKeyedSubscript:@"dpf"];

  [v21 setObject:@"1945.10.6" forKeyedSubscript:@"shv"];
  v23 = [NSNumber numberWithUnsignedLongLong:v10];
  [v21 setObject:v23 forKeyedSubscript:@"ff"];

  v24 = (void *)WiFiCopyCurrentNetworkInfoEx();
  CFStringGetTypeID();
  v25 = CFDictionaryGetTypedValue();
  if (v25) {
    [v21 setObject:v25 forKeyedSubscript:@"wifiSSID"];
  }
  v26 = softLinkIDSCopyLocalDeviceUniqueID[0]();
  if (v26) {
    [v21 setObject:v26 forKeyedSubscript:@"idsID"];
  }
  v27 = (void *)GestaltCopyAnswer();
  if (v27)
  {
    [v21 setObject:v27 forKeyedSubscript:@"osBuild"];
  }
  else
  {
    if (gLogCategory_SFDeviceRepairService > 60) {
      goto LABEL_43;
    }
    if (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_43:
  (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v21);
}

- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, MEMORY[0x1E4F1CC08]);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SFDeviceRepairService__handleFinishRequest_responseHandler___block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __62__SFDeviceRepairService__handleFinishRequest_responseHandler___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 9))
  {
    uint64_t v1 = result;
    if (SFDeviceClassCodeGet() == 4)
    {
      if (gLogCategory_SFDeviceRepairService <= 30
        && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      unint64_t v2 = (void *)[objc_alloc((Class)getFLFollowUpControllerClass[0]()) initWithClientIdentifier:0];
      [v2 clearPendingFollowUpItems:0];
    }
    result = *(void *)(*(void *)(v1 + 32) + 160);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_touchRemoteHandler, 0);
  objc_storeStrong((id *)&self->_akAccountManager, 0);
  objc_storeStrong((id *)&self->_repairMetricsTimer, 0);
  objc_storeStrong((id *)&self->_captiveNetworkHandler, 0);
  objc_storeStrong((id *)&self->_wifiSetupHandler, 0);
  objc_storeStrong((id *)&self->_homeKitSetupHandler, 0);
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);

  objc_storeStrong((id *)&self->_sfService, 0);
}

@end