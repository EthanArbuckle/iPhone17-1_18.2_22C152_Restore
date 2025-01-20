@interface PLDuetServiceSimple
- (BOOL)isCharging;
- (NSMutableDictionary)bundleIDToState;
- (PLDuetServiceSimple)init;
- (PLEntryNotificationOperatorComposition)chargingListener;
- (PLXPCListenerOperatorComposition)resetListener;
- (double)capUtilizationInSeconds:(double)a3 withUpperBoundInError:(double)a4 withCapInError:(double)a5 withCappedUpperBound:(double)a6;
- (double)numCPUSecondsForBundleID:(id)a3;
- (double)numCPUSecondsForPid:(int)a3;
- (id)didReceiveStopEventWithPayload:(id)a3;
- (void)didReceiveReset;
- (void)didReceiveStartEventWithPayload:(id)a3;
- (void)initOperatorDependancies:(id)a3;
- (void)setBundleIDToState:(id)a3;
- (void)setChargingListener:(id)a3;
- (void)setIsCharging:(BOOL)a3;
- (void)setResetListener:(id)a3;
@end

@implementation PLDuetServiceSimple

- (PLDuetServiceSimple)init
{
  v4.receiver = self;
  v4.super_class = (Class)PLDuetServiceSimple;
  v2 = [(PLDuetServiceSimple *)&v4 init];
  [(PLDuetServiceImpl *)v2 setDuetService:0];
  return v2;
}

- (void)initOperatorDependancies:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(PLDuetServiceImpl *)self setDuetService:v4];
    id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke;
    v45[3] = &unk_1E6E47740;
    v45[4] = self;
    v6 = (void *)[v5 initWithOperator:v4 withRegistration:&unk_1F400F538 withBlock:v45];
    [(PLDuetServiceImpl *)self setEventListener:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F92AA8]);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_2;
    v44[3] = &unk_1E6E47958;
    v44[4] = self;
    v8 = (void *)[v7 initWithOperator:v4 withRegistration:&unk_1F400F560 withBlock:v44];
    [(PLDuetServiceImpl *)self setEnergyResponder:v8];

    id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_3;
    v43[3] = &unk_1E6E47740;
    v43[4] = self;
    v10 = (void *)[v9 initWithOperator:v4 withRegistration:&unk_1F400F588 withBlock:v43];
    [(PLDuetServiceSimple *)self setResetListener:v10];

    [(PLDuetServiceSimple *)self setIsCharging:0];
    id v11 = objc_alloc(MEMORY[0x1E4F929E8]);
    v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Battery"];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_4;
    v42[3] = &unk_1E6E47908;
    v42[4] = self;
    v13 = (void *)[v11 initWithOperator:v4 forEntryKey:v12 withBlock:v42];
    [(PLDuetServiceSimple *)self setChargingListener:v13];

    v14 = [(PLDuetServiceImpl *)self duetService];
    LODWORD(v12) = [v14 isDebugEnabled];

    if (v12)
    {
      v36 = self;
      uint64_t v15 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"ComplicationEvents"];
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"timestampEnd" withValue:&unk_1F400CA90 withComparisonOperation:6];
      v17 = [v4 storage];
      v47[0] = v16;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
      v35 = (void *)v15;
      v19 = [v17 entriesForKey:v15 withComparisons:v18];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v39 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            v26 = [v4 storage];
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_348;
            v37[3] = &unk_1E6E47848;
            v37[4] = v25;
            [v26 updateEntry:v25 withBlock:v37];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v22);
      }

      self = v36;
    }
    v27 = [(PLDuetServiceImpl *)self duetService];
    int v28 = [v27 isDebugEnabled];

    if (v28)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)testStartEvent, @"com.apple.powerlogd.PLDuetService.testStartEvent", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v30 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v30, self, (CFNotificationCallback)testStartEvent2, @"com.apple.powerlogd.PLDuetService.testStartEvent2", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v31 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v31, self, (CFNotificationCallback)testStopEvent, @"com.apple.powerlogd.PLDuetService.testStopEvent", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v32 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v32, self, (CFNotificationCallback)testStopEvent2, @"com.apple.powerlogd.PLDuetService.testStopEvent2", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v33 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v33, self, (CFNotificationCallback)testReset, @"com.apple.powerlogd.PLDuetService.testReset", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v34 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v34, self, (CFNotificationCallback)testCapping, @"com.apple.powerlogd.PLDuetService.testCapping", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
}

uint64_t __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveStartEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) didReceiveStopEventWithPayload:a5];
}

uint64_t __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didReceiveReset];
}

void __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = [a2 objectForKeyedSubscript:@"entry"];
  v3 = [v4 objectForKeyedSubscript:@"IsCharging"];
  objc_msgSend(*(id *)(a1 + 32), "setIsCharging:", objc_msgSend(v3, "BOOLValue"));
}

void __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_348(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"timestampEnd"];
}

- (void)didReceiveStartEventWithPayload:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke;
    v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v82[4] = v5;
    if (didReceiveStartEventWithPayload__defaultOnce != -1) {
      dispatch_once(&didReceiveStartEventWithPayload__defaultOnce, v82);
    }
    if (didReceiveStartEventWithPayload__classDebugEnabled)
    {
      v6 = [NSString stringWithFormat:@"payload=%@", v4];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      id v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStartEventWithPayload:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:800];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v12 = [v4 objectForKeyedSubscript:@"bundleID"];
  v13 = [v4 objectForKeyedSubscript:@"info"];
  v14 = [v13 objectForKeyedSubscript:@"pid"];
  uint64_t v15 = [v14 intValue];

  v16 = [(PLDuetServiceSimple *)self bundleIDToState];
  v72 = (void *)v12;
  v17 = [v16 objectForKeyedSubscript:v12];

  if (v17)
  {
    v18 = [(PLDuetServiceSimple *)self didReceiveStopEventWithPayload:v4];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_375;
      v81[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v81[4] = v19;
      if (didReceiveStartEventWithPayload__defaultOnce_373 != -1) {
        dispatch_once(&didReceiveStartEventWithPayload__defaultOnce_373, v81);
      }
      if (didReceiveStartEventWithPayload__classDebugEnabled_374)
      {
        id v20 = [NSString stringWithFormat:@"Second start arrived. Dropping energy on floor %@", v18];
        uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        uint64_t v23 = [v22 lastPathComponent];
        v24 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStartEventWithPayload:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:809];

        uint64_t v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
  v26 = objc_opt_new();
  v27 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v26 setStartDate:v27];

  if ((int)v15 < 1) {
    [(PLDuetServiceSimple *)self numCPUSecondsForBundleID:v12];
  }
  else {
    [(PLDuetServiceSimple *)self numCPUSecondsForPid:v15];
  }
  objc_msgSend(v26, "setCpuSeconds:");
  int v28 = [v4 objectForKeyedSubscript:@"info"];
  [v26 setInfo:v28];

  uint64_t v29 = [(PLDuetServiceImpl *)self duetService];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(PLDuetServiceImpl *)self duetService];
    int v32 = [v31 isDebugEnabled];

    if (v32)
    {
      v33 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"ComplicationEvents"];
      id v34 = objc_alloc(MEMORY[0x1E4F929D0]);
      v35 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      v36 = (void *)[v34 initWithEntryKey:v33 withDate:v35];

      [v36 setObject:v12 forKeyedSubscript:@"BundleID"];
      v37 = [v26 info];
      long long v38 = [v37 description];
      [v36 setObject:v38 forKeyedSubscript:@"Info"];

      long long v39 = (void *)MEMORY[0x1E4F28ED0];
      [v26 cpuSeconds];
      long long v40 = objc_msgSend(v39, "numberWithDouble:");
      [v36 setObject:v40 forKeyedSubscript:@"CPUSecondsStart"];

      long long v41 = [(PLDuetServiceImpl *)self duetService];

      if (v41)
      {
        v42 = [(PLDuetServiceImpl *)self duetService];
        [v42 logEntry:v36];
      }
    }
  }
  v71 = v4;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v43 = [(PLDuetServiceSimple *)self bundleIDToState];
  v44 = [v43 allValues];

  uint64_t v45 = [v44 countByEnumeratingWithState:&v77 objects:v85 count:16];
  v74 = v26;
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v78;
    v73 = v44;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v78 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v77 + 1) + 8 * v48);
        v50 = [v49 endDate];

        if (!v50)
        {
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v51 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_388;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v51;
            if (didReceiveStartEventWithPayload__defaultOnce_386 != -1) {
              dispatch_once(&didReceiveStartEventWithPayload__defaultOnce_386, block);
            }
            if (didReceiveStartEventWithPayload__classDebugEnabled_387)
            {
              v52 = self;
              v53 = [NSString stringWithFormat:@"state=%@", v49];
              v54 = (void *)MEMORY[0x1E4F929B8];
              v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
              v56 = [v55 lastPathComponent];
              v57 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStartEventWithPayload:]"];
              [v54 logMessage:v53 fromFile:v56 fromFunction:v57 fromLineNumber:833];

              v58 = PLLogCommon();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v84 = v53;
                _os_log_debug_impl(&dword_1E4220000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              self = v52;
              v44 = v73;
              v26 = v74;
            }
          }
          v59 = [v49 overlappingStates];
          [v59 addObject:v26];

          v60 = [v26 overlappingStates];
          [v60 addObject:v49];
        }
        ++v48;
      }
      while (v46 != v48);
      uint64_t v46 = [v44 countByEnumeratingWithState:&v77 objects:v85 count:16];
    }
    while (v46);
  }

  v61 = [(PLDuetServiceSimple *)self bundleIDToState];
  [v61 setObject:v26 forKeyedSubscript:v72];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v62 = objc_opt_class();
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_394;
    v75[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v75[4] = v62;
    if (didReceiveStartEventWithPayload__defaultOnce_392 != -1) {
      dispatch_once(&didReceiveStartEventWithPayload__defaultOnce_392, v75);
    }
    if (didReceiveStartEventWithPayload__classDebugEnabled_393)
    {
      v63 = NSString;
      v64 = [(PLDuetServiceSimple *)self bundleIDToState];
      v65 = [v63 stringWithFormat:@"bundleIDToState=%@", v64];

      v66 = (void *)MEMORY[0x1E4F929B8];
      v67 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      v68 = [v67 lastPathComponent];
      v69 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStartEventWithPayload:]"];
      [v66 logMessage:v65 fromFile:v68 fromFunction:v69 fromLineNumber:841];

      v70 = PLLogCommon();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStartEventWithPayload__classDebugEnabled = result;
  return result;
}

uint64_t __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_375(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStartEventWithPayload__classDebugEnabled_374 = result;
  return result;
}

uint64_t __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_388(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStartEventWithPayload__classDebugEnabled_387 = result;
  return result;
}

uint64_t __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_394(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStartEventWithPayload__classDebugEnabled_393 = result;
  return result;
}

- (id)didReceiveStopEventWithPayload:(id)a3
{
  uint64_t v220 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v213[0] = MEMORY[0x1E4F143A8];
    v213[1] = 3221225472;
    v213[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke;
    v213[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v213[4] = v5;
    v6 = v213;
    if (didReceiveStopEventWithPayload__defaultOnce != -1) {
      dispatch_once(&didReceiveStopEventWithPayload__defaultOnce, v6);
    }

    if (didReceiveStopEventWithPayload__classDebugEnabled)
    {
      id v7 = [NSString stringWithFormat:@"payload=%@", v4];
      v8 = (void *)MEMORY[0x1E4F929B8];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      v10 = [v9 lastPathComponent];
      id v11 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:863];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  uint64_t v13 = [v4 objectForKeyedSubscript:@"bundleID"];
  v183 = [v4 objectForKeyedSubscript:@"info"];
  v14 = [(PLDuetServiceSimple *)self bundleIDToState];
  v184 = (void *)v13;
  uint64_t v15 = [v14 objectForKeyedSubscript:v13];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v212[0] = MEMORY[0x1E4F143A8];
    v212[1] = 3221225472;
    v212[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_400;
    v212[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v212[4] = v16;
    v17 = v212;
    if (didReceiveStopEventWithPayload__defaultOnce_398 != -1) {
      dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_398, v17);
    }

    if (didReceiveStopEventWithPayload__classDebugEnabled_399)
    {
      v18 = [NSString stringWithFormat:@"state=%@", v15];
      uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
      id v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      uint64_t v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:868];

      uint64_t v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (v15)
  {
    v24 = [v15 info];
    uint64_t v25 = [v24 objectForKeyedSubscript:@"pid"];
    uint64_t v26 = [v25 intValue];

    v27 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v15 setEndDate:v27];

    if ((int)v26 < 1) {
      [(PLDuetServiceSimple *)self numCPUSecondsForBundleID:v184];
    }
    else {
      [(PLDuetServiceSimple *)self numCPUSecondsForPid:v26];
    }
    double v30 = v28;
    [v15 cpuSeconds];
    double v32 = v30 - v31;
    if (v32 >= 0.0) {
      double v33 = v32;
    }
    else {
      double v33 = 0.0;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v34 = objc_opt_class();
      v211[0] = MEMORY[0x1E4F143A8];
      v211[1] = 3221225472;
      v211[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_403;
      v211[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v211[4] = v34;
      v35 = v211;
      if (didReceiveStopEventWithPayload__defaultOnce_401 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_401, v35);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_402)
      {
        v36 = objc_msgSend(NSString, "stringWithFormat:", @"CPU duration=%f", *(void *)&v33);
        v37 = (void *)MEMORY[0x1E4F929B8];
        long long v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        long long v39 = [v38 lastPathComponent];
        long long v40 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:879];

        long long v41 = PLLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    [(PLDuetServiceSimple *)self capUtilizationInSeconds:v33 withUpperBoundInError:90.0 withCapInError:1.0 withCappedUpperBound:30.0];
    double v43 = v42;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v44 = objc_opt_class();
      v210[0] = MEMORY[0x1E4F143A8];
      v210[1] = 3221225472;
      v210[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_409;
      v210[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v210[4] = v44;
      uint64_t v45 = v210;
      if (didReceiveStopEventWithPayload__defaultOnce_407 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_407, v45);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_408)
      {
        uint64_t v46 = objc_msgSend(NSString, "stringWithFormat:", @"Capped CPU duration=%f", *(void *)&v43);
        uint64_t v47 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        v49 = [v48 lastPathComponent];
        v50 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:884];

        uint64_t v51 = PLLogCommon();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    double v52 = v43 * 0.0277777778;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v53 = objc_opt_class();
      v209[0] = MEMORY[0x1E4F143A8];
      v209[1] = 3221225472;
      v209[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_415;
      v209[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v209[4] = v53;
      v54 = v209;
      if (didReceiveStopEventWithPayload__defaultOnce_413 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_413, v54);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_414)
      {
        v55 = [NSString stringWithFormat:@"cpuSecondsEnd=%f, cpuEnergy=%f", *(void *)&v30, v43 * 0.0277777778];
        v56 = (void *)MEMORY[0x1E4F929B8];
        v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        v58 = [v57 lastPathComponent];
        v59 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:887];

        v60 = PLLogCommon();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    id v182 = v4;
    long long v207 = 0u;
    long long v208 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    id obj = [v15 overlappingStates];
    uint64_t v187 = [obj countByEnumeratingWithState:&v205 objects:v219 count:16];
    if (v187)
    {
      uint64_t v186 = *(void *)v206;
      double v61 = 0.0;
      uint64_t v62 = v15;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v206 != v186) {
            objc_enumerationMutation(obj);
          }
          v64 = *(void **)(*((void *)&v205 + 1) + 8 * v63);
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v65 = objc_opt_class();
            v204[0] = MEMORY[0x1E4F143A8];
            v204[1] = 3221225472;
            v204[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_421;
            v204[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v204[4] = v65;
            v66 = v204;
            if (didReceiveStopEventWithPayload__defaultOnce_419 != -1) {
              dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_419, v66);
            }

            if (didReceiveStopEventWithPayload__classDebugEnabled_420)
            {
              v67 = [NSString stringWithFormat:@"overlappingState=%@", v64];
              v68 = (void *)MEMORY[0x1E4F929B8];
              v69 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
              v70 = [v69 lastPathComponent];
              v71 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
              [v68 logMessage:v67 fromFile:v70 fromFunction:v71 fromLineNumber:893];

              v72 = PLLogCommon();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v218 = v67;
                _os_log_debug_impl(&dword_1E4220000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              uint64_t v15 = v62;
            }
          }
          v73 = [v64 startDate];
          v74 = [v15 startDate];
          v75 = [v73 laterDate:v74];

          v76 = [v64 endDate];
          if (v76)
          {
            id v77 = [v64 endDate];
            long long v78 = [v15 endDate];
            id v79 = [v77 earlierDate:v78];

            uint64_t v15 = v62;
          }
          else
          {
            id v77 = [v15 endDate];
            id v79 = v77;
          }

          [v79 timeIntervalSinceDate:v75];
          double v81 = v80;
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v82 = objc_opt_class();
            v203[0] = MEMORY[0x1E4F143A8];
            v203[1] = 3221225472;
            v203[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_427;
            v203[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v203[4] = v82;
            v83 = v203;
            if (didReceiveStopEventWithPayload__defaultOnce_425 != -1) {
              dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_425, v83);
            }

            if (didReceiveStopEventWithPayload__classDebugEnabled_426)
            {
              v84 = self;
              v85 = [NSString stringWithFormat:@"overlappingState=%@", v64];
              uint64_t v86 = (void *)MEMORY[0x1E4F929B8];
              v87 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
              v88 = [v87 lastPathComponent];
              v89 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
              [v86 logMessage:v85 fromFile:v88 fromFunction:v89 fromLineNumber:898];

              v90 = PLLogCommon();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v218 = v85;
                _os_log_debug_impl(&dword_1E4220000, v90, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              self = v84;
              uint64_t v15 = v62;
            }
          }
          double v61 = v61 + v81;

          ++v63;
        }
        while (v187 != v63);
        uint64_t v187 = [obj countByEnumeratingWithState:&v205 objects:v219 count:16];
      }
      while (v187);
    }
    else
    {
      double v61 = 0.0;
    }

    [v15 duration];
    double v92 = v91;
    id v4 = v182;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v93 = objc_opt_class();
      v202[0] = MEMORY[0x1E4F143A8];
      v202[1] = 3221225472;
      v202[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_430;
      v202[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v202[4] = v93;
      v94 = v202;
      if (didReceiveStopEventWithPayload__defaultOnce_428 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_428, v94);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_429)
      {
        v95 = objc_msgSend(NSString, "stringWithFormat:", @"SOC duration=%f", *(void *)&v92);
        v96 = (void *)MEMORY[0x1E4F929B8];
        v97 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        v98 = [v97 lastPathComponent];
        v99 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v96 logMessage:v95 fromFile:v98 fromFunction:v99 fromLineNumber:905];

        v100 = PLLogCommon();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    [(PLDuetServiceSimple *)self capUtilizationInSeconds:v92 withUpperBoundInError:90.0 withCapInError:10.0 withCappedUpperBound:30.0];
    double v102 = v101;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v103 = objc_opt_class();
      v201[0] = MEMORY[0x1E4F143A8];
      v201[1] = 3221225472;
      v201[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_436;
      v201[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v201[4] = v103;
      v104 = v201;
      if (didReceiveStopEventWithPayload__defaultOnce_434 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_434, v104);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_435)
      {
        v105 = objc_msgSend(NSString, "stringWithFormat:", @"Capped SOC duration=%f", *(void *)&v102);
        v106 = (void *)MEMORY[0x1E4F929B8];
        v107 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        v108 = [v107 lastPathComponent];
        v109 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v106 logMessage:v105 fromFile:v108 fromFunction:v109 fromLineNumber:910];

        v110 = PLLogCommon();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    double v111 = v102 * (v102 * 0.00833333333) / (v61 + v102);
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v112 = objc_opt_class();
      v200[0] = MEMORY[0x1E4F143A8];
      v200[1] = 3221225472;
      v200[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_442;
      v200[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v200[4] = v112;
      v113 = v200;
      if (didReceiveStopEventWithPayload__defaultOnce_440 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_440, v113);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_441)
      {
        v114 = objc_msgSend(NSString, "stringWithFormat:", @"socEnergy=%f", *(void *)&v111);
        v115 = (void *)MEMORY[0x1E4F929B8];
        v116 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        v117 = [v116 lastPathComponent];
        v118 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v115 logMessage:v114 fromFile:v117 fromFunction:v118 fromLineNumber:914];

        v119 = PLLogCommon();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    v120 = [v15 info];
    v121 = [v120 objectForKeyedSubscript:@"pushType"];
    if ([v121 isEqualToString:@"waking"]) {
      double v122 = 0.125;
    }
    else {
      double v122 = 0.0277777778;
    }

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v123 = objc_opt_class();
      v199[0] = MEMORY[0x1E4F143A8];
      v199[1] = 3221225472;
      v199[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_454;
      v199[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v199[4] = v123;
      v124 = v199;
      if (didReceiveStopEventWithPayload__defaultOnce_452 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_452, v124);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_453)
      {
        v125 = objc_msgSend(NSString, "stringWithFormat:", @"wakingNonWakingEnergy=%f", *(void *)&v122);
        v126 = (void *)MEMORY[0x1E4F929B8];
        v127 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        v128 = [v127 lastPathComponent];
        v129 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v126 logMessage:v125 fromFile:v128 fromFunction:v129 fromLineNumber:918];

        v130 = PLLogCommon();
        if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    v131 = [v183 objectForKeyedSubscript:@"cellDuration"];
    double v132 = (double)[v131 integerValue] / 1000.0;
    v133 = [v183 objectForKeyedSubscript:@"wifiDuration"];
    double v134 = (double)[v133 integerValue] / 1000.0 * 0.0611111111 + v132 * 0.222222222;
    v135 = [v183 objectForKeyedSubscript:@"btDuration"];
    double v136 = v134 + (double)[v135 integerValue] / 1000.0 * 0.0277777778;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v137 = objc_opt_class();
      v198[0] = MEMORY[0x1E4F143A8];
      v198[1] = 3221225472;
      v198[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_469;
      v198[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v198[4] = v137;
      v138 = v198;
      if (didReceiveStopEventWithPayload__defaultOnce_467 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_467, v138);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_468)
      {
        v139 = objc_msgSend(NSString, "stringWithFormat:", @"networkEnergy=%f", *(void *)&v136);
        v140 = (void *)MEMORY[0x1E4F929B8];
        v141 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        v142 = [v141 lastPathComponent];
        v143 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v140 logMessage:v139 fromFile:v142 fromFunction:v143 fromLineNumber:925];

        v144 = PLLogCommon();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    v145 = [(PLDuetServiceSimple *)self bundleIDToState];
    [v145 removeObjectForKey:v184];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v146 = objc_opt_class();
      v197[0] = MEMORY[0x1E4F143A8];
      v197[1] = 3221225472;
      v197[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_475;
      v197[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v197[4] = v146;
      v147 = v197;
      if (didReceiveStopEventWithPayload__defaultOnce_473 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_473, v147);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_474)
      {
        v148 = NSString;
        v149 = [(PLDuetServiceSimple *)self bundleIDToState];
        v150 = [v148 stringWithFormat:@"bundleIDToState=%@", v149];

        v151 = (void *)MEMORY[0x1E4F929B8];
        v152 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        v153 = [v152 lastPathComponent];
        v154 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v151 logMessage:v150 fromFile:v153 fromFunction:v154 fromLineNumber:929];

        v155 = PLLogCommon();
        if (os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    double v156 = 0.0;
    if (![(PLDuetServiceSimple *)self isCharging])
    {
      double v157 = v52 + v111 + v122 + v136;
      if (v157 < 0.0) {
        double v157 = 0.0;
      }
      if (v157 <= 1.4) {
        double v156 = v157;
      }
      else {
        double v156 = 1.4;
      }
    }
    uint64_t v158 = [(PLDuetServiceImpl *)self duetService];
    if (v158)
    {
      v159 = (void *)v158;
      v160 = [(PLDuetServiceImpl *)self duetService];
      int v161 = [v160 isDebugEnabled];

      if (v161)
      {
        v162 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"ComplicationEvents"];
        v163 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"BundleID" withValue:v184 withComparisonOperation:0];
        v164 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"timestampEnd" withValue:&unk_1F400CA90 withComparisonOperation:6];
        v165 = [(PLDuetServiceImpl *)self duetService];
        v166 = [v165 storage];
        v216[0] = v163;
        v216[1] = v164;
        v167 = [MEMORY[0x1E4F1C978] arrayWithObjects:v216 count:2];
        v168 = [v166 lastEntryForKey:v162 withComparisons:v167 isSingleton:0];

        v169 = [(PLDuetServiceImpl *)self duetService];
        v170 = [v169 storage];
        v189[0] = MEMORY[0x1E4F143A8];
        v189[1] = 3221225472;
        v189[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_476;
        v189[3] = &unk_1E6E48E90;
        id v171 = v168;
        id v190 = v171;
        double v191 = v30;
        double v192 = v52;
        double v193 = v111;
        double v194 = v122;
        double v195 = v136;
        double v196 = v156;
        [v170 updateEntry:v171 withBlock:v189];

        id v4 = v182;
      }
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v172 = objc_opt_class();
      v188[0] = MEMORY[0x1E4F143A8];
      v188[1] = 3221225472;
      v188[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_2;
      v188[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v188[4] = v172;
      v173 = v188;
      if (didReceiveStopEventWithPayload__defaultOnce_495 != -1) {
        dispatch_once(&didReceiveStopEventWithPayload__defaultOnce_495, v173);
      }

      if (didReceiveStopEventWithPayload__classDebugEnabled_496)
      {
        v174 = objc_msgSend(NSString, "stringWithFormat:", @"Returning Sum: %f", *(void *)&v156);
        v175 = (void *)MEMORY[0x1E4F929B8];
        v176 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        v177 = [v176 lastPathComponent];
        v178 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple didReceiveStopEventWithPayload:]"];
        [v175 logMessage:v174 fromFile:v177 fromFunction:v178 fromLineNumber:957];

        v179 = PLLogCommon();
        if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    v214 = @"energy";
    v180 = [MEMORY[0x1E4F28ED0] numberWithDouble:v156];
    v215 = v180;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_400(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_399 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_403(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_402 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_409(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_408 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_415(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_414 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_421(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_420 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_427(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_426 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_430(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_429 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_436(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_435 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_442(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_441 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_454(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_453 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_469(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_468 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_475(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_474 = result;
  return result;
}

void __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_476(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"timestampEnd"];

  v3 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"CPUSecondsEnd"];

  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"CPUEnergy"];

  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 56)];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"SOCEnergy"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 64)];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"WakingNonWakingEnergy"];

  id v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 72)];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"NetworkEnergy"];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 80)];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"EnergyReturned"];
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  didReceiveStopEventWithPayload__classDebugEnabled_496 = result;
  return result;
}

- (double)capUtilizationInSeconds:(double)a3 withUpperBoundInError:(double)a4 withCapInError:(double)a5 withCappedUpperBound:(double)a6
{
  if (a3 < a6) {
    a6 = a3;
  }
  if (a3 <= a4) {
    a5 = a6;
  }
  return fmax(a5, 0.0);
}

- (double)numCPUSecondsForPid:(int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  int v3 = proc_pid_rusage(a3, 1, (rusage_info_t *)&v5);
  double result = 0.0;
  if (!v3) {
    +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", (void)v6, 0.0);
  }
  return result;
}

- (double)numCPUSecondsForBundleID:(id)a3
{
  int v3 = (void *)MEMORY[0x1F4188790](self, a2, a3);
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = v4;
  id v46 = v5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke;
    v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v50[4] = v6;
    if (numCPUSecondsForBundleID__defaultOnce != -1) {
      dispatch_once(&numCPUSecondsForBundleID__defaultOnce, v50);
    }
    if (numCPUSecondsForBundleID__classDebugEnabled)
    {
      long long v7 = [NSString stringWithFormat:@"bundleID=%@", v5];
      long long v8 = (void *)MEMORY[0x1E4F929B8];
      long long v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
      long long v10 = [v9 lastPathComponent];
      long long v11 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple numCPUSecondsForBundleID:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:972];

      long long v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      id v5 = v46;
    }
  }
  long long v13 = [v3 duetService];

  if (v13)
  {
    memset(__b, 255, sizeof(__b));
    int v14 = proc_listpids(1u, 0, __b, 4096);
    if (v14 >= 1)
    {
      uint64_t v15 = v14;
      uint64_t v16 = (int *)__b;
      do
      {
        int v18 = *v16++;
        uint64_t v17 = v18;
        if (v18 >= 1)
        {
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v19 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_502;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v19;
            if (numCPUSecondsForBundleID__defaultOnce_500 != -1) {
              dispatch_once(&numCPUSecondsForBundleID__defaultOnce_500, block);
            }
            if (numCPUSecondsForBundleID__classDebugEnabled_501)
            {
              id v20 = objc_msgSend(NSString, "stringWithFormat:", @"pid=%i", v17);
              uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
              uint64_t v23 = [v22 lastPathComponent];
              v24 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple numCPUSecondsForBundleID:]"];
              [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:985];

              uint64_t v25 = PLLogCommon();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                int buffer = 138412290;
                double v52 = v20;
                _os_log_debug_impl(&dword_1E4220000, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buffer, 0xCu);
              }
            }
          }
          uint64_t v26 = [v3 duetService];
          v27 = [v26 storage];
          double v28 = [v27 processIDEntryForPid:v17];
          uint64_t v29 = [v28 objectForKeyedSubscript:@"BundleID"];

          if (!v29)
          {
            uint64_t v29 = +[PLUtilities bundleIDFromPid:v17];
            if (!v29)
            {
              if (proc_name(v17, &buffer, 0x40u) < 1)
              {
                uint64_t v29 = 0;
              }
              else
              {
                uint64_t v29 = [NSString stringWithUTF8String:&buffer];
              }
            }
          }
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v30 = objc_opt_class();
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_508;
            v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v48[4] = v30;
            if (numCPUSecondsForBundleID__defaultOnce_506 != -1) {
              dispatch_once(&numCPUSecondsForBundleID__defaultOnce_506, v48);
            }
            if (numCPUSecondsForBundleID__classDebugEnabled_507)
            {
              double v31 = [NSString stringWithFormat:@"pidBundleID=%@", v29];
              double v32 = (void *)MEMORY[0x1E4F929B8];
              double v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
              uint64_t v34 = [v33 lastPathComponent];
              v35 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple numCPUSecondsForBundleID:]"];
              [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:1000];

              v36 = PLLogCommon();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                int buffer = 138412290;
                double v52 = v31;
                _os_log_debug_impl(&dword_1E4220000, v36, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buffer, 0xCu);
              }

              id v5 = v46;
            }
          }
          if ([v29 isEqualToString:v5])
          {
            [v3 numCPUSecondsForPid:v17];
            double v37 = v44;
            goto LABEL_43;
          }
        }
        --v15;
      }
      while (v15);
    }
    double v37 = 0.0;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v38 = objc_opt_class();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_514;
      void v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v38;
      if (numCPUSecondsForBundleID__defaultOnce_512 != -1) {
        dispatch_once(&numCPUSecondsForBundleID__defaultOnce_512, v47);
      }
      if (numCPUSecondsForBundleID__classDebugEnabled_513)
      {
        uint64_t v29 = [NSString stringWithFormat:@"could not find matching pid"];
        long long v39 = (void *)MEMORY[0x1E4F929B8];
        long long v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m"];
        long long v41 = [v40 lastPathComponent];
        double v42 = [NSString stringWithUTF8String:"-[PLDuetServiceSimple numCPUSecondsForBundleID:]"];
        [v39 logMessage:v29 fromFile:v41 fromFunction:v42 fromLineNumber:1007];

        double v43 = PLLogCommon();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

        id v5 = v46;
LABEL_43:
      }
    }
  }
  else
  {
    double v37 = 0.0;
  }

  return v37;
}

uint64_t __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  numCPUSecondsForBundleID__classDebugEnabled = result;
  return result;
}

uint64_t __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_502(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  numCPUSecondsForBundleID__classDebugEnabled_501 = result;
  return result;
}

uint64_t __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_508(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  numCPUSecondsForBundleID__classDebugEnabled_507 = result;
  return result;
}

uint64_t __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_514(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  numCPUSecondsForBundleID__classDebugEnabled_513 = result;
  return result;
}

- (void)didReceiveReset
{
  id v2 = [(PLDuetServiceSimple *)self bundleIDToState];
  [v2 removeAllObjects];
}

- (NSMutableDictionary)bundleIDToState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleIDToState:(id)a3
{
}

- (PLXPCListenerOperatorComposition)resetListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResetListener:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)chargingListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChargingListener:(id)a3
{
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  self->_isCharging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingListener, 0);
  objc_storeStrong((id *)&self->_resetListener, 0);
  objc_storeStrong((id *)&self->_bundleIDToState, 0);
}

@end