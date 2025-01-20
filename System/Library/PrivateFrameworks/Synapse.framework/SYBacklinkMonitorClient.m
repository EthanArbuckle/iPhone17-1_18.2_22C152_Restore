@interface SYBacklinkMonitorClient
- (BOOL)_previousFilterCacheMatched;
- (NSMutableSet)_pendingCompletionBlocks;
- (NSXPCConnection)_connection;
- (OS_dispatch_queue)_clientQueue;
- (SYBacklinkFilterCache)_filterCache;
- (SYBacklinkMonitorClient)init;
- (void)_configureConnectionAndResume;
- (void)_createConnectionIfNeeded;
- (void)_invalidateConnection;
- (void)_processNotifyActiveUserActivityDidChange:(id)a3 context:(id)a4 serviceProxy:(id)a5 completion:(id)a6;
- (void)createConnectionWithEndpoint:(id)a3;
- (void)dealloc;
- (void)notifyActiveUserActivityDidChange:(id)a3 context:(id)a4 completion:(id)a5;
- (void)set_clientQueue:(id)a3;
- (void)set_connection:(id)a3;
- (void)set_filterCache:(id)a3;
- (void)set_previousFilterCacheMatched:(BOOL)a3;
- (void)updateWithFilterCache:(id)a3;
@end

@implementation SYBacklinkMonitorClient

- (SYBacklinkMonitorClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)SYBacklinkMonitorClient;
  v2 = [(SYBacklinkMonitorClient *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    pendingCompletionBlocks = v2->__pendingCompletionBlocks;
    v2->__pendingCompletionBlocks = (NSMutableSet *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.synapse.UserActivityServiceClient", v5);
    clientQueue = v2->__clientQueue;
    v2->__clientQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [(SYBacklinkMonitorClient *)self _connection];
  [v3 invalidate];

  [(SYBacklinkMonitorClient *)self set_connection:0];
  v4.receiver = self;
  v4.super_class = (Class)SYBacklinkMonitorClient;
  [(SYBacklinkMonitorClient *)&v4 dealloc];
}

- (void)notifyActiveUserActivityDidChange:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 needsCacheUpdate])
  {
    [(SYBacklinkMonitorClient *)self set_filterCache:0];
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  v12 = [(SYBacklinkMonitorClient *)self _filterCache];

  if (!v12)
  {
LABEL_7:
    v14 = [(SYBacklinkMonitorClient *)self _clientQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke;
    v16[3] = &unk_1E6464608;
    v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v14, v16);

    goto LABEL_8;
  }
  v13 = [(SYBacklinkMonitorClient *)self _filterCache];
  uint64_t v11 = [v13 containsMatchingEntriesForItem:v8];

  if ([(SYBacklinkMonitorClient *)self _previousFilterCacheMatched]
    || v11 != [(SYBacklinkMonitorClient *)self _previousFilterCacheMatched])
  {
LABEL_6:
    [(SYBacklinkMonitorClient *)self set_previousFilterCacheMatched:v11];
    goto LABEL_7;
  }
  v15 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = v8;
    _os_log_impl(&dword_1C2C5F000, v15, OS_LOG_TYPE_INFO, "BacklinkClient: Changed activity was filtered out: %p.", buf, 0xCu);
  }

  if (v10) {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
  }
LABEL_8:
}

void __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createConnectionIfNeeded];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  v2 = [*(id *)(a1 + 32) _connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke_5;
  v5[3] = &unk_1E6463A38;
  v5[4] = &v6;
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v5];

  if (v3)
  {
    [*(id *)(a1 + 32) _processNotifyActiveUserActivityDidChange:*(void *)(a1 + 40) context:*(void *)(a1 + 48) serviceProxy:v3 completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, 0, v7[5]);
    }
  }

  _Block_object_dispose(&v6, 8);
}

void __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke_5_cold_1((uint64_t)v4, v5);
  }
}

- (void)updateWithFilterCache:(id)a3
{
  [(SYBacklinkMonitorClient *)self set_filterCache:a3];

  [(SYBacklinkMonitorClient *)self set_previousFilterCacheMatched:0];
}

- (void)_processNotifyActiveUserActivityDidChange:(id)a3 context:(id)a4 serviceProxy:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (v13)
  {
    v15 = (void *)[v13 copy];
    v16 = [(SYBacklinkMonitorClient *)self _pendingCompletionBlocks];
    id v17 = (void *)MEMORY[0x1C8769940](v15);
    [v16 addObject:v17];
  }
  else
  {
    v15 = 0;
  }
  id v18 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v26 = v10;
    _os_log_impl(&dword_1C2C5F000, v18, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Sending request to service for activity info: %p.", buf, 0xCu);
  }

  if ([v11 needsCacheUpdate])
  {
    [v11 setNeedsCacheUpdate:1];
  }
  else
  {
    id v19 = [(SYBacklinkMonitorClient *)self _filterCache];
    [v11 setNeedsCacheUpdate:v19 == 0];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __101__SYBacklinkMonitorClient__processNotifyActiveUserActivityDidChange_context_serviceProxy_completion___block_invoke;
  v22[3] = &unk_1E64640B8;
  id v23 = v10;
  id v24 = v15;
  v22[4] = self;
  id v20 = v10;
  id v21 = v15;
  [v12 activeUserActivityDidChange:v20 context:v11 completion:v22];
}

void __101__SYBacklinkMonitorClient__processNotifyActiveUserActivityDidChange_context_serviceProxy_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__SYBacklinkMonitorClient__processNotifyActiveUserActivityDidChange_context_serviceProxy_completion___block_invoke_2;
  block[3] = &unk_1E6463CE8;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  block[4] = v4;
  id v7 = v5;
  dispatch_async(v2, block);
}

void __101__SYBacklinkMonitorClient__processNotifyActiveUserActivityDidChange_context_serviceProxy_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) _pendingCompletionBlocks];
    id v3 = (void *)MEMORY[0x1C8769940](*(void *)(a1 + 48));
    int v4 = [v2 containsObject:v3];
  }
  else
  {
    int v4 = 0;
  }
  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"N";
    uint64_t v7 = *(void *)(a1 + 40);
    if (v4) {
      uint64_t v6 = @"Y";
    }
    int v10 = 134218242;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Service request did finish for activity info %p. Call completion: %@.", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    id v8 = [*(id *)(a1 + 32) _pendingCompletionBlocks];
    id v9 = (void *)MEMORY[0x1C8769940](*(void *)(a1 + 48));
    [v8 removeObject:v9];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_createConnectionIfNeeded
{
  id v3 = [(SYBacklinkMonitorClient *)self _connection];

  if (!v3)
  {
    int v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Setting up connection.", v8, 2u);
    }

    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.synapse.backlink-service" options:0];
    [(SYBacklinkMonitorClient *)self set_connection:v5];

    uint64_t v6 = [(SYBacklinkMonitorClient *)self _connection];
    uint64_t v7 = [(SYBacklinkMonitorClient *)self _clientQueue];
    [v6 _setQueue:v7];

    [(SYBacklinkMonitorClient *)self _configureConnectionAndResume];
  }
}

- (void)_configureConnectionAndResume
{
  int v4 = [(SYBacklinkMonitorClient *)self _connection];

  if (!v4)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SYBacklinkMonitorClient.m" lineNumber:151 description:@"the XPC connection is unexpectedly nil"];
  }
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__SYBacklinkMonitorClient__configureConnectionAndResume__block_invoke;
  v16[3] = &unk_1E64637D0;
  objc_copyWeak(&v17, &location);
  v5 = [(SYBacklinkMonitorClient *)self _connection];
  [v5 setInvalidationHandler:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__SYBacklinkMonitorClient__configureConnectionAndResume__block_invoke_23;
  v14[3] = &unk_1E64637D0;
  objc_copyWeak(&v15, &location);
  uint64_t v6 = [(SYBacklinkMonitorClient *)self _connection];
  [v6 setInterruptionHandler:v14];

  uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2C920];
  id v8 = [(SYBacklinkMonitorClient *)self _connection];
  [v8 setRemoteObjectInterface:v7];

  id v9 = [(SYBacklinkMonitorClient *)self _connection];
  [v9 setExportedObject:self];

  int v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2C5B0];
  uint64_t v11 = [(SYBacklinkMonitorClient *)self _connection];
  [v11 setExportedInterface:v10];

  __int16 v12 = [(SYBacklinkMonitorClient *)self _connection];
  [v12 resume];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __56__SYBacklinkMonitorClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Connection was invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

void __56__SYBacklinkMonitorClient__configureConnectionAndResume__block_invoke_23(uint64_t a1)
{
  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "BacklinkClient: Connection was interrupted.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

- (void)_invalidateConnection
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 _pendingCompletionBlocks];
  int v4 = 134217984;
  uint64_t v5 = [v3 count];
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "BacklinkClient: Invalidating connection. Pending completion blocks: %ld", (uint8_t *)&v4, 0xCu);
}

- (void)createConnectionWithEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SYBacklinkMonitorClient *)self _clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SYBacklinkMonitorClient_createConnectionWithEndpoint___block_invoke;
  v7[3] = &unk_1E64637F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __56__SYBacklinkMonitorClient_createConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  [v2 invalidate];

  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "set_connection:", v3);

  id v4 = [*(id *)(a1 + 32) _connection];
  uint64_t v5 = [*(id *)(a1 + 32) _clientQueue];
  [v4 _setQueue:v5];

  id v6 = *(void **)(a1 + 32);

  return [v6 _configureConnectionAndResume];
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)set_connection:(id)a3
{
}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (void)set_clientQueue:(id)a3
{
}

- (NSMutableSet)_pendingCompletionBlocks
{
  return self->__pendingCompletionBlocks;
}

- (SYBacklinkFilterCache)_filterCache
{
  return self->__filterCache;
}

- (void)set_filterCache:(id)a3
{
}

- (BOOL)_previousFilterCacheMatched
{
  return self->__previousFilterCacheMatched;
}

- (void)set_previousFilterCacheMatched:(BOOL)a3
{
  self->__previousFilterCacheMatched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__filterCache, 0);
  objc_storeStrong((id *)&self->__pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->__clientQueue, 0);

  objc_storeStrong((id *)&self->__connection, 0);
}

void __80__SYBacklinkMonitorClient_notifyActiveUserActivityDidChange_context_completion___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "BacklinkClient: Error creating remote service proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end