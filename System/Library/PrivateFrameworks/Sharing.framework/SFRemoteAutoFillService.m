@interface SFRemoteAutoFillService
- (BOOL)needsSetup;
- (BOOL)unitTesting;
- (NSArray)associatedDomains;
- (NSData)appIconData;
- (NSString)bundleID;
- (NSString)fixedPIN;
- (NSString)localizedAppName;
- (NSString)unlocalizedAppName;
- (NSString)urlString;
- (OS_dispatch_queue)dispatchQueue;
- (SFRemoteAutoFillService)init;
- (id)description;
- (id)discoveredDevicesChanged;
- (id)errorHandler;
- (id)hidePINHandler;
- (id)receivedCredentialsHandler;
- (id)sessionEndedHandler;
- (id)sessionStartedHandler;
- (id)showPINHandlerEx;
- (id)urlForVisualScanning;
- (id)urlForVisualScanningChanged;
- (int)_readyForAutoFillRequest;
- (unint64_t)discoveredDevices;
- (void)_activateWithCompletion:(id)a3;
- (void)_activated;
- (void)_bluetoothAddressChanged;
- (void)_cleanup;
- (void)_completedWithError:(id)a3;
- (void)_discoveryChanged:(id)a3;
- (void)_discoveryFound:(id)a3;
- (void)_discoveryLost:(id)a3;
- (void)_discoveryStart;
- (void)_serviceHandleReceivedContextRequest:(id)a3 handler:(id)a4;
- (void)_serviceHandleReceivedCredentialRequest:(id)a3 handler:(id)a4;
- (void)_serviceHandleReceivedRequest:(id)a3 handler:(id)a4;
- (void)_serviceHidePIN;
- (void)_serviceSessionEnded:(id)a3 withError:(id)a4;
- (void)_serviceSessionStarted:(id)a3;
- (void)_serviceStart;
- (void)_systemMonitorStart;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setAppIconData:(id)a3;
- (void)setAssociatedDomains:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDiscoveredDevicesChanged:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFixedPIN:(id)a3;
- (void)setHidePINHandler:(id)a3;
- (void)setLocalizedAppName:(id)a3;
- (void)setReceivedCredentialsHandler:(id)a3;
- (void)setSessionEndedHandler:(id)a3;
- (void)setSessionStartedHandler:(id)a3;
- (void)setShowPINHandlerEx:(id)a3;
- (void)setUnitTesting:(BOOL)a3;
- (void)setUnlocalizedAppName:(id)a3;
- (void)setUrlForVisualScanningChanged:(id)a3;
- (void)setUrlString:(id)a3;
- (void)startRequestingAutoFill;
- (void)stopRequestingAutoFill;
- (void)updateURLForVisualScanning;
@end

@implementation SFRemoteAutoFillService

- (SFRemoteAutoFillService)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFRemoteAutoFillService;
  v2 = [(SFRemoteAutoFillService *)&v6 init];
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
    uint64_t v3 = (SFRemoteAutoFillService *)FatalErrorF();
    [(SFRemoteAutoFillService *)v3 description];
  }
  else
  {
    [(SFRemoteAutoFillService *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SFRemoteAutoFillService;
    [(SFRemoteAutoFillService *)&v5 dealloc];
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"SFRemoteAutoFillService"];
  if (self->_activateCalled)
  {
    SEL v4 = @", activated";
  }
  else
  {
    if (!self->_invalidateCalled) {
      goto LABEL_6;
    }
    SEL v4 = @", invalidated";
  }
  [v3 appendString:v4];
LABEL_6:
  if (self->_receivedUsername) {
    [v3 appendString:@", username"];
  }
  if (self->_receivedPassword) {
    [v3 appendString:@", password"];
  }
  if (self->_service) {
    objc_super v5 = "active";
  }
  else {
    objc_super v5 = "inactive";
  }
  [v3 appendFormat:@", service: %s", v5];

  return v3;
}

- (void)_cleanup
{
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  id discoveredDevicesChanged = self->_discoveredDevicesChanged;
  self->_id discoveredDevicesChanged = 0;

  self->_discoveryState = 0;
  id errorHandler = self->_errorHandler;
  self->_id errorHandler = 0;

  id receivedCredentialsHandler = self->_receivedCredentialsHandler;
  self->_id receivedCredentialsHandler = 0;

  receivedPassword = self->_receivedPassword;
  self->_receivedPassword = 0;

  receivedUsername = self->_receivedUsername;
  self->_receivedUsername = 0;

  self->_requestingAutoFill = 0;
  self->_serviceState = 0;
  systemBTAddress = self->_systemBTAddress;
  self->_systemBTAddress = 0;

  self->_systemMonitorState = 0;
  urlForVisualScanning = self->_urlForVisualScanning;
  self->_urlForVisualScanning = 0;

  [(NSMutableDictionary *)self->_devices removeAllObjects];
  devices = self->_devices;
  self->_devices = 0;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SFRemoteAutoFillService_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __50__SFRemoteAutoFillService_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (CFPrefs_GetInt64() || self->_unitTesting)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_activateCalled = 1;
    objc_super v5 = _Block_copy(v4);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = v5;

    [(SFRemoteAutoFillService *)self _systemMonitorStart];
    [(SFRemoteAutoFillService *)self _serviceStart];
    [(SFRemoteAutoFillService *)self _discoveryStart];
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillService <= 50
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F28760];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      uint64_t v9 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v10 = (void *)v9;
      v11 = @"?";
      if (v9) {
        v11 = (__CFString *)v9;
      }
      v15[0] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v13 = [v7 errorWithDomain:v8 code:-6735 userInfo:v12];
      (*((void (**)(id, void *))v4 + 2))(v4, v13);
    }
  }
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int discoveryState = self->_discoveryState;
  BOOL v4 = discoveryState == 4 || discoveryState == 2;
  if (!v4 || !self->_discovery)
  {
    if (gLogCategory_SFRemoteAutoFillService > 30
      || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_26:
    LogPrintF();
    return;
  }
  int serviceState = self->_serviceState;
  BOOL v6 = serviceState == 4 || serviceState == 2;
  if (!v6 || !self->_service)
  {
    if (gLogCategory_SFRemoteAutoFillService > 30
      || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_26;
  }
  int systemMonitorState = self->_systemMonitorState;
  if (systemMonitorState != 2 && systemMonitorState != 4)
  {
    if (gLogCategory_SFRemoteAutoFillService > 30
      || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_26;
  }
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id activateCompletion = (void (**)(id, void))self->_activateCompletion;
  if (activateCompletion)
  {
    activateCompletion[2](activateCompletion, 0);
    id activateCompletion = (void (**)(id, void))self->_activateCompletion;
  }
  self->_id activateCompletion = 0;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFRemoteAutoFillService_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFRemoteAutoFillService_invalidate__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 48)
    && gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = 0;

  [*(id *)(*(void *)(a1 + 32) + 96) invalidate];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = 0;

  [*(id *)(*(void *)(a1 + 32) + 112) invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 112);
  *(void *)(v8 + 112) = 0;

  v10 = *(void **)(a1 + 32);

  return [v10 _cleanup];
}

- (void)startRequestingAutoFill
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(SFRemoteAutoFillService *)self _readyForAutoFillRequest];
  if (v3)
  {
    int v4 = v3;
    if (gLogCategory_SFRemoteAutoFillService <= 60
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      objc_super v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = *MEMORY[0x1E4F28760];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      uint64_t v7 = [NSString stringWithUTF8String:DebugGetErrorString()];
      uint64_t v8 = (void *)v7;
      uint64_t v9 = @"?";
      if (v7) {
        uint64_t v9 = (__CFString *)v7;
      }
      v15[0] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v13 = [v5 errorWithDomain:v6 code:v4 userInfo:v10];
      LogPrintF();
    }
    id errorHandler = (void (**)(id, void *))self->_errorHandler;
    if (errorHandler)
    {
      v12 = NSErrorWithOSStatusF();
      errorHandler[2](errorHandler, v12);
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillService <= 50
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFService *)self->_service setNeedsSetup:1];
    self->_requestingAutoFill = 1;
  }
}

- (void)stopRequestingAutoFill
{
  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v4 = [(SFSession *)self->_session peer];
  if (v4)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[SFService sendToPeer:flags:object:](self->_service, "sendToPeer:flags:object:", v4, 0, &unk_1EFA09A30, v4);
    }
    else
    {
      -[SFService sendToPeer:flags:object:](self->_service, "sendToPeer:flags:object:", v4, 0, &unk_1EFA09A30, v3);
    }
  }
  [(SFService *)self->_service setNeedsSetup:0];
  self->_requestingAutoFill = 0;
}

- (id)urlForVisualScanning
{
  [(SFRemoteAutoFillService *)self updateURLForVisualScanning];
  urlForVisualScanning = self->_urlForVisualScanning;

  return urlForVisualScanning;
}

- (void)updateURLForVisualScanning
{
  v22[2] = *MEMORY[0x1E4F143B8];
  fixedPIN = self->_fixedPIN;
  if (fixedPIN && [(NSString *)fixedPIN length])
  {
    systemBTAddress = self->_systemBTAddress;
    if (systemBTAddress)
    {
      if (!self->_unitTesting)
      {
        objc_super v5 = SFHexStringForData(systemBTAddress);
        uint64_t v6 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
        uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

        goto LABEL_8;
      }
LABEL_7:
      uint64_t v7 = @"a1b2c3d4e5f6";
LABEL_8:
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:@"https://autofill.apple.com/"];
      uint64_t v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"bt" value:v7];
      v22[0] = v9;
      v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"pin" value:self->_fixedPIN];
      v22[1] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      [v8 setQueryItems:v11];

      v12 = [v8 URL];
      urlForVisualScanning = self->_urlForVisualScanning;
      uint64_t v14 = v12;
      v15 = urlForVisualScanning;
      if (v14 != v15)
      {
        v16 = v15;
        if ((v14 == 0) != (v15 != 0))
        {
          char v17 = [(NSURL *)v14 isEqual:v15];

          if (v17) {
            goto LABEL_22;
          }
        }
        else
        {
        }
        if (gLogCategory_SFRemoteAutoFillService <= 30
          && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
        {
          v20 = [(NSURL *)v14 absoluteString];
          LogPrintF();
        }
        objc_storeStrong((id *)&self->_urlForVisualScanning, v12);
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__SFRemoteAutoFillService_updateURLForVisualScanning__block_invoke;
        block[3] = &unk_1E5BBC870;
        block[4] = self;
        dispatch_async(dispatchQueue, block);
        goto LABEL_22;
      }

LABEL_22:
      return;
    }
    if (self->_unitTesting) {
      goto LABEL_7;
    }
  }
  v18 = self->_urlForVisualScanning;
  self->_urlForVisualScanning = 0;
}

uint64_t __53__SFRemoteAutoFillService_updateURLForVisualScanning__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v1 + 264);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(v1 + 128));
  }
  return result;
}

- (unint64_t)discoveredDevices
{
  unint64_t result = (unint64_t)self->_devices;
  if (result) {
    return [(id)result count];
  }
  return result;
}

- (void)setBundleID:(id)a3
{
  id v5 = a3;
  if ([(SFService *)self->_service needsSetup])
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_errorHandler)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__SFRemoteAutoFillService_setBundleID___block_invoke;
      block[3] = &unk_1E5BBC870;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
  else
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_bundleID, a3);
    objc_sync_exit(v6);
  }
}

void __39__SFRemoteAutoFillService_setBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 208);
  NSErrorWithOSStatusF();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setFixedPIN:(id)a3
{
  id v7 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_fixedPIN, a3);
  service = v5->_service;
  if (service) {
    [(SFService *)service setFixedPIN:v5->_fixedPIN];
  }
  [(SFRemoteAutoFillService *)v5 updateURLForVisualScanning];
  objc_sync_exit(v5);
}

- (void)setShowPINHandlerEx:(id)a3
{
  id aBlock = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = _Block_copy(aBlock);
  id showPINHandlerEx = v4->_showPINHandlerEx;
  v4->_id showPINHandlerEx = v5;

  service = v4->_service;
  if (service) {
    [(SFService *)service setShowPINHandlerEx:v4->_showPINHandlerEx];
  }
  objc_sync_exit(v4);
}

- (void)setUrlString:(id)a3
{
  id v5 = a3;
  if ([(SFService *)self->_service needsSetup])
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_errorHandler)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__SFRemoteAutoFillService_setUrlString___block_invoke;
      block[3] = &unk_1E5BBC870;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
  else
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_urlString, a3);
    objc_sync_exit(v6);
  }
}

void __40__SFRemoteAutoFillService_setUrlString___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 208);
  NSErrorWithOSStatusF();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_completedWithError:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60)
    {
      if (gLogCategory_SFRemoteAutoFillService != -1 || (v5 = _LogCategory_Initialize(), id v4 = v8, v5))
      {
        LogPrintF();
        id v4 = v8;
      }
    }
    id errorHandler = (void (**)(id, id))self->_errorHandler;
    if (errorHandler)
    {
      errorHandler[2](errorHandler, v4);
      id v4 = v8;
    }
  }
  id receivedCredentialsHandler = (void (**)(id, NSString *, NSString *, void))self->_receivedCredentialsHandler;
  if (receivedCredentialsHandler)
  {
    ((void (**)(id, NSString *, NSString *, id))receivedCredentialsHandler)[2](receivedCredentialsHandler, self->_receivedUsername, self->_receivedPassword, v8);
    id v4 = v8;
  }
}

- (int)_readyForAutoFillRequest
{
  if (!self->_activateCalled) {
    return -6709;
  }
  if (!self->_invalidateCalled)
  {
    int discoveryState = self->_discoveryState;
    BOOL v3 = discoveryState == 4 || discoveryState == 2;
    if (v3 && self->_discovery)
    {
      int serviceState = self->_serviceState;
      if ((serviceState == 4 || serviceState == 2) && self->_service) {
        return 0;
      }
      if (gLogCategory_SFRemoteAutoFillService > 60
        || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
      {
        return -6745;
      }
    }
    else if (gLogCategory_SFRemoteAutoFillService > 60 {
           || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
    }
    {
      return -6745;
    }
    LogPrintF();
    return -6745;
  }
  return -6724;
}

- (void)_discoveryStart
{
  if (!self->_discovery)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int discoveryState = 1;
    BOOL v3 = objc_alloc_init(SFDeviceDiscovery);
    discovery = self->_discovery;
    self->_discovery = v3;

    [(SFDeviceDiscovery *)self->_discovery setChangeFlags:13];
    [(SFDeviceDiscovery *)self->_discovery setDiscoveryFlags:8208];
    [(SFDeviceDiscovery *)self->_discovery setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceDiscovery *)self->_discovery setFastScanMode:1];
    [(SFDeviceDiscovery *)self->_discovery setPurpose:@"SFRemoteAutoFillService"];
    [(SFDeviceDiscovery *)self->_discovery setRssiThreshold:-60];
    [(SFDeviceDiscovery *)self->_discovery setScanRate:40];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke;
    v10[3] = &unk_1E5BBDF70;
    v10[4] = self;
    [(SFDeviceDiscovery *)self->_discovery setDeviceFoundHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke_2;
    v9[3] = &unk_1E5BBDF70;
    v9[4] = self;
    [(SFDeviceDiscovery *)self->_discovery setDeviceLostHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke_3;
    v8[3] = &unk_1E5BBDF98;
    v8[4] = self;
    [(SFDeviceDiscovery *)self->_discovery setDeviceChangedHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke_4;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(SFDeviceDiscovery *)self->_discovery setInterruptionHandler:v7];
    [(SFDeviceDiscovery *)self->_discovery setInvalidationHandler:&__block_literal_global_15];
    int v5 = self->_discovery;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke_6;
    v6[3] = &unk_1E5BBC8E8;
    v6[4] = self;
    [(SFDeviceDiscovery *)v5 activateWithCompletion:v6];
  }
}

uint64_t __42__SFRemoteAutoFillService__discoveryStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _discoveryFound:a2];
}

uint64_t __42__SFRemoteAutoFillService__discoveryStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _discoveryLost:a2];
}

uint64_t __42__SFRemoteAutoFillService__discoveryStart__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _discoveryChanged:a2];
}

void __42__SFRemoteAutoFillService__discoveryStart__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_SFRemoteAutoFillService <= 60
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _completedWithError:v3];
}

void __42__SFRemoteAutoFillService__discoveryStart__block_invoke_5()
{
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __42__SFRemoteAutoFillService__discoveryStart__block_invoke_6(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!v7)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 4;
    goto LABEL_16;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 136))
  {
    if (gLogCategory_SFRemoteAutoFillService <= 50
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 2;
LABEL_16:
    *(_DWORD *)(v3 + 32) = v4;
    [*(id *)(a1 + 32) _activated];
    goto LABEL_19;
  }
  if (gLogCategory_SFRemoteAutoFillService <= 60
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 32) = 3;
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = NSErrorWithOSStatusF();
  [v5 _completedWithError:v6];

LABEL_19:
}

- (void)_discoveryFound:(id)a3
{
  id v11 = a3;
  int v4 = [v11 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_discovery) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && [v11 deviceActionType] == 22)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 10
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      id v10 = v11;
      LogPrintF();
    }
    devices = self->_devices;
    if (!devices)
    {
      id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v8 = self->_devices;
      self->_devices = v7;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v11, v4, v10);
    id discoveredDevicesChanged = (void (**)(id, uint64_t))self->_discoveredDevicesChanged;
    if (discoveredDevicesChanged) {
      discoveredDevicesChanged[2](discoveredDevicesChanged, [(NSMutableDictionary *)self->_devices count]);
    }
  }
}

- (void)_discoveryLost:(id)a3
{
  id v7 = a3;
  int v4 = [v7 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4 && self->_discovery && [v7 deviceActionType] == 22)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 10
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      id v6 = v7;
      LogPrintF();
    }
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4, v6);
    id discoveredDevicesChanged = (void (**)(id, uint64_t))self->_discoveredDevicesChanged;
    if (discoveredDevicesChanged) {
      discoveredDevicesChanged[2](discoveredDevicesChanged, [(NSMutableDictionary *)self->_devices count]);
    }
  }
}

- (void)_discoveryChanged:(id)a3
{
  id v5 = a3;
  int v4 = [v5 identifier];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4 && self->_discovery && [v5 deviceActionType] == 22) {
    [(NSMutableDictionary *)self->_devices setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)_serviceStart
{
  if (!self->_service)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int serviceState = 1;
    uint64_t v3 = objc_alloc_init(SFService);
    service = self->_service;
    self->_service = v3;

    [(SFService *)self->_service setAdvertiseRate:50];
    [(SFService *)self->_service setDeviceActionType:19];
    [(SFService *)self->_service setDispatchQueue:self->_dispatchQueue];
    [(SFService *)self->_service setFixedPIN:self->_fixedPIN];
    [(SFService *)self->_service setIdentifier:@"com.apple.sharing.RemoteAutoFill"];
    [(SFService *)self->_service setLabel:@"SFRemoteAutoFillService"];
    [(SFService *)self->_service setNeedsSetup:0];
    [(SFService *)self->_service setPinType:1];
    [(SFService *)self->_service setSessionFlags:20];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke;
    v11[3] = &unk_1E5BBC870;
    v11[4] = self;
    [(SFService *)self->_service setHidePINHandler:v11];
    [(SFService *)self->_service setInvalidationHandler:&__block_literal_global_215];
    if (self->_showPINHandlerEx) {
      -[SFService setShowPINHandlerEx:](self->_service, "setShowPINHandlerEx:");
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_3;
    v10[3] = &unk_1E5BBC870;
    v10[4] = self;
    [(SFService *)self->_service setInterruptionHandler:v10];
    [(SFService *)self->_service setPeerDisconnectedHandler:&__block_literal_global_220];
    [(SFService *)self->_service setReceivedObjectHandler:&__block_literal_global_224];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_6;
    v9[3] = &unk_1E5BBE000;
    v9[4] = self;
    [(SFService *)self->_service setReceivedRequestHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_7;
    v8[3] = &unk_1E5BBE028;
    v8[4] = self;
    [(SFService *)self->_service setSessionStartedHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_8;
    v7[3] = &unk_1E5BBE050;
    v7[4] = self;
    [(SFService *)self->_service setSessionEndedHandler:v7];
    [(SFService *)self->_service setSessionSecuredHandler:&__block_literal_global_231];
    id v5 = self->_service;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_10;
    v6[3] = &unk_1E5BBC8E8;
    v6[4] = self;
    [(SFService *)v5 activateWithCompletion:v6];
  }
}

uint64_t __40__SFRemoteAutoFillService__serviceStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceHidePIN];
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_2()
{
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _completedWithError:v2];
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v5 = a4;
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __40__SFRemoteAutoFillService__serviceStart__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _serviceHandleReceivedRequest:a4 handler:a5];
}

uint64_t __40__SFRemoteAutoFillService__serviceStart__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _serviceSessionStarted:a2];
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    id v6 = [v8 peer];
    id v7 = v5;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_serviceSessionEnded:withError:", v8, v5, v6, v7);
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (gLogCategory_SFRemoteAutoFillService <= 30)
  {
    id v6 = v2;
    if (gLogCategory_SFRemoteAutoFillService != -1 || (v4 = _LogCategory_Initialize(), uint64_t v3 = v6, v4))
    {
      id v5 = [v3 peer];
      LogPrintF();

      uint64_t v3 = v6;
    }
  }
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_10(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!v7)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 4;
    goto LABEL_16;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 136))
  {
    if (gLogCategory_SFRemoteAutoFillService <= 50
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 2;
LABEL_16:
    *(_DWORD *)(v3 + 88) = v4;
    [*(id *)(a1 + 32) _activated];
    goto LABEL_19;
  }
  if (gLogCategory_SFRemoteAutoFillService <= 90
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 88) = 3;
  id v5 = *(void **)(a1 + 32);
  id v6 = NSErrorWithOSStatusF();
  [v5 _completedWithError:v6];

LABEL_19:
}

- (void)_serviceHandleReceivedContextRequest:(id)a3 handler:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(id, uint64_t, void *, void *))a4;
  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = v7;
  appIconData = self->_appIconData;
  if (appIconData) {
    [v7 setObject:appIconData forKeyedSubscript:@"aid"];
  }
  associatedDomains = self->_associatedDomains;
  if (associatedDomains) {
    [v8 setObject:associatedDomains forKeyedSubscript:@"ass"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v8 setObject:bundleID forKeyedSubscript:@"bid"];
  }
  localizedAppName = self->_localizedAppName;
  if (localizedAppName) {
    [v8 setObject:localizedAppName forKeyedSubscript:@"lan"];
  }
  unlocalizedAppName = self->_unlocalizedAppName;
  if (unlocalizedAppName) {
    [v8 setObject:unlocalizedAppName forKeyedSubscript:@"uan"];
  }
  urlString = self->_urlString;
  if (urlString) {
    [v8 setObject:urlString forKeyedSubscript:@"url"];
  }
  if (self->_bundleID || self->_urlString)
  {
    v15 = 0;
  }
  else
  {
    v15 = NSErrorWithOSStatusF();
  }
  v6[2](v6, 1, v15, v8);
}

- (void)_serviceHandleReceivedCredentialRequest:(id)a3 handler:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, uint64_t, void *, void))a4;
  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();
  if (v7)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      IsAppleInternalBuild();
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_receivedUsername, v7);
  }
  CFStringGetTypeID();
  id v8 = CFDictionaryGetTypedValue();

  if (v8)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      IsAppleInternalBuild();
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_receivedPassword, v8);
  }
  if (self->_receivedUsername || self->_receivedPassword)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = NSErrorWithOSStatusF();
  }
  v6[2](v6, 1, v9, MEMORY[0x1E4F1CC08]);
  [(SFRemoteAutoFillService *)self _completedWithError:v9];
}

- (void)_serviceHandleReceivedRequest:(id)a3 handler:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 5u) {
      uint64_t v9 = "?";
    }
    else {
      uint64_t v9 = off_1E5BBE090[(char)Int64Ranged];
    }
    v18 = v9;
    LogPrintF();
  }
  if (Int64Ranged == 3)
  {
    [(SFRemoteAutoFillService *)self _serviceHandleReceivedCredentialRequest:v6 handler:v7];
  }
  else if (Int64Ranged == 1)
  {
    [(SFRemoteAutoFillService *)self _serviceHandleReceivedContextRequest:v6 handler:v7];
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      if (Int64Ranged > 5u) {
        id v10 = "?";
      }
      else {
        id v10 = off_1E5BBE0C0[(char)Int64Ranged];
      }
      v18 = v10;
      uint64_t v19 = Int64Ranged;
      LogPrintF();
    }
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28760];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v13 = [NSString stringWithUTF8String:DebugGetErrorString()];
    uint64_t v14 = (void *)v13;
    v15 = @"?";
    if (v13) {
      v15 = (__CFString *)v13;
    }
    v21[0] = v15;
    id v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1, v18, v19);
    char v17 = [v11 errorWithDomain:v12 code:-6735 userInfo:v16];
    (*((void (**)(id, void, void *, void))v7 + 2))(v7, 0, v17, 0);
  }
}

- (void)_serviceHidePIN
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id hidePINHandler = self->_hidePINHandler;
  if (hidePINHandler)
  {
    int v4 = (void (*)(void))*((void *)hidePINHandler + 2);
    v4();
  }
  else if (gLogCategory_SFRemoteAutoFillService <= 60 {
         && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_serviceSessionEnded:(id)a3 withError:(id)a4
{
  uint64_t v13 = (SFSession *)a3;
  id v6 = a4;
  id v7 = v13;
  if (self->_session == v13)
  {
    if (v13)
    {
      if (gLogCategory_SFRemoteAutoFillService <= 30)
      {
        if (gLogCategory_SFRemoteAutoFillService != -1 || (int v8 = _LogCategory_Initialize(), v7 = v13, v8))
        {
          uint64_t v12 = [(SFSession *)v7 peer];
          LogPrintF();
        }
      }
    }
    sessionEndedHandler = (void (**)(id, void *))self->_sessionEndedHandler;
    if (sessionEndedHandler)
    {
      id v10 = [(SFSession *)v13 peer];
      sessionEndedHandler[2](sessionEndedHandler, v10);
    }
    session = self->_session;
    self->_session = 0;

    if (self->_requestingAutoFill) {
      [(SFService *)self->_service setNeedsSetup:1];
    }
  }
}

- (void)_serviceSessionStarted:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  p_session = &self->_session;
  if (self->_session)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60)
    {
      uint64_t v14 = v5;
      if (gLogCategory_SFRemoteAutoFillService != -1 || (v9 = _LogCategory_Initialize(), id v6 = v14, v9))
      {
        int v8 = [v6 peer];
        uint64_t v13 = [(SFSession *)*p_session peer];
        LogPrintF();

LABEL_15:
        id v6 = v14;
      }
    }
  }
  else
  {
    uint64_t v14 = v5;
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = [v14 peer];
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_session, a3);
    sessionStartedHandler = (void (**)(id, void *))self->_sessionStartedHandler;
    if (sessionStartedHandler)
    {
      id v11 = [v14 peer];
      sessionStartedHandler[2](sessionStartedHandler, v11);
    }
    id v6 = v14;
    if (self->_requestingAutoFill)
    {
      [(SFService *)self->_service setNeedsSetup:0];
      goto LABEL_15;
    }
  }
}

- (void)_systemMonitorStart
{
  if (!self->_systemMonitor)
  {
    self->_int systemMonitorState = 1;
    uint64_t v3 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x1E4F5E1F0]);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setBluetoothAddressChangedHandler:v7];
    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    [(CUSystemMonitor *)self->_systemMonitor setInvalidationHandler:&__block_literal_global_279];
    id v5 = self->_systemMonitor;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke_3;
    v6[3] = &unk_1E5BBC870;
    v6[4] = self;
    [(CUSystemMonitor *)v5 activateWithCompletion:v6];
  }
}

uint64_t __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bluetoothAddressChanged];
}

void __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke_2()
{
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke_3(uint64_t a1)
{
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 120) = 4;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) bluetoothAddressData];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 104);
  if (v5)
  {
    if (gLogCategory_SFRemoteAutoFillService > 10) {
      goto LABEL_15;
    }
    if (gLogCategory_SFRemoteAutoFillService != -1) {
      goto LABEL_8;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 104);
LABEL_8:
      uint64_t v8 = v5;
LABEL_11:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFRemoteAutoFillService <= 60 {
         && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_11;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "updateURLForVisualScanning", v8);
  id v6 = *(void **)(a1 + 32);

  return [v6 _activated];
}

- (void)_bluetoothAddressChanged
{
  systemMonitor = self->_systemMonitor;
  if (systemMonitor)
  {
    int v4 = [(CUSystemMonitor *)systemMonitor bluetoothAddressData];
    systemBTAddress = self->_systemBTAddress;
    self->_systemBTAddress = v4;

    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFRemoteAutoFillService *)self updateURLForVisualScanning];
  }
}

- (BOOL)needsSetup
{
  service = self->_service;
  if (service) {
    LOBYTE(service) = [(SFService *)service needsSetup];
  }
  return (char)service;
}

- (NSData)appIconData
{
  return self->_appIconData;
}

- (void)setAppIconData:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
}

- (NSString)unlocalizedAppName
{
  return self->_unlocalizedAppName;
}

- (void)setUnlocalizedAppName:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
}

- (id)receivedCredentialsHandler
{
  return self->_receivedCredentialsHandler;
}

- (void)setReceivedCredentialsHandler:(id)a3
{
}

- (id)sessionStartedHandler
{
  return self->_sessionStartedHandler;
}

- (void)setSessionStartedHandler:(id)a3
{
}

- (id)sessionEndedHandler
{
  return self->_sessionEndedHandler;
}

- (void)setSessionEndedHandler:(id)a3
{
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (id)discoveredDevicesChanged
{
  return self->_discoveredDevicesChanged;
}

- (void)setDiscoveredDevicesChanged:(id)a3
{
}

- (id)urlForVisualScanningChanged
{
  return self->_urlForVisualScanningChanged;
}

- (void)setUrlForVisualScanningChanged:(id)a3
{
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_urlForVisualScanningChanged, 0);
  objc_storeStrong(&self->_discoveredDevicesChanged, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartedHandler, 0);
  objc_storeStrong(&self->_receivedCredentialsHandler, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_unlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_fixedPIN, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_appIconData, 0);
  objc_storeStrong((id *)&self->_urlForVisualScanning, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_systemBTAddress, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_receivedUsername, 0);
  objc_storeStrong((id *)&self->_receivedPassword, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_discovery, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end