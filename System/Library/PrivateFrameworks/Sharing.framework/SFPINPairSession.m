@interface SFPINPairSession
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SFPINPairSession)init;
- (SFService)sfService;
- (id)completionHandler;
- (id)hidePINHandler;
- (id)promptForPINHandler;
- (id)showPINHandler;
- (void)_activate;
- (void)_cleanup;
- (void)_clientHeartbeatSend;
- (void)_clientPairSetup:(id)a3 start:(BOOL)a4;
- (void)_clientPairVerify:(id)a3 start:(BOOL)a4;
- (void)_clientRun;
- (void)_clientSFSessionStart;
- (void)_clientTryPIN:(id)a3;
- (void)_completed:(int)a3;
- (void)_handleServerRequest:(id)a3;
- (void)_hearbeatTimer;
- (void)_invalidate;
- (void)activate;
- (void)clientTryPIN:(id)a3;
- (void)dealloc;
- (void)handleServerHeartbeat:(id)a3;
- (void)handleServerPairSetup:(id)a3 reset:(BOOL)a4;
- (void)handleServerPairVerify:(id)a3 reset:(BOOL)a4;
- (void)handleServerRequest:(id)a3;
- (void)invalidate;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHidePINHandler:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setSfService:(id)a3;
- (void)setShowPINHandler:(id)a3;
@end

@implementation SFPINPairSession

- (SFPINPairSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFPINPairSession;
  v2 = [(SFPINPairSession *)&v7 init];
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
    objc_super v7 = (SFPINPairSession *)FatalErrorF();
    [(SFPINPairSession *)v7 activate];
  }
  else
  {
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    id promptForPINHandler = self->_promptForPINHandler;
    self->_id promptForPINHandler = 0;

    id showPINHandler = self->_showPINHandler;
    self->_id showPINHandler = 0;

    id hidePINHandler = self->_hidePINHandler;
    self->_id hidePINHandler = 0;

    v9.receiver = self;
    v9.super_class = (Class)SFPINPairSession;
    [(SFPINPairSession *)&v9 dealloc];
  }
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SFPINPairSession_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SFPINPairSession_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    if (self->_peerDevice) {
      v3 = "client";
    }
    else {
      v3 = "server";
    }
    objc_super v9 = v3;
    LogPrintF();
  }
  self->_activateCalled = 1;
  self->_startTicks = mach_absolute_time();
  if (!self->_transaction)
  {
    uint64_t v4 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v4;

    if (!self->_transaction
      && gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!self->_heartbeatTimer)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_heartbeatLastTicks = mach_absolute_time();
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    heartbeatTimer = self->_heartbeatTimer;
    self->_heartbeatTimer = v6;

    SEL v8 = self->_heartbeatTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __29__SFPINPairSession__activate__block_invoke;
    handler[3] = &unk_1E5BBC870;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    SFDispatchTimerSet(self->_heartbeatTimer, 1.0, 1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_heartbeatTimer);
  }
  if (self->_peerDevice)
  {
    [(SFPINPairSession *)self _clientRun];
  }
  else if (!self->_sfService)
  {
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFPINPairSession _completed:](self, "_completed:", 4294960591, v9);
  }
}

uint64_t __29__SFPINPairSession__activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hearbeatTimer];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SFPINPairSession_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__SFPINPairSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    uint64_t v4 = heartbeatTimer;
    dispatch_source_cancel(v4);
    v5 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;
  }
  [(SFPINPairSession *)self _cleanup];
  id completionHandler = (void (**)(id, void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0);
    id v7 = self->_completionHandler;
  }
  else
  {
    id v7 = 0;
  }
  self->_id completionHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;

  id showPINHandler = self->_showPINHandler;
  self->_id showPINHandler = 0;

  id hidePINHandler = self->_hidePINHandler;
  self->_id hidePINHandler = 0;

  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)_cleanup
{
  self->_pairSetupDone = 0;
  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    CFRelease(pairSetupSession);
    self->_pairSetupSession = 0;
  }
  self->_pairVerifyDone = 0;
  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  [(SFSession *)self->_sfSession invalidate];
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  self->_sfSessionActivated = 0;
}

- (void)_completed:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v28[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  mach_absolute_time();
  uint64_t v5 = UpTicksToMilliseconds();
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v23 = v5;
    uint64_t v24 = v3;
    LogPrintF();
  }
  id completionHandler = (void (**)(id, void *))self->_completionHandler;
  unint64_t v7 = 0x1E4F1C000uLL;
  if (completionHandler)
  {
    if (v3)
    {
      SEL v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28760];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      uint64_t v10 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v11 = (void *)v10;
      v12 = @"?";
      if (v10) {
        v12 = (__CFString *)v10;
      }
      v28[0] = v12;
      v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1, v23, v24);
      v14 = [v8 errorWithDomain:v9 code:(int)v3 userInfo:v13];
      completionHandler[2](completionHandler, v14);

      unint64_t v7 = 0x1E4F1C000;
    }
    else
    {
      completionHandler[2](self->_completionHandler, 0);
    }
    id v15 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  v25[0] = @"_cat";
  v25[1] = @"_op";
  v26[0] = @"PINPair";
  v26[1] = @"Done";
  v25[2] = @"error";
  v16 = objc_msgSend(NSNumber, "numberWithInt:", v3, v23, v24);
  v26[2] = v16;
  v25[3] = @"ms";
  v17 = [NSNumber numberWithUnsignedLongLong:v5];
  v26[3] = v17;
  v18 = [*(id *)(v7 + 2536) dictionaryWithObjects:v26 forKeys:v25 count:4];
  SFDashboardLogJSON(v18);

  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    v20 = heartbeatTimer;
    dispatch_source_cancel(v20);
    v21 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;
  }
  [(SFPINPairSession *)self _cleanup];
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)_hearbeatTimer
{
  mach_absolute_time();
  unint64_t v3 = UpTicksToMilliseconds();
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_pairSetupWaitingForUser || v3 >> 3 < 0x753)
  {
    if (self->_sfSessionActivated)
    {
      [(SFPINPairSession *)self _clientHeartbeatSend];
    }
  }
  else
  {
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    heartbeatTimer = self->_heartbeatTimer;
    if (heartbeatTimer)
    {
      uint64_t v5 = heartbeatTimer;
      dispatch_source_cancel(v5);
      v6 = self->_heartbeatTimer;
      self->_heartbeatTimer = 0;
    }
    [(SFPINPairSession *)self _completed:4294960574];
  }
}

- (void)_clientRun
{
  v5[2] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientStarted)
  {
    v5[0] = 0;
    v5[1] = 0;
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFPINPairSession *)self _cleanup];
    UUIDGet();
    unint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:16];
    clientSessionUUID = self->_clientSessionUUID;
    self->_clientSessionUUID = v3;

    self->_clientStarted = 1;
  }
  if (!self->_sfSession)
  {
    [(SFPINPairSession *)self _clientSFSessionStart];
    return;
  }
  if (!self->_sfSessionActivated)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_17;
    }
    return;
  }
  if (!self->_pairVerifySession)
  {
    if (!self->_pairVerifyDone)
    {
      [(SFPINPairSession *)self _clientPairVerify:0 start:1];
      return;
    }
    goto LABEL_19;
  }
  if (self->_pairVerifyDone)
  {
LABEL_19:
    if (self->_pairSetupSession)
    {
      if (!self->_pairSetupDone
        && gLogCategory_SFPINPairSession <= 30
        && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_17;
      }
    }
    else if (!self->_pairSetupDone)
    {
      [(SFPINPairSession *)self _clientPairSetup:0 start:1];
    }
    return;
  }
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
LABEL_17:
    LogPrintF();
  }
}

- (void)_clientHeartbeatSend
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (self->_heartbeatSending)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_heartbeatSending = 1;
    unint64_t v3 = objc_alloc_init(SFRequestMessage);
    v7[0] = @"op";
    v7[1] = @"sid";
    clientSessionUUID = self->_clientSessionUUID;
    v8[0] = &unk_1EFA09818;
    v8[1] = clientSessionUUID;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
    [(SFMessage *)v3 setHeaderFields:v5];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__SFPINPairSession__clientHeartbeatSend__block_invoke;
    v6[3] = &unk_1E5BC10F0;
    v6[4] = self;
    [(SFRequestMessage *)v3 setResponseHandler:v6];
    [(SFSession *)self->_sfSession sendRequest:v3];
  }
}

void __40__SFPINPairSession__clientHeartbeatSend__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(void *)(*(void *)(a1 + 32) + 32) = mach_absolute_time();
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
}

- (void)_clientSFSessionStart
{
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFSession *)self->_sfSession invalidate];
  unint64_t v3 = objc_alloc_init(SFSession);
  sfSession = self->_sfSession;
  self->_sfSession = v3;

  [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
  [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
  [(SFSession *)self->_sfSession setServiceIdentifier:@"com.apple.sharing.PINPair"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SFPINPairSession__clientSFSessionStart__block_invoke;
  void v8[3] = &unk_1E5BBC8E8;
  v8[4] = self;
  [(SFSession *)self->_sfSession setErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __41__SFPINPairSession__clientSFSessionStart__block_invoke_2;
  v7[3] = &unk_1E5BBC870;
  v7[4] = self;
  [(SFSession *)self->_sfSession setInterruptionHandler:v7];
  [(SFSession *)self->_sfSession setInvalidationHandler:&__block_literal_global_61];
  id v5 = self->_sfSession;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SFPINPairSession__clientSFSessionStart__block_invoke_4;
  v6[3] = &unk_1E5BBC8E8;
  v6[4] = self;
  [(SFSession *)v5 activateWithCompletion:v6];
}

void __41__SFPINPairSession__clientSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_SFPINPairSession <= 90
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _completed:NSErrorToOSStatus()];
}

uint64_t __41__SFPINPairSession__clientSFSessionStart__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFPINPairSession <= 60
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _completed:4294960534];
}

void __41__SFPINPairSession__clientSFSessionStart__block_invoke_3()
{
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __41__SFPINPairSession__clientSFSessionStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFPINPairSession <= 90
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(a1 + 32) _completed:NSErrorToOSStatus()];
  }
  else
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    [*(id *)(a1 + 32) _clientRun];
  }
}

- (void)_clientPairVerify:(id)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  v27[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v25 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  char v22 = 0;
  if (v4)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    pairVerifySession = self->_pairVerifySession;
    if (pairVerifySession)
    {
      CFRelease(pairVerifySession);
      self->_pairVerifySession = 0;
    }
    uint64_t v8 = PairingSessionCreate();
    unsigned int v25 = v8;
    if (v8)
    {
      id v9 = 0;
      uint64_t v10 = 0;
      goto LABEL_38;
    }
    PairingSessionSetFlags();
    PairingSessionSetLogging();
    if ([(SFDevice *)self->_peerDevice osVersion] >= 9) {
      PairingSessionSetACL();
    }
  }
  else
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_pairVerifySession)
    {
      id v9 = 0;
      uint64_t v10 = 0;
      uint64_t v8 = 4294960551;
LABEL_53:
      unsigned int v25 = v8;
      goto LABEL_38;
    }
  }
  if (v6)
  {
    v11 = [v6 headerFields];
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
    unsigned int v25 = Int64Ranged;

    if (Int64Ranged)
    {
      if (gLogCategory_SFPINPairSession <= 30)
      {
        if (gLogCategory_SFPINPairSession == -1 && !_LogCategory_Initialize()) {
          goto LABEL_58;
        }
        uint64_t v20 = Int64Ranged;
LABEL_50:
        LogPrintF();
LABEL_58:
        uint64_t v10 = 0;
        id v9 = 0;
        goto LABEL_37;
      }
LABEL_51:
      uint64_t v10 = 0;
      id v9 = 0;
      goto LABEL_42;
    }
    v13 = [v6 headerFields];
    CFDataGetTypeID();
    v14 = CFDictionaryGetTypedValue();

    if (!v14)
    {
      unsigned int v25 = -6762;
      if (gLogCategory_SFPINPairSession <= 60)
      {
        if (gLogCategory_SFPINPairSession == -1 && !_LogCategory_Initialize()) {
          goto LABEL_58;
        }
        goto LABEL_50;
      }
      goto LABEL_51;
    }
  }
  else
  {
    v14 = 0;
  }
  id v9 = v14;
  [v9 bytes];
  [v9 length];
  unsigned int v15 = PairingSessionExchange();
  unsigned int v25 = v15;
  if (v22 && !v15)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFPINPairSession *)self _completed:0];
    goto LABEL_36;
  }
  if (v15)
  {
LABEL_36:
    uint64_t v10 = 0;
    goto LABEL_37;
  }
  if (!v24)
  {
    uint64_t v10 = 0;
    uint64_t v8 = 4294960534;
    goto LABEL_53;
  }
  uint64_t v10 = objc_alloc_init(SFRequestMessage);
  v16 = &unk_1EFA09848;
  if (v4) {
    v16 = &unk_1EFA09830;
  }
  v27[0] = v16;
  v26[0] = @"op";
  v26[1] = @"pd";
  v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v24 length:v23 freeWhenDone:1];
  v26[2] = @"sid";
  clientSessionUUID = self->_clientSessionUUID;
  v27[1] = v17;
  v27[2] = clientSessionUUID;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  [(SFMessage *)v10 setHeaderFields:v19];

  uint64_t v24 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__SFPINPairSession__clientPairVerify_start___block_invoke;
  v21[3] = &unk_1E5BC10F0;
  v21[4] = self;
  [(SFRequestMessage *)v10 setResponseHandler:v21];
  [(SFSession *)self->_sfSession sendRequest:v10];
LABEL_37:
  uint64_t v8 = v25;
  if (!v25) {
    goto LABEL_43;
  }
LABEL_38:
  if (gLogCategory_SFPINPairSession <= 30)
  {
    if (gLogCategory_SFPINPairSession == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_42;
      }
      uint64_t v8 = v25;
    }
    uint64_t v20 = v8;
    LogPrintF();
  }
LABEL_42:
  self->_pairVerifyDone = 1;
  [(SFPINPairSession *)self _clientRun];
LABEL_43:
  if (v24) {
    free(v24);
  }
}

void __44__SFPINPairSession__clientPairVerify_start___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    id v6 = v5;
    id v7 = v8;
    LogPrintF();
  }
  if (v8 || !v5)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      id v6 = v8;
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_clientRun", v6, v7);
  }
  else
  {
    [*(id *)(a1 + 32) _clientPairVerify:v5 start:0];
  }
}

- (void)_clientPairSetup:(id)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  v34[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int Int64Ranged = 0;
  uint64_t v30 = 0;
  v31 = 0;
  char v29 = 0;
  if (v4)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v26 = 0;
    long long v28 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    v23[5] = self;
    unsigned int v25 = _clientPairSetupPromptForPIN;
    pairSetupSession = self->_pairSetupSession;
    if (pairSetupSession)
    {
      CFRelease(pairSetupSession);
      self->_pairSetupSession = 0;
    }
    uint64_t v8 = PairingSessionCreate();
    unsigned int Int64Ranged = v8;
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = 0;
      v11 = 0;
      goto LABEL_39;
    }
    PairingSessionSetFlags();
    PairingSessionSetLogging();
    if ([(SFDevice *)self->_peerDevice osVersion] >= 9) {
      PairingSessionSetACL();
    }
  }
  else
  {
    if (!self->_pairSetupSession)
    {
      id v10 = 0;
      v11 = 0;
      uint64_t v9 = 4294960551;
      goto LABEL_57;
    }
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (v6)
  {
    v12 = [v6 headerFields];
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();

    uint64_t v9 = Int64Ranged;
    if (Int64Ranged)
    {
      if (gLogCategory_SFPINPairSession <= 60)
      {
        if (gLogCategory_SFPINPairSession == -1)
        {
          if (!_LogCategory_Initialize()) {
            goto LABEL_62;
          }
          uint64_t v9 = Int64Ranged;
        }
        uint64_t v21 = v9;
LABEL_51:
        LogPrintF();
LABEL_62:
        v11 = 0;
        id v10 = 0;
        goto LABEL_38;
      }
LABEL_52:
      v11 = 0;
      id v10 = 0;
LABEL_43:
      -[SFPINPairSession _completed:](self, "_completed:", v9, v21);
      goto LABEL_44;
    }
    v13 = [v6 headerFields];
    CFDataGetTypeID();
    v14 = CFDictionaryGetTypedValue();

    if (!v14)
    {
      uint64_t v9 = 4294960534;
      unsigned int Int64Ranged = -6762;
      if (gLogCategory_SFPINPairSession <= 60)
      {
        if (gLogCategory_SFPINPairSession == -1 && !_LogCategory_Initialize()) {
          goto LABEL_62;
        }
        goto LABEL_51;
      }
      goto LABEL_52;
    }
  }
  else
  {
    v14 = 0;
  }
  id v10 = v14;
  [v10 bytes];
  [v10 length];
  unsigned int v15 = PairingSessionExchange();
  unsigned int Int64Ranged = v15;
  if (v29 && !v15)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFPINPairSession *)self _completed:Int64Ranged];
    goto LABEL_37;
  }
  if (v15 != -6771)
  {
    if (v15)
    {
LABEL_37:
      v11 = 0;
      goto LABEL_38;
    }
    if (v31)
    {
      v11 = objc_alloc_init(SFRequestMessage);
      v16 = &unk_1EFA09878;
      if (v4) {
        v16 = &unk_1EFA09860;
      }
      v34[0] = v16;
      v33[0] = @"op";
      v33[1] = @"pd";
      v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v31 length:v30 freeWhenDone:1];
      v33[2] = @"sid";
      clientSessionUUID = self->_clientSessionUUID;
      v34[1] = v17;
      v34[2] = clientSessionUUID;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
      [(SFMessage *)v11 setHeaderFields:v19];

      v31 = 0;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __43__SFPINPairSession__clientPairSetup_start___block_invoke;
      v23[3] = &unk_1E5BC10F0;
      v23[4] = self;
      [(SFRequestMessage *)v11 setResponseHandler:v23];
      [(SFSession *)self->_sfSession sendRequest:v11];
LABEL_38:
      uint64_t v9 = Int64Ranged;
      if (!Int64Ranged) {
        goto LABEL_44;
      }
LABEL_39:
      if (gLogCategory_SFPINPairSession <= 60)
      {
        if (gLogCategory_SFPINPairSession != -1 || (v20 = _LogCategory_Initialize(), uint64_t v9 = Int64Ranged, v20))
        {
          uint64_t v22 = v9;
          LogPrintF();
          -[SFPINPairSession _completed:](self, "_completed:", Int64Ranged, v22);
          goto LABEL_44;
        }
      }
      goto LABEL_43;
    }
    v11 = 0;
    uint64_t v9 = 4294960534;
LABEL_57:
    unsigned int Int64Ranged = v9;
    goto LABEL_39;
  }
  unsigned int Int64Ranged = 0;
  if (gLogCategory_SFPINPairSession <= 30)
  {
    if (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    goto LABEL_37;
  }
  v11 = 0;
LABEL_44:
  if (v31) {
    free(v31);
  }
}

void __43__SFPINPairSession__clientPairSetup_start___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v6 || !v5)
  {
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(a1 + 32) _completed:NSErrorToOSStatus()];
  }
  else
  {
    [*(id *)(a1 + 32) _clientPairSetup:v5 start:0];
  }
}

- (void)clientTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __33__SFPINPairSession_clientTryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __33__SFPINPairSession_clientTryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clientTryPIN:*(void *)(a1 + 40)];
}

- (void)_clientTryPIN:(id)a3
{
  id v8 = (__CFString *)a3;
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    int v4 = IsAppleInternalBuild();
    id v5 = @"*";
    if (v4) {
      id v5 = v8;
    }
    id v7 = v5;
    LogPrintF();
  }
  self->_pairSetupWaitingForUser = 0;
  if (!self->_pairSetupSession)
  {
    uint64_t v6 = 4294960551;
    goto LABEL_9;
  }
  [(__CFString *)v8 UTF8String];
  uint64_t v6 = PairingSessionSetSetupCode();
  if (v6)
  {
LABEL_9:
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[SFPINPairSession _completed:](self, "_completed:", v6, v6);
    }
    else
    {
      -[SFPINPairSession _completed:](self, "_completed:", v6, v7);
    }
    goto LABEL_15;
  }
  [(SFPINPairSession *)self _clientPairSetup:0 start:0];
LABEL_15:
}

- (void)handleServerRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __40__SFPINPairSession_handleServerRequest___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __40__SFPINPairSession_handleServerRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleServerRequest:*(void *)(a1 + 40)];
}

- (void)_handleServerRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 headerFields];
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 5u) {
      id v7 = "?";
    }
    else {
      id v7 = off_1E5BC1110[(char)Int64Ranged];
    }
    v14 = v7;
    id v15 = v4;
    LogPrintF();
  }
  switch(Int64Ranged)
  {
    case 1u:
      [(SFPINPairSession *)self handleServerHeartbeat:v4];
      break;
    case 2u:
      v11 = self;
      id v12 = v4;
      uint64_t v13 = 1;
      goto LABEL_17;
    case 3u:
      v11 = self;
      id v12 = v4;
      uint64_t v13 = 0;
LABEL_17:
      -[SFPINPairSession handleServerPairVerify:reset:](v11, "handleServerPairVerify:reset:", v12, v13, v14, v15);
      break;
    case 4u:
      id v8 = self;
      id v9 = v4;
      uint64_t v10 = 1;
      goto LABEL_19;
    case 5u:
      id v8 = self;
      id v9 = v4;
      uint64_t v10 = 0;
LABEL_19:
      -[SFPINPairSession handleServerPairSetup:reset:](v8, "handleServerPairSetup:reset:", v9, v10, v14, v15);
      break;
    default:
      if (gLogCategory_SFPINPairSession <= 30
        && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
}

- (void)handleServerHeartbeat:(id)a3
{
  id v4 = a3;
  self->_heartbeatLastTicks = mach_absolute_time();
  id v5 = [[SFResponseMessage alloc] initWithRequestMessage:v4];

  [(SFService *)self->_sfService sendResponse:v5];
}

- (void)handleServerPairVerify:(id)a3 reset:(BOOL)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  pairVerifySession = self->_pairVerifySession;
  if (a4)
  {
    if (pairVerifySession)
    {
      CFRelease(pairVerifySession);
      self->_pairVerifySession = 0;
    }
  }
  else if (pairVerifySession)
  {
    goto LABEL_11;
  }
  if (PairingSessionCreate())
  {
    id v8 = 0;
    id v9 = 0;
    goto LABEL_7;
  }
  PairingSessionSetFlags();
  PairingSessionSetLogging();
LABEL_11:
  uint64_t v10 = [v6 headerFields];
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (gLogCategory_SFPINPairSession > 60)
    {
      id v8 = 0;
      id v9 = 0;
      goto LABEL_21;
    }
    if (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    id v8 = 0;
    goto LABEL_7;
  }
  id v9 = v9;
  [v9 bytes];
  [v9 length];
  unsigned int v16 = PairingSessionExchange();
  id v8 = [[SFResponseMessage alloc] initWithRequestMessage:v6];
  uint64_t v11 = v16;
  if (!v16)
  {
LABEL_7:
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_21;
  }
  if (gLogCategory_SFPINPairSession <= 30)
  {
    if (gLogCategory_SFPINPairSession != -1 || (int v12 = _LogCategory_Initialize(), v11 = v16, v12))
    {
      uint64_t v15 = v11;
      LogPrintF();
      uint64_t v11 = v16;
    }
  }
  v17 = @"err";
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", v11, v15);
  v18[0] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  [(SFMessage *)v8 setHeaderFields:v14];

  [(SFService *)self->_sfService sendResponse:v8];
LABEL_21:
}

- (void)handleServerPairSetup:(id)a3 reset:(BOOL)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  pairSetupSession = self->_pairSetupSession;
  if (a4 || !pairSetupSession)
  {
    if (pairSetupSession)
    {
      CFRelease(pairSetupSession);
      self->_pairSetupSession = 0;
    }
    if (PairingSessionCreate())
    {
      id v8 = 0;
      id v9 = 0;
      goto LABEL_7;
    }
    PairingSessionSetFlags();
    PairingSessionSetLogging();
    PairingSessionSetACL();
  }
  uint64_t v10 = [v6 headerFields];
  CFDataGetTypeID();
  uint64_t v11 = CFDictionaryGetTypedValue();

  if (!v11)
  {
    if (gLogCategory_SFPINPairSession > 60)
    {
      id v8 = 0;
      id v9 = 0;
      goto LABEL_21;
    }
    if (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    id v9 = 0;
    id v8 = 0;
    goto LABEL_7;
  }
  id v9 = v11;
  [v9 bytes];
  [v9 length];
  unsigned int v17 = PairingSessionExchange();
  id v8 = [[SFResponseMessage alloc] initWithRequestMessage:v6];
  uint64_t v12 = v17;
  if (!v17)
  {
LABEL_7:
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_21;
  }
  if (gLogCategory_SFPINPairSession <= 60)
  {
    if (gLogCategory_SFPINPairSession != -1 || (v13 = _LogCategory_Initialize(), uint64_t v12 = v17, v13))
    {
      uint64_t v16 = v12;
      LogPrintF();
      uint64_t v12 = v17;
    }
  }
  v18 = @"err";
  v14 = objc_msgSend(NSNumber, "numberWithInt:", v12, v16);
  v19[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  [(SFMessage *)v8 setHeaderFields:v15];

  [(SFService *)self->_sfService sendResponse:v8];
LABEL_21:
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

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (SFService)sfService
{
  return self->_sfService;
}

- (void)setSfService:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)showPINHandler
{
  return self->_showPINHandler;
}

- (void)setShowPINHandler:(id)a3
{
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);

  objc_storeStrong((id *)&self->_clientSessionUUID, 0);
}

@end