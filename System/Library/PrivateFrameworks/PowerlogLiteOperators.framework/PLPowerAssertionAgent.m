@interface PLPowerAssertionAgent
+ (BOOL)shouldOptimizeSmallAssertions;
+ (id)defaults;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionAssertion;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionAggregateReset;
+ (id)entryEventPointDefinitionBufferStatus;
+ (id)entryEventPointDefinitionSnapshotReason;
+ (id)entryEventPointDefinitionTimedOutProcesses;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)assertionBufferFullNotificationActive;
- (BOOL)assertionSnapshotTimerActive;
- (BOOL)firstBufferDrain;
- (BOOL)gameMode;
- (BOOL)lastActivityOverflow;
- (NSDictionary)assertTypeToEnum;
- (NSDictionary)startEndActionsToEnum;
- (NSMutableArray)assertionBufferNotificationTracking;
- (NSMutableDictionary)UUIDStartEntryCache;
- (NSMutableDictionary)assertionAggregatedLastSample;
- (NSMutableDictionary)assertionAggregatedLastSamplePLDataStructure;
- (NSMutableDictionary)assertionUUIDCache;
- (NSMutableDictionary)subSecondUUIDStartEntryCache;
- (NSSet)logAssertNameForActions;
- (PLCFNotificationOperatorComposition)assertionBufferFullNotification;
- (PLCFNotificationOperatorComposition)assertionNotification;
- (PLCFNotificationOperatorComposition)flushAssertionBufferCFNotification;
- (PLEntryNotificationOperatorComposition)batteryLevelNotificiations;
- (PLEntryNotificationOperatorComposition)canSleepNotification;
- (PLEntryNotificationOperatorComposition)wakeNotification;
- (PLNSNotificationOperatorComposition)consoleModeListener;
- (PLNSNotificationOperatorComposition)dailyTaskNotification;
- (PLPowerAssertionAgent)init;
- (PLTimer)assertionBufferFullNotificationRearmTimer;
- (PLTimer)assertionSnapShotTimer;
- (PLTimer)runQueryTimer;
- (id)assertTypeToEnumMapping;
- (id)bundleIDForAssertionProcessPID:(int)a3;
- (id)sanitizeAssertionNameForEntry:(id)a3;
- (id)startEndActionsToEnumMapping;
- (int64_t)aggregateMaxPIDCount;
- (int64_t)aggregteZeroDeltaCount;
- (void)checkAssertionBufferFullNotificationRate;
- (void)initOperatorDependancies;
- (void)logAggregatedAssertionActivity;
- (void)logAggregatedAssertionActivityPLDataStructure;
- (void)logEventForwardAssertion;
- (void)logEventForwardAssertionWithReason:(id)a3 asSnapshot:(BOOL)a4;
- (void)logEventPointAggregateResetWithReason:(signed __int16)a3 withPidCount:(int)a4;
- (void)logInterval:(id)a3;
- (void)logSnapshot:(id)a3;
- (void)logSnapshotAtMidnight:(id)a3;
- (void)resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:(signed __int16)a3 withPidCount:(int)a4;
- (void)resetIOPMSetAssertionActivityAggregateWithReason:(signed __int16)a3 withPidCount:(int)a4;
- (void)setAggregateMaxPIDCount:(int64_t)a3;
- (void)setAggregteZeroDeltaCount:(int64_t)a3;
- (void)setAssertionAggregatedLastSample:(id)a3;
- (void)setAssertionAggregatedLastSamplePLDataStructure:(id)a3;
- (void)setAssertionBufferFullNotification:(id)a3;
- (void)setAssertionBufferFullNotificationActive:(BOOL)a3;
- (void)setAssertionBufferFullNotificationActive:(BOOL)a3 withReason:(id)a4;
- (void)setAssertionBufferFullNotificationRearmTimer:(id)a3;
- (void)setAssertionBufferNotificationTracking:(id)a3;
- (void)setAssertionNotification:(id)a3;
- (void)setAssertionSnapShotTimer:(id)a3;
- (void)setAssertionSnapshotTimerActive:(BOOL)a3;
- (void)setAssertionUUIDCache:(id)a3;
- (void)setBatteryLevelNotificiations:(id)a3;
- (void)setCanSleepNotification:(id)a3;
- (void)setConsoleModeListener:(id)a3;
- (void)setDailyTaskNotification:(id)a3;
- (void)setFirstBufferDrain:(BOOL)a3;
- (void)setFlushAssertionBufferCFNotification:(id)a3;
- (void)setGameMode:(BOOL)a3;
- (void)setLastActivityOverflow:(BOOL)a3;
- (void)setRunQueryTimer:(id)a3;
- (void)setSubSecondUUIDStartEntryCache:(id)a3;
- (void)setUUIDStartEntryCache:(id)a3;
- (void)setWakeNotification:(id)a3;
@end

@implementation PLPowerAssertionAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPowerAssertionAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1F29E9108;
}

+ (id)entryEventPointDefinitions
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"SnapshotReason";
  v3 = [a1 entryEventPointDefinitionSnapshotReason];
  v10[0] = v3;
  v9[1] = @"BufferStatus";
  v4 = [a1 entryEventPointDefinitionBufferStatus];
  v10[1] = v4;
  v9[2] = @"AggregateReset";
  v5 = [a1 entryEventPointDefinitionAggregateReset];
  v10[2] = v5;
  v9[3] = @"TimedOutProcesses";
  v6 = [a1 entryEventPointDefinitionTimedOutProcesses];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

+ (id)entryEventPointDefinitionAggregateReset
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0560;
  v14[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"PidCount";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"Reason";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionTimedOutProcesses
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0560;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"ProcessName";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withProcessName");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"Assertion";
  uint64_t v2 = [a1 entryEventForwardDefinitionAssertion];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionAssertion
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v38[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C00];
  v36[0] = *MEMORY[0x1E4F92CD0];
  v36[1] = v2;
  v37[0] = &unk_1F29F0570;
  v37[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92C08];
  v36[2] = *MEMORY[0x1E4F92C40];
  v36[3] = v3;
  v37[2] = MEMORY[0x1E4F1CC38];
  v37[3] = MEMORY[0x1E4F1CC38];
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];
  v39[0] = v31;
  v38[1] = *MEMORY[0x1E4F92CA8];
  v34[0] = @"Action";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v35[0] = v29;
  v34[1] = @"timestampActionOffset";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v35[1] = v27;
  v34[2] = @"GlobalUniqueID";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v35[2] = v25;
  v34[3] = @"pid";
  uint64_t v4 = *MEMORY[0x1E4F92CA0];
  v32[0] = *MEMORY[0x1E4F92D10];
  v32[1] = v4;
  v33[0] = &unk_1F29E5188;
  v33[1] = &unk_1F29ED7C0;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  v35[3] = v24;
  v34[4] = @"AssertName";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_StringFormat");
  v35[4] = v22;
  v34[5] = @"AssertType";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v35[5] = v20;
  v34[6] = @"AssertionOnBehalfOfPID";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v35[6] = v18;
  v34[7] = @"GlobalUniqueIDReference";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v35[7] = v16;
  v34[8] = @"FrameworkBundleID";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v35[8] = v6;
  v34[9] = @"InstanceMetadata";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v35[9] = v8;
  v34[10] = @"Category";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v35[10] = v10;
  v34[11] = @"IsCoalesced";
  v11 = [MEMORY[0x1E4F929D8] sharedInstance];
  v12 = objc_msgSend(v11, "commonTypeDict_BoolFormat");
  v35[11] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:12];
  v39[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

  return v14;
}

+ (id)entryEventPointDefinitionSnapshotReason
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0580;
  v12[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Reason";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionBufferStatus
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0580;
  v14[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"Reason";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"TotalCount";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLPowerAssertionAgent)init
{
  v14.receiver = self;
  v14.super_class = (Class)PLPowerAssertionAgent;
  uint64_t v2 = [(PLAgent *)&v14 init];
  uint64_t v3 = v2;
  if (v2)
  {
    assertionBufferFullNotificationRearmTimer = v2->_assertionBufferFullNotificationRearmTimer;
    v2->_assertionBufferFullNotificationRearmTimer = 0;

    v3->_assertionBufferFullNotificationActive = 0;
    uint64_t v5 = objc_opt_new();
    assertionBufferNotificationTracking = v3->_assertionBufferNotificationTracking;
    v3->_assertionBufferNotificationTracking = (NSMutableArray *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assertionUUIDCache = v3->_assertionUUIDCache;
    v3->_assertionUUIDCache = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    UUIDStartEntryCache = v3->_UUIDStartEntryCache;
    v3->_UUIDStartEntryCache = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    subSecondUUIDStartEntryCache = v3->_subSecondUUIDStartEntryCache;
    v3->_subSecondUUIDStartEntryCache = v11;

    v3->_gameMode = 0;
  }
  return v3;
}

- (void)initOperatorDependancies
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLPowerAssertionAgent *)self startEndActionsToEnumMapping];
  startEndActionsToEnum = self->_startEndActionsToEnum;
  self->_startEndActionsToEnum = v3;

  uint64_t v5 = [(PLPowerAssertionAgent *)self assertTypeToEnumMapping];
  assertTypeToEnum = self->_assertTypeToEnum;
  self->_assertTypeToEnum = v5;

  v7 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F29E51A0, &unk_1F29E51B8, &unk_1F29E51D0, &unk_1F29E51E8, 0);
  logAssertNameForActions = self->_logAssertNameForActions;
  self->_logAssertNameForActions = v7;

  v9 = (NSMutableDictionary *)objc_opt_new();
  assertionAggregatedLastSamplePLDataStructure = self->_assertionAggregatedLastSamplePLDataStructure;
  self->_assertionAggregatedLastSamplePLDataStructure = v9;

  v11 = (NSMutableDictionary *)objc_opt_new();
  assertionAggregatedLastSample = self->_assertionAggregatedLastSample;
  self->_assertionAggregatedLastSample = v11;

  [(PLPowerAssertionAgent *)self resetIOPMSetAssertionActivityAggregateWithReason:1 withPidCount:0];
  self->_firstBufferDrain = 1;
  self->_lastActivityOverflow = 0;
  uint64_t v13 = IOPMSetAssertionActivityLog();
  [(PLOperator *)self defaultDoubleForKey:@"AggregateAssertionResetTime"];
  double v15 = v14;
  id v16 = objc_alloc(MEMORY[0x1E4F92A80]);
  v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v15];
  v18 = [(PLOperator *)self workQueue];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke;
  v56[3] = &unk_1E692A200;
  v56[4] = self;
  v19 = (void *)[v16 initWithFireDate:v17 withInterval:1 withTolerance:0 repeats:v18 withUserInfo:v56 withQueue:v15 withBlock:0.0];
  [(PLPowerAssertionAgent *)self setRunQueryTimer:v19];

  if ([(PLOperator *)self isDebugEnabled])
  {
    if (v13)
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"******  ERROR ********* 0x%x", v13);
      v21 = (void *)MEMORY[0x1E4F929B8];
      v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v23 = [v22 lastPathComponent];
      v24 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent initOperatorDependancies]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:350];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v20;
LABEL_15:
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    else
    {
      v20 = [NSString stringWithFormat:@"We have assertion Activity logging"];
      v26 = (void *)MEMORY[0x1E4F929B8];
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v28 = [v27 lastPathComponent];
      v29 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent initOperatorDependancies]"];
      [v26 logMessage:v20 fromFile:v28 fromFunction:v29 fromLineNumber:352];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v20;
        goto LABEL_15;
      }
    }
  }
  if ([(PLOperator *)self defaultBoolForKey:@"AnyChange"])
  {
    v30 = objc_opt_new();
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_159;
    v55[3] = &unk_1E692A0F0;
    v55[4] = self;
    v31 = (void *)[v30 initWithOperator:self forNotification:@"com.apple.system.powermanagement.assertions.anychange" requireState:0 withBlock:v55];
    [(PLPowerAssertionAgent *)self setAssertionNotification:v31];

    IOPMAssertionNotify();
  }
  id v32 = objc_alloc(MEMORY[0x1E4F929A0]);
  v33 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_170;
  v54[3] = &unk_1E692A0F0;
  v54[4] = self;
  v34 = (void *)[v32 initWithWorkQueue:v33 forNotification:@"com.apple.powerlogd.flushAssertionBuffer" requireState:0 withBlock:v54];

  [(PLPowerAssertionAgent *)self setFlushAssertionBufferCFNotification:v34];
  v35 = objc_opt_new();
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_181;
  v53[3] = &unk_1E692A0F0;
  v53[4] = self;
  v36 = (void *)[v35 initWithOperator:self forNotification:@"com.apple.powermanagement.assertions.logHighWM" requireState:0 withBlock:v53];
  [(PLPowerAssertionAgent *)self setAssertionBufferFullNotification:v36];

  [(PLPowerAssertionAgent *)self setAssertionBufferFullNotificationActive:1 withReason:@"init"];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_190;
  v52[3] = &unk_1E692A0F0;
  v52[4] = self;
  v37 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v52];
  [(PLPowerAssertionAgent *)self setBatteryLevelNotificiations:v37];

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_195;
  v51[3] = &unk_1E692A0F0;
  v51[4] = self;
  v38 = [MEMORY[0x1E4F929E8] wakeEntryNotificationWithOperator:self withBlock:v51];
  [(PLPowerAssertionAgent *)self setWakeNotification:v38];

  [(PLPowerAssertionAgent *)self setAssertionSnapshotTimerActive:1];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_199;
  v50[3] = &unk_1E692A0F0;
  v50[4] = self;
  v39 = [MEMORY[0x1E4F929E8] canSleepEntryNotificationWithOperator:self withBlock:v50];
  [(PLPowerAssertionAgent *)self setCanSleepNotification:v39];

  id v40 = objc_alloc(MEMORY[0x1E4F92A28]);
  v41 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
  uint64_t v42 = *MEMORY[0x1E4F1C2E0];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_3;
  v49[3] = &unk_1E692A0F0;
  v49[4] = self;
  v43 = (void *)[v40 initWithWorkQueue:v41 forNotification:v42 withBlock:v49];

  [(PLPowerAssertionAgent *)self setDailyTaskNotification:v43];
  self->_aggregateMaxPIDCount = [(PLOperator *)self defaultLongForKey:@"AggregateMaxPidCount"];
  self->_aggregteZeroDeltaCount = [(PLOperator *)self defaultLongForKey:@"AggregateZeroDeltaCount"];
  if (_os_feature_enabled_impl())
  {
    v44 = PLLogAssertion();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v44, OS_LOG_TYPE_INFO, "enableSubSecondAssertionOptimization is enabled", buf, 2u);
    }

    id v45 = objc_alloc(MEMORY[0x1E4F92A28]);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_214;
    v48[3] = &unk_1E692A0F0;
    v48[4] = self;
    v46 = (PLNSNotificationOperatorComposition *)[v45 initWithOperator:self forNotification:@"PLGameModeNotification" withBlock:v48];
    consoleModeListener = self->_consoleModeListener;
    self->_consoleModeListener = v46;
  }
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetIOPMSetAssertionActivityAggregateWithReason:2 withPidCount:0xFFFFFFFFLL];
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_159(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1EBD57D50 != -1) {
      dispatch_once(&qword_1EBD57D50, block);
    }
    if (_MergedGlobals_1_18)
    {
      uint64_t v3 = [NSString stringWithFormat:@"assertion notification handler"];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:358];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return [*(id *)(a1 + 32) logEventForwardAssertionWithReason:&unk_1F29E51B8 asSnapshot:0];
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_18 = result;
  return result;
}

void __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_170(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) logInterval:&unk_1F29E5200];
  if (([*(id *)(a1 + 32) lastActivityOverflow] & 1) == 0) {
    [*(id *)(a1 + 32) logSnapshot:&unk_1F29E5218];
  }
  uint64_t v2 = [NSString stringWithFormat:@"Flushing the assertion buffer"];
  uint64_t v3 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
  uint64_t v5 = [v4 lastPathComponent];
  v6 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke"];
  [v3 logMessage:v2 fromFile:v5 fromFunction:v6 fromLineNumber:372];

  v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    v9 = v2;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v8, 0xCu);
  }
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_181(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_182;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1EBD57D58 != -1) {
      dispatch_once(&qword_1EBD57D58, block);
    }
    if (byte_1EBD57D21)
    {
      uint64_t v3 = [NSString stringWithFormat:@"assertion buffer notification handler"];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:378];

      int v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v14 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardAssertionWithReason:&unk_1F29E51E8 asSnapshot:0];
  v9 = [*(id *)(a1 + 32) assertionBufferNotificationTracking];
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  [v9 addObject:v10];

  return [*(id *)(a1 + 32) checkAssertionBufferFullNotificationRate];
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_182(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D21 = result;
  return result;
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_190(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_191;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1EBD57D60 != -1) {
      dispatch_once(&qword_1EBD57D60, block);
    }
    if (byte_1EBD57D22)
    {
      uint64_t v3 = [NSString stringWithFormat:@"Fired on Battery level"];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:386];

      int v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardAssertionWithReason:&unk_1F29E51A0 asSnapshot:0];
  return [*(id *)(a1 + 32) logAggregatedAssertionActivityPLDataStructure];
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_191(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D22 = result;
  return result;
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_195(uint64_t a1)
{
  [*(id *)(a1 + 32) setAssertionSnapshotTimerActive:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setAssertionBufferFullNotificationActive:1 withReason:@"wake"];
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_2_199(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssertionSnapshotTimerActive:0];
}

void __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_4;
    block[3] = &unk_1E692A830;
    v25 = @"DailyTasks";
    uint64_t v26 = v10;
    if (qword_1EBD57D68 != -1) {
      dispatch_once(&qword_1EBD57D68, block);
    }
    BOOL v11 = byte_1EBD57D23 == 0;

    if (!v11)
    {
      v12 = [NSString stringWithFormat:@"DailyTasks notification!"];
      uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
      double v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      uint64_t v15 = [v14 lastPathComponent];
      id v16 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent initOperatorDependancies]_block_invoke_3"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:407];

      v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
      }
    }
  }
  objc_initWeak(location, *(id *)(a1 + 32));
  id v18 = objc_alloc(MEMORY[0x1E4F92A80]);
  v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0];
  v20 = [*(id *)(a1 + 32) workQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_208;
  v22[3] = &unk_1E692AC18;
  objc_copyWeak(&v23, location);
  v21 = (void *)[v18 initWithFireDate:v19 withInterval:0 withTolerance:0 repeats:v20 withUserInfo:v22 withQueue:0.0 withBlock:0.0];

  [v21 arm];
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

uint64_t __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  byte_1EBD57D23 = result;
  return result;
}

void __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_208(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained logSnapshotAtMidnight:0];
}

void __49__PLPowerAssertionAgent_initOperatorDependancies__block_invoke_214(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLLogAssertion();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Notification from Console Mode change: %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"gameMode"];
  BOOL v9 = 0;
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [v3 objectForKeyedSubscript:@"gameMode"];
    char v8 = [v7 BOOLValue];

    if (v8) {
      BOOL v9 = 1;
    }
  }
  [*(id *)(a1 + 32) setGameMode:v9];
  uint64_t v10 = PLLogAssertion();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = [*(id *)(a1 + 32) gameMode];
    int v12 = 67109120;
    LODWORD(v13) = v11;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "Game Mode set to: %d", (uint8_t *)&v12, 8u);
  }
}

- (void)logSnapshotAtMidnight:(id)a3
{
}

- (id)startEndActionsToEnumMapping
{
  startEndActionsToEnum = self->_startEndActionsToEnum;
  if (!startEndActionsToEnum)
  {
    self->_startEndActionsToEnum = (NSDictionary *)&unk_1F29E9130;
    startEndActionsToEnum = self->_startEndActionsToEnum;
  }
  return startEndActionsToEnum;
}

- (id)assertTypeToEnumMapping
{
  assertTypeToEnum = self->_assertTypeToEnum;
  if (!assertTypeToEnum)
  {
    self->_assertTypeToEnum = (NSDictionary *)&unk_1F29E9158;
    assertTypeToEnum = self->_assertTypeToEnum;
  }
  return assertTypeToEnum;
}

- (void)resetIOPMSetAssertionActivityAggregateWithReason:(signed __int16)a3 withPidCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a4 == -1)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x2020000000;
    int v22 = 0;
    id v7 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSample];
    [v7 objectForKey:@"assertionAggregated"];
    IOReportIterate();

    uint64_t v4 = *(unsigned int *)(*((void *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  [(PLPowerAssertionAgent *)self logEventPointAggregateResetWithReason:v5 withPidCount:v4];
  char v8 = objc_opt_new();
  [(PLPowerAssertionAgent *)self setAssertionAggregatedLastSample:v8];

  IOPMSetAssertionActivityAggregate();
  uint64_t v9 = IOPMSetAssertionActivityAggregate();
  if ([(PLOperator *)self isDebugEnabled])
  {
    if (v9)
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"******  ERROR ********* 0x%x", v9);
      int v11 = (void *)MEMORY[0x1E4F929B8];
      int v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      id v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregateWithReason:withPidCount:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:539];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
LABEL_11:
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v10 = [NSString stringWithFormat:@"We have assertion Activity logging"];
      id v16 = (void *)MEMORY[0x1E4F929B8];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      id v18 = [v17 lastPathComponent];
      v19 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregateWithReason:withPidCount:]"];
      [v16 logMessage:v10 fromFile:v18 fromFunction:v19 fromLineNumber:541];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        goto LABEL_11;
      }
    }
  }
}

uint64_t __87__PLPowerAssertionAgent_resetIOPMSetAssertionActivityAggregateWithReason_withPidCount___block_invoke(uint64_t a1)
{
  return 0;
}

- (void)resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:(signed __int16)a3 withPidCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a4 == -1)
  {
    id v7 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSamplePLDataStructure];
    char v8 = [v7 objectForKeyedSubscript:@"assertionAggregated"];
    uint64_t v4 = [v8 count];
  }
  [(PLPowerAssertionAgent *)self logEventPointAggregateResetWithReason:v5 withPidCount:v4];
  uint64_t v9 = objc_opt_new();
  [(PLPowerAssertionAgent *)self setAssertionAggregatedLastSamplePLDataStructure:v9];

  IOPMSetAssertionActivityAggregate();
  uint64_t v10 = IOPMSetAssertionActivityAggregate();
  if ([(PLOperator *)self isDebugEnabled])
  {
    if (v10)
    {
      int v11 = objc_msgSend(NSString, "stringWithFormat:", @"******  ERROR ********* 0x%x", v10);
      int v12 = (void *)MEMORY[0x1E4F929B8];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      uint64_t v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:withPidCount:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:561];

      id v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        int v22 = v11;
LABEL_11:
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    else
    {
      int v11 = [NSString stringWithFormat:@"We have assertion Activity logging"];
      v17 = (void *)MEMORY[0x1E4F929B8];
      id v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:withPidCount:]"];
      [v17 logMessage:v11 fromFile:v19 fromFunction:v20 fromLineNumber:563];

      id v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        int v22 = v11;
        goto LABEL_11;
      }
    }
  }
}

- (void)checkAssertionBufferFullNotificationRate
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D942A350](self, a2);
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  if (qword_1EBD57D70 != -1) {
    dispatch_once(&qword_1EBD57D70, block);
  }
  uint64_t v5 = [v4 dateWithTimeIntervalSinceNow:0.0 - *(double *)&qword_1EBD57D78];
  v6 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v7 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if ([v12 compare:v5] == -1) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v9);
  }

  id v13 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
  [v13 removeObjectsInArray:v6];

  unint64_t v14 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = NSString;
    id v16 = (void *)MEMORY[0x1E4F92A98];
    id v45 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
    v17 = [v45 firstObject];
    id v18 = [v16 formattedStringForDate:v17];
    v19 = v3;
    v20 = (void *)MEMORY[0x1E4F92A98];
    uint64_t v21 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
    int v22 = [v21 lastObject];
    uint64_t v23 = [v20 formattedStringForDate:v22];
    uint64_t v24 = [v15 stringWithFormat:@"start=%@ end=%@", v18, v23];

    id v3 = v19;
    v25 = (void *)v24;

    unint64_t v14 = 0x1E4F92000;
  }
  else
  {
    v25 = 0;
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_2;
  v48[3] = &unk_1E692A250;
  v48[4] = self;
  if (qword_1EBD57D80 != -1) {
    dispatch_once(&qword_1EBD57D80, v48);
  }
  unint64_t v26 = qword_1EBD57D88;
  v27 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
  unint64_t v28 = [v27 count];

  if (v28 >= v26)
  {
    [(PLPowerAssertionAgent *)self setAssertionBufferFullNotificationActive:0 withReason:@"CheckRate"];
    if ([*(id *)(v14 + 2496) debugEnabled])
    {
      uint64_t v38 = objc_opt_class();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_3;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v38;
      if (qword_1EBD57D90 != -1) {
        dispatch_once(&qword_1EBD57D90, v47);
      }
      if (byte_1EBD57D24)
      {
        v39 = NSString;
        id v40 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
        id v32 = [v39 stringWithFormat:@"assertion storm! count=%lu %@", objc_msgSend(v40, "count"), v25];

        v41 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
        v43 = [v42 lastPathComponent];
        v44 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent checkAssertionBufferFullNotificationRate]"];
        [v41 logMessage:v32 fromFile:v43 fromFunction:v44 fromLineNumber:590];

        v37 = PLLogCommon();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          v55 = v32;
          goto LABEL_32;
        }
LABEL_29:
      }
    }
  }
  else if ([*(id *)(v14 + 2496) debugEnabled])
  {
    uint64_t v29 = objc_opt_class();
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_433;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v29;
    if (qword_1EBD57D98 != -1) {
      dispatch_once(&qword_1EBD57D98, v46);
    }
    if (byte_1EBD57D25)
    {
      v30 = NSString;
      v31 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
      id v32 = [v30 stringWithFormat:@"no storm! count=%lu %@", objc_msgSend(v31, "count"), v25];

      v33 = (void *)MEMORY[0x1E4F929B8];
      v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v35 = [v34 lastPathComponent];
      v36 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent checkAssertionBufferFullNotificationRate]"];
      [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:592];

      v37 = PLLogCommon();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        v55 = v32;
LABEL_32:
        _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        goto LABEL_29;
      }
      goto LABEL_29;
    }
  }
}

uint64_t __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"HWTimeWindow"];
  qword_1EBD57D78 = v2;
  return result;
}

uint64_t __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"HWCountLimit"];
  qword_1EBD57D88 = result;
  return result;
}

uint64_t __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D24 = result;
  return result;
}

uint64_t __65__PLPowerAssertionAgent_checkAssertionBufferFullNotificationRate__block_invoke_433(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D25 = result;
  return result;
}

- (void)setAssertionBufferFullNotificationActive:(BOOL)a3 withReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v7;
    if (qword_1EBD57DA0 != -1) {
      dispatch_once(&qword_1EBD57DA0, block);
    }
    if (byte_1EBD57D26)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = NSStringFromBOOL();
      uint64_t v10 = NSStringFromBOOL();
      int v11 = [v8 stringWithFormat:@"assertionBufferFullNotificationActive: current=%@ new=%@", v9, v10];

      int v12 = (void *)MEMORY[0x1E4F929B8];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      unint64_t v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent setAssertionBufferFullNotificationActive:withReason:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:598];

      id v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        v101 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([(PLPowerAssertionAgent *)self assertionBufferFullNotificationActive] != v4)
  {
    [(PLPowerAssertionAgent *)self setAssertionBufferFullNotificationActive:v4];
    uint64_t v17 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Assertion"];
    int v18 = [MEMORY[0x1E4F929C0] debugEnabled];
    v93 = (void *)v17;
    id v94 = v6;
    if (v4)
    {
      if (v18)
      {
        uint64_t v19 = objc_opt_class();
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_443;
        v98[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v98[4] = v19;
        if (qword_1EBD57DA8 != -1) {
          dispatch_once(&qword_1EBD57DA8, v98);
        }
        if (byte_1EBD57D27)
        {
          uint64_t v20 = v17;
          uint64_t v21 = [NSString stringWithFormat:@"assertionBufferFullNotificationActive YES"];
          int v22 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
          uint64_t v24 = [v23 lastPathComponent];
          v25 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent setAssertionBufferFullNotificationActive:withReason:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:605];

          unint64_t v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            v101 = v21;
            _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v17 = v20;
        }
      }
      v27 = [(PLPowerAssertionAgent *)self assertionBufferFullNotificationRearmTimer];

      if (v27)
      {
        unint64_t v28 = [(PLPowerAssertionAgent *)self assertionBufferFullNotificationRearmTimer];
        [v28 invalidate];
      }
      [(PLPowerAssertionAgent *)self setAssertionBufferFullNotificationRearmTimer:0];
      uint64_t v29 = [(PLPowerAssertionAgent *)self assertionBufferFullNotification];
      [v29 listenForNotifications:1];

      IOPMAssertionNotify();
      v92 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v17];
      v30 = NSString;
      v31 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
      uint64_t v32 = [v31 count];
      v33 = (void *)MEMORY[0x1E4F92A98];
      v34 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
      v35 = [v34 firstObject];
      v36 = [v33 formattedStringForDate:v35];
      v37 = (void *)MEMORY[0x1E4F92A98];
      uint64_t v38 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
      v39 = [v38 lastObject];
      id v40 = [v37 formattedStringForDate:v39];
      v41 = [v30 stringWithFormat:@"AssertionStorm, count=%lu start=%@ end=%@", v32, v36, v40];
      uint64_t v42 = v92;
      [v92 setObject:v41 forKeyedSubscript:@"AssertName"];

      [v92 setObject:&unk_1F29E5200 forKeyedSubscript:@"AssertType"];
      v43 = [(PLPowerAssertionAgent *)self startEndActionsToEnum];
      id v6 = v94;
      v44 = [v43 objectForKeyedSubscript:v94];
      [v92 setObject:v44 forKeyedSubscript:@"Action"];

      id v45 = [v92 objectForKeyedSubscript:@"Action"];

      if (!v45) {
        [v92 setObject:&unk_1F29E5350 forKeyedSubscript:@"Action"];
      }
      [v92 setObject:&unk_1F29E5368 forKeyedSubscript:@"GlobalUniqueID"];
      v46 = NSNumber;
      v47 = [MEMORY[0x1E4F28F80] processInfo];
      v48 = objc_msgSend(v46, "numberWithInt:", objc_msgSend(v47, "processIdentifier"));
      [v92 setObject:v48 forKeyedSubscript:@"pid"];

      long long v49 = NSNumber;
      long long v50 = [MEMORY[0x1E4F92A78] sharedInstance];
      [v50 timeOffsetForTimeReference:1];
      long long v52 = [v49 numberWithInt:(int)(v51 * 1000.0)];
      [v92 setObject:v52 forKeyedSubscript:@"timestampActionOffset"];

      [(PLOperator *)self logEntry:v92];
    }
    else
    {
      if (v18)
      {
        uint64_t v53 = objc_opt_class();
        v97[0] = MEMORY[0x1E4F143A8];
        v97[1] = 3221225472;
        v97[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_459;
        v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v97[4] = v53;
        if (qword_1EBD57DB0 != -1) {
          dispatch_once(&qword_1EBD57DB0, v97);
        }
        if (byte_1EBD57D28)
        {
          uint64_t v54 = v17;
          v55 = [NSString stringWithFormat:@"assertionBufferFullNotificationActive NO"];
          v56 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
          v58 = [v57 lastPathComponent];
          uint64_t v59 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent setAssertionBufferFullNotificationActive:withReason:]"];
          [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:623];

          v60 = PLLogCommon();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            v101 = v55;
            _os_log_debug_impl(&dword_1D2690000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v17 = v54;
        }
      }
      v61 = (void *)MEMORY[0x1E4F1C9C8];
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_464;
      v96[3] = &unk_1E692A250;
      v96[4] = self;
      if (qword_1EBD57DB8 != -1) {
        dispatch_once(&qword_1EBD57DB8, v96);
      }
      uint64_t v62 = [v61 dateWithTimeIntervalSinceNow:*(double *)&qword_1EBD57DC0];
      v63 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v17];
      v89 = NSString;
      v91 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
      uint64_t v64 = [v91 count];
      v65 = (void *)MEMORY[0x1E4F92A98];
      v90 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
      v66 = [v90 firstObject];
      v67 = [v65 formattedStringForDate:v66];
      v68 = (void *)MEMORY[0x1E4F92A98];
      v69 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
      v70 = [v69 lastObject];
      v71 = [v68 formattedStringForDate:v70];
      v72 = [MEMORY[0x1E4F92A98] formattedStringForDate:v62];
      v73 = [v89 stringWithFormat:@"AssertionStorm, count=%lu start=%@ end=%@ rearm=%@", v64, v67, v71, v72];
      [v63 setObject:v73 forKeyedSubscript:@"AssertName"];

      [v63 setObject:&unk_1F29E5200 forKeyedSubscript:@"AssertType"];
      v74 = [(PLPowerAssertionAgent *)self startEndActionsToEnum];
      id v6 = v94;
      v75 = [v74 objectForKeyedSubscript:v94];
      [v63 setObject:v75 forKeyedSubscript:@"Action"];

      v76 = [v63 objectForKeyedSubscript:@"Action"];

      if (!v76) {
        [v63 setObject:&unk_1F29E5350 forKeyedSubscript:@"Action"];
      }
      [v63 setObject:&unk_1F29E5368 forKeyedSubscript:@"GlobalUniqueID"];
      v77 = NSNumber;
      v78 = [MEMORY[0x1E4F28F80] processInfo];
      v79 = objc_msgSend(v77, "numberWithInt:", objc_msgSend(v78, "processIdentifier"));
      [v63 setObject:v79 forKeyedSubscript:@"pid"];

      v80 = NSNumber;
      v81 = [MEMORY[0x1E4F92A78] sharedInstance];
      [v81 timeOffsetForTimeReference:1];
      v83 = [v80 numberWithInt:(int)(v82 * 1000.0)];
      [v63 setObject:v83 forKeyedSubscript:@"timestampActionOffset"];

      IOPMAssertionNotify();
      v84 = [(PLPowerAssertionAgent *)self assertionBufferFullNotification];
      [v84 listenForNotifications:0];

      v85 = [(PLPowerAssertionAgent *)self assertionBufferNotificationTracking];
      [v85 removeAllObjects];

      [(PLOperator *)self logEntry:v63];
      id v86 = objc_alloc(MEMORY[0x1E4F92A80]);
      v87 = [(PLOperator *)self workQueue];
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_2;
      v95[3] = &unk_1E692A200;
      v95[4] = self;
      uint64_t v42 = (void *)v62;
      v88 = (void *)[v86 initWithFireDate:v62 withInterval:0 withTolerance:0 repeats:v87 withUserInfo:v95 withQueue:0.0 withBlock:0.0];
      [(PLPowerAssertionAgent *)self setAssertionBufferFullNotificationRearmTimer:v88];
    }
  }
}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D26 = result;
  return result;
}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_443(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D27 = result;
  return result;
}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_459(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D28 = result;
  return result;
}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_464(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"HWRearmTimeInterval"];
  qword_1EBD57DC0 = v2;
  return result;
}

uint64_t __77__PLPowerAssertionAgent_setAssertionBufferFullNotificationActive_withReason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssertionBufferFullNotificationActive:1 withReason:@"rearmTimer"];
}

- (void)setAssertionSnapshotTimerActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PLPowerAssertionAgent *)self assertionSnapShotTimer];

  if (v5)
  {
    id v6 = [(PLPowerAssertionAgent *)self assertionSnapShotTimer];
    [v6 invalidate];
  }
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PLPowerAssertionAgent_setAssertionSnapshotTimerActive___block_invoke;
    block[3] = &unk_1E692A250;
    void block[4] = self;
    if (qword_1EBD57DC8 != -1) {
      dispatch_once(&qword_1EBD57DC8, block);
    }
    double v7 = *(double *)&qword_1EBD57DD0;
    if (![MEMORY[0x1E4F929C0] fullMode]) {
      double v7 = v7 * 6.0;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F92A80]);
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v7];
    uint64_t v10 = [(PLOperator *)self workQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __57__PLPowerAssertionAgent_setAssertionSnapshotTimerActive___block_invoke_2;
    v12[3] = &unk_1E692A200;
    v12[4] = self;
    int v11 = (void *)[v8 initWithFireDate:v9 withInterval:1 withTolerance:0 repeats:v10 withUserInfo:v12 withQueue:v7 withBlock:0.0];
    [(PLPowerAssertionAgent *)self setAssertionSnapShotTimer:v11];
  }
  else
  {
    [(PLPowerAssertionAgent *)self setAssertionSnapShotTimer:0];
  }
}

uint64_t __57__PLPowerAssertionAgent_setAssertionSnapshotTimerActive___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"SnapShotInterval"];
  qword_1EBD57DD0 = v2;
  return result;
}

uint64_t __57__PLPowerAssertionAgent_setAssertionSnapshotTimerActive___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventForwardAssertionWithReason:&unk_1F29E51B8 asSnapshot:1];
}

- (BOOL)assertionSnapshotTimerActive
{
  uint64_t v2 = [(PLPowerAssertionAgent *)self assertionSnapShotTimer];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)sanitizeAssertionNameForEntry:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((unint64_t)[v3 length] >= 0x3E9)
    {
      uint64_t v4 = [v3 substringToIndex:1000];

      id v3 = (id)v4;
    }
    if ([v3 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v3 = v3;
      uint64_t v5 = v3;
    }
    else
    {
      double v7 = [v3 stringByReplacingOccurrencesOfString:@";" withString:&stru_1F294E108];
      id v8 = [v7 stringByReplacingOccurrencesOfString:@"." withString:&stru_1F294E108];

      uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"*" withString:&stru_1F294E108];

      uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"?" withString:&stru_1F294E108];

      int v11 = [v10 stringByReplacingOccurrencesOfString:@"@" withString:&stru_1F294E108];

      int v12 = [v11 stringByReplacingOccurrencesOfString:@"\\"" withString:&stru_1F294E108];

      uint64_t v5 = [v12 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1F294E108];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldOptimizeSmallAssertions
{
  if (qword_1EBD57DD8 != -1) {
    dispatch_once(&qword_1EBD57DD8, &__block_literal_global_493);
  }
  return byte_1EBD57D29;
}

uint64_t __54__PLPowerAssertionAgent_shouldOptimizeSmallAssertions__block_invoke()
{
  if ([MEMORY[0x1E4F929C0] liteMode]) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = [MEMORY[0x1E4F929C0] taskMode];
  }
  byte_1EBD57D29 = result;
  return result;
}

- (void)logEventForwardAssertion
{
  [(PLPowerAssertionAgent *)self logEventForwardAssertionWithReason:&unk_1F29E5128 asSnapshot:0];
  [(PLPowerAssertionAgent *)self logEventForwardAssertionWithReason:&unk_1F29E51A0 asSnapshot:1];
}

- (void)logSnapshot:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFDictionaryRef AssertionsByPID = 0;
  uint64_t v5 = IOPMCopyAssertionsByProcess(&AssertionsByPID);
  if (v5)
  {
    uint64_t v6 = v5;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __37__PLPowerAssertionAgent_logSnapshot___block_invoke;
      v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v91[4] = v7;
      if (qword_1EBD57DE0 != -1) {
        dispatch_once(&qword_1EBD57DE0, v91);
      }
      if (byte_1EBD57D2A)
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Call to IOPMCopyAssertionsByProcess failed with error 0x%x", v6);
        uint64_t v9 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
        int v11 = [v10 lastPathComponent];
        int v12 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logSnapshot:]"];
        v70 = (void *)v8;
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:722];

        id v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v98 = v8;
          _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        goto LABEL_52;
      }
    }
    goto LABEL_53;
  }
  id v67 = v4;
  v75 = objc_opt_new();
  v74 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  CFDictionaryRef v14 = AssertionsByPID;
  uint64_t v73 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Assertion"];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v70 = v14;
  id obj = [(__CFDictionary *)v14 allKeys];
  uint64_t v71 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
  if (!v71) {
    goto LABEL_48;
  }
  uint64_t v69 = *(void *)v88;
  unint64_t v15 = 0x1E4F28000;
  id v16 = @"Category";
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v88 != v69) {
        objc_enumerationMutation(obj);
      }
      uint64_t v72 = v17;
      uint64_t v18 = *(void *)(*((void *)&v87 + 1) + 8 * v17);
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      uint64_t v77 = v18;
      objc_msgSend(v70, "objectForKey:");
      id v78 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v80 = [v78 countByEnumeratingWithState:&v83 objects:v95 count:16];
      if (v80)
      {
        uint64_t v19 = *(void *)v84;
        uint64_t v76 = *(void *)v84;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v84 != v19) {
              objc_enumerationMutation(v78);
            }
            uint64_t v21 = *(void **)(*((void *)&v83 + 1) + 8 * v20);
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v22 = objc_opt_class();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __37__PLPowerAssertionAgent_logSnapshot___block_invoke_499;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              void block[4] = v22;
              if (qword_1EBD57DE8 != -1) {
                dispatch_once(&qword_1EBD57DE8, block);
              }
              if (byte_1EBD57D2B)
              {
                uint64_t v23 = [NSString stringWithFormat:@"rawAssertion=%@", v21];
                uint64_t v24 = (void *)MEMORY[0x1E4F929B8];
                v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
                unint64_t v26 = [v25 lastPathComponent];
                v27 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logSnapshot:]"];
                [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:733];

                unint64_t v28 = PLLogCommon();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v98 = (uint64_t)v23;
                  _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v15 = 0x1E4F28000uLL;
              }
            }
            uint64_t v29 = [v21 objectForKeyedSubscript:@"GlobalUniqueID"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v31 = v16;
              unint64_t v32 = v15;
              v33 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v73];
              [v33 setEntryDate:v74];
              v34 = [v21 objectForKeyedSubscript:@"AssertStartWhen"];
              v35 = [v33 entryDate];
              v79 = v34;
              [v34 timeIntervalSinceDate:v35];
              double v37 = v36 * 1000.0;

              uint64_t v38 = [*(id *)(v32 + 3792) numberWithDouble:v37];
              [v33 setObject:v38 forKeyedSubscript:@"timestampActionOffset"];

              [v33 setObject:v77 forKeyedSubscript:@"pid"];
              [v33 setObject:&unk_1F29E5128 forKeyedSubscript:@"Action"];
              v39 = [v21 objectForKeyedSubscript:@"GlobalUniqueID"];
              [v33 setObject:v39 forKeyedSubscript:@"GlobalUniqueID"];

              id v40 = [v21 objectForKeyedSubscript:@"AssertName"];
              v41 = [(PLPowerAssertionAgent *)self sanitizeAssertionNameForEntry:v40];
              [v33 setObject:v41 forKeyedSubscript:@"AssertName"];

              uint64_t v42 = [(PLPowerAssertionAgent *)self assertTypeToEnum];
              v43 = [v21 objectForKeyedSubscript:@"AssertType"];
              v44 = [v42 objectForKeyedSubscript:v43];
              [v33 setObject:v44 forKeyedSubscript:@"AssertType"];

              id v45 = [v33 objectForKeyedSubscript:@"AssertType"];

              if (!v45) {
                [v33 setObject:&unk_1F29E5230 forKeyedSubscript:@"AssertType"];
              }
              v46 = [v21 objectForKeyedSubscript:@"AssertionOnBehalfOfPID"];
              [v33 setObject:v46 forKeyedSubscript:@"AssertionOnBehalfOfPID"];

              id v16 = v31;
              v47 = [v21 objectForKeyedSubscript:v31];

              if (v47)
              {
                v48 = [v21 objectForKeyedSubscript:v31];
                [v33 setObject:v48 forKeyedSubscript:v31];
              }
              long long v49 = [v21 objectForKeyedSubscript:@"InstanceMetadata"];

              if (v49)
              {
                long long v50 = [v21 objectForKeyedSubscript:@"InstanceMetadata"];
                if ((unint64_t)[v50 length] >= 0x21)
                {
                  uint64_t v51 = [v50 substringToIndex:32];

                  long long v50 = (void *)v51;
                }
                [v33 setObject:v50 forKeyedSubscript:@"InstanceMetadata"];
              }
              long long v52 = [v21 objectForKeyedSubscript:@"FrameworkBundleID"];

              if (v52)
              {
                uint64_t v53 = [v21 objectForKeyedSubscript:@"FrameworkBundleID"];
                [v33 setObject:v53 forKeyedSubscript:@"FrameworkBundleID"];
              }
              [v75 addObject:v33];
              uint64_t v19 = v76;
              uint64_t v54 = v79;
LABEL_43:

              unint64_t v15 = 0x1E4F28000;
              goto LABEL_44;
            }
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v55 = objc_opt_class();
              v81[0] = MEMORY[0x1E4F143A8];
              v81[1] = 3221225472;
              v81[2] = __37__PLPowerAssertionAgent_logSnapshot___block_invoke_508;
              v81[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v81[4] = v55;
              if (qword_1EBD57DF0 != -1) {
                dispatch_once(&qword_1EBD57DF0, v81);
              }
              if (byte_1EBD57D2C)
              {
                v56 = NSString;
                uint64_t v57 = [v21 objectForKeyedSubscript:@"GlobalUniqueID"];
                v33 = [v56 stringWithFormat:@"ERROR: GlobalUniqueID for assertion is not a number: %@", v57];

                v58 = (void *)MEMORY[0x1E4F929B8];
                uint64_t v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
                v60 = [v59 lastPathComponent];
                v61 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logSnapshot:]"];
                [v58 logMessage:v33 fromFile:v60 fromFunction:v61 fromLineNumber:763];

                uint64_t v54 = PLLogCommon();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v98 = (uint64_t)v33;
                  _os_log_debug_impl(&dword_1D2690000, v54, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
                goto LABEL_43;
              }
            }
LABEL_44:
            ++v20;
          }
          while (v80 != v20);
          uint64_t v80 = [v78 countByEnumeratingWithState:&v83 objects:v95 count:16];
        }
        while (v80);
      }

      uint64_t v17 = v72 + 1;
    }
    while (v72 + 1 != v71);
    uint64_t v71 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
  }
  while (v71);
LABEL_48:

  id v13 = v75;
  if ([v75 count])
  {
    uint64_t v62 = (void *)v73;
    uint64_t v93 = v73;
    id v94 = v75;
    v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
    [(PLOperator *)self logEntries:v63 withGroupID:v73];
    id v4 = v67;
    unint64_t v64 = 0x1E4F92000;
  }
  else
  {
    unint64_t v64 = 0x1E4F92000uLL;
    uint64_t v62 = (void *)v73;
    v63 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v73];
    [v63 setIsErrorEntry:1];
    [v63 setObject:@"No assertions open" forKeyedSubscript:@"__PLEntryErrorString__"];
    [(PLOperator *)self logEntry:v63];
    id v4 = v67;
  }

  v65 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SnapshotReason"];
  v66 = (void *)[objc_alloc(*(Class *)(v64 + 2512)) initWithEntryKey:v65];
  [v66 setObject:v4 forKeyedSubscript:@"Reason"];
  [(PLOperator *)self logEntry:v66];

LABEL_52:
LABEL_53:
}

uint64_t __37__PLPowerAssertionAgent_logSnapshot___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D2A = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logSnapshot___block_invoke_499(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D2B = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logSnapshot___block_invoke_508(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D2C = result;
  return result;
}

- (void)logInterval:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke;
  block[3] = &unk_1E692B928;
  uint64_t v18 = @"logAssertNameChange";
  char v19 = 0;
  if (qword_1EBD57DF8 != -1) {
    dispatch_once(&qword_1EBD57DF8, block);
  }

  if (logInterval__prevRefCnt == -1) {
    logInterval__prevRefCnt = [MEMORY[0x1E4F929C0] longForKey:@"assertionCookie" ifNotSet:0xFFFFFFFFLL];
  }
  uint64_t v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"0[xX][0-9a-fA-F]+" options:0 error:0];
  uint64_t v6 = PLLogAssertion();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v16 = [(PLPowerAssertionAgent *)self gameMode];
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v21) = v16;
    _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "self.gameMode %d", buf, 8u);
  }

  [(PLOperator *)self defaultDoubleForKey:@"subSecondAssertionDuration"];
  uint64_t v8 = v7;
  uint64_t v9 = PLLogAssertion();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v21 = v8;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "subSecondAssertionDuration %f", buf, 0xCu);
  }

  uint64_t v10 = [(PLOperator *)self workQueue];
  id v11 = v5;
  id v12 = v4;
  int v13 = IOPMCopyAssertionActivityUpdateWithCallback();

  if (v13)
  {
    CFDictionaryRef v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BufferStatus"];
    unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
    [v15 setObject:&unk_1F29E5380 forKeyedSubscript:@"TotalCount"];
    [(PLOperator *)self logEntry:v15];
  }
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  byte_1EBD57D2D = result;
  return result;
}

void __37__PLPowerAssertionAgent_logInterval___block_invoke_528(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F929C0];
  uint64_t v6 = [NSNumber numberWithUnsignedInt:logInterval__prevRefCnt];
  [v5 setObject:v6 forKey:@"assertionCookie" saveToDisk:1];

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v8 = a4;
  uint64_t v9 = objc_opt_new();
  uint64_t v207 = *MEMORY[0x1E4F92D48];
  v204 = +[PLOperator entryKeyForType:andName:](PLPowerAssertionAgent, "entryKeyForType:andName:");
  long long v228 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v228 objects:v241 count:16];
  unint64_t v11 = 0x1E4F92000;
  v206 = (void *)v7;
  v198 = v9;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v229;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v229 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v228 + 1) + 8 * v14);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v16 = objc_opt_class();
          v227[0] = MEMORY[0x1E4F143A8];
          v227[1] = 3221225472;
          v227[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_2;
          v227[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v227[4] = v16;
          uint64_t v17 = v227;
          if (qword_1EBD57E00 != -1) {
            dispatch_once(&qword_1EBD57E00, v17);
          }

          if (byte_1EBD57D2E)
          {
            uint64_t v18 = [NSString stringWithFormat:@"timedOutProcessLog=%@", v15];
            char v19 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
            uint64_t v21 = [v20 lastPathComponent];
            uint64_t v22 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke"];
            [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:811];

            uint64_t v23 = PLLogCommon();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v240 = (uint64_t)v18;
              _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v7 = (uint64_t)v206;
            uint64_t v9 = v198;
            unint64_t v11 = 0x1E4F92000uLL;
          }
        }
        uint64_t v24 = (void *)[objc_alloc(*(Class *)(v11 + 2512)) initWithEntryKey:v204 withDate:v7];
        [v24 setObject:v15 forKeyedSubscript:@"ProcessName"];
        [v9 addObject:v24];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v228 objects:v241 count:16];
    }
    while (v12);
  }

  uint64_t v25 = a1;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v26 = objc_opt_class();
    v226[0] = MEMORY[0x1E4F143A8];
    v226[1] = 3221225472;
    v226[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_534;
    v226[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v226[4] = v26;
    v27 = v226;
    if (qword_1EBD57E08 != -1) {
      dispatch_once(&qword_1EBD57E08, v27);
    }

    if (byte_1EBD57D2F)
    {
      unint64_t v28 = [NSString stringWithFormat:@"processCreates=%@\n", v9];
      uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
      v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v31 = [v30 lastPathComponent];
      unint64_t v32 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke_2"];
      [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:816];

      v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v240 = (uint64_t)v28;
        _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      unint64_t v11 = 0x1E4F92000;
    }
  }
  if ([v9 count])
  {
    v34 = *(void **)(a1 + 32);
    v237 = v204;
    v238 = v9;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v238 forKeys:&v237 count:1];
    [v34 logEntries:v35 withGroupID:v204];
  }
  v190 = +[PLOperator entryKeyForType:v207 andName:@"BufferStatus"];
  id v36 = a2;
  v202 = objc_opt_new();
  v201 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Assertion"];
  v197 = objc_opt_new();
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  id v200 = v36;
  uint64_t v205 = [v200 countByEnumeratingWithState:&v222 objects:v236 count:16];
  if (v205)
  {
    uint64_t v203 = *(void *)v223;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v223 != v203) {
          objc_enumerationMutation(v200);
        }
        uint64_t v38 = *(void **)(*((void *)&v222 + 1) + 8 * v37);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v39 = objc_opt_class();
          v221[0] = MEMORY[0x1E4F143A8];
          v221[1] = 3221225472;
          v221[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_541;
          v221[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v221[4] = v39;
          id v40 = v221;
          if (qword_1EBD57E10 != -1) {
            dispatch_once(&qword_1EBD57E10, v40);
          }

          if (byte_1EBD57D30)
          {
            v41 = [NSString stringWithFormat:@"activityLog=%@", v38];
            uint64_t v42 = (void *)MEMORY[0x1E4F929B8];
            v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
            v44 = [v43 lastPathComponent];
            id v45 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke_2"];
            [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:833];

            v46 = PLLogCommon();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v240 = (uint64_t)v41;
              _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v11 = 0x1E4F92000uLL;
          }
        }
        v47 = (void *)MEMORY[0x1D942A350]();
        v48 = [v38 objectForKeyedSubscript:@"GlobalUniqueID"];
        v213 = [v38 objectForKeyedSubscript:@"AssertPID"];
        uint64_t v49 = [v38 objectForKeyedSubscript:@"Action"];
        long long v50 = [*(id *)(v25 + 32) startEndActionsToEnum];
        v212 = (void *)v49;
        uint64_t v51 = [v50 objectForKeyedSubscript:v49];

        if (v51) {
          long long v52 = (void *)v51;
        }
        else {
          long long v52 = &unk_1F29E5350;
        }
        if (*(unsigned char *)(v25 + 64) || ([v52 isEqualToNumber:&unk_1F29E51A0] & 1) == 0)
        {
          uint64_t v53 = (void *)[objc_alloc(*(Class *)(v11 + 2512)) initWithEntryKey:v201 withDate:v206];
          uint64_t v54 = [v38 objectForKeyedSubscript:@"IsCoalesced"];
          if (v54)
          {
            uint64_t v55 = (void *)v54;
            int v56 = [v52 intValue];

            BOOL v57 = v56 == 4;
            uint64_t v25 = a1;
            if (v57)
            {
              v58 = [v38 objectForKeyedSubscript:@"IsCoalesced"];
              [v53 setObject:v58 forKeyedSubscript:@"IsCoalesced"];
            }
          }
          uint64_t v59 = [v38 objectForKeyedSubscript:@"ActivityTime"];

          uint64_t v208 = v37;
          if (v59)
          {
            v60 = [v38 objectForKeyedSubscript:@"ActivityTime"];
            v61 = [v53 entryDate];
            [v60 timeIntervalSinceDate:v61];
            double v63 = v62 * 1000.0;

            unint64_t v64 = [NSNumber numberWithDouble:v63];
            [v53 setObject:v64 forKeyedSubscript:@"timestampActionOffset"];

            uint64_t v25 = a1;
          }
          else
          {
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v65 = objc_opt_class();
              v220[0] = MEMORY[0x1E4F143A8];
              v220[1] = 3221225472;
              v220[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_550;
              v220[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v220[4] = v65;
              v66 = v220;
              if (qword_1EBD57E18 != -1) {
                dispatch_once(&qword_1EBD57E18, v66);
              }

              if (byte_1EBD57D31)
              {
                id v67 = v52;
                v68 = v48;
                uint64_t v69 = [NSString stringWithFormat:@"Missing key: ActivityTime, in the payload"];
                v70 = (void *)MEMORY[0x1E4F929B8];
                uint64_t v71 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
                uint64_t v72 = [v71 lastPathComponent];
                uint64_t v73 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke_2"];
                [v70 logMessage:v69 fromFile:v72 fromFunction:v73 fromLineNumber:852];

                v74 = PLLogCommon();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v240 = (uint64_t)v69;
                  _os_log_debug_impl(&dword_1D2690000, v74, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v25 = a1;
                v48 = v68;
                long long v52 = v67;
              }
            }
            [v53 setObject:0 forKeyedSubscript:@"timestampActionOffset"];
          }
          v211 = v48;
          [v53 setObject:v48 forKeyedSubscript:@"GlobalUniqueID"];
          [v53 setObject:v213 forKeyedSubscript:@"pid"];
          v75 = [*(id *)(v25 + 32) logAssertNameForActions];
          int v76 = [v75 containsObject:v52];

          if (v76)
          {
            uint64_t v77 = [v38 objectForKeyedSubscript:@"Category"];

            if (v77)
            {
              id v78 = [v38 objectForKeyedSubscript:@"Category"];
              [v53 setObject:v78 forKeyedSubscript:@"Category"];
            }
            v79 = [v38 objectForKeyedSubscript:@"InstanceMetadata"];

            if (v79)
            {
              uint64_t v80 = [v38 objectForKeyedSubscript:@"InstanceMetadata"];
              if ((unint64_t)[v80 length] >= 0x21)
              {
                uint64_t v81 = [v80 substringToIndex:32];

                uint64_t v80 = (void *)v81;
              }
              [v53 setObject:v80 forKeyedSubscript:@"InstanceMetadata"];

              uint64_t v25 = a1;
            }
            double v82 = [v38 objectForKeyedSubscript:@"FrameworkBundleID"];

            if (v82)
            {
              long long v83 = [v38 objectForKeyedSubscript:@"FrameworkBundleID"];
              [v53 setObject:v83 forKeyedSubscript:@"FrameworkBundleID"];
            }
          }
          long long v84 = [*(id *)(v25 + 32) logAssertNameForActions];
          int v85 = [v84 containsObject:v52];

          if (v85)
          {
            long long v86 = *(void **)(v25 + 32);
            long long v87 = [v38 objectForKeyedSubscript:@"AssertName"];
            long long v88 = [v86 sanitizeAssertionNameForEntry:v87];
            [v53 setObject:v88 forKeyedSubscript:@"AssertName"];
          }
          else
          {
            [v53 setObject:0 forKeyedSubscript:@"AssertName"];
          }
          [v53 setObject:v52 forKeyedSubscript:@"Action"];
          long long v89 = [*(id *)(v25 + 32) assertTypeToEnum];
          long long v90 = [v38 objectForKeyedSubscript:@"AssertType"];
          v91 = [v89 objectForKeyedSubscript:v90];
          [v53 setObject:v91 forKeyedSubscript:@"AssertType"];

          v92 = [v53 objectForKeyedSubscript:@"AssertType"];

          if (!v92) {
            [v53 setObject:&unk_1F29E5230 forKeyedSubscript:@"AssertType"];
          }
          uint64_t v93 = [v38 objectForKeyedSubscript:@"AssertionOnBehalfOfPID"];
          [v53 setObject:v93 forKeyedSubscript:@"AssertionOnBehalfOfPID"];

          [v202 addObject:v53];
          unint64_t v11 = 0x1E4F92000;
          if ([*(id *)(v25 + 32) gameMode])
          {
            if ([v52 intValue] == 4)
            {
              id v94 = [*(id *)(v25 + 32) subSecondUUIDStartEntryCache];
              v95 = [v94 objectForKeyedSubscript:v211];

              if (v95)
              {
                v96 = [v53 objectForKeyedSubscript:@"timestampActionOffset"];
                [v96 doubleValue];
                double v98 = v97;
                uint64_t v99 = [v95 objectForKeyedSubscript:@"timestampActionOffset"];
                [v99 doubleValue];
                double v101 = v98 - v100;

                if (v101 < *(double *)(v25 + 56))
                {
                  [v197 addObject:v53];
                  [v197 addObject:v95];
                }
              }
              v48 = v211;
              uint64_t v37 = v208;
LABEL_103:

LABEL_104:
              goto LABEL_105;
            }
            v48 = v211;
            uint64_t v37 = v208;
            if ([v52 intValue]) {
              goto LABEL_104;
            }
            v134 = [*(id *)(v25 + 32) subSecondUUIDStartEntryCache];
LABEL_98:
            v95 = v134;
            [v134 setObject:v53 forKey:v48];
            goto LABEL_103;
          }
          v48 = v211;
          uint64_t v37 = v208;
          if (!+[PLPowerAssertionAgent shouldOptimizeSmallAssertions])goto LABEL_104; {
          if ([v52 intValue] != 4)
          }
          {
            if ([v52 intValue]) {
              goto LABEL_104;
            }
            v134 = [*(id *)(v25 + 32) UUIDStartEntryCache];
            goto LABEL_98;
          }
          uint64_t v102 = [*(id *)(v25 + 32) UUIDStartEntryCache];
          v95 = [v102 objectForKeyedSubscript:v211];

          if (!v95) {
            goto LABEL_99;
          }
          v103 = [v53 objectForKeyedSubscript:@"timestampActionOffset"];
          [v103 doubleValue];
          double v105 = v104;
          v106 = [v95 objectForKeyedSubscript:@"timestampActionOffset"];
          [v106 doubleValue];
          double v108 = v105 - v107;

          if (v108 >= 1000.0)
          {
LABEL_99:
            v48 = v211;
            goto LABEL_103;
          }
          v196 = [v95 objectForKeyedSubscript:@"AssertName"];
          uint64_t v109 = objc_msgSend(*(id *)(v25 + 40), "stringByReplacingMatchesInString:options:range:withTemplate:", v196, 0, 0, objc_msgSend(v196, "length"), @"HEX");
          v110 = NSString;
          v111 = [v95 objectForKeyedSubscript:@"pid"];
          v112 = [v95 objectForKeyedSubscript:@"AssertionOnBehalfOfPID"];
          v113 = [v95 objectForKeyedSubscript:@"AssertType"];
          v195 = (void *)v109;
          v114 = [v110 stringWithFormat:@"%@,%@,%@,%@", v111, v112, v113, v109];

          uint64_t v25 = a1;
          v115 = [*(id *)(a1 + 32) assertionUUIDCache];
          v116 = [v115 valueForKey:v114];

          if (v116)
          {
            v194 = v116;
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v117 = objc_opt_class();
              v219[0] = MEMORY[0x1E4F143A8];
              v219[1] = 3221225472;
              v219[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_562;
              v219[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v219[4] = v117;
              v118 = v219;
              if (qword_1EBD57E20 != -1) {
                dispatch_once(&qword_1EBD57E20, v118);
              }

              v116 = v194;
              if (byte_1EBD57D32)
              {
                v192 = v114;
                v119 = [NSString stringWithFormat:@"Assertion before optimization=%@\n", v95];
                v120 = (void *)MEMORY[0x1E4F929B8];
                v121 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
                v122 = [v121 lastPathComponent];
                v123 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke_2"];
                [v120 logMessage:v119 fromFile:v122 fromFunction:v123 fromLineNumber:920];

                v124 = PLLogCommon();
                if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v240 = (uint64_t)v119;
                  _os_log_debug_impl(&dword_1D2690000, v124, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v25 = a1;
                v114 = v192;
                v116 = v194;
              }
            }
            [v95 setObject:&stru_1F294E108 forKeyedSubscript:@"AssertName"];
            v125 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v116, "unsignedLongLongValue"));
            [v95 setObject:v125 forKeyedSubscript:@"GlobalUniqueIDReference"];

            v48 = v211;
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v126 = objc_opt_class();
              v218[0] = MEMORY[0x1E4F143A8];
              v218[1] = 3221225472;
              v218[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_568;
              v218[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v218[4] = v126;
              v127 = v218;
              if (qword_1EBD57E28 != -1) {
                dispatch_once(&qword_1EBD57E28, v127);
              }

              v116 = v194;
              if (byte_1EBD57D33)
              {
                v193 = v114;
                v128 = [NSString stringWithFormat:@"Assertion after optimization=%@\n", v95];
                v129 = (void *)MEMORY[0x1E4F929B8];
                v130 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
                v131 = [v130 lastPathComponent];
                v132 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke_2"];
                [v129 logMessage:v128 fromFile:v131 fromFunction:v132 fromLineNumber:923];

                v133 = PLLogCommon();
                if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v240 = (uint64_t)v128;
                  _os_log_debug_impl(&dword_1D2690000, v133, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                uint64_t v25 = a1;
                v48 = v211;
                v116 = v194;
LABEL_101:

                v114 = v193;
              }
            }

            unint64_t v11 = 0x1E4F92000uLL;
            goto LABEL_103;
          }
          v135 = [*(id *)(a1 + 32) assertionUUIDCache];
          v136 = v114;
          v128 = v135;
          v48 = v211;
          v193 = v136;
          objc_msgSend(v135, "setObject:forKey:", v211);
          goto LABEL_101;
        }
LABEL_105:

        ++v37;
      }
      while (v205 != v37);
      uint64_t v205 = [v200 countByEnumeratingWithState:&v222 objects:v236 count:16];
    }
    while (v205);
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v137 = objc_opt_class();
    v217[0] = MEMORY[0x1E4F143A8];
    v217[1] = 3221225472;
    v217[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_574;
    v217[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v217[4] = v137;
    v138 = v217;
    if (qword_1EBD57E30 != -1) {
      dispatch_once(&qword_1EBD57E30, v138);
    }

    if (byte_1EBD57D34)
    {
      v139 = [NSString stringWithFormat:@"creates=%@\n", v202];
      v140 = (void *)MEMORY[0x1E4F929B8];
      v141 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v142 = [v141 lastPathComponent];
      v143 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke_2"];
      [v140 logMessage:v139 fromFile:v142 fromFunction:v143 fromLineNumber:935];

      v144 = PLLogCommon();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v240 = (uint64_t)v139;
        _os_log_debug_impl(&dword_1D2690000, v144, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v145 = [*(id *)(a1 + 32) gameMode];
  uint64_t v146 = [v202 count];
  if (!v145)
  {
    if (v146)
    {
      uint64_t v152 = a1;
      v155 = *(void **)(a1 + 32);
      v232 = v201;
      v233 = v202;
      v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v233 forKeys:&v232 count:1];
      [v155 logEntries:v154 withGroupID:v201];
LABEL_128:
      v148 = v198;
      v149 = v206;
      goto LABEL_129;
    }
LABEL_127:
    v154 = (void *)[objc_alloc(*(Class *)(v11 + 2512)) initWithEntryKey:v201];
    [v154 setIsErrorEntry:1];
    [v154 setObject:@"No assertions created" forKeyedSubscript:@"__PLEntryErrorString__"];
    uint64_t v152 = a1;
    [*(id *)(a1 + 32) logEntry:v154];
    goto LABEL_128;
  }
  if (!v146) {
    goto LABEL_127;
  }
  v147 = PLLogAssertion();
  v148 = v198;
  v149 = v206;
  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v187 = [v202 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v240 = v187;
    _os_log_debug_impl(&dword_1D2690000, v147, OS_LOG_TYPE_DEBUG, "creates count %lu", buf, 0xCu);
  }

  v150 = PLLogAssertion();
  if (os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v188 = [v197 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v240 = v188;
    _os_log_debug_impl(&dword_1D2690000, v150, OS_LOG_TYPE_DEBUG, "subSecondAssertions count %lu", buf, 0xCu);
  }

  if ([v197 count]) {
    [v202 removeObjectsInArray:v197];
  }
  v151 = PLLogAssertion();
  if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v189 = [v202 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v240 = v189;
    _os_log_debug_impl(&dword_1D2690000, v151, OS_LOG_TYPE_DEBUG, "final creates count %lu", buf, 0xCu);
  }

  uint64_t v152 = a1;
  v153 = *(void **)(a1 + 32);
  v234 = v201;
  v235 = v202;
  v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
  [v153 logEntries:v154 withGroupID:v201];
LABEL_129:

  v156 = [*(id *)(v152 + 32) assertionUUIDCache];
  [v156 removeAllObjects];

  v157 = [*(id *)(v152 + 32) UUIDStartEntryCache];
  [v157 removeAllObjects];

  v158 = [*(id *)(v152 + 32) subSecondUUIDStartEntryCache];
  [v158 removeAllObjects];

  v159 = (void *)[objc_alloc(*(Class *)(v11 + 2512)) initWithEntryKey:v190];
  if ([*(id *)(v152 + 32) firstBufferDrain]) {
    v160 = &unk_1F29E5218;
  }
  else {
    v160 = *(void **)(v152 + 48);
  }
  [v159 setObject:v160 forKeyedSubscript:@"Reason"];
  v161 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v200, "count"));
  [v159 setObject:v161 forKeyedSubscript:@"TotalCount"];

  [*(id *)(v152 + 32) logEntry:v159];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v162 = objc_opt_class();
    v216[0] = MEMORY[0x1E4F143A8];
    v216[1] = 3221225472;
    v216[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_583;
    v216[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v216[4] = v162;
    v163 = v216;
    if (qword_1EBD57E38 != -1) {
      dispatch_once(&qword_1EBD57E38, v163);
    }

    if (byte_1EBD57D35)
    {
      v164 = [NSString stringWithFormat:@"Buffer usage: %@", v159];
      v165 = (void *)MEMORY[0x1E4F929B8];
      v166 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v167 = [v166 lastPathComponent];
      v168 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke_2"];
      [v165 logMessage:v164 fromFile:v167 fromFunction:v168 fromLineNumber:976];

      v169 = PLLogCommon();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v240 = (uint64_t)v164;
        _os_log_debug_impl(&dword_1D2690000, v169, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v149 = v206;
    }
  }
  int v170 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (a3)
  {
    if (v170)
    {
      uint64_t v171 = objc_opt_class();
      v215[0] = MEMORY[0x1E4F143A8];
      v215[1] = 3221225472;
      v215[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_589;
      v215[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v215[4] = v171;
      v172 = v215;
      if (qword_1EBD57E40 != -1) {
        dispatch_once(&qword_1EBD57E40, v172);
      }

      if (byte_1EBD57D36)
      {
        v173 = [NSString stringWithFormat:@"buffer overflowed (%lu), taking snapshot", objc_msgSend(v200, "count")];
        v174 = (void *)MEMORY[0x1E4F929B8];
        v175 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
        v176 = [v175 lastPathComponent];
        v177 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke_2"];
        [v174 logMessage:v173 fromFile:v176 fromFunction:v177 fromLineNumber:980];

        v178 = PLLogCommon();
        if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v240 = (uint64_t)v173;
          _os_log_debug_impl(&dword_1D2690000, v178, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v149 = v206;
      }
    }
    [*(id *)(a1 + 32) logEventForwardAssertionWithReason:&unk_1F29E51E8 asSnapshot:1];
  }
  else if (v170)
  {
    uint64_t v179 = objc_opt_class();
    v214[0] = MEMORY[0x1E4F143A8];
    v214[1] = 3221225472;
    v214[2] = __37__PLPowerAssertionAgent_logInterval___block_invoke_595;
    v214[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v214[4] = v179;
    v180 = v214;
    if (qword_1EBD57E48 != -1) {
      dispatch_once(&qword_1EBD57E48, v180);
    }

    if (byte_1EBD57D37)
    {
      v181 = objc_msgSend(NSString, "stringWithFormat:", @"No buffer overflow (%lu)", objc_msgSend(v200, "count"));
      v182 = (void *)MEMORY[0x1E4F929B8];
      v183 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
      v184 = [v183 lastPathComponent];
      v185 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logInterval:]_block_invoke_2"];
      [v182 logMessage:v181 fromFile:v184 fromFunction:v185 fromLineNumber:983];

      v186 = PLLogCommon();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v240 = (uint64_t)v181;
        _os_log_debug_impl(&dword_1D2690000, v186, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v149 = v206;
    }
  }
  [*(id *)(a1 + 32) setFirstBufferDrain:0];
  [*(id *)(a1 + 32) setLastActivityOverflow:a3];
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D2E = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_534(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D2F = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_541(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D30 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_550(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D31 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_562(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D32 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_568(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D33 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_574(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D34 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_583(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D35 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_589(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D36 = result;
  return result;
}

uint64_t __37__PLPowerAssertionAgent_logInterval___block_invoke_595(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D37 = result;
  return result;
}

- (void)logEventForwardAssertionWithReason:(id)a3 asSnapshot:(BOOL)a4
{
  if (a4) {
    [(PLPowerAssertionAgent *)self logSnapshot:a3];
  }
  else {
    [(PLPowerAssertionAgent *)self logInterval:a3];
  }
}

- (void)logEventPointAggregateResetWithReason:(signed __int16)a3 withPidCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  id v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AggregateReset"];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  id v8 = [NSNumber numberWithShort:v5];
  [v7 setObject:v8 forKeyedSubscript:@"Reason"];

  uint64_t v9 = [NSNumber numberWithInt:v4];
  [v7 setObject:v9 forKeyedSubscript:@"PidCount"];

  [(PLOperator *)self logEntry:v7];
}

- (void)logAggregatedAssertionActivity
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v3 = (void *)IOPMCopyAssertionActivityAggregate();
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint64_t v48 = 0;
    uint64_t v49 = &v48;
    uint64_t v50 = 0x2020000000;
    int v51 = 0;
    uint64_t v44 = 0;
    id v45 = &v44;
    uint64_t v46 = 0x2020000000;
    int v47 = 0;
    if (v3)
    {
      uint64_t v5 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSample];
      uint64_t v6 = [v5 objectForKey:@"assertionAggregated"];

      if (v6)
      {
        uint64_t v7 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSample];
        v34 = [v7 objectForKeyedSubscript:@"assertionAggregatedDate"];

        id v8 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSample];
        [v8 objectForKey:@"assertionAggregated"];
        SamplesDelta = (void *)IOReportCreateSamplesDelta();

        v43[0] = 0;
        v43[1] = v43;
        v43[2] = 0x2020000000;
        v43[3] = 0;
        uint64_t v37 = 0;
        uint64_t v38 = &v37;
        uint64_t v39 = 0x3032000000;
        id v40 = __Block_byref_object_copy__3;
        v41 = __Block_byref_object_dispose__3;
        id v42 = [MEMORY[0x1E4F1CA60] dictionary];
        block[13] = MEMORY[0x1E4F143A8];
        block[14] = 3221225472;
        block[15] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke;
        block[16] = &unk_1E692B978;
        block[17] = v43;
        block[18] = &v48;
        IOReportIterate();
        void block[5] = MEMORY[0x1E4F143A8];
        block[6] = 3221225472;
        block[7] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_2;
        block[8] = &unk_1E692B9A0;
        block[9] = self;
        block[10] = &v44;
        block[11] = v43;
        block[12] = &v37;
        IOReportIterate();
        id v10 = [MEMORY[0x1E4F92900] sharedInstance];
        [v10 createDistributionEventIntervalWithDistributionID:22 withChildNodeNameToWeight:v38[5] withStartDate:v34 withEndDate:v4];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v11 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_616;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          void block[4] = v11;
          if (qword_1EBD57E60 != -1) {
            dispatch_once(&qword_1EBD57E60, block);
          }
          if (byte_1EBD57D3A)
          {
            uint64_t v12 = [NSString stringWithFormat:@"+++++++++++++++++++++++++++++++++++++++++"];
            uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
            uint64_t v15 = [v14 lastPathComponent];
            uint64_t v16 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logAggregatedAssertionActivity]"];
            [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:1084];

            uint64_t v17 = PLLogCommon();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v53 = v12;
              _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v18 = objc_opt_class();
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_622;
          v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v35[4] = v18;
          if (qword_1EBD57E68 != -1) {
            dispatch_once(&qword_1EBD57E68, v35);
          }
          if (byte_1EBD57D3B)
          {
            char v19 = [NSString stringWithFormat:@"OLDlogging: start date: %@, end dat %@, accounting:%@", v34, v4, v38[5]];
            uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
            uint64_t v22 = [v21 lastPathComponent];
            uint64_t v23 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logAggregatedAssertionActivity]"];
            [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:1085];

            uint64_t v24 = PLLogCommon();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v53 = v19;
              _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        _Block_object_dispose(&v37, 8);

        _Block_object_dispose(v43, 8);
      }
      uint64_t v25 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSample];
      [v25 setObject:v3 forKey:@"assertionAggregated"];

      uint64_t v26 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSample];
      [v26 setObject:v4 forKey:@"assertionAggregatedDate"];

      int64_t v27 = *((int *)v49 + 6);
      int64_t v28 = [(PLPowerAssertionAgent *)self aggregateMaxPIDCount];
      uint64_t v29 = *((unsigned int *)v49 + 6);
      if (v28 >= v27)
      {
        int v31 = *((_DWORD *)v45 + 6);
        int64_t v32 = [(PLPowerAssertionAgent *)self aggregteZeroDeltaCount];
        uint64_t v33 = v29 == v31;
        uint64_t v29 = *((unsigned int *)v49 + 6);
        if (v32 != v33)
        {
          [(PLPowerAssertionAgent *)self logEventPointAggregateResetWithReason:0 withPidCount:*((unsigned int *)v49 + 6)];
          goto LABEL_25;
        }
        uint64_t v30 = 4;
      }
      else
      {
        uint64_t v30 = 3;
      }
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v30 = 1;
    }
    [(PLPowerAssertionAgent *)self resetIOPMSetAssertionActivityAggregateWithReason:v30 withPidCount:v29];
LABEL_25:
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);
  }
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += IOReportArrayGetValueAtIndex();
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return 0;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t ChannelID = IOReportChannelGetChannelID();
  uint64_t ValueAtIndex = IOReportArrayGetValueAtIndex();
  uint64_t v4 = IOReportArrayGetValueAtIndex();
  uint64_t v5 = IOReportArrayGetValueAtIndex();
  if (ValueAtIndex < 0 || v4 < 0 || (uint64_t v6 = v5, v5 < 0))
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    if (ValueAtIndex || v4 || v5)
    {
      if (*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 1)
      {
        double v7 = (double)IOReportArrayGetValueAtIndex()
           / (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        if (v7 > 0.05)
        {
          id v8 = [*(id *)(a1 + 32) bundleIDForAssertionProcessPID:ChannelID];
          uint64_t v9 = [NSNumber numberWithDouble:v7];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v9 forKeyedSubscript:v8];

          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v10 = objc_opt_class();
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_3;
            v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v29[4] = v10;
            if (qword_1EBD57E50 != -1) {
              dispatch_once(&qword_1EBD57E50, v29);
            }
            if (byte_1EBD57D38)
            {
              int64_t v27 = v8;
              uint64_t v11 = [NSString stringWithFormat:@"Total %llu, name %@, contribution %d, weight %f", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v8, ChannelID, *(void *)&v7];
              uint64_t v26 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
              uint64_t v13 = [v12 lastPathComponent];
              uint64_t v14 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logAggregatedAssertionActivity]_block_invoke_2"];
              [v26 logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:1069];

              uint64_t v15 = PLLogCommon();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138412290;
                int v31 = v11;
                _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v8 = v27;
            }
          }
        }
      }
    }
    else
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_611;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v16;
      if (qword_1EBD57E58 != -1) {
        dispatch_once(&qword_1EBD57E58, block);
      }
      if (byte_1EBD57D39)
      {
        uint64_t v17 = NSString;
        uint64_t v18 = [*(id *)(a1 + 32) bundleIDForAssertionProcessPID:ChannelID];
        char v19 = [v17 stringWithFormat:@"pid=%d name=%@ eff1=%lld eff2=%lld eff3=%lld", ChannelID, v18, ValueAtIndex, v4, v6];

        uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
        uint64_t v22 = [v21 lastPathComponent];
        uint64_t v23 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logAggregatedAssertionActivity]_block_invoke_2"];
        [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:1075];

        uint64_t v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          int v31 = v19;
          _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  return 0;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D38 = result;
  return result;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_611(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D39 = result;
  return result;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_616(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D3A = result;
  return result;
}

uint64_t __55__PLPowerAssertionAgent_logAggregatedAssertionActivity__block_invoke_622(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D3B = result;
  return result;
}

- (void)logAggregatedAssertionActivityPLDataStructure
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    BOOL v57 = (void *)IOPMCopyAssertionActivityAggregate();
    v58 = objc_opt_new();
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    int v81 = 0;
    int v56 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if (v57)
    {
      uint64_t v72 = MEMORY[0x1E4F143A8];
      uint64_t v73 = 3221225472;
      v74 = __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke;
      v75 = &unk_1E692B9C8;
      uint64_t v77 = &v78;
      id v76 = v58;
      IOReportIterate();
    }
    if (v58 && [v58 count])
    {
      uint64_t v2 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSamplePLDataStructure];
      BOOL v3 = [v2 count] == 0;

      if (v3)
      {
        unsigned int v59 = 0;
      }
      else
      {
        uint64_t v4 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSamplePLDataStructure];
        uint64_t v55 = [v4 objectForKeyedSubscript:@"assertionAggregatedDate"];

        v60 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v5 = v58;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v68 objects:v85 count:16];
        if (v6)
        {
          unsigned int v59 = 0;
          uint64_t v7 = *(void *)v69;
          double v8 = 0.0;
          do
          {
            uint64_t v9 = 0;
            v59 += v6;
            do
            {
              if (*(void *)v69 != v7) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v68 + 1) + 8 * v9);
              uint64_t v11 = [v5 objectForKeyedSubscript:v10];
              uint64_t v12 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSamplePLDataStructure];
              uint64_t v13 = [v12 objectForKeyedSubscript:@"assertionAggregated"];
              uint64_t v14 = [v13 objectForKeyedSubscript:v10];

              [v11 doubleValue];
              double v16 = v15;
              [v14 doubleValue];
              double v18 = v17;

              double v8 = v8 + v16 - v18;
              ++v9;
            }
            while (v6 != v9);
            uint64_t v6 = [v5 countByEnumeratingWithState:&v68 objects:v85 count:16];
          }
          while (v6);
        }
        else
        {
          unsigned int v59 = 0;
          double v8 = 0.0;
        }

        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v21 = v5;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:v84 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v65 != v23) {
                objc_enumerationMutation(v21);
              }
              uint64_t v25 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              uint64_t v26 = [v21 objectForKeyedSubscript:v25];
              int64_t v27 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSamplePLDataStructure];
              int64_t v28 = [v27 objectForKeyedSubscript:@"assertionAggregated"];
              uint64_t v29 = [v28 objectForKeyedSubscript:v25];

              if (v8 > 0.0)
              {
                [v26 doubleValue];
                double v31 = v30;
                [v29 doubleValue];
                double v33 = (v31 - v32) / v8;
                if (v33 > 0.05)
                {
                  v34 = -[PLPowerAssertionAgent bundleIDForAssertionProcessPID:](self, "bundleIDForAssertionProcessPID:", [v25 integerValue]);
                  v35 = [NSNumber numberWithDouble:v33];
                  [v60 setObject:v35 forKeyedSubscript:v34];
                }
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:v84 count:16];
          }
          while (v22);
        }

        id v36 = [MEMORY[0x1E4F92900] sharedInstance];
        [v36 createDistributionEventIntervalWithDistributionID:22 withChildNodeNameToWeight:v60 withStartDate:v55 withEndDate:v56];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v37 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke_2;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          void block[4] = v37;
          if (qword_1EBD57E70 != -1) {
            dispatch_once(&qword_1EBD57E70, block);
          }
          if (byte_1EBD57D3C)
          {
            uint64_t v38 = [NSString stringWithFormat:@"+++++++++++++++++++++++++++++++++++++++++"];
            uint64_t v39 = (void *)MEMORY[0x1E4F929B8];
            id v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
            v41 = [v40 lastPathComponent];
            id v42 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logAggregatedAssertionActivityPLDataStructure]"];
            [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:1169];

            v43 = PLLogCommon();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              long long v83 = v38;
              _os_log_debug_impl(&dword_1D2690000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v44 = objc_opt_class();
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke_628;
          v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v62[4] = v44;
          if (qword_1EBD57E78 != -1) {
            dispatch_once(&qword_1EBD57E78, v62);
          }
          if (byte_1EBD57D3D)
          {
            id v45 = [NSString stringWithFormat:@"Newlogging: start date: %@, end dat %@, accounting:%@", v55, v56, v60];
            uint64_t v46 = (void *)MEMORY[0x1E4F929B8];
            int v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPowerAssertionAgent.m"];
            uint64_t v48 = [v47 lastPathComponent];
            uint64_t v49 = [NSString stringWithUTF8String:"-[PLPowerAssertionAgent logAggregatedAssertionActivityPLDataStructure]"];
            [v46 logMessage:v45 fromFile:v48 fromFunction:v49 fromLineNumber:1170];

            uint64_t v50 = PLLogCommon();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              long long v83 = v45;
              _os_log_debug_impl(&dword_1D2690000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
      }
      int v51 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSamplePLDataStructure];
      [v51 setObject:v58 forKeyedSubscript:@"assertionAggregated"];

      long long v52 = [(PLPowerAssertionAgent *)self assertionAggregatedLastSamplePLDataStructure];
      [v52 setObject:v56 forKeyedSubscript:@"assertionAggregatedDate"];

      if ([(PLPowerAssertionAgent *)self aggregateMaxPIDCount] >= (int)v59)
      {
        int v53 = *((_DWORD *)v79 + 6);
        int64_t v54 = [(PLPowerAssertionAgent *)self aggregteZeroDeltaCount];
        uint64_t v19 = v59;
        if (v54 != (v59 == v53))
        {
          -[PLPowerAssertionAgent logEventPointAggregateResetWithReason:withPidCount:](self, "logEventPointAggregateResetWithReason:withPidCount:", 0);
          goto LABEL_48;
        }
        uint64_t v20 = 4;
      }
      else
      {
        uint64_t v20 = 3;
        uint64_t v19 = v59;
      }
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v20 = 1;
    }
    [(PLPowerAssertionAgent *)self resetIOPMSetAssertionActivityAggregatePLDataStructureWithReason:v20 withPidCount:v19];
LABEL_48:

    _Block_object_dispose(&v78, 8);
  }
}

uint64_t __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke(uint64_t a1)
{
  uint64_t ChannelID = IOReportChannelGetChannelID();
  uint64_t ValueAtIndex = IOReportArrayGetValueAtIndex();
  uint64_t v4 = IOReportArrayGetValueAtIndex();
  uint64_t v5 = IOReportArrayGetValueAtIndex();
  if (ValueAtIndex < 0 || v4 < 0 || v5 < 0)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else if (ValueAtIndex || v4 || v5)
  {
    uint64_t v6 = [NSNumber numberWithDouble:(double)IOReportArrayGetValueAtIndex()];
    uint64_t v7 = *(void **)(a1 + 32);
    double v8 = [NSNumber numberWithInt:ChannelID];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  return 0;
}

uint64_t __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D3C = result;
  return result;
}

uint64_t __70__PLPowerAssertionAgent_logAggregatedAssertionActivityPLDataStructure__block_invoke_628(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57D3D = result;
  return result;
}

- (id)bundleIDForAssertionProcessPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(PLOperator *)self storage];
  uint64_t v5 = [v4 processIDEntryForPid:v3];

  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"BundleID"];
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = (void *)v6;
  double v8 = [v5 objectForKeyedSubscript:@"BundleID"];
  uint64_t v9 = [v8 description];
  char v10 = [v9 isEqualToString:&stru_1F294E108];

  if ((v10 & 1) == 0)
  {
    double v17 = @"BundleID";
  }
  else
  {
LABEL_4:
    uint64_t v11 = [v5 objectForKeyedSubscript:@"ProcessName"];
    if (!v11) {
      goto LABEL_6;
    }
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [v5 objectForKeyedSubscript:@"ProcessName"];
    uint64_t v14 = [v13 description];
    char v15 = [v14 isEqualToString:&stru_1F294E108];

    if (v15)
    {
LABEL_6:
      double v16 = objc_msgSend(NSString, "stringWithFormat:", @"AssertionPID-%d", v3);
      goto LABEL_10;
    }
    double v17 = @"ProcessName";
  }
  double v18 = [v5 objectForKeyedSubscript:v17];
  double v16 = [v18 description];

LABEL_10:
  return v16;
}

- (PLCFNotificationOperatorComposition)assertionNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAssertionNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)assertionBufferFullNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAssertionBufferFullNotification:(id)a3
{
}

- (PLTimer)assertionBufferFullNotificationRearmTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAssertionBufferFullNotificationRearmTimer:(id)a3
{
}

- (BOOL)assertionBufferFullNotificationActive
{
  return self->_assertionBufferFullNotificationActive;
}

- (void)setAssertionBufferFullNotificationActive:(BOOL)a3
{
  self->_assertionBufferFullNotificationActive = a3;
}

- (NSMutableArray)assertionBufferNotificationTracking
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAssertionBufferNotificationTracking:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryLevelNotificiations
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryLevelNotificiations:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wakeNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWakeNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)canSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCanSleepNotification:(id)a3
{
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
}

- (PLCFNotificationOperatorComposition)flushAssertionBufferCFNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFlushAssertionBufferCFNotification:(id)a3
{
}

- (PLTimer)runQueryTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRunQueryTimer:(id)a3
{
}

- (PLTimer)assertionSnapShotTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAssertionSnapShotTimer:(id)a3
{
}

- (BOOL)firstBufferDrain
{
  return self->_firstBufferDrain;
}

- (void)setFirstBufferDrain:(BOOL)a3
{
  self->_firstBufferDrain = a3;
}

- (int64_t)aggregateMaxPIDCount
{
  return self->_aggregateMaxPIDCount;
}

- (void)setAggregateMaxPIDCount:(int64_t)a3
{
  self->_aggregateMaxPIDCount = a3;
}

- (int64_t)aggregteZeroDeltaCount
{
  return self->_aggregteZeroDeltaCount;
}

- (void)setAggregteZeroDeltaCount:(int64_t)a3
{
  self->_aggregteZeroDeltaCount = a3;
}

- (NSMutableDictionary)assertionAggregatedLastSamplePLDataStructure
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAssertionAggregatedLastSamplePLDataStructure:(id)a3
{
}

- (NSMutableDictionary)assertionAggregatedLastSample
{
  return self->_assertionAggregatedLastSample;
}

- (void)setAssertionAggregatedLastSample:(id)a3
{
}

- (NSDictionary)startEndActionsToEnum
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (NSDictionary)assertTypeToEnum
{
  return (NSDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (NSSet)logAssertNameForActions
{
  return (NSSet *)objc_getProperty(self, a2, 192, 1);
}

- (BOOL)lastActivityOverflow
{
  return self->_lastActivityOverflow;
}

- (void)setLastActivityOverflow:(BOOL)a3
{
  self->_lastActivityOverflow = a3;
}

- (NSMutableDictionary)assertionUUIDCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAssertionUUIDCache:(id)a3
{
}

- (NSMutableDictionary)UUIDStartEntryCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setUUIDStartEntryCache:(id)a3
{
}

- (NSMutableDictionary)subSecondUUIDStartEntryCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSubSecondUUIDStartEntryCache:(id)a3
{
}

- (PLNSNotificationOperatorComposition)consoleModeListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 224, 1);
}

- (void)setConsoleModeListener:(id)a3
{
}

- (BOOL)gameMode
{
  return self->_gameMode;
}

- (void)setGameMode:(BOOL)a3
{
  self->_gameMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consoleModeListener, 0);
  objc_storeStrong((id *)&self->_subSecondUUIDStartEntryCache, 0);
  objc_storeStrong((id *)&self->_UUIDStartEntryCache, 0);
  objc_storeStrong((id *)&self->_assertionUUIDCache, 0);
  objc_storeStrong((id *)&self->_logAssertNameForActions, 0);
  objc_storeStrong((id *)&self->_assertTypeToEnum, 0);
  objc_storeStrong((id *)&self->_startEndActionsToEnum, 0);
  objc_storeStrong((id *)&self->_assertionAggregatedLastSample, 0);
  objc_storeStrong((id *)&self->_assertionAggregatedLastSamplePLDataStructure, 0);
  objc_storeStrong((id *)&self->_assertionSnapShotTimer, 0);
  objc_storeStrong((id *)&self->_runQueryTimer, 0);
  objc_storeStrong((id *)&self->_flushAssertionBufferCFNotification, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_canSleepNotification, 0);
  objc_storeStrong((id *)&self->_wakeNotification, 0);
  objc_storeStrong((id *)&self->_batteryLevelNotificiations, 0);
  objc_storeStrong((id *)&self->_assertionBufferNotificationTracking, 0);
  objc_storeStrong((id *)&self->_assertionBufferFullNotificationRearmTimer, 0);
  objc_storeStrong((id *)&self->_assertionBufferFullNotification, 0);
  objc_storeStrong((id *)&self->_assertionNotification, 0);
}

@end