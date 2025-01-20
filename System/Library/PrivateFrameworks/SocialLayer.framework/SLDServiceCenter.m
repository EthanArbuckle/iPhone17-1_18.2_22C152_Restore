@interface SLDServiceCenter
+ (id)sharedCenter;
- (NSXPCConnection)conn;
- (OS_dispatch_queue)mainConnectionSetupQueue;
- (OS_dispatch_queue)propertyConcurrentQueue;
- (SLDServiceCenter)init;
- (id)_synchronousRemoteObjectProxy;
- (id)connectionForServiceClass:(Class)a3;
- (void)_ensureMainConnectionSynchronously;
- (void)_synchronousRemoteObjectProxy;
- (void)init;
- (void)setConn:(id)a3;
@end

@implementation SLDServiceCenter

void __24__SLDServiceCenter_conn__block_invoke(uint64_t a1)
{
}

uint64_t __32__SLDServiceCenter_sharedCenter__block_invoke()
{
  sharedCenter_sClient = objc_alloc_init(SLDServiceCenter);
  return MEMORY[0x1F41817F8]();
}

- (SLDServiceCenter)init
{
  v14.receiver = self;
  v14.super_class = (Class)SLDServiceCenter;
  v2 = [(SLDServiceCenter *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SocialLayer.SLDServiceCenter.Properties", v3);
    propertyConcurrentQueue = v2->_propertyConcurrentQueue;
    v2->_propertyConcurrentQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.SocialLayer.SLDServiceCenter.MainConnectionSetup", v6);
    mainConnectionSetupQueue = v2->_mainConnectionSetupQueue;
    v2->_mainConnectionSetupQueue = (OS_dispatch_queue *)v7;

    v9 = SLDClientGlobalWorkloop();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__SLDServiceCenter_init__block_invoke;
    block[3] = &unk_1E58A8720;
    v13 = v2;
    dispatch_async(v9, block);

    v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SLDServiceCenter init]();
    }
  }
  return v2;
}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) conn];

  if (!v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC49EF8];
    dispatch_queue_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.sociallayerd" options:0];
    [v4 setRemoteObjectInterface:v3];
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, v4);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_2;
    v11 = &unk_1E58A9AD0;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    [v4 setInvalidationHandler:&v8];
    objc_msgSend(v4, "resume", v8, v9, v10, v11);
    [*(id *)(a1 + 32) setConn:v4];
    v5 = SLDaemonLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(void **)(a1 + 32);
      dispatch_queue_t v7 = [v6 conn];
      __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_cold_1((uint64_t)v6, v7, buf, v5);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __46__SLDServiceCenter_connectionForServiceClass___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x1E4F29268];
    id v4 = a2;
    uint64_t v5 = [[v3 alloc] initWithListenerEndpoint:v4];

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    dispatch_queue_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = (void *)MEMORY[0x1E4F29280];
    uint64_t v9 = [*(id *)(a1 + 40) remoteObjectProtocol];
    id v10 = [v8 interfaceWithProtocol:v9];

    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) setupInterface:v10];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRemoteObjectInterface:v10];
  }
}

- (NSXPCConnection)conn
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  id v12 = 0;
  v3 = [(SLDServiceCenter *)self propertyConcurrentQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__SLDServiceCenter_conn__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (OS_dispatch_queue)propertyConcurrentQueue
{
  return self->_propertyConcurrentQueue;
}

- (void)setConn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLDServiceCenter *)self propertyConcurrentQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__SLDServiceCenter_setConn___block_invoke;
  v7[3] = &unk_1E58A8680;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

uint64_t __24__SLDServiceCenter_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureMainConnectionSynchronously];
}

void __28__SLDServiceCenter_setConn___block_invoke(uint64_t a1)
{
}

- (id)connectionForServiceClass:(Class)a3
{
  uint64_t v5 = SLGeneralTelemetryLogHandle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = SLGeneralTelemetryLogHandle();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19BE17000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SLDServiceCenterConnectionForServiceClass", "", buf, 2u);
  }

  id inited = objc_initWeak(&location, self);
  *(void *)buf = 0;
  v22 = buf;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11;
  v25 = __Block_byref_object_dispose__11;
  id v26 = 0;
  id v10 = inited;
  if (objc_opt_respondsToSelector())
  {
    v11 = NSStringFromClass(a3);
    id v12 = [(SLDServiceCenter *)self _synchronousRemoteObjectProxy];
    id v13 = v12;
    if (v12)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __46__SLDServiceCenter_connectionForServiceClass___block_invoke;
      v20[3] = &unk_1E58A9AA8;
      v20[4] = buf;
      v20[5] = a3;
      [v12 endpointForServiceNamed:v11 reply:v20];
    }
    else
    {
      objc_super v14 = SLDaemonLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SLDServiceCenter connectionForServiceClass:]();
      }
    }
  }
  else
  {
    v11 = SLDaemonLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceCenter connectionForServiceClass:]();
    }
  }

  v15 = SLGeneralTelemetryLogHandle();
  v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_19BE17000, v16, OS_SIGNPOST_INTERVAL_END, v6, "SLDServiceCenterConnectionForServiceClass", "", v19, 2u);
  }

  id v17 = *((id *)v22 + 5);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
  return v17;
}

- (id)_synchronousRemoteObjectProxy
{
  [(SLDServiceCenter *)self _ensureMainConnectionSynchronously];
  v3 = [(SLDServiceCenter *)self conn];
  id v4 = v3;
  if (!v3)
  {
    os_signpost_id_t v6 = SLDaemonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:]();
    }
    goto LABEL_9;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__SLDServiceCenter__synchronousRemoteObjectProxy__block_invoke;
  v9[3] = &unk_1E58A8658;
  v9[4] = self;
  uint64_t v5 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v9];
  os_signpost_id_t v6 = v5;
  if (v5 && ([v5 conformsToProtocol:&unk_1EEC49EF8] & 1) == 0)
  {
    uint64_t v7 = SLDaemonLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceCenter _synchronousRemoteObjectProxy]();
    }

LABEL_9:
    os_signpost_id_t v6 = 0;
  }

  return v6;
}

- (void)_ensureMainConnectionSynchronously
{
  v3 = [(SLDServiceCenter *)self mainConnectionSetupQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke;
  block[3] = &unk_1E58A8720;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (OS_dispatch_queue)mainConnectionSetupQueue
{
  return self->_mainConnectionSetupQueue;
}

+ (id)sharedCenter
{
  if (sharedCenter_onceToken != -1) {
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedCenter_sClient;
  return v2;
}

void __49__SLDServiceCenter__synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__SLDServiceCenter__synchronousRemoteObjectProxy__block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained mainConnectionSetupQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_3;
  v6[3] = &unk_1E58A8680;
  v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_3(uint64_t a1)
{
  v2 = SLDaemonLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_3_cold_1(a1, v2);
  }

  id v3 = [*(id *)(a1 + 32) conn];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4) {
    [*(id *)(a1 + 32) setConn:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainConnectionSetupQueue, 0);
  objc_storeStrong((id *)&self->_propertyConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_19BE17000, v0, OS_LOG_TYPE_DEBUG, "[%@] Initialized SLDServiceCenter.", v1, 0xCu);
}

- (void)connectionForServiceClass:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[%@] Received a nil remote object proxy, we've probably disconnected, or there was an error connecting. Returning a nil connection to the caller.", v2, v3, v4, v5, v6);
}

- (void)connectionForServiceClass:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[%@] Service class (%@) does implement remoteObjectProtocol. Disallowing service connection.");
}

- (void)_synchronousRemoteObjectProxy
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[%@] Remote proxy object does not conform to <SLDServiceMultiplexing>. Returning a nil proxy object.", v2, v3, v4, v5, v6);
}

void __49__SLDServiceCenter__synchronousRemoteObjectProxy__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19BE17000, a2, a3, "[%@] Error retrieving a synchronous remote proxy to the main daemon service multiplexer. Error: [%@]", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_19BE17000, log, OS_LOG_TYPE_DEBUG, "[%@] New primary connection to sociallayerd: %@", buf, 0x16u);
}

void __54__SLDServiceCenter__ensureMainConnectionSynchronously__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "[%@] Primary connection to sociallayerd was invalidated", (uint8_t *)&v3, 0xCu);
}

@end