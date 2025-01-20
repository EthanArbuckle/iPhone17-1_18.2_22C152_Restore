@interface PLPowerMetricMonitorService
+ (BOOL)deviceUsesPMPCounters;
+ (void)load;
- (BOOL)_canCacheMetrics;
- (BOOL)_pidIsValid:(int)a3;
- (BOOL)isCollectingMetrics;
- (BOOL)isMonitoring;
- (BOOL)isMonitoringMetrics;
- (NSDate)currQueryTime;
- (NSDate)lastQueryTime;
- (NSMutableDictionary)entryKeyToEntryInfo;
- (NSMutableDictionary)trackedProcesses;
- (NSMutableSet)batteryGaugeConflictingProcessSpecificEntryKeys;
- (NSMutableSet)batteryGaugeConflictingSystemMetricEntryKeys;
- (NSMutableSet)entryKeysCollected;
- (NSMutableSet)entryKeysRequested;
- (NSMutableSet)entryKeysToCollect;
- (NSMutableSet)processSpecificMetricEntryKeys;
- (NSMutableSet)systemMetricEntryKeys;
- (NSSet)energyScoringEntities;
- (OS_dispatch_queue)monitorQueue;
- (OS_dispatch_source)metricCollectionRepeatingTimer;
- (OS_dispatch_source)metricCollectionTimeoutTimer;
- (PLIOReportStats)amcStats;
- (PLIOReportStats)dcpSwapStats;
- (PLIOReportStats)energyModelStats;
- (PLIOReportStats)pmpCountersStats;
- (PLPowerMetricMonitorService)init;
- (PPSMetricCollection)cachedMetrics;
- (PPSMetricCollection)metrics;
- (PPSMetricMonitorService)metricMonitorService;
- (double)_computeCPUCostWithCPUTicks:(id)a3;
- (double)_computeDisplayCostWithAvgRed:(int)a3 avgGreen:(int)a4 avgBlue:(int)a5;
- (double)_computeGPUCostWithGPUSec:(id)a3;
- (double)_computeLocationCostWithWifiCost:(int)a3 gpsCost:(int)a4 cellCost:(int)a5 skyhookCost:(int)a6;
- (double)_computeNetworkingCostWithWifiIn:(int)a3 wifiOut:(int)a4 cellIn:(int)a5 cellOut:(int)a6;
- (double)currentUpdateInterval;
- (double)updateInterval;
- (id)_convertToWattsFromMilliwatts:(id)a3;
- (id)_extractCurrentUsageMetrics;
- (id)addMonitoredProcessesWithPIDs:(id)a3 error:(id *)a4;
- (id)collectMetricsOnDemand;
- (id)collectMetricsOnSnapshotWithError:(id *)a3;
- (id)costElement;
- (id)metricCollectionCompletionHandler;
- (int)currQueryCount;
- (int)lastQueryCount;
- (int)pidForProcessName:(id)a3;
- (int64_t)currentUpdateMode;
- (int64_t)updateMode;
- (void)_agentDidUpdateWithEntryKey:(id)a3;
- (void)_batteryGaugeServiceDidBecomeActive;
- (void)_batteryGaugeServiceDidBecomeInactive;
- (void)_cancelMetricCollectionTimeoutTimer;
- (void)_cancelMetricCollectionTimer;
- (void)_cleanUp;
- (void)_collectMetricsWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)_computeEnergyScoreForProcess;
- (void)_emitPowerSignpostWithMetric:(id)a3 value:(id)a4;
- (void)_emitPowerSignpostWithMetric:(id)a3 value:(id)a4 pid:(id)a5;
- (void)_metricCollectionTimedOut;
- (void)_parseAMCSample:(id)a3;
- (void)_parseApplicationMetricsFromEntry:(id)a3;
- (void)_parseDCPSwapStats:(id)a3;
- (void)_parseDisplayAPLMetricsFromEntry:(id)a3 cacheMetrics:(BOOL)a4;
- (void)_parseDisplayBacklightPowerMetricsFromEntry:(id)a3;
- (void)_parseEnergyModelOrPMPMetricsFromSample:(id)a3 withSampleDuration:(double)a4 sourceChannel:(int64_t)a5;
- (void)_parseGasGaugeMetricsFromEntry:(id)a3;
- (void)_parseLocationMetricsFromEntry:(id)a3;
- (void)_parseProcessMonitorMetricsFromEntry:(id)a3;
- (void)_parseProcessNetworkMetricsFromEntry:(id)a3;
- (void)_parseSMCMetricsFromEntry:(id)a3;
- (void)_parseWifiPowerMetricsFromEntry:(id)a3 cacheMetrics:(BOOL)a4;
- (void)_postAgentNotificationWithProcess:(id)a3;
- (void)_registerNotificationWithAgent:(Class)a3 type:(id)a4 tableName:(id)a5 isProcessSpecific:(BOOL)a6 canRequestWhileBatteryGaugeIsRunning:(BOOL)a7 minRequestInterval:(double)a8 block:(id)a9;
- (void)_sampleCoalitions;
- (void)_sendMetrics;
- (void)_setLastActiveStartTimeAndLastSuspendTimeWithPid:(int)a3 appState:(int)a4 currentTime:(id)a5;
- (void)_setUpAgents;
- (void)_setUpIOReporting;
- (void)_startMetricCollectionTimeoutTimerWithTimeout:(double)a3 block:(id)a4;
- (void)_startMetricCollectionTimerWithInterval:(double)a3 block:(id)a4;
- (void)_updateIOReportStats;
- (void)_updateMetricsWithThermalState;
- (void)addMonitoredProcessWithPID:(int)a3 error:(id *)a4;
- (void)allClientsDidDisconnect;
- (void)changeUpdateInterval:(double)a3;
- (void)finishMonitoringAndSendMetrics;
- (void)initOperatorDependancies;
- (void)removeMonitoredProcessWithPID:(int)a3;
- (void)setAmcStats:(id)a3;
- (void)setBatteryGaugeConflictingProcessSpecificEntryKeys:(id)a3;
- (void)setBatteryGaugeConflictingSystemMetricEntryKeys:(id)a3;
- (void)setCachedMetrics:(id)a3;
- (void)setCostElement:(id)a3;
- (void)setCurrQueryCount:(int)a3;
- (void)setCurrQueryTime:(id)a3;
- (void)setDcpSwapStats:(id)a3;
- (void)setEnergyModelStats:(id)a3;
- (void)setEntryKeyToEntryInfo:(id)a3;
- (void)setEntryKeysCollected:(id)a3;
- (void)setEntryKeysRequested:(id)a3;
- (void)setEntryKeysToCollect:(id)a3;
- (void)setIsCollectingMetrics:(BOOL)a3;
- (void)setIsMonitoring:(BOOL)a3;
- (void)setLastQueryCount:(int)a3;
- (void)setLastQueryTime:(id)a3;
- (void)setMetricCollectionCompletionHandler:(id)a3;
- (void)setMetricCollectionRepeatingTimer:(id)a3;
- (void)setMetricCollectionTimeoutTimer:(id)a3;
- (void)setMetricCollectionTimerUpdateInterval:(double)a3;
- (void)setMetricMonitorService:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMonitorQueue:(id)a3;
- (void)setPmpCountersStats:(id)a3;
- (void)setProcessSpecificMetricEntryKeys:(id)a3;
- (void)setSystemMetricEntryKeys:(id)a3;
- (void)setTrackedProcesses:(id)a3;
- (void)setUpForMonitoring;
- (void)setUpdateInterval:(double)a3;
- (void)setUpdateMode:(int64_t)a3;
- (void)startMonitoringWithConfigurationMode:(int64_t)a3 updateInterval:(double)a4;
@end

@implementation PLPowerMetricMonitorService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPowerMetricMonitorService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (BOOL)deviceUsesPMPCounters
{
  return [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] - 1001011 < 5;
}

- (PLPowerMetricMonitorService)init
{
  v37.receiver = self;
  v37.super_class = (Class)PLPowerMetricMonitorService;
  objc_super v2 = [(PLOperator *)&v37 init];
  v3 = v2;
  if (v2)
  {
    v2->_isMonitoring = 0;
    v2->_isCollectingMetrics = 0;
    v2->_updateMode = 0;
    v2->_updateInterval = 0.0;
    uint64_t v4 = [MEMORY[0x1E4F89CE8] sharedInstance];
    metricMonitorService = v3->_metricMonitorService;
    v3->_metricMonitorService = (PPSMetricMonitorService *)v4;

    [(PPSMetricMonitorService *)v3->_metricMonitorService setDelegate:v3];
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    trackedProcesses = v3->_trackedProcesses;
    v3->_trackedProcesses = (NSMutableDictionary *)v6;

    v8 = (PPSMetricCollection *)objc_alloc_init(MEMORY[0x1E4F89CD0]);
    metrics = v3->_metrics;
    v3->_metrics = v8;

    v10 = (PPSMetricCollection *)objc_alloc_init(MEMORY[0x1E4F89CD0]);
    cachedMetrics = v3->_cachedMetrics;
    v3->_cachedMetrics = v10;

    v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    objc_storeStrong((id *)&v3->_currQueryTime, v12);
    lastQueryTime = v3->_lastQueryTime;
    v3->_lastQueryTime = v12;
    v14 = v12;

    v3->_currQueryCount = 0;
    v3->_lastQueryCount = 0;
    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    systemMetricEntryKeys = v3->_systemMetricEntryKeys;
    v3->_systemMetricEntryKeys = (NSMutableSet *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    processSpecificMetricEntryKeys = v3->_processSpecificMetricEntryKeys;
    v3->_processSpecificMetricEntryKeys = (NSMutableSet *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    batteryGaugeConflictingSystemMetricEntryKeys = v3->_batteryGaugeConflictingSystemMetricEntryKeys;
    v3->_batteryGaugeConflictingSystemMetricEntryKeys = (NSMutableSet *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
    batteryGaugeConflictingProcessSpecificEntryKeys = v3->_batteryGaugeConflictingProcessSpecificEntryKeys;
    v3->_batteryGaugeConflictingProcessSpecificEntryKeys = (NSMutableSet *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
    entryKeysToCollect = v3->_entryKeysToCollect;
    v3->_entryKeysToCollect = (NSMutableSet *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
    entryKeysRequested = v3->_entryKeysRequested;
    v3->_entryKeysRequested = (NSMutableSet *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA80] set];
    entryKeysCollected = v3->_entryKeysCollected;
    v3->_entryKeysCollected = (NSMutableSet *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
    entryKeyToEntryInfo = v3->_entryKeyToEntryInfo;
    v3->_entryKeyToEntryInfo = (NSMutableDictionary *)v29;

    v31 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.PerfPowerMetricMonitor.monitorQueue", v31);
    monitorQueue = v3->_monitorQueue;
    v3->_monitorQueue = (OS_dispatch_queue *)v32;

    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"DisplayCost", @"CPUCost", @"NetworkCost", @"LocationCost", @"CurrentApplicationState", @"GPUCost", @"CurrentThermalState", @"InducedThermalState", 0);
    energyScoringEntities = v3->_energyScoringEntities;
    v3->_energyScoringEntities = (NSSet *)v34;
  }
  return v3;
}

- (void)initOperatorDependancies
{
  v3 = [(PLPowerMetricMonitorService *)self metricMonitorService];
  [v3 startXPCListener];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = *MEMORY[0x1E4F92D50];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PLPowerMetricMonitorService_initOperatorDependancies__block_invoke;
  v11[3] = &unk_1E6E47E40;
  v11[4] = self;
  id v6 = (id)[v4 addObserverForName:v5 object:0 queue:0 usingBlock:v11];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4F92D58];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PLPowerMetricMonitorService_initOperatorDependancies__block_invoke_2;
  v10[3] = &unk_1E6E47E40;
  v10[4] = self;
  id v9 = (id)[v7 addObserverForName:v8 object:0 queue:0 usingBlock:v10];
}

void __55__PLPowerMetricMonitorService_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F92D60]];
  int v5 = [v4 intValue];

  if (v5 == 1)
  {
    id v6 = *(void **)(a1 + 32);
    [v6 _batteryGaugeServiceDidBecomeActive];
  }
}

void __55__PLPowerMetricMonitorService_initOperatorDependancies__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F92D60]];
  int v5 = [v4 intValue];

  if (v5 == 1)
  {
    id v6 = *(void **)(a1 + 32);
    [v6 _batteryGaugeServiceDidBecomeInactive];
  }
}

- (void)_cleanUp
{
  v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v3);

  [(PLPowerMetricMonitorService *)self setIsMonitoring:0];
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  [(PLPowerMetricMonitorService *)self setEntryKeysToCollect:v4];

  int v5 = [MEMORY[0x1E4F1CA80] set];
  [(PLPowerMetricMonitorService *)self setEntryKeysRequested:v5];

  id v6 = [MEMORY[0x1E4F1CA80] set];
  [(PLPowerMetricMonitorService *)self setEntryKeysCollected:v6];

  id v7 = [(PLPowerMetricMonitorService *)self trackedProcesses];
  [v7 removeAllObjects];
}

- (BOOL)isMonitoringMetrics
{
  objc_super v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PLPowerMetricMonitorService_isMonitoringMetrics__block_invoke;
  v5[3] = &unk_1E6E47E68;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__PLPowerMetricMonitorService_isMonitoringMetrics__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isMonitoring];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)currentUpdateMode
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PLPowerMetricMonitorService_currentUpdateMode__block_invoke;
  v6[3] = &unk_1E6E47E68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__PLPowerMetricMonitorService_currentUpdateMode__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) updateMode];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)currentUpdateInterval
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PLPowerMetricMonitorService_currentUpdateInterval__block_invoke;
  v6[3] = &unk_1E6E47E68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __52__PLPowerMetricMonitorService_currentUpdateInterval__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) updateInterval];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int)pidForProcessName:(id)a3
{
  return MEMORY[0x1F414B050](a3, a2);
}

- (void)setUpForMonitoring
{
}

void __49__PLPowerMetricMonitorService_setUpForMonitoring__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PLPowerMetricMonitorService_setUpForMonitoring__block_invoke_2;
  block[3] = &unk_1E6E47848;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __49__PLPowerMetricMonitorService_setUpForMonitoring__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUpAgents];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 _setUpIOReporting];
}

- (void)startMonitoringWithConfigurationMode:(int64_t)a3 updateInterval:(double)a4
{
  uint64_t v7 = [(PLPowerMetricMonitorService *)self monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke;
  block[3] = &unk_1E6E47E90;
  *(double *)&block[6] = a4;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(v7, block);
}

void __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke(uint64_t a1)
{
  objc_super v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_cold_2(a1, v2);
  }

  if ([*(id *)(a1 + 32) isMonitoring])
  {
    uint64_t v3 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setIsMonitoring:1];
    double v4 = PLLogPowerMetricMonitor();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E4220000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "startMonitoring", (const char *)&unk_1E442BC89, buf, 2u);
    }

    [*(id *)(a1 + 32) setUpdateMode:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setUpdateInterval:*(double *)(a1 + 48)];
    int v5 = [*(id *)(a1 + 32) entryKeysToCollect];
    uint64_t v6 = [*(id *)(a1 + 32) systemMetricEntryKeys];
    [v5 unionSet:v6];

    uint64_t v7 = [MEMORY[0x1E4F929F8] sharedManager];
    LODWORD(v6) = [v7 isServiceActive:1];

    if (v6) {
      [*(id *)(a1 + 32) _batteryGaugeServiceDidBecomeActive];
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if ((unint64_t)(v8 - 1) >= 3)
    {
      if (!v8)
      {
        uint64_t v9 = *(void **)(a1 + 32);
        double v10 = *(double *)(a1 + 48);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_228;
        v11[3] = &unk_1E6E47848;
        v11[4] = v9;
        [v9 _startMetricCollectionTimerWithInterval:v11 block:v10];
      }
    }
    else
    {
      [*(id *)(a1 + 32) _collectMetricsWithTimeout:0 completionHandler:5.0];
    }
  }
}

uint64_t __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_228(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_2;
  v3[3] = &unk_1E6E47848;
  v3[4] = v1;
  return [v1 _collectMetricsWithTimeout:v3 completionHandler:1.0];
}

uint64_t __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMetrics];
}

- (void)finishMonitoringAndSendMetrics
{
  uint64_t v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke;
  block[3] = &unk_1E6E47848;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke(uint64_t a1)
{
  objc_super v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  v11 = *(void **)(a1 + 32);
  double v10 = (id *)(a1 + 32);
  uint64_t result = [v11 isMonitoring];
  if (result)
  {
    uint64_t v13 = [*v10 updateMode];
    if ((unint64_t)(v13 - 2) >= 2)
    {
      if (v13 == 1)
      {
LABEL_10:
        id v15 = *v10;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_229;
        v16[3] = &unk_1E6E47848;
        v16[4] = v15;
        [v15 _collectMetricsWithTimeout:v16 completionHandler:5.0];
        return [*v10 setIsMonitoring:0];
      }
      if (v13) {
        return [*v10 setIsMonitoring:0];
      }
    }
    v14 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_cold_1(v10, v14);
    }

    goto LABEL_10;
  }
  return result;
}

uint64_t __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_229(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMetrics];
}

- (void)allClientsDidDisconnect
{
  uint64_t v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PLPowerMetricMonitorService_allClientsDidDisconnect__block_invoke;
  block[3] = &unk_1E6E47848;
  block[4] = self;
  dispatch_async(v3, block);
}

void __54__PLPowerMetricMonitorService_allClientsDidDisconnect__block_invoke(uint64_t a1)
{
  objc_super v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __54__PLPowerMetricMonitorService_allClientsDidDisconnect__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  [*(id *)(a1 + 32) _cancelMetricCollectionTimer];
  [*(id *)(a1 + 32) _cancelMetricCollectionTimeoutTimer];
  [*(id *)(a1 + 32) _cleanUp];
  double v10 = [MEMORY[0x1E4F929F8] sharedManager];
  [v10 signalServiceInactive:2];
}

- (id)collectMetricsOnDemand
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(PLPowerMetricMonitorService *)self monitorQueue];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke;
  v11 = &unk_1E6E47EB8;
  v12 = self;
  dispatch_semaphore_t v13 = v3;
  uint64_t v5 = v3;
  dispatch_sync(v4, &v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v6 = [(PLPowerMetricMonitorService *)self metrics];

  return v6;
}

void __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isMonitoring])
  {
    if ([*(id *)(a1 + 32) updateMode] == 2)
    {
      objc_super v2 = *(void **)(a1 + 32);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_230;
      v4[3] = &unk_1E6E47EB8;
      v4[4] = v2;
      id v5 = *(id *)(a1 + 40);
      [v2 _collectMetricsWithTimeout:v4 completionHandler:1.0];

      return;
    }
    dispatch_semaphore_t v3 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_cold_1();
    }
  }
  else
  {
    dispatch_semaphore_t v3 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_cold_2();
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_230(uint64_t a1)
{
  objc_super v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_230_cold_1();
  }

  dispatch_semaphore_t v3 = [*(id *)(a1 + 32) trackedProcesses];
  uint64_t v4 = [v3 count];

  if (v4) {
    [*(id *)(a1 + 32) _computeEnergyScoreForProcess];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)collectMetricsOnSnapshotWithError:(id *)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = [(PLPowerMetricMonitorService *)self monitorQueue];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke;
  v18 = &unk_1E6E47EE0;
  uint64_t v19 = self;
  uint64_t v7 = v5;
  v20 = v7;
  uint64_t v21 = a3;
  dispatch_sync(v6, &v15);

  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    uint64_t v9 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PLPowerMetricMonitorService collectMetricsOnSnapshotWithError:]();
    }

    double v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F89D00];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"Timed out while trying to collect metrics";
    v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1, v15, v16, v17, v18, v19);
    *a3 = [v10 errorWithDomain:v11 code:9 userInfo:v12];

    dispatch_semaphore_t v13 = 0;
  }
  else
  {
    dispatch_semaphore_t v13 = [(PLPowerMetricMonitorService *)self metrics];
  }

  return v13;
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  objc_super v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_3(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  if ([*(id *)(a1 + 32) isMonitoring])
  {
    if ([*(id *)(a1 + 32) updateMode] == 3)
    {
      double v10 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_236;
      v16[3] = &unk_1E6E47EB8;
      v16[4] = v10;
      id v17 = *(id *)(a1 + 40);
      [v10 _collectMetricsWithTimeout:v16 completionHandler:1.0];

      return;
    }
    v12 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_1();
    }

    dispatch_semaphore_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F89D00];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"PPSMetricMonitorMode is not PPSMetricMonitorModeUpdateOnSnapshot";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    **(void **)(a1 + 48) = [v13 errorWithDomain:v14 code:0 userInfo:v15];
  }
  else
  {
    uint64_t v11 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_2();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_236(uint64_t a1)
{
  objc_super v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_236_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 32) trackedProcesses];
  uint64_t v4 = [v3 count];

  if (v4) {
    [*(id *)(a1 + 32) _computeEnergyScoreForProcess];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)addMonitoredProcessWithPID:(int)a3 error:(id *)a4
{
  uint64_t v7 = [(PLPowerMetricMonitorService *)self monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke;
  block[3] = &unk_1E6E47F08;
  int v9 = a3;
  block[4] = self;
  void block[5] = a4;
  dispatch_sync(v7, block);
}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  objc_super v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_4();
  }

  if ([*(id *)(a1 + 32) _pidIsValid:*(unsigned int *)(a1 + 48)])
  {
    uint64_t v3 = [*(id *)(a1 + 32) trackedProcesses];
    if (!v3) {
      goto LABEL_15;
    }
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [*(id *)(a1 + 32) trackedProcesses];
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
LABEL_15:
      uint64_t v11 = [[PLProcessMetadata alloc] initWithPid:*(unsigned int *)(a1 + 48)];
      uint64_t v18 = [*(id *)(a1 + 32) trackedProcesses];
      uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
      [v18 setObject:v11 forKeyedSubscript:v19];

      v20 = PLLogPowerMetricMonitor();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_1();
      }

      uint64_t v21 = *(void **)(a1 + 32);
      uint64_t v22 = [v21 trackedProcesses];
      uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 48)];
      v24 = [v22 objectForKeyedSubscript:v23];
      [v21 _postAgentNotificationWithProcess:v24];

      uint64_t v25 = [*(id *)(a1 + 32) entryKeysToCollect];
      v26 = [*(id *)(a1 + 32) processSpecificMetricEntryKeys];
      [v25 unionSet:v26];

      goto LABEL_18;
    }
    uint64_t v8 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_2();
    }

    if (*(void *)(a1 + 40))
    {
      int v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F89D00];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28 = @"Already monitoring process";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v12 = v9;
      uint64_t v13 = v10;
      uint64_t v14 = 6;
LABEL_14:
      **(void **)(a1 + 40) = [v12 errorWithDomain:v13 code:v14 userInfo:v11];
LABEL_18:
    }
  }
  else
  {
    uint64_t v15 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_3((int *)(a1 + 48), v15);
    }

    if (*(void *)(a1 + 40))
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F89D00];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = @"Invalid PID";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      v12 = v16;
      uint64_t v13 = v17;
      uint64_t v14 = 4;
      goto LABEL_14;
    }
  }
}

- (id)addMonitoredProcessesWithPIDs:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v30 + 1) + 8 * i) intValue];
        id v29 = 0;
        [(PLPowerMetricMonitorService *)self addMonitoredProcessWithPID:v11 error:&v29];
        id v12 = v29;
        if (v12)
        {
          uint64_t v13 = PLLogPowerMetricMonitor();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            [(PLPowerMetricMonitorService *)v35 addMonitoredProcessesWithPIDs:&v36 error:v13];
          }

          *a4 = v12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v8);
  }
  id v28 = 0;
  uint64_t v14 = [(PLPowerMetricMonitorService *)self collectMetricsOnSnapshotWithError:&v28];
  id v15 = v28;
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = 0;
    *a4 = v15;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v14, "updateMetrics:forPid:", 0, *(void *)(*((void *)&v24 + 1) + 8 * j), (void)v24);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v20);
    }

    id v17 = v14;
  }

  return v17;
}

- (void)removeMonitoredProcessWithPID:(int)a3
{
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke;
  v6[3] = &unk_1E6E47F30;
  int v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke(uint64_t a1)
{
  objc_super v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke_cold_2();
  }

  uint64_t v3 = [*(id *)(a1 + 32) trackedProcesses];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) trackedProcesses];
    int v7 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 40)];
    [v6 setObject:0 forKeyedSubscript:v7];
  }
  else
  {
    id v6 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke_cold_1((int *)(a1 + 40), v6);
    }
  }

  uint64_t v8 = [*(id *)(a1 + 32) trackedProcesses];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) entryKeysToCollect];
    uint64_t v11 = [*(id *)(a1 + 32) processSpecificMetricEntryKeys];
    [v10 minusSet:v11];
  }
}

- (void)changeUpdateInterval:(double)a3
{
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PLPowerMetricMonitorService_changeUpdateInterval___block_invoke;
  v6[3] = &unk_1E6E47F58;
  *(double *)&void v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

uint64_t __52__PLPowerMetricMonitorService_changeUpdateInterval___block_invoke(uint64_t a1)
{
  objc_super v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__PLPowerMetricMonitorService_changeUpdateInterval___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  [*(id *)(a1 + 32) setUpdateInterval:*(double *)(a1 + 40)];
  return [*(id *)(a1 + 32) setMetricCollectionTimerUpdateInterval:*(double *)(a1 + 40)];
}

- (void)_batteryGaugeServiceDidBecomeActive
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "PLBatteryGaugeService became active; ending with error",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_batteryGaugeServiceDidBecomeInactive
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "PLBatteryGaugeService became inactive; mode is updateOnStop so we should have already ended with error",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_setUpAgents
{
  uint64_t v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v3);

  if (+[PLSMCAgent supportsBasicSMC])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *MEMORY[0x1E4F92D48];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke;
    v24[3] = &unk_1E6E47F80;
    v24[4] = self;
    uint8_t v6 = v24;
  }
  else
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *MEMORY[0x1E4F92D48];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_2;
    v23[3] = &unk_1E6E47F80;
    v23[4] = self;
    uint8_t v6 = v23;
  }
  [(PLPowerMetricMonitorService *)self _registerNotificationWithAgent:v4 type:v5 tableName:@"MetricMonitorInstantKeys" isProcessSpecific:0 canRequestWhileBatteryGaugeIsRunning:1 minRequestInterval:v6 block:0.0];
  uint64_t v7 = objc_opt_class();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_3;
  v22[3] = &unk_1E6E47F80;
  v22[4] = self;
  [(PLPowerMetricMonitorService *)self _registerNotificationWithAgent:v7 type:v5 tableName:@"MetricMonitorInstantKeys" isProcessSpecific:0 canRequestWhileBatteryGaugeIsRunning:1 minRequestInterval:v22 block:1.0];
  if (([MEMORY[0x1E4F92A38] hasCapability:0] & 1) != 0
    || [MEMORY[0x1E4F92A38] hasCapability:8])
  {
    double v8 = (double)[MEMORY[0x1E4F92A38] hasCapability:8];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = *MEMORY[0x1E4F92D28];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_4;
    v21[3] = &unk_1E6E47FA8;
    v21[4] = self;
    *(double *)&v21[5] = v8;
    [(PLPowerMetricMonitorService *)self _registerNotificationWithAgent:v9 type:v10 tableName:@"APLStats" isProcessSpecific:0 canRequestWhileBatteryGaugeIsRunning:0 minRequestInterval:v21 block:v8];
    uint64_t v11 = *MEMORY[0x1E4F92D30];
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v11 = *MEMORY[0x1E4F92D30];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_5;
    v20[3] = &unk_1E6E47F80;
    v20[4] = self;
    [(PLPowerMetricMonitorService *)self _registerNotificationWithAgent:v12 type:v11 tableName:@"DisplayBacklight" isProcessSpecific:0 canRequestWhileBatteryGaugeIsRunning:1 minRequestInterval:v20 block:0.0];
  }
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = *MEMORY[0x1E4F92D38];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_6;
  v19[3] = &unk_1E6E47F80;
  v19[4] = self;
  [(PLPowerMetricMonitorService *)self _registerNotificationWithAgent:v13 type:v14 tableName:@"UsageDiff" isProcessSpecific:1 canRequestWhileBatteryGaugeIsRunning:0 minRequestInterval:v19 block:0.0];
  uint64_t v15 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_7;
  v18[3] = &unk_1E6E47F80;
  v18[4] = self;
  [(PLPowerMetricMonitorService *)self _registerNotificationWithAgent:v15 type:v5 tableName:@"ClientStatus" isProcessSpecific:1 canRequestWhileBatteryGaugeIsRunning:0 minRequestInterval:v18 block:0.0];
  uint64_t v16 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_8;
  v17[3] = &unk_1E6E47F80;
  v17[4] = self;
  [(PLPowerMetricMonitorService *)self _registerNotificationWithAgent:v16 type:v11 tableName:@"Application" isProcessSpecific:1 canRequestWhileBatteryGaugeIsRunning:0 minRequestInterval:v17 block:0.0];
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _parseSMCMetricsFromEntry:a2];
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _parseGasGaugeMetricsFromEntry:a2];
}

void __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v2, "_parseWifiPowerMetricsFromEntry:cacheMetrics:", v3, objc_msgSend(v2, "_canCacheMetrics"));
}

void __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  if ([v3 _canCacheMetrics]) {
    BOOL v4 = *(double *)(a1 + 40) > 0.0;
  }
  else {
    BOOL v4 = 0;
  }
  [v3 _parseDisplayAPLMetricsFromEntry:v5 cacheMetrics:v4];
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _parseDisplayBacklightPowerMetricsFromEntry:a2];
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _parseProcessNetworkMetricsFromEntry:a2];
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _parseLocationMetricsFromEntry:a2];
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _parseApplicationMetricsFromEntry:a2];
}

- (void)_registerNotificationWithAgent:(Class)a3 type:(id)a4 tableName:(id)a5 isProcessSpecific:(BOOL)a6 canRequestWhileBatteryGaugeIsRunning:(BOOL)a7 minRequestInterval:(double)a8 block:(id)a9
{
  BOOL v11 = a6;
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  uint64_t v19 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v19);

  uint64_t v20 = [(objc_class *)a3 entryKeyForType:v18 andName:v17];

  uint64_t v21 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[PLPowerMetricMonitorService _registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:]();
  }

  id v22 = objc_alloc(MEMORY[0x1E4F929E8]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke;
  v32[3] = &unk_1E6E47FF8;
  v32[4] = self;
  id v23 = v16;
  id v34 = v23;
  id v24 = v20;
  id v33 = v24;
  long long v25 = (void *)[v22 initWithOperator:self forEntryKey:v24 withBlock:v32];
  long long v26 = [[PLEntryInfo alloc] initWithNotificationComposition:v25 minRequestInterval:a8];
  long long v27 = [(PLPowerMetricMonitorService *)self entryKeyToEntryInfo];
  [v27 setObject:v26 forKeyedSubscript:v24];

  if (v11)
  {
    id v28 = [(PLPowerMetricMonitorService *)self processSpecificMetricEntryKeys];
    [v28 addObject:v24];

    if (!a7)
    {
      id v29 = [(PLPowerMetricMonitorService *)self batteryGaugeConflictingProcessSpecificEntryKeys];
LABEL_8:
      long long v31 = v29;
      [v29 addObject:v24];
    }
  }
  else
  {
    long long v30 = [(PLPowerMetricMonitorService *)self systemMetricEntryKeys];
    [v30 addObject:v24];

    if (!a7)
    {
      id v29 = [(PLPowerMetricMonitorService *)self batteryGaugeConflictingSystemMetricEntryKeys];
      goto LABEL_8;
    }
  }
}

void __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [a1[4] monitorQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke_2;
  v6[3] = &unk_1E6E47FD0;
  v6[4] = a1[4];
  id v7 = v3;
  id v9 = a1[6];
  id v8 = a1[5];
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCollectingMetrics])
  {
    id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"entry"];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) _agentDidUpdateWithEntryKey:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

- (BOOL)_canCacheMetrics
{
  return (unint64_t)([(PLPowerMetricMonitorService *)self updateMode] - 4) < 0xFFFFFFFFFFFFFFFDLL;
}

- (void)_postAgentNotificationWithProcess:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F929F8] sharedManager];
  char v5 = [v4 isServiceActive:1];

  if (v5) {
    goto LABEL_10;
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  id v9 = [v3 bundleId];

  if (v9)
  {
    uint64_t v10 = [v3 bundleId];
    [v6 addObject:v10];

    BOOL v11 = [v3 bundleId];
    uint64_t v12 = v8;
LABEL_6:
    [v12 addObject:v11];

    goto LABEL_7;
  }
  uint64_t v13 = [v3 name];

  if (v13)
  {
    BOOL v11 = [v3 name];
    uint64_t v12 = v6;
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v3, "pid"));
  [v7 addObject:v14];

  uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v25 = @"entry";
  v26[0] = v6;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  [v15 postNotificationName:@"PLProcessNetworkAgent.addProcessesOfInterest" object:0 userInfo:v16];

  id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v23 = @"entry";
  id v24 = v7;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  [v17 postNotificationName:@"PLProcessMonitorAgent.addProcessesOfInterest" object:0 userInfo:v18];

  if (v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v21 = @"entry";
    id v22 = v8;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v19 postNotificationName:@"PLLocationAgent.addProcessesOfInterest" object:0 userInfo:v20];
  }
LABEL_10:
}

- (void)_setUpIOReporting
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Failed to subscribe to IOReport Energy Model", v2, v3, v4, v5, v6);
}

- (void)_collectMetricsWithTimeout:(double)a3 completionHandler:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLPowerMetricMonitorService _collectMetricsWithTimeout:completionHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(PLPowerMetricMonitorService *)self _cancelMetricCollectionTimeoutTimer];
  if ([(PLPowerMetricMonitorService *)self isCollectingMetrics])
  {
    id v16 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PLPowerMetricMonitorService _collectMetricsWithTimeout:completionHandler:]();
    }

    [(PLPowerMetricMonitorService *)self _metricCollectionTimedOut];
  }
  id v17 = [(PLPowerMetricMonitorService *)self currQueryTime];
  [(PLPowerMetricMonitorService *)self setLastQueryTime:v17];

  [(PLPowerMetricMonitorService *)self setLastQueryCount:[(PLPowerMetricMonitorService *)self currQueryCount]];
  id v18 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLPowerMetricMonitorService *)self setCurrQueryTime:v18];

  [(PLPowerMetricMonitorService *)self setCurrQueryCount:[(PLPowerMetricMonitorService *)self lastQueryCount] + 1];
  uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
  [(PLPowerMetricMonitorService *)self setEntryKeysRequested:v19];

  uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
  [(PLPowerMetricMonitorService *)self setEntryKeysCollected:v20];

  id v21 = objc_alloc_init(MEMORY[0x1E4F89CD0]);
  [(PLPowerMetricMonitorService *)self setMetrics:v21];

  if ([(PLPowerMetricMonitorService *)self _canCacheMetrics])
  {
    id v22 = [(PLPowerMetricMonitorService *)self cachedMetrics];
    id v23 = (void *)[v22 copy];
    [(PLPowerMetricMonitorService *)self setMetrics:v23];
  }
  id v24 = [(PLPowerMetricMonitorService *)self trackedProcesses];
  BOOL v25 = [v24 count] == 0;

  if (!v25)
  {
    long long v26 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v27 = [(PLPowerMetricMonitorService *)self trackedProcesses];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke;
    v79[3] = &unk_1E6E48020;
    v79[4] = self;
    id v80 = v26;
    id v28 = v26;
    [v27 enumerateKeysAndObjectsUsingBlock:v79];

    id v29 = [(PLPowerMetricMonitorService *)self metrics];
    [v29 setProcessMetrics:v28];
  }
  objc_initWeak(&location, self);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_2;
  v75[3] = &unk_1E6E48048;
  objc_copyWeak(&v77, &location);
  id v65 = v6;
  id v76 = v65;
  [(PLPowerMetricMonitorService *)self setMetricCollectionCompletionHandler:v75];
  [(PLPowerMetricMonitorService *)self setIsCollectingMetrics:1];
  long long v30 = [(PLPowerMetricMonitorService *)self entryKeysToCollect];
  BOOL v31 = [v30 count] == 0;

  if (!v31)
  {
    if ([(PLPowerMetricMonitorService *)self _canCacheMetrics])
    {
      long long v73 = 0uLL;
      long long v74 = 0uLL;
      long long v71 = 0uLL;
      long long v72 = 0uLL;
      long long v32 = [(PLPowerMetricMonitorService *)self entryKeysToCollect];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v71 objects:v82 count:16];
      if (!v33) {
        goto LABEL_34;
      }
      uint64_t v34 = *(void *)v72;
      while (1)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v72 != v34) {
            objc_enumerationMutation(v32);
          }
          uint64_t v36 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          objc_super v37 = [(PLPowerMetricMonitorService *)self entryKeyToEntryInfo];
          uint64_t v38 = [v37 objectForKeyedSubscript:v36];

          [v38 minRequestInterval];
          if (v39 == 0.0)
          {
            v40 = [v38 notificationComposition];
            [v40 requestEntry];

            v41 = [(PLPowerMetricMonitorService *)self entryKeysRequested];
            [v41 addObject:v36];
          }
          else
          {
            v42 = [v38 lastQueryDate];
            [v42 timeIntervalSinceNow];
            double v44 = v43;
            [v38 minRequestInterval];
            BOOL v46 = v45 < -v44;

            if (!v46) {
              goto LABEL_23;
            }
            v47 = [v38 notificationComposition];
            [v47 requestEntry];

            v48 = [(PLPowerMetricMonitorService *)self entryKeysRequested];
            [v48 addObject:v36];

            v41 = [MEMORY[0x1E4F1C9C8] now];
            v49 = [(PLPowerMetricMonitorService *)self entryKeyToEntryInfo];
            v50 = [v49 objectForKeyedSubscript:v36];
            [v50 setLastQueryDate:v41];
          }
LABEL_23:
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v71 objects:v82 count:16];
        if (!v33) {
          goto LABEL_34;
        }
      }
    }
    long long v69 = 0uLL;
    long long v70 = 0uLL;
    long long v67 = 0uLL;
    long long v68 = 0uLL;
    v51 = [(PLPowerMetricMonitorService *)self entryKeysToCollect];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v67 objects:v81 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v68 != v53) {
            objc_enumerationMutation(v51);
          }
          uint64_t v55 = *(void *)(*((void *)&v67 + 1) + 8 * j);
          v56 = [(PLPowerMetricMonitorService *)self entryKeyToEntryInfo];
          v57 = [v56 objectForKeyedSubscript:v55];
          v58 = [v57 notificationComposition];
          [v58 requestEntry];
        }
        uint64_t v52 = [v51 countByEnumeratingWithState:&v67 objects:v81 count:16];
      }
      while (v52);
    }

    long long v32 = [(PLPowerMetricMonitorService *)self entryKeysRequested];
    v59 = [(PLPowerMetricMonitorService *)self entryKeysToCollect];
    [v32 unionSet:v59];

LABEL_34:
  }
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_3;
  v66[3] = &unk_1E6E47F58;
  *(double *)&v66[5] = a3;
  v66[4] = self;
  [(PLPowerMetricMonitorService *)self _startMetricCollectionTimeoutTimerWithTimeout:v66 block:a3];
  [(PLPowerMetricMonitorService *)self _updateIOReportStats];
  [(PLPowerMetricMonitorService *)self _updateMetricsWithThermalState];
  [(PLPowerMetricMonitorService *)self _sampleCoalitions];
  v60 = (void *)MEMORY[0x1E4F28ED0];
  v61 = [(PLPowerMetricMonitorService *)self currQueryTime];
  v62 = [(PLPowerMetricMonitorService *)self lastQueryTime];
  [v61 timeIntervalSinceDate:v62];
  v63 = objc_msgSend(v60, "numberWithDouble:");
  v64 = [(PLPowerMetricMonitorService *)self metrics];
  [v64 setSampleTime:v63];

  objc_destroyWeak(&v77);
  objc_destroyWeak(&location);
}

void __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) metrics];
  uint64_t v7 = [v6 processMetrics];
  uint64_t v8 = [v7 objectForKeyedSubscript:v18];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F89CF8]);
    objc_msgSend(v9, "setPid:", objc_msgSend(v5, "pid"));
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "coalitionID"));
    [v9 setCoalitionID:v10];

    uint64_t v11 = [v5 name];
    [v9 setProcessName:v11];

    uint64_t v12 = [v5 bundleId];
    [v9 setBundleID:v12];

    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v18];
    uint64_t v13 = (void *)MEMORY[0x1E4F89CF0];
    uint64_t v14 = [v5 applicationState];
    uint64_t v15 = [v5 lastActiveStart];
    id v16 = [v13 sampleWithValue:v14 timestamp:v15];
    id v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
    [v17 setApplicationState:v16];
  }
}

void __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsCollectingMetrics:0];
  if ((a2 & 1) == 0) {
    [WeakRetained _cancelMetricCollectionTimeoutTimer];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

uint64_t __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_3_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return [*(id *)(a1 + 32) _metricCollectionTimedOut];
}

- (void)_metricCollectionTimedOut
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Failed to collect metrics from %@", v2, v3, v4, v5, v6);
}

- (void)_agentDidUpdateWithEntryKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  if ([(PLPowerMetricMonitorService *)self isCollectingMetrics])
  {
    uint8_t v6 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLPowerMetricMonitorService _agentDidUpdateWithEntryKey:]();
    }

    uint64_t v7 = [(PLPowerMetricMonitorService *)self entryKeysCollected];
    char v8 = [v7 containsObject:v4];

    if ((v8 & 1) == 0)
    {
      id v9 = [(PLPowerMetricMonitorService *)self entryKeysCollected];
      [v9 addObject:v4];

      uint64_t v10 = [(PLPowerMetricMonitorService *)self entryKeysCollected];
      uint64_t v11 = [v10 count];
      uint64_t v12 = [(PLPowerMetricMonitorService *)self entryKeysRequested];
      uint64_t v13 = [v12 count];

      if (v11 == v13)
      {
        uint64_t v14 = [(PLPowerMetricMonitorService *)self metricCollectionCompletionHandler];

        if (v14)
        {
          uint64_t v15 = [(PLPowerMetricMonitorService *)self metricCollectionCompletionHandler];
          v15[2](v15, 0);

          [(PLPowerMetricMonitorService *)self setMetricCollectionCompletionHandler:0];
        }
      }
    }
  }
}

- (void)_sendMetrics
{
  uint64_t v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PLPowerMetricMonitorService *)self trackedProcesses];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(PLPowerMetricMonitorService *)self _computeEnergyScoreForProcess];
  }
  id v7 = [(PLPowerMetricMonitorService *)self metricMonitorService];
  uint8_t v6 = [(PLPowerMetricMonitorService *)self metrics];
  [v7 updateWithMetricCollection:v6];
}

- (void)_emitPowerSignpostWithMetric:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  PLLogPowerSignpost();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  PLEmitPowerSignpost(v7, v6, v5, 0);
}

- (void)_emitPowerSignpostWithMetric:(id)a3 value:(id)a4 pid:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  PLLogPowerSignpost();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  PLEmitPowerSignpost(v10, v9, v8, v7);
}

- (void)_updateIOReportStats
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "failed to read AMC sample", v2, v3, v4, v5, v6);
}

- (void)_parseDisplayAPLMetricsFromEntry:(id)a3 cacheMetrics:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 objectForKeyedSubscript:@"AvgPower"];
  id v39 = [(PLPowerMetricMonitorService *)self _convertToWattsFromMilliwatts:v8];

  id v9 = (void *)MEMORY[0x1E4F89CF0];
  id v10 = [v6 entryDate];
  uint64_t v11 = [v9 sampleWithValue:v39 timestamp:v10];
  uint64_t v12 = [(PLPowerMetricMonitorService *)self metrics];
  [v12 setDisplayPower:v11];

  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Display_Power_W" value:v39];
  uint64_t v13 = [v6 objectForKeyedSubscript:@"AvgAPL"];
  uint64_t v14 = (void *)MEMORY[0x1E4F89CF0];
  uint64_t v15 = [v6 entryDate];
  id v16 = [v14 sampleWithValue:v13 timestamp:v15];
  id v17 = [(PLPowerMetricMonitorService *)self metrics];
  [v17 setDisplayAPL:v16];

  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Display_APL" value:v13];
  id v18 = [v6 objectForKeyedSubscript:@"AvgRed"];
  uint64_t v19 = [v18 intValue];
  uint64_t v20 = [v6 objectForKeyedSubscript:@"AvgGreen"];
  uint64_t v21 = [v20 intValue];
  id v22 = [v6 objectForKeyedSubscript:@"AvgBlue"];
  -[PLPowerMetricMonitorService _computeDisplayCostWithAvgRed:avgGreen:avgBlue:](self, "_computeDisplayCostWithAvgRed:avgGreen:avgBlue:", v19, v21, [v22 intValue]);
  uint64_t v24 = (int)v23;

  BOOL v25 = (void *)MEMORY[0x1E4F89CF0];
  long long v26 = [MEMORY[0x1E4F28ED0] numberWithInt:v24];
  long long v27 = [v6 entryDate];

  id v28 = [v25 sampleWithValue:v26 timestamp:v27];
  id v29 = [(PLPowerMetricMonitorService *)self metrics];
  [v29 setDisplayCost:v28];

  if (v4)
  {
    long long v30 = [(PLPowerMetricMonitorService *)self metrics];
    BOOL v31 = [v30 displayPower];
    long long v32 = [(PLPowerMetricMonitorService *)self cachedMetrics];
    [v32 setDisplayPower:v31];

    uint64_t v33 = [(PLPowerMetricMonitorService *)self metrics];
    uint64_t v34 = [v33 displayAPL];
    v35 = [(PLPowerMetricMonitorService *)self cachedMetrics];
    [v35 setDisplayAPL:v34];

    uint64_t v36 = [(PLPowerMetricMonitorService *)self metrics];
    objc_super v37 = [v36 displayCost];
    uint64_t v38 = [(PLPowerMetricMonitorService *)self cachedMetrics];
    [v38 setDisplayCost:v37];
  }
}

- (void)_parseDisplayBacklightPowerMetricsFromEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 objectForKeyedSubscript:@"DisplayPower"];
  id v11 = [(PLPowerMetricMonitorService *)self _convertToWattsFromMilliwatts:v6];

  id v7 = (void *)MEMORY[0x1E4F89CF0];
  id v8 = [v4 entryDate];

  id v9 = [v7 sampleWithValue:v11 timestamp:v8];
  id v10 = [(PLPowerMetricMonitorService *)self metrics];
  [v10 setDisplayPower:v9];

  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Display_Power_W" value:v11];
}

- (void)_parseEnergyModelOrPMPMetricsFromSample:(id)a3 withSampleDuration:(double)a4 sourceChannel:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v9);

  if (a4 > 0.0)
  {
    id v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    int v11 = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
    int v12 = v11;
    if (a5 == 1 || v11 > 1001015)
    {
      int v167 = v11;
      uint64_t v14 = objc_msgSend(v8, "objectForKeyedSubscript:", @"DRAM", a5);
      [v14 doubleValue];
      double v16 = v15 / a4 * 1.2;

      id v17 = (void *)MEMORY[0x1E4F89CF0];
      id v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:v16];
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      uint64_t v20 = [v17 sampleWithValue:v18 timestamp:v19];
      uint64_t v21 = [(PLPowerMetricMonitorService *)self metrics];
      [v21 setDramPower:v20];

      id v22 = [MEMORY[0x1E4F28ED0] numberWithDouble:v16];
      [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"DRAM_Power_W" value:v22];

      double v23 = [v8 objectForKeyedSubscript:@"ANE"];
      [v23 doubleValue];
      double v25 = v24 / a4 * 1.2;

      long long v26 = (void *)MEMORY[0x1E4F89CF0];
      long long v27 = [MEMORY[0x1E4F28ED0] numberWithDouble:v25];
      id v28 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      id v29 = [v26 sampleWithValue:v27 timestamp:v28];
      long long v30 = [(PLPowerMetricMonitorService *)self metrics];
      [v30 setAnePower:v29];

      v165 = [v8 objectForKeyedSubscript:@"SOC_REST"];
      [v165 doubleValue];
      double v32 = v31;
      v163 = [v8 objectForKeyedSubscript:@"ANE"];
      [v163 doubleValue];
      double v34 = v32 + v33;
      v35 = [v8 objectForKeyedSubscript:@"AVE"];
      [v35 doubleValue];
      double v37 = v34 + v36;
      uint64_t v38 = [v8 objectForKeyedSubscript:@"DCS"];
      [v38 doubleValue];
      double v40 = v37 + v39;
      v41 = [v8 objectForKeyedSubscript:@"DISP"];
      [v41 doubleValue];
      double v43 = v40 + v42;
      double v44 = [v8 objectForKeyedSubscript:@"ISP"];
      [v44 doubleValue];
      double v46 = v43 + v45;
      v47 = [v8 objectForKeyedSubscript:@"MSR"];
      [v47 doubleValue];
      double v49 = v46 + v48;
      v50 = [v8 objectForKeyedSubscript:@"VDEC"];
      [v50 doubleValue];
      double v52 = v49 + v51;
      [v8 objectForKeyedSubscript:@"SOC_AON"];
      uint64_t v53 = self;
      uint64_t v55 = v54 = v10;
      [v55 doubleValue];
      double v57 = v52 + v56;

      id v10 = v54;
      self = v53;

      double v58 = v57 / a4 * 1.2;
      v59 = (void *)MEMORY[0x1E4F89CF0];
      v60 = [MEMORY[0x1E4F28ED0] numberWithDouble:v58];
      v61 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      v62 = [v59 sampleWithValue:v60 timestamp:v61];
      v63 = [(PLPowerMetricMonitorService *)v53 metrics];
      [v63 setOtherSocPower:v62];

      v64 = [MEMORY[0x1E4F28ED0] numberWithDouble:v58];
      [(PLPowerMetricMonitorService *)v53 _emitPowerSignpostWithMetric:@"Other_SoC_Power_W" value:v64];

      id v65 = [v8 objectForKeyedSubscript:@"GPU SRAM"];
      [v65 doubleValue];
      double v67 = v66;

      long long v68 = (void *)MEMORY[0x1E4F89CF0];
      long long v69 = [MEMORY[0x1E4F28ED0] numberWithDouble:v67];
      long long v70 = [v68 sampleWithValue:v69 timestamp:v10];
      long long v71 = [(PLPowerMetricMonitorService *)v53 metrics];
      [v71 setGpuSRAMEnergy:v70];

      long long v72 = [v8 objectForKeyedSubscript:@"ANE"];
      [v72 doubleValue];
      double v74 = v73;

      v75 = (void *)MEMORY[0x1E4F89CF0];
      id v76 = [MEMORY[0x1E4F28ED0] numberWithDouble:v74];
      id v77 = [v75 sampleWithValue:v76 timestamp:v10];
      v78 = [(PLPowerMetricMonitorService *)v53 metrics];
      [v78 setAneEnergy:v77];

      v79 = [v8 objectForKeyedSubscript:@"DCS"];
      [v79 doubleValue];
      double v81 = v80;

      v82 = (void *)MEMORY[0x1E4F89CF0];
      uint64_t v83 = [MEMORY[0x1E4F28ED0] numberWithDouble:v81];
      v84 = [v82 sampleWithValue:v83 timestamp:v10];
      v85 = [(PLPowerMetricMonitorService *)v53 metrics];
      [v85 setDcsEnergy:v84];

      v86 = [v8 objectForKeyedSubscript:@"DRAM"];
      [v86 doubleValue];
      double v88 = v87;

      v89 = (void *)MEMORY[0x1E4F89CF0];
      v90 = [MEMORY[0x1E4F28ED0] numberWithDouble:v88];
      v91 = [v89 sampleWithValue:v90 timestamp:v10];
      v92 = [(PLPowerMetricMonitorService *)v53 metrics];
      [v92 setDramEnergy:v91];

      v93 = [v8 objectForKeyedSubscript:@"PCIe Port 0 Energy"];

      if (v93)
      {
        v94 = [v8 objectForKeyedSubscript:@"PCIe Port 0 Energy"];
        [v94 doubleValue];
        double v96 = v95 + 0.0;
      }
      else
      {
        double v96 = 0.0;
      }
      int v12 = v167;
      v97 = [v8 objectForKeyedSubscript:@"PCIe Port 1 Energy"];

      if (v97)
      {
        v98 = [v8 objectForKeyedSubscript:@"PCIe Port 1 Energy"];
        [v98 doubleValue];
        double v96 = v96 + v99;
      }
      v100 = [v8 objectForKeyedSubscript:@"PCIe Port 2 Energy"];

      if (v100)
      {
        v101 = [v8 objectForKeyedSubscript:@"PCIe Port 2 Energy"];
        [v101 doubleValue];
        double v96 = v96 + v102;
      }
      v103 = (void *)MEMORY[0x1E4F89CF0];
      v104 = [MEMORY[0x1E4F28ED0] numberWithDouble:v96];
      v105 = [v103 sampleWithValue:v104 timestamp:v10];
      v106 = [(PLPowerMetricMonitorService *)v53 metrics];
      [v106 setPcieEnergy:v105];

      if (v162) {
        goto LABEL_20;
      }
    }
    else if (a5)
    {
LABEL_20:

      goto LABEL_21;
    }
    v107 = (void *)MEMORY[0x1E4F28ED0];
    v108 = [v8 objectForKeyedSubscript:@"CPU Energy"];
    [v108 doubleValue];
    uint64_t v110 = [v107 numberWithDouble:v109 / a4 * 1.2];

    v111 = (void *)MEMORY[0x1E4F89CF0];
    v112 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v113 = [v111 sampleWithValue:v110 timestamp:v112];
    [(PLPowerMetricMonitorService *)self metrics];
    v114 = int v168 = v12;
    [v114 setCpuPower:v113];

    v164 = (void *)v110;
    [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"CPU_Power_W" value:v110];
    v115 = (void *)MEMORY[0x1E4F28ED0];
    v116 = [v8 objectForKeyedSubscript:@"GPU Energy"];
    [v116 doubleValue];
    v118 = [v115 numberWithDouble:v117 / a4 * 1.2];

    v119 = (void *)MEMORY[0x1E4F89CF0];
    v120 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v121 = [v119 sampleWithValue:v118 timestamp:v120];
    [(PLPowerMetricMonitorService *)self metrics];
    v122 = v166 = v10;
    [v122 setGpuPower:v121];

    id v10 = v166;
    [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"GPU_Power_W" value:v118];
    v123 = [v8 objectForKeyedSubscript:@"CPU Energy"];
    [v123 doubleValue];
    double v125 = v124;

    v126 = (void *)MEMORY[0x1E4F89CF0];
    v127 = [MEMORY[0x1E4F28ED0] numberWithDouble:v125];
    v128 = [v126 sampleWithValue:v127 timestamp:v166];
    v129 = [(PLPowerMetricMonitorService *)self metrics];
    [v129 setCpuEnergy:v128];

    v130 = [v8 objectForKeyedSubscript:@"GPU Energy"];
    [v130 doubleValue];
    double v132 = v131;

    v133 = (void *)MEMORY[0x1E4F89CF0];
    v134 = [MEMORY[0x1E4F28ED0] numberWithDouble:v132];
    v135 = [v133 sampleWithValue:v134 timestamp:v166];
    v136 = [(PLPowerMetricMonitorService *)self metrics];
    [v136 setGpuEnergy:v135];

    if (v168 < 1001011)
    {
      v137 = (void *)MEMORY[0x1E4F28ED0];
      v138 = [v8 objectForKeyedSubscript:@"DRAM Energy"];
      [v138 doubleValue];
      v140 = [v137 numberWithDouble:v139 / a4 * 1.2];

      v141 = (void *)MEMORY[0x1E4F89CF0];
      v142 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      v143 = [v141 sampleWithValue:v140 timestamp:v142];
      v144 = [(PLPowerMetricMonitorService *)self metrics];
      [v144 setDramPower:v143];

      [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"DRAM_Power_W" value:v140];
      v145 = [v8 objectForKeyedSubscript:@"Rest of SoC Energy"];
      [v145 doubleValue];
      double v147 = v146;
      v148 = [v8 objectForKeyedSubscript:@"ISP Energy"];
      [v148 doubleValue];
      double v150 = v147 + v149;
      v151 = [v8 objectForKeyedSubscript:@"VDEC Energy"];
      [v151 doubleValue];
      double v153 = v150 + v152;
      v154 = [v8 objectForKeyedSubscript:@"VENC Energy"];
      [v154 doubleValue];
      double v156 = v153 + v155;

      v157 = [MEMORY[0x1E4F28ED0] numberWithDouble:v156 / a4 * 1.2];
      v158 = (void *)MEMORY[0x1E4F89CF0];
      v159 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      v160 = [v158 sampleWithValue:v157 timestamp:v159];
      v161 = [(PLPowerMetricMonitorService *)self metrics];
      [v161 setOtherSocPower:v160];

      id v10 = v166;
      [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Other_SoC_Power_W" value:v157];
    }
    goto LABEL_20;
  }
  uint64_t v13 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[PLPowerMetricMonitorService _parseEnergyModelOrPMPMetricsFromSample:withSampleDuration:sourceChannel:]();
  }

LABEL_21:
}

- (void)_parseDCPSwapStats:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v25 = 0;
  long long v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  id v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v6 = +[PLDisplayAgent dcpSubFrameMap];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__PLPowerMetricMonitorService__parseDCPSwapStats___block_invoke;
  v17[3] = &unk_1E6E48070;
  id v7 = v4;
  id v18 = v7;
  uint64_t v19 = &v25;
  uint64_t v20 = &v21;
  [v6 enumerateKeysAndObjectsUsingBlock:v17];

  double v8 = v22[3];
  double v9 = 0.0;
  if (v8 != 0.0)
  {
    double v10 = v26[3];
    if (v10 != 0.0) {
      double v9 = 1.0 / (v8 / v10);
    }
  }
  int v11 = (void *)MEMORY[0x1E4F89CF0];
  int v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
  uint64_t v13 = [(PLPowerMetricMonitorService *)self dcpSwapStats];
  uint64_t v14 = [v13 sampleTime];
  double v15 = [v11 sampleWithValue:v12 timestamp:v14];
  double v16 = [(PLPowerMetricMonitorService *)self metrics];
  [v16 setDisplayFPS:v15];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

double __50__PLPowerMetricMonitorService__parseDCPSwapStats___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  [v7 doubleValue];
  double v9 = v8;

  *(double *)(*(void *)(a1[5] + 8) + 24) = v9 + *(double *)(*(void *)(a1[5] + 8) + 24);
  [v6 doubleValue];
  double v11 = v10;

  uint64_t v12 = *(void *)(a1[6] + 8);
  double result = *(double *)(v12 + 24) + v9 * (1.0 / v11);
  *(double *)(v12 + 24) = result;
  return result;
}

- (void)_parseAMCSample:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  id v33 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v6 = [v4 objectForKeyedSubscript:@"DCS"];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = (void *)MEMORY[0x1E4F89CF0];
  double v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:v8];
  double v11 = [v9 sampleWithValue:v10 timestamp:v33];
  uint64_t v12 = [(PLPowerMetricMonitorService *)self metrics];
  [v12 setDramBytes:v11];

  uint64_t v13 = [v4 objectForKeyedSubscript:@"ANE DCS RD"];
  [v13 doubleValue];
  double v15 = v14;

  double v16 = [v4 objectForKeyedSubscript:@"ANE DCS WR"];
  [v16 doubleValue];
  double v18 = v17;

  uint64_t v19 = (void *)MEMORY[0x1E4F89CF0];
  uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithDouble:v15 + v18];
  uint64_t v21 = [v19 sampleWithValue:v20 timestamp:v33];
  id v22 = [(PLPowerMetricMonitorService *)self metrics];
  [v22 setAneDCSBytes:v21];

  uint64_t v23 = [v4 objectForKeyedSubscript:@"ANE RD"];
  [v23 doubleValue];
  double v25 = v24;

  long long v26 = [v4 objectForKeyedSubscript:@"ANE WR"];

  [v26 doubleValue];
  double v28 = v27;

  id v29 = (void *)MEMORY[0x1E4F89CF0];
  long long v30 = [MEMORY[0x1E4F28ED0] numberWithDouble:v25 + v28];
  double v31 = [v29 sampleWithValue:v30 timestamp:v33];
  double v32 = [(PLPowerMetricMonitorService *)self metrics];
  [v32 setAneFabricBytes:v31];
}

- (void)_parseSMCMetricsFromEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 objectForKeyedSubscript:@"B0AP"];
  uint64_t v7 = [(PLPowerMetricMonitorService *)self _convertToWattsFromMilliwatts:v6];

  double v8 = (void *)MEMORY[0x1E4F89CF0];
  double v9 = [v4 entryDate];
  double v10 = [v8 sampleWithValue:v7 timestamp:v9];
  double v11 = [(PLPowerMetricMonitorService *)self metrics];
  [v11 setBatteryPower:v10];

  v59 = (void *)v7;
  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Battery_Power_W" value:v7];
  uint64_t v12 = [v4 objectForKeyedSubscript:@"zSPi"];
  uint64_t v13 = [(PLPowerMetricMonitorService *)self _convertToWattsFromMilliwatts:v12];

  double v14 = (void *)MEMORY[0x1E4F89CF0];
  double v15 = [v4 entryDate];
  double v16 = [v14 sampleWithValue:v13 timestamp:v15];
  double v17 = [(PLPowerMetricMonitorService *)self metrics];
  [v17 setDcInputPower:v16];

  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"DC_Input_Power_W" value:v13];
  double v18 = [v4 objectForKeyedSubscript:@"CHAS"];
  uint64_t v19 = (void *)MEMORY[0x1E4F89CF0];
  uint64_t v20 = [v4 entryDate];
  uint64_t v21 = [v19 sampleWithValue:v18 timestamp:v20];
  id v22 = [(PLPowerMetricMonitorService *)self metrics];
  [v22 setChargingRate:v21];

  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Charging_Rate_mA" value:v18];
  uint64_t v23 = [v4 objectForKeyedSubscript:@"xRPE"];
  double v24 = (void *)MEMORY[0x1E4F89CF0];
  double v25 = [v4 entryDate];
  long long v26 = [v24 sampleWithValue:v23 timestamp:v25];
  double v27 = [(PLPowerMetricMonitorService *)self metrics];
  [v27 setCellularPower:v26];

  double v58 = (void *)v23;
  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Cellular_Power_W" value:v23];
  double v28 = [v4 objectForKeyedSubscript:@"TVRM"];
  id v29 = v28;
  if (v28)
  {
    id v30 = v28;
  }
  else
  {
    double v31 = [v4 objectForKeyedSubscript:@"TVBM"];
    double v32 = v31;
    if (v31)
    {
      id v33 = v31;
    }
    else
    {
      id v33 = [v4 objectForKeyedSubscript:@"TVBH"];
    }
    id v30 = v33;
  }
  double v34 = (void *)MEMORY[0x1E4F89CF0];
  v35 = [v4 entryDate];
  double v36 = [v34 sampleWithValue:v30 timestamp:v35];
  double v37 = [(PLPowerMetricMonitorService *)self metrics];
  [v37 setSkinTemperature:v36];

  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Skin_Temp_C" value:v30];
  uint64_t v38 = [v4 objectForKeyedSubscript:@"TB0T"];
  double v39 = (void *)MEMORY[0x1E4F89CF0];
  double v40 = [v4 entryDate];
  v41 = [v39 sampleWithValue:v38 timestamp:v40];
  double v42 = [(PLPowerMetricMonitorService *)self metrics];
  [v42 setBatteryTemperature:v41];

  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Battery_Temp_C" value:v38];
  if (v18)
  {
    double v43 = [v4 objectForKeyedSubscript:@"zSLi"];
    [v18 doubleValue];
    double v57 = v13;
    if (v44 == 0.0)
    {
      double v45 = (void *)MEMORY[0x1E4F28ED0];
      double v46 = [v4 objectForKeyedSubscript:@"B0AP"];
      [v46 doubleValue];
      id v48 = [v45 numberWithDouble:-v47];
    }
    else
    {
      id v48 = v43;
    }
    v50 = [(PLPowerMetricMonitorService *)self _convertToWattsFromMilliwatts:v48];

    double v51 = (void *)MEMORY[0x1E4F89CF0];
    double v52 = [v4 entryDate];
    uint64_t v53 = [v51 sampleWithValue:v50 timestamp:v52];
    v54 = [(PLPowerMetricMonitorService *)self metrics];
    [v54 setSystemLoadPower:v53];

    [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"System_Load_Power_W" value:v50];
    uint64_t v55 = [MEMORY[0x1E4F28ED0] numberWithInt:v43 != 0];
    double v56 = [(PLPowerMetricMonitorService *)self metrics];
    [v56 setIsSystemPowerAvailableWhileCharging:v55 != 0];

    uint64_t v13 = v57;
  }
  else
  {
    double v49 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[PLPowerMetricMonitorService _parseSMCMetricsFromEntry:]();
    }
  }
}

- (void)_parseWifiPowerMetricsFromEntry:(id)a3 cacheMetrics:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v7);

  double v8 = [v6 objectForKeyedSubscript:@"WifiPower"];
  id v33 = [(PLPowerMetricMonitorService *)self _convertToWattsFromMilliwatts:v8];

  double v9 = (void *)MEMORY[0x1E4F89CF0];
  double v10 = [v6 entryDate];
  double v11 = [v9 sampleWithValue:v33 timestamp:v10];
  uint64_t v12 = [(PLPowerMetricMonitorService *)self metrics];
  [v12 setWifiPower:v11];

  uint64_t v13 = [v6 objectForKeyedSubscript:@"AWDLDown"];
  LODWORD(v10) = [v13 BOOLValue];

  double v14 = (void *)MEMORY[0x1E4F89CF0];
  double v15 = [MEMORY[0x1E4F28ED0] numberWithInt:v10 ^ 1];
  double v16 = [v6 entryDate];
  double v17 = [v14 sampleWithValue:v15 timestamp:v16];
  double v18 = [(PLPowerMetricMonitorService *)self metrics];
  [v18 setWifiAWDLStatus:v17];

  uint64_t v19 = (void *)MEMORY[0x1E4F89CF0];
  uint64_t v20 = [v6 objectForKeyedSubscript:@"AWDLRanging"];
  uint64_t v21 = [v6 entryDate];

  id v22 = [v19 sampleWithValue:v20 timestamp:v21];
  uint64_t v23 = [(PLPowerMetricMonitorService *)self metrics];
  [v23 setWifiAWDLRange:v22];

  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"WiFi_Power_W" value:v33];
  if (v4)
  {
    double v24 = [(PLPowerMetricMonitorService *)self metrics];
    double v25 = [v24 wifiPower];
    long long v26 = [(PLPowerMetricMonitorService *)self cachedMetrics];
    [v26 setWifiPower:v25];

    double v27 = [(PLPowerMetricMonitorService *)self metrics];
    double v28 = [v27 wifiAWDLStatus];
    id v29 = [(PLPowerMetricMonitorService *)self cachedMetrics];
    [v29 setWifiAWDLStatus:v28];

    id v30 = [(PLPowerMetricMonitorService *)self metrics];
    double v31 = [v30 wifiAWDLRange];
    double v32 = [(PLPowerMetricMonitorService *)self cachedMetrics];
    [v32 setWifiAWDLRange:v31];
  }
}

- (void)_parseGasGaugeMetricsFromEntry:(id)a3
{
  id v16 = a3;
  BOOL v4 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [v16 objectForKeyedSubscript:@"GasGaugePower"];
  [v5 doubleValue];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    double v8 = (void *)MEMORY[0x1E4F89CF0];
    double v9 = v7 / -1000.0;
    double v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
    double v11 = [v16 entryDate];
    uint64_t v12 = [v8 sampleWithValue:v10 timestamp:v11];
    uint64_t v13 = [(PLPowerMetricMonitorService *)self metrics];
    [v13 setSystemLoadPower:v12];

    double v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
    [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"System_Load_Power_W" value:v14];
  }
  double v15 = [(PLPowerMetricMonitorService *)self metrics];
  [v15 setIsSystemPowerAvailableWhileCharging:0];
}

- (void)_parseProcessMonitorMetricsFromEntry:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  double v6 = [(PLPowerMetricMonitorService *)self trackedProcesses];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v42 = v4;
    id v48 = v4;
    double v8 = [(PLPowerMetricMonitorService *)self currQueryTime];
    double v9 = [(PLPowerMetricMonitorService *)self lastQueryTime];
    [v8 timeIntervalSinceDate:v9];
    double v11 = v10;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v12 = [(PLPowerMetricMonitorService *)self trackedProcesses];
    uint64_t v13 = [v12 allKeys];

    obuint64_t j = v13;
    uint64_t v45 = [v13 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v50;
      double v14 = &unk_1F400C3D0;
      double v15 = &unk_1F400C3D0;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v50 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          double v18 = [v48 objectsForSubKey:v17 ofSubKeyType:@"PID"];
          if ([v18 count])
          {
            uint64_t v19 = [v18 objectAtIndexedSubscript:0];
            [v19 doubleValue];
            double v21 = v20;

            double v22 = v21;
            if (v11 > 0.0) {
              double v22 = fmin(v21 / v11 * 1000.0 * 0.5, 1000.0);
            }
            uint64_t v47 = [MEMORY[0x1E4F28ED0] numberWithDouble:v21];

            uint64_t v46 = [MEMORY[0x1E4F28ED0] numberWithDouble:v22];

            uint64_t v23 = (void *)MEMORY[0x1E4F89CF0];
            double v24 = [v48 entryDate];
            double v25 = [v23 sampleWithValue:v47 timestamp:v24];
            long long v26 = [(PLPowerMetricMonitorService *)self metrics];
            double v27 = [v26 processMetrics];
            double v28 = [v27 objectForKeyedSubscript:v17];
            [v28 setCpuSeconds:v25];

            id v29 = (void *)MEMORY[0x1E4F89CF0];
            id v30 = [v48 entryDate];
            double v31 = [v29 sampleWithValue:v46 timestamp:v30];
            double v32 = [(PLPowerMetricMonitorService *)self metrics];
            id v33 = [v32 processMetrics];
            double v34 = [v33 objectForKeyedSubscript:v17];
            [v34 setCpuCost:v31];

            double v15 = (void *)v47;
            [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"CPU_Seconds" value:v47 pid:v17];
            [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"CPU_Cost" value:v46 pid:v17];
            double v14 = (void *)v46;
          }
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v45);
    }
    else
    {
      double v14 = &unk_1F400C3D0;
      double v15 = &unk_1F400C3D0;
    }

    id v4 = v42;
  }
  else
  {
    id v48 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[PLPowerMetricMonitorService _parseProcessMonitorMetricsFromEntry:](v48, v35, v36, v37, v38, v39, v40, v41);
    }
  }
}

- (void)_parseProcessNetworkMetricsFromEntry:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  double v6 = [(PLPowerMetricMonitorService *)self trackedProcesses];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    double v8 = [v4 objectForKeyedSubscript:@"BundleName"];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    double v9 = [(PLPowerMetricMonitorService *)self trackedProcesses];
    double v10 = [v9 allKeys];

    obuint64_t j = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      unint64_t v14 = 0x1E6E46000uLL;
      uint64_t v15 = *(void *)v70;
      *(void *)&long long v12 = 136315394;
      long long v59 = v12;
      uint64_t v60 = *(void *)v70;
      v61 = v8;
      do
      {
        uint64_t v16 = 0;
        uint64_t v62 = v13;
        do
        {
          if (*(void *)v70 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v69 + 1) + 8 * v16);
          double v18 = objc_msgSend(*(id *)(v14 + 3800), "bundleIDFromPid:", objc_msgSend(v17, "intValue", v59));
          if ([v18 isEqualToString:v8])
          {
            id v65 = v18;
            uint64_t v19 = PLLogPowerMetricMonitor();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v59;
              double v74 = "-[PLPowerMetricMonitorService _parseProcessNetworkMetricsFromEntry:]";
              __int16 v75 = 2112;
              id v76 = v4;
              _os_log_debug_impl(&dword_1E4220000, v19, OS_LOG_TYPE_DEBUG, "%s: processNetworkEntry=%@", buf, 0x16u);
            }

            double v67 = [v4 objectForKeyedSubscript:@"WifiIn"];
            double v66 = [v4 objectForKeyedSubscript:@"WifiOut"];
            long long v68 = [v4 objectForKeyedSubscript:@"CellIn"];
            v64 = [v4 objectForKeyedSubscript:@"CellOut"];
            double v20 = (void *)MEMORY[0x1E4F89CF0];
            double v21 = [v4 entryDate];
            double v22 = [v20 sampleWithValue:v67 timestamp:v21];
            uint64_t v23 = [(PLPowerMetricMonitorService *)self metrics];
            double v24 = [v23 processMetrics];
            double v25 = [v24 objectForKeyedSubscript:v17];
            [v25 setWifiIn:v22];

            long long v26 = (void *)MEMORY[0x1E4F89CF0];
            double v27 = [v4 entryDate];
            double v28 = [v26 sampleWithValue:v66 timestamp:v27];
            id v29 = [(PLPowerMetricMonitorService *)self metrics];
            id v30 = [v29 processMetrics];
            double v31 = [v30 objectForKeyedSubscript:v17];
            [v31 setWifiOut:v28];

            double v32 = (void *)MEMORY[0x1E4F89CF0];
            id v33 = [v4 entryDate];
            double v34 = [v32 sampleWithValue:v68 timestamp:v33];
            uint64_t v35 = [(PLPowerMetricMonitorService *)self metrics];
            uint64_t v36 = [v35 processMetrics];
            uint64_t v37 = [v36 objectForKeyedSubscript:v17];
            [v37 setCellIn:v34];

            uint64_t v38 = (void *)MEMORY[0x1E4F89CF0];
            uint64_t v39 = [v4 entryDate];
            uint64_t v40 = [v38 sampleWithValue:v64 timestamp:v39];
            uint64_t v41 = [(PLPowerMetricMonitorService *)self metrics];
            id v42 = [v41 processMetrics];
            double v43 = [v42 objectForKeyedSubscript:v17];
            [v43 setCellOut:v40];

            [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"WiFi_In" value:v67 pid:v17];
            [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"WiFi_Out" value:v66 pid:v17];
            [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Cell_In" value:v68 pid:v17];
            [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Cell_Out" value:v64 pid:v17];
            -[PLPowerMetricMonitorService _computeNetworkingCostWithWifiIn:wifiOut:cellIn:cellOut:](self, "_computeNetworkingCostWithWifiIn:wifiOut:cellIn:cellOut:", [v67 intValue], objc_msgSend(v66, "intValue"), objc_msgSend(v68, "intValue"), objc_msgSend(v64, "intValue"));
            uint64_t v45 = (void *)MEMORY[0x1E4F89CF0];
            uint64_t v46 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v44];
            uint64_t v47 = [v4 entryDate];
            id v48 = [v45 sampleWithValue:v46 timestamp:v47];
            long long v49 = [(PLPowerMetricMonitorService *)self metrics];
            long long v50 = [v49 processMetrics];
            long long v51 = [v50 objectForKeyedSubscript:v17];
            [v51 setNetworkCost:v48];

            uint64_t v15 = v60;
            double v8 = v61;
            unint64_t v14 = 0x1E6E46000;
            uint64_t v13 = v62;
            double v18 = v65;
          }

          ++v16;
        }
        while (v13 != v16);
        uint64_t v13 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
      }
      while (v13);
    }
  }
  else
  {
    double v8 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PLPowerMetricMonitorService _parseProcessNetworkMetricsFromEntry:](v8, v52, v53, v54, v55, v56, v57, v58);
    }
  }
}

- (void)_parseLocationMetricsFromEntry:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v4 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v55 = self;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self trackedProcesses];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [v58 objectForKeyedSubscript:@"BundleId"];
    if (!v7
      || ([MEMORY[0x1E4F1CA98] null],
          double v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7 == v8))
    {
      double v9 = PLLogPowerMetricMonitor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PLPowerMetricMonitorService _parseLocationMetricsFromEntry:]();
      }
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    double v10 = [(PLPowerMetricMonitorService *)self trackedProcesses];
    uint64_t v11 = [v10 allKeys];

    obuint64_t j = v11;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = *(void *)v60;
      unint64_t v16 = 0x1E6E46000uLL;
      *(void *)&long long v13 = 136315394;
      long long v52 = v13;
      uint64_t v53 = *(void *)v60;
      uint64_t v54 = v7;
      do
      {
        uint64_t v17 = 0;
        uint64_t v56 = v14;
        do
        {
          if (*(void *)v60 != v15) {
            objc_enumerationMutation(obj);
          }
          double v18 = *(void **)(*((void *)&v59 + 1) + 8 * v17);
          uint64_t v19 = objc_msgSend(*(id *)(v16 + 3800), "bundleIDFromPid:", objc_msgSend(v18, "intValue", v52));
          if ([v19 isEqualToString:v7])
          {
            double v20 = [v58 objectForKeyedSubscript:@"timestampEnd"];
            if (v20)
            {

              goto LABEL_15;
            }
            id v29 = [v58 objectForKeyedSubscript:@"LocationDesiredAccuracy"];

            if (v29)
            {
              id v30 = PLLogPowerMetricMonitor();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v52;
                v64 = "-[PLPowerMetricMonitorService _parseLocationMetricsFromEntry:]";
                __int16 v65 = 2112;
                double v66 = v7;
                _os_log_debug_impl(&dword_1E4220000, v30, OS_LOG_TYPE_DEBUG, "%s: location start signal; bundleId=%@",
                  buf,
                  0x16u);
              }

              double v31 = (void *)MEMORY[0x1E4F89CF0];
              double v32 = [v58 entryDate];
              id v33 = [v31 sampleWithValue:MEMORY[0x1E4F1CC38] timestamp:v32];
              double v34 = [(PLPowerMetricMonitorService *)v55 metrics];
              uint64_t v35 = [v34 processMetrics];
              uint64_t v36 = [v35 objectForKeyedSubscript:v18];
              [v36 setOngoingLocation:v33];

              [(PLPowerMetricMonitorService *)v55 _emitPowerSignpostWithMetric:@"Ongoing_Location" value:MEMORY[0x1E4F1CC38] pid:v18];
              uint64_t v37 = (void *)MEMORY[0x1E4F28ED0];
              [(PLPowerMetricMonitorService *)v55 _computeLocationCostWithWifiCost:0 gpsCost:1 cellCost:0 skyhookCost:0];
              uint64_t v38 = objc_msgSend(v37, "numberWithDouble:");
              uint64_t v39 = (void *)MEMORY[0x1E4F89CF0];
              uint64_t v40 = [v58 entryDate];
              uint64_t v41 = [v39 sampleWithValue:v38 timestamp:v40];
              id v42 = [(PLPowerMetricMonitorService *)v55 metrics];
              double v43 = [v42 processMetrics];
              double v44 = [v43 objectForKeyedSubscript:v18];
              [v44 setLocationCost:v41];

              uint64_t v7 = v54;
              [(PLPowerMetricMonitorService *)v55 _emitPowerSignpostWithMetric:@"Location_Cost" value:v38 pid:v18];
            }
            else
            {
LABEL_15:
              double v21 = PLLogPowerMetricMonitor();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v52;
                v64 = "-[PLPowerMetricMonitorService _parseLocationMetricsFromEntry:]";
                __int16 v65 = 2112;
                double v66 = v7;
                _os_log_debug_impl(&dword_1E4220000, v21, OS_LOG_TYPE_DEBUG, "%s: location terminate signal; bundleId=%@",
                  buf,
                  0x16u);
              }

              double v22 = (void *)MEMORY[0x1E4F89CF0];
              uint64_t v23 = [v58 entryDate];
              uint64_t v24 = MEMORY[0x1E4F1CC28];
              double v25 = [v22 sampleWithValue:MEMORY[0x1E4F1CC28] timestamp:v23];
              long long v26 = [(PLPowerMetricMonitorService *)v55 metrics];
              double v27 = [v26 processMetrics];
              double v28 = [v27 objectForKeyedSubscript:v18];
              [v28 setOngoingLocation:v25];

              uint64_t v7 = v54;
              [(PLPowerMetricMonitorService *)v55 _emitPowerSignpostWithMetric:@"Ongoing_Location" value:v24 pid:v18];
            }
            uint64_t v14 = v56;
            uint64_t v15 = v53;
            unint64_t v16 = 0x1E6E46000;
          }

          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v14);
    }
  }
  else
  {
    uint64_t v7 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLPowerMetricMonitorService _parseLocationMetricsFromEntry:](v7, v45, v46, v47, v48, v49, v50, v51);
    }
  }
}

- (void)_parseApplicationMetricsFromEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(PLPowerMetricMonitorService *)self trackedProcesses];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    double v8 = [v4 objectForKeyedSubscript:@"pid"];
    double v9 = [(PLPowerMetricMonitorService *)self trackedProcesses];
    double v10 = [v9 objectForKeyedSubscript:v8];

    if (v10)
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"State"];
      uint64_t v12 = (void *)MEMORY[0x1E4F89CF0];
      long long v13 = [v4 entryDate];
      uint64_t v14 = [v12 sampleWithValue:v11 timestamp:v13];
      uint64_t v15 = [(PLPowerMetricMonitorService *)self metrics];
      unint64_t v16 = [v15 processMetrics];
      uint64_t v17 = [v16 objectForKeyedSubscript:v8];
      [v17 setApplicationState:v14];

      double v18 = [(PLPowerMetricMonitorService *)self trackedProcesses];
      uint64_t v19 = [v18 objectForKeyedSubscript:v8];
      [v19 setApplicationState:v11];

      [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Application_State" value:v11 pid:v8];
      uint64_t v20 = [v8 intValue];
      uint64_t v21 = [v11 intValue];
      double v22 = [(PLPowerMetricMonitorService *)self currQueryTime];
      [(PLPowerMetricMonitorService *)self _setLastActiveStartTimeAndLastSuspendTimeWithPid:v20 appState:v21 currentTime:v22];
    }
    else
    {
      uint64_t v23 = PLLogPowerMetricMonitor();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLPowerMetricMonitorService _parseApplicationMetricsFromEntry:]();
      }
    }
  }
  else
  {
    double v8 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_1E4220000, v8, OS_LOG_TYPE_INFO, "Not currently tracking a PID", v24, 2u);
    }
  }
}

- (void)_updateMetricsWithThermalState
{
  uint64_t v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v3);

  if (_updateMetricsWithThermalState_onceToken != -1) {
    dispatch_once(&_updateMetricsWithThermalState_onceToken, &__block_literal_global_528);
  }
  uint64_t state64 = 0;
  notify_get_state(_updateMetricsWithThermalState_thermalStateToken, &state64);
  uint64_t v4 = state64;
  uint64_t v5 = [(PLPowerMetricMonitorService *)self metrics];
  [v5 setThermalPressure:v4];

  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:state64];
  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Thermal_State" value:v6];

  uint64_t v7 = [(id)_updateMetricsWithThermalState_cltmDefaults stringForKey:@"thermalSimulationMode"];
  double v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"nominal"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"light"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"moderate"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"heavy"])
    {
      uint64_t v9 = 30;
    }
    else
    {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }
  double v10 = [(PLPowerMetricMonitorService *)self metrics];
  [v10 setInducedThermalPressure:v9];

  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
  [(PLPowerMetricMonitorService *)self _emitPowerSignpostWithMetric:@"Induced_Thermal_State" value:v11];
}

uint64_t __61__PLPowerMetricMonitorService__updateMetricsWithThermalState__block_invoke()
{
  notify_register_check((const char *)*MEMORY[0x1E4F14918], &_updateMetricsWithThermalState_thermalStateToken);
  _updateMetricsWithThermalState_cltmDefaults = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.cltm"];
  return MEMORY[0x1F41817F8]();
}

- (id)_convertToWattsFromMilliwatts:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
  [a3 doubleValue];
  double v5 = v4 / 1000.0;
  return (id)[v3 numberWithDouble:v5];
}

- (double)_computeDisplayCostWithAvgRed:(int)a3 avgGreen:(int)a4 avgBlue:(int)a5
{
  double v5 = ((double)a4 / 255.0 * 0.25 + (double)a3 / 255.0 * 0.31 + (double)a5 * 0.44 / 255.0) * 600.0;
  uint64_t v6 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PLPowerMetricMonitorService _computeDisplayCostWithAvgRed:avgGreen:avgBlue:]();
  }

  return v5;
}

- (double)_computeNetworkingCostWithWifiIn:(int)a3 wifiOut:(int)a4 cellIn:(int)a5 cellOut:(int)a6
{
  double v6 = (double)(a4 + a3 + a5 + a6);
  uint64_t v7 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLPowerMetricMonitorService _computeNetworkingCostWithWifiIn:wifiOut:cellIn:cellOut:]();
  }

  return v6;
}

- (double)_computeLocationCostWithWifiCost:(int)a3 gpsCost:(int)a4 cellCost:(int)a5 skyhookCost:(int)a6
{
  if (a3 <= 0) {
    int v6 = 0;
  }
  else {
    int v6 = 50;
  }
  if (a4 <= 0) {
    int v7 = 0;
  }
  else {
    int v7 = 200;
  }
  int v8 = v7 | v6;
  if (a5 <= 0) {
    int v9 = 0;
  }
  else {
    int v9 = 100;
  }
  if (a6 <= 0) {
    int v10 = 0;
  }
  else {
    int v10 = 50;
  }
  double v11 = (double)(v8 + v9 + v10);
  if (v11 < 50.0) {
    double v11 = 50.0;
  }
  double v12 = fmin(v11, 200.0);
  long long v13 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PLPowerMetricMonitorService _computeLocationCostWithWifiCost:gpsCost:cellCost:skyhookCost:]();
  }

  return v12;
}

- (double)_computeGPUCostWithGPUSec:(id)a3
{
  id v4 = a3;
  double v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  [v4 doubleValue];
  double v7 = v6;

  int v8 = [(PLPowerMetricMonitorService *)self currQueryTime];
  int v9 = [(PLPowerMetricMonitorService *)self lastQueryTime];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;

  if (v11 * 1000000000.0 > 0.0) {
    double v7 = fmin(v7 / (v11 * 1000000000.0) * 1000.0 * 0.5, 1000.0);
  }
  double v12 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PLPowerMetricMonitorService _computeGPUCostWithGPUSec:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  return v7;
}

- (double)_computeCPUCostWithCPUTicks:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  [v4 doubleValue];
  double v7 = v6;

  +[PLUtilities secondsFromMachTime:(unint64_t)v7];
  double v9 = v8;
  double v10 = [(PLPowerMetricMonitorService *)self currQueryTime];
  double v11 = [(PLPowerMetricMonitorService *)self lastQueryTime];
  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  if (v13 > 0.0) {
    double v9 = fmin(v9 / v13 * 1000.0 * 0.5, 1000.0);
  }
  uint64_t v14 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[PLPowerMetricMonitorService _computeCPUCostWithCPUTicks:]";
    __int16 v18 = 2048;
    double v19 = v9;
    _os_log_impl(&dword_1E4220000, v14, OS_LOG_TYPE_INFO, "%s: CPU Cost=%f", (uint8_t *)&v16, 0x16u);
  }

  return v9;
}

- (void)_computeEnergyScoreForProcess
{
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, a1, a3, "%s: PLServiceTypeBatteryGaugeService active, returning", a5, a6, a7, a8, 2u);
}

- (id)_extractCurrentUsageMetrics
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v3);

  v79 = objc_opt_new();
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v4 = [(PLPowerMetricMonitorService *)self trackedProcesses];
  double v5 = [v4 allKeys];

  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v83 objects:v103 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v84;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v84 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v83 + 1) + 8 * i);
        int v16 = [(PLPowerMetricMonitorService *)self metrics];
        uint64_t v17 = [v16 processMetrics];
        __int16 v18 = [v17 objectForKeyedSubscript:v15];
        double v19 = [v18 cpuCost];
        uint64_t v20 = [v19 value];
        [v20 doubleValue];
        double v13 = v13 + v21;

        double v22 = [(PLPowerMetricMonitorService *)self metrics];
        uint64_t v23 = [v22 processMetrics];
        uint64_t v24 = [v23 objectForKeyedSubscript:v15];
        double v25 = [v24 gpuCost];
        long long v26 = [v25 value];
        [v26 doubleValue];
        double v12 = v12 + v27;

        double v28 = [(PLPowerMetricMonitorService *)self metrics];
        id v29 = [v28 processMetrics];
        id v30 = [v29 objectForKeyedSubscript:v15];
        double v31 = [v30 networkCost];
        double v32 = [v31 value];
        [v32 doubleValue];
        double v11 = v11 + v33;

        double v34 = [(PLPowerMetricMonitorService *)self metrics];
        uint64_t v35 = [v34 processMetrics];
        uint64_t v36 = [v35 objectForKeyedSubscript:v15];
        uint64_t v37 = [v36 locationCost];
        uint64_t v38 = [v37 value];
        [v38 doubleValue];
        double v10 = v10 + v39;

        uint64_t v40 = [(PLPowerMetricMonitorService *)self metrics];
        uint64_t v41 = [v40 processMetrics];
        id v42 = [v41 objectForKeyedSubscript:v15];
        double v43 = [v42 applicationState];
        double v44 = [v43 value];
        [v44 doubleValue];
        double v9 = v9 + v45;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v83 objects:v103 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
  }

  id obja = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
  uint64_t v78 = [MEMORY[0x1E4F28ED0] numberWithDouble:v12];
  double v80 = [MEMORY[0x1E4F28ED0] numberWithDouble:v11];
  id v77 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
  id v76 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
  uint64_t v46 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v47 = [(PLPowerMetricMonitorService *)self metrics];
  __int16 v75 = objc_msgSend(v46, "numberWithInteger:", objc_msgSend(v47, "thermalPressure"));

  uint64_t v48 = [(PLPowerMetricMonitorService *)self metrics];
  uint64_t v49 = [v48 inducedThermalPressure];

  if (v49 == -1)
  {
    double v74 = 0;
  }
  else
  {
    uint64_t v50 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v51 = [(PLPowerMetricMonitorService *)self metrics];
    double v74 = objc_msgSend(v50, "numberWithInteger:", objc_msgSend(v51, "inducedThermalPressure"));
  }
  if ([MEMORY[0x1E4F92A38] hasCapability:0])
  {
    long long v52 = [(PLPowerMetricMonitorService *)self metrics];
    uint64_t v53 = [v52 displayCost];
    uint64_t v54 = [v53 value];

    double v73 = (void *)v54;
    if (v54) {
      uint64_t v55 = (void *)v54;
    }
    else {
      uint64_t v55 = &unk_1F400C3D0;
    }
    v101[0] = @"cost";
    v101[1] = @"overhead";
    v102[0] = v55;
    v102[1] = &unk_1F400C3D0;
    uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
    uint64_t v57 = v79;
    [v79 setObject:v56 forKeyedSubscript:@"DisplayCost"];
  }
  else
  {
    double v73 = 0;
    uint64_t v57 = v79;
  }
  id v58 = obja;
  if (!obja) {
    id v58 = &unk_1F400C3D0;
  }
  v99[0] = @"cost";
  v99[1] = @"overhead";
  v100[0] = v58;
  v100[1] = &unk_1F400C3D0;
  long long v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2];
  [v57 setObject:v59 forKeyedSubscript:@"CPUCost"];

  long long v60 = v80;
  if (!v80) {
    long long v60 = &unk_1F400C3D0;
  }
  v97[0] = @"cost";
  v97[1] = @"overhead";
  v98[0] = v60;
  v98[1] = &unk_1F400C3D0;
  long long v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];
  [v57 setObject:v61 forKeyedSubscript:@"NetworkCost"];

  if (v77) {
    long long v62 = v77;
  }
  else {
    long long v62 = &unk_1F400C3D0;
  }
  v95[0] = @"cost";
  v95[1] = @"overhead";
  v96[0] = v62;
  v96[1] = &unk_1F400C3D0;
  v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
  [v57 setObject:v63 forKeyedSubscript:@"LocationCost"];

  if (v76) {
    v64 = v76;
  }
  else {
    v64 = &unk_1F400C3D0;
  }
  v93[0] = @"cost";
  v93[1] = @"overhead";
  v94[0] = v64;
  v94[1] = &unk_1F400C3D0;
  __int16 v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
  [v57 setObject:v65 forKeyedSubscript:@"CurrentApplicationState"];

  if (v78) {
    double v66 = v78;
  }
  else {
    double v66 = &unk_1F400C3D0;
  }
  v91[0] = @"cost";
  v91[1] = @"overhead";
  v92[0] = v66;
  v92[1] = &unk_1F400C3D0;
  double v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
  [v57 setObject:v67 forKeyedSubscript:@"GPUCost"];

  if (v75) {
    uint64_t v68 = v75;
  }
  else {
    uint64_t v68 = &unk_1F400C3D0;
  }
  v89[0] = @"cost";
  v89[1] = @"overhead";
  v90[0] = v68;
  v90[1] = &unk_1F400C3D0;
  long long v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:2];
  [v57 setObject:v69 forKeyedSubscript:@"CurrentThermalState"];

  if (v74) {
    long long v70 = v74;
  }
  else {
    long long v70 = &unk_1F400C3E8;
  }
  v87[0] = @"cost";
  v87[1] = @"overhead";
  v88[0] = v70;
  v88[1] = &unk_1F400C3E8;
  long long v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:2];
  [v57 setObject:v71 forKeyedSubscript:@"InducedThermalState"];

  return v57;
}

- (BOOL)_pidIsValid:(int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 < 1) {
    return 0;
  }
  int v4 = proc_listpids(1u, 0, 0, 0);
  memset(__b, 255, sizeof(__b));
  proc_listpids(1u, 0, __b, 4096);
  BOOL result = 0;
  if (v4 >= 4)
  {
    unint64_t v6 = 0;
    do
    {
      int v7 = __b[v6];
      BOOL result = v7 == a3;
      if (v7 == a3) {
        break;
      }
      if (v6 > 0x3FE) {
        break;
      }
      ++v6;
    }
    while ((unint64_t)v4 >> 2 > v6);
  }
  return result;
}

- (void)_setLastActiveStartTimeAndLastSuspendTimeWithPid:(int)a3 appState:(int)a4 currentTime:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v26 = a5;
  uint64_t v8 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(PLPowerMetricMonitorService *)self trackedProcesses];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    double v11 = [(PLPowerMetricMonitorService *)self trackedProcesses];
    double v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    double v13 = [v11 objectForKeyedSubscript:v12];
    uint64_t v14 = [v13 lastActiveStart];

    uint64_t v15 = [(PLPowerMetricMonitorService *)self trackedProcesses];
    int v16 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
    uint64_t v17 = [v15 objectForKeyedSubscript:v16];
    __int16 v18 = [v17 lastSuspendStart];

    if (a4 == 8 || a4 == 4)
    {
      double v19 = [MEMORY[0x1E4F1C9C8] distantPast];

      if (v14 != v19)
      {
        uint64_t v20 = [MEMORY[0x1E4F1C9C8] distantFuture];

        if (v18 == v20 || v18 <= v14) {
          goto LABEL_13;
        }
      }
      double v21 = [(PLPowerMetricMonitorService *)self trackedProcesses];
      double v22 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
      uint64_t v23 = [v21 objectForKeyedSubscript:v22];
      [v23 setLastActiveStart:v26];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1C9C8] distantFuture];

      if (v18 != v24)
      {
        double v25 = [MEMORY[0x1E4F1C9C8] distantPast];

        if (v14 == v25 || v18 >= v14) {
          goto LABEL_13;
        }
      }
      double v21 = [(PLPowerMetricMonitorService *)self trackedProcesses];
      double v22 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
      uint64_t v23 = [v21 objectForKeyedSubscript:v22];
      [v23 setLastSuspendStart:v26];
    }

LABEL_13:
  }
}

- (void)_startMetricCollectionTimerWithInterval:(double)a3 block:(id)a4
{
  id v6 = a4;
  int v7 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v7);

  [(PLPowerMetricMonitorService *)self _cancelMetricCollectionTimer];
  if (a3 >= 0.2)
  {
    uint64_t v9 = [(PLPowerMetricMonitorService *)self monitorQueue];
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v9);
    [(PLPowerMetricMonitorService *)self setMetricCollectionRepeatingTimer:v10];

    double v11 = [(PLPowerMetricMonitorService *)self metricCollectionRepeatingTimer];
    dispatch_source_set_timer(v11, 0, (unint64_t)(a3 * 1000000000.0), 0x989680uLL);

    double v12 = [(PLPowerMetricMonitorService *)self metricCollectionRepeatingTimer];
    dispatch_source_set_event_handler(v12, v6);

    uint64_t v8 = [(PLPowerMetricMonitorService *)self metricCollectionRepeatingTimer];
    dispatch_resume(v8);
  }
  else
  {
    uint64_t v8 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[PLPowerMetricMonitorService _startMetricCollectionTimerWithInterval:block:]();
    }
  }
}

- (void)setMetricCollectionTimerUpdateInterval:(double)a3
{
  double v5 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v5);

  if (a3 >= 0.2)
  {
    int v7 = [(PLPowerMetricMonitorService *)self metricCollectionRepeatingTimer];

    if (v7)
    {
      uint64_t v8 = [(PLPowerMetricMonitorService *)self metricCollectionRepeatingTimer];
      dispatch_source_set_timer(v8, 0, (unint64_t)(a3 * 1000000000.0), 0x989680uLL);
    }
  }
  else
  {
    id v6 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[PLPowerMetricMonitorService _startMetricCollectionTimerWithInterval:block:]();
    }
  }
}

- (void)_cancelMetricCollectionTimer
{
  uint64_t v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(PLPowerMetricMonitorService *)self metricCollectionRepeatingTimer];

  if (v4)
  {
    double v5 = [(PLPowerMetricMonitorService *)self metricCollectionRepeatingTimer];
    dispatch_source_cancel(v5);

    [(PLPowerMetricMonitorService *)self setMetricCollectionRepeatingTimer:0];
  }
}

- (void)_startMetricCollectionTimeoutTimerWithTimeout:(double)a3 block:(id)a4
{
  id v6 = a4;
  int v7 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v7);

  [(PLPowerMetricMonitorService *)self _cancelMetricCollectionTimeoutTimer];
  uint64_t v8 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);
  [(PLPowerMetricMonitorService *)self setMetricCollectionTimeoutTimer:v9];

  dispatch_source_t v10 = [(PLPowerMetricMonitorService *)self metricCollectionTimeoutTimer];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);

  double v12 = [(PLPowerMetricMonitorService *)self metricCollectionTimeoutTimer];
  dispatch_source_set_event_handler(v12, v6);

  double v13 = [(PLPowerMetricMonitorService *)self metricCollectionTimeoutTimer];
  dispatch_resume(v13);
}

- (void)_cancelMetricCollectionTimeoutTimer
{
  uint64_t v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(PLPowerMetricMonitorService *)self metricCollectionTimeoutTimer];

  if (v4)
  {
    double v5 = [(PLPowerMetricMonitorService *)self metricCollectionTimeoutTimer];
    dispatch_source_cancel(v5);

    [(PLPowerMetricMonitorService *)self setMetricCollectionTimeoutTimer:0];
  }
}

- (void)_sampleCoalitions
{
  uint64_t v3 = [(PLPowerMetricMonitorService *)self monitorQueue];
  dispatch_assert_queue_V2(v3);

  if ([(PLPowerMetricMonitorService *)self updateMode])
  {
    int v4 = [(PLPowerMetricMonitorService *)self trackedProcesses];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = [(PLPowerMetricMonitorService *)self trackedProcesses];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke;
      v7[3] = &unk_1E6E48098;
      v7[4] = self;
      [v6 enumerateKeysAndObjectsUsingBlock:v7];
    }
  }
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = malloc_type_malloc(0x160uLL, 0x1000040AF73A19AuLL);
  [v6 coalitionID];
  if (!coalition_info_resource_usage())
  {
    dispatch_source_t v9 = objc_alloc_init(PLCoalitionSample);
    [(PLCoalitionSample *)v9 setInstructions:v7[31]];
    [(PLCoalitionSample *)v9 setPInstructions:v7[35]];
    [(PLCoalitionSample *)v9 setBytesread:v7[6]];
    [(PLCoalitionSample *)v9 setByteswritten:v7[7]];
    [(PLCoalitionSample *)v9 setGpuTime:v7[8]];
    [(PLCoalitionSample *)v9 setGpuEnergy:v7[42] + v7[41] - v7[43]];
    [(PLCoalitionSample *)v9 setCpuTime:v7[9] + v7[3] - v7[10]];
    [(PLCoalitionSample *)v9 setAneEnergy:v7[39]];
    [(PLCoalitionSample *)v9 setAneTime:v7[38]];
    dispatch_source_t v10 = PLLogPowerMetricMonitor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_3();
    }

    dispatch_time_t v11 = [v6 coalitionSample];
    double v12 = PLLogPowerMetricMonitor();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      id v92 = v6;
      if (v13) {
        __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_2();
      }

      uint64_t v14 = [(PLCoalitionSample *)v9 instructions];
      uint64_t v78 = v14 - [v11 instructions];
      uint64_t v15 = [(PLCoalitionSample *)v9 pInstructions];
      uint64_t v80 = v15 - [v11 pInstructions];
      uint64_t v16 = [(PLCoalitionSample *)v9 bytesread];
      uint64_t v82 = v16 - [v11 bytesread];
      uint64_t v17 = [(PLCoalitionSample *)v9 byteswritten];
      uint64_t v84 = v17 - [v11 byteswritten];
      uint64_t v18 = [(PLCoalitionSample *)v9 gpuTime];
      uint64_t v19 = v18 - [v11 gpuTime];
      uint64_t v20 = [(PLCoalitionSample *)v9 gpuEnergy];
      uint64_t v89 = v20 - [v11 gpuEnergy];
      uint64_t v21 = [(PLCoalitionSample *)v9 cpuTime];
      uint64_t v22 = v21 - [v11 cpuTime];
      uint64_t v23 = [(PLCoalitionSample *)v9 aneEnergy];
      uint64_t v86 = v23 - [v11 aneEnergy];
      uint64_t v24 = [(PLCoalitionSample *)v9 aneTime];
      uint64_t v88 = v24 - [v11 aneTime];
      uint64_t v77 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      v93 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v19];
      v90 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v22];
      double v25 = (void *)MEMORY[0x1E4F28ED0];
      [*(id *)(a1 + 32) _computeGPUCostWithGPUSec:v93];
      v94 = objc_msgSend(v25, "numberWithDouble:");
      id v26 = (void *)MEMORY[0x1E4F28ED0];
      [*(id *)(a1 + 32) _computeCPUCostWithCPUTicks:v90];
      double v95 = objc_msgSend(v26, "numberWithDouble:");
      double v27 = (void *)MEMORY[0x1E4F28ED0];
      double v28 = [*(id *)(a1 + 32) currQueryTime];
      id v29 = [*(id *)(a1 + 32) lastQueryTime];
      [v28 timeIntervalSinceDate:v29];
      id v30 = objc_msgSend(v27, "numberWithDouble:");
      double v31 = [*(id *)(a1 + 32) metrics];
      [v31 processMetrics];
      double v32 = v91 = v11;
      double v33 = [v32 objectForKeyedSubscript:v5];
      [v33 setSampleTime:v30];

      double v34 = [MEMORY[0x1E4F89CF0] sampleWithValue:v94 timestamp:v77];
      uint64_t v35 = [*(id *)(a1 + 32) metrics];
      uint64_t v36 = [v35 processMetrics];
      uint64_t v37 = [v36 objectForKeyedSubscript:v5];
      [v37 setGpuCost:v34];

      uint64_t v38 = [MEMORY[0x1E4F89CF0] sampleWithValue:v95 timestamp:v77];
      double v39 = [*(id *)(a1 + 32) metrics];
      uint64_t v40 = [v39 processMetrics];
      uint64_t v41 = [v40 objectForKeyedSubscript:v5];
      [v41 setCpuCost:v38];

      [*(id *)(a1 + 32) _emitPowerSignpostWithMetric:@"GPU_Cost" value:v94 pid:v5];
      id v42 = [MEMORY[0x1E4F89CF0] sampleWithValue:v93 timestamp:v77];
      double v43 = [*(id *)(a1 + 32) metrics];
      double v44 = [v43 processMetrics];
      double v45 = [v44 objectForKeyedSubscript:v5];
      [v45 setGpuTime:v42];

      [*(id *)(a1 + 32) _emitPowerSignpostWithMetric:@"GPU_Time" value:v93 pid:v5];
      v79 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v78];
      uint64_t v46 = objc_msgSend(MEMORY[0x1E4F89CF0], "sampleWithValue:timestamp:");
      uint64_t v47 = [*(id *)(a1 + 32) metrics];
      uint64_t v48 = [v47 processMetrics];
      uint64_t v49 = [v48 objectForKeyedSubscript:v5];
      [v49 setCpuInstructions:v46];

      [*(id *)(a1 + 32) _emitPowerSignpostWithMetric:@"CPU_Inst" value:v79 pid:v5];
      double v81 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v80];
      double v12 = v77;
      uint64_t v50 = [MEMORY[0x1E4F89CF0] sampleWithValue:v81 timestamp:v77];
      uint64_t v51 = [*(id *)(a1 + 32) metrics];
      long long v52 = [v51 processMetrics];
      uint64_t v53 = [v52 objectForKeyedSubscript:v5];
      [v53 setCpuPInstructions:v50];

      [*(id *)(a1 + 32) _emitPowerSignpostWithMetric:@"CPU_PInst" value:v81 pid:v5];
      long long v83 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v82];
      uint64_t v54 = [MEMORY[0x1E4F89CF0] sampleWithValue:v83 timestamp:v77];
      uint64_t v55 = [*(id *)(a1 + 32) metrics];
      uint64_t v56 = [v55 processMetrics];
      uint64_t v57 = [v56 objectForKeyedSubscript:v5];
      [v57 setBytesRead:v54];

      [*(id *)(a1 + 32) _emitPowerSignpostWithMetric:@"Disk_Read" value:v83 pid:v5];
      long long v85 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v84];
      id v58 = [MEMORY[0x1E4F89CF0] sampleWithValue:v85 timestamp:v77];
      long long v59 = [*(id *)(a1 + 32) metrics];
      long long v60 = [v59 processMetrics];
      long long v61 = [v60 objectForKeyedSubscript:v5];
      [v61 setBytesWritten:v58];

      [*(id *)(a1 + 32) _emitPowerSignpostWithMetric:@"Disk_Write" value:v85 pid:v5];
      double v87 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v86];
      long long v62 = [MEMORY[0x1E4F89CF0] sampleWithValue:v87 timestamp:v77];
      v63 = [*(id *)(a1 + 32) metrics];
      v64 = [v63 processMetrics];
      __int16 v65 = [v64 objectForKeyedSubscript:v5];
      [v65 setAneEnergy:v62];

      double v66 = (void *)MEMORY[0x1E4F28ED0];
      +[PLUtilities secondsFromMachTime:v88];
      double v67 = objc_msgSend(v66, "numberWithDouble:");
      uint64_t v68 = [MEMORY[0x1E4F89CF0] sampleWithValue:v67 timestamp:v77];
      long long v69 = [*(id *)(a1 + 32) metrics];
      long long v70 = [v69 processMetrics];
      long long v71 = [v70 objectForKeyedSubscript:v5];
      [v71 setAneTime:v68];

      long long v72 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v89];
      double v73 = [MEMORY[0x1E4F89CF0] sampleWithValue:v72 timestamp:v77];
      double v74 = [*(id *)(a1 + 32) metrics];
      __int16 v75 = [v74 processMetrics];
      id v76 = [v75 objectForKeyedSubscript:v5];
      [v76 setGpuEnergy:v73];

      dispatch_time_t v11 = v91;
      id v6 = v92;
    }
    else if (v13)
    {
      __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_1();
    }

    [v6 setCoalitionSample:v9];
    goto LABEL_15;
  }
  uint64_t v8 = PLLogPowerMetricMonitor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_4();
  }

  if (v7) {
LABEL_15:
  }
    free(v7);
}

- (PPSMetricMonitorService)metricMonitorService
{
  return (PPSMetricMonitorService *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMetricMonitorService:(id)a3
{
}

- (int64_t)updateMode
{
  return self->_updateMode;
}

- (void)setUpdateMode:(int64_t)a3
{
  self->_updateMode = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

- (BOOL)isCollectingMetrics
{
  return self->_isCollectingMetrics;
}

- (void)setIsCollectingMetrics:(BOOL)a3
{
  self->_isCollectingMetrics = a3;
}

- (PPSMetricCollection)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (PPSMetricCollection)cachedMetrics
{
  return self->_cachedMetrics;
}

- (void)setCachedMetrics:(id)a3
{
}

- (NSMutableDictionary)trackedProcesses
{
  return self->_trackedProcesses;
}

- (void)setTrackedProcesses:(id)a3
{
}

- (NSMutableSet)systemMetricEntryKeys
{
  return self->_systemMetricEntryKeys;
}

- (void)setSystemMetricEntryKeys:(id)a3
{
}

- (NSMutableSet)processSpecificMetricEntryKeys
{
  return self->_processSpecificMetricEntryKeys;
}

- (void)setProcessSpecificMetricEntryKeys:(id)a3
{
}

- (NSMutableSet)batteryGaugeConflictingSystemMetricEntryKeys
{
  return self->_batteryGaugeConflictingSystemMetricEntryKeys;
}

- (void)setBatteryGaugeConflictingSystemMetricEntryKeys:(id)a3
{
}

- (NSMutableSet)batteryGaugeConflictingProcessSpecificEntryKeys
{
  return self->_batteryGaugeConflictingProcessSpecificEntryKeys;
}

- (void)setBatteryGaugeConflictingProcessSpecificEntryKeys:(id)a3
{
}

- (NSMutableSet)entryKeysToCollect
{
  return self->_entryKeysToCollect;
}

- (void)setEntryKeysToCollect:(id)a3
{
}

- (NSMutableSet)entryKeysRequested
{
  return self->_entryKeysRequested;
}

- (void)setEntryKeysRequested:(id)a3
{
}

- (NSMutableSet)entryKeysCollected
{
  return self->_entryKeysCollected;
}

- (void)setEntryKeysCollected:(id)a3
{
}

- (NSMutableDictionary)entryKeyToEntryInfo
{
  return self->_entryKeyToEntryInfo;
}

- (void)setEntryKeyToEntryInfo:(id)a3
{
}

- (OS_dispatch_queue)monitorQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMonitorQueue:(id)a3
{
}

- (OS_dispatch_source)metricCollectionRepeatingTimer
{
  return self->_metricCollectionRepeatingTimer;
}

- (void)setMetricCollectionRepeatingTimer:(id)a3
{
}

- (OS_dispatch_source)metricCollectionTimeoutTimer
{
  return self->_metricCollectionTimeoutTimer;
}

- (void)setMetricCollectionTimeoutTimer:(id)a3
{
}

- (id)metricCollectionCompletionHandler
{
  return self->_metricCollectionCompletionHandler;
}

- (void)setMetricCollectionCompletionHandler:(id)a3
{
}

- (PLIOReportStats)energyModelStats
{
  return self->_energyModelStats;
}

- (void)setEnergyModelStats:(id)a3
{
}

- (PLIOReportStats)pmpCountersStats
{
  return self->_pmpCountersStats;
}

- (void)setPmpCountersStats:(id)a3
{
}

- (PLIOReportStats)dcpSwapStats
{
  return self->_dcpSwapStats;
}

- (void)setDcpSwapStats:(id)a3
{
}

- (PLIOReportStats)amcStats
{
  return self->_amcStats;
}

- (void)setAmcStats:(id)a3
{
}

- (NSDate)currQueryTime
{
  return self->_currQueryTime;
}

- (void)setCurrQueryTime:(id)a3
{
}

- (NSDate)lastQueryTime
{
  return self->_lastQueryTime;
}

- (void)setLastQueryTime:(id)a3
{
}

- (int)lastQueryCount
{
  return self->_lastQueryCount;
}

- (void)setLastQueryCount:(int)a3
{
  self->_lastQueryCount = a3;
}

- (int)currQueryCount
{
  return self->_currQueryCount;
}

- (void)setCurrQueryCount:(int)a3
{
  self->_currQueryCount = a3;
}

- (id)costElement
{
  return self->_costElement;
}

- (void)setCostElement:(id)a3
{
}

- (NSSet)energyScoringEntities
{
  return self->_energyScoringEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyScoringEntities, 0);
  objc_storeStrong(&self->_costElement, 0);
  objc_storeStrong((id *)&self->_lastQueryTime, 0);
  objc_storeStrong((id *)&self->_currQueryTime, 0);
  objc_storeStrong((id *)&self->_amcStats, 0);
  objc_storeStrong((id *)&self->_dcpSwapStats, 0);
  objc_storeStrong((id *)&self->_pmpCountersStats, 0);
  objc_storeStrong((id *)&self->_energyModelStats, 0);
  objc_storeStrong(&self->_metricCollectionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_metricCollectionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_metricCollectionRepeatingTimer, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_entryKeyToEntryInfo, 0);
  objc_storeStrong((id *)&self->_entryKeysCollected, 0);
  objc_storeStrong((id *)&self->_entryKeysRequested, 0);
  objc_storeStrong((id *)&self->_entryKeysToCollect, 0);
  objc_storeStrong((id *)&self->_batteryGaugeConflictingProcessSpecificEntryKeys, 0);
  objc_storeStrong((id *)&self->_batteryGaugeConflictingSystemMetricEntryKeys, 0);
  objc_storeStrong((id *)&self->_processSpecificMetricEntryKeys, 0);
  objc_storeStrong((id *)&self->_systemMetricEntryKeys, 0);
  objc_storeStrong((id *)&self->_trackedProcesses, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_metricMonitorService, 0);
}

void __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "startMonitoring called while already monitoring", v2, v3, v4, v5, v6);
}

void __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 136315650;
  uint64_t v5 = "-[PLPowerMetricMonitorService startMonitoringWithConfigurationMode:updateInterval:]_block_invoke";
  __int16 v6 = 2048;
  uint64_t v7 = v2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "%s mode: %ld interval: %f", (uint8_t *)&v4, 0x20u);
}

void __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = [*a1 updateMode];
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_fault_impl(&dword_1E4220000, a2, OS_LOG_TYPE_FAULT, "Unexpected call of finishMonitoringAndSendMetrics in mode %d", (uint8_t *)v4, 8u);
}

void __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__PLPowerMetricMonitorService_allClientsDidDisconnect__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "collectMetricsOnDemand mode is not PPSMetricMonitorModeUpdateOnDemand", v2, v3, v4, v5, v6);
}

void __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "collectMetricsOnDemand called without start monitoring", v2, v3, v4, v5, v6);
}

void __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_230_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "collectMetricsOnDemand dispatch_semaphore_signal", v2, v3, v4, v5, v6);
}

- (void)collectMetricsOnSnapshotWithError:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Timed out while trying to collect metrics", v2, v3, v4, v5, v6);
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "PPSMetricMonitorMode is not PPSMetricMonitorModeUpdateOnSnapshot", v2, v3, v4, v5, v6);
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "collectMetricsOnSnapshot called without start monitoring", v2, v3, v4, v5, v6);
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_236_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "collectMetricsOnSnapshot dispatch_semaphore_signal", v2, v3, v4, v5, v6);
}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1E4220000, v0, v1, "%s monitoring %@", v2, v3, v4, v5, 2u);
}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Attempting to monitor multiple times", v2, v3, v4, v5, v6);
}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_3(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "Received invalid PID: %d", (uint8_t *)v3, 8u);
}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_10_1();
  _os_log_debug_impl(&dword_1E4220000, v0, OS_LOG_TYPE_DEBUG, "%s PID: %d", (uint8_t *)v1, 0x12u);
}

- (void)addMonitoredProcessesWithPIDs:(void *)a3 error:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1E4220000, a4, OS_LOG_TYPE_ERROR, "Error while trying to addMonitoredProcessWithPID: %@", a1, 0xCu);
}

void __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke_cold_1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "Not monitoring process %d", (uint8_t *)v3, 8u);
}

void __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_10_1();
  _os_log_debug_impl(&dword_1E4220000, v0, OS_LOG_TYPE_DEBUG, "%s PID: %d", (uint8_t *)v1, 0x12u);
}

void __52__PLPowerMetricMonitorService_changeUpdateInterval___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Registering for updates from %@", v2, v3, v4, v5, v6);
}

void __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_collectMetricsWithTimeout:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Metric collection timed out due to a subsequent collectMetrics call", v2, v3, v4, v5, v6);
}

- (void)_collectMetricsWithTimeout:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_agentDidUpdateWithEntryKey:.cold.1()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1E4220000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

- (void)_parseEnergyModelOrPMPMetricsFromSample:withSampleDuration:sourceChannel:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "Parse failed. Invalid sample duration: %f", v2, v3, v4, v5, v6);
}

- (void)_parseSMCMetricsFromEntry:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "skipping system power calculation", v2, v3, v4, v5, v6);
}

- (void)_parseProcessMonitorMetricsFromEntry:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_parseProcessNetworkMetricsFromEntry:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_parseLocationMetricsFromEntry:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_parseLocationMetricsFromEntry:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_7_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "%s: No matching bundleID found; entry=%@",
    (uint8_t *)v1,
    0x16u);
}

- (void)_parseApplicationMetricsFromEntry:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Not tracking pid %@", v2, v3, v4, v5, v6);
}

- (void)_computeDisplayCostWithAvgRed:avgGreen:avgBlue:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Display Cost=%f", v2, v3, v4, v5, v6);
}

- (void)_computeNetworkingCostWithWifiIn:wifiOut:cellIn:cellOut:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Network Cost=%f", v2, v3, v4, v5, v6);
}

- (void)_computeLocationCostWithWifiCost:gpsCost:cellCost:skyhookCost:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Location Cost=%f", v2, v3, v4, v5, v6);
}

- (void)_computeGPUCostWithGPUSec:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1E4220000, a1, a3, "%s: GPU Cost=%f", a5, a6, a7, a8, 2u);
}

- (void)_startMetricCollectionTimerWithInterval:block:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_1();
  _os_log_fault_impl(&dword_1E4220000, v0, OS_LOG_TYPE_FAULT, "Interval %f s is lower than minimum %f s; aborting",
    v1,
    0x16u);
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "initial sample", v2, v3, v4, v5, v6);
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "diffing against %@", v2, v3, v4, v5, v6);
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1E4220000, v1, OS_LOG_TYPE_DEBUG, "sampling coalitions for %@ -> %@", v2, 0x16u);
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_3(&dword_1E4220000, v0, v1, "failed to sample coalitions for %@", v2, v3, v4, v5, v6);
}

@end