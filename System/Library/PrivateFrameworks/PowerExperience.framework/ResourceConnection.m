@interface ResourceConnection
+ (id)sharedInstance;
- (BOOL)createResourceHint:(id)a3;
- (BOOL)updateResourceHint:(id)a3;
- (NSMutableDictionary)resourceHints;
- (NSXPCConnection)connection;
- (ResourceConnection)init;
- (void)init;
- (void)restoreResourceHints:(id)a3;
- (void)setConnection:(id)a3;
- (void)setResourceHints:(id)a3;
@end

@implementation ResourceConnection

- (BOOL)updateResourceHint:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)_log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v4 state];
    _os_log_impl(&dword_25A13D000, v6, OS_LOG_TYPE_DEFAULT, "ResourceConnection:updateResourceHint %@ with state %lu", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v22 = 1;
  v7 = [(ResourceConnection *)self resourceHints];
  objc_sync_enter(v7);
  resourceHints = self->_resourceHints;
  v9 = [v4 uuid];
  v10 = [(NSMutableDictionary *)resourceHints objectForKeyedSubscript:v9];

  uint64_t v11 = [v4 state];
  objc_msgSend(v10, "setState:", objc_msgSend(v4, "state"));

  objc_sync_exit(v7);
  connection = self->_connection;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __41__ResourceConnection_updateResourceHint___block_invoke;
  v20[3] = &unk_265476840;
  v20[4] = buf;
  v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __41__ResourceConnection_updateResourceHint___block_invoke_39;
  v17[3] = &unk_265476868;
  v17[4] = self;
  id v14 = v4;
  id v18 = v14;
  uint64_t v19 = v11;
  [v13 updateResourceHint:v14 withReply:v17];

  BOOL v15 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v15;
}

- (NSMutableDictionary)resourceHints
{
  return self->_resourceHints;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_58);
  }
  v2 = (void *)sharedInstance_obj;
  return v2;
}

void __41__ResourceConnection_updateResourceHint___block_invoke_39(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR)) {
      __41__ResourceConnection_updateResourceHint___block_invoke_39_cold_1();
    }
    v3 = [*(id *)(a1 + 32) resourceHints];
    objc_sync_enter(v3);
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    v5 = [*(id *)(a1 + 40) uuid];
    v6 = [v4 objectForKeyedSubscript:v5];

    [v6 setState:*(void *)(a1 + 48)];
    objc_sync_exit(v3);
  }
}

- (BOOL)createResourceHint:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)_log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [v4 description];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_25A13D000, v6, OS_LOG_TYPE_DEFAULT, "ResourceConnection: createResource %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v8 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__ResourceConnection_createResourceHint___block_invoke_35;
  v12[3] = &unk_265476818;
  v12[4] = self;
  id v9 = v4;
  id v13 = v9;
  p_long long buf = &buf;
  [v8 createResourceHint:v9 withReply:v12];

  BOOL v10 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __41__ResourceConnection_createResourceHint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR)) {
    __41__ResourceConnection_createResourceHint___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __41__ResourceConnection_createResourceHint___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    id v4 = *(id *)(*(void *)(a1 + 32) + 16);
    objc_sync_enter(v4);
    [*(id *)(a1 + 40) setUuid:v5];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(a1 + 40) forKeyedSubscript:v5];
    objc_sync_exit(v4);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v3 = v5;
  }
}

- (void)restoreResourceHints:(id)a3
{
  id v4 = a3;
  id v5 = _log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25A13D000, v5, OS_LOG_TYPE_INFO, "restoring resources", v7, 2u);
  }
  uint64_t v6 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_38];
  [v6 restoreResourceHints:v4];
}

void __43__ResourceConnection_restoreResourceHints___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR)) {
    __41__ResourceConnection_createResourceHint___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __41__ResourceConnection_updateResourceHint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _log_1;
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR)) {
    __41__ResourceConnection_updateResourceHint___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

- (ResourceConnection)init
{
  os_log_t v3 = os_log_create("com.apple.PowerExperienceFramework", "ResourceConnection");
  uint64_t v4 = (void *)_log_1;
  _log_1 = (uint64_t)v3;

  v24.receiver = self;
  v24.super_class = (Class)ResourceConnection;
  uint64_t v5 = [(ResourceConnection *)&v24 init];
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR)) {
      -[ResourceConnection init]();
    }
    goto LABEL_8;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.powerexperienced.resourceusage" options:4096];
  connection = v5->_connection;
  v5->_connection = (NSXPCConnection *)v6;

  uint64_t v8 = _log_1;
  if (v5->_connection)
  {
    if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_25A13D000, v8, OS_LOG_TYPE_INFO, "established connection to powerexperienced", (uint8_t *)buf, 2u);
    }
    uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27081E0C8];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v9];

    [(NSXPCConnection *)v5->_connection setExportedObject:v5];
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    resourceHints = v5->_resourceHints;
    v5->_resourceHints = v10;

    objc_initWeak(buf, v5);
    v12 = v5->_connection;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __26__ResourceConnection_init__block_invoke;
    v21[3] = &unk_2654767A8;
    objc_copyWeak(&v22, buf);
    [(NSXPCConnection *)v12 setInterruptionHandler:v21];
    id v13 = v5->_connection;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __26__ResourceConnection_init__block_invoke_56;
    uint64_t v19 = &unk_2654767A8;
    objc_copyWeak(&v20, buf);
    [(NSXPCConnection *)v13 setInvalidationHandler:&v16];
    [(NSXPCConnection *)v5->_connection resume];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);
LABEL_8:
    id v14 = v5;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR)) {
    -[ResourceConnection init]();
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

void __26__ResourceConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR)) {
    __26__ResourceConnection_init__block_invoke_cold_1();
  }
}

void __26__ResourceConnection_init__block_invoke_56(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && os_log_type_enabled((os_log_t)_log_1, OS_LOG_TYPE_ERROR)) {
    __26__ResourceConnection_init__block_invoke_56_cold_1();
  }
}

uint64_t __36__ResourceConnection_sharedInstance__block_invoke()
{
  sharedInstance_obj = objc_alloc_init(ResourceConnection);
  return MEMORY[0x270F9A758]();
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)setResourceHints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceHints, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__ResourceConnection_createResourceHint___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__ResourceConnection_updateResourceHint___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__ResourceConnection_updateResourceHint___block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_25A13D000, v0, v1, "Failed to update resource hint state with service", v2, v3, v4, v5, v6);
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_25A13D000, v0, v1, "connection to com.apple.powerexperienced does not exist", v2, v3, v4, v5, v6);
}

void __26__ResourceConnection_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_25A13D000, v0, v1, "Connection to service interrupted", v2, v3, v4, v5, v6);
}

void __26__ResourceConnection_init__block_invoke_56_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_25A13D000, v0, v1, "Connection to service invalidated", v2, v3, v4, v5, v6);
}

@end