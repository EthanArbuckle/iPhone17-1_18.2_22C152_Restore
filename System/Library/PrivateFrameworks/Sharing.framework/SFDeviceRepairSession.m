@interface SFDeviceRepairSession
- (BOOL)_remotePeerNeedsAppleIDRepair;
- (BOOL)disableSilentAuth;
- (NSDictionary)preferredWiFiConfiguration;
- (NSString)altDSID;
- (NSString)idsIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SFDeviceRepairSession)init;
- (UIViewController)presentingViewController;
- (id)progressHandler;
- (int)_runAppleIDSetupRepair;
- (int)_runCDPSetup;
- (int)_runCaptiveJoin;
- (int)_runFinish;
- (int)_runGetProblems;
- (int)_runHomeKitSetup;
- (int)_runPairVerify;
- (int)_runPreflightWiFiEarly;
- (int)_runPreflightWiFiFull;
- (int)_runSFSessionStart;
- (int)_runTRAuthentication;
- (int)_runTRSessionStart;
- (int)_runWiFiSetup;
- (unint64_t)triggerMs;
- (unsigned)repairFlags;
- (void)_cleanup;
- (void)_reportError:(id)a3 isPreflight:(BOOL)a4;
- (void)_reportRepairResultMetrics:(id)a3;
- (void)_run;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setAltDSID:(id)a3;
- (void)setDisableSilentAuth:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPreferredWiFiConfiguration:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setRepairFlags:(unsigned int)a3;
- (void)setTriggerMs:(unint64_t)a3;
@end

@implementation SFDeviceRepairSession

- (SFDeviceRepairSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceRepairSession;
  v2 = [(SFDeviceRepairSession *)&v7 init];
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
    v3 = (SFDeviceRepairSession *)FatalErrorF();
    [(SFDeviceRepairSession *)v3 _cleanup];
  }
  else
  {
    [(SFDeviceRepairSession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceRepairSession;
    [(SFDeviceRepairSession *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation invalidate];
  wifiSetupOperation = self->_wifiSetupOperation;
  self->_wifiSetupOperation = 0;

  [(SFDeviceOperationCNJSetup *)self->_captiveJoin invalidate];
  captiveJoin = self->_captiveJoin;
  self->_captiveJoin = 0;

  [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation invalidate];
  homeKitSetupOperation = self->_homeKitSetupOperation;
  self->_homeKitSetupOperation = 0;

  [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation invalidate];
  cdpSetupOperation = self->_cdpSetupOperation;
  self->_cdpSetupOperation = 0;

  appleIDRepairController = self->_appleIDRepairController;
  self->_appleIDRepairController = 0;

  [(SFSession *)self->_sfSession setInvalidationHandler:0];
  [(SFSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  }
  self->_progressHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFDeviceRepairSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__SFDeviceRepairSession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = *(unsigned int *)(*(void *)(a1 + 32) + 304);
    v6 = &unk_1A56EAD76;
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  *(void *)(*(void *)(a1 + 32) + 16) = mach_absolute_time();
  *(void *)(*(void *)(a1 + 32) + 64) = [*(id *)(*(void *)(a1 + 32) + 336) problemFlags];
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = CFPrefs_GetInt64() != 0;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[45];
  if (v3)
  {
    (*(void (**)(void, uint64_t, void))(v3 + 16))(v2[45], 10, 0);
    v2 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v2, "_run", v5, v6);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFDeviceRepairSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceRepairSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9)
    && gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 _cleanup];
}

- (void)_reportError:(id)a3 isPreflight:(BOOL)a4
{
  BOOL v6 = a4;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (gLogCategory_SFDeviceRepairSession <= 90
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    id v18 = v8;
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v21 = @"eo";
    v10 = v8;
    if (!v8)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28760];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      uint64_t v13 = [NSString stringWithUTF8String:DebugGetErrorString()];
      SEL v4 = (void *)v13;
      v14 = @"?";
      if (v13) {
        v14 = (__CFString *)v13;
      }
      v20 = v14;
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, v18);
      v10 = [v11 errorWithDomain:v12 code:-6700 userInfo:v5];
    }
    v22[0] = v10;
    v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, v18, v19);
    progressHandler[2](progressHandler, 30, v15);

    if (!v8)
    {
    }
  }
  v16 = objc_alloc_init(SFRepairResultMetrics);
  [(SFRepairResultMetrics *)v16 setError:v8];
  [(SFRepairResultMetrics *)v16 setIsPreflightError:v6];
  [(SFRepairResultMetrics *)v16 setProblemFlags:self->_problemFlags];
  [(SFRepairResultMetrics *)v16 setPeerProblemFlags:self->_peerProblemFlags];
  v17 = [(SFDevice *)self->_peerDevice model];
  [(SFRepairResultMetrics *)v16 setPeerModel:v17];

  [(SFRepairResultMetrics *)v16 setPeerBuild:self->_peerOSBuild];
  [(SFRepairResultMetrics *)v16 setForceWiFi:self->_repairFlags & 1];
  mach_absolute_time();
  [(SFRepairResultMetrics *)v16 setTotalMs:(double)(unint64_t)UpTicksToMilliseconds()];
  [(SFRepairResultMetrics *)v16 setTriggerMs:(double)self->_triggerMs];
  [(SFRepairResultMetrics *)v16 setHasView:self->_presentingViewController != 0];
  [(SFDeviceRepairSession *)self _reportRepairResultMetrics:v16];
}

- (void)_reportRepairResultMetrics:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFDeviceRepairSession <= 40
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = [v4 dict];
  SFMetricsLog(@"com.apple.sharing.RepairResult", v3);
}

- (BOOL)_remotePeerNeedsAppleIDRepair
{
  if (_os_feature_enabled_impl()) {
    int v3 = BYTE1(self->_peerFeatureFlags) >> 7;
  }
  else {
    LOBYTE(v3) = 0;
  }
  if ((self->_problemFlags & 0x20006) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    unsigned int v4 = (self->_repairFlags >> 3) & 1;
    if ((self->_repairFlags & 6) != 0) {
      LOBYTE(v4) = 1;
    }
  }
  return v3 & v4;
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    return;
  }
  int v3 = [(SFDeviceRepairSession *)self _runPreflightWiFiEarly];
  if (v3 != 4 && v3 != 2) {
    return;
  }
  int v4 = [(SFDeviceRepairSession *)self _runSFSessionStart];
  if (v4 != 4 && v4 != 2) {
    return;
  }
  if (!self->_sessionSecured)
  {
    int v10 = [(SFDeviceRepairSession *)self _runPairVerify];
    if (v10 != 4 && v10 != 2) {
      return;
    }
  }
  int v5 = [(SFDeviceRepairSession *)self _runGetProblems];
  if (v5 != 4 && v5 != 2) {
    return;
  }
  if (self->_problemFlags & 0x10) != 0 || (self->_repairFlags)
  {
    int v6 = [(SFDeviceRepairSession *)self _runPreflightWiFiFull];
    if (v6 != 4 && v6 != 2) {
      return;
    }
    int v7 = [(SFDeviceRepairSession *)self _runWiFiSetup];
    if (v7 != 4 && v7 != 2) {
      return;
    }
    int v8 = [(SFDeviceRepairSession *)self _runCaptiveJoin];
    if (v8 != 4 && v8 != 2) {
      return;
    }
  }
  if ([(SFDeviceRepairSession *)self _remotePeerNeedsAppleIDRepair])
  {
    int v9 = [(SFDeviceRepairSession *)self _runAppleIDSetupRepair];
    if (v9 != 2 && v9 != 4) {
      return;
    }
  }
  else
  {
    if ((self->_problemFlags & 6) != 0 || (self->_repairFlags & 6) != 0)
    {
      int v11 = [(SFDeviceRepairSession *)self _runTRSessionStart];
      if (v11 != 4 && v11 != 2) {
        return;
      }
      int v12 = [(SFDeviceRepairSession *)self _runTRAuthentication];
      if (v12 != 4 && v12 != 2) {
        return;
      }
    }
    if (self->_cdpEnabled && ((self->_problemFlags & 0x20000) != 0 || (self->_repairFlags & 8) != 0))
    {
      int v13 = [(SFDeviceRepairSession *)self _runCDPSetup];
      if (v13 != 4 && v13 != 2) {
        return;
      }
    }
  }
  if ((self->_problemFlags & 8) == 0 && (self->_repairFlags & 0x10) == 0
    || (int v14 = [(SFDeviceRepairSession *)self _runHomeKitSetup], v14 == 4)
    || v14 == 2)
  {
    if ((self->_problemFlags & 0x100) == 0)
    {
      [(SFDeviceRepairSession *)self _runFinish];
    }
  }
}

- (int)_runPreflightWiFiEarly
{
  int preflightWiFiEarlyState = self->_preflightWiFiEarlyState;
  if (!preflightWiFiEarlyState)
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v4 = (void *)WiFiCopyCurrentNetworkInfoEx();
    CFStringGetTypeID();
    uint64_t v5 = CFDictionaryGetTypedValue();
    if (v5)
    {
      int v6 = (void *)v5;
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int preflightWiFiEarlyState = 4;

      return self->_preflightWiFiEarlyState;
    }
    else
    {
      int v7 = NSErrorWithOSStatusF();
      self->_int preflightWiFiEarlyState = 3;
      [(SFDeviceRepairSession *)self _reportError:v7 isPreflight:1];
      int preflightWiFiEarlyState = self->_preflightWiFiEarlyState;
    }
  }
  return preflightWiFiEarlyState;
}

- (int)_runPreflightWiFiFull
{
  int preflightWiFiState = self->_preflightWiFiState;
  if (preflightWiFiState == 4 || preflightWiFiState == 2) {
    return self->_preflightWiFiState;
  }
  if (preflightWiFiState)
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_preflightWiFiState;
  }
  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v5 = (void *)WiFiCopyCurrentNetworkInfoEx();
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  CFStringGetTypeID();
  int v7 = CFDictionaryGetTypedValue();
  if (!v7)
  {
    int v8 = NSErrorWithOSStatusF();
    self->_int preflightWiFiState = 3;
    [(SFDeviceRepairSession *)self _reportError:v8 isPreflight:1];
    int v13 = self->_preflightWiFiState;
    goto LABEL_22;
  }
  if (!CFDictionaryGetInt64()) {
    goto LABEL_26;
  }
  if (Int64Ranged != 1)
  {
    uint64_t v21 = Int64Ranged;
    int v8 = NSPrintF();
    if (v8) {
      goto LABEL_20;
    }
  }
  int v9 = [(SFDevice *)self->_peerDevice bleDevice];
  int v10 = [v9 advertisementData];
  if (![v10 length])
  {

    goto LABEL_26;
  }
  unsigned int v11 = [(SFDevice *)self->_peerDevice osVersion];

  if (v11 > 0xA
    || (uint64_t v21 = [(SFDevice *)self->_peerDevice osVersion],
        NSPrintF(),
        (int v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_26:
    if (CFPrefs_GetInt64() && objc_msgSend(v7, "isEqual:", @"AppleWiFi", v21)) {
      goto LABEL_48;
    }
    BOOL wifiIsCaptive = CFDictionaryGetInt64() != 0;
    self->_BOOL wifiIsCaptive = wifiIsCaptive;
    unint64_t peerFeatureFlags = self->_peerFeatureFlags;
    if (gLogCategory_SFDeviceRepairSession <= 30)
    {
      if (gLogCategory_SFDeviceRepairSession != -1
        || (v16 = _LogCategory_Initialize(), BOOL wifiIsCaptive = self->_wifiIsCaptive, v16))
      {
        uint64_t v21 = wifiIsCaptive;
        BOOL v22 = (peerFeatureFlags & 0x2000) == 0;
        LogPrintF();
        BOOL wifiIsCaptive = self->_wifiIsCaptive;
      }
    }
    if (wifiIsCaptive && (peerFeatureFlags & 0x2000) == 0
      || ((peerFeatureFlags & 0x2000) != 0 ? (BOOL v17 = Int64Ranged == 5) : (BOOL v17 = 0),
          v17 ? (int v18 = 0) : (int v18 = 1),
          Int64Ranged >= 2 && v18))
    {
LABEL_48:
      uint64_t v19 = NSErrorWithOSStatusF();
      self->_int preflightWiFiState = 3;
      [(SFDeviceRepairSession *)self _reportError:v19 isPreflight:1];
      int v13 = self->_preflightWiFiState;

      goto LABEL_49;
    }
    if (-[NSString isEqualToString:](self->_peerSSID, "isEqualToString:", v7, v21, v22)
      && ((self->_problemFlags & 0x200000) != 0 || (self->_repairFlags & 0x20) != 0))
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_wifiSetupState = 2;
    }
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int preflightWiFiState = 4;

    return self->_preflightWiFiState;
  }
LABEL_20:
  int v12 = NSErrorWithOSStatusF();
  self->_int preflightWiFiState = 3;
  -[SFDeviceRepairSession _reportError:isPreflight:](self, "_reportError:isPreflight:", v12, 1, v8);
  int v13 = self->_preflightWiFiState;

LABEL_22:
LABEL_49:

  return v13;
}

- (int)_runSFSessionStart
{
  int sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int sfSessionState = 1;
      [(SFSession *)self->_sfSession invalidate];
      uint64_t v5 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v5;

      [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
      [(SFSession *)self->_sfSession setLabel:@"Repair"];
      [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
      [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.Repair"];
      [(SFSession *)self->_sfSession setSessionFlags:4129];
      [(SFSession *)self->_sfSession setTouchRemoteEnabled:1];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke;
      v13[3] = &unk_1E5BBC8E8;
      v13[4] = self;
      [(SFSession *)self->_sfSession setErrorHandler:v13];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_2;
      v12[3] = &unk_1E5BBC870;
      v12[4] = self;
      [(SFSession *)self->_sfSession setInterruptionHandler:v12];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_3;
      v11[3] = &unk_1E5BBC870;
      v11[4] = self;
      [(SFSession *)self->_sfSession setInvalidationHandler:v11];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_4;
      v10[3] = &unk_1E5BBC870;
      v10[4] = self;
      [(SFSession *)self->_sfSession setSessionStartedHandler:v10];
      int v7 = self->_sfSession;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_5;
      v9[3] = &unk_1E5BBC8E8;
      v9[4] = self;
      [(SFSession *)v7 activateWithCompletion:v9];
    }
  }
  return self->_sfSessionState;
}

unsigned char *__43__SFDeviceRepairSession__runSFSessionStart__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[9]) {
    return (unsigned char *)[result _reportError:a2 isPreflight:1];
  }
  return result;
}

void __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[9])
  {
    NSErrorWithOSStatusF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v1 _reportError:v2 isPreflight:0];
  }
}

void __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[9])
  {
    NSErrorWithOSStatusF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v1 _reportError:v2 isPreflight:0];
  }
}

uint64_t __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9) && *(_DWORD *)(v1 + 40) == 1)
  {
    *(_DWORD *)(v1 + 40) = 4;
    return [*(id *)(result + 32) _run];
  }
  return result;
}

uint64_t __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_5(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (!*(unsigned char *)(v2 + 9))
    {
      *(_DWORD *)(v2 + 40) = 3;
      return [*(id *)(result + 32) _reportError:a2 isPreflight:0];
    }
  }
  return result;
}

- (int)_runPairVerify
{
  int pairVerifyState = self->_pairVerifyState;
  if ((pairVerifyState | 2) == 2)
  {
    [(SFSession *)self->_sfSession setSessionFlags:[(SFSession *)self->_sfSession sessionFlags] & 0xFFFFFBFFLL];
    self->_int pairVerifyState = 0;
    unint64_t pairVerifyType = self->_pairVerifyType;
    if (pairVerifyType != 1)
    {
LABEL_10:
      int v6 = "?";
      if (pairVerifyType == 1) {
        int v6 = "CUPairing";
      }
      if (pairVerifyType) {
        int v7 = v6;
      }
      else {
        int v7 = "HomeKit";
      }
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        unsigned int v11 = v7;
        LogPrintF();
      }
      self->_int pairVerifyState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 60, 0);
      }
      sfSession = self->_sfSession;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __39__SFDeviceRepairSession__runPairVerify__block_invoke;
      v12[3] = &unk_1E5BC0548;
      v12[4] = self;
      void v12[5] = v7;
      -[SFSession pairVerifyWithFlags:completion:](sfSession, "pairVerifyWithFlags:completion:", 8, v12, v11);
      return self->_pairVerifyState;
    }
    [(SFSession *)self->_sfSession setSessionFlags:[(SFSession *)self->_sfSession sessionFlags] | 0x400];
    int pairVerifyState = self->_pairVerifyState;
  }
  if (pairVerifyState == 4 || pairVerifyState == 2) {
    return self->_pairVerifyState;
  }
  if (!pairVerifyState)
  {
    unint64_t pairVerifyType = self->_pairVerifyType;
    goto LABEL_10;
  }
  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_pairVerifyState;
}

void __39__SFDeviceRepairSession__runPairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9))
  {
    id v14 = v3;
    if (v3)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        int v13 = *(const char **)(a1 + 40);
        LogPrintF();
      }
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(v4 + 80);
      if (v5 == 1)
      {
        *(_DWORD *)(v4 + 72) = 3;
        int v6 = *(void **)(a1 + 32);
        int v7 = NSErrorWithOSStatusF();
        objc_msgSend(v6, "_reportError:isPreflight:", v7, 0, v14);

LABEL_27:
        id v3 = v14;
        goto LABEL_28;
      }
      *(void *)(v4 + 80) = v5 + 1;
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 80);
        int v9 = "?";
        if (v8 == 1) {
          int v9 = "CUPairing";
        }
        if (v8) {
          int v10 = v9;
        }
        else {
          int v10 = "HomeKit";
        }
        int v13 = v10;
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 72) = 2;
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        int v13 = *(const char **)(a1 + 40);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 72) = 4;
      *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
      unsigned int v11 = *(void **)(a1 + 32);
      uint64_t v12 = v11[45];
      if (!v12) {
        goto LABEL_26;
      }
      (*(void (**)(void, uint64_t, void))(v12 + 16))(v11[45], 70, 0);
    }
    unsigned int v11 = *(void **)(a1 + 32);
LABEL_26:
    objc_msgSend(v11, "_run", v13);
    goto LABEL_27;
  }
LABEL_28:
}

- (int)_runGetProblems
{
  v12[1] = *MEMORY[0x1E4F143B8];
  int getProblemsState = self->_getProblemsState;
  if (getProblemsState != 4 && getProblemsState != 2)
  {
    if (getProblemsState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int getProblemsState = 1;
      if (_os_feature_enabled_impl()) {
        uint64_t v5 = 0x8000;
      }
      else {
        uint64_t v5 = 0;
      }
      unsigned int v11 = @"ff";
      int v6 = [NSNumber numberWithUnsignedLongLong:v5];
      v12[0] = v6;
      int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

      sfSession = self->_sfSession;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40__SFDeviceRepairSession__runGetProblems__block_invoke;
      v10[3] = &unk_1E5BBCBF8;
      v10[4] = self;
      [(SFSession *)sfSession sendRequestID:@"_getprob" options:0 request:v7 responseHandler:v10];
    }
  }
  return self->_getProblemsState;
}

void __40__SFDeviceRepairSession__runGetProblems__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v24 = a3;
  id v8 = a4;
  if (v7
    || CFDictionaryGetInt64Ranged()
    && (NSErrorWithOSStatusF(), (id v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 92) = 3;
    [*(id *)(a1 + 32) _reportError:v7 isPreflight:0];
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 96) = CFDictionaryGetInt64();
    *(void *)(*(void *)(a1 + 32) + 48) = CFDictionaryGetInt64();
    CFStringGetTypeID();
    uint64_t v9 = CFDictionaryGetTypedValue();
    uint64_t v10 = *(void *)(a1 + 32);
    unsigned int v11 = *(void **)(v10 + 328);
    *(void *)(v10 + 328) = v9;

    CFStringGetTypeID();
    uint64_t v12 = CFDictionaryGetTypedValue();
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 56);
    *(void *)(v13 + 56) = v12;

    CFStringGetTypeID();
    uint64_t v15 = CFDictionaryGetTypedValue();
    uint64_t v16 = *(void *)(a1 + 32);
    BOOL v17 = *(void **)(v16 + 104);
    *(void *)(v16 + 104) = v15;

    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      int v18 = *(void **)(a1 + 32);
      uint64_t v22 = v18[7];
      uint64_t v23 = v18[13];
      v20 = &unk_1A56EADC3;
      uint64_t v21 = v18[41];
      uint64_t v19 = v18[12];
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 92) = 4;
    objc_msgSend(*(id *)(a1 + 32), "_run", v19, v20, v21, v22, v23);
  }
}

- (int)_runWiFiSetup
{
  if (SFDeviceIsVirtualMachine())
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int wifiSetupState = 2;
  }
  else
  {
    int wifiSetupState = self->_wifiSetupState;
    if (wifiSetupState != 4 && wifiSetupState != 2)
    {
      if (wifiSetupState)
      {
        if (gLogCategory_SFDeviceRepairSession <= 30
          && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        if (gLogCategory_SFDeviceRepairSession <= 30
          && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_int wifiSetupState = 1;
        progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
        if (progressHandler) {
          progressHandler[2](progressHandler, 200, 0);
        }
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation invalidate];
        int v6 = objc_alloc_init(SFDeviceOperationWiFiSetup);
        wifiSetupOperation = self->_wifiSetupOperation;
        self->_wifiSetupOperation = v6;

        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setDispatchQueue:self->_dispatchQueue];
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setRepairFlags:self->_repairFlags];
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setSfSession:self->_sfSession];
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setSkipLocalReachability:self->_wifiIsCaptive];
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setSkipReachability:self->_wifiIsCaptive];
        preferredWiFiConfiguration = self->_preferredWiFiConfiguration;
        if (preferredWiFiConfiguration && [(NSDictionary *)preferredWiFiConfiguration count])
        {
          if (gLogCategory_SFDeviceRepairSession <= 30
            && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          int v16 = 0;
          CFStringGetTypeID();
          uint64_t v9 = CFDictionaryGetTypedValue();
          CFStringGetTypeID();
          uint64_t v10 = CFDictionaryGetTypedValue();
          unsigned int v11 = (void *)v10;
          if (v9 && v10)
          {
            if (gLogCategory_SFDeviceRepairSession <= 30
              && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation setPreferredWiFiConfiguration:self->_preferredWiFiConfiguration];
          }
          else
          {
            uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
            if (gLogCategory_SFDeviceRepairSession <= 60
              && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
            {
              id v14 = v12;
              LogPrintF();
            }
          }
        }
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __38__SFDeviceRepairSession__runWiFiSetup__block_invoke;
        v15[3] = &unk_1E5BBC8E8;
        v15[4] = self;
        -[SFDeviceOperationWiFiSetup setCompletionHandler:](self->_wifiSetupOperation, "setCompletionHandler:", v15, v14);
        [(SFDeviceOperationWiFiSetup *)self->_wifiSetupOperation activate];
      }
    }
  }
  return self->_wifiSetupState;
}

void __38__SFDeviceRepairSession__runWiFiSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 9))
  {
    id v8 = v3;
    if (v3)
    {
      *(_DWORD *)(v5 + 192) = 3;
      [*(id *)(a1 + 32) _reportError:v3 isPreflight:0];
    }
    else
    {
      [*(id *)(v5 + 184) metricTotalSeconds];
      *(void *)(*(void *)(a1 + 32) + 200) = v6;
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 200);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 192) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v7);
    }
    uint64_t v4 = v8;
  }
}

- (int)_runCaptiveJoin
{
  int captiveJoinState = self->_captiveJoinState;
  if (captiveJoinState != 4)
  {
    if (captiveJoinState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (self->_wifiIsCaptive)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int captiveJoinState = 1;
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin invalidate];
      uint64_t v4 = objc_alloc_init(SFDeviceOperationCNJSetup);
      captiveJoin = self->_captiveJoin;
      self->_captiveJoin = v4;

      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setSfSession:self->_sfSession];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setPresentingViewController:self->_presentingViewController];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __40__SFDeviceRepairSession__runCaptiveJoin__block_invoke;
      v7[3] = &unk_1E5BBC8E8;
      v7[4] = self;
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin setCompletionHandler:v7];
      [(SFDeviceOperationCNJSetup *)self->_captiveJoin activate];
    }
    else
    {
      self->_int captiveJoinState = 2;
    }
  }
  return self->_captiveJoinState;
}

void __40__SFDeviceRepairSession__runCaptiveJoin__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 320);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SFDeviceRepairSession__runCaptiveJoin__block_invoke_2;
  v7[3] = &unk_1E5BBBD18;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __40__SFDeviceRepairSession__runCaptiveJoin__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_SFDeviceRepairSession <= 60
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(void *)(a1 + 40) + 224) = 3;
    [*(id *)(a1 + 40) _reportError:v4 isPreflight:0];
  }
  else
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 40) + 216) metricTotalSeconds];
    *(void *)(*(void *)(a1 + 40) + 232) = v2;
    *(_DWORD *)(*(void *)(a1 + 40) + 224) = 4;
    id v3 = *(void **)(a1 + 40);
    [v3 _run];
  }
}

- (int)_runTRSessionStart
{
  int trSessionState = self->_trSessionState;
  if (trSessionState == 4 || trSessionState == 2) {
    return self->_trSessionState;
  }
  if (!trSessionState)
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int trSessionState = 1;
    uint64_t v5 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass_1[0]());
    trOperationQueue = self->_trOperationQueue;
    self->_trOperationQueue = v5;

    if (self->_trOperationQueue)
    {
      uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      trOperations = self->_trOperations;
      self->_trOperations = v7;

      uint64_t v9 = [(SFSession *)self->_sfSession trSession];
      trSession = self->_trSession;
      self->_trSession = v9;

      if (self->_trSession)
      {
        if (gLogCategory_SFDeviceRepairSession <= 30
          && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_int trSessionState = 4;
        return self->_trSessionState;
      }
      if (gLogCategory_SFDeviceRepairSession > 90
        || gLogCategory_SFDeviceRepairSession == -1 && !_LogCategory_Initialize())
      {
LABEL_32:
        self->_int trSessionState = 3;
        uint64_t v12 = NSErrorWithOSStatusF();
        [(SFDeviceRepairSession *)self _reportError:v12 isPreflight:0];

        return self->_trSessionState;
      }
    }
    else if (gLogCategory_SFDeviceRepairSession > 90 {
           || gLogCategory_SFDeviceRepairSession == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_32;
    }
    LogPrintF();
    goto LABEL_32;
  }
  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_trSessionState;
}

- (int)_runTRAuthentication
{
  int trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState != 4 && trAuthenticationState != 2)
  {
    if (trAuthenticationState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int trAuthenticationState = 1;
      self->_trAuthenticationStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 220, 0);
      }
      id v6 = (void *)[objc_alloc((Class)getTRAuthenticationOperationClass_0[0]()) initWithSession:self->_trSession];
      [(NSMutableArray *)self->_trOperations addObject:v6];
      int v17 = 0;
      uint64_t Int64 = CFPrefs_GetInt64();
      BOOL v8 = [(SFDeviceRepairSession *)self disableSilentAuth];
      if (Int64) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 1;
      }
      [v6 setShouldForceInteractiveAuth:v9];
      [v6 setShouldIgnoreAuthFailures:0];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      unsigned int v11 = v10;
      unint64_t problemFlags = self->_problemFlags;
      if ((problemFlags & 2) != 0 || (self->_repairFlags & 2) != 0)
      {
        [v10 addObject:&unk_1EFA09668];
        unint64_t problemFlags = self->_problemFlags;
      }
      if ((problemFlags & 4) != 0 || (self->_repairFlags & 4) != 0) {
        [v11 addObject:&unk_1EFA09680];
      }
      [v6 setTargetedServices:v11];
      if (self->_presentingViewController) {
        objc_msgSend(v6, "setPresentingViewController:");
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __45__SFDeviceRepairSession__runTRAuthentication__block_invoke;
      v15[3] = &unk_1E5BBBD18;
      v15[4] = self;
      id v16 = v6;
      id v13 = v6;
      [v13 setCompletionBlock:v15];
      [(TROperationQueue *)self->_trOperationQueue addOperation:v13];
    }
  }
  return self->_trAuthenticationState;
}

void __45__SFDeviceRepairSession__runTRAuthentication__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 320);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__SFDeviceRepairSession__runTRAuthentication__block_invoke_2;
  v3[3] = &unk_1E5BBBD18;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __45__SFDeviceRepairSession__runTRAuthentication__block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 248))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 288) = v2;
    id v6 = [*(id *)(a1 + 40) result];
    getTRAuthenticationOperationUnauthenticatedServicesKey_0[0]();
    CFSetGetTypeID();
    id v3 = CFDictionaryGetTypedValue();
    if (v6 && ![v3 count])
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        id v5 = *(id *)(*(void *)(a1 + 32) + 288);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 272) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v5);
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 60
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        id v5 = v6;
        LogPrintF();
      }
      id v4 = objc_msgSend(*(id *)(a1 + 40), "error", v5);
      if (!v4)
      {
        getTRAuthenticationOperationErrorKey_0[0]();
        CFErrorGetTypeID();
        id v4 = CFDictionaryGetTypedValue();
        if (!v4)
        {
          id v4 = NSErrorWithOSStatusF();
        }
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 272) = 3;
      [*(id *)(a1 + 32) _reportError:v4 isPreflight:0];
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
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
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
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setIsRepair:1];
      if (self->_presentingViewController) {
        -[SFDeviceOperationCDPSetup setPresentingViewController:](self->_cdpSetupOperation, "setPresentingViewController:");
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __37__SFDeviceRepairSession__runCDPSetup__block_invoke;
      v8[3] = &unk_1E5BBC8E8;
      v8[4] = self;
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation setCompletionHandler:v8];
      [(SFDeviceOperationCDPSetup *)self->_cdpSetupOperation activate];
    }
  }
  return self->_cdpState;
}

void __37__SFDeviceRepairSession__runCDPSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 120);
  if (v5)
  {
    id v8 = v3;
    if (v3)
    {
      *(_DWORD *)(v4 + 136) = 3;
      [*(id *)(a1 + 32) _reportError:v3 isPreflight:0];
    }
    else
    {
      [v5 metricSeconds];
      *(void *)(*(void *)(a1 + 32) + 128) = v6;
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 128);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 136) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v7);
    }
    id v3 = v8;
  }
}

- (int)_runAppleIDSetupRepair
{
  int appleIDSetupState = self->_appleIDSetupState;
  if (appleIDSetupState == 4) {
    return self->_appleIDSetupState;
  }
  if (appleIDSetupState)
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_appleIDSetupState;
  }
  uint64_t v4 = self->_altDSID;
  if (v4)
  {
    id v5 = [(SFSession *)self->_sfSession messageSessionTemplate];

    if (v5)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int appleIDSetupState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 224, 0);
      }
      uint64_t v9 = mach_absolute_time();
      id v10 = (void *)[objc_alloc(getAISRepairContextClass_0()) initWithAltDSID:v4];
      unsigned int v11 = [(SFSession *)self->_sfSession messageSessionTemplate];
      [v10 setMessageSessionTemplate:v11];

      [v10 setRemoteRole:3];
      uint64_t v12 = (AISRepairController *)objc_alloc_init(getAISRepairControllerClass_0());
      appleIDRepairController = self->_appleIDRepairController;
      self->_appleIDRepairController = v12;

      id v14 = self->_appleIDRepairController;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47__SFDeviceRepairSession__runAppleIDSetupRepair__block_invoke;
      v16[3] = &unk_1E5BC0570;
      v16[4] = self;
      v16[5] = v9;
      [(AISRepairController *)v14 repairWithContext:v10 completionHandler:v16];

      return self->_appleIDSetupState;
    }
  }
  self->_int appleIDSetupState = 3;
  uint64_t v6 = NSErrorWithOSStatusF();
  [(SFDeviceRepairSession *)self _reportError:v6 isPreflight:0];

  int v7 = self->_appleIDSetupState;
  return v7;
}

void __47__SFDeviceRepairSession__runAppleIDSetupRepair__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 320);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __47__SFDeviceRepairSession__runAppleIDSetupRepair__block_invoke_2;
  v12[3] = &unk_1E5BBCC20;
  id v13 = v6;
  uint64_t v14 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = v5;
  uint64_t v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

uint64_t __47__SFDeviceRepairSession__runAppleIDSetupRepair__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    *(_DWORD *)(*(void *)(a1 + 40) + 160) = 3;
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
    return [v2 _reportError:v3 isPreflight:0];
  }
  else
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 40) + 152) = v5;
    *(_DWORD *)(*(void *)(a1 + 40) + 160) = 4;
    id v6 = *(void **)(a1 + 40);
    return [v6 _run];
  }
}

- (int)_runHomeKitSetup
{
  int homeKitSetupState = self->_homeKitSetupState;
  if (homeKitSetupState != 4)
  {
    if (homeKitSetupState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int homeKitSetupState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 234, 0);
      }
      uint64_t v5 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      homeKitSetupOperation = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v5;

      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setKeyExchangeOnly:1];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setUserInteractive:0];
      uint64_t v7 = [(SFSession *)self->_sfSession trSession];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setTrSession:v7];

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __41__SFDeviceRepairSession__runHomeKitSetup__block_invoke;
      v9[3] = &unk_1E5BBC8E8;
      v9[4] = self;
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation setCompletionHandler:v9];
      [(SFDeviceOperationHomeKitSetup *)self->_homeKitSetupOperation activate];
    }
  }
  return self->_homeKitSetupState;
}

void __41__SFDeviceRepairSession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 168))
  {
    id v6 = v3;
    if (v3)
    {
      *(_DWORD *)(v5 + 176) = 3;
      [*(id *)(a1 + 32) _reportError:v3 isPreflight:0];
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 176) = 4;
      [*(id *)(a1 + 32) _run];
    }
    uint64_t v4 = v6;
  }
}

- (int)_runFinish
{
  int finishState = self->_finishState;
  if (finishState != 4 && finishState != 2)
  {
    if (finishState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int finishState = 1;
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __35__SFDeviceRepairSession__runFinish__block_invoke;
      v7[3] = &unk_1E5BBCBF8;
      void v7[4] = self;
      [(SFSession *)sfSession sendRequestID:@"_finish" options:0 request:MEMORY[0x1E4F1CC08] responseHandler:v7];
    }
  }
  return self->_finishState;
}

void __35__SFDeviceRepairSession__runFinish__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7
    || CFDictionaryGetInt64Ranged()
    && (NSErrorWithOSStatusF(), (uint64_t v7 = (SFRepairResultMetrics *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 296) = 3;
    [*(id *)(a1 + 32) _reportError:v7 isPreflight:0];
  }
  else
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v7 = objc_alloc_init(SFRepairResultMetrics);
    [(SFRepairResultMetrics *)v7 setProblemFlags:*(void *)(*(void *)(a1 + 32) + 96)];
    [(SFRepairResultMetrics *)v7 setPeerProblemFlags:*(void *)(*(void *)(a1 + 32) + 64)];
    [(SFRepairResultMetrics *)v7 setForceWiFi:*(_DWORD *)(*(void *)(a1 + 32) + 304) & 1];
    mach_absolute_time();
    [(SFRepairResultMetrics *)v7 setTotalMs:(double)(unint64_t)UpTicksToMilliseconds()];
    [(SFRepairResultMetrics *)v7 setTriggerMs:(double)*(unint64_t *)(*(void *)(a1 + 32) + 368)];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 336) model];
    [(SFRepairResultMetrics *)v7 setPeerModel:v10];

    [(SFRepairResultMetrics *)v7 setPeerBuild:*(void *)(*(void *)(a1 + 32) + 104)];
    [(SFRepairResultMetrics *)v7 setHasView:*(void *)(*(void *)(a1 + 32) + 352) != 0];
    [*(id *)(a1 + 32) _reportRepairResultMetrics:v7];
    id v11 = objc_alloc_init(SFClient);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __35__SFDeviceRepairSession__runFinish__block_invoke_2;
    v15[3] = &unk_1E5BBC8E8;
    uint64_t v12 = v11;
    uint64_t v16 = v12;
    [(SFClient *)v12 reenableProxCardType:10 completion:v15];
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = v13[45];
    if (v14)
    {
      (*(void (**)(void, uint64_t, void))(v14 + 16))(v13[45], 96, 0);
      id v13 = *(void **)(a1 + 32);
    }
    [v13 _cleanup];
  }
}

void __35__SFDeviceRepairSession__runFinish__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    id v3 = v4;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v3);
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

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (NSDictionary)preferredWiFiConfiguration
{
  return self->_preferredWiFiConfiguration;
}

- (void)setPreferredWiFiConfiguration:(id)a3
{
  self->_preferredWiFiConfiguration = (NSDictionary *)a3;
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

- (unsigned)repairFlags
{
  return self->_repairFlags;
}

- (void)setRepairFlags:(unsigned int)a3
{
  self->_repairFlags = a3;
}

- (unint64_t)triggerMs
{
  return self->_triggerMs;
}

- (void)setTriggerMs:(unint64_t)a3
{
  self->_triggerMs = a3;
}

- (BOOL)disableSilentAuth
{
  return self->_disableSilentAuth;
}

- (void)setDisableSilentAuth:(BOOL)a3
{
  self->_disableSilentAuth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_captiveJoin, 0);
  objc_storeStrong((id *)&self->_wifiSetupOperation, 0);
  objc_storeStrong((id *)&self->_homeKitSetupOperation, 0);
  objc_storeStrong((id *)&self->_appleIDRepairController, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_peerOSBuild, 0);
  objc_storeStrong((id *)&self->_peerSSID, 0);

  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end