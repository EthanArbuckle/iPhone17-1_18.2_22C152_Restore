@interface PPSMetricMonitor
- (BOOL)isInterrupted;
- (BOOL)setUpdateInterval:(double)a3 error:(id *)a4;
- (BOOL)startMonitoringProcessWithName:(id)a3 error:(id *)a4;
- (BOOL)startMonitoringProcessWithPID:(int)a3 error:(id *)a4;
- (BOOL)startMonitoringProcessesWithName:(id)a3 error:(id *)a4;
- (BOOL)startMonitoringProcessesWithNames:(id)a3 PIDs:(id)a4 error:(id *)a5;
- (BOOL)startMonitoringProcessesWithPID:(id)a3 error:(id *)a4;
- (BOOL)startMonitoringSystemMetricsWithError:(id *)a3;
- (NSArray)currentProcessNames;
- (NSArray)currentProcessPIDs;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)xpcMessagingQueue;
- (PPSMetricMonitor)initWithConfiguration:(id)a3 delegate:(id)a4 error:(id *)a5;
- (PPSMetricMonitorConfiguration)config;
- (PPSMetricMonitorDelegate)delegate;
- (PPSMetricMonitorServiceInterface)remoteProxy;
- (id)collectMetricsOnDemand;
- (id)collectMetricsOnSnapshot:(id *)a3;
- (int64_t)monitoringState;
- (void)_handleXPCInterruption;
- (void)_resetMonitoringState;
- (void)_resumeMonitoring;
- (void)_setUpXPCConnectionWithConfig:(id)a3;
- (void)collectMetricsOnDemand;
- (void)endWithError:(id)a3;
- (void)setConfig:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentProcessNames:(id)a3;
- (void)setCurrentProcessPIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setIsInterrupted:(BOOL)a3;
- (void)setMonitoringState:(int64_t)a3;
- (void)setRemoteProxy:(id)a3;
- (void)setXpcMessagingQueue:(id)a3;
- (void)startMonitoringSystemMetricsOnly;
- (void)stopMonitoring;
- (void)updateWithMetricCollection:(id)a3;
@end

@implementation PPSMetricMonitor

- (PPSMetricMonitor)initWithConfiguration:(id)a3 delegate:(id)a4 error:(id *)a5
{
  v37[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor initWithConfiguration:delegate:error:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  v35.receiver = self;
  v35.super_class = (Class)PPSMetricMonitor;
  v19 = [(PPSMetricMonitor *)&v35 init];
  if (!v19) {
    goto LABEL_14;
  }
  v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  objc_storeWeak((id *)&v19->_delegate, v10);
  objc_storeStrong((id *)&v19->_config, a3);
  currentProcessPIDs = v19->_currentProcessPIDs;
  v19->_monitoringState = 0;
  v19->_currentProcessPIDs = 0;

  v19->_isInterrupted = 0;
  dispatch_queue_t v22 = dispatch_queue_create("com.apple.PerfPowerMetricMonitor.xpcMessagingQueue", v20);
  xpcMessagingQueue = v19->_xpcMessagingQueue;
  v19->_xpcMessagingQueue = (OS_dispatch_queue *)v22;

  dispatch_queue_t v24 = dispatch_queue_create("com.apple.PerfPowerMetricMonitor.delegateQueue", v20);
  delegateQueue = v19->_delegateQueue;
  v19->_delegateQueue = (OS_dispatch_queue *)v24;

  uint64_t v26 = [v9 mode];
  double v27 = 0.0;
  if ((unint64_t)(v26 - 1) < 3) {
    goto LABEL_5;
  }
  if (!v26)
  {
    [v9 updateInterval];
    double v27 = 0.2;
    if (v28 < 0.2)
    {
      v29 = PPSMetricMonitorLogHandleForCategory(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitor initWithConfiguration:delegate:error:](v9, v29);
      }

LABEL_5:
      [v9 setUpdateInterval:v27];
    }
  }
  if (![v9 updateDelegate] || (objc_opt_respondsToSelector() & 1) != 0)
  {

LABEL_14:
    v30 = v19;
    goto LABEL_15;
  }
  v32 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
    -[PPSMetricMonitor initWithConfiguration:delegate:error:]();
  }

  if (a5)
  {
    v33 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37[0] = @"Invalid configuration";
    v34 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    *a5 = [v33 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:0 userInfo:v34];
  }
  v30 = 0;
LABEL_15:

  return v30;
}

- (BOOL)startMonitoringSystemMetricsWithError:(id *)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  v5 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_258EC0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "startMonitoringSystemMetrics", (const char *)&unk_258ED2076, buf, 2u);
  }

  v6 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor startMonitoringSystemMetricsWithError:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if ([(PPSMetricMonitor *)self monitoringState]
    && ![(PPSMetricMonitor *)self isInterrupted])
  {
    if (a3)
    {
      v20 = PPSMetricMonitorLogHandleForCategory(1);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitor startMonitoringSystemMetricsWithError:]();
      }

      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = *MEMORY[0x263F08320];
      v33[0] = @"Already monitoring";
      dispatch_queue_t v22 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      *a3 = [v21 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:7 userInfo:v22];
    }
    return 0;
  }
  else
  {
    [(PPSMetricMonitor *)self _resetMonitoringState];
    uint64_t v14 = [(PPSMetricMonitor *)self connection];
    BOOL v15 = v14 == 0;

    if (v15)
    {
      uint64_t v16 = [(PPSMetricMonitor *)self config];
      [(PPSMetricMonitor *)self _setUpXPCConnectionWithConfig:v16];
    }
    *(void *)buf = 0;
    double v27 = buf;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    uint64_t v17 = [(PPSMetricMonitor *)self xpcMessagingQueue];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke;
    v25[3] = &unk_26543FB58;
    v25[4] = self;
    v25[5] = buf;
    dispatch_sync(v17, v25);

    uint64_t v18 = (void *)*((void *)v27 + 5);
    BOOL v19 = v18 == 0;
    if (v18)
    {
      if (a3) {
        *a3 = v18;
      }
    }
    else
    {
      v23 = [(PPSMetricMonitor *)self connection];

      if (v23) {
        [(PPSMetricMonitor *)self setMonitoringState:1];
      }
    }
    _Block_object_dispose(buf, 8);
  }
  return v19;
}

void __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteProxy];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke_2;
  v3[3] = &unk_26543FB30;
  v3[4] = *(void *)(a1 + 40);
  [v2 startMonitoringSystemMetricsWithCompletion:v3];
}

void __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)startMonitoringSystemMetricsOnly
{
}

- (BOOL)startMonitoringProcessWithPID:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v31[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor startMonitoringProcessWithPID:error:](v5, v7);
  }

  if ([(PPSMetricMonitor *)self monitoringState]
    && ![(PPSMetricMonitor *)self isInterrupted])
  {
    if (a4)
    {
      uint64_t v14 = PPSMetricMonitorLogHandleForCategory(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitor startMonitoringProcessWithPID:error:]();
      }

      BOOL v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F08320];
      v31[0] = @"Already monitoring";
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
      *a4 = [v15 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:7 userInfo:v16];
    }
    return 0;
  }
  else
  {
    [(PPSMetricMonitor *)self _resetMonitoringState];
    uint64_t v8 = [(PPSMetricMonitor *)self connection];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      uint64_t v10 = [(PPSMetricMonitor *)self config];
      [(PPSMetricMonitor *)self _setUpXPCConnectionWithConfig:v10];
    }
    uint64_t v23 = 0;
    dispatch_queue_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy_;
    double v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    uint64_t v11 = [(PPSMetricMonitor *)self xpcMessagingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__PPSMetricMonitor_startMonitoringProcessWithPID_error___block_invoke;
    block[3] = &unk_26543FB80;
    int v22 = v5;
    block[4] = self;
    block[5] = &v23;
    dispatch_sync(v11, block);

    uint64_t v12 = (void *)v24[5];
    BOOL v13 = v12 == 0;
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      uint64_t v17 = [(PPSMetricMonitor *)self connection];

      if (v17)
      {
        [(PPSMetricMonitor *)self setMonitoringState:2];
        uint64_t v18 = [NSNumber numberWithInt:v5];
        v29 = v18;
        BOOL v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
        [(PPSMetricMonitor *)self setCurrentProcessPIDs:v19];
      }
    }
    _Block_object_dispose(&v23, 8);
  }
  return v13;
}

void __56__PPSMetricMonitor_startMonitoringProcessWithPID_error___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) remoteProxy];
  v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__PPSMetricMonitor_startMonitoringProcessWithPID_error___block_invoke_2;
  v5[3] = &unk_26543FB30;
  v5[4] = *(void *)(a1 + 40);
  [v2 startMonitoringProcessesWithPID:v4 completion:v5];
}

void __56__PPSMetricMonitor_startMonitoringProcessWithPID_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)startMonitoringProcessesWithPID:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor startMonitoringProcessesWithPID:error:]();
  }

  if ([(PPSMetricMonitor *)self monitoringState]
    && ![(PPSMetricMonitor *)self isInterrupted])
  {
    if (a4)
    {
      BOOL v15 = PPSMetricMonitorLogHandleForCategory(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitor startMonitoringProcessWithPID:error:]();
      }

      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F08320];
      v35[0] = @"Already monitoring";
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a4 = [v16 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:7 userInfo:v17];
    }
    BOOL v14 = 0;
  }
  else
  {
    [(PPSMetricMonitor *)self _resetMonitoringState];
    uint64_t v8 = [(PPSMetricMonitor *)self connection];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      uint64_t v10 = [(PPSMetricMonitor *)self config];
      [(PPSMetricMonitor *)self _setUpXPCConnectionWithConfig:v10];
    }
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy_;
    uint64_t v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    uint64_t v11 = [(PPSMetricMonitor *)self xpcMessagingQueue];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __58__PPSMetricMonitor_startMonitoringProcessesWithPID_error___block_invoke;
    dispatch_queue_t v24 = &unk_26543FBA8;
    uint64_t v25 = self;
    id v12 = v6;
    id v26 = v12;
    double v27 = &v28;
    dispatch_sync(v11, &v21);

    BOOL v13 = (void *)v29[5];
    BOOL v14 = v13 == 0;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
    }
    else
    {
      uint64_t v18 = [(PPSMetricMonitor *)self connection];

      if (v18)
      {
        [(PPSMetricMonitor *)self setMonitoringState:2];
        BOOL v19 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v12];
        [(PPSMetricMonitor *)self setCurrentProcessPIDs:v19];
      }
    }

    _Block_object_dispose(&v28, 8);
  }

  return v14;
}

void __58__PPSMetricMonitor_startMonitoringProcessesWithPID_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteProxy];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__PPSMetricMonitor_startMonitoringProcessesWithPID_error___block_invoke_2;
  v4[3] = &unk_26543FB30;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 48);
  [v2 startMonitoringProcessesWithPID:v3 completion:v4];
}

void __58__PPSMetricMonitor_startMonitoringProcessesWithPID_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)startMonitoringProcessWithName:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor startMonitoringProcessWithName:error:]();
  }

  if ([(PPSMetricMonitor *)self monitoringState]
    && ![(PPSMetricMonitor *)self isInterrupted])
  {
    if (a4)
    {
      BOOL v15 = PPSMetricMonitorLogHandleForCategory(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitor startMonitoringProcessWithName:error:]();
      }

      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v32[0] = @"Already monitoring";
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      *a4 = [v16 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:7 userInfo:v17];
    }
    BOOL v14 = 0;
  }
  else
  {
    [(PPSMetricMonitor *)self _resetMonitoringState];
    uint64_t v8 = [(PPSMetricMonitor *)self connection];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      uint64_t v10 = [(PPSMetricMonitor *)self config];
      [(PPSMetricMonitor *)self _setUpXPCConnectionWithConfig:v10];
    }
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    double v27 = __Block_byref_object_copy_;
    uint64_t v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    uint64_t v11 = [(PPSMetricMonitor *)self xpcMessagingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__PPSMetricMonitor_startMonitoringProcessWithName_error___block_invoke;
    block[3] = &unk_26543FBA8;
    block[4] = self;
    id v12 = v6;
    id v22 = v12;
    uint64_t v23 = &v24;
    dispatch_sync(v11, block);

    BOOL v13 = (void *)v25[5];
    BOOL v14 = v13 == 0;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
    }
    else
    {
      uint64_t v18 = [(PPSMetricMonitor *)self connection];

      if (v18)
      {
        [(PPSMetricMonitor *)self setMonitoringState:2];
        id v30 = v12;
        BOOL v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        [(PPSMetricMonitor *)self setCurrentProcessNames:v19];
      }
    }

    _Block_object_dispose(&v24, 8);
  }

  return v14;
}

void __57__PPSMetricMonitor_startMonitoringProcessWithName_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteProxy];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__PPSMetricMonitor_startMonitoringProcessWithName_error___block_invoke_2;
  v4[3] = &unk_26543FB30;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 48);
  [v2 startMonitoringProcessWithName:v3 completion:v4];
}

void __57__PPSMetricMonitor_startMonitoringProcessWithName_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)startMonitoringProcessesWithName:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor startMonitoringProcessesWithName:error:]();
  }

  if ([(PPSMetricMonitor *)self monitoringState]
    && ![(PPSMetricMonitor *)self isInterrupted])
  {
    if (a4)
    {
      BOOL v15 = PPSMetricMonitorLogHandleForCategory(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitor startMonitoringProcessWithName:error:]();
      }

      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F08320];
      v35[0] = @"Already monitoring";
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a4 = [v16 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:7 userInfo:v17];
    }
    BOOL v14 = 0;
  }
  else
  {
    [(PPSMetricMonitor *)self _resetMonitoringState];
    uint64_t v8 = [(PPSMetricMonitor *)self connection];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      uint64_t v10 = [(PPSMetricMonitor *)self config];
      [(PPSMetricMonitor *)self _setUpXPCConnectionWithConfig:v10];
    }
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy_;
    uint64_t v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    uint64_t v11 = [(PPSMetricMonitor *)self xpcMessagingQueue];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __59__PPSMetricMonitor_startMonitoringProcessesWithName_error___block_invoke;
    uint64_t v24 = &unk_26543FBA8;
    uint64_t v25 = self;
    id v12 = v6;
    id v26 = v12;
    double v27 = &v28;
    dispatch_sync(v11, &v21);

    BOOL v13 = (void *)v29[5];
    BOOL v14 = v13 == 0;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
    }
    else
    {
      uint64_t v18 = [(PPSMetricMonitor *)self connection];

      if (v18)
      {
        [(PPSMetricMonitor *)self setMonitoringState:2];
        BOOL v19 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v12];
        [(PPSMetricMonitor *)self setCurrentProcessNames:v19];
      }
    }

    _Block_object_dispose(&v28, 8);
  }

  return v14;
}

void __59__PPSMetricMonitor_startMonitoringProcessesWithName_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteProxy];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__PPSMetricMonitor_startMonitoringProcessesWithName_error___block_invoke_2;
  v4[3] = &unk_26543FB30;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 48);
  [v2 startMonitoringProcessesWithName:v3 completion:v4];
}

void __59__PPSMetricMonitor_startMonitoringProcessesWithName_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)startMonitoringProcessesWithNames:(id)a3 PIDs:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor startMonitoringProcessesWithNames:PIDs:error:]();
  }

  if ([(PPSMetricMonitor *)self monitoringState]
    && ![(PPSMetricMonitor *)self isInterrupted])
  {
    if (a5)
    {
      uint64_t v18 = PPSMetricMonitorLogHandleForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitor startMonitoringProcessesWithNames:PIDs:error:]();
      }

      BOOL v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v34 = *MEMORY[0x263F08320];
      v35[0] = @"Already monitoring";
      v20 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a5 = [v19 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:7 userInfo:v20];
    }
    BOOL v17 = 0;
  }
  else
  {
    [(PPSMetricMonitor *)self _resetMonitoringState];
    uint64_t v11 = [(PPSMetricMonitor *)self connection];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      BOOL v13 = [(PPSMetricMonitor *)self config];
      [(PPSMetricMonitor *)self _setUpXPCConnectionWithConfig:v13];
    }
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy_;
    uint64_t v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    BOOL v14 = [(PPSMetricMonitor *)self xpcMessagingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__PPSMetricMonitor_startMonitoringProcessesWithNames_PIDs_error___block_invoke;
    block[3] = &unk_26543FBD0;
    block[4] = self;
    id v25 = v8;
    id v15 = v9;
    id v26 = v15;
    double v27 = &v28;
    dispatch_sync(v14, block);

    uint64_t v16 = (void *)v29[5];
    BOOL v17 = v16 == 0;
    if (v16)
    {
      if (a5) {
        *a5 = v16;
      }
    }
    else
    {
      uint64_t v21 = [(PPSMetricMonitor *)self connection];

      if (v21)
      {
        [(PPSMetricMonitor *)self setMonitoringState:2];
        uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v15];
        [(PPSMetricMonitor *)self setCurrentProcessPIDs:v22];
      }
    }

    _Block_object_dispose(&v28, 8);
  }

  return v17;
}

void __65__PPSMetricMonitor_startMonitoringProcessesWithNames_PIDs_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__PPSMetricMonitor_startMonitoringProcessesWithNames_PIDs_error___block_invoke_2;
  v5[3] = &unk_26543FB30;
  v5[4] = *(void *)(a1 + 56);
  [v2 startMonitoringProcessesWithNames:v3 withPIDs:v4 completion:v5];
}

void __65__PPSMetricMonitor_startMonitoringProcessesWithNames_PIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)collectMetricsOnDemand
{
  v40[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(PPSMetricMonitor *)v3 collectMetricsOnDemand];
  }

  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy_;
  objc_super v35 = __Block_byref_object_dispose_;
  uint64_t v36 = objc_alloc_init(PPSMetricCollection);
  uint64_t v28 = 0;
  v29[0] = &v28;
  v29[1] = 0x3032000000;
  v29[2] = __Block_byref_object_copy_;
  v29[3] = __Block_byref_object_dispose_;
  id v30 = 0;
  if ([(PPSMetricMonitor *)self isInterrupted])
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    v40[0] = @"Cannot collect metrics when interrupted";
    BOOL v12 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v13 = [v11 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:3 userInfo:v12];
  }
  else
  {
    if ([(PPSMetricMonitor *)self monitoringState]) {
      goto LABEL_8;
    }
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F08320];
    v38 = @"Cannot collect metrics when not monitoring";
    BOOL v12 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v13 = [v14 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:10 userInfo:v12];
  }
  id v15 = *(void **)(v29[0] + 40);
  *(void *)(v29[0] + 40) = v13;

LABEL_8:
  if (*(void *)(v29[0] + 40))
  {
    uint64_t v16 = PPSMetricMonitorLogHandleForCategory(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(PPSMetricMonitor *)(uint64_t)v29 collectMetricsOnDemand];
    }
  }
  else
  {
    uint64_t v16 = [(PPSMetricMonitor *)self connection];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __42__PPSMetricMonitor_collectMetricsOnDemand__block_invoke;
    v27[3] = &unk_26543FB30;
    v27[4] = &v28;
    uint64_t v23 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v27];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __42__PPSMetricMonitor_collectMetricsOnDemand__block_invoke_2;
    v26[3] = &unk_26543FBF8;
    v26[4] = &v31;
    v26[5] = &v28;
    [v23 collectMetricsOnDemand:v26];
  }
  id v24 = (id)v32[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v31, 8);
  return v24;
}

void __42__PPSMetricMonitor_collectMetricsOnDemand__block_invoke(uint64_t a1, void *a2)
{
}

void __42__PPSMetricMonitor_collectMetricsOnDemand__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)collectMetricsOnSnapshot:(id *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = PPSMetricMonitorLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = [(PPSMetricMonitor *)self monitoringState];
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [(PPSMetricMonitor *)self isInterrupted];
    _os_log_impl(&dword_258EC0000, v5, OS_LOG_TYPE_DEFAULT, "collecting snapshot, monitoringState=%ld, isInterrupted=%d", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  uint64_t v25 = 0;
  v26[0] = &v25;
  v26[1] = 0x3032000000;
  v26[2] = __Block_byref_object_copy_;
  v26[3] = __Block_byref_object_dispose_;
  id v27 = 0;
  if ([(PPSMetricMonitor *)self isInterrupted])
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    uint64_t v31 = @"Cannot collect metrics when interrupted";
    uint64_t v7 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v8 = [v6 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:3 userInfo:v7];
  }
  else
  {
    if ([(PPSMetricMonitor *)self monitoringState]) {
      goto LABEL_8;
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    id v29 = @"Cannot collect metrics when not monitoring";
    uint64_t v7 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v8 = [v9 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:10 userInfo:v7];
  }
  uint64_t v10 = *(void **)(v26[0] + 40);
  *(void *)(v26[0] + 40) = v8;

LABEL_8:
  if (*(void *)(v26[0] + 40))
  {
    id v11 = PPSMetricMonitorLogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricMonitor collectMetricsOnSnapshot:]((uint64_t)v26, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    uint64_t v18 = [(PPSMetricMonitor *)self connection];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __45__PPSMetricMonitor_collectMetricsOnSnapshot___block_invoke;
    v24[3] = &unk_26543FB30;
    v24[4] = &v25;
    uint64_t v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v24];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __45__PPSMetricMonitor_collectMetricsOnSnapshot___block_invoke_2;
    v23[3] = &unk_26543FBF8;
    v23[4] = buf;
    v23[5] = &v25;
    [v19 collectMetricsOnSnapshotWithError:a3 completion:v23];

    uint64_t v20 = *(void **)(v26[0] + 40);
    if (v20) {
      *a3 = v20;
    }
  }
  id v21 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(buf, 8);
  return v21;
}

void __45__PPSMetricMonitor_collectMetricsOnSnapshot___block_invoke(uint64_t a1, void *a2)
{
}

void __45__PPSMetricMonitor_collectMetricsOnSnapshot___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)stopMonitoring
{
}

void __34__PPSMetricMonitor_stopMonitoring__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) remoteProxy];
  [v1 finishMonitoringAndSendMetrics];
}

- (BOOL)setUpdateInterval:(double)a3 error:(id *)a4
{
  double v6 = 0.2;
  if (a3 >= 0.2)
  {
    double v6 = a3;
  }
  else
  {
    uint64_t v7 = PPSMetricMonitorLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricMonitor setUpdateInterval:error:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  id v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v15 = [(PPSMetricMonitor *)self remoteProxy];
  uint64_t v16 = [NSNumber numberWithDouble:v6];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __44__PPSMetricMonitor_setUpdateInterval_error___block_invoke;
  v19[3] = &unk_26543FB30;
  v19[4] = &v20;
  [v15 setUpdateInterval:v16 completion:v19];

  uint64_t v17 = (void *)v21[5];
  if (a4 && v17) {
    *a4 = v17;
  }
  _Block_object_dispose(&v20, 8);

  return v17 == 0;
}

void __44__PPSMetricMonitor_setUpdateInterval_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_resetMonitoringState
{
  [(PPSMetricMonitor *)self setMonitoringState:0];
  [(PPSMetricMonitor *)self setCurrentProcessPIDs:0];
  [(PPSMetricMonitor *)self setCurrentProcessNames:0];
  [(PPSMetricMonitor *)self setIsInterrupted:0];
}

- (void)updateWithMetricCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PPSMetricMonitor *)self delegate];

  if (v5)
  {
    double v6 = [(PPSMetricMonitor *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(PPSMetricMonitor *)self delegateQueue];
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __47__PPSMetricMonitor_updateWithMetricCollection___block_invoke;
      uint64_t v16 = &unk_26543FC48;
      uint64_t v17 = self;
      id v18 = v4;
      dispatch_async(v8, &v13);

      goto LABEL_9;
    }
    uint64_t v9 = PPSMetricMonitorLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PPSMetricMonitor updateWithMetricCollection:]();
    }
  }
  else
  {
    uint64_t v9 = PPSMetricMonitorLogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricMonitor updateWithMetricCollection:]();
    }
  }

LABEL_9:
  uint64_t v10 = [(PPSMetricMonitor *)self config];
  uint64_t v11 = [v10 mode];

  if (v11 == 1)
  {
    uint64_t v12 = [(PPSMetricMonitor *)self connection];
    [v12 invalidate];
  }
}

void __47__PPSMetricMonitor_updateWithMetricCollection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metricMonitor:*(void *)(a1 + 32) didUpdateWithMetrics:*(void *)(a1 + 40)];
}

- (void)endWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(PPSMetricMonitor *)self delegate];
  [v5 metricMonitor:self didEndWithError:v4];

  [(PPSMetricMonitor *)self _resetMonitoringState];
}

- (void)_setUpXPCConnectionWithConfig:(id)a3
{
  id v4 = a3;
  id v5 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor _setUpXPCConnectionWithConfig:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.PerfPowerMetricMonitor.xpc" options:4096];
  [(PPSMetricMonitor *)self setConnection:v13];

  uint64_t v14 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2706F8EA8];
  uint64_t v15 = [(PPSMetricMonitor *)self connection];
  [v15 setRemoteObjectInterface:v14];

  uint64_t v16 = [(PPSMetricMonitor *)self connection];
  uint64_t v17 = [v16 remoteObjectInterface];
  id v18 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v17 setClasses:v18 forSelector:sel_setUpWithConfiguration_completion_ argumentIndex:0 ofReply:0];

  uint64_t v19 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2706F8690];
  uint64_t v20 = [(PPSMetricMonitor *)self connection];
  [v20 setExportedInterface:v19];

  id v21 = [(PPSMetricMonitor *)self connection];
  uint64_t v22 = [v21 exportedInterface];
  uint64_t v23 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v22 setClasses:v23 forSelector:sel_updateWithMetricCollection_ argumentIndex:0 ofReply:0];

  id v24 = [(PPSMetricMonitor *)self connection];
  [v24 setExportedObject:self];

  objc_initWeak(&location, self);
  id v25 = [(PPSMetricMonitor *)self connection];
  id v26 = [v25 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  [(PPSMetricMonitor *)self setRemoteProxy:v26];

  id v27 = [(PPSMetricMonitor *)self connection];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_59;
  v38[3] = &unk_26543FC90;
  objc_copyWeak(&v39, &location);
  [v27 setInterruptionHandler:v38];

  uint64_t v28 = [(PPSMetricMonitor *)self connection];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_60;
  v36[3] = &unk_26543FC90;
  objc_copyWeak(&v37, &location);
  [v28 setInvalidationHandler:v36];

  id v29 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_258EC0000, v29, OS_LOG_TYPE_DEFAULT, "Connecting to powerlogHelperd", buf, 2u);
  }

  uint64_t v30 = [(PPSMetricMonitor *)self connection];
  [v30 resume];

  uint64_t v31 = [(PPSMetricMonitor *)self xpcMessagingQueue];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  void v33[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_65;
  v33[3] = &unk_26543FC48;
  v33[4] = self;
  id v34 = v4;
  id v32 = v4;
  dispatch_async(v31, v33);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_59(uint64_t a1)
{
  id v2 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_59_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleXPCInterruption];
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_60(uint64_t a1)
{
  id v2 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_60_cold_1();
  }

  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setConnection:0];

  id v5 = objc_loadWeakRetained(v3);
  [v5 setRemoteProxy:0];

  id v6 = objc_loadWeakRetained(v3);
  uint64_t v7 = [v6 monitoringState];

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v3);
    uint64_t v9 = [v8 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_61;
    block[3] = &unk_26543FC90;
    objc_copyWeak(&v11, v3);
    dispatch_async(v9, block);

    objc_destroyWeak(&v11);
  }
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_61(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F08320];
  v6[0] = @"XPC connection invalidated";
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:1 userInfo:v3];
  [WeakRetained endWithError:v4];
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_65(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_2;
  v4[3] = &unk_26543FC90;
  objc_copyWeak(&v5, &location);
  [v2 setUpWithConfiguration:v3 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_2(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_3;
    block[3] = &unk_26543FC90;
    objc_copyWeak(&v8, v1);
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
  }
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained delegate];
  [v1 metricMonitorDidBecomeReady:WeakRetained];
}

- (void)_handleXPCInterruption
{
  [(PPSMetricMonitor *)self setIsInterrupted:1];
  uint64_t v3 = [(PPSMetricMonitor *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PPSMetricMonitor *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke;
    block[3] = &unk_26543FC20;
    void block[4] = self;
    dispatch_async(v5, block);
  }
  id v6 = [(PPSMetricMonitor *)self xpcMessagingQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_2;
  v7[3] = &unk_26543FC20;
  v7[4] = self;
  dispatch_async(v6, v7);
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metricMonitorInterruptionDidBegin:*(void *)(a1 + 32)];
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) remoteProxy];
  uint64_t v3 = [*(id *)(a1 + 32) config];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_3;
  v4[3] = &unk_26543FC90;
  objc_copyWeak(&v5, &location);
  [v2 setUpWithConfiguration:v3 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_3(uint64_t a1)
{
  id v2 = PPSMetricMonitorLogHandleForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_258EC0000, v2, OS_LOG_TYPE_DEFAULT, "Resumed XPC connection to powerlogHelperd", buf, 2u);
  }

  uint64_t v3 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_70;
  block[3] = &unk_26543FC90;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resumeMonitoring];
}

- (void)_resumeMonitoring
{
}

void __37__PPSMetricMonitor__resumeMonitoring__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metricMonitorInterruptionDidEnd:*(void *)(a1 + 32)];
}

void __37__PPSMetricMonitor__resumeMonitoring__block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [v5 setObject:@"Failed to resume after interruption" forKeyedSubscript:*MEMORY[0x263F08320]];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [v5 setObject:v2 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  char v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:3 userInfo:v5];
  [v3 endWithError:v4];
}

- (PPSMetricMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PPSMetricMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PPSMetricMonitorConfiguration)config
{
  return (PPSMetricMonitorConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfig:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
}

- (PPSMetricMonitorServiceInterface)remoteProxy
{
  return (PPSMetricMonitorServiceInterface *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemoteProxy:(id)a3
{
}

- (int64_t)monitoringState
{
  return self->_monitoringState;
}

- (void)setMonitoringState:(int64_t)a3
{
  self->_monitoringState = a3;
}

- (NSArray)currentProcessPIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentProcessPIDs:(id)a3
{
}

- (NSArray)currentProcessNames
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentProcessNames:(id)a3
{
}

- (BOOL)isInterrupted
{
  return self->_isInterrupted;
}

- (void)setIsInterrupted:(BOOL)a3
{
  self->_isInterrupted = a3;
}

- (OS_dispatch_queue)xpcMessagingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setXpcMessagingQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_xpcMessagingQueue, 0);
  objc_storeStrong((id *)&self->_currentProcessNames, 0);
  objc_storeStrong((id *)&self->_currentProcessPIDs, 0);
  objc_storeStrong((id *)&self->_remoteProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithConfiguration:delegate:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_258EC0000, v0, OS_LOG_TYPE_FAULT, "Must implement metricMonitor:didUpdateWithMetrics: if updateDelegate is YES", v1, 2u);
}

- (void)initWithConfiguration:(void *)a1 delegate:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [a1 updateInterval];
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_258EC0000, a2, OS_LOG_TYPE_ERROR, "Update interval smaller than 0.2 s is not supported (got %f); defaulting to 0.2 s",
    (uint8_t *)&v4,
    0xCu);
}

- (void)initWithConfiguration:(uint64_t)a3 delegate:(uint64_t)a4 error:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startMonitoringSystemMetricsWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258EC0000, v0, v1, "startMonitoringSystemMetricsWithError called while already monitoring", v2, v3, v4, v5, v6);
}

- (void)startMonitoringSystemMetricsWithError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startMonitoringProcessWithPID:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258EC0000, v0, v1, "startMonitoringProcessWithPID called while already monitoring", v2, v3, v4, v5, v6);
}

- (void)startMonitoringProcessWithPID:(int)a1 error:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[PPSMetricMonitor startMonitoringProcessWithPID:error:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_258EC0000, a2, OS_LOG_TYPE_DEBUG, "%s %d", (uint8_t *)&v2, 0x12u);
}

- (void)startMonitoringProcessesWithPID:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_258EC0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)startMonitoringProcessWithName:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258EC0000, v0, v1, "startMonitoringProcessWithName called while already monitoring", v2, v3, v4, v5, v6);
}

- (void)startMonitoringProcessWithName:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_258EC0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)startMonitoringProcessesWithName:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_258EC0000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)startMonitoringProcessesWithNames:PIDs:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258EC0000, v0, v1, "startMonitoringProcessesWithNames:withPIDs called while already monitoring", v2, v3, v4, v5, v6);
}

- (void)startMonitoringProcessesWithNames:PIDs:error:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_258EC0000, v2, OS_LOG_TYPE_DEBUG, "%s %@ %@", (uint8_t *)v3, 0x20u);
}

- (void)collectMetricsOnDemand
{
}

- (void)collectMetricsOnSnapshot:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setUpdateInterval:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)updateWithMetricCollection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258EC0000, v0, v1, "PPSMetricMonitor delegate is nil!", v2, v3, v4, v5, v6);
}

- (void)updateWithMetricCollection:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_258EC0000, v0, OS_LOG_TYPE_DEBUG, "metricMonitor:didUpdateWithMetrics: is not implemented", v1, 2u);
}

- (void)_setUpXPCConnectionWithConfig:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_59_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258EC0000, v0, v1, "XPC connection to powerlogHelperd interrupted", v2, v3, v4, v5, v6);
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_258EC0000, v0, v1, "XPC connection to powerlogHelperd invalidated", v2, v3, v4, v5, v6);
}

@end