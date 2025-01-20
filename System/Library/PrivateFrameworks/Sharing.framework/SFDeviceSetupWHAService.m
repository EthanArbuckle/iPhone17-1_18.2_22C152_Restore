@interface SFDeviceSetupWHAService
- (BOOL)needsCDPRepair;
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceSetupWHAService)init;
- (id)progressHandler;
- (void)_cleanup;
- (void)_handleInfoExchange:(id)a3 responseHandler:(id)a4;
- (void)_handleRequest:(id)a3 flags:(unsigned int)a4 session:(id)a5 responseHandler:(id)a6;
- (void)_handleSessionEnded:(id)a3;
- (void)_handleSessionStarted:(id)a3;
- (void)_sfServiceStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setNeedsCDPRepair:(BOOL)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation SFDeviceSetupWHAService

- (SFDeviceSetupWHAService)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupWHAService;
  v2 = [(SFDeviceSetupWHAService *)&v7 init];
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
    v3 = (SFDeviceSetupWHAService *)FatalErrorF();
    [(SFDeviceSetupWHAService *)v3 _cleanup];
  }
  else
  {
    [(SFDeviceSetupWHAService *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupWHAService;
    [(SFDeviceSetupWHAService *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  id progressHandler = self->_progressHandler;
  self->_id progressHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFDeviceSetupWHAService_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceSetupWHAService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = CFPrefs_GetInt64() != 0;
  return [*(id *)(a1 + 32) _sfServiceStart];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceSetupWHAService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceSetupWHAService_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9)
    && gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 24))
  {
    objc_msgSend((id)v2, "_handleSessionEnded:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 16) invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  SEL v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  objc_super v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[7];
  if (v6)
  {
    (*(void (**)(void, uint64_t, void))(v6 + 16))(v5[7], 20, 0);
    objc_super v5 = *(void **)(a1 + 32);
  }

  return [v5 _cleanup];
}

- (void)_sfServiceStart
{
  if (gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFService *)self->_sfService invalidate];
  uint64_t v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  [(SFService *)self->_sfService setDeviceActionType:13];
  [(SFService *)self->_sfService setDispatchQueue:self->_dispatchQueue];
  [(SFService *)self->_sfService setIdentifier:@"com.apple.sharing.WHASetup"];
  [(SFService *)self->_sfService setLabel:@"WHASetup"];
  [(SFService *)self->_sfService setNeedsSetup:1];
  [(SFService *)self->_sfService setPairSetupACL:&unk_1EFA09E18];
  [(SFService *)self->_sfService setPinType:1];
  [(SFService *)self->_sfService setSessionFlags:1];
  [(SFService *)self->_sfService setTouchRemoteEnabled:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke;
  v9[3] = &unk_1E5BBE028;
  v9[4] = self;
  [(SFService *)self->_sfService setSessionStartedHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_2;
  v8[3] = &unk_1E5BBE050;
  v8[4] = self;
  [(SFService *)self->_sfService setSessionEndedHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_3;
  v7[3] = &unk_1E5BBE000;
  v7[4] = self;
  [(SFService *)self->_sfService setReceivedRequestHandler:v7];
  objc_super v5 = self->_sfService;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_4;
  v6[3] = &unk_1E5BBC8E8;
  v6[4] = self;
  [(SFService *)v5 activateWithCompletion:v6];
}

uint64_t __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionStarted:a2];
}

uint64_t __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionEnded:a2];
}

uint64_t __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _handleRequest:a4 flags:a3 session:a2 responseHandler:a5];
}

void __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_4(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  SEL v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v3)
  {
    if (v5)
    {
      objc_super v7 = @"eo";
      v8[0] = v3;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
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
  id v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession)
  {
    if (gLogCategory_SFDeviceSetupWHAService <= 60
      && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
    {
      objc_super v7 = [v5 peer];
      v14 = [(SFSession *)*p_sfSession peer];
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupWHAService <= 30
      && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
    {
      v13 = [v5 peer];
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_sfSession, a3);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__SFDeviceSetupWHAService__handleSessionStarted___block_invoke;
    v15[3] = &unk_1E5BBCBA8;
    v15[4] = self;
    [v5 registerRequestID:@"_info" options:0 handler:v15];
    if (self->_prefCDPEnabled)
    {
      v8 = objc_alloc_init(SFDeviceOperationHandlerCDPSetup);
      cdpSetupHandler = self->_cdpSetupHandler;
      self->_cdpSetupHandler = v8;

      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setSfSession:v5];
      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler activate];
    }
    id v10 = objc_alloc_init((Class)getHMDeviceSetupOperationHandlerClass_2[0]());
    objc_setAssociatedObject(v5, "hmDeviceSetup", v10, (void *)0x301);
    v11 = [v5 trSession];
    [v10 registerMessageHandlersForSession:v11];

    id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 31, 0);
    }
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0, v13);
  }
}

uint64_t __49__SFDeviceSetupWHAService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInfoExchange:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  sfSession = (SFSession *)a3;
  if (self->_sfSession != sfSession) {
    goto LABEL_14;
  }
  object = sfSession;
  if (sfSession && gLogCategory_SFDeviceSetupWHAService <= 30)
  {
    if (gLogCategory_SFDeviceSetupWHAService == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_7;
      }
      sfSession = self->_sfSession;
    }
    id v10 = [(SFSession *)sfSession peer];
    LogPrintF();
  }
LABEL_7:
  [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler invalidate];
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  objc_setAssociatedObject(object, "hmDeviceSetup", 0, (void *)0x301);
  uint64_t v6 = objc_getAssociatedObject(object, "finished");
  if (v6)
  {
    id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 100, 0);
    }
    objc_setAssociatedObject(object, "finished", 0, (void *)0x301);
  }
  v8 = self->_sfSession;
  self->_sfSession = 0;

  [(SFService *)self->_sfService setNeedsSetup:1];
  v9 = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (v9) {
    v9[2](v9, 32, 0);
  }

  sfSession = object;
LABEL_14:
}

- (void)_handleInfoExchange:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    id v19 = v6;
    LogPrintF();
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  SFMyAltDSID();
  id v9 = objc_claimAutoreleasedReturnValue();
  id v10 = (const char *)[v9 UTF8String];

  if (v10)
  {
    v11 = [(SFSession *)self->_sfSession pairingDeriveKeyForIdentifier:@"AltDSID" keyLength:16];
    v12 = v11;
    if (v11)
    {
      [v11 bytes];
      strlen(v10);
      v13 = [NSNumber numberWithUnsignedLongLong:SipHash()];
      [v8 setObject:v13 forKeyedSubscript:@"adh"];
    }
  }
  if (self->_needsCDPRepair) {
    uint64_t v14 = (16 * self->_prefCDPEnabled) | 0x200;
  }
  else {
    uint64_t v14 = 16 * self->_prefCDPEnabled;
  }
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v14, v19);
  [v8 setObject:v15 forKeyedSubscript:@"ff"];

  if (self->_prefCDPEnabled)
  {
    id v16 = objc_alloc_init((Class)getCDPStateControllerClass_1[0]());
    uint64_t v20 = 0;
    if ([v16 isManateeAvailable:&v20]) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = 0x20000;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  v18 = [NSNumber numberWithUnsignedLongLong:v17];
  [v8 setObject:v18 forKeyedSubscript:@"dpf"];

  if (gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v8);
}

- (void)_handleRequest:(id)a3 flags:(unsigned int)a4 session:(id)a5 responseHandler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 9)
  {
    if (v7)
    {
      if (gLogCategory_SFDeviceSetupWHAService <= 30
        && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, uint64_t, void, void))v10 + 2))(v10, v7, 0, MEMORY[0x1E4F1CC08]);
      objc_setAssociatedObject(v9, "finished", MEMORY[0x1E4F1CC38], (void *)0x301);
      id progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
      if (progressHandler) {
        progressHandler[2](progressHandler, 96, 0);
      }
      goto LABEL_17;
    }
    int v12 = -6768;
    if (gLogCategory_SFDeviceSetupWHAService <= 60)
    {
      if (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      int v12 = -6768;
    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupWHAService <= 60
      && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
    {
      uint64_t v22 = Int64Ranged;
      uint64_t v23 = 0;
      LogPrintF();
    }
    int v12 = -6732;
  }
  v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28760];
  uint64_t v15 = v12;
  uint64_t v24 = *MEMORY[0x1E4F28568];
  uint64_t v16 = [NSString stringWithUTF8String:DebugGetErrorString()];
  uint64_t v17 = (void *)v16;
  v18 = @"?";
  if (v16) {
    v18 = (__CFString *)v16;
  }
  v25[0] = v18;
  id v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1, v22, v23);
  uint64_t v20 = [v13 errorWithDomain:v14 code:v15 userInfo:v19];
  (*((void (**)(id, uint64_t, void *, void))v10 + 2))(v10, v7, v20, 0);

LABEL_17:
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)needsCDPRepair
{
  return self->_needsCDPRepair;
}

- (void)setNeedsCDPRepair:(BOOL)a3
{
  self->_needsCDPRepair = a3;
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
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);

  objc_storeStrong((id *)&self->_sfService, 0);
}

@end