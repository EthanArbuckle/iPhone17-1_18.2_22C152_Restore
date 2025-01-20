@interface SYBacklinkMonitorServiceHandle
+ (id)handleWithConnection:(id)a3 queue:(id)a4;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)handleQueue;
- (SYBacklinkMonitorServiceHandle)initWithConnection:(id)a3 queue:(id)a4;
- (SYBacklinkMonitorServiceHandleDelegate)delegate;
- (int)processIdentifier;
- (int64_t)_indicatorCoverage;
- (void)_killConnectionWithCallback;
- (void)activeUserActivityDidChange:(id)a3 context:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)indicatorCoverageWithCompletion:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterCache:(id)a3;
- (void)setHandleQueue:(id)a3;
- (void)setIndicatorCoverage:(id)a3;
@end

@implementation SYBacklinkMonitorServiceHandle

- (void)indicatorCoverageWithCompletion:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    int64_t v5 = [(SYBacklinkMonitorServiceHandle *)self _indicatorCoverage];
    id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:v5];
    v4[2](v4, v6);
  }
}

- (int64_t)_indicatorCoverage
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Synapse"];
  v3 = [v2 objectForKey:@"indicatorCoverage"];

  if (v3) {
    int64_t v4 = [v2 integerForKey:@"indicatorCoverage"];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)setDelegate:(id)a3
{
}

- (int)processIdentifier
{
  return [(NSXPCConnection *)self->_connection processIdentifier];
}

+ (id)handleWithConnection:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithConnection:v7 queue:v6];

  return v8;
}

- (SYBacklinkMonitorServiceHandle)initWithConnection:(id)a3 queue:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SYBacklinkMonitorServiceHandle;
  v9 = [(SYBacklinkMonitorServiceHandle *)&v21 init];
  if (v9)
  {
    v10 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v23 = v7;
      _os_log_impl(&dword_1C2C5F000, v10, OS_LOG_TYPE_INFO, "BacklinkServiceHandle: Creating handle for connection: %p.", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v9->_handleQueue, a4);
    [v7 _setQueue:v9->_handleQueue];
    v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2C920];
    [v7 setExportedInterface:v11];

    [v7 setExportedObject:v9];
    v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2C5B0];
    [v7 setRemoteObjectInterface:v12];

    objc_initWeak((id *)buf, v9);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __59__SYBacklinkMonitorServiceHandle_initWithConnection_queue___block_invoke;
    v18 = &unk_1E64646E8;
    objc_copyWeak(&v20, (id *)buf);
    v19 = v9;
    v13 = (void *)MEMORY[0x1C8769940](&v15);
    objc_msgSend(v7, "setInterruptionHandler:", v13, v15, v16, v17, v18);
    [v7 setInvalidationHandler:v13];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

void __59__SYBacklinkMonitorServiceHandle_initWithConnection_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) _killConnectionWithCallback];
    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SYBacklinkMonitorServiceHandle;
  [(SYBacklinkMonitorServiceHandle *)&v3 dealloc];
}

- (void)_killConnectionWithCallback
{
  id v3 = [(SYBacklinkMonitorServiceHandle *)self delegate];
  [v3 handleDidDisconnect:self];
}

- (void)setFilterCache:(id)a3
{
  id v6 = a3;
  int64_t v4 = [(SYBacklinkMonitorServiceHandle *)self connection];
  int64_t v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_11];

  if (v5) {
    [v5 updateWithFilterCache:v6];
  }
}

void __49__SYBacklinkMonitorServiceHandle_setFilterCache___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__SYBacklinkMonitorServiceHandle_setFilterCache___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)activeUserActivityDidChange:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(void))a5;
  id v10 = a4;
  v11 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 134217984;
    id v14 = v8;
    _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_INFO, "BacklinkServiceHandle: Received request to process activity change. Activity info: %p.", (uint8_t *)&v13, 0xCu);
  }

  v12 = [(SYBacklinkMonitorServiceHandle *)self delegate];
  [v12 scheduleOperationForHandle:self withUserActivity:v8 context:v10];

  if (v9) {
    v9[2](v9);
  }
}

- (void)setIndicatorCoverage:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [a3 integerValue];
  if (v4 <= 2)
  {
    unint64_t v5 = v4;
    id v6 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 134218240;
      int64_t v9 = [(SYBacklinkMonitorServiceHandle *)self _indicatorCoverage];
      __int16 v10 = 2048;
      unint64_t v11 = v5;
      _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_INFO, "BacklinkServiceHandle: Change indicator coverage from: %ld to: %ld", (uint8_t *)&v8, 0x16u);
    }

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Synapse"];
    [v7 setInteger:v5 forKey:@"indicatorCoverage"];
  }
}

- (SYBacklinkMonitorServiceHandleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYBacklinkMonitorServiceHandleDelegate *)WeakRetained;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)handleQueue
{
  return self->_handleQueue;
}

- (void)setHandleQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __49__SYBacklinkMonitorServiceHandle_setFilterCache___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "BacklinkServiceHandle: Error creating remote service proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end