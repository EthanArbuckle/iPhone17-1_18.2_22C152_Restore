@interface PLAccountingEngine
+ (BOOL)accountingDebugEnabled;
+ (double)maxPowerEventChunkInterval;
+ (double)minDistributionEnergy;
+ (double)minEnergy;
+ (id)allBBRootNodeIDs;
+ (id)allDistributionIDs;
+ (id)allQualificationIDs;
+ (id)allSoCRootNodeIDs;
+ (id)debugInstance;
+ (id)deviceBBRootNodeIDs;
+ (id)deviceRootNodeIDs;
+ (id)deviceSoCRootNodeIDs;
+ (id)distributionIDForDistributionName:(id)a3;
+ (id)gasGaugeEntryKey;
+ (id)normalizeWeights:(id)a3;
+ (id)qualificationIDForQualificationName:(id)a3;
+ (id)sharedInstance;
+ (id)workQueue;
+ (void)clearWithEntryKey:(id)a3;
- (BOOL)pluggedIn;
- (OS_dispatch_queue)workQueue;
- (PLAccountingCorrectionManager)correctionManager;
- (PLAccountingDistributionManager)distributionManager;
- (PLAccountingEngine)init;
- (PLAccountingQualificationManager)qualificationManager;
- (PLActivity)chunkActivity;
- (PLEntryNotificationOperatorComposition)batteryListener;
- (id)currentDistributionEventForwardWithDistributionID:(int)a3;
- (id)getLastQualifiedEnergyEventDate;
- (void)addDistributionEventInterval:(id)a3;
- (void)addDistributionEventIntervalWithLastDistributionEventBackward:(id)a3 withDistributionEventBackward:(id)a4;
- (void)addDistributionEventIntervalWithLastDistributionEventForward:(id)a3 withDistributionEventForward:(id)a4;
- (void)addDistributionEventPoint:(id)a3;
- (void)addEnergyMeasurementWithRootNodeID:(int)a3 withEnergy:(double)a4 withRange:(id)a5;
- (void)addPowerMeasurementEventIntervalWithPower:(double)a3 withStartDate:(id)a4 withEndDate:(id)a5;
- (void)addQualificationEventInterval:(id)a3;
- (void)addQualificationEventIntervalWithLastQualificationEventBackward:(id)a3 withQualificationEventBackward:(id)a4;
- (void)addQualificationEventIntervalWithLastQualificationEventForward:(id)a3 withQualificationEventForward:(id)a4;
- (void)addQualificationEventPoint:(id)a3;
- (void)chunkWithLastChunkDate:(id)a3 withNow:(id)a4;
- (void)createAggregateRootNodeEnergyEntryWithEnergyEstimate:(id)a3;
- (void)createDistributionEventBackwardWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withEndDate:(id)a5;
- (void)createDistributionEventForwardWithDistributionID:(int)a3 withAddingChildNodeName:(id)a4 withStartDate:(id)a5;
- (void)createDistributionEventForwardWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5;
- (void)createDistributionEventForwardWithDistributionID:(int)a3 withRemovingChildNodeName:(id)a4 withStartDate:(id)a5;
- (void)createDistributionEventIntervalWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6;
- (void)createDistributionEventPointWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5;
- (void)createEventWithEvent:(id)a3 withActionBlock:(id)a4;
- (void)createPowerEventBackwardWithRootNodeID:(int)a3 withPower:(double)a4 withEndDate:(id)a5;
- (void)createPowerEventForwardWithRootNodeID:(int)a3 withPower:(double)a4 withStartDate:(id)a5;
- (void)createPowerEventIntervalWithRootNodeID:(int)a3 withPower:(double)a4 withStartDate:(id)a5 withEndDate:(id)a6;
- (void)createQualificationEventBackwardWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withEndDate:(id)a5;
- (void)createQualificationEventForwardWithQualificationID:(int)a3 withAddingChildNodeName:(id)a4 withStartDate:(id)a5;
- (void)createQualificationEventForwardWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5;
- (void)createQualificationEventForwardWithQualificationID:(int)a3 withRemovingChildNodeName:(id)a4 withStartDate:(id)a5;
- (void)createQualificationEventIntervalWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6;
- (void)createQualificationEventPointWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5;
- (void)didCorrectEnergyEstimate:(id)a3;
- (void)didCreateChildEnergyEstimate:(id)a3 withParentEnergyEstimate:(id)a4;
- (void)didDistributeEnergyEstimate:(id)a3;
- (void)didQualifyEnergyEvent:(id)a3 withRootNodeID:(id)a4 withQualificationID:(id)a5;
- (void)reload;
- (void)reloadLastDistributionEventsWithLastDeviceBootDate:(id)a3;
- (void)reloadLastPowerEventsWithLastDeviceBootDate:(id)a3;
- (void)reloadLastQualificationEventsWithLastDeviceBootDate:(id)a3;
- (void)reset;
- (void)setBatteryListener:(id)a3;
- (void)setChunkActivity:(id)a3;
- (void)setCorrectionManager:(id)a3;
- (void)setDistributionManager:(id)a3;
- (void)setPluggedIn:(BOOL)a3;
- (void)setQualificationManager:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation PLAccountingEngine

+ (id)deviceRootNodeIDs
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__PLAccountingEngine_deviceRootNodeIDs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceRootNodeIDs_onceToken != -1) {
    dispatch_once(&deviceRootNodeIDs_onceToken, block);
  }
  v2 = (void *)deviceRootNodeIDs_deviceRootNodeIDs;
  return v2;
}

+ (id)allQualificationIDs
{
  if (allQualificationIDs_onceToken != -1) {
    dispatch_once(&allQualificationIDs_onceToken, &__block_literal_global_331);
  }
  v2 = (void *)allQualificationIDs_allQualificationIDs;
  return v2;
}

+ (id)allDistributionIDs
{
  if (allDistributionIDs_onceToken != -1) {
    dispatch_once(&allDistributionIDs_onceToken, &__block_literal_global_160);
  }
  v2 = (void *)allDistributionIDs_allDistributionIDs;
  return v2;
}

+ (id)sharedInstance
{
  v3 = [MEMORY[0x263F5F698] sharedCore];
  v4 = [v3 storage];
  if ([v4 storageLocked])
  {

LABEL_4:
    id v6 = 0;
    goto LABEL_8;
  }
  char v5 = [MEMORY[0x263F5F688] isPowerlogHelperd];

  if (v5) {
    goto LABEL_4;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__PLAccountingEngine_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  id v6 = (id)sharedInstance_sharedInstance;
LABEL_8:
  return v6;
}

- (void)createEventWithEvent:(id)a3 withActionBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, id, void *))a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (createEventWithEvent_withActionBlock__defaultOnce != -1) {
      dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce, block);
    }
    if (createEventWithEvent_withActionBlock__classDebugEnabled)
    {
      v8 = [NSString stringWithFormat:@"event=%@", v5];
      v9 = (void *)MEMORY[0x263F5F638];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLAccountingEngine createEventWithEvent:withActionBlock:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:863];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v5 && v6)
  {
    unint64_t v14 = 0x263F5F000uLL;
    v15 = [MEMORY[0x263F5F698] sharedCore];
    v16 = [v15 storage];
    v17 = [(id)objc_opt_class() entryKey];
    v18 = [v5 subEntryKey];
    v19 = [v16 lastEntryForKey:v17 withSubEntryKey:v18];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v20 = objc_opt_class();
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_458;
      v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v65[4] = v20;
      if (createEventWithEvent_withActionBlock__defaultOnce_456 != -1) {
        dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_456, v65);
      }
      if (createEventWithEvent_withActionBlock__classDebugEnabled_457)
      {
        v21 = [NSString stringWithFormat:@"lastEvent=%@", v19];
        v22 = (void *)MEMORY[0x263F5F638];
        v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        v24 = [v23 lastPathComponent];
        v25 = [NSString stringWithUTF8String:"-[PLAccountingEngine createEventWithEvent:withActionBlock:]"];
        [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:869];

        v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }

        unint64_t v14 = 0x263F5F000;
      }
    }
    v27 = [v5 rangeSinceEvent:v19];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v28 = objc_opt_class();
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_464;
      v64[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v64[4] = v28;
      if (createEventWithEvent_withActionBlock__defaultOnce_462 != -1) {
        dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_462, v64);
      }
      if (createEventWithEvent_withActionBlock__classDebugEnabled_463)
      {
        v29 = [NSString stringWithFormat:@"sinceRange=%@", v27];
        v30 = (void *)MEMORY[0x263F5F638];
        v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        v32 = [v31 lastPathComponent];
        v33 = [NSString stringWithUTF8String:"-[PLAccountingEngine createEventWithEvent:withActionBlock:]"];
        [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:873];

        v34 = PLLogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }

        unint64_t v14 = 0x263F5F000uLL;
      }
    }
    if (v19)
    {
      if (!v27 || ([v27 length], v35 == 0.0))
      {
        [v19 mergeWithEvent:v5];
        if (![MEMORY[0x263F5F640] debugEnabled]) {
          goto LABEL_51;
        }
        uint64_t v36 = objc_opt_class();
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_470;
        v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v63[4] = v36;
        if (createEventWithEvent_withActionBlock__defaultOnce_468 != -1) {
          dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_468, v63);
        }
        if (!createEventWithEvent_withActionBlock__classDebugEnabled_469) {
          goto LABEL_51;
        }
        v37 = [NSString stringWithFormat:@"combined for too short sinceRange, now lastEvent=%@", v19];
        v38 = (void *)MEMORY[0x263F5F638];
        v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        v40 = [v39 lastPathComponent];
        v41 = [NSString stringWithUTF8String:"-[PLAccountingEngine createEventWithEvent:withActionBlock:]"];
        [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:878];

        v42 = PLLogCommon();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
LABEL_33:

LABEL_51:
        goto LABEL_52;
      }
      if (([v19 used] & 1) == 0
        && [v19 canMergeWithEvent:v5]
        && [v19 isEqualContentsWithEvent:v5])
      {
        [v19 mergeWithEvent:v5];
        if (![MEMORY[0x263F5F640] debugEnabled]) {
          goto LABEL_51;
        }
        uint64_t v43 = objc_opt_class();
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_476;
        v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v62[4] = v43;
        if (createEventWithEvent_withActionBlock__defaultOnce_474 != -1) {
          dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_474, v62);
        }
        if (!createEventWithEvent_withActionBlock__classDebugEnabled_475) {
          goto LABEL_51;
        }
        v37 = [NSString stringWithFormat:@"combined for equal contents, now lastEvent=%@", v19];
        v44 = (void *)MEMORY[0x263F5F638];
        v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        v46 = [v45 lastPathComponent];
        v47 = [NSString stringWithUTF8String:"-[PLAccountingEngine createEventWithEvent:withActionBlock:]"];
        [v44 logMessage:v37 fromFile:v46 fromFunction:v47 fromLineNumber:883];

        v42 = PLLogCommon();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
        goto LABEL_33;
      }
    }
    v48 = [*(id *)(v14 + 1688) sharedCore];
    v49 = [v48 storage];
    [v49 blockingWriteEntry:v5 withCompletionBlock:&__block_literal_global_482];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v50 = objc_opt_class();
      uint64_t v57 = MEMORY[0x263EF8330];
      uint64_t v58 = 3221225472;
      v59 = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_2;
      v60 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v61 = v50;
      if (createEventWithEvent_withActionBlock__defaultOnce_483 != -1) {
        dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_483, &v57);
      }
      if (createEventWithEvent_withActionBlock__classDebugEnabled_484)
      {
        v51 = [NSString stringWithFormat:@"logged new event=%@", v5, v57, v58, v59, v60, v61];
        v52 = (void *)MEMORY[0x263F5F638];
        v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        v54 = [v53 lastPathComponent];
        v55 = [NSString stringWithUTF8String:"-[PLAccountingEngine createEventWithEvent:withActionBlock:]"];
        [v52 logMessage:v51 fromFile:v54 fromFunction:v55 fromLineNumber:889];

        v56 = PLLogCommon();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    v6[2](v6, v19, v5, v27);
    goto LABEL_51;
  }
LABEL_52:
}

void __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_420(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v6 isEqualContentsWithEvent:v5] & 1) == 0) {
    [*(id *)(a1 + 32) addDistributionEventIntervalWithLastDistributionEventForward:v6 withDistributionEventForward:v5];
  }
}

uint64_t __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke_424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addDistributionEventIntervalWithLastDistributionEventBackward:a2 withDistributionEventBackward:a3];
}

- (void)addDistributionEventIntervalWithLastDistributionEventBackward:(id)a3 withDistributionEventBackward:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __114__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__defaultOnce != -1) {
      dispatch_once(&addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__defaultOnce, block);
    }
    if (addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"lastDistributionEventBackward=%@, distributionEventBackward=%@", v6, v7];
      v10 = (void *)MEMORY[0x263F5F638];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLAccountingEngine addDistributionEventIntervalWithLastDistributionEventBackward:withDistributionEventBackward:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:932];

      unint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v6)
  {
    if (v7)
    {
      v15 = [v6 distributionID];
      v16 = [v7 distributionID];
      int v17 = [v15 isEqual:v16];

      if (v17)
      {
        v18 = [PLAccountingDistributionEventIntervalEntry alloc];
        v19 = [v7 distributionID];
        uint64_t v20 = [v7 childNodeIDToWeight];
        v21 = [v6 range];
        v22 = [v21 endDate];
        v23 = [v7 range];
        v24 = [v23 endDate];
        v25 = [(PLAccountingDistributionEventIntervalEntry *)v18 initWithDistributionID:v19 withChildNodeIDToWeight:v20 withStartDate:v22 withEndDate:v24];

        [(PLEntry *)v25 setWriteToDB:0];
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v26 = objc_opt_class();
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __114__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward___block_invoke_507;
          v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v34[4] = v26;
          if (addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__defaultOnce_505 != -1) {
            dispatch_once(&addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__defaultOnce_505, v34);
          }
          if (addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__classDebugEnabled_506)
          {
            v27 = [NSString stringWithFormat:@"distributionEventInterval=%@", v25];
            uint64_t v28 = (void *)MEMORY[0x263F5F638];
            v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
            v30 = [v29 lastPathComponent];
            v31 = [NSString stringWithUTF8String:"-[PLAccountingEngine addDistributionEventIntervalWithLastDistributionEventBackward:withDistributionEventBackward:]"];
            [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:941];

            v32 = PLLogCommon();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        v33 = [(PLAccountingEngine *)self distributionManager];
        [v33 addDistributionEvent:v25];
      }
    }
  }
}

- (void)createDistributionEventForwardWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(PLAccountingEngine *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke;
  v13[3] = &unk_2647B51B8;
  int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)createPowerEventIntervalWithRootNodeID:(int)a3 withPower:(double)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [(PLAccountingEngine *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke;
  block[3] = &unk_2647B5140;
  int v19 = a3;
  double v18 = a4;
  block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (void)didCreateChildEnergyEstimate:(id)a3 withParentEnergyEstimate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce != -1) {
      dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce, block);
    }
    if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled)
    {
      id v9 = [NSString stringWithFormat:@"childEnergyEstimate=%@, parentEnergyEstimate=%@", v6, v7];
      id v10 = (void *)MEMORY[0x263F5F638];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:962];

      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v6)
  {
    [v6 energy];
    double v16 = v15;
    +[PLAccountingEngine minEnergy];
    if (v7
      && v16 <= v17
      && ([v6 distributionRuleID],
          double v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 intValue],
          v18,
          v19 < 1))
    {
      [v6 setWriteToDB:0];
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v47 = objc_opt_class();
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_527;
        v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v56[4] = v47;
        if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_525 != -1) {
          dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_525, v56);
        }
        if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_526)
        {
          v48 = [NSString stringWithFormat:@"not logging"];
          v49 = (void *)MEMORY[0x263F5F638];
          uint64_t v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
          v51 = [v50 lastPathComponent];
          v52 = [NSString stringWithUTF8String:"-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]"];
          [v49 logMessage:v48 fromFile:v51 fromFunction:v52 fromLineNumber:977];

          v53 = PLLogCommon();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
    }
    else
    {
      uint64_t v20 = [MEMORY[0x263F5F698] sharedCore];
      v21 = [v20 storage];
      [v21 blockingWriteEntry:v6 withCompletionBlock:&__block_literal_global_519];

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v22 = objc_opt_class();
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_2;
        v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v57[4] = v22;
        if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_520 != -1) {
          dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_520, v57);
        }
        if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_521)
        {
          v23 = [NSString stringWithFormat:@"logged childEnergyEstimate=%@", v6];
          v24 = (void *)MEMORY[0x263F5F638];
          v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
          uint64_t v26 = [v25 lastPathComponent];
          v27 = [NSString stringWithUTF8String:"-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]"];
          [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:970];

          uint64_t v28 = PLLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
      if (!v7)
      {
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v38 = objc_opt_class();
          v55[0] = MEMORY[0x263EF8330];
          v55[1] = 3221225472;
          v55[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_533;
          v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v55[4] = v38;
          if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_531 != -1) {
            dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_531, v55);
          }
          if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_532)
          {
            v39 = [NSString stringWithFormat:@"root node energy estimate"];
            v40 = (void *)MEMORY[0x263F5F638];
            v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
            v42 = [v41 lastPathComponent];
            uint64_t v43 = [NSString stringWithUTF8String:"-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]"];
            [v40 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:982];

            v44 = PLLogCommon();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        uint64_t v36 = [(PLAccountingEngine *)self correctionManager];
        v37 = [v6 entryDate];
        [v36 addRootEnergyEstimate:v6 withNow:v37];
        goto LABEL_36;
      }
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v29 = objc_opt_class();
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_539;
      v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v54[4] = v29;
      if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_537 != -1) {
        dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_537, v54);
      }
      if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_538)
      {
        v30 = [NSString stringWithFormat:@"not a root node energy estimate"];
        v31 = (void *)MEMORY[0x263F5F638];
        v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        v33 = [v32 lastPathComponent];
        v34 = [NSString stringWithUTF8String:"-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]"];
        [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:988];

        double v35 = PLLogCommon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    uint64_t v36 = [(PLAccountingEngine *)self correctionManager];
    v37 = [v6 entryDate];
    [v36 correctChildEnergyEstimate:v6 withParentEnergyEstimate:v7 withNow:v37];
LABEL_36:

    v45 = [(PLAccountingEngine *)self distributionManager];
    v46 = [v6 entryDate];
    [v45 addEnergyEstimate:v6 withNow:v46];
  }
}

+ (double)minEnergy
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__PLAccountingEngine_minEnergy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (minEnergy_onceToken != -1) {
    dispatch_once(&minEnergy_onceToken, block);
  }
  return *(double *)&minEnergy_minEnergy;
}

- (PLAccountingDistributionManager)distributionManager
{
  distributionManager = self->_distributionManager;
  if (!distributionManager)
  {
    v4 = objc_alloc_init(PLAccountingDistributionManager);
    id v5 = self->_distributionManager;
    self->_distributionManager = v4;

    [(PLAccountingDistributionManager *)self->_distributionManager setDelegate:self];
    distributionManager = self->_distributionManager;
  }
  return distributionManager;
}

- (PLAccountingCorrectionManager)correctionManager
{
  correctionManager = self->_correctionManager;
  if (!correctionManager)
  {
    v4 = objc_alloc_init(PLAccountingCorrectionManager);
    id v5 = self->_correctionManager;
    self->_correctionManager = v4;

    [(PLAccountingCorrectionManager *)self->_correctionManager setDelegate:self];
    correctionManager = self->_correctionManager;
  }
  return correctionManager;
}

+ (double)minDistributionEnergy
{
  if (minDistributionEnergy_onceToken != -1) {
    dispatch_once(&minDistributionEnergy_onceToken, &__block_literal_global_1);
  }
  return *(double *)&minDistributionEnergy_minDistributionEnergy;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

void __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke_443(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v6 isEqualContentsWithEvent:v5] & 1) == 0) {
    [*(id *)(a1 + 32) addQualificationEventIntervalWithLastQualificationEventForward:v6 withQualificationEventForward:v5];
  }
}

- (void)addQualificationEventIntervalWithLastQualificationEventForward:(id)a3 withQualificationEventForward:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __115__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__defaultOnce != -1) {
      dispatch_once(&addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__defaultOnce, block);
    }
    if (addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__classDebugEnabled)
    {
      id v9 = [NSString stringWithFormat:@"lastQualificationEventForward=%@, qualificationEventForward=%@", v6, v7];
      id v10 = (void *)MEMORY[0x263F5F638];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLAccountingEngine addQualificationEventIntervalWithLastQualificationEventForward:withQualificationEventForward:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:1029];

      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v7)
  {
    if (v6)
    {
      double v15 = [v6 qualificationID];
      double v16 = [v7 qualificationID];
      int v17 = [v15 isEqual:v16];

      if (!v17) {
        goto LABEL_20;
      }
      double v18 = [(PLAccountingEngine *)self qualificationManager];
      int v19 = [v7 qualificationID];
      uint64_t v20 = [v7 range];
      v21 = [v20 startDate];
      [v18 closeLastQualificationEventForwardWithQualificationID:v19 withEndDate:v21];
    }
    uint64_t v22 = [PLAccountingQualificationEventIntervalEntry alloc];
    v23 = [v7 qualificationID];
    v24 = [v7 childNodeIDs];
    v25 = [v7 range];
    uint64_t v26 = [v25 startDate];
    v27 = [MEMORY[0x263EFF910] distantFuture];
    uint64_t v28 = [(PLAccountingQualificationEventIntervalEntry *)v22 initWithQualificationID:v23 withChildNodeIDs:v24 withStartDate:v26 withEndDate:v27];

    [(PLEntry *)v28 setWriteToDB:0];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v29 = objc_opt_class();
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __115__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward___block_invoke_551;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v29;
      if (addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__defaultOnce_549 != -1) {
        dispatch_once(&addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__defaultOnce_549, v37);
      }
      if (addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__classDebugEnabled_550)
      {
        v30 = [NSString stringWithFormat:@"qualificationEventIntervalOpen=%@", v28];
        v31 = (void *)MEMORY[0x263F5F638];
        v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        v33 = [v32 lastPathComponent];
        v34 = [NSString stringWithUTF8String:"-[PLAccountingEngine addQualificationEventIntervalWithLastQualificationEventForward:withQualificationEventForward:]"];
        [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:1045];

        double v35 = PLLogCommon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    uint64_t v36 = [(PLAccountingEngine *)self qualificationManager];
    [v36 addQualificationEvent:v28];
  }
LABEL_20:
}

- (PLAccountingQualificationManager)qualificationManager
{
  qualificationManager = self->_qualificationManager;
  if (!qualificationManager)
  {
    v4 = objc_alloc_init(PLAccountingQualificationManager);
    id v5 = self->_qualificationManager;
    self->_qualificationManager = v4;

    [(PLAccountingQualificationManager *)self->_qualificationManager setDelegate:self];
    qualificationManager = self->_qualificationManager;
  }
  return qualificationManager;
}

- (void)addDistributionEventIntervalWithLastDistributionEventForward:(id)a3 withDistributionEventForward:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __112__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__defaultOnce != -1) {
      dispatch_once(&addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__defaultOnce, block);
    }
    if (addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__classDebugEnabled)
    {
      id v9 = [NSString stringWithFormat:@"lastDistributionEventForward=%@, distributionEventForward=%@", v6, v7];
      id v10 = (void *)MEMORY[0x263F5F638];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLAccountingEngine addDistributionEventIntervalWithLastDistributionEventForward:withDistributionEventForward:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:908];

      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v7)
  {
    if (v6)
    {
      double v15 = [v6 distributionID];
      double v16 = [v7 distributionID];
      int v17 = [v15 isEqual:v16];

      if (!v17) {
        goto LABEL_20;
      }
      double v18 = [(PLAccountingEngine *)self distributionManager];
      int v19 = [v7 distributionID];
      uint64_t v20 = [v7 range];
      v21 = [v20 startDate];
      [v18 closeLastDistributionEventForwardWithDistributionID:v19 withEndDate:v21];
    }
    uint64_t v22 = [PLAccountingDistributionEventIntervalEntry alloc];
    v23 = [v7 distributionID];
    v24 = [v7 childNodeIDToWeight];
    v25 = [v7 range];
    uint64_t v26 = [v25 startDate];
    v27 = [MEMORY[0x263EFF910] distantFuture];
    uint64_t v28 = [(PLAccountingDistributionEventIntervalEntry *)v22 initWithDistributionID:v23 withChildNodeIDToWeight:v24 withStartDate:v26 withEndDate:v27];

    [(PLEntry *)v28 setWriteToDB:0];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v29 = objc_opt_class();
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __112__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward___block_invoke_498;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v29;
      if (addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__defaultOnce_496 != -1) {
        dispatch_once(&addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__defaultOnce_496, v37);
      }
      if (addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__classDebugEnabled_497)
      {
        v30 = [NSString stringWithFormat:@"distributionEventIntervalOpen=%@", v28];
        v31 = (void *)MEMORY[0x263F5F638];
        v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        v33 = [v32 lastPathComponent];
        v34 = [NSString stringWithUTF8String:"-[PLAccountingEngine addDistributionEventIntervalWithLastDistributionEventForward:withDistributionEventForward:]"];
        [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:924];

        double v35 = PLLogCommon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    uint64_t v36 = [(PLAccountingEngine *)self distributionManager];
    [v36 addDistributionEvent:v28];
  }
LABEL_20:
}

- (void)createQualificationEventForwardWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PLAccountingEngine *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke;
  v13[3] = &unk_2647B51B8;
  int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_381(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
    id v9 = [MEMORY[0x263F5F628] sharedInstance];
    id v10 = [v9 lastCompletedDateWithIdentifier:@"com.apple.powerlogd.accounting.chunking"];

    if (v10)
    {
      id v11 = [v8 range];
      id v12 = [v11 startDate];
      id v13 = [v12 laterDate:v10];
      id v14 = [v7 endDate];
      uint64_t v15 = +[PLAccountingRange rangeWithStartDate:v13 withEndDate:v14];

      id v7 = (id)v15;
    }
    [v7 length];
    double v17 = v16;
    [v8 power];
    double v19 = v17 * v18 / 3600.0;
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v20 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_2_382;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v20;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce, block);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled)
      {
        v21 = objc_msgSend(NSString, "stringWithFormat:", @"energy=%f", *(void *)&v19);
        uint64_t v22 = (void *)MEMORY[0x263F5F638];
        v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        v24 = [v23 lastPathComponent];
        v25 = [NSString stringWithUTF8String:"-[PLAccountingEngine createPowerEventForwardWithRootNodeID:withPower:withStartDate:]_block_invoke"];
        [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:433];

        uint64_t v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    +[PLAccountingEngine minDistributionEnergy];
    if (v19 >= v27)
    {
      uint64_t v28 = [PLAccountingEnergyEstimateEventEntry alloc];
      uint64_t v29 = [v8 rootNodeID];
      v30 = [v8 rootNodeID];
      v31 = [(PLAccountingEnergyEstimateEventEntry *)v28 initWithNodeID:v29 withRootNodeID:v30 withParentEntryID:0 withNumAncestors:0 withEnergy:v7 withRange:0 withEntryDate:v19];

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v32 = objc_opt_class();
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_389;
        v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v40[4] = v32;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_387 != -1) {
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_387, v40);
        }
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_388)
        {
          uint64_t v39 = a1;
          v33 = [NSString stringWithFormat:@"rootEnergyEstimate=%@", v31];
          v34 = (void *)MEMORY[0x263F5F638];
          double v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
          uint64_t v36 = [v35 lastPathComponent];
          v37 = [NSString stringWithUTF8String:"-[PLAccountingEngine createPowerEventForwardWithRootNodeID:withPower:withStartDate:]_block_invoke_2"];
          [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:448];

          uint64_t v38 = PLLogCommon();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }

          a1 = v39;
        }
      }
      [*(id *)(a1 + 32) didCreateChildEnergyEstimate:v31 withParentEnergyEstimate:0];
    }
  }
}

- (void)chunkWithLastChunkDate:(id)a3 withNow:(id)a4
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v76 = a4;
  unint64_t v7 = 0x263F5F000uLL;
  id v73 = v6;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke;
    v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v88[4] = v8;
    if (chunkWithLastChunkDate_withNow__defaultOnce != -1) {
      dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce, v88);
    }
    if (chunkWithLastChunkDate_withNow__classDebugEnabled)
    {
      id v9 = [NSString stringWithFormat:@"lastChunkDate=%@, now=%@", v6, v76];
      id v10 = (void *)MEMORY[0x263F5F638];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLAccountingEngine chunkWithLastChunkDate:withNow:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:1164];

      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      id v6 = v73;
      unint64_t v7 = 0x263F5F000uLL;
    }
  }
  if (v76)
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = [(id)objc_opt_class() deviceRootNodeIDs];
    uint64_t v78 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
    if (v78)
    {
      uint64_t v77 = *(void *)v85;
      v74 = self;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v85 != v77) {
            objc_enumerationMutation(obj);
          }
          double v16 = *(void **)(*((void *)&v84 + 1) + 8 * v15);
          if ([*(id *)(v7 + 1600) debugEnabled])
          {
            uint64_t v17 = objc_opt_class();
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_595;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v17;
            if (chunkWithLastChunkDate_withNow__defaultOnce_593 != -1) {
              dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_593, block);
            }
            if (chunkWithLastChunkDate_withNow__classDebugEnabled_594)
            {
              double v18 = [NSString stringWithFormat:@"rootNodeIDNumber=%@", v16];
              double v19 = (void *)MEMORY[0x263F5F638];
              uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
              v21 = [v20 lastPathComponent];
              uint64_t v22 = [NSString stringWithUTF8String:"-[PLAccountingEngine chunkWithLastChunkDate:withNow:]"];
              [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1168];

              v23 = PLLogCommon();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v90 = v18;
                _os_log_debug_impl(&dword_2267F1000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }
          v24 = objc_msgSend(&unk_26DA69F40, "objectAtIndexedSubscript:", (int)objc_msgSend(v16, "intValue"));
          int v25 = [v24 intValue];

          if (v25 == 1)
          {
            uint64_t v26 = [MEMORY[0x263F5F698] sharedCore];
            double v27 = [v26 storage];
            uint64_t v28 = +[PLAccountingPowerEventForwardEntry entryKey];
            uint64_t v29 = [v27 lastEntryForKey:v28 withSubEntryKey:v16];

            if ([*(id *)(v7 + 1600) debugEnabled])
            {
              uint64_t v30 = objc_opt_class();
              v82[0] = MEMORY[0x263EF8330];
              v82[1] = 3221225472;
              v82[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_608;
              v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v82[4] = v30;
              if (chunkWithLastChunkDate_withNow__defaultOnce_606 != -1) {
                dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_606, v82);
              }
              if (chunkWithLastChunkDate_withNow__classDebugEnabled_607)
              {
                v31 = [NSString stringWithFormat:@"lastPowerEvent=%@", v29];
                uint64_t v32 = (void *)MEMORY[0x263F5F638];
                v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
                v34 = [v33 lastPathComponent];
                double v35 = [NSString stringWithUTF8String:"-[PLAccountingEngine chunkWithLastChunkDate:withNow:]"];
                [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:1176];

                uint64_t v36 = PLLogCommon();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v90 = v31;
                  _os_log_debug_impl(&dword_2267F1000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            if (v29)
            {
              v37 = [v29 range];
              uint64_t v38 = [v37 startDate];
              uint64_t v39 = v38;
              if (v6)
              {
                uint64_t v40 = [v38 laterDate:v6];

                uint64_t v39 = (void *)v40;
              }

              v41 = +[PLAccountingRange rangeWithStartDate:v39 withEndDate:v76];
              if ([*(id *)(v7 + 1600) debugEnabled])
              {
                uint64_t v42 = objc_opt_class();
                v81[0] = MEMORY[0x263EF8330];
                v81[1] = 3221225472;
                v81[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_614;
                v81[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v81[4] = v42;
                if (chunkWithLastChunkDate_withNow__defaultOnce_612 != -1) {
                  dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_612, v81);
                }
                if (chunkWithLastChunkDate_withNow__classDebugEnabled_613)
                {
                  uint64_t v43 = [NSString stringWithFormat:@"range=%@", v41];
                  v44 = (void *)MEMORY[0x263F5F638];
                  v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
                  v46 = [v45 lastPathComponent];
                  uint64_t v47 = [NSString stringWithUTF8String:"-[PLAccountingEngine chunkWithLastChunkDate:withNow:]"];
                  [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:1185];

                  v48 = PLLogCommon();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v90 = v43;
                    _os_log_debug_impl(&dword_2267F1000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  unint64_t v7 = 0x263F5F000uLL;
                }
              }
              [v41 length];
              double v50 = v49;
              [v29 power];
              double v52 = v50 * v51 / 3600.0;
              if ([*(id *)(v7 + 1600) debugEnabled])
              {
                uint64_t v53 = objc_opt_class();
                v80[0] = MEMORY[0x263EF8330];
                v80[1] = 3221225472;
                v80[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_617;
                v80[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v80[4] = v53;
                if (chunkWithLastChunkDate_withNow__defaultOnce_615 != -1) {
                  dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_615, v80);
                }
                if (chunkWithLastChunkDate_withNow__classDebugEnabled_616)
                {
                  v54 = objc_msgSend(NSString, "stringWithFormat:", @"energy=%f", *(void *)&v52);
                  v55 = (void *)MEMORY[0x263F5F638];
                  v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
                  uint64_t v57 = [v56 lastPathComponent];
                  uint64_t v58 = [NSString stringWithUTF8String:"-[PLAccountingEngine chunkWithLastChunkDate:withNow:]"];
                  [v55 logMessage:v54 fromFile:v57 fromFunction:v58 fromLineNumber:1188];

                  v59 = PLLogCommon();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v90 = v54;
                    _os_log_debug_impl(&dword_2267F1000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }
                }
              }
              v60 = [PLAccountingEnergyEstimateEventEntry alloc];
              uint64_t v61 = [v29 rootNodeID];
              v62 = [v29 rootNodeID];
              v63 = [(PLAccountingEnergyEstimateEventEntry *)v60 initWithNodeID:v61 withRootNodeID:v62 withParentEntryID:0 withNumAncestors:0 withEnergy:v41 withRange:v76 withEntryDate:v52];

              [(PLAccountingEngine *)v74 didCreateChildEnergyEstimate:v63 withParentEnergyEstimate:0];
              unint64_t v7 = 0x263F5F000uLL;
              if ([MEMORY[0x263F5F640] debugEnabled])
              {
                uint64_t v64 = objc_opt_class();
                v79[0] = MEMORY[0x263EF8330];
                v79[1] = 3221225472;
                v79[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_620;
                v79[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v79[4] = v64;
                if (chunkWithLastChunkDate_withNow__defaultOnce_618 != -1) {
                  dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_618, v79);
                }
                if (chunkWithLastChunkDate_withNow__classDebugEnabled_619)
                {
                  v65 = NSString;
                  v66 = [v29 range];
                  v67 = [v65 stringWithFormat:@"after range adjustment: lastPowerEvent.range=%@", v66];

                  v68 = (void *)MEMORY[0x263F5F638];
                  v69 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
                  v70 = [v69 lastPathComponent];
                  v71 = [NSString stringWithUTF8String:"-[PLAccountingEngine chunkWithLastChunkDate:withNow:]"];
                  [v68 logMessage:v67 fromFile:v70 fromFunction:v71 fromLineNumber:1200];

                  v72 = PLLogCommon();
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v90 = v67;
                    _os_log_debug_impl(&dword_2267F1000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  id v6 = v73;
                  unint64_t v7 = 0x263F5F000;
                }
              }
            }
          }
          ++v15;
        }
        while (v78 != v15);
        uint64_t v78 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
      }
      while (v78);
    }
  }
}

void __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_405(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = v6;
  if (*(_DWORD *)(a1 + 40) == 54) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v6;
  }
  id v9 = v8;
  id v10 = [v9 range];
  [v10 length];
  double v12 = v11;
  [v9 power];
  double v14 = v12 * v13 / 3600.0;

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_2_406;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v15;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_7_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_7_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_7_classDebugEnabled)
    {
      double v16 = objc_msgSend(NSString, "stringWithFormat:", @"energy=%f", *(void *)&v14);
      uint64_t v17 = (void *)MEMORY[0x263F5F638];
      double v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      double v19 = [v18 lastPathComponent];
      uint64_t v20 = [NSString stringWithUTF8String:"-[PLAccountingEngine createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:]_block_invoke"];
      [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:522];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  +[PLAccountingEngine minDistributionEnergy];
  if (v14 >= v22)
  {
    v23 = [PLAccountingEnergyEstimateEventEntry alloc];
    v24 = [v9 rootNodeID];
    int v25 = [v9 rootNodeID];
    uint64_t v26 = [v9 range];
    double v27 = [(PLAccountingEnergyEstimateEventEntry *)v23 initWithNodeID:v24 withRootNodeID:v25 withParentEntryID:0 withNumAncestors:0 withEnergy:v26 withRange:0 withEntryDate:v14];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v28 = objc_opt_class();
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_409;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v28;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_7_defaultOnce_407 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_7_defaultOnce_407, v35);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_7_classDebugEnabled_408)
      {
        uint64_t v29 = [NSString stringWithFormat:@"rootEnergyEstimate=%@", v27];
        uint64_t v30 = (void *)MEMORY[0x263F5F638];
        v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        uint64_t v32 = [v31 lastPathComponent];
        v33 = [NSString stringWithUTF8String:"-[PLAccountingEngine createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:]_block_invoke_2"];
        [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:536];

        v34 = PLLogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    [*(id *)(a1 + 32) didCreateChildEnergyEstimate:v27 withParentEnergyEstimate:0];
  }
}

void __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled)
    {
      v3 = [NSString stringWithFormat:@"rootNodeID=%i, power=%f, endDate=%@", *(unsigned int *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 40)];
      v4 = (void *)MEMORY[0x263F5F638];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v6 = [v5 lastPathComponent];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createPowerEventBackwardWithRootNodeID:withPower:withEndDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:461];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:0 withEndDate:*(void *)(a1 + 40)];
  id v10 = [PLAccountingPowerEventBackwardEntry alloc];
  double v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  double v12 = [(PLAccountingPowerEventEntry *)v10 initWithRootNodeID:v11 withPower:v9 withRange:*(double *)(a1 + 48)];

  double v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_397;
  v14[3] = &unk_2647B50C8;
  v14[4] = v13;
  [v13 createEventWithEvent:v12 withActionBlock:v14];
}

void __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_10_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_10_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_10_classDebugEnabled)
    {
      v3 = [NSString stringWithFormat:@"distributionID=%i, childNodeNameToWeight=%@, endDate=%@", *(unsigned int *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48)];
      v4 = (void *)MEMORY[0x263F5F638];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v6 = [v5 lastPathComponent];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:641];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:0 withEndDate:*(void *)(a1 + 48)];
  id v10 = [PLAccountingDistributionEventBackwardEntry alloc];
  double v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  double v12 = [(PLAccountingDistributionEventEntry *)v10 initWithDistributionID:v11 withChildNodeNameToWeight:*(void *)(a1 + 40) withRange:v9];

  double v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke_424;
  v14[3] = &unk_2647B50C8;
  v14[4] = v13;
  [v13 createEventWithEvent:v12 withActionBlock:v14];
}

void __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled)
    {
      v3 = [NSString stringWithFormat:@"rootNodeID=%i, power=%f, startDate=%@", *(unsigned int *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 40)];
      v4 = (void *)MEMORY[0x263F5F638];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v6 = [v5 lastPathComponent];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createPowerEventForwardWithRootNodeID:withPower:withStartDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:412];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:*(void *)(a1 + 40) withEndDate:0];
  id v10 = [PLAccountingPowerEventForwardEntry alloc];
  double v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  double v12 = [(PLAccountingPowerEventEntry *)v10 initWithRootNodeID:v11 withPower:v9 withRange:*(double *)(a1 + 48)];

  double v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_381;
  v14[3] = &unk_2647B50C8;
  v14[4] = v13;
  [v13 createEventWithEvent:v12 withActionBlock:v14];
}

void __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_14_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_14_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_14_classDebugEnabled)
    {
      v3 = [NSString stringWithFormat:@"qualificationID=%i, childNodeNames=%@, startDate=%@", *(unsigned int *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48)];
      v4 = (void *)MEMORY[0x263F5F638];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v6 = [v5 lastPathComponent];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:769];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:*(void *)(a1 + 48) withEndDate:0];
  id v10 = [PLAccountingQualificationEventForwardEntry alloc];
  double v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  double v12 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
  double v13 = [(PLAccountingQualificationEventEntry *)v10 initWithQualificationID:v11 withChildNodeNames:v12 withRange:v9];

  double v14 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke_443;
  v15[3] = &unk_2647B50C8;
  v15[4] = v14;
  [v14 createEventWithEvent:v13 withActionBlock:v15];
}

void __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_9_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_9_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_9_classDebugEnabled)
    {
      v3 = [NSString stringWithFormat:@"distributionID=%i, childNodeNameToWeight=%@, startDate=%@", *(unsigned int *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48)];
      v4 = (void *)MEMORY[0x263F5F638];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v6 = [v5 lastPathComponent];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:615];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:*(void *)(a1 + 48) withEndDate:0];
  id v10 = [PLAccountingDistributionEventForwardEntry alloc];
  double v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  double v12 = [(PLAccountingDistributionEventEntry *)v10 initWithDistributionID:v11 withChildNodeNameToWeight:*(void *)(a1 + 40) withRange:v9];

  double v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_420;
  v14[3] = &unk_2647B50C8;
  v14[4] = v13;
  [v13 createEventWithEvent:v12 withActionBlock:v14];
}

void __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_6_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_6_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_6_classDebugEnabled)
    {
      v3 = [NSString stringWithFormat:@"rootNodeID=%i, power=%f, startDate=%@, endDate=%@", *(unsigned int *)(a1 + 64), *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48)];
      v4 = (void *)MEMORY[0x263F5F638];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v6 = [v5 lastPathComponent];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:503];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:*(void *)(a1 + 40) withEndDate:*(void *)(a1 + 48)];
  id v10 = [PLAccountingPowerEventIntervalEntry alloc];
  double v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  double v12 = [(PLAccountingPowerEventEntry *)v10 initWithRootNodeID:v11 withPower:v9 withRange:*(double *)(a1 + 56)];

  double v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_405;
  v14[3] = &unk_2647B5118;
  int v15 = *(_DWORD *)(a1 + 64);
  v14[4] = v13;
  [v13 createEventWithEvent:v12 withActionBlock:v14];
}

- (void)didDistributeEnergyEstimate:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    double v19 = __50__PLAccountingEngine_didDistributeEnergyEstimate___block_invoke;
    uint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v5;
    if (didDistributeEnergyEstimate__defaultOnce_0 != -1) {
      dispatch_once(&didDistributeEnergyEstimate__defaultOnce_0, &block);
    }
    if (didDistributeEnergyEstimate__classDebugEnabled_0)
    {
      id v6 = [NSString stringWithFormat:@"energyEstimate=%@", v4, block, v18, v19, v20, v21];
      unint64_t v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLAccountingEngine didDistributeEnergyEstimate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1001];

      double v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v4)
  {
    uint64_t v12 = [v4 correctionDate];
    if (v12)
    {
      double v13 = (void *)v12;
      char v14 = [v4 isRootNodeEnergyAggregated];

      if ((v14 & 1) == 0)
      {
        [(PLAccountingEngine *)self createAggregateRootNodeEnergyEntryWithEnergyEstimate:v4];
        int v15 = [(PLAccountingEngine *)self qualificationManager];
        double v16 = [v4 distributionDate];
        [v15 addEnergyEstimate:v4 withNow:v16];
      }
    }
  }
}

- (void)didCorrectEnergyEstimate:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    double v19 = __47__PLAccountingEngine_didCorrectEnergyEstimate___block_invoke;
    uint64_t v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v5;
    if (didCorrectEnergyEstimate__defaultOnce != -1) {
      dispatch_once(&didCorrectEnergyEstimate__defaultOnce, &block);
    }
    if (didCorrectEnergyEstimate__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"energyEstimate=%@", v4, block, v18, v19, v20, v21];
      unint64_t v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLAccountingEngine didCorrectEnergyEstimate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1015];

      double v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v4)
  {
    uint64_t v12 = [v4 distributionDate];
    if (v12)
    {
      double v13 = (void *)v12;
      char v14 = [v4 isRootNodeEnergyAggregated];

      if ((v14 & 1) == 0)
      {
        [(PLAccountingEngine *)self createAggregateRootNodeEnergyEntryWithEnergyEstimate:v4];
        int v15 = [(PLAccountingEngine *)self qualificationManager];
        double v16 = [v4 correctionDate];
        [v15 addEnergyEstimate:v4 withNow:v16];
      }
    }
  }
}

- (void)didQualifyEnergyEvent:(id)a3 withRootNodeID:(id)a4 withQualificationID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__PLAccountingEngine_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce_0 != -1) {
      dispatch_once(&didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce_0, block);
    }
    if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled_0)
    {
      double v11 = [NSString stringWithFormat:@"qualificationEnergyEvent=%@, rootNodeID=%@, qualificationID=%@", v7, v8, v9];
      uint64_t v12 = (void *)MEMORY[0x263F5F638];
      double v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      char v14 = [v13 lastPathComponent];
      int v15 = [NSString stringWithUTF8String:"-[PLAccountingEngine didQualifyEnergyEvent:withRootNodeID:withQualificationID:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1084];

      double v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v7)
  {
    if ((int)[v8 intValue] >= 1 && (int)objc_msgSend(v9, "intValue") >= 1)
    {
      [v7 energy];
      double v18 = v17;
      +[PLAccountingEngine minEnergy];
      if (v18 >= v19)
      {
        uint64_t v20 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F888] andName:*MEMORY[0x263F5F6A0]];
        id v21 = objc_alloc(MEMORY[0x263F5F648]);
        double v22 = [v7 range];
        v23 = [v22 startDate];
        uint64_t v40 = (void *)v20;
        v24 = (void *)[v21 initWithEntryKey:v20 withDate:v23];

        int v25 = [v7 nodeID];
        [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x263F5F6B0]];

        [v24 setObject:v8 forKeyedSubscript:*MEMORY[0x263F5F6C0]];
        [v24 setObject:v9 forKeyedSubscript:*MEMORY[0x263F5F6B8]];
        uint64_t v26 = [NSNumber numberWithLong:llround(v18 * 1000.0)];
        [v24 setObject:v26 forKeyedSubscript:*MEMORY[0x263F5F6A8]];

        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v27 = objc_opt_class();
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __79__PLAccountingEngine_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke_573;
          v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v41[4] = v27;
          if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce_571 != -1) {
            dispatch_once(&didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce_571, v41);
          }
          if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled_572)
          {
            uint64_t v28 = [NSString stringWithFormat:@"aggregateQualificationEnergyEntry=%@", v24];
            uint64_t v29 = (void *)MEMORY[0x263F5F638];
            uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
            v31 = [v30 lastPathComponent];
            uint64_t v32 = [NSString stringWithUTF8String:"-[PLAccountingEngine didQualifyEnergyEvent:withRootNodeID:withQualificationID:]"];
            [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:1100];

            v33 = PLLogCommon();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        v34 = [MEMORY[0x263F5F698] sharedCore];
        double v35 = [v34 storage];
        uint64_t v36 = [v7 range];
        v37 = [v36 startDate];
        uint64_t v38 = [v7 range];
        uint64_t v39 = [v38 endDate];
        [v35 writeProportionateAggregateEntry:v24 withStartDate:v37 withEndDate:v39];
      }
    }
  }
}

- (void)createAggregateRootNodeEnergyEntryWithEnergyEstimate:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce != -1) {
      dispatch_once(&createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce, block);
    }
    if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"energyEstimate=%@", v4];
      id v7 = (void *)MEMORY[0x263F5F638];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLAccountingEngine createAggregateRootNodeEnergyEntryWithEnergyEstimate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1384];

      double v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  [v4 terminationRatio];
  double v13 = v12;
  [v4 energy];
  double v15 = v14;
  [v4 correctionEnergy];
  double v17 = v13 * (v15 + v16);
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke_685;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v18;
    if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce_683 != -1) {
      dispatch_once(&createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce_683, v52);
    }
    if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled_684)
    {
      double v19 = objc_msgSend(NSString, "stringWithFormat:", @"totalTerminalEnergy=%f", *(void *)&v17);
      uint64_t v20 = (void *)MEMORY[0x263F5F638];
      id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      double v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLAccountingEngine createAggregateRootNodeEnergyEntryWithEnergyEstimate:]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:1387];

      v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  +[PLAccountingEngine minEnergy];
  if (v17 >= v25
    && (([MEMORY[0x263F5F688] gasGaugeEnabled] & 1) != 0
     || ![(PLAccountingEngine *)self pluggedIn]))
  {
    uint64_t v26 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F888] andName:*MEMORY[0x263F5F6C8]];
    id v27 = objc_alloc(MEMORY[0x263F5F648]);
    uint64_t v28 = [v4 range];
    uint64_t v29 = [v28 startDate];
    uint64_t v30 = (void *)[v27 initWithEntryKey:v26 withDate:v29];

    v31 = [v4 nodeID];
    [v30 setObject:v31 forKeyedSubscript:*MEMORY[0x263F5F6D8]];

    uint64_t v32 = [v4 rootNodeID];
    [v30 setObject:v32 forKeyedSubscript:*MEMORY[0x263F5F6E0]];

    v33 = [NSNumber numberWithLong:llround(v17 * 1000.0)];
    [v30 setObject:v33 forKeyedSubscript:*MEMORY[0x263F5F6D0]];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v34 = objc_opt_class();
      uint64_t v47 = MEMORY[0x263EF8330];
      uint64_t v48 = 3221225472;
      double v49 = __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke_691;
      double v50 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v51 = v34;
      if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce_689 != -1) {
        dispatch_once(&createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce_689, &v47);
      }
      if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled_690)
      {
        double v35 = [NSString stringWithFormat:@"aggregateRootNodeEnergyEntry=%@", v30, v47, v48, v49, v50, v51];
        uint64_t v36 = (void *)MEMORY[0x263F5F638];
        v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        uint64_t v38 = [v37 lastPathComponent];
        uint64_t v39 = [NSString stringWithUTF8String:"-[PLAccountingEngine createAggregateRootNodeEnergyEntryWithEnergyEstimate:]"];
        [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:1399];

        uint64_t v40 = PLLogCommon();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    v41 = [MEMORY[0x263F5F698] sharedCore];
    uint64_t v42 = [v41 storage];
    uint64_t v43 = [v4 range];
    v44 = [v43 startDate];
    v45 = [v4 range];
    v46 = [v45 endDate];
    [v42 writeProportionateAggregateEntry:v30 withStartDate:v44 withEndDate:v46];

    [v4 setIsRootNodeEnergyAggregated:1];
  }
}

- (void)createPowerEventForwardWithRootNodeID:(int)a3 withPower:(double)a4 withStartDate:(id)a5
{
  id v8 = a5;
  id v9 = [(PLAccountingEngine *)self workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke;
  v11[3] = &unk_2647B50F0;
  int v14 = a3;
  double v13 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, v11);
}

uint64_t __26__PLAccountingEngine_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) chunkWithLastChunkDate:a2 withNow:a3];
}

- (void)createPowerEventBackwardWithRootNodeID:(int)a3 withPower:(double)a4 withEndDate:(id)a5
{
  id v8 = a5;
  id v9 = [(PLAccountingEngine *)self workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke;
  v11[3] = &unk_2647B50F0;
  int v14 = a3;
  double v13 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, v11);
}

- (void)createDistributionEventBackwardWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withEndDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PLAccountingEngine *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke;
  v13[3] = &unk_2647B51B8;
  int v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_16_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_16_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_16_classDebugEnabled)
    {
      v3 = [NSString stringWithFormat:@"qualificationID=%i, childNodeNames=%@, startDate=%@, endDate=%@", *(unsigned int *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56)];
      id v4 = (void *)MEMORY[0x263F5F638];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:821];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:*(void *)(a1 + 48) withEndDate:*(void *)(a1 + 56)];
  id v10 = [PLAccountingQualificationEventIntervalEntry alloc];
  id v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  id v12 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
  double v13 = [(PLAccountingQualificationEventEntry *)v10 initWithQualificationID:v11 withChildNodeNames:v12 withRange:v9];

  id v14 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke_451;
  v15[3] = &unk_2647B50C8;
  v15[4] = v14;
  [v14 createEventWithEvent:v13 withActionBlock:v15];
}

- (void)createQualificationEventIntervalWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = [(PLAccountingEngine *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke;
  block[3] = &unk_2647B51E0;
  int v21 = a3;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (PLAccountingEngine)init
{
  v22[1] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)PLAccountingEngine;
  uint64_t v2 = [(PLAccountingEngine *)&v21 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F5F688] workQueueForClass:objc_opt_class()];
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    if (([(id)objc_opt_class() accountingDebugEnabled] & 1) == 0)
    {
      [(PLAccountingEngine *)v2 reload];
      uint64_t v5 = [MEMORY[0x263F5F628] sharedInstance];
      id v6 = (void *)MEMORY[0x263F5F620];
      [(id)objc_opt_class() maxPowerEventChunkInterval];
      id v7 = objc_msgSend(v6, "timeCriterionWithInterval:");
      v22[0] = v7;
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      id v9 = v2->_workQueue;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __26__PLAccountingEngine_init__block_invoke;
      v19[3] = &unk_2647B5008;
      id v10 = v2;
      id v20 = v10;
      [v5 scheduleActivityWithIdentifier:@"com.apple.powerlogd.accounting.chunking" withCriteria:v8 withMustRunCriterion:0 withQueue:v9 withInterruptBlock:0 withActivityBlock:v19];

      if (([MEMORY[0x263F5F688] gasGaugeEnabled] & 1) == 0)
      {
        v10->_pluggedIn = 0;
        id v11 = objc_alloc(MEMORY[0x263F5F658]);
        id v12 = v2->_workQueue;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __26__PLAccountingEngine_init__block_invoke_2;
        v17[3] = &unk_2647B5030;
        double v13 = v10;
        id v18 = v13;
        uint64_t v14 = [v11 initWithWorkQueue:v12 forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withBlock:v17];
        batteryListener = v13->_batteryListener;
        v13->_batteryListener = (PLEntryNotificationOperatorComposition *)v14;
      }
    }
  }
  return v2;
}

void __26__PLAccountingEngine_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 objectForKeyedSubscript:@"entry"];
  uint64_t v3 = [v4 objectForKeyedSubscript:@"ExternalConnected"];
  objc_msgSend(*(id *)(a1 + 32), "setPluggedIn:", objc_msgSend(v3, "BOOLValue"));
}

uint64_t __36__PLAccountingEngine_sharedInstance__block_invoke()
{
  uint64_t result = [(id)objc_opt_class() accountingDebugEnabled];
  if ((result & 1) == 0)
  {
    sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)debugInstance
{
  uint64_t v3 = [MEMORY[0x263F5F698] sharedCore];
  id v4 = [v3 storage];
  if ([v4 storageLocked])
  {

LABEL_4:
    id v6 = 0;
    goto LABEL_8;
  }
  char v5 = [MEMORY[0x263F5F688] isPowerlogHelperd];

  if (v5) {
    goto LABEL_4;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__PLAccountingEngine_debugInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (debugInstance_onceToken != -1) {
    dispatch_once(&debugInstance_onceToken, block);
  }
  id v6 = (id)debugInstance_debugInstance;
LABEL_8:
  return v6;
}

uint64_t __35__PLAccountingEngine_debugInstance__block_invoke()
{
  uint64_t result = [(id)objc_opt_class() accountingDebugEnabled];
  if (result)
  {
    debugInstance_debugInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (BOOL)accountingDebugEnabled
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__PLAccountingEngine_accountingDebugEnabled__block_invoke;
  v4[3] = &unk_2647B5078;
  char v5 = @"PLAccountingDebugService_Debug";
  char v6 = 0;
  if (accountingDebugEnabled_defaultOnce != -1) {
    dispatch_once(&accountingDebugEnabled_defaultOnce, v4);
  }
  char v2 = accountingDebugEnabled_objectForKey;

  return v2;
}

uint64_t __44__PLAccountingEngine_accountingDebugEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  accountingDebugEnabled_objectForKey = result;
  return result;
}

- (void)reset
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__PLAccountingEngine_reset__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (reset_defaultOnce != -1) {
      dispatch_once(&reset_defaultOnce, block);
    }
    if (reset_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"begin"];
      char v5 = (void *)MEMORY[0x263F5F638];
      char v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLAccountingEngine reset]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:115];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v10 = [MEMORY[0x263F5F698] sharedCore];
  id v11 = [v10 storage];
  id v12 = [NSString stringWithUTF8String:"-[PLAccountingEngine reset]"];
  [v11 blockingFlushCachesWithReason:v12];

  double v13 = [MEMORY[0x263F5F678] sharedStorageCache];
  uint64_t v14 = [MEMORY[0x263EFF910] distantFuture];
  [v13 lastEntryCachePruneToDate:v14];

  id v15 = [(PLAccountingEngine *)self workQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __27__PLAccountingEngine_reset__block_invoke_40;
  v16[3] = &unk_2647B50A0;
  v16[4] = self;
  dispatch_async_and_wait(v15, v16);
}

uint64_t __27__PLAccountingEngine_reset__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reset_classDebugEnabled = result;
  return result;
}

void __27__PLAccountingEngine_reset__block_invoke_40(uint64_t a1)
{
  [*(id *)(a1 + 32) setDistributionManager:0];
  [*(id *)(a1 + 32) setCorrectionManager:0];
  [*(id *)(a1 + 32) setQualificationManager:0];
  char v2 = objc_opt_class();
  uint64_t v3 = +[PLAccountingDistributionEventForwardEntry entryKey];
  [v2 clearWithEntryKey:v3];

  id v4 = objc_opt_class();
  char v5 = +[PLAccountingDistributionEventBackwardEntry entryKey];
  [v4 clearWithEntryKey:v5];

  char v6 = objc_opt_class();
  id v7 = +[PLAccountingDistributionEventIntervalEntry entryKey];
  [v6 clearWithEntryKey:v7];

  id v8 = objc_opt_class();
  id v9 = +[PLAccountingDistributionEventPointEntry entryKey];
  [v8 clearWithEntryKey:v9];

  id v10 = objc_opt_class();
  id v11 = +[PLAccountingQualificationEventForwardEntry entryKey];
  [v10 clearWithEntryKey:v11];

  id v12 = objc_opt_class();
  double v13 = +[PLAccountingQualificationEventBackwardEntry entryKey];
  [v12 clearWithEntryKey:v13];

  uint64_t v14 = objc_opt_class();
  id v15 = +[PLAccountingQualificationEventIntervalEntry entryKey];
  [v14 clearWithEntryKey:v15];

  id v16 = objc_opt_class();
  double v17 = +[PLAccountingQualificationEventPointEntry entryKey];
  [v16 clearWithEntryKey:v17];

  id v18 = objc_opt_class();
  id v19 = +[PLAccountingPowerEventForwardEntry entryKey];
  [v18 clearWithEntryKey:v19];

  id v20 = objc_opt_class();
  objc_super v21 = +[PLAccountingPowerEventBackwardEntry entryKey];
  [v20 clearWithEntryKey:v21];

  double v22 = objc_opt_class();
  v23 = +[PLAccountingPowerEventIntervalEntry entryKey];
  [v22 clearWithEntryKey:v23];

  v24 = objc_opt_class();
  double v25 = +[PLAccountingEnergyEstimateEventEntry entryKey];
  [v24 clearWithEntryKey:v25];

  uint64_t v26 = objc_opt_class();
  uint64_t v27 = *MEMORY[0x263F5F888];
  uint64_t v28 = [MEMORY[0x263F5F618] entryKeyForType:*MEMORY[0x263F5F888] andName:*MEMORY[0x263F5F6C8]];
  [v26 clearWithEntryKey:v28];

  uint64_t v29 = objc_opt_class();
  uint64_t v30 = [MEMORY[0x263F5F618] entryKeyForType:v27 andName:*MEMORY[0x263F5F6A0]];
  [v29 clearWithEntryKey:v30];

  v31 = objc_opt_class();
  uint64_t v32 = [(id)objc_opt_class() gasGaugeEntryKey];
  [v31 clearWithEntryKey:v32];

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v33 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__PLAccountingEngine_reset__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v33;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled)
    {
      uint64_t v34 = [NSString stringWithFormat:@"done"];
      double v35 = (void *)MEMORY[0x263F5F638];
      uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      v37 = [v36 lastPathComponent];
      uint64_t v38 = [NSString stringWithUTF8String:"-[PLAccountingEngine reset]_block_invoke"];
      [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:154];

      uint64_t v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

uint64_t __27__PLAccountingEngine_reset__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __31__PLAccountingEngine_minEnergy__block_invoke()
{
  uint64_t result = [(id)objc_opt_class() accountingDebugEnabled];
  double v1 = 0.001;
  if (result) {
    double v1 = 1.0e-10;
  }
  minEnergy_minEnergy = *(void *)&v1;
  return result;
}

uint64_t __43__PLAccountingEngine_minDistributionEnergy__block_invoke()
{
  uint64_t result = [MEMORY[0x263F5F640] doubleForKey:@"PLAccountingEngine_minDistributionEnergy" ifNotSet:0.01];
  minDistributionEnergy_minDistributionEnergy = v1;
  return result;
}

+ (double)maxPowerEventChunkInterval
{
  if (maxPowerEventChunkInterval_onceToken != -1) {
    dispatch_once(&maxPowerEventChunkInterval_onceToken, &__block_literal_global_61);
  }
  return *(double *)&maxPowerEventChunkInterval_maxPowerEventChunkInterval;
}

uint64_t __48__PLAccountingEngine_maxPowerEventChunkInterval__block_invoke()
{
  uint64_t result = [MEMORY[0x263F5F640] doubleForKey:@"PLAccountingEngine_maxPowerEventChunkInterval" ifNotSet:300.0];
  maxPowerEventChunkInterval_maxPowerEventChunkInterval = v1;
  return result;
}

void __39__PLAccountingEngine_deviceRootNodeIDs__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9C0] set];
  uint64_t v1 = (void *)deviceRootNodeIDs_deviceRootNodeIDs;
  deviceRootNodeIDs_deviceRootNodeIDs = v0;

  uint64_t v2 = 2;
  do
  {
    uint64_t v3 = [(id)objc_opt_class() allSoCRootNodeIDs];
    id v4 = [NSNumber numberWithInt:v2];
    if ([v3 containsObject:v4])
    {
      char v5 = [(id)objc_opt_class() deviceSoCRootNodeIDs];
      char v6 = [NSNumber numberWithInt:v2];
      int v7 = [v5 containsObject:v6];

      if (!v7) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    id v8 = [(id)objc_opt_class() allBBRootNodeIDs];
    id v9 = [NSNumber numberWithInt:v2];
    if ([v8 containsObject:v9])
    {
      id v10 = [(id)objc_opt_class() deviceBBRootNodeIDs];
      id v11 = [NSNumber numberWithInt:v2];
      int v12 = [v10 containsObject:v11];

      if (!v12) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    if (v2 == 58)
    {
      if (![MEMORY[0x263F5F668] isiPhone]) {
        goto LABEL_16;
      }
LABEL_15:
      double v13 = (void *)deviceRootNodeIDs_deviceRootNodeIDs;
      uint64_t v14 = [NSNumber numberWithInt:v2];
      [v13 addObject:v14];

      goto LABEL_16;
    }
    if v2 != 56 || ([MEMORY[0x263F5F668] hasCapability:5]) {
      goto LABEL_15;
    }
LABEL_16:
    uint64_t v2 = (v2 + 1);
  }
  while (v2 != 63);
}

+ (id)allSoCRootNodeIDs
{
  if (allSoCRootNodeIDs_onceToken != -1) {
    dispatch_once(&allSoCRootNodeIDs_onceToken, &__block_literal_global_69);
  }
  uint64_t v2 = (void *)allSoCRootNodeIDs_allSoCRootNodeIDs;
  return v2;
}

uint64_t __39__PLAccountingEngine_allSoCRootNodeIDs__block_invoke()
{
  allSoCRootNodeIDs_allSoCRootNodeIDs = [MEMORY[0x263EFFA08] setWithArray:&unk_26DA69EE0];
  return MEMORY[0x270F9A758]();
}

+ (id)deviceSoCRootNodeIDs
{
  if (deviceSoCRootNodeIDs_onceToken != -1) {
    dispatch_once(&deviceSoCRootNodeIDs_onceToken, &__block_literal_global_93);
  }
  uint64_t v2 = (void *)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs;
  return v2;
}

uint64_t __42__PLAccountingEngine_deviceSoCRootNodeIDs__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9C0] set];
  uint64_t v1 = (void *)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs;
  deviceSoCRootNodeIDs_deviceSoCRootNodeIDs = v0;

  [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs addObject:&unk_26DA698E0];
  [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs addObject:&unk_26DA69970];
  uint64_t result = [MEMORY[0x263F5F668] kPLSoCClassOfDevice];
  if ((result - 1001001) >= 2)
  {
    unsigned int v4 = result;
    if ((int)result <= 1001002) {
      return result;
    }
    [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs addObject:&unk_26DA69910];
    [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs addObject:&unk_26DA69928];
    [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs addObject:&unk_26DA69940];
    [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs addObject:&unk_26DA69958];
    [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs removeObject:&unk_26DA69970];
    [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs addObject:&unk_26DA69988];
    uint64_t result = [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs addObject:&unk_26DA699A0];
    if (v4 <= 0xF4637)
    {
      if (v4 <= 0xF462B) {
        return result;
      }
    }
    else
    {
      [(id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs addObject:&unk_26DA699B8];
    }
    uint64_t v3 = &unk_26DA699D0;
  }
  else
  {
    uint64_t v3 = &unk_26DA69958;
  }
  char v5 = (void *)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs;
  return [v5 addObject:v3];
}

+ (id)allBBRootNodeIDs
{
  if (allBBRootNodeIDs_onceToken != -1) {
    dispatch_once(&allBBRootNodeIDs_onceToken, &__block_literal_global_95);
  }
  uint64_t v2 = (void *)allBBRootNodeIDs_allBBRootNodeIDs;
  return v2;
}

uint64_t __38__PLAccountingEngine_allBBRootNodeIDs__block_invoke()
{
  allBBRootNodeIDs_allBBRootNodeIDs = [MEMORY[0x263EFFA08] setWithArray:&unk_26DA69EF8];
  return MEMORY[0x270F9A758]();
}

+ (id)deviceBBRootNodeIDs
{
  if (deviceBBRootNodeIDs_onceToken != -1) {
    dispatch_once(&deviceBBRootNodeIDs_onceToken, &__block_literal_global_158);
  }
  uint64_t v2 = (void *)deviceBBRootNodeIDs_deviceBBRootNodeIDs;
  return v2;
}

uint64_t __41__PLAccountingEngine_deviceBBRootNodeIDs__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9C0] set];
  uint64_t v1 = (void *)deviceBBRootNodeIDs_deviceBBRootNodeIDs;
  deviceBBRootNodeIDs_deviceBBRootNodeIDs = v0;

  if (objc_msgSend(MEMORY[0x263F5F668], "kPLBasebandClassIsOneOf:", 1003003, 1003004, 1003005, 1003007, 1003006, 1003008, 1003010, 1003011, 1003012, 1003013, 1003014, 1003015, 1003016, 1003017, 0))
  {
    uint64_t v2 = &unk_26DA69B80;
    uint64_t v3 = &unk_26DA69C58;
    unsigned int v4 = &unk_26DA69B68;
  }
  else
  {
    if (([MEMORY[0x263F5F668] isBasebandClass:1003002] & 1) == 0)
    {
      uint64_t result = [MEMORY[0x263F5F668] isBasebandClass:1003001];
      if (!result) {
        return result;
      }
    }
    [(id)deviceBBRootNodeIDs_deviceBBRootNodeIDs addObject:&unk_26DA69A00];
    uint64_t v2 = &unk_26DA69C40;
    uint64_t v3 = &unk_26DA69C28;
    unsigned int v4 = &unk_26DA699E8;
  }
  [(id)deviceBBRootNodeIDs_deviceBBRootNodeIDs addObject:v4];
  [(id)deviceBBRootNodeIDs_deviceBBRootNodeIDs addObject:v3];
  char v6 = (void *)deviceBBRootNodeIDs_deviceBBRootNodeIDs;
  return [v6 addObject:v2];
}

void __40__PLAccountingEngine_allDistributionIDs__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9C0] set];
  uint64_t v1 = (void *)allDistributionIDs_allDistributionIDs;
  allDistributionIDs_allDistributionIDs = v0;

  uint64_t v2 = 1;
  do
  {
    uint64_t v3 = (void *)allDistributionIDs_allDistributionIDs;
    unsigned int v4 = [NSNumber numberWithInt:v2];
    [v3 addObject:v4];

    uint64_t v2 = (v2 + 1);
  }
  while (v2 != 55);
}

+ (id)distributionIDForDistributionName:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__PLAccountingEngine_distributionIDForDistributionName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = distributionIDForDistributionName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&distributionIDForDistributionName__onceToken, block);
  }
  char v5 = [(id)distributionIDForDistributionName__distributionNameToDistributionID objectForKeyedSubscript:v4];

  return v5;
}

void __56__PLAccountingEngine_distributionIDForDistributionName___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = (void *)distributionIDForDistributionName__distributionNameToDistributionID;
  distributionIDForDistributionName__distributionNameToDistributionID = v2;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "allDistributionIDs", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (void *)distributionIDForDistributionName__distributionNameToDistributionID;
        id v11 = objc_msgSend(&unk_26DA69F10, "objectAtIndexedSubscript:", (int)objc_msgSend(v9, "intValue"));
        [v10 setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __41__PLAccountingEngine_allQualificationIDs__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9C0] set];
  uint64_t v1 = (void *)allQualificationIDs_allQualificationIDs;
  allQualificationIDs_allQualificationIDs = v0;

  uint64_t v2 = 1;
  do
  {
    uint64_t v3 = (void *)allQualificationIDs_allQualificationIDs;
    id v4 = [NSNumber numberWithInt:v2];
    [v3 addObject:v4];

    uint64_t v2 = (v2 + 1);
  }
  while (v2 != 18);
}

+ (id)qualificationIDForQualificationName:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__PLAccountingEngine_qualificationIDForQualificationName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = qualificationIDForQualificationName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qualificationIDForQualificationName__onceToken, block);
  }
  uint64_t v5 = [(id)qualificationIDForQualificationName__qualificationNameToQualificationID objectForKeyedSubscript:v4];

  return v5;
}

void __58__PLAccountingEngine_qualificationIDForQualificationName___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = (void *)qualificationIDForQualificationName__qualificationNameToQualificationID;
  qualificationIDForQualificationName__qualificationNameToQualificationID = v2;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "allQualificationIDs", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (void *)qualificationIDForQualificationName__qualificationNameToQualificationID;
        id v11 = objc_msgSend(&unk_26DA69F28, "objectAtIndexedSubscript:", (int)objc_msgSend(v9, "intValue"));
        [v10 setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled = result;
  return result;
}

uint64_t __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_2_382(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled = result;
  return result;
}

uint64_t __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_389(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_388 = result;
  return result;
}

uint64_t __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled = result;
  return result;
}

void __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_397(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = v7;
    [v8 length];
    double v11 = v10;
    [v9 power];
    double v13 = v11 * v12 / 3600.0;
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_2_398;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v14;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce, block);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled)
      {
        long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"energy=%f", *(void *)&v13);
        id v16 = (void *)MEMORY[0x263F5F638];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        id v18 = [v17 lastPathComponent];
        id v19 = [NSString stringWithUTF8String:"-[PLAccountingEngine createPowerEventBackwardWithRootNodeID:withPower:withEndDate:]_block_invoke"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:475];

        id v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    +[PLAccountingEngine minDistributionEnergy];
    if (v13 >= v21)
    {
      double v22 = [PLAccountingEnergyEstimateEventEntry alloc];
      v23 = [v9 rootNodeID];
      v24 = [v9 rootNodeID];
      double v25 = [(PLAccountingEnergyEstimateEventEntry *)v22 initWithNodeID:v23 withRootNodeID:v24 withParentEntryID:0 withNumAncestors:0 withEnergy:v8 withRange:0 withEntryDate:v13];

      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v26 = objc_opt_class();
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_401;
        v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v33[4] = v26;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_399 != -1) {
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_399, v33);
        }
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_400)
        {
          uint64_t v27 = [NSString stringWithFormat:@"rootEnergyEstimate=%@", v25];
          uint64_t v28 = (void *)MEMORY[0x263F5F638];
          uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
          uint64_t v30 = [v29 lastPathComponent];
          v31 = [NSString stringWithUTF8String:"-[PLAccountingEngine createPowerEventBackwardWithRootNodeID:withPower:withEndDate:]_block_invoke_2"];
          [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:489];

          uint64_t v32 = PLLogCommon();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
      [*(id *)(a1 + 32) didCreateChildEnergyEstimate:v25 withParentEnergyEstimate:0];
    }
  }
}

uint64_t __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_2_398(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled = result;
  return result;
}

uint64_t __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_401(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_400 = result;
  return result;
}

uint64_t __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_6_classDebugEnabled = result;
  return result;
}

uint64_t __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_2_406(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_7_classDebugEnabled = result;
  return result;
}

uint64_t __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_409(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_7_classDebugEnabled_408 = result;
  return result;
}

- (void)addPowerMeasurementEventIntervalWithPower:(double)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [(PLAccountingEngine *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke;
  v13[3] = &unk_2647B5168;
  id v14 = v8;
  id v15 = v9;
  id v16 = self;
  double v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PLAccountingRange rangeWithStartDate:*(void *)(a1 + 32) withEndDate:*(void *)(a1 + 40)];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_8_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_8_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_8_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"range=%@", v2];
      uint64_t v5 = (void *)MEMORY[0x263F5F638];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v7 = [v6 lastPathComponent];
      id v8 = [NSString stringWithUTF8String:"-[PLAccountingEngine addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:551];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v2)
  {
    double v10 = *(double *)(a1 + 56);
    [v2 length];
    double v12 = v10 * v11 / 3600.0;
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke_415;
      v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v20[4] = v13;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_8_defaultOnce_413 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_8_defaultOnce_413, v20);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_8_classDebugEnabled_414)
      {
        id v14 = objc_msgSend(NSString, "stringWithFormat:", @"energy=%f", *(void *)&v12);
        id v15 = (void *)MEMORY[0x263F5F638];
        id v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        double v17 = [v16 lastPathComponent];
        id v18 = [NSString stringWithUTF8String:"-[PLAccountingEngine addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:]_block_invoke_2"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:555];

        id v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    [*(id *)(a1 + 48) addEnergyMeasurementWithRootNodeID:1 withEnergy:v2 withRange:v12];
  }
}

uint64_t __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_8_classDebugEnabled = result;
  return result;
}

uint64_t __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke_415(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_8_classDebugEnabled_414 = result;
  return result;
}

- (void)createDistributionEventForwardWithDistributionID:(int)a3 withAddingChildNodeName:(id)a4 withStartDate:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  double v21 = __Block_byref_object_copy_;
  double v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  double v10 = [(PLAccountingEngine *)self workQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __109__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withAddingChildNodeName_withStartDate___block_invoke;
  v16[3] = &unk_2647B5190;
  v16[4] = &v18;
  int v17 = v6;
  dispatch_async_and_wait(v10, v16);

  double v11 = (void *)v19[5];
  if (v11)
  {
    double v12 = [v11 childNodeNameToWeight];
  }
  else
  {
    double v12 = (void *)MEMORY[0x263EFFA78];
  }
  uint64_t v13 = (void *)[v12 mutableCopy];
  id v14 = [v13 objectForKeyedSubscript:v8];

  if (!v14)
  {
    [v13 setObject:&unk_26DA69FD0 forKeyedSubscript:v8];
    uint64_t v15 = [(id)objc_opt_class() normalizeWeights:v13];

    [(PLAccountingEngine *)self createDistributionEventForwardWithDistributionID:v6 withChildNodeNameToWeight:v15 withStartDate:v9];
    uint64_t v13 = (void *)v15;
  }

  _Block_object_dispose(&v18, 8);
}

void __109__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withAddingChildNodeName_withStartDate___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x263F5F698] sharedCore];
  uint64_t v2 = [v8 storage];
  uint64_t v3 = +[PLAccountingDistributionEventForwardEntry entryKey];
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v5 = [v2 lastEntryForKey:v3 withSubEntryKey:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)createDistributionEventForwardWithDistributionID:(int)a3 withRemovingChildNodeName:(id)a4 withStartDate:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  double v21 = __Block_byref_object_copy_;
  double v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  double v10 = [(PLAccountingEngine *)self workQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withRemovingChildNodeName_withStartDate___block_invoke;
  v16[3] = &unk_2647B5190;
  v16[4] = &v18;
  int v17 = v6;
  dispatch_async_and_wait(v10, v16);

  double v11 = (void *)v19[5];
  if (v11)
  {
    double v12 = [v11 childNodeNameToWeight];
    uint64_t v13 = (void *)[v12 mutableCopy];

    id v14 = [v13 objectForKeyedSubscript:v8];

    if (v14)
    {
      [v13 removeObjectForKey:v8];
      uint64_t v15 = [(id)objc_opt_class() normalizeWeights:v13];

      [(PLAccountingEngine *)self createDistributionEventForwardWithDistributionID:v6 withChildNodeNameToWeight:v15 withStartDate:v9];
      uint64_t v13 = (void *)v15;
    }
  }
  _Block_object_dispose(&v18, 8);
}

void __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withRemovingChildNodeName_withStartDate___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x263F5F698] sharedCore];
  uint64_t v2 = [v8 storage];
  uint64_t v3 = +[PLAccountingDistributionEventForwardEntry entryKey];
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v5 = [v2 lastEntryForKey:v3 withSubEntryKey:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_9_classDebugEnabled = result;
  return result;
}

uint64_t __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_10_classDebugEnabled = result;
  return result;
}

- (void)createDistributionEventIntervalWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(PLAccountingEngine *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke;
  block[3] = &unk_2647B51E0;
  int v21 = a3;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_11_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_11_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_11_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"distributionID=%i, childNodeNameToWeight=%@, startDate=%@, endDate=%@", *(unsigned int *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56)];
      id v4 = (void *)MEMORY[0x263F5F638];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      uint64_t v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:665];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:*(void *)(a1 + 48) withEndDate:*(void *)(a1 + 56)];
  id v10 = [PLAccountingDistributionEventIntervalEntry alloc];
  id v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  id v12 = [(PLAccountingDistributionEventEntry *)v10 initWithDistributionID:v11 withChildNodeNameToWeight:*(void *)(a1 + 40) withRange:v9];

  uint64_t v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke_428;
  v14[3] = &unk_2647B5118;
  int v15 = *(_DWORD *)(a1 + 64);
  v14[4] = v13;
  [v13 createEventWithEvent:v12 withActionBlock:v14];
}

uint64_t __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_11_classDebugEnabled = result;
  return result;
}

void __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke_428(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (*(_DWORD *)(a1 + 40) == 22) {
    uint64_t v6 = v8;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = v6;
  [*(id *)(a1 + 32) addDistributionEventInterval:v7];
}

- (void)createDistributionEventPointWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PLAccountingEngine *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke;
  v13[3] = &unk_2647B51B8;
  int v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_12_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_12_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_12_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"distributionID=%i, childNodeNameToWeight=%@, startDate=%@", *(unsigned int *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48)];
      id v4 = (void *)MEMORY[0x263F5F638];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      uint64_t v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:692];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:*(void *)(a1 + 48) withEndDate:*(void *)(a1 + 48)];
  id v10 = [PLAccountingDistributionEventPointEntry alloc];
  id v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  id v12 = [(PLAccountingDistributionEventEntry *)v10 initWithDistributionID:v11 withChildNodeNameToWeight:*(void *)(a1 + 40) withRange:v9];

  uint64_t v13 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_429;
  v14[3] = &unk_2647B50C8;
  v14[4] = v13;
  [v13 createEventWithEvent:v12 withActionBlock:v14];
}

uint64_t __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_12_classDebugEnabled = result;
  return result;
}

uint64_t __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_429(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDistributionEventPoint:");
}

- (id)currentDistributionEventForwardWithDistributionID:(int)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v5 = [(PLAccountingEngine *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke;
  block[3] = &unk_2647B5208;
  int v9 = a3;
  block[4] = self;
  void block[5] = &v10;
  dispatch_async_and_wait(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_13_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_13_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_13_classDebugEnabled)
    {
      uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"distributionID=%i", *(unsigned int *)(a1 + 48));
      id v4 = (void *)MEMORY[0x263F5F638];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine currentDistributionEventForwardWithDistributionID:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:711];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  int v9 = [*(id *)(a1 + 32) distributionManager];
  uint64_t v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  id v11 = [v9 lastDependencyForDependencyID:v10];

  uint64_t v12 = [v11 distributionEvent];
  uint64_t v13 = [v12 childNodeNameToWeight];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke_435;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = v16;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_13_defaultOnce_433 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_13_defaultOnce_433, v23);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_13_classDebugEnabled_434)
    {
      int v17 = [NSString stringWithFormat:@"childNodeNameToWeight=%@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v18 = (void *)MEMORY[0x263F5F638];
      id v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v20 = [v19 lastPathComponent];
      int v21 = [NSString stringWithUTF8String:"-[PLAccountingEngine currentDistributionEventForwardWithDistributionID:]_block_invoke_2"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:714];

      double v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

uint64_t __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_13_classDebugEnabled = result;
  return result;
}

uint64_t __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke_435(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_13_classDebugEnabled_434 = result;
  return result;
}

- (void)createQualificationEventForwardWithQualificationID:(int)a3 withAddingChildNodeName:(id)a4 withStartDate:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  int v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v10 = [(PLAccountingEngine *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __111__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withAddingChildNodeName_withStartDate___block_invoke;
  v15[3] = &unk_2647B5190;
  v15[4] = &v17;
  int v16 = v6;
  dispatch_async_and_wait(v10, v15);

  id v11 = (void *)v18[5];
  if (v11) {
    [v11 childNodeNames];
  }
  else {
  uint64_t v12 = [MEMORY[0x263EFFA08] set];
  }
  uint64_t v13 = (void *)[v12 mutableCopy];
  if (([v13 containsObject:v8] & 1) == 0)
  {
    [v13 addObject:v8];
    uint64_t v14 = [v13 allObjects];
    [(PLAccountingEngine *)self createQualificationEventForwardWithQualificationID:v6 withChildNodeNames:v14 withStartDate:v9];
  }
  _Block_object_dispose(&v17, 8);
}

void __111__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withAddingChildNodeName_withStartDate___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x263F5F698] sharedCore];
  uint64_t v2 = [v8 storage];
  uint64_t v3 = +[PLAccountingQualificationEventForwardEntry entryKey];
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v5 = [v2 lastEntryForKey:v3 withSubEntryKey:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)createQualificationEventForwardWithQualificationID:(int)a3 withRemovingChildNodeName:(id)a4 withStartDate:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  int v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v10 = [(PLAccountingEngine *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __113__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withRemovingChildNodeName_withStartDate___block_invoke;
  v15[3] = &unk_2647B5190;
  v15[4] = &v17;
  int v16 = v6;
  dispatch_async_and_wait(v10, v15);

  id v11 = (void *)v18[5];
  if (v11)
  {
    uint64_t v12 = [v11 childNodeNames];
    uint64_t v13 = (void *)[v12 mutableCopy];

    if ([v13 containsObject:v8])
    {
      [v13 removeObject:v8];
      uint64_t v14 = [v13 allObjects];
      [(PLAccountingEngine *)self createQualificationEventForwardWithQualificationID:v6 withChildNodeNames:v14 withStartDate:v9];
    }
  }
  _Block_object_dispose(&v17, 8);
}

void __113__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withRemovingChildNodeName_withStartDate___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x263F5F698] sharedCore];
  uint64_t v2 = [v8 storage];
  uint64_t v3 = +[PLAccountingQualificationEventForwardEntry entryKey];
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  uint64_t v5 = [v2 lastEntryForKey:v3 withSubEntryKey:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_14_classDebugEnabled = result;
  return result;
}

- (void)createQualificationEventBackwardWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withEndDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(PLAccountingEngine *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke;
  v13[3] = &unk_2647B51B8;
  int v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_15_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_15_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_15_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"qualificationID=%i, childNodeNames=%@, endDate=%@", *(unsigned int *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48)];
      id v4 = (void *)MEMORY[0x263F5F638];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      uint64_t v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:796];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:0 withEndDate:*(void *)(a1 + 48)];
  uint64_t v10 = [PLAccountingQualificationEventBackwardEntry alloc];
  id v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  id v12 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
  uint64_t v13 = [(PLAccountingQualificationEventEntry *)v10 initWithQualificationID:v11 withChildNodeNames:v12 withRange:v9];

  id v14 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke_447;
  v15[3] = &unk_2647B50C8;
  v15[4] = v14;
  [v14 createEventWithEvent:v13 withActionBlock:v15];
}

uint64_t __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_15_classDebugEnabled = result;
  return result;
}

uint64_t __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke_447(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addQualificationEventIntervalWithLastQualificationEventBackward:a2 withQualificationEventBackward:a3];
}

uint64_t __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_16_classDebugEnabled = result;
  return result;
}

uint64_t __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke_451(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addQualificationEventInterval:");
}

- (void)createQualificationEventPointWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(PLAccountingEngine *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke;
  v13[3] = &unk_2647B51B8;
  int v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_17_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_17_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_17_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"qualificationID=%i, childNodeNames=%@, startDate=%@", *(unsigned int *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48)];
      id v4 = (void *)MEMORY[0x263F5F638];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      uint64_t v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:843];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v9 = +[PLAccountingRange rangeWithStartDate:*(void *)(a1 + 48) withEndDate:*(void *)(a1 + 48)];
  uint64_t v10 = [PLAccountingQualificationEventPointEntry alloc];
  id v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  id v12 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
  uint64_t v13 = [(PLAccountingQualificationEventEntry *)v10 initWithQualificationID:v11 withChildNodeNames:v12 withRange:v9];

  id v14 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke_452;
  v15[3] = &unk_2647B50C8;
  v15[4] = v14;
  [v14 createEventWithEvent:v13 withActionBlock:v15];
}

uint64_t __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_17_classDebugEnabled = result;
  return result;
}

uint64_t __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke_452(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addQualificationEventPoint:");
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  createEventWithEvent_withActionBlock__classDebugEnabled = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_458(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  createEventWithEvent_withActionBlock__classDebugEnabled_457 = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_464(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  createEventWithEvent_withActionBlock__classDebugEnabled_463 = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_470(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  createEventWithEvent_withActionBlock__classDebugEnabled_469 = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_476(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  createEventWithEvent_withActionBlock__classDebugEnabled_475 = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  createEventWithEvent_withActionBlock__classDebugEnabled_484 = result;
  return result;
}

+ (id)gasGaugeEntryKey
{
  if (gasGaugeEntryKey_onceToken != -1) {
    dispatch_once(&gasGaugeEntryKey_onceToken, &__block_literal_global_489);
  }
  uint64_t v2 = (void *)gasGaugeEntryKey_gasGaugeEntryKey;
  return v2;
}

void __38__PLAccountingEngine_gasGaugeEntryKey__block_invoke()
{
  uint64_t v0 = (void *)gasGaugeEntryKey_gasGaugeEntryKey;
  gasGaugeEntryKey_gasGaugeEntryKey = @"PLBatteryAgent_EventInterval_GasGauge";
}

uint64_t __112__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__classDebugEnabled = result;
  return result;
}

uint64_t __112__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward___block_invoke_498(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__classDebugEnabled_497 = result;
  return result;
}

uint64_t __114__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__classDebugEnabled = result;
  return result;
}

uint64_t __114__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward___block_invoke_507(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__classDebugEnabled_506 = result;
  return result;
}

- (void)addDistributionEventInterval:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __51__PLAccountingEngine_addDistributionEventInterval___block_invoke;
    int v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v5;
    if (addDistributionEventInterval__defaultOnce != -1) {
      dispatch_once(&addDistributionEventInterval__defaultOnce, &block);
    }
    if (addDistributionEventInterval__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"distributionEventInterval=%@", v4, block, v14, v15, v16, v17];
      id v7 = (void *)MEMORY[0x263F5F638];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLAccountingEngine addDistributionEventInterval:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:948];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v12 = [(PLAccountingEngine *)self distributionManager];
  [v12 addDistributionEvent:v4];
}

uint64_t __51__PLAccountingEngine_addDistributionEventInterval___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDistributionEventInterval__classDebugEnabled = result;
  return result;
}

- (void)addDistributionEventPoint:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __48__PLAccountingEngine_addDistributionEventPoint___block_invoke;
    int v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v5;
    if (addDistributionEventPoint__defaultOnce != -1) {
      dispatch_once(&addDistributionEventPoint__defaultOnce, &block);
    }
    if (addDistributionEventPoint__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"distributionEventPoint=%@", v4, block, v14, v15, v16, v17];
      id v7 = (void *)MEMORY[0x263F5F638];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLAccountingEngine addDistributionEventPoint:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:954];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v12 = [(PLAccountingEngine *)self distributionManager];
  [v12 addDistributionEvent:v4];
}

uint64_t __48__PLAccountingEngine_addDistributionEventPoint___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addDistributionEventPoint__classDebugEnabled = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_521 = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_527(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_526 = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_533(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_532 = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_539(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_538 = result;
  return result;
}

uint64_t __50__PLAccountingEngine_didDistributeEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didDistributeEnergyEstimate__classDebugEnabled_0 = result;
  return result;
}

uint64_t __47__PLAccountingEngine_didCorrectEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didCorrectEnergyEstimate__classDebugEnabled = result;
  return result;
}

uint64_t __115__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__classDebugEnabled = result;
  return result;
}

uint64_t __115__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward___block_invoke_551(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__classDebugEnabled_550 = result;
  return result;
}

- (void)addQualificationEventIntervalWithLastQualificationEventBackward:(id)a3 withQualificationEventBackward:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __117__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__defaultOnce != -1) {
      dispatch_once(&addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__defaultOnce, block);
    }
    if (addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__classDebugEnabled)
    {
      id v9 = [NSString stringWithFormat:@"lastQualificationEventBackward=%@, qualificationEventBackward=%@", v6, v7];
      uint64_t v10 = (void *)MEMORY[0x263F5F638];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLAccountingEngine addQualificationEventIntervalWithLastQualificationEventBackward:withQualificationEventBackward:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:1053];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (v6)
  {
    if (v7)
    {
      id v15 = [v6 qualificationID];
      int v16 = [v7 qualificationID];
      int v17 = [v15 isEqual:v16];

      if (v17)
      {
        id v18 = [PLAccountingQualificationEventIntervalEntry alloc];
        uint64_t v19 = [v7 qualificationID];
        id v20 = [v7 childNodeIDs];
        int v21 = [v6 range];
        id v22 = [v21 endDate];
        id v23 = [v7 range];
        v24 = [v23 endDate];
        double v25 = [(PLAccountingQualificationEventIntervalEntry *)v18 initWithQualificationID:v19 withChildNodeIDs:v20 withStartDate:v22 withEndDate:v24];

        [(PLEntry *)v25 setWriteToDB:0];
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v26 = objc_opt_class();
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __117__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward___block_invoke_560;
          v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v34[4] = v26;
          if (addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__defaultOnce_558 != -1) {
            dispatch_once(&addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__defaultOnce_558, v34);
          }
          if (addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__classDebugEnabled_559)
          {
            uint64_t v27 = [NSString stringWithFormat:@"qualificationEventInterval=%@", v25];
            uint64_t v28 = (void *)MEMORY[0x263F5F638];
            uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
            uint64_t v30 = [v29 lastPathComponent];
            v31 = [NSString stringWithUTF8String:"-[PLAccountingEngine addQualificationEventIntervalWithLastQualificationEventBackward:withQualificationEventBackward:]"];
            [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:1062];

            uint64_t v32 = PLLogCommon();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        uint64_t v33 = [(PLAccountingEngine *)self qualificationManager];
        [v33 addQualificationEvent:v25];
      }
    }
  }
}

uint64_t __117__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__classDebugEnabled = result;
  return result;
}

uint64_t __117__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward___block_invoke_560(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__classDebugEnabled_559 = result;
  return result;
}

- (void)addQualificationEventInterval:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __52__PLAccountingEngine_addQualificationEventInterval___block_invoke;
    int v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v5;
    if (addQualificationEventInterval__defaultOnce != -1) {
      dispatch_once(&addQualificationEventInterval__defaultOnce, &block);
    }
    if (addQualificationEventInterval__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"qualificationEventInterval=%@", v4, block, v14, v15, v16, v17];
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLAccountingEngine addQualificationEventInterval:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1069];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v12 = [(PLAccountingEngine *)self qualificationManager];
  [v12 addQualificationEvent:v4];
}

uint64_t __52__PLAccountingEngine_addQualificationEventInterval___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualificationEventInterval__classDebugEnabled = result;
  return result;
}

- (void)addQualificationEventPoint:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __49__PLAccountingEngine_addQualificationEventPoint___block_invoke;
    int v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v5;
    if (addQualificationEventPoint__defaultOnce != -1) {
      dispatch_once(&addQualificationEventPoint__defaultOnce, &block);
    }
    if (addQualificationEventPoint__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"qualificationEventPoint=%@", v4, block, v14, v15, v16, v17];
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLAccountingEngine addQualificationEventPoint:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1075];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v12 = [(PLAccountingEngine *)self qualificationManager];
  [v12 addQualificationEvent:v4];
}

uint64_t __49__PLAccountingEngine_addQualificationEventPoint___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addQualificationEventPoint__classDebugEnabled = result;
  return result;
}

uint64_t __79__PLAccountingEngine_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled_0 = result;
  return result;
}

uint64_t __79__PLAccountingEngine_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke_573(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled_572 = result;
  return result;
}

- (id)getLastQualifiedEnergyEventDate
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  id v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  uint64_t v3 = [(PLAccountingEngine *)self qualificationManager];
  id v4 = [v3 workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__PLAccountingEngine_getLastQualifiedEnergyEventDate__block_invoke;
  v7[3] = &unk_2647B5230;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  uint64_t v5 = (void *)[(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __53__PLAccountingEngine_getLastQualifiedEnergyEventDate__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) qualificationManager];
  uint64_t v2 = [v5 lastQualifiedEnergyEventDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)workQueue
{
  uint64_t v2 = (void *)MEMORY[0x263F5F688];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 workQueueForClass:v3];
}

- (void)addEnergyMeasurementWithRootNodeID:(int)a3 withEnergy:(double)a4 withRange:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__PLAccountingEngine_addEnergyMeasurementWithRootNodeID_withEnergy_withRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (addEnergyMeasurementWithRootNodeID_withEnergy_withRange__defaultOnce != -1) {
      dispatch_once(&addEnergyMeasurementWithRootNodeID_withEnergy_withRange__defaultOnce, block);
    }
    if (addEnergyMeasurementWithRootNodeID_withEnergy_withRange__classDebugEnabled)
    {
      uint64_t v10 = [NSString stringWithFormat:@"rootNodeID=%i, energy=%f, range=%@", v6, *(void *)&a4, v8];
      id v11 = (void *)MEMORY[0x263F5F638];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLAccountingEngine addEnergyMeasurementWithRootNodeID:withEnergy:withRange:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1149];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  if (a4 >= 0.0)
  {
    int v16 = [PLAccountingEnergyEventEntry alloc];
    uint64_t v17 = [NSNumber numberWithInt:v6];
    id v18 = [(PLAccountingEnergyEventEntry *)v16 initWithNodeID:v17 withEnergy:v8 withRange:0 withEntryDate:a4];

    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __78__PLAccountingEngine_addEnergyMeasurementWithRootNodeID_withEnergy_withRange___block_invoke_586;
      v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v27[4] = v19;
      if (addEnergyMeasurementWithRootNodeID_withEnergy_withRange__defaultOnce_584 != -1) {
        dispatch_once(&addEnergyMeasurementWithRootNodeID_withEnergy_withRange__defaultOnce_584, v27);
      }
      if (addEnergyMeasurementWithRootNodeID_withEnergy_withRange__classDebugEnabled_585)
      {
        id v20 = [NSString stringWithFormat:@"measurementEvent=%@", v18];
        int v21 = (void *)MEMORY[0x263F5F638];
        id v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
        id v23 = [v22 lastPathComponent];
        v24 = [NSString stringWithUTF8String:"-[PLAccountingEngine addEnergyMeasurementWithRootNodeID:withEnergy:withRange:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:1156];

        double v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
      }
    }
    uint64_t v26 = [(PLAccountingEngine *)self correctionManager];
    [v26 addEnergyMeasurement:v18];
  }
}

uint64_t __78__PLAccountingEngine_addEnergyMeasurementWithRootNodeID_withEnergy_withRange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addEnergyMeasurementWithRootNodeID_withEnergy_withRange__classDebugEnabled = result;
  return result;
}

uint64_t __78__PLAccountingEngine_addEnergyMeasurementWithRootNodeID_withEnergy_withRange___block_invoke_586(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  addEnergyMeasurementWithRootNodeID_withEnergy_withRange__classDebugEnabled_585 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  chunkWithLastChunkDate_withNow__classDebugEnabled = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_595(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  chunkWithLastChunkDate_withNow__classDebugEnabled_594 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_608(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  chunkWithLastChunkDate_withNow__classDebugEnabled_607 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_614(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  chunkWithLastChunkDate_withNow__classDebugEnabled_613 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_617(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  chunkWithLastChunkDate_withNow__classDebugEnabled_616 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_620(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  chunkWithLastChunkDate_withNow__classDebugEnabled_619 = result;
  return result;
}

- (void)reload
{
  uint64_t v3 = [(PLAccountingEngine *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__PLAccountingEngine_reload__block_invoke;
  block[3] = &unk_2647B50A0;
  block[4] = self;
  dispatch_async_and_wait(v3, block);
}

void __28__PLAccountingEngine_reload__block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__PLAccountingEngine_reload__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled)
    {
      uint64_t v3 = [NSString stringWithFormat:@"begin"];
      id v4 = (void *)MEMORY[0x263F5F638];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      uint64_t v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLAccountingEngine reload]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1208];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  uint64_t v9 = [MEMORY[0x263F5F688] deviceBootTime];
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263EFF910] distantPast];
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __28__PLAccountingEngine_reload__block_invoke_626;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v10;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce_624 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce_624, v25);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled_625)
    {
      id v11 = [NSString stringWithFormat:@"lastDeviceBootDate=%@", v9];
      id v12 = (void *)MEMORY[0x263F5F638];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      uint64_t v14 = [v13 lastPathComponent];
      id v15 = [NSString stringWithUTF8String:"-[PLAccountingEngine reload]_block_invoke_2"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1212];

      int v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  [*(id *)(a1 + 32) reloadLastPowerEventsWithLastDeviceBootDate:v9];
  [*(id *)(a1 + 32) reloadLastDistributionEventsWithLastDeviceBootDate:v9];
  [*(id *)(a1 + 32) reloadLastQualificationEventsWithLastDeviceBootDate:v9];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __28__PLAccountingEngine_reload__block_invoke_633;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = v17;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce_631 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce_631, v24);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled_632)
    {
      id v18 = [NSString stringWithFormat:@"end"];
      uint64_t v19 = (void *)MEMORY[0x263F5F638];
      id v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      int v21 = [v20 lastPathComponent];
      id v22 = [NSString stringWithUTF8String:"-[PLAccountingEngine reload]_block_invoke_2"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1219];

      id v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

uint64_t __28__PLAccountingEngine_reload__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled = result;
  return result;
}

uint64_t __28__PLAccountingEngine_reload__block_invoke_626(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled_625 = result;
  return result;
}

uint64_t __28__PLAccountingEngine_reload__block_invoke_633(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled_632 = result;
  return result;
}

- (void)reloadLastPowerEventsWithLastDeviceBootDate:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  unint64_t v4 = 0x263F5F000uLL;
  if (objc_msgSend(MEMORY[0x263F5F640], "debugEnabled", a3))
  {
    uint64_t v5 = objc_opt_class();
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = v5;
    if (reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce != -1) {
      dispatch_once(&reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce, v49);
    }
    if (reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"begin"];
      id v7 = (void *)MEMORY[0x263F5F638];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastPowerEventsWithLastDeviceBootDate:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1224];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v12 = [MEMORY[0x263F5F698] sharedCore];
  id v13 = [v12 launchDate];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [(id)objc_opt_class() deviceRootNodeIDs];
  uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v46;
    uint64_t v40 = *(void *)v46;
    do
    {
      uint64_t v17 = 0;
      uint64_t v41 = v15;
      do
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
        if ([*(id *)(v4 + 1600) debugEnabled])
        {
          uint64_t v19 = objc_opt_class();
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke_639;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v19;
          if (reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce_637 != -1) {
            dispatch_once(&reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce_637, block);
          }
          if (reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled_638)
          {
            id v20 = v13;
            int v21 = self;
            unint64_t v22 = v4;
            id v23 = [NSString stringWithFormat:@"rootNodeIDNumber=%@", v18];
            v24 = (void *)MEMORY[0x263F5F638];
            double v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
            uint64_t v26 = [v25 lastPathComponent];
            uint64_t v27 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastPowerEventsWithLastDeviceBootDate:]"];
            [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:1228];

            uint64_t v28 = PLLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v51 = v23;
              _os_log_debug_impl(&dword_2267F1000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v4 = v22;
            self = v21;
            id v13 = v20;
            uint64_t v16 = v40;
            uint64_t v15 = v41;
          }
        }
        uint64_t v29 = [v18 intValue];
        uint64_t v30 = [&unk_26DA69F58 objectAtIndexedSubscript:(int)v29];
        int v31 = [v30 intValue];

        switch(v31)
        {
          case 3:
            uint64_t v32 = [MEMORY[0x263EFF910] distantPast];
            [(PLAccountingEngine *)self createPowerEventIntervalWithRootNodeID:v29 withPower:v32 withStartDate:v13 withEndDate:0.0];

            break;
          case 2:
            [(PLAccountingEngine *)self createPowerEventBackwardWithRootNodeID:v29 withPower:v13 withEndDate:0.0];
            break;
          case 1:
            [(PLAccountingEngine *)self createPowerEventForwardWithRootNodeID:v29 withPower:v13 withStartDate:0.0];
            break;
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v15);
  }

  if ([*(id *)(v4 + 1600) debugEnabled])
  {
    uint64_t v33 = objc_opt_class();
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke_645;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v33;
    if (reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce_643 != -1) {
      dispatch_once(&reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce_643, v43);
    }
    if (reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled_644)
    {
      uint64_t v34 = [NSString stringWithFormat:@"end"];
      double v35 = (void *)MEMORY[0x263F5F638];
      uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      v37 = [v36 lastPathComponent];
      uint64_t v38 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastPowerEventsWithLastDeviceBootDate:]"];
      [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:1250];

      uint64_t v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

uint64_t __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled = result;
  return result;
}

uint64_t __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke_639(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled_638 = result;
  return result;
}

uint64_t __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke_645(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled_644 = result;
  return result;
}

- (void)reloadLastDistributionEventsWithLastDeviceBootDate:(id)a3
{
  uint64_t v3 = self;
  uint64_t v65 = *MEMORY[0x263EF8340];
  if (objc_msgSend(MEMORY[0x263F5F640], "debugEnabled", a3))
  {
    uint64_t v4 = objc_opt_class();
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke;
    v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v60[4] = v4;
    if (reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce != -1) {
      dispatch_once(&reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce, v60);
    }
    if (reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"begin"];
      uint64_t v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastDistributionEventsWithLastDeviceBootDate:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1254];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      uint64_t v3 = self;
    }
  }
  id v11 = [MEMORY[0x263F5F698] sharedCore];
  long long v46 = [v11 launchDate];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  long long v56 = 0u;
  id obj = [(id)objc_opt_class() allDistributionIDs];
  uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v51)
  {
    uint64_t v49 = *MEMORY[0x263F5F7C0];
    uint64_t v50 = *(void *)v57;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v57 != v50) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v56 + 1) + 8 * v12);
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v14 = objc_opt_class();
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_648;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v14;
          if (reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_646 != -1) {
            dispatch_once(&reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_646, block);
          }
          if (reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_647)
          {
            uint64_t v15 = [NSString stringWithFormat:@"distributionIDNumber=%@", v13];
            uint64_t v16 = (void *)MEMORY[0x263F5F638];
            uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
            id v18 = [v17 lastPathComponent];
            uint64_t v19 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastDistributionEventsWithLastDeviceBootDate:]"];
            [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:1258];

            id v20 = PLLogCommon();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v15;
              _os_log_debug_impl(&dword_2267F1000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v3 = self;
          }
        }
        uint64_t v21 = [v13 intValue];
        unint64_t v22 = [&unk_26DA69F70 objectAtIndexedSubscript:(int)v21];
        int v23 = [v22 intValue];

        v24 = off_2647B4BE8;
        uint64_t v52 = v21;
        if (v23 == 1) {
          goto LABEL_23;
        }
        if ((v23 - 2) <= 2)
        {
          v24 = off_2647B5250[v23 - 2];
LABEL_23:
          double v25 = [(__objc2_class *)*v24 entryKey];
          goto LABEL_25;
        }
        double v25 = 0;
LABEL_25:
        uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F5F690]) initWithKey:v49 withValue:v13 withComparisonOperation:0];
        uint64_t v27 = [MEMORY[0x263F5F698] sharedCore];
        uint64_t v28 = [v27 storage];
        uint64_t v61 = v26;
        uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
        uint64_t v30 = [v28 lastEntryForKey:v25 withComparisons:v29 isSingleton:0];

        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v31 = objc_opt_class();
          v54[0] = MEMORY[0x263EF8330];
          v54[1] = 3221225472;
          v54[2] = __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_658;
          v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v54[4] = v31;
          if (reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_656 != -1) {
            dispatch_once(&reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_656, v54);
          }
          if (reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_657)
          {
            uint64_t v32 = [NSString stringWithFormat:@"lastDistributionEvent=%@", v30];
            uint64_t v33 = (void *)MEMORY[0x263F5F638];
            uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
            double v35 = [v34 lastPathComponent];
            uint64_t v36 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastDistributionEventsWithLastDeviceBootDate:]"];
            [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:1283];

            v37 = PLLogCommon();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v32;
              _os_log_debug_impl(&dword_2267F1000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v3 = self;
          }
        }
        if (v30)
        {
          if (v23 == 1) {
            [(PLAccountingEngine *)v3 addDistributionEventIntervalWithLastDistributionEventForward:0 withDistributionEventForward:v30];
          }
        }
        else
        {
          switch(v23)
          {
            case 1:
              [(PLAccountingEngine *)v3 createDistributionEventForwardWithDistributionID:v52 withChildNodeNameToWeight:MEMORY[0x263EFFA78] withStartDate:v46];
              break;
            case 4:
              [(PLAccountingEngine *)v3 createDistributionEventPointWithDistributionID:v52 withChildNodeNameToWeight:MEMORY[0x263EFFA78] withStartDate:v46];
              break;
            case 3:
              uint64_t v38 = [MEMORY[0x263EFF910] distantPast];
              [(PLAccountingEngine *)self createDistributionEventIntervalWithDistributionID:v52 withChildNodeNameToWeight:MEMORY[0x263EFFA78] withStartDate:v38 withEndDate:v46];

              uint64_t v3 = self;
              break;
            case 2:
              [(PLAccountingEngine *)v3 createDistributionEventBackwardWithDistributionID:v52 withChildNodeNameToWeight:MEMORY[0x263EFFA78] withEndDate:v46];
              break;
          }
        }

        ++v12;
      }
      while (v51 != v12);
      uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v51);
  }

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v39 = objc_opt_class();
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_664;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v39;
    if (reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_662 != -1) {
      dispatch_once(&reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_662, v53);
    }
    if (reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_663)
    {
      uint64_t v40 = [NSString stringWithFormat:@"end"];
      uint64_t v41 = (void *)MEMORY[0x263F5F638];
      uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      uint64_t v43 = [v42 lastPathComponent];
      v44 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastDistributionEventsWithLastDeviceBootDate:]"];
      [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:1315];

      long long v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

uint64_t __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled = result;
  return result;
}

uint64_t __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_648(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_647 = result;
  return result;
}

uint64_t __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_658(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_657 = result;
  return result;
}

uint64_t __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_664(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_663 = result;
  return result;
}

- (void)reloadLastQualificationEventsWithLastDeviceBootDate:(id)a3
{
  uint64_t v3 = self;
  uint64_t v65 = *MEMORY[0x263EF8340];
  if (objc_msgSend(MEMORY[0x263F5F640], "debugEnabled", a3))
  {
    uint64_t v4 = objc_opt_class();
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke;
    v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v60[4] = v4;
    if (reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce != -1) {
      dispatch_once(&reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce, v60);
    }
    if (reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"begin"];
      uint64_t v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastQualificationEventsWithLastDeviceBootDate:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1319];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      uint64_t v3 = self;
    }
  }
  id v11 = [MEMORY[0x263F5F698] sharedCore];
  long long v46 = [v11 launchDate];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  long long v56 = 0u;
  id obj = [(id)objc_opt_class() allQualificationIDs];
  uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v51)
  {
    uint64_t v49 = *MEMORY[0x263F5F808];
    uint64_t v50 = *(void *)v57;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v57 != v50) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v56 + 1) + 8 * v12);
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v14 = objc_opt_class();
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_667;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v14;
          if (reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_665 != -1) {
            dispatch_once(&reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_665, block);
          }
          if (reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_666)
          {
            uint64_t v15 = [NSString stringWithFormat:@"qualificationIDNumber=%@", v13];
            uint64_t v16 = (void *)MEMORY[0x263F5F638];
            uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
            id v18 = [v17 lastPathComponent];
            uint64_t v19 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastQualificationEventsWithLastDeviceBootDate:]"];
            [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:1323];

            id v20 = PLLogCommon();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v15;
              _os_log_debug_impl(&dword_2267F1000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v3 = self;
          }
        }
        uint64_t v21 = [v13 intValue];
        unint64_t v22 = [&unk_26DA69F88 objectAtIndexedSubscript:(int)v21];
        int v23 = [v22 intValue];

        v24 = off_2647B4C78;
        uint64_t v52 = v21;
        if (v23 == 1) {
          goto LABEL_23;
        }
        if ((v23 - 2) <= 2)
        {
          v24 = off_2647B5268[v23 - 2];
LABEL_23:
          double v25 = [(__objc2_class *)*v24 entryKey];
          goto LABEL_25;
        }
        double v25 = 0;
LABEL_25:
        uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F5F690]) initWithKey:v49 withValue:v13 withComparisonOperation:0];
        uint64_t v27 = [MEMORY[0x263F5F698] sharedCore];
        uint64_t v28 = [v27 storage];
        uint64_t v61 = v26;
        uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
        uint64_t v30 = [v28 lastEntryForKey:v25 withComparisons:v29 isSingleton:0];

        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v31 = objc_opt_class();
          v54[0] = MEMORY[0x263EF8330];
          v54[1] = 3221225472;
          v54[2] = __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_676;
          v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v54[4] = v31;
          if (reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_674 != -1) {
            dispatch_once(&reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_674, v54);
          }
          if (reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_675)
          {
            uint64_t v32 = [NSString stringWithFormat:@"lastQualificationEvent=%@", v30];
            uint64_t v33 = (void *)MEMORY[0x263F5F638];
            uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
            double v35 = [v34 lastPathComponent];
            uint64_t v36 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastQualificationEventsWithLastDeviceBootDate:]"];
            [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:1348];

            v37 = PLLogCommon();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v32;
              _os_log_debug_impl(&dword_2267F1000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v3 = self;
          }
        }
        if (v30)
        {
          if (v23 == 1) {
            [(PLAccountingEngine *)v3 addQualificationEventIntervalWithLastQualificationEventForward:0 withQualificationEventForward:v30];
          }
        }
        else
        {
          switch(v23)
          {
            case 1:
              [(PLAccountingEngine *)v3 createQualificationEventForwardWithQualificationID:v52 withChildNodeNames:MEMORY[0x263EFFA68] withStartDate:v46];
              break;
            case 4:
              [(PLAccountingEngine *)v3 createQualificationEventPointWithQualificationID:v52 withChildNodeNames:MEMORY[0x263EFFA68] withStartDate:v46];
              break;
            case 3:
              uint64_t v38 = [MEMORY[0x263EFF910] distantPast];
              [(PLAccountingEngine *)self createQualificationEventIntervalWithQualificationID:v52 withChildNodeNames:MEMORY[0x263EFFA68] withStartDate:v38 withEndDate:v46];

              uint64_t v3 = self;
              break;
            case 2:
              [(PLAccountingEngine *)v3 createQualificationEventBackwardWithQualificationID:v52 withChildNodeNames:MEMORY[0x263EFFA68] withEndDate:v46];
              break;
          }
        }

        ++v12;
      }
      while (v51 != v12);
      uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v51);
  }

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v39 = objc_opt_class();
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_682;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v39;
    if (reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_680 != -1) {
      dispatch_once(&reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_680, v53);
    }
    if (reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_681)
    {
      uint64_t v40 = [NSString stringWithFormat:@"end"];
      uint64_t v41 = (void *)MEMORY[0x263F5F638];
      uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      uint64_t v43 = [v42 lastPathComponent];
      v44 = [NSString stringWithUTF8String:"-[PLAccountingEngine reloadLastQualificationEventsWithLastDeviceBootDate:]"];
      [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:1380];

      long long v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
}

uint64_t __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_667(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_666 = result;
  return result;
}

uint64_t __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_676(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_675 = result;
  return result;
}

uint64_t __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_682(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_681 = result;
  return result;
}

uint64_t __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled = result;
  return result;
}

uint64_t __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke_685(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled_684 = result;
  return result;
}

uint64_t __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke_691(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled_690 = result;
  return result;
}

+ (void)clearWithEntryKey:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__PLAccountingEngine_clearWithEntryKey___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (clearWithEntryKey__defaultOnce != -1) {
      dispatch_once(&clearWithEntryKey__defaultOnce, block);
    }
    if (clearWithEntryKey__classDebugEnabled)
    {
      uint64_t v5 = [NSString stringWithFormat:@"entryKey=%@", v3];
      uint64_t v6 = (void *)MEMORY[0x263F5F638];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m"];
      id v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"+[PLAccountingEngine clearWithEntryKey:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1409];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  id v11 = [NSString stringWithFormat:@"DELETE FROM '%@';", v3];
  uint64_t v12 = [MEMORY[0x263F5F698] sharedCore];
  id v13 = [v12 storage];
  uint64_t v14 = [v13 connection];
  id v15 = (id)[v14 performQuery:v11];

  if ([MEMORY[0x263F5F650] hasDynamicKeysForEntryKey:v3])
  {
    uint64_t v16 = [NSString stringWithFormat:@"DELETE FROM '%@_%@';", v3, *MEMORY[0x263F5F890]];

    uint64_t v17 = [MEMORY[0x263F5F698] sharedCore];
    id v18 = [v17 storage];
    uint64_t v19 = [v18 connection];
    id v20 = (id)[v19 performQuery:v16];

    id v11 = (void *)v16;
  }
}

uint64_t __40__PLAccountingEngine_clearWithEntryKey___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  clearWithEntryKey__classDebugEnabled = result;
  return result;
}

+ (id)normalizeWeights:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3 || ![v3 count])
  {
    id v25 = v4;
LABEL_25:
    uint64_t v14 = v25;
    goto LABEL_26;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v6)
  {

LABEL_24:
    id v25 = v5;
    goto LABEL_25;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v32;
  double v9 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(v5);
      }
      id v11 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      [v11 doubleValue];
      double v9 = v9 + v12;
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  }
  while (v7);

  if (v9 <= 0.0 || v9 == 1.0) {
    goto LABEL_24;
  }
  uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        uint64_t v21 = NSNumber;
        unint64_t v22 = objc_msgSend(v15, "objectForKeyedSubscript:", v20, (void)v27);
        [v22 doubleValue];
        v24 = [v21 numberWithDouble:v23 / v9];
        [v14 setObject:v24 forKeyedSubscript:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v17);
  }

LABEL_26:
  return v14;
}

- (void)setWorkQueue:(id)a3
{
}

- (PLActivity)chunkActivity
{
  return (PLActivity *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChunkActivity:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryListener:(id)a3
{
}

- (BOOL)pluggedIn
{
  return self->_pluggedIn;
}

- (void)setPluggedIn:(BOOL)a3
{
  self->_pluggedIn = a3;
}

- (void)setDistributionManager:(id)a3
{
}

- (void)setCorrectionManager:(id)a3
{
}

- (void)setQualificationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualificationManager, 0);
  objc_storeStrong((id *)&self->_correctionManager, 0);
  objc_storeStrong((id *)&self->_distributionManager, 0);
  objc_storeStrong((id *)&self->_batteryListener, 0);
  objc_storeStrong((id *)&self->_chunkActivity, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end