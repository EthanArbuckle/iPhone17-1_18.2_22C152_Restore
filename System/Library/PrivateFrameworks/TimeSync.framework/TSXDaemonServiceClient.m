@interface TSXDaemonServiceClient
+ (id)clientProtocol;
+ (id)serverProtocol;
+ (id)serviceName;
+ (id)sharedDaemonServiceClient;
- (BOOL)callMethodForDaemonClient:(unsigned int)a3 clientMethodSelector:(unsigned int)a4 scalarInputs:(const unint64_t *)a5 scalarInputCount:(unsigned int)a6 structInput:(const void *)a7 structInputSize:(unint64_t)a8 scalarOutputs:(unint64_t *)a9 scalarOutputCount:(unsigned int *)a10 error:(id *)a11;
- (BOOL)closeDaemonClient:(unsigned int)a3 error:(id *)a4;
- (NSXPCConnection)serverConnection;
- (TSXDaemonServiceClient)init;
- (id)exportedObject;
- (id)propertiesForRegistryEntryID:(unint64_t)a3;
- (id)propertyForRegistryEntryID:(unint64_t)a3 key:(id)a4;
- (unsigned)openDaemonClientWithRegistryEntryID:(unint64_t)a3 clientType:(unsigned int)a4 error:(id *)a5;
- (void)dealloc;
- (void)interruptedConnection;
- (void)invalidatedConnection;
@end

@implementation TSXDaemonServiceClient

+ (id)sharedDaemonServiceClient
{
  if (sharedDaemonServiceClient_onceToken != -1) {
    dispatch_once(&sharedDaemonServiceClient_onceToken, &__block_literal_global_9);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedInstanceLock);
  v2 = (void *)_sharedInstance;
  if (!_sharedInstance)
  {
    v3 = objc_alloc_init(TSXDaemonServiceClient);
    v4 = (void *)_sharedInstance;
    _sharedInstance = (uint64_t)v3;

    v2 = (void *)_sharedInstance;
  }
  id v5 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedInstanceLock);
  return v5;
}

uint64_t __51__TSXDaemonServiceClient_sharedDaemonServiceClient__block_invoke()
{
  _sharedInstanceLock = 0;
  _gIORegSignpostLog = (uint64_t)os_log_create("TimeSync", "iokit_get_property_proxy_client");
  return MEMORY[0x1F41817F8]();
}

+ (id)serviceName
{
  return @"com.apple.timesync.expositor";
}

+ (id)clientProtocol
{
  return &unk_1F145D168;
}

+ (id)serverProtocol
{
  return &unk_1F145E568;
}

- (TSXDaemonServiceClient)init
{
  v21.receiver = self;
  v21.super_class = (Class)TSXDaemonServiceClient;
  v2 = [(TSXDaemonServiceClient *)&v21 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    v4 = [(id)objc_opt_class() serviceName];
    uint64_t v5 = [v3 initWithMachServiceName:v4 options:4096];
    serverConnection = v2->_serverConnection;
    v2->_serverConnection = (NSXPCConnection *)v5;

    v7 = (void *)MEMORY[0x1E4F29280];
    v8 = [(id)objc_opt_class() serverProtocol];
    v9 = [v7 interfaceWithProtocol:v8];
    [(NSXPCConnection *)v2->_serverConnection setRemoteObjectInterface:v9];

    v10 = (void *)MEMORY[0x1E4F29280];
    v11 = [(id)objc_opt_class() clientProtocol];
    v12 = [v10 interfaceWithProtocol:v11];
    [(NSXPCConnection *)v2->_serverConnection setExportedInterface:v12];

    v13 = [(TSXDaemonServiceClient *)v2 exportedObject];
    [(NSXPCConnection *)v2->_serverConnection setExportedObject:v13];

    objc_initWeak(&location, v2);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __30__TSXDaemonServiceClient_init__block_invoke;
    v18[3] = &unk_1E622B3D8;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v2->_serverConnection setInterruptionHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __30__TSXDaemonServiceClient_init__block_invoke_68;
    v16[3] = &unk_1E622B3D8;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v2->_serverConnection setInvalidationHandler:v16];
    [(NSXPCConnection *)v2->_serverConnection resume];
    v14 = [(NSXPCConnection *)v2->_serverConnection remoteObjectProxy];
    [v14 openXPCConnection];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__TSXDaemonServiceClient_init__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClient(%{public}@): Interruption Handler", (uint8_t *)&v6, 0xCu);
  }
  if (WeakRetained) {
    [WeakRetained interruptedConnection];
  }
}

void __30__TSXDaemonServiceClient_init__block_invoke_68(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClient(%{public}@): Invalidation Handler", (uint8_t *)&v6, 0xCu);
  }
  if (WeakRetained)
  {
    WeakRetained[9] = 1;
    [WeakRetained invalidatedConnection];
  }
}

- (void)interruptedConnection
{
  id v3 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__TSXDaemonServiceClient_interruptedConnection__block_invoke;
  block[3] = &unk_1E622A8F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__TSXDaemonServiceClient_interruptedConnection__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  id v3 = [*(id *)(a1 + 32) serverConnection];
  v4 = [v3 remoteObjectProxy];
  [v4 openXPCConnection];
}

- (void)invalidatedConnection
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedInstanceLock);
  if ((TSXDaemonServiceClient *)_sharedInstance == self)
  {
    _sharedInstance = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedInstanceLock);
}

- (id)exportedObject
{
  id v3 = objc_alloc_init(TSXDaemonServiceClientExported);
  [(TSXDaemonServiceClientExported *)v3 setObject:self];
  return v3;
}

- (unsigned)openDaemonClientWithRegistryEntryID:(unint64_t)a3 clientType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v8 = [(TSXDaemonServiceClient *)self serverConnection];
  v9 = [v8 remoteObjectProxy];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke;
  v19[3] = &unk_1E622B400;
  v19[4] = &v20;
  v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v19];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke_71;
  v18[3] = &unk_1E622B428;
  void v18[4] = &v26;
  v18[5] = &v20;
  [v10 openDaemonClientWithRegistryEntryID:a3 clientType:v6 reply:v18];
  if (a5)
  {
    v11 = (void *)v21[5];
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      v13 = [v11 domain];
      uint64_t v14 = [(id)v21[5] code];
      v15 = [(id)v21[5] userInfo];
      *a5 = [v12 errorWithDomain:v13 code:v14 userInfo:v15];
    }
  }
  unsigned int v16 = *((_DWORD *)v27 + 6);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v16;
}

void __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x1BA9F1DF0]();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke_cold_1(v4);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
}

void __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke_71(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  uint64_t v6 = (void *)MEMORY[0x1BA9F1DF0]();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (BOOL)closeDaemonClient:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  objc_super v21 = __Block_byref_object_copy__2;
  uint64_t v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  uint64_t v6 = [(TSXDaemonServiceClient *)self serverConnection];
  id v7 = [v6 remoteObjectProxy];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke;
  v17[3] = &unk_1E622B400;
  v17[4] = &v18;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v17];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke_74;
  v16[3] = &unk_1E622B450;
  void v16[4] = &v24;
  v16[5] = &v18;
  [v8 closeDaemonClient:v5 reply:v16];
  if (a4)
  {
    v9 = (void *)v19[5];
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      v11 = [v9 domain];
      uint64_t v12 = [(id)v19[5] code];
      v13 = [(id)v19[5] userInfo];
      *a4 = [v10 errorWithDomain:v11 code:v12 userInfo:v13];
    }
  }
  char v14 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

void __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x1BA9F1DF0]();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke_cold_1(v4);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
}

void __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke_74(uint64_t a1, char a2, void *a3)
{
  id v7 = a3;
  uint64_t v6 = (void *)MEMORY[0x1BA9F1DF0]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (BOOL)callMethodForDaemonClient:(unsigned int)a3 clientMethodSelector:(unsigned int)a4 scalarInputs:(const unint64_t *)a5 scalarInputCount:(unsigned int)a6 structInput:(const void *)a7 structInputSize:(unint64_t)a8 scalarOutputs:(unint64_t *)a9 scalarOutputCount:(unsigned int *)a10 error:(id *)a11
{
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  id v37 = 0;
  memset(v30, 0, sizeof(v30));
  uint64_t v31 = a6;
  __memmove_chk();
  unsigned int v16 = [(TSXDaemonServiceClient *)self serverConnection];
  id v17 = [v16 remoteObjectProxy];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke;
  v29[3] = &unk_1E622B400;
  v29[4] = &v32;
  uint64_t v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v29];

  id v19 = 0;
  if (a7 && a8)
  {
    id v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a7 length:a8];
  }
  uint64_t v20 = 0;
  if (a9 && a10) {
    uint64_t v20 = *a10;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_77;
  v28[3] = &unk_1E622B478;
  v28[4] = &v38;
  v28[5] = &v32;
  v28[6] = a9;
  v28[7] = a10;
  [v18 callMethodForDaemonClient:v14 clientMethodSelector:v13 scalarInputs:v30 structInput:v19 scalarOutputCount:v20 reply:v28];
  if (a11)
  {
    objc_super v21 = (void *)v33[5];
    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      id v23 = [v21 domain];
      uint64_t v24 = [(id)v33[5] code];
      id v25 = [(id)v33[5] userInfo];
      *a11 = [v22 errorWithDomain:v23 code:v24 userInfo:v25];
    }
  }
  char v26 = *((unsigned char *)v39 + 24);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  return v26;
}

void __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x1BA9F1DF0]();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_cold_1(v4);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
}

void __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_77(void *a1, char a2, unsigned int *a3, void *a4)
{
  id v13 = a4;
  uint64_t v8 = (void *)MEMORY[0x1BA9F1DF0]();
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  if (v13)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
  }
  else if (a3)
  {
    v9 = (void *)a1[6];
    if (v9)
    {
      v10 = (unsigned int *)a1[7];
      if (v10)
      {
        unsigned int v11 = *v10;
        uint64_t v12 = a3[32];
        if (v11 >= v12)
        {
          memmove(v9, a3, 8 * v12);
          *(_DWORD *)a1[7] = a3[32];
        }
      }
    }
  }
}

- (id)propertiesForRegistryEntryID:(unint64_t)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  uint64_t v5 = [(TSXDaemonServiceClient *)self serverConnection];
  uint64_t v6 = [v5 remoteObjectProxy];
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_80];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__TSXDaemonServiceClient_propertiesForRegistryEntryID___block_invoke_81;
  v10[3] = &unk_1E622B4C0;
  v10[4] = &v11;
  [v7 propertiesForRegistryEntryID:a3 signpostID:self reply:v10];
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __55__TSXDaemonServiceClient_propertiesForRegistryEntryID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1BA9F1DF0]();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_cold_1(v2);
  }
}

void __55__TSXDaemonServiceClient_propertiesForRegistryEntryID___block_invoke_81(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v4 = (void *)MEMORY[0x1BA9F1DF0]();
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
}

- (id)propertyForRegistryEntryID:(unint64_t)a3 key:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__2;
  id v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  id v7 = [(TSXDaemonServiceClient *)self serverConnection];
  id v8 = [v7 remoteObjectProxy];
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_84];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__TSXDaemonServiceClient_propertyForRegistryEntryID_key___block_invoke_85;
  v12[3] = &unk_1E622B4C0;
  v12[4] = &v13;
  [v9 propertyForRegistryEntryID:a3 signpostID:self key:v6 reply:v12];
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __57__TSXDaemonServiceClient_propertyForRegistryEntryID_key___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1BA9F1DF0]();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_cold_1(v2);
  }
}

void __57__TSXDaemonServiceClient_propertyForRegistryEntryID_key___block_invoke_85(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v4 = (void *)MEMORY[0x1BA9F1DF0]();
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    *(_DWORD *)buf = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSXDaemonServiceClient(%{public}@): dealloc", buf, 0xCu);
  }
  self->_invalidated = 1;
  [(NSXPCConnection *)self->_serverConnection invalidate];
  v5.receiver = self;
  v5.super_class = (Class)TSXDaemonServiceClient;
  [(TSXDaemonServiceClient *)&v5 dealloc];
}

- (NSXPCConnection)serverConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

void __79__TSXDaemonServiceClient_openDaemonClientWithRegistryEntryID_clientType_error___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BA88B000, MEMORY[0x1E4F14500], v2, "TSXDaemonServiceClient openDaemonClientWithRegistryEntryID error during call %s", v3, v4, v5, v6, v7);
}

void __50__TSXDaemonServiceClient_closeDaemonClient_error___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BA88B000, MEMORY[0x1E4F14500], v2, "TSXDaemonServiceClient closeDaemonClient error during call %s", v3, v4, v5, v6, v7);
}

void __169__TSXDaemonServiceClient_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BA88B000, MEMORY[0x1E4F14500], v2, "TSXDaemonServiceClient callMethodForDaemonClient:daemonClassName: error during call %s", v3, v4, v5, v6, v7);
}

@end