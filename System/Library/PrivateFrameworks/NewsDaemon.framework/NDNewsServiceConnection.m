@interface NDNewsServiceConnection
- (NDNewsService)daemon;
- (NDNewsServiceClient)client;
- (NDNewsServiceConnection)initWithClient:(id)a3;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)accessQueue;
- (void)_establishConnectionIfNeededWithCompletion:(id)a3;
- (void)_unsafeEstablishConnectionIfNeededWithCompletion:(id)a3;
- (void)dealloc;
- (void)fetchLatestResultsWithParameters:(id)a3 completion:(id)a4;
- (void)fetchModuleDescriptorsWithCompletion:(id)a3;
- (void)fetchPlaceholderResultsWithOperationInfo:(id)a3 syncCompletion:(id)a4;
- (void)markAnalyticsElement:(id)a3 asReadAtDate:(id)a4 withCompletion:(id)a5;
- (void)markAnalyticsElements:(id)a3 asSeenAtDate:(id)a4 withCompletion:(id)a5;
- (void)serviceHasNewTodayResults;
- (void)setAccessQueue:(id)a3;
- (void)setClient:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDaemon:(id)a3;
@end

@implementation NDNewsServiceConnection

- (NDNewsServiceConnection)initWithClient:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsServiceConnection initWithClient:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)NDNewsServiceConnection;
  v5 = [(NDNewsServiceConnection *)&v10 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.newsdaemon.accessQueue", v6);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_client, v4);
  }

  return v5;
}

- (void)dealloc
{
  v3 = [(NDNewsServiceConnection *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)NDNewsServiceConnection;
  [(NDNewsServiceConnection *)&v4 dealloc];
}

- (void)serviceHasNewTodayResults
{
  id v2 = [(NDNewsServiceConnection *)self client];
  [v2 serviceHasNewTodayResults];
}

- (void)fetchModuleDescriptorsWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsServiceConnection fetchModuleDescriptorsWithCompletion:]();
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__NDNewsServiceConnection_fetchModuleDescriptorsWithCompletion___block_invoke;
  v6[3] = &unk_1E6D3EB60;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NDNewsServiceConnection *)self _establishConnectionIfNeededWithCompletion:v6];
}

void __64__NDNewsServiceConnection_fetchModuleDescriptorsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = NDSharedClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[NDNewsServiceConnection fetchModuleDescriptorsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1E00ED000, v2, OS_LOG_TYPE_INFO, "Calling %s on daemon", buf, 0xCu);
  }

  v3 = [*(id *)(a1 + 32) connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__NDNewsServiceConnection_fetchModuleDescriptorsWithCompletion___block_invoke_61;
  v5[3] = &unk_1E6D3EB38;
  id v6 = *(id *)(a1 + 40);
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v5];

  [v4 fetchModuleDescriptorsWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __64__NDNewsServiceConnection_fetchModuleDescriptorsWithCompletion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchLatestResultsWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsServiceConnection fetchLatestResultsWithParameters:completion:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsServiceConnection fetchLatestResultsWithParameters:completion:]();
  }
LABEL_6:
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__NDNewsServiceConnection_fetchLatestResultsWithParameters_completion___block_invoke;
  v10[3] = &unk_1E6D3EB88;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(NDNewsServiceConnection *)self _establishConnectionIfNeededWithCompletion:v10];
}

void __71__NDNewsServiceConnection_fetchLatestResultsWithParameters_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = NDSharedClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[NDNewsServiceConnection fetchLatestResultsWithParameters:completion:]_block_invoke";
    _os_log_impl(&dword_1E00ED000, v2, OS_LOG_TYPE_INFO, "Calling %s on daemon", buf, 0xCu);
  }

  v3 = [*(id *)(a1 + 32) connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__NDNewsServiceConnection_fetchLatestResultsWithParameters_completion___block_invoke_65;
  v5[3] = &unk_1E6D3EB38;
  id v6 = *(id *)(a1 + 48);
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v5];

  [v4 fetchLatestResultsWithParameters:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __71__NDNewsServiceConnection_fetchLatestResultsWithParameters_completion___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markAnalyticsElements:(id)a3 asSeenAtDate:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsServiceConnection markAnalyticsElements:asSeenAtDate:withCompletion:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsServiceConnection markAnalyticsElements:asSeenAtDate:withCompletion:]();
  }
LABEL_6:
  if ([v8 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__NDNewsServiceConnection_markAnalyticsElements_asSeenAtDate_withCompletion___block_invoke;
    v11[3] = &unk_1E6D3EBB0;
    v11[4] = self;
    id v14 = v10;
    id v12 = v8;
    id v13 = v9;
    [(NDNewsServiceConnection *)self _establishConnectionIfNeededWithCompletion:v11];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __77__NDNewsServiceConnection_markAnalyticsElements_asSeenAtDate_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = NDSharedClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[NDNewsServiceConnection markAnalyticsElements:asSeenAtDate:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1E00ED000, v2, OS_LOG_TYPE_INFO, "Calling %s on daemon", (uint8_t *)&v7, 0xCu);
  }

  v3 = [*(id *)(a1 + 32) connection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 56)];

  if (*(void *)(a1 + 56)) {
    id v5 = *(const void **)(a1 + 56);
  }
  else {
    id v5 = &__block_literal_global_3;
  }
  id v6 = _Block_copy(v5);
  [v4 markAnalyticsElements:*(void *)(a1 + 40) asSeenAtDate:*(void *)(a1 + 48) withCompletion:v6];
}

- (void)markAnalyticsElement:(id)a3 asReadAtDate:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsServiceConnection markAnalyticsElement:asReadAtDate:withCompletion:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsServiceConnection markAnalyticsElement:asReadAtDate:withCompletion:]();
  }
LABEL_6:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__NDNewsServiceConnection_markAnalyticsElement_asReadAtDate_withCompletion___block_invoke;
  v14[3] = &unk_1E6D3EBB0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(NDNewsServiceConnection *)self _establishConnectionIfNeededWithCompletion:v14];
}

void __76__NDNewsServiceConnection_markAnalyticsElement_asReadAtDate_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v5 = [v2 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 56)];

  if (*(void *)(a1 + 56)) {
    v3 = *(const void **)(a1 + 56);
  }
  else {
    v3 = &__block_literal_global_71;
  }
  id v4 = _Block_copy(v3);
  [v5 markAnalyticsElement:*(void *)(a1 + 40) asReadAtDate:*(void *)(a1 + 48) withCompletion:v4];
}

- (void)fetchPlaceholderResultsWithOperationInfo:(id)a3 syncCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsServiceConnection fetchPlaceholderResultsWithOperationInfo:syncCompletion:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsServiceConnection fetchPlaceholderResultsWithOperationInfo:syncCompletion:]();
  }
LABEL_6:
  id v8 = [(NDNewsServiceConnection *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke;
  block[3] = &unk_1E6D3EB88;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke_2;
  v3[3] = &unk_1E6D3EB88;
  v3[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 _unsafeEstablishConnectionIfNeededWithCompletion:v3];
}

void __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke_3;
  v4[3] = &unk_1E6D3EB38;
  id v5 = *(id *)(a1 + 48);
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v4];

  [v3 fetchPlaceholderResultsWithOperationInfo:*(void *)(a1 + 40) syncCompletion:*(void *)(a1 + 48)];
}

uint64_t __83__NDNewsServiceConnection_fetchPlaceholderResultsWithOperationInfo_syncCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_establishConnectionIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NDNewsServiceConnection *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NDNewsServiceConnection__establishConnectionIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_1E6D3EB60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __70__NDNewsServiceConnection__establishConnectionIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unsafeEstablishConnectionIfNeededWithCompletion:*(void *)(a1 + 40)];
}

- (void)_unsafeEstablishConnectionIfNeededWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsServiceConnection _unsafeEstablishConnectionIfNeededWithCompletion:]();
  }
  id v5 = NDSharedClientLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[NDNewsServiceConnection _unsafeEstablishConnectionIfNeededWithCompletion:]";
    _os_log_impl(&dword_1E00ED000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v6 = [(NDNewsServiceConnection *)self connection];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    ++_unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
    id v8 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.newsd.today" options:0];
    id v9 = NDSharedClientLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v30 = (const char *)_unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
      _os_log_impl(&dword_1E00ED000, v9, OS_LOG_TYPE_INFO, "Created connection %ld to newsd for NewsToday mach service", buf, 0xCu);
    }

    [v8 setInterruptionHandler:&__block_literal_global_76];
    objc_initWeak((id *)buf, self);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke_77;
    v26 = &unk_1E6D3EC00;
    v27 = self;
    objc_copyWeak(&v28, (id *)buf);
    [v8 setInvalidationHandler:&v23];
    id v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B52AD8];
    [v8 setRemoteObjectInterface:v10];
    id v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B52970];
    [v8 setExportedInterface:v11];

    id v12 = [v8 remoteObjectInterface];
    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0, v23, v24, v25, v26, v27);
    [v12 setClasses:v15 forSelector:sel_fetchLatestResultsWithParameters_completion_ argumentIndex:1 ofReply:1];

    id v16 = [v8 remoteObjectInterface];
    id v17 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    [v16 setClasses:v17 forSelector:sel_fetchLatestResultsWithParameters_completion_ argumentIndex:2 ofReply:1];

    v18 = [v8 remoteObjectInterface];
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    [v18 setClasses:v21 forSelector:sel_fetchModuleDescriptorsWithCompletion_ argumentIndex:0 ofReply:1];

    v22 = objc_alloc_init(NDNewsServiceConnectionClientProxy);
    [(NDNewsServiceConnectionClientProxy *)v22 setClient:self];
    [v8 setExportedObject:v22];
    [v8 resume];
    [(NDNewsServiceConnection *)self setConnection:v8];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v8 = NDSharedClientLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v30 = (const char *)_unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
      _os_log_impl(&dword_1E00ED000, v8, OS_LOG_TYPE_INFO, "Reusing connection %ld", buf, 0xCu);
    }
  }

  if (v4) {
    v4[2](v4);
  }
}

void __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = NDSharedClientLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 134217984;
    uint64_t v2 = _unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
    _os_log_impl(&dword_1E00ED000, v0, OS_LOG_TYPE_INFO, "Connection %ld was interrupted", (uint8_t *)&v1, 0xCu);
  }
}

void __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke_77(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NDSharedClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = _unsafeEstablishConnectionIfNeededWithCompletion__connectionIdentifier;
    _os_log_impl(&dword_1E00ED000, v2, OS_LOG_TYPE_INFO, "Connection %ld was invalidated", buf, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke_78;
  block[3] = &unk_1E6D3EBD8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __76__NDNewsServiceConnection__unsafeEstablishConnectionIfNeededWithCompletion___block_invoke_78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NDNewsService)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NDNewsServiceClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  return (NDNewsServiceClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithClient:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"client", v6, 2u);
}

- (void)fetchModuleDescriptorsWithCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)fetchLatestResultsWithParameters:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)fetchLatestResultsWithParameters:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"parameters", v6, 2u);
}

- (void)markAnalyticsElements:asSeenAtDate:withCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

- (void)markAnalyticsElements:asSeenAtDate:withCompletion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headlineAnalyticsElements", v6, 2u);
}

- (void)markAnalyticsElement:asReadAtDate:withCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

- (void)markAnalyticsElement:asReadAtDate:withCompletion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElement", v6, 2u);
}

- (void)fetchPlaceholderResultsWithOperationInfo:syncCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"syncCompletion", v6, 2u);
}

- (void)fetchPlaceholderResultsWithOperationInfo:syncCompletion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);
}

- (void)_unsafeEstablishConnectionIfNeededWithCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

@end