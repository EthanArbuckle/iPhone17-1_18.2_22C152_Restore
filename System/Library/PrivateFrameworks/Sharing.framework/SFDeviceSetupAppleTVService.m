@interface SFDeviceSetupAppleTVService
- (BOOL)isCLIMode;
- (NSString)forcedPasscode;
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceSetupAppleTVService)init;
- (id)appleIDSetupReportHandler;
- (id)progressHandler;
- (void)_activate;
- (void)_cleanup;
- (void)_handleAppleIDSetupRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleBasicConfigRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4;
- (void)_handlePreAuthRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleSessionEnded:(id)a3;
- (void)_handleSessionStarted:(id)a3;
- (void)_handleTVLatencyProgressEvent:(unint64_t)a3 info:(id)a4;
- (void)_handleTVLatencyRequest:(id)a3 responseHandler:(id)a4;
- (void)_invalidate;
- (void)_reportProgress:(unsigned int)a3 info:(id)a4;
- (void)_sfServiceStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setAppleIDSetupReportHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setForcedPasscode:(id)a3;
- (void)setIsCLIMode:(BOOL)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation SFDeviceSetupAppleTVService

- (SFDeviceSetupAppleTVService)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupAppleTVService;
  v2 = [(SFDeviceSetupAppleTVService *)&v7 init];
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
    v3 = (SFDeviceSetupAppleTVService *)FatalErrorF();
    [(SFDeviceSetupAppleTVService *)v3 _cleanup];
  }
  else
  {
    [(SFDeviceSetupAppleTVService *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupAppleTVService;
    [(SFDeviceSetupAppleTVService *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  [(SFClient *)self->_preventExitForLocaleClient invalidate];
  preventExitForLocaleClient = self->_preventExitForLocaleClient;
  self->_preventExitForLocaleClient = 0;

  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFDeviceSetupAppleTVService_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFDeviceSetupAppleTVService_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_activateCalled = 1;
  self->_advertiseFast = CFPrefs_GetInt64() != 0;
  self->_prefCDPEnabled = CFPrefs_GetInt64() != 0;
  if (_os_feature_enabled_impl()) {
    self->_prefAppleIDSetupEnabled = 1;
  }
  self->_prefTVLatency = CFPrefs_GetInt64() != 0;
  self->_prefHH2Enabled = CFPrefs_GetInt64() != 0;
  if (!self->_preventExitForLocaleClient)
  {
    v3 = objc_alloc_init(SFClient);
    preventExitForLocaleClient = self->_preventExitForLocaleClient;
    self->_preventExitForLocaleClient = v3;

    [(SFClient *)self->_preventExitForLocaleClient preventExitForLocaleReason:@"AppleTVSetup"];
  }
  [(SFDeviceSetupAppleTVService *)self _sfServiceStart];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SFDeviceSetupAppleTVService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFDeviceSetupAppleTVService_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  if (self->_sfSession) {
    -[SFDeviceSetupAppleTVService _handleSessionEnded:](self, "_handleSessionEnded:");
  }
  [(SFService *)self->_sfService invalidate];
  sfService = self->_sfService;
  self->_sfService = 0;

  id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 20, 0);
  }

  [(SFDeviceSetupAppleTVService *)self _cleanup];
}

- (void)_reportProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = _Block_copy(self->_progressHandler);
  objc_super v7 = v6;
  if (v6) {
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, v4, v8);
  }
}

- (void)_sfServiceStart
{
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFService *)self->_sfService invalidate];
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  if (self->_advertiseFast) {
    [(SFService *)self->_sfService setAdvertiseRate:50];
  }
  [(SFService *)self->_sfService setDispatchQueue:self->_dispatchQueue];
  [(SFService *)self->_sfService setIdentifier:@"com.apple.sharing.AppleTVSetup"];
  [(SFService *)self->_sfService setLabel:@"AppleTVSetup"];
  [(SFService *)self->_sfService setNeedsSetup:1];
  [(SFService *)self->_sfService setDeviceActionType:1];
  [(SFService *)self->_sfService setPairSetupACL:&unk_1EFA09AA8];
  [(SFService *)self->_sfService setPinType:1];
  [(SFService *)self->_sfService setSessionFlags:1];
  [(SFService *)self->_sfService setTouchRemoteEnabled:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke;
  v8[3] = &unk_1E5BBE028;
  v8[4] = self;
  [(SFService *)self->_sfService setSessionStartedHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke_2;
  v7[3] = &unk_1E5BBE050;
  v7[4] = self;
  [(SFService *)self->_sfService setSessionEndedHandler:v7];
  objc_super v5 = self->_sfService;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke_3;
  v6[3] = &unk_1E5BBC8E8;
  v6[4] = self;
  [(SFService *)v5 activateWithCompletion:v6];
}

uint64_t __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionStarted:a2];
}

uint64_t __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionEnded:a2];
}

void __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 104);
  if (v3)
  {
    if (v5)
    {
      objc_super v7 = @"eo";
      v8[0] = v3;
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, 30, v6);
    }
  }
  else if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 10, 0);
  }
}

- (void)_handleSessionStarted:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (gLogCategory_SFDeviceSetupAppleTVService <= 60)
    {
      if (gLogCategory_SFDeviceSetupAppleTVService == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_15;
        }
        sfSession = self->_sfSession;
      }
      v28 = [(SFSession *)sfSession peer];
      v30 = [v5 peer];
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      v29 = [v5 peer];
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_sfSession, a3);
    objc_super v7 = self->_sfSession;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke;
    v37[3] = &unk_1E5BBCBA8;
    v37[4] = self;
    [(SFSession *)v7 registerRequestID:@"_pa" options:&unk_1EFA09AD0 handler:v37];
    id v8 = self->_sfSession;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_2;
    v36[3] = &unk_1E5BBCBA8;
    v36[4] = self;
    [(SFSession *)v8 registerRequestID:@"_bc" options:&unk_1EFA09AF8 handler:v36];
    if (self->_prefCDPEnabled)
    {
      v9 = objc_alloc_init(SFDeviceOperationHandlerCDPSetup);
      cdpSetupHandler = self->_cdpSetupHandler;
      self->_cdpSetupHandler = v9;

      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setSfSession:v5];
      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler activate];
    }
    if (self->_prefAppleIDSetupEnabled)
    {
      v11 = self->_sfSession;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_3;
      v35[3] = &unk_1E5BBCBA8;
      v35[4] = self;
      [(SFSession *)v11 registerRequestID:@"_appleIDSetup" options:&unk_1EFA09B20 handler:v35];
    }
    v12 = (HMDeviceSetupOperationHandler *)objc_alloc_init((Class)getHMDeviceSetupOperationHandlerClass_1[0]());
    homeKitSetupHandler = self->_homeKitSetupHandler;
    self->_homeKitSetupHandler = v12;

    v14 = self->_homeKitSetupHandler;
    v15 = [(SFSession *)self->_sfSession trSession];
    [(HMDeviceSetupOperationHandler *)v14 registerMessageHandlersForSession:v15];

    v16 = [(SFSession *)self->_sfSession messageSessionTemplate];
    if (v16)
    {
      v17 = (void *)[objc_alloc((Class)getTVLAudioLatencyEstimatorClass[0]()) initWithMessageSession:v16];
      objc_storeStrong((id *)&self->_tvLatencyEstimator, v17);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_4;
      v33[3] = &unk_1E5BBCC48;
      v33[4] = self;
      id v34 = v17;
      id v18 = v17;
      [v18 setProgressEventHandler:v33];
    }
    v19 = self->_sfSession;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_6;
    v32[3] = &unk_1E5BBCBA8;
    v32[4] = self;
    [(SFSession *)v19 registerRequestID:@"_tvlS", &unk_1EFA09B48, v32, v29 options handler];
    v20 = objc_alloc_init(SFDeviceOperationHandlerWiFiSetup);
    wifiSetupHandler = self->_wifiSetupHandler;
    self->_wifiSetupHandler = v20;

    [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler setSfSession:v5];
    [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler activate];
    v22 = objc_alloc_init(SFDeviceOperationHandlerCNJSetup);
    captiveNetworkHandler = self->_captiveNetworkHandler;
    self->_captiveNetworkHandler = v22;

    [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler setSfSession:v5];
    [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler activate];
    v24 = self->_sfSession;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_7;
    v31[3] = &unk_1E5BBCBA8;
    v31[4] = self;
    [(SFSession *)v24 registerRequestID:@"_finish" options:&unk_1EFA09B70 handler:v31];
    id progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      v38 = @"trSession";
      v26 = [v5 trSession];
      v39[0] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      progressHandler[2](progressHandler, 31, v27);
    }
    [(SFService *)self->_sfService setNeedsSetup:0];
  }
LABEL_15:
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreAuthRequest:responseHandler:");
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleBasicConfigRequest:responseHandler:");
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAppleIDSetupRequest:responseHandler:");
}

void __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_5;
  v10[3] = &unk_1E5BBCC20;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v5;
  uint64_t v14 = a2;
  id v9 = v5;
  dispatch_async(v6, v10);
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_5(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 56)) {
    return [*(id *)(result + 40) _handleTVLatencyProgressEvent:*(void *)(result + 56) info:*(void *)(result + 48)];
  }
  return result;
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTVLatencyRequest:responseHandler:");
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  sfSession = (SFSession *)a3;
  id v5 = sfSession;
  if (self->_sfSession != sfSession) {
    goto LABEL_9;
  }
  uint64_t v14 = sfSession;
  if (sfSession && gLogCategory_SFDeviceSetupAppleTVService <= 30)
  {
    if (gLogCategory_SFDeviceSetupAppleTVService != -1)
    {
LABEL_5:
      id v13 = [(SFSession *)sfSession peer];
      LogPrintF();

      goto LABEL_7;
    }
    if (_LogCategory_Initialize())
    {
      sfSession = self->_sfSession;
      goto LABEL_5;
    }
  }
LABEL_7:
  [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler invalidate];
  wifiSetupHandler = self->_wifiSetupHandler;
  self->_wifiSetupHandler = 0;

  [(TVLAudioLatencyEstimator *)self->_tvLatencyEstimator invalidate];
  tvLatencyEstimator = self->_tvLatencyEstimator;
  self->_tvLatencyEstimator = 0;

  self->_tvLatencyFinalReported = 0;
  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = 0;

  [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler invalidate];
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler invalidate];
  captiveNetworkHandler = self->_captiveNetworkHandler;
  self->_captiveNetworkHandler = 0;

  id v11 = self->_sfSession;
  self->_sfSession = 0;

  [(SFService *)self->_sfService setNeedsSetup:1];
  id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  id v5 = v14;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 32, 0);
    id v5 = v14;
  }
LABEL_9:
}

- (void)_handlePreAuthRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    id v21 = v6;
    LogPrintF();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id progressHandler = (void (**)(id, uint64_t, id))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 40, v6);
  }
  if (self->_prefAppleIDSetupEnabled) {
    uint64_t v10 = (16 * self->_prefCDPEnabled) | 0x8000;
  }
  else {
    uint64_t v10 = 16 * self->_prefCDPEnabled;
  }
  if (self->_prefTVLatency) {
    v10 |= 0x40uLL;
  }
  if (self->_prefHH2Enabled) {
    v10 |= 0x800uLL;
  }
  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v10 | 0x2000, v21);
  [v8 setObject:v11 forKeyedSubscript:@"ff"];

  LOBYTE(v11) = CFDictionaryGetInt64Ranged();
  uint64_t v12 = [(SFSession *)self->_sfSession peerDevice];
  [v12 setDeviceClassCode:v11];

  uint64_t Int64 = CFDictionaryGetInt64();
  BOOL v14 = Int64 != 0;
  uint64_t v15 = Int64;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    v16 = "no";
    if (v15) {
      v16 = "yes";
    }
    v22 = v16;
    LogPrintF();
  }
  self->_isCLIMode = v14;
  -[SFService setIsCLIMode:](self->_sfService, "setIsCLIMode:", v15 != 0, v22);
  if (v15)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      v23 = v17;
      LogPrintF();
    }
    self->_forcedPasscode = v17;
    -[SFService setForcedPin:](self->_sfService, "setForcedPin:", v17, v23);
  }
  id v18 = (void *)GestaltCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setObject:v18 forKeyedSubscript:@"mdN"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVService <= 90 {
         && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  v19 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setObject:v19 forKeyedSubscript:@"model"];
  }
  else if (gLogCategory_SFDeviceSetupAppleTVService <= 90 {
         && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  v20 = (void *)MGCopyAnswer();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setObject:v20 forKeyedSubscript:@"osBuild"];
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVService > 90) {
      goto LABEL_48;
    }
    if (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_48:
  (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v8);
}

- (void)_handleBasicConfigRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_opt_new();
  [v9 addEntriesFromDictionary:v6];
  if (self->_isCLIMode)
  {
    uint64_t v10 = [NSNumber numberWithBool:1];
    [v9 setObject:v10 forKeyedSubscript:@"isCLIMode"];

    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  id progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 80, v9);
  }
  SFMyAltDSID();
  id v12 = objc_claimAutoreleasedReturnValue();
  id v13 = (const char *)[v12 UTF8String];

  if (v13)
  {
    BOOL v14 = [(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"AltDSID" keyLength:16];
    uint64_t v15 = v14;
    if (v14)
    {
      [v14 bytes];
      strlen(v13);
      v16 = [NSNumber numberWithUnsignedLongLong:SipHash()];
      [v8 setObject:v16 forKeyedSubscript:@"adh"];
    }
  }
  CFDateGetTypeID();
  v17 = CFDictionaryGetTypedValue();
  int v18 = gLogCategory_SFDeviceSetupAppleTVService;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30)
  {
    if (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    int v18 = gLogCategory_SFDeviceSetupAppleTVService;
  }
  if (v17)
  {
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
    {
      getTMSourceProxBuddy[0]();
      LogPrintF();
    }
    uint64_t v19 = getTMSourceProxBuddy[0]();
    [v17 timeIntervalSinceReferenceDate];
    ((void (*)(uint64_t, double, double))softLinkTMSetSourceTime[0])(v19, v20, 10.0);
    int v18 = gLogCategory_SFDeviceSetupAppleTVService;
  }
  if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v8);
}

- (void)_handleAppleIDSetupRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    id v20 = v6;
    LogPrintF();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_opt_new();
  [v9 addEntriesFromDictionary:v6];
  if (self->_isCLIMode)
  {
    uint64_t v10 = [NSNumber numberWithBool:1];
    [v9 setObject:v10 forKeyedSubscript:@"isCLIMode"];

    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      id v20 = v9;
      LogPrintF();
    }
  }
  id progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 224, v9);
  }
  id v12 = [(SFSession *)self->_sfSession messageSessionTemplate];
  if (v12)
  {
    id v13 = objc_alloc_init(getAISSetupContextClass());
    BOOL v14 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F4D8E8]];
    [v13 setRequiredServiceTypes:v14];

    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F4D908], *MEMORY[0x1E4F4D8F8], 0);
    [v13 setDesiredServiceTypes:v15];

    [v13 setShouldBackgroundDesiredServices:1];
    [v13 setLocalRole:1];
    [v13 setRemoteRole:4];
    [v13 setMessageSessionTemplate:v12];
    v16 = _Block_copy(self->_appleIDSetupReportHandler);
    id v17 = objc_alloc_init(getAISSetupControllerClass());
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__SFDeviceSetupAppleTVService__handleAppleIDSetupRequest_responseHandler___block_invoke;
    v21[3] = &unk_1E5BC05D8;
    id v22 = v16;
    id v18 = v16;
    [v17 setupWithContext:v13 completionHandler:v21];
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"dn"];
    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v8);
  }
  else
  {
    uint64_t v19 = NSErrorWithOSStatusF();
    if (gLogCategory_SFDeviceSetupAppleTVService <= 90
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v19, 0, 0);
  }
}

void __74__SFDeviceSetupAppleTVService__handleAppleIDSetupRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)_handleTVLatencyRequest:(id)a3 responseHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    id v10 = v11;
    LogPrintF();
  }
  id v7 = [(SFSession *)self->_sfSession messageSessionTemplate];
  if (v7)
  {
    id v8 = self->_tvLatencyEstimator;
    if (v8)
    {
      if (gLogCategory_SFDeviceSetupAppleTVService <= 30
        && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(TVLAudioLatencyEstimator *)v8 activate];
      [(SFDeviceSetupAppleTVService *)self _reportProgress:260 info:v11];
      if (gLogCategory_SFDeviceSetupAppleTVService <= 30
        && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, MEMORY[0x1E4F1CC08]);
    }
    else
    {
      id v9 = NSErrorWithOSStatusF();
      if (gLogCategory_SFDeviceSetupAppleTVService <= 90
        && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void *, void, void))v6 + 2))(v6, v9, 0, 0);
    }
  }
  else
  {
    NSErrorWithOSStatusF();
    id v8 = (TVLAudioLatencyEstimator *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFDeviceSetupAppleTVService <= 90
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, TVLAudioLatencyEstimator *, void, void))v6 + 2))(v6, v8, 0, 0);
  }
}

- (void)_handleTVLatencyProgressEvent:(unint64_t)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v12 = v6;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30)
  {
    if (gLogCategory_SFDeviceSetupAppleTVService != -1 || (v6 = (id)_LogCategory_Initialize(), id v7 = v12, v6))
    {
      unint64_t v10 = a3;
      id v11 = v7;
      id v6 = (id)LogPrintF();
    }
  }
  switch(a3)
  {
    case 0uLL:
      id v8 = self;
      uint64_t v9 = 270;
      goto LABEL_12;
    case 1uLL:
      id v8 = self;
      uint64_t v9 = 277;
      goto LABEL_12;
    case 2uLL:
      id v8 = self;
      uint64_t v9 = 274;
      goto LABEL_12;
    case 3uLL:
      if (!self->_tvLatencyFinalReported)
      {
        id v6 = (id)[(SFDeviceSetupAppleTVService *)self _reportProgress:272 info:v12];
        self->_tvLatencyFinalReported = 1;
      }
      break;
    case 4uLL:
      id v8 = self;
      uint64_t v9 = 276;
LABEL_12:
      id v6 = (id)-[SFDeviceSetupAppleTVService _reportProgress:info:](v8, "_reportProgress:info:", v9, v12, v10, v11);
      break;
    default:
      break;
  }

  MEMORY[0x1F4181870](v6);
}

- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_tvLatencyEstimator && !self->_tvLatencyFinalReported)
  {
    [(SFDeviceSetupAppleTVService *)self _reportProgress:272 info:MEMORY[0x1E4F1CC08]];
    self->_tvLatencyFinalReported = 1;
  }
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v8);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SFDeviceSetupAppleTVService__handleFinishRequest_responseHandler___block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __68__SFDeviceSetupAppleTVService__handleFinishRequest_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 10))
  {
    result = *(void *)(v1 + 104);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 96, 0);
    }
  }
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)forcedPasscode
{
  return self->_forcedPasscode;
}

- (void)setForcedPasscode:(id)a3
{
  self->_forcedPasscode = (NSString *)a3;
}

- (id)appleIDSetupReportHandler
{
  return self->_appleIDSetupReportHandler;
}

- (void)setAppleIDSetupReportHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appleIDSetupReportHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_captiveNetworkHandler, 0);
  objc_storeStrong((id *)&self->_wifiSetupHandler, 0);
  objc_storeStrong((id *)&self->_tvLatencyEstimator, 0);
  objc_storeStrong((id *)&self->_homeKitSetupHandler, 0);
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);

  objc_storeStrong((id *)&self->_preventExitForLocaleClient, 0);
}

@end