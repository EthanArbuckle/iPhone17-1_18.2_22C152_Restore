@interface MSNPillDataSourceController
- (MSNPillDataSourceController)initWithQueue:(id)a3;
- (MSNPillDataSourceProtocol)dataSource;
- (NSSet)identifiers;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (int)token;
- (void)dealloc;
- (void)registerPillDataSource:(id)a3 forIdentifiers:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation MSNPillDataSourceController

- (MSNPillDataSourceController)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSNPillDataSourceController;
  v6 = [(MSNPillDataSourceController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_initWeak(&location, v7);
    queue = v7->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__MSNPillDataSourceController_initWithQueue___block_invoke;
    v10[3] = &unk_1E6CA02B0;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.MediaSafetyNet.connectionrequest", &v7->_token, queue, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __45__MSNPillDataSourceController_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__MSNPillDataSourceController_initWithQueue___block_invoke_2;
    block[3] = &unk_1E6CA01D0;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void __45__MSNPillDataSourceController_initWithQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "com.apple.MediaSafetyNet.connectionrequest";
    _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_INFO, "Handling %s by setting up XPC connection", (uint8_t *)&v6, 0xCu);
  }

  v3 = *(void **)(a1 + 32);
  v4 = [v3 dataSource];
  id v5 = [*(id *)(a1 + 32) identifiers];
  [v3 registerPillDataSource:v4 forIdentifiers:v5];
}

- (void)dealloc
{
  notify_cancel(self->_token);
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MSNPillDataSourceController;
  [(MSNPillDataSourceController *)&v3 dealloc];
}

- (void)registerPillDataSource:(id)a3 forIdentifiers:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSNPillDataSourceController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediasafetynet.pill" options:0];
  [(MSNPillDataSourceController *)self setXpcConnection:v9];

  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F37C5808];
  id v11 = [(MSNPillDataSourceController *)self xpcConnection];
  [v11 setRemoteObjectInterface:v10];

  v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F37C6498];
  objc_super v13 = [(MSNPillDataSourceController *)self xpcConnection];
  [v13 setExportedInterface:v12];

  v14 = [(MSNPillDataSourceController *)self xpcConnection];
  [v14 setExportedObject:v6];

  v15 = [(MSNPillDataSourceController *)self xpcConnection];
  v16 = [(MSNPillDataSourceController *)self queue];
  [v15 _setQueue:v16];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69__MSNPillDataSourceController_registerPillDataSource_forIdentifiers___block_invoke;
  v25[3] = &unk_1E6CA01D0;
  v26 = @"com.apple.mediasafetynet.pill";
  v17 = [(MSNPillDataSourceController *)self xpcConnection];
  [v17 setInterruptionHandler:v25];

  v24 = @"com.apple.mediasafetynet.pill";
  v18 = [(MSNPillDataSourceController *)self xpcConnection];
  [v18 setInvalidationHandler:&v23];

  v19 = [(MSNPillDataSourceController *)self xpcConnection];
  [v19 resume];

  [(MSNPillDataSourceController *)self setDataSource:v6];
  [(MSNPillDataSourceController *)self setIdentifiers:v7];
  v20 = MSNLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_1DC736000, v20, OS_LOG_TYPE_INFO, "Registering dataSource: (%@) with identifiers: %@", buf, 0x16u);
  }

  v21 = [(MSNPillDataSourceController *)self xpcConnection];
  v22 = [v21 remoteObjectProxy];
  [v22 registerPillDataSourceForIdentifiers:v7];
}

void __69__MSNPillDataSourceController_registerPillDataSource_forIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_INFO, "Interrupted (%@): If this happens at connection-time or when setting an exception, a required entitlement is likely missing.", (uint8_t *)&v4, 0xCu);
  }
}

void __69__MSNPillDataSourceController_registerPillDataSource_forIdentifiers___block_invoke_13(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = MSNLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1DC736000, v2, OS_LOG_TYPE_INFO, "Invalidated (%@).", (uint8_t *)&v4, 0xCu);
  }
}

- (MSNPillDataSourceProtocol)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MSNPillDataSourceProtocol *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end