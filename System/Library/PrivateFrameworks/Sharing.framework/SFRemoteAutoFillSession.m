@interface SFRemoteAutoFillSession
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SFRemoteAutoFillSession)init;
- (id)completedHandler;
- (id)pairingFinishedHandler;
- (id)promptForPINHandler;
- (id)promptForPickerHandler;
- (int)_runContextRequest;
- (int)_runPair;
- (int)_runPairContacts;
- (int)_runPairHomeKit;
- (int)_runPairPIN;
- (int)_runPairVerify;
- (int)_runPairVisual;
- (int)_runPasswordPicker;
- (int)_runSendCredentials;
- (int)_runSessionStart;
- (void)_cleanup;
- (void)_completedWithError:(id)a3;
- (void)_handleContextRequestResponse:(id)a3 error:(id)a4;
- (void)_handlePasswordPickerResponse:(id)a3 password:(id)a4 error:(id)a5;
- (void)_handleSendCredentialsResponse:(id)a3 error:(id)a4;
- (void)_receivedObject:(id)a3 flags:(unsigned int)a4;
- (void)_run;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setCompletedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPairingFinishedHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setPromptForPickerHandler:(id)a3;
- (void)tryPIN:(id)a3;
@end

@implementation SFRemoteAutoFillSession

- (SFRemoteAutoFillSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFRemoteAutoFillSession;
  v2 = [(SFRemoteAutoFillSession *)&v7 init];
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
    v3 = (SFRemoteAutoFillSession *)FatalErrorF();
    [(SFRemoteAutoFillSession *)v3 activate];
  }
  else
  {
    [(SFRemoteAutoFillSession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFRemoteAutoFillSession;
    [(SFRemoteAutoFillSession *)&v5 dealloc];
  }
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFRemoteAutoFillSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFRemoteAutoFillSession_activate__block_invoke(uint64_t a1)
{
  uint64_t result = CFPrefs_GetInt64();
  if (result)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    return [*(id *)(a1 + 32) _run];
  }
  else if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFRemoteAutoFillSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFRemoteAutoFillSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 72)
    && gLogCategory_SFRemoteAutoFillSession <= 30
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  [*(id *)(*(void *)(a1 + 32) + 144) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0;

  SEL v4 = *(void **)(a1 + 32);

  return [v4 _cleanup];
}

- (void)_cleanup
{
  contextBundleID = self->_contextBundleID;
  self->_contextBundleID = 0;

  contextURL = self->_contextURL;
  self->_contextURL = 0;

  id pairingFinishedHandler = self->_pairingFinishedHandler;
  self->_id pairingFinishedHandler = 0;

  self->_pairingFinishedNotified = 0;
  *(void *)&self->_pairSubstate.homeKit = 0;
  *(void *)&self->_pairSubstate.pairVerify = 0;
  *(void *)&self->_pairState = 0;
  self->_passwordPickerState = 0;
  pickedPassword = self->_pickedPassword;
  self->_pickedPassword = 0;

  pickedUsername = self->_pickedUsername;
  self->_pickedUsername = 0;

  id promptForPickerHandler = self->_promptForPickerHandler;
  self->_id promptForPickerHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;

  self->_sendCredentialsState = 0;
  self->_sessionState = 0;
}

- (void)tryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SFRemoteAutoFillSession_tryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __34__SFRemoteAutoFillSession_tryPIN___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 144)
    && gLogCategory_SFRemoteAutoFillSession <= 60
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 144);

  return [v3 pairSetupTryPIN:v2];
}

- (void)_completedWithError:(id)a3
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      id v12 = v4;
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFRemoteAutoFillSession <= 30 {
         && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  completedHandler = (void (**)(id, id))self->_completedHandler;
  if (completedHandler) {
    completedHandler[2](completedHandler, v4);
  }
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", self->_contextRequestState, v12, @"contextRequestState");
  v14[0] = v6;
  v13[1] = @"pairingState";
  objc_super v7 = [NSNumber numberWithInt:self->_pairState];
  v14[1] = v7;
  v13[2] = @"passwordPickerState";
  id v8 = [NSNumber numberWithInt:self->_passwordPickerState];
  v14[2] = v8;
  v13[3] = @"sendCredentialState";
  v9 = [NSNumber numberWithInt:self->_sendCredentialsState];
  v14[3] = v9;
  v13[4] = @"sessionState";
  v10 = [NSNumber numberWithInt:self->_sessionState];
  v14[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  SFMetricsLog(@"com.apple.sharing.AutoFillSession", v11);
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activateCalled
    && !self->_invalidateCalled
    && [(SFRemoteAutoFillSession *)self _runSessionStart] == 4
    && [(SFRemoteAutoFillSession *)self _runPair] == 4)
  {
    if (!self->_pairingFinishedNotified)
    {
      id pairingFinishedHandler = (void (**)(void))self->_pairingFinishedHandler;
      if (pairingFinishedHandler)
      {
        self->_pairingFinishedNotified = 1;
        pairingFinishedHandler[2]();
      }
    }
    int v4 = [(SFRemoteAutoFillSession *)self _runContextRequest];
    if ((v4 == 4 || v4 == 2)
      && [(SFRemoteAutoFillSession *)self _runPasswordPicker] == 4
      && [(SFRemoteAutoFillSession *)self _runSendCredentials] == 4)
    {
      [(SFRemoteAutoFillSession *)self _completedWithError:0];
    }
  }
}

- (int)_runSessionStart
{
  int sessionState = self->_sessionState;
  if (sessionState)
  {
    if (sessionState != 4
      && gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int sessionState = 1;
    [(SFSession *)self->_session invalidate];
    int v4 = objc_alloc_init(SFSession);
    session = self->_session;
    self->_session = v4;

    [(SFSession *)self->_session setDispatchQueue:self->_dispatchQueue];
    [(SFSession *)self->_session setPeerDevice:self->_peerDevice];
    [(SFSession *)self->_session setServiceIdentifier:@"com.apple.sharing.RemoteAutoFill"];
    id v6 = [(SFDevice *)self->_peerDevice contactIdentifier];
    [(SFSession *)self->_session setPeerContactIdentifier:v6];

    [(SFSession *)self->_session setSessionFlags:12];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke;
    v13[3] = &unk_1E5BBC8E8;
    v13[4] = self;
    [(SFSession *)self->_session setErrorHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_2;
    v12[3] = &unk_1E5BBC870;
    v12[4] = self;
    [(SFSession *)self->_session setInterruptionHandler:v12];
    [(SFSession *)self->_session setInvalidationHandler:&__block_literal_global_62];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_4;
    v11[3] = &unk_1E5BBE590;
    v11[4] = self;
    [(SFSession *)self->_session setPromptForPINHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_5;
    v10[3] = &unk_1E5BBE5B8;
    v10[4] = self;
    [(SFSession *)self->_session setReceivedObjectHandler:v10];
    objc_super v7 = self->_session;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_6;
    v9[3] = &unk_1E5BBC8E8;
    v9[4] = self;
    [(SFSession *)v7 activateWithCompletion:v9];
  }
  return self->_sessionState;
}

void __43__SFRemoteAutoFillSession__runSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_SFRemoteAutoFillSession <= 90)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v3, v5);
}

void __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFRemoteAutoFillSession <= 60
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _completedWithError:v3];
}

void __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_3()
{
  if (gLogCategory_SFRemoteAutoFillSession <= 30
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_SFRemoteAutoFillSession <= 30
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 192);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _receivedObject:a3 flags:a2];
}

void __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_SFRemoteAutoFillSession <= 90)
    {
      if (gLogCategory_SFRemoteAutoFillSession != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
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
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 152) = 4;
    [*(id *)(a1 + 32) _run];
  }
}

- (int)_runPair
{
  unsigned int pairState = self->_pairState;
  if (pairState > 1)
  {
LABEL_25:
    if (pairState != 4
      && gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_pairState;
  }
  if (!pairState)
  {
    self->_unsigned int pairState = 1;
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    pairClock = self->_pairClock;
    self->_pairClock = v4;
  }
  int v6 = [(SFRemoteAutoFillSession *)self _runPairVerify];
  if (v6 == 4
    || (v6 & 0xFFFFFFFE) == 2
    && ((int v6 = [(SFRemoteAutoFillSession *)self _runPairHomeKit], v6 == 4)
     || (v6 & 0xFFFFFFFE) == 2
     && ((int v6 = [(SFRemoteAutoFillSession *)self _runPairContacts], v6 == 4)
      || (v6 & 0xFFFFFFFE) == 2
      && ((int v6 = [(SFRemoteAutoFillSession *)self _runPairVisual], v6 == 4)
       || (v6 & 0xFFFFFFFE) == 2
       && ((int v6 = [(SFRemoteAutoFillSession *)self _runPairPIN], v6 == 4) || (v6 & 0xFFFFFFFE) == 2)))))
  {
    if (v6 == 4 || v6 == 2) {
      unsigned int pairState = 4;
    }
    else {
      unsigned int pairState = 3;
    }
    self->_unsigned int pairState = pairState;
    goto LABEL_25;
  }
  return self->_pairState;
}

- (int)_runPairContacts
{
  int v15 = 0;
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefPairContactsDisabled == v3)
  {
    int result = self->_pairSubstate.contacts;
    if (!result)
    {
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x3032000000;
      id v12 = __Block_byref_object_copy__15;
      v13 = __Block_byref_object_dispose__15;
      id v14 = 0;
      if (gLogCategory_SFRemoteAutoFillSession <= 50
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
      int v6 = (void *)v10[5];
      void v10[5] = v5;

      self->_pairSubstate.contacts = 1;
      session = self->_session;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __43__SFRemoteAutoFillSession__runPairContacts__block_invoke;
      v8[3] = &unk_1E5BBE5E0;
      v8[4] = self;
      v8[5] = &v9;
      [(SFSession *)session pairVerifyWithFlags:4096 completion:v8];
      _Block_object_dispose(&v9, 8);

      return self->_pairSubstate.contacts;
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefPairContactsDisabled = v3;
    int result = 2;
    self->_pairSubstate.contacts = 2;
  }
  return result;
}

void __43__SFRemoteAutoFillSession__runPairContacts__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
      [v3 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v8 = v4;
      LogPrintF();
    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v8);
      [v5 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 80)];
      id v8 = v6;
      LogPrintF();
    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    int v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v7 = 4;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 92) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);
}

- (int)_runPairHomeKit
{
  int v14 = 0;
  if (self->_prefPairHomeKitDisabled == (CFPrefs_GetInt64() != 0))
  {
    int result = self->_pairSubstate.homeKit;
    if (!result)
    {
      uint64_t v8 = 0;
      id v9 = &v8;
      uint64_t v10 = 0x3032000000;
      uint64_t v11 = __Block_byref_object_copy__15;
      id v12 = __Block_byref_object_dispose__15;
      id v13 = 0;
      if (gLogCategory_SFRemoteAutoFillSession <= 50
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v5 = (void *)v9[5];
      void v9[5] = v4;

      self->_pairSubstate.homeKit = 1;
      session = self->_session;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __42__SFRemoteAutoFillSession__runPairHomeKit__block_invoke;
      v7[3] = &unk_1E5BBE5E0;
      v7[4] = self;
      void v7[5] = &v8;
      [(SFSession *)session pairVerifyWithFlags:0x400000 completion:v7];
      _Block_object_dispose(&v8, 8);

      return self->_pairSubstate.homeKit;
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefPairHomeKitDisabled = 1;
    int result = 2;
    self->_pairSubstate.homeKit = 2;
  }
  return result;
}

void __42__SFRemoteAutoFillSession__runPairHomeKit__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
      [v3 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v8 = v4;
      LogPrintF();
    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v8);
      [v5 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 80)];
      id v8 = v6;
      LogPrintF();
    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    int v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v7 = 4;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 96) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);
}

- (int)_runPairVerify
{
  int v14 = 0;
  if (self->_prefPairVerifyDisabled == (CFPrefs_GetInt64() != 0))
  {
    int result = self->_pairSubstate.pairVerify;
    if (!result)
    {
      uint64_t v8 = 0;
      id v9 = &v8;
      uint64_t v10 = 0x3032000000;
      uint64_t v11 = __Block_byref_object_copy__15;
      id v12 = __Block_byref_object_dispose__15;
      id v13 = 0;
      if (gLogCategory_SFRemoteAutoFillSession <= 50
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v5 = (void *)v9[5];
      void v9[5] = v4;

      self->_pairSubstate.pairVerify = 1;
      session = self->_session;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __41__SFRemoteAutoFillSession__runPairVerify__block_invoke;
      v7[3] = &unk_1E5BBE5E0;
      v7[4] = self;
      void v7[5] = &v8;
      [(SFSession *)session pairVerifyWithFlags:0 completion:v7];
      _Block_object_dispose(&v8, 8);

      return self->_pairSubstate.pairVerify;
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefPairVerifyDisabled = 1;
    int result = 2;
    self->_pairSubstate.pairVerify = 2;
  }
  return result;
}

void __41__SFRemoteAutoFillSession__runPairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
      [v3 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v8 = v4;
      LogPrintF();
    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v8);
      [v5 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 80)];
      id v8 = v6;
      LogPrintF();
    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    int v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v7 = 4;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 104) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);
}

- (int)_runPairPIN
{
  int result = self->_pairSubstate.pin;
  if (!result)
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__15;
    id v12 = __Block_byref_object_dispose__15;
    id v13 = 0;
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = (void *)v9[5];
    void v9[5] = v4;

    self->_pairSubstate.pin = 1;
    session = self->_session;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__SFRemoteAutoFillSession__runPairPIN__block_invoke;
    v7[3] = &unk_1E5BBE5E0;
    v7[4] = self;
    void v7[5] = &v8;
    [(SFSession *)session pairSetupWithFlags:16 completion:v7];
    _Block_object_dispose(&v8, 8);

    return self->_pairSubstate.pin;
  }
  return result;
}

void __38__SFRemoteAutoFillSession__runPairPIN__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
      [v3 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v8 = v4;
      LogPrintF();
    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v8);
      [v5 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 80)];
      id v8 = v6;
      LogPrintF();
    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    int v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v7 = 4;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 108) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);
}

- (int)_runPairVisual
{
  int v14 = 0;
  if (self->_prefPairVisualDisabled == (CFPrefs_GetInt64() != 0))
  {
    int result = self->_pairSubstate.visual;
    if (!result)
    {
      uint64_t v8 = 0;
      id v9 = &v8;
      uint64_t v10 = 0x3032000000;
      uint64_t v11 = __Block_byref_object_copy__15;
      id v12 = __Block_byref_object_dispose__15;
      id v13 = 0;
      if (gLogCategory_SFRemoteAutoFillSession <= 50
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v5 = (void *)v9[5];
      void v9[5] = v4;

      self->_pairSubstate.visual = 1;
      session = self->_session;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __41__SFRemoteAutoFillSession__runPairVisual__block_invoke;
      v7[3] = &unk_1E5BBE5E0;
      v7[4] = self;
      void v7[5] = &v8;
      [(SFSession *)session pairSetupWithFlags:272 completion:v7];
      _Block_object_dispose(&v8, 8);

      return self->_pairSubstate.visual;
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefPairVisualDisabled = 1;
    int result = 2;
    self->_pairSubstate.visual = 2;
  }
  return result;
}

void __41__SFRemoteAutoFillSession__runPairVisual__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
      [v3 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v8 = v4;
      LogPrintF();
    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v8);
      [v5 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 80)];
      id v8 = v6;
      LogPrintF();
    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    int v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v7 = 4;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 100) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);
}

- (int)_runContextRequest
{
  int contextRequestState = self->_contextRequestState;
  if (contextRequestState)
  {
    if (contextRequestState != 4
      && gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_15;
    }
  }
  else
  {
    if (self->_session)
    {
      self->_int contextRequestState = 1;
      session = self->_session;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __45__SFRemoteAutoFillSession__runContextRequest__block_invoke;
      v6[3] = &unk_1E5BBE630;
      v6[4] = self;
      [(SFSession *)session sendRequestWithFlags:1 object:&unk_1EFA09EE0 responseHandler:v6];
      return self->_contextRequestState;
    }
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
LABEL_15:
      LogPrintF();
    }
  }
  return self->_contextRequestState;
}

uint64_t __45__SFRemoteAutoFillSession__runContextRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleContextRequestResponse:a4 error:a3];
}

- (void)_handleContextRequestResponse:(id)a3 error:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSession <= 30
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v29 = (uint64_t)v30;
    LogPrintF();
  }
  if (v6)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v29 = (uint64_t)v6;
      LogPrintF();
    }
    self->_int contextRequestState = 3;
    -[SFRemoteAutoFillSession _completedWithError:](self, "_completedWithError:", v6, v29);
  }
  else
  {
    if (!v30
      && gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFDataGetTypeID();
    int v7 = CFDictionaryGetTypedValue();
    if (v7)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v8 = (NSData *)objc_msgSend(v7, "copy", v29);
      contextAppIconData = self->_contextAppIconData;
      self->_contextAppIconData = v8;
    }
    CFArrayGetTypeID();
    uint64_t v10 = CFDictionaryGetTypedValue();
    if (v10)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v29 = objc_msgSend(v10, "count", v29);
        LogPrintF();
      }
      uint64_t v11 = (NSArray *)objc_msgSend(v10, "copy", v29);
      contextAssociatedDomains = self->_contextAssociatedDomains;
      self->_contextAssociatedDomains = v11;
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        int v14 = IsAppleInternalBuild();
        int v15 = @"*";
        if (v14) {
          int v15 = v13;
        }
        uint64_t v29 = (uint64_t)v15;
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_contextBundleID, v13);
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        int v17 = IsAppleInternalBuild();
        v18 = @"*";
        if (v17) {
          v18 = v16;
        }
        uint64_t v29 = (uint64_t)v18;
        LogPrintF();
      }
      v19 = (NSString *)[(__CFString *)v16 copy];
      contextLocalizedAppName = self->_contextLocalizedAppName;
      self->_contextLocalizedAppName = v19;
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        int v22 = IsAppleInternalBuild();
        v23 = @"*";
        if (v22) {
          v23 = v21;
        }
        uint64_t v29 = (uint64_t)v23;
        LogPrintF();
      }
      v24 = (NSString *)[(__CFString *)v21 copy];
      contextUnlocalizedAppName = self->_contextUnlocalizedAppName;
      self->_contextUnlocalizedAppName = v24;
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        int v27 = IsAppleInternalBuild();
        v28 = @"*";
        if (v27) {
          v28 = v26;
        }
        uint64_t v29 = (uint64_t)v28;
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_contextURL, v26);
    }
    self->_int contextRequestState = 4;
    [(SFRemoteAutoFillSession *)self _run];
  }
}

- (int)_runPasswordPicker
{
  int passwordPickerState = self->_passwordPickerState;
  if (passwordPickerState)
  {
    if (passwordPickerState != 4
      && gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id promptForPickerHandler = (void (**)(id, NSString *, NSString *, NSString *, NSString *, NSArray *, NSData *, void *, void *))self->_promptForPickerHandler;
    if (promptForPickerHandler)
    {
      contextBundleID = self->_contextBundleID;
      contextLocalizedAppName = self->_contextLocalizedAppName;
      contextUnlocalizedAppName = self->_contextUnlocalizedAppName;
      contextURL = self->_contextURL;
      contextAppIconData = self->_contextAppIconData;
      contextAssociatedDomains = self->_contextAssociatedDomains;
      uint64_t v11 = [(SFDevice *)self->_peerDevice name];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __45__SFRemoteAutoFillSession__runPasswordPicker__block_invoke;
      v13[3] = &unk_1E5BC1148;
      v13[4] = self;
      promptForPickerHandler[2](promptForPickerHandler, contextURL, contextBundleID, contextLocalizedAppName, contextUnlocalizedAppName, contextAssociatedDomains, contextAppIconData, v11, v13);
    }
  }
  return self->_passwordPickerState;
}

void __45__SFRemoteAutoFillSession__runPasswordPicker__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(NSObject **)(v10 + 168);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__SFRemoteAutoFillSession__runPasswordPicker__block_invoke_2;
  v15[3] = &unk_1E5BBD050;
  v15[4] = v10;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v11, v15);
}

uint64_t __45__SFRemoteAutoFillSession__runPasswordPicker__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePasswordPickerResponse:*(void *)(a1 + 40) password:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_handlePasswordPickerResponse:(id)a3 password:(id)a4 error:(id)a5
{
  id v17 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  uint64_t v10 = (__CFString *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v10)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      id v16 = v10;
      LogPrintF();
    }
    self->_int passwordPickerState = 3;
    -[SFRemoteAutoFillSession _completedWithError:](self, "_completedWithError:", v10, v16);
  }
  else
  {
    if (v17)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 10
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        int v11 = IsAppleInternalBuild();
        id v12 = @"*";
        if (v11) {
          id v12 = v17;
        }
        id v16 = v12;
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_pickedUsername, a3);
    }
    if (v9)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 10
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        int v13 = IsAppleInternalBuild();
        id v14 = @"*";
        if (v13) {
          id v14 = v9;
        }
        id v16 = v14;
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_pickedPassword, a4);
    }
    if (self->_pickedUsername || self->_pickedPassword)
    {
      self->_int passwordPickerState = 4;
      [(SFRemoteAutoFillSession *)self _run];
    }
    else
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 60
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int passwordPickerState = 3;
      int v15 = NSErrorWithOSStatusF();
      [(SFRemoteAutoFillSession *)self _completedWithError:v15];
    }
  }
}

- (int)_runSendCredentials
{
  int sendCredentialsState = self->_sendCredentialsState;
  if (sendCredentialsState)
  {
    if (sendCredentialsState == 4
      || gLogCategory_SFRemoteAutoFillSession > 30
      || gLogCategory_SFRemoteAutoFillSession == -1 && !_LogCategory_Initialize())
    {
      return self->_sendCredentialsState;
    }
LABEL_24:
    LogPrintF();
    return self->_sendCredentialsState;
  }
  if (!self->_session)
  {
    if (gLogCategory_SFRemoteAutoFillSession > 60
      || gLogCategory_SFRemoteAutoFillSession == -1 && !_LogCategory_Initialize())
    {
      return self->_sendCredentialsState;
    }
    goto LABEL_24;
  }
  if (!self->_pickedPassword && !self->_pickedUsername)
  {
    if (gLogCategory_SFRemoteAutoFillSession > 60
      || gLogCategory_SFRemoteAutoFillSession == -1 && !_LogCategory_Initialize())
    {
      return self->_sendCredentialsState;
    }
    goto LABEL_24;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:&unk_1EFA098A8 forKeyedSubscript:@"op"];
  pickedUsername = self->_pickedUsername;
  if (pickedUsername) {
    [v4 setObject:pickedUsername forKeyedSubscript:@"un"];
  }
  pickedPassword = self->_pickedPassword;
  if (pickedPassword) {
    [v4 setObject:pickedPassword forKeyedSubscript:@"pw"];
  }
  self->_int sendCredentialsState = 1;
  session = self->_session;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__SFRemoteAutoFillSession__runSendCredentials__block_invoke;
  v9[3] = &unk_1E5BBE630;
  v9[4] = self;
  [(SFSession *)session sendRequestWithFlags:1 object:v4 responseHandler:v9];

  return self->_sendCredentialsState;
}

uint64_t __46__SFRemoteAutoFillSession__runSendCredentials__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleSendCredentialsResponse:a4 error:a3];
}

- (void)_handleSendCredentialsResponse:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      id v8 = v6;
      LogPrintF();
    }
    int v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      id v8 = v9;
      LogPrintF();
    }
    int v7 = 4;
  }
  self->_int sendCredentialsState = v7;
  [(SFRemoteAutoFillSession *)self _run];
}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  char Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFRemoteAutoFillSession <= 50
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Int64Ranged == 5)
  {
    id v6 = NSErrorWithOSStatusF();
    [(SFRemoteAutoFillSession *)self _completedWithError:v6];
  }
  else if (gLogCategory_SFRemoteAutoFillSession <= 60 {
         && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (id)completedHandler
{
  return self->_completedHandler;
}

- (void)setCompletedHandler:(id)a3
{
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

- (id)pairingFinishedHandler
{
  return self->_pairingFinishedHandler;
}

- (void)setPairingFinishedHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)promptForPickerHandler
{
  return self->_promptForPickerHandler;
}

- (void)setPromptForPickerHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPickerHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_pairingFinishedHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completedHandler, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_pickedUsername, 0);
  objc_storeStrong((id *)&self->_pickedPassword, 0);
  objc_storeStrong((id *)&self->_pairClock, 0);
  objc_storeStrong((id *)&self->_contextURL, 0);
  objc_storeStrong((id *)&self->_contextUnlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_contextLocalizedAppName, 0);
  objc_storeStrong((id *)&self->_contextBundleID, 0);
  objc_storeStrong((id *)&self->_contextAssociatedDomains, 0);

  objc_storeStrong((id *)&self->_contextAppIconData, 0);
}

@end