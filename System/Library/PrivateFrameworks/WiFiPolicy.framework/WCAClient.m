@interface WCAClient
+ (id)sharedClient;
- (NSXPCConnection)connectionToService;
- (WCAClient)init;
- (void)_establishDaemonConnection;
- (void)_invalidateDaemonConnectionIfPossible;
- (void)executeFetchRequest:(id)a3;
- (void)fetchWiFiAssetsFromServer;
- (void)setConnectionToService:(id)a3;
@end

@implementation WCAClient

- (void)executeFetchRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__WCAClient_executeFetchRequest___block_invoke;
  v7[3] = &unk_1E69BC8B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)sharedClient_wcaClient;

  return v2;
}

void __39__WCAClient__establishDaemonConnection__block_invoke_4(uint64_t a1)
{
  NSLog(&cfstr_SXpcConnection_0.isa, "-[WCAClient _establishDaemonConnection]_block_invoke_4");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateDaemonConnectionIfPossible];
}

void __39__WCAClient__establishDaemonConnection__block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_SXpcConnection.isa, "-[WCAClient _establishDaemonConnection]_block_invoke_2");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateDaemonConnectionIfPossible];
}

- (void)_invalidateDaemonConnectionIfPossible
{
  connectionToService = self->_connectionToService;
  if (connectionToService)
  {
    [(NSXPCConnection *)connectionToService invalidate];
    id v4 = self->_connectionToService;
    self->_connectionToService = 0;
  }
}

void __33__WCAClient_executeFetchRequest___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

void __33__WCAClient_executeFetchRequest___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 16);
  [*(id *)(a1 + 32) _establishDaemonConnection];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__WCAClient_executeFetchRequest___block_invoke_2;
  v12[3] = &unk_1E69BDC60;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v14 = v4;
  v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  id v6 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__WCAClient_executeFetchRequest___block_invoke_4;
  v9[3] = &unk_1E69BDC88;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  [v5 executeFetchRequest:v7 completionHandler:v9];
}

- (void)_establishDaemonConnection
{
  if (!self->_connectionToService)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.wifi.WiFiCloudAssetsXPCService"];
    connectionToService = self->_connectionToService;
    self->_connectionToService = v3;

    if (self->_connectionToService)
    {
      v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2BC26A0];
      [(NSXPCConnection *)self->_connectionToService setRemoteObjectInterface:v5];

      [(NSXPCConnection *)self->_connectionToService resume];
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __39__WCAClient__establishDaemonConnection__block_invoke;
      v8[3] = &unk_1E69BCBA0;
      objc_copyWeak(&v9, &location);
      [(NSXPCConnection *)self->_connectionToService setInvalidationHandler:v8];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __39__WCAClient__establishDaemonConnection__block_invoke_3;
      v6[3] = &unk_1E69BCBA0;
      objc_copyWeak(&v7, &location);
      [(NSXPCConnection *)self->_connectionToService setInterruptionHandler:v6];
      objc_destroyWeak(&v7);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __33__WCAClient_executeFetchRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_Error_1.isa, a2);
  id v3 = [*(id *)(a1 + 32) completionHandler];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) completionHandler];
    v4[2](v4, 0, 0);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__WCAClient_executeFetchRequest___block_invoke_3;
  block[3] = &unk_1E69BC8D8;
  block[4] = v5;
  dispatch_async(v6, block);
}

void __39__WCAClient__establishDaemonConnection__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WCAClient__establishDaemonConnection__block_invoke_4;
  block[3] = &unk_1E69BCBA0;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void __39__WCAClient__establishDaemonConnection__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WCAClient__establishDaemonConnection__block_invoke_2;
  block[3] = &unk_1E69BCBA0;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

- (WCAClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)WCAClient;
  uint64_t v2 = [(WCAClient *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.wificloudassets.wcaclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

void __33__WCAClient_executeFetchRequest___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) completionHandler];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, id, void))v5)[2](v5, v3, 0);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(NSObject **)(v6 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__WCAClient_executeFetchRequest___block_invoke_5;
  block[3] = &unk_1E69BC8D8;
  void block[4] = v6;
  dispatch_async(v7, block);
}

void __33__WCAClient_executeFetchRequest___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__WCAClient_executeFetchRequest___block_invoke_6;
  v6[3] = &unk_1E69BD378;
  void v6[4] = v4;
  v6[5] = v2;
  dispatch_after(v3, v5, v6);
}

void *__33__WCAClient_executeFetchRequest___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  result = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8) == result[2]) {
    return (void *)[result _invalidateDaemonConnectionIfPossible];
  }
  return result;
}

- (void)fetchWiFiAssetsFromServer
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__WCAClient_fetchWiFiAssetsFromServer__block_invoke;
  block[3] = &unk_1E69BC8D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __38__WCAClient_fetchWiFiAssetsFromServer__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 16);
  [*(id *)(a1 + 32) _establishDaemonConnection];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  [v2 fetchWiFiAssetsFromServer];
}

void __38__WCAClient_fetchWiFiAssetsFromServer__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

uint64_t __25__WCAClient_sharedClient__block_invoke()
{
  v0 = objc_alloc_init(WCAClient);
  uint64_t v2 = sharedClient_wcaClient;
  sharedClient_wcaClient = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v2, v1);
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (void)setConnectionToService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end