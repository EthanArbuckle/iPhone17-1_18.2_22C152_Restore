@interface SFPasswordSharingSession
- (NSString)deviceName;
- (NSString)hashedEmail;
- (NSString)hashedPhone;
- (NSString)hotspotPSK;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SFPasswordSharingSession)init;
- (id)progressHandler;
- (id)promptForPINHandler;
- (int)_runPair;
- (int)_runPasswordShare;
- (int)_runSFSessionStart;
- (void)_cleanup;
- (void)_completedWithError:(id)a3;
- (void)_receivedObject:(id)a3 flags:(unsigned int)a4;
- (void)_run;
- (void)_runPasswordShareReceiveResponse:(id)a3;
- (void)_runPasswordShareSendInfo;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDeviceName:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHashedEmail:(id)a3;
- (void)setHashedPhone:(id)a3;
- (void)setHotspotPSK:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)tryPIN:(id)a3;
@end

@implementation SFPasswordSharingSession

- (SFPasswordSharingSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFPasswordSharingSession;
  v2 = [(SFPasswordSharingSession *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    uint64_t v3 = (SFPasswordSharingSession *)FatalErrorF();
    [(SFPasswordSharingSession *)v3 activate];
  }
  else
  {
    [(SFPasswordSharingSession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFPasswordSharingSession;
    [(SFPasswordSharingSession *)&v5 dealloc];
  }
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SFPasswordSharingSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__SFPasswordSharingSession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFPasswordSharingSession <= 30
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1 + 32);
  SEL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  objc_super v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[12];
  if (v6)
  {
    (*(void (**)(void, uint64_t, void))(v6 + 16))(v5[12], 10, 0);
    objc_super v5 = *(void **)(a1 + 32);
  }

  return [v5 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SFPasswordSharingSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__SFPasswordSharingSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9)
    && gLogCategory_SFPasswordSharingSession <= 30
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  SEL v4 = *(void **)(a1 + 32);

  return [v4 _cleanup];
}

- (void)tryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SFPasswordSharingSession_tryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __35__SFPasswordSharingSession_tryPIN___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 24)
    && gLogCategory_SFPasswordSharingSession <= 60
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v3 pairSetupTryPIN:v2];
}

- (void)_cleanup
{
  self->_pairState = 0;
  self->_passwordShareState = 0;
  self->_sfSessionState = 0;
}

- (void)_completedWithError:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_SFPasswordSharingSession <= 50
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    objc_super v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:self->_shareClock];
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = v4;
  if (v6)
  {
    if (gLogCategory_SFPasswordSharingSession <= 60
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      v10 = @"eo";
      v11[0] = v6;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      progressHandler[2](progressHandler, 20, v8);
    }
  }
  else
  {
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (v9) {
      v9[2](v9, 20, 0);
    }
  }
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled
    && [(SFPasswordSharingSession *)self _runSFSessionStart] == 4
    && [(SFPasswordSharingSession *)self _runPair] == 4)
  {
    [(SFPasswordSharingSession *)self _runPasswordShare];
  }
}

- (int)_runSFSessionStart
{
  int sfSessionState = self->_sfSessionState;
  if (sfSessionState)
  {
    if (sfSessionState != 4
      && gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int sfSessionState = 1;
    [(SFSession *)self->_sfSession invalidate];
    id v4 = objc_alloc_init(SFSession);
    sfSession = self->_sfSession;
    self->_sfSession = v4;

    [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
    [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
    [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.PasswordSharing"];
    id v6 = [(SFDevice *)self->_peerDevice contactIdentifier];
    [(SFSession *)self->_sfSession setPeerContactIdentifier:v6];

    [(SFSession *)self->_sfSession setSessionFlags:12];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke;
    v13[3] = &unk_1E5BBC8E8;
    v13[4] = self;
    [(SFSession *)self->_sfSession setErrorHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_2;
    v12[3] = &unk_1E5BBC870;
    v12[4] = self;
    [(SFSession *)self->_sfSession setInterruptionHandler:v12];
    [(SFSession *)self->_sfSession setInvalidationHandler:&__block_literal_global_20];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_4;
    v11[3] = &unk_1E5BBE590;
    v11[4] = self;
    [(SFSession *)self->_sfSession setPromptForPINHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_5;
    v10[3] = &unk_1E5BBE5B8;
    v10[4] = self;
    [(SFSession *)self->_sfSession setReceivedObjectHandler:v10];
    v7 = self->_sfSession;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_6;
    v9[3] = &unk_1E5BBC8E8;
    v9[4] = self;
    [(SFSession *)v7 activateWithCompletion:v9];
  }
  return self->_sfSessionState;
}

void __46__SFPasswordSharingSession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_SFPasswordSharingSession <= 90)
  {
    if (gLogCategory_SFPasswordSharingSession != -1 || (v4 = _LogCategory_Initialize(), id v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v3, v5);
}

void __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFPasswordSharingSession <= 60
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _completedWithError:v3];
}

void __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_3()
{
  if (gLogCategory_SFPasswordSharingSession <= 30
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_SFPasswordSharingSession <= 30
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 104);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _receivedObject:a3 flags:a2];
}

void __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_SFPasswordSharingSession <= 90)
    {
      if (gLogCategory_SFPasswordSharingSession != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
      {
        id v6 = v4;
        LogPrintF();
        id v4 = v7;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v4, v6);
  }
  else
  {
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 32) = 4;
    [*(id *)(a1 + 32) _run];
  }
}

- (int)_runPair
{
  int pairState = self->_pairState;
  if (pairState)
  {
    if (pairState != 4
      && gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__4;
    v14 = __Block_byref_object_dispose__4;
    id v15 = 0;
    if (gLogCategory_SFPasswordSharingSession <= 50
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    int v5 = (void *)v11[5];
    void v11[5] = v4;

    self->_int pairState = 1;
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 60, 0);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__SFPasswordSharingSession__runPair__block_invoke;
    aBlock[3] = &unk_1E5BBE5E0;
    aBlock[4] = self;
    aBlock[5] = &v10;
    id v7 = _Block_copy(aBlock);
    [(SFSession *)self->_sfSession pairVerifyWithFlags:4096 completion:v7];

    _Block_object_dispose(&v10, 8);
  }
  return self->_pairState;
}

void __36__SFPasswordSharingSession__runPair__block_invoke(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (gLogCategory_SFPasswordSharingSession <= 50
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    id v22 = v5;
    LogPrintF();
  }
  if (v3)
  {
    if (gLogCategory_SFPasswordSharingSession <= 50
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      id v22 = v3;
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 12) = 3;
    id v8 = v3;
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = v9[12];
    if (v10)
    {
      v27 = @"eo";
      v28[0] = v8;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, 30, v11);

      v9 = *(void **)(a1 + 32);
    }
    objc_msgSend(v9, "_completedWithError:", v8, v22);
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 12) = 4;
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = v6[12];
    if (v7)
    {
      (*(void (**)(void, uint64_t, void))(v7 + 16))(v6[12], 70, 0);
      id v6 = *(void **)(a1 + 32);
    }
    objc_msgSend(v6, "_run", v22);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeIntervalSinceNow];
  double v13 = v12;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeIntervalSinceNow];
  if (v13 < 0.0) {
    double v14 = -v14;
  }
  uint64_t v15 = (uint64_t)(v14 * 1000.0);
  v25[0] = @"_cat";
  v25[1] = @"_op";
  v26[0] = @"PasswordSharing";
  v26[1] = @"PairVerify";
  v25[2] = @"durationMS";
  v16 = [NSNumber numberWithInteger:v15];
  v26[2] = v16;
  v25[3] = @"errorCode";
  v17 = [NSNumber numberWithInt:NSErrorToOSStatus()];
  v26[3] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
  SFDashboardLogJSON(v18);

  v23[0] = @"durationMS";
  v19 = [NSNumber numberWithInteger:v15];
  v23[1] = @"errorCode";
  v24[0] = v19;
  v20 = [NSNumber numberWithInt:NSErrorToOSStatus()];
  v24[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  SFMetricsLog(@"com.apple.sharing.PasswordSharingPairVerify", v21);
}

- (int)_runPasswordShare
{
  int passwordShareState = self->_passwordShareState;
  if (passwordShareState)
  {
    if (passwordShareState != 4
      && gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFPasswordSharingSession <= 50
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFPasswordSharingSession *)self _runPasswordShareSendInfo];
  }
  return self->_passwordShareState;
}

- (void)_runPasswordShareSendInfo
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v3 = self->_hotspotPSK;
  uint64_t v4 = [(SFDevice *)self->_peerDevice requestSSID];
  if (!self->_sfSession)
  {
    if (gLogCategory_SFPasswordSharingSession <= 60)
    {
      if (gLogCategory_SFPasswordSharingSession == -1)
      {
        int v5 = -6762;
        if (!_LogCategory_Initialize()) {
          goto LABEL_4;
        }
      }
      else
      {
        int v5 = -6762;
      }
      goto LABEL_53;
    }
    int v5 = -6762;
LABEL_55:
    self->_int passwordShareState = 3;
LABEL_22:
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    uint64_t v15 = *MEMORY[0x1E4F28760];
    unint64_t v16 = 0x1E4F28000uLL;
    if (progressHandler)
    {
      v35 = @"eo";
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = v5;
      uint64_t v33 = *MEMORY[0x1E4F28568];
      uint64_t v19 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v20 = (void *)v19;
      v21 = @"?";
      if (v19) {
        v21 = (__CFString *)v19;
      }
      v34 = v21;
      id v22 = v4;
      v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1, v32);
      v24 = [v17 errorWithDomain:v15 code:v18 userInfo:v23];
      v36 = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      progressHandler[2](progressHandler, 30, v25);

      uint64_t v4 = v22;
      unint64_t v16 = 0x1E4F28000;
    }
    else
    {
      uint64_t v18 = v5;
    }
    v26 = objc_msgSend(*(id *)(v16 + 3160), "errorWithDomain:code:userInfo:", v15, v18, 0, v32, v33);
    [(SFPasswordSharingSession *)self _completedWithError:v26];

    id v27 = 0;
    goto LABEL_49;
  }
  if (self->_passwordShareState)
  {
    int v5 = -6709;
LABEL_4:
    int v6 = gLogCategory_SFPasswordSharingSession;
    self->_int passwordShareState = 3;
    if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F28760];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      uint64_t v9 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v10 = (void *)v9;
      v11 = @"?";
      if (v9) {
        v11 = (__CFString *)v9;
      }
      v38[0] = v11;
      double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      v32 = [v7 errorWithDomain:v8 code:v5 userInfo:v12];
      LogPrintF();
    }
    goto LABEL_22;
  }
  self->_int passwordShareState = 1;
  double v13 = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (v13) {
    v13[2](v13, 80, 0);
  }
  if (!v4)
  {
    int v5 = -6705;
    goto LABEL_4;
  }
  if (v3)
  {
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_29;
  }
  SFShareablePasswordForSSID(v4);
  id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (gLogCategory_SFPasswordSharingSession <= 60)
    {
      if (gLogCategory_SFPasswordSharingSession == -1)
      {
        id v3 = 0;
        int v5 = -6709;
        if (!_LogCategory_Initialize()) {
          goto LABEL_4;
        }
      }
      else
      {
        id v3 = 0;
        int v5 = -6709;
      }
LABEL_53:
      LogPrintF();
      goto LABEL_4;
    }
    id v3 = 0;
    int v5 = -6709;
    goto LABEL_55;
  }
LABEL_29:
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"gr"];
  [v27 setObject:v4 forKeyedSubscript:@"nw"];
  [v27 setObject:&unk_1EFA09518 forKeyedSubscript:@"op"];
  [v27 setObject:v3 forKeyedSubscript:@"psk"];
  hashedEmail = self->_hashedEmail;
  if (hashedEmail)
  {
    [v27 setObject:hashedEmail forKeyedSubscript:@"eh"];
  }
  else if (gLogCategory_SFPasswordSharingSession <= 60 {
         && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  hashedPhone = self->_hashedPhone;
  if (hashedPhone)
  {
    [v27 setObject:hashedPhone forKeyedSubscript:@"ph"];
  }
  else if (gLogCategory_SFPasswordSharingSession <= 60 {
         && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    [v27 setObject:deviceName forKeyedSubscript:@"dn"];
  }
  else if (gLogCategory_SFPasswordSharingSession <= 60 {
         && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  [(SFSession *)self->_sfSession sendWithFlags:1 object:v27];
  v31 = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (v31) {
    v31[2](v31, 82, 0);
  }
LABEL_49:
}

- (void)_runPasswordShareReceiveResponse:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (CFDictionaryGetInt64())
  {
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int passwordShareState = 4;
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 83, 0);
    }
  }
  else
  {
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    if (gLogCategory_SFPasswordSharingSession <= 60
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = Int64Ranged;
      LogPrintF();
    }
    self->_int passwordShareState = 4;
    if (self->_progressHandler)
    {
      if (Int64Ranged)
      {
        uint64_t v18 = @"eo";
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F28760];
        uint64_t v16 = *MEMORY[0x1E4F28568];
        uint64_t v9 = [NSString stringWithUTF8String:DebugGetErrorString()];
        uint64_t v10 = (void *)v9;
        v11 = @"?";
        if (v9) {
          v11 = (__CFString *)v9;
        }
        v17 = v11;
        double v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1, v15);
        double v13 = [v7 errorWithDomain:v8 code:(int)Int64Ranged userInfo:v12];
        v19[0] = v13;
        double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      }
      else
      {
        double v14 = 0;
      }
      (*((void (**)(void))self->_progressHandler + 2))();
    }
  }
  -[SFPasswordSharingSession _completedWithError:](self, "_completedWithError:", 0, v15);
}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  id v5 = a3;
  if (CFDictionaryGetInt64Ranged() == 5)
  {
    [(SFPasswordSharingSession *)self _runPasswordShareReceiveResponse:v5];
  }
  else if (gLogCategory_SFPasswordSharingSession <= 60 {
         && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)hashedEmail
{
  return self->_hashedEmail;
}

- (void)setHashedEmail:(id)a3
{
}

- (NSString)hashedPhone
{
  return self->_hashedPhone;
}

- (void)setHashedPhone:(id)a3
{
}

- (NSString)hotspotPSK
{
  return self->_hotspotPSK;
}

- (void)setHotspotPSK:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_hotspotPSK, 0);
  objc_storeStrong((id *)&self->_hashedPhone, 0);
  objc_storeStrong((id *)&self->_hashedEmail, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_shareClock, 0);

  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end