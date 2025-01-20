@interface PLIOReportMetricsAgent
+ (void)load;
- (BOOL)allowlistedChannel:(id)a3;
- (IOReportGroupChecks)initGroupChecks;
- (NSDate)lastEntryDate;
- (NSMutableDictionary)sampleChannelsScreenState;
- (NSMutableDictionary)sampleChannelsSignificantBattery;
- (NSMutableDictionary)sampleChannelsSnapshot;
- (PLEntryNotificationOperatorComposition)batteryLevelChangedNotifications;
- (PLEntryNotificationOperatorComposition)displayOffNotification;
- (PLEntryNotificationOperatorComposition)displayOnNotification;
- (PLEntryNotificationOperatorComposition)screenstateChangedNotifications;
- (PLIOReportMetricsAgent)init;
- (PLMonotonicTimer)displayOffTimer;
- (PLNSNotificationOperatorComposition)enhancedScreenStateChangeListener;
- (PLStateTrackingComposition)stateTracker;
- (id)buildBaseSet:(IOReportGroupChecks *)a3;
- (id)buildScreenStateSet:(IOReportGroupChecks *)a3;
- (id)buildSnapshotSet:(IOReportGroupChecks *)a3;
- (id)channelDictionaryWithChannelSet:(id)a3 withMinProcessTime:(double)a4;
- (id)createCategoryString:(id)a3 forSubgroup:(id)a4;
- (id)sampleDeltaForChannelGroup:(id)a3;
- (id)sampleSnapshotForChannelGroup:(id)a3;
- (void)initOperatorDependancies;
- (void)log;
- (void)logDisplayOffAPWake;
- (void)logDisplayOffAPWakeStats;
- (void)logIOReportEntry:(id)a3 forCategory:(id)a4 withEntryDate:(id)a5 withAPWakeTime:(double)a6 isInterval:(BOOL)a7;
- (void)logIOReportIntervals:(id)a3 forChannelGroup:(id)a4;
- (void)logIOReportSnapshots:(id)a3;
- (void)logInit;
- (void)logSBC;
- (void)logScreenStateChange;
- (void)sampleDeltaForChannelSets;
- (void)setBatteryLevelChangedNotifications:(id)a3;
- (void)setDisplayOffNotification:(id)a3;
- (void)setDisplayOffTimer:(id)a3;
- (void)setDisplayOnNotification:(id)a3;
- (void)setEnhancedScreenStateChangeListener:(id)a3;
- (void)setLastEntryDate:(id)a3;
- (void)setSampleChannelsScreenState:(id)a3;
- (void)setSampleChannelsSignificantBattery:(id)a3;
- (void)setSampleChannelsSnapshot:(id)a3;
- (void)setScreenstateChangedNotifications:(id)a3;
- (void)setStateTracker:(id)a3;
- (void)startDisplayOffPeriodicTimer;
- (void)stopDisplayOffPeriodicTimer;
- (void)subscribeToChannelSets;
@end

@implementation PLIOReportMetricsAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLIOReportMetricsAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLIOReportMetricsAgent)init
{
  if ([MEMORY[0x1E4F929C0] BOOLForKey:@"DynamicIOReportMetricEnable" ifNotSet:1])
  {
    v6.receiver = self;
    v6.super_class = (Class)PLIOReportMetricsAgent;
    self = [(PLAgent *)&v6 init];
    v3 = self;
  }
  else
  {
    v4 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "IOReport Metrics: Dynamic telemetry disabled", buf, 2u);
    }

    v3 = 0;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  [(PLIOReportMetricsAgent *)self subscribeToChannelSets];
  [(PLIOReportMetricsAgent *)self sampleDeltaForChannelSets];
  v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLIOReportMetricsAgent *)self setLastEntryDate:v3];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke;
  v19[3] = &unk_1E692A0F0;
  v19[4] = self;
  v4 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v19];
  [(PLIOReportMetricsAgent *)self setBatteryLevelChangedNotifications:v4];

  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F92A28]);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_2;
    v18[3] = &unk_1E692A0F0;
    v18[4] = self;
    objc_super v6 = (PLNSNotificationOperatorComposition *)[v5 initWithOperator:self forNotification:@"com.apple.powerlog.EnhancedScreenState" withBlock:v18];
    enhancedScreenStateChangeListener = self->_enhancedScreenStateChangeListener;
    self->_enhancedScreenStateChangeListener = v6;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_23;
  v17[3] = &unk_1E692A0F0;
  v17[4] = self;
  v8 = [MEMORY[0x1E4F929E8] displayOffNotificationWithOperator:self withBlock:v17];
  [(PLIOReportMetricsAgent *)self setDisplayOffNotification:v8];

  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    v9 = [MEMORY[0x1E4F92A50] sharedInstance];
    [(PLIOReportMetricsAgent *)self setStateTracker:v9];

    v10 = [(PLIOReportMetricsAgent *)self stateTracker];
    [v10 registerForStates:8 withOperator:self withBlock:&__block_literal_global_27];

    if ([MEMORY[0x1E4F92A38] hasAOD])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_3;
      v16[3] = &unk_1E692A0F0;
      v16[4] = self;
      uint64_t v11 = [MEMORY[0x1E4F929E8] displayOffOrAODNotificationWithOperator:self withBlock:v16];
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_29;
      v15[3] = &unk_1E692A0F0;
      v15[4] = self;
      uint64_t v11 = [MEMORY[0x1E4F929E8] displayOffNotificationWithOperator:self withBlock:v15];
    }
    v12 = (void *)v11;
    [(PLIOReportMetricsAgent *)self setDisplayOffNotification:v11];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_30;
    v14[3] = &unk_1E692A0F0;
    v14[4] = self;
    v13 = [MEMORY[0x1E4F929E8] displayOnNotificationWithOperator:self withBlock:v14];
    [(PLIOReportMetricsAgent *)self setDisplayOnNotification:v13];
  }
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logSBC];
}

void __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLLogIOReportMetrics();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Notification for ScreenState change: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) logScreenStateChange];
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_23(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) logScreenStateChange];
  }
  return result;
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "AOD case: Received Display OFF Notification", v4, 2u);
    }

    return [*(id *)(v2 + 32) startDisplayOffPeriodicTimer];
  }
  return result;
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_29(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Non-AOD case: Received Display OFF Notification", v4, 2u);
    }

    return [*(id *)(v2 + 32) startDisplayOffPeriodicTimer];
  }
  return result;
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_30(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Received Display ON Notification", v4, 2u);
    }

    return [*(id *)(v2 + 32) stopDisplayOffPeriodicTimer];
  }
  return result;
}

- (IOReportGroupChecks)initGroupChecks
{
  int v2 = [MEMORY[0x1E4F929C0] taskMode];
  int v3 = [MEMORY[0x1E4F929C0] fullMode];
  if ([MEMORY[0x1E4F92A38] isWatch]) {
    int v4 = 0x10000;
  }
  else {
    int v4 = 0;
  }
  if (v3) {
    int v5 = 256;
  }
  else {
    int v5 = 0;
  }
  return (IOReportGroupChecks)(v5 | v2 | v4);
}

- (id)buildBaseSet:(IOReportGroupChecks *)a3
{
  v28[10] = *MEMORY[0x1E4F143B8];
  v27[0] = @"AMC Stats,Perf Counters";
  if (a3->var1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3->var0 && a3->var2;
  }
  uint64_t v23 = [NSNumber numberWithInt:v4];
  v28[0] = v23;
  v27[1] = @"SoC Stats,Events";
  if (a3->var1) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = a3->var0 && a3->var2;
  }
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", v5, v23);
  v28[1] = v6;
  v27[2] = @"SoC Stats,PMGR Counters";
  if (a3->var1) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = a3->var0 && a3->var2;
  }
  v8 = [NSNumber numberWithInt:v7];
  v28[2] = v8;
  v27[3] = @"SoC Stats,Device States";
  v9 = [NSNumber numberWithBool:a3->var1];
  v28[3] = v9;
  v27[4] = @"AOP-EXCLAVE,Power";
  BOOL v10 = a3->var0 || a3->var1;
  uint64_t v11 = [NSNumber numberWithInt:v10];
  v28[4] = v11;
  v27[5] = @"AOP2,Power";
  v12 = [NSNumber numberWithBool:a3->var1];
  v28[5] = v12;
  v27[6] = @"PMP,DCS Floor";
  v13 = [NSNumber numberWithBool:a3->var1];
  v28[6] = v13;
  v27[7] = @"PMP,SOC Floor";
  v14 = [NSNumber numberWithBool:a3->var1];
  v28[7] = v14;
  v27[8] = @"PMP,PMC AVE Floor";
  v15 = [NSNumber numberWithBool:a3->var1];
  v28[8] = v15;
  v27[9] = @"PMP,PMC DISP Floor";
  v16 = [NSNumber numberWithBool:a3->var1];
  v28[9] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:10];

  v18 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __39__PLIOReportMetricsAgent_buildBaseSet___block_invoke;
  v25[3] = &unk_1E692CC20;
  id v26 = v18;
  id v19 = v18;
  [v17 enumerateKeysAndObjectsUsingBlock:v25];
  if ([v19 count]) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

void __39__PLIOReportMetricsAgent_buildBaseSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 BOOLValue])
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v6 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_INFO, "Base set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)buildScreenStateSet:(IOReportGroupChecks *)a3
{
  v22[9] = *MEMORY[0x1E4F143B8];
  v21[0] = @"AMC Stats,Perf Counters";
  BOOL v4 = [NSNumber numberWithBool:a3->var0];
  v22[0] = v4;
  v21[1] = @"AOP2,Power";
  id v5 = [NSNumber numberWithBool:a3->var0];
  v22[1] = v5;
  v21[2] = @"PMP,DCS Floor";
  id v6 = [NSNumber numberWithBool:a3->var0];
  v22[2] = v6;
  v21[3] = @"PMP,SOC Floor";
  int v7 = [NSNumber numberWithBool:a3->var0];
  v22[3] = v7;
  v21[4] = @"PMP,PMC AVE Floor";
  id v8 = [NSNumber numberWithBool:a3->var0];
  v22[4] = v8;
  v21[5] = @"PMP,PMC DISP Floor";
  uint64_t v9 = [NSNumber numberWithBool:a3->var0];
  v22[5] = v9;
  v21[6] = @"SoC Stats,Events";
  BOOL v10 = [NSNumber numberWithBool:a3->var0];
  v22[6] = v10;
  v21[7] = @"SoC Stats,PMGR Counters";
  uint64_t v11 = [NSNumber numberWithBool:a3->var0];
  v22[7] = v11;
  v21[8] = @"SoC Stats,Device States";
  v12 = [NSNumber numberWithBool:a3->var0];
  v22[8] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:9];

  v14 = objc_opt_new();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__PLIOReportMetricsAgent_buildScreenStateSet___block_invoke;
  v19[3] = &unk_1E692CC20;
  id v20 = v14;
  id v15 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:v19];
  if ([v15 count]) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  return v17;
}

void __46__PLIOReportMetricsAgent_buildScreenStateSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 BOOLValue])
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v6 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_INFO, "ScreenState set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)buildSnapshotSet:(IOReportGroupChecks *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16 = @"SoC Stats,AON Fuse";
  BOOL v3 = a3->var0 || a3->var1;
  BOOL v4 = [NSNumber numberWithInt:v3];
  v17[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  id v6 = objc_opt_new();
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __43__PLIOReportMetricsAgent_buildSnapshotSet___block_invoke;
  v14 = &unk_1E692CC20;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v11];
  if (objc_msgSend(v7, "count", v11, v12, v13, v14)) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

void __43__PLIOReportMetricsAgent_buildSnapshotSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 BOOLValue])
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v6 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_INFO, "Snapshot set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)channelDictionaryWithChannelSet:(id)a3 withMinProcessTime:(double)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (const void *)IOReportCopyFilteredChannels();
  if (IOReportGetChannelCount())
  {
    Subscription = (void *)IOReportCreateSubscription();
    if (v6) {
      CFRelease(v6);
    }
    if (!Subscription) {
      goto LABEL_10;
    }
    if (IOReportGetChannelCount())
    {
      id v8 = objc_opt_new();
      [v8 setObject:Subscription forKeyedSubscript:@"subscription"];

      [v8 setObject:0 forKeyedSubscript:@"subscribedChannels"];
      uint64_t v9 = [NSNumber numberWithDouble:a4];
      [v8 setObject:v9 forKeyedSubscript:@"minNotificationProcessTime"];

      goto LABEL_11;
    }
    CFRelease(Subscription);
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = v6;
  }
  CFRelease(v10);
LABEL_10:
  id v8 = 0;
LABEL_11:

  return v8;
}

uint64_t __77__PLIOReportMetricsAgent_channelDictionaryWithChannelSet_withMinProcessTime___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D942A350]();
  BOOL v3 = IOReportChannelGetGroup();
  BOOL v4 = IOReportChannelGetSubGroup();
  if (v4)
  {
    id v5 = [v3 stringByAppendingString:@","];
    id v6 = [v5 stringByAppendingString:v4];
  }
  else
  {
    id v6 = v3;
  }
  int v7 = [*(id *)(a1 + 32) containsObject:v6];
  id v8 = PLLogIOReportMetrics();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "!!! Retain: groupSubgroupObj = %@ !!!", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v10 = 0;
  }
  else
  {
    if (v9)
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "!!! Remove: groupSubgroupObj = %@ !!!", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v10 = 16;
  }

  return v10;
}

- (void)subscribeToChannelSets
{
  uint64_t v3 = (uint64_t)[(PLIOReportMetricsAgent *)self initGroupChecks];
  __int16 v13 = v3;
  char v14 = BYTE2(v3);
  BOOL v4 = [(PLIOReportMetricsAgent *)self buildBaseSet:&v13];
  if (v4)
  {
    id v5 = [(PLIOReportMetricsAgent *)self channelDictionaryWithChannelSet:v4 withMinProcessTime:-300.0];
    sampleChannelsSignificantBattery = self->_sampleChannelsSignificantBattery;
    self->_sampleChannelsSignificantBattery = v5;
  }
  int v7 = [(PLIOReportMetricsAgent *)self buildScreenStateSet:&v13];
  if (v7)
  {
    id v8 = [(PLIOReportMetricsAgent *)self channelDictionaryWithChannelSet:v7 withMinProcessTime:0.0];
    sampleChannelsScreenState = self->_sampleChannelsScreenState;
    self->_sampleChannelsScreenState = v8;
  }
  uint64_t v10 = [(PLIOReportMetricsAgent *)self buildSnapshotSet:&v13];
  if (v10)
  {
    uint64_t v11 = [(PLIOReportMetricsAgent *)self channelDictionaryWithChannelSet:v10 withMinProcessTime:-300.0];
    sampleChannelsSnapshot = self->_sampleChannelsSnapshot;
    self->_sampleChannelsSnapshot = v11;
  }
}

- (void)sampleDeltaForChannelSets
{
  if (self->_sampleChannelsSignificantBattery) {
    id v3 = -[PLIOReportMetricsAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
  }
  if (self->_sampleChannelsScreenState) {
    id v4 = -[PLIOReportMetricsAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
  }
}

- (id)sampleDeltaForChannelGroup:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1D942A350]();
  if (v3)
  {
    id v5 = [v3 objectForKey:@"currentSample"];
    [v3 setObject:v5 forKeyedSubscript:@"lastSample"];

    id v6 = [v3 objectForKey:@"currentSampleDate"];
    [v3 setObject:v6 forKeyedSubscript:@"lastSampleDate"];

    int v7 = [v3 objectForKey:@"currentSampleAPWakeTime"];
    [v3 setObject:v7 forKeyedSubscript:@"lastSampleAPWakeTime"];

    [v3 objectForKey:@"subscription"];
    [v3 objectForKey:@"subscribedChannels"];
    Samples = (void *)IOReportCreateSamples();
    BOOL v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v3 setObject:v9 forKeyedSubscript:@"currentSampleDate"];

    [v3 setObject:Samples forKeyedSubscript:@"currentSample"];
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    [v3 setObject:v10 forKeyedSubscript:@"currentSampleAPWakeTime"];

    uint64_t v11 = [v3 objectForKey:@"lastSample"];

    if (v11)
    {
      [v3 objectForKey:@"lastSample"];
      [v3 objectForKey:@"currentSample"];
      SamplesDelta = (void *)IOReportCreateSamplesDelta();
      [v3 removeObjectForKey:@"lastSample"];
      goto LABEL_7;
    }
    uint64_t v13 = [v3 objectForKey:@"currentSample"];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  SamplesDelta = (void *)v13;
LABEL_7:

  return SamplesDelta;
}

- (id)sampleSnapshotForChannelGroup:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1D942A350]();
  id v5 = [v3 objectForKeyedSubscript:@"subscription"];

  uint64_t v6 = [v3 objectForKeyedSubscript:@"subscribedChannels"];
  int v7 = (void *)v6;
  Samples = 0;
  if (v3 && v5 && v6)
  {
    BOOL v9 = [v3 objectForKey:@"cachedSample"];

    if (v9)
    {
      Samples = [v3 objectForKeyedSubscript:@"cachedSample"];
      if (!IOReportUpdateSamples())
      {
        [v3 removeObjectForKey:@"cachedSample"];
        goto LABEL_9;
      }
    }
    else
    {
      Samples = (void *)IOReportCreateSamples();
      if (!Samples) {
        goto LABEL_9;
      }
    }
    [v3 setObject:Samples forKeyedSubscript:@"cachedSample"];
  }
LABEL_9:

  return Samples;
}

- (void)log
{
  [(PLIOReportMetricsAgent *)self logInit];
  [(PLIOReportMetricsAgent *)self logSBC];
  [(PLIOReportMetricsAgent *)self logScreenStateChange];
}

- (void)logInit
{
  id v4 = [(PLIOReportMetricsAgent *)self sampleChannelsSnapshot];
  id v3 = [(PLIOReportMetricsAgent *)self sampleSnapshotForChannelGroup:v4];
  [(PLIOReportMetricsAgent *)self logIOReportSnapshots:v3];
}

- (void)logSBC
{
  id v5 = [(PLIOReportMetricsAgent *)self sampleChannelsSignificantBattery];
  id v3 = [(PLIOReportMetricsAgent *)self sampleDeltaForChannelGroup:v5];
  id v4 = [(PLIOReportMetricsAgent *)self sampleChannelsSignificantBattery];
  [(PLIOReportMetricsAgent *)self logIOReportIntervals:v3 forChannelGroup:v4];
}

- (void)logScreenStateChange
{
  id v5 = [(PLIOReportMetricsAgent *)self sampleChannelsScreenState];
  id v3 = [(PLIOReportMetricsAgent *)self sampleDeltaForChannelGroup:v5];
  id v4 = [(PLIOReportMetricsAgent *)self sampleChannelsScreenState];
  [(PLIOReportMetricsAgent *)self logIOReportIntervals:v3 forChannelGroup:v4];
}

- (void)logDisplayOffAPWake
{
  id v5 = [(PLIOReportMetricsAgent *)self sampleChannelsScreenState];
  id v3 = [(PLIOReportMetricsAgent *)self sampleDeltaForChannelGroup:v5];
  id v4 = [(PLIOReportMetricsAgent *)self sampleChannelsScreenState];
  [(PLIOReportMetricsAgent *)self logIOReportIntervals:v3 forChannelGroup:v4];
}

- (void)logIOReportSnapshots:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"IOReportChannelGroups"];
  uint64_t v6 = [v5 allKeys];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PLIOReportMetricsAgent_logIOReportSnapshots___block_invoke;
  v8[3] = &unk_1E692CDD8;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __47__PLIOReportMetricsAgent_logIOReportSnapshots___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKey:@"IOReportChannelGroups"];
  id v5 = [v4 objectForKey:v3];

  uint64_t v6 = [v5 objectForKey:@"IOReportChannelGroups"];
  id v7 = [v6 allKeys];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__PLIOReportMetricsAgent_logIOReportSnapshots___block_invoke_2;
  v11[3] = &unk_1E692CE28;
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v3;
  id v9 = v3;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v11];
}

void __47__PLIOReportMetricsAgent_logIOReportSnapshots___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKey:@"IOReportChannelGroups"];
  id v7 = [v5 objectForKey:v4];

  uint64_t v6 = [*(id *)(a1 + 40) createCategoryString:*(void *)(a1 + 48) forSubgroup:v4];

  [*(id *)(a1 + 40) logIOReportEntry:v7 forCategory:v6 withEntryDate:0 withAPWakeTime:0 isInterval:0.0];
}

- (void)logIOReportIntervals:(id)a3 forChannelGroup:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D942A350]();
  if (v6)
  {
    v34 = v8;
    v42 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v9 = [v7 objectForKey:@"currentSampleAPWakeTime"];
    uint64_t v10 = [v9 unsignedLongLongValue];

    id v35 = v7;
    uint64_t v11 = [v7 objectForKey:@"lastSampleAPWakeTime"];
    uint64_t v12 = [v11 unsignedLongLongValue];

    [MEMORY[0x1E4F92A88] secondsFromMachTime:v10];
    double v14 = v13;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v12];
    double v16 = v15;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v17 = [v6 objectForKey:@"IOReportChannelGroups"];
    v18 = [v17 allKeys];

    id obj = v18;
    uint64_t v39 = [v18 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v39)
    {
      double v19 = v14 - v16;
      uint64_t v37 = *(void *)v48;
      id v38 = v6;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v48 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = v20;
          uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8 * v20);
          context = (void *)MEMORY[0x1D942A350]();
          v22 = [v6 objectForKey:@"IOReportChannelGroups"];
          uint64_t v23 = [v22 objectForKey:v21];

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v24 = [v23 objectForKey:@"IOReportChannelGroups"];
          v25 = [v24 allKeys];

          uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v44;
            do
            {
              uint64_t v29 = 0;
              do
              {
                if (*(void *)v44 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * v29);
                v31 = [v23 objectForKey:@"IOReportChannelGroups"];
                v32 = [v31 objectForKey:v30];

                v33 = [(PLIOReportMetricsAgent *)self createCategoryString:v21 forSubgroup:v30];
                [(PLIOReportMetricsAgent *)self logIOReportEntry:v32 forCategory:v33 withEntryDate:v42 withAPWakeTime:1 isInterval:v19];

                ++v29;
              }
              while (v27 != v29);
              uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
            }
            while (v27);
          }

          uint64_t v20 = v41 + 1;
          id v6 = v38;
        }
        while (v41 + 1 != v39);
        uint64_t v39 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v39);
    }

    [(PLIOReportMetricsAgent *)self setLastEntryDate:v42];
    uint64_t v8 = v34;
    id v7 = v35;
  }
}

- (void)logIOReportEntry:(id)a3 forCategory:(id)a4 withEntryDate:(id)a5 withAPWakeTime:(double)a6 isInterval:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v15 = (void *)MEMORY[0x1D942A350]();
  double v16 = [MEMORY[0x1E4F1CA60] dictionary];
  id v17 = objc_opt_new();
  if (v7)
  {
    v18 = [NSNumber numberWithDouble:a6];
    [v16 setObject:v18 forKeyedSubscript:@"APWakeTime"];

    [v16 setObject:v14 forKeyedSubscript:@"timestampEnd"];
  }
  char v19 = [v13 isEqualToString:@"AOP2Power"];
  char v20 = [v13 isEqualToString:@"AOP-EXCLAVEPower"] | v19;
  id v21 = v17;
  id v22 = v16;
  id v23 = v13;
  IOReportIterate();
  if ((v20 & 1) == 0) {
    [v22 setObject:v21 forKeyedSubscript:@"__PPSKVPairs__"];
  }
  v24 = PLLogIOReportMetrics();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v23;
    __int16 v28 = 2112;
    id v29 = v22;
    _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "IOReportMetrics: category = %@, payload = %@", buf, 0x16u);
  }

  v25 = [(PLIOReportMetricsAgent *)self lastEntryDate];
  [(PLOperator *)self logForSubsystem:@"IOReportMetrics" category:v23 data:v22 date:v25];
}

uint64_t __95__PLIOReportMetricsAgent_logIOReportEntry_forCategory_withEntryDate_withAPWakeTime_isInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  v61[2] = *MEMORY[0x1E4F143B8];
  v54 = IOReportChannelGetChannelName();
  int Format = IOReportChannelGetFormat();
  uint64_t v53 = a1;
  if (Format != 3)
  {
    if (Format != 2)
    {
      if (Format == 1)
      {
        id v5 = [NSNumber numberWithLongLong:IOReportSimpleGetIntegerValue()];
        id v6 = v5;
        if (v54 && v5)
        {
          if (*(unsigned char *)(a1 + 64))
          {
            if ([v5 unsignedIntegerValue])
            {
              BOOL v7 = *(void **)(a1 + 32);
              v60[0] = @"Channel";
              v60[1] = @"Value";
              v61[0] = v54;
              v61[1] = v6;
              uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
              [v7 addObject:v8];
            }
          }
          else
          {
            [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v54];
          }
        }
      }
      goto LABEL_47;
    }
    if ([MEMORY[0x1E4F92A38] internalBuild]
      && [*(id *)(a1 + 48) isEqualToString:@"SoCStatsDeviceStates"])
    {
      if (![*(id *)(a1 + 56) allowlistedChannel:v54]) {
        goto LABEL_47;
      }
      v31 = PLLogIOReportMetrics();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v54;
        _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "IOReportMetrics: Device States channel %@ is allowlisted", buf, 0xCu);
      }
    }
    int Count = IOReportStateGetCount();
    if (Count < 1) {
      goto LABEL_47;
    }
    int v33 = Count;
    uint64_t v34 = 0;
    unint64_t v35 = 0x1E4F29000uLL;
    v36 = @"%@_%@";
    unint64_t v37 = 0x1E4F28000uLL;
    while (1)
    {
      id v38 = IOReportStateGetNameForIndex();
      if (!v38) {
        break;
      }
      uint64_t v39 = v38;
      if ([v38 caseInsensitiveCompare:@"OFF"]
        && [v39 caseInsensitiveCompare:@"INACT"]
        && [v39 caseInsensitiveCompare:@"PWROFF"])
      {
        goto LABEL_34;
      }
LABEL_43:

      uint64_t v34 = (v34 + 1);
      if (v33 == v34) {
        goto LABEL_47;
      }
    }
    uint64_t v39 = objc_msgSend(*(id *)(v35 + 24), "stringWithFormat:", @"%d", v34);
LABEL_34:
    v40 = objc_msgSend(*(id *)(v35 + 24), "stringWithFormat:", v36, v54, v39);
    uint64_t v41 = *(void **)(v37 + 3792);
    IOReportStateGetDutyCycle();
    v42 = objc_msgSend(v41, "numberWithDouble:");
    long long v43 = v42;
    if (v40) {
      BOOL v44 = v42 == 0;
    }
    else {
      BOOL v44 = 1;
    }
    if (!v44)
    {
      if (*(unsigned char *)(v53 + 64))
      {
        [v42 doubleValue];
        if (v45 >= 0.0)
        {
          long long v46 = *(void **)(v53 + 32);
          v57[0] = @"Channel";
          v57[1] = @"DutyCycle";
          v58[0] = v40;
          v58[1] = v43;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
          unint64_t v47 = v37;
          v49 = long long v48 = v36;
          long long v50 = v46;
          unint64_t v35 = 0x1E4F29000;
          [v50 addObject:v49];

          v36 = v48;
          unint64_t v37 = v47;
        }
      }
      else
      {
        [*(id *)(v53 + 40) setObject:v42 forKeyedSubscript:v40];
      }
    }

    goto LABEL_43;
  }
  *(void *)buf = 0;
  uint64_t BucketCount = IOReportHistogramGetBucketCount();
  if ((int)BucketCount >= 1)
  {
    uint64_t v10 = BucketCount;
    int v11 = 0;
    unint64_t v12 = 0x1E4F29000uLL;
    id v13 = @"ms";
    id v14 = @"%.1f%@-%.1f%@";
    unint64_t v15 = 0x1E4F28000uLL;
    do
    {
      IOReportHistogramGetBucketBounds();
      IOReportChannelGetUnit();
      double v16 = *(void **)(v12 + 24);
      IOReportScaleValue();
      uint64_t v18 = v17;
      IOReportScaleValue();
      char v20 = objc_msgSend(v16, "stringWithFormat:", v14, v18, v13, v19, v13);
      uint64_t v21 = [*(id *)(v15 + 3792) numberWithUnsignedLongLong:IOReportHistogramGetBucketHits()];
      id v22 = (void *)v21;
      if (v20) {
        BOOL v23 = v21 == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (!v23)
      {
        if (*(unsigned char *)(a1 + 64))
        {
          v52 = *(void **)(a1 + 32);
          v55[0] = @"Channel";
          v55[1] = @"DutyCycle";
          v56[0] = v20;
          v56[1] = v21;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
          uint64_t v24 = a2;
          uint64_t v25 = v10;
          uint64_t v26 = v13;
          id v27 = v14;
          unint64_t v28 = v15;
          v30 = unint64_t v29 = v12;
          [v52 addObject:v30];

          unint64_t v12 = v29;
          unint64_t v15 = v28;
          id v14 = v27;
          id v13 = v26;
          uint64_t v10 = v25;
          a2 = v24;
          a1 = v53;
        }
        else
        {
          [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:v20];
        }
      }

      ++v11;
    }
    while (v10 != v11);
  }
LABEL_47:

  return 0;
}

- (void)startDisplayOffPeriodicTimer
{
  if (!self->_displayOffTimer)
  {
    id v3 = (void *)MEMORY[0x1E4F92A18];
    id v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v5 = [(PLOperator *)self workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PLIOReportMetricsAgent_startDisplayOffPeriodicTimer__block_invoke;
    v10[3] = &unk_1E692B308;
    v10[4] = self;
    id v6 = [v3 scheduledTimerWithMonotonicFireDate:v4 withInterval:v5 withQueue:v10 withBlock:180.0];
    displayOffTimer = self->_displayOffTimer;
    self->_displayOffTimer = v6;

    uint64_t v8 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v9 = 0;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Display OFF timer started", v9, 2u);
    }
  }
}

uint64_t __54__PLIOReportMetricsAgent_startDisplayOffPeriodicTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logDisplayOffAPWakeStats];
}

- (void)stopDisplayOffPeriodicTimer
{
  displayOffTimer = self->_displayOffTimer;
  if (displayOffTimer)
  {
    [(PLMonotonicTimer *)displayOffTimer cancel];
    id v4 = self->_displayOffTimer;
    self->_displayOffTimer = 0;

    id v5 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Display OFF timer stopped", v6, 2u);
    }
  }
}

- (void)logDisplayOffAPWakeStats
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    id v3 = [(PLStateTrackingComposition *)self->_stateTracker getCurrState:8];
    int v4 = [v3 BOOLValue];
    id v5 = PLLogIOReportMetrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "logDisplayOffAPWakeStats: AP ON is %d", (uint8_t *)v7, 8u);
    }

    if (v4)
    {
      id v6 = PLLogIOReportMetrics();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7[0]) = 0;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Log table entries at display OFF + AP ON occurrence", (uint8_t *)v7, 2u);
      }

      [(PLIOReportMetricsAgent *)self logDisplayOffAPWake];
    }
  }
}

- (id)createCategoryString:(id)a3 forSubgroup:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = [v5 stringByAppendingString:a4];
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = v7;
  id v9 = (void *)[v7 mutableCopy];
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @" ", &stru_1F294E108, 0, 0, objc_msgSend(v9, "length"));

  return v9;
}

- (BOOL)allowlistedChannel:(id)a3
{
  id v3 = a3;
  if (qword_1EBD589A0 != -1) {
    dispatch_once(&qword_1EBD589A0, &__block_literal_global_167);
  }
  if (qword_1EBD58998) {
    char v4 = [(id)qword_1EBD58998 containsObject:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __45__PLIOReportMetricsAgent_allowlistedChannel___block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiPhone];
  if (result)
  {
    uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
    if ((int)result >= 1001021)
    {
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ATC0_COMMON", @"ATC0_USB", @"VENC0_DMA", @"VENC1_DMA", @"VENC0_SYS", @"VENC1_SYS", @"VENC0_PIPE4", @"VENC1_PIPE4", @"VENC0_PIPE5", @"VENC1_PIPE5", @"VENC0_ME0", @"VENC1_ME0", @"VENC0_ME1", @"VENC1_ME1", @"ISP_SYS", @"ISP_CPU", @"ISP_FE",
      qword_1EBD58998 = 0);
      return MEMORY[0x1F41817F8]();
    }
  }
  return result;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChangedNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBatteryLevelChangedNotifications:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)screenstateChangedNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScreenstateChangedNotifications:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayOffNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisplayOffNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayOnNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayOnNotification:(id)a3
{
}

- (PLNSNotificationOperatorComposition)enhancedScreenStateChangeListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEnhancedScreenStateChangeListener:(id)a3
{
}

- (PLStateTrackingComposition)stateTracker
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStateTracker:(id)a3
{
}

- (PLMonotonicTimer)displayOffTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayOffTimer:(id)a3
{
}

- (NSMutableDictionary)sampleChannelsSignificantBattery
{
  return self->_sampleChannelsSignificantBattery;
}

- (void)setSampleChannelsSignificantBattery:(id)a3
{
}

- (NSMutableDictionary)sampleChannelsScreenState
{
  return self->_sampleChannelsScreenState;
}

- (void)setSampleChannelsScreenState:(id)a3
{
}

- (NSMutableDictionary)sampleChannelsSnapshot
{
  return self->_sampleChannelsSnapshot;
}

- (void)setSampleChannelsSnapshot:(id)a3
{
}

- (NSDate)lastEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastEntryDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEntryDate, 0);
  objc_storeStrong((id *)&self->_sampleChannelsSnapshot, 0);
  objc_storeStrong((id *)&self->_sampleChannelsScreenState, 0);
  objc_storeStrong((id *)&self->_sampleChannelsSignificantBattery, 0);
  objc_storeStrong((id *)&self->_displayOffTimer, 0);
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_enhancedScreenStateChangeListener, 0);
  objc_storeStrong((id *)&self->_displayOnNotification, 0);
  objc_storeStrong((id *)&self->_displayOffNotification, 0);
  objc_storeStrong((id *)&self->_screenstateChangedNotifications, 0);
  objc_storeStrong((id *)&self->_batteryLevelChangedNotifications, 0);
}

@end