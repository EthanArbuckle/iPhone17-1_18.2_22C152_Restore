@interface SFPasswordSharingService
+ (unsigned)passwordSharingAvailability;
- (BOOL)__activateCalled;
- (BOOL)__invalidateCalled;
- (BOOL)disabledViaConfig;
- (NSString)networkName;
- (OS_dispatch_queue)dispatchQueue;
- (SFPasswordSharingService)init;
- (SFPasswordSharingServiceDelegate)delegate;
- (id)messageForDisplayName:(id)a3 deviceName:(id)a4 info:(id)a5;
- (int)_runServiceStart;
- (void)__testReceivedObject:(id)a3 withFlags:(unsigned int)a4;
- (void)_cleanup;
- (void)_handleReceivedPassword:(id)a3;
- (void)_handleSessionStarted:(id)a3;
- (void)_handleUserNotificationResponse:(int)a3;
- (void)_passInfoToDelegate:(id)a3;
- (void)_promptUserWithInfo:(id)a3 message:(id)a4;
- (void)_receivedObject:(id)a3 flags:(unsigned int)a4;
- (void)_run;
- (void)_sendPasswordDeclinedWithError:(int)a3;
- (void)_sendPasswordReceived;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNetworkName:(id)a3;
@end

@implementation SFPasswordSharingService

+ (unsigned)passwordSharingAvailability
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.Sharing.wpsClientQueue", 0);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v4 = objc_alloc_init(SFClient);
  [(SFClient *)v4 setDispatchQueue:v2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SFPasswordSharingService_passwordSharingAvailability__block_invoke;
  v9[3] = &unk_1E5BC1090;
  v11 = &v17;
  v12 = &v13;
  v5 = v3;
  v10 = v5;
  [(SFClient *)v4 wifiPasswordSharingAvailabilityWithCompletion:v9];
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v5, v6);
  [(SFClient *)v4 invalidate];
  if (*((unsigned char *)v14 + 24))
  {
    if (gLogCategory_SFPasswordSharingService <= 60
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    unsigned int v7 = 1;
    *((_DWORD *)v18 + 6) = 1;
  }
  else
  {
    unsigned int v7 = *((_DWORD *)v18 + 6);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __55__SFPasswordSharingService_passwordSharingAvailability__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  id v6 = v5;
  if (v5
    && gLogCategory_SFPasswordSharingService <= 60
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (SFPasswordSharingService)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFPasswordSharingService;
  dispatch_queue_t v2 = [(SFPasswordSharingService *)&v7 init];
  dispatch_semaphore_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_shareTime = -1.0;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    dispatch_semaphore_t v3 = (SFPasswordSharingService *)FatalErrorF();
    [(SFPasswordSharingService *)v3 _cleanup];
  }
  else
  {
    [(SFPasswordSharingService *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFPasswordSharingService;
    [(SFPasswordSharingService *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  promptedInfo = self->_promptedInfo;
  self->_promptedInfo = 0;

  self->_serviceState = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SFPasswordSharingService_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__SFPasswordSharingService_activate__block_invoke(uint64_t a1)
{
  uint64_t Int64 = CFPrefs_GetInt64();
  uint64_t result = [*(id *)(a1 + 32) disabledViaConfig];
  if (Int64) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    if (gLogCategory_SFPasswordSharingService <= 30
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    return [*(id *)(a1 + 32) _run];
  }
  else if (gLogCategory_SFPasswordSharingService <= 50)
  {
    if (gLogCategory_SFPasswordSharingService != -1) {
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
  block[2] = __38__SFPasswordSharingService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__SFPasswordSharingService_invalidate__block_invoke(uint64_t a1)
{
  v18[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (uint64_t)(*(double *)(v2 + 64) * 1000.0);
  v17[0] = @"_cat";
  v17[1] = @"_op";
  v18[0] = @"PasswordSharing";
  v18[1] = @"ServiceInvalidate";
  v17[2] = @"serviceState";
  BOOL v4 = [NSNumber numberWithInt:*(unsigned int *)(v2 + 48)];
  v18[2] = v4;
  v17[3] = @"durationMS";
  objc_super v5 = [NSNumber numberWithInteger:v3];
  v18[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  SFDashboardLogJSON(v6);

  v15[0] = @"serviceState";
  objc_super v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 48)];
  v15[1] = @"durationMS";
  v16[0] = v7;
  v8 = [NSNumber numberWithInteger:v3];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  SFMetricsLog(@"com.apple.sharing.PasswordSharingServiceInvalidate", v9);

  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9)
    && gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = 0;

  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  return [*(id *)(a1 + 32) _cleanup];
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    [(SFPasswordSharingService *)self _runServiceStart];
  }
}

- (int)_runServiceStart
{
  int result = self->_serviceState;
  if (!result)
  {
    if (gLogCategory_SFPasswordSharingService <= 30
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_serviceState = 1;
    [(SFService *)self->_service invalidate];
    BOOL v4 = objc_alloc_init(SFService);
    service = self->_service;
    self->_service = v4;

    [(SFService *)self->_service setAdvertiseRate:50];
    [(SFService *)self->_service setDeviceActionType:8];
    [(SFService *)self->_service setDispatchQueue:self->_dispatchQueue];
    [(SFService *)self->_service setFixedPIN:@"9zfCcnJgD*sK&h7h7Xa1z*IU^2U%zKTg"];
    [(SFService *)self->_service setIdentifier:@"com.apple.sharing.PasswordSharing"];
    [(SFService *)self->_service setLabel:@"SFPasswordSharingService"];
    [(SFService *)self->_service setNeedsSetup:1];
    [(SFService *)self->_service setRequestSSID:self->_networkName];
    [(SFService *)self->_service setSessionFlags:20];
    [(SFService *)self->_service setInterruptionHandler:&__block_literal_global_60];
    [(SFService *)self->_service setInvalidationHandler:&__block_literal_global_173_0];
    [(SFService *)self->_service setPeerDisconnectedHandler:&__block_literal_global_177];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_4;
    v12[3] = &unk_1E5BC08B0;
    v12[4] = self;
    [(SFService *)self->_service setReceivedObjectHandler:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_5;
    v11[3] = &unk_1E5BBE028;
    v11[4] = self;
    [(SFService *)self->_service setSessionStartedHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_6;
    v10[3] = &unk_1E5BBE050;
    v10[4] = self;
    [(SFService *)self->_service setSessionEndedHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_7;
    v9[3] = &unk_1E5BBE028;
    void v9[4] = self;
    [(SFService *)self->_service setSessionSecuredHandler:v9];
    id v6 = self->_service;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_8;
    v8[3] = &unk_1E5BBC8E8;
    v8[4] = self;
    [(SFService *)v6 activateWithCompletion:v8];
    int result = self->_serviceState;
  }
  if (result == 4) {
    return 4;
  }
  if (gLogCategory_SFPasswordSharingService <= 30)
  {
    if (gLogCategory_SFPasswordSharingService != -1
      || (int v7 = _LogCategory_Initialize(), result = self->_serviceState, v7))
    {
      LogPrintF();
      return self->_serviceState;
    }
  }
  return result;
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke()
{
  if (gLogCategory_SFPasswordSharingService <= 50
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_2()
{
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (gLogCategory_SFPasswordSharingService <= 50
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __44__SFPasswordSharingService__runServiceStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _receivedObject:a4 flags:a3];
}

uint64_t __44__SFPasswordSharingService__runServiceStart__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSessionStarted:a2];
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = [v12 peer];
    id v11 = v5;
    LogPrintF();
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 24);
  int v7 = objc_msgSend(v12, "peer", v10, v11);
  LODWORD(v6) = [v6 isEqual:v7];

  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = 0;
  }
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (gLogCategory_SFPasswordSharingService <= 30)
  {
    id v10 = v3;
    if (gLogCategory_SFPasswordSharingService != -1 || (int v5 = _LogCategory_Initialize(), v4 = v10, v5))
    {
      v9 = [v4 peer];
      LogPrintF();

      id v4 = v10;
    }
  }
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    id v11 = v4;
    uint64_t v6 = [v4 peer];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v6;

    id v4 = v11;
  }
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    id v6 = 0;
    if (gLogCategory_SFPasswordSharingService <= 30
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 48) = 4;
    [*(id *)(a1 + 32) _run];
    goto LABEL_12;
  }
  if (gLogCategory_SFPasswordSharingService <= 90)
  {
    id v6 = v3;
    if (gLogCategory_SFPasswordSharingService != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
LABEL_12:
      id v4 = v6;
    }
  }
}

- (void)_handleReceivedPassword:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_SFPasswordSharingService <= 50
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    int v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceDate:self->_shareClock];
    uint64_t v14 = v6;
    LogPrintF();
  }
  [(NSDate *)self->_shareClock timeIntervalSinceNow];
  double v8 = v7;
  [(NSDate *)self->_shareClock timeIntervalSinceNow];
  if (v8 < 0.0) {
    double v9 = -v9;
  }
  self->_shareTime = v9;
  CFStringGetTypeID();
  id v10 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  id v11 = CFDictionaryGetTypedValue();
  id v12 = NSDictionaryGetNSNumber();
  if (v10 && v11)
  {
    uint64_t v13 = objc_alloc_init(SFPasswordSharingInfo);
    [(SFPasswordSharingInfo *)v13 setChannel:v12];
    [(SFPasswordSharingInfo *)v13 setNetworkName:v10];
    [(SFPasswordSharingInfo *)v13 setPsk:v11];
    [(SFPasswordSharingService *)self _sendPasswordReceived];
    [(SFPasswordSharingService *)self _passInfoToDelegate:v13];
  }
  else
  {
    if (gLogCategory_SFPasswordSharingService <= 90
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFPasswordSharingService *)self _sendPasswordDeclinedWithError:4294960554];
  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v9 = a3;
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    double v8 = [v9 peer];
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v8);
  id v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  shareClock = self->_shareClock;
  self->_shareClock = v4;

  if (!self->_peer)
  {
    uint64_t v6 = [v9 peer];
    peer = self->_peer;
    self->_peer = v6;
  }
}

- (void)_handleUserNotificationResponse:(int)a3
{
  if (a3 == 2)
  {
    [(SFPasswordSharingService *)self _sendPasswordDeclinedWithError:4294960573];
  }
  else if (a3 == 1)
  {
    [(SFPasswordSharingService *)self _passInfoToDelegate:self->_promptedInfo];
    promptedInfo = self->_promptedInfo;
    self->_promptedInfo = 0;
  }
  [(SFUserAlert *)self->_notification invalidate];
  notification = self->_notification;
  self->_notification = 0;
}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  id v5 = a3;
  char Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFPasswordSharingService <= 50
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Int64Ranged == 5)
  {
    [(SFPasswordSharingService *)self _handleReceivedPassword:v5];
  }
  else if (gLogCategory_SFPasswordSharingService <= 60 {
         && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_sendPasswordReceived
{
  if (self->_service)
  {
    if (self->_peer)
    {
      if (gLogCategory_SFPasswordSharingService <= 30
        && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      service = self->_service;
      peer = self->_peer;
      [(SFService *)service sendToPeer:peer flags:1 object:&unk_1EFA09E40];
      return;
    }
    if (gLogCategory_SFPasswordSharingService > 60
      || gLogCategory_SFPasswordSharingService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
  }
  else if (gLogCategory_SFPasswordSharingService > 60 {
         || gLogCategory_SFPasswordSharingService == -1 && !_LogCategory_Initialize())
  }
  {
    return;
  }

  LogPrintF();
}

- (void)_sendPasswordDeclinedWithError:(int)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (self->_service)
  {
    if (self->_peer)
    {
      uint64_t v4 = *(void *)&a3;
      if (gLogCategory_SFPasswordSharingService <= 30
        && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
      {
        uint64_t v9 = v4;
        LogPrintF();
      }
      service = self->_service;
      peer = self->_peer;
      v11[0] = MEMORY[0x1E4F1CC28];
      double v7 = objc_msgSend(NSNumber, "numberWithInt:", v4, v9, @"re", @"er");
      v10[2] = @"op";
      v11[1] = v7;
      v11[2] = &unk_1EFA09800;
      double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
      [(SFService *)service sendToPeer:peer flags:1 object:v8];

      return;
    }
    if (gLogCategory_SFPasswordSharingService > 60
      || gLogCategory_SFPasswordSharingService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
  }
  else if (gLogCategory_SFPasswordSharingService > 60 {
         || gLogCategory_SFPasswordSharingService == -1 && !_LogCategory_Initialize())
  }
  {
    return;
  }

  LogPrintF();
}

- (void)_passInfoToDelegate:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if (gLogCategory_SFPasswordSharingService <= 30
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [WeakRetained service:self receivedNetworkInfo:v5];
  }
}

- (void)_promptUserWithInfo:(id)a3 message:(id)a4
{
  uint64_t v6 = (SFPasswordSharingInfo *)a3;
  id v7 = a4;
  int v8 = SFIsGreenTeaDevice();
  uint64_t v9 = @"PASSWORD_ACCEPT_PROMPT_TITLE";
  if (v8) {
    uint64_t v9 = @"PASSWORD_ACCEPT_PROMPT_TITLE_WLAN";
  }
  id v10 = v9;
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFUserAlert *)self->_notification invalidate];
  id v11 = objc_alloc_init(SFUserAlert);
  notification = self->_notification;
  self->_notification = v11;

  uint64_t v13 = SFLocalizedStringForKey(@"PASSWORD_ACCEPT_PROMPT_OTHER_BUTTON");
  [(SFUserAlert *)self->_notification setAlternateButtonTitle:v13];

  uint64_t v14 = SFLocalizedStringForKey(@"PASSWORD_ACCEPT_PROMPT_DEFAULT_BUTTON");
  [(SFUserAlert *)self->_notification setDefaultButtonTitle:v14];

  [(SFUserAlert *)self->_notification setDispatchQueue:self->_dispatchQueue];
  [(SFUserAlert *)self->_notification setMessage:v7];

  uint64_t v15 = SFLocalizedStringForKey(v10);
  [(SFUserAlert *)self->_notification setTitle:v15];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__SFPasswordSharingService__promptUserWithInfo_message___block_invoke;
  v18[3] = &unk_1E5BBE120;
  v18[4] = self;
  [(SFUserAlert *)self->_notification setResponseHandler:v18];
  promptedInfo = self->_promptedInfo;
  self->_promptedInfo = v6;
  uint64_t v17 = v6;

  [(SFUserAlert *)self->_notification present];
}

uint64_t __56__SFPasswordSharingService__promptUserWithInfo_message___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleUserNotificationResponse:a2];
}

- (BOOL)disabledViaConfig
{
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isPasswordProximityAutoFillRequestingAllowed];

  if ((v3 & 1) == 0
    && gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v3 ^ 1;
}

- (id)messageForDisplayName:(id)a3 deviceName:(id)a4 info:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    if (SFIsGreenTeaDevice()) {
      CFStringRef v10 = @"PASSWORD_ACCEPT_PROMPT_MESSAGE_WLAN";
    }
    else {
      CFStringRef v10 = @"PASSWORD_ACCEPT_PROMPT_MESSAGE";
    }
    id v11 = NSString;
    id v12 = SFLocalizedStringForKey(v10);
    uint64_t v13 = [v9 networkName];
    objc_msgSend(v11, "stringWithFormat:", v12, v7, v13);
  }
  else
  {
    int v14 = SFIsGreenTeaDevice();
    uint64_t v15 = NSString;
    if (v8)
    {
      if (v14) {
        CFStringRef v16 = @"PASSWORD_ACCEPT_PROMPT_MESSAGE_DEVICE_WLAN";
      }
      else {
        CFStringRef v16 = @"PASSWORD_ACCEPT_PROMPT_MESSAGE_DEVICE";
      }
      id v12 = SFLocalizedStringForKey(v16);
      uint64_t v13 = [v9 networkName];
      objc_msgSend(v15, "stringWithFormat:", v12, v8, v13);
    }
    else
    {
      if (v14) {
        CFStringRef v17 = @"PASSWORD_ACCEPT_PROMPT_MESSAGE_GENERIC_WLAN";
      }
      else {
        CFStringRef v17 = @"PASSWORD_ACCEPT_PROMPT_MESSAGE_GENERIC";
      }
      id v12 = SFLocalizedStringForKey(v17);
      uint64_t v13 = [v9 networkName];
      objc_msgSend(v15, "stringWithFormat:", v12, v13, v20);
    }
  v18 = };

  return v18;
}

- (BOOL)__activateCalled
{
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_activateCalled;
}

- (BOOL)__invalidateCalled
{
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_invalidateCalled;
}

- (void)__testReceivedObject:(id)a3 withFlags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFPasswordSharingService *)self _receivedObject:v6 flags:v4];
}

- (SFPasswordSharingServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPasswordSharingServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shareClock, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_promptedInfo, 0);
  objc_storeStrong((id *)&self->_peer, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end