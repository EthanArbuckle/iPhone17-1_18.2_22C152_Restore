@interface PLSmartPLService
+ (id)defaults;
+ (id)entryEventPointDefinitionSample;
+ (id)entryEventPointDefinitionSmartTrigger;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (NSMutableDictionary)smartPLHelpers;
- (PLSmartPLService)init;
- (void)initOperatorDependancies;
- (void)logEventPointHeap;
- (void)logEventPointSample;
- (void)logEventPointSampleForProcessName:(id)a3;
- (void)logEventPointSmartPLFiredFromAuxilary:(Class)a3 withReason:(id)a4;
- (void)logEventPointStackShot;
- (void)logEventPointStackShotWithReason:(id)a3;
- (void)logEventPointVMMap;
- (void)setSmartPLHelpers:(id)a3;
@end

@implementation PLSmartPLService

+ (id)defaults
{
  return &unk_26E546AA0;
}

+ (id)entryEventPointDefinitions
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"SmartTrigger";
  v3 = [a1 entryEventPointDefinitionSmartTrigger];
  v7[1] = @"Sample";
  v8[0] = v3;
  v4 = [a1 entryEventPointDefinitionSample];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventPointDefinitionSmartTrigger
{
  v16[2] = *MEMORY[0x263EF8340];
  v15[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F838];
  v13[0] = *MEMORY[0x263F5F880];
  v13[1] = v2;
  v14[0] = &unk_26E546620;
  v14[1] = MEMORY[0x263EFFA88];
  v13[2] = *MEMORY[0x263F5F878];
  v14[2] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x263F5F870];
  v11[0] = @"Helper";
  v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"Reason";
  v12[0] = v5;
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v12[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionSample
{
  v17[2] = *MEMORY[0x263EF8340];
  v16[0] = *MEMORY[0x263F5F858];
  uint64_t v14 = *MEMORY[0x263F5F880];
  v15 = &unk_26E546620;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x263F5F870];
  v12[0] = @"PID";
  v3 = [MEMORY[0x263F5F650] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"ProcessName";
  v5 = [MEMORY[0x263F5F650] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v13[1] = v6;
  void v12[2] = @"Sample";
  v7 = [MEMORY[0x263F5F650] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v13[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSmartPLService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLSmartPLService)init
{
  if ([MEMORY[0x263F5F668] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLSmartPLService;
    v4 = [(PLOperator *)&v8 init];
    if (v4)
    {
      uint64_t v5 = objc_opt_new();
      smartPLHelpers = v4->_smartPLHelpers;
      v4->_smartPLHelpers = (NSMutableDictionary *)v5;
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v10 = (id)objc_opt_new();
  [v10 startWithOperator:self];
  v3 = [(PLSmartPLService *)self smartPLHelpers];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v3 setObject:v10 forKeyedSubscript:v5];

  if ([MEMORY[0x263F5F640] BOOLForKey:@"MemoryTrackingEnabled" ifNotSet:0])
  {
    v6 = objc_opt_new();
    [v6 startWithOperator:self];
    v7 = [(PLSmartPLService *)self smartPLHelpers];
    objc_super v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 setObject:v6 forKeyedSubscript:v9];
  }
}

- (void)logEventPointSmartPLFiredFromAuxilary:(Class)a3 withReason:(id)a4
{
  uint64_t v6 = *MEMORY[0x263F5F8B8];
  id v7 = a4;
  id v10 = +[PLOperator entryKeyForType:v6 andName:@"SmartTrigger"];
  objc_super v8 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v10];
  v9 = NSStringFromClass(a3);
  [v8 setObject:v9 forKeyedSubscript:@"Helper"];

  [v8 setObject:v7 forKeyedSubscript:@"Resason"];
  [(PLOperator *)self logEntry:v8];
}

- (void)logEventPointHeap
{
  [(PLSmartPLService *)self logEventPointHeapForProcessName:@"PerfPowerServicesExtended"];

  [(PLSmartPLService *)self logEventPointHeapForProcessName:@"aggregated"];
}

- (void)logEventPointVMMap
{
  [(PLSmartPLService *)self logEventPointVMMapForProcessName:@"PerfPowerServicesExtended"];

  [(PLSmartPLService *)self logEventPointVMMapForProcessName:@"aggregated"];
}

- (void)logEventPointStackShot
{
}

- (void)logEventPointStackShotWithReason:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__PLSmartPLService_logEventPointStackShotWithReason___block_invoke;
  v9[3] = &unk_264B99EB0;
  v9[4] = self;
  if (logEventPointStackShotWithReason__defaultOnce != -1) {
    dispatch_once(&logEventPointStackShotWithReason__defaultOnce, v9);
  }
  uint64_t v5 = logEventPointStackShotWithReason__objectForKey;
  if (logEventPointStackShotWithReason__objectForKey >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = [NSString stringWithFormat:@"Powerlog: %@ %d of %ld", v4, v6, v5];
      WriteStackshotReport_async();

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__PLSmartPLService_logEventPointStackShotWithReason___block_invoke_2;
      block[3] = &unk_264B99EB0;
      block[4] = self;
      if (logEventPointStackShotWithReason__defaultOnce_79 != -1) {
        dispatch_once(&logEventPointStackShotWithReason__defaultOnce_79, block);
      }
      sleep(logEventPointStackShotWithReason__objectForKey_80);
      ++v6;
    }
    while (v5 != v6);
  }
}

uint64_t __53__PLSmartPLService_logEventPointStackShotWithReason___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"StackShotCount"];
  logEventPointStackShotWithReason__objectForKey = result;
  return result;
}

uint64_t __53__PLSmartPLService_logEventPointStackShotWithReason___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"StackShotDelay"];
  logEventPointStackShotWithReason__objectForKey_80 = result;
  return result;
}

- (void)logEventPointSample
{
  [(PLSmartPLService *)self logEventPointSampleForProcessName:@"PerfPowerServicesExtended"];

  [(PLSmartPLService *)self logEventPointSampleForProcessName:@"aggregated"];
}

- (void)logEventPointSampleForProcessName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FC4D20]();
  uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F8B8] andName:@"Sample"];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v6];
  [v7 setObject:v4 forKeyedSubscript:@"ProcessName"];
  uint64_t v8 = pidFromHint();
  v9 = [NSNumber numberWithInt:v8];
  [v7 setObject:v9 forKeyedSubscript:@"PID"];

  unint64_t v10 = 0x263F5F000uLL;
  int v11 = [MEMORY[0x263F5F640] debugEnabled];
  if ((int)v8 < 2)
  {
    if (v11)
    {
      uint64_t v22 = objc_opt_class();
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_102;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v22;
      if (logEventPointSampleForProcessName__defaultOnce_100 != -1) {
        dispatch_once(&logEventPointSampleForProcessName__defaultOnce_100, v46);
      }
      if (logEventPointSampleForProcessName__classDebugEnabled_101)
      {
        v23 = [NSString stringWithFormat:@"invalid pid (%d) for %@ no sample for you!", v8, v4];
        v24 = (void *)MEMORY[0x263F5F638];
        v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLSmartPLService.m"];
        v26 = [v25 lastPathComponent];
        v27 = [NSString stringWithUTF8String:"-[PLSmartPLService logEventPointSampleForProcessName:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:174];

        v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }

        unint64_t v10 = 0x263F5F000;
      }
    }
    [v7 setObject:@"invalid PID" forKeyedSubscript:@"Sample"];
  }
  else
  {
    if (v11)
    {
      uint64_t v12 = objc_opt_class();
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v12;
      if (logEventPointSampleForProcessName__defaultOnce != -1) {
        dispatch_once(&logEventPointSampleForProcessName__defaultOnce, v50);
      }
      if (logEventPointSampleForProcessName__classDebugEnabled)
      {
        v43 = v5;
        v13 = [NSString stringWithFormat:@"generating sample for %@(%d)", v4, v8];
        uint64_t v14 = (void *)MEMORY[0x263F5F638];
        v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLSmartPLService.m"];
        v16 = [v15 lastPathComponent];
        v17 = [NSString stringWithUTF8String:"-[PLSmartPLService logEventPointSampleForProcessName:]"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:163];

        v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }

        uint64_t v5 = v43;
        unint64_t v10 = 0x263F5F000uLL;
      }
    }
    v19 = (void *)[objc_alloc(MEMORY[0x263F7C040]) initWithPID:v8 options:17];
    if (v19)
    {
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_89;
      v49[3] = &unk_264B99EB0;
      v49[4] = self;
      if (logEventPointSampleForProcessName__defaultOnce_88 != -1) {
        dispatch_once(&logEventPointSampleForProcessName__defaultOnce_88, v49);
      }
      uint64_t v20 = logEventPointSampleForProcessName__objectForKey;
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_2;
      v48[3] = &unk_264B99EB0;
      v48[4] = self;
      if (logEventPointSampleForProcessName__defaultOnce_90 != -1) {
        dispatch_once(&logEventPointSampleForProcessName__defaultOnce_90, v48);
      }
      [v19 sampleForDuration:v20 interval:logEventPointSampleForProcessName__objectForKey_91];
      [v19 stopSampling];
      v21 = [v19 outputString];
      [v7 setObject:v21 forKeyedSubscript:@"Sample"];
    }
    else
    {
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v29 = objc_opt_class();
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_3;
        v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v47[4] = v29;
        if (logEventPointSampleForProcessName__defaultOnce_92 != -1) {
          dispatch_once(&logEventPointSampleForProcessName__defaultOnce_92, v47);
        }
        if (logEventPointSampleForProcessName__classDebugEnabled_93)
        {
          v44 = v5;
          v30 = [NSString stringWithFormat:@"no sampler inited for %@(%d)", v4, v8];
          v31 = (void *)MEMORY[0x263F5F638];
          v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLSmartPLService.m"];
          v33 = [v32 lastPathComponent];
          v34 = [NSString stringWithUTF8String:"-[PLSmartPLService logEventPointSampleForProcessName:]"];
          [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:170];

          v35 = PLLogCommon();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }

          uint64_t v5 = v44;
          unint64_t v10 = 0x263F5F000uLL;
        }
      }
      [v7 setObject:@"Error, no sampler inited", @"Sample" forKeyedSubscript];
    }
  }
  [(PLOperator *)self logEntry:v7];
  if ([*(id *)(v10 + 1600) debugEnabled])
  {
    uint64_t v36 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_111;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v36;
    if (logEventPointSampleForProcessName__defaultOnce_109 != -1) {
      dispatch_once(&logEventPointSampleForProcessName__defaultOnce_109, block);
    }
    if (logEventPointSampleForProcessName__classDebugEnabled_110)
    {
      v37 = [NSString stringWithFormat:@"Logged!"];
      v38 = (void *)MEMORY[0x263F5F638];
      v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLSmartPLService.m"];
      v40 = [v39 lastPathComponent];
      v41 = [NSString stringWithUTF8String:"-[PLSmartPLService logEventPointSampleForProcessName:]"];
      [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:179];

      v42 = PLLogCommon();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointSampleForProcessName__classDebugEnabled = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_89(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"SampleDuration"];
  logEventPointSampleForProcessName__objectForKey = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"SampleInterval"];
  logEventPointSampleForProcessName__objectForKey_91 = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointSampleForProcessName__classDebugEnabled_93 = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_102(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointSampleForProcessName__classDebugEnabled_101 = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_111(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointSampleForProcessName__classDebugEnabled_110 = result;
  return result;
}

- (NSMutableDictionary)smartPLHelpers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSmartPLHelpers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end