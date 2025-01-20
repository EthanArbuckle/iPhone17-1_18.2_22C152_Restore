@interface REUpNextSiriServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (REUpNextSiriServer)init;
- (void)_accessObservers:(id)a3;
- (void)_accessRemoteClients:(id)a3;
- (void)_onqueue_async:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)addObserver:(id)a3;
- (void)completedRequestWithDomain:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation REUpNextSiriServer

- (REUpNextSiriServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)REUpNextSiriServer;
  v2 = [(REUpNextSiriServer *)&v12 init];
  if (v2)
  {
    uint64_t v3 = RECreateSharedQueueWithQOS(@"upnext.siriserver", QOS_CLASS_UTILITY);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.NanoTimeKit.Siri"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v9;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  [(NSXPCListener *)self->_listener setDelegate:0];
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)REUpNextSiriServer;
  [(REUpNextSiriServer *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__REUpNextSiriServer_addObserver___block_invoke;
  v6[3] = &unk_2644BC688;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(REUpNextSiriServer *)self _onqueue_async:v6];
}

uint64_t __34__REUpNextSiriServer_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__REUpNextSiriServer_removeObserver___block_invoke;
  v6[3] = &unk_2644BC688;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(REUpNextSiriServer *)self _onqueue_async:v6];
}

uint64_t __37__REUpNextSiriServer_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (void)completedRequestWithDomain:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__REUpNextSiriServer_completedRequestWithDomain___block_invoke;
  v6[3] = &unk_2644BD2D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(REUpNextSiriServer *)self _accessObservers:v6];
}

uint64_t __49__REUpNextSiriServer_completedRequestWithDomain___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriServer:*(void *)(a1 + 32) receivedCompletedRequestDomain:*(void *)(a1 + 40)];
}

- (void)_accessObservers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__REUpNextSiriServer__accessObservers___block_invoke;
  v6[3] = &unk_2644BC5E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(REUpNextSiriServer *)self _onqueue_async:v6];
}

void __39__REUpNextSiriServer__accessObservers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = REUpNextSiriClientInterface();
  [v7 setRemoteObjectInterface:v8];

  long long v9 = REUpNextSiriServerInterface();
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  objc_initWeak(&location, v7);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__REUpNextSiriServer_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_2644BCE60;
  v14[4] = self;
  objc_copyWeak(&v15, &location);
  [v7 setInvalidationHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__REUpNextSiriServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v12[3] = &unk_2644BC688;
  v12[4] = self;
  id v10 = v7;
  id v13 = v10;
  [(REUpNextSiriServer *)self _onqueue_async:v12];
  [v10 resume];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

void __57__REUpNextSiriServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 _removeConnection:WeakRetained];
}

uint64_t __57__REUpNextSiriServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__REUpNextSiriServer__removeConnection___block_invoke;
    v6[3] = &unk_2644BC688;
    v6[4] = self;
    id v7 = v4;
    [(REUpNextSiriServer *)self _onqueue_async:v6];
  }
}

uint64_t __40__REUpNextSiriServer__removeConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)_accessRemoteClients:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__REUpNextSiriServer__accessRemoteClients___block_invoke;
  v6[3] = &unk_2644BC5E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(REUpNextSiriServer *)self _onqueue_async:v6];
}

void __43__REUpNextSiriServer__accessRemoteClients___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(a1 + 40);
        long long v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_11, (void)v9);
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __43__REUpNextSiriServer__accessRemoteClients___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = RELogForDomain(9);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __43__REUpNextSiriServer__accessRemoteClients___block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (void)_onqueue_async:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __43__REUpNextSiriServer__accessRemoteClients___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "XPC Siri Server connection error: %@", (uint8_t *)&v2, 0xCu);
}

@end