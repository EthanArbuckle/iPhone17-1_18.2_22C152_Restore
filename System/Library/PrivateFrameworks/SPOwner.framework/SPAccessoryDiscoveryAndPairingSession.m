@interface SPAccessoryDiscoveryAndPairingSession
+ (id)exportedInterface;
+ (id)remoteInterface;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SPAccessoryDiscoveryAndPairingSession)init;
- (SPAccessoryDiscoveryAndPairingSession)initWithPreviousState:(id)a3;
- (SPAccessoryDiscoverySessionState)state;
- (SPAccessoryDiscoveryXPCProtocol)proxy;
- (id)accessoryDiscoveredCallback;
- (id)accessoryDiscoveryErrorCallback;
- (id)sessionInvalidatedCallback;
- (void)accessoryDiscoveryError:(id)a3;
- (void)disableFindMyPairingWithIdentifier:(id)a3;
- (void)discoveredAccessory:(id)a3;
- (void)finalizePairingWith:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)initiatePairingAndLocateAccessoryWith:(id)a3 completion:(id)a4;
- (void)initiatePairingForAccessoryWith:(id)a3 completion:(id)a4;
- (void)initiatePairingWith:(id)a3 completion:(id)a4;
- (void)interruptionHandler:(id)a3;
- (void)invalidatePairingWith:(id)a3 completion:(id)a4;
- (void)invalidationHandler:(id)a3;
- (void)lostAccessory:(id)a3;
- (void)pairingStatus:(id)a3 completion:(id)a4;
- (void)pairingStatusWithRequest:(id)a3 completion:(id)a4;
- (void)setAccessoryDiscoveredCallback:(id)a3;
- (void)setAccessoryDiscoveryErrorCallback:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionInvalidatedCallback:(id)a3;
- (void)setState:(id)a3;
- (void)startAccessoryDiscoveryWithCompletion:(id)a3;
- (void)startLocalFindableAccessoryDiscoveryWithCompletion:(id)a3;
- (void)stop;
- (void)stopAccessoryDiscoveryWithCompletion:(id)a3;
- (void)stopLocalFindableAccessoryDiscoveryWithCompletion:(id)a3;
@end

@implementation SPAccessoryDiscoveryAndPairingSession

- (SPAccessoryDiscoveryAndPairingSession)init
{
  return [(SPAccessoryDiscoveryAndPairingSession *)self initWithPreviousState:0];
}

- (SPAccessoryDiscoveryAndPairingSession)initWithPreviousState:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SPAccessoryDiscoveryAndPairingSession;
  v5 = [(SPAccessoryDiscoveryAndPairingSession *)&v18 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPAccessoryDiscoverySession", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPAccessoryDiscoverySession.callback", v9);
    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = (OS_dispatch_queue *)v10;

    if (v4)
    {
      v12 = (SPAccessoryDiscoverySessionState *)v4;
      state = v5->_state;
      v5->_state = v12;
    }
    else
    {
      v14 = [SPAccessoryDiscoverySessionState alloc];
      state = (SPAccessoryDiscoverySessionState *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      uint64_t v15 = [(SPAccessoryDiscoverySessionState *)v14 initWithAccessories:state];
      v16 = v5->_state;
      v5->_state = (SPAccessoryDiscoverySessionState *)v15;
    }
  }

  return v5;
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
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPAccessoryDiscoverySession: interruptionHandler %@", buf, 0xCu);
  }

  v6 = [(SPAccessoryDiscoveryAndPairingSession *)self sessionInvalidatedCallback];

  if (v6)
  {
    dispatch_queue_t v7 = [(SPAccessoryDiscoveryAndPairingSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SPAccessoryDiscoveryAndPairingSession_interruptionHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __61__SPAccessoryDiscoveryAndPairingSession_interruptionHandler___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPAccessoryDiscoverySession: invalidationHandler %@", buf, 0xCu);
  }

  [(SPAccessoryDiscoveryAndPairingSession *)self setSession:0];
  v6 = [(SPAccessoryDiscoveryAndPairingSession *)self sessionInvalidatedCallback];

  if (v6)
  {
    dispatch_queue_t v7 = [(SPAccessoryDiscoveryAndPairingSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SPAccessoryDiscoveryAndPairingSession_invalidationHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __61__SPAccessoryDiscoveryAndPairingSession_invalidationHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sessionInvalidatedCallback];
  v1[2]();
}

- (SPAccessoryDiscoveryXPCProtocol)proxy
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v3 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SPAccessoryDiscoveryAndPairingSession *)self session];

  if (!v4)
  {
    v5 = [(SPAccessoryDiscoveryAndPairingSession *)self serviceDescription];

    if (!v5)
    {
      objc_initWeak(location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__SPAccessoryDiscoveryAndPairingSession_proxy__block_invoke;
      aBlock[3] = &unk_1E601B7B8;
      objc_copyWeak(&v25, location);
      v6 = _Block_copy(aBlock);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __46__SPAccessoryDiscoveryAndPairingSession_proxy__block_invoke_2;
      v22[3] = &unk_1E601B7B8;
      objc_copyWeak(&v23, location);
      dispatch_queue_t v7 = _Block_copy(v22);
      id v8 = objc_alloc(MEMORY[0x1E4F61588]);
      v9 = +[SPAccessoryDiscoveryAndPairingSession exportedInterface];
      id v10 = +[SPAccessoryDiscoveryAndPairingSession remoteInterface];
      uint64_t v11 = (void *)[v8 initWithMachServiceName:@"com.apple.icloud.searchpartyd.accessorydiscoverysession" options:0 exportedObject:self exportedInterface:v9 remoteObjectInterface:v10 interruptionHandler:v6 invalidationHandler:v7];
      [(SPAccessoryDiscoveryAndPairingSession *)self setServiceDescription:v11];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(location);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F61590]);
    v13 = [(SPAccessoryDiscoveryAndPairingSession *)self serviceDescription];
    v14 = (void *)[v12 initWithServiceDescription:v13];
    [(SPAccessoryDiscoveryAndPairingSession *)self setSession:v14];

    uint64_t v15 = LogCategory_AccessoryDiscovery();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(SPAccessoryDiscoveryAndPairingSession *)self serviceDescription];
      v17 = [v16 machService];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v17;
      _os_log_impl(&dword_1B2FD8000, v15, OS_LOG_TYPE_DEFAULT, "SPAccessoryDiscoverySession: Establishing XPC connection to %@", (uint8_t *)location, 0xCu);
    }
    objc_super v18 = [(SPAccessoryDiscoveryAndPairingSession *)self session];
    [v18 resume];
  }
  v19 = [(SPAccessoryDiscoveryAndPairingSession *)self session];
  v20 = [v19 proxy];

  return (SPAccessoryDiscoveryXPCProtocol *)v20;
}

void __46__SPAccessoryDiscoveryAndPairingSession_proxy__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained interruptionHandler:v3];
}

void __46__SPAccessoryDiscoveryAndPairingSession_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained invalidationHandler:v3];
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_8 != -1) {
    dispatch_once(&exportedInterface_onceToken_8, &__block_literal_global_17);
  }
  v2 = (void *)exportedInterface_interface_8;

  return v2;
}

uint64_t __58__SPAccessoryDiscoveryAndPairingSession_exportedInterface__block_invoke()
{
  exportedInterface_interface_8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B40718];

  return MEMORY[0x1F41817F8]();
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_10 != -1) {
    dispatch_once(&remoteInterface_onceToken_10, &__block_literal_global_154);
  }
  v2 = (void *)remoteInterface_interface_9;

  return v2;
}

uint64_t __56__SPAccessoryDiscoveryAndPairingSession_remoteInterface__block_invoke()
{
  remoteInterface_interface_9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B442F0];

  return MEMORY[0x1F41817F8]();
}

- (void)startAccessoryDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPAccessoryDiscoverySession.start", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  v2 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession start]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_175;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, v5);
}

void __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_175(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  id v3 = [*(id *)(a1 + 32) state];
  [v3 setAccessories:v2];

  id v4 = [*(id *)(a1 + 32) proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_2;
  v5[3] = &unk_1E601B800;
  id v6 = *(id *)(a1 + 40);
  [v4 startAccessoryDiscoveryWithCompletion:v5];
}

void __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_AccessoryDiscovery();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession start] completion", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stop
{
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __45__SPAccessoryDiscoveryAndPairingSession_stop__block_invoke;
  activity_block[3] = &unk_1E601B790;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1B2FD8000, "SPAccessoryDiscoverySession.stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __45__SPAccessoryDiscoveryAndPairingSession_stop__block_invoke(uint64_t a1)
{
  id v2 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stop]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SPAccessoryDiscoveryAndPairingSession_stop__block_invoke_177;
  block[3] = &unk_1E601B790;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

uint64_t __45__SPAccessoryDiscoveryAndPairingSession_stop__block_invoke_177(uint64_t a1)
{
  [*(id *)(a1 + 32) setServiceDescription:0];
  [*(id *)(a1 + 32) setAccessoryDiscoveredCallback:0];
  [*(id *)(a1 + 32) setSessionInvalidatedCallback:0];
  id v2 = [*(id *)(a1 + 32) session];
  [v2 invalidate];

  id v3 = *(void **)(a1 + 32);

  return [v3 setSession:0];
}

- (void)stopAccessoryDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPAccessoryDiscoverySession.stopAccessoryDiscovery", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stopAccessoryDiscovery]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_178;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, v5);
}

void __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_178(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_2;
  v3[3] = &unk_1E601B800;
  id v4 = *(id *)(a1 + 40);
  [v2 stopAccessoryDiscoveryWithCompletion:v3];
}

void __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_AccessoryDiscovery();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stopAccessoryDiscovery] completion)", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)discoveredAccessory:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "discoveredAccessory() called from daemon", buf, 2u);
  }

  id v6 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SPAccessoryDiscoveryAndPairingSession_discoveredAccessory___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __61__SPAccessoryDiscoveryAndPairingSession_discoveredAccessory___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 accessories];
  int v4 = [v3 containsObject:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = LogCategory_AccessoryDiscovery();
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
    id v8 = [v7 accessories];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) state];
      id v10 = [v9 accessories];
      uint64_t v11 = [v10 setByAddingObject:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    }
    id v12 = [*(id *)(a1 + 32) callbackQueue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __61__SPAccessoryDiscoveryAndPairingSession_discoveredAccessory___block_invoke_179;
    v17 = &unk_1E601B920;
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = v11;
    id v5 = v11;
    dispatch_async(v12, &v14);

    v13 = objc_msgSend(*(id *)(a1 + 32), "state", v14, v15, v16, v17, v18);
    [v13 setAccessories:v5];
  }
}

void __61__SPAccessoryDiscoveryAndPairingSession_discoveredAccessory___block_invoke_179(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessoryDiscoveredCallback];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)lostAccessory:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "lostAccessory() called from daemon", buf, 2u);
  }

  uint64_t v6 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SPAccessoryDiscoveryAndPairingSession_lostAccessory___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __55__SPAccessoryDiscoveryAndPairingSession_lostAccessory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 accessories];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObject:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) state];
  uint64_t v6 = [v5 accessories];
  char v7 = [v6 isEqualToSet:v4];

  if ((v7 & 1) == 0)
  {
    id v8 = (void *)[v4 copy];
    id v9 = [*(id *)(a1 + 32) state];
    [v9 setAccessories:v8];

    id v10 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__SPAccessoryDiscoveryAndPairingSession_lostAccessory___block_invoke_2;
    block[3] = &unk_1E601B790;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v10, block);
  }
}

void __55__SPAccessoryDiscoveryAndPairingSession_lostAccessory___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) accessoryDiscoveredCallback];
  id v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 accessories];
  v4[2](v4, v3);
}

- (void)accessoryDiscoveryError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "[accessoryDiscoveryError called from client]. Error %@", buf, 0xCu);
  }

  uint64_t v6 = [(SPAccessoryDiscoveryAndPairingSession *)self callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SPAccessoryDiscoveryAndPairingSession_accessoryDiscoveryError___block_invoke;
  v8[3] = &unk_1E601B920;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __65__SPAccessoryDiscoveryAndPairingSession_accessoryDiscoveryError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessoryDiscoveryErrorCallback];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)initiatePairingWith:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryDiscoverySession initiatePairingWith]. Accessory %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SPAccessoryDiscoveryAndPairingSession_initiatePairingWith_completion___block_invoke;
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

void __72__SPAccessoryDiscoveryAndPairingSession_initiatePairingWith_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained proxy];
  [v2 initiatePairingWith:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)startLocalFindableAccessoryDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPAccessoryDiscoverySession.start", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession start]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_180;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, v5);
}

void __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_180(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  id v3 = [*(id *)(a1 + 32) state];
  [v3 setAccessories:v2];

  id v4 = [*(id *)(a1 + 32) proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2;
  v5[3] = &unk_1E601B800;
  id v6 = *(id *)(a1 + 40);
  [v4 startLocalFindableAccessoryDiscoveryWithCompletion:v5];
}

void __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_AccessoryDiscovery();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession startLocalFindableAccessoryDiscoveryWithCompletion] completion", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopLocalFindableAccessoryDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPAccessoryDiscoverySession.stopAccessoryDiscovery", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stopAccessoryDiscovery]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_181;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, v5);
}

void __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_181(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2;
  v3[3] = &unk_1E601B800;
  id v4 = *(id *)(a1 + 40);
  [v2 stopLocalFindableAccessoryDiscoveryWithCompletion:v3];
}

void __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_AccessoryDiscovery();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryDiscoverySession stopLocalFindableAccessoryDiscoveryWithCompletion] completion)", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableFindMyPairingWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "[SPAccessoryDiscoverySession disableFindMyPairingWithCompletion]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v6 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__SPAccessoryDiscoveryAndPairingSession_disableFindMyPairingWithIdentifier___block_invoke;
  v8[3] = &unk_1E601BB38;
  objc_copyWeak(&v10, buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __76__SPAccessoryDiscoveryAndPairingSession_disableFindMyPairingWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained proxy];
  [v2 disableFindMyPairingWithIdentifier:*(void *)(a1 + 32)];
}

- (void)initiatePairingForAccessoryWith:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryPairingSession initiatePairingForAccessoryWith:completion:]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v9 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2;
  v5[3] = &unk_1E601D340;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 initiatePairingAndLocateAccessoryWithIdentifier:v4 completion:v5];
}

void __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogCategory_AccessoryDiscovery();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryPairingSession initiatePairingForAccessoryWith] succeeded!", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initiatePairingAndLocateAccessoryWith:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryPairingSession initiatePairingAndLocateAccessoryWith:completion:]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v9 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__SPAccessoryDiscoveryAndPairingSession_initiatePairingAndLocateAccessoryWith_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __90__SPAccessoryDiscoveryAndPairingSession_initiatePairingAndLocateAccessoryWith_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__SPAccessoryDiscoveryAndPairingSession_initiatePairingAndLocateAccessoryWith_completion___block_invoke_2;
  v5[3] = &unk_1E601D340;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 initiatePairingAndLocateAccessoryWithIdentifier:v4 completion:v5];
}

void __90__SPAccessoryDiscoveryAndPairingSession_initiatePairingAndLocateAccessoryWith_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_AccessoryDiscovery();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "-[SPAccessoryPairingSession initiatePairingForAccessoryWith] succeeded!", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pairingStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryPairingSession pairingStatus:completion:]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v9 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SPAccessoryDiscoveryAndPairingSession_pairingStatus_completion___block_invoke;
  block[3] = &unk_1E601C400;
  id v13 = v6;
  id v10 = v6;
  objc_copyWeak(&v15, buf);
  id v14 = v7;
  id v11 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __66__SPAccessoryDiscoveryAndPairingSession_pairingStatus_completion___block_invoke(uint64_t a1)
{
  id v2 = [[SPAccessoryDiscoveryPairingStatusRequest alloc] initWithIdentifier:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained proxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SPAccessoryDiscoveryAndPairingSession_pairingStatus_completion___block_invoke_2;
  v5[3] = &unk_1E601D368;
  id v6 = *(id *)(a1 + 40);
  [v4 pairingStatusWithRequest:v2 completion:v5];
}

void __66__SPAccessoryDiscoveryAndPairingSession_pairingStatus_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, [a2 pairingStatus], v5);
  }
}

- (void)pairingStatusWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryPairingSession pairingStatusWithRequest:completion:]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v9 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SPAccessoryDiscoveryAndPairingSession_pairingStatusWithRequest_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __77__SPAccessoryDiscoveryAndPairingSession_pairingStatusWithRequest_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained proxy];
  [v2 pairingStatusWithRequest:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)finalizePairingWith:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "[SPAccessoryDiscoverySession finalizePairingWith]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  uint64_t v12 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__SPAccessoryDiscoveryAndPairingSession_finalizePairingWith_configuration_completion___block_invoke;
  v16[3] = &unk_1E601C6B8;
  objc_copyWeak(&v20, buf);
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);
}

void __86__SPAccessoryDiscoveryAndPairingSession_finalizePairingWith_configuration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = [WeakRetained proxy];
  [v2 finalizePairingWith:*(void *)(a1 + 32) configuration:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)invalidatePairingWith:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_AccessoryDiscovery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "[SPAccessoryDiscoverySession invalidatePairingWith]", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v9 = [(SPAccessoryDiscoveryAndPairingSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SPAccessoryDiscoveryAndPairingSession_invalidatePairingWith_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v15, buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

void __74__SPAccessoryDiscoveryAndPairingSession_invalidatePairingWith_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained proxy];
  [v2 invalidatePairingWith:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (SPAccessoryDiscoverySessionState)state
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
  objc_storeStrong(&self->_accessoryDiscoveryErrorCallback, 0);
  objc_storeStrong(&self->_accessoryDiscoveredCallback, 0);
  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

void __79__SPAccessoryDiscoveryAndPairingSession_startAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPAccessoryDiscoverySession start] completion. Error %@", v2, v3, v4, v5, v6);
}

void __78__SPAccessoryDiscoveryAndPairingSession_stopAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPAccessoryDiscoverySession stopAccessoryDiscovery] completion. Error %@", v2, v3, v4, v5, v6);
}

void __92__SPAccessoryDiscoveryAndPairingSession_startLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPAccessoryDiscoverySession startLocalFindableAccessoryDiscoveryWithCompletion] completion. Error %@", v2, v3, v4, v5, v6);
}

void __91__SPAccessoryDiscoveryAndPairingSession_stopLocalFindableAccessoryDiscoveryWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPAccessoryDiscoverySession stopLocalFindableAccessoryDiscoveryWithCompletion] completion. Error %@", v2, v3, v4, v5, v6);
}

void __84__SPAccessoryDiscoveryAndPairingSession_initiatePairingForAccessoryWith_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "-[SPAccessoryPairingSession initiatePairingForAccessoryWith] failed %@", v2, v3, v4, v5, v6);
}

@end