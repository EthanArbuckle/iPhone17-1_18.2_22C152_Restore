@interface SYDefaultsClient
- (NSXPCConnection)_connection;
- (OS_dispatch_queue)_clientQueue;
- (SYDefaultsClient)init;
- (void)_configureConnectionAndResume;
- (void)_createConnectionIfNeeded;
- (void)_invalidateConnection;
- (void)dealloc;
- (void)indicatorCoverageWithCompletion:(id)a3;
- (void)setIndicatorCoverage:(int64_t)a3 completion:(id)a4;
- (void)set_clientQueue:(id)a3;
- (void)set_connection:(id)a3;
@end

@implementation SYDefaultsClient

uint64_t __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

void __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createConnectionIfNeeded];
  uint64_t v2 = [*(id *)(a1 + 32) _connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke_2;
  v7[3] = &unk_1E64636F0;
  id v8 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v7];

  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke_7;
      v5[3] = &unk_1E6463B80;
      id v6 = v4;
      [v3 indicatorCoverageWithCompletion:v5];
    }
  }
}

- (void)_createConnectionIfNeeded
{
  uint64_t v3 = [(SYDefaultsClient *)self _connection];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.synapse.backlink-service" options:0];
    [(SYDefaultsClient *)self set_connection:v4];

    v5 = [(SYDefaultsClient *)self _connection];
    id v6 = [(SYDefaultsClient *)self _clientQueue];
    [v5 _setQueue:v6];

    [(SYDefaultsClient *)self _configureConnectionAndResume];
  }
}

- (void)indicatorCoverageWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SYDefaultsClient *)self _clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke;
  v7[3] = &unk_1E6463BA8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)_clientQueue
{
  return self->__clientQueue;
}

- (void)set_connection:(id)a3
{
}

- (SYDefaultsClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)SYDefaultsClient;
  uint64_t v2 = [(SYDefaultsClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.defaults", v3);
    clientQueue = v2->__clientQueue;
    v2->__clientQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)_configureConnectionAndResume
{
  dispatch_queue_t v4 = [(SYDefaultsClient *)self _connection];

  if (!v4)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SYDefaultsClient.m" lineNumber:102 description:@"the XPC connection is unexpectedly nil"];
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__SYDefaultsClient__configureConnectionAndResume__block_invoke;
  v13[3] = &unk_1E64637D0;
  objc_copyWeak(&v14, &location);
  v5 = [(SYDefaultsClient *)self _connection];
  [v5 setInvalidationHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__SYDefaultsClient__configureConnectionAndResume__block_invoke_18;
  v11[3] = &unk_1E64637D0;
  objc_copyWeak(&v12, &location);
  id v6 = [(SYDefaultsClient *)self _connection];
  [v6 setInterruptionHandler:v11];

  objc_super v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2C920];
  id v8 = [(SYDefaultsClient *)self _connection];
  [v8 setRemoteObjectInterface:v7];

  v9 = [(SYDefaultsClient *)self _connection];
  [v9 resume];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (void)dealloc
{
  uint64_t v3 = [(SYDefaultsClient *)self _connection];
  [v3 invalidate];

  [(SYDefaultsClient *)self set_connection:0];
  v4.receiver = self;
  v4.super_class = (Class)SYDefaultsClient;
  [(SYDefaultsClient *)&v4 dealloc];
}

- (void)setIndicatorCoverage:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(SYDefaultsClient *)self _clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke;
  block[3] = &unk_1E6463B58;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createConnectionIfNeeded];
  uint64_t v2 = [*(id *)(a1 + 32) _connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2;
  v6[3] = &unk_1E64636F0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v6];

  if (v3)
  {
    objc_super v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 48)];
    [v3 setIndicatorCoverage:v4];

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = os_log_create("com.apple.synapse", "SYDefaultsClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __52__SYDefaultsClient_indicatorCoverageWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = os_log_create("com.apple.synapse", "SYDefaultsClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __49__SYDefaultsClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.synapse", "SYDefaultsClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_INFO, "Connection was invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

void __49__SYDefaultsClient__configureConnectionAndResume__block_invoke_18(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.synapse", "SYDefaultsClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_INFO, "Connection was interrupted.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateConnection];
}

- (void)_invalidateConnection
{
  id v3 = [(SYDefaultsClient *)self _clientQueue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(SYDefaultsClient *)self _connection];

  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.synapse", "SYDefaultsClient");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_INFO, "Invalidating connection.", v7, 2u);
    }

    id v6 = [(SYDefaultsClient *)self _connection];
    [(SYDefaultsClient *)self set_connection:0];
    [v6 invalidate];
  }
}

- (void)set_clientQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientQueue, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

void __52__SYDefaultsClient_setIndicatorCoverage_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Error creating remote service proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end