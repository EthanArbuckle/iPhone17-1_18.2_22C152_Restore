@interface PPSMetricMonitorService
+ (id)sharedInstance;
- (BOOL)_canStartMonitoringForClient:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)clients;
- (OS_dispatch_source)processPollingRepeatingTimer;
- (PPSMetricMonitorService)init;
- (PPSMetricMonitorServiceDelegate)delegate;
- (id)fullProcessNameForPid:(int)a3;
- (void)_cancelProcessPollingTimer;
- (void)_handleConnectionEndedWithClient:(id)a3;
- (void)_pollForProcessNames:(id)a3;
- (void)_startProcessPollingTimer:(id)a3;
- (void)_updateMetricCollection:(id)a3 metricCollection:(id)a4;
- (void)collectMetricsOnDemand:(id)a3;
- (void)collectMetricsOnSnapshotWithError:(id *)a3 completion:(id)a4;
- (void)endWithError:(id)a3;
- (void)finishMonitoringAndSendMetrics;
- (void)setClients:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProcessPollingRepeatingTimer:(id)a3;
- (void)setUpWithConfiguration:(id)a3 completion:(id)a4;
- (void)setUpdateInterval:(id)a3 completion:(id)a4;
- (void)startMonitoringProcessWithName:(id)a3 completion:(id)a4;
- (void)startMonitoringProcessWithPID:(id)a3 completion:(id)a4;
- (void)startMonitoringProcessesWithName:(id)a3 completion:(id)a4;
- (void)startMonitoringProcessesWithNames:(id)a3 withPIDs:(id)a4 completion:(id)a5;
- (void)startMonitoringProcessesWithPID:(id)a3 completion:(id)a4;
- (void)startMonitoringSystemMetricsWithCompletion:(id)a3;
- (void)startXPCListener;
- (void)updateWithMetricCollection:(id)a3;
@end

@implementation PPSMetricMonitorService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_service;
  return v2;
}

uint64_t __41__PPSMetricMonitorService_sharedInstance__block_invoke()
{
  sharedInstance_service = objc_alloc_init(PPSMetricMonitorService);
  return MEMORY[0x270F9A758]();
}

- (PPSMetricMonitorService)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPSMetricMonitorService;
  v2 = [(PPSMetricMonitorService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)startXPCListener
{
}

- (void)updateWithMetricCollection:(id)a3
{
  id v4 = a3;
  v5 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService updateWithMetricCollection:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v13);
  v14 = [(PPSMetricMonitorService *)self clients];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__PPSMetricMonitorService_updateWithMetricCollection___block_invoke;
  v16[3] = &unk_26543FCE0;
  id v15 = v4;
  id v17 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:v16];

  objc_sync_exit(v13);
}

void __54__PPSMetricMonitorService_updateWithMetricCollection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 config];
  int v5 = [v4 updateDelegate];

  if (v5)
  {
    uint64_t v6 = [v7 remoteProxy];
    [v6 updateWithMetricCollection:*(void *)(a1 + 32)];
  }
}

- (void)endWithError:(id)a3
{
  id v4 = a3;
  int v5 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService endWithError:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v13);
  v14 = [(PPSMetricMonitorService *)self clients];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __40__PPSMetricMonitorService_endWithError___block_invoke;
  v16[3] = &unk_26543FCE0;
  id v15 = v4;
  id v17 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:v16];

  objc_sync_exit(v13);
}

void __40__PPSMetricMonitorService_endWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 remoteProxy];
  [v4 endWithError:*(void *)(a1 + 32)];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 processIdentifier];
  uint64_t v9 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_258EC0000, v9, OS_LOG_TYPE_DEFAULT, "New client connection from PID %d", (uint8_t *)&buf, 8u);
  }

  uint64_t v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2706F8690];
  [v7 setRemoteObjectInterface:v10];

  uint64_t v11 = [v7 remoteObjectInterface];
  uint64_t v12 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v11 setClasses:v12 forSelector:sel_updateWithMetricCollection_ argumentIndex:0 ofReply:0];

  v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2706F8EA8];
  [v7 setExportedInterface:v13];

  v14 = [v7 exportedInterface];
  id v15 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v14 setClasses:v15 forSelector:sel_setUpWithConfiguration_completion_ argumentIndex:0 ofReply:0];

  [v7 setExportedObject:self];
  v16 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_84];
  id v17 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v17);
  v18 = [[PPSClient alloc] initWithConnection:v7 remoteProxy:v16];
  v19 = [(PPSMetricMonitorService *)self clients];
  v20 = [NSNumber numberWithInt:v8];
  [v19 setObject:v18 forKeyedSubscript:v20];

  objc_sync_exit(v17);
  objc_initWeak(&buf, self);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_87;
  v29[3] = &unk_26543FD08;
  int v31 = v8;
  objc_copyWeak(&v30, &buf);
  v29[4] = self;
  [v7 setInterruptionHandler:v29];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_88;
  v25 = &unk_26543FD08;
  int v28 = v8;
  objc_copyWeak(&v27, &buf);
  v26 = self;
  [v7 setInvalidationHandler:&v22];
  objc_msgSend(v7, "resume", v22, v23, v24, v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&buf);

  return 1;
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_87(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_258EC0000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection from PID: %d interrupted", (uint8_t *)v10, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = [WeakRetained clients];

  objc_sync_enter(v5);
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [v6 clients];
  uint64_t v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    [*(id *)(a1 + 32) _handleConnectionEndedWithClient:v9];
  }

  objc_sync_exit(v5);
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_88(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v16[0] = 67109120;
    v16[1] = v3;
    _os_log_impl(&dword_258EC0000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection from PID %d invalidated", (uint8_t *)v16, 8u);
  }

  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained clients];

  objc_sync_enter(v6);
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [v7 clients];
  uint64_t v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  if (v10) {
    [*(id *)(a1 + 32) _handleConnectionEndedWithClient:v10];
  }
  uint64_t v11 = [*(id *)(a1 + 32) clients];
  BOOL v12 = [v11 count] == 0;

  if (v12)
  {
    v13 = PPSMetricMonitorLogHandleForCategory(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_258EC0000, v13, OS_LOG_TYPE_DEFAULT, "All clients disconnected", (uint8_t *)v16, 2u);
    }

    id v14 = objc_loadWeakRetained(v4);
    id v15 = [v14 delegate];
    [v15 allClientsDidDisconnect];
  }
  objc_sync_exit(v6);
}

- (void)setUpWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v8 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v9 = [v8 processIdentifier];

  uint64_t v10 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService setUpWithConfiguration:completion:]();
  }

  uint64_t v11 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v11);
  BOOL v12 = [(PPSMetricMonitorService *)self clients];
  v13 = [NSNumber numberWithInt:v9];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];

  [(id)v14 setConfig:v6];
  objc_sync_exit(v11);

  id v15 = [(PPSMetricMonitorService *)self delegate];
  LOBYTE(v14) = [v15 isMonitoringMetrics];

  if ((v14 & 1) == 0)
  {
    v16 = [(PPSMetricMonitorService *)self delegate];
    [v16 setUpForMonitoring];
  }
  v7[2](v7);
}

- (void)startMonitoringSystemMetricsWithCompletion:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  int v5 = [MEMORY[0x263F08D68] currentConnection];
  [v5 processIdentifier];

  id v6 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService startMonitoringSystemMetricsWithCompletion:]();
  }

  id v7 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v7);
  uint64_t v8 = [(PPSMetricMonitorService *)self clients];
  uint64_t v9 = NSNumber;
  uint64_t v10 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v11 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "processIdentifier"));
  BOOL v12 = [v8 objectForKeyedSubscript:v11];

  objc_sync_exit(v7);
  if ([(PPSMetricMonitorService *)self _canStartMonitoringForClient:v12])
  {
    v13 = [(PPSMetricMonitorService *)self delegate];
    char v14 = [v13 isMonitoringMetrics];

    if ((v14 & 1) == 0)
    {
      id v15 = [(PPSMetricMonitorService *)self delegate];
      v16 = [v12 config];
      uint64_t v17 = [v16 mode];
      v18 = [v12 config];
      [v18 updateInterval];
      objc_msgSend(v15, "startMonitoringWithConfigurationMode:updateInterval:", v17);
    }
    v4[2](v4, 0);
  }
  else
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"Service is busy";
    v20 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v21 = [v19 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:2 userInfo:v20];
    ((void (**)(id, void *))v4)[2](v4, v21);
  }
}

- (void)startMonitoringProcessWithPID:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:](self, "startMonitoringProcessesWithPID:completion:", v9, v7, v10, v11);
}

- (void)startMonitoringProcessesWithPID:(id)a3 completion:(id)a4
{
  v47[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = [MEMORY[0x263F08D68] currentConnection];
  [v8 processIdentifier];

  uint64_t v9 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:]();
  }

  id v10 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v10);
  uint64_t v11 = [(PPSMetricMonitorService *)self clients];
  BOOL v12 = NSNumber;
  v13 = [MEMORY[0x263F08D68] currentConnection];
  char v14 = objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "processIdentifier"));
  id v15 = [v11 objectForKeyedSubscript:v14];

  objc_sync_exit(v10);
  if ([(PPSMetricMonitorService *)self _canStartMonitoringForClient:v15])
  {
    v16 = (void *)[v6 mutableCopy];
    uint64_t v17 = [v15 config];
    int v18 = [v17 includeBackBoardUsage];

    if (v18)
    {
      v19 = PPSMetricMonitorLogHandleForCategory(2);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:]();
      }

      v20 = NSNumber;
      v21 = [(PPSMetricMonitorService *)self delegate];
      uint64_t v22 = objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "pidForProcessName:", @"backboardd"));
      [v16 addObject:v22];
    }
    uint64_t v23 = PPSMetricMonitorLogHandleForCategory(2);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:]();
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v24 = v16;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v42;
      while (2)
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v24);
          }
          int v28 = *(void **)(*((void *)&v41 + 1) + 8 * v27);
          v29 = [(PPSMetricMonitorService *)self delegate];
          uint64_t v30 = [v28 intValue];
          id v40 = 0;
          [v29 addMonitoredProcessWithPID:v30 error:&v40];
          id v31 = v40;

          if (v31)
          {
            v7[2](v7, v31);

            goto LABEL_23;
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    v32 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v24];
    [v15 setMonitoredPIDs:v32];

    uint64_t v33 = [(PPSMetricMonitorService *)self delegate];
    char v34 = [v33 isMonitoringMetrics];

    if ((v34 & 1) == 0)
    {
      v35 = [(PPSMetricMonitorService *)self delegate];
      v36 = [v15 config];
      uint64_t v37 = [v36 mode];
      v38 = [v15 config];
      [v38 updateInterval];
      objc_msgSend(v35, "startMonitoringWithConfigurationMode:updateInterval:", v37);
    }
    v7[2](v7, 0);
    id v31 = 0;
  }
  else
  {
    v39 = (void *)MEMORY[0x263F087E8];
    uint64_t v46 = *MEMORY[0x263F08320];
    v47[0] = @"Service is busy";
    id v31 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
    id v24 = [v39 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:2 userInfo:v31];
    v7[2](v7, v24);
  }
LABEL_23:
}

- (void)startMonitoringProcessWithName:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PPSMetricMonitorService startMonitoringProcessesWithName:completion:](self, "startMonitoringProcessesWithName:completion:", v9, v7, v10, v11);
}

- (void)startMonitoringProcessesWithName:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  id v7 = [MEMORY[0x263F08D68] currentConnection];
  [v7 processIdentifier];

  id v8 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService startMonitoringProcessesWithName:completion:]();
  }

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v16 = NSNumber;
        uint64_t v17 = [(PPSMetricMonitorService *)self delegate];
        int v18 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "pidForProcessName:", v15));
        [v9 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    v19 = v24;
    [(PPSMetricMonitorService *)self startMonitoringProcessesWithPID:v9 completion:v24];
  }
  else
  {
    v20 = PPSMetricMonitorLogHandleForCategory(2);
    v19 = v24;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricMonitorService startMonitoringProcessesWithName:completion:]();
    }

    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    uint64_t v30 = @"Invalid process name";
    uint64_t v22 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v23 = [v21 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:5 userInfo:v22];
    (*((void (**)(id, void *))v24 + 2))(v24, v23);
  }
}

- (void)startMonitoringProcessesWithNames:(id)a3 withPIDs:(id)a4 completion:(id)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v45 = a3;
  id v46 = a4;
  v47 = (void (**)(id, id))a5;
  id v8 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v9 = [v8 processIdentifier];

  id v10 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 136315906;
    v64 = "-[PPSMetricMonitorService startMonitoringProcessesWithNames:withPIDs:completion:]";
    __int16 v65 = 1024;
    int v66 = v9;
    __int16 v67 = 2112;
    id v68 = v45;
    __int16 v69 = 2112;
    id v70 = v46;
    _os_log_debug_impl(&dword_258EC0000, v10, OS_LOG_TYPE_DEBUG, "%s called by client: %d process names: %@, PIDs: %@ ", buf, 0x26u);
  }

  uint64_t v11 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v11);
  uint64_t v12 = [(PPSMetricMonitorService *)self clients];
  uint64_t v13 = [NSNumber numberWithInt:v9];
  v48 = [v12 objectForKeyedSubscript:v13];

  objc_sync_exit(v11);
  if ([(PPSMetricMonitorService *)self _canStartMonitoringForClient:v48])
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v14 = v46;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v56;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(v14);
          }
          int v18 = *(void **)(*((void *)&v55 + 1) + 8 * v17);
          v19 = [(PPSMetricMonitorService *)self delegate];
          uint64_t v20 = [v18 intValue];
          id v54 = 0;
          [v19 addMonitoredProcessWithPID:v20 error:&v54];
          id v21 = v54;

          if (v21)
          {
            v47[2](v47, v21);
            goto LABEL_32;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v14];
    [v48 setMonitoredPIDs:v22];

    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v45];
    [v48 setRequestedProcessNames:v23];

    id v14 = [MEMORY[0x263EFF9C0] set];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v24 = [v48 requestedProcessNames];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v51;
      while (2)
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v51 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v50 + 1) + 8 * v27);
          uint64_t v29 = [(PPSMetricMonitorService *)self delegate];
          uint64_t v30 = [v29 pidForProcessName:v28];

          if ((int)v30 >= 1)
          {
            id v31 = [v48 monitoredPIDs];
            uint64_t v32 = [NSNumber numberWithInt:v30];
            [v31 addObject:v32];

            uint64_t v33 = [(PPSMetricMonitorService *)self delegate];
            id v49 = 0;
            [v33 addMonitoredProcessWithPID:v30 error:&v49];
            id v21 = v49;

            if (v21)
            {
              v47[2](v47, v21);

              goto LABEL_32;
            }
            [v14 addObject:v28];
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    char v34 = [v48 requestedProcessNames];
    [v34 minusSet:v14];

    v35 = PPSMetricMonitorLogHandleForCategory(2);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[PPSMetricMonitorService startMonitoringProcessesWithNames:withPIDs:completion:]((uint64_t)v14, v48);
    }

    v36 = [v48 requestedProcessNames];
    BOOL v37 = [v36 count] == 0;

    if (!v37) {
      [(PPSMetricMonitorService *)self _startProcessPollingTimer:v48];
    }
    v38 = [(PPSMetricMonitorService *)self delegate];
    char v39 = [v38 isMonitoringMetrics];

    if ((v39 & 1) == 0)
    {
      id v40 = [(PPSMetricMonitorService *)self delegate];
      long long v41 = [v48 config];
      uint64_t v42 = [v41 mode];
      long long v43 = [v48 config];
      [v43 updateInterval];
      objc_msgSend(v40, "startMonitoringWithConfigurationMode:updateInterval:", v42);
    }
    v47[2](v47, 0);
    id v21 = 0;
  }
  else
  {
    long long v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v61 = *MEMORY[0x263F08320];
    v62 = @"Service is busy";
    id v21 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    id v14 = [v44 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:2 userInfo:v21];
    v47[2](v47, v14);
  }
LABEL_32:
}

- (void)finishMonitoringAndSendMetrics
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_258EC0000, v0, v1, "%s called by client: %d", v2, v3, v4, v5, 2u);
}

- (void)collectMetricsOnDemand:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *, void *))a3;
  uint64_t v5 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v6 = [v5 processIdentifier];

  id v7 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService collectMetricsOnDemand:]();
  }

  id v8 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v8);
  uint64_t v9 = [(PPSMetricMonitorService *)self clients];
  id v10 = [NSNumber numberWithInt:v6];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  objc_sync_exit(v8);
  if (v11)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"PID %d does not have a valid connection", v6);
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = v13;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v12 = [v14 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:0 userInfo:v15];

    uint64_t v16 = PPSMetricMonitorLogHandleForCategory(2);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricMonitorService collectMetricsOnDemand:]();
    }
  }
  uint64_t v17 = [(PPSMetricMonitorService *)self delegate];
  int v18 = [v17 collectMetricsOnDemand];
  v4[2](v4, v18, v12);
}

- (void)collectMetricsOnSnapshotWithError:(id *)a3 completion:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void (**)(id, void *, void))a4;
  uint64_t v6 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v7 = [v6 processIdentifier];

  id v8 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService collectMetricsOnSnapshotWithError:completion:].cold.4();
  }

  uint64_t v9 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v9);
  id v10 = [(PPSMetricMonitorService *)self clients];
  uint64_t v11 = [NSNumber numberWithInt:v7];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  objc_sync_exit(v9);
  uint64_t v13 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService collectMetricsOnSnapshotWithError:completion:]((uint64_t)v12, v7, v13);
  }

  if (v12)
  {
    uint64_t v14 = [(PPSMetricMonitorService *)self delegate];
    id v23 = 0;
    uint64_t v15 = [(id)v14 collectMetricsOnSnapshotWithError:&v23];
    id v16 = v23;

    [(PPSMetricMonitorService *)self _updateMetricCollection:v12 metricCollection:v15];
    uint64_t v17 = [v12 requestedProcessNames];
    LOBYTE(v14) = [v17 count] == 0;

    if ((v14 & 1) == 0)
    {
      int v18 = PPSMetricMonitorLogHandleForCategory(2);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitorService collectMetricsOnSnapshotWithError:completion:](v12, v18);
      }
    }
    uint64_t v19 = [v12 metricCollection];
    v5[2](v5, v19, 0);
  }
  else
  {
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"PID %d does not have a valid connection", v7);
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = v15;
    id v21 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v16 = [v20 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:0 userInfo:v21];

    uint64_t v22 = PPSMetricMonitorLogHandleForCategory(2);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricMonitorService collectMetricsOnDemand:]();
    }

    ((void (**)(id, void *, id))v5)[2](v5, 0, v16);
  }
}

- (void)setUpdateInterval:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = [MEMORY[0x263F08D68] currentConnection];
  [v8 processIdentifier];

  uint64_t v9 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService setUpdateInterval:completion:]();
  }

  id v10 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v10);
  uint64_t v11 = [(PPSMetricMonitorService *)self clients];
  uint64_t v12 = [v11 count];

  objc_sync_exit(v10);
  if (v12 == 1)
  {
    uint64_t v13 = [(PPSMetricMonitorService *)self delegate];
    [v6 doubleValue];
    objc_msgSend(v13, "changeUpdateInterval:");

    v7[2](v7, 0);
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"Unable to change update interval while multiple clients are connected";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v16 = [v14 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:8 userInfo:v15];
    ((void (**)(id, void *))v7)[2](v7, v16);
  }
}

- (BOOL)_canStartMonitoringForClient:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 config];

  if (!v5)
  {
    uint64_t v20 = PPSMetricMonitorLogHandleForCategory(2);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[PPSMetricMonitorService _canStartMonitoringForClient:](v4, v20);
    }
    goto LABEL_12;
  }
  id v6 = [(PPSMetricMonitorService *)self delegate];
  int v7 = [v6 isMonitoringMetrics];

  if (!v7)
  {
LABEL_13:
    BOOL v25 = 1;
    goto LABEL_14;
  }
  id v8 = [(PPSMetricMonitorService *)self delegate];
  uint64_t v9 = [v8 currentUpdateMode];

  id v10 = [(PPSMetricMonitorService *)self delegate];
  [v10 currentUpdateInterval];
  double v12 = v11;

  uint64_t v13 = [v4 config];
  uint64_t v14 = [v13 mode];

  if (v9 != v14)
  {
    uint64_t v20 = PPSMetricMonitorLogHandleForCategory(2);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v4 connection];
      int v28 = [v27 processIdentifier];
      uint64_t v29 = [v4 config];
      int v31 = 67109632;
      int v32 = v28;
      __int16 v33 = 2048;
      double v34 = *(double *)&v9;
      __int16 v35 = 2048;
      uint64_t v36 = [v29 mode];
      _os_log_impl(&dword_258EC0000, v20, OS_LOG_TYPE_DEFAULT, "Rejecting client %d due to incompatible mode (current: %ld; requested: %ld)",
        (uint8_t *)&v31,
        0x1Cu);
    }
    goto LABEL_12;
  }
  uint64_t v15 = [v4 config];
  uint64_t v16 = [v15 mode];

  if (v16 == 3)
  {
    uint64_t v20 = PPSMetricMonitorLogHandleForCategory(2);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v21 = [v4 connection];
    int v31 = 67109120;
    int v32 = [v21 processIdentifier];
    uint64_t v30 = "Rejecting client %d with mode updateOnSnapshot; already running";
LABEL_21:
    _os_log_impl(&dword_258EC0000, v20, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v31, 8u);
    goto LABEL_22;
  }
  if (v16 == 1)
  {
    uint64_t v20 = PPSMetricMonitorLogHandleForCategory(2);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v21 = [v4 connection];
    int v31 = 67109120;
    int v32 = [v21 processIdentifier];
    uint64_t v30 = "Rejecting client %d with mode updateOnStop; already running";
    goto LABEL_21;
  }
  if (v16) {
    goto LABEL_13;
  }
  uint64_t v17 = [v4 config];
  [v17 updateInterval];
  double v19 = vabdd_f64(v12, v18);

  if (v19 <= 0.001) {
    goto LABEL_13;
  }
  uint64_t v20 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v4 connection];
    int v22 = [v21 processIdentifier];
    id v23 = [v4 config];
    [v23 updateInterval];
    int v31 = 67109632;
    int v32 = v22;
    __int16 v33 = 2048;
    double v34 = v12;
    __int16 v35 = 2048;
    uint64_t v36 = v24;
    _os_log_impl(&dword_258EC0000, v20, OS_LOG_TYPE_DEFAULT, "Rejecting client %d due to incompatible update interval (current: %f; requested: %f)",
      (uint8_t *)&v31,
      0x1Cu);

LABEL_22:
  }
LABEL_12:

  BOOL v25 = 0;
LABEL_14:

  return v25;
}

- (void)_handleConnectionEndedWithClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PPSMetricMonitorService *)self clients];
  objc_sync_enter(v5);
  id v6 = [(PPSMetricMonitorService *)self clients];
  int v7 = NSNumber;
  id v8 = [v4 connection];
  uint64_t v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "processIdentifier"));
  [v6 removeObjectForKey:v9];

  id v10 = [v4 monitoredPIDs];

  if (v10)
  {
    double v11 = [(PPSMetricMonitorService *)self clients];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __60__PPSMetricMonitorService__handleConnectionEndedWithClient___block_invoke;
    uint64_t v16 = &unk_26543FD30;
    id v17 = v4;
    double v18 = self;
    [v11 enumerateKeysAndObjectsUsingBlock:&v13];
  }
  double v12 = objc_msgSend(v4, "metricCollection", v13, v14, v15, v16);

  if (v12) {
    [v4 setMetricCollection:0];
  }
  objc_sync_exit(v5);
}

void __60__PPSMetricMonitorService__handleConnectionEndedWithClient___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "monitoredPIDs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        double v11 = [v4 monitoredPIDs];
        int v12 = [v11 containsObject:v10];

        if (v12)
        {
          uint64_t v13 = [*(id *)(a1 + 40) delegate];
          objc_msgSend(v13, "removeMonitoredProcessWithPID:", objc_msgSend(v10, "intValue"));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_startProcessPollingTimer:(id)a3
{
  id v4 = a3;
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  [(PPSMetricMonitorService *)self setProcessPollingRepeatingTimer:v5];

  uint64_t v6 = [(PPSMetricMonitorService *)self processPollingRepeatingTimer];
  dispatch_time_t v7 = dispatch_time(0, 0);
  dispatch_source_set_timer(v6, v7, 0xBEBC200uLL, 0x989680uLL);

  objc_initWeak(&location, self);
  uint64_t v8 = [(PPSMetricMonitorService *)self processPollingRepeatingTimer];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __53__PPSMetricMonitorService__startProcessPollingTimer___block_invoke;
  handler[3] = &unk_26543FD58;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  dispatch_source_set_event_handler(v8, handler);

  id v10 = [(PPSMetricMonitorService *)self processPollingRepeatingTimer];
  dispatch_resume(v10);

  double v11 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService _startProcessPollingTimer:]();
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __53__PPSMetricMonitorService__startProcessPollingTimer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _pollForProcessNames:*(void *)(a1 + 32)];
}

- (void)_cancelProcessPollingTimer
{
  uint64_t v3 = [(PPSMetricMonitorService *)self processPollingRepeatingTimer];

  if (v3)
  {
    id v4 = [(PPSMetricMonitorService *)self processPollingRepeatingTimer];
    dispatch_source_cancel(v4);

    [(PPSMetricMonitorService *)self setProcessPollingRepeatingTimer:0];
  }
}

- (void)_pollForProcessNames:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_source_t v5 = [v4 requestedProcessNames];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    [(PPSMetricMonitorService *)self _cancelProcessPollingTimer];
    id v13 = PPSMetricMonitorLogHandleForCategory(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PPSMetricMonitorService _pollForProcessNames:]();
    }
    goto LABEL_12;
  }
  unsigned int v7 = proc_listpids(1u, 0, 0, 0);
  if ((v7 & 0x80000000) == 0)
  {
    int v8 = v7;
    size_t v9 = v7;
    id v10 = (int *)malloc_type_malloc(v7, 0xE0E1D127uLL);
    if (v10)
    {
      double v11 = v10;
      memset(v10, 255, v9);
      uint64_t v29 = v11;
      int v12 = proc_listpids(1u, 0, v11, v8);
      id v13 = objc_opt_new();
      id v14 = PPSMetricMonitorLogHandleForCategory(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PPSMetricMonitorService _pollForProcessNames:]();
      }

      if (v12 >= 4)
      {
        if ((unint64_t)v12 >> 2 <= 1) {
          unint64_t v19 = 1;
        }
        else {
          unint64_t v19 = (unint64_t)v12 >> 2;
        }
        *(void *)&long long v15 = 67109378;
        long long v28 = v15;
        do
        {
          int v21 = *v11++;
          uint64_t v20 = v21;
          if (v21 >= 1)
          {
            int v22 = [(PPSMetricMonitorService *)self fullProcessNameForPid:v20];
            id v23 = [v4 requestedProcessNames];
            int v24 = [v23 containsObject:v22];

            if (v24)
            {
              BOOL v25 = PPSMetricMonitorLogHandleForCategory(2);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)id buf = v28;
                int v32 = v20;
                __int16 v33 = 2112;
                double v34 = v22;
                _os_log_debug_impl(&dword_258EC0000, v25, OS_LOG_TYPE_DEBUG, "Found PID (%d) for %@. Adding to monitor.", buf, 0x12u);
              }

              uint64_t v26 = [v4 requestedProcessNames];
              [v26 removeObject:v22];

              uint64_t v27 = [NSNumber numberWithInt:v20];
              [v13 addObject:v27];
            }
          }
          --v19;
        }
        while (v19);
      }
      if ([v13 count])
      {
        long long v16 = [(PPSMetricMonitorService *)self delegate];
        uint64_t v30 = 0;
        long long v17 = [v16 addMonitoredProcessesWithPIDs:v13 error:&v30];

        [(PPSMetricMonitorService *)self _updateMetricCollection:v4 metricCollection:v17];
        double v18 = [v4 monitoredPIDs];
        [v18 addObjectsFromArray:v13];
      }
      free(v29);
LABEL_12:
    }
  }
}

- (void)_updateMetricCollection:(id)a3 metricCollection:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = PPSMetricMonitorLogHandleForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService _updateMetricCollection:metricCollection:].cold.6(v5);
  }

  int v8 = [v5 metricCollection];

  size_t v9 = PPSMetricMonitorLogHandleForCategory(2);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      -[PPSMetricMonitorService _updateMetricCollection:metricCollection:].cold.5();
    }

    double v11 = [v5 metricCollection];
    [v11 combineWithMetricCollection:v6];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [v5 monitoredPIDs];
    uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v32 = *(void *)v34;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v34 != v32) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
          long long v16 = [v5 metricCollection];
          long long v17 = [v16 processMetrics];
          uint64_t v18 = [v17 objectForKey:v15];
          if (v18)
          {
            unint64_t v19 = (void *)v18;
            uint64_t v20 = [v6 processMetrics];
            int v21 = [v20 objectForKey:v15];

            if (v21)
            {
              int v22 = PPSMetricMonitorLogHandleForCategory(2);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                -[PPSMetricMonitorService _updateMetricCollection:metricCollection:].cold.4((uint64_t)v39, v15);
              }

              id v23 = [v5 metricCollection];
              int v24 = [v23 processMetrics];
              BOOL v25 = [v24 objectForKeyedSubscript:v15];
              uint64_t v26 = [v6 processMetrics];
              uint64_t v27 = [v26 objectForKeyedSubscript:v15];
              [v25 combineWithProcessMetricCollection:v27];

LABEL_21:
              goto LABEL_24;
            }
          }
          else
          {
          }
          long long v28 = [v6 processMetrics];
          uint64_t v29 = [v28 objectForKey:v15];

          id v23 = PPSMetricMonitorLogHandleForCategory(2);
          BOOL v30 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
          if (v29)
          {
            if (v30) {
              -[PPSMetricMonitorService _updateMetricCollection:metricCollection:]((uint64_t)v38, v15);
            }

            id v23 = [v5 metricCollection];
            int v24 = [v6 processMetrics];
            BOOL v25 = [v24 objectForKeyedSubscript:v15];
            [v23 updateMetrics:v25 forPid:v15];
            goto LABEL_21;
          }
          if (v30) {
            -[PPSMetricMonitorService _updateMetricCollection:metricCollection:]((uint64_t)v37, v15);
          }
LABEL_24:

          ++v14;
        }
        while (v13 != v14);
        uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v13);
    }
  }
  else
  {
    if (v10) {
      -[PPSMetricMonitorService _updateMetricCollection:metricCollection:]();
    }

    [v5 setMetricCollection:v6];
  }
}

- (id)fullProcessNameForPid:(int)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3 < 1 || (bzero(buffer, 0x1000uLL), proc_pidpath(a3, buffer, 0x1000u) < 1))
  {
    id v4 = 0;
  }
  else
  {
    buffer[4095] = 0;
    id v4 = [NSString stringWithUTF8String:basename(buffer)];
  }
  return v4;
}

- (PPSMetricMonitorServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PPSMetricMonitorServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)clients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClients:(id)a3
{
}

- (OS_dispatch_source)processPollingRepeatingTimer
{
  return self->_processPollingRepeatingTimer;
}

- (void)setProcessPollingRepeatingTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processPollingRepeatingTimer, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updateWithMetricCollection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)endWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_258EC0000, v0, v1, "Remote object proxy error: %@", v2, v3, v4, v5, v6);
}

- (void)setUpWithConfiguration:completion:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_258EC0000, v0, v1, "%s called by client: %d config: %@", v2);
}

- (void)startMonitoringSystemMetricsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_258EC0000, v0, v1, "%s called by client: %d", v2, v3, v4, v5, 2u);
}

- (void)startMonitoringProcessesWithPID:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_258EC0000, v0, v1, "monitoring : %@", v2, v3, v4, v5, v6);
}

- (void)startMonitoringProcessesWithPID:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_258EC0000, v0, OS_LOG_TYPE_ERROR, "include bbd usage", v1, 2u);
}

- (void)startMonitoringProcessesWithPID:completion:.cold.3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_258EC0000, v0, v1, "%s called by client: %d PID: %@", v2);
}

- (void)startMonitoringProcessesWithName:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_258EC0000, v0, v1, "Invalid process name: %@", v2, v3, v4, v5, v6);
}

- (void)startMonitoringProcessesWithName:completion:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_258EC0000, v0, v1, "%s called by client: %d processName: %@ ", v2);
}

- (void)startMonitoringProcessesWithNames:(uint64_t)a1 withPIDs:(void *)a2 completion:.cold.1(uint64_t a1, void *a2)
{
  int v8 = [a2 requestedProcessNames];
  OUTLINED_FUNCTION_11(&dword_258EC0000, v2, v3, "Found procs :%@, pending:%@", v4, v5, v6, v7, 2u);
}

- (void)collectMetricsOnDemand:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_258EC0000, v0, v1, "collectMetricsOnSnapshot error %@", v2, v3, v4, v5, v6);
}

- (void)collectMetricsOnDemand:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_258EC0000, v0, v1, "%s called by client: %d", v2, v3, v4, v5, 2u);
}

- (void)collectMetricsOnSnapshotWithError:(void *)a1 completion:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 requestedProcessNames];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_258EC0000, a2, OS_LOG_TYPE_ERROR, "Failed to find matching PID for process name(s): %@", v4, 0xCu);
}

- (void)collectMetricsOnSnapshotWithError:(os_log_t)log completion:.cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_258EC0000, log, OS_LOG_TYPE_DEBUG, "Found client for pid %d -> %@", (uint8_t *)v3, 0x12u);
}

- (void)collectMetricsOnSnapshotWithError:completion:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_0(&dword_258EC0000, v0, v1, "%s called by client: %d", v2, v3, v4, v5, 2u);
}

- (void)setUpdateInterval:completion:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_258EC0000, v0, v1, "%s called by client: %d interval: %@", v2);
}

- (void)_canStartMonitoringForClient:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 connection];
  v4[0] = 67109120;
  v4[1] = [v3 processIdentifier];
  _os_log_fault_impl(&dword_258EC0000, a2, OS_LOG_TYPE_FAULT, "Client %d config is nil", (uint8_t *)v4, 8u);
}

- (void)_startProcessPollingTimer:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_258EC0000, v0, v1, "Repeating timer for polling process launch armed.", v2, v3, v4, v5, v6);
}

- (void)_pollForProcessNames:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_258EC0000, v0, v1, "Stopping polling because we found all requested process names.", v2, v3, v4, v5, v6);
}

- (void)_pollForProcessNames:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_258EC0000, v0, v1, "Polling for matches to requested process names.", v2, v3, v4, v5, v6);
}

- (void)_updateMetricCollection:metricCollection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_258EC0000, v0, v1, "Copying client metric collection", v2, v3, v4, v5, v6);
}

- (void)_updateMetricCollection:(uint64_t)a1 metricCollection:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  int v4 = OUTLINED_FUNCTION_7_0(a1, a2);
  *uint64_t v3 = 67109120;
  _DWORD *v2 = v4;
  OUTLINED_FUNCTION_5_0(&dword_258EC0000, v5, v6, "No process metrics found for PID (%d).");
}

- (void)_updateMetricCollection:(uint64_t)a1 metricCollection:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  int v4 = OUTLINED_FUNCTION_7_0(a1, a2);
  *uint64_t v3 = 67109120;
  _DWORD *v2 = v4;
  OUTLINED_FUNCTION_5_0(&dword_258EC0000, v5, v6, "Copying process metrics for monitored PID (%d)");
}

- (void)_updateMetricCollection:(uint64_t)a1 metricCollection:(void *)a2 .cold.4(uint64_t a1, void *a2)
{
  int v4 = OUTLINED_FUNCTION_7_0(a1, a2);
  *uint64_t v3 = 67109120;
  _DWORD *v2 = v4;
  OUTLINED_FUNCTION_5_0(&dword_258EC0000, v5, v6, "Combining process metrics for monitored PID (%d)");
}

- (void)_updateMetricCollection:metricCollection:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_258EC0000, v0, v1, "Combining client metric collection", v2, v3, v4, v5, v6);
}

- (void)_updateMetricCollection:(void *)a1 metricCollection:.cold.6(void *a1)
{
  uint64_t v7 = [a1 monitoredPIDs];
  OUTLINED_FUNCTION_11(&dword_258EC0000, v1, v2, "%s called by client (monitored pids): %@", v3, v4, v5, v6, 2u);
}

@end