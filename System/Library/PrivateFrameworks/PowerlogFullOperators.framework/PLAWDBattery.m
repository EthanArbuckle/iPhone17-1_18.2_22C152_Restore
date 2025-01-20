@interface PLAWDBattery
+ (id)entryAggregateDefinitionAwdBattery;
+ (id)entryAggregateDefinitions;
+ (id)getSharedObjWithOperator:(id)a3;
- (BOOL)isDeviceCharging:(id)a3;
- (BOOL)prevDeviceCharging;
- (BOOL)prevDisplayON;
- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (PLEntryNotificationOperatorComposition)batteryEventCallback;
- (PLEntryNotificationOperatorComposition)displayEventCallback;
- (double)prevCapacity;
- (double)prevDispTimeStamp;
- (double)prevVoltage;
- (int64_t)batterySubmitCnt;
- (int64_t)dispOnOffCnt;
- (void)addEntryToBatteryTable:(id)a3 withValue:(double)a4;
- (void)finalizeBatteryTable;
- (void)handleBatteryCallback:(id)a3;
- (void)handleDisplayCallback:(id)a3;
- (void)initBatteryStats;
- (void)processEnergyConsumedAndAddEntry:(double)a3 withVoltage:(double)a4;
- (void)reInitBatteryStats;
- (void)resetBatteryTable;
- (void)setBatteryEventCallback:(id)a3;
- (void)setBatterySubmitCnt:(int64_t)a3;
- (void)setDispOnOffCnt:(int64_t)a3;
- (void)setDisplayEventCallback:(id)a3;
- (void)setPrevCapacity:(double)a3;
- (void)setPrevDeviceCharging:(BOOL)a3;
- (void)setPrevDispTimeStamp:(double)a3;
- (void)setPrevDisplayON:(BOOL)a3;
- (void)setPrevVoltage:(double)a3;
- (void)startMetricCollection:(id)a3;
- (void)stopMetricCollection:(id)a3;
@end

@implementation PLAWDBattery

+ (id)getSharedObjWithOperator:(id)a3
{
  v3 = (void *)plAwdBattery;
  if (!plAwdBattery)
  {
    id v4 = a3;
    v5 = [(PLAWDAuxMetrics *)[PLAWDBattery alloc] initWithOperator:v4];

    v6 = (void *)plAwdBattery;
    plAwdBattery = (uint64_t)v5;

    v3 = (void *)plAwdBattery;
  }

  return v3;
}

+ (id)entryAggregateDefinitions
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"BatteryMetrics";
  v2 = [a1 entryAggregateDefinitionAwdBattery];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryAggregateDefinitionAwdBattery
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v21[0] = *MEMORY[0x263F5F880];
  v21[1] = v2;
  v22[0] = &unk_26E546600;
  v22[1] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v3;
  v23[1] = *MEMORY[0x263F5F870];
  v19[0] = @"BatteryMetricsKey";
  id v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v19[1] = @"BatteryMetricsValue";
  v20[0] = v5;
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v20[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  v23[2] = *MEMORY[0x263F5F828];
  v17 = &unk_26E546610;
  uint64_t v15 = *MEMORY[0x263F5F820];
  v16 = &unk_26E546610;
  v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v24[2] = v10;
  v23[3] = *MEMORY[0x263F5F830];
  v14 = @"BatteryMetricsValue";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v24[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (void)startMetricCollection:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 addObject:v4];

  if ([v4 longValue] == 2031623)
  {
    [(PLAWDBattery *)self initBatteryStats];
    v6 = [MEMORY[0x263F5F8D0] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F998]];
    id v7 = objc_alloc(MEMORY[0x263F5F658]);
    v8 = [(PLAWDAuxMetrics *)self operator];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __38__PLAWDBattery_startMetricCollection___block_invoke;
    v31[3] = &unk_264B99DD0;
    v31[4] = self;
    v9 = [v7 initWithOperator:v8 forEntryKey:v6 withBlock:v31];

    [(PLAWDBattery *)self setBatteryEventCallback:v9];
    if ([MEMORY[0x263F5F8E8] shouldLogDisplay])
    {
      v10 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F9F8]];
      id v11 = objc_alloc(MEMORY[0x263F5F658]);
      v12 = [(PLAWDAuxMetrics *)self operator];
      v32 = &unk_26E546740;
      v33 = @"Backlight";
      v34 = @"Block";
      v13 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v35[0] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __38__PLAWDBattery_startMetricCollection___block_invoke_53;
      v30[3] = &unk_264B99DD0;
      v30[4] = self;
      uint64_t v15 = (void *)[v11 initWithOperator:v12 forEntryKey:v10 withFilter:v14 withBlock:v30];

      [(PLAWDBattery *)self setDisplayEventCallback:v15];
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__PLAWDBattery_startMetricCollection___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (startMetricCollection__defaultOnce_1 != -1) {
        dispatch_once(&startMetricCollection__defaultOnce_1, block);
      }
      if (startMetricCollection__classDebugEnabled_1)
      {
        v17 = [NSString stringWithFormat:@"%@ : Start Battery collection ", @"*******PLAWDMetricsService*******"];
        v18 = (void *)MEMORY[0x263F5F638];
        v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
        v20 = [v19 lastPathComponent];
        v21 = [NSString stringWithUTF8String:"-[PLAWDBattery startMetricCollection:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:104];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
LABEL_17:

    goto LABEL_18;
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __38__PLAWDBattery_startMetricCollection___block_invoke_67;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v23;
    if (startMetricCollection__defaultOnce_65 != -1) {
      dispatch_once(&startMetricCollection__defaultOnce_65, v28);
    }
    if (startMetricCollection__classDebugEnabled_66)
    {
      v6 = [NSString stringWithFormat:@"Unsupported metric for battery class %@", v4];
      v24 = (void *)MEMORY[0x263F5F638];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLAWDBattery startMetricCollection:]"];
      [v24 logMessage:v6 fromFile:v26 fromFunction:v27 fromLineNumber:108];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
      goto LABEL_17;
    }
  }
LABEL_18:
}

uint64_t __38__PLAWDBattery_startMetricCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleBatteryCallback:a2];
  }
  return result;
}

uint64_t __38__PLAWDBattery_startMetricCollection___block_invoke_53(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleDisplayCallback:a2];
  }
  return result;
}

uint64_t __38__PLAWDBattery_startMetricCollection___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled_1 = result;
  return result;
}

uint64_t __38__PLAWDBattery_startMetricCollection___block_invoke_67(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled_66 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  id v4 = a3;
  if ([v4 longValue] == 2031623)
  {
    [(PLAWDBattery *)self setBatteryEventCallback:0];
    [(PLAWDBattery *)self setDisplayEventCallback:0];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __37__PLAWDBattery_stopMetricCollection___block_invoke;
      v19 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v20 = v5;
      if (stopMetricCollection__defaultOnce_1 != -1) {
        dispatch_once(&stopMetricCollection__defaultOnce_1, &block);
      }
      if (stopMetricCollection__classDebugEnabled_1)
      {
        v6 = [NSString stringWithFormat:@"%@ : Stop Battery collection ", @"*******PLAWDMetricsService*******", block, v17, v18, v19, v20];
        id v7 = (void *)MEMORY[0x263F5F638];
        v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
        v9 = [v8 lastPathComponent];
        v10 = [NSString stringWithUTF8String:"-[PLAWDBattery stopMetricCollection:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:119];

        id v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
  }
  v12 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v12 removeObject:v4];

  v13 = [(PLAWDAuxMetrics *)self runningMetrics];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    uint64_t v15 = (void *)plAwdBattery;
    plAwdBattery = 0;
  }
}

uint64_t __37__PLAWDBattery_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopMetricCollection__classDebugEnabled_1 = result;
  return result;
}

- (void)initBatteryStats
{
  [(PLAWDBattery *)self setBatterySubmitCnt:0];
  [(PLAWDBattery *)self setPrevDisplayON:0];
  [(PLAWDBattery *)self setDispOnOffCnt:0];
  [(PLAWDBattery *)self setPrevDispTimeStamp:0.0];
  [(PLAWDBattery *)self setPrevCapacity:0.0];
  [(PLAWDBattery *)self setPrevVoltage:0.0];
  [(PLAWDBattery *)self setPrevDeviceCharging:0];
  [(PLAWDBattery *)self resetBatteryTable];
  v3 = [MEMORY[0x263F5F8D0] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F998]];
  id v4 = [(PLAWDAuxMetrics *)self operator];
  uint64_t v5 = [v4 storage];
  v6 = [v5 lastEntryForKey:v3];

  id v7 = [MEMORY[0x263EFF910] monotonicDate];
  [v7 timeIntervalSince1970];
  -[PLAWDBattery setPrevDispTimeStamp:](self, "setPrevDispTimeStamp:");
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:@"Voltage"];
    [v8 doubleValue];
    -[PLAWDBattery setPrevVoltage:](self, "setPrevVoltage:");

    [(PLAWDBattery *)self setPrevDeviceCharging:[(PLAWDBattery *)self isDeviceCharging:v6]];
    v9 = [v6 objectForKeyedSubscript:@"CurrentCapacity"];
    [v9 doubleValue];
    -[PLAWDBattery setPrevCapacity:](self, "setPrevCapacity:");
  }
  if ([MEMORY[0x263F5F8E8] shouldLogDisplay]
    && ![(PLAWDBattery *)self prevDeviceCharging])
  {
    v10 = [MEMORY[0x263F5F8E8] entryKeyForType:*MEMORY[0x263F5F8B8] andName:*MEMORY[0x263F5F9F8]];
    id v11 = [(PLAWDAuxMetrics *)self operator];
    v12 = [v11 storage];
    v13 = [v12 lastEntryForKey:v10 withFilters:&unk_26E546A88];

    if (v13)
    {
      uint64_t v14 = [v13 objectForKeyedSubscript:@"Active"];
      -[PLAWDBattery setPrevDisplayON:](self, "setPrevDisplayON:", [v14 BOOLValue]);
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __32__PLAWDBattery_initBatteryStats__block_invoke;
    v32 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v33 = v15;
    if (initBatteryStats_defaultOnce != -1) {
      dispatch_once(&initBatteryStats_defaultOnce, &block);
    }
    if (initBatteryStats_classDebugEnabled)
    {
      uint64_t v16 = NSString;
      [(PLAWDBattery *)self prevVoltage];
      uint64_t v18 = v17;
      BOOL v19 = [(PLAWDBattery *)self prevDeviceCharging];
      [(PLAWDBattery *)self prevCapacity];
      uint64_t v21 = v20;
      BOOL v22 = [(PLAWDBattery *)self prevDisplayON];
      uint64_t v23 = [v16 stringWithFormat:@"%@ : Initialize Battery metrics: prevVoltage=%f prevIsCharging=%d prevCapacity=%f prevDisplayOn=%d", @"*******PLAWDMetricsService*******", v18, v19, v21, v22, block, v30, v31, v32, v33];
      v24 = (void *)MEMORY[0x263F5F638];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLAWDBattery initBatteryStats]"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:166];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __32__PLAWDBattery_initBatteryStats__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  initBatteryStats_classDebugEnabled = result;
  return result;
}

- (void)reInitBatteryStats
{
  [(PLAWDBattery *)self resetBatteryTable];
  [(PLAWDBattery *)self setDispOnOffCnt:0];
  v3 = [MEMORY[0x263EFF910] monotonicDate];
  [v3 timeIntervalSince1970];
  -[PLAWDBattery setPrevDispTimeStamp:](self, "setPrevDispTimeStamp:");

  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __34__PLAWDBattery_reInitBatteryStats__block_invoke;
    uint64_t v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v22 = v4;
    if (reInitBatteryStats_defaultOnce != -1) {
      dispatch_once(&reInitBatteryStats_defaultOnce, &block);
    }
    if (reInitBatteryStats_classDebugEnabled)
    {
      uint64_t v5 = NSString;
      [(PLAWDBattery *)self prevVoltage];
      uint64_t v7 = v6;
      BOOL v8 = [(PLAWDBattery *)self prevDeviceCharging];
      [(PLAWDBattery *)self prevCapacity];
      uint64_t v10 = v9;
      BOOL v11 = [(PLAWDBattery *)self prevDisplayON];
      v12 = [v5 stringWithFormat:@"%@ : Re-Init Battery metrics: prevVoltage=%f prevIsCharging=%d prevCapacity=%f prevDisplayOn=%d", @"*******PLAWDMetricsService*******", v7, v8, v10, v11, block, v19, v20, v21, v22];
      v13 = (void *)MEMORY[0x263F5F638];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLAWDBattery reInitBatteryStats]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:178];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __34__PLAWDBattery_reInitBatteryStats__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  reInitBatteryStats_classDebugEnabled = result;
  return result;
}

- (BOOL)isDeviceCharging:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"AdapterInfo"];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = [v4 entryDate];

  if (v6) {
    -[PLAWDAuxMetrics handleChargerChangeWithState:withDate:](&v10, sel_handleChargerChangeWithState_withDate_, 1, v7, v9.receiver, v9.super_class, self, PLAWDBattery);
  }
  else {
    -[PLAWDAuxMetrics handleChargerChangeWithState:withDate:](&v9, sel_handleChargerChangeWithState_withDate_, 0, v7, self, PLAWDBattery, v10.receiver, v10.super_class);
  }

  return v6;
}

- (void)resetBatteryTable
{
  v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"BatteryMetrics"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBattery;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (void)addEntryToBatteryTable:(id)a3 withValue:(double)a4
{
  uint64_t v6 = *MEMORY[0x263F5F888];
  id v7 = a3;
  id v11 = +[PLOperator entryKeyForType:v6 andName:@"BatteryMetrics"];
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v11];
  [v8 setObject:v7 forKeyedSubscript:@"BatteryMetricsKey"];

  objc_super v9 = [NSNumber numberWithDouble:a4];
  [v8 setObject:v9 forKeyedSubscript:@"BatteryMetricsValue"];

  objc_super v10 = [(PLAWDAuxMetrics *)self operator];
  [v10 logEntry:v8];
}

- (void)processEnergyConsumedAndAddEntry:(double)a3 withVoltage:(double)a4
{
  id v7 = [MEMORY[0x263EFF910] monotonicDate];
  [v7 timeIntervalSince1970];
  double v9 = v8;

  [(PLAWDBattery *)self prevDispTimeStamp];
  double v11 = v9 - v10;
  if ([(PLAWDBattery *)self prevDisplayON] && ![(PLAWDBattery *)self dispOnOffCnt])
  {
    if (a3 > 0.0) {
      [(PLAWDBattery *)self addEntryToBatteryTable:@"DrainDisplayOn" withValue:a3 * a4];
    }
    [(PLAWDBattery *)self addEntryToBatteryTable:@"DurationDispOn" withValue:v11];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v24 = objc_opt_class();
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v24;
      if (processEnergyConsumedAndAddEntry_withVoltage__defaultOnce != -1) {
        dispatch_once(&processEnergyConsumedAndAddEntry_withVoltage__defaultOnce, v46);
      }
      if (processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled)
      {
        v13 = [NSString stringWithFormat:@"%@ Battery Event: EnergyConsumed: DurationDispOn =%f", @"*******PLAWDMetricsService*******", *(void *)&v11];
        v25 = (void *)MEMORY[0x263F5F638];
        v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
        v27 = [v26 lastPathComponent];
        v28 = [NSString stringWithUTF8String:"-[PLAWDBattery processEnergyConsumedAndAddEntry:withVoltage:]"];
        [v25 logMessage:v13 fromFile:v27 fromFunction:v28 fromLineNumber:217];

        uint64_t v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
        goto LABEL_28;
      }
    }
  }
  else if ([(PLAWDBattery *)self prevDisplayON] || [(PLAWDBattery *)self dispOnOffCnt])
  {
    if (a3 > 0.0) {
      [(PLAWDBattery *)self addEntryToBatteryTable:@"DrainPartialDisplayOn" withValue:a3 * a4];
    }
    if ([(PLAWDBattery *)self prevDisplayON])
    {
      [(PLAWDBattery *)self addEntryToBatteryTable:@"DurationPartialDispOn" withValue:v11];
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v12 = objc_opt_class();
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_106;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = v12;
        if (processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_104 != -1) {
          dispatch_once(&processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_104, v45);
        }
        if (processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_105)
        {
          v13 = [NSString stringWithFormat:@"%@ Battery Event: EnergyConsumed: DurationPartialDispOn =%f", @"*******PLAWDMetricsService*******", *(void *)&v11];
          uint64_t v14 = (void *)MEMORY[0x263F5F638];
          uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
          uint64_t v16 = [v15 lastPathComponent];
          uint64_t v17 = [NSString stringWithUTF8String:"-[PLAWDBattery processEnergyConsumedAndAddEntry:withVoltage:]"];
          [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:227];

          uint64_t v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
LABEL_28:
        }
      }
    }
    else
    {
      [(PLAWDBattery *)self addEntryToBatteryTable:@"DurationPartialDispOff" withValue:v11];
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v19 = objc_opt_class();
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_112;
        v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v44[4] = v19;
        if (processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_110 != -1) {
          dispatch_once(&processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_110, v44);
        }
        if (processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_111)
        {
          v13 = [NSString stringWithFormat:@"%@ Battery Event: EnergyConsumed: DurationPartialDispOff =%f", @"*******PLAWDMetricsService*******", *(void *)&v11];
          uint64_t v20 = (void *)MEMORY[0x263F5F638];
          uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
          uint64_t v22 = [v21 lastPathComponent];
          uint64_t v23 = [NSString stringWithUTF8String:"-[PLAWDBattery processEnergyConsumedAndAddEntry:withVoltage:]"];
          [v20 logMessage:v13 fromFile:v22 fromFunction:v23 fromLineNumber:231];

          uint64_t v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
          goto LABEL_28;
        }
      }
    }
  }
  else if (a3 > 0.0)
  {
    [(PLAWDBattery *)self addEntryToBatteryTable:@"DrainDisplayOff" withValue:a3 * a4];
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v29 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_118;
    v42 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v43 = v29;
    if (processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_116 != -1) {
      dispatch_once(&processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_116, &block);
    }
    if (processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_117)
    {
      uint64_t v30 = NSString;
      BOOL v31 = [(PLAWDBattery *)self prevDisplayON];
      int64_t v32 = [(PLAWDBattery *)self dispOnOffCnt];
      uint64_t v33 = [v30 stringWithFormat:@"%@ Battery Event: EnergyConsumed=%f Display On=%d dispOnOffCnt=%lu ", @"*******PLAWDMetricsService*******", a3 * a4, v31, v32, block, v40, v41, v42, v43];
      v34 = (void *)MEMORY[0x263F5F638];
      v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
      v36 = [v35 lastPathComponent];
      v37 = [NSString stringWithUTF8String:"-[PLAWDBattery processEnergyConsumedAndAddEntry:withVoltage:]"];
      [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:234];

      v38 = PLLogCommon();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  [(PLAWDBattery *)self setPrevDispTimeStamp:v9];
  [(PLAWDBattery *)self setDispOnOffCnt:0];
}

uint64_t __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled = result;
  return result;
}

uint64_t __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_106(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_105 = result;
  return result;
}

uint64_t __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_112(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_111 = result;
  return result;
}

uint64_t __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_118(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_117 = result;
  return result;
}

- (void)handleBatteryCallback:(id)a3
{
  objc_super v4 = [a3 objectForKey:@"entry"];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"CurrentCapacity"];
    [v6 doubleValue];
    double v8 = v7;

    double v9 = [v5 objectForKeyedSubscript:@"Voltage"];
    [v9 doubleValue];
    double v11 = v10;

    BOOL v12 = [(PLAWDBattery *)self isDeviceCharging:v5];
    [(PLAWDBattery *)self prevCapacity];
    double v14 = v13;
    [(PLAWDBattery *)self prevVoltage];
    double v16 = v15;
    [(PLAWDBattery *)self prevCapacity];
    if (v17 <= 0.0)
    {
LABEL_18:
      [(PLAWDBattery *)self setPrevVoltage:v11];
      [(PLAWDBattery *)self setPrevDeviceCharging:v12];
      [(PLAWDBattery *)self setPrevCapacity:v8];
      goto LABEL_19;
    }
    double v18 = vabdd_f64(v8, v14);
    double v19 = (v11 + v16) / 2000.0;
    BOOL v20 = [(PLAWDBattery *)self prevDeviceCharging];
    if (v12)
    {
      if (!v20) {
        goto LABEL_5;
      }
    }
    else if (!v20)
    {
LABEL_5:
      if (![(PLAWDBattery *)self prevDeviceCharging]) {
        [(PLAWDBattery *)self processEnergyConsumedAndAddEntry:v18 withVoltage:v19];
      }
      goto LABEL_18;
    }
    double v21 = v8 - v14;
    if (v8 - v14 != 0.0)
    {
      double v22 = v18 * v19;
      [(PLAWDBattery *)self addEntryToBatteryTable:@"EnergyCharged" withValue:v22];
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v23 = objc_opt_class();
        block[0] = MEMORY[0x263EF8330];
        *(void *)&double v21 = 3221225472;
        block[1] = 3221225472;
        block[2] = __38__PLAWDBattery_handleBatteryCallback___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v23;
        if (handleBatteryCallback__defaultOnce_0 != -1) {
          dispatch_once(&handleBatteryCallback__defaultOnce_0, block);
        }
        if (handleBatteryCallback__classDebugEnabled_0)
        {
          uint64_t v24 = [NSString stringWithFormat:@"%@ : Battery Event: energyCharged=%f", @"*******PLAWDMetricsService*******", *(void *)&v22];
          v25 = (void *)MEMORY[0x263F5F638];
          v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
          v27 = [v26 lastPathComponent];
          v28 = [NSString stringWithUTF8String:"-[PLAWDBattery handleBatteryCallback:]"];
          [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:268];

          uint64_t v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
        }
      }
    }
    if (!v12)
    {
      -[PLAWDBattery setDispOnOffCnt:](self, "setDispOnOffCnt:", 0, v21);
      uint64_t v30 = [MEMORY[0x263EFF910] monotonicDate];
      [v30 timeIntervalSince1970];
      -[PLAWDBattery setPrevDispTimeStamp:](self, "setPrevDispTimeStamp:");
    }
    goto LABEL_18;
  }
LABEL_19:
}

uint64_t __38__PLAWDBattery_handleBatteryCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBatteryCallback__classDebugEnabled_0 = result;
  return result;
}

- (void)handleDisplayCallback:(id)a3
{
  objc_super v4 = [a3 objectForKey:@"entry"];
  if (!v4) {
    goto LABEL_27;
  }
  uint64_t v5 = [MEMORY[0x263EFF910] monotonicDate];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  double v8 = [v4 objectForKeyedSubscript:@"Active"];
  uint64_t v9 = [v8 BOOLValue];

  if (![(PLAWDBattery *)self prevDeviceCharging])
  {
    BOOL v10 = [(PLAWDBattery *)self prevDisplayON];
    if (v9)
    {
      if (v10) {
        goto LABEL_19;
      }
      [(PLAWDBattery *)self setDispOnOffCnt:[(PLAWDBattery *)self dispOnOffCnt] + 1];
      [(PLAWDBattery *)self prevDispTimeStamp];
      [(PLAWDBattery *)self addEntryToBatteryTable:@"DurationPartialDispOff" withValue:v7 - v11];
      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_19;
      }
      uint64_t v12 = objc_opt_class();
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __38__PLAWDBattery_handleDisplayCallback___block_invoke;
      v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v38[4] = v12;
      if (handleDisplayCallback__defaultOnce != -1) {
        dispatch_once(&handleDisplayCallback__defaultOnce, v38);
      }
      if (!handleDisplayCallback__classDebugEnabled) {
        goto LABEL_19;
      }
      double v13 = NSString;
      [(PLAWDBattery *)self prevDispTimeStamp];
      double v15 = [v13 stringWithFormat:@"%@ :DurationPartialDispOff =%f", @"*******PLAWDMetricsService*******", v7 - v14];
      double v16 = (void *)MEMORY[0x263F5F638];
      double v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
      double v18 = [v17 lastPathComponent];
      double v19 = [NSString stringWithUTF8String:"-[PLAWDBattery handleDisplayCallback:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:301];

      BOOL v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
    else
    {
      if (!v10) {
        goto LABEL_19;
      }
      [(PLAWDBattery *)self setDispOnOffCnt:[(PLAWDBattery *)self dispOnOffCnt] + 1];
      [(PLAWDBattery *)self prevDispTimeStamp];
      [(PLAWDBattery *)self addEntryToBatteryTable:@"DurationPartialDispOn" withValue:v7 - v21];
      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_19;
      }
      uint64_t v22 = objc_opt_class();
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __38__PLAWDBattery_handleDisplayCallback___block_invoke_133;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v22;
      if (handleDisplayCallback__defaultOnce_131 != -1) {
        dispatch_once(&handleDisplayCallback__defaultOnce_131, v37);
      }
      if (!handleDisplayCallback__classDebugEnabled_132) {
        goto LABEL_19;
      }
      uint64_t v23 = NSString;
      [(PLAWDBattery *)self prevDispTimeStamp];
      double v15 = [v23 stringWithFormat:@"%@ :DurationPartialDispOn =%f", @"*******PLAWDMetricsService*******", v7 - v24];
      v25 = (void *)MEMORY[0x263F5F638];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLAWDBattery handleDisplayCallback:]"];
      [v25 logMessage:v15 fromFile:v27 fromFunction:v28 fromLineNumber:306];

      BOOL v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
LABEL_19:
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v29 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__PLAWDBattery_handleDisplayCallback___block_invoke_139;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v29;
    if (handleDisplayCallback__defaultOnce_137 != -1) {
      dispatch_once(&handleDisplayCallback__defaultOnce_137, block);
    }
    if (handleDisplayCallback__classDebugEnabled_138)
    {
      uint64_t v30 = [NSString stringWithFormat:@"%@ AWD-Battery:DisplayEvent: currDisplayOn=%d self.prevDisplayON=%d dispOnOffCnt=%lu", @"*******PLAWDMetricsService*******", v9, -[PLAWDBattery prevDisplayON](self, "prevDisplayON"), -[PLAWDBattery dispOnOffCnt](self, "dispOnOffCnt")];
      BOOL v31 = (void *)MEMORY[0x263F5F638];
      int64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
      uint64_t v33 = [v32 lastPathComponent];
      v34 = [NSString stringWithUTF8String:"-[PLAWDBattery handleDisplayCallback:]"];
      [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:310];

      v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  [(PLAWDBattery *)self setPrevDisplayON:v9];
  [(PLAWDBattery *)self setPrevDispTimeStamp:v7];
LABEL_27:
}

uint64_t __38__PLAWDBattery_handleDisplayCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleDisplayCallback__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAWDBattery_handleDisplayCallback___block_invoke_133(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleDisplayCallback__classDebugEnabled_132 = result;
  return result;
}

uint64_t __38__PLAWDBattery_handleDisplayCallback___block_invoke_139(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleDisplayCallback__classDebugEnabled_138 = result;
  return result;
}

- (void)finalizeBatteryTable
{
  v3 = [MEMORY[0x263EFF910] monotonicDate];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  [(PLAWDBattery *)self prevDispTimeStamp];
  double v7 = v6;
  if ([(PLAWDBattery *)self prevDeviceCharging]) {
    goto LABEL_2;
  }
  double v15 = v5 - v7;
  BOOL v16 = [(PLAWDBattery *)self prevDisplayON];
  uint64_t v17 = [(PLAWDBattery *)self dispOnOffCnt];
  if (v16)
  {
    if (v17)
    {
      if ([(PLAWDBattery *)self dispOnOffCnt] >= 1)
      {
        [(PLAWDBattery *)self addEntryToBatteryTable:@"DurationPartialDispOn" withValue:v15];
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v18 = objc_opt_class();
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __36__PLAWDBattery_finalizeBatteryTable__block_invoke_148;
          v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v37[4] = v18;
          if (finalizeBatteryTable_defaultOnce_146 != -1) {
            dispatch_once(&finalizeBatteryTable_defaultOnce_146, v37);
          }
          if (finalizeBatteryTable_classDebugEnabled_147)
          {
            double v19 = [NSString stringWithFormat:@"%@ : Finalize Battery table :DurationPartialDispOn =%f", @"*******PLAWDMetricsService*******", *(void *)&v15];
            BOOL v20 = (void *)MEMORY[0x263F5F638];
            double v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
            uint64_t v22 = [v21 lastPathComponent];
            uint64_t v23 = [NSString stringWithUTF8String:"-[PLAWDBattery finalizeBatteryTable]"];
            [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:331];

            double v24 = PLLogCommon();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              -[PLAWDDisplay startMetricCollection:]();
            }
LABEL_32:
          }
        }
      }
    }
    else
    {
      [(PLAWDBattery *)self addEntryToBatteryTable:@"DurationDispOn" withValue:v15];
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v30 = objc_opt_class();
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __36__PLAWDBattery_finalizeBatteryTable__block_invoke;
        v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v38[4] = v30;
        if (finalizeBatteryTable_defaultOnce != -1) {
          dispatch_once(&finalizeBatteryTable_defaultOnce, v38);
        }
        if (finalizeBatteryTable_classDebugEnabled)
        {
          double v19 = [NSString stringWithFormat:@"%@ : Finalize Battery table :DurationDispOn =%f", @"*******PLAWDMetricsService*******", *(void *)&v15];
          BOOL v31 = (void *)MEMORY[0x263F5F638];
          int64_t v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
          uint64_t v33 = [v32 lastPathComponent];
          v34 = [NSString stringWithUTF8String:"-[PLAWDBattery finalizeBatteryTable]"];
          [v31 logMessage:v19 fromFile:v33 fromFunction:v34 fromLineNumber:327];

          double v24 = PLLogCommon();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
          goto LABEL_32;
        }
      }
    }
  }
  else if (v17 >= 1)
  {
    [(PLAWDBattery *)self addEntryToBatteryTable:@"DurationPartialDispOff" withValue:v15];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v25 = objc_opt_class();
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __36__PLAWDBattery_finalizeBatteryTable__block_invoke_154;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = v25;
      if (finalizeBatteryTable_defaultOnce_152 != -1) {
        dispatch_once(&finalizeBatteryTable_defaultOnce_152, v36);
      }
      if (finalizeBatteryTable_classDebugEnabled_153)
      {
        double v19 = [NSString stringWithFormat:@"%@ : Finalize Battery table :DurationPartialDispOff =%f", @"*******PLAWDMetricsService*******", *(void *)&v15];
        v26 = (void *)MEMORY[0x263F5F638];
        v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
        v28 = [v27 lastPathComponent];
        uint64_t v29 = [NSString stringWithUTF8String:"-[PLAWDBattery finalizeBatteryTable]"];
        [v26 logMessage:v19 fromFile:v28 fromFunction:v29 fromLineNumber:337];

        double v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
        goto LABEL_32;
      }
    }
  }
LABEL_2:
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__PLAWDBattery_finalizeBatteryTable__block_invoke_160;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (finalizeBatteryTable_defaultOnce_158 != -1) {
      dispatch_once(&finalizeBatteryTable_defaultOnce_158, block);
    }
    if (finalizeBatteryTable_classDebugEnabled_159)
    {
      uint64_t v9 = [NSString stringWithFormat:@"%@ : Finalize Battery table", @"*******PLAWDMetricsService*******"];
      BOOL v10 = (void *)MEMORY[0x263F5F638];
      double v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
      uint64_t v12 = [v11 lastPathComponent];
      double v13 = [NSString stringWithUTF8String:"-[PLAWDBattery finalizeBatteryTable]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:342];

      double v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __36__PLAWDBattery_finalizeBatteryTable__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  finalizeBatteryTable_classDebugEnabled = result;
  return result;
}

uint64_t __36__PLAWDBattery_finalizeBatteryTable__block_invoke_148(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  finalizeBatteryTable_classDebugEnabled_147 = result;
  return result;
}

uint64_t __36__PLAWDBattery_finalizeBatteryTable__block_invoke_154(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  finalizeBatteryTable_classDebugEnabled_153 = result;
  return result;
}

uint64_t __36__PLAWDBattery_finalizeBatteryTable__block_invoke_160(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  finalizeBatteryTable_classDebugEnabled_159 = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  uint64_t v9 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
  BOOL v10 = [MEMORY[0x263EFF910] monotonicDate];
  [v9 timeIntervalSince1970];
  double v12 = v11;
  [v10 timeIntervalSince1970];
  double v14 = v13;

  if ([v6 longValue] == 2031623)
  {
    if (v8)
    {
      [(PLAWDBattery *)self finalizeBatteryTable];
      double v15 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"BatteryMetrics"];
      BOOL v16 = [(PLAWDAuxMetrics *)self operator];
      uint64_t v17 = [v16 storage];
      uint64_t v18 = objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14 - v12);

      double v19 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v18];
      BOOL v20 = objc_opt_new();
      v58 = v15;
      v59 = v8;
      v57 = v18;
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v21 = objc_opt_class();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __50__PLAWDBattery_submitDataToAWDServer_withAwdConn___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v21;
        if (submitDataToAWDServer_withAwdConn__defaultOnce_0 != -1) {
          dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_0, block);
        }
        if (submitDataToAWDServer_withAwdConn__classDebugEnabled_0)
        {
          uint64_t v22 = v19;
          uint64_t v23 = [NSString stringWithFormat:@"%@ : %@", @"*******PLAWDMetricsService*******", v19];
          double v24 = (void *)MEMORY[0x263F5F638];
          uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
          v26 = [v25 lastPathComponent];
          v27 = [NSString stringWithUTF8String:"-[PLAWDBattery submitDataToAWDServer:withAwdConn:]"];
          [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:362];

          v28 = PLLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }

          double v15 = v58;
          uint64_t v8 = v59;
          uint64_t v18 = v57;
          double v19 = v22;
        }
      }
      if (v20)
      {
        id v55 = v7;
        objc_msgSend(v20, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
        [v20 setEnergyConsumedDisplayOnMicroWatt:0];
        [v20 setEnergyConsumedDisplayOffMicroWatt:0];
        [v20 setEnergyConsumedPartailDispOnMicrowatt:0];
        [v20 setEnergyChargedMicroWatt:0];
        [v20 setDurationDispOn:0];
        [v20 setDurationPartialDispOn:0];
        [v20 setDurationPartialDispOff:0];
        [v20 setCycleCountKey:0];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v56 = v19;
        id v29 = v19;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v61 objects:v66 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v62 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              v35 = [v34 objectForKeyedSubscript:@"BatteryMetricsKey"];
              v36 = [v34 objectForKeyedSubscript:@"BatteryMetricsValue"];
              [v36 doubleValue];
              double v38 = v37;

              if ([v35 isEqualToString:@"DrainDisplayOn"])
              {
                [v20 setEnergyConsumedDisplayOnMicroWatt:(v38 * 1000.0)];
              }
              else if ([v35 isEqualToString:@"DrainDisplayOff"])
              {
                [v20 setEnergyConsumedDisplayOffMicroWatt:(v38 * 1000.0)];
              }
              else if ([v35 isEqualToString:@"DrainPartialDisplayOn"])
              {
                [v20 setEnergyConsumedPartailDispOnMicrowatt:(v38 * 1000.0)];
              }
              else if ([v35 isEqualToString:@"EnergyCharged"])
              {
                [v20 setEnergyChargedMicroWatt:(v38 * 1000.0)];
              }
              else if ([v35 isEqualToString:@"DurationDispOn"])
              {
                [v20 setDurationDispOn:(v38 * 1000.0)];
              }
              else if ([v35 isEqualToString:@"DurationPartialDispOn"])
              {
                [v20 setDurationPartialDispOn:(v38 * 1000.0)];
              }
              else if ([v35 isEqualToString:@"DurationPartialDispOff"])
              {
                [v20 setDurationPartialDispOff:(v38 * 1000.0)];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v61 objects:v66 count:16];
          }
          while (v31);
        }

        v39 = [MEMORY[0x263F5F8D0] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F998]];
        uint64_t v40 = [(PLAWDAuxMetrics *)self operator];
        v41 = [v40 storage];
        v42 = [v41 lastEntryForKey:v39];

        if (v42)
        {
          uint64_t v43 = [v42 objectForKeyedSubscript:@"CycleCount"];
          [v43 doubleValue];
          double v45 = v44;

          [v20 setCycleCountKey:v45];
        }
        [(PLAWDBattery *)self setBatterySubmitCnt:[(PLAWDBattery *)self batterySubmitCnt] + 1];
        double v19 = v56;
        uint64_t v8 = v59;
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v46 = objc_opt_class();
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __50__PLAWDBattery_submitDataToAWDServer_withAwdConn___block_invoke_173;
          v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v60[4] = v46;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_171 != -1) {
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_171, v60);
          }
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_172)
          {
            v47 = [NSString stringWithFormat:@"%@ : Submit Battery stats: submit cnt=%ld", @"*******PLAWDMetricsService*******", -[PLAWDBattery batterySubmitCnt](self, "batterySubmitCnt")];
            v48 = (void *)MEMORY[0x263F5F638];
            v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m"];
            v50 = [v49 lastPathComponent];
            v51 = [NSString stringWithUTF8String:"-[PLAWDBattery submitDataToAWDServer:withAwdConn:]"];
            [v48 logMessage:v47 fromFile:v50 fromFunction:v51 fromLineNumber:412];

            v52 = PLLogCommon();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
              -[PLAWDDisplay startMetricCollection:]();
            }

            uint64_t v8 = v59;
            double v19 = v56;
          }
        }
        [v8 setMetric:v20];

        id v7 = v55;
        uint64_t v18 = v57;
        double v15 = v58;
      }
    }
    [(PLAWDBattery *)self reInitBatteryStats];
    char v53 = [v7 submitMetric:v8];
  }
  else
  {
    char v53 = 0;
  }

  return v53;
}

uint64_t __50__PLAWDBattery_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_0 = result;
  return result;
}

uint64_t __50__PLAWDBattery_submitDataToAWDServer_withAwdConn___block_invoke_173(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_172 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)batteryEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDisplayEventCallback:(id)a3
{
}

- (double)prevCapacity
{
  return self->_prevCapacity;
}

- (void)setPrevCapacity:(double)a3
{
  self->_prevCapacity = a3;
}

- (double)prevVoltage
{
  return self->_prevVoltage;
}

- (void)setPrevVoltage:(double)a3
{
  self->_prevVoltage = a3;
}

- (BOOL)prevDeviceCharging
{
  return self->_prevDeviceCharging;
}

- (void)setPrevDeviceCharging:(BOOL)a3
{
  self->_prevDeviceCharging = a3;
}

- (BOOL)prevDisplayON
{
  return self->_prevDisplayON;
}

- (void)setPrevDisplayON:(BOOL)a3
{
  self->_prevDisplayON = a3;
}

- (int64_t)dispOnOffCnt
{
  return self->_dispOnOffCnt;
}

- (void)setDispOnOffCnt:(int64_t)a3
{
  self->_dispOnOffCnt = a3;
}

- (double)prevDispTimeStamp
{
  return self->_prevDispTimeStamp;
}

- (void)setPrevDispTimeStamp:(double)a3
{
  self->_prevDispTimeStamp = a3;
}

- (int64_t)batterySubmitCnt
{
  return self->_batterySubmitCnt;
}

- (void)setBatterySubmitCnt:(int64_t)a3
{
  self->_batterySubmitCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayEventCallback, 0);

  objc_storeStrong((id *)&self->_batteryEventCallback, 0);
}

@end