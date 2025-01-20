@interface WBSHistoryConnectionProxy
- (OS_dispatch_queue)connectionProxyQueue;
- (WBSHistoryConnectionProxy)init;
- (id)_createConnection;
- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3;
- (id)queryMemoryFootprintWithError:(id *)a3;
- (void)_setupConnectionWithInProcessFallback:(BOOL)a3;
- (void)beginHistoryAccessSession:(id)a3;
- (void)beginURLCompletionSession:(id)a3;
- (void)connectWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)ensureConnected:(id)a3;
- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3;
- (void)getCompletionListItemsForQuery:(id)a3 completionHandler:(id)a4;
- (void)getServiceInfo:(id)a3;
- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)killService;
- (void)listDatabaseURLsWithCompletionHandler:(id)a3;
- (void)queryMemoryFootprint:(id)a3;
- (void)releaseCloudHistory:(id)a3;
- (void)setCompletionListVendorEndpoint:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSHistoryConnectionProxy

void __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  v9 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v11 = v9;
    [v10 timeIntervalSinceNow];
    int v14 = 136446466;
    v15 = "connection_connect_with_options";
    __int16 v16 = 2048;
    double v17 = -v12;
    _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", (uint8_t *)&v14, 0x16u);
  }
  if (v7)
  {
    v13 = [[WBSHistoryServiceDatabaseProxy alloc] initWithProxy:v7];
  }
  else
  {
    v13 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5C8DCF8;
  id v12 = *(id *)(a1 + 56);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__20;
  v9[4] = __Block_byref_object_dispose__20;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5C9C6B0;
  id v8 = v9;
  id v7 = *(id *)(a1 + 56);
  [v3 connectWithOptions:v4 delegate:v5 completionHandler:v6];

  _Block_object_dispose(v9, 8);
}

- (WBSHistoryConnectionProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSHistoryConnectionProxy;
  v2 = [(WBSHistoryConnectionProxy *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryConnectionProxy", MEMORY[0x1E4F14430]);
    connectionProxyQueue = v2->_connectionProxyQueue;
    v2->_connectionProxyQueue = (OS_dispatch_queue *)v3;

    [(WBSHistoryConnectionProxy *)v2 _setupConnectionWithInProcessFallback:0];
    uint64_t v5 = v2;
  }

  return v2;
}

- (void)_setupConnectionWithInProcessFallback:(BOOL)a3
{
  objc_initWeak(&location, self);
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke;
  v7[3] = &unk_1E5C9C610;
  v7[4] = self;
  BOOL v9 = a3;
  objc_copyWeak(&v8, &location);
  dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_DETACHED, QOS_CLASS_USER_INITIATED, 0, v7);
  dispatch_barrier_async(connectionProxyQueue, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_cold_1();
  }
  dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v3) {
    [v3 invalidate];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = [MEMORY[0x1E4F29290] anonymousListener];
    uint64_t v5 = [[WBSHistoryService alloc] initWithListener:v4];
    uint64_t v6 = *(void *)(a1 + 32);
    objc_super v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    id v8 = objc_alloc(MEMORY[0x1E4F29268]);
    BOOL v9 = [v4 endpoint];
    uint64_t v10 = [v8 initWithListenerEndpoint:v9];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 8);
    *(void *)(v11 + 8) = v10;
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 32) _createConnection];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v14 + 8);
    *(void *)(v14 + 8) = v13;
  }

  v15 = WBSHistoryConnectionInterface();
  [*(id *)(*(void *)(a1 + 32) + 8) setRemoteObjectInterface:v15];

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_5;
  v17[3] = &unk_1E5C9C5E8;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v17[4] = v19;
  [*(id *)(*(void *)(a1 + 32) + 8) setInterruptionHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_7;
  v16[3] = &unk_1E5C8C9B8;
  v16[4] = v19;
  [*(id *)(*(void *)(a1 + 32) + 8) setInvalidationHandler:v16];
  [*(id *)(*(void *)(a1 + 32) + 8) resume];
  objc_destroyWeak(&v18);
  _Block_object_dispose(v19, 8);
}

- (id)_createConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.Safari.History.Service" options:0];
  return v2;
}

void __49__WBSHistoryConnectionProxy_releaseCloudHistory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
  [v2 releaseCloudHistory:*(void *)(a1 + 40)];
}

- (void)releaseCloudHistory:(id)a3
{
  id v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__WBSHistoryConnectionProxy_releaseCloudHistory___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionProxyQueue, v7);
}

- (void)connectWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connectionProxyQueue = self->_connectionProxyQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9C6D8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(connectionProxyQueue, v15);
}

- (void)invalidate
{
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WBSHistoryConnectionProxy_invalidate__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_barrier_sync(connectionProxyQueue, block);
}

uint64_t __39__WBSHistoryConnectionProxy_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setInterruptionHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 8) setInvalidationHandler:0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 invalidate];
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_5(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_5_cold_1();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    [WeakRetained _setupConnectionWithInProcessFallback:0];
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"WBSHistoryConnectionWasInterrupted" object:v4 userInfo:0];
  }
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_7(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v1 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
      __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_7_cold_1();
    }
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSHistoryConnectionProxy;
  [(WBSHistoryConnectionProxy *)&v3 dealloc];
}

- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__WBSHistoryConnectionProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke;
  v7[3] = &unk_1E5C8DCF8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1AD0C4F80](v7);

  return v5;
}

void __77__WBSHistoryConnectionProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v3);
  }
  else
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __77__WBSHistoryConnectionProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(v5, v3);
    }
  }
}

- (void)ensureConnected:(id)a3
{
  id v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__WBSHistoryConnectionProxy_ensureConnected___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionProxyQueue, v7);
}

void __45__WBSHistoryConnectionProxy_ensureConnected___block_invoke(uint64_t a1)
{
  id v2 = +[WBSHistory historyDatabaseURL];

  if (!v2)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __45__WBSHistoryConnectionProxy_ensureConnected___block_invoke_cold_1();
    }
  }
  id v4 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Calling into -[WBSHistoryConnectionProxy ensureConnected:]", v6, 2u);
  }
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxyWithErrorHandler:*(void *)(a1 + 40)];
  [v5 ensureConnected:*(void *)(a1 + 40)];
}

- (void)getServiceInfo:(id)a3
{
  id v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__WBSHistoryConnectionProxy_getServiceInfo___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionProxyQueue, v7);
}

void __44__WBSHistoryConnectionProxy_getServiceInfo___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[1];
  id v4 = [v2 _defaultProxyErrorHandlerWithSimpleReplyHandler:*(void *)(a1 + 40)];
  id v5 = [v3 remoteObjectProxyWithErrorHandler:v4];

  [v5 getServiceInfo:*(void *)(a1 + 40)];
}

- (void)listDatabaseURLsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__WBSHistoryConnectionProxy_listDatabaseURLsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionProxyQueue, v7);
}

void __67__WBSHistoryConnectionProxy_listDatabaseURLsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[1];
  id v4 = [v2 _defaultProxyErrorHandlerWithSimpleReplyHandler:*(void *)(a1 + 40)];
  id v5 = [v3 remoteObjectProxyWithErrorHandler:v4];

  [v5 listDatabaseURLsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)beginURLCompletionSession:(id)a3
{
  id v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__WBSHistoryConnectionProxy_beginURLCompletionSession___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionProxyQueue, v7);
}

void __55__WBSHistoryConnectionProxy_beginURLCompletionSession___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[1];
  id v4 = [v2 _defaultProxyErrorHandlerWithSimpleReplyHandler:*(void *)(a1 + 40)];
  id v5 = [v3 remoteObjectProxyWithErrorHandler:v4];

  [v5 beginURLCompletionSession:*(void *)(a1 + 40)];
}

- (void)beginHistoryAccessSession:(id)a3
{
  id v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__WBSHistoryConnectionProxy_beginHistoryAccessSession___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionProxyQueue, v7);
}

void __55__WBSHistoryConnectionProxy_beginHistoryAccessSession___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[1];
  id v4 = [v2 _defaultProxyErrorHandlerWithSimpleReplyHandler:*(void *)(a1 + 40)];
  id v5 = [v3 remoteObjectProxyWithErrorHandler:v4];

  [v5 beginHistoryAccessSession:*(void *)(a1 + 40)];
}

- (void)killService
{
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__WBSHistoryConnectionProxy_killService__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_barrier_async(connectionProxyQueue, block);
}

uint64_t __40__WBSHistoryConnectionProxy_killService__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) _killConnection:9];
}

- (void)queryMemoryFootprint:(id)a3
{
  id v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__WBSHistoryConnectionProxy_queryMemoryFootprint___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionProxyQueue, v7);
}

void __50__WBSHistoryConnectionProxy_queryMemoryFootprint___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[1];
  id v4 = [v2 _defaultProxyErrorHandlerWithSimpleReplyHandler:*(void *)(a1 + 40)];
  id v5 = [v3 remoteObjectProxyWithErrorHandler:v4];

  [v5 queryMemoryFootprint:*(void *)(a1 + 40)];
}

- (id)queryMemoryFootprintWithError:(id *)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__20;
  id v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__20;
  id v12 = __Block_byref_object_dispose__20;
  id v13 = 0;
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke;
  block[3] = &unk_1E5C9C688;
  block[4] = self;
  void block[5] = &v8;
  block[6] = &v14;
  dispatch_sync(connectionProxyQueue, block);
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke_2;
  v6[3] = &unk_1E5C9C638;
  void v6[4] = *(void *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke_3;
  v4[3] = &unk_1E5C9C660;
  int8x16_t v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v3 queryMemoryFootprint:v4];
}

void __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

void __59__WBSHistoryConnectionProxy_queryMemoryFootprintWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __75__WBSHistoryConnectionProxy_connectWithOptions_delegate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  connectionProxyQueue = self->_connectionProxyQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__WBSHistoryConnectionProxy_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionProxyQueue, v7);
}

void __83__WBSHistoryConnectionProxy_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__WBSHistoryConnectionProxy_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5C8DCF8;
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 finishClearingHistoryIfNecessaryWithCompletionHandler:*(void *)(a1 + 40)];
}

uint64_t __83__WBSHistoryConnectionProxy_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E5C9C2B8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionProxyQueue, block);
}

void __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5C8DCF8;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_3;
  v5[3] = &unk_1E5C9C700;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 initializeCloudHistoryWithConfiguration:v4 completionHandler:v5];
}

uint64_t __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__WBSHistoryConnectionProxy_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_3(uint64_t a1, WBSCloudHistoryServiceProxy *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = a2;
    a2 = [[WBSCloudHistoryServiceProxy alloc] initWithProxy:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCompletionListVendorEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__WBSHistoryConnectionProxy_setCompletionListVendorEndpoint_completionHandler___block_invoke;
  block[3] = &unk_1E5C9C2B8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionProxyQueue, block);
}

void __79__WBSHistoryConnectionProxy_setCompletionListVendorEndpoint_completionHandler___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) synchronousRemoteObjectProxyWithErrorHandler:a1[6]];
  [v2 setCompletionListVendorEndpoint:a1[5] completionHandler:a1[6]];
}

- (void)getCompletionListItemsForQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionProxyQueue = self->_connectionProxyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke;
  block[3] = &unk_1E5C9C2B8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionProxyQueue, block);
}

void __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5C8DCF8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v4];
  [v3 getCompletionListItemsForQuery:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

void __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke_2_cold_1(v4, v3);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (OS_dispatch_queue)connectionProxyQueue
{
  return self->_connectionProxyQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProxyQueue, 0);
  objc_storeStrong((id *)&self->_inProcessFallbackService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "XPC connection_proxy init'd", v2, v3, v4, v5, v6);
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "XPC connection_proxy was interrupted", v2, v3, v4, v5, v6);
}

void __67__WBSHistoryConnectionProxy__setupConnectionWithInProcessFallback___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1A6B5F000, v0, v1, "XPC connection_proxy was invalidated", v2, v3, v4, v5, v6);
}

void __77__WBSHistoryConnectionProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "XPC Proxy reported: %{public}@", v7, v8, v9, v10, 2u);
}

void __45__WBSHistoryConnectionProxy_ensureConnected___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_ERROR, "Failed to retrieve history database URL", v1, 2u);
}

void __78__WBSHistoryConnectionProxy_getCompletionListItemsForQuery_completionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to connect to history service. Returning empty completion list. (%{public}@)", v7, v8, v9, v10, 2u);
}

@end