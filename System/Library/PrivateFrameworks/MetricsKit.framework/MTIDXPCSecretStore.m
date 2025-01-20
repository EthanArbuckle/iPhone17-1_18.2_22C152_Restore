@interface MTIDXPCSecretStore
- (MTIDXPCSecretStore)init;
- (NSXPCConnection)xpcConnection;
- (id)debugInfo;
- (id)maintainSchemes:(id)a3 options:(id)a4;
- (id)newXPCConnection;
- (id)resetSchemes:(id)a3 options:(id)a4;
- (id)secretForScheme:(id)a3 options:(id)a4;
- (id)setupXPCConnection;
- (id)syncForSchemes:(id)a3 options:(id)a4;
- (void)clearLocalData;
- (void)setXpcConnection:(id)a3;
@end

@implementation MTIDXPCSecretStore

uint64_t __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (id)secretForScheme:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MTIDXPCSecretStore *)self setupXPCConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke;
  v13[3] = &unk_264310308;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = [v8 thenWithBlock:v13];

  return v11;
}

- (id)setupXPCConnection
{
  v3 = objc_alloc_init(MTPromise);
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__MTIDXPCSecretStore_setupXPCConnection__block_invoke;
  v9[3] = &unk_264310378;
  v9[4] = self;
  v5 = v3;
  id v10 = v5;
  dispatch_async(queue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

MTPromise *__46__MTIDXPCSecretStore_secretForScheme_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(MTPromise);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke_2;
  v15[3] = &unk_2643102E0;
  v5 = v4;
  v16 = v5;
  id v6 = [v3 remoteObjectProxyWithErrorHandler:v15];

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke_3;
  v13[3] = &unk_26430FAB0;
  id v9 = v5;
  id v14 = v9;
  [v6 secretForScheme:v8 options:v7 completion:v13];
  id v10 = v14;
  v11 = v9;

  return v11;
}

void __40__MTIDXPCSecretStore_setupXPCConnection__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];

  if (!v2)
  {
    id v3 = (void *)[*(id *)(a1 + 32) newXPCConnection];
    [*(id *)(a1 + 32) setXpcConnection:v3];
  }
  v4 = *(void **)(a1 + 40);
  v5 = [*(id *)(a1 + 32) xpcConnection];
  [v4 finishWithResult:v5];

  *(double *)(*(void *)(a1 + 32) + 8) = *(double *)(*(void *)(a1 + 32) + 8) + 1.0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_time_t v6 = dispatch_time(0, 60000000000);
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__MTIDXPCSecretStore_setupXPCConnection__block_invoke_2;
  v8[3] = &unk_26430F848;
  objc_copyWeak(&v9, &location);
  dispatch_after(v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (id)newXPCConnection
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.AMPIDService"];
  v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97F300];
  [v3 setRemoteObjectInterface:v4];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v3);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__MTIDXPCSecretStore_newXPCConnection__block_invoke;
  v12[3] = &unk_264310350;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  [v3 setInvalidationHandler:v12];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __38__MTIDXPCSecretStore_newXPCConnection__block_invoke_64;
  id v9 = &unk_264310350;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  [v3 setInterruptionHandler:&v6];
  objc_msgSend(v3, "resume", v6, v7, v8, v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

- (MTIDXPCSecretStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTIDXPCSecretStore;
  v2 = [(MTIDXPCSecretStore *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amp-ae-eng.MetricsKit.AMPIDServiceQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

uint64_t __46__MTIDXPCSecretStore_secretForScheme_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)resetSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTIDXPCSecretStore *)self setupXPCConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke;
  v13[3] = &unk_264310308;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 thenWithBlock:v13];

  return v11;
}

MTPromise *__43__MTIDXPCSecretStore_resetSchemes_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(MTPromise);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke_2;
  v15[3] = &unk_2643102E0;
  v5 = v4;
  v16 = v5;
  id v6 = [v3 remoteObjectProxyWithErrorHandler:v15];

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke_3;
  v13[3] = &unk_2643102E0;
  id v9 = v5;
  id v14 = v9;
  [v6 doResetSchemes:v8 options:v7 completion:v13];
  id v10 = v14;
  id v11 = v9;

  return v11;
}

uint64_t __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __43__MTIDXPCSecretStore_resetSchemes_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = MEMORY[0x263EFFA88];
  }
  return [v2 finishWithResult:v3 error:a2];
}

- (id)maintainSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTIDXPCSecretStore *)self setupXPCConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__MTIDXPCSecretStore_maintainSchemes_options___block_invoke;
  v13[3] = &unk_264310308;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 thenWithBlock:v13];

  return v11;
}

MTPromise *__46__MTIDXPCSecretStore_maintainSchemes_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 remoteObjectProxy];
  [v3 doMaintainSchemes:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];

  uint64_t v4 = MEMORY[0x263EFFA88];

  return +[MTPromise promiseWithResult:v4];
}

- (id)syncForSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTIDXPCSecretStore *)self setupXPCConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke;
  v13[3] = &unk_264310308;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 thenWithBlock:v13];

  return v11;
}

MTPromise *__45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(MTPromise);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke_2;
  v15[3] = &unk_2643102E0;
  v5 = v4;
  v16 = v5;
  id v6 = [v3 remoteObjectProxyWithErrorHandler:v15];

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke_3;
  v13[3] = &unk_2643102E0;
  id v9 = v5;
  id v14 = v9;
  [v6 syncForSchemes:v8 options:v7 completion:v13];
  id v10 = v14;
  id v11 = v9;

  return v11;
}

uint64_t __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x263EFFA80] error:a2];
}

uint64_t __45__MTIDXPCSecretStore_syncForSchemes_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v3 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v3 = MEMORY[0x263EFFA88];
  }
  return [v2 finishWithResult:v3 error:a2];
}

- (void)clearLocalData
{
  id v2 = [(MTIDXPCSecretStore *)self setupXPCConnection];
  [v2 addSuccessBlock:&__block_literal_global_9];
}

void __36__MTIDXPCSecretStore_clearLocalData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 remoteObjectProxy];
  [v2 doClearLocalData];
}

- (id)debugInfo
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = @"xpcConnection";
  id v2 = [(MTIDXPCSecretStore *)self xpcConnection];
  uint64_t v3 = [v2 debugDescription];
  uint64_t v4 = (void *)v3;
  v5 = @"null";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v9[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

void __38__MTIDXPCSecretStore_newXPCConnection__block_invoke(uint64_t a1)
{
  id v2 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_218211000, v2, OS_LOG_TYPE_DEBUG, "MetricsKit: MTIDXPCSecretStore XPC connection invalidated", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained xpcConnection];
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));

  if (v4 == v5) {
    [WeakRetained setXpcConnection:0];
  }
}

void __38__MTIDXPCSecretStore_newXPCConnection__block_invoke_64(uint64_t a1)
{
  id v2 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_218211000, v2, OS_LOG_TYPE_DEBUG, "MetricsKit: MTIDXPCSecretStore XPC connection interrupted", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained xpcConnection];
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));

  if (v4 == v5) {
    [WeakRetained setXpcConnection:0];
  }
}

void __40__MTIDXPCSecretStore_setupXPCConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = *((double *)WeakRetained + 1) + -1.0;
    *((double *)WeakRetained + 1) = v3;
    if (v3 == 0.0)
    {
      id v4 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_218211000, v4, OS_LOG_TYPE_DEBUG, "MetricsKit: MTIDXPCSecretStore XPC connection is released on idle", v6, 2u);
      }

      id v5 = [v2 xpcConnection];
      [v5 invalidate];

      [v2 setXpcConnection:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end