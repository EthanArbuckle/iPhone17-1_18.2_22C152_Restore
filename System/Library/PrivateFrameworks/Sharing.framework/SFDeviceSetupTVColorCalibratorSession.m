@interface SFDeviceSetupTVColorCalibratorSession
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SFDeviceSetupTVColorCalibratorSession)init;
- (id)progressHandler;
- (id)promptForPINHandler;
- (int)_runFinish;
- (int)_runPairSetup;
- (int)_runPairVerify:(BOOL)a3;
- (int)_runSFSessionStart;
- (int)_runTVLatencySetup;
- (unint64_t)triggerMs;
- (void)_cleanup;
- (void)_handleSetupActionRequest:(id)a3 responseHandler:(id)a4;
- (void)_reportError:(id)a3;
- (void)_run;
- (void)_runSFSessionActivated;
- (void)_runTVColorCalibratorProgressEvent:(unint64_t)a3 info:(id)a4;
- (void)_runTVColorCalibratorSetup;
- (void)_runTVLatencySetupRequest;
- (void)activate;
- (void)invalidate;
- (void)pairSetupTryPIN:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setTriggerMs:(unint64_t)a3;
- (void)tryAgain;
@end

@implementation SFDeviceSetupTVColorCalibratorSession

- (SFDeviceSetupTVColorCalibratorSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupTVColorCalibratorSession;
  v2 = [(SFDeviceSetupTVColorCalibratorSession *)&v7 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)_cleanup
{
  v8 = self->_tvColorCalibrator;
  tvColorCalibrator = self->_tvColorCalibrator;
  self->_tvColorCalibrator = 0;

  [(TVLDisplayColorCalibrator *)v8 invalidate];
  [(SFSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    id v6 = self->_progressHandler;
  }
  else
  {
    id v6 = 0;
  }
  self->_progressHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SFDeviceSetupTVColorCalibratorSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __49__SFDeviceSetupTVColorCalibratorSession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  *(void *)(*(void *)(a1 + 32) + 32) = mach_absolute_time();
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[10];
  if (v3)
  {
    (*(void (**)(void, uint64_t, void))(v3 + 16))(v2[10], 10, 0);
    v2 = *(void **)(a1 + 32);
  }

  return [v2 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SFDeviceSetupTVColorCalibratorSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __51__SFDeviceSetupTVColorCalibratorSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16)
    && gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 _cleanup];
}

- (void)_reportError:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 60
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    id v22 = v6;
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v27 = @"eo";
    v8 = v6;
    if (!v6)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28760];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v3 = (void *)v11;
      if (v11) {
        v12 = (__CFString *)v11;
      }
      else {
        v12 = @"?";
      }
      v26 = v12;
      v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1, v22);
      v8 = [v9 errorWithDomain:v10 code:-6700 userInfo:v4];
    }
    v28[0] = v8;
    v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1, v22);
    progressHandler[2](progressHandler, 30, v13);

    if (!v6)
    {
    }
  }
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code", v22, @"errCode"));
  v24[0] = v14;
  v23[1] = @"errDomain";
  uint64_t v15 = [v6 domain];
  v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = @"?";
  }
  v24[1] = v17;
  v24[2] = MEMORY[0x1E4F1CC28];
  v23[2] = @"success";
  v23[3] = @"totalMs";
  v18 = NSNumber;
  mach_absolute_time();
  v19 = [v18 numberWithUnsignedLongLong:UpTicksToMilliseconds()];
  v24[3] = v19;
  v23[4] = @"triggerMs";
  v20 = [NSNumber numberWithUnsignedLongLong:self->_triggerMs];
  v24[4] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
  SFMetricsLog(@"com.apple.sharing.TVLatencyResult", v21);
}

- (void)pairSetupTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SFDeviceSetupTVColorCalibratorSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __57__SFDeviceSetupTVColorCalibratorSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) pairSetupTryPIN:*(void *)(a1 + 40)];
}

- (void)tryAgain
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SFDeviceSetupTVColorCalibratorSession_tryAgain__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __49__SFDeviceSetupTVColorCalibratorSession_tryAgain__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(*(void *)(a1 + 32) + 56);

  return [v2 calibrate];
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    int v3 = [(SFDeviceSetupTVColorCalibratorSession *)self _runSFSessionStart];
    if (v3 == 4 || v3 == 2)
    {
      int v4 = [(SFDeviceSetupTVColorCalibratorSession *)self _runPairVerify:0];
      if (v4 == 4 || v4 == 2)
      {
        if (self->_sessionSecured
          || ((int v5 = [(SFDeviceSetupTVColorCalibratorSession *)self _runPairVerify:1], v5 == 4)
           || v5 == 2)
          && (self->_sessionSecured
           || (int v9 = [(SFDeviceSetupTVColorCalibratorSession *)self _runPairSetup], v9 == 4)
           || v9 == 2))
        {
          int v6 = [(SFDeviceSetupTVColorCalibratorSession *)self _runTVLatencySetup];
          if (v6 == 4 || v6 == 2)
          {
            int v7 = [(SFDeviceSetupTVColorCalibratorSession *)self _runFinish];
            if (v7 == 4 || v7 == 2)
            {
              id v8 = _Block_copy(self->_progressHandler);
              if (v8)
              {
                id v10 = v8;
                (*((void (**)(void *, uint64_t, void))v8 + 2))(v8, 96, 0);
                id v8 = v10;
              }
            }
          }
        }
      }
    }
  }
}

- (int)_runSFSessionStart
{
  int sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int sfSessionState = 1;
      [(SFSession *)self->_sfSession invalidate];
      int v5 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v5;

      [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
      [(SFSession *)self->_sfSession setLabel:@"TVLatency"];
      [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
      [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.AppleTVSetup"];
      [(SFSession *)self->_sfSession setSessionFlags:33];
      id location = 0;
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke;
      v18[3] = &unk_1E5BBCB58;
      objc_copyWeak(&v19, &location);
      [(SFSession *)self->_sfSession setErrorHandler:v18];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_2;
      v16[3] = &unk_1E5BBCB80;
      objc_copyWeak(&v17, &location);
      [(SFSession *)self->_sfSession setInterruptionHandler:v16];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_3;
      v14[3] = &unk_1E5BBCB80;
      objc_copyWeak(&v15, &location);
      [(SFSession *)self->_sfSession setInvalidationHandler:v14];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_4;
      v12[3] = &unk_1E5BBCB80;
      objc_copyWeak(&v13, &location);
      [(SFSession *)self->_sfSession setSessionStartedHandler:v12];
      int v7 = _Block_copy(self->_promptForPINHandler);
      if (v7) {
        [(SFSession *)self->_sfSession setPromptForPINHandler:v7];
      }

      id v8 = self->_sfSession;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_5;
      v10[3] = &unk_1E5BBCB58;
      objc_copyWeak(&v11, &location);
      [(SFSession *)v8 activateWithCompletion:v10];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  return self->_sfSessionState;
}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained && !WeakRetained[16]) {
    [WeakRetained _reportError:v5];
  }
}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[16])
  {
    id v3 = WeakRetained;
    v2 = NSErrorWithOSStatusF();
    [v3 _reportError:v2];

    WeakRetained = v3;
  }
}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[16])
  {
    id v3 = WeakRetained;
    v2 = NSErrorWithOSStatusF();
    [v3 _reportError:v2];

    WeakRetained = v3;
  }
}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_4(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((unsigned char *)WeakRetained + 16) && WeakRetained[12] == 1)
  {
    WeakRetained[12] = 4;
    v2 = WeakRetained;
    [WeakRetained _run];
    WeakRetained = v2;
  }
}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 16))
  {
    if (v5)
    {
      *((_DWORD *)WeakRetained + 12) = 3;
      objc_msgSend(WeakRetained, "_reportError:");
    }
    else
    {
      [WeakRetained _runSFSessionActivated];
    }
  }
}

- (void)_runSFSessionActivated
{
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SFDeviceSetupTVColorCalibratorSession__runSFSessionActivated__block_invoke;
  v4[3] = &unk_1E5BBCBA8;
  v4[4] = self;
  [(SFSession *)sfSession registerRequestID:@"_sa" options:&unk_1EFA099E0 handler:v4];
  [(SFDeviceSetupTVColorCalibratorSession *)self _run];
}

uint64_t __63__SFDeviceSetupTVColorCalibratorSession__runSFSessionActivated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSetupActionRequest:responseHandler:");
}

- (int)_runPairVerify:(BOOL)a3
{
  if (a3 && ([(SFSession *)self->_sfSession sessionFlags] & 0x400) == 0)
  {
    [(SFSession *)self->_sfSession setSessionFlags:[(SFSession *)self->_sfSession sessionFlags] | 0x400];
    self->_int pairVerifyState = 0;
  }
  int pairVerifyState = self->_pairVerifyState;
  if (pairVerifyState != 4 && pairVerifyState != 2)
  {
    if (pairVerifyState)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      __int16 v6 = [(SFSession *)self->_sfSession sessionFlags];
      int v7 = @"CUPairing";
      if ((v6 & 0x400) == 0) {
        int v7 = @"HomeKit";
      }
      id v8 = v7;
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        v12 = v8;
        LogPrintF();
      }
      self->_int pairVerifyState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 60, 0);
      }
      sfSession = self->_sfSession;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56__SFDeviceSetupTVColorCalibratorSession__runPairVerify___block_invoke;
      v13[3] = &unk_1E5BBCBD0;
      v13[4] = self;
      v13[5] = v8;
      -[SFSession pairVerifyWithFlags:completion:](sfSession, "pairVerifyWithFlags:completion:", 8, v13, v12);
    }
  }
  return self->_pairVerifyState;
}

void __56__SFDeviceSetupTVColorCalibratorSession__runPairVerify___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    id v7 = v3;
    if (v3)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 24) = 2;
    }
    else
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 24) = 4;
      *(unsigned char *)(*(void *)(a1 + 32) + 28) = 1;
      int v4 = *(void **)(a1 + 32);
      uint64_t v5 = v4[10];
      if (!v5) {
        goto LABEL_15;
      }
      (*(void (**)(void, uint64_t, void))(v5 + 16))(v4[10], 70, 0);
    }
    int v4 = *(void **)(a1 + 32);
LABEL_15:
    objc_msgSend(v4, "_run", v6);
    id v3 = v7;
  }
}

- (int)_runPairSetup
{
  int pairSetupState = self->_pairSetupState;
  if (pairSetupState != 4)
  {
    if (pairSetupState)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      self->_int pairSetupState = 1;
      progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 60, 0);
      }
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __54__SFDeviceSetupTVColorCalibratorSession__runPairSetup__block_invoke;
      v7[3] = &unk_1E5BBC8E8;
      v7[4] = self;
      [(SFSession *)sfSession pairSetupWithFlags:8 completion:v7];
    }
  }
  return self->_pairSetupState;
}

void __54__SFDeviceSetupTVColorCalibratorSession__runPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 20) = 3;
    [*(id *)(a1 + 32) _reportError:v3];
  }
  else
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 28) = 1;
    *(_DWORD *)(*(void *)(a1 + 32) + 20) = 4;
    int v4 = *(void **)(a1 + 32);
    uint64_t v5 = v4[10];
    if (v5)
    {
      (*(void (**)(void, uint64_t, void))(v5 + 16))(v4[10], 70, 0);
      int v4 = *(void **)(a1 + 32);
    }
    [v4 _run];
  }
}

- (int)_runTVLatencySetup
{
  int tvLatencySetupState = self->_tvLatencySetupState;
  if (tvLatencySetupState > 3)
  {
    if (tvLatencySetupState == 4) {
      return self->_tvLatencySetupState;
    }
    if (tvLatencySetupState == 11)
    {
      [(SFDeviceSetupTVColorCalibratorSession *)self _runTVColorCalibratorSetup];
      return self->_tvLatencySetupState;
    }
    goto LABEL_9;
  }
  if (!tvLatencySetupState)
  {
    [(SFDeviceSetupTVColorCalibratorSession *)self _runTVLatencySetupRequest];
    return self->_tvLatencySetupState;
  }
  if (tvLatencySetupState != 2)
  {
LABEL_9:
    if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return self->_tvLatencySetupState;
}

- (void)_runTVLatencySetupRequest
{
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 278, 0);
  }
  self->_int tvLatencySetupState = 10;
  sfSession = self->_sfSession;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SFDeviceSetupTVColorCalibratorSession__runTVLatencySetupRequest__block_invoke;
  v5[3] = &unk_1E5BBCBF8;
  v5[4] = self;
  [(SFSession *)sfSession sendRequestID:@"_tvlS" options:0 request:MEMORY[0x1E4F1CC08] responseHandler:v5];
}

void __66__SFDeviceSetupTVColorCalibratorSession__runTVLatencySetupRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v14)
  {
    id v10 = *(void **)(a1 + 32);
    int v9 = (id *)(a1 + 32);
    id v11 = NSErrorNestedF();
    [v10 _reportError:v11];

    int v12 = 3;
  }
  else
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
    {
      id v13 = v8;
      LogPrintF();
    }
    int v9 = (id *)(a1 + 32);
    int v12 = 11;
  }
  *((_DWORD *)*v9 + 13) = v12;
  objc_msgSend(*v9, "_run", v13);
}

- (void)_runTVColorCalibratorSetup
{
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_int tvLatencySetupState = 12;
  id v3 = [(SFSession *)self->_sfSession messageSessionTemplate];
  if (v3)
  {
    int v4 = (void *)[objc_alloc((Class)getTVLDisplayColorCalibratorClass[0]()) initWithMessageSession:v3];
    objc_storeStrong((id *)&self->_tvColorCalibrator, v4);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    int v9 = __67__SFDeviceSetupTVColorCalibratorSession__runTVColorCalibratorSetup__block_invoke;
    id v10 = &unk_1E5BBCC48;
    id v11 = self;
    id v12 = v4;
    id v5 = v4;
    [v5 setProgressEventHandler:&v7];
    objc_msgSend(v5, "activate", v7, v8, v9, v10, v11);
    [v5 calibrate];
  }
  else
  {
    id v6 = NSErrorWithOSStatusF();
    [(SFDeviceSetupTVColorCalibratorSession *)self _reportError:v6];

    self->_int tvLatencySetupState = 3;
  }
}

void __67__SFDeviceSetupTVColorCalibratorSession__runTVColorCalibratorSetup__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__SFDeviceSetupTVColorCalibratorSession__runTVColorCalibratorSetup__block_invoke_2;
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

uint64_t __67__SFDeviceSetupTVColorCalibratorSession__runTVColorCalibratorSetup__block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 56)) {
    return [*(id *)(result + 40) _runTVColorCalibratorProgressEvent:*(void *)(result + 56) info:*(void *)(result + 48)];
  }
  return result;
}

- (void)_runTVColorCalibratorProgressEvent:(unint64_t)a3 info:(id)a4
{
  id v14 = a4;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  switch(a3)
  {
    case 0uLL:
      id v6 = (void (**)(void *, uint64_t))_Block_copy(self->_progressHandler);
      id v7 = v6;
      if (!v6) {
        goto LABEL_15;
      }
      uint64_t v8 = v6[2];
      uint64_t v9 = 278;
      break;
    case 1uLL:
      id v6 = (void (**)(void *, uint64_t))_Block_copy(self->_progressHandler);
      id v7 = v6;
      if (!v6) {
        goto LABEL_15;
      }
      uint64_t v8 = v6[2];
      uint64_t v9 = 279;
      break;
    case 2uLL:
      id v6 = (void (**)(void *, uint64_t))_Block_copy(self->_progressHandler);
      id v7 = v6;
      if (!v6) {
        goto LABEL_15;
      }
      uint64_t v8 = v6[2];
      uint64_t v9 = 280;
      break;
    case 3uLL:
      id v10 = _Block_copy(self->_progressHandler);
      id v11 = v10;
      if (v10) {
        (*((void (**)(void *, uint64_t, id))v10 + 2))(v10, 282, v14);
      }

      tvColorCalibrator = self->_tvColorCalibrator;
      self->_tvColorCalibrator = 0;
      id v13 = tvColorCalibrator;

      [(TVLDisplayColorCalibrator *)v13 invalidate];
      if (self->_tvLatencySetupState == 12)
      {
        self->_int tvLatencySetupState = 4;
        [(SFDeviceSetupTVColorCalibratorSession *)self _run];
      }
      goto LABEL_16;
    case 4uLL:
      id v6 = (void (**)(void *, uint64_t))_Block_copy(self->_progressHandler);
      id v7 = v6;
      if (!v6) {
        goto LABEL_15;
      }
      uint64_t v8 = v6[2];
      uint64_t v9 = 281;
      break;
    default:
      goto LABEL_16;
  }
  v8(v6, v9);
LABEL_15:

LABEL_16:
}

- (int)_runFinish
{
  int finishState = self->_finishState;
  if (finishState != 4 && finishState != 2)
  {
    if (finishState)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int finishState = 1;
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __51__SFDeviceSetupTVColorCalibratorSession__runFinish__block_invoke;
      v7[3] = &unk_1E5BBCBF8;
      v7[4] = self;
      [(SFSession *)sfSession sendRequestID:@"_finish" options:0 request:MEMORY[0x1E4F1CC08] responseHandler:v7];
    }
  }
  return self->_finishState;
}

void __51__SFDeviceSetupTVColorCalibratorSession__runFinish__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    id v9 = v8;
    id v10 = v11;
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = 4;
  objc_msgSend(*(id *)(a1 + 32), "_run", v9, v10);
}

- (void)_handleSetupActionRequest:(id)a3 responseHandler:(id)a4
{
  v16 = (char *)a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 0xA) {
      id v9 = "?";
    }
    else {
      id v9 = off_1E5BBCC68[(int)Int64Ranged];
    }
    uint64_t v14 = (uint64_t)v9;
    id v15 = v16;
    LogPrintF();
  }
  if (Int64Ranged == 7)
  {
    progressHandler = self->_progressHandler;
    if (!progressHandler) {
      goto LABEL_25;
    }
    id v11 = (void (*)(void *, uint64_t))progressHandler[2];
    uint64_t v12 = 278;
    goto LABEL_15;
  }
  if (Int64Ranged == 1)
  {
    progressHandler = self->_progressHandler;
    if (!progressHandler) {
      goto LABEL_25;
    }
    id v11 = (void (*)(void *, uint64_t))progressHandler[2];
    uint64_t v12 = 400;
LABEL_15:
    v11(progressHandler, v12);
    goto LABEL_25;
  }
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 60
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 0xA) {
      id v13 = "?";
    }
    else {
      id v13 = off_1E5BBCCC0[(int)Int64Ranged];
    }
    uint64_t v14 = Int64Ranged;
    id v15 = v13;
    LogPrintF();
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EFA09410, @"er", v14, v15);
LABEL_25:
  (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v7);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
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

- (unint64_t)triggerMs
{
  return self->_triggerMs;
}

- (void)setTriggerMs:(unint64_t)a3
{
  self->_triggerMs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_tvColorCalibrator, 0);

  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end