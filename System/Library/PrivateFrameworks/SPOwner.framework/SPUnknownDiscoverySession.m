@interface SPUnknownDiscoverySession
+ (id)exportedInterface;
+ (id)remoteInterface;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SPUnknownDiscoverySession)init;
- (SPUnknownDiscoverySession)initWithPreviousState:(id)a3;
- (SPUnknownDiscoverySessionState)state;
- (SPUnknownDiscoveryXPCProtocol)proxy;
- (id)accessoryDiscoveredCallback;
- (id)accessoryDiscoveryErrorCallback;
- (id)accessoryDiscoveryFinishedCallback;
- (id)sessionInvalidatedCallback;
- (void)discoveredUnknownAccessory:(id)a3;
- (void)fetchEncryptedPayloadForUnknownBeacon:(id)a3 completion:(id)a4;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)lostUnknownAccessory:(id)a3;
- (void)setAccessoryDiscoveredCallback:(id)a3;
- (void)setAccessoryDiscoveryErrorCallback:(id)a3;
- (void)setAccessoryDiscoveryFinishedCallback:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionInvalidatedCallback:(id)a3;
- (void)setState:(id)a3;
- (void)startDiscoveryWithCompletion:(id)a3;
- (void)startDiscoveryWithScanRate:(int64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)stop;
- (void)stopDiscoveryWithCompletion:(id)a3;
- (void)unknownAccessoryDiscoveryError:(id)a3;
- (void)unknownAccessoryDiscoveryFinished;
@end

@implementation SPUnknownDiscoverySession

- (SPUnknownDiscoverySession)init
{
  return [(SPUnknownDiscoverySession *)self initWithPreviousState:0];
}

- (SPUnknownDiscoverySession)initWithPreviousState:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SPUnknownDiscoverySession;
  v5 = [(SPUnknownDiscoverySession *)&v18 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPUnknownDiscoverySession", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPUnknownDiscoverySession.callback", v9);
    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = (OS_dispatch_queue *)v10;

    if (v4)
    {
      v12 = (SPUnknownDiscoverySessionState *)v4;
      state = v5->_state;
      v5->_state = v12;
    }
    else
    {
      v14 = [SPUnknownDiscoverySessionState alloc];
      state = (SPUnknownDiscoverySessionState *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      uint64_t v15 = [(SPUnknownDiscoverySessionState *)v14 initWithUnknownAccessories:state];
      v16 = v5->_state;
      v5->_state = (SPUnknownDiscoverySessionState *)v15;
    }
  }

  return v5;
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPUnknownDiscoverySession: interruptionHandler %@", buf, 0xCu);
  }

  v6 = [(SPUnknownDiscoverySession *)self sessionInvalidatedCallback];

  if (v6)
  {
    dispatch_queue_t v7 = [(SPUnknownDiscoverySession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__SPUnknownDiscoverySession_interruptionHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __49__SPUnknownDiscoverySession_interruptionHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sessionInvalidatedCallback];
  v1[2]();
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPUnknownDiscoverySession: invalidationHandler %@", buf, 0xCu);
  }

  [(SPUnknownDiscoverySession *)self setSession:0];
  v6 = [(SPUnknownDiscoverySession *)self sessionInvalidatedCallback];

  if (v6)
  {
    dispatch_queue_t v7 = [(SPUnknownDiscoverySession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__SPUnknownDiscoverySession_invalidationHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __49__SPUnknownDiscoverySession_invalidationHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sessionInvalidatedCallback];
  v1[2]();
}

- (SPUnknownDiscoveryXPCProtocol)proxy
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(SPUnknownDiscoverySession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SPUnknownDiscoverySession *)self session];

  if (!v4)
  {
    v5 = [(SPUnknownDiscoverySession *)self serviceDescription];

    if (!v5)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __34__SPUnknownDiscoverySession_proxy__block_invoke;
      aBlock[3] = &unk_1E601B8D0;
      aBlock[4] = self;
      v6 = _Block_copy(aBlock);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __34__SPUnknownDiscoverySession_proxy__block_invoke_2;
      v23[3] = &unk_1E601B8D0;
      v23[4] = self;
      dispatch_queue_t v7 = _Block_copy(v23);
      id v8 = objc_alloc(MEMORY[0x1E4F61588]);
      v9 = +[SPUnknownDiscoverySession exportedInterface];
      id v10 = +[SPUnknownDiscoverySession remoteInterface];
      uint64_t v11 = (FMXPCServiceDescription *)[v8 initWithMachServiceName:@"com.apple.icloud.searchpartyd.unknowndiscoverysession" options:0 exportedObject:self exportedInterface:v9 remoteObjectInterface:v10 interruptionHandler:v6 invalidationHandler:v7];
      serviceDescription = self->_serviceDescription;
      self->_serviceDescription = v11;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F61590]);
    v14 = [(SPUnknownDiscoverySession *)self serviceDescription];
    uint64_t v15 = (void *)[v13 initWithServiceDescription:v14];
    [(SPUnknownDiscoverySession *)self setSession:v15];

    v16 = LogCategory_UnknownDiscovery();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(SPUnknownDiscoverySession *)self serviceDescription];
      objc_super v18 = [v17 machService];
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_impl(&dword_1B2FD8000, v16, OS_LOG_TYPE_DEFAULT, "SPUnknownDiscoverySession: Establishing XPC connection to %@", buf, 0xCu);
    }
    v19 = [(SPUnknownDiscoverySession *)self session];
    [v19 resume];
  }
  v20 = [(SPUnknownDiscoverySession *)self session];
  v21 = [v20 proxy];

  return (SPUnknownDiscoveryXPCProtocol *)v21;
}

uint64_t __34__SPUnknownDiscoverySession_proxy__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) interruptionHandler:a2];
}

uint64_t __34__SPUnknownDiscoverySession_proxy__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invalidationHandler:a2];
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_0 != -1) {
    dispatch_once(&exportedInterface_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)exportedInterface_interface_0;

  return v2;
}

uint64_t __46__SPUnknownDiscoverySession_exportedInterface__block_invoke()
{
  exportedInterface_interface_0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B34348];

  return MEMORY[0x1F41817F8]();
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_0 != -1) {
    dispatch_once(&remoteInterface_onceToken_0, &__block_literal_global_63);
  }
  v2 = (void *)remoteInterface_interface_0;

  return v2;
}

uint64_t __44__SPUnknownDiscoverySession_remoteInterface__block_invoke()
{
  remoteInterface_interface_0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B43F90];

  return MEMORY[0x1F41817F8]();
}

- (void)startDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPUnknownDiscoverySession.startDiscovery", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  v2 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession startDiscoveryWithCompletion]", buf, 2u);
  }

  v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke_75;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, v5);
}

void __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke_75(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) proxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke_2;
  v3[3] = &unk_1E601B800;
  id v4 = *(id *)(a1 + 40);
  [v2 startUnknownDiscoveryWithCompletion:v3];
}

void __58__SPUnknownDiscoverySession_startDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession startDiscoveryWithCompletion] completion. Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startDiscoveryWithScanRate:(int64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke;
  v10[3] = &unk_1E601B8F8;
  id v11 = v8;
  int64_t v12 = a3;
  double v13 = a4;
  v10[4] = self;
  id v9 = v8;
  _os_activity_initiate(&dword_1B2FD8000, "SPUnknownDiscoverySession.startDiscoveryWithScanRate:timeout:completion:", OS_ACTIVITY_FLAG_DEFAULT, v10);
}

void __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke(uint64_t a1)
{
  v2 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession startDiscoveryWithScanRate:timeout:completion:]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke_77;
  v6[3] = &unk_1E601B8F8;
  int v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  uint64_t v8 = v4;
  uint64_t v9 = *(void *)(a1 + 56);
  id v7 = v5;
  dispatch_sync(v3, v6);
}

void __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke_77(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) proxy];
  double v3 = *(double *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke_2;
  v5[3] = &unk_1E601B800;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v2 startDiscoveryWithScanRate:v4 timeout:v5 completion:v3];
}

void __75__SPUnknownDiscoverySession_startDiscoveryWithScanRate_timeout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession startDiscoveryWithScanRate:timeout:completion:] completion. Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPUnknownDiscoverySession.stopDiscovery", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  v2 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession stopDiscoveryWithCompletion]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke_78;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, v5);
}

void __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke_78(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) proxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke_2;
  v3[3] = &unk_1E601B800;
  id v4 = *(id *)(a1 + 40);
  [v2 stopUnknownDiscoveryWithCompletion:v3];
}

void __57__SPUnknownDiscoverySession_stopDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession stopUnknownDiscoveryWithCompletion] completion. Error %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stop
{
  id v3 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "-[SPUnknownDiscoverySession stop]", buf, 2u);
  }

  id v4 = [(SPUnknownDiscoverySession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SPUnknownDiscoverySession_stop__block_invoke;
  block[3] = &unk_1E601B790;
  block[4] = self;
  dispatch_sync(v4, block);
}

uint64_t __33__SPUnknownDiscoverySession_stop__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setServiceDescription:0];
  [*(id *)(a1 + 32) setAccessoryDiscoveredCallback:0];
  [*(id *)(a1 + 32) setSessionInvalidatedCallback:0];
  v2 = [*(id *)(a1 + 32) session];
  [v2 invalidate];

  id v3 = *(void **)(a1 + 32);

  return [v3 setSession:0];
}

- (void)fetchEncryptedPayloadForUnknownBeacon:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "[SPUnknownDiscoverySession fetchEncryptedPayloadForUnknownBeacon]. Beacon %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v9 = [(SPUnknownDiscoverySession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SPUnknownDiscoverySession_fetchEncryptedPayloadForUnknownBeacon_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, (id *)buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __78__SPUnknownDiscoverySession_fetchEncryptedPayloadForUnknownBeacon_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 fetchEncryptedPayloadForUnknownBeacon:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)discoveredUnknownAccessory:(id)a3
{
  id v4 = a3;
  int v5 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "discoveredUnknownAccessory() called from daemon", buf, 2u);
  }

  id v6 = [(SPUnknownDiscoverySession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SPUnknownDiscoverySession_discoveredUnknownAccessory___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __56__SPUnknownDiscoverySession_discoveredUnknownAccessory___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 unknownAccessories];
  int v4 = [v3 containsObject:*(void *)(a1 + 40)];

  if (v4)
  {
    int v5 = LogCategory_UnknownDiscovery();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring known accessory %@.", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) state];
    uint64_t v8 = [v7 unknownAccessories];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) state];
      id v10 = [v9 unknownAccessories];
      id v11 = [v10 setByAddingObject:*(void *)(a1 + 40)];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    }
    int64_t v12 = [*(id *)(a1 + 32) callbackQueue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __56__SPUnknownDiscoverySession_discoveredUnknownAccessory___block_invoke_79;
    id v17 = &unk_1E601B920;
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = v11;
    int v5 = v11;
    dispatch_async(v12, &v14);

    id v13 = objc_msgSend(*(id *)(a1 + 32), "state", v14, v15, v16, v17, v18);
    [v13 setUnknownAccessories:v5];
  }
}

void __56__SPUnknownDiscoverySession_discoveredUnknownAccessory___block_invoke_79(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accessoryDiscoveredCallback];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)lostUnknownAccessory:(id)a3
{
  id v4 = a3;
  int v5 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "lostUnknownAccessory() called from daemon", buf, 2u);
  }

  uint64_t v6 = [(SPUnknownDiscoverySession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SPUnknownDiscoverySession_lostUnknownAccessory___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __50__SPUnknownDiscoverySession_lostUnknownAccessory___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 unknownAccessories];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObject:*(void *)(a1 + 40)];
  int v5 = [*(id *)(a1 + 32) state];
  uint64_t v6 = [v5 unknownAccessories];
  char v7 = [v6 isEqualToSet:v4];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = (void *)[v4 copy];
    id v9 = [*(id *)(a1 + 32) state];
    [v9 setUnknownAccessories:v8];

    id v10 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SPUnknownDiscoverySession_lostUnknownAccessory___block_invoke_2;
    block[3] = &unk_1E601B790;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v10, block);
  }
}

void __50__SPUnknownDiscoverySession_lostUnknownAccessory___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) accessoryDiscoveredCallback];
  v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 unknownAccessories];
  v4[2](v4, v3);
}

- (void)unknownAccessoryDiscoveryError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "[unknownAccessoryDiscoveryError called from client]. Error %@", buf, 0xCu);
  }

  uint64_t v6 = [(SPUnknownDiscoverySession *)self callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SPUnknownDiscoverySession_unknownAccessoryDiscoveryError___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __60__SPUnknownDiscoverySession_unknownAccessoryDiscoveryError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accessoryDiscoveryErrorCallback];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)unknownAccessoryDiscoveryFinished
{
  id v3 = LogCategory_UnknownDiscovery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "[unknownAccessoryDiscoveryFinished called from client].", buf, 2u);
  }

  id v4 = [(SPUnknownDiscoverySession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SPUnknownDiscoverySession_unknownAccessoryDiscoveryFinished__block_invoke;
  block[3] = &unk_1E601B790;
  void block[4] = self;
  dispatch_sync(v4, block);
}

void __62__SPUnknownDiscoverySession_unknownAccessoryDiscoveryFinished__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) accessoryDiscoveryFinishedCallback];
  v1[2]();
}

- (SPUnknownDiscoverySessionState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (id)sessionInvalidatedCallback
{
  return self->_sessionInvalidatedCallback;
}

- (void)setSessionInvalidatedCallback:(id)a3
{
}

- (id)accessoryDiscoveredCallback
{
  return self->_accessoryDiscoveredCallback;
}

- (void)setAccessoryDiscoveredCallback:(id)a3
{
}

- (id)accessoryDiscoveryErrorCallback
{
  return self->_accessoryDiscoveryErrorCallback;
}

- (void)setAccessoryDiscoveryErrorCallback:(id)a3
{
}

- (id)accessoryDiscoveryFinishedCallback
{
  return self->_accessoryDiscoveryFinishedCallback;
}

- (void)setAccessoryDiscoveryFinishedCallback:(id)a3
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
  objc_storeStrong(&self->_accessoryDiscoveryFinishedCallback, 0);
  objc_storeStrong(&self->_accessoryDiscoveryErrorCallback, 0);
  objc_storeStrong(&self->_accessoryDiscoveredCallback, 0);
  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end