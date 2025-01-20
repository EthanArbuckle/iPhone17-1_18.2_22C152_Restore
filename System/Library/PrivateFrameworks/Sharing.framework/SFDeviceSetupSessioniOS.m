@interface SFDeviceSetupSessioniOS
- (BOOL)_allowAllOTCSenders;
- (BOOL)supportsDependentSetup;
- (OS_dispatch_queue)dispatchQueue;
- (RPFileTransferSession)fileTransferSessionTemplate;
- (SFDevice)peerDevice;
- (SFDeviceSetupSessioniOS)init;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)progressHandler;
- (id)promptForPINHandler;
- (id)receivedObjectHandler;
- (id)sfSession;
- (int)_runCoreCDPSetup;
- (int)_runDependentSetup;
- (int)_runESIMSetup;
- (int)_runPreAuthPairSetup;
- (int)_runResume;
- (unsigned)pairFlags;
- (void)_cleanup;
- (void)_completedWithError:(id)a3;
- (void)_handleBuddyProgress:(id)a3;
- (void)_handleSetupActionRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleSetupActionSoftwareUpdate;
- (void)_handleSetupPeerSuspended;
- (void)_handleSetupResumeFoundDevice:(id)a3;
- (void)_presentOneTimeCodeProxCard:(id)a3;
- (void)_receivedConfigResponse:(id)a3;
- (void)_receivedObject:(id)a3 flags:(unsigned int)a4;
- (void)_registerOneTimeCodeDetection:(id)a3;
- (void)_run;
- (void)_runOTCSetup;
- (void)_runSFSessionActivated;
- (void)_runSFSessionStart;
- (void)_sendConfigInfo;
- (void)_sendPreAuthInfo;
- (void)_startBuddySession;
- (void)activate;
- (void)dealloc;
- (void)didComplete;
- (void)didRequestPresentationForProxCard:(id)a3;
- (void)invalidate;
- (void)proximitySetupCompletedWithResult:(id)a3;
- (void)sendAppEvent:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFileTransferSessionTemplate:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPairFlags:(unsigned int)a3;
- (void)setPeerDevice:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setReceivedObjectHandler:(id)a3;
- (void)setSupportsDependentSetup:(BOOL)a3;
- (void)tryPIN:(id)a3;
@end

@implementation SFDeviceSetupSessioniOS

- (SFDeviceSetupSessioniOS)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupSessioniOS;
  v2 = [(SFDeviceSetupSessioniOS *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_pairFlags = 0;
    if (CFPrefs_GetInt64()) {
      v3->_pairFlags |= 0x100u;
    }
  }
  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFDeviceSetupSessioniOS *)FatalErrorF();
    [(SFDeviceSetupSessioniOS *)v3 _cleanup];
  }
  else
  {
    [(SFDeviceSetupSessioniOS *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupSessioniOS;
    [(SFDeviceSetupSessioniOS *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;

  id receivedObjectHandler = self->_receivedObjectHandler;
  self->_id receivedObjectHandler = 0;
}

- (void)setPairFlags:(unsigned int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SFDeviceSetupSessioniOS_setPairFlags___block_invoke;
  v4[3] = &unk_1E5BBEE88;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __40__SFDeviceSetupSessioniOS_setPairFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 172) = *(_DWORD *)(result + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    *(_DWORD *)(v1 + 172) |= 0x80000u;
    *(unsigned char *)(*(void *)(result + 32) + 37) = 1;
    return [*(id *)(result + 32) _run];
  }
  return result;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFDeviceSetupSessioniOS_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceSetupSessioniOS_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  BOOL v2 = CFPrefs_GetInt64() != 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = v2;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    v3 = "no";
    if (v2) {
      v3 = "yes";
    }
    objc_super v7 = v3;
    LogPrintF();
  }
  RandomBytes();
  SEL v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[27];
  if (v5)
  {
    (*(void (**)(void, uint64_t, void))(v5 + 16))(v4[27], 10, 0);
    SEL v4 = *(void **)(a1 + 32);
  }
  return objc_msgSend(v4, "_run", v7);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceSetupSessioniOS_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceSetupSessioniOS_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 35)
    && gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 35) = 1;
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  [*(id *)(*(void *)(a1 + 32) + 144) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  objc_super v7 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = 0;

  v8 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v8)
  {
    id v9 = v8;
    id v10 = (id)[v9 endPlanTransferForEndPoint:1];
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 96);
    *(void *)(v11 + 96) = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 80);
  *(void *)(v13 + 80) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  v15 = *(void **)(a1 + 32);
  uint64_t v16 = v15[25];
  if (v16)
  {
    (*(void (**)(void))(v16 + 16))(v15[25]);
    v15 = *(void **)(a1 + 32);
  }

  return [v15 _cleanup];
}

- (void)_completedWithError:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = v4;
  if (v5)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 60
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      id v14 = v5;
      LogPrintF();
    }
    id progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      v17 = @"eo";
      v18[0] = v5;
      objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      progressHandler[2](progressHandler, 20, v7);
    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (v8) {
      v8[2](v8, 20, 0);
    }
  }
  uint64_t v9 = objc_msgSend(v5, "domain", v14, @"errDomain");
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = &stru_1EF9BDC68;
  }
  v15[1] = @"errCode";
  v16[0] = v11;
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "code"));
  v16[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  SFMetricsLog(@"com.apple.sharing.iOSSetup", v13);
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_sfSession && self->_peerDevice)
  {
    [(SFDeviceSetupSessioniOS *)self _runSFSessionStart];
    return;
  }
  if (!self->_sfSessionActivated)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS > 30
      || gLogCategory_SFDeviceSetupSessioniOS == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_33;
  }
  if (!self->_resumePassword && [(SFDevice *)self->_peerDevice osVersion] >= 8)
  {
    int v3 = [(SFDeviceSetupSessioniOS *)self _runPreAuthPairSetup];
    if (v3 != 4 && v3 != 2) {
      return;
    }
  }
  if (!self->_preAuthRequestSent)
  {
    id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 40, 0);
    }
    self->_preAuthRequestSent = 1;
    [(SFDeviceSetupSessioniOS *)self _sendPreAuthInfo];
    return;
  }
  if (!self->_preAuthResponseReceived)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS > 30
      || gLogCategory_SFDeviceSetupSessioniOS == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_33;
  }
  if (!self->_pairSetupDone)
  {
    if (self->_pairSetupRunning)
    {
      if (!self->_pairSetupReset)
      {
        if (gLogCategory_SFDeviceSetupSessioniOS > 30
          || gLogCategory_SFDeviceSetupSessioniOS == -1 && !_LogCategory_Initialize())
        {
          return;
        }
        goto LABEL_33;
      }
    }
    else
    {
      objc_super v7 = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (v7) {
        v7[2](v7, 60, 0);
      }
    }
    *(_WORD *)&self->_pairSetupReset = 256;
    if (self->_resumePassword)
    {
      -[SFSession setFixedPIN:](self->_sfSession, "setFixedPIN:");
      if (gLogCategory_SFDeviceSetupSessioniOS > 30
        || gLogCategory_SFDeviceSetupSessioniOS == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_53;
      }
      resumePassword = self->_resumePassword;
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS > 30 {
           || gLogCategory_SFDeviceSetupSessioniOS == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_53;
    }
    LogPrintF();
LABEL_53:
    sfSession = self->_sfSession;
    uint64_t v9 = self->_pairFlags | 0x10;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __31__SFDeviceSetupSessioniOS__run__block_invoke;
    v18[3] = &unk_1E5BBC8E8;
    v18[4] = self;
    -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", v9, v18, resumePassword);
    return;
  }
  if (!self->_configRequestSent)
  {
    uint64_t v6 = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (v6) {
      v6[2](v6, 80, 0);
    }
    self->_configRequestSent = 1;
    [(SFDeviceSetupSessioniOS *)self _sendConfigInfo];
    return;
  }
  if (!self->_configResponseReceived)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS > 30
      || gLogCategory_SFDeviceSetupSessioniOS == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_33:
    LogPrintF();
    return;
  }
  if ([(SFDeviceSetupSessioniOS *)self supportsDependentSetup])
  {
    int v4 = [(SFDeviceSetupSessioniOS *)self _runDependentSetup];
    if (v4 != 4 && v4 != 2) {
      return;
    }
  }
  if (!self->_secureESIMTransferController && _os_feature_enabled_impl())
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v10 = (TSCellularPlanProximityTransferController *)[objc_alloc((Class)getTSCellularPlanProximityTransferControllerClass[0]()) initWithESIMDelegate:self];
    secureESIMTransferController = self->_secureESIMTransferController;
    self->_secureESIMTransferController = v10;

    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      resumePassword = self->_secureESIMTransferController;
      LogPrintF();
    }
  }
  if (self->_eSIMSetupEnabled)
  {
    int v12 = [(SFDeviceSetupSessioniOS *)self _runESIMSetup];
    if (v12 != 4 && v12 != 2) {
      return;
    }
    [(SFDeviceSetupSessioniOS *)self _runOTCSetup];
  }
  if (self->_resumePassword) {
    goto LABEL_67;
  }
  int v14 = [(SFDeviceSetupSessioniOS *)self _runCoreCDPSetup];
  if (v14 != 4 && v14 != 2) {
    return;
  }
  if (self->_resumePassword)
  {
LABEL_67:
    int v13 = [(SFDeviceSetupSessioniOS *)self _runResume];
    if (v13 != 4 && v13 != 2) {
      return;
    }
  }
  if (self->_buddySession)
  {
    if (!self->_buddyConfigured)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        resumePassword = self->_fileTransferSessionTemplate;
        LogPrintF();
      }
      -[BYDeviceSetupSourceSession setFileTransferSessionTemplate:](self->_buddySession, "setFileTransferSessionTemplate:", self->_fileTransferSessionTemplate, resumePassword);
      uint64_t v16 = [(SFSession *)self->_sfSession messageSessionTemplate];
      [(BYDeviceSetupSourceSession *)self->_buddySession setMessageSession:v16];

      self->_buddyConfigured = 1;
    }
    if (self->_buddyComplete)
    {
      [(SFDeviceSetupSessioniOS *)self _completedWithError:0];
      return;
    }
    if (gLogCategory_SFDeviceSetupSessioniOS > 30
      || gLogCategory_SFDeviceSetupSessioniOS == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_33;
  }
  v15 = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (v15) {
    v15[2](v15, 240, 0);
  }

  [(SFDeviceSetupSessioniOS *)self _startBuddySession];
}

void __31__SFDeviceSetupSessioniOS__run__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 38) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 36) = 1;
  id v6 = v3;
  if (v3)
  {
    [*(id *)(a1 + 32) _completedWithError:v3];
  }
  else
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v4 = *(void **)(a1 + 32);
    uint64_t v5 = v4[27];
    if (v5)
    {
      (*(void (**)(void, uint64_t, void))(v5 + 16))(v4[27], 70, 0);
      int v4 = *(void **)(a1 + 32);
    }
    [v4 _run];
  }
}

- (void)_runSFSessionStart
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFSession *)self->_sfSession invalidate];
  id v3 = objc_alloc_init(SFSession);
  sfSession = self->_sfSession;
  self->_sfSession = v3;

  [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
  [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
  [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.iOSSetup"];
  [(SFSession *)self->_sfSession setSessionFlags:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke;
  v10[3] = &unk_1E5BBC8E8;
  v10[4] = self;
  [(SFSession *)self->_sfSession setErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_2;
  v9[3] = &unk_1E5BBC870;
  v9[4] = self;
  [(SFSession *)self->_sfSession setInterruptionHandler:v9];
  [(SFSession *)self->_sfSession setInvalidationHandler:&__block_literal_global_53];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_4;
  v8[3] = &unk_1E5BBE590;
  v8[4] = self;
  [(SFSession *)self->_sfSession setPromptForPINHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_5;
  v7[3] = &unk_1E5BBE5B8;
  v7[4] = self;
  [(SFSession *)self->_sfSession setReceivedObjectHandler:v7];
  uint64_t v5 = self->_sfSession;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_6;
  v6[3] = &unk_1E5BBC8E8;
  v6[4] = self;
  [(SFSession *)v5 activateWithCompletion:v6];
}

void __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 90)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v3, v5);
}

void __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 60
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _completedWithError:v3];
}

void __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_3()
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 224);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _receivedObject:a3 flags:a2];
}

void __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 90
      && ((id v4 = v3, gLogCategory_SFDeviceSetupSessioniOS != -1) || (v5 = _LogCategory_Initialize(), id v4 = v8, v5)))
    {
      id v7 = v4;
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v8, v7);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v8, v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _runSFSessionActivated];
  }
}

- (void)_runSFSessionActivated
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_sfSessionActivated = 1;
  sfSession = self->_sfSession;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SFDeviceSetupSessioniOS__runSFSessionActivated__block_invoke;
  v4[3] = &unk_1E5BBCBA8;
  v4[4] = self;
  [(SFSession *)sfSession registerRequestID:@"_sa" options:&unk_1EFA09CB0 handler:v4];
  [(SFDeviceSetupSessioniOS *)self _run];
}

uint64_t __49__SFDeviceSetupSessioniOS__runSFSessionActivated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSetupActionRequest:responseHandler:");
}

- (int)_runPreAuthPairSetup
{
  int preAuthPairSetupState = self->_preAuthPairSetupState;
  if (preAuthPairSetupState != 4)
  {
    if (preAuthPairSetupState)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int preAuthPairSetupState = 1;
      [(SFSession *)self->_sfSession setFixedPIN:@"public"];
      sfSession = self->_sfSession;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __47__SFDeviceSetupSessioniOS__runPreAuthPairSetup__block_invoke;
      v6[3] = &unk_1E5BBC8E8;
      v6[4] = self;
      [(SFSession *)sfSession pairSetupWithFlags:24 completion:v6];
    }
  }
  return self->_preAuthPairSetupState;
}

void __47__SFDeviceSetupSessioniOS__runPreAuthPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 80) setFixedPIN:0];
  if (v3)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 40) = 3;
    [*(id *)(a1 + 32) _completedWithError:v3];
  }
  else
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 40) = 4;
    [*(id *)(a1 + 32) _run];
  }
}

- (int)_runESIMSetup
{
  int eSIMSetupState = self->_eSIMSetupState;
  if (!eSIMSetupState)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v5 = [(SFSession *)self->_sfSession messageSessionTemplate];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      id v7 = (void *)[objc_alloc((Class)getCoreTelephonyClientClass[0]()) initWithQueue:self->_dispatchQueue];
      if (v7)
      {
        id v8 = v7;
        objc_storeStrong((id *)&self->_eSIMClient, v7);
        id v9 = (id)[v8 bootstrapPlanTransferForEndpoint:1 usingMessageSession:v6];
        self->_int eSIMSetupState = 4;

        return self->_eSIMSetupState;
      }
      else
      {
        if (gLogCategory_SFDeviceSetupSessioniOS <= 90
          && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        int eSIMSetupState = 2;
        self->_int eSIMSetupState = 2;
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 90
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      int eSIMSetupState = 2;
      self->_int eSIMSetupState = 2;
    }
  }
  return eSIMSetupState;
}

- (void)_runOTCSetup
{
  if (!self->_eSIMClient)
  {
    id v3 = (CoreTelephonyClient *)[objc_alloc((Class)getCoreTelephonyClientClass[0]()) initWithQueue:self->_dispatchQueue];
    eSIMClient = self->_eSIMClient;
    self->_eSIMClient = v3;
  }
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = self->_eSIMClient;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SFDeviceSetupSessioniOS__runOTCSetup__block_invoke;
  v6[3] = &unk_1E5BC0C90;
  objc_copyWeak(&v7, &location);
  [(CoreTelephonyClient *)v5 carrierOneTimeCodeSendersWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__SFDeviceSetupSessioniOS__runOTCSetup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 60
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = WeakRetained;
    if (WeakRetained)
    {
      if (([WeakRetained _allowAllOTCSenders] & 1) != 0 || objc_msgSend(v8, "count")) {
        [v7 _registerOneTimeCodeDetection:v8];
      }
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 90 {
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
}

- (BOOL)_allowAllOTCSenders
{
  int v2 = IsAppleInternalBuild();
  if (v2)
  {
    CFPreferencesSynchronize(@"com.apple.Sharing", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowAllOTCSenders", @"com.apple.Sharing", &keyExistsAndHasValidFormat);
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (keyExistsAndHasValidFormat) {
      BOOL v4 = AppBooleanValue == 0;
    }
    else {
      BOOL v4 = 1;
    }
    LOBYTE(v2) = !v4;
  }
  return v2;
}

- (void)_registerOneTimeCodeDetection:(id)a3
{
  id v4 = a3;
  if (self->_oneTimeCodeAccelerator)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, self);
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v5 = objc_alloc(getIMOneTimeCodeAcceleratorClass());
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__SFDeviceSetupSessioniOS__registerOneTimeCodeDetection___block_invoke;
    v8[3] = &unk_1E5BC0CB8;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    uint64_t v6 = (IMOneTimeCodeAccelerator *)[v5 initWithBlockForUpdates:v8];
    oneTimeCodeAccelerator = self->_oneTimeCodeAccelerator;
    self->_oneTimeCodeAccelerator = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__SFDeviceSetupSessioniOS__registerOneTimeCodeDetection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (int v4 = _LogCategory_Initialize(), v3 = v10, v4))
    {
      id v9 = v3;
      LogPrintF();
      id v3 = v10;
    }
  }
  id v5 = objc_msgSend(v3, "firstObject", v9);
  uint64_t v6 = [v5 objectForKeyedSubscript:@"code"];
  if ([v6 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v8 = [v5 objectForKeyedSubscript:@"handle"];
      if (([*(id *)(a1 + 32) containsObject:v8] & 1) != 0
        || [WeakRetained _allowAllOTCSenders])
      {
        [WeakRetained _presentOneTimeCodeProxCard:v6];
      }
      else if (gLogCategory_SFDeviceSetupSessioniOS <= 30 {
             && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 90 {
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
}

- (void)_presentOneTimeCodeProxCard:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    [v4 UTF8String];
    LogPrintF();
  }
  id progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    id v7 = @"oneTimeCode";
    v8[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    progressHandler[2](progressHandler, 1100, v6);
  }
}

- (int)_runDependentSetup
{
  int result = self->_dependentSetupState;
  if (!result)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = [(SFSession *)self->_sfSession messageSessionTemplate];
    if (v4)
    {
      id v5 = (void *)v4;
      self->_dependentSetupState = 1;
      uint64_t v6 = (void *)[objc_alloc((Class)getPRXCardContentViewControllerClass[0]()) initWithNibName:0 bundle:0];
      id v7 = (PASUIGuardianViewPresenter *)[objc_alloc((Class)getPASUIGuardianViewPresenterClass[0]()) initWithSharingViewController:v6];
      dependentSetupSession = self->_dependentSetupSession;
      self->_dependentSetupSession = v7;

      if (objc_opt_respondsToSelector()) {
        [(PASUIGuardianViewPresenter *)self->_dependentSetupSession setDelegate:self];
      }
      id v9 = self->_dependentSetupSession;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __45__SFDeviceSetupSessioniOS__runDependentSetup__block_invoke;
      v10[3] = &unk_1E5BC0CE0;
      v10[4] = self;
      [(PASUIGuardianViewPresenter *)v9 activateWithTemplateMessageSession:v5 completion:v10];

      return self->_dependentSetupState;
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 90
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      int result = 2;
      self->_dependentSetupState = 2;
    }
  }
  return result;
}

void __45__SFDeviceSetupSessioniOS__runDependentSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSObject **)(v5 + 176);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __45__SFDeviceSetupSessioniOS__runDependentSetup__block_invoke_2;
    id v10 = &unk_1E5BBBD18;
    uint64_t v11 = v5;
    id v12 = v3;
    dispatch_async(v6, &v7);
    objc_msgSend(*(id *)(a1 + 32), "_startBuddySession", v7, v8, v9, v10, v11);
  }
}

void __45__SFDeviceSetupSessioniOS__runDependentSetup__block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 216);
  uint64_t v4 = @"viewController";
  v5[0] = v1;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, 2000, v3);
}

- (int)_runCoreCDPSetup
{
  int cdpState = self->_cdpState;
  if (cdpState != 4 && cdpState != 2)
  {
    if (cdpState)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int cdpState = 1;
      uint64_t v5 = [(SFSession *)self->_sfSession messageSessionTemplate];
      if (v5)
      {
        uint64_t v6 = (CDPContext *)objc_alloc_init((Class)getCDPContextClass_0[0]());
        cdpContext = self->_cdpContext;
        self->_cdpContext = v6;

        [(CDPContext *)self->_cdpContext setSharingChannel:v5];
        uint64_t v8 = (CDPStateController *)[objc_alloc((Class)getCDPStateControllerClass_0[0]()) initWithContext:self->_cdpContext];
        cdpController = self->_cdpController;
        self->_cdpController = v8;

        id v10 = self->_cdpController;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __43__SFDeviceSetupSessioniOS__runCoreCDPSetup__block_invoke;
        v13[3] = &unk_1E5BBD7E8;
        v13[4] = self;
        [(CDPStateController *)v10 startCircleApplicationApprovalServer:v13];
      }
      else
      {
        self->_int cdpState = 3;
        uint64_t v11 = NSErrorWithOSStatusF();
        [(SFDeviceSetupSessioniOS *)self _completedWithError:v11];
      }
    }
  }
  return self->_cdpState;
}

void __43__SFDeviceSetupSessioniOS__runCoreCDPSetup__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 176);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SFDeviceSetupSessioniOS__runCoreCDPSetup__block_invoke_2;
  block[3] = &unk_1E5BC0128;
  char v12 = a2;
  id v10 = v5;
  uint64_t v11 = v6;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __43__SFDeviceSetupSessioniOS__runCoreCDPSetup__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 40) + 128) = 4;
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 _run];
}

- (int)_runResume
{
  int resumeState = self->_resumeState;
  if (resumeState != 4)
  {
    if (resumeState)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int resumeState = 1;
      sfSession = self->_sfSession;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __37__SFDeviceSetupSessioniOS__runResume__block_invoke;
      v6[3] = &unk_1E5BBCBF8;
      void v6[4] = self;
      [(SFSession *)sfSession sendRequestID:@"_sa" options:0 request:&unk_1EFA09CD8 responseHandler:v6];
    }
  }
  return self->_resumeState;
}

void __37__SFDeviceSetupSessioniOS__runResume__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v12) {
    int v9 = 3;
  }
  else {
    int v9 = 4;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 72) = v9;
  id v10 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 216));
  uint64_t v11 = v10;
  if (v10) {
    (*((void (**)(void *, uint64_t, void))v10 + 2))(v10, 97, 0);
  }

  [*(id *)(a1 + 32) _run];
}

- (void)_sendConfigInfo
{
  if (self->_sfSession)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v3 setObject:&unk_1EFA09710 forKeyedSubscript:@"op"];
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"dn"];
    fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
    if (!fileTransferSessionTemplate)
    {
      id v5 = (RPFileTransferSession *)objc_alloc_init(MEMORY[0x1E4F94710]);
      uint64_t v6 = self->_fileTransferSessionTemplate;
      self->_fileTransferSessionTemplate = v5;

      [(RPFileTransferSession *)self->_fileTransferSessionTemplate setFlags:418];
      [(RPFileTransferSession *)self->_fileTransferSessionTemplate prepareTemplateAndReturnError:0];
      fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
    }
    id v7 = [(RPFileTransferSession *)fileTransferSessionTemplate selfPublicKey];
    if (v7) {
      [v3 setObject:v7 forKeyedSubscript:@"ftPK"];
    }

    id v8 = objc_alloc_init((Class)getACAccountStoreClass_5[0]());
    int v9 = objc_msgSend(v8, "aa_primaryAppleAccount");
    id v10 = [v9 username];
    if ([v10 length])
    {
      [v3 setObject:v10 forKeyedSubscript:@"icn"];
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    uint64_t v11 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    id v12 = [v11 firstObject];

    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"lang"];
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    int v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    int v14 = [v13 localeIdentifier];

    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"locale"];
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    v15 = (void *)WiFiCopyCurrentNetworkInfoEx();
    uint64_t v16 = v15;
    if (v15)
    {
      v17 = [v15 objectForKeyedSubscript:@"ssid"];

      if (v17)
      {
        [v3 setObject:v17 forKeyedSubscript:@"wifiSSID"];
      }
      else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
             && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
      int v14 = [v16 objectForKeyedSubscript:@"password"];

      if (v14)
      {
        [v3 setObject:v14 forKeyedSubscript:@"wifiPW"];
      }
      else
      {
        if (gLogCategory_SFDeviceSetupSessioniOS <= 30
          && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        int v14 = 0;
      }
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    }
    {
      uint64_t v18 = 0;
      LogPrintF();
    }
    -[SFSession sendWithFlags:object:](self->_sfSession, "sendWithFlags:object:", 1, v3, v18);
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_receivedConfigResponse:(id)a3
{
  id v8 = a3;
  CFDataGetTypeID();
  uint64_t v4 = CFDictionaryGetTypedValue();
  if (v4) {
    [(RPFileTransferSession *)self->_fileTransferSessionTemplate setPeerPublicKey:v4];
  }

  CFStringGetTypeID();
  id v5 = CFDictionaryGetTypedValue();
  if (v5)
  {
    uint64_t v6 = [(RPFileTransferSession *)self->_fileTransferSessionTemplate targetID];

    [(RPFileTransferSession *)self->_fileTransferSessionTemplate setTargetID:v5];
    if (!v6)
    {
      id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 420, 0);
      }
    }
  }
}

- (void)_sendPreAuthInfo
{
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v13 setObject:&unk_1EFA09728 forKeyedSubscript:@"op"];
  if (AccessibilityLibrary_sOnce_0 != -1) {
    dispatch_once(&AccessibilityLibrary_sOnce_0, &__block_literal_global_681);
  }
  if (AccessibilityLibrary_sLib_0 && dlsym((void *)AccessibilityLibrary_sLib_0, "_AXSCopySettingsDataBlobForBuddy"))
  {
    id v3 = (void *)softLink_AXSCopySettingsDataBlobForBuddy[0]();
    if (v3)
    {
      [v13 setObject:v3 forKeyedSubscript:@"axSt"];
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  uint64_t v4 = [NSNumber numberWithUnsignedChar:SFDeviceClassCodeGet()];
  [v13 setObject:v4 forKeyedSubscript:@"dclass"];

  id v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if (v5)
  {
    [v13 setObject:v5 forKeyedSubscript:@"langs"];
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v6 = [v5 firstObject];
  if (v6)
  {
    [v13 setObject:v6 forKeyedSubscript:@"lang"];
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v8 = [v7 localeIdentifier];

  if (v8)
  {
    [v13 setObject:v8 forKeyedSubscript:@"locale"];
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 60 {
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  int v9 = (void *)GestaltCopyAnswer();

  if (v9)
  {
    [v13 setObject:v9 forKeyedSubscript:@"model"];
  }
  else
  {
    id v10 = v13;
    if (gLogCategory_SFDeviceSetupSessioniOS > 60) {
      goto LABEL_39;
    }
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
  }
  id v10 = v13;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (v11 = _LogCategory_Initialize(), id v10 = v13, v11))
    {
      id v12 = v10;
      LogPrintF();
      id v10 = v13;
    }
  }
LABEL_39:
  -[SFSession sendWithFlags:object:](self->_sfSession, "sendWithFlags:object:", self->_preAuthPairSetupState == 4, v10, v12);
}

- (void)_startBuddySession
{
  if (!self->_buddySession)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = (BYDeviceSetupSourceSession *)objc_alloc_init((Class)getBYDeviceSetupSourceSessionClass[0]());
    buddySession = self->_buddySession;
    self->_buddySession = v3;

    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
      LogPrintF();
    }
    -[BYDeviceSetupSourceSession setFileTransferSessionTemplate:](self->_buddySession, "setFileTransferSessionTemplate:", self->_fileTransferSessionTemplate, fileTransferSessionTemplate);
    id v5 = [(SFSession *)self->_sfSession messageSessionTemplate];
    [(BYDeviceSetupSourceSession *)self->_buddySession setMessageSession:v5];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__SFDeviceSetupSessioniOS__startBuddySession__block_invoke;
    v7[3] = &unk_1E5BC0D08;
    v7[4] = self;
    [(BYDeviceSetupSourceSession *)self->_buddySession setProgressHandler:v7];
    [(BYDeviceSetupSourceSession *)self->_buddySession activate];
    self->_buddyConfigured = 1;
  }
}

void __45__SFDeviceSetupSessioniOS__startBuddySession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 176);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SFDeviceSetupSessioniOS__startBuddySession__block_invoke_2;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __45__SFDeviceSetupSessioniOS__startBuddySession__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleBuddyProgress:*(void *)(a1 + 40)];
}

- (void)_handleBuddyProgress:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_buddySession)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      id v17 = v4;
      LogPrintF();
    }
    if (CFDictionaryGetInt64())
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id progressHandler = (void (**)(id, uint64_t, id))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 242, v4);
      }
      self->_buddyComplete = 1;
      if (self->_dependentSetupState == 1)
      {
        self->_dependentSetupState = 4;
        self->_int eSIMSetupState = 2;
        self->_int cdpState = 2;
      }
      [(SFDeviceSetupSessioniOS *)self _run];
      goto LABEL_36;
    }
    CFErrorGetTypeID();
    id v5 = CFDictionaryGetTypedValue();
    if (v5)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[SFDeviceSetupSessioniOS _completedWithError:](self, "_completedWithError:", v5, v5);
      }
      else
      {
        -[SFDeviceSetupSessioniOS _completedWithError:](self, "_completedWithError:", v5, v17);
      }
    }
    else
    {
      int Int64Ranged = CFDictionaryGetInt64Ranged();
      CFDictionaryGetDouble();
      double v8 = v7;
      CFDictionaryGetDouble();
      double v10 = v9;
      if (Int64Ranged == 2)
      {
        if (gLogCategory_SFDeviceSetupSessioniOS <= 30
          && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        uint64_t v16 = (void (**)(id, uint64_t, void *))self->_progressHandler;
        if (!v16) {
          goto LABEL_35;
        }
        v18[0] = @"progress";
        id v13 = [NSNumber numberWithDouble:v8];
        v18[1] = @"remainSecs";
        v19[0] = v13;
        int v14 = [NSNumber numberWithDouble:v10];
        v19[1] = v14;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
        v16[2](v16, 310, v15);
      }
      else
      {
        if (Int64Ranged != 1) {
          goto LABEL_35;
        }
        if (gLogCategory_SFDeviceSetupSessioniOS <= 30
          && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id v12 = (void (**)(id, uint64_t, void *))self->_progressHandler;
        if (!v12) {
          goto LABEL_35;
        }
        v20[0] = @"progress";
        id v13 = [NSNumber numberWithDouble:v8];
        v20[1] = @"remainSecs";
        v21[0] = v13;
        int v14 = [NSNumber numberWithDouble:v10];
        v21[1] = v14;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
        v12[2](v12, 300, v15);
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  if (gLogCategory_SFDeviceSetupSessioniOS <= 60
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_36:
}

- (void)_handleSetupActionRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v16 = (char *)a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 0xA) {
      double v9 = "?";
    }
    else {
      double v9 = off_1E5BC0D50[(int)Int64Ranged];
    }
    uint64_t v14 = (uint64_t)v9;
    v15 = v16;
    LogPrintF();
  }
  switch((int)Int64Ranged)
  {
    case 1:
      id progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        int v11 = (void (*)(void *, uint64_t))progressHandler[2];
        uint64_t v12 = 400;
        goto LABEL_27;
      }
      break;
    case 2:
      id progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        int v11 = (void (*)(void *, uint64_t))progressHandler[2];
        uint64_t v12 = 401;
        goto LABEL_27;
      }
      break;
    case 3:
      id progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        int v11 = (void (*)(void *, uint64_t))progressHandler[2];
        uint64_t v12 = 410;
        goto LABEL_27;
      }
      break;
    case 4:
      id progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        int v11 = (void (*)(void *, uint64_t))progressHandler[2];
        uint64_t v12 = 411;
        goto LABEL_27;
      }
      break;
    case 5:
      [(SFDeviceSetupSessioniOS *)self _handleSetupActionSoftwareUpdate];
      break;
    case 9:
      id progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        int v11 = (void (*)(void *, uint64_t))progressHandler[2];
        uint64_t v12 = 430;
        goto LABEL_27;
      }
      break;
    case 10:
      id progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        int v11 = (void (*)(void *, uint64_t))progressHandler[2];
        uint64_t v12 = 431;
LABEL_27:
        v11(progressHandler, v12);
      }
      break;
    default:
      if (gLogCategory_SFDeviceSetupSessioniOS <= 60
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        if (Int64Ranged > 0xA) {
          id v13 = "?";
        }
        else {
          id v13 = off_1E5BC0DA8[(int)Int64Ranged];
        }
        uint64_t v14 = Int64Ranged;
        v15 = v13;
        LogPrintF();
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EFA09740, @"er", v14, v15);
      break;
  }
  (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v7);
}

- (void)_handleSetupActionSoftwareUpdate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"ResumeAuthTag" keyLength:3];
  resumeAuthTag = self->_resumeAuthTag;
  self->_resumeAuthTag = v3;

  id v5 = [(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"ResumePassword" keyLength:8];
  id v6 = v5;
  if (v5)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    char v17 = 0;
    id v7 = v5;
    [v7 bytes];
    [v7 length];
    DataToHexCStringEx();
    double v8 = [NSString stringWithUTF8String:&v15];
    resumePassword = self->_resumePassword;
    self->_resumePassword = v8;

    uint64_t v15 = 0;
    uint64_t v16 = 0;
    char v17 = 0;
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize())
      {
        uint64_t v12 = self->_resumeAuthTag;
        id v13 = self->_resumePassword;
        LogPrintF();
      }
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    sfSession = self->_sfSession;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__SFDeviceSetupSessioniOS__handleSetupActionSoftwareUpdate__block_invoke;
    v14[3] = &unk_1E5BBCBF8;
    v14[4] = self;
    [(SFSession *)sfSession sendRequestID:@"_sa", 0, &unk_1EFA09D00, v14, v12, v13 options request responseHandler];
    id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 99, 0);
    }
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 90 {
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

void __59__SFDeviceSetupSessioniOS__handleSetupActionSoftwareUpdate__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    id v9 = v8;
    id v10 = v11;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleSetupPeerSuspended", v9, v10);
}

- (void)_handleSetupPeerSuspended
{
  *(_WORD *)&self->_buddyConfigured = 0;
  fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
  self->_fileTransferSessionTemplate = 0;

  self->_pairSetupDone = 0;
  peerDevice = self->_peerDevice;
  self->_peerDevice = 0;

  self->_sfSessionActivated = 0;
  [(SFSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v6 = objc_alloc_init(SFDeviceDiscovery);
  resumeDiscovery = self->_resumeDiscovery;
  self->_resumeDiscovery = v6;
  id v8 = v6;

  [(SFDeviceDiscovery *)v8 setDiscoveryFlags:512];
  [(SFDeviceDiscovery *)v8 setDispatchQueue:self->_dispatchQueue];
  [(SFDeviceDiscovery *)v8 setPurpose:@"iOSSetupResume"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__SFDeviceSetupSessioniOS__handleSetupPeerSuspended__block_invoke;
  v10[3] = &unk_1E5BC0D30;
  v10[4] = v8;
  void v10[5] = self;
  [(SFDeviceDiscovery *)v8 setDeviceFoundHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SFDeviceSetupSessioniOS__handleSetupPeerSuspended__block_invoke_2;
  v9[3] = &unk_1E5BBCBD0;
  v9[4] = v8;
  void v9[5] = self;
  [(SFDeviceDiscovery *)v8 activateWithCompletion:v9];
}

void *__52__SFDeviceSetupSessioniOS__handleSetupPeerSuspended__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int result = *(void **)(a1 + 40);
  if (v3 == result[7]) {
    return (void *)[result _handleSetupResumeFoundDevice:a2];
  }
  return result;
}

void __52__SFDeviceSetupSessioniOS__handleSetupPeerSuspended__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 56) && gLogCategory_SFDeviceSetupSessioniOS <= 30)
  {
    id v6 = v3;
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (v5 = _LogCategory_Initialize(), id v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
}

- (void)_handleSetupResumeFoundDevice:(id)a3
{
  id v9 = a3;
  if (([v9 deviceFlags] & 0x100) != 0)
  {
    int v5 = [v9 bleDevice];
    id v6 = [v5 advertisementFields];
    CFDataGetTypeID();
    id v7 = CFDictionaryGetTypedValue();

    if ([v7 isEqual:self->_resumeAuthTag])
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_peerDevice, a3);
      [(SFDeviceDiscovery *)self->_resumeDiscovery invalidate];
      resumeDiscovery = self->_resumeDiscovery;
      self->_resumeDiscovery = 0;

      [(SFDeviceSetupSessioniOS *)self _run];
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 30 {
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 30 {
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v17 = v6;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (int v7 = _LogCategory_Initialize(), v6 = v17, v7))
    {
      uint64_t v15 = &unk_1A56EB1D9;
      uint64_t v16 = [v6 count];
      uint64_t v14 = v4;
      LogPrintF();
    }
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 2)
  {
    if (v4)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SFDeviceSetupSessioniOS _receivedConfigResponse:](self, "_receivedConfigResponse:", v17, v14, v15, v16);
      id receivedObjectHandler = (void (**)(id, void))self->_receivedObjectHandler;
      if (receivedObjectHandler) {
        ((void (**)(id, id))receivedObjectHandler)[2](receivedObjectHandler, v17);
      }
      self->_configResponseReceived = 1;
      goto LABEL_30;
    }
    id v9 = v17;
    if (gLogCategory_SFDeviceSetupSessioniOS <= 50)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (v13 = _LogCategory_Initialize(), id v9 = v17, v13))
      {
LABEL_21:
        LogPrintF();
LABEL_31:
        id v9 = v17;
      }
    }
  }
  else if (Int64Ranged == 5)
  {
    id v9 = v17;
    if ((v4 & 1) == 0 && gLogCategory_SFDeviceSetupSessioniOS <= 50)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS != -1) {
        goto LABEL_21;
      }
      int v12 = _LogCategory_Initialize();
      id v9 = v17;
      if (v12) {
        goto LABEL_21;
      }
    }
  }
  else
  {
    id v9 = v17;
    if (Int64Ranged == 4)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_preAuthResponseReceived = 1;
LABEL_30:
      [(SFDeviceSetupSessioniOS *)self _run];
      goto LABEL_31;
    }
    if (gLogCategory_SFDeviceSetupSessioniOS <= 60)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS != -1) {
        goto LABEL_21;
      }
      int v10 = _LogCategory_Initialize();
      id v9 = v17;
      if (v10) {
        goto LABEL_21;
      }
    }
  }
}

- (void)sendAppEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SFDeviceSetupSessioniOS_sendAppEvent___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __40__SFDeviceSetupSessioniOS_sendAppEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(v2 + 12);
  *(_DWORD *)(v2 + 12) = v3 + 1;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = v3;
    LogPrintF();
  }
  id v6 = (id)objc_msgSend(*(id *)(a1 + 40), "mutableCopy", v5);
  [v6 setObject:&unk_1EFA09770 forKeyedSubscript:@"op"];
  id v4 = [NSNumber numberWithUnsignedInt:v3];
  [v6 setObject:v4 forKeyedSubscript:@"appID"];

  [*(id *)(*(void *)(a1 + 32) + 80) sendWithFlags:1 object:v6];
}

- (void)tryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SFDeviceSetupSessioniOS_tryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __34__SFDeviceSetupSessioniOS_tryPIN___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 80)
    && gLogCategory_SFDeviceSetupSessioniOS <= 60
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);

  return [v3 pairSetupTryPIN:v2];
}

- (void)didComplete
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id progressHandler = self->_progressHandler;
  if (progressHandler)
  {
    id v4 = (void (*)(void))*((void *)progressHandler + 2);
    v4();
  }
}

- (void)didRequestPresentationForProxCard:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    int v7 = @"viewController";
    v8[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    progressHandler[2](progressHandler, 1000, v6);
  }
}

- (id)sfSession
{
  return self->_sfSession;
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SFDeviceSetupSessioniOS_proximitySetupCompletedWithResult___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __61__SFDeviceSetupSessioniOS_proximitySetupCompletedWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountType];
  if (!v2)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 50
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      id v4 = [*(id *)(a1 + 32) authResults];
      id v9 = [*(id *)(a1 + 32) familyMember];
      LogPrintF();
    }
LABEL_14:
    *(_DWORD *)(*(void *)(a1 + 40) + 152) = 4;
    (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 40) + 216) + 16))(*(void *)(*(void *)(a1 + 40) + 216), 2001);
    goto LABEL_19;
  }
  if (v2 != 2)
  {
    if (v2 != 1) {
      goto LABEL_19;
    }
    if (gLogCategory_SFDeviceSetupSessioniOS <= 50
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      uint64_t v3 = [*(id *)(a1 + 32) authResults];
      id v8 = [*(id *)(a1 + 32) personalAccount];
      LogPrintF();
    }
    goto LABEL_14;
  }
  if (gLogCategory_SFDeviceSetupSessioniOS <= 90
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    int v7 = [*(id *)(a1 + 32) error];
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 40) + 152) = 7;
  (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 40) + 216) + 16))(*(void *)(*(void *)(a1 + 40) + 216), 2001);
LABEL_19:
  uint64_t v5 = *(void **)(a1 + 40);

  return [v5 _run];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPFileTransferSession)fileTransferSessionTemplate
{
  return self->_fileTransferSessionTemplate;
}

- (void)setFileTransferSessionTemplate:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (unsigned)pairFlags
{
  return self->_pairFlags;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (BOOL)supportsDependentSetup
{
  return self->_supportsDependentSetup;
}

- (void)setSupportsDependentSetup:(BOOL)a3
{
  self->_supportsDependentSetup = a3;
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

- (id)receivedObjectHandler
{
  return self->_receivedObjectHandler;
}

- (void)setReceivedObjectHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receivedObjectHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dependentSetupSession, 0);
  objc_storeStrong((id *)&self->_cdpController, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeAccelerator, 0);
  objc_storeStrong((id *)&self->_secureESIMTransferController, 0);
  objc_storeStrong((id *)&self->_eSIMClient, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_resumePassword, 0);
  objc_storeStrong((id *)&self->_resumeDiscovery, 0);
  objc_storeStrong((id *)&self->_resumeAuthTag, 0);

  objc_storeStrong((id *)&self->_buddySession, 0);
}

@end