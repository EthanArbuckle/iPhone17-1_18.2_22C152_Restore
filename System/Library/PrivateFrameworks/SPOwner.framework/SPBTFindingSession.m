@interface SPBTFindingSession
+ (id)exportedInterface;
+ (id)remoteInterface;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (NSUUID)beacon;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SPBTFindingSession)initWithConfig:(id)a3;
- (SPBTFindingSessionConfig)config;
- (SPBTFindingXPCProtocol)proxy;
- (id)didUpdateBTRSSIMeasurementCallback;
- (id)didUpdateBTRSSIResultCallback;
- (id)findingSessionErrorCallback;
- (id)sessionInvalidatedCallback;
- (void)findingSessionError:(id)a3;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)setBeacon:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDidUpdateBTRSSIMeasurementCallback:(id)a3;
- (void)setDidUpdateBTRSSIResultCallback:(id)a3;
- (void)setFindingSessionErrorCallback:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionInvalidatedCallback:(id)a3;
- (void)startFastAdvertisingForBeacon:(id)a3 completion:(id)a4;
- (void)startFindingBeacon:(id)a3 completion:(id)a4;
- (void)stopFastAdvertisingForBeacon:(id)a3 completion:(id)a4;
- (void)stopFindingBeacon:(id)a3 completion:(id)a4;
- (void)updateConfig:(id)a3;
- (void)updatedBTRSSIMeasurement:(id)a3;
- (void)updatedBTRSSIResult:(id)a3;
@end

@implementation SPBTFindingSession

- (SPBTFindingSession)initWithConfig:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = LogCategory_BTFinding();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: initWithConfig %@", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)SPBTFindingSession;
  v7 = [(SPBTFindingSession *)&v15 init];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBTFindingSession", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPBTFindingSession.callback", v11);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v7->_config, a3);
    [(SPBTFindingSession *)v7 updateConfig:v5];
  }

  return v7;
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_BTFinding();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: interruptionHandler %@", buf, 0xCu);
  }

  v6 = [(SPBTFindingSession *)self sessionInvalidatedCallback];

  if (v6)
  {
    v7 = [(SPBTFindingSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__SPBTFindingSession_interruptionHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __42__SPBTFindingSession_interruptionHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sessionInvalidatedCallback];
  v1[2]();
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_BTFinding();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: invalidationHandler %@", buf, 0xCu);
  }

  [(SPBTFindingSession *)self setSession:0];
  v6 = [(SPBTFindingSession *)self sessionInvalidatedCallback];

  if (v6)
  {
    v7 = [(SPBTFindingSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__SPBTFindingSession_invalidationHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __42__SPBTFindingSession_invalidationHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sessionInvalidatedCallback];
  v1[2]();
}

- (SPBTFindingXPCProtocol)proxy
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v3 = [(SPBTFindingSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SPBTFindingSession *)self session];

  if (!v4)
  {
    id v5 = [(SPBTFindingSession *)self serviceDescription];

    if (!v5)
    {
      objc_initWeak(location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __27__SPBTFindingSession_proxy__block_invoke;
      aBlock[3] = &unk_1E601B7B8;
      objc_copyWeak(&v28, location);
      v6 = _Block_copy(aBlock);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __27__SPBTFindingSession_proxy__block_invoke_2;
      v25[3] = &unk_1E601B7B8;
      objc_copyWeak(&v26, location);
      v7 = _Block_copy(v25);
      id v8 = objc_alloc(MEMORY[0x1E4F61588]);
      dispatch_queue_t v9 = +[SPBTFindingSession exportedInterface];
      id v10 = +[SPBTFindingSession remoteInterface];
      uint64_t v11 = (void *)[v8 initWithMachServiceName:@"com.apple.searchparty.btfindingsession" options:0 exportedObject:self exportedInterface:v9 remoteObjectInterface:v10 interruptionHandler:v6 invalidationHandler:v7];
      [(SPBTFindingSession *)self setServiceDescription:v11];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(location);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F61590]);
    v13 = [(SPBTFindingSession *)self serviceDescription];
    v14 = (void *)[v12 initWithServiceDescription:v13];
    [(SPBTFindingSession *)self setSession:v14];

    objc_super v15 = LogCategory_BTFinding();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(SPBTFindingSession *)self serviceDescription];
      id v17 = [v16 machService];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v17;
      _os_log_impl(&dword_1B2FD8000, v15, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: Establishing XPC connection to %@", (uint8_t *)location, 0xCu);
    }
    uint64_t v18 = [(SPBTFindingSession *)self session];
    [v18 resume];

    v19 = LogCategory_BTFinding();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(SPBTFindingSession *)self serviceDescription];
      v21 = [v20 machService];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v21;
      _os_log_impl(&dword_1B2FD8000, v19, OS_LOG_TYPE_DEFAULT, "SPBTFindingSession: Established XPC connection to %@", (uint8_t *)location, 0xCu);
    }
  }
  v22 = [(SPBTFindingSession *)self session];
  v23 = [v22 proxy];

  return (SPBTFindingXPCProtocol *)v23;
}

void __27__SPBTFindingSession_proxy__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained interruptionHandler:v3];
}

void __27__SPBTFindingSession_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained invalidationHandler:v3];
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_4 != -1) {
    dispatch_once(&exportedInterface_onceToken_4, &__block_literal_global_8);
  }
  v2 = (void *)exportedInterface_interface_4;

  return v2;
}

uint64_t __39__SPBTFindingSession_exportedInterface__block_invoke()
{
  exportedInterface_interface_4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B398D0];

  return MEMORY[0x1F41817F8]();
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_5 != -1) {
    dispatch_once(&remoteInterface_onceToken_5, &__block_literal_global_60);
  }
  v2 = (void *)remoteInterface_interface_4;

  return v2;
}

uint64_t __37__SPBTFindingSession_remoteInterface__block_invoke()
{
  remoteInterface_interface_4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B441D0];

  return MEMORY[0x1F41817F8]();
}

- (void)updateConfig:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SPBTFindingSession_updateConfig___block_invoke;
  v6[3] = &unk_1E601B920;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPBTFindingSession.updateConfig", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __35__SPBTFindingSession_updateConfig___block_invoke(uint64_t a1)
{
  v2 = LogCategory_BTFinding();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession updateConfig]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SPBTFindingSession_updateConfig___block_invoke_70;
  v5[3] = &unk_1E601B920;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, v5);
}

void __35__SPBTFindingSession_updateConfig___block_invoke_70(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 updateConfig:*(void *)(a1 + 40) completion:&__block_literal_global_73];
}

void __35__SPBTFindingSession_updateConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = LogCategory_BTFinding();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __35__SPBTFindingSession_updateConfig___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession updateConfig] completion", v5, 2u);
  }
}

- (void)startFindingBeacon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBTFindingSession.start", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke(uint64_t a1)
{
  id v2 = LogCategory_BTFinding();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession start]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_74;
  block[3] = &unk_1E601B878;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);
}

void __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E601B800;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 start:v3 completion:v4];
}

void __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_BTFinding();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession start] completion", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startFastAdvertisingForBeacon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBTFindingSession.startFastAdvertising", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke(uint64_t a1)
{
  id v2 = LogCategory_BTFinding();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession startFastAdvertising]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_75;
  block[3] = &unk_1E601B878;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);
}

void __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_75(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E601B800;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 startFastAdvertisingForBeacon:v3 completion:v4];
}

void __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_BTFinding();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession startFastAdvertising] completion", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopFastAdvertisingForBeacon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBTFindingSession.stopFastAdvertising", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke(uint64_t a1)
{
  id v2 = LogCategory_BTFinding();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession stopFastAdvertising]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_76;
  block[3] = &unk_1E601B878;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);
}

void __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_76(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E601B800;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 stopFastAdvertisingForBeacon:v3 completion:v4];
}

void __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_BTFinding();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession stopFastAdvertising] completion", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopFindingBeacon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  activity_block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPBTFindingSession.stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke(uint64_t a1)
{
  id v2 = LogCategory_BTFinding();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession stop]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_77;
  block[3] = &unk_1E601B878;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);
}

void __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_77(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E601B800;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 stop:v3 completion:v4];
}

void __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_BTFinding();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPBTFindingSession stop] completion)", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatedBTRSSIMeasurement:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_BTFinding();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "updatedBTRSSIMeasurement() called from daemon", buf, 2u);
  }

  id v6 = [(SPBTFindingSession *)self callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__SPBTFindingSession_updatedBTRSSIMeasurement___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __47__SPBTFindingSession_updatedBTRSSIMeasurement___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) didUpdateBTRSSIMeasurementCallback];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)updatedBTRSSIResult:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_BTFinding();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "updatedBTRSSIResult() called from daemon", buf, 2u);
  }

  id v6 = [(SPBTFindingSession *)self callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SPBTFindingSession_updatedBTRSSIResult___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __42__SPBTFindingSession_updatedBTRSSIResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) didUpdateBTRSSIResultCallback];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)findingSessionError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_BTFinding();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "[findingSessionError called from client]. Error %{public}@", buf, 0xCu);
  }

  id v6 = [(SPBTFindingSession *)self callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SPBTFindingSession_findingSessionError___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __42__SPBTFindingSession_findingSessionError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) findingSessionErrorCallback];
  v2[2](v2, *(void *)(a1 + 40));
}

- (SPBTFindingSessionConfig)config
{
  return self->_config;
}

- (id)sessionInvalidatedCallback
{
  return self->_sessionInvalidatedCallback;
}

- (void)setSessionInvalidatedCallback:(id)a3
{
}

- (id)didUpdateBTRSSIMeasurementCallback
{
  return self->_didUpdateBTRSSIMeasurementCallback;
}

- (void)setDidUpdateBTRSSIMeasurementCallback:(id)a3
{
}

- (id)didUpdateBTRSSIResultCallback
{
  return self->_didUpdateBTRSSIResultCallback;
}

- (void)setDidUpdateBTRSSIResultCallback:(id)a3
{
}

- (id)findingSessionErrorCallback
{
  return self->_findingSessionErrorCallback;
}

- (void)setFindingSessionErrorCallback:(id)a3
{
}

- (NSUUID)beacon
{
  return self->_beacon;
}

- (void)setBeacon:(id)a3
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
  objc_storeStrong((id *)&self->_beacon, 0);
  objc_storeStrong(&self->_findingSessionErrorCallback, 0);
  objc_storeStrong(&self->_didUpdateBTRSSIResultCallback, 0);
  objc_storeStrong(&self->_didUpdateBTRSSIMeasurementCallback, 0);
  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

void __35__SPBTFindingSession_updateConfig___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPBTFindingSession updateConfig] completion. Error %{public}@", v2, v3, v4, v5, v6);
}

void __52__SPBTFindingSession_startFindingBeacon_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPBTFindingSession start] completion. Error %{public}@", v2, v3, v4, v5, v6);
}

void __63__SPBTFindingSession_startFastAdvertisingForBeacon_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPBTFindingSession startFastAdvertising] completion. Error %{public}@", v2, v3, v4, v5, v6);
}

void __62__SPBTFindingSession_stopFastAdvertisingForBeacon_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPBTFindingSession stopFastAdvertising] completion. Error %{public}@", v2, v3, v4, v5, v6);
}

void __51__SPBTFindingSession_stopFindingBeacon_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPBTFindingSession stop] completion. Error %{public}@", v2, v3, v4, v5, v6);
}

@end