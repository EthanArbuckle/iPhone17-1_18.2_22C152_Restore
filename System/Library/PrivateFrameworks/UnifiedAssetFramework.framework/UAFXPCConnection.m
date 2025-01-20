@interface UAFXPCConnection
- (UAFXPCConnection)init;
- (UAFXPCConnection)initWithMachServiceName:(id)a3;
- (id)_connection;
- (void)_invalidate;
- (void)checkAssetStatus:(id)a3;
- (void)dealloc;
- (void)diagnosticInformation:(id)a3;
- (void)diskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4 completion:(id)a5;
- (void)downloadDictationAssetsForLanguage:(id)a3;
- (void)downloadSiriAssets;
- (void)downloadSiriAssetsOverCellular;
- (void)invalidate;
- (void)lockLatestAtomicInstance:(id)a3 completion:(id)a4;
- (void)operationWithConfig:(id)a3 completion:(id)a4;
- (void)postAssetNotificationIfNeeded;
- (void)postDictationAssetNotificationForLanguage:(id)a3;
- (void)subscriptionsForSubscriber:(id)a3 completion:(id)a4;
@end

@implementation UAFXPCConnection

- (UAFXPCConnection)init
{
  return [(UAFXPCConnection *)self initWithMachServiceName:@"com.apple.siri.uaf.service"];
}

- (UAFXPCConnection)initWithMachServiceName:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UAFXPCConnection;
  v6 = [(UAFXPCConnection *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceName, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);

    id v10 = [v5 stringByAppendingString:@".queue.connection"];
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 cStringUsingEncoding:1], v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (void)dealloc
{
  [(UAFXPCConnection *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UAFXPCConnection;
  [(UAFXPCConnection *)&v3 dealloc];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__UAFXPCConnection_invalidate__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__UAFXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    [(NSXPCConnection *)xpcConnection setExportedObject:0];
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (id)_connection
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:self->_serviceName options:0];
    id v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    [(NSXPCConnection *)self->_xpcConnection _setQueue:self->_queue];
    v6 = self->_xpcConnection;
    v7 = +[UAFXPCProxyServiceInterface defaultInterface];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:0];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:0];
    objc_initWeak(&location, self);
    v8 = self->_xpcConnection;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __31__UAFXPCConnection__connection__block_invoke;
    v13[3] = &unk_264CEAC90;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v8 setInterruptionHandler:v13];
    v9 = self->_xpcConnection;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __31__UAFXPCConnection__connection__block_invoke_275;
    v11[3] = &unk_264CEAC90;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:v11];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __31__UAFXPCConnection__connection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[UAFXPCConnection _connection]_block_invoke";
    _os_log_debug_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEBUG, "%s XPC Connection interrupted", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __31__UAFXPCConnection__connection__block_invoke_275(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[UAFXPCConnection _connection]_block_invoke";
    _os_log_debug_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEBUG, "%s XPC Connection invalidated", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)operationWithConfig:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__UAFXPCConnection_operationWithConfig_completion___block_invoke;
  block[3] = &unk_264CEB060;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __51__UAFXPCConnection_operationWithConfig_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__UAFXPCConnection_operationWithConfig_completion___block_invoke_2;
  v7[3] = &unk_264CEB038;
  id v8 = *(id *)(a1 + 48);
  objc_super v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__UAFXPCConnection_operationWithConfig_completion___block_invoke_277;
  v5[3] = &unk_264CEB038;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 operationWithConfig:v4 completion:v5];
}

void __51__UAFXPCConnection_operationWithConfig_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      id v7 = "-[UAFXPCConnection operationWithConfig:completion:]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_debug_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __51__UAFXPCConnection_operationWithConfig_completion___block_invoke_277(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      id v7 = "-[UAFXPCConnection operationWithConfig:completion:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_debug_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEBUG, "%s operationWithConfig failed with: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)diagnosticInformation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__UAFXPCConnection_diagnosticInformation___block_invoke;
  v7[3] = &unk_264CEB0B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __42__UAFXPCConnection_diagnosticInformation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__UAFXPCConnection_diagnosticInformation___block_invoke_2;
  v6[3] = &unk_264CEB038;
  id v7 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__UAFXPCConnection_diagnosticInformation___block_invoke_278;
  v4[3] = &unk_264CEB088;
  id v5 = *(id *)(a1 + 40);
  [v3 diagnosticInformation:v4];
}

void __42__UAFXPCConnection_diagnosticInformation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      id v7 = "-[UAFXPCConnection diagnosticInformation:]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_debug_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __42__UAFXPCConnection_diagnosticInformation___block_invoke_278(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[UAFXPCConnection diagnosticInformation:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_debug_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEBUG, "%s diagnosticInformation failed with: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)lockLatestAtomicInstance:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke;
  block[3] = &unk_264CEB0F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke_280;
  v5[3] = &unk_264CEB038;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 lockLatestAtomicInstance:v4 completion:v5];
}

void __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      id v5 = "-[UAFXPCConnection lockLatestAtomicInstance:completion:]_block_invoke_2";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void __56__UAFXPCConnection_lockLatestAtomicInstance_completion___block_invoke_280(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "-[UAFXPCConnection lockLatestAtomicInstance:completion:]_block_invoke";
    _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s updateAutoAssetsFromAssetSetUsages complete", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscriptionsForSubscriber:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(UAFXPCConnection *)self _connection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_282];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__UAFXPCConnection_subscriptionsForSubscriber_completion___block_invoke_283;
  v11[3] = &unk_264CEB120;
  id v12 = v6;
  id v10 = v6;
  [v9 subscriptionsForSubscriber:v7 completion:v11];
}

void __58__UAFXPCConnection_subscriptionsForSubscriber_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      int v5 = "-[UAFXPCConnection subscriptionsForSubscriber:completion:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void __58__UAFXPCConnection_subscriptionsForSubscriber_completion___block_invoke_283(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[UAFXPCConnection subscriptionsForSubscriber:completion:]_block_invoke";
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s subscriptionsForSubscriber complete with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadSiriAssets
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__UAFXPCConnection_downloadSiriAssets__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__UAFXPCConnection_downloadSiriAssets__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection];
  v1 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_286];
  [v1 downloadSiriAssets];
}

void __38__UAFXPCConnection_downloadSiriAssets__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315394;
      id v5 = "-[UAFXPCConnection downloadSiriAssets]_block_invoke_2";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_debug_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)downloadSiriAssetsOverCellular
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__UAFXPCConnection_downloadSiriAssetsOverCellular__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__UAFXPCConnection_downloadSiriAssetsOverCellular__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection];
  v1 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_288];
  [v1 downloadSiriAssetsOverCellular];
}

void __50__UAFXPCConnection_downloadSiriAssetsOverCellular__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315394;
      id v5 = "-[UAFXPCConnection downloadSiriAssetsOverCellular]_block_invoke_2";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_debug_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)postAssetNotificationIfNeeded
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__UAFXPCConnection_postAssetNotificationIfNeeded__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__UAFXPCConnection_postAssetNotificationIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection];
  v1 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_290];
  [v1 postAssetNotificationIfNeeded];
}

void __49__UAFXPCConnection_postAssetNotificationIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315394;
      id v5 = "-[UAFXPCConnection postAssetNotificationIfNeeded]_block_invoke_2";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_debug_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)downloadDictationAssetsForLanguage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__UAFXPCConnection_downloadDictationAssetsForLanguage___block_invoke;
  v7[3] = &unk_264CEAC18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __55__UAFXPCConnection_downloadDictationAssetsForLanguage___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _connection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_292];
  [v2 downloadDictationAssetsForLanguage:*(void *)(a1 + 40)];
}

void __55__UAFXPCConnection_downloadDictationAssetsForLanguage___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315394;
      id v5 = "-[UAFXPCConnection downloadDictationAssetsForLanguage:]_block_invoke_2";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_debug_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)postDictationAssetNotificationForLanguage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__UAFXPCConnection_postDictationAssetNotificationForLanguage___block_invoke;
  v7[3] = &unk_264CEAC18;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__UAFXPCConnection_postDictationAssetNotificationForLanguage___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _connection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_294];
  [v2 postDictationAssetNotificationForLanguage:*(void *)(a1 + 40)];
}

void __62__UAFXPCConnection_postDictationAssetNotificationForLanguage___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315394;
      id v5 = "-[UAFXPCConnection postDictationAssetNotificationForLanguage:]_block_invoke_2";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_debug_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)checkAssetStatus:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__UAFXPCConnection_checkAssetStatus___block_invoke;
  v7[3] = &unk_264CEB0B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __37__UAFXPCConnection_checkAssetStatus___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__UAFXPCConnection_checkAssetStatus___block_invoke_2;
  v6[3] = &unk_264CEB038;
  id v7 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__UAFXPCConnection_checkAssetStatus___block_invoke_295;
  v4[3] = &unk_264CEB148;
  id v5 = *(id *)(a1 + 40);
  [v3 checkAssetStatus:v4];
}

void __37__UAFXPCConnection_checkAssetStatus___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      id v7 = "-[UAFXPCConnection checkAssetStatus:]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_debug_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __37__UAFXPCConnection_checkAssetStatus___block_invoke_295(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[UAFXPCConnection checkAssetStatus:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_debug_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEBUG, "%s checkAssetStatus failed with: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)diskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke;
  v13[3] = &unk_264CEB198;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

void __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke_2;
  v9[3] = &unk_264CEB038;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke_297;
  v6[3] = &unk_264CEB170;
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v3 diskSpaceNeededInBytesForLanguage:v7 forClient:v5 completion:v6];
}

void __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      id v7 = "-[UAFXPCConnection diskSpaceNeededInBytesForLanguage:forClient:completion:]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_debug_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEBUG, "%s remoteObjectProxyWithErrorHandler failed with: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __75__UAFXPCConnection_diskSpaceNeededInBytesForLanguage_forClient_completion___block_invoke_297(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 136315650;
      id v11 = "-[UAFXPCConnection diskSpaceNeededInBytesForLanguage:forClient:completion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_debug_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEBUG, "%s diskSpaceInBytesForLanguage %@ failed with: %@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end