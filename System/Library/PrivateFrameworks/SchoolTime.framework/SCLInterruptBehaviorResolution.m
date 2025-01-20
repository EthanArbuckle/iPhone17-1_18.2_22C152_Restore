@interface SCLInterruptBehaviorResolution
+ (id)resolutionForClientIdentifier:(id)a3;
- (SCLInterruptBehaviorResolution)initWithClientIdentifier:(id)a3;
- (id)resolveBehaviorForEvent:(id)a3 error:(id *)a4;
- (id)serverConnection;
- (void)setServerConnection:(id)a3;
@end

@implementation SCLInterruptBehaviorResolution

+ (id)resolutionForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (resolutionForClientIdentifier__onceToken != -1) {
    dispatch_once(&resolutionForClientIdentifier__onceToken, &__block_literal_global_5);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v5 = resolutionForClientIdentifier__lockQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SCLInterruptBehaviorResolution_resolutionForClientIdentifier___block_invoke_2;
  block[3] = &unk_2648AC780;
  id v10 = v4;
  v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __64__SCLInterruptBehaviorResolution_resolutionForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.schooltime.eventBehaviorResolution", v0);
  v2 = (void *)resolutionForClientIdentifier__lockQueue;
  resolutionForClientIdentifier__lockQueue = (uint64_t)v1;

  resolutionForClientIdentifier__resolutionByClientIdentifier = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:517];
  return MEMORY[0x270F9A758]();
}

void __64__SCLInterruptBehaviorResolution_resolutionForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)resolutionForClientIdentifier__resolutionByClientIdentifier objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)resolutionForClientIdentifier__resolutionByClientIdentifier;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (SCLInterruptBehaviorResolution)initWithClientIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLInterruptBehaviorResolution;
  uint64_t v6 = [(SCLInterruptBehaviorResolution *)&v11 init];
  if (v6)
  {
    id v7 = scl_interrupt_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_22B7B4000, v7, OS_LOG_TYPE_INFO, "Creating SCLInterruptBehaviorResolution for client %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_clientIdentifier, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.schooltime.behaviorResolutionConnection", 0);
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;
  }
  return v6;
}

- (id)resolveBehaviorForEvent:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = scl_interrupt_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = clientIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_22B7B4000, v7, OS_LOG_TYPE_INFO, "Resolving behavior for client %@ event %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  uint64_t v9 = [(SCLInterruptBehaviorResolution *)self serverConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__SCLInterruptBehaviorResolution_resolveBehaviorForEvent_error___block_invoke;
  v16[3] = &unk_2648AC558;
  v16[4] = buf;
  uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
  objc_super v11 = self->_clientIdentifier;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__SCLInterruptBehaviorResolution_resolveBehaviorForEvent_error___block_invoke_2;
  v15[3] = &unk_2648AC7A8;
  v15[4] = &v17;
  v15[5] = buf;
  [v10 resolveBehaviorForEvent:v6 clientIdentifier:v11 completion:v15];

  if (a4) {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
  }
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    id v12 = scl_interrupt_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SCLInterruptBehaviorResolution resolveBehaviorForEvent:error:]((uint64_t)v6, (uint64_t)&buf[8], v12);
    }
  }
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __64__SCLInterruptBehaviorResolution_resolveBehaviorForEvent_error___block_invoke(uint64_t a1, void *a2)
{
}

void __64__SCLInterruptBehaviorResolution_resolveBehaviorForEvent_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (!v7)
  {
    dispatch_queue_t v8 = scl_interrupt_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_22B7B4000, v8, OS_LOG_TYPE_INFO, "Resolved behavior %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)serverConnection
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke;
  block[3] = &unk_2648AC6A0;
  void block[4] = self;
  dispatch_sync(connectionQueue, block);
  return self->_connection;
}

void __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:0x26DF074D8 options:0];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;

    id v5 = *(void **)(*(void *)(a1 + 32) + 16);
    id v6 = SCLInterruptBehaviorResolutionXPCServerInterface();
    [v5 setRemoteObjectInterface:v6];

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(*(void *)(a1 + 32) + 16);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke_2;
    v11[3] = &unk_2648AC4E0;
    objc_copyWeak(&v12, &location);
    [v7 setInterruptionHandler:v11];
    dispatch_queue_t v8 = *(void **)(*(void *)(a1 + 32) + 16);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke_7;
    v9[3] = &unk_2648AC4E0;
    objc_copyWeak(&v10, &location);
    [v8 setInvalidationHandler:v9];
    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = scl_interrupt_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22B7B4000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setServerConnection:0];
}

void __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke_7(uint64_t a1)
{
  uint64_t v2 = scl_interrupt_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22B7B4000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setServerConnection:0];
}

- (void)setServerConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SCLInterruptBehaviorResolution_setServerConnection___block_invoke;
  block[3] = &unk_2648AC210;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__SCLInterruptBehaviorResolution_setServerConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)resolveBehaviorForEvent:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "Could not resolve behavior for event %@ (error:%@)", (uint8_t *)&v4, 0x16u);
}

@end