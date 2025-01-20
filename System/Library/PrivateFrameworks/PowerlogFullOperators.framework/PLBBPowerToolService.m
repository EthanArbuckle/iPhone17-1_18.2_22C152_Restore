@interface PLBBPowerToolService
+ (id)entryAggregateDefinitions;
+ (id)entryArmUtil;
+ (id)entryCauseDefinition;
+ (id)entryCauseHelperDefinition;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)containsExclusionsAfterCleanupWithDate:(id)a3;
- (BOOL)doesCurrPackageHasProblem;
- (BOOL)doesCurrPeriodHaveProblem:(id)a3;
- (BOOL)doesPrevPackageHasProblem;
- (BOOL)isPackageTimeValidWithEntry:(id)a3;
- (BOOL)isPackageValidWithEntry:(id)a3;
- (BOOL)isUIAlertEnabled;
- (BOOL)sendAWD;
- (NSDate)notToRemoveDate;
- (NSDate)startSamplingDate;
- (NSMutableArray)endExclusionPeriods;
- (NSMutableArray)startExclusionPeriods;
- (PLBBPowerToolService)init;
- (PLEntryNotificationOperatorComposition)audioEventCallback;
- (PLEntryNotificationOperatorComposition)bbHwOtherCallback;
- (PLEntryNotificationOperatorComposition)displayEventCallback;
- (PLEntryNotificationOperatorComposition)hotspotEventCallback;
- (PLEntryNotificationOperatorComposition)lteRRCCallback;
- (PLEntryNotificationOperatorComposition)msgLiteCallback;
- (PLEntryNotificationOperatorComposition)telActivityCallback;
- (PLEntryNotificationOperatorComposition)wcdmaRRCCallback;
- (PLNSNotificationOperatorComposition)dailyTaskNotification;
- (PLTelephonyConnection)connection;
- (double)armUtilityThresholdVal;
- (double)calculateMaxPerepherialPercentageWithEntry:(id)a3;
- (double)elapsedDenumerator;
- (double)gArmUtil;
- (double)magicDeltaThresholdVal;
- (double)oosDurationVal;
- (double)percentageHistogramFromArray:(id)a3;
- (double)rrcDisconnectedVal;
- (double)totalNormalARMUtility;
- (id)analazeCauseResultsReturnCause:(CauseDurations *)a3;
- (id)findCauseWithEntry:(id)a3;
- (int)gPerepherialMax;
- (unsigned)exclusionMask;
- (void)analazeIntervalWithSnapshot:(CauseSnapshot *)a3 withDuration:(CauseDurations *)a4 withInterval:(double)a5 withEntry:(id)a6;
- (void)collectExtraDataForPackage:(id)a3;
- (void)handleAudioCallback:(id)a3;
- (void)handleDisplayCallback:(id)a3;
- (void)handleExclusionWithState:(BOOL)a3 withExclusion:(unsigned __int8)a4;
- (void)handleHotspotCallback:(id)a3;
- (void)handleMavBBHwOtherCallback:(id)a3;
- (void)handleProblemWithEntry:(id)a3;
- (void)initOperatorDependancies;
- (void)lteRRCCallback:(id)a3;
- (void)msgLiteCallback:(id)a3;
- (void)resetAllCounters:(id)a3;
- (void)resetStructuresWithSnapshot:(CauseSnapshot *)a3 withDuration:(CauseDurations *)a4;
- (void)setArmUtilityThresholdVal:(double)a3;
- (void)setAudioEventCallback:(id)a3;
- (void)setBbHwOtherCallback:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDailyTaskNotification:(id)a3;
- (void)setDisplayEventCallback:(id)a3;
- (void)setDoesCurrPackageHasProblem:(BOOL)a3;
- (void)setDoesPrevPackageHasProblem:(BOOL)a3;
- (void)setElapsedDenumerator:(double)a3;
- (void)setEndExclusionPeriods:(id)a3;
- (void)setExclusionMask:(unsigned __int8)a3;
- (void)setGArmUtil:(double)a3;
- (void)setGPerepherialMax:(int)a3;
- (void)setHotspotEventCallback:(id)a3;
- (void)setIsUIAlertEnabled:(BOOL)a3;
- (void)setLteRRCCallback:(id)a3;
- (void)setMagicDeltaThresholdVal:(double)a3;
- (void)setMsgLiteCallback:(id)a3;
- (void)setNotToRemoveDate:(id)a3;
- (void)setOosDurationVal:(double)a3;
- (void)setRrcDisconnectedVal:(double)a3;
- (void)setSendAWD:(BOOL)a3;
- (void)setStartExclusionPeriods:(id)a3;
- (void)setStartSamplingDate:(id)a3;
- (void)setTelActivityCallback:(id)a3;
- (void)setTotalNormalARMUtility:(double)a3;
- (void)setWcdmaRRCCallback:(id)a3;
- (void)submitAWD;
- (void)telActivityCallback:(id)a3;
- (void)wcdmaRRCCallback:(id)a3;
- (void)writeToHelperTable:(id)a3 WithValue:(double)a4 withDate:(id)a5;
@end

@implementation PLBBPowerToolService

+ (id)entryEventPointDefinitions
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"bbPowerPointCause";
  v3 = [a1 entryCauseDefinition];
  v7[1] = @"bbPowerPointCauseHelper";
  v8[0] = v3;
  v4 = [a1 entryCauseHelperDefinition];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryCauseDefinition
{
  v26[2] = *MEMORY[0x263EF8340];
  v25[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v23[0] = *MEMORY[0x263F5F880];
  v23[1] = v2;
  v24[0] = &unk_26E546700;
  v24[1] = MEMORY[0x263EFFA80];
  v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v20;
  v25[1] = *MEMORY[0x263F5F870];
  v21[0] = @"cause";
  v19 = [MEMORY[0x263F5F650] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_StringFormat");
  v22[0] = v18;
  v21[1] = @"causeTimeStamp";
  v17 = [MEMORY[0x263F5F650] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_DateFormat");
  v22[1] = v16;
  v21[2] = @"causeDuration";
  v15 = [MEMORY[0x263F5F650] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[2] = v14;
  v21[3] = @"ArmUtil";
  v3 = [MEMORY[0x263F5F650] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v22[3] = v4;
  v21[4] = @"IsContinuous";
  v5 = [MEMORY[0x263F5F650] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v22[4] = v6;
  v21[5] = @"PerepherialMax";
  v7 = [MEMORY[0x263F5F650] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v22[5] = v8;
  v21[6] = @"APExclusion";
  v9 = [MEMORY[0x263F5F650] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v22[6] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:7];
  v26[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v12;
}

+ (id)entryCauseHelperDefinition
{
  v16[2] = *MEMORY[0x263EF8340];
  v15[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v13[0] = *MEMORY[0x263F5F880];
  v13[1] = v2;
  v14[0] = &unk_26E546700;
  v14[1] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x263F5F870];
  v11[0] = @"BBPowerName";
  v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"Value";
  v12[0] = v5;
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryAggregateDefinitions
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"AggregatedARMUtil";
  uint64_t v2 = [a1 entryArmUtil];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryArmUtil
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v21[0] = *MEMORY[0x263F5F880];
  v21[1] = v2;
  v22[0] = &unk_26E546700;
  v22[1] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v3;
  v23[1] = *MEMORY[0x263F5F870];
  v19[0] = @"ArmUtilBucket";
  v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[1] = @"ArmUtilCount";
  v20[0] = v5;
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v20[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  void v23[2] = *MEMORY[0x263F5F828];
  v17 = &unk_26E546710;
  uint64_t v15 = *MEMORY[0x263F5F820];
  v16 = &unk_26E546710;
  v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  void v24[2] = v10;
  v23[3] = *MEMORY[0x263F5F830];
  v14 = @"ArmUtilCount";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v24[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBBPowerToolService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLBBPowerToolService)init
{
  if ([MEMORY[0x263F5F668] isHomePod]) {
    goto LABEL_9;
  }
  v6.receiver = self;
  v6.super_class = (Class)PLBBPowerToolService;
  self = [(PLOperator *)&v6 init];
  if (self)
  {
    if ([MEMORY[0x263F5F668] internalBuild])
    {
      if ([MEMORY[0x263F5F640] BOOLForKey:@"PLBasebandPostProcessing"]
        && [MEMORY[0x263F5F640] fullMode])
      {
        v3 = [MEMORY[0x263F5F920] sharedTelephonyConnection];
        [v3 enableDiagLogging];

        goto LABEL_8;
      }
      if ([MEMORY[0x263F5F668] isBasebandClass:1003003]) {
        goto LABEL_8;
      }
    }
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
LABEL_8:
  self = self;
  v4 = self;
LABEL_10:

  return v4;
}

- (void)initOperatorDependancies
{
  [(PLBBPowerToolService *)self setExclusionMask:0];
  v3 = objc_opt_new();
  [(PLBBPowerToolService *)self setStartExclusionPeriods:v3];

  v4 = objc_opt_new();
  [(PLBBPowerToolService *)self setEndExclusionPeriods:v4];

  v5 = [MEMORY[0x263EFF910] monotonicDate];
  [(PLBBPowerToolService *)self setNotToRemoveDate:v5];

  [(PLBBPowerToolService *)self setSendAWD:0];
  [(PLBBPowerToolService *)self setDoesCurrPackageHasProblem:0];
  [(PLBBPowerToolService *)self setDoesPrevPackageHasProblem:0];
  [(PLBBPowerToolService *)self setIsUIAlertEnabled:1];
  [MEMORY[0x263F5F640] doubleForKey:@"ArmUtilityThreshold" ifNotSet:80.0];
  -[PLBBPowerToolService setArmUtilityThresholdVal:](self, "setArmUtilityThresholdVal:");
  [MEMORY[0x263F5F640] doubleForKey:@"MagicDeltaThreshold" ifNotSet:10.0];
  -[PLBBPowerToolService setMagicDeltaThresholdVal:](self, "setMagicDeltaThresholdVal:");
  [MEMORY[0x263F5F640] doubleForKey:@"OOSDuration" ifNotSet:80.0];
  -[PLBBPowerToolService setOosDurationVal:](self, "setOosDurationVal:");
  [MEMORY[0x263F5F640] doubleForKey:@"RRCDisconnected" ifNotSet:80.0];
  -[PLBBPowerToolService setRrcDisconnectedVal:](self, "setRrcDisconnectedVal:");
  [(PLBBPowerToolService *)self resetAllCounters:0];
  objc_super v6 = [MEMORY[0x263F5F920] sharedTelephonyConnection];
  objc_storeWeak((id *)&self->_connection, v6);

  uint64_t v7 = *MEMORY[0x263F5F8A0];
  v8 = [MEMORY[0x263F5F8C0] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F980]];
  id v9 = objc_alloc(MEMORY[0x263F5F658]);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke;
  v48[3] = &unk_264B99DD0;
  v48[4] = self;
  v10 = (void *)[v9 initWithOperator:self forEntryKey:v8 withBlock:v48];
  [(PLBBPowerToolService *)self setAudioEventCallback:v10];
  if ([MEMORY[0x263F5F8E8] shouldLogDisplay])
  {
    v11 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F9F8]];
    id v12 = objc_alloc(MEMORY[0x263F5F658]);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_2;
    v47[3] = &unk_264B99DD0;
    v47[4] = self;
    v13 = (void *)[v12 initWithOperator:self forEntryKey:v11 withBlock:v47];
    [(PLBBPowerToolService *)self setDisplayEventCallback:v13];
  }
  uint64_t v14 = [MEMORY[0x263F5F910] entryKeyForType:v7 andName:*MEMORY[0x263F5FA08]];
  id v15 = objc_alloc(MEMORY[0x263F5F658]);
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_3;
  v46[3] = &unk_264B99DD0;
  v46[4] = self;
  v39 = (void *)v14;
  v38 = (void *)[v15 initWithOperator:self forEntryKey:v14 withBlock:v46];
  -[PLBBPowerToolService setHotspotEventCallback:](self, "setHotspotEventCallback:");
  uint64_t v16 = [MEMORY[0x263F5F8C8] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F990]];
  id v17 = objc_alloc(MEMORY[0x263F5F658]);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_4;
  v45[3] = &unk_264B99DD0;
  v45[4] = self;
  v37 = (void *)v16;
  v18 = (void *)[v17 initWithOperator:self forEntryKey:v16 withBlock:v45];
  [(PLBBPowerToolService *)self setBbHwOtherCallback:v18];
  if ([MEMORY[0x263F5F640] BOOLForKey:@"PLBasebandPostProcessing"])
  {
    v36 = [MEMORY[0x263F5F8C8] entryKeyForType:*MEMORY[0x263F5F8B0] andName:*MEMORY[0x263F5F940]];
    id v19 = objc_alloc(MEMORY[0x263F5F658]);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_5;
    v44[3] = &unk_264B99DD0;
    v44[4] = self;
    v35 = (void *)[v19 initWithOperator:self forEntryKey:v36 withBlock:v44];
    [(PLBBPowerToolService *)self setMsgLiteCallback:v35];
    v34 = [MEMORY[0x263F5F8C8] entryKeyForType:v7 andName:*MEMORY[0x263F5F938]];
    id v20 = objc_alloc(MEMORY[0x263F5F658]);
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_6;
    v43[3] = &unk_264B99DD0;
    v43[4] = self;
    v21 = (void *)[v20 initWithOperator:self forEntryKey:v34 withBlock:v43];
    [(PLBBPowerToolService *)self setWcdmaRRCCallback:v21];
    v22 = [MEMORY[0x263F5F8C8] entryKeyForType:v7 andName:*MEMORY[0x263F5F930]];
    id v23 = objc_alloc(MEMORY[0x263F5F658]);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_7;
    v42[3] = &unk_264B99DD0;
    v42[4] = self;
    v24 = v10;
    v25 = v8;
    v26 = (void *)[v23 initWithOperator:self forEntryKey:v22 withBlock:v42];
    [(PLBBPowerToolService *)self setLteRRCCallback:v26];
    v27 = [MEMORY[0x263F5F8C8] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F948]];
    id v28 = objc_alloc(MEMORY[0x263F5F658]);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_8;
    v41[3] = &unk_264B99DD0;
    v41[4] = self;
    v29 = (void *)[v28 initWithOperator:self forEntryKey:v27 withBlock:v41];
    [(PLBBPowerToolService *)self setTelActivityCallback:v29];

    v8 = v25;
    v10 = v24;
  }
  id v30 = objc_alloc(MEMORY[0x263F5F660]);
  v31 = [MEMORY[0x263F5F688] workQueueForClass:objc_opt_class()];
  uint64_t v32 = *MEMORY[0x263EFF3C8];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_9;
  v40[3] = &unk_264B99DD0;
  v40[4] = self;
  v33 = (void *)[v30 initWithWorkQueue:v31 forNotification:v32 withBlock:v40];

  [(PLBBPowerToolService *)self setDailyTaskNotification:v33];
  [(PLBBPowerToolService *)self setupInitExclusions];
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAudioCallback:a2];
  }
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleDisplayCallback:a2];
  }
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleHotspotCallback:a2];
  }
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleMavBBHwOtherCallback:a2];
  }
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_5(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) msgLiteCallback:a2];
  }
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_6(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) wcdmaRRCCallback:a2];
  }
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_7(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) lteRRCCallback:a2];
  }
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_8(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) telActivityCallback:a2];
  }
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_9(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_10;
    uint64_t v14 = &unk_264B9A218;
    id v15 = @"DailyTasks";
    uint64_t v16 = v2;
    if (rrcDisconnected_block_invoke_defaultOnce != -1) {
      dispatch_once(&rrcDisconnected_block_invoke_defaultOnce, &v11);
    }
    int v3 = rrcDisconnected_block_invoke_classDebugEnabled;

    if (v3)
    {
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"DailyTasks notification!", v11, v12, v13, v14);
      v5 = (void *)MEMORY[0x263F5F638];
      objc_super v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBBPowerToolService.m"];
      uint64_t v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLBBPowerToolService initOperatorDependancies]_block_invoke_9"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:330];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDNetworkUsage handleNameConnectionCallback:]((uint64_t)v4, v9);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "submitAWD", v11, v12, v13, v14);
  return [*(id *)(a1 + 32) setIsUIAlertEnabled:1];
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_10(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  rrcDisconnected_block_invoke_classDebugEnabled = result;
  return result;
}

- (void)writeToHelperTable:(id)a3 WithValue:(double)a4 withDate:(id)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = *MEMORY[0x263F5F8B8];
  id v10 = a5;
  uint64_t v11 = +[PLOperator entryKeyForType:v9 andName:@"bbPowerPointCauseHelper"];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v11 withDate:v10];

  v13 = [NSString stringWithFormat:@"%@=\"%@\", @"BBPowerName"", v8];
  uint64_t v14 = [(PLOperator *)self storage];
  id v15 = [(PLBBPowerToolService *)self notToRemoveDate];
  [v15 timeIntervalSince1970];
  double v17 = v16;
  v26[0] = v13;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v19 = [v14 entriesForKey:v11 before:1 timeInterval:1 count:v18 withFilters:v17];

  if ([v19 count])
  {
    id v20 = [v19 objectAtIndexedSubscript:0];
    v21 = [(PLOperator *)self storage];
    v22 = [v20 entryDate];
    v25 = v13;
    id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    [v21 deleteAllEntriesForKey:v11 beforeTimestamp:v22 withFilters:v23];
  }
  [v12 setObject:v8 forKeyedSubscript:@"BBPowerName"];
  v24 = [NSNumber numberWithDouble:a4];
  [v12 setObject:v24 forKeyedSubscript:@"Value"];

  [(PLOperator *)self logEntry:v12];
}

- (void)msgLiteCallback:(id)a3
{
  id v8 = [a3 objectForKey:@"entry"];
  v4 = [v8 objectForKeyedSubscript:@"EventCode"];
  [v4 doubleValue];
  unsigned int v6 = v5;

  if (v6 == 1010)
  {
    uint64_t v7 = [v8 entryDate];
    [(PLBBPowerToolService *)self writeToHelperTable:@"prachCount" WithValue:v7 withDate:0.0];
  }
}

- (void)wcdmaRRCCallback:(id)a3
{
  id v13 = [a3 objectForKey:@"entry"];
  v4 = [v13 objectForKeyedSubscript:@"EventCode"];
  [v4 doubleValue];
  unsigned int v6 = v5;

  id v7 = [NSString alloc];
  id v8 = [v13 objectForKeyedSubscript:@"CurrState"];
  uint64_t v9 = (void *)[v7 initWithString:v8];

  if (v6 == 571)
  {
    if ([v9 isEqual:@"Disconnected"])
    {
      id v10 = [v13 entryDate];
      double v11 = 0.0;
    }
    else
    {
      int v12 = [v9 isEqual:@"CellDCH"];
      id v10 = [v13 entryDate];
      if (v12) {
        double v11 = 1.0;
      }
      else {
        double v11 = 2.0;
      }
    }
    [(PLBBPowerToolService *)self writeToHelperTable:@"wcdmaRRCState" WithValue:v10 withDate:v11];
  }
}

- (void)lteRRCCallback:(id)a3
{
  id v12 = [a3 objectForKey:@"entry"];
  v4 = [v12 objectForKeyedSubscript:@"EventCode"];
  [v4 doubleValue];
  unsigned int v6 = v5;

  id v7 = [v12 objectForKeyedSubscript:@"State"];
  id v8 = v7;
  if (v6 == 1606)
  {
    if ([v7 isEqual:@"Disconnected"])
    {
      uint64_t v9 = [v12 entryDate];
      double v10 = 0.0;
    }
    else
    {
      int v11 = [v8 isEqual:@"CellDCH"];
      uint64_t v9 = [v12 entryDate];
      if (v11) {
        double v10 = 1.0;
      }
      else {
        double v10 = 2.0;
      }
    }
    [(PLBBPowerToolService *)self writeToHelperTable:@"lteRRCState" WithValue:v9 withDate:v10];
  }
}

- (void)telActivityCallback:(id)a3
{
  id v12 = [a3 objectForKey:@"entry"];
  v4 = [v12 objectForKeyedSubscript:@"campedRat"];
  if ([v4 isEqualToString:@"Unknown"])
  {
    double v5 = [v12 entryDate];
    double v6 = 0.0;
  }
  else if ([v4 isEqualToString:@"UMTS"])
  {
    double v5 = [v12 entryDate];
    double v6 = 1.0;
  }
  else
  {
    int v7 = [v4 isEqualToString:@"LTE"];
    double v5 = [v12 entryDate];
    if (v7) {
      double v6 = 2.0;
    }
    else {
      double v6 = 3.0;
    }
  }
  [(PLBBPowerToolService *)self writeToHelperTable:@"campedRat" WithValue:v5 withDate:v6];

  id v8 = [v12 objectForKeyedSubscript:@"signalStrength"];
  [v8 doubleValue];
  double v10 = v9;
  int v11 = [v12 entryDate];
  [(PLBBPowerToolService *)self writeToHelperTable:@"strength" WithValue:v11 withDate:v10];
}

- (void)resetAllCounters:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v4 = [v5 entryDate];
    [(PLBBPowerToolService *)self setNotToRemoveDate:v4];
  }
  [(PLBBPowerToolService *)self setElapsedDenumerator:0.0];
  [(PLBBPowerToolService *)self setTotalNormalARMUtility:0.0];
  [(PLBBPowerToolService *)self setStartSamplingDate:0];
  if ([(PLBBPowerToolService *)self doesCurrPackageHasProblem])
  {
    [(PLBBPowerToolService *)self setDoesPrevPackageHasProblem:1];
    [(PLBBPowerToolService *)self setDoesCurrPackageHasProblem:0];
  }
  else
  {
    [(PLBBPowerToolService *)self setDoesPrevPackageHasProblem:0];
  }
}

- (void)handleAudioCallback:(id)a3
{
  v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 objectForKeyedSubscript:@"Active"];
    uint64_t v6 = [v5 BOOLValue];

    [(PLBBPowerToolService *)self handleExclusionWithState:v6 withExclusion:1];
    v4 = v7;
  }
}

- (void)handleDisplayCallback:(id)a3
{
  v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 objectForKeyedSubscript:@"Active"];
    uint64_t v6 = [v5 BOOLValue];

    [(PLBBPowerToolService *)self handleExclusionWithState:v6 withExclusion:2];
    v4 = v7;
  }
}

- (void)handleHotspotCallback:(id)a3
{
  v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 objectForKeyedSubscript:@"Active"];
    uint64_t v6 = [v5 BOOLValue];

    [(PLBBPowerToolService *)self handleExclusionWithState:v6 withExclusion:4];
    v4 = v7;
  }
}

- (void)handleExclusionWithState:(BOOL)a3 withExclusion:(unsigned __int8)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  int v7 = [(PLBBPowerToolService *)self exclusionMask];
  if (v5)
  {
    if (!v7)
    {
      id v8 = [MEMORY[0x263EFF910] monotonicDate];
      double v9 = [(PLBBPowerToolService *)self startExclusionPeriods];
      [v9 addObject:v8];
    }
    uint64_t v10 = [(PLBBPowerToolService *)self exclusionMask] | v4;
    [(PLBBPowerToolService *)self setExclusionMask:v10];
  }
  else if (v4)
  {
    if (v7)
    {
      [(PLBBPowerToolService *)self setExclusionMask:[(PLBBPowerToolService *)self exclusionMask] & ~v4];
      if (![(PLBBPowerToolService *)self exclusionMask])
      {
        id v12 = [(PLBBPowerToolService *)self endExclusionPeriods];
        int v11 = [MEMORY[0x263EFF910] monotonicDate];
        [v12 addObject:v11];
      }
    }
  }
}

- (void)handleMavBBHwOtherCallback:(id)a3
{
  int v4 = [a3 objectForKey:@"entry"];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F958]];

  if (v5)
  {
    if ([(PLBBPowerToolService *)self isPackageValidWithEntry:v4])
    {
      [(PLBBPowerToolService *)self collectExtraDataForPackage:v4];
      [(PLBBPowerToolService *)self elapsedDenumerator];
      if (v6 >= 600.0)
      {
        if ([(PLBBPowerToolService *)self doesCurrPeriodHaveProblem:v4]
          && [MEMORY[0x263F5F640] BOOLForKey:@"PLBasebandPostProcessing"])
        {
          if ([(PLBBPowerToolService *)self isUIAlertEnabled])
          {
            CFOptionFlags v21 = 0;
            CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, @"BB Power tool button", @"Submit bug", @"Continue", 0, 0, &v21);
            [(PLBBPowerToolService *)self setIsUIAlertEnabled:0];
          }
          [(PLBBPowerToolService *)self setDoesCurrPackageHasProblem:1];
          goto LABEL_12;
        }
        if ([(PLOperator *)self isDebugEnabled]) {
LABEL_12:
        }
          [(PLBBPowerToolService *)self handleProblemWithEntry:v4];
LABEL_13:
        [(PLBBPowerToolService *)self resetAllCounters:v4];
      }
    }
    else
    {
      if (![(PLOperator *)self isDebugEnabled]) {
        goto LABEL_13;
      }
      int v7 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F8B8] andName:@"bbPowerPointCause"];
      id v8 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v7];
      [(PLBBPowerToolService *)self collectExtraDataForPackage:v4];
      [(PLBBPowerToolService *)self doesCurrPeriodHaveProblem:v4];
      [(PLBBPowerToolService *)self handleProblemWithEntry:v4];
      double v9 = [v4 entryDate];
      uint64_t v10 = (void *)[v9 copy];
      [(PLBBPowerToolService *)self setStartSamplingDate:v10];

      int v11 = [(PLBBPowerToolService *)self startSamplingDate];
      [v8 setObject:v11 forKeyedSubscript:@"causeTimeStamp"];

      id v12 = NSNumber;
      [(PLBBPowerToolService *)self elapsedDenumerator];
      id v13 = objc_msgSend(v12, "numberWithDouble:");
      [v8 setObject:v13 forKeyedSubscript:@"causeDuration"];

      [v8 setObject:@"exclusion" forKeyedSubscript:@"cause"];
      uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[PLBBPowerToolService doesPrevPackageHasProblem](self, "doesPrevPackageHasProblem"));
      [v8 setObject:v14 forKeyedSubscript:@"IsContinuous"];

      id v15 = NSNumber;
      [(PLBBPowerToolService *)self gArmUtil];
      double v16 = objc_msgSend(v15, "numberWithDouble:");
      [v8 setObject:v16 forKeyedSubscript:@"ArmUtil"];

      double v17 = objc_msgSend(NSNumber, "numberWithInt:", -[PLBBPowerToolService gPerepherialMax](self, "gPerepherialMax"));
      [v8 setObject:v17 forKeyedSubscript:@"PerepherialMax"];

      v18 = NSNumber;
      id v19 = [(PLBBPowerToolService *)self startExclusionPeriods];
      id v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
      [v8 setObject:v20 forKeyedSubscript:@"APExclusion"];

      [(PLOperator *)self logEntry:v8];
      [(PLBBPowerToolService *)self resetAllCounters:v4];
    }
  }
}

- (BOOL)doesCurrPeriodHaveProblem:(id)a3
{
  id v4 = a3;
  [(PLBBPowerToolService *)self totalNormalARMUtility];
  double v6 = v5;
  [(PLBBPowerToolService *)self elapsedDenumerator];
  double v8 = v6 / (v7 * 32768.0);
  [(PLBBPowerToolService *)self setGArmUtil:v8];
  double v9 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AggregatedARMUtil"];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v9];
  int v11 = [NSNumber numberWithDouble:v8];
  [v10 setObject:v11 forKeyedSubscript:@"ArmUtilBucket"];

  [v10 setObject:&unk_26E5469E0 forKeyedSubscript:@"ArmUtilCount"];
  [(PLOperator *)self logEntry:v10];
  [(PLBBPowerToolService *)self armUtilityThresholdVal];
  double v13 = v12;
  if (v8 <= v12 && [(PLOperator *)self isDebugEnabled])
  {
    uint64_t v14 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F8B8] andName:@"bbPowerPointCause"];
    id v15 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v14];
    double v16 = [v4 entryDate];
    double v17 = (void *)[v16 copy];
    [(PLBBPowerToolService *)self setStartSamplingDate:v17];

    v18 = [(PLBBPowerToolService *)self startSamplingDate];
    [v15 setObject:v18 forKeyedSubscript:@"causeTimeStamp"];

    id v19 = NSNumber;
    [(PLBBPowerToolService *)self elapsedDenumerator];
    id v20 = objc_msgSend(v19, "numberWithDouble:");
    [v15 setObject:v20 forKeyedSubscript:@"causeDuration"];

    [v15 setObject:@"No problem found" forKeyedSubscript:@"cause"];
    CFOptionFlags v21 = objc_msgSend(NSNumber, "numberWithBool:", -[PLBBPowerToolService doesPrevPackageHasProblem](self, "doesPrevPackageHasProblem"));
    [v15 setObject:v21 forKeyedSubscript:@"IsContinuous"];

    v22 = NSNumber;
    [(PLBBPowerToolService *)self gArmUtil];
    id v23 = objc_msgSend(v22, "numberWithDouble:");
    [v15 setObject:v23 forKeyedSubscript:@"ArmUtil"];

    v24 = objc_msgSend(NSNumber, "numberWithInt:", -[PLBBPowerToolService gPerepherialMax](self, "gPerepherialMax"));
    [v15 setObject:v24 forKeyedSubscript:@"PerepherialMax"];

    v25 = NSNumber;
    v26 = [(PLBBPowerToolService *)self startExclusionPeriods];
    v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
    [v15 setObject:v27 forKeyedSubscript:@"APExclusion"];

    [(PLOperator *)self logEntry:v15];
  }

  return v8 > v13;
}

- (void)collectExtraDataForPackage:(id)a3
{
  id v18 = a3;
  id v4 = [v18 objectForKeyedSubscript:*MEMORY[0x263F5F970]];
  [v4 doubleValue];
  double v6 = v5;

  [(PLBBPowerToolService *)self elapsedDenumerator];
  [(PLBBPowerToolService *)self setElapsedDenumerator:v6 * 0.0000305175781 + v7];
  double v8 = [v18 objectForKeyedSubscript:*MEMORY[0x263F5FA70]];
  [v8 doubleValue];
  double v10 = v9 / v6;
  int v11 = [v18 objectForKeyedSubscript:*MEMORY[0x263F5FA68]];
  [v11 doubleValue];
  double v13 = 100.0 - (v12 / v6 * 100.0 + v10 * 100.0);

  [(PLBBPowerToolService *)self totalNormalARMUtility];
  [(PLBBPowerToolService *)self setTotalNormalARMUtility:v14 + v6 * v13];
  id v15 = [(PLBBPowerToolService *)self startSamplingDate];

  if (!v15)
  {
    double v16 = [v18 entryDate];
    double v17 = (void *)[v16 copy];
    [(PLBBPowerToolService *)self setStartSamplingDate:v17];
  }
}

- (void)handleProblemWithEntry:(id)a3
{
  id v4 = [(PLBBPowerToolService *)self findCauseWithEntry:a3];
  double v5 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F8B8] andName:@"bbPowerPointCause"];
  double v6 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v5];
  double v7 = [(PLBBPowerToolService *)self startSamplingDate];
  [v6 setObject:v7 forKeyedSubscript:@"causeTimeStamp"];

  double v8 = NSNumber;
  [(PLBBPowerToolService *)self elapsedDenumerator];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  [v6 setObject:v9 forKeyedSubscript:@"causeDuration"];

  [v6 setObject:v4 forKeyedSubscript:@"cause"];
  double v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PLBBPowerToolService doesPrevPackageHasProblem](self, "doesPrevPackageHasProblem"));
  [v6 setObject:v10 forKeyedSubscript:@"IsContinuous"];

  int v11 = NSNumber;
  [(PLBBPowerToolService *)self gArmUtil];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  [v6 setObject:v12 forKeyedSubscript:@"ArmUtil"];

  double v13 = objc_msgSend(NSNumber, "numberWithInt:", -[PLBBPowerToolService gPerepherialMax](self, "gPerepherialMax"));
  [v6 setObject:v13 forKeyedSubscript:@"PerepherialMax"];

  double v14 = NSNumber;
  id v15 = [(PLBBPowerToolService *)self startExclusionPeriods];
  double v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  [v6 setObject:v16 forKeyedSubscript:@"APExclusion"];

  [(PLOperator *)self logEntry:v6];
  double v17 = [(PLBBPowerToolService *)self connection];
  id v18 = NSString;
  id v19 = [(PLBBPowerToolService *)self startSamplingDate];
  [(PLBBPowerToolService *)self elapsedDenumerator];
  objc_msgSend(v18, "stringWithFormat:", @"Auto-trigger of core dump by Powerlog: bb-powertool, startTime = %@; duration = %f",
    v19,
  CFOptionFlags v21 = v20);
  char v22 = [v17 requestBasebandStateDump:v21];

  if ((v22 & 1) == 0 && [MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__PLBBPowerToolService_handleProblemWithEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v23;
    if (handleProblemWithEntry__defaultOnce != -1) {
      dispatch_once(&handleProblemWithEntry__defaultOnce, block);
    }
    if (handleProblemWithEntry__classDebugEnabled)
    {
      v24 = [NSString stringWithFormat:@"BBPowerTool: BB snapshot failed"];
      v25 = (void *)MEMORY[0x263F5F638];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBBPowerToolService.m"];
      v27 = [v26 lastPathComponent];
      id v28 = [NSString stringWithUTF8String:"-[PLBBPowerToolService handleProblemWithEntry:]"];
      [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:705];

      v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDNetworkUsage handleNameConnectionCallback:]((uint64_t)v24, v29);
      }
    }
  }
}

uint64_t __47__PLBBPowerToolService_handleProblemWithEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleProblemWithEntry__classDebugEnabled = result;
  return result;
}

- (void)resetStructuresWithSnapshot:(CauseSnapshot *)a3 withDuration:(CauseDurations *)a4
{
  a3->var1 = 0.0;
  a3->var2 = 0;
  a3->var0 = 3;
  a4->var0 = 0;
  *(_OWORD *)&a4->var1 = 0u;
  *(_OWORD *)&a4->var3 = 0u;
}

- (id)analazeCauseResultsReturnCause:(CauseDurations *)a3
{
  double var1 = a3->var1;
  [(PLBBPowerToolService *)self elapsedDenumerator];
  double v7 = v6;
  double var2 = a3->var2;
  [(PLBBPowerToolService *)self elapsedDenumerator];
  double v10 = v9;
  double var4 = a3->var4;
  [(PLBBPowerToolService *)self elapsedDenumerator];
  if (a3->var0 > 50) {
    return @"RACHFail";
  }
  double v14 = v12;
  [(PLBBPowerToolService *)self oosDurationVal];
  if (var1 / v7 * 100.0 > v15) {
    return @"OOS";
  }
  [(PLBBPowerToolService *)self rrcDisconnectedVal];
  if (var2 / v10 * 100.0 > v16) {
    return @"TcXONotShutting";
  }
  if (var4 / v14 * 100.0 >= 50.0) {
    return @"MarginalCoverage";
  }
  return @"Unknown";
}

- (void)analazeIntervalWithSnapshot:(CauseSnapshot *)a3 withDuration:(CauseDurations *)a4 withInterval:(double)a5 withEntry:(id)a6
{
  if (!a3->var0)
  {
    p_double var1 = &a4->var1;
    goto LABEL_8;
  }
  if (a3->var0 == 1 && !a3->var2) {
    a4->double var2 = a4->var2 + a5;
  }
  if (a3->var1 < -100.0)
  {
    p_double var1 = &a4->var4;
LABEL_8:
    *p_double var1 = *p_var1 + a5;
  }
}

- (id)findCauseWithEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F8B8] andName:@"bbPowerPointCauseHelper"];
  double v6 = [(PLOperator *)self storage];
  v31 = (void *)v5;
  double v7 = [v6 entriesForKey:v5];

  uint64_t v32 = v4;
  double v8 = [v4 entryDate];
  double v9 = (void *)MEMORY[0x263EFF910];
  [(PLBBPowerToolService *)self elapsedDenumerator];
  id v11 = [v9 dateWithTimeInterval:v8 sinceDate:-v10];
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v35 = 0;
  memset(v34, 0, sizeof(v34));
  [(PLBBPowerToolService *)self resetStructuresWithSnapshot:&v36 withDuration:v34];
  v33 = v11;
  if (![v7 count]) {
    goto LABEL_22;
  }
  uint64_t v12 = 0;
  char v13 = 0;
  while (1)
  {
    double v14 = [v7 objectAtIndexedSubscript:v12];
    double v15 = [v14 entryDate];
    uint64_t v16 = [v15 compare:v11];

    if (v16 == 1)
    {
      double v17 = [v14 entryDate];
      id v18 = [v17 earlierDate:v8];
      [v11 timeIntervalSinceDate:v18];
      double v20 = v19;

      uint64_t v21 = [v14 entryDate];

      [(PLBBPowerToolService *)self analazeIntervalWithSnapshot:&v36 withDuration:v34 withInterval:v14 withEntry:v20];
      char v13 = 1;
      id v11 = (id)v21;
    }
    char v22 = [v14 objectForKeyedSubscript:@"BBPowerName"];
    if ([v22 isEqualToString:@"campedRat"])
    {
      uint64_t v23 = [v14 objectForKeyedSubscript:@"Value"];
      [v23 doubleValue];
      uint64_t v36 = (uint64_t)v24;
LABEL_15:

      goto LABEL_16;
    }
    if ([v22 isEqualToString:@"strength"])
    {
      uint64_t v23 = [v14 objectForKeyedSubscript:@"Value"];
      [v23 doubleValue];
      uint64_t v37 = v25;
      goto LABEL_15;
    }
    if ([v22 isEqualToString:@"prachCount"])
    {
      if (v13) {
        ++LODWORD(v34[0]);
      }
    }
    else if ([v22 isEqualToString:@"wcdmaRRCState"] {
           || [v22 isEqualToString:@"lteRRCState"])
    }
    {
      uint64_t v23 = [v14 objectForKeyedSubscript:@"Value"];
      [v23 doubleValue];
      uint64_t v38 = (uint64_t)v26;
      goto LABEL_15;
    }
LABEL_16:
    v27 = [v14 entryDate];
    uint64_t v28 = [v27 compare:v8];

    if (v28 == 1) {
      goto LABEL_21;
    }
    if (v12 == [v7 count] - 1) {
      break;
    }

    if ([v7 count] <= (unint64_t)++v12) {
      goto LABEL_22;
    }
  }
  [v11 timeIntervalSinceDate:v8];
  -[PLBBPowerToolService analazeIntervalWithSnapshot:withDuration:withInterval:withEntry:](self, "analazeIntervalWithSnapshot:withDuration:withInterval:withEntry:", &v36, v34, v14);
LABEL_21:

LABEL_22:
  v29 = [(PLBBPowerToolService *)self analazeCauseResultsReturnCause:v34];

  return v29;
}

- (BOOL)isPackageValidWithEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F950]];
  [v5 doubleValue];
  double v7 = v6;
  double v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F970]];
  [v8 doubleValue];
  double v10 = v7 / v9 * 100.0;

  [(PLBBPowerToolService *)self calculateMaxPerepherialPercentageWithEntry:v4];
  int v12 = (int)v11;
  [(PLBBPowerToolService *)self setGPerepherialMax:(int)v11];
  [(PLBBPowerToolService *)self armUtilityThresholdVal];
  double v14 = v13;
  [(PLBBPowerToolService *)self magicDeltaThresholdVal];
  BOOL v19 = 100.0 - v10 <= v14 - v15
     && ([(PLBBPowerToolService *)self armUtilityThresholdVal],
         double v17 = v16,
         [(PLBBPowerToolService *)self magicDeltaThresholdVal],
         v17 - v18 >= (double)v12)
     && [(PLBBPowerToolService *)self isPackageTimeValidWithEntry:v4];

  return v19;
}

- (BOOL)isPackageTimeValidWithEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 entryDate];
  double v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F970]];

  [v6 doubleValue];
  double v8 = v7 * -0.0000305175781;

  double v9 = [MEMORY[0x263EFF910] dateWithTimeInterval:v5 sinceDate:v8];
  double v10 = [(PLBBPowerToolService *)self notToRemoveDate];
  uint64_t v11 = [v9 compare:v10];

  if (v11 == -1)
  {
LABEL_10:
    char v15 = 0;
    goto LABEL_17;
  }
  if ([(PLBBPowerToolService *)self containsExclusionsAfterCleanupWithDate:v9])
  {
    int v12 = [(PLBBPowerToolService *)self startExclusionPeriods];
    double v13 = (void *)[v12 count];
    double v14 = [(PLBBPowerToolService *)self endExclusionPeriods];
    if (v13 == (void *)[v14 count])
    {

LABEL_7:
      double v17 = [(PLBBPowerToolService *)self startExclusionPeriods];
      double v18 = [v17 objectAtIndexedSubscript:0];
      uint64_t v19 = [v9 compare:v18];
      if (v19 == -1
        && ([(PLBBPowerToolService *)self startExclusionPeriods],
            double v13 = objc_claimAutoreleasedReturnValue(),
            [v13 objectAtIndexedSubscript:0],
            v27 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v5, "compare:") == 1))
      {
        BOOL v20 = 1;
      }
      else
      {
        uint64_t v21 = [(PLBBPowerToolService *)self endExclusionPeriods];
        char v22 = [v21 objectAtIndexedSubscript:0];
        if ([v9 compare:v22] == -1)
        {
          uint64_t v23 = [(PLBBPowerToolService *)self endExclusionPeriods];
          [v23 objectAtIndexedSubscript:0];
          double v24 = v26 = v13;
          BOOL v20 = [v5 compare:v24] == 1;

          double v13 = v26;
        }
        else
        {
          BOOL v20 = 0;
        }

        if (v19 != -1) {
          goto LABEL_16;
        }
      }

LABEL_16:
      char v15 = !v20;
      goto LABEL_17;
    }
    double v13 = [(PLBBPowerToolService *)self endExclusionPeriods];
    uint64_t v16 = [v13 count];

    if (v16) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  char v15 = 1;
LABEL_17:

  return v15;
}

- (BOOL)containsExclusionsAfterCleanupWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBBPowerToolService *)self startExclusionPeriods];
  double v6 = (void *)[v5 count];

  if (v6)
  {
    while (1)
    {
      double v7 = [(PLBBPowerToolService *)self endExclusionPeriods];
      uint64_t v8 = [v7 count];
      if (v8)
      {
        uint64_t v5 = [(PLBBPowerToolService *)self endExclusionPeriods];
        double v6 = [v5 objectAtIndexedSubscript:0];
        if ([v4 compare:v6] == -1) {
          break;
        }
      }
      double v9 = [(PLBBPowerToolService *)self endExclusionPeriods];
      uint64_t v10 = [v9 count];

      if (v8)
      {
      }
      if (!v10) {
        goto LABEL_10;
      }
      uint64_t v11 = [(PLBBPowerToolService *)self startExclusionPeriods];
      [v11 removeObjectAtIndex:0];

      int v12 = [(PLBBPowerToolService *)self endExclusionPeriods];
      [v12 removeObjectAtIndex:0];

      double v13 = [(PLBBPowerToolService *)self startExclusionPeriods];
      uint64_t v14 = [v13 count];

      if (!v14) {
        goto LABEL_8;
      }
    }

LABEL_10:
    BOOL v15 = 1;
  }
  else
  {
LABEL_8:
    BOOL v15 = 0;
  }

  return v15;
}

- (double)percentageHistogramFromArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "doubleValue", (void)v15);
          double v8 = v8 + v10;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    int v12 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v4, "count") - 1);
    [v12 doubleValue];
    double v11 = v13 / v8 * 100.0;
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (double)calculateMaxPerepherialPercentageWithEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5FA80]];
  if (([MEMORY[0x263F5F668] isBasebandClass:1003001] & 1) != 0
    || ([MEMORY[0x263F5F668] isBasebandClass:1003002] & 1) != 0
    || [MEMORY[0x263F5F668] isBasebandClass:1003003])
  {
    [(PLBBPowerToolService *)self percentageHistogramFromArray:v5];
    double v7 = v6;
    double v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F968]];

    [(PLBBPowerToolService *)self percentageHistogramFromArray:v8];
    if (v7 < v9) {
      double v7 = v9;
    }
    double v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5FA78]];

    [(PLBBPowerToolService *)self percentageHistogramFromArray:v10];
    if (v7 < v11) {
      double v7 = v11;
    }
    int v12 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5F960]];

    [(PLBBPowerToolService *)self percentageHistogramFromArray:v12];
    if (v7 < v13) {
      double v7 = v13;
    }
    uint64_t v14 = (void *)MEMORY[0x263F5FA88];
  }
  else
  {
    long long v18 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5FA58]];

    [(PLBBPowerToolService *)self percentageHistogramFromArray:v18];
    double v7 = v19;
    uint64_t v20 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5FA48]];

    [(PLBBPowerToolService *)self percentageHistogramFromArray:v20];
    if (v7 < v21) {
      double v7 = v21;
    }
    int v12 = [v4 objectForKeyedSubscript:*MEMORY[0x263F5FA50]];

    [(PLBBPowerToolService *)self percentageHistogramFromArray:v12];
    if (v7 < v22) {
      double v7 = v22;
    }
    uint64_t v14 = (void *)MEMORY[0x263F5FA60];
  }
  long long v15 = [v4 objectForKeyedSubscript:*v14];

  [(PLBBPowerToolService *)self percentageHistogramFromArray:v15];
  if (v7 < v16) {
    double v7 = v16;
  }

  return v7;
}

- (void)submitAWD
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F864B0]) initWithComponentId:31 andBlockOnConfiguration:1];
  uint64_t v4 = [v3 newMetricContainerWithIdentifier:2031617];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    v58 = (void *)v4;
    v59 = v3;
    id v60 = objc_alloc_init(MEMORY[0x263F8AFF8]);
    double v6 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
    double v7 = [MEMORY[0x263EFF910] monotonicDate];
    [v6 timeIntervalSince1970];
    double v9 = v8;
    [v7 timeIntervalSince1970];
    double v11 = v10 - v9;

    unint64_t v12 = 0x264B99000uLL;
    uint64_t v13 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AggregatedARMUtil"];
    uint64_t v14 = [(PLOperator *)self storage];
    v57 = (void *)v13;
    uint64_t v15 = objc_msgSend(v14, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v13, 86400.0, v9, v11);

    v56 = (void *)v15;
    double v16 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v15];
    int v95 = 0;
    memset(v94, 0, sizeof(v94));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v65 objects:v93 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      v63 = self;
      uint64_t v19 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v66 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          double v22 = [v21 objectForKeyedSubscript:@"ArmUtilBucket"];
          [v22 doubleValue];
          unsigned int v24 = v23;

          uint64_t v25 = [v21 objectForKeyedSubscript:@"ArmUtilCount"];
          [v25 doubleValue];
          *((_DWORD *)v94 + v24) = (int)v26;
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v65 objects:v93 count:16];
      }
      while (v18);
      self = v63;
      unint64_t v12 = 0x264B99000;
    }
    else
    {
      unsigned int v24 = 0;
    }
    [v60 setArmUtilityPDFs:v94 count:101];
    uint64_t v27 = [*(id *)(v12 + 2568) entryKeyForType:*MEMORY[0x263F5F8B8] andName:@"bbPowerPointCause"];
    uint64_t v28 = [(PLOperator *)self storage];
    v55 = (void *)v27;
    v29 = [v28 entriesForKey:v27];

    int v92 = 0;
    memset(v91, 0, sizeof(v91));
    int v90 = 0;
    memset(v89, 0, sizeof(v89));
    int v88 = 0;
    memset(v87, 0, sizeof(v87));
    int v86 = 0;
    memset(v85, 0, sizeof(v85));
    int v84 = 0;
    memset(v83, 0, sizeof(v83));
    int v82 = 0;
    memset(v81, 0, sizeof(v81));
    int v80 = 0;
    memset(v79, 0, sizeof(v79));
    int v78 = 0;
    memset(v77, 0, sizeof(v77));
    memset(v76, 0, sizeof(v76));
    memset(v75, 0, sizeof(v75));
    memset(v74, 0, sizeof(v74));
    memset(v73, 0, sizeof(v73));
    memset(v72, 0, sizeof(v72));
    memset(v71, 0, sizeof(v71));
    memset(v70, 0, sizeof(v70));
    memset(v69, 0, sizeof(v69));
    v64 = v29;
    if ([v29 count] != -1)
    {
      uint64_t v30 = 0;
      v31 = 0;
      unint64_t v62 = 0;
      unsigned __int8 v32 = 0;
      char v33 = 0;
      unsigned int v34 = 0;
      unsigned int v35 = 1;
      while (1)
      {
        uint64_t v36 = v31;
        if ([v64 count] == v30) {
          goto LABEL_24;
        }
        uint64_t v37 = [v64 objectAtIndexedSubscript:v30];
        uint64_t v38 = [v37 objectForKeyedSubscript:@"ArmUtil"];
        [v38 doubleValue];
        unsigned int v24 = v39;

        uint64_t v36 = [v37 objectForKeyedSubscript:@"cause"];

        if (v35 == 1)
        {
          char v33 = 0;
          unsigned __int8 v32 = 1;
          unsigned int v34 = v24;
          LODWORD(v62) = 1;
          HIDWORD(v62) = v24;
        }
        else
        {
          unsigned int v61 = v34;
          v40 = [v37 objectForKeyedSubscript:@"IsContinuous"];
          int v41 = [v40 BOOLValue];

          if (!v41)
          {

            unsigned int v34 = v61;
LABEL_24:
            if (v34 <= 0x3C) {
              int v47 = 60;
            }
            else {
              int v47 = v34;
            }
            ++*((_DWORD *)v77 + (v47 - 60));
            unsigned int v48 = 120 * v32;
            if (v48 >= 0xB) {
              unsigned int v48 = 11;
            }
            ++*((_DWORD *)v69 + v48);
            char v33 = 1;
            unsigned int v34 = v24;
            unsigned __int8 v32 = 1;
            goto LABEL_30;
          }
          int v42 = [v31 isEqualToString:v36];
          unsigned int v43 = v62;
          unsigned int v44 = HIDWORD(v62);
          if (v42)
          {
            unsigned int v44 = (v24 + HIDWORD(v62) * v62) / (v62 + 1);
            unsigned int v43 = v62 + 1;
          }
          else
          {
            char v33 = 1;
          }
          unint64_t v62 = __PAIR64__(v44, v43);
          unsigned int v45 = v24 + v61 * v32;
          unsigned int v46 = ++v32;
          unsigned int v34 = v45 / v46;
        }

        if ((v33 & 1) == 0) {
          goto LABEL_53;
        }
LABEL_30:
        if (v31)
        {
          if (HIDWORD(v62) <= 0x3C) {
            int v49 = 60;
          }
          else {
            int v49 = HIDWORD(v62);
          }
          if (120 * v32 >= 0xB) {
            unsigned int v50 = 11;
          }
          else {
            unsigned int v50 = 120 * v32;
          }
          if ([v31 isEqualToString:@"RACHFail"])
          {
            v51 = v76;
            v52 = v91;
            goto LABEL_51;
          }
          if ([v31 isEqualToString:@"OOS"])
          {
            v51 = v75;
            v52 = v89;
            goto LABEL_51;
          }
          if ([v31 isEqualToString:@"TcXONotShutting"])
          {
            v51 = v74;
            v52 = v87;
            goto LABEL_51;
          }
          if ([v31 isEqualToString:@"MarginalCoverage"])
          {
            v51 = v73;
            v52 = v85;
            goto LABEL_51;
          }
          if ([v31 isEqualToString:@"Background"])
          {
            v51 = v72;
            v52 = v83;
            goto LABEL_51;
          }
          if ([v31 isEqualToString:@"struckInDCH"])
          {
            v51 = v71;
            v52 = v81;
            goto LABEL_51;
          }
          if ([v31 isEqualToString:@"Unknown"])
          {
            v51 = v70;
            v52 = v79;
LABEL_51:
            char v33 = 0;
            ++*((_DWORD *)v52 + (v49 - 60));
            ++*((_DWORD *)v51 + v50);
          }
          else
          {
            char v33 = 0;
          }
          LODWORD(v62) = 1;
          HIDWORD(v62) = v24;
        }
LABEL_53:
        id v53 = v36;

        uint64_t v30 = v35;
        BOOL v54 = [v64 count] + 1 > (unint64_t)v35++;
        v31 = v53;
        if (!v54) {
          goto LABEL_57;
        }
      }
    }
    id v53 = 0;
LABEL_57:
    id v3 = v59;
    objc_msgSend(v60, "setTimestamp:", objc_msgSend(v59, "getAWDTimestamp"));
    [v60 setCauseCodeRACHFailARMUtilitys:v91 count:41];
    [v60 setCauseCodeRACHFailDurations:v76 count:12];
    [v60 setCauseCodeOOSARMUtilitys:v89 count:41];
    [v60 setCauseCodeOOSDurations:v75 count:12];
    [v60 setCauseCodeTcXONotShuttingARMUtilitys:v87 count:41];
    [v60 setCauseCodeTcXONotShuttingDurations:v74 count:12];
    [v60 setCauseCodeMarginalCoverageARMUtilitys:v85 count:41];
    [v60 setCauseCodeMarginalCoverageDurations:v73 count:12];
    [v60 setCauseCodeBackgroundActivityARMUtilitys:v83 count:41];
    [v60 setCauseCodeBackgroundActivityDurations:v72 count:12];
    [v60 setCauseCodeStruckInDCHARMUtilitys:v81 count:41];
    [v60 setCauseCodeStruckInDCHDurations:v71 count:12];
    [v60 setCauseCodeUnknownARMUtilitys:v79 count:41];
    [v60 setCauseCodeUnknownDurations:v70 count:12];
    uint64_t v5 = v58;
    [v58 setMetric:v60];
    [v59 submitMetric:v58];
  }
}

- (unsigned)exclusionMask
{
  return self->_exclusionMask;
}

- (void)setExclusionMask:(unsigned __int8)a3
{
  self->_exclusionMask = a3;
}

- (PLEntryNotificationOperatorComposition)audioEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAudioEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)hotspotEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHotspotEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)bbHwOtherCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBbHwOtherCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)msgLiteCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMsgLiteCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wcdmaRRCCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setWcdmaRRCCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)lteRRCCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLteRRCCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)telActivityCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTelActivityCallback:(id)a3
{
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
}

- (NSMutableArray)startExclusionPeriods
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setStartExclusionPeriods:(id)a3
{
}

- (NSMutableArray)endExclusionPeriods
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEndExclusionPeriods:(id)a3
{
}

- (double)elapsedDenumerator
{
  return self->_elapsedDenumerator;
}

- (void)setElapsedDenumerator:(double)a3
{
  self->_elapsedDenumerator = a3;
}

- (double)totalNormalARMUtility
{
  return self->_totalNormalARMUtility;
}

- (void)setTotalNormalARMUtility:(double)a3
{
  self->_totalNormalARMUtility = a3;
}

- (double)armUtilityThresholdVal
{
  return self->_armUtilityThresholdVal;
}

- (void)setArmUtilityThresholdVal:(double)a3
{
  self->_armUtilityThresholdVal = a3;
}

- (double)magicDeltaThresholdVal
{
  return self->_magicDeltaThresholdVal;
}

- (void)setMagicDeltaThresholdVal:(double)a3
{
  self->_magicDeltaThresholdVal = a3;
}

- (double)oosDurationVal
{
  return self->_oosDurationVal;
}

- (void)setOosDurationVal:(double)a3
{
  self->_oosDurationVal = a3;
}

- (double)rrcDisconnectedVal
{
  return self->_rrcDisconnectedVal;
}

- (void)setRrcDisconnectedVal:(double)a3
{
  self->_rrcDisconnectedVal = a3;
}

- (NSDate)startSamplingDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setStartSamplingDate:(id)a3
{
}

- (PLTelephonyConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (PLTelephonyConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (double)gArmUtil
{
  return self->_gArmUtil;
}

- (void)setGArmUtil:(double)a3
{
  self->_gArmUtil = a3;
}

- (int)gPerepherialMax
{
  return self->_gPerepherialMax;
}

- (void)setGPerepherialMax:(int)a3
{
  self->_gPerepherialMax = a3;
}

- (NSDate)notToRemoveDate
{
  return (NSDate *)objc_getProperty(self, a2, 224, 1);
}

- (void)setNotToRemoveDate:(id)a3
{
}

- (BOOL)sendAWD
{
  return self->_sendAWD;
}

- (void)setSendAWD:(BOOL)a3
{
  self->_sendAWD = a3;
}

- (BOOL)doesCurrPackageHasProblem
{
  return self->_doesCurrPackageHasProblem;
}

- (void)setDoesCurrPackageHasProblem:(BOOL)a3
{
  self->_doesCurrPackageHasProblem = a3;
}

- (BOOL)doesPrevPackageHasProblem
{
  return self->_doesPrevPackageHasProblem;
}

- (void)setDoesPrevPackageHasProblem:(BOOL)a3
{
  self->_doesPrevPackageHasProblem = a3;
}

- (BOOL)isUIAlertEnabled
{
  return self->_isUIAlertEnabled;
}

- (void)setIsUIAlertEnabled:(BOOL)a3
{
  self->_isUIAlertEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notToRemoveDate, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_startSamplingDate, 0);
  objc_storeStrong((id *)&self->_endExclusionPeriods, 0);
  objc_storeStrong((id *)&self->_startExclusionPeriods, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_telActivityCallback, 0);
  objc_storeStrong((id *)&self->_lteRRCCallback, 0);
  objc_storeStrong((id *)&self->_wcdmaRRCCallback, 0);
  objc_storeStrong((id *)&self->_msgLiteCallback, 0);
  objc_storeStrong((id *)&self->_bbHwOtherCallback, 0);
  objc_storeStrong((id *)&self->_hotspotEventCallback, 0);
  objc_storeStrong((id *)&self->_displayEventCallback, 0);

  objc_storeStrong((id *)&self->_audioEventCallback, 0);
}

@end