@interface NTKBundleComplicationMigrationServiceClient
+ (id)sharedInstance;
- (NSXPCConnection)connection;
- (NTKBundleComplicationMigrationServiceClient)init;
- (OS_dispatch_queue)queue;
- (id)connectionProvider;
- (void)_queue_clearInvalidationTimer;
- (void)_queue_decrementTransactionCount;
- (void)_queue_incrementTransactionCount;
- (void)_queue_loadTypeLookupForDevice:(id)a3 completion:(id)a4;
- (void)_queue_resetConnection:(BOOL)a3;
- (void)_queue_serviceRequest:(id)a3 retryBudget:(unint64_t)a4;
- (void)_queue_updateInvalidationTimer;
- (void)_setupConnectionIfNeeded;
- (void)generateTypeLookupForDevice:(id)a3 completion:(id)a4;
- (void)serviceRequest:(id)a3 completion:(id)a4;
- (void)setConnectionProvider:(id)a3;
@end

@implementation NTKBundleComplicationMigrationServiceClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1) {
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_87);
  }
  v2 = (void *)sharedInstance__instance;

  return v2;
}

void __61__NTKBundleComplicationMigrationServiceClient_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NTKBundleComplicationMigrationServiceClient);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;
}

- (NTKBundleComplicationMigrationServiceClient)init
{
  v11.receiver = self;
  v11.super_class = (Class)NTKBundleComplicationMigrationServiceClient;
  v2 = [(NTKBundleComplicationMigrationServiceClient *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanotimekit.NTKBundleComplicationMigrationServiceClient", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    requestToCompletion = v2->_requestToCompletion;
    v2->_requestToCompletion = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    cachedResults = v2->_cachedResults;
    v2->_cachedResults = (NSMutableDictionary *)v8;
  }
  return v2;
}

- (void)serviceRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__NTKBundleComplicationMigrationServiceClient_serviceRequest_completion___block_invoke;
  block[3] = &unk_1E62C0098;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __73__NTKBundleComplicationMigrationServiceClient_serviceRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Received request %{public}@", (uint8_t *)&v9, 0xCu);
  }

  dispatch_queue_t v4 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:*(void *)(a1 + 32)];
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:*(void *)(a1 + 32)];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = _Block_copy(*(const void **)(a1 + 48));
      [v6 addObject:v7];
    }
    else
    {
      id v6 = objc_opt_new();
      uint64_t v8 = _Block_copy(*(const void **)(a1 + 48));
      [v6 addObject:v8];

      [*(id *)(*(void *)(a1 + 40) + 32) setObject:v6 forKey:*(void *)(a1 + 32)];
      objc_msgSend(*(id *)(a1 + 40), "_queue_serviceRequest:retryBudget:", *(void *)(a1 + 32), 3);
    }
  }
}

- (void)generateTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Requesting type lookup...", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__NTKBundleComplicationMigrationServiceClient_generateTypeLookupForDevice_completion___block_invoke;
  block[3] = &unk_1E62C0098;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __86__NTKBundleComplicationMigrationServiceClient_generateTypeLookupForDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_loadTypeLookupForDevice:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_setupConnectionIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    connectionProvider = (void (**)(void))self->_connectionProvider;
    if (connectionProvider)
    {
      connectionProvider[2]();
      dispatch_queue_t v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      dispatch_queue_t v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.BundleComplicationMigrationService"];
    }
    connection = self->_connection;
    self->_connection = v4;

    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1FCDD0EB8];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    id v7 = self->_connection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke;
    v11[3] = &unk_1E62C0068;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v7 setInterruptionHandler:v11];
    uint64_t v8 = self->_connection;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_12;
    v9[3] = &unk_1E62C0068;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)v8 setInvalidationHandler:v9];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_2;
    block[3] = &unk_1E62BFF20;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
  dispatch_queue_t v4 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_cold_1(v4);
  }
}

uint64_t __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resetConnection:", 0);
}

void __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_12(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_2_13;
    block[3] = &unk_1E62BFF20;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
  dispatch_queue_t v4 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_12_cold_1(v4);
  }
}

uint64_t __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_2_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resetConnection:", 0);
}

- (void)_queue_resetConnection:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v3) {
    [(NSXPCConnection *)self->_connection invalidate];
  }
  connection = self->_connection;
  self->_connection = 0;
}

- (void)_queue_serviceRequest:(id)a3 retryBudget:(unint64_t)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  [(NTKBundleComplicationMigrationServiceClient *)self _queue_incrementTransactionCount];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke;
  aBlock[3] = &unk_1E62C4DD8;
  aBlock[4] = self;
  v30 = v31;
  id v7 = v6;
  id v29 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  if (a4)
  {
    [(NTKBundleComplicationMigrationServiceClient *)self _setupConnectionIfNeeded];
    int v9 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v7;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Servicing request %{public}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    connection = self->_connection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_23;
    v24[3] = &unk_1E62C4E28;
    objc_copyWeak(v27, (id *)buf);
    v26 = v31;
    id v11 = v7;
    id v25 = v11;
    v27[1] = (id)a4;
    id v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v24];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_2;
    v21[3] = &unk_1E62C4E50;
    objc_copyWeak(&v23, (id *)buf);
    id v13 = v8;
    id v22 = v13;
    [v12 processRequest:v11 completion:v21];

    dispatch_time_t v14 = dispatch_time(0, 300000000000);
    queue = self->_queue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_4;
    v19[3] = &unk_1E62C0718;
    id v20 = v13;
    dispatch_after(v14, queue, v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak(v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36[0] = @"Request exceeded maximum retry count";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v18 = [v16 errorWithDomain:@"com.apple.nanotimekit.bundleComplicationMigrationProvider" code:1 userInfo:v17];

    (*((void (**)(void *, void, void *))v8 + 2))(v8, 0, v18);
  }

  _Block_object_dispose(v31, 8);
}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 48));
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 1;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(void *)(a1 + 40), 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12++) + 16))();
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "_queue_decrementTransactionCount");
  }
}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_23_cold_1((uint64_t)v3, v4);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_24;
    block[3] = &unk_1E62C4E00;
    void block[4] = WeakRetained;
    long long v9 = *(_OWORD *)(a1 + 32);
    id v8 = (id)v9;
    long long v11 = v9;
    uint64_t v12 = *(void *)(a1 + 56);
    dispatch_async(v7, block);
  }
}

uint64_t __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequest:retryBudget:", *(void *)(a1 + 40), v1 - 1);
}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    long long v9 = WeakRetained[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_3;
    block[3] = &unk_1E62C22B8;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_4(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Request timed out";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  dispatch_queue_t v4 = [v2 errorWithDomain:@"com.apple.nanotimekit.bundleComplicationMigrationProvider" code:0 userInfo:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_queue_loadTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NTKBundleComplicationMigrationServiceClient *)self _setupConnectionIfNeeded];
  [(NTKBundleComplicationMigrationServiceClient *)self _queue_incrementTransactionCount];
  objc_initWeak(&location, self);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke;
  aBlock[3] = &unk_1E62C20A8;
  v21 = v23;
  objc_copyWeak(&v22, &location);
  id v8 = v7;
  id v20 = v8;
  long long v9 = _Block_copy(aBlock);
  connection = self->_connection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_3;
  v17[3] = &unk_1E62C4E78;
  id v11 = v9;
  id v18 = v11;
  id v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
  id v13 = [v6 descriptor];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_4;
  v15[3] = &unk_1E62C4E78;
  id v14 = v11;
  id v16 = v14;
  [v12 generateComplicationTypeLookupForDevice:v13 completion:v15];

  objc_destroyWeak(&v22);
  _Block_object_dispose(v23, 8);
  objc_destroyWeak(&location);
}

void __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v4 + 24))
  {
    *(unsigned char *)(v4 + 24) = 1;
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = WeakRetained[6];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_2;
      block[3] = &unk_1E62BFF20;
      void block[4] = v6;
      dispatch_async(v7, block);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_decrementTransactionCount");
}

uint64_t __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_4_cold_1((uint64_t)v3, v4);
    }

    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

- (void)_queue_updateInvalidationTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NTKBundleComplicationMigrationServiceClient *)self _queue_clearInvalidationTimer];
  if (!self->_transactionCount)
  {
    id v3 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Beginning invalidation timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__NTKBundleComplicationMigrationServiceClient__queue_updateInvalidationTimer__block_invoke;
    v8[3] = &unk_1E62C0628;
    objc_copyWeak(&v9, buf);
    uint64_t v5 = [v4 timerWithTimeInterval:0 repeats:v8 block:30.0];
    [(NSTimer *)v5 setTolerance:3.0];
    id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v6 addTimer:v5 forMode:*MEMORY[0x1E4F1C4B0]];

    invalidationTimer = self->_invalidationTimer;
    self->_invalidationTimer = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

void __77__NTKBundleComplicationMigrationServiceClient__queue_updateInvalidationTimer__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = 30;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Connection has been inactive for %lus, closing connection", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    id v6 = v4[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__NTKBundleComplicationMigrationServiceClient__queue_updateInvalidationTimer__block_invoke_30;
    block[3] = &unk_1E62BFF20;
    void block[4] = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __77__NTKBundleComplicationMigrationServiceClient__queue_updateInvalidationTimer__block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resetConnection:", 1);
}

- (void)_queue_clearInvalidationTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidationTimer)
  {
    id v3 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationServiceClient: Cancelled invalidation timer", v5, 2u);
    }

    [(NSTimer *)self->_invalidationTimer invalidate];
    invalidationTimer = self->_invalidationTimer;
    self->_invalidationTimer = 0;
  }
}

- (void)_queue_incrementTransactionCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_transactionCount;

  [(NTKBundleComplicationMigrationServiceClient *)self _queue_clearInvalidationTimer];
}

- (void)_queue_decrementTransactionCount
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = self->_transactionCount - 1;
  self->_transactionCount = v3;
  if (!v3)
  {
    [(NTKBundleComplicationMigrationServiceClient *)self _queue_updateInvalidationTimer];
  }
}

- (id)connectionProvider
{
  return self->_connectionProvider;
}

- (void)setConnectionProvider:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_requestToCompletion, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKBundleComplicationMigrationServiceClient: Interrupted", v1, 2u);
}

void __71__NTKBundleComplicationMigrationServiceClient__setupConnectionIfNeeded__block_invoke_12_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKBundleComplicationMigrationServiceClient: Invalidated", v1, 2u);
}

void __81__NTKBundleComplicationMigrationServiceClient__queue_serviceRequest_retryBudget___block_invoke_23_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "NTKBundleComplicationMigrationServiceClient: Remote object proxy error %@", (uint8_t *)&v2, 0xCu);
}

void __89__NTKBundleComplicationMigrationServiceClient__queue_loadTypeLookupForDevice_completion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_FAULT, "Request to generate type lookup failed: %@", (uint8_t *)&v2, 0xCu);
}

@end