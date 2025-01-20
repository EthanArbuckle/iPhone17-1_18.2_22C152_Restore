@interface NPSManager
+ (BOOL)supportsWatch;
- (NPSManager)init;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)internalQueue;
- (id)connection;
- (void)dealloc;
- (void)invalidate;
- (void)setInternalQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4;
- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5;
- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4;
- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5;
- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5;
- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6;
- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6 cloudEnabled:(BOOL)a7;
- (void)unsafe_invalidate;
@end

@implementation NPSManager

void __90__NPSManager_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_cloudEnabled___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __90__NPSManager_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_cloudEnabled___block_invoke_2;
  v7 = &unk_1E6217E00;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&v4];
  objc_msgSend(v3, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), v4, v5, v6, v7);
}

- (id)connection
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (NPSShouldRun() && [(id)objc_opt_class() supportsWatch])
  {
    if (!self->_xpcConnection)
    {
      if (connection_onceToken != -1) {
        dispatch_once(&connection_onceToken, &__block_literal_global_0);
      }
      v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nanoprefsync" options:4096];
      xpcConnection = self->_xpcConnection;
      self->_xpcConnection = v3;

      [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:connection_remoteObjectInterface];
      objc_initWeak(location, self);
      [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&__block_literal_global_70];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __24__NPSManager_connection__block_invoke_71;
      v8[3] = &unk_1E6217DD8;
      objc_copyWeak(&v9, location);
      [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v8];
      [(NSXPCConnection *)self->_xpcConnection resume];
      objc_destroyWeak(&v9);
      objc_destroyWeak(location);
    }
  }
  else if (self->_xpcConnection)
  {
    [(NPSManager *)self unsafe_invalidate];
  }
  uint64_t v5 = self->_xpcConnection;
  if (!v5)
  {
    v6 = nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[NPSManager connection]";
      _os_log_impl(&dword_1BA426000, v6, OS_LOG_TYPE_DEFAULT, "%s: Can't get xpcConnection- either there's a daemon failure or the daemon can't be launched because no watches are paired", (uint8_t *)location, 0xCu);
    }
    uint64_t v5 = self->_xpcConnection;
  }
  return v5;
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6 cloudEnabled:(BOOL)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 2112;
    id v35 = v15;
    _os_log_impl(&dword_1BA426000, v16, OS_LOG_TYPE_DEFAULT, "synchronizeUserDefaultsDomain: (%@); keys: (%@); container: (%@); appGroupContainer: (%@)",
      buf,
      0x2Au);
  }
  internalQueue = self->_internalQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__NPSManager_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_cloudEnabled___block_invoke;
  v22[3] = &unk_1E6217E28;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  BOOL v27 = a7;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_sync(internalQueue, v22);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (NPSManager)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NPSManager;
  v2 = [(NPSManager *)&v10 init];
  if (v2)
  {
    v3 = nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v12 = v2;
      _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
    }
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.nanoprefsync.NPSManager.%p", v2);
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = v4;
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  [(NPSManager *)self unsafe_invalidate];
  v4.receiver = self;
  v4.super_class = (Class)NPSManager;
  [(NPSManager *)&v4 dealloc];
}

- (void)unsafe_invalidate
{
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5
{
}

void __24__NPSManager_connection__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F29280];
  id v3 = &unk_1F13F3C90;
  uint64_t v1 = [v0 interfaceWithProtocol:v3];
  v2 = (void *)connection_remoteObjectInterface;
  connection_remoteObjectInterface = v1;
}

void __24__NPSManager_connection__block_invoke_2()
{
  v0 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1BA426000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }
}

void __24__NPSManager_connection__block_invoke_71(uint64_t a1)
{
  v2 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA426000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__NPSManager_connection__block_invoke_72;
    block[3] = &unk_1E6217C50;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __24__NPSManager_connection__block_invoke_72(uint64_t a1)
{
  return [*(id *)(a1 + 32) setXpcConnection:0];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = self;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__NPSManager_invalidate__block_invoke;
  block[3] = &unk_1E6217C50;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __24__NPSManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unsafe_invalidate");
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4
{
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5
{
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6
{
}

void __90__NPSManager_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_cloudEnabled___block_invoke_2(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    int v9 = 138413314;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1BA426000, v4, OS_LOG_TYPE_DEFAULT, "domain: (%@); keys: (%@); container: (%@); appGroupContainer: (%@) failed with error %@",
      (uint8_t *)&v9,
      0x34u);
  }
}

- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4
{
}

- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[NPSManager synchronizeNanoDomain:keys:cloudEnabled:]";
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1BA426000, v10, OS_LOG_TYPE_DEFAULT, "%s: (%{public}@); keys: (%@)", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__NPSManager_synchronizeNanoDomain_keys_cloudEnabled___block_invoke;
  v14[3] = &unk_1E6217E78;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = a5;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(internalQueue, v14);
}

void __54__NPSManager_synchronizeNanoDomain_keys_cloudEnabled___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __54__NPSManager_synchronizeNanoDomain_keys_cloudEnabled___block_invoke_2;
  uint64_t v7 = &unk_1E6217E50;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&v4];
  objc_msgSend(v3, "synchronizeNanoDomain:keys:cloudEnabled:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), v4, v5, v6, v7);
}

void __54__NPSManager_synchronizeNanoDomain_keys_cloudEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1BA426000, v4, OS_LOG_TYPE_DEFAULT, "synchronizeNanoDomain: (%@); keys: (%@) failed with error %@",
      (uint8_t *)&v7,
      0x20u);
  }
}

+ (BOOL)supportsWatch
{
  if (supportsWatch_onceToken != -1) {
    dispatch_once(&supportsWatch_onceToken, &__block_literal_global_75);
  }
  return supportsWatch_supportsWatch;
}

void __27__NPSManager_supportsWatch__block_invoke()
{
  if (MGGetBoolAnswer())
  {
    id v1 = (id)MGGetStringAnswer();
    if ([v1 isEqualToString:@"Watch"]) {
      char v0 = 1;
    }
    else {
      char v0 = MGGetBoolAnswer();
    }
    supportsWatch_supportsWatch = v0;
  }
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

@end