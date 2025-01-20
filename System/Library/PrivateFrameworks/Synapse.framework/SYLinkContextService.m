@interface SYLinkContextService
- (BOOL)_forTesting;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSArray)_contextsDataForTesting;
- (NSXPCConnection)_activeConnection;
- (NSXPCListener)_listener;
- (OS_dispatch_queue)_serviceQueue;
- (SYLinkContextService)init;
- (id)_listenerEndpoint;
- (id)initForTesting:(BOOL)a3;
- (void)beginListeningToConnections;
- (void)dealloc;
- (void)fetchLinkContextsDataForUserActivityInfo:(id)a3 completion:(id)a4;
- (void)set_activeConnection:(id)a3;
- (void)set_contextsDataForTesting:(id)a3;
- (void)set_listener:(id)a3;
- (void)set_serviceQueue:(id)a3;
- (void)userDidRemoveContentItemDatas:(id)a3;
- (void)userEditDidAddContentItemDatas:(id)a3;
- (void)userWillAddLinkWithActivityData:(id)a3 completion:(id)a4;
@end

@implementation SYLinkContextService

- (SYLinkContextService)init
{
  return (SYLinkContextService *)[(SYLinkContextService *)self initForTesting:0];
}

- (id)initForTesting:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SYLinkContextService;
  v4 = [(SYLinkContextService *)&v9 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.synapse.LinkContextService", v5);
    serviceQueue = v4->__serviceQueue;
    v4->__serviceQueue = (OS_dispatch_queue *)v6;

    v4->__forTesting = a3;
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(SYLinkContextService *)self _listener];
  [v3 setDelegate:0];

  v4 = [(SYLinkContextService *)self _listener];
  [v4 invalidate];

  [(SYLinkContextService *)self set_listener:0];
  v5.receiver = self;
  v5.super_class = (Class)SYLinkContextService;
  [(SYLinkContextService *)&v5 dealloc];
}

- (void)beginListeningToConnections
{
  v3 = [(SYLinkContextService *)self _listener];

  if (!v3)
  {
    BOOL v4 = [(SYLinkContextService *)self _forTesting];
    objc_super v5 = os_log_create("com.apple.synapse", "LinkContext");
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextService: Starting Link Context Service with anonymous listener for testing", buf, 2u);
      }

      uint64_t v7 = [MEMORY[0x1E4F29290] anonymousListener];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextService: Starting Link Context Service", v13, 2u);
      }

      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.synapse.link-context-service"];
    }
    v8 = (void *)v7;
    [(SYLinkContextService *)self set_listener:v7];

    objc_super v9 = [(SYLinkContextService *)self _listener];
    v10 = [(SYLinkContextService *)self _serviceQueue];
    [v9 _setQueue:v10];

    v11 = [(SYLinkContextService *)self _listener];
    [v11 setDelegate:self];

    v12 = [(SYLinkContextService *)self _listener];
    [v12 resume];
  }
}

- (void)fetchLinkContextsDataForUserActivityInfo:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  v8 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v16 = v6;
    _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_DEFAULT, "LinkContextService: Received request to fetch link context. Activity info: %p", buf, 0xCu);
  }

  objc_super v9 = [(SYLinkContextService *)self _contextsDataForTesting];

  if (v9)
  {
    v10 = [(SYLinkContextService *)self _contextsDataForTesting];
    v7[2](v7, v10, 0);
  }
  else if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__SYLinkContextService_fetchLinkContextsDataForUserActivityInfo_completion___block_invoke;
    v12[3] = &unk_1E6463A60;
    id v13 = v6;
    v14 = v7;
    +[SYItemIndexingManager fetchLinkContextsDataForUserActivity:v13 completion:v12];
  }
  else
  {
    v11 = os_log_create("com.apple.synapse", "LinkContext");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v16 = 0;
      _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_DEFAULT, "LinkContextService: Finished fetch link context request for activity: %p, calling completion with no data.", buf, 0xCu);
    }

    v7[2](v7, (void *)MEMORY[0x1E4F1CBF0], 0);
  }
}

void __76__SYLinkContextService_fetchLinkContextsDataForUserActivityInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218240;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    uint64_t v9 = [v3 count];
    _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_DEFAULT, "LinkContextService: Finished fetch link context request for activity: %p. Found: %ld", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)userWillAddLinkWithActivityData:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  __int16 v8 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(SYLinkContextService *)self _activeConnection];
    int v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_DEFAULT, "LinkContextService: userWillAddLinkWithActivityData, activeConnection = %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v10 = [(SYLinkContextService *)self _activeConnection];

  if (v10)
  {
    v11 = [(SYLinkContextService *)self _activeConnection];
    v12 = [v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_2];

    if (v12)
    {
      [v12 userWillAddLinkWithActivityData:v6 completion:v7];
    }
    else if (v7)
    {
      v7[2](v7, 0);
    }
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

void __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke_cold_1();
  }
}

- (void)userDidRemoveContentItemDatas:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SYLinkContextService *)self _activeConnection];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextService: userDidRemoveContentItemDatas, activeConnection = %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = [(SYLinkContextService *)self _activeConnection];

  if (v7)
  {
    __int16 v8 = [(SYLinkContextService *)self _activeConnection];
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_14];

    if (v9) {
      [v9 userDidRemoveContentItemDatas:v4];
    }
  }
}

void __54__SYLinkContextService_userDidRemoveContentItemDatas___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke_cold_1();
  }
}

- (void)userEditDidAddContentItemDatas:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SYLinkContextService *)self _activeConnection];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "LinkContextService: userEditDidAddContentItemDatas, activeConnection = %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = [(SYLinkContextService *)self _activeConnection];

  if (v7)
  {
    __int16 v8 = [(SYLinkContextService *)self _activeConnection];
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_16_0];

    if (v9) {
      [v9 userEditDidAddContentItemDatas:v4];
    }
  }
}

void __55__SYLinkContextService_userEditDidAddContentItemDatas___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke_cold_1();
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SYLinkContextService.m", 165, @"Invalid parameter not satisfying: %@", @"newConnection" object file lineNumber description];
  }
  id v9 = [(SYLinkContextService *)self _listener];

  if (v9 != v7) {
    goto LABEL_4;
  }
  if (![(SYLinkContextService *)self _forTesting])
  {
    v18 = [v8 valueForEntitlement:@"com.apple.synapse.allowLinkContextRequests"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v18 BOOLValue])
    {
      v19 = os_log_create("com.apple.synapse", "LinkContext");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SYLinkContextService listener:shouldAcceptNewConnection:]();
      }

LABEL_4:
      BOOL v10 = 0;
      goto LABEL_7;
    }
  }
  v11 = [(SYLinkContextService *)self _serviceQueue];
  [v8 _setQueue:v11];

  uint64_t v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E28560];
  [v8 setExportedInterface:v12];

  [v8 setExportedObject:self];
  int v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2AAC8];
  [v8 setRemoteObjectInterface:v13];

  objc_initWeak((id *)location, self);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__SYLinkContextService_listener_shouldAcceptNewConnection___block_invoke;
  v23[3] = &unk_1E64637D0;
  objc_copyWeak(&v24, (id *)location);
  [v8 setInvalidationHandler:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__SYLinkContextService_listener_shouldAcceptNewConnection___block_invoke_2;
  v21[3] = &unk_1E64637D0;
  objc_copyWeak(&v22, (id *)location);
  [v8 setInterruptionHandler:v21];
  [v8 resume];
  [(SYLinkContextService *)self set_activeConnection:v8];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)location);
  BOOL v10 = 1;
LABEL_7:
  v14 = os_log_create("com.apple.synapse", "LinkContext");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = [v8 processIdentifier];
    id v16 = @"No";
    if (v10) {
      id v16 = @"Yes";
    }
    *(_DWORD *)location = 134218242;
    *(void *)&location[4] = v15;
    __int16 v26 = 2112;
    v27 = v16;
    _os_log_impl(&dword_1C2C5F000, v14, OS_LOG_TYPE_INFO, "LinkContextService: Listener should accept connection from pid %ld: %@", location, 0x16u);
  }

  return v10;
}

void __59__SYLinkContextService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "set_activeConnection:", 0);
}

void __59__SYLinkContextService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "set_activeConnection:", 0);
}

- (id)_listenerEndpoint
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v3 = [(SYLinkContextService *)self _serviceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SYLinkContextService__listenerEndpoint__block_invoke;
  v6[3] = &unk_1E6463A88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__SYLinkContextService__listenerEndpoint__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _listener];
  uint64_t v2 = [v5 endpoint];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSXPCListener)_listener
{
  return self->__listener;
}

- (void)set_listener:(id)a3
{
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
}

- (NSXPCConnection)_activeConnection
{
  return self->__activeConnection;
}

- (void)set_activeConnection:(id)a3
{
}

- (BOOL)_forTesting
{
  return self->__forTesting;
}

- (NSArray)_contextsDataForTesting
{
  return self->__contextsDataForTesting;
}

- (void)set_contextsDataForTesting:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contextsDataForTesting, 0);
  objc_storeStrong((id *)&self->__activeConnection, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__listener, 0);
}

void __67__SYLinkContextService_userWillAddLinkWithActivityData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1C2C5F000, v0, v1, "LinkContextService: Error creating client service proxy: %@", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1C2C5F000, v0, v1, "LinkContextService: Refusing connection from non-entitled client with connection: %@", v2, v3, v4, v5, v6);
}

@end