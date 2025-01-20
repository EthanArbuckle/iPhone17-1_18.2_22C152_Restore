@interface PLDiscretionaryEnergyMonitor
+ (double)getDiscretionaryEnergyBudget;
- (BOOL)debugMode;
- (BOOL)isCharging;
- (NSDate)powerlogTimestampLast;
- (NSDate)powerlogTimestampPrevious;
- (NSDictionary)lastPowerlogResponse;
- (NSMutableArray)quickEnergySnapshots;
- (NSMutableDictionary)mockData;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)powerlogQueryTimer;
- (OS_dispatch_source)quickEnergyAccumulatorTimer;
- (PLDiscretionaryEnergyMonitor)initWithCompletionBlock:(id)a3;
- (PLDiscretionaryEnergyMonitor)initWithDebugMode:(BOOL)a3 andMockData:(id)a4 andCompletionBlock:(id)a5;
- (PLDiscretionaryIntervalManager)intervalManager;
- (double)accumulatedCPUEnergy;
- (double)accumulatedNetworkEnergy;
- (double)getPowerlogEnergySum:(id)a3;
- (double)lastReportedCPUEnergy;
- (double)lastReportedNetworkEnergy;
- (double)lastReportedTotalEnergy;
- (double)powerlogEnergyDiff;
- (double)powerlogEnergyLast;
- (double)powerlogEnergyPrevious;
- (id)completionBlock;
- (id)createPowerlogQueryTimer;
- (id)createQuickEnergyAccumulatorTimer;
- (void)accumulateQuickEnergy;
- (void)createQuickEnergyAccumulatorTimer;
- (void)generateEnergyReport;
- (void)incrementCPUEnergy:(double)a3;
- (void)incrementNetworkEnergy:(double)a3;
- (void)logEnergyReport:(id)a3;
- (void)logPowerlogResponse:(id)a3;
- (void)logQuickEnergySnapshots;
- (void)queryPowerlogForDiscretionaryEnergy;
- (void)reportChargingStatus:(BOOL)a3;
- (void)reportStartEvent:(id)a3 withInfo:(id)a4;
- (void)reportStopEvent:(id)a3 withInfo:(id)a4;
- (void)runCompletionBlockWithEnergyResponse:(id)a3;
- (void)setAccumulatedCPUEnergy:(double)a3;
- (void)setAccumulatedNetworkEnergy:(double)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDebugMode:(BOOL)a3;
- (void)setIntervalManager:(id)a3;
- (void)setIsCharging:(BOOL)a3;
- (void)setLastPowerlogResponse:(id)a3;
- (void)setLastReportedCPUEnergy:(double)a3;
- (void)setLastReportedNetworkEnergy:(double)a3;
- (void)setLastReportedTotalEnergy:(double)a3;
- (void)setMockData:(id)a3;
- (void)setPowerlogEnergyDiff:(double)a3;
- (void)setPowerlogEnergyLast:(double)a3;
- (void)setPowerlogEnergyPrevious:(double)a3;
- (void)setPowerlogQueryTimer:(id)a3;
- (void)setPowerlogTimestampLast:(id)a3;
- (void)setPowerlogTimestampPrevious:(id)a3;
- (void)setQuickEnergyAccumulatorTimer:(id)a3;
- (void)setQuickEnergySnapshots:(id)a3;
- (void)setStateForNotification:(id)a3 withState:(id)a4;
- (void)setWorkQueue:(id)a3;
- (void)setupNotificationListeners;
- (void)testHighVolumeStartStopReporting:(id)a3 withInfo:(id)a4 withNumIterations:(double)a5;
- (void)updateMockData:(id)a3;
@end

@implementation PLDiscretionaryEnergyMonitor

uint64_t __65__PLDiscretionaryEnergyMonitor_createQuickEnergyAccumulatorTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accumulateQuickEnergy];
}

void __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_1A11A5000, v2, OS_LOG_TYPE_INFO, "accumulating quick energy", (uint8_t *)&v27, 2u);
  }

  v3 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) accumulatedCPUEnergy];
    v5 = v4;
    [*(id *)(a1 + 32) accumulatedNetworkEnergy];
    uint64_t v7 = v6;
    [*(id *)(a1 + 32) accumulatedCPUEnergy];
    double v9 = v8;
    [*(id *)(a1 + 32) accumulatedNetworkEnergy];
    int v27 = 134218496;
    v28 = v5;
    __int16 v29 = 2048;
    uint64_t v30 = v7;
    __int16 v31 = 2048;
    double v32 = v9 + v10;
    _os_log_impl(&dword_1A11A5000, v3, OS_LOG_TYPE_DEFAULT, "Creating quick energy snapshot, cpuEnergyTotal=%f, networkEnergyTotal=%f, totalEnergy=%f", (uint8_t *)&v27, 0x20u);
  }

  v11 = [PLQuickEnergySnapshot alloc];
  v13 = *(void **)(a1 + 32);
  v12 = (id *)(a1 + 32);
  [v13 accumulatedCPUEnergy];
  double v15 = v14;
  [*v12 accumulatedNetworkEnergy];
  v17 = [(PLQuickEnergySnapshot *)v11 initWithEnergies:v15 andNetworkEnergy:v16];
  v18 = [*v12 quickEnergySnapshots];
  uint64_t v19 = [v18 count];

  v20 = [*v12 quickEnergySnapshots];
  v21 = v20;
  if (v19)
  {
    v22 = [v20 lastObject];

    [(PLQuickEnergySnapshot *)v17 computeEnergyDiff:v22];
    if (v23 >= 1.0)
    {
      v25 = [*v12 quickEnergySnapshots];
      [v25 addObject:v17];

      [*v12 generateEnergyReport];
      v24 = PLLogDiscretionaryEnergyMonitor();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v26 = [*v12 quickEnergySnapshots];
        int v27 = 138412290;
        v28 = v26;
        _os_log_impl(&dword_1A11A5000, v24, OS_LOG_TYPE_INFO, "quickEnergySnapshots=%@", (uint8_t *)&v27, 0xCu);
      }
    }
    else
    {
      v24 = PLLogDiscretionaryEnergyMonitor();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_2();
      }
    }
  }
  else
  {
    [v20 addObject:v17];

    v22 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_1(v12, v22);
    }
  }
}

- (double)accumulatedNetworkEnergy
{
  return self->_accumulatedNetworkEnergy;
}

- (double)accumulatedCPUEnergy
{
  return self->_accumulatedCPUEnergy;
}

- (NSMutableArray)quickEnergySnapshots
{
  return self->_quickEnergySnapshots;
}

- (void)accumulateQuickEnergy
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke;
  block[3] = &unk_1E5A45DA0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

+ (double)getDiscretionaryEnergyBudget
{
  +[PLModelingUtilities duetDiscretionaryBudget];
  return result;
}

- (PLDiscretionaryEnergyMonitor)initWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLDiscretionaryEnergyMonitor;
  v5 = [(PLDiscretionaryEnergyMonitor *)&v10 init];
  if (v5)
  {
    uint64_t v6 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_1A11A5000, v6, OS_LOG_TYPE_DEFAULT, "Initializing PLDiscretionaryEnergyMonitor...", v9, 2u);
    }

    v5 = [(PLDiscretionaryEnergyMonitor *)v5 initWithDebugMode:0 andMockData:0 andCompletionBlock:v4];
    uint64_t v7 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_1A11A5000, v7, OS_LOG_TYPE_DEFAULT, "Finished initializing PLDiscretionaryEnergyMonitor...", v9, 2u);
    }
  }
  return v5;
}

- (PLDiscretionaryEnergyMonitor)initWithDebugMode:(BOOL)a3 andMockData:(id)a4 andCompletionBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PLDiscretionaryEnergyMonitor;
  objc_super v10 = [(PLDiscretionaryEnergyMonitor *)&v25 init];
  v11 = v10;
  if (v10)
  {
    [(PLDiscretionaryEnergyMonitor *)v10 setCompletionBlock:v9];
    v12 = discretionaryEnergyMonitorQueue();
    [(PLDiscretionaryEnergyMonitor *)v11 setWorkQueue:v12];

    [(PLDiscretionaryEnergyMonitor *)v11 setMockData:0];
    BOOL v13 = v6 && +[PLModelingUtilities internalBuild];
    [(PLDiscretionaryEnergyMonitor *)v11 setDebugMode:v13];
    if ([(PLDiscretionaryEnergyMonitor *)v11 debugMode])
    {
      double v14 = PLLogDiscretionaryEnergyMonitor();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v8;
        _os_log_impl(&dword_1A11A5000, v14, OS_LOG_TYPE_INFO, "Initializing in debug mode with mockData=%@", buf, 0xCu);
      }

      if (v8)
      {
        double v15 = (void *)[v8 mutableCopy];
        [(PLDiscretionaryEnergyMonitor *)v11 setMockData:v15];

        double v16 = [(PLDiscretionaryEnergyMonitor *)v11 mockData];
        v17 = [v16 objectForKeyedSubscript:@"LastPowerlogResponseMock"];
        [(PLDiscretionaryEnergyMonitor *)v11 setLastPowerlogResponse:v17];
      }
    }
    else if (+[PLModelingUtilities internalBuild])
    {
      [(PLDiscretionaryEnergyMonitor *)v11 setupNotificationListeners];
    }
    [(PLDiscretionaryEnergyMonitor *)v11 setAccumulatedCPUEnergy:0.0];
    [(PLDiscretionaryEnergyMonitor *)v11 setAccumulatedNetworkEnergy:0.0];
    [(PLDiscretionaryEnergyMonitor *)v11 setLastReportedTotalEnergy:0.0];
    [(PLDiscretionaryEnergyMonitor *)v11 setPowerlogEnergyLast:0.0];
    [(PLDiscretionaryEnergyMonitor *)v11 setPowerlogEnergyPrevious:0.0];
    v18 = [(PLDiscretionaryEnergyMonitor *)v11 createPowerlogQueryTimer];
    [(PLDiscretionaryEnergyMonitor *)v11 setPowerlogQueryTimer:v18];

    uint64_t v19 = [(PLDiscretionaryEnergyMonitor *)v11 createQuickEnergyAccumulatorTimer];
    [(PLDiscretionaryEnergyMonitor *)v11 setQuickEnergyAccumulatorTimer:v19];

    v20 = objc_opt_new();
    [(PLDiscretionaryEnergyMonitor *)v11 setQuickEnergySnapshots:v20];

    [(PLDiscretionaryEnergyMonitor *)v11 queryPowerlogForDiscretionaryEnergy];
    [(PLDiscretionaryEnergyMonitor *)v11 accumulateQuickEnergy];
    [(PLDiscretionaryEnergyMonitor *)v11 setIsCharging:0];
    v21 = [PLDiscretionaryIntervalManager alloc];
    v22 = [(PLDiscretionaryEnergyMonitor *)v11 mockData];
    double v23 = [(PLDiscretionaryIntervalManager *)v21 initWithEnergyMonitor:v11 andMockData:v22];
    [(PLDiscretionaryEnergyMonitor *)v11 setIntervalManager:v23];
  }
  return v11;
}

- (void)reportStartEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryEnergyMonitor reportStartEvent:withInfo:]();
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PLDiscretionaryEnergyMonitor_reportStartEvent_withInfo___block_invoke;
  block[3] = &unk_1E5A45E08;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(workQueue, block);
}

void __58__PLDiscretionaryEnergyMonitor_reportStartEvent_withInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) intervalManager];
  [v2 handleStartEvent:*(void *)(a1 + 40) withInfo:*(void *)(a1 + 48)];
}

- (void)reportStopEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryEnergyMonitor reportStopEvent:withInfo:]();
  }

  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PLDiscretionaryEnergyMonitor_reportStopEvent_withInfo___block_invoke;
  block[3] = &unk_1E5A45E08;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_after(v9, workQueue, block);
}

void __57__PLDiscretionaryEnergyMonitor_reportStopEvent_withInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) intervalManager];
  [v2 handleStopEvent:*(void *)(a1 + 40) withInfo:*(void *)(a1 + 48)];
}

- (void)generateEnergyReport
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "cumulativePowerlogEnergy=%f", v2, v3, v4, v5, v6);
}

void __52__PLDiscretionaryEnergyMonitor_generateEnergyReport__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __52__PLDiscretionaryEnergyMonitor_generateEnergyReport__block_invoke_cold_1(a1, v7, v8);
  }

  dispatch_time_t v9 = *(void **)(a1 + 32);
  id v10 = [v7 timestamp];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  if (v12 <= 60.0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (void)queryPowerlogForDiscretionaryEnergy
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke;
  block[3] = &unk_1E5A45DA0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v32) = 0;
    _os_log_impl(&dword_1A11A5000, v2, OS_LOG_TYPE_INFO, "Querying powerlog for discretionary energy", (uint8_t *)&v32, 2u);
  }

  if ([*(id *)(a1 + 32) debugMode])
  {
    uint64_t v3 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1A11A5000, v3, OS_LOG_TYPE_INFO, "Not querying for powerlog response in debug mode, using lastPowerlogResponse instead", (uint8_t *)&v32, 2u);
    }

    uint64_t v4 = [*(id *)(a1 + 32) lastPowerlogResponse];
  }
  else
  {
    uint64_t v4 = PLQueryRegistered(24, @"BLMReportEnergyDuet", 0);
  }
  uint64_t v5 = (void *)v4;
  uint8_t v6 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v32 = 138412290;
    uint64_t v33 = v5;
    _os_log_impl(&dword_1A11A5000, v6, OS_LOG_TYPE_INFO, "Powerlog response: %@", (uint8_t *)&v32, 0xCu);
  }

  if (!v5
    || ([v5 objectForKeyedSubscript:@"PermissionUnknown"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_1();
    }
    goto LABEL_32;
  }
  [*(id *)(a1 + 32) logPowerlogResponse:v5];
  id v8 = [*(id *)(a1 + 32) lastPowerlogResponse];

  if (v8)
  {
    id v8 = [*(id *)(a1 + 32) lastPowerlogResponse];
  }
  dispatch_time_t v9 = [v5 objectForKeyedSubscript:@"BLMEnergyResponseTimestamp"];
  [*(id *)(a1 + 32) setPowerlogTimestampLast:v9];

  [*(id *)(a1 + 32) getPowerlogEnergySum:v5];
  objc_msgSend(*(id *)(a1 + 32), "setPowerlogEnergyLast:");
  [*(id *)(a1 + 32) setLastPowerlogResponse:v5];
  if (!v8) {
    goto LABEL_29;
  }
  id v10 = [v8 objectForKeyedSubscript:@"BLMEnergyResponseTimestamp"];
  [*(id *)(a1 + 32) setPowerlogTimestampPrevious:v10];
  [*(id *)(a1 + 32) getPowerlogEnergySum:v8];
  objc_msgSend(*(id *)(a1 + 32), "setPowerlogEnergyPrevious:");
  double v11 = [*(id *)(a1 + 32) powerlogTimestampLast];

  char v12 = 1;
  if (v10)
  {
    if (v11)
    {
      id v13 = [*(id *)(a1 + 32) powerlogTimestampLast];
      [v13 timeIntervalSinceDate:v10];
      double v15 = v14;

      if (v15 > 0.0)
      {
        [*(id *)(a1 + 32) powerlogEnergyLast];
        double v17 = v16;
        [*(id *)(a1 + 32) powerlogEnergyPrevious];
        [*(id *)(a1 + 32) setPowerlogEnergyDiff:v17 - v18];
        uint64_t v19 = PLLogDiscretionaryEnergyMonitor();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(a1 + 32) powerlogEnergyPrevious];
          v21 = v20;
          [*(id *)(a1 + 32) powerlogEnergyLast];
          uint64_t v23 = v22;
          [*(id *)(a1 + 32) powerlogEnergyDiff];
          uint64_t v25 = v24;
          v26 = [*(id *)(a1 + 32) powerlogTimestampPrevious];
          id v27 = [*(id *)(a1 + 32) powerlogTimestampLast];
          int v32 = 134219010;
          uint64_t v33 = v21;
          __int16 v34 = 2048;
          uint64_t v35 = v23;
          __int16 v36 = 2048;
          uint64_t v37 = v25;
          __int16 v38 = 2112;
          v39 = v26;
          __int16 v40 = 2112;
          v41 = v27;
          _os_log_impl(&dword_1A11A5000, v19, OS_LOG_TYPE_DEFAULT, "New Powerlog Accounting Energy: previousPowerlogEnergySum=%f, lastPowerlogEnergySum=%f, powerlogEnergyDiff=%f from previousResponseTimestamp=%@ to lastResponseTimestamp=%@", (uint8_t *)&v32, 0x34u);
        }
        char v12 = 0;
      }
    }
  }
  uint64_t v28 = [*(id *)(a1 + 32) powerlogTimestampLast];
  if (!v28)
  {

LABEL_29:
    __int16 v31 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) generateEnergyReport];
    goto LABEL_32;
  }
  __int16 v29 = (void *)v28;
  uint64_t v30 = [*(id *)(a1 + 32) powerlogTimestampPrevious];
  if (!v30) {
    char v12 = 0;
  }

  if ((v12 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_32:
}

- (void)runCompletionBlockWithEnergyResponse:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(PLDiscretionaryEnergyMonitor *)self completionBlock];

  if (v4)
  {
    uint64_t v5 = [(PLDiscretionaryEnergyMonitor *)self completionBlock];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)createPowerlogQueryTimer
{
  uint64_t v3 = dispatch_get_global_queue(-32768, 0);
  uint64_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);

  dispatch_time_t v5 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v4, v5, 0x8BB2C97000uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __56__PLDiscretionaryEnergyMonitor_createPowerlogQueryTimer__block_invoke;
  handler[3] = &unk_1E5A45DA0;
  handler[4] = self;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v4);
  return v4;
}

uint64_t __56__PLDiscretionaryEnergyMonitor_createPowerlogQueryTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) queryPowerlogForDiscretionaryEnergy];
}

- (id)createQuickEnergyAccumulatorTimer
{
  uint64_t v3 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryEnergyMonitor createQuickEnergyAccumulatorTimer]();
  }

  uint64_t v4 = dispatch_get_global_queue(-32768, 0);
  dispatch_time_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);

  dispatch_time_t v6 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v5, v6, 0xDF8475800uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __65__PLDiscretionaryEnergyMonitor_createQuickEnergyAccumulatorTimer__block_invoke;
  handler[3] = &unk_1E5A45DA0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  return v5;
}

- (double)getPowerlogEnergySum:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"BLMEnergyForDuet"];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v10 = 0;
    double v11 = (double *)&v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    dispatch_time_t v6 = [v3 objectForKeyedSubscript:@"BLMEnergyForDuet"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__PLDiscretionaryEnergyMonitor_getPowerlogEnergySum___block_invoke;
    v9[3] = &unk_1E5A45E58;
    v9[4] = &v10;
    [v6 enumerateObjectsUsingBlock:v9];
    double v7 = v11[3];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

void __53__PLDiscretionaryEnergyMonitor_getPowerlogEnergySum___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 objectForKeyedSubscript:@"energy"];
  [v4 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
}

- (void)reportChargingStatus:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke;
  v4[3] = &unk_1E5A45E80;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

uint64_t __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isCharging"));
    id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    int v12 = 138412546;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    double v15 = v4;
    _os_log_impl(&dword_1A11A5000, v2, OS_LOG_TYPE_DEFAULT, "Setting chargingStatus from isCharging=%@ to isCharging=%@", (uint8_t *)&v12, 0x16u);
  }
  if (([*(id *)(a1 + 32) isCharging] & 1) == 0 && *(unsigned char *)(a1 + 40))
  {
    BOOL v5 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke_cold_1();
    }

    dispatch_time_t v6 = [*(id *)(a1 + 32) intervalManager];
    [v6 handleOpenIntervalTimer];

    double v7 = [*(id *)(a1 + 32) intervalManager];
    [v7 disableQuickEnergy];
  }
  if ([*(id *)(a1 + 32) isCharging] && !*(unsigned char *)(a1 + 40))
  {
    id v8 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke_cold_1();
    }

    dispatch_time_t v9 = [*(id *)(a1 + 32) intervalManager];
    [v9 handleOpenIntervalTimer];

    uint64_t v10 = [*(id *)(a1 + 32) intervalManager];
    [v10 enableQuickEnergy];
  }
  return [*(id *)(a1 + 32) setIsCharging:*(unsigned __int8 *)(a1 + 40)];
}

- (void)incrementCPUEnergy:(double)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke;
  v4[3] = &unk_1E5A45EA8;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(workQueue, v4);
}

void __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCharging];
  double v3 = PLLogDiscretionaryEnergyMonitor();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_1();
    }
  }
  else
  {
    if (v4) {
      __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_2(a1, v3, v5, v6, v7, v8, v9, v10);
    }

    double v11 = *(void **)(a1 + 32);
    [v11 accumulatedCPUEnergy];
    [v11 setAccumulatedCPUEnergy:v12 + *(double *)(a1 + 40)];
  }
}

- (void)incrementNetworkEnergy:(double)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke;
  v4[3] = &unk_1E5A45EA8;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(workQueue, v4);
}

void __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCharging];
  double v3 = PLLogDiscretionaryEnergyMonitor();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_1();
    }
  }
  else
  {
    if (v4) {
      __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke_cold_2(a1, v3, v5, v6, v7, v8, v9, v10);
    }

    double v11 = *(void **)(a1 + 32);
    [v11 accumulatedNetworkEnergy];
    [v11 setAccumulatedNetworkEnergy:v12 + *(double *)(a1 + 40)];
  }
}

- (void)testHighVolumeStartStopReporting:(id)a3 withInfo:(id)a4 withNumIterations:(double)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2048;
    double v18 = a5;
    _os_log_impl(&dword_1A11A5000, v10, OS_LOG_TYPE_DEFAULT, "Testing high volume start/stops for activityName=%@, withInfo=%@ for %f iterations", (uint8_t *)&v13, 0x20u);
  }

  if (a5 > 0.0)
  {
    int v11 = 1;
    do
    {
      [(PLDiscretionaryEnergyMonitor *)self reportStartEvent:v8 withInfo:v9];
      [(PLDiscretionaryEnergyMonitor *)self reportStopEvent:v8 withInfo:v9];
      double v12 = (double)v11++;
    }
    while (v12 < a5);
  }
}

- (void)setupNotificationListeners
{
  double v3 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_1A11A5000, v3, OS_LOG_TYPE_DEFAULT, "Setting up debug listeners", v16, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.quickEnergySnapshots", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.queryPowerlog", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.generateEnergyReport", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.discretionaryIntervals", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.lastPowerlogEnergy", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.lastPowerlogTimestamp", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v10, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.chargingStatus", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v11, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.lastReportedTotalEnergy", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  double v12 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v12, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.lastReportedCPUEnergy", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v13 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v13, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.lastReportedNetworkEnergy", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v14 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v14, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.accumulatedCPUEnergy", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  __int16 v15 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v15, self, (CFNotificationCallback)didReceiveNotification, @"com.apple.energybudgetingdebug.accumulatedNetworkEnergy", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)setStateForNotification:(id)a3 withState:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1A11A5000, v7, OS_LOG_TYPE_INFO, "Setting state=%@ for notificationName=%@", (uint8_t *)&v14, 0x16u);
  }

  int v14 = 0;
  id v8 = v5;
  uint32_t v9 = notify_register_check((const char *)[v8 UTF8String], &v14);
  if (v9)
  {
    int v10 = v9;
    int v11 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PLDiscretionaryEnergyMonitor setStateForNotification:withState:](v10, v11);
    }
LABEL_9:

    goto LABEL_10;
  }
  uint32_t v12 = notify_set_state(v14, [v6 unsignedLongLongValue]);
  if (v12)
  {
    int v13 = v12;
    int v11 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PLDiscretionaryEnergyMonitor setStateForNotification:withState:](v13, v11);
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void)updateMockData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PLDiscretionaryEnergyMonitor *)self debugMode];
  id v6 = PLLogDiscretionaryEnergyMonitor();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1A11A5000, v7, OS_LOG_TYPE_INFO, "Updating to mockData=%@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v7 = [v4 mutableCopy];
    id v8 = [v7 objectForKeyedSubscript:@"LastPowerlogResponseMock"];
    uint32_t v9 = [(PLDiscretionaryEnergyMonitor *)self mockData];
    [v9 setObject:v8 forKeyedSubscript:@"LastPowerlogResponseMock"];

    int v10 = [(PLDiscretionaryEnergyMonitor *)self mockData];
    int v11 = [v10 objectForKeyedSubscript:@"LastPowerlogResponseMock"];
    [(PLDiscretionaryEnergyMonitor *)self setLastPowerlogResponse:v11];

    uint32_t v12 = [v7 objectForKeyedSubscript:@"CPUCoalitionsMock"];
    int v13 = [(PLDiscretionaryEnergyMonitor *)self mockData];
    [v13 setObject:v12 forKeyedSubscript:@"CPUCoalitionsMock"];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[PLDiscretionaryEnergyMonitor updateMockData:]();
  }
}

- (void)logPowerlogResponse:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"BLMEnergyForDuet"];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_525];

  BOOL v5 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v3 objectForKeyedSubscript:@"BLMEnergyResponseTimestamp"];
    int v9 = 138412290;
    int v10 = v6;
    _os_log_impl(&dword_1A11A5000, v5, OS_LOG_TYPE_INFO, "EnergyResponseTimestamp: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v3 objectForKeyedSubscript:@"BLMUUIDForDuet"];
    int v9 = 138412290;
    int v10 = v8;
    _os_log_impl(&dword_1A11A5000, v7, OS_LOG_TYPE_INFO, "UUIDForDuet: %@", (uint8_t *)&v9, 0xCu);
  }
}

void __52__PLDiscretionaryEnergyMonitor_logPowerlogResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1A11A5000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)logQuickEnergySnapshots
{
  id v2 = [(PLDiscretionaryEnergyMonitor *)self quickEnergySnapshots];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_530];
}

void __55__PLDiscretionaryEnergyMonitor_logQuickEnergySnapshots__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1A11A5000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)logEnergyReport:(id)a3
{
  id v3 = a3;
  int v4 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryEnergyMonitor logEnergyReport:]();
  }

  PLLogRegisteredEvent(70, @"DASEnergyReport", v3);
}

- (PLDiscretionaryIntervalManager)intervalManager
{
  return (PLDiscretionaryIntervalManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIntervalManager:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (double)lastReportedTotalEnergy
{
  return self->_lastReportedTotalEnergy;
}

- (void)setLastReportedTotalEnergy:(double)a3
{
  self->_lastReportedTotalEnergy = a3;
}

- (double)lastReportedCPUEnergy
{
  return self->_lastReportedCPUEnergy;
}

- (void)setLastReportedCPUEnergy:(double)a3
{
  self->_lastReportedCPUEnergy = a3;
}

- (double)lastReportedNetworkEnergy
{
  return self->_lastReportedNetworkEnergy;
}

- (void)setLastReportedNetworkEnergy:(double)a3
{
  self->_lastReportedNetworkEnergy = a3;
}

- (NSDictionary)lastPowerlogResponse
{
  return self->_lastPowerlogResponse;
}

- (void)setLastPowerlogResponse:(id)a3
{
}

- (void)setQuickEnergySnapshots:(id)a3
{
}

- (OS_dispatch_source)powerlogQueryTimer
{
  return self->_powerlogQueryTimer;
}

- (void)setPowerlogQueryTimer:(id)a3
{
}

- (OS_dispatch_source)quickEnergyAccumulatorTimer
{
  return self->_quickEnergyAccumulatorTimer;
}

- (void)setQuickEnergyAccumulatorTimer:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setAccumulatedCPUEnergy:(double)a3
{
  self->_accumulatedCPUEnergy = a3;
}

- (void)setAccumulatedNetworkEnergy:(double)a3
{
  self->_accumulatedNetworkEnergy = a3;
}

- (double)powerlogEnergyDiff
{
  return self->_powerlogEnergyDiff;
}

- (void)setPowerlogEnergyDiff:(double)a3
{
  self->_powerlogEnergyDiff = a3;
}

- (NSDate)powerlogTimestampPrevious
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPowerlogTimestampPrevious:(id)a3
{
}

- (NSDate)powerlogTimestampLast
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPowerlogTimestampLast:(id)a3
{
}

- (double)powerlogEnergyPrevious
{
  return self->_powerlogEnergyPrevious;
}

- (void)setPowerlogEnergyPrevious:(double)a3
{
  self->_powerlogEnergyPrevious = a3;
}

- (double)powerlogEnergyLast
{
  return self->_powerlogEnergyLast;
}

- (void)setPowerlogEnergyLast:(double)a3
{
  self->_powerlogEnergyLast = a3;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  self->_isCharging = a3;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (NSMutableDictionary)mockData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setMockData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockData, 0);
  objc_storeStrong((id *)&self->_powerlogTimestampLast, 0);
  objc_storeStrong((id *)&self->_powerlogTimestampPrevious, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_quickEnergyAccumulatorTimer, 0);
  objc_storeStrong((id *)&self->_powerlogQueryTimer, 0);
  objc_storeStrong((id *)&self->_quickEnergySnapshots, 0);
  objc_storeStrong((id *)&self->_lastPowerlogResponse, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_intervalManager, 0);
}

- (void)reportStartEvent:withInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1A11A5000, v0, v1, "Reporting startEvent activityName=%@, info=%@ from energyMonitor");
}

- (void)reportStopEvent:withInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1A11A5000, v0, v1, "Reporting stopEvent activityName=%@, info=%@ from energyMonitor");
}

void __52__PLDiscretionaryEnergyMonitor_generateEnergyReport__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = *(void **)(a1 + 32);
  id v5 = [a2 timestamp];
  [v4 timeIntervalSinceDate:v5];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3(&dword_1A11A5000, a3, v6, "timedifferential=%f", v7);
}

void __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A11A5000, v0, v1, "No valid response from powerlog, response=%@", v2, v3, v4, v5, v6);
}

void __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "generating energy report after querying powerlog", v2, v3, v4, v5, v6);
}

- (void)createQuickEnergyAccumulatorTimer
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "Creating quickEnergyAccumulator timer", v2, v3, v4, v5, v6);
}

void __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 quickEnergySnapshots];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1A11A5000, a2, v4, "after enqueuing first quickEnergy snapshot, quickEnergySnapshots=%@", v5);
}

void __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "energyDiff=%f not sufficient to enqueue new quick energy snapshot", v2, v3, v4, v5, v6);
}

void __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "Firing open interval timer when switching charging state", v2, v3, v4, v5, v6);
}

void __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_1A11A5000, v0, v1, "quick energy accumulation disabled while charging", v2, v3, v4, v5, v6);
}

void __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A11A5000, a2, a3, "incrementing cpu energy by energy=%f", a5, a6, a7, a8, 0);
}

void __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A11A5000, a2, a3, "incrementing network energy by energy=%f", a5, a6, a7, a8, 0);
}

- (void)setStateForNotification:(int)a1 withState:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A11A5000, a2, OS_LOG_TYPE_ERROR, "notify_set_state failed %d", (uint8_t *)v2, 8u);
}

- (void)setStateForNotification:(int)a1 withState:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A11A5000, a2, OS_LOG_TYPE_ERROR, "notify_register_check failed %d", (uint8_t *)v2, 8u);
}

- (void)updateMockData:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_1A11A5000, v0, v1, "Cannot update mock data unless in debug mode", v2, v3, v4, v5, v6);
}

- (void)logEnergyReport:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "Logging energy report to powerlog ... logEvent=%@", v2, v3, v4, v5, v6);
}

@end