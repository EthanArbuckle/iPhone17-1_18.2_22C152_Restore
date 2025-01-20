@interface PLBLMDebugService
+ (BOOL)isModelTriggerRun;
+ (id)entryEventNoneDefinitionBLMDebug;
+ (id)entryEventNoneDefinitions;
+ (void)load;
- (NSMutableDictionary)triggers;
- (PLBLMDebugService)init;
- (PLEntryNotificationOperatorComposition)bbCallback;
- (PLEntryNotificationOperatorComposition)btCallback;
- (PLEntryNotificationOperatorComposition)displayAPLCallback;
- (PLEntryNotificationOperatorComposition)ioreportCallback;
- (PLEntryNotificationOperatorComposition)processnetworkCallback;
- (PLEntryNotificationOperatorComposition)wifiCallback;
- (PLTimer)debugTimers;
- (PLXPCListenerOperatorComposition)xpcListenerBLMDebugTrigger;
- (double)energyForRootNodeID:(int)a3 withRange:(_PLTimeIntervalRange)a4;
- (id)Testservice:(id)a3;
- (id)logRailData:(int)a3 withTriggerName:(id)a4 inTimeRange:(_PLTimeIntervalRange)a5;
- (id)respondBLMDDebugQuery:(id)a3;
- (void)debugTrigger;
- (void)initOperatorDependancies;
- (void)registerTrigger:(id)a3;
- (void)setBbCallback:(id)a3;
- (void)setBtCallback:(id)a3;
- (void)setDebugTimers:(id)a3;
- (void)setDisplayAPLCallback:(id)a3;
- (void)setIoreportCallback:(id)a3;
- (void)setProcessnetworkCallback:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWifiCallback:(id)a3;
- (void)setXpcListenerBLMDebugTrigger:(id)a3;
- (void)triggerLoggersNow:(id)a3;
- (void)triggerSelectorAtDate:(id)a3 withSelector:(SEL)a4 withUseInfo:(id)a5;
@end

@implementation PLBLMDebugService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBLMDebugService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"BLMQADebug";
  objc_super v2 = [a1 entryEventNoneDefinitionBLMDebug];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventNoneDefinitionBLMDebug
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v26 = *MEMORY[0x1E4F92CD0];
  v27 = &unk_1F29F0B60;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"trigger_name";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v25[0] = v21;
  v24[1] = @"trigger_start_time";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_DateFormat");
  v25[1] = v19;
  v24[2] = @"trigger_stop_time";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_DateFormat");
  v25[2] = v17;
  v24[3] = @"trigger_start_time_monotonic";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  v25[3] = v15;
  v24[4] = @"trigger_stop_time_monotonic";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_DateFormat");
  v25[4] = v13;
  v24[5] = @"trigger_diff_time";
  objc_super v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_RealFormat");
  v25[5] = v3;
  v24[6] = @"rootnodeid";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v25[6] = v5;
  v24[7] = @"railpower";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
  v25[7] = v7;
  v24[8] = @"SafeTime";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
  v25[8] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:9];
  v29[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v11;
}

+ (BOOL)isModelTriggerRun
{
  if (qword_1EBD589F0 != -1) {
    dispatch_once(&qword_1EBD589F0, &__block_literal_global_31);
  }
  return _MergedGlobals_1_34;
}

uint64_t __38__PLBLMDebugService_isModelTriggerRun__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F929C0] BOOLForKey:@"ModelTrigger"];
  _MergedGlobals_1_34 = result;
  return result;
}

- (PLBLMDebugService)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0
    && [MEMORY[0x1E4F92A38] internalBuild]
    && (([MEMORY[0x1E4F929C0] isDevBoard] & 1) != 0
     || ([MEMORY[0x1E4F929C0] debugEnabled] & 1) != 0
     || +[PLBLMDebugService isModelTriggerRun]))
  {
    v16.receiver = self;
    v16.super_class = (Class)PLBLMDebugService;
    v3 = [(PLOperator *)&v16 init];
    if (v3)
    {
      uint64_t v4 = objc_opt_new();
      triggers = v3->_triggers;
      v3->_triggers = (NSMutableDictionary *)v4;

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v6 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __25__PLBLMDebugService_init__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v6;
        if (qword_1EBD589F8 != -1) {
          dispatch_once(&qword_1EBD589F8, block);
        }
        if (byte_1EBD589E1)
        {
          v7 = [NSString stringWithFormat:@"Inited Trigger"];
          v8 = (void *)MEMORY[0x1E4F929B8];
          v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
          v10 = [v9 lastPathComponent];
          v11 = [NSString stringWithUTF8String:"-[PLBLMDebugService init]"];
          [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:105];

          v12 = PLLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v7;
            _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
    self = v3;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __25__PLBLMDebugService_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589E1 = result;
  return result;
}

- (void)initOperatorDependancies
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] internalBuild]
    && (([MEMORY[0x1E4F929C0] isDevBoard] & 1) != 0
     || ([MEMORY[0x1E4F929C0] debugEnabled] & 1) != 0
     || +[PLBLMDebugService isModelTriggerRun]))
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__PLBLMDebugService_initOperatorDependancies__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (qword_1EBD58A00 != -1) {
        dispatch_once(&qword_1EBD58A00, block);
      }
      if (byte_1EBD589E2)
      {
        uint64_t v4 = [NSString stringWithFormat:@"Initoperators for triggers"];
        v5 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
        v7 = [v6 lastPathComponent];
        v8 = [NSString stringWithUTF8String:"-[PLBLMDebugService initOperatorDependancies]"];
        [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:115];

        v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v4;
          _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v10 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45__PLBLMDebugService_initOperatorDependancies__block_invoke_66;
    v27[3] = &unk_1E692A6F8;
    v27[4] = self;
    uint64_t v26 = (void *)[v10 initWithOperator:self withRegistration:&unk_1F29EA0D0 withBlock:v27];
    [(PLBLMDebugService *)self setXpcListenerBLMDebugTrigger:v26];
    uint64_t v11 = *MEMORY[0x1E4F92D28];
    v25 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"EnergyModel"];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:v25 withBlock:&__block_literal_global_76];
    [(PLBLMDebugService *)self setIoreportCallback:v24];
    v23 = +[PLOperator entryKeyForType:v11 andName:@"Usage"];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:v23 withBlock:&__block_literal_global_79];
    [(PLBLMDebugService *)self setProcessnetworkCallback:v12];
    v13 = +[PLOperator entryKeyForType:v11 andName:@"DiffProperties"];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:v13 withBlock:&__block_literal_global_82];
    [(PLBLMDebugService *)self setWifiCallback:v14];
    uint64_t v15 = *MEMORY[0x1E4F92D40];
    objc_super v16 = +[PLBBAgent getNameBBReport];
    v17 = +[PLOperator entryKeyForType:v15 andName:v16];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:v17 withBlock:&__block_literal_global_85];
    [(PLBLMDebugService *)self setBbCallback:v18];
    uint64_t v19 = +[PLOperator entryKeyForType:v11 andName:@"PowerProfileStats"];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:v19 withBlock:&__block_literal_global_88];
    [(PLBLMDebugService *)self setBtCallback:v20];
    v21 = +[PLOperator entryKeyForType:v11 andName:@"APLStats"];
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F929E8]) initWithOperator:self forEntryKey:v21 withBlock:&__block_literal_global_91];
    [(PLBLMDebugService *)self setDisplayAPLCallback:v22];
  }
}

uint64_t __45__PLBLMDebugService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589E2 = result;
  return result;
}

void __45__PLBLMDebugService_initOperatorDependancies__block_invoke_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = NSString;
  id v7 = a5;
  v8 = [v6 stringWithFormat:@"Asked Trigger: %@", v7];
  v9 = (void *)MEMORY[0x1E4F929B8];
  id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
  uint64_t v11 = [v10 lastPathComponent];
  v12 = [NSString stringWithUTF8String:"-[PLBLMDebugService initOperatorDependancies]_block_invoke"];
  [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:118];

  v13 = PLLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v8;
    _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) registerTrigger:v7];
}

- (void)registerTrigger:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __37__PLBLMDebugService_registerTrigger___block_invoke;
    v36 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v37 = v5;
    if (qword_1EBD58A08 != -1) {
      dispatch_once(&qword_1EBD58A08, &block);
    }
    if (byte_1EBD589E3)
    {
      uint64_t v6 = [NSString stringWithFormat:@"Got a trigger %@", v4, block, v34, v35, v36, v37];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
      v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLBLMDebugService registerTrigger:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:162];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v12 = [v4 objectForKeyedSubscript:@"trigger_name"];
  v13 = objc_opt_new();
  v14 = [(PLBLMDebugService *)self triggers];
  [v14 setObject:v13 forKeyedSubscript:v12];

  uint64_t v15 = [v4 objectForKeyedSubscript:@"trigger_start_time"];
  [v15 doubleValue];
  double v17 = v16;

  v18 = [v4 objectForKeyedSubscript:@"trigger_diff_time"];
  [v18 doubleValue];
  double v20 = v19;

  if (v17 == -1.0)
  {
    [(PLBLMDebugService *)self triggerLoggersNow:0];
    v21 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  }
  else
  {
    v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v17];
    v21 = [v22 convertFromSystemToMonotonic];

    [(PLBLMDebugService *)self triggerSelectorAtDate:v21 withSelector:sel_triggerLoggersNow_ withUseInfo:0];
  }
  v23 = [v21 dateByAddingTimeInterval:v20];
  v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v23 sinceDate:65.0];
  v25 = [(PLBLMDebugService *)self triggers];
  uint64_t v26 = [v25 objectForKeyedSubscript:v12];
  [v26 setObject:v21 forKeyedSubscript:@"trigger_start_time"];

  v27 = [(PLBLMDebugService *)self triggers];
  v28 = [v27 objectForKeyedSubscript:v12];
  [v28 setObject:v23 forKeyedSubscript:@"trigger_stop_time"];

  v29 = [NSNumber numberWithDouble:v20];
  v30 = [(PLBLMDebugService *)self triggers];
  uint64_t v31 = [v30 objectForKeyedSubscript:v12];
  [v31 setObject:v29 forKeyedSubscript:@"trigger_diff_time"];

  [(PLBLMDebugService *)self triggerSelectorAtDate:v23 withSelector:sel_triggerLoggersNow_ withUseInfo:0];
  v38 = @"trigger_name";
  v39 = v12;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  [(PLBLMDebugService *)self triggerSelectorAtDate:v24 withSelector:sel_respondBLMDDebugQuery_ withUseInfo:v32];
}

uint64_t __37__PLBLMDebugService_registerTrigger___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589E3 = result;
  return result;
}

- (void)triggerSelectorAtDate:(id)a3 withSelector:(SEL)a4 withUseInfo:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PLBLMDebugService_triggerSelectorAtDate_withSelector_withUseInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD58A10 != -1) {
      dispatch_once(&qword_1EBD58A10, block);
    }
    if (byte_1EBD589E4)
    {
      uint64_t v11 = [NSString stringWithFormat:@"setting time at date %@ %@", v8, v9];
      v12 = (void *)MEMORY[0x1E4F929B8];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
      v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLBLMDebugService triggerSelectorAtDate:withSelector:withUseInfo:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:189];

      double v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v17 = objc_alloc(MEMORY[0x1E4F1CB00]);
  v18 = [v8 convertFromMonotonicToSystem];
  double v19 = (void *)[v17 initWithFireDate:v18 interval:self target:a4 selector:v9 userInfo:0 repeats:0.0];

  double v20 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v20 addTimer:v19 forMode:*MEMORY[0x1E4F1C3A0]];
}

uint64_t __68__PLBLMDebugService_triggerSelectorAtDate_withSelector_withUseInfo___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589E4 = result;
  return result;
}

- (void)triggerLoggersNow:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __39__PLBLMDebugService_triggerLoggersNow___block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v5;
    if (qword_1EBD58A18 != -1) {
      dispatch_once(&qword_1EBD58A18, &block);
    }
    if (byte_1EBD589E5)
    {
      uint64_t v6 = [NSString stringWithFormat:@"Triggering Now %@", v4, block, v16, v17, v18, v19];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
      id v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLBLMDebugService triggerLoggersNow:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:199];

      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v12 = objc_opt_new();
  [MEMORY[0x1E4F92A88] postNotificationName:@"PLBatteryAgent_EventBackward_Battery.filtered.Level_0_1.Level_7_1800.Level_8_300" object:self userInfo:v12];
  v13 = [(PLBLMDebugService *)self displayAPLCallback];
  [v13 requestEntry];

  sleep(1u);
  v14 = [(PLBLMDebugService *)self bbCallback];
  [v14 requestEntry];
}

uint64_t __39__PLBLMDebugService_triggerLoggersNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589E5 = result;
  return result;
}

- (id)respondBLMDDebugQuery:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = 0x1E4F92000uLL;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __43__PLBLMDebugService_respondBLMDDebugQuery___block_invoke;
    v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v62[4] = v6;
    if (qword_1EBD58A20 != -1) {
      dispatch_once(&qword_1EBD58A20, v62);
    }
    if (byte_1EBD589E6)
    {
      id v7 = [NSString stringWithFormat:@"responding to query %@", v4];
      id v8 = (void *)MEMORY[0x1E4F929B8];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
      uint64_t v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLBLMDebugService respondBLMDDebugQuery:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:217];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v13 = [v4 userInfo];
  v14 = objc_opt_new();
  uint64_t v15 = [v13 objectForKeyedSubscript:@"trigger_name"];
  uint64_t v16 = [(PLBLMDebugService *)self triggers];
  id v17 = [v16 objectForKey:v15];

  if (v17)
  {
    id v53 = v4;
    [v14 setObject:v15 forKeyedSubscript:@"trigger_name"];
    v18 = [(PLBLMDebugService *)self triggers];
    [v18 objectForKeyedSubscript:v15];
    v20 = uint64_t v19 = v15;
    [v20 objectForKeyedSubscript:@"trigger_start_time"];
    v21 = v54 = v13;
    [v14 setObject:v21 forKeyedSubscript:@"trigger_start_time"];

    uint64_t v22 = [(PLBLMDebugService *)self triggers];
    v51 = v19;
    v23 = [v22 objectForKeyedSubscript:v19];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"trigger_stop_time"];
    [v14 setObject:v24 forKeyedSubscript:@"trigger_stop_time"];

    v25 = [v14 objectForKeyedSubscript:@"trigger_start_time"];
    v13 = v54;
    uint64_t v26 = [v14 objectForKeyedSubscript:@"trigger_stop_time"];
    [v25 timeIntervalSince1970];
    double v28 = v27;
    [v26 timeIntervalSince1970];
    double v30 = v29;

    uint64_t v31 = objc_opt_new();
    v52 = v14;
    [v14 setObject:v31 forKeyedSubscript:@"trigger_rail_data"];

    [MEMORY[0x1E4F92900] deviceRootNodeIDs];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      double v34 = v30 - v28;
      uint64_t v35 = *(void *)v59;
      do
      {
        uint64_t v36 = 0;
        uint64_t v55 = v33;
        do
        {
          if (*(void *)v59 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = [*(id *)(*((void *)&v58 + 1) + 8 * v36) intValue];
          v38 = [v13 objectForKeyedSubscript:@"trigger_name"];
          v39 = -[PLBLMDebugService logRailData:withTriggerName:inTimeRange:](self, "logRailData:withTriggerName:inTimeRange:", v37, v38, v28, v34);

          if ([*(id *)(v5 + 2496) debugEnabled])
          {
            uint64_t v40 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __43__PLBLMDebugService_respondBLMDDebugQuery___block_invoke_122;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v40;
            if (qword_1EBD58A28 != -1) {
              dispatch_once(&qword_1EBD58A28, block);
            }
            if (byte_1EBD589E7)
            {
              uint64_t v41 = v35;
              uint64_t v42 = self;
              unint64_t v43 = v5;
              v44 = [NSString stringWithFormat:@"Written %@", v39];
              v45 = (void *)MEMORY[0x1E4F929B8];
              v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
              v47 = [v46 lastPathComponent];
              v48 = [NSString stringWithUTF8String:"-[PLBLMDebugService respondBLMDDebugQuery:]"];
              [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:232];

              v49 = PLLogCommon();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v65 = v44;
                _os_log_debug_impl(&dword_1D2690000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v5 = v43;
              self = v42;
              uint64_t v35 = v41;
              v13 = v54;
              uint64_t v33 = v55;
            }
          }

          ++v36;
        }
        while (v33 != v36);
        uint64_t v33 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v33);
    }

    v14 = v52;
    id v4 = v53;
    uint64_t v15 = v51;
  }

  return v14;
}

uint64_t __43__PLBLMDebugService_respondBLMDDebugQuery___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589E6 = result;
  return result;
}

uint64_t __43__PLBLMDebugService_respondBLMDDebugQuery___block_invoke_122(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589E7 = result;
  return result;
}

- (id)logRailData:(int)a3 withTriggerName:(id)a4 inTimeRange:(_PLTimeIntervalRange)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  uint64_t v7 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PLBLMDebugService_logRailData_withTriggerName_inTimeRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1EBD58A30 != -1) {
      dispatch_once(&qword_1EBD58A30, block);
    }
    if (byte_1EBD589E8)
    {
      uint64_t v11 = NSString;
      v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:var0];
      v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:var0 + var1];
      v14 = [v11 stringWithFormat:@"Start: %@, End %@", v12, v13];

      uint64_t v15 = [v11 stringWithFormat:@"Logging rail data %li %@ %@", (int)v7, v9, v14];

      uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
      id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
      v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLBLMDebugService logRailData:withTriggerName:inTimeRange:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:239];

      double v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v15;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v41 = v7;
  v21 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"BLMQADebug"];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v21];
  [v22 setObject:v9 forKeyedSubscript:@"trigger_name"];
  v23 = [(PLBLMDebugService *)self triggers];
  uint64_t v24 = [v23 objectForKeyedSubscript:v9];
  v25 = [v24 objectForKeyedSubscript:@"trigger_start_time"];

  uint64_t v26 = [(PLBLMDebugService *)self triggers];
  double v27 = [v26 objectForKeyedSubscript:v9];
  double v28 = [v27 objectForKeyedSubscript:@"trigger_stop_time"];

  if (v25)
  {
    double v29 = [v25 convertFromMonotonicToSystem];
    [v22 setObject:v29 forKeyedSubscript:@"trigger_start_time"];

    [v22 setObject:v25 forKeyedSubscript:@"trigger_start_time_monotonic"];
  }
  if (v28)
  {
    double v30 = [v28 convertFromMonotonicToSystem];
    [v22 setObject:v30 forKeyedSubscript:@"trigger_stop_time"];

    [v22 setObject:v28 forKeyedSubscript:@"trigger_stop_time_monotonic"];
  }
  uint64_t v31 = [(PLBLMDebugService *)self triggers];
  uint64_t v32 = [v31 objectForKeyedSubscript:v9];
  uint64_t v33 = [v32 objectForKeyedSubscript:@"trigger_diff_time"];
  [v22 setObject:v33 forKeyedSubscript:@"trigger_diff_time"];

  double v34 = [NSNumber numberWithInt:v41];
  [v22 setObject:v34 forKeyedSubscript:@"rootnodeid"];

  uint64_t v35 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v35 timeIntervalSince1970];
  double v37 = v36;

  v38 = [NSNumber numberWithDouble:v37];
  [v22 setObject:v38 forKeyedSubscript:@"SafeTime"];

  if (v37 >= var0 + var1)
  {
    -[PLBLMDebugService energyForRootNodeID:withRange:](self, "energyForRootNodeID:withRange:", v41, var0, var1);
    v39 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v22 setObject:v39 forKeyedSubscript:@"railpower"];
  }
  else
  {
    [v22 setObject:&unk_1F29E62F8 forKeyedSubscript:@"railpower"];
  }
  [(PLOperator *)self logEntry:v22];

  return v22;
}

uint64_t __61__PLBLMDebugService_logRailData_withTriggerName_inTimeRange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589E8 = result;
  return result;
}

- (double)energyForRootNodeID:(int)a3 withRange:(_PLTimeIntervalRange)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [NSString stringWithFormat:@"(timestamp+%@)>%f AND (timestamp+%@)<%f AND %@=%i", *MEMORY[0x1E4F92B70], *(void *)&a4.var0, *MEMORY[0x1E4F92B90], a4.var0 + a4.var1, *MEMORY[0x1E4F92B80], *(void *)&a3];
  uint64_t v6 = NSString;
  uint64_t v7 = [MEMORY[0x1E4F928F8] entryKey];
  id v8 = [v6 stringWithFormat:@"SELECT * FROM '%@' WHERE (%@);", v7, v5];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD58A38 != -1) {
      dispatch_once(&qword_1EBD58A38, block);
    }
    if (byte_1EBD589E9)
    {
      uint64_t v10 = [NSString stringWithFormat:@"rootNodeEnergyQuery=%@", v8];
      uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
      v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLBLMDebugService energyForRootNodeID:withRange:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:283];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v16 = [(PLOperator *)self storage];
  id v17 = [MEMORY[0x1E4F928F8] entryKey];
  v18 = [v16 entriesForKey:v17 withQuery:v8];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke_143;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v19;
    if (qword_1EBD58A40 != -1) {
      dispatch_once(&qword_1EBD58A40, v46);
    }
    if (byte_1EBD589EA)
    {
      double v20 = [NSString stringWithFormat:@"rootNodeEnergyEntries=%@", v18];
      v21 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
      v23 = [v22 lastPathComponent];
      uint64_t v24 = [NSString stringWithUTF8String:"-[PLBLMDebugService energyForRootNodeID:withRange:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:287];

      v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v20;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v26 = v18;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v43;
    double v30 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * i) energy];
        double v30 = v30 + v32;
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v28);
  }
  else
  {
    double v30 = 0.0;
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v33 = objc_opt_class();
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke_149;
    v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v41[4] = v33;
    if (qword_1EBD58A48 != -1) {
      dispatch_once(&qword_1EBD58A48, v41);
    }
    if (byte_1EBD589EB)
    {
      double v34 = objc_msgSend(NSString, "stringWithFormat:", @"totalEnergy=%f", *(void *)&v30);
      uint64_t v35 = (void *)MEMORY[0x1E4F929B8];
      double v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m"];
      double v37 = [v36 lastPathComponent];
      v38 = [NSString stringWithUTF8String:"-[PLBLMDebugService energyForRootNodeID:withRange:]"];
      [v35 logMessage:v34 fromFile:v37 fromFunction:v38 fromLineNumber:294];

      v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v34;
        _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }

  return v30;
}

uint64_t __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589E9 = result;
  return result;
}

uint64_t __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke_143(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589EA = result;
  return result;
}

uint64_t __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke_149(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD589EB = result;
  return result;
}

- (id)Testservice:(id)a3
{
  id v4 = objc_opt_new();
  [v4 setObject:&unk_1F29E62F8 forKeyedSubscript:@"trigger_start_time"];
  [v4 setObject:&unk_1F29E6310 forKeyedSubscript:@"trigger_diff_time"];
  [v4 setObject:@"Abcd" forKeyedSubscript:@"trigger_name"];
  [(PLBLMDebugService *)self registerTrigger:v4];

  return 0;
}

- (void)debugTrigger
{
  id v3 = objc_alloc(MEMORY[0x1E4F92A80]);
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  unint64_t v5 = [(PLOperator *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__PLBLMDebugService_debugTrigger__block_invoke;
  v8[3] = &unk_1E692A200;
  v8[4] = self;
  uint64_t v6 = (PLTimer *)[v3 initWithFireDate:v4 withInterval:1 withTolerance:0 repeats:v5 withUserInfo:v8 withQueue:20.0 withBlock:0.0];
  debugTimers = self->_debugTimers;
  self->_debugTimers = v6;
}

uint64_t __33__PLBLMDebugService_debugTrigger__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerLoggersNow:0];
}

- (PLXPCListenerOperatorComposition)xpcListenerBLMDebugTrigger
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcListenerBLMDebugTrigger:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)ioreportCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIoreportCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)processnetworkCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProcessnetworkCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wifiCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWifiCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)bbCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBbCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)btCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBtCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayAPLCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayAPLCallback:(id)a3
{
}

- (PLTimer)debugTimers
{
  return (PLTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDebugTimers:(id)a3
{
}

- (NSMutableDictionary)triggers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTriggers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_debugTimers, 0);
  objc_storeStrong((id *)&self->_displayAPLCallback, 0);
  objc_storeStrong((id *)&self->_btCallback, 0);
  objc_storeStrong((id *)&self->_bbCallback, 0);
  objc_storeStrong((id *)&self->_wifiCallback, 0);
  objc_storeStrong((id *)&self->_processnetworkCallback, 0);
  objc_storeStrong((id *)&self->_ioreportCallback, 0);
  objc_storeStrong((id *)&self->_xpcListenerBLMDebugTrigger, 0);
}

@end