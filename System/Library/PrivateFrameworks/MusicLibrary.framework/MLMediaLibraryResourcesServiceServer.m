@interface MLMediaLibraryResourcesServiceServer
+ (MLMediaLibraryResourcesServiceServer)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MLMediaLibraryResourcesServiceServer)initWithAccountChangeObserver:(id)a3;
- (NSMutableSet)observers;
- (NSXPCListener)xpcServiceListener;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)calloutQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_semaphore)accountChangeSemaphore;
- (id)_MLMediaLibraryResourcesServiceServerExportedInterface;
- (id)_MLMediaLibraryResourcesServiceServerRemoteObjectInterface;
- (void)_addObserver:(id)a3;
- (void)_removeObserver:(id)a3;
- (void)_unblockExecutionForFutureAccountChange;
- (void)emergencyDisconnectWithCompletion:(id)a3;
- (void)libraryContainerPathWithCompletion:(id)a3;
- (void)musicContainerPathWithCompletion:(id)a3;
- (void)performDatabasePathChange:(id)a3 completion:(id)a4;
- (void)setAccessQueue:(id)a3;
- (void)setAccountChangeSemaphore:(id)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setXpcServiceListener:(id)a3;
@end

@implementation MLMediaLibraryResourcesServiceServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_xpcServiceListener, 0);
  objc_storeStrong((id *)&self->_accountChangeSemaphore, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setObservers:(id)a3
{
}

- (void)setXpcServiceListener:(id)a3
{
}

- (NSXPCListener)xpcServiceListener
{
  return self->_xpcServiceListener;
}

- (void)setAccountChangeSemaphore:(id)a3
{
}

- (void)setCalloutQueue:(id)a3
{
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (id)_MLMediaLibraryResourcesServiceServerRemoteObjectInterface
{
  if (_MLMediaLibraryResourcesServiceServerRemoteObjectInterface_sMLMediaLibraryResourcesServiceServerRemoteObjectInterfaceOnceToken != -1) {
    dispatch_once(&_MLMediaLibraryResourcesServiceServerRemoteObjectInterface_sMLMediaLibraryResourcesServiceServerRemoteObjectInterfaceOnceToken, &__block_literal_global_135);
  }
  v2 = (void *)_MLMediaLibraryResourcesServiceServerRemoteObjectInterface_sMLMediaLibraryResourcesServiceServerRemoteObjectInterface;

  return v2;
}

uint64_t __98__MLMediaLibraryResourcesServiceServer__MLMediaLibraryResourcesServiceServerRemoteObjectInterface__block_invoke()
{
  _MLMediaLibraryResourcesServiceServerRemoteObjectInterface_sMLMediaLibraryResourcesServiceServerRemoteObjectInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0922FC8];

  return MEMORY[0x1F41817F8]();
}

- (id)_MLMediaLibraryResourcesServiceServerExportedInterface
{
  if (_MLMediaLibraryResourcesServiceServerExportedInterface_sMLMediaLibraryResourcesServiceServerExportedInterfaceOnceToken != -1) {
    dispatch_once(&_MLMediaLibraryResourcesServiceServerExportedInterface_sMLMediaLibraryResourcesServiceServerExportedInterfaceOnceToken, &__block_literal_global_128);
  }
  v2 = (void *)_MLMediaLibraryResourcesServiceServerExportedInterface_sMLMediaLibraryResourcesServiceServerExportedInterface;

  return v2;
}

uint64_t __94__MLMediaLibraryResourcesServiceServer__MLMediaLibraryResourcesServiceServerExportedInterface__block_invoke()
{
  _MLMediaLibraryResourcesServiceServerExportedInterface_sMLMediaLibraryResourcesServiceServerExportedInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F092A6B0];

  return MEMORY[0x1F41817F8]();
}

- (void)_removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(MLMediaLibraryResourcesServiceServer *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MLMediaLibraryResourcesServiceServer__removeObserver___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __56__MLMediaLibraryResourcesServiceServer__removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)_addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(MLMediaLibraryResourcesServiceServer *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MLMediaLibraryResourcesServiceServer__addObserver___block_invoke;
  v7[3] = &unk_1E5FB83D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __53__MLMediaLibraryResourcesServiceServer__addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (OS_dispatch_semaphore)accountChangeSemaphore
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19394;
  v11 = __Block_byref_object_dispose__19395;
  id v12 = 0;
  v3 = [(MLMediaLibraryResourcesServiceServer *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__MLMediaLibraryResourcesServiceServer_accountChangeSemaphore__block_invoke;
  v6[3] = &unk_1E5FB8360;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (OS_dispatch_semaphore *)v4;
}

void __62__MLMediaLibraryResourcesServiceServer_accountChangeSemaphore__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

- (void)_unblockExecutionForFutureAccountChange
{
  dispatch_semaphore_t v3 = [(MLMediaLibraryResourcesServiceServer *)self accountChangeSemaphore];
  dispatch_semaphore_signal(v3);

  uint64_t v4 = [(MLMediaLibraryResourcesServiceServer *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MLMediaLibraryResourcesServiceServer__unblockExecutionForFutureAccountChange__block_invoke;
  block[3] = &unk_1E5FB8298;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __79__MLMediaLibraryResourcesServiceServer__unblockExecutionForFutureAccountChange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (NSMutableSet)observers
{
  dispatch_semaphore_t v3 = [(MLMediaLibraryResourcesServiceServer *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    id v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }

  return observers;
}

- (MLMediaLibraryResourcesServiceServer)initWithAccountChangeObserver:(id)a3
{
  uint64_t v4 = (MLMediaLibraryResourcesServiceServer *)a3;
  v16.receiver = self;
  v16.super_class = (Class)MLMediaLibraryResourcesServiceServer;
  v5 = [(MLMediaLibraryResourcesServiceServer *)&v16 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.medialibraryd.multi-user-resources-service.serialQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.medialibraryd.multi-user-resources-service.workQueue", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.medialibraryd.multi-user-resources-service.calloutQueue", MEMORY[0x1E4F14430]);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    if (v4) {
      id v12 = v4;
    }
    else {
      id v12 = v5;
    }
    v13 = v12;
    v14 = +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy];
    [v14 addAccountChangeObserver:v13];
  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = [(MLMediaLibraryResourcesServiceServer *)self _MLMediaLibraryResourcesServiceServerExportedInterface];
  [v6 setExportedInterface:v7];

  [v6 setExportedObject:self];
  dispatch_queue_t v8 = [(MLMediaLibraryResourcesServiceServer *)self _MLMediaLibraryResourcesServiceServerRemoteObjectInterface];
  [v6 setRemoteObjectInterface:v8];

  int v9 = [v6 processIdentifier];
  if (v6)
  {
    [v6 auditToken];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  dispatch_queue_t v10 = MSVBundleIDForAuditToken();
  v11 = +[_MLChangeObserver observerWithConnection:v6];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__MLMediaLibraryResourcesServiceServer_listener_shouldAcceptNewConnection___block_invoke;
  v23[3] = &unk_1E5FB65C8;
  objc_copyWeak(&v25, &location);
  id v12 = v10;
  id v24 = v12;
  int v27 = v9;
  objc_copyWeak(&v26, &from);
  [v6 setInterruptionHandler:v23];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__MLMediaLibraryResourcesServiceServer_listener_shouldAcceptNewConnection___block_invoke_120;
  v18[3] = &unk_1E5FB65C8;
  objc_copyWeak(&v20, &location);
  id v13 = v12;
  id v19 = v13;
  int v22 = v9;
  objc_copyWeak(&v21, &from);
  [v6 setInvalidationHandler:v18];
  v14 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v33 = self;
    __int16 v34 = 2114;
    id v35 = v13;
    __int16 v36 = 1024;
    int v37 = v9;
    _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Connecting to %{public}@[%d]", buf, 0x1Cu);
  }

  [(MLMediaLibraryResourcesServiceServer *)self _addObserver:v11];
  v15 = [v11 connection];
  [v15 resume];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __75__MLMediaLibraryResourcesServiceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_semaphore_t v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(_DWORD *)(a1 + 56);
      int v10 = 138543874;
      id v11 = WeakRetained;
      __int16 v12 = 2114;
      uint64_t v13 = v4;
      __int16 v14 = 1024;
      int v15 = v5;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Connection interrupted for %{public}@[%d]", (uint8_t *)&v10, 0x1Cu);
    }

    id v6 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v6)
    {
      uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = *(_DWORD *)(a1 + 56);
        int v10 = 138543874;
        id v11 = WeakRetained;
        __int16 v12 = 2114;
        uint64_t v13 = v8;
        __int16 v14 = 1024;
        int v15 = v9;
        _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ - Removing observer for %{public}@[%d]", (uint8_t *)&v10, 0x1Cu);
      }

      [WeakRetained _removeObserver:v6];
    }
  }
}

void __75__MLMediaLibraryResourcesServiceServer_listener_shouldAcceptNewConnection___block_invoke_120(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_semaphore_t v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(_DWORD *)(a1 + 56);
      int v10 = 138543874;
      id v11 = WeakRetained;
      __int16 v12 = 2114;
      uint64_t v13 = v4;
      __int16 v14 = 1024;
      int v15 = v5;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Connection invalidated for %{public}@[%d]", (uint8_t *)&v10, 0x1Cu);
    }

    id v6 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v6)
    {
      uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = *(_DWORD *)(a1 + 56);
        int v10 = 138543874;
        id v11 = WeakRetained;
        __int16 v12 = 2114;
        uint64_t v13 = v8;
        __int16 v14 = 1024;
        int v15 = v9;
        _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ - Removing observer for %{public}@[%d]", (uint8_t *)&v10, 0x1Cu);
      }

      [WeakRetained _removeObserver:v6];
    }
  }
}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - queued - newPath=%{public}@", buf, 0x16u);
  }

  [(MLMediaLibraryResourcesServiceServer *)self _blockExecutionForOnGoingAccountChangeIfNeeded];
  int v9 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: - started", buf, 0xCu);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v21 = __Block_byref_object_copy__19394;
  int v22 = __Block_byref_object_dispose__19395;
  id v23 = 0;
  int v10 = [(MLMediaLibraryResourcesServiceServer *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke;
  block[3] = &unk_1E5FB8360;
  block[4] = self;
  void block[5] = buf;
  dispatch_sync(v10, block);

  id v11 = [(MLMediaLibraryResourcesServiceServer *)self workQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke_2;
  v14[3] = &unk_1E5FB65A0;
  id v15 = v6;
  uint64_t v16 = self;
  id v17 = v7;
  v18 = buf;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v11, v14);

  _Block_object_dispose(buf, 8);
}

void __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) observers];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke_3;
  v5[3] = &unk_1E5FB6578;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v5];
  [*(id *)(a1 + 40) _unblockExecutionForFutureAccountChange];
  uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - performDatabasePathChange: - Calling completion block", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __77__MLMediaLibraryResourcesServiceServer_performDatabasePathChange_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 performDatabasePathChange:*(void *)(a1 + 32) completion:&__block_literal_global_118];
}

- (void)musicContainerPathWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = +[ML3MusicLibraryResourcesManager sharedManager];
  id v5 = [v6 musicAssetsContainerPath];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)libraryContainerPathWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = +[ML3MusicLibraryResourcesManager sharedManager];
  id v5 = [v6 libraryContainerPath];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

+ (MLMediaLibraryResourcesServiceServer)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_19416);
  }
  uint64_t v2 = (void *)sharedInstance___sharedService;

  return (MLMediaLibraryResourcesServiceServer *)v2;
}

uint64_t __54__MLMediaLibraryResourcesServiceServer_sharedInstance__block_invoke()
{
  sharedInstance___sharedService = [[MLMediaLibraryResourcesServiceServer alloc] initWithAccountChangeObserver:0];

  return MEMORY[0x1F41817F8]();
}

@end