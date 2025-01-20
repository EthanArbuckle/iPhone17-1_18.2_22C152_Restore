@interface SFDeviceOperationCDPSetup
- (BOOL)isRepair;
- (BOOL)skipEscrowFetches;
- (BOOL)skipSetupRequest;
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceOperationCDPSetup)init;
- (SFSession)sfSession;
- (double)metricSeconds;
- (id)completionHandler;
- (id)presentingViewController;
- (int)_runCDPApprovalServerStart;
- (int)_runCDPSetupRequest;
- (void)_activate;
- (void)_complete:(id)a3;
- (void)_run;
- (void)activate;
- (void)invalidate;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIsRepair:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSfSession:(id)a3;
- (void)setSkipEscrowFetches:(BOOL)a3;
- (void)setSkipSetupRequest:(BOOL)a3;
- (void)uiController:(id)a3 didPresentRootViewController:(id)a4;
@end

@implementation SFDeviceOperationCDPSetup

- (SFDeviceOperationCDPSetup)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDeviceOperationCDPSetup;
  v2 = [(SFDeviceOperationCDPSetup *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceOperationCDPSetup_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceOperationCDPSetup_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_startTicks = mach_absolute_time();
  if (self->_sfSession)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v3;

    v5 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __38__SFDeviceOperationCDPSetup__activate__block_invoke;
    handler[3] = &unk_1E5BBC870;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    SFDispatchTimerSet(self->_timeoutTimer, 180.0, -1.0, -10.0);
    dispatch_activate((dispatch_object_t)self->_timeoutTimer);
    [(SFDeviceOperationCDPSetup *)self _run];
  }
  else
  {
    NSErrorWithOSStatusF();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(SFDeviceOperationCDPSetup *)self _complete:v6];
  }
}

void __38__SFDeviceOperationCDPSetup__activate__block_invoke(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (!v1[36])
  {
    NSErrorWithOSStatusF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v1 _complete:v2];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFDeviceOperationCDPSetup_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __39__SFDeviceOperationCDPSetup_invalidate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 36) = 1;
  v1 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _complete:v2];
}

- (void)_complete:(id)a3
{
  id v13 = a3;
  uint64_t v4 = (void (**)(void *, id))_Block_copy(self->_completionHandler);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  if (v4)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_double metricSeconds = metricSeconds;
    if (!v13)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup > 30) {
        goto LABEL_13;
      }
      if (gLogCategory_SFDeviceOperationCDPSetup == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_13;
        }
        double metricSeconds = self->_metricSeconds;
      }
      double v12 = metricSeconds;
      goto LABEL_9;
    }
    if (gLogCategory_SFDeviceOperationCDPSetup <= 60
      && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
    {
      double v12 = *(double *)&v13;
LABEL_9:
      LogPrintF();
    }
  }
LABEL_13:
  [(CDPStateController *)self->_cdpController invalidate];
  cdpController = self->_cdpController;
  self->_cdpController = 0;

  cdpContext = self->_cdpContext;
  self->_cdpContext = 0;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  if (v4) {
    v4[2](v4, v13);
  }
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    if (self->_completionHandler)
    {
      int v3 = [(SFDeviceOperationCDPSetup *)self _runCDPApprovalServerStart];
      if (v3 == 4 || v3 == 2)
      {
        if (self->_skipSetupRequest
          || (int v4 = [(SFDeviceOperationCDPSetup *)self _runCDPSetupRequest], v4 == 4)
          || v4 == 2)
        {
          [(SFDeviceOperationCDPSetup *)self _complete:0];
        }
      }
    }
  }
}

- (int)_runCDPApprovalServerStart
{
  int cdpApprovalServerState = self->_cdpApprovalServerState;
  if (cdpApprovalServerState != 4 && cdpApprovalServerState != 2)
  {
    if (cdpApprovalServerState)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int cdpApprovalServerState = 1;
      uint64_t v5 = [(SFSession *)self->_sfSession messageSessionTemplate];
      if (v5)
      {
        id v6 = (void *)v5;
        objc_super v7 = [(Class)getACAccountStoreClass_2[0]() defaultStore];
        v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
        v9 = (CDPContext *)objc_alloc_init((Class)getCDPContextClass[0]());
        cdpContext = self->_cdpContext;
        self->_cdpContext = v9;

        v11 = [v8 username];
        [(CDPContext *)self->_cdpContext setAppleID:v11];

        double v12 = NSNumber;
        id v13 = objc_msgSend(v8, "aa_personID");
        v14 = objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(v13, "longLongValue"));
        [(CDPContext *)self->_cdpContext setDsid:v14];

        [(CDPContext *)self->_cdpContext setSharingChannel:v6];
        [(CDPContext *)self->_cdpContext set_skipEscrowFetches:self->_skipEscrowFetches];
        v15 = (CDPStateController *)[objc_alloc((Class)getCDPStateControllerClass[0]()) initWithContext:self->_cdpContext];
        cdpController = self->_cdpController;
        self->_cdpController = v15;

        id v17 = self->_presentingViewController;
        if (v17)
        {
          v18 = (void *)[objc_alloc((Class)getCDPUIControllerClass[0]()) initWithPresentingViewController:v17];
          [v18 setDelegate:self];
          [v18 setForceInlinePresentation:1];
          [(CDPStateController *)self->_cdpController setUiProvider:v18];
        }
        v19 = self->_cdpController;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __55__SFDeviceOperationCDPSetup__runCDPApprovalServerStart__block_invoke;
        v21[3] = &unk_1E5BBD7E8;
        v21[4] = self;
        [(CDPStateController *)v19 startCircleApplicationApprovalServer:v21];
      }
      else
      {
        self->_int cdpApprovalServerState = 3;
        id v6 = NSErrorWithOSStatusF();
        [(SFDeviceOperationCDPSetup *)self _complete:v6];
      }
    }
  }
  return self->_cdpApprovalServerState;
}

void __55__SFDeviceOperationCDPSetup__runCDPApprovalServerStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  objc_super v7 = *(NSObject **)(v6 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SFDeviceOperationCDPSetup__runCDPApprovalServerStart__block_invoke_2;
  block[3] = &unk_1E5BC0128;
  char v11 = a2;
  block[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __55__SFDeviceOperationCDPSetup__runCDPApprovalServerStart__block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 36))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFDeviceOperationCDPSetup <= 30
      && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(v1 + 32) + 8) = 4;
    id v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (int)_runCDPSetupRequest
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int cdpSetupRequestState = self->_cdpSetupRequestState;
  if (cdpSetupRequestState != 4 && cdpSetupRequestState != 2)
  {
    if (cdpSetupRequestState)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v10 = @"cdpRepair";
      id v5 = [NSNumber numberWithBool:self->_isRepair];
      v11[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

      sfSession = self->_sfSession;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __48__SFDeviceOperationCDPSetup__runCDPSetupRequest__block_invoke;
      v9[3] = &unk_1E5BBCBF8;
      v9[4] = self;
      [(SFSession *)sfSession sendRequestID:@"_cdpSetup" options:0 request:v6 responseHandler:v9];
    }
  }
  return self->_cdpSetupRequestState;
}

void __48__SFDeviceOperationCDPSetup__runCDPSetupRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 36))
  {
    id v9 = v12;
    if (v12)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 90)
      {
        if (gLogCategory_SFDeviceOperationCDPSetup != -1 || (int v10 = _LogCategory_Initialize(), v9 = v12, v10))
        {
          id v11 = v9;
          LogPrintF();
          id v9 = v12;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_complete:", v9, v11);
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        id v11 = 0;
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 32) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v11);
    }
  }
}

- (void)uiController:(id)a3 didPresentRootViewController:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
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

- (double)metricSeconds
{
  return self->_metricSeconds;
}

- (id)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (BOOL)skipSetupRequest
{
  return self->_skipSetupRequest;
}

- (void)setSkipSetupRequest:(BOOL)a3
{
  self->_skipSetupRequest = a3;
}

- (BOOL)skipEscrowFetches
{
  return self->_skipEscrowFetches;
}

- (void)setSkipEscrowFetches:(BOOL)a3
{
  self->_skipEscrowFetches = a3;
}

- (BOOL)isRepair
{
  return self->_isRepair;
}

- (void)setIsRepair:(BOOL)a3
{
  self->_isRepair = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong(&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_cdpController, 0);

  objc_storeStrong((id *)&self->_cdpContext, 0);
}

@end