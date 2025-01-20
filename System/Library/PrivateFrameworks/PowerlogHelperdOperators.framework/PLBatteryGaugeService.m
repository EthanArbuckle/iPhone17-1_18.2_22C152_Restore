@interface PLBatteryGaugeService
+ (BOOL)shouldCalculateDisplayCost;
+ (void)load;
- (BOOL)isTestingRunning;
- (NSDate)curQueryTime;
- (NSDate)lastQueryTime;
- (NSMutableArray)trackedProcesses;
- (NSMutableDictionary)applicationResults;
- (NSMutableDictionary)bundleIDandPidMap;
- (NSMutableDictionary)entrykeyCallBackMapping;
- (NSMutableDictionary)entrykeyCallBackOnceMapping;
- (NSMutableDictionary)locationResults;
- (NSMutableDictionary)measurements;
- (NSMutableDictionary)processMonitorResults;
- (NSMutableDictionary)processNetworkResults;
- (NSMutableDictionary)reported;
- (NSMutableDictionary)reportedApplication;
- (NSMutableDictionary)reportedLocation;
- (NSMutableDictionary)reportedProcessMonitor;
- (NSMutableDictionary)reportedProcessNetwork;
- (NSMutableDictionary)requestTime;
- (NSMutableDictionary)responseTime;
- (NSMutableDictionary)results;
- (NSMutableDictionary)returnTime;
- (NSSet)scoringEntities;
- (NSTimer)exitTimer;
- (NSTimer)thermalStateTimer;
- (PLBatteryGaugeService)init;
- (PLDTCostElement)networkingCostElement;
- (PLSemaphore)responseSemaphore;
- (PLXPCResponderOperatorComposition)xpcResponderBatteryGaugeDT;
- (double)computeDisplayCostWithAvgRed:(int)a3 withAvgGreen:(int)a4 withAvgBlue:(int)a5;
- (double)computeGPUCostWithGPUSec:(id)a3;
- (double)computeLocationCostWithWifiCost:(int)a3 withGpsCost:(int)a4 withCellCost:(int)a5 withSkyhookCost:(int)a6;
- (double)computeNetworkingCostWithWifiIn:(int)a3 withWifiOut:(int)a4 withCellIn:(int)a5 withCellOut:(int)a6;
- (double)startTime;
- (double)stopTime;
- (id)DTQueryResponse:(id)a3;
- (id)clearStateRoutine:(id)a3;
- (id)compileSnapshotResponse;
- (id)convertRawUsageToScore:(id)a3;
- (id)costElement;
- (id)extractAndSetProcessIdentifierWithPayload:(id)a3;
- (id)extractAndTranslateProcessIdentifier:(id)a3;
- (id)getObjectInMeasurementsWithPid:(int)a3 withCategory:(id)a4 withKey:(id)a5;
- (id)pauseRoutineWithPayload:(id)a3;
- (id)resumeRoutineWithPayload:(id)a3;
- (id)startRoutineWithPayload:(id)a3;
- (id)stopRoutineWithPayload:(id)a3;
- (int)curQueryCount;
- (int)lastQueryCount;
- (int)matchingPidWithProcessName:(id)a3 withBundleID:(id)a4;
- (void)compileSnapshotResponse;
- (void)dataReceivedFrom:(id)a3;
- (void)initOperatorDependancies;
- (void)initResponseSemaphore;
- (void)listAllRunningPidsWithBuffer:(int *)a3 withSizeOfBuffer:(int)a4;
- (void)parseApplicationResults:(id)a3;
- (void)parseCoalitionResults:(id)a3;
- (void)parseDisplayResults:(id)a3;
- (void)parseLocationResults:(id)a3;
- (void)parseProcessMonitorResults:(id)a3;
- (void)parseProcessNetworkResults:(id)a3;
- (void)parseThermalStateCallback:(id)a3;
- (void)registerNotificationWithAgent:(id)a3 withType:(id)a4 withTableName:(id)a5 withCallBackType:(BOOL)a6 withBlock:(id)a7;
- (void)requestDataFrom:(id)a3 withType:(int)a4;
- (void)resetExitTimer;
- (void)selfExit:(id)a3;
- (void)setApplicationResults:(id)a3;
- (void)setBundleIDandPidMap:(id)a3;
- (void)setCostElement:(id)a3;
- (void)setCurQueryCount:(int)a3;
- (void)setCurQueryTime:(id)a3;
- (void)setEntrykeyCallBackMapping:(id)a3;
- (void)setEntrykeyCallBackOnceMapping:(id)a3;
- (void)setExitTimer:(id)a3;
- (void)setIsTestingRunning:(BOOL)a3;
- (void)setLastActiveStartTimeAndLastSuspendTimeWithPid:(int)a3 withAppState:(int)a4 withCurrentTime:(id)a5;
- (void)setLastQueryCount:(int)a3;
- (void)setLastQueryTime:(id)a3;
- (void)setLocationResults:(id)a3;
- (void)setMeasurements:(id)a3;
- (void)setNetworkingCostElement:(id)a3;
- (void)setObjectInMeasurementsWithObject:(id)a3 withPid:(int)a4 withCategory:(id)a5 withKey:(id)a6;
- (void)setProcessMonitorResults:(id)a3;
- (void)setProcessNetworkResults:(id)a3;
- (void)setReported:(id)a3;
- (void)setReportedApplication:(id)a3;
- (void)setReportedLocation:(id)a3;
- (void)setReportedProcessMonitor:(id)a3;
- (void)setReportedProcessNetwork:(id)a3;
- (void)setRequestTime:(id)a3;
- (void)setResponseSemaphore:(id)a3;
- (void)setResponseTime:(id)a3;
- (void)setResults:(id)a3;
- (void)setReturnTime:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setStopTime:(double)a3;
- (void)setThermalStateTimer:(id)a3;
- (void)setTrackedProcesses:(id)a3;
- (void)setXpcResponderBatteryGaugeDT:(id)a3;
- (void)testGaugeService;
- (void)testGaugeServiceSingleInstance:(id)a3;
- (void)translateProcessIdentifierWithInput:(id)a3;
- (void)triggerAllData;
@end

@implementation PLBatteryGaugeService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryGaugeService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (BOOL)shouldCalculateDisplayCost
{
  if ([MEMORY[0x1E4F92A38] hasCapability:0]) {
    return 1;
  }
  v3 = (void *)MEMORY[0x1E4F92A38];
  return [v3 hasCapability:8];
}

- (void)initResponseSemaphore
{
  v3 = [MEMORY[0x1E4F92A48] sharedSemaphoreForKey:@"response"];
  responseSemaphore = self->_responseSemaphore;
  self->_responseSemaphore = v3;

  v5 = [(PLBatteryGaugeService *)self responseSemaphore];
  [v5 signalInterestByObject:self];

  v6 = [(PLBatteryGaugeService *)self responseSemaphore];
  [v6 signalStartListening];

  id v7 = [(PLBatteryGaugeService *)self responseSemaphore];
  [v7 setTimeout:0.2];
}

- (PLBatteryGaugeService)init
{
  NSMutableDictionary *returnTime;
  uint64_t v36;
  NSMutableDictionary *requestTime;
  uint64_t v38;
  NSMutableDictionary *processMonitorResults;
  uint64_t v40;
  NSMutableDictionary *reportedProcessMonitor;
  uint64_t v42;
  NSMutableDictionary *processNetworkResults;
  uint64_t v44;
  NSMutableDictionary *reportedProcessNetwork;
  uint64_t v46;
  NSMutableDictionary *locationResults;
  uint64_t v48;
  NSMutableDictionary *reportedLocation;
  uint64_t v50;
  NSMutableDictionary *applicationResults;
  uint64_t v52;
  NSMutableDictionary *reportedApplication;
  uint64_t v54;
  NSTimer *thermalStateTimer;
  uint64_t v57;
  objc_super v58;

  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v58.receiver = self;
    v58.super_class = (Class)PLBatteryGaugeService;
    v4 = [(PLOperator *)&v58 init];
    if (v4)
    {
      v5 = objc_opt_new();
      uint64_t v6 = objc_opt_new();
      measurements = v4->_measurements;
      v4->_measurements = (NSMutableDictionary *)v6;

      uint64_t v8 = objc_opt_new();
      bundleIDandPidMap = v4->_bundleIDandPidMap;
      v4->_bundleIDandPidMap = (NSMutableDictionary *)v8;

      v4->_startTime = 0.0;
      v4->_stopTime = 0.0;
      uint64_t v10 = objc_opt_new();
      entrykeyCallBackMapping = v4->_entrykeyCallBackMapping;
      v4->_entrykeyCallBackMapping = (NSMutableDictionary *)v10;

      uint64_t v12 = objc_opt_new();
      entrykeyCallBackOnceMapping = v4->_entrykeyCallBackOnceMapping;
      v4->_entrykeyCallBackOnceMapping = (NSMutableDictionary *)v12;

      uint64_t v14 = objc_opt_new();
      lastQueryTime = v4->_lastQueryTime;
      v4->_lastQueryTime = (NSDate *)v14;

      uint64_t v16 = objc_opt_new();
      curQueryTime = v4->_curQueryTime;
      v4->_curQueryTime = (NSDate *)v16;

      v4->_isTestingRunning = 0;
      id costElement = v4->_costElement;
      v4->_id costElement = 0;

      v4->_lastQueryCount = 0;
      v4->_curQueryCount = 0;
      v19 = [[PLDTCostElement alloc] initWithTime:v5];
      networkingCostElement = v4->_networkingCostElement;
      v4->_networkingCostElement = v19;

      uint64_t v21 = objc_opt_new();
      trackedProcesses = v4->_trackedProcesses;
      v4->_trackedProcesses = (NSMutableArray *)v21;

      uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
      results = v4->_results;
      v4->_results = (NSMutableDictionary *)v23;

      uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
      reported = v4->_reported;
      v4->_reported = (NSMutableDictionary *)v25;

      BOOL v27 = +[PLBatteryGaugeService shouldCalculateDisplayCost];
      id v28 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      if (v27) {
        uint64_t v29 = objc_msgSend(v28, "initWithObjects:", &unk_1F400CF40, &unk_1F400CF58, &unk_1F400CF70, &unk_1F400CF88, &unk_1F400CFA0, &unk_1F400CFB8, &unk_1F400CFD0, &unk_1F400CFE8, 0);
      }
      else {
        uint64_t v29 = objc_msgSend(v28, "initWithObjects:", &unk_1F400CF40, &unk_1F400CF58, &unk_1F400CF70, &unk_1F400CF88, &unk_1F400CFA0, &unk_1F400CFD0, &unk_1F400CFE8, 0, v57);
      }
      scoringEntities = v4->_scoringEntities;
      v4->_scoringEntities = (NSSet *)v29;

      v31 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v4 target:sel_selfExit_ selector:0 userInfo:1 repeats:3600.0];
      objc_storeStrong((id *)&v4->_exitTimer, v31);
      if ([MEMORY[0x1E4F929C0] isClassDebugEnabled:objc_opt_class()])
      {
        uint64_t v32 = objc_opt_new();
        responseTime = v4->_responseTime;
        v4->_responseTime = (NSMutableDictionary *)v32;

        uint64_t v34 = objc_opt_new();
        returnTime = v4->_returnTime;
        v4->_returnTime = (NSMutableDictionary *)v34;

        v36 = objc_opt_new();
        requestTime = v4->_requestTime;
        v4->_requestTime = (NSMutableDictionary *)v36;

        v38 = objc_opt_new();
        processMonitorResults = v4->_processMonitorResults;
        v4->_processMonitorResults = (NSMutableDictionary *)v38;

        v40 = objc_opt_new();
        reportedProcessMonitor = v4->_reportedProcessMonitor;
        v4->_reportedProcessMonitor = (NSMutableDictionary *)v40;

        v42 = objc_opt_new();
        processNetworkResults = v4->_processNetworkResults;
        v4->_processNetworkResults = (NSMutableDictionary *)v42;

        v44 = objc_opt_new();
        reportedProcessNetwork = v4->_reportedProcessNetwork;
        v4->_reportedProcessNetwork = (NSMutableDictionary *)v44;

        v46 = objc_opt_new();
        locationResults = v4->_locationResults;
        v4->_locationResults = (NSMutableDictionary *)v46;

        v48 = objc_opt_new();
        reportedLocation = v4->_reportedLocation;
        v4->_reportedLocation = (NSMutableDictionary *)v48;

        v50 = objc_opt_new();
        applicationResults = v4->_applicationResults;
        v4->_applicationResults = (NSMutableDictionary *)v50;

        v52 = objc_opt_new();
        reportedApplication = v4->_reportedApplication;
        v4->_reportedApplication = (NSMutableDictionary *)v52;
      }
      v54 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v4 target:sel_parseThermalStateCallback_ selector:0 userInfo:1 repeats:1.0];
      thermalStateTimer = v4->_thermalStateTimer;
      v4->_thermalStateTimer = (NSTimer *)v54;
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)resetExitTimer
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_2(&dword_1E4220000, v0, v1, "!!! %s/%d: reset exit timer!", v2, v3, v4, v5, 2u);
}

- (void)selfExit:(id)a3
{
  uint64_t v3 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService selfExit:]();
  }

  uint64_t v4 = [MEMORY[0x1E4F929F8] sharedManager];
  [v4 signalServiceInactive:1];
}

- (void)initOperatorDependancies
{
  uint64_t v3 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_INFO, "Initializing Battery Gauge Service...", buf, 2u);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke;
  v25[3] = &unk_1E6E47958;
  v25[4] = self;
  uint64_t v5 = (void *)[v4 initWithOperator:self withRegistration:&unk_1F400FB28 withBlock:v25];
  [(PLBatteryGaugeService *)self setXpcResponderBatteryGaugeDT:v5];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_68;
  v24[3] = &unk_1E6E47908;
  v24[4] = self;
  uint64_t v6 = (void *)MEMORY[0x1E4E7F1C0](v24);
  id v7 = +[PLOperator className];
  uint64_t v8 = *MEMORY[0x1E4F92D38];
  [(PLBatteryGaugeService *)self registerNotificationWithAgent:v7 withType:*MEMORY[0x1E4F92D38] withTableName:@"ProcessMonitorInterval" withCallBackType:0 withBlock:v6];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_2;
  v23[3] = &unk_1E6E47908;
  v23[4] = self;
  v9 = (void *)MEMORY[0x1E4E7F1C0](v23);
  uint64_t v10 = +[PLOperator className];
  [(PLBatteryGaugeService *)self registerNotificationWithAgent:v10 withType:v8 withTableName:@"UsageDiff" withCallBackType:0 withBlock:v9];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_3;
  v22[3] = &unk_1E6E47908;
  v22[4] = self;
  v11 = (void *)MEMORY[0x1E4E7F1C0](v22);
  uint64_t v12 = +[PLOperator className];
  [(PLBatteryGaugeService *)self registerNotificationWithAgent:v12 withType:*MEMORY[0x1E4F92D48] withTableName:@"ClientStatus" withCallBackType:0 withBlock:v11];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_4;
  v21[3] = &unk_1E6E47908;
  v21[4] = self;
  v13 = (void *)MEMORY[0x1E4E7F1C0](v21);
  uint64_t v14 = +[PLOperator className];
  [(PLBatteryGaugeService *)self registerNotificationWithAgent:v14 withType:*MEMORY[0x1E4F92D30] withTableName:@"Application" withCallBackType:1 withBlock:v13];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_5;
  v20[3] = &unk_1E6E47908;
  v20[4] = self;
  v15 = (void *)MEMORY[0x1E4E7F1C0](v20);
  uint64_t v16 = +[PLOperator className];
  [(PLBatteryGaugeService *)self registerNotificationWithAgent:v16 withType:v8 withTableName:@"CoalitionInterval" withCallBackType:0 withBlock:v15];

  if (+[PLBatteryGaugeService shouldCalculateDisplayCost])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_6;
    v19[3] = &unk_1E6E47908;
    v19[4] = self;
    v17 = (void *)MEMORY[0x1E4E7F1C0](v19);
    v18 = +[PLOperator className];
    [(PLBatteryGaugeService *)self registerNotificationWithAgent:v18 withType:*MEMORY[0x1E4F92D28] withTableName:@"APLStats" withCallBackType:0 withBlock:v17];
  }
}

id __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_cold_2();
  }

  uint64_t v8 = [*(id *)(a1 + 32) DTQueryResponse:v6];
  v9 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_cold_1();
  }

  return v8;
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_68(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) parseProcessMonitorResults:a2];
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) parseProcessNetworkResults:a2];
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) parseLocationResults:a2];
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) parseApplicationResults:a2];
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) parseCoalitionResults:a2];
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) parseDisplayResults:a2];
}

- (void)registerNotificationWithAgent:(id)a3 withType:(id)a4 withTableName:(id)a5 withCallBackType:(BOOL)a6 withBlock:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  v15 = [NSClassFromString((NSString *)a3) entryKeyForType:v14 andName:v13];

  id v16 = objc_alloc(MEMORY[0x1E4F929E8]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __105__PLBatteryGaugeService_registerNotificationWithAgent_withType_withTableName_withCallBackType_withBlock___block_invoke;
  v21[3] = &unk_1E6E49450;
  v21[4] = self;
  id v17 = v15;
  id v22 = v17;
  id v23 = v12;
  id v18 = v12;
  v19 = (void *)[v16 initWithOperator:self forEntryKey:v17 withBlock:v21];
  if (v7) {
    [(PLBatteryGaugeService *)self entrykeyCallBackOnceMapping];
  }
  else {
  v20 = [(PLBatteryGaugeService *)self entrykeyCallBackMapping];
  }
  [v20 setObject:v19 forKeyedSubscript:v17];
}

void __105__PLBatteryGaugeService_registerNotificationWithAgent_withType_withTableName_withCallBackType_withBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __105__PLBatteryGaugeService_registerNotificationWithAgent_withType_withTableName_withCallBackType_withBlock___block_invoke_2;
  v26 = &__block_descriptor_40_e5_v8__0lu32l8;
  uint64_t v27 = v10;
  if (kPLGPUTime_block_invoke_defaultOnce != -1) {
    dispatch_once(&kPLGPUTime_block_invoke_defaultOnce, &block);
  }
  if (kPLGPUTime_block_invoke_classDebugEnabled)
  {
    [*(id *)(a1 + 32) dataReceivedFrom:v8];
    v11 = [*(id *)(a1 + 32) results];
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:*(void *)(a1 + 40)];
    id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
    [v11 setObject:v12 forKey:v13];

    id v14 = [*(id *)(a1 + 32) reported];
    [v14 setObject:v7 forKey:*(void *)(a1 + 40)];

    v15 = NSString;
    id v16 = [*(id *)(*(void *)(a1 + 32) + 192) objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v17 = [v15 stringWithFormat:@"reportedApplication=%@", v16, block, v24, v25, v26, v27];

    id v18 = (void *)MEMORY[0x1E4F929B8];
    v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryGaugeService.m"];
    v20 = [v19 lastPathComponent];
    uint64_t v21 = [NSString stringWithUTF8String:"-[PLBatteryGaugeService registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:]_block_invoke"];
    [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:325];

    id v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __105__PLBatteryGaugeService_registerNotificationWithAgent_withType_withTableName_withCallBackType_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLGPUTime_block_invoke_classDebugEnabled = result;
  return result;
}

- (id)getObjectInMeasurementsWithPid:(int)a3 withCategory:(id)a4 withKey:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(PLBatteryGaugeService *)self measurements];
  v11 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
  id v12 = [v10 objectForKeyedSubscript:v11];
  id v13 = [v12 objectForKeyedSubscript:v9];

  id v14 = [v13 objectForKeyedSubscript:v8];

  return v14;
}

- (void)setObjectInMeasurementsWithObject:(id)a3 withPid:(int)a4 withCategory:(id)a5 withKey:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v16 = [(PLBatteryGaugeService *)self measurements];
  id v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
  id v14 = [v16 objectForKeyedSubscript:v13];
  v15 = [v14 objectForKeyedSubscript:v11];

  [v15 setObject:v12 forKeyedSubscript:v10];
}

- (void)parseProcessMonitorResults:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKey:@"entry"];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = [(PLBatteryGaugeService *)self trackedProcesses];
  uint64_t v5 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  v41 = v4;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v45;
    do
    {
      uint64_t v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * v9);
        uint64_t v7 = [v4 objectsForSubKey:v11 ofSubKeyType:@"PID"];

        if ([v7 count])
        {
          id v12 = [v7 objectAtIndexedSubscript:0];
          [v12 doubleValue];
          double v14 = v13 / 1000.0;

          v15 = [(PLBatteryGaugeService *)self curQueryTime];
          id v16 = [(PLBatteryGaugeService *)self lastQueryTime];
          [v15 timeIntervalSinceDate:v16];
          double v18 = v17;

          if (v18 > 0.0) {
            double v14 = fmin(v14 / v18 * 1000.0 * 0.5, 1000.0);
          }
          v19 = [(PLBatteryGaugeService *)self measurements];
          v20 = [v19 objectForKeyedSubscript:v11];
          uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
          [v20 setObject:v21 forKey:&unk_1F400CF40];
        }
        else
        {
          v19 = [(PLBatteryGaugeService *)self measurements];
          v20 = [v19 objectForKeyedSubscript:v11];
          [v20 setObject:&unk_1F400D018 forKey:&unk_1F400CF40];
        }

        id v22 = PLLogBatteryGaugeService();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = [(PLBatteryGaugeService *)self measurements];
          uint64_t v24 = [v23 objectForKeyedSubscript:v11];
          uint64_t v25 = [v24 objectForKeyedSubscript:&unk_1F400CF40];
          *(_DWORD *)buf = 138412546;
          uint64_t v49 = v11;
          __int16 v50 = 2112;
          v51 = v25;
          _os_log_impl(&dword_1E4220000, v22, OS_LOG_TYPE_INFO, "ProcessMonitor parsing for PID %@: CPU cost = %@", buf, 0x16u);

          id v4 = v41;
        }

        ++v9;
        id v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v6);
  }
  uint64_t v26 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PLBatteryGaugeService_parseProcessMonitorResults___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v26;
  if (parseProcessMonitorResults__defaultOnce != -1) {
    dispatch_once(&parseProcessMonitorResults__defaultOnce, block);
  }
  if (parseProcessMonitorResults__classDebugEnabled)
  {
    uint64_t v27 = NSString;
    id v28 = [(PLBatteryGaugeService *)self measurements];
    uint64_t v29 = [v27 stringWithFormat:@"!!! %s/%d: measurements=%@", "-[PLBatteryGaugeService parseProcessMonitorResults:]", 390, v28];

    v30 = (void *)MEMORY[0x1E4F929B8];
    v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryGaugeService.m"];
    uint64_t v32 = [v31 lastPathComponent];
    v33 = [NSString stringWithUTF8String:"-[PLBatteryGaugeService parseProcessMonitorResults:]"];
    [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:390];

    uint64_t v34 = PLLogCommon();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }

    v35 = [NSString stringWithFormat:@"!!! %s/%d: processMonitorEntry=%@", "-[PLBatteryGaugeService parseProcessMonitorResults:]", 391, v41];
    v36 = (void *)MEMORY[0x1E4F929B8];
    v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryGaugeService.m"];
    v38 = [v37 lastPathComponent];
    v39 = [NSString stringWithUTF8String:"-[PLBatteryGaugeService parseProcessMonitorResults:]"];
    [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:391];

    v40 = PLLogCommon();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }

    id v4 = v41;
  }
}

uint64_t __52__PLBatteryGaugeService_parseProcessMonitorResults___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  parseProcessMonitorResults__classDebugEnabled = result;
  return result;
}

- (void)parseProcessNetworkResults:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKey:@"entry"];
  uint64_t v5 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"BundleName"];
  uint64_t v7 = [v5 objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:@"WifiIn"];
    uint64_t v9 = [v8 intValue];

    id v10 = [v4 objectForKeyedSubscript:@"WifiOut"];
    uint64_t v11 = [v10 intValue];

    id v12 = [v4 objectForKeyedSubscript:@"CellIn"];
    uint64_t v13 = [v12 intValue];

    double v14 = [v4 objectForKeyedSubscript:@"CellOut"];
    uint64_t v15 = [v14 intValue];

    id v16 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138413570;
      uint64_t v27 = v4;
      __int16 v28 = 1024;
      *(_DWORD *)uint64_t v29 = v9;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v11;
      __int16 v30 = 1024;
      int v31 = v13;
      __int16 v32 = 1024;
      int v33 = v15;
      __int16 v34 = 2112;
      v35 = v7;
      _os_log_debug_impl(&dword_1E4220000, v16, OS_LOG_TYPE_DEBUG, "!!! processNetworkEntry=%@, wifiIn=%d, wifiOut=%d, cellIn=%d, cellOut=%d, pid=%@", (uint8_t *)&v26, 0x2Eu);
    }

    double v17 = [(PLBatteryGaugeService *)self measurements];
    double v18 = [v17 objectForKeyedSubscript:v7];
    v19 = (void *)MEMORY[0x1E4F28ED0];
    [(PLBatteryGaugeService *)self computeNetworkingCostWithWifiIn:v9 withWifiOut:v11 withCellIn:v13 withCellOut:v15];
    v20 = objc_msgSend(v19, "numberWithDouble:");
    [v18 setObject:v20 forKey:&unk_1F400CF58];

    uint64_t v21 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [(PLBatteryGaugeService *)self measurements];
      id v23 = [v22 objectForKeyedSubscript:v7];
      uint64_t v24 = [v23 objectForKeyedSubscript:&unk_1F400CF58];
      int v26 = 138412546;
      uint64_t v27 = v7;
      __int16 v28 = 2112;
      *(void *)uint64_t v29 = v24;
      _os_log_impl(&dword_1E4220000, v21, OS_LOG_TYPE_INFO, "ProcessNetwork parsing for PID %@: network cost = %@", (uint8_t *)&v26, 0x16u);
    }
  }
  uint64_t v25 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService parseProcessNetworkResults:](v4, self);
  }
}

- (void)parseLocationResults:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35 = [v4 objectForKey:@"entry"];
  uint64_t v5 = [v35 objectForKey:@"BundleId"];
  if (!v5
    || ([MEMORY[0x1E4F1CA98] null],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    int v33 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryGaugeService parseLocationResults:]();
    }
  }
  else
  {
    id v34 = v4;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v7 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
    uint64_t v8 = [v7 allKeys];

    id obj = v8;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v47 count:16];
    id v10 = v35;
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          if ([v5 isEqualToString:v14])
          {
            uint64_t v15 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
            id v16 = [v15 objectForKeyedSubscript:v14];

            double v17 = [v10 objectForKey:@"timestampEnd"];
            if (v17)
            {

              goto LABEL_11;
            }
            uint64_t v21 = [v10 objectForKey:@"LocationDesiredAccuracy"];

            if (v21)
            {
              id v22 = PLLogBatteryGaugeService();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                __int16 v32 = [(PLBatteryGaugeService *)self measurements];
                *(_DWORD *)buf = 136315906;
                v42 = "-[PLBatteryGaugeService parseLocationResults:]";
                __int16 v43 = 1024;
                *(_DWORD *)long long v44 = 439;
                *(_WORD *)&v44[4] = 2112;
                *(void *)&v44[6] = v5;
                __int16 v45 = 2112;
                long long v46 = v32;
                _os_log_debug_impl(&dword_1E4220000, v22, OS_LOG_TYPE_DEBUG, "!!! %s/%d: location start signal; bundleId=%@, measuerment=%@",
                  buf,
                  0x26u);
              }
              id v23 = [(PLBatteryGaugeService *)self measurements];
              uint64_t v24 = [v23 objectForKeyedSubscript:v16];
              [v24 setObject:MEMORY[0x1E4F1CC38] forKey:@"Ongoing Location"];

              v19 = [(PLBatteryGaugeService *)self measurements];
              v20 = [v19 objectForKeyedSubscript:v16];
              uint64_t v25 = (void *)MEMORY[0x1E4F28ED0];
              [(PLBatteryGaugeService *)self computeLocationCostWithWifiCost:0 withGpsCost:1 withCellCost:0 withSkyhookCost:0];
              int v26 = objc_msgSend(v25, "numberWithDouble:");
              [v20 setObject:v26 forKey:&unk_1F400CF70];
            }
            else
            {
LABEL_11:
              double v18 = PLLogBatteryGaugeService();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                int v31 = [(PLBatteryGaugeService *)self measurements];
                *(_DWORD *)buf = 136315906;
                v42 = "-[PLBatteryGaugeService parseLocationResults:]";
                __int16 v43 = 1024;
                *(_DWORD *)long long v44 = 433;
                *(_WORD *)&v44[4] = 2112;
                *(void *)&v44[6] = v5;
                __int16 v45 = 2112;
                long long v46 = v31;
                _os_log_debug_impl(&dword_1E4220000, v18, OS_LOG_TYPE_DEBUG, "!!! %s/%d: location terminate signal; bundleId=%@, measuerment=%@",
                  buf,
                  0x26u);
              }
              v19 = [(PLBatteryGaugeService *)self measurements];
              v20 = [v19 objectForKeyedSubscript:v16];
              [v20 setObject:MEMORY[0x1E4F1CC28] forKey:@"Ongoing Location"];
            }

            uint64_t v27 = PLLogBatteryGaugeService();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              __int16 v28 = [(PLBatteryGaugeService *)self measurements];
              uint64_t v29 = [v28 objectForKeyedSubscript:v16];
              __int16 v30 = [v29 objectForKeyedSubscript:&unk_1F400CF70];
              *(_DWORD *)buf = 138412546;
              v42 = v16;
              __int16 v43 = 2112;
              *(void *)long long v44 = v30;
              _os_log_impl(&dword_1E4220000, v27, OS_LOG_TYPE_INFO, "Location parsing for PID %@: location cost = %@", buf, 0x16u);

              id v10 = v35;
            }

            continue;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v11);
    }

    int v33 = PLLogBatteryGaugeService();
    id v4 = v34;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryGaugeService parseLocationResults:]();
    }
  }
}

- (void)parseApplicationResults:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKey:@"entry"];
  uint64_t v5 = [v4 keys];
  uint64_t v6 = [v4 objectForKey:@"pid"];
  uint64_t v7 = [(PLBatteryGaugeService *)self measurements];
  uint64_t v8 = [v7 objectForKey:v6];

  if (v8)
  {
    uint64_t v9 = [v4 objectForKey:@"State"];
    uint64_t v10 = [v9 intValue];

    uint64_t v11 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryGaugeService parseApplicationResults:](v10, v11);
    }

    uint64_t v12 = [(PLBatteryGaugeService *)self measurements];
    uint64_t v13 = [v12 objectForKeyedSubscript:v6];
    uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
    [v13 setObject:v14 forKey:&unk_1F400CF88];

    uint64_t v15 = [v6 intValue];
    id v16 = [(PLBatteryGaugeService *)self curQueryTime];
    [(PLBatteryGaugeService *)self setLastActiveStartTimeAndLastSuspendTimeWithPid:v15 withAppState:v10 withCurrentTime:v16];

    double v17 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = [(PLBatteryGaugeService *)self measurements];
      v19 = [v18 objectForKeyedSubscript:v6];
      v20 = [v19 objectForKeyedSubscript:&unk_1F400CF88];
      int v23 = 138412546;
      uint64_t v24 = (const char *)v6;
      __int16 v25 = 2112;
      *(void *)int v26 = v20;
      _os_log_impl(&dword_1E4220000, v17, OS_LOG_TYPE_INFO, "Application parsing for PID %@: app state = %@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    double v17 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryGaugeService parseApplicationResults:]();
    }
  }

  uint64_t v21 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [(PLBatteryGaugeService *)self measurements];
    int v23 = 136316418;
    uint64_t v24 = "-[PLBatteryGaugeService parseApplicationResults:]";
    __int16 v25 = 1024;
    *(_DWORD *)int v26 = 489;
    *(_WORD *)&v26[4] = 2112;
    *(void *)&v26[6] = v6;
    __int16 v27 = 2112;
    __int16 v28 = v22;
    __int16 v29 = 2112;
    __int16 v30 = v4;
    __int16 v31 = 2112;
    __int16 v32 = v5;
    _os_log_debug_impl(&dword_1E4220000, v21, OS_LOG_TYPE_DEBUG, "!!! %s/%d: applicationPid=%@, self.measurements=%@, applicationEntry=%@, keys=%@", (uint8_t *)&v23, 0x3Au);
  }
}

- (void)parseCoalitionResults:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"entry"];
  uint64_t v6 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService parseCoalitionResults:]();
  }

  uint64_t v7 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
  uint64_t v8 = [v7 allKeys];

  if ([v8 count])
  {
    uint64_t v9 = [v5 objectForKey:@"BundleId"];
    if (!v9
      || ([MEMORY[0x1E4F1CA98] null],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9 == v10))
    {
      v20 = PLLogBatteryGaugeService();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
        *(_DWORD *)buf = 136316162;
        __int16 v31 = "-[PLBatteryGaugeService parseCoalitionResults:]";
        __int16 v32 = 1024;
        *(_DWORD *)uint64_t v33 = 522;
        *(_WORD *)&v33[4] = 2112;
        *(void *)&v33[6] = v9;
        __int16 v34 = 2112;
        v35 = v21;
        __int16 v36 = 2112;
        id v37 = v4;
        _os_log_debug_impl(&dword_1E4220000, v20, OS_LOG_TYPE_DEBUG, "!!! %s/%d: bundleId=%@, bundleIDandPidMap=%@, userInfo=%@", buf, 0x30u);
      }
      goto LABEL_16;
    }
    if ([v8 containsObject:v9])
    {
      __int16 v28 = [(PLBatteryGaugeService *)self measurements];
      uint64_t v11 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
      uint64_t v12 = [v11 objectForKeyedSubscript:v9];
      uint64_t v13 = [v28 objectForKeyedSubscript:v12];
      uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v15 = [v5 objectForKey:@"gpu_time"];
      [(PLBatteryGaugeService *)self computeGPUCostWithGPUSec:v15];
      id v16 = objc_msgSend(v14, "numberWithDouble:");
      [v13 setObject:v16 forKey:&unk_1F400CFA0];

      double v17 = PLLogBatteryGaugeService();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
      double v18 = [(PLBatteryGaugeService *)self measurements];
      *(_DWORD *)buf = 136316162;
      __int16 v31 = "-[PLBatteryGaugeService parseCoalitionResults:]";
      __int16 v32 = 1024;
      *(_DWORD *)uint64_t v33 = 508;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = v9;
      __int16 v34 = 2112;
      v35 = v18;
      __int16 v36 = 2112;
      id v37 = v4;
      v19 = "!!! %s/%d: bundleId=%@, measurements=%@, userInfo=%@";
    }
    else
    {
      double v17 = PLLogBatteryGaugeService();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
      double v18 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
      *(_DWORD *)buf = 136316162;
      __int16 v31 = "-[PLBatteryGaugeService parseCoalitionResults:]";
      __int16 v32 = 1024;
      *(_DWORD *)uint64_t v33 = 514;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = v9;
      __int16 v34 = 2112;
      v35 = v18;
      __int16 v36 = 2112;
      id v37 = v4;
      v19 = "!!! %s/%d: bundleId=%@, bundleIDandPidMap=%@, userInfo=%@";
    }
    _os_log_debug_impl(&dword_1E4220000, v17, OS_LOG_TYPE_DEBUG, v19, buf, 0x30u);

LABEL_14:
    v20 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v29 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
      id v22 = [v29 objectForKeyedSubscript:v9];
      __int16 v27 = [(PLBatteryGaugeService *)self measurements];
      int v23 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
      uint64_t v24 = [v23 objectForKeyedSubscript:v9];
      __int16 v25 = [v27 objectForKeyedSubscript:v24];
      int v26 = [v25 objectForKeyedSubscript:&unk_1F400CFA0];
      *(_DWORD *)buf = 138412546;
      __int16 v31 = v22;
      __int16 v32 = 2112;
      *(void *)uint64_t v33 = v26;
      _os_log_impl(&dword_1E4220000, v20, OS_LOG_TYPE_INFO, "Coalition parsing for PID %@: GPU cost = %@", buf, 0x16u);
    }
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v9 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService parseCoalitionResults:](self);
  }
LABEL_17:
}

- (void)parseThermalStateCallback:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  if (parseThermalStateCallback__onceToken != -1) {
    dispatch_once(&parseThermalStateCallback__onceToken, &__block_literal_global_132);
  }
  uint64_t state64 = 0;
  notify_get_state(parseThermalStateCallback__thermalStateToken, &state64);
  uint64_t v4 = state64;
  if (state64 >= 0x1E) {
    uint64_t v4 = 30;
  }
  uint64_t state64 = v4;
  uint64_t v5 = [(id)parseThermalStateCallback__cltmDefaults stringForKey:@"thermalSimulationMode"];
  __int16 v28 = v5;
  if (v5)
  {
    uint64_t v6 = v5;
    if (objc_msgSend(v5, "isEqualToString:", @"nominal", v5, v30))
    {
      uint64_t v7 = 0;
    }
    else if ([v6 isEqualToString:@"light"])
    {
      uint64_t v7 = 10;
    }
    else if ([v6 isEqualToString:@"moderate"])
    {
      uint64_t v7 = 20;
    }
    else if ([v6 isEqualToString:@"heavy"])
    {
      uint64_t v7 = 30;
    }
    else
    {
      uint64_t v7 = -10;
    }
  }
  else
  {
    uint64_t v7 = -10;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [(PLBatteryGaugeService *)self trackedProcesses];
  uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v35)
  {
    uint64_t v8 = *(void *)v37;
    unint64_t v9 = 0x1E4F28000uLL;
    uint64_t v10 = &unk_1F400CFD0;
    uint64_t v31 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v13 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v14 = [v13 objectForKeyedSubscript:v12];
        uint64_t v15 = [*(id *)(v9 + 3792) numberWithUnsignedLongLong:state64];
        [v14 setObject:v15 forKey:v10];

        id v16 = [(PLBatteryGaugeService *)self measurements];
        double v17 = [v16 objectForKeyedSubscript:v12];
        double v18 = [*(id *)(v9 + 3792) numberWithLongLong:v7];
        [v17 setObject:v18 forKey:&unk_1F400CFE8];

        v19 = PLLogBatteryGaugeService();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          __int16 v34 = [(PLBatteryGaugeService *)self measurements];
          uint64_t v33 = [v34 objectForKeyedSubscript:v12];
          v20 = [v33 objectForKeyedSubscript:v10];
          uint64_t v21 = [(PLBatteryGaugeService *)self measurements];
          [v21 objectForKeyedSubscript:v12];
          int v23 = v22 = v10;
          [v23 objectForKeyedSubscript:&unk_1F400CFE8];
          uint64_t v24 = self;
          v26 = uint64_t v25 = v7;
          *(_DWORD *)buf = 138412802;
          uint64_t v42 = v12;
          __int16 v43 = 2112;
          long long v44 = v20;
          __int16 v45 = 2112;
          long long v46 = v26;
          _os_log_impl(&dword_1E4220000, v19, OS_LOG_TYPE_INFO, "Coalition parsing for PID %@: current thermal state = %@, induced thermal state = %@", buf, 0x20u);

          uint64_t v7 = v25;
          self = v24;

          uint64_t v10 = v22;
          unint64_t v9 = 0x1E4F28000;

          uint64_t v8 = v31;
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v35);
  }

  __int16 v27 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    [(PLBatteryGaugeService *)(uint64_t *)&state64 parseThermalStateCallback:v27];
  }
}

uint64_t __51__PLBatteryGaugeService_parseThermalStateCallback___block_invoke()
{
  notify_register_check((const char *)*MEMORY[0x1E4F14918], &parseThermalStateCallback__thermalStateToken);
  parseThermalStateCallback__cltmDefaults = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.cltm"];
  return MEMORY[0x1F41817F8]();
}

- (void)parseDisplayResults:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectForKey:@"entry"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"AvgRed"];
  unsigned int v34 = [v5 intValue];

  uint64_t v6 = [v4 objectForKeyedSubscript:@"AvgGreen"];
  unsigned int v33 = [v6 intValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"AvgBlue"];
  unsigned int v32 = [v7 intValue];

  uint64_t v8 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v41 = v4;
    __int16 v42 = 1024;
    *(_DWORD *)__int16 v43 = v34;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v33;
    __int16 v44 = 1024;
    unsigned int v45 = v32;
    _os_log_debug_impl(&dword_1E4220000, v8, OS_LOG_TYPE_DEBUG, "!!! displayEntry=%@, avgRed=%d, avgGreen=%d, avgBlue=%d", buf, 0x1Eu);
  }
  __int16 v29 = v4;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [(PLBatteryGaugeService *)self trackedProcesses];
  uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    unint64_t v12 = 0x1E4F28000uLL;
    uint64_t v13 = &unk_1F400CFB8;
    id v30 = self;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v16 = [(PLBatteryGaugeService *)self measurements];
        double v17 = [v16 objectForKeyedSubscript:v15];
        double v18 = *(void **)(v12 + 3792);
        [(PLBatteryGaugeService *)self computeDisplayCostWithAvgRed:v34 withAvgGreen:v33 withAvgBlue:v32];
        v19 = objc_msgSend(v18, "numberWithDouble:");
        [v17 setObject:v19 forKey:v13];

        v20 = PLLogBatteryGaugeService();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = [(PLBatteryGaugeService *)self measurements];
          id v22 = [v21 objectForKeyedSubscript:v15];
          [v22 objectForKeyedSubscript:v13];
          uint64_t v23 = v10;
          uint64_t v24 = v11;
          uint64_t v25 = v13;
          __int16 v27 = v26 = v12;
          *(_DWORD *)buf = 138412546;
          v41 = v15;
          __int16 v42 = 2112;
          *(void *)__int16 v43 = v27;
          _os_log_impl(&dword_1E4220000, v20, OS_LOG_TYPE_INFO, "Display parsing for PID %@: display cost = %@", buf, 0x16u);

          unint64_t v12 = v26;
          uint64_t v13 = v25;
          uint64_t v11 = v24;
          uint64_t v10 = v23;
          self = v30;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v10);
  }

  __int16 v28 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService parseDisplayResults:](v29, self);
  }
}

- (void)setLastActiveStartTimeAndLastSuspendTimeWithPid:(int)a3 withAppState:(int)a4 withCurrentTime:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v25 = a5;
  uint64_t v8 = [(PLBatteryGaugeService *)self measurements];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"lastActiveStart"];

  unint64_t v12 = [(PLBatteryGaugeService *)self measurements];
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"lastSuspendStart"];

  if (a4 == 8 || a4 == 4)
  {
    id v16 = [MEMORY[0x1E4F1C9C8] distantPast];

    if (v11 == v16
      || ([MEMORY[0x1E4F1C9C8] distantFuture],
          double v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          v15 != v17)
      && v15 > v11)
    {
      double v18 = [(PLBatteryGaugeService *)self measurements];
      v19 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
      v20 = [v18 objectForKeyedSubscript:v19];
      uint64_t v21 = v20;
      id v22 = @"lastActiveStart";
LABEL_11:
      [v20 setObject:v25 forKeyedSubscript:v22];
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] distantFuture];

    if (v15 == v23
      || ([MEMORY[0x1E4F1C9C8] distantPast],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          v11 != v24)
      && v15 < v11)
    {
      double v18 = [(PLBatteryGaugeService *)self measurements];
      v19 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
      v20 = [v18 objectForKeyedSubscript:v19];
      uint64_t v21 = v20;
      id v22 = @"lastSuspendStart";
      goto LABEL_11;
    }
  }
}

- (double)computeNetworkingCostWithWifiIn:(int)a3 withWifiOut:(int)a4 withCellIn:(int)a5 withCellOut:(int)a6
{
  double v6 = (double)(a4 + a3 + a5 + a6);
  uint64_t v7 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService computeNetworkingCostWithWifiIn:withWifiOut:withCellIn:withCellOut:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  return v6;
}

- (double)computeLocationCostWithWifiCost:(int)a3 withGpsCost:(int)a4 withCellCost:(int)a5 withSkyhookCost:(int)a6
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
  uint64_t v13 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService computeLocationCostWithWifiCost:withGpsCost:withCellCost:withSkyhookCost:]();
  }

  return v12;
}

- (double)computeGPUCostWithGPUSec:(id)a3
{
  [a3 doubleValue];
  double v5 = v4;
  int v6 = [(PLBatteryGaugeService *)self curQueryTime];
  int v7 = [(PLBatteryGaugeService *)self lastQueryTime];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 > 0.0) {
    double v5 = fmin(v5 / v9 * 1000.0 * 0.5, 1000.0);
  }
  int v10 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService computeGPUCostWithGPUSec:]();
  }

  return v5;
}

- (double)computeDisplayCostWithAvgRed:(int)a3 withAvgGreen:(int)a4 withAvgBlue:(int)a5
{
  double v5 = ((double)a4 / 255.0 * 0.25 + (double)a3 / 255.0 * 0.31 + (double)a5 * 0.44 / 255.0) * 600.0;
  int v6 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService computeNetworkingCostWithWifiIn:withWifiOut:withCellIn:withCellOut:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return v5;
}

- (id)convertRawUsageToScore:(id)a3
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id obj = [(PLBatteryGaugeService *)self trackedProcesses];
  uint64_t v111 = [obj countByEnumeratingWithState:&v128 objects:v137 count:16];
  if (v111)
  {
    uint64_t v109 = *(void *)v129;
    v110 = v4;
    v118 = self;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v129 != v109) {
          objc_enumerationMutation(obj);
        }
        int v6 = *(void **)(*((void *)&v128 + 1) + 8 * v5);
        uint64_t v7 = objc_opt_new();
        v116 = v6;
        uint64_t v8 = [v4 objectForKeyedSubscript:v6];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"usage_data"];

        uint64_t v10 = [v9 objectForKeyedSubscript:&unk_1F400CF88];
        uint64_t v11 = [v10 objectForKeyedSubscript:@"cost"];
        unsigned int v117 = [v11 intValue];

        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v113 = [(PLBatteryGaugeService *)self scoringEntities];
        uint64_t v122 = [v113 countByEnumeratingWithState:&v124 objects:v136 count:16];
        uint64_t v112 = v5;
        if (!v122)
        {
          double v12 = 0.0;
          double v13 = 0.0;
          goto LABEL_54;
        }
        uint64_t v121 = *(void *)v125;
        double v12 = 0.0;
        double v13 = 0.0;
        v114 = v9;
        v115 = v7;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v125 != v121) {
              objc_enumerationMutation(v113);
            }
            uint64_t v15 = *(void **)(*((void *)&v124 + 1) + 8 * v14);
            id v16 = [v9 objectForKey:v15];

            if (!v16) {
              goto LABEL_41;
            }
            uint64_t v123 = v14;
            if ([v15 shortValue] == 5)
            {
              double v17 = PLLogBatteryGaugeService();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                v97 = [v9 objectForKeyedSubscript:v15];
                [v97 objectForKeyedSubscript:@"cost"];
                v99 = v98 = v15;
                [v99 doubleValue];
                *(_DWORD *)buf = 134217984;
                uint64_t v135 = v100;
                _os_log_debug_impl(&dword_1E4220000, v17, OS_LOG_TYPE_DEBUG, "Cost %f", buf, 0xCu);

                uint64_t v15 = v98;
              }

              double v18 = [(PLBatteryGaugeService *)self costElement];

              if (!v18)
              {
                v19 = +[PLDTCostElement getCostElementInstance];
                [(PLBatteryGaugeService *)self setCostElement:v19];
              }
              v20 = [(PLBatteryGaugeService *)self costElement];
              uint64_t v21 = [v9 objectForKeyedSubscript:v15];
              [v21 objectForKeyedSubscript:@"cost"];
              id v22 = v119 = v15;
              [v22 doubleValue];
              double v24 = v23;
              id v25 = [(PLBatteryGaugeService *)self lastQueryTime];
              objc_msgSend(v20, "addNetworkingEvent:atTime:withPid:withAppState:withQueryCount:", v25, objc_msgSend(v116, "intValue"), v117, -[PLBatteryGaugeService lastQueryCount](self, "lastQueryCount"), v24);

              unint64_t v26 = [(PLBatteryGaugeService *)self costElement];
              __int16 v27 = [(PLBatteryGaugeService *)self curQueryTime];
              uint64_t v28 = [v116 intValue];
              __int16 v29 = [(PLBatteryGaugeService *)self measurements];
              id v30 = [v29 objectForKeyedSubscript:v116];
              uint64_t v31 = [v30 objectForKeyedSubscript:@"lastActiveStart"];
              unsigned int v32 = [(PLBatteryGaugeService *)self measurements];
              unsigned int v33 = [v32 objectForKeyedSubscript:v116];
              unsigned int v34 = [v33 objectForKeyedSubscript:@"lastSuspendStart"];
              long long v35 = objc_msgSend(v26, "getNetworkingCostUptoTime:withPid:withLastActiveStart:withLastSuspendStart:withAppState:withQueryCount:", v27, v28, v31, v34, v117, -[PLBatteryGaugeService curQueryCount](v118, "curQueryCount"));
              uint64_t v7 = v115;
              [v115 setObject:v35 forKeyedSubscript:v119];

              long long v36 = v26;
              self = v118;

              uint64_t v9 = v114;
              uint64_t v15 = v119;
            }
            else
            {
              if ([v15 shortValue] == 6)
              {
                long long v37 = [(PLBatteryGaugeService *)self costElement];

                if (!v37)
                {
                  long long v38 = +[PLDTCostElement getCostElementInstance];
                  [(PLBatteryGaugeService *)self setCostElement:v38];
                }
                long long v39 = [(PLBatteryGaugeService *)self costElement];
                long long v40 = [v9 objectForKeyedSubscript:v15];
                v41 = [v40 objectForKeyedSubscript:@"cost"];
                [v41 doubleValue];
                double v43 = v42;
                __int16 v44 = [(PLBatteryGaugeService *)self lastQueryTime];
                objc_msgSend(v39, "addLocationEvent:atTime:withPid:withAppState:", v44, objc_msgSend(v116, "intValue"), v117, v43);

                unsigned int v45 = [(PLBatteryGaugeService *)self costElement];
                v120 = [(PLBatteryGaugeService *)self curQueryTime];
                uint64_t v46 = [v116 intValue];
                [(PLBatteryGaugeService *)self measurements];
                v48 = long long v47 = v15;
                uint64_t v49 = [v48 objectForKeyedSubscript:v116];
                __int16 v50 = [v49 objectForKeyedSubscript:@"lastActiveStart"];
                v51 = [(PLBatteryGaugeService *)self measurements];
                v52 = [v51 objectForKeyedSubscript:v116];
                uint64_t v53 = [v52 objectForKeyedSubscript:@"lastSuspendStart"];
                uint64_t v54 = [v45 getLocationCostUptoTime:v120 withPid:v46 withLastActiveStart:v50 withLastSuspendStart:v53 withAppState:v117];
              }
              else if ([v15 shortValue] == 2)
              {
                v55 = [(PLBatteryGaugeService *)self costElement];

                if (!v55)
                {
                  v56 = +[PLDTCostElement getCostElementInstance];
                  [(PLBatteryGaugeService *)self setCostElement:v56];
                }
                v57 = [(PLBatteryGaugeService *)self costElement];
                v58 = [v9 objectForKeyedSubscript:v15];
                v59 = [v58 objectForKeyedSubscript:@"cost"];
                [v59 doubleValue];
                double v61 = v60;
                v62 = [(PLBatteryGaugeService *)self lastQueryTime];
                objc_msgSend(v57, "addCpuEvent:atTime:withPid:withAppState:", v62, objc_msgSend(v116, "intValue"), v117, v61);

                unsigned int v45 = [(PLBatteryGaugeService *)self costElement];
                v120 = [(PLBatteryGaugeService *)self curQueryTime];
                uint64_t v63 = [v116 intValue];
                [(PLBatteryGaugeService *)self measurements];
                v48 = long long v47 = v15;
                uint64_t v49 = [v48 objectForKeyedSubscript:v116];
                __int16 v50 = [v49 objectForKeyedSubscript:@"lastActiveStart"];
                v51 = [(PLBatteryGaugeService *)self measurements];
                v52 = [v51 objectForKeyedSubscript:v116];
                uint64_t v53 = [v52 objectForKeyedSubscript:@"lastSuspendStart"];
                uint64_t v54 = [v45 getCpuCostUptoTime:v120 withPid:v63 withLastActiveStart:v50 withLastSuspendStart:v53 withAppState:v117];
              }
              else if ([v15 shortValue] == 8)
              {
                v64 = [(PLBatteryGaugeService *)self costElement];

                if (!v64)
                {
                  v65 = +[PLDTCostElement getCostElementInstance];
                  [(PLBatteryGaugeService *)self setCostElement:v65];
                }
                v66 = [(PLBatteryGaugeService *)self costElement];
                v67 = [v9 objectForKeyedSubscript:v15];
                v68 = [v67 objectForKeyedSubscript:@"cost"];
                [v68 doubleValue];
                double v70 = v69;
                v71 = [(PLBatteryGaugeService *)self lastQueryTime];
                objc_msgSend(v66, "addGpuEvent:atTime:withPid:withAppState:", v71, objc_msgSend(v116, "intValue"), v117, v70);

                unsigned int v45 = [(PLBatteryGaugeService *)self costElement];
                v120 = [(PLBatteryGaugeService *)self curQueryTime];
                uint64_t v72 = [v116 intValue];
                [(PLBatteryGaugeService *)self measurements];
                v48 = long long v47 = v15;
                uint64_t v49 = [v48 objectForKeyedSubscript:v116];
                __int16 v50 = [v49 objectForKeyedSubscript:@"lastActiveStart"];
                v51 = [(PLBatteryGaugeService *)self measurements];
                v52 = [v51 objectForKeyedSubscript:v116];
                uint64_t v53 = [v52 objectForKeyedSubscript:@"lastSuspendStart"];
                uint64_t v54 = [v45 getGpuCostUptoTime:v120 withPid:v72 withLastActiveStart:v50 withLastSuspendStart:v53 withAppState:v117];
              }
              else
              {
                if (!+[PLBatteryGaugeService shouldCalculateDisplayCost](PLBatteryGaugeService, "shouldCalculateDisplayCost")|| [v15 shortValue] != 9)
                {
                  long long v36 = [v9 objectForKeyedSubscript:v15];
                  [v7 setObject:v36 forKeyedSubscript:v15];
                  goto LABEL_32;
                }
                v88 = [(PLBatteryGaugeService *)self costElement];

                if (!v88)
                {
                  v89 = +[PLDTCostElement getCostElementInstance];
                  [(PLBatteryGaugeService *)self setCostElement:v89];
                }
                v90 = [(PLBatteryGaugeService *)self costElement];
                v91 = [v9 objectForKeyedSubscript:v15];
                v92 = [v91 objectForKeyedSubscript:@"cost"];
                [v92 doubleValue];
                double v94 = v93;
                v95 = [(PLBatteryGaugeService *)self lastQueryTime];
                objc_msgSend(v90, "addDisplayEvent:atTime:withPid:withAppState:", v95, objc_msgSend(v116, "intValue"), v117, v94);

                unsigned int v45 = [(PLBatteryGaugeService *)self costElement];
                v120 = [(PLBatteryGaugeService *)self curQueryTime];
                uint64_t v96 = [v116 intValue];
                [(PLBatteryGaugeService *)self measurements];
                v48 = long long v47 = v15;
                uint64_t v49 = [v48 objectForKeyedSubscript:v116];
                __int16 v50 = [v49 objectForKeyedSubscript:@"lastActiveStart"];
                v51 = [(PLBatteryGaugeService *)self measurements];
                v52 = [v51 objectForKeyedSubscript:v116];
                uint64_t v53 = [v52 objectForKeyedSubscript:@"lastSuspendStart"];
                uint64_t v54 = [v45 getDisplayCostUptoTime:v120 withPid:v96 withLastActiveStart:v50 withLastSuspendStart:v53 withAppState:v117];
              }
              v73 = (void *)v54;
              [v115 setObject:v54 forKeyedSubscript:v47];

              long long v36 = v45;
              uint64_t v7 = v115;

              self = v118;
              uint64_t v9 = v114;

              uint64_t v15 = v47;
            }
            uint64_t v14 = v123;
LABEL_32:

            if ([v15 shortValue] == 7)
            {
              v74 = [v7 objectForKeyedSubscript:v15];
              v75 = [v74 objectForKeyedSubscript:@"cost"];
              [v75 doubleValue];
              if (v76 == 4.0 || [v15 shortValue] == 10)
              {
              }
              else
              {
                int v87 = [v15 shortValue];

                if (v87 != 11) {
                  goto LABEL_41;
                }
              }
            }
            if ([v15 shortValue] != 7) {
              goto LABEL_39;
            }
            v77 = [v7 objectForKeyedSubscript:v15];
            v78 = [v77 objectForKeyedSubscript:@"cost"];
            [v78 doubleValue];
            double v80 = v79;

            if (v80 == 4.0)
            {
              double v13 = v13 + 200.0;
            }
            else
            {
LABEL_39:
              v81 = [v7 objectForKeyedSubscript:v15];
              v82 = [v81 objectForKeyedSubscript:@"cost"];
              [v82 doubleValue];
              double v13 = v13 + v83;
            }
            v84 = [v7 objectForKeyedSubscript:v15];
            v85 = [v84 objectForKeyedSubscript:@"overhead"];
            [v85 doubleValue];
            double v12 = v12 + v86;

LABEL_41:
            ++v14;
          }
          while (v122 != v14);
          uint64_t v101 = [v113 countByEnumeratingWithState:&v124 objects:v136 count:16];
          uint64_t v122 = v101;
        }
        while (v101);
LABEL_54:

        v132[0] = @"cost";
        v102 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
        v132[1] = @"overhead";
        v133[0] = v102;
        v103 = [MEMORY[0x1E4F28ED0] numberWithDouble:v12];
        v133[1] = v103;
        v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:v132 count:2];
        [v7 setObject:v104 forKey:&unk_1F400D030];

        id v4 = v110;
        v105 = [v110 objectForKeyedSubscript:v116];
        [v105 setObject:v7 forKeyedSubscript:@"usage_data"];

        uint64_t v5 = v112 + 1;
      }
      while (v112 + 1 != v111);
      uint64_t v111 = [obj countByEnumeratingWithState:&v128 objects:v137 count:16];
    }
    while (v111);
  }

  v106 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService convertRawUsageToScore:]();
  }

  return v4;
}

- (void)requestDataFrom:(id)a3 withType:(int)a4
{
  id v6 = a3;
  objc_sync_enter(@"___Sync___");
  uint64_t v7 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PLBatteryGaugeService_requestDataFrom_withType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v7;
  if (requestDataFrom_withType__defaultOnce != -1) {
    dispatch_once(&requestDataFrom_withType__defaultOnce, block);
  }
  if (requestDataFrom_withType__classDebugEnabled)
  {
    uint64_t v8 = [(PLBatteryGaugeService *)self requestTime];
    uint64_t v9 = [v8 objectForKey:v6];

    if (!v9)
    {
      uint64_t v10 = objc_opt_new();
      uint64_t v11 = [(PLBatteryGaugeService *)self requestTime];
      [v11 setObject:v10 forKeyedSubscript:v6];
    }
    double v12 = [(PLBatteryGaugeService *)self requestTime];
    double v13 = [v12 objectForKey:v6];
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
    [v13 addObject:v14];
  }
  if (a4 == 1)
  {
    uint64_t v15 = [(PLBatteryGaugeService *)self entrykeyCallBackOnceMapping];
    uint64_t v16 = [v15 objectForKeyedSubscript:v6];
    goto LABEL_11;
  }
  if (!a4)
  {
    uint64_t v15 = [(PLBatteryGaugeService *)self entrykeyCallBackMapping];
    uint64_t v16 = [v15 objectForKeyedSubscript:v6];
LABEL_11:
    double v17 = (void *)v16;

    goto LABEL_13;
  }
  double v17 = 0;
LABEL_13:
  double v18 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService requestDataFrom:withType:]();
  }

  [v17 requestEntry];
  objc_sync_exit(@"___Sync___");
}

uint64_t __50__PLBatteryGaugeService_requestDataFrom_withType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  requestDataFrom_withType__classDebugEnabled = result;
  return result;
}

- (void)dataReceivedFrom:(id)a3
{
  id v4 = a3;
  objc_sync_enter(@"___Sync___");
  uint64_t v5 = [(PLBatteryGaugeService *)self returnTime];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = [(PLBatteryGaugeService *)self returnTime];
    [v8 setObject:v7 forKeyedSubscript:v4];
  }
  uint64_t v9 = [(PLBatteryGaugeService *)self returnTime];
  uint64_t v10 = [v9 objectForKey:v4];
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v10 addObject:v11];

  double v12 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService dataReceivedFrom:]();
  }

  objc_sync_exit(@"___Sync___");
}

- (void)listAllRunningPidsWithBuffer:(int *)a3 withSizeOfBuffer:(int)a4
{
  if (a4 >= 1) {
    memset(a3, 255, 4 * a4);
  }
  proc_listpids(1u, 0, a3, 4 * a4);
}

- (int)matchingPidWithProcessName:(id)a3 withBundleID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4E7EF70]();
  [(PLBatteryGaugeService *)self listAllRunningPidsWithBuffer:v15 withSizeOfBuffer:1024];
  int v9 = proc_listpids(1u, 0, 0, 0);
  int v10 = 0;
  if (v9 >= 4)
  {
    unint64_t v11 = 0;
    unint64_t v12 = (unint64_t)v9 >> 2;
    while (1)
    {
      if (v6)
      {
        double v13 = +[PLUtilities processNameForPid:v15[v11]];
        if ([v13 isEqualToString:v6]) {
          goto LABEL_12;
        }
      }
      if (v7)
      {
        double v13 = +[PLUtilities bundleIDFromPid:v15[v11]];
        if ([v7 isEqualToString:v13])
        {
LABEL_12:
          int v10 = v15[v11];

          break;
        }
      }
      int v10 = 0;
      if (v11 <= 0x3FE && v12 > ++v11) {
        continue;
      }
      break;
    }
  }

  return v10;
}

- (id)extractAndTranslateProcessIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(PLBatteryGaugeService *)self extractAndSetProcessIdentifierWithPayload:v4];

  [(PLBatteryGaugeService *)self translateProcessIdentifierWithInput:v6];
  id v7 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService extractAndTranslateProcessIdentifier:]();
  }

  return v6;
}

- (void)translateProcessIdentifierWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"pid"];
  id v6 = [v4 objectForKeyedSubscript:@"bundle_id"];
  id v7 = [v4 objectForKeyedSubscript:@"process_name"];
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    int v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[PLBatteryGaugeService matchingPidWithProcessName:withBundleID:](self, "matchingPidWithProcessName:withBundleID:", v7, v6));
    [v4 setObject:v9 forKeyedSubscript:@"pid"];

    if (v6)
    {
LABEL_3:
      if (v7) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  int v10 = +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", [v5 intValue]);
  unint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 mutableCopy];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  double v13 = (void *)v12;
  [v4 setObject:v12 forKeyedSubscript:@"bundle_id"];

  if (v7) {
    goto LABEL_4;
  }
LABEL_12:
  uint64_t v14 = +[PLUtilities processNameForPid:](PLUtilities, "processNameForPid:", [v5 intValue]);
  uint64_t v15 = (void *)[v14 mutableCopy];
  [v4 setObject:v15 forKeyedSubscript:@"process_name"];

LABEL_4:
  uint64_t v8 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService translateProcessIdentifierWithInput:](v4, v8);
  }
}

- (id)extractAndSetProcessIdentifierWithPayload:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"pid"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"bundle_id"];
  id v6 = [v3 objectForKeyedSubscript:@"process_name"];
  id v7 = objc_opt_new();
  uint64_t v8 = v7;
  if (v4)
  {
    int v9 = @"pid";
    int v10 = v4;
LABEL_7:
    [v7 setObject:v10 forKey:v9];
    goto LABEL_8;
  }
  if (v6)
  {
    int v9 = @"process_name";
    int v10 = v6;
    goto LABEL_7;
  }
  if (v5)
  {
    int v9 = @"bundle_id";
    int v10 = v5;
    goto LABEL_7;
  }
  double v13 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService extractAndSetProcessIdentifierWithPayload:]();
  }

LABEL_8:
  unint64_t v11 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService extractAndSetProcessIdentifierWithPayload:](v8, v11);
  }

  return v8;
}

- (id)startRoutineWithPayload:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "Starting routine...", buf, 2u);
  }

  id v6 = [MEMORY[0x1E4F929F8] sharedManager];
  [v6 signalServiceActive:1];

  id v80 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"battery_gauge_event"];
  [v7 setObject:v8 forKeyedSubscript:@"event"];

  [v7 setObject:&unk_1F400D048 forKeyedSubscript:@"return_value"];
  int v9 = [(PLBatteryGaugeService *)self extractAndTranslateProcessIdentifier:v4];
  int v10 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t v11 = [v9 objectForKeyedSubscript:@"pid"];
  uint64_t v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "intValue"));

  double v13 = [v9 objectForKeyedSubscript:@"process_name"];
  uint64_t v14 = [v9 objectForKeyedSubscript:@"bundle_id"];
  uint64_t v15 = [v4 objectForKeyedSubscript:@"time"];
  if ((int)[v12 intValue] <= 0)
  {
    [v7 setObject:&unk_1F400D060 forKeyedSubscript:@"return_value"];
    double v18 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryGaugeService startRoutineWithPayload:]();
    }
  }
  else
  {
    v78 = v15;
    double v79 = v14;
    v77 = v13;
    int v16 = proc_listpids(1u, 0, 0, 0);
    [(PLBatteryGaugeService *)self listAllRunningPidsWithBuffer:buf withSizeOfBuffer:1024];
    if (v16 >= 4)
    {
      unint64_t v19 = 0;
      unint64_t v20 = (unint64_t)v16 >> 2;
      while (1)
      {
        int v21 = *(_DWORD *)&buf[4 * v19];
        if (v21 == [v12 intValue]) {
          break;
        }
        if (v19 <= 0x3FE && v20 > ++v19) {
          continue;
        }
        goto LABEL_5;
      }
      double v13 = v77;
      if (!v79
        || ([MEMORY[0x1E4F1CA98] null],
            id v22 = objc_claimAutoreleasedReturnValue(),
            v22,
            v79 == v22))
      {
        if (!v77
          || ([MEMORY[0x1E4F1CA98] null],
              __int16 v29 = objc_claimAutoreleasedReturnValue(),
              v29,
              v77 == v29))
        {
          unsigned int v32 = (void *)MEMORY[0x1E4F1CA80];
          unsigned int v33 = objc_opt_new();
          uint64_t v74 = [v32 setWithArray:v33];

          uint64_t v28 = PLLogBatteryGaugeService();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            -[PLBatteryGaugeService startRoutineWithPayload:].cold.7();
          }
        }
        else
        {
          id v30 = (void *)MEMORY[0x1E4F1CA80];
          v88 = v77;
          uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
          uint64_t v74 = [v30 setWithArray:v31];

          uint64_t v28 = PLLogBatteryGaugeService();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            -[PLBatteryGaugeService startRoutineWithPayload:].cold.8();
          }
        }
        uint64_t v75 = 0;
      }
      else
      {
        double v23 = (void *)MEMORY[0x1E4F1CA80];
        v90 = v79;
        double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
        uint64_t v74 = [v23 setWithArray:v24];

        id v25 = (void *)MEMORY[0x1E4F1CA80];
        v89 = v79;
        unint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
        uint64_t v27 = [v25 setWithArray:v26];

        uint64_t v28 = PLLogBatteryGaugeService();
        uint64_t v75 = v27;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryGaugeService startRoutineWithPayload:].cold.9();
        }
      }

      unsigned int v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v86 = @"entry";
      uint64_t v87 = v74;
      long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
      [v34 postNotificationName:@"PLProcessNetworkAgent.addProcessesOfInterest" object:0 userInfo:v35];

      long long v36 = (void *)MEMORY[0x1E4F1CA80];
      long long v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v12, "intValue"));
      v85 = v37;
      long long v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
      long long v39 = [v36 setWithArray:v38];

      long long v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v83 = @"entry";
      v84 = v39;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      [v40 postNotificationName:@"PLProcessMonitorAgent.addProcessesOfInterest" object:0 userInfo:v41];

      double v42 = (void *)v75;
      if (v75)
      {
        double v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v81 = @"entry";
        uint64_t v82 = v75;
        __int16 v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        [v43 postNotificationName:@"PLLocationAgent.addProcessesOfInterest" object:0 userInfo:v44];

        double v42 = (void *)v75;
      }
      uint64_t v15 = v78;
      double v76 = v42;
      if (v78)
      {
        unsigned int v45 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v46 = [v45 allKeys];
        char v47 = [v46 containsObject:v12];

        if (v47)
        {
          [v7 setObject:&unk_1F400D090 forKeyedSubscript:@"return_value"];
          uint64_t v48 = PLLogBatteryGaugeService();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
            -[PLBatteryGaugeService startRoutineWithPayload:].cold.5();
          }
          uint64_t v14 = v79;
        }
        else
        {
          uint64_t v49 = [(PLBatteryGaugeService *)self measurements];
          __int16 v50 = objc_opt_new();
          v51 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v12, "intValue"));
          [v49 setObject:v50 forKey:v51];

          if (v79)
          {
            v52 = [(PLBatteryGaugeService *)self measurements];
            uint64_t v53 = [v52 objectForKeyedSubscript:v12];
            [v53 setObject:v79 forKey:@"bundle_id"];
          }
          if (v77)
          {
            uint64_t v54 = [(PLBatteryGaugeService *)self measurements];
            v55 = [v54 objectForKeyedSubscript:v12];
            [v55 setObject:v77 forKey:@"process_name"];
          }
          v56 = [(PLBatteryGaugeService *)self measurements];
          v57 = [v56 objectForKeyedSubscript:v12];
          v58 = (void *)MEMORY[0x1E4F28ED0];
          [v78 doubleValue];
          v59 = objc_msgSend(v58, "numberWithDouble:");
          [v57 setObject:v59 forKey:@"start_time"];

          double v60 = [(PLBatteryGaugeService *)self measurements];
          double v61 = [v60 objectForKeyedSubscript:v12];
          v62 = [MEMORY[0x1E4F1C9C8] distantPast];
          [v61 setObject:v62 forKey:@"lastActiveStart"];

          uint64_t v63 = [(PLBatteryGaugeService *)self measurements];
          v64 = [v63 objectForKeyedSubscript:v12];
          v65 = [MEMORY[0x1E4F1C9C8] distantFuture];
          [v64 setObject:v65 forKey:@"lastSuspendStart"];

          v66 = [(PLBatteryGaugeService *)self measurements];
          v67 = [v66 objectForKeyedSubscript:v12];
          [v67 setObject:&unk_1F400D078 forKey:&unk_1F400CF88];

          [v7 setObject:&unk_1F400D030 forKeyedSubscript:@"return_value"];
          v68 = PLLogBatteryGaugeService();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
            -[PLBatteryGaugeService startRoutineWithPayload:].cold.6();
          }

          double v69 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
          double v70 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v12, "intValue"));
          uint64_t v14 = v79;
          [v69 setObject:v70 forKey:v79];

          uint64_t v48 = [(PLBatteryGaugeService *)self trackedProcesses];
          v71 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v12, "intValue"));
          [v48 addObject:v71];

          double v13 = v77;
        }
        uint64_t v15 = v78;
      }
      else
      {
        [v7 setObject:&unk_1F400D0A8 forKeyedSubscript:@"return_value"];
        uint64_t v48 = PLLogBatteryGaugeService();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryGaugeService startRoutineWithPayload:].cold.4();
        }
        uint64_t v14 = v79;
      }
      double v17 = v74;
    }
    else
    {
LABEL_5:
      [v7 setObject:&unk_1F400D060 forKeyedSubscript:@"return_value"];
      double v17 = PLLogBatteryGaugeService();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryGaugeService startRoutineWithPayload:]();
      }
      double v13 = v77;
      uint64_t v14 = v79;
    }
  }
  [v80 setObject:v7 forKey:&unk_1F400D0C0];
  uint64_t v72 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService startRoutineWithPayload:]();
  }

  return v80;
}

- (id)stopRoutineWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "Stopping routine...", v31, 2u);
  }

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"battery_gauge_event"];
  [v7 setObject:v8 forKeyedSubscript:@"event"];

  [v7 setObject:&unk_1F400D048 forKeyedSubscript:@"return_value"];
  int v9 = [(PLBatteryGaugeService *)self extractAndTranslateProcessIdentifier:v4];

  int v10 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t v11 = [v9 objectForKeyedSubscript:@"pid"];
  uint64_t v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "intValue"));

  double v13 = [v9 objectForKeyedSubscript:@"bundle_id"];
  if ([v12 intValue] == -1)
  {
    [v7 setObject:&unk_1F400D030 forKeyedSubscript:@"return_value"];
    id v25 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryGaugeService stopRoutineWithPayload:]();
    }

    unint64_t v26 = [MEMORY[0x1E4F929F8] sharedManager];
    [v26 signalServiceInactive:1];
    goto LABEL_21;
  }
  if (![v12 intValue])
  {
    [v7 setObject:&unk_1F400D060 forKeyedSubscript:@"return_value"];
    unint64_t v26 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryGaugeService stopRoutineWithPayload:]();
    }
    goto LABEL_21;
  }
  uint64_t v14 = [(PLBatteryGaugeService *)self measurements];
  uint64_t v15 = [v14 objectForKeyedSubscript:v12];

  if (!v15)
  {
    [v7 setObject:&unk_1F400D060 forKeyedSubscript:@"return_value"];
    unint64_t v26 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryGaugeService stopRoutineWithPayload:].cold.4();
    }
LABEL_21:

    goto LABEL_22;
  }
  int v16 = [MEMORY[0x1E4F1CA98] null];

  if (v13 && v13 != v16)
  {
    double v17 = [(PLBatteryGaugeService *)self bundleIDandPidMap];
    [v17 removeObjectForKey:v13];
  }
  double v18 = [(PLBatteryGaugeService *)self measurements];
  [v18 removeObjectForKey:v12];

  unint64_t v19 = [(PLBatteryGaugeService *)self trackedProcesses];
  [v19 removeObject:v12];

  unint64_t v20 = [(PLBatteryGaugeService *)self measurements];
  int v21 = [v20 allKeys];
  uint64_t v22 = [v21 count];

  if (!v22)
  {
    double v23 = PLLogBatteryGaugeService();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryGaugeService stopRoutineWithPayload:].cold.5();
    }

    double v24 = [MEMORY[0x1E4F929F8] sharedManager];
    [v24 signalServiceInactive:1];
  }
  [v7 setObject:&unk_1F400D030 forKeyedSubscript:@"return_value"];
LABEL_22:
  uint64_t v27 = [(PLBatteryGaugeService *)self measurements];
  uint64_t v28 = [v27 allKeys];
  [v7 setObject:v28 forKey:@"tracked_processes"];

  [v6 setObject:v7 forKey:&unk_1F400D0C0];
  __int16 v29 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService stopRoutineWithPayload:]();
  }

  return v6;
}

- (id)pauseRoutineWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "Pausing routine...", buf, 2u);
  }

  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  int v9 = [v4 objectForKeyedSubscript:@"battery_gauge_event"];
  [v6 setObject:v9 forKey:@"event"];

  [v6 setObject:&unk_1F400D048 forKey:@"return_value"];
  int v10 = [(PLBatteryGaugeService *)self extractAndTranslateProcessIdentifier:v4];

  unint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v12 = [v10 objectForKeyedSubscript:@"pid"];
  double v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));

  uint64_t v14 = [v10 objectForKeyedSubscript:@"bundle_id"];
  uint64_t v15 = [v10 objectForKeyedSubscript:@"process_name"];
  if ((int)[v13 intValue] <= 0)
  {
    if (v14) {
      int v21 = v14;
    }
    else {
      int v21 = v15;
    }
    unint64_t v19 = [NSString stringWithFormat:@"Cannot find specified process:%@", v21];
    [v8 addObject:v19];
    unint64_t v20 = &unk_1F400D060;
  }
  else
  {
    int v16 = [(PLBatteryGaugeService *)self measurements];
    double v17 = [v16 objectForKeyedSubscript:v13];

    if (v17)
    {
      double v18 = [(PLBatteryGaugeService *)self trackedProcesses];
      [v18 removeObject:v13];

      unint64_t v19 = [(PLBatteryGaugeService *)self trackedProcesses];
      [v8 addObjectsFromArray:v19];
      unint64_t v20 = &unk_1F400D030;
    }
    else
    {
      unint64_t v19 = [NSString stringWithFormat:@"Specified process is not tracked:%@", v13];
      [v8 addObject:v19];
      unint64_t v20 = &unk_1F400D0D8;
    }
  }

  [v6 setObject:v20 forKeyedSubscript:@"return_value"];
  [v6 setObject:v8 forKey:@"tracked_processes"];
  [v7 setObject:v6 forKey:&unk_1F400D0C0];

  return v7;
}

- (id)resumeRoutineWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_INFO, "Resuming routine...", buf, 2u);
  }

  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  int v9 = [v4 objectForKeyedSubscript:@"battery_gauge_event"];
  [v6 setObject:v9 forKey:@"event"];

  [v6 setObject:&unk_1F400D048 forKey:@"return_value"];
  int v10 = [(PLBatteryGaugeService *)self extractAndTranslateProcessIdentifier:v4];

  unint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v12 = [v10 objectForKeyedSubscript:@"pid"];
  double v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));

  uint64_t v14 = [v10 objectForKeyedSubscript:@"bundle_id"];
  uint64_t v15 = [v10 objectForKeyedSubscript:@"process_name"];
  if (v13)
  {
    int v16 = [(PLBatteryGaugeService *)self measurements];
    double v17 = [v16 objectForKeyedSubscript:v13];

    if (v17)
    {
      double v18 = [(PLBatteryGaugeService *)self trackedProcesses];
      [v18 addObject:v13];

      unint64_t v19 = [(PLBatteryGaugeService *)self trackedProcesses];
      [v8 addObjectsFromArray:v19];
      unint64_t v20 = &unk_1F400D030;
    }
    else
    {
      if (v14) {
        uint64_t v22 = v14;
      }
      else {
        uint64_t v22 = v13;
      }
      unint64_t v19 = [NSString stringWithFormat:@"Specified process is not tracked:%@", v22];
      [v8 addObject:v19];
      unint64_t v20 = &unk_1F400D0D8;
    }
  }
  else
  {
    if (v14) {
      int v21 = v14;
    }
    else {
      int v21 = v15;
    }
    unint64_t v19 = [NSString stringWithFormat:@"Cannot find specified process:%@", v21];
    [v8 addObject:v19];
    unint64_t v20 = &unk_1F400D060;
  }

  [v6 setObject:v20 forKeyedSubscript:@"return_value"];
  [v6 setObject:v8 forKey:@"tracked_processes"];
  [v7 setObject:v6 forKey:&unk_1F400D0C0];

  return v7;
}

- (id)clearStateRoutine:(id)a3
{
  id v3 = a3;
  id v4 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_INFO, "Clearing state...", v11, 2u);
  }

  uint64_t v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = [v3 objectForKeyedSubscript:@"battery_gauge_event"];

  [v5 setObject:v7 forKeyedSubscript:@"event"];
  [v5 setObject:&unk_1F400D030 forKeyedSubscript:@"return_value"];
  uint64_t v8 = [MEMORY[0x1E4F929F8] sharedManager];
  [v8 signalServiceInactive:1];

  int v9 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService clearStateRoutine:]();
  }

  [v6 setObject:v5 forKey:&unk_1F400D0C0];
  return v6;
}

- (void)triggerAllData
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_INFO, "Requesting source data...", buf, 2u);
  }

  id v4 = [(PLBatteryGaugeService *)self curQueryTime];
  [(PLBatteryGaugeService *)self setLastQueryTime:v4];

  uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [(PLBatteryGaugeService *)self setCurQueryTime:v5];

  [(PLBatteryGaugeService *)self setLastQueryCount:[(PLBatteryGaugeService *)self curQueryCount]];
  [(PLBatteryGaugeService *)self setCurQueryCount:[(PLBatteryGaugeService *)self lastQueryCount] + 1];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [(PLBatteryGaugeService *)self entrykeyCallBackMapping];
  id v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * v11);
        double v13 = PLLogBatteryGaugeService();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          unsigned int v32 = "-[PLBatteryGaugeService triggerAllData]";
          __int16 v33 = 1024;
          int v34 = 1287;
          __int16 v35 = 2112;
          uint64_t v36 = v12;
          _os_log_debug_impl(&dword_1E4220000, v13, OS_LOG_TYPE_DEBUG, "!!! %s/%d: requestDataFrom:%@", buf, 0x1Cu);
        }

        [(PLBatteryGaugeService *)self requestDataFrom:v12 withType:0];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v9);
  }

  if ((triggerAllData_triggered & 1) == 0)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = [(PLBatteryGaugeService *)self entrykeyCallBackOnceMapping];
    uint64_t v15 = [v14 allKeys];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * v19);
          int v21 = PLLogBatteryGaugeService();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            unsigned int v32 = "-[PLBatteryGaugeService triggerAllData]";
            __int16 v33 = 1024;
            int v34 = 1295;
            __int16 v35 = 2112;
            uint64_t v36 = v20;
            _os_log_debug_impl(&dword_1E4220000, v21, OS_LOG_TYPE_DEBUG, "!!! %s/%d: requestDataFrom:%@", buf, 0x1Cu);
          }

          [(PLBatteryGaugeService *)self requestDataFrom:v20 withType:1];
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    triggerAllData_triggered = 1;
  }
}

- (id)compileSnapshotResponse
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  uint64_t v82 = objc_opt_new();
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = [(PLBatteryGaugeService *)self trackedProcesses];
  uint64_t v83 = [obj countByEnumeratingWithState:&v95 objects:v121 count:16];
  if (v83)
  {
    uint64_t v81 = *(void *)v96;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v96 != v81) {
          objc_enumerationMutation(obj);
        }
        uint64_t v84 = v3;
        uint64_t v4 = *(void *)(*((void *)&v95 + 1) + 8 * v3);
        uint64_t v5 = objc_opt_new();
        id v6 = [(PLBatteryGaugeService *)self measurements];
        id v7 = [v6 objectForKeyedSubscript:v4];
        double v94 = [v7 objectForKey:&unk_1F400CF40];

        uint64_t v8 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v9 = [v8 objectForKeyedSubscript:v4];
        double v93 = [v9 objectForKey:&unk_1F400D0F0];

        uint64_t v10 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v11 = [v10 objectForKeyedSubscript:v4];
        uint64_t v92 = [v11 objectForKey:&unk_1F400D108];

        uint64_t v12 = [(PLBatteryGaugeService *)self measurements];
        double v13 = [v12 objectForKeyedSubscript:v4];
        v91 = [v13 objectForKey:&unk_1F400CF58];

        uint64_t v14 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v15 = [v14 objectForKeyedSubscript:v4];
        v90 = [v15 objectForKey:&unk_1F400CF70];

        uint64_t v16 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v17 = [v16 objectForKeyedSubscript:v4];
        v89 = [v17 objectForKey:&unk_1F400CF88];

        uint64_t v18 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v19 = [v18 objectForKeyedSubscript:v4];
        v88 = [v19 objectForKey:&unk_1F400CFA0];

        if (+[PLBatteryGaugeService shouldCalculateDisplayCost])
        {
          uint64_t v20 = [(PLBatteryGaugeService *)self measurements];
          int v21 = [v20 objectForKeyedSubscript:v4];
          v85 = [v21 objectForKey:&unk_1F400CFB8];
        }
        else
        {
          v85 = 0;
        }
        long long v22 = [(PLBatteryGaugeService *)self measurements];
        long long v23 = [v22 objectForKeyedSubscript:v4];
        uint64_t v87 = [v23 objectForKey:&unk_1F400CFD0];

        long long v24 = [(PLBatteryGaugeService *)self measurements];
        long long v25 = [v24 objectForKeyedSubscript:v4];
        double v86 = [v25 objectForKey:&unk_1F400CFE8];

        long long v26 = v94;
        if (!v94) {
          long long v26 = &unk_1F400D018;
        }
        v119[0] = @"cost";
        v119[1] = @"overhead";
        v120[0] = v26;
        v120[1] = &unk_1F400D018;
        long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:2];
        [v5 setObject:v27 forKey:&unk_1F400CF40];

        long long v28 = v93;
        if (!v93) {
          long long v28 = &unk_1F400D018;
        }
        v117[0] = @"cost";
        v117[1] = @"overhead";
        v118[0] = v28;
        v118[1] = &unk_1F400D018;
        long long v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:2];
        [v5 setObject:v29 forKey:&unk_1F400D0F0];

        id v30 = v92;
        if (!v92) {
          id v30 = &unk_1F400D018;
        }
        v115[0] = @"cost";
        v115[1] = @"overhead";
        v116[0] = v30;
        v116[1] = &unk_1F400D018;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];
        [v5 setObject:v31 forKey:&unk_1F400D108];

        unsigned int v32 = v91;
        if (!v91) {
          unsigned int v32 = &unk_1F400D018;
        }
        v113[0] = @"cost";
        v113[1] = @"overhead";
        v114[0] = v32;
        v114[1] = &unk_1F400D018;
        __int16 v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];
        [v5 setObject:v33 forKey:&unk_1F400CF58];

        int v34 = v90;
        if (!v90) {
          int v34 = &unk_1F400D018;
        }
        v111[0] = @"cost";
        v111[1] = @"overhead";
        v112[0] = v34;
        v112[1] = &unk_1F400D018;
        __int16 v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:2];
        [v5 setObject:v35 forKey:&unk_1F400CF70];

        uint64_t v36 = v89;
        if (!v89) {
          uint64_t v36 = &unk_1F400D018;
        }
        v109[0] = @"cost";
        v109[1] = @"overhead";
        v110[0] = v36;
        v110[1] = &unk_1F400D018;
        long long v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];
        [v5 setObject:v37 forKey:&unk_1F400CF88];

        uint64_t v38 = v88;
        if (!v88) {
          uint64_t v38 = &unk_1F400D018;
        }
        v107[0] = @"cost";
        v107[1] = @"overhead";
        v108[0] = v38;
        v108[1] = &unk_1F400D018;
        long long v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:2];
        [v5 setObject:v39 forKey:&unk_1F400CFA0];

        if (+[PLBatteryGaugeService shouldCalculateDisplayCost])
        {
          long long v40 = v85;
          if (!v85) {
            long long v40 = &unk_1F400D018;
          }
          v105[0] = @"cost";
          v105[1] = @"overhead";
          v106[0] = v40;
          v106[1] = &unk_1F400D018;
          v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:2];
          [v5 setObject:v41 forKey:&unk_1F400CFB8];
        }
        double v42 = v87;
        if (!v87) {
          double v42 = &unk_1F400D018;
        }
        v103[0] = @"cost";
        v103[1] = @"overhead";
        v104[0] = v42;
        v104[1] = &unk_1F400D018;
        double v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:2];
        [v5 setObject:v43 forKey:&unk_1F400CFD0];

        if (v86) {
          __int16 v44 = v86;
        }
        else {
          __int16 v44 = &unk_1F400D120;
        }
        v101[0] = @"cost";
        v101[1] = @"overhead";
        v102[0] = v44;
        v102[1] = &unk_1F400D120;
        unsigned int v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
        [v5 setObject:v45 forKey:&unk_1F400CFE8];

        uint64_t v46 = objc_opt_new();
        [v82 setObject:v46 forKey:v4];

        char v47 = [v82 objectForKeyedSubscript:v4];
        [v47 setObject:v5 forKey:@"usage_data"];

        uint64_t v48 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v49 = [v48 objectForKeyedSubscript:v4];
        __int16 v50 = [v49 objectForKey:@"Ongoing Location"];
        int v51 = [v50 intValue];

        if (!v51)
        {
          v52 = [(PLBatteryGaugeService *)self measurements];
          uint64_t v53 = [v52 objectForKeyedSubscript:v4];
          [v53 setObject:&unk_1F400D018 forKey:&unk_1F400CF70];
        }
        uint64_t v54 = [(PLBatteryGaugeService *)self measurements];
        v55 = [v54 objectForKeyedSubscript:v4];
        [v55 setObject:&unk_1F400D018 forKey:&unk_1F400CF40];

        v56 = [(PLBatteryGaugeService *)self measurements];
        v57 = [v56 objectForKeyedSubscript:v4];
        [v57 setObject:&unk_1F400D018 forKey:&unk_1F400D0F0];

        v58 = [(PLBatteryGaugeService *)self measurements];
        v59 = [v58 objectForKeyedSubscript:v4];
        [v59 setObject:&unk_1F400D018 forKey:&unk_1F400D108];

        double v60 = [(PLBatteryGaugeService *)self measurements];
        double v61 = [v60 objectForKeyedSubscript:v4];
        [v61 setObject:&unk_1F400D018 forKey:&unk_1F400CF58];

        v62 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v63 = [v62 objectForKeyedSubscript:v4];
        [v63 setObject:&unk_1F400D018 forKey:&unk_1F400CFA0];

        if (+[PLBatteryGaugeService shouldCalculateDisplayCost])
        {
          v64 = [(PLBatteryGaugeService *)self measurements];
          v65 = [v64 objectForKeyedSubscript:v4];
          [v65 setObject:&unk_1F400D018 forKey:&unk_1F400CFB8];
        }
        v66 = [(PLBatteryGaugeService *)self measurements];
        v67 = [v66 objectForKeyedSubscript:v4];
        v68 = [(PLBatteryGaugeService *)self lastQueryTime];
        [v67 setObject:v68 forKey:@"start_time"];

        double v69 = [(PLBatteryGaugeService *)self measurements];
        double v70 = [v69 objectForKeyedSubscript:v4];
        v71 = [(PLBatteryGaugeService *)self curQueryTime];
        [v70 setObject:v71 forKey:@"stop_time"];

        uint64_t v72 = [(PLBatteryGaugeService *)self measurements];
        v73 = [v72 objectForKeyedSubscript:v4];
        [v73 setObject:&unk_1F400D0C0 forKey:@"return_value"];

        uint64_t v74 = [(PLBatteryGaugeService *)self measurements];
        uint64_t v75 = [v74 objectForKeyedSubscript:v4];
        [v75 setObject:&unk_1F400D108 forKey:@"event"];

        uint64_t v3 = v84 + 1;
      }
      while (v83 != v84 + 1);
      uint64_t v83 = [obj countByEnumeratingWithState:&v95 objects:v121 count:16];
    }
    while (v83);
  }

  double v76 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
    [(PLBatteryGaugeService *)(uint64_t)v82 compileSnapshotResponse];
  }

  v77 = [(PLBatteryGaugeService *)self convertRawUsageToScore:v82];
  v78 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v100 = v77;
    _os_log_impl(&dword_1E4220000, v78, OS_LOG_TYPE_INFO, "Compiled snapshot response: %@", buf, 0xCu);
  }

  return v77;
}

- (id)DTQueryResponse:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_DEFAULT, "DT query payload received: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__12;
  uint64_t v31 = __Block_byref_object_dispose__12;
  id v32 = 0;
  id v6 = [v4 objectForKeyedSubscript:@"battery_gauge_event"];
  int v7 = [v6 intValue];

  switch(v7)
  {
    case 0:
      uint64_t v8 = [(PLBatteryGaugeService *)self startRoutineWithPayload:v4];
      uint64_t v9 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v8;

      break;
    case 1:
      uint64_t v10 = [(PLBatteryGaugeService *)self stopRoutineWithPayload:v4];
      uint64_t v11 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v10;

      break;
    case 2:
      [(PLBatteryGaugeService *)self triggerAllData];
      uint64_t v12 = PLLogBatteryGaugeService();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryGaugeService DTQueryResponse:]();
      }

      [(PLBatteryGaugeService *)self initResponseSemaphore];
      double v13 = [(PLBatteryGaugeService *)self responseSemaphore];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __41__PLBatteryGaugeService_DTQueryResponse___block_invoke;
      v27[3] = &unk_1E6E47E68;
      v27[4] = self;
      v27[5] = &buf;
      [v13 waitWithBlockSync:v27];

      break;
    case 3:
      uint64_t v14 = [(PLBatteryGaugeService *)self pauseRoutineWithPayload:v4];
      uint64_t v15 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v14;

      break;
    case 4:
      uint64_t v16 = [(PLBatteryGaugeService *)self resumeRoutineWithPayload:v4];
      uint64_t v17 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v16;

      break;
    case 5:
      uint64_t v18 = [(PLBatteryGaugeService *)self clearStateRoutine:v4];
      uint64_t v19 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v18;

      break;
    default:
      break;
  }
  uint64_t v20 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PLBatteryGaugeService_DTQueryResponse___block_invoke_232;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v20;
  if (DTQueryResponse__defaultOnce != -1) {
    dispatch_once(&DTQueryResponse__defaultOnce, block);
  }
  if (DTQueryResponse__classDebugEnabled)
  {
    int v21 = [(PLBatteryGaugeService *)self responseTime];
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    long long v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
    [v21 setObject:v22 forKey:v23];
  }
  [(PLBatteryGaugeService *)self resetExitTimer];
  id v24 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v24;
}

void __41__PLBatteryGaugeService_DTQueryResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __41__PLBatteryGaugeService_DTQueryResponse___block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 32) compileSnapshotResponse];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __41__PLBatteryGaugeService_DTQueryResponse___block_invoke_232(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  DTQueryResponse__classDebugEnabled = result;
  return result;
}

- (void)testGaugeServiceSingleInstance:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PLLogBatteryGaugeService();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryGaugeService testGaugeServiceSingleInstance:]();
  }

  if (testGaugeServiceSingleInstance__iteration <= 14)
  {
    if (!testGaugeServiceSingleInstance__iteration)
    {
      v20[0] = @"pid";
      v20[1] = @"battery_gauge_event";
      v21[0] = &unk_1F400D138;
      v21[1] = &unk_1F400D018;
      v20[2] = @"time";
      uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
      [v8 timeIntervalSince1970];
      uint64_t v9 = objc_msgSend(v14, "numberWithDouble:");
      v21[2] = v9;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v11 = v21;
      uint64_t v12 = v20;
      goto LABEL_16;
    }
    if (testGaugeServiceSingleInstance__iteration == 1)
    {
      v18[0] = @"pid";
      v18[1] = @"battery_gauge_event";
      v19[0] = &unk_1F400D138;
      v19[1] = &unk_1F400D018;
      v18[2] = @"time";
      int v7 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
      [v8 timeIntervalSince1970];
      uint64_t v9 = objc_msgSend(v7, "numberWithDouble:");
      v19[2] = v9;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v11 = v19;
      uint64_t v12 = v18;
LABEL_16:
      id v6 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:3];

      goto LABEL_18;
    }
LABEL_17:
    id v6 = &unk_1F400FB50;
    goto LABEL_18;
  }
  if (testGaugeServiceSingleInstance__iteration != 15 && testGaugeServiceSingleInstance__iteration != 30)
  {
    if (testGaugeServiceSingleInstance__iteration == 10000)
    {
      v16[0] = @"pid";
      v16[1] = @"battery_gauge_event";
      v17[0] = &unk_1F400D138;
      v17[1] = &unk_1F400D0C0;
      v16[2] = @"time";
      double v13 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
      [v8 timeIntervalSince1970];
      uint64_t v9 = objc_msgSend(v13, "numberWithDouble:");
      v17[2] = v9;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v11 = v17;
      uint64_t v12 = v16;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v6 = 0;
LABEL_18:
  id v15 = [(PLBatteryGaugeService *)self DTQueryResponse:v6];
  ++testGaugeServiceSingleInstance__iteration;
}

- (void)testGaugeService
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB00]);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
  id v6 = (id)[v3 initWithFireDate:v4 interval:self target:sel_testGaugeServiceSingleInstance_ selector:0 userInfo:1 repeats:1.0];

  uint64_t v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v5 addTimer:v6 forMode:*MEMORY[0x1E4F1C3A0]];
}

- (PLXPCResponderOperatorComposition)xpcResponderBatteryGaugeDT
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setXpcResponderBatteryGaugeDT:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(double)a3
{
  self->_stopTime = a3;
}

- (NSMutableDictionary)measurements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMeasurements:(id)a3
{
}

- (NSMutableDictionary)bundleIDandPidMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBundleIDandPidMap:(id)a3
{
}

- (NSMutableDictionary)requestTime
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRequestTime:(id)a3
{
}

- (NSMutableDictionary)returnTime
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setReturnTime:(id)a3
{
}

- (NSMutableDictionary)responseTime
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setResponseTime:(id)a3
{
}

- (NSMutableDictionary)entrykeyCallBackMapping
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setEntrykeyCallBackMapping:(id)a3
{
}

- (NSMutableDictionary)entrykeyCallBackOnceMapping
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEntrykeyCallBackOnceMapping:(id)a3
{
}

- (PLSemaphore)responseSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 144, 1);
}

- (void)setResponseSemaphore:(id)a3
{
}

- (NSDate)curQueryTime
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCurQueryTime:(id)a3
{
}

- (NSDate)lastQueryTime
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLastQueryTime:(id)a3
{
}

- (BOOL)isTestingRunning
{
  return self->_isTestingRunning;
}

- (void)setIsTestingRunning:(BOOL)a3
{
  self->_isTestingRunning = a3;
}

- (id)costElement
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setCostElement:(id)a3
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

- (int)curQueryCount
{
  return self->_curQueryCount;
}

- (void)setCurQueryCount:(int)a3
{
  self->_curQueryCount = a3;
}

- (NSMutableArray)trackedProcesses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTrackedProcesses:(id)a3
{
}

- (NSMutableDictionary)results
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setResults:(id)a3
{
}

- (NSMutableDictionary)reported
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setReported:(id)a3
{
}

- (NSMutableDictionary)processMonitorResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setProcessMonitorResults:(id)a3
{
}

- (NSMutableDictionary)reportedProcessMonitor
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setReportedProcessMonitor:(id)a3
{
}

- (NSMutableDictionary)processNetworkResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProcessNetworkResults:(id)a3
{
}

- (NSMutableDictionary)reportedProcessNetwork
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setReportedProcessNetwork:(id)a3
{
}

- (NSMutableDictionary)locationResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLocationResults:(id)a3
{
}

- (NSMutableDictionary)reportedLocation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setReportedLocation:(id)a3
{
}

- (NSMutableDictionary)applicationResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setApplicationResults:(id)a3
{
}

- (NSMutableDictionary)reportedApplication
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setReportedApplication:(id)a3
{
}

- (NSSet)scoringEntities
{
  return (NSSet *)objc_getProperty(self, a2, 264, 1);
}

- (PLDTCostElement)networkingCostElement
{
  return (PLDTCostElement *)objc_getProperty(self, a2, 272, 1);
}

- (void)setNetworkingCostElement:(id)a3
{
}

- (NSTimer)exitTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 280, 1);
}

- (void)setExitTimer:(id)a3
{
}

- (NSTimer)thermalStateTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 288, 1);
}

- (void)setThermalStateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalStateTimer, 0);
  objc_storeStrong((id *)&self->_exitTimer, 0);
  objc_storeStrong((id *)&self->_networkingCostElement, 0);
  objc_storeStrong((id *)&self->_scoringEntities, 0);
  objc_storeStrong((id *)&self->_reportedApplication, 0);
  objc_storeStrong((id *)&self->_applicationResults, 0);
  objc_storeStrong((id *)&self->_reportedLocation, 0);
  objc_storeStrong((id *)&self->_locationResults, 0);
  objc_storeStrong((id *)&self->_reportedProcessNetwork, 0);
  objc_storeStrong((id *)&self->_processNetworkResults, 0);
  objc_storeStrong((id *)&self->_reportedProcessMonitor, 0);
  objc_storeStrong((id *)&self->_processMonitorResults, 0);
  objc_storeStrong((id *)&self->_reported, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_trackedProcesses, 0);
  objc_storeStrong(&self->_costElement, 0);
  objc_storeStrong((id *)&self->_lastQueryTime, 0);
  objc_storeStrong((id *)&self->_curQueryTime, 0);
  objc_storeStrong((id *)&self->_responseSemaphore, 0);
  objc_storeStrong((id *)&self->_entrykeyCallBackOnceMapping, 0);
  objc_storeStrong((id *)&self->_entrykeyCallBackMapping, 0);
  objc_storeStrong((id *)&self->_responseTime, 0);
  objc_storeStrong((id *)&self->_returnTime, 0);
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_bundleIDandPidMap, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
  objc_storeStrong((id *)&self->_xpcResponderBatteryGaugeDT, 0);
}

- (void)selfExit:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_2(&dword_1E4220000, v0, v1, "!!! %s/%d: signalling PLBatteryGaugeService is becoming inactive!", v2, v3, v4, v5, 2u);
}

void __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_cold_1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_4_3(&dword_1E4220000, v0, v1, "!!! %s/%d: payload=%@, response=%@", v2);
}

void __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Asked: %@", v2, v3, v4, v5, v6);
}

- (void)parseProcessNetworkResults:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 objectForKeyedSubscript:@"BundleName"];
  uint64_t v4 = [a2 measurements];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_7_4(&dword_1E4220000, v5, v6, "!!! %s/%d: processNetworkEntry[@\"BundleName\"]=%@, measuerment=%@", v7, v8, v9, v10, 2u);
}

- (void)parseLocationResults:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: no bundleID; userInfo=%@", v2, v3, v4, v5, 2u);
}

- (void)parseLocationResults:.cold.2()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)uint64_t v4 = 136316162;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v4[7] = 457;
  v4[9] = 2112;
  uint64_t v5 = v0;
  __int16 v6 = v1;
  int v7 = 0;
  __int16 v8 = 2112;
  uint64_t v9 = v2;
  _os_log_debug_impl(&dword_1E4220000, v3, OS_LOG_TYPE_DEBUG, "!!! %s/%d: bundleId=%@, locationDesiredAccuracy=%d, userInfo=%@", (uint8_t *)v4, 0x2Cu);
}

- (void)parseApplicationResults:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "!!! pid=%@ is not tracked", v2, v3, v4, v5, v6);
}

- (void)parseApplicationResults:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "!!! curApplicationState=%d", (uint8_t *)v2, 8u);
}

- (void)parseCoalitionResults:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 measurements];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7_4(&dword_1E4220000, v2, v3, "!!! %s/%d: empty bundleIDandPidMap! measurements=%@, userInfo=%@", v4, v5, v6, v7, 2u);
}

- (void)parseCoalitionResults:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "coalitionEntry=%@", v2, v3, v4, v5, v6);
}

- (void)parseThermalStateCallback:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "!!! current ThermalState=%llu, induced ThermalState=%lld", (uint8_t *)&v4, 0x16u);
}

- (void)parseDisplayResults:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 objectForKeyedSubscript:@"BundleName"];
  int v4 = [a2 measurements];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_7_4(&dword_1E4220000, v5, v6, "!!! %s/%d: displayEntry[@\"BundleName\"]=%@, measuerment=%@", v7, v8, v9, v10, 2u);
}

- (void)computeNetworkingCostWithWifiIn:(uint64_t)a3 withWifiOut:(uint64_t)a4 withCellIn:(uint64_t)a5 withCellOut:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1E4220000, a1, a3, "cost=%f", a5, a6, a7, a8, 0);
}

- (void)computeLocationCostWithWifiCost:withGpsCost:withCellCost:withSkyhookCost:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: locationCost=%f", v2, v3, v4, v5, 2u);
}

- (void)computeGPUCostWithGPUSec:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: gpuCost=%f", v2, v3, v4, v5, 2u);
}

- (void)convertRawUsageToScore:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: rawUsage=%@", v2, v3, v4, v5, 2u);
}

- (void)requestDataFrom:withType:.cold.1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_4_3(&dword_1E4220000, v0, v1, "!!! %s/%d: request entry:%@, requestTime=%@", v2);
}

- (void)dataReceivedFrom:.cold.1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_4_3(&dword_1E4220000, v0, v1, "!!! %s/%d: return entry:%@, returnTime=%@", v2);
}

- (void)extractAndTranslateProcessIdentifier:.cold.1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_4_3(&dword_1E4220000, v0, v1, "!!! %s/%d: response=%@, payload=%@", v2);
}

- (void)translateProcessIdentifierWithInput:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 objectForKeyedSubscript:@"pid"];
  int v5 = [v4 intValue];
  uint64_t v6 = [a1 objectForKeyedSubscript:@"bundle_id"];
  uint64_t v7 = [a1 objectForKeyedSubscript:@"process_name"];
  *(_DWORD *)uint64_t v10 = 136316418;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v10[7] = 901;
  v10[9] = v8;
  int v11 = v5;
  __int16 v12 = 2112;
  double v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  __int16 v16 = 2112;
  uint64_t v17 = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "!!! %s/%d: Pid=%d, BundleID=%@, ProcessName=%@, input=%@", (uint8_t *)v10, 0x36u);
}

- (void)extractAndSetProcessIdentifierWithPayload:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 objectForKeyedSubscript:@"pid"];
  int v5 = [a1 objectForKeyedSubscript:@"bundle_id"];
  uint64_t v6 = [a1 objectForKeyedSubscript:@"process_name"];
  *(_DWORD *)__int16 v8 = 136316418;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v8[7] = 927;
  v8[9] = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  int v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "!!! %s/%d: Pid=%@, BundleID=%@, ProcessName=%@, response=%@", (uint8_t *)v8, 0x3Au);
}

- (void)extractAndSetProcessIdentifierWithPayload:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: something wrong; cannot find valid process identifier; payload=%@",
    v2,
    v3,
    v4,
    v5,
    2u);
}

- (void)startRoutineWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)startRoutineWithPayload:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)startRoutineWithPayload:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)startRoutineWithPayload:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)startRoutineWithPayload:.cold.5()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_4_3(&dword_1E4220000, v0, v1, "!!! %s/%d: pid (%@) is tracked already; usageDict=%@", v2);
}

- (void)startRoutineWithPayload:.cold.6()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)startRoutineWithPayload:.cold.7()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)startRoutineWithPayload:.cold.8()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)startRoutineWithPayload:.cold.9()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)stopRoutineWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)stopRoutineWithPayload:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: signalling PLBatteryGaugeService becoming inactive; usageDict=%@",
    v2,
    v3,
    v4,
    v5,
    2u);
}

- (void)stopRoutineWithPayload:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)stopRoutineWithPayload:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_4(&dword_1E4220000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
}

- (void)stopRoutineWithPayload:.cold.5()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_2(&dword_1E4220000, v0, v1, "!!! %s/%d: no more process to track; signalling PLBatteryGaugeService becoming inactive!",
    v2,
    v3,
    v4,
    v5,
    2u);
}

- (void)clearStateRoutine:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_2(&dword_1E4220000, v0, v1, "!!! %s/%d: no more process to track; signaling PLBatteryGaugeService becoming inactive!",
    v2,
    v3,
    v4,
    v5,
    2u);
}

- (void)compileSnapshotResponse
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 measurements];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1E4220000, a3, OS_LOG_TYPE_DEBUG, "Constructed raw measurement dictionaries: %@, %@", (uint8_t *)&v6, 0x16u);
}

- (void)DTQueryResponse:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_2(&dword_1E4220000, v0, v1, "%s/%d: trigger response timer!", v2, v3, v4, v5, 2u);
}

void __41__PLBatteryGaugeService_DTQueryResponse___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_2(&dword_1E4220000, v0, v1, "%s/%d: response timer fired!", v2, v3, v4, v5, 2u);
}

- (void)testGaugeServiceSingleInstance:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)uint64_t v3 = 136315650;
  OUTLINED_FUNCTION_11_2();
  *(_DWORD *)&v3[7] = 1459;
  v3[9] = v0;
  int v4 = v1;
  _os_log_debug_impl(&dword_1E4220000, v2, OS_LOG_TYPE_DEBUG, "%s/%d: iteration = %d", (uint8_t *)v3, 0x18u);
}

@end