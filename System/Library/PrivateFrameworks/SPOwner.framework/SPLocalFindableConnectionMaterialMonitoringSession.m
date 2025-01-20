@interface SPLocalFindableConnectionMaterialMonitoringSession
+ (id)exportedInterface;
+ (id)remoteInterface;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SPLocalFindableConnectionMaterialMonitoringSession)init;
- (SPLocalFindableConnectionMaterialMonitoringXPCProtocol)proxy;
- (id)peripheralConnectionMaterialCallback;
- (id)sessionInvalidatedCallback;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)setPeripheralConnectionMaterialCallback:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionInvalidatedCallback:(id)a3;
- (void)startLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3;
- (void)stopLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3;
- (void)updatedConnectionMaterialForAccessory:(id)a3 connectionMaterial:(id)a4;
@end

@implementation SPLocalFindableConnectionMaterialMonitoringSession

- (SPLocalFindableConnectionMaterialMonitoringSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)SPLocalFindableConnectionMaterialMonitoringSession;
  v2 = [(SPLocalFindableConnectionMaterialMonitoringSession *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPLocalFindableConnectionMaterialMonitoringSession", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPLocalFindableConnectionMaterialMonitoringSession.callback", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_LocalFindableConnectionMaterialMonitoring();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPLocalFindableConnectionMaterialMonitoring: interruptionHandler %@", buf, 0xCu);
  }

  v6 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self sessionInvalidatedCallback];

  if (v6)
  {
    dispatch_queue_t v7 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__SPLocalFindableConnectionMaterialMonitoringSession_interruptionHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __74__SPLocalFindableConnectionMaterialMonitoringSession_interruptionHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sessionInvalidatedCallback];
  v1[2]();
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_LocalFindableConnectionMaterialMonitoring();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPLocalFindableConnectionMaterialMonitoring: invalidationHandler %@", buf, 0xCu);
  }

  [(SPLocalFindableConnectionMaterialMonitoringSession *)self setSession:0];
  v6 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self sessionInvalidatedCallback];

  if (v6)
  {
    dispatch_queue_t v7 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__SPLocalFindableConnectionMaterialMonitoringSession_invalidationHandler___block_invoke;
    block[3] = &unk_1E601B790;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

void __74__SPLocalFindableConnectionMaterialMonitoringSession_invalidationHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sessionInvalidatedCallback];
  v1[2]();
}

- (SPLocalFindableConnectionMaterialMonitoringXPCProtocol)proxy
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v3 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self session];

  if (!v4)
  {
    v5 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self serviceDescription];

    if (!v5)
    {
      objc_initWeak(location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__SPLocalFindableConnectionMaterialMonitoringSession_proxy__block_invoke;
      aBlock[3] = &unk_1E601B7B8;
      objc_copyWeak(&v25, location);
      v6 = _Block_copy(aBlock);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__SPLocalFindableConnectionMaterialMonitoringSession_proxy__block_invoke_2;
      v22[3] = &unk_1E601B7B8;
      objc_copyWeak(&v23, location);
      dispatch_queue_t v7 = _Block_copy(v22);
      id v8 = objc_alloc(MEMORY[0x1E4F61588]);
      v9 = +[SPLocalFindableConnectionMaterialMonitoringSession exportedInterface];
      id v10 = +[SPLocalFindableConnectionMaterialMonitoringSession remoteInterface];
      uint64_t v11 = (void *)[v8 initWithMachServiceName:@"com.apple.icloud.searchpartyd.localFindableConnectionMaterialSession" options:0 exportedObject:self exportedInterface:v9 remoteObjectInterface:v10 interruptionHandler:v6 invalidationHandler:v7];
      [(SPLocalFindableConnectionMaterialMonitoringSession *)self setServiceDescription:v11];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(location);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F61590]);
    v13 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self serviceDescription];
    v14 = (void *)[v12 initWithServiceDescription:v13];
    [(SPLocalFindableConnectionMaterialMonitoringSession *)self setSession:v14];

    v15 = LogCategory_LocalFindableConnectionMaterialMonitoring();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self serviceDescription];
      v17 = [v16 machService];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v17;
      _os_log_impl(&dword_1B2FD8000, v15, OS_LOG_TYPE_DEFAULT, "SPLocalFindableConnectionMaterialMonitoring: Establishing XPC connection to %@", (uint8_t *)location, 0xCu);
    }
    v18 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self session];
    [v18 resume];
  }
  v19 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self session];
  v20 = [v19 proxy];

  return (SPLocalFindableConnectionMaterialMonitoringXPCProtocol *)v20;
}

void __59__SPLocalFindableConnectionMaterialMonitoringSession_proxy__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained interruptionHandler:v3];
}

void __59__SPLocalFindableConnectionMaterialMonitoringSession_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained invalidationHandler:v3];
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken != -1) {
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global);
  }
  v2 = (void *)exportedInterface_interface;

  return v2;
}

uint64_t __71__SPLocalFindableConnectionMaterialMonitoringSession_exportedInterface__block_invoke()
{
  exportedInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B33C50];

  return MEMORY[0x1F41817F8]();
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken != -1) {
    dispatch_once(&remoteInterface_onceToken, &__block_literal_global_56);
  }
  v2 = (void *)remoteInterface_interface;

  return v2;
}

uint64_t __69__SPLocalFindableConnectionMaterialMonitoringSession_remoteInterface__block_invoke()
{
  remoteInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B43F30];

  return MEMORY[0x1F41817F8]();
}

- (void)startLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalFindableConnectionMaterialMonitoringSession.start", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke(uint64_t a1)
{
  v2 = LogCategory_LocalFindableConnectionMaterialMonitoring();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPLocalFindableConnectionMaterialMonitoringSession start]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_65;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, v5);
}

void __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_65(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) proxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2;
  v3[3] = &unk_1E601B800;
  id v4 = *(id *)(a1 + 40);
  [v2 startLocalFindableConnectionMaterialMonitoringWithCompletion:v3];
}

void __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_LocalFindableConnectionMaterialMonitoring();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPLocalFindableConnectionMaterialMonitoringSession start] completion", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke;
  v6[3] = &unk_1E601B828;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalFindableConnectionMaterialMonitoringSession.stop", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke(uint64_t a1)
{
  v2 = LogCategory_LocalFindableConnectionMaterialMonitoring();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "-[SPLocalFindableConnectionMaterialMonitoringSession stop]", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_67;
  v5[3] = &unk_1E601B828;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, v5);
}

void __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_67(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) proxy];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2;
  v3[3] = &unk_1E601B800;
  id v4 = *(id *)(a1 + 40);
  [v2 stopLocalFindableConnectionMaterialMonitoringWithCompletion:v3];
}

void __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_LocalFindableConnectionMaterialMonitoring();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "-[SPLocalFindableConnectionMaterialMonitoringSession stop] completion", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __116__SPLocalFindableConnectionMaterialMonitoringSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E601B878;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPLocalFindableConnectionMaterialMonitoringSession.peripheralConnectionMaterialForAccessoryIdentifier", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __116__SPLocalFindableConnectionMaterialMonitoringSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_OwnerSession();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] UUIDString];
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "peripheralConnectionMaterial for %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, a1[5]);
  id v4 = [a1[5] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__SPLocalFindableConnectionMaterialMonitoringSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke_68;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v8, (id *)buf);
  id v6 = a1[4];
  id v7 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __116__SPLocalFindableConnectionMaterialMonitoringSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke_68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 peripheralConnectionMaterialForAccessoryIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)updatedConnectionMaterialForAccessory:(id)a3 connectionMaterial:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SPLocalFindableConnectionMaterialMonitoringSession *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__SPLocalFindableConnectionMaterialMonitoringSession_updatedConnectionMaterialForAccessory_connectionMaterial___block_invoke;
  block[3] = &unk_1E601B8A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __111__SPLocalFindableConnectionMaterialMonitoringSession_updatedConnectionMaterialForAccessory_connectionMaterial___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) peripheralConnectionMaterialCallback];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)sessionInvalidatedCallback
{
  return self->_sessionInvalidatedCallback;
}

- (void)setSessionInvalidatedCallback:(id)a3
{
}

- (id)peripheralConnectionMaterialCallback
{
  return self->_peripheralConnectionMaterialCallback;
}

- (void)setPeripheralConnectionMaterialCallback:(id)a3
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
  objc_storeStrong(&self->_peripheralConnectionMaterialCallback, 0);

  objc_storeStrong(&self->_sessionInvalidatedCallback, 0);
}

void __115__SPLocalFindableConnectionMaterialMonitoringSession_startLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "-[SPLocalFindableConnectionMaterialMonitoringSession start] completion. Error - %@", (uint8_t *)&v2, 0xCu);
}

void __114__SPLocalFindableConnectionMaterialMonitoringSession_stopLocalFindableConnectionMaterialMonitoringWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "-[SPLocalFindableConnectionMaterialMonitoringSession stop] completion. Error - %@", (uint8_t *)&v2, 0xCu);
}

@end