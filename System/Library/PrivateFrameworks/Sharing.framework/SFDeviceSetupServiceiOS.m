@interface SFDeviceSetupServiceiOS
- (OS_dispatch_queue)dispatchQueue;
- (RPFileTransferSession)fileTransferSessionTemplate;
- (SFDeviceSetupServiceiOS)init;
- (id)completionHandler;
- (id)hidePINHandler;
- (id)progressHandlerEx;
- (id)receivedObjectHandler;
- (id)showPINHandler;
- (id)showPINHandlerEx;
- (int)_runResumeIfNeeded;
- (void)_cleanup;
- (void)_completed:(int)a3;
- (void)_handleAppEventReceived:(id)a3;
- (void)_handleConfigRequestReceived:(id)a3;
- (void)_handleSessionEnded:(id)a3;
- (void)_handleSessionSecured:(id)a3;
- (void)_handleSessionStarted:(id)a3;
- (void)_handleSetupActionRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleSetupActionResume;
- (void)_handleSetupActionSuspend;
- (void)_invalidated;
- (void)_receivedObject:(id)a3 flags:(unsigned int)a4;
- (void)_run;
- (void)_sfServiceStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)sendObject:(id)a3;
- (void)sendSetupAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHidePINHandler:(id)a3;
- (void)setProgressHandlerEx:(id)a3;
- (void)setReceivedObjectHandler:(id)a3;
- (void)setShowPINHandler:(id)a3;
- (void)setShowPINHandlerEx:(id)a3;
@end

@implementation SFDeviceSetupServiceiOS

- (SFDeviceSetupServiceiOS)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupServiceiOS;
  v2 = [(SFDeviceSetupServiceiOS *)&v7 init];
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
    v3 = (SFDeviceSetupServiceiOS *)FatalErrorF();
    [(SFDeviceSetupServiceiOS *)v3 _cleanup];
  }
  else
  {
    [(SFDeviceSetupServiceiOS *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupServiceiOS;
    [(SFDeviceSetupServiceiOS *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id showPINHandler = self->_showPINHandler;
  self->_id showPINHandler = 0;

  id showPINHandlerEx = self->_showPINHandlerEx;
  self->_id showPINHandlerEx = 0;

  id hidePINHandler = self->_hidePINHandler;
  self->_id hidePINHandler = 0;

  id progressHandlerEx = self->_progressHandlerEx;
  self->_id progressHandlerEx = 0;

  id receivedObjectHandler = self->_receivedObjectHandler;
  self->_id receivedObjectHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFDeviceSetupServiceiOS_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceSetupServiceiOS_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = CFPrefs_GetInt64() != 0;
  v2 = *(void **)(a1 + 32);
  if (!v2[4])
  {
    v3 = objc_alloc_init(SFClient);
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    [*(id *)(*(void *)(a1 + 32) + 32) preventExitForLocaleReason:@"iOSSetup"];
    v2 = *(void **)(a1 + 32);
  }
  return [v2 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceSetupServiceiOS_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceSetupServiceiOS_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 10)
    && gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 80))
  {
    objc_msgSend((id)v2, "_handleSessionEnded:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 32) invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;

  [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  objc_super v5 = *(void **)(a1 + 32);

  return [v5 _invalidated];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFDeviceSetupServiceiOSCore <= 60
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_sfService)
    {
      id completionHandler = (void (**)(id, void))self->_completionHandler;
      if (completionHandler) {
        completionHandler[2](completionHandler, 0);
      }
      [(SFDeviceSetupServiceiOS *)self _cleanup];
      self->_invalidateDone = 1;
      if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_completed:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = v3;
    LogPrintF();
  }
  id completionHandler = (void (**)(id, void *))self->_completionHandler;
  if (completionHandler)
  {
    if (v3)
    {
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F28760];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      uint64_t v8 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v9 = (void *)v8;
      v10 = @"?";
      if (v8) {
        v10 = (__CFString *)v8;
      }
      v20[0] = v10;
      v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, v16);
      v12 = [v6 errorWithDomain:v7 code:(int)v3 userInfo:v11];
      completionHandler[2](completionHandler, v12);
    }
    else
    {
      completionHandler[2](self->_completionHandler, 0);
    }
    id v13 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  v14 = objc_msgSend(NSNumber, "numberWithInt:", v3, v16, @"_cat", @"_op", @"error", @"iOSSetup", @"Done");
  v18[2] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:3];
  SFDashboardLogJSON(v15);

  [(SFDeviceSetupServiceiOS *)self _cleanup];
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v3 = [(SFDeviceSetupServiceiOS *)self _runResumeIfNeeded];
  if (v3 == 4 || v3 == 2)
  {
    if (self->_sfService)
    {
      if (!self->_sfServiceActivated
        && gLogCategory_SFDeviceSetupServiceiOSCore <= 30
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      [(SFDeviceSetupServiceiOS *)self _sfServiceStart];
    }
  }
}

- (int)_runResumeIfNeeded
{
  int result = self->_resumeState;
  if (!result)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F5E128]);
    [v4 setAccessGroup:@"com.apple.Sharing"];
    [v4 setAccessibleType:7];
    [v4 setIdentifier:@"SetupResumeKey"];
    [v4 setSyncType:1];
    [v4 setType:@"SetupResumeKey"];
    id v5 = objc_alloc_init(MEMORY[0x1E4F5E130]);
    id v18 = 0;
    v6 = (void *)[v5 copyItemMatchingItem:v4 flags:1 error:&v18];
    id v7 = v18;
    uint64_t v8 = v7;
    if (v6)
    {
      id v17 = v7;
      char v9 = [v5 removeItemMatchingItem:v6 error:&v17];
      id v10 = v17;

      if ((v9 & 1) == 0
        && gLogCategory_SFDeviceSetupServiceiOSCore <= 90
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        id v16 = v10;
        LogPrintF();
      }
      v12 = objc_msgSend(v6, "secrets", v16);
      id v13 = CFDictionaryGetCFDataOfLength();

      if (v13)
      {
        v14 = [v6 secrets];
        CFStringGetTypeID();
        v15 = CFDictionaryGetTypedValue();

        if (v15)
        {
          objc_storeStrong((id *)&self->_resumeAuthTag, v13);
          objc_storeStrong((id *)&self->_resumePassword, v15);
          self->_resumeState = 4;
          if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
            && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          int v11 = 0;
        }
        else
        {
          if (gLogCategory_SFDeviceSetupServiceiOSCore <= 90
            && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          self->_resumeState = 2;
          int v11 = 1;
        }
      }
      else
      {
        if (gLogCategory_SFDeviceSetupServiceiOSCore <= 90
          && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_resumeState = 2;
        int v11 = 1;
      }

      uint64_t v8 = v10;
    }
    else
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_resumeState = 2;
      int v11 = 1;
    }

    if (v11) {
      return 2;
    }
    else {
      return self->_resumeState;
    }
  }
  return result;
}

- (void)_sfServiceStart
{
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFService *)self->_sfService invalidate];
  int v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  if (self->_advertiseFast) {
    [(SFService *)self->_sfService setAdvertiseRate:50];
  }
  [(SFService *)self->_sfService setDispatchQueue:self->_dispatchQueue];
  [(SFService *)self->_sfService setIdentifier:@"com.apple.sharing.iOSSetup"];
  [(SFService *)self->_sfService setNeedsSetup:1];
  [(SFService *)self->_sfService setDeviceActionType:9];
  [(SFService *)self->_sfService setSessionFlags:1];
  if (self->_resumeAuthTag)
  {
    -[SFService setAuthTagOverride:](self->_sfService, "setAuthTagOverride:");
    [(SFService *)self->_sfService setSessionFlags:[(SFService *)self->_sfService sessionFlags] | 0x80];
  }
  [(SFService *)self->_sfService setInterruptionHandler:&__block_literal_global_50];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_2;
  v13[3] = &unk_1E5BBC870;
  v13[4] = self;
  [(SFService *)self->_sfService setInvalidationHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_3;
  v12[3] = &unk_1E5BBC8E8;
  v12[4] = self;
  [(SFService *)self->_sfService setPairSetupCompletionHandler:v12];
  [(SFService *)self->_sfService setPeerDisconnectedHandler:&__block_literal_global_182_0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_5;
  v11[3] = &unk_1E5BC0888;
  v11[4] = self;
  [(SFService *)self->_sfService setShowPINHandlerEx:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_6;
  v10[3] = &unk_1E5BC08B0;
  v10[4] = self;
  [(SFService *)self->_sfService setReceivedObjectHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_7;
  v9[3] = &unk_1E5BBE028;
  v9[4] = self;
  [(SFService *)self->_sfService setSessionStartedHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_8;
  v8[3] = &unk_1E5BBE050;
  v8[4] = self;
  [(SFService *)self->_sfService setSessionEndedHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_9;
  v7[3] = &unk_1E5BBE028;
  v7[4] = self;
  [(SFService *)self->_sfService setSessionSecuredHandler:v7];
  id v5 = self->_sfService;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_10;
  v6[3] = &unk_1E5BBC8E8;
  v6[4] = self;
  [(SFService *)v5 activateWithCompletion:v6];
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke()
{
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    id v7 = v3;
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
      {
        LogPrintF();
        id v4 = v7;
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 136);
    if (v6)
    {
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
      id v4 = v7;
    }
  }
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (v6 = _LogCategory_Initialize(), id v5 = v10, v6))
    {
      IsAppleInternalBuild();
      LogPrintF();
      id v5 = v10;
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 120);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v10);
  }
  else
  {
    uint64_t v9 = *(void *)(v7 + 128);
    if (!v9) {
      goto LABEL_10;
    }
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }
  id v5 = v10;
LABEL_10:
}

uint64_t __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _receivedObject:a4 flags:a3];
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_7(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = [v8 peer];
    LogPrintF();
  }
  id v3 = *(void **)(a1 + 32);
  if (!v3[2])
  {
    uint64_t v4 = [v8 peer];
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    id v3 = *(void **)(a1 + 32);
  }
  objc_msgSend(v3, "_handleSessionStarted:", v8, v7);
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v12 peer];
    id v11 = v5;
    LogPrintF();
  }
  int v6 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v7 = objc_msgSend(v12, "peer", v10, v11);
  LODWORD(v6) = [v6 isEqual:v7];

  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = 0;
  }
  [*(id *)(a1 + 32) _handleSessionEnded:v12];
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = [v3 peer];
      LogPrintF();

      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleSessionSecured:", v3, v5);
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 90
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(a1 + 32) _completed:NSErrorToOSStatus()];
  }
  else
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
    [*(id *)(a1 + 32) _run];
  }
}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    id v13 = &unk_1A56EB1CC;
    uint64_t v14 = [v6 count];
    uint64_t v12 = v4;
    LogPrintF();
  }
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged <= 4)
  {
    if (Int64Ranged != 1)
    {
      if (Int64Ranged == 3)
      {
        if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
          && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        id receivedObjectHandler = (void (**)(id, id))self->_receivedObjectHandler;
        if (receivedObjectHandler) {
          receivedObjectHandler[2](receivedObjectHandler, v6);
        }
        id progressHandlerEx = (void (**)(id, uint64_t, id))self->_progressHandlerEx;
        if (progressHandlerEx) {
          progressHandlerEx[2](progressHandlerEx, 40, v6);
        }
        -[SFService sendToPeer:flags:object:](self->_sfService, "sendToPeer:flags:object:", self->_peer, v4, &unk_1EFA09BE8, v12, v13, v14);
        goto LABEL_30;
      }
      goto LABEL_21;
    }
    if (v4)
    {
      [(SFDeviceSetupServiceiOS *)self _handleConfigRequestReceived:v6];
      if (CFDictionaryGetInt64())
      {
        uint64_t v8 = (void (**)(id, uint64_t, void))self->_progressHandlerEx;
        if (v8) {
          v8[2](v8, 96, 0);
        }
      }
      goto LABEL_30;
    }
    if (gLogCategory_SFDeviceSetupServiceiOSCore > 50
      || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
LABEL_23:
    LogPrintF();
    goto LABEL_30;
  }
  if (Int64Ranged != 5)
  {
    if (Int64Ranged == 12)
    {
      [(SFDeviceSetupServiceiOS *)self _handleAppEventReceived:v6];
      goto LABEL_30;
    }
LABEL_21:
    if (gLogCategory_SFDeviceSetupServiceiOSCore > 50
      || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
    goto LABEL_23;
  }
  if ((v4 & 1) == 0)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore > 50
      || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
    goto LABEL_23;
  }
  uint64_t v9 = (void (**)(id, id))self->_receivedObjectHandler;
  if (v9) {
    v9[2](v9, v6);
  }
LABEL_30:
}

- (void)sendObject:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_sfService)
  {
    if (self->_peer)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
      {
        if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (v5 = _LogCategory_Initialize(), id v4 = v10, v5))
        {
          uint64_t v9 = [v4 count];
          LogPrintF();
          id v4 = v10;
        }
      }
      id v6 = objc_msgSend(v4, "mutableCopy", v9);
      [v6 setObject:&unk_1EFA096C8 forKeyedSubscript:@"op"];
      [(SFService *)self->_sfService sendToPeer:self->_peer flags:1 object:v6];

      goto LABEL_8;
    }
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (v8 = _LogCategory_Initialize(), id v4 = v10, v8))
      {
LABEL_17:
        LogPrintF();
LABEL_8:
        id v4 = v10;
      }
    }
  }
  else if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore != -1) {
      goto LABEL_17;
    }
    int v7 = _LogCategory_Initialize();
    id v4 = v10;
    if (v7) {
      goto LABEL_17;
    }
  }
}

- (void)sendSetupAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v15 = a4;
  id v8 = a5;
  uint64_t v9 = (void (**)(void, void, void, void))v8;
  if (self->_sfSession)
  {
    id v10 = _Block_copy(v8);
    if (v10) {
      id v11 = v10;
    }
    else {
      id v11 = &__block_literal_global_220_0;
    }
    if (v15) {
      id v12 = (id)[v15 mutableCopy];
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v13 = v12;
    uint64_t v14 = [NSNumber numberWithUnsignedInt:v6];
    [v13 setObject:v14 forKeyedSubscript:@"sa"];

    [(SFSession *)self->_sfSession sendRequestID:@"_sa" options:&unk_1EFA09C10 request:v13 responseHandler:v11];
  }
  else
  {
    if (!v8) {
      goto LABEL_12;
    }
    id v11 = NSErrorWithOSStatusF();
    ((void (**)(void, void *, void, void))v9)[2](v9, v11, 0, 0);
  }

LABEL_12:
}

- (void)_handleSessionStarted:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      int v7 = [v5 peer];
      id v16 = [(SFSession *)*p_sfSession peer];
      LogPrintF();
    }
    goto LABEL_36;
  }
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = [v5 peer];
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_sfSession, a3);
  resumePassword = (__CFString *)self->_resumePassword;
  if (resumePassword)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore != -1
        || (int v9 = _LogCategory_Initialize(), resumePassword = (__CFString *)self->_resumePassword, v9))
      {
        uint64_t v15 = (uint64_t)resumePassword;
        LogPrintF();
        resumePassword = (__CFString *)self->_resumePassword;
      }
    }
    id v10 = *p_sfSession;
  }
  else
  {
    if ([(SFSession *)*p_sfSession sharingSourceVersion] < 0x89A260)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        uint64_t v15 = [(SFSession *)*p_sfSession sharingSourceVersion];
        LogPrintF();
      }
      goto LABEL_27;
    }
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v10 = *p_sfSession;
    resumePassword = @"public";
  }
  -[SFSession setFixedPIN:](v10, "setFixedPIN:", resumePassword, v15);
LABEL_27:
  id v11 = objc_msgSend(v5, "messageSessionTemplate", v15);
  if (v11)
  {
    sfSession = self->_sfSession;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__SFDeviceSetupServiceiOS__handleSessionStarted___block_invoke;
    v17[3] = &unk_1E5BBCBA8;
    v17[4] = self;
    [(SFSession *)sfSession registerRequestID:@"_sa" options:&unk_1EFA09C38 handler:v17];
    id progressHandlerEx = (void (**)(id, uint64_t, void *))self->_progressHandlerEx;
    if (progressHandlerEx)
    {
      id v18 = @"mst";
      v19[0] = v11;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      progressHandlerEx[2](progressHandlerEx, 31, v14);
    }
    [(SFService *)self->_sfService setNeedsSetup:0];
  }
  else if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60 {
         && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }

LABEL_36:
}

uint64_t __49__SFDeviceSetupServiceiOS__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSetupActionRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  sfSession = (SFSession *)a3;
  if (self->_sfSession == sfSession)
  {
    id v11 = sfSession;
    if (sfSession && gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore != -1)
      {
LABEL_5:
        id v10 = [(SFSession *)sfSession peer];
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
    id v5 = _Block_copy(self->_progressHandlerEx);
    uint64_t v6 = (void (**)(void, void, void))v5;
    if (self->_suspendPending)
    {
      self->_suspendPending = 0;
      if (v5)
      {
        (*((void (**)(void *, uint64_t, void))v5 + 2))(v5, 98, 0);
LABEL_11:
        v6[2](v6, 32, 0);
      }
    }
    else if (v5)
    {
      goto LABEL_11;
    }
    resumeAuthTag = self->_resumeAuthTag;
    self->_resumeAuthTag = 0;

    resumePassword = self->_resumePassword;
    self->_resumePassword = 0;

    int v9 = self->_sfSession;
    self->_sfSession = 0;

    [(SFService *)self->_sfService setAuthTagOverride:0];
    [(SFService *)self->_sfService setNeedsSetup:1];

    sfSession = v11;
  }
}

- (void)_handleSessionSecured:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SFSession *)self->_sfSession fixedPIN];

  if (v5)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFSession *)self->_sfSession setFixedPIN:0];
  }
  else
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_progressHandlerEx)
    {
      uint64_t v6 = [v4 messageSessionTemplate];
      int v7 = (void *)v6;
      if (v6)
      {
        id progressHandlerEx = (void (**)(id, uint64_t, void *))self->_progressHandlerEx;
        id v10 = @"mst";
        v11[0] = v6;
        int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
        progressHandlerEx[2](progressHandlerEx, 33, v9);
      }
      else if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60 {
             && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
    }
  }
}

- (void)_handleConfigRequestReceived:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v14 = objc_alloc_init(v4);
  fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
  if (!fileTransferSessionTemplate)
  {
    int v7 = (RPFileTransferSession *)objc_alloc_init(MEMORY[0x1E4F94710]);
    id v8 = self->_fileTransferSessionTemplate;
    self->_fileTransferSessionTemplate = v7;

    [(RPFileTransferSession *)self->_fileTransferSessionTemplate setFlags:291];
    [(RPFileTransferSession *)self->_fileTransferSessionTemplate prepareTemplateAndReturnError:0];
  }
  CFDataGetTypeID();
  int v9 = CFDictionaryGetTypedValue();

  if (v9) {
    [(RPFileTransferSession *)self->_fileTransferSessionTemplate setPeerPublicKey:v9];
  }

  id v10 = [(RPFileTransferSession *)self->_fileTransferSessionTemplate selfPublicKey];
  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"ftPK"];
  }

  id v11 = [(RPFileTransferSession *)self->_fileTransferSessionTemplate targetID];
  if (v11) {
    [v14 setObject:v11 forKeyedSubscript:@"ftTID"];
  }

  if (!fileTransferSessionTemplate)
  {
    id v12 = _Block_copy(self->_progressHandlerEx);
    id v13 = v12;
    if (v12) {
      (*((void (**)(void *, uint64_t, void))v12 + 2))(v12, 420, 0);
    }
  }
  [(SFDeviceSetupServiceiOS *)self sendObject:v14];
}

- (void)_handleAppEventReceived:(id)a3
{
  id v6 = a3;
  CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id receivedObjectHandler = (void (**)(id, id))self->_receivedObjectHandler;
  id v5 = v6;
  if (receivedObjectHandler)
  {
    receivedObjectHandler[2](receivedObjectHandler, v6);
    id v5 = v6;
  }
}

- (void)_handleSetupActionRequest:(id)a3 responseHandler:(id)a4
{
  id v14 = (char *)a3;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 0xA) {
      id v10 = "?";
    }
    else {
      id v10 = off_1E5BC08D0[(int)Int64Ranged];
    }
    uint64_t v12 = (uint64_t)v10;
    id v13 = v14;
    LogPrintF();
  }
  if (Int64Ranged == 7)
  {
    [(SFDeviceSetupServiceiOS *)self _handleSetupActionResume];
  }
  else if (Int64Ranged == 6)
  {
    [(SFDeviceSetupServiceiOS *)self _handleSetupActionSuspend];
  }
  else
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      if (Int64Ranged > 0xA) {
        id v11 = "?";
      }
      else {
        id v11 = off_1E5BC0928[(int)Int64Ranged];
      }
      uint64_t v12 = Int64Ranged;
      id v13 = v11;
      LogPrintF();
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1EFA096E0, @"er", v12, v13);
  }
  (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v8);
}

- (void)_handleSetupActionSuspend
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"ResumeAuthTag" keyLength:3];
  id v4 = [(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"ResumePassword" keyLength:8];
  id v5 = v4;
  if (v4)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    char v17 = 0;
    id v6 = v4;
    [v6 bytes];
    [v6 length];
    DataToHexCStringEx();
    id v7 = [NSString stringWithUTF8String:&v15];
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    char v17 = 0;
    id v8 = objc_alloc_init(MEMORY[0x1E4F5E128]);
    [v8 setAccessGroup:@"com.apple.Sharing"];
    [v8 setAccessibleType:7];
    [v8 setIdentifier:@"SetupResumeKey"];
    [v8 setInvisible:1];
    v13[0] = @"ResumeAuthTag";
    v13[1] = @"ResumePassword";
    v14[0] = v3;
    v14[1] = v7;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v8 setSecrets:v9];

    [v8 setSyncType:1];
    [v8 setType:@"SetupResumeKey"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F5E130]);
    id v12 = 0;
    [v10 addOrUpdateOrReAddItem:v8 logCategory:&gLogCategory_SFDeviceSetupServiceiOSCore logLabel:@"ResumeKey" error:&v12];
    id v11 = v12;
    if (v11)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore > 90
        || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_12;
      }
    }
    else if (gLogCategory_SFDeviceSetupServiceiOSCore > 30 {
           || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_12;
    }
    LogPrintF();
LABEL_12:
    self->_suspendPending = 1;

    goto LABEL_13;
  }
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 90
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_13:
}

- (void)_handleSetupActionResume
{
  uint64_t v2 = _Block_copy(self->_progressHandlerEx);
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, uint64_t, void))v2 + 2))(v2, 97, 0);
    uint64_t v2 = v3;
  }
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

- (RPFileTransferSession)fileTransferSessionTemplate
{
  return self->_fileTransferSessionTemplate;
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (void)setShowPINHandlerEx:(id)a3
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

- (id)progressHandlerEx
{
  return self->_progressHandlerEx;
}

- (void)setProgressHandlerEx:(id)a3
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
  objc_storeStrong(&self->_progressHandlerEx, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong((id *)&self->_resumePassword, 0);
  objc_storeStrong((id *)&self->_resumeAuthTag, 0);
  objc_storeStrong((id *)&self->_preventExitForLocaleClient, 0);

  objc_storeStrong((id *)&self->_peer, 0);
}

@end