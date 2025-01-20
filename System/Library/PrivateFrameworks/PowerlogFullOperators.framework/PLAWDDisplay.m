@interface PLAWDDisplay
+ (id)entryAggregateDefinitionAwdDisplayAndAls;
+ (id)entryAggregateDefinitions;
+ (id)getSharedObjWithOperator:(id)a3;
- (BOOL)prevAlsOn;
- (BOOL)prevDeviceCharging;
- (BOOL)prevDisplayOn;
- (BOOL)prevMieOn;
- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (PLEntryNotificationOperatorComposition)alsEnabledEventCallback;
- (PLEntryNotificationOperatorComposition)alsUserPreferencesEventCallback;
- (PLEntryNotificationOperatorComposition)backlightEventCallback;
- (PLEntryNotificationOperatorComposition)backlightRailCallback;
- (PLEntryNotificationOperatorComposition)batteryEventCallback;
- (PLEntryNotificationOperatorComposition)displayEventCallback;
- (PLEntryNotificationOperatorComposition)touchEventCallback;
- (double)bklPowerRailTimeStamp;
- (double)bklTimeStamp;
- (double)displayOnTimeStamp;
- (double)mieOnTimeStamp;
- (double)prevBklChgTimeStamp;
- (double)prevBklPower;
- (int64_t)dispSubmitCnt;
- (int64_t)getBklbucketIdx:(int64_t)a3 withLux:(int64_t)a4;
- (int64_t)getLuxBucket:(int64_t)a3;
- (int64_t)getUAmpsBucket:(int64_t)a3;
- (int64_t)prevBklBucketIdx;
- (int64_t)startTouchEntryId;
- (int64_t)touchSubmitCnt;
- (void)addEntryToDisplayAlsTable:(id)a3 withValue:(double)a4;
- (void)finalizeDisplayAlsTable;
- (void)handleAlsEnabledCallback:(id)a3;
- (void)handleAlsUserPreferencesCallback:(id)a3;
- (void)handleBacklightCallback:(id)a3;
- (void)handleBatteryCallback:(id)a3;
- (void)handleDisplayCallback:(id)a3;
- (void)handleTouchCallback:(id)a3;
- (void)initDisplayBacklightAlsStats;
- (void)initTouchStats;
- (void)reInitDisplayBacklightAlsStats;
- (void)registerForDisplayAgentNotifications;
- (void)registerForTouchNotifications;
- (void)resetDisplayAlsTable;
- (void)setAlsEnabledEventCallback:(id)a3;
- (void)setAlsUserPreferencesEventCallback:(id)a3;
- (void)setBacklightEventCallback:(id)a3;
- (void)setBacklightRailCallback:(id)a3;
- (void)setBatteryEventCallback:(id)a3;
- (void)setBklPowerRailTimeStamp:(double)a3;
- (void)setBklTimeStamp:(double)a3;
- (void)setDispSubmitCnt:(int64_t)a3;
- (void)setDisplayEventCallback:(id)a3;
- (void)setDisplayOnTimeStamp:(double)a3;
- (void)setMieOnTimeStamp:(double)a3;
- (void)setPrevAlsOn:(BOOL)a3;
- (void)setPrevBklBucketIdx:(int64_t)a3;
- (void)setPrevBklChgTimeStamp:(double)a3;
- (void)setPrevBklPower:(double)a3;
- (void)setPrevDeviceCharging:(BOOL)a3;
- (void)setPrevDisplayOn:(BOOL)a3;
- (void)setPrevMieOn:(BOOL)a3;
- (void)setStartTouchEntryId:(int64_t)a3;
- (void)setTouchEventCallback:(id)a3;
- (void)setTouchSubmitCnt:(int64_t)a3;
- (void)startMetricCollection:(id)a3;
- (void)stopMetricCollection:(id)a3;
- (void)updateDisplayMetrics:(BOOL)a3 withState:(BOOL)a4;
- (void)updateMieMetrics:(BOOL)a3;
@end

@implementation PLAWDDisplay

+ (id)getSharedObjWithOperator:(id)a3
{
  v3 = (void *)plAwdDisplay;
  if (!plAwdDisplay)
  {
    id v4 = a3;
    v5 = [(PLAWDAuxMetrics *)[PLAWDDisplay alloc] initWithOperator:v4];

    v6 = (void *)plAwdDisplay;
    plAwdDisplay = (uint64_t)v5;

    v3 = (void *)plAwdDisplay;
  }

  return v3;
}

+ (id)entryAggregateDefinitions
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"DisplayAlsMetrics";
  v2 = [a1 entryAggregateDefinitionAwdDisplayAndAls];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryAggregateDefinitionAwdDisplayAndAls
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v21[0] = *MEMORY[0x263F5F880];
  v21[1] = v2;
  v22[0] = &unk_26E5465B0;
  v22[1] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v3;
  v23[1] = *MEMORY[0x263F5F870];
  v19[0] = @"MetricsKey";
  id v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v19[1] = @"MetricsValue";
  v20[0] = v5;
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v20[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  v23[2] = *MEMORY[0x263F5F828];
  v17 = &unk_26E5465C0;
  uint64_t v15 = *MEMORY[0x263F5F820];
  v16 = &unk_26E5465C0;
  v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v24[2] = v10;
  v23[3] = *MEMORY[0x263F5F830];
  v14 = @"MetricsValue";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v24[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (void)startMetricCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 longValue];
  if (v5 == 2031625)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      void v21[2] = __38__PLAWDDisplay_startMetricCollection___block_invoke_64;
      v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v21[4] = v13;
      if (startMetricCollection__defaultOnce_62 != -1) {
        dispatch_once(&startMetricCollection__defaultOnce_62, v21);
      }
      if (startMetricCollection__classDebugEnabled_63)
      {
        v14 = [NSString stringWithFormat:@"%@ : Start Touch collection", @"*******PLAWDMetricsService*******"];
        uint64_t v15 = (void *)MEMORY[0x263F5F638];
        v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLAWDDisplay startMetricCollection:]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:122];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDDisplay *)self initTouchStats];
    [(PLAWDDisplay *)self registerForTouchNotifications];
  }
  else if (v5 == 2031622)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__PLAWDDisplay_startMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (startMetricCollection__defaultOnce != -1) {
        dispatch_once(&startMetricCollection__defaultOnce, block);
      }
      if (startMetricCollection__classDebugEnabled)
      {
        v7 = [NSString stringWithFormat:@"%@ : Start Display/Backlight/Als collection", @"*******PLAWDMetricsService*******"];
        v8 = (void *)MEMORY[0x263F5F638];
        v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        v10 = [v9 lastPathComponent];
        v11 = [NSString stringWithUTF8String:"-[PLAWDDisplay startMetricCollection:]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:112];

        v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDDisplay *)self initDisplayBacklightAlsStats];
    [(PLAWDDisplay *)self registerForDisplayAgentNotifications];
  }
  v20 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v20 addObject:v4];
}

uint64_t __38__PLAWDDisplay_startMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAWDDisplay_startMetricCollection___block_invoke_64(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled_63 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 removeObject:v4];

  uint64_t v6 = [v4 longValue];
  if (v6 == 2031625)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __37__PLAWDDisplay_stopMetricCollection___block_invoke_73;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = v14;
      if (stopMetricCollection__defaultOnce_71 != -1) {
        dispatch_once(&stopMetricCollection__defaultOnce_71, v24);
      }
      if (stopMetricCollection__classDebugEnabled_72)
      {
        uint64_t v15 = [NSString stringWithFormat:@"%@ : Stop Touch collection.", @"*******PLAWDMetricsService*******"];
        v16 = (void *)MEMORY[0x263F5F638];
        v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        v18 = [v17 lastPathComponent];
        v19 = [NSString stringWithUTF8String:"-[PLAWDDisplay stopMetricCollection:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:154];

        v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDDisplay *)self setTouchEventCallback:0];
  }
  else if (v6 == 2031622)
  {
    [(PLAWDDisplay *)self setDisplayEventCallback:0];
    [(PLAWDDisplay *)self setBacklightEventCallback:0];
    [(PLAWDDisplay *)self setAlsUserPreferencesEventCallback:0];
    [(PLAWDDisplay *)self setBatteryEventCallback:0];
    [(PLAWDDisplay *)self setBacklightRailCallback:0];
    [(PLAWDDisplay *)self setAlsEnabledEventCallback:0];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__PLAWDDisplay_stopMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (stopMetricCollection__defaultOnce != -1) {
        dispatch_once(&stopMetricCollection__defaultOnce, block);
      }
      if (stopMetricCollection__classDebugEnabled)
      {
        v8 = [NSString stringWithFormat:@"%@ : Stop Display/Backlight/Als collection.", @"*******PLAWDMetricsService*******"];
        v9 = (void *)MEMORY[0x263F5F638];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLAWDDisplay stopMetricCollection:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:149];

        uint64_t v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
  }
  v21 = [(PLAWDAuxMetrics *)self runningMetrics];
  uint64_t v22 = [v21 count];

  if (!v22)
  {
    v23 = (void *)plAwdDisplay;
    plAwdDisplay = 0;
  }
}

uint64_t __37__PLAWDDisplay_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopMetricCollection__classDebugEnabled = result;
  return result;
}

uint64_t __37__PLAWDDisplay_stopMetricCollection___block_invoke_73(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopMetricCollection__classDebugEnabled_72 = result;
  return result;
}

- (void)registerForTouchNotifications
{
  v3 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F9D8]];
  id v4 = objc_alloc(MEMORY[0x263F5F658]);
  uint64_t v5 = [(PLAWDAuxMetrics *)self operator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__PLAWDDisplay_registerForTouchNotifications__block_invoke;
  v8[3] = &unk_264B99DD0;
  v8[4] = self;
  uint64_t v6 = (void *)[v4 initWithOperator:v5 forEntryKey:v3 withBlock:v8];

  [(PLAWDDisplay *)self setTouchEventCallback:v6];
  uint64_t v7 = [(PLAWDDisplay *)self touchEventCallback];
  [v7 requestEntry];
}

uint64_t __45__PLAWDDisplay_registerForTouchNotifications__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleTouchCallback:a2];
  }
  return result;
}

- (void)registerForDisplayAgentNotifications
{
  v3 = &off_230A24000;
  if ([MEMORY[0x263F5F8E8] shouldLogDisplay])
  {
    id v4 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F9F8]];
    id v5 = objc_alloc(MEMORY[0x263F5F658]);
    uint64_t v6 = [(PLAWDAuxMetrics *)self operator];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke;
    v35[3] = &unk_264B99DD0;
    v35[4] = self;
    uint64_t v7 = (void *)[v5 initWithOperator:v6 forEntryKey:v4 withBlock:v35];

    [(PLAWDDisplay *)self setDisplayEventCallback:v7];
    if ([(PLAWDDisplay *)self prevMieOn])
    {
      v8 = [(PLAWDDisplay *)self displayEventCallback];
      [v8 requestEntry];
    }
    uint64_t v9 = *MEMORY[0x263F5F8A0];
    v10 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F9F0]];
    id v11 = objc_alloc(MEMORY[0x263F5F658]);
    v12 = [(PLAWDAuxMetrics *)self operator];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_2;
    v34[3] = &unk_264B99DD0;
    v34[4] = self;
    uint64_t v13 = (void *)[v11 initWithOperator:v12 forEntryKey:v10 withBlock:v34];

    [(PLAWDDisplay *)self setBacklightEventCallback:v13];
    v3 = &off_230A24000;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x263F5F8A0];
  }
  if (([MEMORY[0x263F5F668] isMac] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x263F5F8E8] entryKeyForType:v9 andName:*MEMORY[0x263F5F9E8]];
    id v15 = objc_alloc(MEMORY[0x263F5F658]);
    v16 = [(PLAWDAuxMetrics *)self operator];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = *((void *)v3 + 81);
    v33[2] = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_3;
    v33[3] = &unk_264B99DD0;
    v33[4] = self;
    v17 = (void *)[v15 initWithOperator:v16 forEntryKey:v14 withBlock:v33];

    [(PLAWDDisplay *)self setAlsUserPreferencesEventCallback:v17];
  }
  v18 = [MEMORY[0x263F5F8D0] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F998]];
  id v19 = objc_alloc(MEMORY[0x263F5F658]);
  v20 = [(PLAWDAuxMetrics *)self operator];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = *((void *)v3 + 81);
  uint64_t v21 = v29;
  v30 = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_4;
  v31 = &unk_264B99DD0;
  v32 = self;
  uint64_t v22 = (void *)[v19 initWithOperator:v20 forEntryKey:v18 withBlock:&v28];

  [(PLAWDDisplay *)self setBatteryEventCallback:v22];
  v23 = [MEMORY[0x263F5F8E8] entryKeyForType:v9 andName:*MEMORY[0x263F5F9E0]];
  id v24 = objc_alloc(MEMORY[0x263F5F658]);
  v25 = [(PLAWDAuxMetrics *)self operator];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = v21;
  v27[2] = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_5;
  v27[3] = &unk_264B99DD0;
  v27[4] = self;
  v26 = (void *)[v24 initWithOperator:v25 forEntryKey:v23 withBlock:v27];

  [(PLAWDDisplay *)self setAlsEnabledEventCallback:v26];
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleDisplayCallback:a2];
  }
  return result;
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleBacklightCallback:a2];
  }
  return result;
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAlsUserPreferencesCallback:a2];
  }
  return result;
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleBatteryCallback:a2];
  }
  return result;
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_5(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleAlsEnabledCallback:a2];
  }
  return result;
}

- (void)initTouchStats
{
  [(PLAWDDisplay *)self setTouchSubmitCnt:0];
  v3 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F9D8]];
  id v4 = [(PLAWDAuxMetrics *)self operator];
  id v5 = [v4 storage];
  uint64_t v6 = [v5 lastEntryForKey:v3];

  if (v6) {
    uint64_t v7 = [v6 entryID];
  }
  else {
    uint64_t v7 = -1;
  }
  [(PLAWDDisplay *)self setStartTouchEntryId:v7];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__PLAWDDisplay_initTouchStats__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (initTouchStats_defaultOnce != -1) {
      dispatch_once(&initTouchStats_defaultOnce, block);
    }
    if (initTouchStats_classDebugEnabled)
    {
      uint64_t v9 = [NSString stringWithFormat:@"%@ : Init Touch stats: startTouchEntryId=%lld", @"*******PLAWDMetricsService*******", -[PLAWDDisplay startTouchEntryId](self, "startTouchEntryId")];
      v10 = (void *)MEMORY[0x263F5F638];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
      v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLAWDDisplay initTouchStats]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:251];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __30__PLAWDDisplay_initTouchStats__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  initTouchStats_classDebugEnabled = result;
  return result;
}

- (void)initDisplayBacklightAlsStats
{
  v58[1] = *MEMORY[0x263EF8340];
  [(PLAWDDisplay *)self setDispSubmitCnt:0];
  [(PLAWDDisplay *)self setPrevDisplayOn:0];
  [(PLAWDDisplay *)self setPrevMieOn:0];
  [(PLAWDDisplay *)self setPrevDeviceCharging:0];
  [(PLAWDDisplay *)self setPrevBklBucketIdx:-1];
  [(PLAWDDisplay *)self setBklTimeStamp:0.0];
  [(PLAWDDisplay *)self setDisplayOnTimeStamp:0.0];
  [(PLAWDDisplay *)self setMieOnTimeStamp:0.0];
  [(PLAWDDisplay *)self setPrevBklPower:0.0];
  [(PLAWDDisplay *)self setBklPowerRailTimeStamp:0.0];
  [(PLAWDDisplay *)self resetDisplayAlsTable];
  v55 = [MEMORY[0x263EFF910] monotonicDate];
  [(PLAWDDisplay *)self setPrevAlsOn:0];
  uint64_t v3 = *MEMORY[0x263F5F8A0];
  id v4 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F9E0]];
  id v5 = [(PLAWDAuxMetrics *)self operator];
  uint64_t v6 = [v5 storage];
  uint64_t v7 = [v6 lastEntryForKey:v4];

  if (v7
    && ([v7 objectForKeyedSubscript:@"ALSEnabled"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 BOOLValue],
        v8,
        v9))
  {
    uint64_t v52 = 1;
    [(PLAWDDisplay *)self setPrevAlsOn:1];
    [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"AlsEnableCnt" withValue:1.0];
  }
  else
  {
    uint64_t v52 = 0;
  }
  if ([MEMORY[0x263F5F8E8] shouldLogDisplay])
  {
    v53 = v4;
    v10 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F9F8]];
    uint64_t v11 = [NSString stringWithFormat:@"%@=\"%@\", @"Block", @"Backlight""];
    v12 = [(PLAWDAuxMetrics *)self operator];
    uint64_t v13 = [v12 storage];
    v51 = (void *)v11;
    v58[0] = v11;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:1];
    id v15 = [v13 lastEntryForKey:v10 withFilters:v14];

    if (v15)
    {
      v16 = [v15 objectForKeyedSubscript:@"Active"];
      -[PLAWDDisplay setPrevDisplayOn:](self, "setPrevDisplayOn:", [v16 BOOLValue]);

      if ([(PLAWDDisplay *)self prevDisplayOn])
      {
        [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"DisplayOnCount" withValue:1.0];
        [v55 timeIntervalSince1970];
        -[PLAWDDisplay setDisplayOnTimeStamp:](self, "setDisplayOnTimeStamp:");
      }
    }
    if ([(PLAWDDisplay *)self prevDisplayOn])
    {
      uint64_t v17 = [NSString stringWithFormat:@"%@=\"%@\", @"Block", @"MIE""];
      v18 = [(PLAWDAuxMetrics *)self operator];
      id v19 = [v18 storage];
      v50 = (void *)v17;
      uint64_t v57 = v17;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
      uint64_t v21 = [v19 lastEntryForKey:v10 withFilters:v20];

      if (v21)
      {
        uint64_t v22 = [v21 objectForKeyedSubscript:@"Active"];
        -[PLAWDDisplay setPrevMieOn:](self, "setPrevMieOn:", [v22 BOOLValue]);

        if ([(PLAWDDisplay *)self prevMieOn])
        {
          [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"MieOnCount" withValue:1.0];
          [v55 timeIntervalSince1970];
          -[PLAWDDisplay setMieOnTimeStamp:](self, "setMieOnTimeStamp:");
        }
      }
      v23 = [MEMORY[0x263F5F8E8] entryKeyForType:v3 andName:*MEMORY[0x263F5F9F0]];
      id v24 = [(PLAWDAuxMetrics *)self operator];
      v25 = [v24 storage];
      v26 = [v25 lastEntryForKey:v23];

      if (v26)
      {
        v27 = [v26 objectForKeyedSubscript:@"uAmps"];
        uint64_t v28 = [v27 longValue];

        uint64_t v29 = [v26 objectForKeyedSubscript:@"lux"];
        uint64_t v30 = [v29 longValue];

        [(PLAWDDisplay *)self setPrevBklBucketIdx:[(PLAWDDisplay *)self getBklbucketIdx:v28 withLux:v30]];
        [v55 timeIntervalSince1970];
        -[PLAWDDisplay setBklTimeStamp:](self, "setBklTimeStamp:");
      }
    }
    id v4 = v53;
  }
  v31 = [MEMORY[0x263F5F8D0] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F998]];
  v32 = [(PLAWDAuxMetrics *)self operator];
  v33 = [v32 storage];
  v34 = [v33 lastEntryForKey:v31];

  if (v34)
  {
    v35 = [v34 objectForKeyedSubscript:@"AdapterInfo"];
    if ([v35 BOOLValue])
    {
      v36 = [v34 objectForKeyedSubscript:@"IsCharging"];
      -[PLAWDDisplay setPrevDeviceCharging:](self, "setPrevDeviceCharging:", [v36 BOOLValue]);
    }
    else
    {
      [(PLAWDDisplay *)self setPrevDeviceCharging:0];
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v37 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__PLAWDDisplay_initDisplayBacklightAlsStats__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v37;
    if (initDisplayBacklightAlsStats_defaultOnce != -1) {
      dispatch_once(&initDisplayBacklightAlsStats_defaultOnce, block);
    }
    if (initDisplayBacklightAlsStats_classDebugEnabled)
    {
      v54 = v4;
      v38 = NSString;
      BOOL v39 = [(PLAWDDisplay *)self prevDisplayOn];
      int64_t v40 = [(PLAWDDisplay *)self prevBklBucketIdx];
      BOOL v41 = [(PLAWDDisplay *)self prevMieOn];
      BOOL v42 = [(PLAWDDisplay *)self prevDeviceCharging];
      [(PLAWDDisplay *)self prevBklPower];
      v44 = [v38 stringWithFormat:@"%@ : Initialize Display/Backlight/Als: Display-On=%d Backlight-Idx=%ld Mie-On=%d Als-Enabled=%d Plugged=%d bklPower=%f", @"*******PLAWDMetricsService*******", v39, v40, v41, v52, v42, v43];
      v45 = (void *)MEMORY[0x263F5F638];
      v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
      v47 = [v46 lastPathComponent];
      v48 = [NSString stringWithUTF8String:"-[PLAWDDisplay initDisplayBacklightAlsStats]"];
      [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:341];

      v49 = PLLogCommon();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }

      id v4 = v54;
    }
  }
}

uint64_t __44__PLAWDDisplay_initDisplayBacklightAlsStats__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  initDisplayBacklightAlsStats_classDebugEnabled = result;
  return result;
}

- (void)reInitDisplayBacklightAlsStats
{
  uint64_t v3 = [MEMORY[0x263EFF910] monotonicDate];
  if ([(PLAWDDisplay *)self prevDisplayOn])
  {
    [v3 timeIntervalSince1970];
    -[PLAWDDisplay setDisplayOnTimeStamp:](self, "setDisplayOnTimeStamp:");
    [v3 timeIntervalSince1970];
    -[PLAWDDisplay setBklTimeStamp:](self, "setBklTimeStamp:");
    [v3 timeIntervalSince1970];
    -[PLAWDDisplay setBklPowerRailTimeStamp:](self, "setBklPowerRailTimeStamp:");
    if (![(PLAWDDisplay *)self prevMieOn]) {
      goto LABEL_6;
    }
    [v3 timeIntervalSince1970];
    double v5 = v4;
  }
  else
  {
    [(PLAWDDisplay *)self setPrevBklBucketIdx:-1];
    double v5 = 0.0;
    [(PLAWDDisplay *)self setBklTimeStamp:0.0];
    [(PLAWDDisplay *)self setDisplayOnTimeStamp:0.0];
  }
  [(PLAWDDisplay *)self setMieOnTimeStamp:v5];
LABEL_6:
  [(PLAWDDisplay *)self resetDisplayAlsTable];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __46__PLAWDDisplay_reInitDisplayBacklightAlsStats__block_invoke;
    uint64_t v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v6;
    if (reInitDisplayBacklightAlsStats_defaultOnce != -1) {
      dispatch_once(&reInitDisplayBacklightAlsStats_defaultOnce, &block);
    }
    if (reInitDisplayBacklightAlsStats_classDebugEnabled)
    {
      uint64_t v7 = NSString;
      BOOL v8 = [(PLAWDDisplay *)self prevDisplayOn];
      int64_t v9 = [(PLAWDDisplay *)self prevBklBucketIdx];
      BOOL v10 = [(PLAWDDisplay *)self prevMieOn];
      BOOL v11 = [(PLAWDDisplay *)self prevDeviceCharging];
      v12 = [v7 stringWithFormat:@"%@ : Re- Initialize Display/Backlight/Als: Display-On=%d Backlight-Idx=%ld Mie-On=%d Plugged=%d", @"*******PLAWDMetricsService*******", v8, v9, v10, v11, block, v19, v20, v21, v22];
      uint64_t v13 = (void *)MEMORY[0x263F5F638];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
      id v15 = [v14 lastPathComponent];
      v16 = [NSString stringWithUTF8String:"-[PLAWDDisplay reInitDisplayBacklightAlsStats]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:365];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __46__PLAWDDisplay_reInitDisplayBacklightAlsStats__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reInitDisplayBacklightAlsStats_classDebugEnabled = result;
  return result;
}

- (void)resetDisplayAlsTable
{
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"DisplayAlsMetrics"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDDisplay;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (void)addEntryToDisplayAlsTable:(id)a3 withValue:(double)a4
{
  uint64_t v6 = *MEMORY[0x263F5F888];
  id v7 = a3;
  id v11 = +[PLOperator entryKeyForType:v6 andName:@"DisplayAlsMetrics"];
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v11];
  [v8 setObject:v7 forKeyedSubscript:@"MetricsKey"];

  int64_t v9 = [NSNumber numberWithDouble:a4];
  [v8 setObject:v9 forKeyedSubscript:@"MetricsValue"];

  BOOL v10 = [(PLAWDAuxMetrics *)self operator];
  [v10 logEntry:v8];
}

- (int64_t)getLuxBucket:(int64_t)a3
{
  BOOL v4 = [(PLAWDDisplay *)self prevAlsOn];
  uint64_t v5 = 5;
  if (a3 <= 1001) {
    uint64_t v5 = -1;
  }
  if ((unint64_t)(a3 - 501) >= 0x1F4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 4;
  }
  if ((unint64_t)(a3 - 301) >= 0xC8) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 3;
  }
  if ((unint64_t)(a3 - 101) >= 0xC8) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 2;
  }
  if ((unint64_t)(a3 - 31) >= 0x46) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 1;
  }
  if ((unint64_t)(a3 - 1) >= 0x1E) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 0;
  }
  if (v4) {
    return v10;
  }
  else {
    return 6;
  }
}

- (int64_t)getUAmpsBucket:(int64_t)a3
{
  if (a3 < 1001) {
    return 0;
  }
  if ((unint64_t)a3 < 0x1389) {
    return 1;
  }
  if ((unint64_t)a3 < 0x2711) {
    return 2;
  }
  if (a3 != 10001 && (unint64_t)a3 < 0x3A99) {
    return 3;
  }
  if ((unint64_t)a3 <= 0x3A98) {
    return -1;
  }
  return 4;
}

- (int64_t)getBklbucketIdx:(int64_t)a3 withLux:(int64_t)a4
{
  uint64_t v6 = [(PLAWDDisplay *)self getLuxBucket:a4];
  uint64_t v7 = [(PLAWDDisplay *)self getUAmpsBucket:a3];
  int64_t v8 = 5 * v6 + v7;
  if (!v6) {
    int64_t v8 = v7;
  }
  if (v7 < 0) {
    int64_t v8 = -1;
  }
  if (v6 >= 0) {
    return v8;
  }
  else {
    return -1;
  }
}

- (void)updateDisplayMetrics:(BOOL)a3 withState:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [MEMORY[0x263EFF910] monotonicDate];
  [v7 timeIntervalSince1970];
  double v9 = v8;

  if (v5)
  {
    BOOL v10 = [(PLAWDDisplay *)self prevDisplayOn];
    if (v4)
    {
      if (!v10)
      {
        [(PLAWDDisplay *)self setDisplayOnTimeStamp:v9];
        [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"DisplayOnCount" withValue:1.0];
      }
    }
    else if (v10)
    {
      [(PLAWDDisplay *)self displayOnTimeStamp];
      double v22 = v9 - v21;
      if ([(PLAWDDisplay *)self prevDeviceCharging])
      {
        if (v22 > 0.0) {
          [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"PluggedDispOnDur" withValue:v22];
        }
        if (![MEMORY[0x263F5F640] debugEnabled]) {
          goto LABEL_37;
        }
        uint64_t v23 = objc_opt_class();
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_130;
        v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v44[4] = v23;
        if (updateDisplayMetrics_withState__defaultOnce_128 != -1) {
          dispatch_once(&updateDisplayMetrics_withState__defaultOnce_128, v44);
        }
        if (!updateDisplayMetrics_withState__classDebugEnabled_129) {
          goto LABEL_37;
        }
        id v24 = [NSString stringWithFormat:@"%@ DisplayEvent: Plugged Display On duration=%f", @"*******PLAWDMetricsService*******", *(void *)&v22];
        v25 = (void *)MEMORY[0x263F5F638];
        v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        v27 = [v26 lastPathComponent];
        uint64_t v28 = [NSString stringWithUTF8String:"-[PLAWDDisplay updateDisplayMetrics:withState:]"];
        [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:465];

        uint64_t v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
      else
      {
        if (v22 > 0.0) {
          [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"UnpluggedDispOnDur" withValue:v22];
        }
        if (![MEMORY[0x263F5F640] debugEnabled]) {
          goto LABEL_37;
        }
        uint64_t v30 = objc_opt_class();
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = v30;
        if (updateDisplayMetrics_withState__defaultOnce != -1) {
          dispatch_once(&updateDisplayMetrics_withState__defaultOnce, v45);
        }
        if (!updateDisplayMetrics_withState__classDebugEnabled) {
          goto LABEL_37;
        }
        id v24 = [NSString stringWithFormat:@"%@ DisplayEvent: Unplugged Display On duration=%f", @"*******PLAWDMetricsService*******", *(void *)&v22];
        v31 = (void *)MEMORY[0x263F5F638];
        v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        v33 = [v32 lastPathComponent];
        v34 = [NSString stringWithUTF8String:"-[PLAWDDisplay updateDisplayMetrics:withState:]"];
        [v31 logMessage:v24 fromFile:v33 fromFunction:v34 fromLineNumber:461];

        uint64_t v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
LABEL_37:
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v35 = objc_opt_class();
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_136;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v35;
      if (updateDisplayMetrics_withState__defaultOnce_134 != -1) {
        dispatch_once(&updateDisplayMetrics_withState__defaultOnce_134, v43);
      }
      if (updateDisplayMetrics_withState__classDebugEnabled_135)
      {
        v36 = [NSString stringWithFormat:@"%@ DisplayEvent: currDisp=%d, prevDisp=%d currCharging=%d", @"*******PLAWDMetricsService*******", v4, -[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn"), -[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging")];
        uint64_t v37 = (void *)MEMORY[0x263F5F638];
        v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        BOOL v39 = [v38 lastPathComponent];
        int64_t v40 = [NSString stringWithUTF8String:"-[PLAWDDisplay updateDisplayMetrics:withState:]"];
        [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:468];

        BOOL v41 = PLLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDDisplay *)self setPrevDisplayOn:v4];
    return;
  }
  [(PLAWDDisplay *)self displayOnTimeStamp];
  double v12 = v9 - v11;
  if (v9 - v11 > 0.0)
  {
    if (v4) {
      uint64_t v13 = @"UnpluggedDispOnDur";
    }
    else {
      uint64_t v13 = @"PluggedDispOnDur";
    }
    [(PLAWDDisplay *)self addEntryToDisplayAlsTable:v13 withValue:v9 - v11];
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_142;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (updateDisplayMetrics_withState__defaultOnce_140 != -1) {
      dispatch_once(&updateDisplayMetrics_withState__defaultOnce_140, block);
    }
    if (updateDisplayMetrics_withState__classDebugEnabled_141)
    {
      id v15 = [NSString stringWithFormat:@"%@ :DisplayMetrics: currCharging=%d, prevCharging=%d currDisp=%d dur=%f", @"*******PLAWDMetricsService*******", v4, -[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging"), -[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn"), *(void *)&v12];
      v16 = (void *)MEMORY[0x263F5F638];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
      v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLAWDDisplay updateDisplayMetrics:withState:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:480];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  [(PLAWDDisplay *)self setDisplayOnTimeStamp:v9];
}

uint64_t __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateDisplayMetrics_withState__classDebugEnabled = result;
  return result;
}

uint64_t __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_130(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateDisplayMetrics_withState__classDebugEnabled_129 = result;
  return result;
}

uint64_t __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_136(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateDisplayMetrics_withState__classDebugEnabled_135 = result;
  return result;
}

uint64_t __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_142(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateDisplayMetrics_withState__classDebugEnabled_141 = result;
  return result;
}

- (void)updateMieMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x263EFF910] monotonicDate];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  BOOL v8 = [(PLAWDDisplay *)self prevMieOn];
  double v9 = 0.0;
  if (v3)
  {
    if (v8) {
      goto LABEL_8;
    }
    [(PLAWDDisplay *)self setMieOnTimeStamp:v7];
    BOOL v10 = @"MieOnCount";
    double v11 = 1.0;
    double v12 = self;
    goto LABEL_7;
  }
  if (v8)
  {
    [(PLAWDDisplay *)self displayOnTimeStamp];
    double v9 = v7 - v13;
    if (v7 - v13 > 0.0)
    {
      BOOL v10 = @"MieOnDur";
      double v12 = self;
      double v11 = v7 - v13;
LABEL_7:
      [(PLAWDDisplay *)v12 addEntryToDisplayAlsTable:v10 withValue:v11];
    }
  }
LABEL_8:
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__PLAWDDisplay_updateMieMetrics___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (updateMieMetrics__defaultOnce != -1) {
      dispatch_once(&updateMieMetrics__defaultOnce, block);
    }
    if (updateMieMetrics__classDebugEnabled)
    {
      id v15 = [NSString stringWithFormat:@"%@ : MieEvent: currMie=%d, prevMie=%d dur =%f", @"*******PLAWDMetricsService*******", v3, -[PLAWDDisplay prevMieOn](self, "prevMieOn"), *(void *)&v9];
      v16 = (void *)MEMORY[0x263F5F638];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
      v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLAWDDisplay updateMieMetrics:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:498];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  [(PLAWDDisplay *)self setPrevMieOn:v3];
}

uint64_t __33__PLAWDDisplay_updateMieMetrics___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  updateMieMetrics__classDebugEnabled = result;
  return result;
}

- (void)handleTouchCallback:(id)a3
{
  id v4 = a3;
  if ([(PLAWDDisplay *)self startTouchEntryId] < 0)
  {
    BOOL v5 = [v4 objectForKey:@"entry"];
    double v6 = v5;
    if (v5) {
      -[PLAWDDisplay setStartTouchEntryId:](self, "setStartTouchEntryId:", [v5 entryID]);
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__PLAWDDisplay_handleTouchCallback___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (handleTouchCallback__defaultOnce != -1) {
        dispatch_once(&handleTouchCallback__defaultOnce, block);
      }
      if (handleTouchCallback__classDebugEnabled)
      {
        BOOL v8 = [NSString stringWithFormat:@"%@ : Touch Callback: startTouchEntryId=%lld", @"*******PLAWDMetricsService*******", -[PLAWDDisplay startTouchEntryId](self, "startTouchEntryId")];
        double v9 = (void *)MEMORY[0x263F5F638];
        BOOL v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        double v11 = [v10 lastPathComponent];
        double v12 = [NSString stringWithUTF8String:"-[PLAWDDisplay handleTouchCallback:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:511];

        double v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
  }
}

uint64_t __36__PLAWDDisplay_handleTouchCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleTouchCallback__classDebugEnabled = result;
  return result;
}

- (void)handleDisplayCallback:(id)a3
{
  id v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    id v11 = v4;
    BOOL v5 = [v4 objectForKeyedSubscript:@"Active"];
    uint64_t v6 = [v5 BOOLValue];

    uint64_t v7 = [v11 objectForKeyedSubscript:@"Block"];
    int v8 = [v7 isEqualToString:@"Backlight"];

    if (v8)
    {
      [(PLAWDDisplay *)self updateDisplayMetrics:1 withState:v6];
    }
    else
    {
      double v9 = [v11 objectForKeyedSubscript:@"Block"];
      int v10 = [v9 isEqualToString:@"MIE"];

      id v4 = v11;
      if (!v10) {
        goto LABEL_7;
      }
      [(PLAWDDisplay *)self updateMieMetrics:v6];
    }
    id v4 = v11;
  }
LABEL_7:
}

- (void)handleBacklightCallback:(id)a3
{
  id v4 = [a3 objectForKey:@"entry"];
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"Brightness"];
    [v6 doubleValue];
    double v8 = v7;

    if (v8 <= 0.0)
    {
      int64_t v12 = -1;
    }
    else
    {
      double v9 = [v5 objectForKeyedSubscript:@"uAmps"];
      uint64_t v10 = [v9 longValue];
      id v11 = [v5 objectForKeyedSubscript:@"lux"];
      int64_t v12 = -[PLAWDDisplay getBklbucketIdx:withLux:](self, "getBklbucketIdx:withLux:", v10, [v11 longValue]);
    }
    if ([(PLAWDDisplay *)self prevBklBucketIdx] != v12)
    {
      if ([(PLAWDDisplay *)self prevBklBucketIdx] < 0)
      {
        double v18 = 0.0;
      }
      else
      {
        double v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx"));
        uint64_t v14 = [v5 entryDate];
        [v14 timeIntervalSince1970];
        double v16 = v15;
        [(PLAWDDisplay *)self bklTimeStamp];
        double v18 = v16 - v17;

        if (v18 > 0.0) {
          [(PLAWDDisplay *)self addEntryToDisplayAlsTable:v13 withValue:v18];
        }
      }
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v19 = objc_opt_class();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __40__PLAWDDisplay_handleBacklightCallback___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v19;
        if (handleBacklightCallback__defaultOnce != -1) {
          dispatch_once(&handleBacklightCallback__defaultOnce, block);
        }
        if (handleBacklightCallback__classDebugEnabled)
        {
          v20 = NSString;
          double v21 = [v5 objectForKeyedSubscript:@"uAmps"];
          uint64_t v22 = [v21 unsignedLongValue];
          uint64_t v23 = [v5 objectForKeyedSubscript:@"lux"];
          id v24 = [v20 stringWithFormat:@"%@ :Backlight Event: MicroAmps=%lu Lux=%lu prevBucketIdx=%ld duration=%f newBucketIdx=%ld", @"*******PLAWDMetricsService*******", v22, objc_msgSend(v23, "unsignedLongValue"), -[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx"), *(void *)&v18, v12];

          v25 = (void *)MEMORY[0x263F5F638];
          v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
          v27 = [v26 lastPathComponent];
          uint64_t v28 = [NSString stringWithUTF8String:"-[PLAWDDisplay handleBacklightCallback:]"];
          [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:577];

          uint64_t v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
        }
      }
      if (v12 < 0)
      {
        [(PLAWDDisplay *)self setPrevBklBucketIdx:-1];
      }
      else
      {
        [(PLAWDDisplay *)self setPrevBklBucketIdx:v12];
        uint64_t v30 = [v5 entryDate];
        [v30 timeIntervalSince1970];
        -[PLAWDDisplay setBklTimeStamp:](self, "setBklTimeStamp:");
      }
    }
  }
}

uint64_t __40__PLAWDDisplay_handleBacklightCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBacklightCallback__classDebugEnabled = result;
  return result;
}

- (void)handleAlsUserPreferencesCallback:(id)a3
{
  id v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"AlsCount" withValue:1.0];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __49__PLAWDDisplay_handleAlsUserPreferencesCallback___block_invoke;
      double v15 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v16 = v5;
      if (handleAlsUserPreferencesCallback__defaultOnce != -1) {
        dispatch_once(&handleAlsUserPreferencesCallback__defaultOnce, &block);
      }
      if (handleAlsUserPreferencesCallback__classDebugEnabled)
      {
        uint64_t v6 = [NSString stringWithFormat:@"%@ : ALS Curve changed by user", @"*******PLAWDMetricsService*******", block, v13, v14, v15, v16];
        double v7 = (void *)MEMORY[0x263F5F638];
        double v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        double v9 = [v8 lastPathComponent];
        uint64_t v10 = [NSString stringWithUTF8String:"-[PLAWDDisplay handleAlsUserPreferencesCallback:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:596];

        id v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
  }
}

uint64_t __49__PLAWDDisplay_handleAlsUserPreferencesCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleAlsUserPreferencesCallback__classDebugEnabled = result;
  return result;
}

- (void)handleBatteryCallback:(id)a3
{
  id v4 = [a3 objectForKey:@"entry"];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"AdapterInfo"];
    uint64_t v7 = [v6 BOOLValue];

    if ([(PLAWDDisplay *)self prevDisplayOn]
      && v7 != [(PLAWDDisplay *)self prevDeviceCharging])
    {
      [(PLAWDDisplay *)self updateDisplayMetrics:0 withState:v7];
    }
    BOOL v8 = [(PLAWDDisplay *)self prevDeviceCharging];
    if (v7)
    {
      if (v8) {
        goto LABEL_24;
      }
      double v9 = [MEMORY[0x263EFF910] monotonicDate];
      [v9 timeIntervalSince1970];
      double v11 = v10;

      [(PLAWDDisplay *)self bklPowerRailTimeStamp];
      double v13 = (v11 - v12) / 3600.0;
      [(PLAWDDisplay *)self prevBklPower];
      if (v14 > 0.0 && v13 > 0.0)
      {
        [(PLAWDDisplay *)self prevBklPower];
        [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"BacklightPower" withValue:v13 * v15];
      }
      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_24;
      }
      uint64_t v16 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__PLAWDDisplay_handleBatteryCallback___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (handleBatteryCallback__defaultOnce != -1) {
        dispatch_once(&handleBatteryCallback__defaultOnce, block);
      }
      if (!handleBatteryCallback__classDebugEnabled) {
        goto LABEL_24;
      }
      double v17 = NSString;
      [(PLAWDDisplay *)self prevBklPower];
      uint64_t v19 = [v17 stringWithFormat:@"%@ : BacklightPowerRail: Charger event - mWhr=%f ", @"*******PLAWDMetricsService*******", v13 * v18];
      v20 = (void *)MEMORY[0x263F5F638];
      double v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
      uint64_t v22 = [v21 lastPathComponent];
      uint64_t v23 = [NSString stringWithUTF8String:"-[PLAWDDisplay handleBatteryCallback:]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:619];

      id v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
    else
    {
      if (!v8) {
        goto LABEL_24;
      }
      v25 = [MEMORY[0x263EFF910] monotonicDate];
      [v25 timeIntervalSince1970];
      -[PLAWDDisplay setBklPowerRailTimeStamp:](self, "setBklPowerRailTimeStamp:");

      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_24;
      }
      uint64_t v26 = objc_opt_class();
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __38__PLAWDDisplay_handleBatteryCallback___block_invoke_172;
      v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v31[4] = v26;
      if (handleBatteryCallback__defaultOnce_170 != -1) {
        dispatch_once(&handleBatteryCallback__defaultOnce_170, v31);
      }
      if (!handleBatteryCallback__classDebugEnabled_171) {
        goto LABEL_24;
      }
      uint64_t v19 = [NSString stringWithFormat:@"%@ : BacklightPowerRail: Charger event - update timestamp ", @"*******PLAWDMetricsService*******"];
      v27 = (void *)MEMORY[0x263F5F638];
      uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
      uint64_t v29 = [v28 lastPathComponent];
      uint64_t v30 = [NSString stringWithUTF8String:"-[PLAWDDisplay handleBatteryCallback:]"];
      [v27 logMessage:v19 fromFile:v29 fromFunction:v30 fromLineNumber:624];

      id v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }

LABEL_24:
    [(PLAWDDisplay *)self setPrevDeviceCharging:v7];
  }
}

uint64_t __38__PLAWDDisplay_handleBatteryCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBatteryCallback__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAWDDisplay_handleBatteryCallback___block_invoke_172(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBatteryCallback__classDebugEnabled_171 = result;
  return result;
}

- (void)handleAlsEnabledCallback:(id)a3
{
  id v4 = [a3 objectForKey:@"entry"];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ALSEnabled"];
    uint64_t v7 = [v6 BOOLValue];

    if (v7 != [(PLAWDDisplay *)self prevAlsOn])
    {
      [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"AlsEnableCnt" withValue:1.0];
      [(PLAWDDisplay *)self setPrevAlsOn:v7];
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v8 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__PLAWDDisplay_handleAlsEnabledCallback___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (handleAlsEnabledCallback__defaultOnce != -1) {
        dispatch_once(&handleAlsEnabledCallback__defaultOnce, block);
      }
      if (handleAlsEnabledCallback__classDebugEnabled)
      {
        double v9 = [NSString stringWithFormat:@"%@ : ALS state changed by user. alsOn=%d", @"*******PLAWDMetricsService*******", v7];
        double v10 = (void *)MEMORY[0x263F5F638];
        double v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        double v12 = [v11 lastPathComponent];
        double v13 = [NSString stringWithUTF8String:"-[PLAWDDisplay handleAlsEnabledCallback:]"];
        [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:640];

        double v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
  }
}

uint64_t __41__PLAWDDisplay_handleAlsEnabledCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleAlsEnabledCallback__classDebugEnabled = result;
  return result;
}

- (void)finalizeDisplayAlsTable
{
  BOOL v3 = [MEMORY[0x263EFF910] monotonicDate];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  if ([(PLAWDDisplay *)self prevDisplayOn])
  {
    [(PLAWDDisplay *)self displayOnTimeStamp];
    double v7 = v5 - v6;
    if (v5 - v6 > 0.0)
    {
      if ([(PLAWDDisplay *)self prevDeviceCharging]) {
        uint64_t v8 = @"PluggedDispOnDur";
      }
      else {
        uint64_t v8 = @"UnpluggedDispOnDur";
      }
      [(PLAWDDisplay *)self addEntryToDisplayAlsTable:v8 withValue:v7];
    }
    if ([(PLAWDDisplay *)self prevMieOn])
    {
      [(PLAWDDisplay *)self mieOnTimeStamp];
      if (v5 - v9 > 0.0) {
        -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", @"MieOnDur");
      }
    }
    double v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx"));
    [(PLAWDDisplay *)self bklTimeStamp];
    if (v5 - v11 > 0.0) {
      -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", v10);
    }
    [(PLAWDDisplay *)self bklPowerRailTimeStamp];
    double v13 = v12;
    if (![(PLAWDDisplay *)self prevDeviceCharging])
    {
      [(PLAWDDisplay *)self prevBklPower];
      if (v14 > 0.0)
      {
        double v15 = (v5 - v13) / 3600.0;
        if (v15 > 0.0)
        {
          [(PLAWDDisplay *)self prevBklPower];
          [(PLAWDDisplay *)self addEntryToDisplayAlsTable:@"BacklightPower" withValue:v15 * v16];
        }
      }
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __39__PLAWDDisplay_finalizeDisplayAlsTable__block_invoke;
      v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v34[4] = v17;
      if (finalizeDisplayAlsTable_defaultOnce != -1) {
        dispatch_once(&finalizeDisplayAlsTable_defaultOnce, v34);
      }
      if (finalizeDisplayAlsTable_classDebugEnabled)
      {
        double v18 = NSString;
        [(PLAWDDisplay *)self prevBklPower];
        v20 = [v18 stringWithFormat:@"%@ : Finalize Display table backlightpower=%f dur=%f", @"*******PLAWDMetricsService*******", v19, *(void *)&v7];
        double v21 = (void *)MEMORY[0x263F5F638];
        uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
        uint64_t v23 = [v22 lastPathComponent];
        id v24 = [NSString stringWithUTF8String:"-[PLAWDDisplay finalizeDisplayAlsTable]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:672];

        v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v26 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__PLAWDDisplay_finalizeDisplayAlsTable__block_invoke_184;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v26;
    if (finalizeDisplayAlsTable_defaultOnce_182 != -1) {
      dispatch_once(&finalizeDisplayAlsTable_defaultOnce_182, block);
    }
    if (finalizeDisplayAlsTable_classDebugEnabled_183)
    {
      v27 = [NSString stringWithFormat:@"%@ : Finalize Display table", @"*******PLAWDMetricsService*******"];
      uint64_t v28 = (void *)MEMORY[0x263F5F638];
      uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
      uint64_t v30 = [v29 lastPathComponent];
      v31 = [NSString stringWithUTF8String:"-[PLAWDDisplay finalizeDisplayAlsTable]"];
      [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:676];

      v32 = PLLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __39__PLAWDDisplay_finalizeDisplayAlsTable__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  finalizeDisplayAlsTable_classDebugEnabled = result;
  return result;
}

uint64_t __39__PLAWDDisplay_finalizeDisplayAlsTable__block_invoke_184(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  finalizeDisplayAlsTable_classDebugEnabled_183 = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v254 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  double v9 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
  double v10 = [MEMORY[0x263EFF910] monotonicDate];
  [v9 timeIntervalSince1970];
  double v12 = v11;
  [v10 timeIntervalSince1970];
  double v14 = v13;

  if (v8)
  {
    uint64_t v15 = [v6 longValue];
    if (v15 == 2031625)
    {
      uint64_t v52 = [(PLAWDDisplay *)self touchEventCallback];
      [v52 requestEntry];

      sleep(5u);
      double v16 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F9D8]];
      v53 = [(PLAWDAuxMetrics *)self operator];
      v54 = [v53 storage];
      uint64_t v19 = objc_msgSend(v54, "entryForKey:withID:", v16, -[PLAWDDisplay startTouchEntryId](self, "startTouchEntryId"));

      v55 = [(PLAWDAuxMetrics *)self operator];
      v56 = [v55 storage];
      v20 = [v56 lastEntryForKey:v16];

      double v21 = objc_opt_new();
      if (v21)
      {
        objc_msgSend(v21, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
        [v21 setTouchStateOnDuration:0];
        [v21 setTouchStateOffDuration:0];
        [v21 setTouchStateActiveDuration:0];
        [v21 setTouchStateReadyDuration:0];
        [v21 setTouchStateAnticipateDuration:0];
        [v21 setTouchStateOthersDuration:0];
        double v57 = 0.0;
        v240 = self;
        v242 = v21;
        if (v19 && v20)
        {
          v58 = [v20 objectForKeyedSubscript:@"On"];
          [v58 doubleValue];
          double v60 = v59;
          v61 = [v19 objectForKeyedSubscript:@"On"];
          [v61 doubleValue];
          double v63 = v60 - v62;

          if (v63 > 0.0) {
            [v242 setTouchStateOnDuration:v63];
          }
          v64 = [v20 objectForKeyedSubscript:@"Off"];
          [v64 doubleValue];
          double v66 = v65;
          v67 = [v19 objectForKeyedSubscript:@"Off"];
          [v67 doubleValue];
          double v69 = v66 - v68;

          if (v69 > 0.0) {
            [v242 setTouchStateOffDuration:v69];
          }
          v70 = [v20 objectForKeyedSubscript:@"Active"];
          [v70 doubleValue];
          double v72 = v71;
          v73 = [v19 objectForKeyedSubscript:@"Active"];
          [v73 doubleValue];
          double v75 = v72 - v74;

          if (v75 > 0.0) {
            [v242 setTouchStateActiveDuration:v75];
          }
          v76 = [v20 objectForKeyedSubscript:@"Ready"];
          [v76 doubleValue];
          double v78 = v77;
          v79 = [v19 objectForKeyedSubscript:@"Ready"];
          [v79 doubleValue];
          double v81 = v78 - v80;

          if (v81 > 0.0) {
            [v242 setTouchStateReadyDuration:v81];
          }
          id v227 = v7;
          v230 = v16;
          v225 = v8;
          v82 = [v20 objectForKeyedSubscript:@"Anticipate"];
          [v82 doubleValue];
          double v84 = v83;
          v85 = [v19 objectForKeyedSubscript:@"Anticipate"];
          [v85 doubleValue];
          double v87 = v84 - v86;

          if (v87 > 0.0) {
            [v242 setTouchStateAnticipateDuration:v87];
          }
          v237 = [v20 objectForKeyedSubscript:@"AutoReady"];
          [v237 doubleValue];
          double v89 = v88;
          v233 = [v20 objectForKeyedSubscript:@"AutoScan"];
          [v233 doubleValue];
          double v91 = v89 + v90;
          v223 = [v20 objectForKeyedSubscript:@"FaceDetected"];
          [v223 doubleValue];
          double v93 = v91 + v92;
          v220 = [v20 objectForKeyedSubscript:@"StationaryFingers"];
          [v220 doubleValue];
          double v95 = v93 + v94;
          v218 = [v20 objectForKeyedSubscript:@"UILock"];
          [v218 doubleValue];
          double v97 = v95 + v96;
          v216 = [v20 objectForKeyedSubscript:@"Unknown"];
          [v216 doubleValue];
          double v99 = v97 + v98;
          v214 = [v20 objectForKeyedSubscript:@"VSFOMCal"];
          [v214 doubleValue];
          double v101 = v99 + v100;
          v102 = [v19 objectForKeyedSubscript:@"AutoReady"];
          [v102 doubleValue];
          double v104 = v103;
          v105 = [v19 objectForKeyedSubscript:@"AutoScan"];
          [v105 doubleValue];
          double v107 = v104 + v106;
          v108 = [v19 objectForKeyedSubscript:@"FaceDetected"];
          [v108 doubleValue];
          double v110 = v107 + v109;
          v111 = [v19 objectForKeyedSubscript:@"StationaryFingers"];
          [v111 doubleValue];
          double v113 = v110 + v112;
          v114 = [v19 objectForKeyedSubscript:@"UILock"];
          [v114 doubleValue];
          double v116 = v113 + v115;
          [v19 objectForKeyedSubscript:@"Unknown"];
          v118 = v117 = v20;
          [v118 doubleValue];
          double v120 = v116 + v119;
          [v19 objectForKeyedSubscript:@"VSFOMCal"];
          v122 = v121 = v19;
          [v122 doubleValue];
          double v57 = v101 - (v120 + v123);

          uint64_t v19 = v121;
          v20 = v117;

          double v21 = v242;
          [v242 setTouchStateOthersDuration:v57];
          uint64_t v8 = v225;
          id v7 = v227;
          self = v240;
          double v16 = v230;
        }
        [(PLAWDDisplay *)self setTouchSubmitCnt:[(PLAWDDisplay *)self touchSubmitCnt] + 1];
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v124 = objc_opt_class();
          v244[0] = MEMORY[0x263EF8330];
          v244[1] = 3221225472;
          v244[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_272;
          v244[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v244[4] = v124;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_270 != -1) {
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_270, v244);
          }
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_271)
          {
            v234 = v20;
            v238 = v19;
            v125 = [NSString stringWithFormat:@"%@ : Submit Touch stats: submit cnt=%ld metric=%@", @"*******PLAWDMetricsService*******", -[PLAWDDisplay touchSubmitCnt](v240, "touchSubmitCnt"), v21];
            v126 = (void *)MEMORY[0x263F5F638];
            v127 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
            v128 = [v127 lastPathComponent];
            v129 = [NSString stringWithUTF8String:"-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]"];
            [v126 logMessage:v125 fromFile:v128 fromFunction:v129 fromLineNumber:893];

            v130 = PLLogCommon();
            if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG)) {
              -[PLAWDDisplay startMetricCollection:]();
            }

            v20 = v234;
            uint64_t v19 = v238;
            double v21 = v242;
          }
        }
        self = v240;
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v131 = objc_opt_class();
          v243[0] = MEMORY[0x263EF8330];
          v243[1] = 3221225472;
          v243[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_278;
          v243[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v243[4] = v131;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_276 != -1) {
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_276, v243);
          }
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_277)
          {
            id v228 = v7;
            v231 = v16;
            id v224 = v6;
            v226 = v8;
            v219 = NSString;
            uint64_t v217 = [v19 entryID];
            uint64_t v215 = [v20 entryID];
            v221 = [v20 objectForKeyedSubscript:@"On"];
            [v221 doubleValue];
            double v133 = v132;
            v134 = [v19 objectForKeyedSubscript:@"On"];
            [v134 doubleValue];
            double v136 = v133 - v135;
            v137 = v19;
            [v20 objectForKeyedSubscript:@"Off"];
            v139 = v138 = v20;
            [v139 doubleValue];
            double v141 = v140;
            v142 = [v19 objectForKeyedSubscript:@"Off"];
            [v142 doubleValue];
            double v144 = v141 - v143;
            v145 = [v138 objectForKeyedSubscript:@"Ready"];
            [v145 doubleValue];
            double v147 = v146;
            v148 = [v19 objectForKeyedSubscript:@"Ready"];
            [v148 doubleValue];
            double v150 = v147 - v149;
            v151 = [v138 objectForKeyedSubscript:@"Anticipate"];
            [v151 doubleValue];
            double v153 = v152;
            v154 = [v137 objectForKeyedSubscript:@"Anticipate"];
            [v154 doubleValue];
            double v156 = v153 - v155;
            v235 = v138;
            v157 = [v138 objectForKeyedSubscript:@"Active"];
            [v157 doubleValue];
            double v159 = v158;
            v239 = v137;
            v160 = [v137 objectForKeyedSubscript:@"Active"];
            [v160 doubleValue];
            v162 = [v219 stringWithFormat:@"%@ : Submit Touch stats: start.entryId=%llu end.entryId=%llu On=%f Off=%f Ready=%f Anticipate=%f Active=%f Others=%f", @"*******PLAWDMetricsService*******", v217, v215, *(void *)&v136, *(void *)&v144, *(void *)&v150, *(void *)&v156, v159 - v161, *(void *)&v57];

            v163 = (void *)MEMORY[0x263F5F638];
            v164 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
            v165 = [v164 lastPathComponent];
            v166 = [NSString stringWithUTF8String:"-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]"];
            [v163 logMessage:v162 fromFile:v165 fromFunction:v166 fromLineNumber:895];

            v167 = PLLogCommon();
            if (os_log_type_enabled(v167, OS_LOG_TYPE_DEBUG)) {
              -[PLAWDDisplay startMetricCollection:]();
            }

            id v6 = v224;
            uint64_t v8 = v226;
            id v7 = v228;
            double v16 = v231;
            uint64_t v19 = v239;
            self = v240;
            v20 = v235;
            double v21 = v242;
          }
        }
        [v8 setMetric:v21];
      }
      if (v20)
      {
        -[PLAWDDisplay setStartTouchEntryId:](self, "setStartTouchEntryId:", [v20 entryID]);
      }
      else
      {
        [(PLAWDDisplay *)self setStartTouchEntryId:-1];
        v168 = [(PLAWDDisplay *)self touchEventCallback];
        [v168 requestEntry];
      }
      goto LABEL_104;
    }
    if (v15 == 2031622)
    {
      [(PLAWDDisplay *)self finalizeDisplayAlsTable];
      double v16 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"DisplayAlsMetrics"];
      uint64_t v17 = [(PLAWDAuxMetrics *)self operator];
      double v18 = [v17 storage];
      uint64_t v19 = objc_msgSend(v18, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v16, 86400.0, v12, v14 - v12);

      v20 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v19];
      double v21 = objc_opt_new();
      v241 = v21;
      v232 = v20;
      v236 = v19;
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v22 = objc_opt_class();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v22;
        if (submitDataToAWDServer_withAwdConn__defaultOnce != -1) {
          dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce, block);
        }
        if (submitDataToAWDServer_withAwdConn__classDebugEnabled)
        {
          uint64_t v23 = [NSString stringWithFormat:@"%@ : %@", @"*******PLAWDMetricsService*******", v20];
          id v24 = (void *)MEMORY[0x263F5F638];
          v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
          uint64_t v26 = [v25 lastPathComponent];
          v27 = [NSString stringWithUTF8String:"-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]"];
          [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:698];

          uint64_t v28 = PLLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }

          v20 = v232;
          uint64_t v19 = v236;
          double v21 = v241;
        }
      }
      if (v21)
      {
        v229 = v16;
        objc_msgSend(v21, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
        memset(v253, 0, 140);
        [v21 setPluggedDisplayOnDuration:0];
        [v21 setUnpluggedDisplayOnDuration:0];
        [v21 setDispOnCount:0];
        [v21 setMieCount:0];
        [v21 setMieDuration:0];
        [v21 setTotalDisplayPower:0];
        [v21 setTotalBacklightPower:0];
        [v21 setAlsAutoBrightnessChangeCount:0];
        [v21 setAlsAutoBrightnessLux:0];
        [v21 setAlsAutoBrightnessSlider:0];
        [v21 setAlsBrightnessEnableCnt:0];
        [v21 setDisplayIdlePercentage:0];
        [v21 setAlsAutoBrightnessCurveE0A:0];
        [v21 setAlsAutoBrightnessCurveE0B:0];
        [v21 setAlsAutoBrightnessCurveE1:0];
        [v21 setAlsAutoBrightnessCurveE2:0];
        [v21 setAlsAutoBrightnessCurveL0A:0];
        [v21 setAlsAutoBrightnessCurveL0B:0];
        [v21 setAlsAutoBrightnessCurveL1:0];
        [v21 setAlsAutoBrightnessCurveL2:0];
        [v21 setAlsAutoBrightnessSlider:0];
        [v21 setAlsAutoBrightnessCurveEdynth:0];
        long long v249 = 0u;
        long long v250 = 0u;
        long long v247 = 0u;
        long long v248 = 0u;
        id v29 = v20;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v247 objects:v252 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          id v222 = v6;
          uint64_t v32 = *(void *)v248;
          double v33 = 0.0;
          double v34 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v248 != v32) {
                objc_enumerationMutation(v29);
              }
              v36 = *(void **)(*((void *)&v247 + 1) + 8 * i);
              uint64_t v37 = [v36 objectForKeyedSubscript:@"MetricsKey"];
              v38 = [v36 objectForKeyedSubscript:@"MetricsValue"];
              [v38 doubleValue];
              double v40 = v39;

              if ([v37 isEqualToString:@"UnpluggedDispOnDur"])
              {
                double v34 = v34 + v40;
                [v241 setUnpluggedDisplayOnDuration:(v40 * 1000.0)];
              }
              else if ([v37 isEqualToString:@"PluggedDispOnDur"])
              {
                double v34 = v34 + v40;
                [v241 setPluggedDisplayOnDuration:(v40 * 1000.0)];
              }
              else if ([v37 isEqualToString:@"DisplayOnCount"])
              {
                [v241 setDispOnCount:v40];
              }
              else if ([v37 isEqualToString:@"MieOnCount"])
              {
                [v241 setMieCount:v40];
              }
              else if ([v37 isEqualToString:@"MieOnDur"])
              {
                [v241 setMieDuration:(v40 * 1000.0)];
              }
              else if ([v37 isEqualToString:@"DisplayPower"])
              {
                [v241 setTotalDisplayPower:(v40 * 1000.0)];
              }
              else if ([v37 isEqualToString:@"BacklightPower"])
              {
                [v241 setTotalBacklightPower:(v40 * 1000.0)];
              }
              else if ([v37 isEqualToString:@"IdlePercentDur"])
              {
                double v33 = v40;
              }
              else if ([v37 isEqualToString:@"AlsCount"])
              {
                [v241 setAlsAutoBrightnessChangeCount:v40];
              }
              else if ([v37 isEqualToString:@"AlsEnableCnt"])
              {
                [v241 setAlsBrightnessEnableCnt:v40];
              }
              else
              {
                unsigned int v41 = [v37 intValue];
                if ((v41 & 0x80000000) == 0) {
                  *((_DWORD *)v253 + v41) = (v40 * 1000.0);
                }
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v247 objects:v252 count:16];
          }
          while (v31);

          id v6 = v222;
          uint64_t v19 = v236;
          if (v34 > 0.0)
          {
            if ([MEMORY[0x263F5F640] debugEnabled])
            {
              uint64_t v42 = objc_opt_class();
              v246[0] = MEMORY[0x263EF8330];
              v246[1] = 3221225472;
              v246[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_194;
              v246[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v246[4] = v42;
              if (submitDataToAWDServer_withAwdConn__defaultOnce_192 != -1) {
                dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_192, v246);
              }
              if (submitDataToAWDServer_withAwdConn__classDebugEnabled_193)
              {
                uint64_t v43 = [NSString stringWithFormat:@"%@ : Submit Disp idle duration: dispDur=%f dispIdleDur=%f", @"*******PLAWDMetricsService*******", *(void *)&v34, *(void *)&v33];
                v44 = (void *)MEMORY[0x263F5F638];
                v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
                v46 = [v45 lastPathComponent];
                v47 = [NSString stringWithUTF8String:"-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]"];
                [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:779];

                v48 = PLLogCommon();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
                  -[PLAWDDisplay startMetricCollection:]();
                }

                uint64_t v19 = v236;
              }
            }
            double v49 = v33 * 100.0 / v34;
            if (v49 > 0.0 && v49 <= 100.0) {
              [v241 setDisplayIdlePercentage:v49];
            }
          }
        }
        else
        {

          uint64_t v19 = v236;
        }
        id v169 = objc_alloc_init(MEMORY[0x263EFF980]);
        for (uint64_t j = 0; j != 140; j += 4)
        {
          id v171 = objc_alloc_init(MEMORY[0x263F8AFF0]);
          [v171 setBucketDuration:*(unsigned int *)((char *)v253 + j)];
          [v169 addObject:v171];
        }
        double v21 = v241;
        [v241 setBacklightBuckets:v169];
        if (([MEMORY[0x263F5F668] isMac] & 1) == 0)
        {
          v172 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F9E8]];
          v173 = [(PLAWDAuxMetrics *)self operator];
          v174 = [v173 storage];
          v175 = [v174 lastEntryForKey:v172];

          if (v175)
          {
            v176 = [v175 objectForKeyedSubscript:@"E0a"];
            [v176 doubleValue];
            double v178 = v177;

            [v241 setAlsAutoBrightnessCurveE0A:(int)v178];
            v179 = [v175 objectForKeyedSubscript:@"E0b"];
            [v179 doubleValue];
            double v181 = v180;

            [v241 setAlsAutoBrightnessCurveE0B:(int)v181];
            v182 = [v175 objectForKeyedSubscript:@"E1"];
            [v182 doubleValue];
            double v184 = v183;

            [v241 setAlsAutoBrightnessCurveE1:(int)v184];
            v185 = [v175 objectForKeyedSubscript:@"E2"];
            [v185 doubleValue];
            double v187 = v186;

            [v241 setAlsAutoBrightnessCurveE2:(int)v187];
            v188 = [v175 objectForKeyedSubscript:@"L0a"];
            [v188 doubleValue];
            double v190 = v189;

            [v241 setAlsAutoBrightnessCurveL0A:(int)v190];
            v191 = [v175 objectForKeyedSubscript:@"L0b"];
            [v191 doubleValue];
            double v193 = v192;

            [v241 setAlsAutoBrightnessCurveL0B:(int)v193];
            v194 = [v175 objectForKeyedSubscript:@"L1"];
            [v194 doubleValue];
            double v196 = v195;

            [v241 setAlsAutoBrightnessCurveL1:(int)v196];
            v197 = [v175 objectForKeyedSubscript:@"L2"];
            [v197 doubleValue];
            double v199 = v198;

            [v241 setAlsAutoBrightnessCurveL2:(int)v199];
            v200 = [v175 objectForKeyedSubscript:@"S"];
            [v200 doubleValue];
            double v202 = v201;

            [v241 setAlsAutoBrightnessSlider:v202];
            v203 = [v175 objectForKeyedSubscript:@"Lux"];
            [v203 doubleValue];
            double v205 = v204;

            [v241 setAlsAutoBrightnessLux:v205];
          }

          double v21 = v241;
        }
        [(PLAWDDisplay *)self setDispSubmitCnt:[(PLAWDDisplay *)self dispSubmitCnt] + 1];
        v20 = v232;
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v206 = objc_opt_class();
          v245[0] = MEMORY[0x263EF8330];
          v245[1] = 3221225472;
          v245[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_232;
          v245[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v245[4] = v206;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_230 != -1) {
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_230, v245);
          }
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_231)
          {
            v207 = [NSString stringWithFormat:@"%@ : Submit Display stats: submit cnt=%ld ", @"*******PLAWDMetricsService*******", -[PLAWDDisplay dispSubmitCnt](self, "dispSubmitCnt")];
            v208 = (void *)MEMORY[0x263F5F638];
            v209 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m"];
            v210 = [v209 lastPathComponent];
            v211 = [NSString stringWithUTF8String:"-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]"];
            [v208 logMessage:v207 fromFile:v210 fromFunction:v211 fromLineNumber:835];

            v212 = PLLogCommon();
            if (os_log_type_enabled(v212, OS_LOG_TYPE_DEBUG)) {
              -[PLAWDDisplay startMetricCollection:]();
            }

            v20 = v232;
            uint64_t v19 = v236;
            double v21 = v241;
          }
        }
        [v8 setMetric:v21];

        double v16 = v229;
      }
      [(PLAWDDisplay *)self reInitDisplayBacklightAlsStats];
LABEL_104:
      char v51 = [v7 submitMetric:v8];

      goto LABEL_105;
    }
    char v51 = 0;
  }
  else
  {
    char v51 = 1;
  }
LABEL_105:

  return v51;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_194(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_193 = result;
  return result;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_232(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_231 = result;
  return result;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_272(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_271 = result;
  return result;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_278(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_277 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)displayEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDisplayEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)backlightEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBacklightEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)alsUserPreferencesEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAlsUserPreferencesEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBatteryEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)backlightRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBacklightRailCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)touchEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTouchEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)alsEnabledEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAlsEnabledEventCallback:(id)a3
{
}

- (BOOL)prevDisplayOn
{
  return self->_prevDisplayOn;
}

- (void)setPrevDisplayOn:(BOOL)a3
{
  self->_prevDisplayOn = a3;
}

- (double)displayOnTimeStamp
{
  return self->_displayOnTimeStamp;
}

- (void)setDisplayOnTimeStamp:(double)a3
{
  self->_displayOnTimeStamp = a3;
}

- (BOOL)prevDeviceCharging
{
  return self->_prevDeviceCharging;
}

- (void)setPrevDeviceCharging:(BOOL)a3
{
  self->_prevDeviceCharging = a3;
}

- (BOOL)prevMieOn
{
  return self->_prevMieOn;
}

- (void)setPrevMieOn:(BOOL)a3
{
  self->_prevMieOn = a3;
}

- (double)mieOnTimeStamp
{
  return self->_mieOnTimeStamp;
}

- (void)setMieOnTimeStamp:(double)a3
{
  self->_mieOnTimeStamp = a3;
}

- (double)bklTimeStamp
{
  return self->_bklTimeStamp;
}

- (void)setBklTimeStamp:(double)a3
{
  self->_bklTimeStamp = a3;
}

- (int64_t)prevBklBucketIdx
{
  return self->_prevBklBucketIdx;
}

- (void)setPrevBklBucketIdx:(int64_t)a3
{
  self->_prevBklBucketIdx = a3;
}

- (double)prevBklChgTimeStamp
{
  return self->_prevBklChgTimeStamp;
}

- (void)setPrevBklChgTimeStamp:(double)a3
{
  self->_prevBklChgTimeStamp = a3;
}

- (int64_t)startTouchEntryId
{
  return self->_startTouchEntryId;
}

- (void)setStartTouchEntryId:(int64_t)a3
{
  self->_startTouchEntryId = a3;
}

- (double)bklPowerRailTimeStamp
{
  return self->_bklPowerRailTimeStamp;
}

- (void)setBklPowerRailTimeStamp:(double)a3
{
  self->_bklPowerRailTimeStamp = a3;
}

- (int64_t)dispSubmitCnt
{
  return self->_dispSubmitCnt;
}

- (void)setDispSubmitCnt:(int64_t)a3
{
  self->_dispSubmitCnt = a3;
}

- (int64_t)touchSubmitCnt
{
  return self->_touchSubmitCnt;
}

- (void)setTouchSubmitCnt:(int64_t)a3
{
  self->_touchSubmitCnt = a3;
}

- (BOOL)prevAlsOn
{
  return self->_prevAlsOn;
}

- (void)setPrevAlsOn:(BOOL)a3
{
  self->_prevAlsOn = a3;
}

- (double)prevBklPower
{
  return self->_prevBklPower;
}

- (void)setPrevBklPower:(double)a3
{
  self->_prevBklPower = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alsEnabledEventCallback, 0);
  objc_storeStrong((id *)&self->_touchEventCallback, 0);
  objc_storeStrong((id *)&self->_backlightRailCallback, 0);
  objc_storeStrong((id *)&self->_batteryEventCallback, 0);
  objc_storeStrong((id *)&self->_alsUserPreferencesEventCallback, 0);
  objc_storeStrong((id *)&self->_backlightEventCallback, 0);

  objc_storeStrong((id *)&self->_displayEventCallback, 0);
}

- (void)startMetricCollection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2309F8000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

@end