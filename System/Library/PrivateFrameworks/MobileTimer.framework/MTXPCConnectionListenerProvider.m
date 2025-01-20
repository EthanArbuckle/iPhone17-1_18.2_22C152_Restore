@interface MTXPCConnectionListenerProvider
+ (MTXPCConnectionListenerProvider)providerWithConnectionInfo:(id)a3 errorHandler:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MTXPCConnectionInfo)info;
- (MTXPCConnectionListenerProvider)initWithConnectionInfo:(id)a3 errorHandler:(id)a4;
- (NAScheduler)serializer;
- (NSArray)connectedClients;
- (NSMutableSet)clients;
- (NSString)description;
- (NSString)requiredEntitlement;
- (NSXPCListener)connectionListener;
- (id)_connectedClients;
- (id)_currentClientForConnection:(id)a3;
- (id)currentClient;
- (id)errorHandler;
- (void)_didInterruptConnection;
- (void)_didInvalidateConnection:(id)a3;
- (void)_performBlockOnClientInfos:(id)a3 excludingClient:(id)a4;
- (void)addClientConnection:(id)a3 clientLink:(id)a4;
- (void)dealloc;
- (void)performBlockOnAllClients:(id)a3;
- (void)performBlockOnAllClients:(id)a3 excludingClient:(id)a4;
- (void)performBlockOnAllClients:(id)a3 excludingCurrent:(BOOL)a4;
- (void)performBlockOnClientInfos:(id)a3 excludeCurrent:(BOOL)a4;
- (void)performBlockOnCurrentClient:(id)a3;
- (void)removeClientConnection:(id)a3;
- (void)setClients:(id)a3;
- (void)setConnectionListener:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInfo:(id)a3;
- (void)setRequiredEntitlement:(id)a3;
- (void)setSerializer:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation MTXPCConnectionListenerProvider

- (void)addClientConnection:(id)a3 clientLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTXPCConnectionListenerProvider *)self serializer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__MTXPCConnectionListenerProvider_addClientConnection_clientLink___block_invoke;
  v11[3] = &unk_1E5915078;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  [v8 performBlock:v11];
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

void __66__MTXPCConnectionListenerProvider_addClientConnection_clientLink___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  if (*(void *)(a1 + 32))
  {
    int v3 = [*(id *)(a1 + 40) processIdentifier];
    if (v3 != [v2 processIdentifier])
    {
      v4 = +[MTXPCClientInfo clientInfoForConnection:*(void *)(a1 + 40) clientLink:*(void *)(a1 + 32)];
      v5 = [*(id *)(a1 + 48) clients];
      char v6 = [v5 containsObject:v4];

      id v7 = MTLogForCategory(2);
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          id v9 = [*(id *)(a1 + 48) info];
          id v10 = [v9 machServiceName];
          int v17 = 138543618;
          v18 = v10;
          __int16 v19 = 2114;
          v20 = v4;
          _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Already has XPC client: %{public}@", (uint8_t *)&v17, 0x16u);
        }
      }
      else
      {
        if (v8)
        {
          v11 = [*(id *)(a1 + 48) info];
          id v12 = [v11 machServiceName];
          int v17 = 138543618;
          v18 = v12;
          __int16 v19 = 2114;
          v20 = v4;
          _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding XPC client: %{public}@", (uint8_t *)&v17, 0x16u);
        }
        id v7 = [*(id *)(a1 + 48) clients];
        [v7 addObject:v4];
      }

      id v13 = MTLogForCategory(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [*(id *)(a1 + 48) info];
        v15 = [v14 machServiceName];
        v16 = *(void **)(*(void *)(a1 + 48) + 40);
        int v17 = 138543618;
        v18 = v15;
        __int16 v19 = 2114;
        v20 = v16;
        _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Current XPC clients: %{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MTXPCConnectionListenerProvider *)self info];
  uint64_t v9 = [v8 requiredEntitlement];
  if (!v9)
  {

    goto LABEL_7;
  }
  id v10 = (void *)v9;
  v11 = [(MTXPCConnectionListenerProvider *)self info];
  id v12 = [v11 requiredEntitlement];
  id v13 = [v7 valueForEntitlement:v12];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
LABEL_7:
    int v17 = [(MTXPCConnectionListenerProvider *)self info];
    v18 = [v17 exportedObjectInterface];
    [v7 setExportedInterface:v18];

    __int16 v19 = [(MTXPCConnectionListenerProvider *)self info];
    v20 = [v19 exportedObject];
    [v7 setExportedObject:v20];

    uint64_t v21 = [(MTXPCConnectionListenerProvider *)self info];
    v22 = [v21 remoteObjectInterface];
    [v7 setRemoteObjectInterface:v22];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke;
    v30[3] = &unk_1E5917C28;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, &from);
    v23 = [v7 remoteObjectProxyWithErrorHandler:v30];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke_2;
    v27[3] = &unk_1E5917C50;
    objc_copyWeak(&v28, &location);
    objc_copyWeak(&v29, &from);
    [v7 setInvalidationHandler:v27];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke_17;
    v25[3] = &unk_1E5915428;
    objc_copyWeak(&v26, &location);
    [v7 setInterruptionHandler:v25];
    [(MTXPCConnectionListenerProvider *)self addClientConnection:v7 clientLink:v23];
    [v7 resume];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    BOOL v16 = 1;
    goto LABEL_8;
  }
  v15 = MTLogForCategory(2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MTXPCConnectionListenerProvider listener:shouldAcceptNewConnection:]((uint64_t)v7, v15);
  }

  BOOL v16 = 0;
LABEL_8:

  return v16;
}

- (MTXPCConnectionInfo)info
{
  return self->_info;
}

+ (MTXPCConnectionListenerProvider)providerWithConnectionInfo:(id)a3 errorHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConnectionInfo:v6 errorHandler:v5];

  return (MTXPCConnectionListenerProvider *)v7;
}

- (MTXPCConnectionListenerProvider)initWithConnectionInfo:(id)a3 errorHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"MTXPCConnectionListenerProvider.m" lineNumber:35 description:@"Connection info must be non-nil"];

    v24 = MTLogForCategory(2);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MTXPCConnectionProvider initWithConnectionInfo:errorHandler:reconnectHandler:](v24);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)MTXPCConnectionListenerProvider;
  id v10 = [(MTXPCConnectionListenerProvider *)&v25 init];
  if (v10)
  {
    uint64_t v11 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTXPCConnectionListenerProvider.serialqueue", +[MTScheduler defaultPriority]);
    serializer = v10->_serializer;
    v10->_serializer = (NAScheduler *)v11;

    objc_storeStrong((id *)&v10->_info, a3);
    id v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    clients = v10->_clients;
    v10->_clients = v13;

    uint64_t v15 = [v9 copy];
    id errorHandler = v10->_errorHandler;
    v10->_id errorHandler = (id)v15;

    id v17 = objc_alloc(MEMORY[0x1E4F29290]);
    v18 = [(MTXPCConnectionListenerProvider *)v10 info];
    __int16 v19 = [v18 machServiceName];
    uint64_t v20 = [v17 initWithMachServiceName:v19];
    connectionListener = v10->_connectionListener;
    v10->_connectionListener = (NSXPCListener *)v20;

    [(NSXPCListener *)v10->_connectionListener setDelegate:v10];
  }

  return v10;
}

- (void)startListening
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = MTLogForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    uint64_t v11 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming connection", (uint8_t *)&v10, 0xCu);
  }

  [(NSXPCListener *)self->_connectionListener resume];
  v4 = [(MTXPCConnectionInfo *)self->_info lifecycleNotification];

  if (v4)
  {
    id v5 = MTLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(MTXPCConnectionInfo *)self->_info lifecycleNotification];
      int v10 = 138543618;
      uint64_t v11 = self;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "Listener %{public}@ posting lifecycle darwin notification %{public}@", (uint8_t *)&v10, 0x16u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    id v8 = [(MTXPCConnectionListenerProvider *)self info];
    id v9 = [v8 lifecycleNotification];
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v9, 0, 0, 1u);
  }
}

void __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didInvalidateConnection:v2];
}

void __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [v3 _xpcConnection];
  if (v4)
  {
    id v5 = [v3 _xpcConnection];
    id v6 = (char *)xpc_connection_copy_invalidation_reason();
  }
  else
  {
    id v6 = 0;
  }

  id v7 = [NSString alloc];
  id v8 = "unknown";
  if (v6) {
    id v8 = v6;
  }
  id v9 = objc_msgSend(v7, "initWithFormat:", @"%s", v8);
  free(v6);
  int v10 = MTLogForCategory(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v12 = WeakRetained;
    __int16 v13 = 2114;
    id v14 = v3;
    __int16 v15 = 2114;
    BOOL v16 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidation handler called for connection %{public}@ with error: %{public}@", buf, 0x20u);
  }

  [WeakRetained _didInvalidateConnection:v3];
}

void __70__MTXPCConnectionListenerProvider_listener_shouldAcceptNewConnection___block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didInterruptConnection];
}

- (void)_didInterruptConnection
{
  v1 = [a1 info];
  id v2 = [v1 machServiceName];
  OUTLINED_FUNCTION_0_4(&dword_19CC95000, v3, v4, "Connection to server via %{public}@ mach port was interrupted.", v5, v6, v7, v8, 2u);
}

- (void)_didInvalidateConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MTXPCConnectionListenerProvider _didInvalidateConnection:](self);
  }

  [(MTXPCConnectionListenerProvider *)self removeClientConnection:v4];
  uint64_t v6 = [(MTXPCConnectionListenerProvider *)self errorHandler];

  if (v6)
  {
    uint64_t v7 = [(MTXPCConnectionListenerProvider *)self errorHandler];
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
}

- (void)removeClientConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTXPCConnectionListenerProvider *)self serializer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__MTXPCConnectionListenerProvider_removeClientConnection___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __58__MTXPCConnectionListenerProvider_removeClientConnection___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_connectedClients", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v8 = [v7 connection];
        id v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          int v10 = MTLogForCategory(2);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = [*(id *)(a1 + 32) info];
            id v12 = [v11 machServiceName];
            *(_DWORD *)buf = 138543618;
            v23 = v12;
            __int16 v24 = 2114;
            objc_super v25 = v7;
            _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing XPC client: %{public}@", buf, 0x16u);
          }
          __int16 v13 = [*(id *)(a1 + 32) clients];
          [v13 removeObject:v7];

          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  id v14 = MTLogForCategory(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [*(id *)(a1 + 32) info];
    BOOL v16 = [v15 machServiceName];
    uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    __int16 v24 = 2114;
    objc_super v25 = v17;
    _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Current XPC clients: %{public}@", buf, 0x16u);
  }
}

- (NSArray)connectedClients
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__14;
  __int16 v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(MTXPCConnectionListenerProvider *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MTXPCConnectionListenerProvider_connectedClients__block_invoke;
  v8[3] = &unk_1E59150F8;
  int v10 = &v11;
  v8[4] = self;
  uint64_t v5 = v3;
  id v9 = v5;
  [v4 performBlock:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

intptr_t __51__MTXPCConnectionListenerProvider_connectedClients__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _connectedClients];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v5);
}

- (id)_connectedClients
{
  uint64_t v2 = [(MTXPCConnectionListenerProvider *)self clients];
  uint64_t v3 = [v2 allObjects];

  return v3;
}

- (id)currentClient
{
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__14;
  long long v18 = __Block_byref_object_dispose__14;
  id v19 = 0;
  uint64_t v3 = [MEMORY[0x1E4F29268] currentConnection];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = [(MTXPCConnectionListenerProvider *)self serializer];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__MTXPCConnectionListenerProvider_currentClient__block_invoke;
  v10[3] = &unk_1E5917C78;
  uint64_t v13 = &v14;
  v10[4] = self;
  id v6 = v3;
  id v11 = v6;
  uint64_t v7 = v4;
  id v12 = v7;
  [v5 performBlock:v10];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

intptr_t __48__MTXPCConnectionListenerProvider_currentClient__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _currentClientForConnection:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_semaphore_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v5);
}

- (id)_currentClientForConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(MTXPCConnectionListenerProvider *)self _connectedClients];
    id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v10 = [v9 connection];

          if (v10 == v4)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)performBlockOnCurrentClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  id v6 = [(MTXPCConnectionListenerProvider *)self serializer];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__MTXPCConnectionListenerProvider_performBlockOnCurrentClient___block_invoke;
  v9[3] = &unk_1E5915120;
  v9[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 performBlock:v9];
}

void __63__MTXPCConnectionListenerProvider_performBlockOnCurrentClient___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _currentClientForConnection:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [v4 clientLink];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (void)performBlockOnAllClients:(id)a3
{
}

- (void)performBlockOnAllClients:(id)a3 excludingCurrent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingCurrent___block_invoke;
  v8[3] = &unk_1E5917CA0;
  id v9 = v6;
  id v7 = v6;
  [(MTXPCConnectionListenerProvider *)self performBlockOnClientInfos:v8 excludeCurrent:v4];
}

void __77__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingCurrent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 clientLink];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)performBlockOnClientInfos:(id)a3 excludeCurrent:(BOOL)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F29268] currentConnection];
  id v8 = [(MTXPCConnectionListenerProvider *)self serializer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__MTXPCConnectionListenerProvider_performBlockOnClientInfos_excludeCurrent___block_invoke;
  v11[3] = &unk_1E5917CC8;
  BOOL v14 = a4;
  void v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 performBlock:v11];
}

void __76__MTXPCConnectionListenerProvider_performBlockOnClientInfos_excludeCurrent___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _currentClientForConnection:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  [*(id *)(a1 + 32) _performBlockOnClientInfos:*(void *)(a1 + 48) excludingClient:v2];
}

- (void)performBlockOnAllClients:(id)a3 excludingClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MTXPCConnectionListenerProvider *)self serializer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingClient___block_invoke;
  v11[3] = &unk_1E5915C60;
  id v12 = v7;
  id v13 = v6;
  void v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

void __76__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingClient___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingClient___block_invoke_2;
  v3[3] = &unk_1E5917CA0;
  id v4 = *(id *)(a1 + 48);
  [v2 _performBlockOnClientInfos:v3 excludingClient:*(void *)(a1 + 40)];
}

void __76__MTXPCConnectionListenerProvider_performBlockOnAllClients_excludingClient___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 clientLink];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)_performBlockOnClientInfos:(id)a3 excludingClient:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(MTXPCConnectionListenerProvider *)self _connectedClients];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * v12);
        if (!v7 || ([*(id *)(*((void *)&v14 + 1) + 8 * v12) isEqual:v7] & 1) == 0) {
          v6[2](v6, v13);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)stopListening
{
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(MTXPCConnectionListenerProvider *)self info];
  id v6 = [v5 machServiceName];
  id v7 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v6];

  return (NSString *)v7;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_connectionListener setDelegate:0];
  [(NSXPCListener *)self->_connectionListener invalidate];
  connectionListener = self->_connectionListener;
  self->_connectionListener = 0;

  v4.receiver = self;
  v4.super_class = (Class)MTXPCConnectionListenerProvider;
  [(MTXPCConnectionListenerProvider *)&v4 dealloc];
}

- (void)setInfo:(id)a3
{
}

- (void)setSerializer:(id)a3
{
}

- (NSString)requiredEntitlement
{
  return self->_requiredEntitlement;
}

- (void)setRequiredEntitlement:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (void)setClients:(id)a3
{
}

- (NSXPCListener)connectionListener
{
  return self->_connectionListener;
}

- (void)setConnectionListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_requiredEntitlement, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "Connection %{public}@ not entitled", (uint8_t *)&v2, 0xCu);
}

- (void)_didInvalidateConnection:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 info];
  int v2 = [v1 machServiceName];
  OUTLINED_FUNCTION_0_4(&dword_19CC95000, v3, v4, "Connection to server via %{public}@ mach port was invalidated. Removing server side connection", v5, v6, v7, v8, 2u);
}

@end