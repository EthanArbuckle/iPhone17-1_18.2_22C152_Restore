@interface PSYInitialSyncStateObserver
- (PSYInitialSyncStateObserver)init;
- (PSYInitialSyncStateObserver)initWithDelegate:(id)a3;
- (PSYInitialSyncStateObserverDelegate)delegate;
- (id)syncProviderWithErrorHandler:(id)a3;
- (void)_handleConnectionInvalidated;
- (void)_queue_initializeIfNotInitialized;
- (void)_queue_notifyCanRetryFailedRequests;
- (void)_queue_querySyncState;
- (void)_queue_updateSyncStates:(id)a3 notifyDelegateOfChanges:(BOOL)a4;
- (void)dealloc;
- (void)didUpdateSyncForPairingID:(id)a3;
- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5;
- (void)requestInitialNonMigrationSyncStateForPairingIdentifier:(id)a3 completion:(id)a4;
- (void)requestInitialSyncStateForPairingIdentifier:(id)a3 completion:(id)a4;
- (void)requestSyncStateForPairingIdentifier:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PSYInitialSyncStateObserver

uint64_t __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_initializeIfNotInitialized");
}

id __43__PSYInitialSyncStateObserver_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

void __59__PSYInitialSyncStateObserver__handleConnectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __60__PSYInitialSyncStateObserver_syncProviderWithErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionInvalidated];
}

- (void)_handleConnectionInvalidated
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__PSYInitialSyncStateObserver__handleConnectionInvalidated__block_invoke;
  block[3] = &unk_2642B3DB8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncStateEntryCache, 0);
  objc_storeStrong((id *)&self->_initialSyncStateCache, 0);

  objc_storeStrong((id *)&self->_syncStateCache, 0);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  int daemonStartedNotifyToken = self->_daemonStartedNotifyToken;
  if (daemonStartedNotifyToken != -1) {
    notify_cancel(daemonStartedNotifyToken);
  }
  int syncSwitchNotifyToken = self->_syncSwitchNotifyToken;
  if (syncSwitchNotifyToken != -1) {
    notify_cancel(syncSwitchNotifyToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)PSYInitialSyncStateObserver;
  [(PSYInitialSyncStateObserver *)&v5 dealloc];
}

- (PSYInitialSyncStateObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PSYInitialSyncStateObserver;
  objc_super v5 = [(PSYInitialSyncStateObserver *)&v33 init];
  if (v5)
  {
    v6 = psy_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      v8 = psy_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2179FA000, v8, OS_LOG_TYPE_DEFAULT, "Initializing PSYInitialSyncStateObserver to monitor sync state", (uint8_t *)buf, 2u);
      }
    }
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    syncStateCache = v5->_syncStateCache;
    v5->_syncStateCache = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    initialSyncStateCache = v5->_initialSyncStateCache;
    v5->_initialSyncStateCache = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    syncStateEntryCache = v5->_syncStateEntryCache;
    v5->_syncStateEntryCache = v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.pairedsync.syncobserver", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.pairedsync.delegate", v9);
    delegateQueue = v5->_delegateQueue;
    v5->_delegateQueue = (OS_dispatch_queue *)v18;

    [(PSYInitialSyncStateObserver *)v5 setDelegate:v4];
    objc_initWeak(buf, v5);
    v20 = (const char *)[@"com.apple.pairedsyncd.launched" UTF8String];
    v21 = v5->_queue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke;
    handler[3] = &unk_2642B3D90;
    objc_copyWeak(&v31, buf);
    notify_register_dispatch(v20, &v5->_daemonStartedNotifyToken, v21, handler);
    v22 = (const char *)[@"com.apple.pairedsync.lastsyncswitchid" UTF8String];
    v23 = v5->_queue;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke_2;
    v28[3] = &unk_2642B3D90;
    objc_copyWeak(&v29, buf);
    notify_register_dispatch(v22, &v5->_syncSwitchNotifyToken, v23, v28);
    +[PSYRegistrySingleton addDelegate:v5];
    v24 = v5->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke_3;
    block[3] = &unk_2642B3DB8;
    v27 = v5;
    dispatch_async(v24, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(buf);
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__PSYInitialSyncStateObserver_setDelegate___block_invoke;
  v7[3] = &unk_2642B3DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, v7);
}

- (void)_queue_initializeIfNotInitialized
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(PSYInitialSyncStateObserver *)self syncProviderWithErrorHandler:0];
  [v3 registerSyncStateObserverIfNeeded];

  if (!self->_init)
  {
    id v4 = +[PSYRegistrySingleton registry];
    v9 = [v4 getAllDevices];

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    int v21 = [v9 count];
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    int v17 = 0;
    if (*((_DWORD *)v19 + 6))
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id obj = v9;
      uint64_t v5 = [obj countByEnumeratingWithState:&v12 objects:v22 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v13;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v13 != v6) {
              objc_enumerationMutation(obj);
            }
            id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) pairingID];
            v11[0] = MEMORY[0x263EF8330];
            v11[1] = 3221225472;
            v11[2] = __64__PSYInitialSyncStateObserver__queue_initializeIfNotInitialized__block_invoke;
            v11[3] = &unk_2642B3E30;
            v11[5] = v16;
            v11[6] = &v18;
            v11[4] = self;
            [(PSYInitialSyncStateObserver *)self requestSyncStateForPairingIdentifier:v8 completion:v11];

            ++v7;
          }
          while (v5 != v7);
          uint64_t v5 = [obj countByEnumeratingWithState:&v12 objects:v22 count:16];
        }
        while (v5);
      }
    }
    else
    {
      self->_init = 1;
    }
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v18, 8);
  }
}

- (id)syncProviderWithErrorHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.pairedsyncd.syncstate" options:4096];
    uint64_t v7 = self->_connection;
    self->_connection = v6;

    id v8 = objc_alloc_init(PSYSyncStateObserverExportedObject);
    [(PSYSyncStateObserverExportedObject *)v8 setDelegate:self];
    [(NSXPCConnection *)self->_connection setExportedObject:v8];
    v9 = self->_connection;
    v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7FDA08];
    [(NSXPCConnection *)v9 setExportedInterface:v10];

    v11 = self->_connection;
    long long v12 = PSYSyncStateProviderXPCInterface();
    [(NSXPCConnection *)v11 setRemoteObjectInterface:v12];

    objc_initWeak(&location, self);
    long long v13 = self->_connection;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __60__PSYInitialSyncStateObserver_syncProviderWithErrorHandler___block_invoke;
    v19 = &unk_2642B3F20;
    objc_copyWeak(&v20, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:&v16];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    connection = self->_connection;
  }
  long long v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v4];

  return v14;
}

- (PSYInitialSyncStateObserver)init
{
  return [(PSYInitialSyncStateObserver *)self initWithDelegate:0];
}

void __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_querySyncState");
    objc_msgSend(v2, "_queue_notifyCanRetryFailedRequests");
    id WeakRetained = v2;
  }
}

void __48__PSYInitialSyncStateObserver_initWithDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_querySyncState");
}

- (PSYInitialSyncStateObserverDelegate)delegate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  delegateQueue = self->_delegateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__PSYInitialSyncStateObserver_delegate__block_invoke;
  v5[3] = &unk_2642B3E08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(delegateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PSYInitialSyncStateObserverDelegate *)v3;
}

uint64_t __39__PSYInitialSyncStateObserver_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));

  return MEMORY[0x270F9A758]();
}

void __64__PSYInitialSyncStateObserver__queue_initializeIfNotInitialized__block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4) {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  if (!--*(_DWORD *)(*(void *)(a1[6] + 8) + 24) && !*(_DWORD *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = *(NSObject **)(v5 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__PSYInitialSyncStateObserver__queue_initializeIfNotInitialized__block_invoke_2;
    block[3] = &unk_2642B3DB8;
    void block[4] = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __64__PSYInitialSyncStateObserver__queue_initializeIfNotInitialized__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 1;
  return result;
}

- (void)requestSyncStateForPairingIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke;
    block[3] = &unk_2642B3EF8;
    void block[4] = self;
    id v13 = v7;
    id v12 = v6;
    dispatch_async(queue, block);
  }
  else
  {
    v10 = PSYErrorForCode(5);
    ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
  }
}

void __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_2;
  v9[3] = &unk_2642B3E80;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 syncProviderWithErrorHandler:v9];
  v11[0] = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_4;
  v6[3] = &unk_2642B3ED0;
  uint64_t v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v3 requestDeviceSyncStateEntriesForPairingIDs:v4 completion:v6];
}

void __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_3;
  v7[3] = &unk_2642B3E58;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_5;
  v7[3] = &unk_2642B3EA8;
  void v7[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __79__PSYInitialSyncStateObserver_requestSyncStateForPairingIdentifier_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateSyncStates:notifyDelegateOfChanges:", *(void *)(a1 + 40), 0);
  id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  int v3 = [v2 hasCompletedSync];

  uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (v4)
  {
    id v5 = psy_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (!v6)
    {
      id v11 = 0;
      goto LABEL_13;
    }
    id v7 = psy_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 48) UUIDString];
      id v9 = (void *)v8;
      id v10 = @"NO";
      if (v3) {
        id v10 = @"YES";
      }
      int v15 = 138412546;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, "requestSyncStateForPairingIdentifier:%@ hasCompletedSync=%@", (uint8_t *)&v15, 0x16u);
    }
    id v11 = 0;
    goto LABEL_11;
  }
  id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.pairedsync" code:43 userInfo:0];
  id v12 = psy_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v7 = psy_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [*(id *)(a1 + 48) UUIDString];
      int v15 = 138412546;
      uint64_t v16 = (uint64_t)v14;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_2179FA000, v7, OS_LOG_TYPE_DEFAULT, "requestSyncStateForPairingIdentifier:%@ error=%@", (uint8_t *)&v15, 0x16u);
    }
LABEL_11:
  }
LABEL_13:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)requestInitialSyncStateForPairingIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke;
  block[3] = &unk_2642B3EF8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_2;
  v9[3] = &unk_2642B3E80;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 48);
  int v3 = [v2 syncProviderWithErrorHandler:v9];
  v11[0] = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_4;
  v6[3] = &unk_2642B3ED0;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v3 requestDeviceSyncStateEntriesForPairingIDs:v4 completion:v6];
}

void __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_3;
  v7[3] = &unk_2642B3E58;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_5;
  v7[3] = &unk_2642B3EA8;
  void v7[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __86__PSYInitialSyncStateObserver_requestInitialSyncStateForPairingIdentifier_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateSyncStates:notifyDelegateOfChanges:", *(void *)(a1 + 40), 0);
  id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  int v3 = [v2 hasCompletedInitialOrMigrationSync];

  uint64_t v4 = psy_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = psy_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 48) UUIDString];
      id v8 = (void *)v7;
      id v9 = @"NO";
      if (v3) {
        id v9 = @"YES";
      }
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      long long v14 = v9;
      _os_log_impl(&dword_2179FA000, v6, OS_LOG_TYPE_DEFAULT, "requestInitialSyncStateForPairingIdentifier:%@ hasCompletedInitialOrMigrationSync=%@", (uint8_t *)&v11, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)requestInitialNonMigrationSyncStateForPairingIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke;
  block[3] = &unk_2642B3EF8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_2;
  v9[3] = &unk_2642B3E80;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 48);
  int v3 = [v2 syncProviderWithErrorHandler:v9];
  v11[0] = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_4;
  v6[3] = &unk_2642B3ED0;
  BOOL v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v3 requestDeviceSyncStateEntriesForPairingIDs:v4 completion:v6];
}

void __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_3;
  v7[3] = &unk_2642B3E58;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_5;
  v7[3] = &unk_2642B3EA8;
  void v7[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __98__PSYInitialSyncStateObserver_requestInitialNonMigrationSyncStateForPairingIdentifier_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateSyncStates:notifyDelegateOfChanges:", *(void *)(a1 + 40), 0);
  id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  int v3 = [v2 hasCompletedInitialSync];

  uint64_t v4 = psy_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = psy_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 48) UUIDString];
      id v8 = (void *)v7;
      id v9 = @"NO";
      if (v3) {
        id v9 = @"YES";
      }
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      long long v14 = v9;
      _os_log_impl(&dword_2179FA000, v6, OS_LOG_TYPE_DEFAULT, "requestInitialNonMigrationSyncStateForPairingIdentifier:%@ hasCompletedInitialSync=%@", (uint8_t *)&v11, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_queue_querySyncState
{
  [(PSYInitialSyncStateObserver *)self _queue_initializeIfNotInitialized];
  int v3 = [(NSMutableDictionary *)self->_syncStateCache keyEnumerator];
  uint64_t v4 = [v3 allObjects];

  if ([v4 count])
  {
    BOOL v5 = [(PSYInitialSyncStateObserver *)self syncProviderWithErrorHandler:0];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__PSYInitialSyncStateObserver__queue_querySyncState__block_invoke;
    v6[3] = &unk_2642B3F48;
    v6[4] = self;
    [v5 requestDeviceSyncStateEntriesForPairingIDs:v4 completion:v6];
  }
}

void __52__PSYInitialSyncStateObserver__queue_querySyncState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__PSYInitialSyncStateObserver__queue_querySyncState__block_invoke_2;
  v7[3] = &unk_2642B3DE0;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __52__PSYInitialSyncStateObserver__queue_querySyncState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateSyncStates:notifyDelegateOfChanges:", *(void *)(a1 + 40), 1);
}

- (void)_queue_notifyCanRetryFailedRequests
{
  id v3 = [(PSYInitialSyncStateObserver *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PSYInitialSyncStateObserver *)self delegate];
    [v5 initialSyncStateObserverClientCanRetryFailedRequests:self];
  }
}

- (void)_queue_updateSyncStates:(id)a3 notifyDelegateOfChanges:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v62 = [MEMORY[0x263EFF9C0] set];
    v59 = [MEMORY[0x263EFF9C0] set];
    v60 = [MEMORY[0x263EFF9C0] set];
  }
  else
  {
    v59 = 0;
    v60 = 0;
    v62 = 0;
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = [v6 keyEnumerator];
  uint64_t v7 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
  v61 = v6;
  if (v7)
  {
    uint64_t v9 = v7;
    id v64 = *(id *)v79;
    *(void *)&long long v8 = 138412290;
    long long v58 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(id *)v79 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, v58);
        [(NSMutableDictionary *)self->_syncStateEntryCache setObject:v12 forKeyedSubscript:v11];
        __int16 v13 = [(NSMutableDictionary *)self->_syncStateCache objectForKeyedSubscript:v11];
        long long v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "hasCompletedSync"));
        if (([v13 BOOLValue] & 1) == 0
          && (v15 = [v14 BOOLValue], uint64_t v16 = v62, (v15 & 1) != 0)
          || [v13 BOOLValue]
          && (v17 = [v14 BOOLValue], uint64_t v16 = v60, (v17 & 1) == 0))
        {
          [v16 addObject:v11];
          [(NSMutableDictionary *)self->_syncStateCache setObject:v14 forKeyedSubscript:v11];
        }
        uint64_t v18 = [(NSMutableDictionary *)self->_initialSyncStateCache objectForKeyedSubscript:v11];

        uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "hasCompletedInitialOrMigrationSync"));

        if (([v18 BOOLValue] & 1) == 0 && objc_msgSend(v19, "BOOLValue"))
        {
          [v59 addObject:v11];
LABEL_23:
          [(NSMutableDictionary *)self->_initialSyncStateCache setObject:v19 forKeyedSubscript:v11];
          id v6 = v61;
          goto LABEL_24;
        }
        if ([v18 BOOLValue] && (objc_msgSend(v19, "BOOLValue") & 1) == 0)
        {
          id v20 = psy_log();
          BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

          if (v21)
          {
            v22 = psy_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v58;
              uint64_t v86 = v11;
              _os_log_impl(&dword_2179FA000, v22, OS_LOG_TYPE_DEFAULT, "Initial sync status changed, reset cached value for: %@", buf, 0xCu);
            }
          }
          goto LABEL_23;
        }
LABEL_24:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
    }
    while (v9);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v65 = v60;
  uint64_t v23 = [v65 countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v75 != v25) {
          objc_enumerationMutation(v65);
        }
        uint64_t v27 = *(void *)(*((void *)&v74 + 1) + 8 * j);
        v28 = psy_log();
        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

        if (v29)
        {
          v30 = psy_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v86 = v27;
            _os_log_impl(&dword_2179FA000, v30, OS_LOG_TYPE_DEFAULT, "Resetting sync state for %{public}@", buf, 0xCu);
          }
        }
        id v31 = [(PSYInitialSyncStateObserver *)self delegate];
        char v32 = objc_opt_respondsToSelector();

        if (v32)
        {
          objc_super v33 = [(PSYInitialSyncStateObserver *)self delegate];
          [v33 initialSyncStateObserver:self syncDidResetForPairingIdentifier:v27];
        }
      }
      uint64_t v24 = [v65 countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v24);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v34 = v59;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v71 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v70 + 1) + 8 * k);
        v40 = psy_log();
        BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

        if (v41)
        {
          v42 = psy_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v86 = v39;
            _os_log_impl(&dword_2179FA000, v42, OS_LOG_TYPE_DEFAULT, "Setting completed Initial sync state for %{public}@", buf, 0xCu);
          }
        }
        v43 = [(PSYInitialSyncStateObserver *)self delegate];
        char v44 = objc_opt_respondsToSelector();

        if (v44)
        {
          v45 = [(PSYInitialSyncStateObserver *)self delegate];
          [v45 initialSyncStateObserver:self initialSyncDidCompleteForPairingIdentifier:v39];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v70 objects:v83 count:16];
    }
    while (v36);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v46 = v62;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v66 objects:v82 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v67;
    do
    {
      for (uint64_t m = 0; m != v48; ++m)
      {
        if (*(void *)v67 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = *(void *)(*((void *)&v66 + 1) + 8 * m);
        v52 = psy_log();
        BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);

        if (v53)
        {
          v54 = psy_log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v86 = v51;
            _os_log_impl(&dword_2179FA000, v54, OS_LOG_TYPE_DEFAULT, "Setting completed Reunion sync state for %{public}@", buf, 0xCu);
          }
        }
        v55 = [(PSYInitialSyncStateObserver *)self delegate];
        char v56 = objc_opt_respondsToSelector();

        if (v56)
        {
          v57 = [(PSYInitialSyncStateObserver *)self delegate];
          [v57 initialSyncStateObserver:self syncDidCompleteForPairingIdentifier:v51];
        }
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v66 objects:v82 count:16];
    }
    while (v48);
  }
}

- (void)registry:(id)a3 changed:(id)a4 properties:(id)a5
{
  id v6 = a5;
  if (([v6 containsObject:*MEMORY[0x263F5BB08]] & 1) != 0
    || [v6 containsObject:*MEMORY[0x263F5BB00]])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__PSYInitialSyncStateObserver_registry_changed_properties___block_invoke;
    block[3] = &unk_2642B3DB8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __59__PSYInitialSyncStateObserver_registry_changed_properties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_querySyncState");
}

- (void)didUpdateSyncForPairingID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__PSYInitialSyncStateObserver_didUpdateSyncForPairingID___block_invoke;
  v7[3] = &unk_2642B3DE0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __57__PSYInitialSyncStateObserver_didUpdateSyncForPairingID___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = [[PSYDeviceSyncStateEntry alloc] initWithPairingID:*(void *)(a1 + 32) syncState:3];
    id v3 = v2;
    if (v2)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v6[0] = v2;
      id v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_queue_updateSyncStates:notifyDelegateOfChanges:", v4, 1);
}

@end