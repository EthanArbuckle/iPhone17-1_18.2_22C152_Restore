@interface WLKSubscriptionStore
+ (id)sharedInstance;
- (BOOL)_isSubscriptionSyncInProgress;
- (WLKSubscriptionStore)init;
- (id)_connection;
- (id)cachedSubscriptionData;
- (void)_setIsSubscriptionSyncInProgress:(BOOL)a3;
- (void)dealloc;
- (void)fetchSubscriptionData:(BOOL)a3 completion:(id)a4;
- (void)refreshSubscriptionDataIfNeeded;
@end

@implementation WLKSubscriptionStore

+ (id)sharedInstance
{
  if (sharedInstance___once_3 != -1) {
    dispatch_once(&sharedInstance___once_3, &__block_literal_global_34);
  }
  v2 = (void *)sharedInstance___singleInstance_0;

  return v2;
}

void __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setIsSubscriptionSyncInProgress:0];
  v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke_2;
  v12[3] = &unk_1E620B598;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  id v13 = v5;
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, v12);

  objc_destroyWeak(&v16);
}

- (void)fetchSubscriptionData:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(WLKSubscriptionStore *)self _connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke;
  v17[3] = &unk_1E620A438;
  id v8 = v6;
  id v18 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v17];

  id v10 = WLKSubscriptionSyncLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "calling out to daemon to fetch subscription data", (uint8_t *)&buf, 2u);
  }

  [(WLKSubscriptionStore *)self _setIsSubscriptionSyncInProgress:1];
  objc_initWeak(&buf, self);
  uint64_t v11 = getpid();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke_12;
  v13[3] = &unk_1E620B5C0;
  objc_copyWeak(&v15, &buf);
  v13[4] = self;
  id v12 = v8;
  id v14 = v12;
  [v9 fetchSubscriptionData:v4 callerProcessID:v11 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&buf);
}

- (void)_setIsSubscriptionSyncInProgress:(BOOL)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&__syncInProgressLock);
  subscriptionSyncInProgress = a3;

  os_unfair_lock_unlock((os_unfair_lock_t)&__syncInProgressLock);
}

void __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[4];
    objc_storeStrong(v3 + 4, *(id *)(a1 + 32));
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = v5;
    if (v6 == v7)
    {
    }
    else
    {
      id v8 = v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {

LABEL_11:
        uint64_t v11 = WLKSubscriptionSyncLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKSubscriptionData did change. Firing in-process notification", buf, 2u);
        }

        id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v12 postNotificationName:@"WLKSubscriptionStoreSubscriptionDataDidChange" object:0];

        goto LABEL_14;
      }
      char v10 = [v6 isEqual:v7];

      if ((v10 & 1) == 0) {
        goto LABEL_11;
      }
    }
LABEL_14:
  }
  if (*(void *)(a1 + 48))
  {
    id v13 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "Fetched subscription data", v14, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)_connection
{
  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (!connection)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    id v5 = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    id v6 = v2->_connection;
    id v7 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    id v8 = v2->_connection;
    BOOL v9 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_21];
    objc_initWeak(&location, v2);
    char v10 = v2->_connection;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __35__WLKSubscriptionStore__connection__block_invoke_22;
    id v16 = &unk_1E620A550;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v13];
    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = v2->_connection;
  }
  uint64_t v11 = connection;
  objc_sync_exit(v2);

  return v11;
}

uint64_t __38__WLKSubscriptionStore_sharedInstance__block_invoke()
{
  sharedInstance___singleInstance_0 = objc_alloc_init(WLKSubscriptionStore);

  return MEMORY[0x1F41817F8]();
}

- (WLKSubscriptionStore)init
{
  v13.receiver = self;
  v13.super_class = (Class)WLKSubscriptionStore;
  v2 = [(WLKSubscriptionStore *)&v13 init];
  if (v2)
  {
    subscriptionSyncInProgress = 0;
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __28__WLKSubscriptionStore_init__block_invoke;
    handler[3] = &unk_1E620AAB8;
    id v5 = v2;
    char v10 = v5;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.WatchListKit._WLKSubscriptionStoreSubscriptionDataDidChangeInternal", &v2->_subscriptionSyncSubscriptionDataDidChangeNotificationToken, v3, handler);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.WatchListKit.SubscriptionStoreClient", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__WLKSubscriptionStore_init__block_invoke(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 24), &state64);
  if (state64 != getpid())
  {
    v2 = WLKSubscriptionSyncLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "Handling internal sync notification", v4, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained fetchSubscriptionData:0 completion:&__block_literal_global_6];
  }
}

void __28__WLKSubscriptionStore_init__block_invoke_3()
{
  v0 = WLKSubscriptionSyncLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "Internal sync complete", v1, 2u);
  }
}

- (void)dealloc
{
  int subscriptionSyncSubscriptionDataDidChangeNotificationToken = self->_subscriptionSyncSubscriptionDataDidChangeNotificationToken;
  if (subscriptionSyncSubscriptionDataDidChangeNotificationToken) {
    notify_cancel(subscriptionSyncSubscriptionDataDidChangeNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)WLKSubscriptionStore;
  [(WLKSubscriptionStore *)&v4 dealloc];
}

void __57__WLKSubscriptionStore_fetchSubscriptionData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = WLKSubscriptionSyncLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)refreshSubscriptionDataIfNeeded
{
  BOOL v3 = [(WLKSubscriptionStore *)self _isSubscriptionSyncInProgress];
  objc_super v4 = WLKSubscriptionSyncLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "Not refreshing subscription data as subscription sync is already in-progress", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "Start subscription refresh request", v7, 2u);
    }

    int v6 = [(WLKSubscriptionStore *)self _connection];
    objc_super v4 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_15];

    [v4 refreshSubscriptionData:0];
  }
}

void __55__WLKSubscriptionStore_refreshSubscriptionDataIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = WLKSubscriptionSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }
}

- (id)cachedSubscriptionData
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__5;
  char v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__WLKSubscriptionStore_cachedSubscriptionData__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__WLKSubscriptionStore_cachedSubscriptionData__block_invoke(uint64_t a1)
{
}

void __35__WLKSubscriptionStore__connection__block_invoke()
{
  v0 = WLKSubscriptionSyncLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted.", v1, 2u);
  }
}

void __35__WLKSubscriptionStore__connection__block_invoke_22(uint64_t a1)
{
  id v2 = WLKSubscriptionSyncLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;
  }
}

- (BOOL)_isSubscriptionSyncInProgress
{
  os_unfair_lock_lock((os_unfair_lock_t)&__syncInProgressLock);
  char v2 = subscriptionSyncInProgress;
  os_unfair_lock_unlock((os_unfair_lock_t)&__syncInProgressLock);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionData, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end