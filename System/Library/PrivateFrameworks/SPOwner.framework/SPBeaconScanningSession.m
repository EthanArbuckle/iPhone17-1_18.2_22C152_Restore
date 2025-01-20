@interface SPBeaconScanningSession
+ (id)exportedInterface;
+ (id)remoteInterface;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SPBeaconScanningSession)init;
- (SPBeaconScanningXPCProtocol)proxy;
- (id)beaconDiscoveredCallback;
- (id)discoveryFinishedCallback;
- (id)sessionInvalidatedCallback;
- (void)discoveredObject:(id)a3;
- (void)discoveryFinished:(id)a3 completion:(id)a4;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)setBeaconDiscoveredCallback:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDiscoveryFinishedCallback:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionInvalidatedCallback:(id)a3;
- (void)startScanningIncludeServiceCharacteristics:(BOOL)a3;
- (void)stopScanning;
@end

@implementation SPBeaconScanningSession

- (SPBeaconScanningSession)init
{
  v23.receiver = self;
  v23.super_class = (Class)SPBeaconScanningSession;
  v2 = [(SPBeaconScanningSession *)&v23 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBeaconScanningSession", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBeaconScanningSession.callback", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __31__SPBeaconScanningSession_init__block_invoke;
    aBlock[3] = &unk_1E601B8D0;
    v9 = v2;
    v22 = v9;
    v10 = _Block_copy(aBlock);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __31__SPBeaconScanningSession_init__block_invoke_2;
    v19[3] = &unk_1E601B8D0;
    v11 = v9;
    v20 = v11;
    v12 = _Block_copy(v19);
    id v13 = objc_alloc(MEMORY[0x1E4F61588]);
    v14 = +[SPBeaconScanningSession exportedInterface];
    v15 = +[SPBeaconScanningSession remoteInterface];
    uint64_t v16 = [v13 initWithMachServiceName:@"com.apple.searchparty.BeaconScanningSession" options:0 exportedObject:v11 exportedInterface:v14 remoteObjectInterface:v15 interruptionHandler:v10 invalidationHandler:v12];
    serviceDescription = v11->_serviceDescription;
    v11->_serviceDescription = (FMXPCServiceDescription *)v16;
  }
  return v2;
}

uint64_t __31__SPBeaconScanningSession_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) interruptionHandler:a2];
}

uint64_t __31__SPBeaconScanningSession_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invalidationHandler:a2];
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconScanningSession: interruptionHandler %@", buf, 0xCu);
  }

  v6 = [(SPBeaconScanningSession *)self sessionInvalidatedCallback];

  if (v6)
  {
    dispatch_queue_t v7 = [(SPBeaconScanningSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SPBeaconScanningSession_interruptionHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __47__SPBeaconScanningSession_interruptionHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sessionInvalidatedCallback];
  v1[2]();
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconScanningSession: invalidationHandler %@", buf, 0xCu);
  }

  [(SPBeaconScanningSession *)self setSession:0];
  v6 = [(SPBeaconScanningSession *)self sessionInvalidatedCallback];

  if (v6)
  {
    dispatch_queue_t v7 = [(SPBeaconScanningSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SPBeaconScanningSession_invalidationHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __47__SPBeaconScanningSession_invalidationHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sessionInvalidatedCallback];
  v1[2]();
}

- (SPBeaconScanningXPCProtocol)proxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(SPBeaconScanningSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SPBeaconScanningSession *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    v6 = [(SPBeaconScanningSession *)self serviceDescription];
    dispatch_queue_t v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPBeaconScanningSession *)self setSession:v7];

    v8 = LogCategory_AccessoryDiscovery();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(SPBeaconScanningSession *)self serviceDescription];
      id v10 = [v9 machService];
      int v15 = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPBeaconScanningSession: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v11 = [(SPBeaconScanningSession *)self session];
    [v11 resume];
  }
  v12 = [(SPBeaconScanningSession *)self session];
  id v13 = [v12 proxy];

  return (SPBeaconScanningXPCProtocol *)v13;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_1 != -1) {
    dispatch_once(&exportedInterface_onceToken_1, &__block_literal_global_1);
  }
  v2 = (void *)exportedInterface_interface_1;

  return v2;
}

uint64_t __44__SPBeaconScanningSession_exportedInterface__block_invoke()
{
  exportedInterface_interface_1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B34650];

  return MEMORY[0x1F41817F8]();
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_1 != -1) {
    dispatch_once(&remoteInterface_onceToken_1, &__block_literal_global_56_0);
  }
  v2 = (void *)remoteInterface_interface_1;

  return v2;
}

uint64_t __42__SPBeaconScanningSession_remoteInterface__block_invoke()
{
  remoteInterface_interface_1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B43FF0];

  return MEMORY[0x1F41817F8]();
}

- (void)startScanningIncludeServiceCharacteristics:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke;
  v3[3] = &unk_1E601B968;
  BOOL v4 = a3;
  v3[4] = self;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconScanningSession.startScanningIncludeServiceCharacteristics", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

void __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_BeaconScanning();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    int v8 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBeaconScanningSession startScanningIncludeServiceCharacteristics:%d]", buf, 8u);
  }

  BOOL v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_64;
  v5[3] = &unk_1E601B968;
  v5[4] = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 40);
  dispatch_sync(v4, v5);
}

void __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_64(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 startScanningIncludeServiceCharacterstics:*(unsigned __int8 *)(a1 + 40) completion:&__block_literal_global_67];
}

void __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = LogCategory_BeaconScanning();
  BOOL v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_2_cold_1((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession startScanningIncludeServiceCharacteristics:] completion.", v5, 2u);
  }
}

- (void)stopScanning
{
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __39__SPBeaconScanningSession_stopScanning__block_invoke;
  activity_block[3] = &unk_1E601B790;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1B2FD8000, "SPBeaconScanningSession.stopScanning", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __39__SPBeaconScanningSession_stopScanning__block_invoke(uint64_t a1)
{
  id v2 = LogCategory_BeaconScanning();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBeaconScanningSession stopScanning]", buf, 2u);
  }

  int v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SPBeaconScanningSession_stopScanning__block_invoke_68;
  block[3] = &unk_1E601B790;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __39__SPBeaconScanningSession_stopScanning__block_invoke_68(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) proxy];
  [v1 stopScanningWithCompletion:&__block_literal_global_70];
}

void __39__SPBeaconScanningSession_stopScanning__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = LogCategory_BeaconScanning();
  BOOL v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __39__SPBeaconScanningSession_stopScanning__block_invoke_2_cold_1((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession] completion.", v5, 2u);
  }
}

- (void)discoveredObject:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(SPBeaconScanningSession *)self beaconDiscoveredCallback];

  if (v4)
  {
    id v5 = [(SPBeaconScanningSession *)self beaconDiscoveredCallback];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)discoveryFinished:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(void))a4;
  dispatch_queue_t v7 = [(SPBeaconScanningSession *)self discoveryFinishedCallback];

  if (v7)
  {
    int v8 = [(SPBeaconScanningSession *)self discoveryFinishedCallback];
    ((void (**)(void, id))v8)[2](v8, v9);
  }
  v6[2](v6);
}

- (id)sessionInvalidatedCallback
{
  return self->_sessionInvalidatedCallback;
}

- (void)setSessionInvalidatedCallback:(id)a3
{
}

- (id)beaconDiscoveredCallback
{
  return self->_beaconDiscoveredCallback;
}

- (void)setBeaconDiscoveredCallback:(id)a3
{
}

- (id)discoveryFinishedCallback
{
  return self->_discoveryFinishedCallback;
}

- (void)setDiscoveryFinishedCallback:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_discoveryFinishedCallback, 0);
  objc_storeStrong(&self->_beaconDiscoveredCallback, 0);

  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);
}

void __70__SPBeaconScanningSession_startScanningIncludeServiceCharacteristics___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "-[SPAccessoryDiscoverySession startScanningIncludeServiceCharacteristics:] completion. Error %@", (uint8_t *)&v2, 0xCu);
}

void __39__SPBeaconScanningSession_stopScanning__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "-[SPAccessoryDiscoverySession stopScanning] completion. Error %@", (uint8_t *)&v2, 0xCu);
}

@end