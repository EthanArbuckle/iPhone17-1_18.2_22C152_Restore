@interface WFServiceConnection
+ (id)allAllowedClasses;
+ (id)weatherServiceClientInterface;
+ (id)weatherServiceInterface;
- (NSMutableDictionary)dispatchGroupForTaskIdentifier;
- (NSMutableDictionary)executionStartTimeForTaskIdentifier;
- (NSMutableDictionary)tasksPendingResponseForTaskIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)internalStateQueue;
- (OS_dispatch_queue)queue;
- (WFServiceConnection)init;
- (WeatherServiceProtocol)serviceProxy;
- (void)_callbackAllPendingTasksOnInvalidate:(id)a3;
- (void)_cleanup;
- (void)_handleRemoteObjectProxyError:(id)a3;
- (void)_onQueueInvalidateConnection:(id)a3;
- (void)_onQueueOpenConnection;
- (void)accessServiceWithBlock:(id)a3;
- (void)cancelRequestWithIdentifier:(id)a3;
- (void)dealloc;
- (void)enqueueRequest:(id)a3;
- (void)enqueueRequest:(id)a3 waitUntilDone:(BOOL)a4;
- (void)invalidate;
- (void)invalidateCache;
- (void)serviceDidReceiveResponse:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setInternalStateQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)taskIdentifier:(id)a3;
@end

@implementation WFServiceConnection

+ (id)allAllowedClasses
{
  v22[5] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v12 = (void *)MEMORY[0x263EFFA08];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  v22[4] = objc_opt_class();
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:5];
  v14 = [v12 setWithArray:v13];

  v15 = (void *)MEMORY[0x263EFFA08];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  v21[4] = objc_opt_class();
  v21[5] = objc_opt_class();
  v21[6] = objc_opt_class();
  v21[7] = objc_opt_class();
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:8];
  v17 = [v15 setWithArray:v16];

  v18 = [v11 setByAddingObjectsFromSet:v14];
  v19 = [v18 setByAddingObjectsFromSet:v17];

  return v19;
}

+ (id)weatherServiceInterface
{
  if (weatherServiceInterface_onceToken != -1) {
    dispatch_once(&weatherServiceInterface_onceToken, &__block_literal_global_30);
  }
  id v2 = (void *)weatherServiceInterface_interface;
  return v2;
}

uint64_t __51__WFServiceConnection_XPC__weatherServiceInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD69B78];
  uint64_t v1 = weatherServiceInterface_interface;
  weatherServiceInterface_interface = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)weatherServiceClientInterface
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__WFServiceConnection_XPC__weatherServiceClientInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (weatherServiceClientInterface_onceToken != -1) {
    dispatch_once(&weatherServiceClientInterface_onceToken, block);
  }
  id v2 = (void *)weatherServiceClientInterface_interface;
  return v2;
}

void __57__WFServiceConnection_XPC__weatherServiceClientInterface__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD701F8];
  uint64_t v3 = (void *)weatherServiceClientInterface_interface;
  weatherServiceClientInterface_interface = v2;

  id v4 = [*(id *)(a1 + 32) allAllowedClasses];
  [(id)weatherServiceClientInterface_interface setClasses:v4 forSelector:sel_serviceDidReceiveResponse_ argumentIndex:0 ofReply:0];
  [(id)weatherServiceClientInterface_interface setClasses:v4 forSelector:sel_taskIdentifier_ argumentIndex:0 ofReply:1];
}

- (WFServiceConnection)init
{
  v16.receiver = self;
  v16.super_class = (Class)WFServiceConnection;
  uint64_t v2 = [(WFServiceConnection *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WeatherFoundation.ServiceConnectionQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.WeatherFoundation.ServiceConnection.CallbackQueue", MEMORY[0x263EF83A8]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.WeatherFoundation.ServiceConnection.InternalStateQueue", 0);
    internalStateQueue = v2->_internalStateQueue;
    v2->_internalStateQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    tasksPendingResponseForTaskIdentifier = v2->_tasksPendingResponseForTaskIdentifier;
    v2->_tasksPendingResponseForTaskIdentifier = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    dispatchGroupForTaskIdentifier = v2->_dispatchGroupForTaskIdentifier;
    v2->_dispatchGroupForTaskIdentifier = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    executionStartTimeForTaskIdentifier = v2->_executionStartTimeForTaskIdentifier;
    v2->_executionStartTimeForTaskIdentifier = (NSMutableDictionary *)v13;
  }
  return v2;
}

- (void)dealloc
{
  [(WFServiceConnection *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)WFServiceConnection;
  [(WFServiceConnection *)&v3 dealloc];
}

- (void)accessServiceWithBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  dispatch_queue_t v5 = [(WFServiceConnection *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__WFServiceConnection_accessServiceWithBlock___block_invoke;
  v6[3] = &unk_264430778;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5]);
  _Block_object_dispose(&v7, 8);
}

uint64_t __46__WFServiceConnection_accessServiceWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serviceProxy];

  if (!v2) {
    [*(id *)(a1 + 32) _onQueueOpenConnection];
  }
  uint64_t v3 = [*(id *)(a1 + 32) serviceProxy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (void)cancelRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 UUID];
  uint64_t v6 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[WFServiceConnection cancelRequestWithIdentifier:]();
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__WFServiceConnection_cancelRequestWithIdentifier___block_invoke;
  v9[3] = &unk_264432728;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [(WFServiceConnection *)self accessServiceWithBlock:v9];
}

void __51__WFServiceConnection_cancelRequestWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  [a2 cancelTaskWithIdentifier:*(void *)(a1 + 32)];
  uint64_t v3 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __51__WFServiceConnection_cancelRequestWithIdentifier___block_invoke_cold_1(a1, v3);
  }
}

- (void)enqueueRequest:(id)a3
{
}

- (void)enqueueRequest:(id)a3 waitUntilDone:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isCancelled])
  {
    [v6 handleCancellation];
  }
  else
  {
    id v7 = [v6 identifier];
    id v8 = [v7 UUID];

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    id v10 = WFLogForCategory(4uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[WFServiceConnection enqueueRequest:waitUntilDone:](v6);
    }

    if ([v6 requiresResponse])
    {
      id v11 = [(WFServiceConnection *)self internalStateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke;
      block[3] = &unk_264432750;
      block[4] = self;
      id v25 = v6;
      id v26 = v8;
      CFAbsoluteTime v27 = Current;
      dispatch_async(v11, block);
    }
    if (v4)
    {
      id v12 = dispatch_group_create();
      dispatch_group_enter(v12);
      uint64_t v13 = [(WFServiceConnection *)self internalStateQueue];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke_2;
      v21[3] = &unk_2644314E8;
      v21[4] = self;
      id v22 = v8;
      v14 = v12;
      v23 = v14;
      dispatch_async(v13, v21);
    }
    else
    {
      v14 = 0;
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke_3;
    v19[3] = &unk_264432778;
    id v20 = v6;
    [(WFServiceConnection *)self accessServiceWithBlock:v19];
    if (v4)
    {
      dispatch_time_t v15 = dispatch_time(0, 30000000000);
      intptr_t v16 = dispatch_group_wait(v14, v15);
      v17 = WFLogForCategory(4uLL);
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
      if (v16)
      {
        if (v18) {
          -[WFServiceConnection enqueueRequest:waitUntilDone:](v8);
        }
      }
      else if (v18)
      {
        -[WFServiceConnection enqueueRequest:waitUntilDone:](v8);
      }
    }
  }
}

void __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tasksPendingResponseForTaskIdentifier];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  id v4 = [*(id *)(a1 + 32) executionStartTimeForTaskIdentifier];
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  [v4 setObject:v3 forKey:*(void *)(a1 + 48)];
}

void __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) dispatchGroupForTaskIdentifier];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

uint64_t __52__WFServiceConnection_enqueueRequest_waitUntilDone___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) startWithService:a2];
}

- (void)invalidate
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Service Connection has been invalidated.", v1, 2u);
}

void __33__WFServiceConnection_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 12);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _onQueueInvalidateConnection:v2];
}

- (void)invalidateCache
{
  id v3 = objc_opt_new();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__WFServiceConnection_invalidateCache__block_invoke;
  v5[3] = &unk_264432778;
  id v6 = v3;
  id v4 = v3;
  [(WFServiceConnection *)self accessServiceWithBlock:v5];
}

uint64_t __38__WFServiceConnection_invalidateCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidateCache:*(void *)(a1 + 32)];
}

- (void)_handleRemoteObjectProxyError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[WFServiceConnection _handleRemoteObjectProxyError:]();
  }

  id v6 = [(WFServiceConnection *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__WFServiceConnection__handleRemoteObjectProxyError___block_invoke;
  v8[3] = &unk_264431680;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __53__WFServiceConnection__handleRemoteObjectProxyError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueInvalidateConnection:*(void *)(a1 + 40)];
}

- (void)_onQueueOpenConnection
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Setting up connection to service...", v1, 2u);
}

- (void)_cleanup
{
  id v3 = [(WFServiceConnection *)self serviceProxy];
  [v3 removeClient:self];
  [(WFServiceConnection *)self setServiceProxy:0];
  [(WFServiceConnection *)self _callbackAllPendingTasksOnInvalidate:0];
}

- (void)_onQueueInvalidateConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFServiceConnection *)self serviceProxy];
  [v5 removeClient:self];
  [(WFServiceConnection *)self setServiceProxy:0];
  id v6 = [(WFServiceConnection *)self internalStateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__WFServiceConnection__onQueueInvalidateConnection___block_invoke;
  v8[3] = &unk_264431680;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __52__WFServiceConnection__onQueueInvalidateConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callbackAllPendingTasksOnInvalidate:*(void *)(a1 + 40)];
}

- (void)_callbackAllPendingTasksOnInvalidate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[WFServiceConnection _callbackAllPendingTasksOnInvalidate:]();
  }

  id v6 = [(WFServiceConnection *)self tasksPendingResponseForTaskIdentifier];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__WFServiceConnection__callbackAllPendingTasksOnInvalidate___block_invoke;
  v12[3] = &unk_2644327A0;
  id v13 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  id v8 = [(WFServiceConnection *)self tasksPendingResponseForTaskIdentifier];
  [v8 removeAllObjects];

  id v9 = [(WFServiceConnection *)self dispatchGroupForTaskIdentifier];
  [v9 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_31];

  id v10 = [(WFServiceConnection *)self dispatchGroupForTaskIdentifier];
  [v10 removeAllObjects];

  id v11 = [(WFServiceConnection *)self executionStartTimeForTaskIdentifier];
  [v11 removeAllObjects];
}

void __60__WFServiceConnection__callbackAllPendingTasksOnInvalidate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = (id)[v4 copy];
  [v5 handleError:v7 forResponseIdentifier:v6];
}

void __60__WFServiceConnection__callbackAllPendingTasksOnInvalidate___block_invoke_2(int a1, int a2, dispatch_group_t group)
{
}

- (void)taskIdentifier:(id)a3
{
  uint64_t v3 = taskIdentifier__onceToken;
  id v4 = a3;
  id v5 = v4;
  if (v3 != -1)
  {
    dispatch_once(&taskIdentifier__onceToken, &__block_literal_global_16);
    id v4 = v5;
  }
  (*((void (**)(id, uint64_t))v4 + 2))(v4, taskIdentifier__defaultTaskIdentifier);
}

uint64_t __38__WFServiceConnection_taskIdentifier___block_invoke()
{
  uint64_t v0 = +[WFTaskIdentifier defaultIdentifier];
  uint64_t v1 = taskIdentifier__defaultTaskIdentifier;
  taskIdentifier__defaultTaskIdentifier = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)serviceDidReceiveResponse:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  id v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__3;
  v30[4] = __Block_byref_object_dispose__3;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  id v29 = 0;
  id v5 = [(WFServiceConnection *)self internalStateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke;
  block[3] = &unk_2644327E8;
  id v25 = &v32;
  block[4] = self;
  id v6 = v4;
  id v24 = v6;
  id v26 = v30;
  CFAbsoluteTime v27 = v28;
  dispatch_sync(v5, block);

  if (!v33[5])
  {
    id v7 = WFLogForCategory(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 identifier];
      [(WFServiceConnection *)v8 serviceDidReceiveResponse:v7];
    }
  }
  id v9 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [(id)v33[5] identifier];
    [(WFServiceConnection *)v10 serviceDidReceiveResponse:v9];
  }

  id v11 = [(WFServiceConnection *)self callbackQueue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_17;
  v19[3] = &unk_264432810;
  id v12 = v6;
  id v20 = v12;
  v21 = v28;
  id v22 = &v32;
  dispatch_sync(v11, v19);

  id v13 = [(WFServiceConnection *)self internalStateQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_18;
  v15[3] = &unk_264432838;
  v15[4] = self;
  id v16 = v12;
  v17 = &v32;
  BOOL v18 = v30;
  id v14 = v12;
  dispatch_async(v13, v15);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(&v32, 8);
}

void __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tasksPendingResponseForTaskIdentifier];
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) dispatchGroupForTaskIdentifier];
  id v8 = [*(id *)(a1 + 40) identifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  id v16 = [*(id *)(a1 + 32) executionStartTimeForTaskIdentifier];
  id v12 = [*(id *)(a1 + 40) identifier];
  uint64_t v13 = [v16 objectForKeyedSubscript:v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  dispatch_time_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

uint64_t __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_17(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) doubleValue];
  [*(id *)(a1 + 32) setExecutionTime:Current - v3];
  uint64_t v4 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_17_cold_1((id *)(a1 + 32));
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) handleResponse:*(void *)(a1 + 32)];
}

void __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_18(uint64_t a1)
{
  id v2 = WFLogForCategory(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_18_cold_1(a1);
  }

  double v3 = [*(id *)(a1 + 32) tasksPendingResponseForTaskIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) identifier];
  [v3 removeObjectForKey:v4];

  uint64_t v5 = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v5)
  {
    dispatch_group_leave(v5);
    id v6 = [*(id *)(a1 + 32) dispatchGroupForTaskIdentifier];
    id v7 = [*(id *)(a1 + 40) identifier];
    [v6 removeObjectForKey:v7];
  }
  id v8 = [*(id *)(a1 + 32) executionStartTimeForTaskIdentifier];
  uint64_t v9 = [*(id *)(a1 + 40) identifier];
  [v8 removeObjectForKey:v9];
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)internalStateQueue
{
  return self->_internalStateQueue;
}

- (void)setInternalStateQueue:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (WeatherServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)tasksPendingResponseForTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)dispatchGroupForTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)executionStartTimeForTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionStartTimeForTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchGroupForTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_tasksPendingResponseForTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_internalStateQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)cancelRequestWithIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21C988000, v0, OS_LOG_TYPE_DEBUG, "Cancelling %@", v1, 0xCu);
}

void __51__WFServiceConnection_cancelRequestWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "Cancellation sent for identifier %@", (uint8_t *)&v3, 0xCu);
}

- (void)enqueueRequest:(void *)a1 waitUntilDone:.cold.1(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_21C988000, v2, v3, "Dispatch group for task %s completed successfully", v4, v5, v6, v7, v8);
}

- (void)enqueueRequest:(void *)a1 waitUntilDone:.cold.2(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_21C988000, v2, v3, "Dispatch group for task %s timed out", v4, v5, v6, v7, v8);
}

- (void)enqueueRequest:(void *)a1 waitUntilDone:.cold.3(void *a1)
{
  [a1 requiresResponse];
  OUTLINED_FUNCTION_1(&dword_21C988000, v1, v2, "Servicing new %s: %@", v3, v4, v5, v6, 2u);
}

- (void)_handleRemoteObjectProxyError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21C988000, v0, OS_LOG_TYPE_ERROR, "Remote object proxy encountered an error: %@", v1, 0xCu);
}

- (void)_callbackAllPendingTasksOnInvalidate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21C988000, v0, OS_LOG_TYPE_ERROR, "WFServiceConnection has had its service proxy invalidated: %@", v1, 0xCu);
}

- (void)serviceDidReceiveResponse:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_21C988000, log, OS_LOG_TYPE_DEBUG, "(%@) Received response for request", buf, 0xCu);
}

- (void)serviceDidReceiveResponse:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "(%@) Received response for untracked task identifier", buf, 0xCu);
}

void __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_17_cold_1(id *a1)
{
  uint64_t v2 = [*a1 identifier];
  [*a1 executionTime];
  OUTLINED_FUNCTION_1(&dword_21C988000, v3, v4, "(%@) Response received in %2.5f", v5, v6, v7, v8, 2u);
}

void __49__WFServiceConnection_serviceDidReceiveResponse___block_invoke_18_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_21C988000, v2, v3, "Cleaning up after %@", v4, v5, v6, v7, v8);
}

@end