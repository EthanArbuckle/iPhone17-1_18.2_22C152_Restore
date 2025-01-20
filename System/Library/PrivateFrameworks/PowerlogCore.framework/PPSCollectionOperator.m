@interface PPSCollectionOperator
- (BOOL)monitor;
- (BOOL)shouldApply136229065B;
- (NSString)monitoredCategory;
- (NSString)monitoredSubsystem;
- (PLCFNotificationOperatorComposition)startMonitor;
- (PLCFNotificationOperatorComposition)stopMonitor;
- (PLXPCListenerOperatorComposition)metricListener;
- (PLXPCResponderOperatorComposition)allowlistResponder;
- (PPSCollectionOperator)init;
- (void)initOperatorDependancies;
- (void)monitorMetricsForSubsystem:(id)a3 category:(id)a4 payload:(id)a5;
- (void)setAllowlistResponder:(id)a3;
- (void)setMetricListener:(id)a3;
- (void)setMonitor:(BOOL)a3;
- (void)setMonitoredCategory:(id)a3;
- (void)setMonitoredSubsystem:(id)a3;
- (void)setStartMonitor:(id)a3;
- (void)setStopMonitor:(id)a3;
@end

@implementation PPSCollectionOperator

void __49__PPSCollectionOperator_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a4;
  id v8 = a5;
  v9 = PPSLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_cold_2((uint64_t)v7, (uint64_t)v8, v9);
  }

  v10 = [v7 componentsSeparatedByString:@"::"];
  if ([v10 count] == 2)
  {
    v11 = *(void **)(a1 + 32);
    v12 = [v10 objectAtIndexedSubscript:0];
    v13 = [v10 objectAtIndexedSubscript:1];
    [v11 monitorMetricsForSubsystem:v12 category:v13 payload:v8];

    v14 = *(void **)(a1 + 32);
    v15 = [v10 objectAtIndexedSubscript:0];
    v16 = [v10 objectAtIndexedSubscript:1];
    [v14 logForSubsystem:v15 category:v16 data:v8];
  }
  else
  {
    v15 = PPSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_cold_1((uint64_t)v7, v15);
    }
  }
}

- (void)monitorMetricsForSubsystem:(id)a3 category:(id)a4 payload:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PPSCollectionOperator *)self monitor])
  {
    v11 = [(PPSCollectionOperator *)self monitoredSubsystem];
    if ([v11 isEqualToString:v8])
    {
      v12 = [(PPSCollectionOperator *)self monitoredCategory];
      int v13 = [v12 isEqualToString:v9];

      if (v13)
      {
        v14 = PPSDataStreamLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          id v16 = v10;
          _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
    else
    {
    }
  }
}

- (BOOL)monitor
{
  return self->_monitor;
}

- (PPSCollectionOperator)init
{
  if (+[PLUtilities isPowerlogHelperd])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PPSCollectionOperator;
    self = [(PLOperator *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  v3 = [PLXPCListenerOperatorComposition alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__PPSCollectionOperator_initOperatorDependancies__block_invoke;
  v18[3] = &unk_1E6254E18;
  v18[4] = self;
  v4 = [(PLXPCListenerOperatorComposition *)v3 initWithOperator:self withRegistration:&unk_1F15871B0 withBlock:v18];
  metricListener = self->_metricListener;
  self->_metricListener = v4;

  if (+[PLPlatform internalBuild])
  {
    v6 = [[PLXPCResponderOperatorComposition alloc] initWithOperator:self withRegistration:&unk_1F15871D8 withBlock:&__block_literal_global_28];
    allowlistResponder = self->_allowlistResponder;
    self->_allowlistResponder = v6;

    id v8 = [PLCFNotificationOperatorComposition alloc];
    id v9 = [(PLOperator *)self workQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_38;
    v17[3] = &unk_1E6253970;
    v17[4] = self;
    id v10 = [(PLCFNotificationOperatorComposition *)v8 initWithWorkQueue:v9 forNotification:@"com.apple.powerlog.dataStreamStartMonitor" requireState:0 withBlock:v17];
    startMonitor = self->_startMonitor;
    self->_startMonitor = v10;

    v12 = [PLCFNotificationOperatorComposition alloc];
    int v13 = [(PLOperator *)self workQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_53;
    v16[3] = &unk_1E6253970;
    v16[4] = self;
    v14 = [(PLCFNotificationOperatorComposition *)v12 initWithWorkQueue:v13 forNotification:@"com.apple.powerlog.dataStreamStopMonitor" requireState:0 withBlock:v16];
    stopMonitor = self->_stopMonitor;
    self->_stopMonitor = v14;
  }
}

id __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_31()
{
  v0 = PPSLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEFAULT, "Received request to query allowlist", v3, 2u);
  }

  v1 = +[PPSCoreUtilities getAllowlist];
  return v1;
}

void __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_38(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setMonitor:1];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"PerfPowerServicesDataStream"];
  v3 = [v2 stringForKey:@"MonitorSubsystem"];
  [*(id *)(a1 + 32) setMonitoredSubsystem:v3];

  v4 = [v2 stringForKey:@"MonitorCategory"];
  [*(id *)(a1 + 32) setMonitoredCategory:v4];

  objc_super v5 = PPSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [*(id *)(a1 + 32) monitoredSubsystem];
    id v7 = [*(id *)(a1 + 32) monitoredCategory];
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1BBD2F000, v5, OS_LOG_TYPE_DEFAULT, "Starting monitoring for subsystem: %@ category: %@", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_53(uint64_t a1)
{
  v2 = PPSLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BBD2F000, v2, OS_LOG_TYPE_DEFAULT, "Stopping monitoring", v4, 2u);
  }

  [*(id *)(a1 + 32) setMonitor:0];
  [*(id *)(a1 + 32) setMonitoredSubsystem:0];
  return [*(id *)(a1 + 32) setMonitoredCategory:0];
}

- (BOOL)shouldApply136229065B
{
  return +[PLPlatform kPLDeviceClassIsOneOf:](PLPlatform, "kPLDeviceClassIsOneOf:", 200039, 200031, 200027, 200029, 200023, 200035, 200037, 200033, 200025, 200040, 200042, 200043, 200048, 200047, 0);
}

- (PLXPCListenerOperatorComposition)metricListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetricListener:(id)a3
{
}

- (PLXPCResponderOperatorComposition)allowlistResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAllowlistResponder:(id)a3
{
}

- (PLCFNotificationOperatorComposition)startMonitor
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStartMonitor:(id)a3
{
}

- (PLCFNotificationOperatorComposition)stopMonitor
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStopMonitor:(id)a3
{
}

- (void)setMonitor:(BOOL)a3
{
  self->_monitor = a3;
}

- (NSString)monitoredSubsystem
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMonitoredSubsystem:(id)a3
{
}

- (NSString)monitoredCategory
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMonitoredCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredCategory, 0);
  objc_storeStrong((id *)&self->_monitoredSubsystem, 0);
  objc_storeStrong((id *)&self->_stopMonitor, 0);
  objc_storeStrong((id *)&self->_startMonitor, 0);
  objc_storeStrong((id *)&self->_allowlistResponder, 0);
  objc_storeStrong((id *)&self->_metricListener, 0);
}

void __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Malformed client message received from %@", (uint8_t *)&v2, 0xCu);
}

void __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Metric Key: %@ Payload: %@", (uint8_t *)&v3, 0x16u);
}

@end