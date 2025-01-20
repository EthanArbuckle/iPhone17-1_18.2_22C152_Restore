@interface PLAWDCpuAP
+ (id)entryAggregateDefinitionAwdAp;
+ (id)entryAggregateDefinitionAwdCpu;
+ (id)entryAggregateDefinitions;
+ (id)getSharedObjWithOperator:(id)a3;
- (BOOL)isIoreportEnergy;
- (BOOL)submitApDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (BOOL)submitCpuDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (NSDate)sleepStartTime;
- (PLEntryNotificationOperatorComposition)ioreportEnergyEventCallback;
- (PLEntryNotificationOperatorComposition)monitorEventCallback;
- (PLEntryNotificationOperatorComposition)wakeEventCallback;
- (int64_t)apSubmitCnt;
- (int64_t)cpuLoadSubmitCnt;
- (void)addEntryToApMetricsTable:(id)a3 withValue:(double)a4;
- (void)handleIOReportEnergyCallback:(id)a3;
- (void)handleWakeCallback:(id)a3;
- (void)resetApTable;
- (void)setApSubmitCnt:(int64_t)a3;
- (void)setCpuLoadSubmitCnt:(int64_t)a3;
- (void)setIoreportEnergyEventCallback:(id)a3;
- (void)setIsIoreportEnergy:(BOOL)a3;
- (void)setMonitorEventCallback:(id)a3;
- (void)setSleepStartTime:(id)a3;
- (void)setWakeEventCallback:(id)a3;
- (void)startApMetricCollection:(id)a3;
- (void)startCpuMetricCollection:(id)a3;
- (void)startMetricCollection:(id)a3;
- (void)stopMetricCollection:(id)a3;
@end

@implementation PLAWDCpuAP

+ (id)getSharedObjWithOperator:(id)a3
{
  v3 = (void *)plAwdCpuAp;
  if (!plAwdCpuAp)
  {
    id v4 = a3;
    v5 = [(PLAWDAuxMetrics *)[PLAWDCpuAP alloc] initWithOperator:v4];

    v6 = (void *)plAwdCpuAp;
    plAwdCpuAp = (uint64_t)v5;

    v3 = (void *)plAwdCpuAp;
  }

  return v3;
}

+ (id)entryAggregateDefinitions
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"ApMetrics";
  v3 = [a1 entryAggregateDefinitionAwdAp];
  v7[1] = @"CpuMetrics";
  v8[0] = v3;
  id v4 = [a1 entryAggregateDefinitionAwdCpu];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)startMetricCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 addObject:v4];

  uint64_t v6 = [v4 longValue];
  if (v6 == 2031620)
  {
    [(PLAWDCpuAP *)self startCpuMetricCollection:v4];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __36__PLAWDCpuAP_startMetricCollection___block_invoke_54;
      v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v19[4] = v14;
      if (startMetricCollection__defaultOnce_52 != -1) {
        dispatch_once(&startMetricCollection__defaultOnce_52, v19);
      }
      if (startMetricCollection__classDebugEnabled_53)
      {
        v8 = [NSString stringWithFormat:@"%@ : Start CpuLoad collection", @"*******PLAWDMetricsService*******"];
        v15 = (void *)MEMORY[0x263F5F638];
        v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLAWDCpuAP startMetricCollection:]"];
        [v15 logMessage:v8 fromFile:v17 fromFunction:v18 fromLineNumber:77];

        v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
        goto LABEL_15;
      }
    }
  }
  else if (v6 == 2031634)
  {
    [(PLAWDCpuAP *)self startApMetricCollection:v4];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__PLAWDCpuAP_startMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (startMetricCollection__defaultOnce_0 != -1) {
        dispatch_once(&startMetricCollection__defaultOnce_0, block);
      }
      if (startMetricCollection__classDebugEnabled_0)
      {
        v8 = [NSString stringWithFormat:@"%@ : Start ApData collection", @"*******PLAWDMetricsService*******"];
        v9 = (void *)MEMORY[0x263F5F638];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLAWDCpuAP startMetricCollection:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:72];

        v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
LABEL_15:
      }
    }
  }
}

uint64_t __36__PLAWDCpuAP_startMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled_0 = result;
  return result;
}

uint64_t __36__PLAWDCpuAP_startMetricCollection___block_invoke_54(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled_53 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 removeObject:v4];

  uint64_t v6 = [v4 longValue];
  if (v6 == 2031620)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __35__PLAWDCpuAP_stopMetricCollection___block_invoke_63;
      v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v22[4] = v14;
      if (stopMetricCollection__defaultOnce_61 != -1) {
        dispatch_once(&stopMetricCollection__defaultOnce_61, v22);
      }
      if (stopMetricCollection__classDebugEnabled_62)
      {
        v8 = [NSString stringWithFormat:@"%@ : Stop CpuLoad collection", @"*******PLAWDMetricsService*******"];
        v15 = (void *)MEMORY[0x263F5F638];
        v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLAWDCpuAP stopMetricCollection:]"];
        [v15 logMessage:v8 fromFile:v17 fromFunction:v18 fromLineNumber:98];

        v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
        goto LABEL_15;
      }
    }
  }
  else if (v6 == 2031634)
  {
    [(PLAWDCpuAP *)self setIoreportEnergyEventCallback:0];
    [(PLAWDCpuAP *)self setMonitorEventCallback:0];
    [(PLAWDCpuAP *)self setWakeEventCallback:0];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __35__PLAWDCpuAP_stopMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (stopMetricCollection__defaultOnce_0 != -1) {
        dispatch_once(&stopMetricCollection__defaultOnce_0, block);
      }
      if (stopMetricCollection__classDebugEnabled_0)
      {
        v8 = [NSString stringWithFormat:@"%@ : Stop ApData collection", @"*******PLAWDMetricsService*******"];
        v9 = (void *)MEMORY[0x263F5F638];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLAWDCpuAP stopMetricCollection:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:94];

        v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
LABEL_15:
      }
    }
  }
  v19 = [(PLAWDAuxMetrics *)self runningMetrics];
  uint64_t v20 = [v19 count];

  if (!v20)
  {
    v21 = (void *)plAwdCpuAp;
    plAwdCpuAp = 0;
  }
}

uint64_t __35__PLAWDCpuAP_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopMetricCollection__classDebugEnabled_0 = result;
  return result;
}

uint64_t __35__PLAWDCpuAP_stopMetricCollection___block_invoke_63(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopMetricCollection__classDebugEnabled_62 = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 longValue];
  if (v8 == 2031620)
  {
    [(PLAWDCpuAP *)self submitCpuDataToAWDServer:v6 withAwdConn:v7];
  }
  else
  {
    if (v8 != 2031634)
    {
      BOOL v9 = 0;
      goto LABEL_7;
    }
    [(PLAWDCpuAP *)self submitApDataToAWDServer:v6 withAwdConn:v7];
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

+ (id)entryAggregateDefinitionAwdAp
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v21[0] = *MEMORY[0x263F5F880];
  v21[1] = v2;
  v22[0] = &unk_26E5465D0;
  v22[1] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v3;
  v23[1] = *MEMORY[0x263F5F870];
  v19[0] = @"ApSource";
  id v4 = [MEMORY[0x263F5F650] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v19[1] = @"ApValue";
  v20[0] = v5;
  id v6 = [MEMORY[0x263F5F650] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v20[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  v23[2] = *MEMORY[0x263F5F828];
  v17 = &unk_26E5465E0;
  uint64_t v15 = *MEMORY[0x263F5F820];
  v16 = &unk_26E5465E0;
  BOOL v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v24[2] = v10;
  v23[3] = *MEMORY[0x263F5F830];
  uint64_t v14 = @"ApValue";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v24[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (void)startApMetricCollection:(id)a3
{
  [(PLAWDCpuAP *)self setApSubmitCnt:0];
  [(PLAWDCpuAP *)self resetApTable];
  id v4 = [MEMORY[0x263EFF910] monotonicDate];
  [(PLAWDCpuAP *)self setSleepStartTime:v4];

  [(PLAWDCpuAP *)self setIsIoreportEnergy:1];
  v5 = [MEMORY[0x263F5F8F0] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5FA10]];
  id v6 = objc_alloc(MEMORY[0x263F5F658]);
  id v7 = [(PLAWDAuxMetrics *)self operator];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__PLAWDCpuAP_startApMetricCollection___block_invoke;
  v15[3] = &unk_264B99DD0;
  v15[4] = self;
  uint64_t v8 = (void *)[v6 initWithOperator:v7 forEntryKey:v5 withBlock:v15];

  [(PLAWDCpuAP *)self setIoreportEnergyEventCallback:v8];
  BOOL v9 = [(PLAWDCpuAP *)self ioreportEnergyEventCallback];
  [v9 requestEntry];

  v10 = [MEMORY[0x263F5F918] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5FA38]];
  id v11 = objc_alloc(MEMORY[0x263F5F658]);
  v12 = [(PLAWDAuxMetrics *)self operator];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __38__PLAWDCpuAP_startApMetricCollection___block_invoke_2;
  v14[3] = &unk_264B99DD0;
  v14[4] = self;
  v13 = (void *)[v11 initWithOperator:v12 forEntryKey:v10 withBlock:v14];

  [(PLAWDCpuAP *)self setWakeEventCallback:v13];
}

uint64_t __38__PLAWDCpuAP_startApMetricCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleIOReportEnergyCallback:a2];
  }
  return result;
}

uint64_t __38__PLAWDCpuAP_startApMetricCollection___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleWakeCallback:a2];
  }
  return result;
}

- (void)addEntryToApMetricsTable:(id)a3 withValue:(double)a4
{
  uint64_t v6 = *MEMORY[0x263F5F888];
  id v7 = a3;
  id v11 = +[PLOperator entryKeyForType:v6 andName:@"ApMetrics"];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v11];
  [v8 setObject:v7 forKeyedSubscript:@"ApSource"];

  BOOL v9 = [NSNumber numberWithDouble:a4];
  [v8 setObject:v9 forKeyedSubscript:@"ApValue"];

  v10 = [(PLAWDAuxMetrics *)self operator];
  [v10 logEntry:v8];
}

- (void)handleIOReportEnergyCallback:(id)a3
{
  id v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    if (![(PLAWDCpuAP *)self isIoreportEnergy]) {
      goto LABEL_17;
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v5;
      if (handleIOReportEnergyCallback__defaultOnce != -1) {
        dispatch_once(&handleIOReportEnergyCallback__defaultOnce, v50);
      }
      if (handleIOReportEnergyCallback__classDebugEnabled)
      {
        uint64_t v6 = [NSString stringWithFormat:@"%@ : Ioreport CPU/SoC/GPU energy first entry", @"*******PLAWDMetricsService*******"];
        id v7 = (void *)MEMORY[0x263F5F638];
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
        BOOL v9 = [v8 lastPathComponent];
        v10 = [NSString stringWithUTF8String:"-[PLAWDCpuAP handleIOReportEnergyCallback:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:188];

        id v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDCpuAP *)self setIsIoreportEnergy:0];
    v49.receiver = self;
    v49.super_class = (Class)PLAWDCpuAP;
    if (![(PLAWDAuxMetrics *)&v49 dropFirstEntryReceived:v4 usingFilter:0 andStartTime:0])
    {
LABEL_17:
      v19 = (void *)MEMORY[0x263EFF910];
      uint64_t v20 = [v4 objectForKeyedSubscript:@"SampleTime"];
      [v20 doubleValue];
      double v22 = -v21;
      uint64_t v23 = [v4 entryDate];
      v13 = [v19 dateWithTimeInterval:v23 sinceDate:v22];

      v24 = [v4 entryDate];
      v47.receiver = self;
      v47.super_class = (Class)PLAWDCpuAP;
      LOBYTE(v23) = [(PLAWDAuxMetrics *)&v47 doesInterfereWithChargerWithStartDate:v13 withEndDate:v24];

      if ((v23 & 1) == 0)
      {
        v25 = [v4 objectForKeyedSubscript:@"CPU Energy"];
        [v25 doubleValue];
        double v27 = v26;

        if (v27 > 0.0)
        {
          v28 = [v4 objectForKeyedSubscript:@"CPU Energy"];
          [v28 doubleValue];
          [(PLAWDCpuAP *)self addEntryToApMetricsTable:@"CPU" withValue:v29 / 3600.0];
        }
        v30 = [v4 objectForKeyedSubscript:@"GPU Energy"];
        [v30 doubleValue];
        double v32 = v31;

        if (v32 > 0.0)
        {
          v33 = [v4 objectForKeyedSubscript:@"GPU Energy"];
          [v33 doubleValue];
          [(PLAWDCpuAP *)self addEntryToApMetricsTable:@"GPU" withValue:v34 / 3600.0];
        }
        v35 = [v4 objectForKeyedSubscript:@"SoC Energy"];
        [v35 doubleValue];
        double v37 = v36;

        if (v37 != 0.0)
        {
          v38 = [v4 objectForKeyedSubscript:@"SoC Energy"];
          [v38 doubleValue];
          [(PLAWDCpuAP *)self addEntryToApMetricsTable:@"SOC" withValue:v39 / 3600.0];
        }
      }
      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_32;
      }
      uint64_t v40 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke_107;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v40;
      if (handleIOReportEnergyCallback__defaultOnce_105 != -1) {
        dispatch_once(&handleIOReportEnergyCallback__defaultOnce_105, block);
      }
      if (!handleIOReportEnergyCallback__classDebugEnabled_106) {
        goto LABEL_32;
      }
      v18 = [NSString stringWithFormat:@"%@ : Cpu/Soc/Gpu energy entry= %@", @"*******PLAWDMetricsService*******", v4];
      v41 = (void *)MEMORY[0x263F5F638];
      v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
      v43 = [v42 lastPathComponent];
      v44 = [NSString stringWithUTF8String:"-[PLAWDCpuAP handleIOReportEnergyCallback:]"];
      [v41 logMessage:v18 fromFile:v43 fromFunction:v44 fromLineNumber:214];

      v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke_87;
      v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v48[4] = v12;
      if (handleIOReportEnergyCallback__defaultOnce_85 != -1) {
        dispatch_once(&handleIOReportEnergyCallback__defaultOnce_85, v48);
      }
      if (handleIOReportEnergyCallback__classDebugEnabled_86)
      {
        v13 = [NSString stringWithFormat:@"%@ : Ioreport CPU/SoC/GPU energy first entry - dropped", @"*******PLAWDMetricsService*******"];
        uint64_t v14 = (void *)MEMORY[0x263F5F638];
        uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
        v16 = [v15 lastPathComponent];
        v17 = [NSString stringWithUTF8String:"-[PLAWDCpuAP handleIOReportEnergyCallback:]"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:193];

        v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
        goto LABEL_31;
      }
    }
  }
LABEL_33:
}

uint64_t __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleIOReportEnergyCallback__classDebugEnabled = result;
  return result;
}

uint64_t __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke_87(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleIOReportEnergyCallback__classDebugEnabled_86 = result;
  return result;
}

uint64_t __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke_107(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleIOReportEnergyCallback__classDebugEnabled_106 = result;
  return result;
}

- (void)handleWakeCallback:(id)a3
{
  id v4 = [a3 objectForKey:@"entry"];
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"ApMetrics"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v5];
  id v7 = [(PLAWDAuxMetrics *)self operator];
  uint64_t v8 = [v7 storage];
  BOOL v9 = [v4 entryKey];
  v10 = objc_msgSend(v8, "entryForKey:withID:", v9, objc_msgSend(v4, "entryID") - 1);

  id v11 = [v10 objectForKeyedSubscript:@"State"];
  [v11 doubleValue];
  double v13 = v12;

  if (v13 == 4.0)
  {
    uint64_t v14 = [v4 entryDate];
    [(PLAWDCpuAP *)self setSleepStartTime:v14];
  }
  uint64_t v15 = [v4 objectForKeyedSubscript:@"State"];
  [v15 doubleValue];
  if (v16 == 4.0)
  {
    v17 = [v10 objectForKeyedSubscript:@"State"];
    [v17 doubleValue];
    double v19 = v18;

    if (v19 != 4.0) {
      goto LABEL_7;
    }
    [v6 setObject:@"Awake" forKeyedSubscript:@"ApSource"];
    uint64_t v20 = NSNumber;
    uint64_t v15 = [v10 entryDate];
    double v21 = [(PLAWDCpuAP *)self sleepStartTime];
    [v15 timeIntervalSinceDate:v21];
    double v22 = objc_msgSend(v20, "numberWithDouble:");
    [v6 setObject:v22 forKeyedSubscript:@"ApValue"];
  }
LABEL_7:
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    double v32 = __33__PLAWDCpuAP_handleWakeCallback___block_invoke;
    v33 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v34 = v23;
    if (handleWakeCallback__defaultOnce != -1) {
      dispatch_once(&handleWakeCallback__defaultOnce, &block);
    }
    if (handleWakeCallback__classDebugEnabled)
    {
      v24 = [NSString stringWithFormat:@"From WakeCallback - %@", v4, block, v31, v32, v33, v34];
      v25 = (void *)MEMORY[0x263F5F638];
      double v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
      double v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLAWDCpuAP handleWakeCallback:]"];
      [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:236];

      double v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __33__PLAWDCpuAP_handleWakeCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWakeCallback__classDebugEnabled = result;
  return result;
}

- (void)resetApTable
{
  v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"ApMetrics"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDCpuAP;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (BOOL)submitApDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  unint64_t v8 = 0x263F5F000uLL;
  if (v7)
  {
    BOOL v9 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
    v10 = [MEMORY[0x263EFF910] monotonicDate];
    [v9 timeIntervalSince1970];
    double v12 = v11;
    [v10 timeIntervalSince1970];
    double v14 = v13 - v12;

    uint64_t v15 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"ApMetrics"];
    double v16 = [(PLAWDAuxMetrics *)self operator];
    v17 = [v16 storage];
    double v18 = objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14);

    double v19 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v18];
    uint64_t v20 = objc_opt_new();
    double v21 = &off_230A24000;
    v65 = v19;
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v22;
      if (submitApDataToAWDServer_withAwdConn__defaultOnce != -1) {
        dispatch_once(&submitApDataToAWDServer_withAwdConn__defaultOnce, block);
      }
      if (submitApDataToAWDServer_withAwdConn__classDebugEnabled)
      {
        v63 = v20;
        uint64_t v23 = [NSString stringWithFormat:@"%@ : %@", @"*******PLAWDMetricsService*******", v19];
        v24 = (void *)MEMORY[0x263F5F638];
        v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
        double v26 = [v25 lastPathComponent];
        double v27 = [NSString stringWithUTF8String:"-[PLAWDCpuAP submitApDataToAWDServer:withAwdConn:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:280];

        v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }

        uint64_t v20 = v63;
        double v19 = v65;
        unint64_t v8 = 0x263F5F000;
        double v21 = &off_230A24000;
      }
    }
    if (v20)
    {
      v59 = v18;
      v60 = v15;
      v61 = v7;
      v62 = self;
      objc_msgSend(v20, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
      [v20 setSocPowerMicroWatt:0];
      [v20 setCpuPowerMicroWatt:0];
      [v20 setGpuPowerMicroWatt:0];
      [v20 setDramPowerMicroWatt:0];
      double v29 = v20;
      [v20 setApAwakeDuration:0];
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v30 = v19;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (!v31) {
        goto LABEL_28;
      }
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v69;
      while (1)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v69 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          id v36 = [NSString alloc];
          double v37 = [v35 objectForKeyedSubscript:@"ApSource"];
          v38 = (void *)[v36 initWithFormat:@"%@", v37];

          if ([v38 isEqualToString:@"CPU"])
          {
            double v39 = [v35 objectForKeyedSubscript:@"ApValue"];
            [v39 doubleValue];
            [v29 setCpuPowerMicroWatt:(v40 * 1000.0)];
          }
          else if ([v38 isEqualToString:@"GPU"])
          {
            double v39 = [v35 objectForKeyedSubscript:@"ApValue"];
            [v39 doubleValue];
            [v29 setGpuPowerMicroWatt:(v41 * 1000.0)];
          }
          else if ([v38 isEqualToString:@"SOC"])
          {
            double v39 = [v35 objectForKeyedSubscript:@"ApValue"];
            [v39 doubleValue];
            [v29 setSocPowerMicroWatt:(v42 * 1000.0)];
          }
          else if ([v38 isEqualToString:@"DRAM"])
          {
            double v39 = [v35 objectForKeyedSubscript:@"ApValue"];
            [v39 doubleValue];
            [v29 setDramPowerMicroWatt:(v43 * 1000.0)];
          }
          else
          {
            if (![v38 isEqualToString:@"Awake"]) {
              goto LABEL_26;
            }
            double v39 = [v35 objectForKeyedSubscript:@"ApValue"];
            [v39 doubleValue];
            [v29 setApAwakeDuration:v44];
          }

LABEL_26:
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v68 objects:v73 count:16];
        if (!v32)
        {
LABEL_28:

          id v7 = v61;
          uint64_t v20 = v29;
          [v61 setMetric:v29];
          self = v62;
          double v18 = v59;
          uint64_t v15 = v60;
          double v19 = v65;
          unint64_t v8 = 0x263F5F000uLL;
          double v21 = &off_230A24000;
          break;
        }
      }
    }
    [(PLAWDCpuAP *)self setApSubmitCnt:[(PLAWDCpuAP *)self apSubmitCnt] + 1];
    if ([*(id *)(v8 + 1600) debugEnabled])
    {
      uint64_t v45 = objc_opt_class();
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = *((void *)v21 + 81);
      v67[2] = __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke_128;
      v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v67[4] = v45;
      if (submitApDataToAWDServer_withAwdConn__defaultOnce_126 != -1) {
        dispatch_once(&submitApDataToAWDServer_withAwdConn__defaultOnce_126, v67);
      }
      if (submitApDataToAWDServer_withAwdConn__classDebugEnabled_127)
      {
        v64 = v20;
        v46 = [NSString stringWithFormat:@"%@ : Submit ApData stats: submit cnt=%ld", @"*******PLAWDMetricsService*******", -[PLAWDCpuAP apSubmitCnt](self, "apSubmitCnt")];
        objc_super v47 = (void *)MEMORY[0x263F5F638];
        v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
        objc_super v49 = [v48 lastPathComponent];
        v50 = [NSString stringWithUTF8String:"-[PLAWDCpuAP submitApDataToAWDServer:withAwdConn:]"];
        [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:313];

        v51 = PLLogCommon();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }

        uint64_t v20 = v64;
        double v19 = v65;
      }
    }

    goto LABEL_37;
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v52 = objc_opt_class();
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke_134;
    v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v66[4] = v52;
    if (submitApDataToAWDServer_withAwdConn__defaultOnce_132 != -1) {
      dispatch_once(&submitApDataToAWDServer_withAwdConn__defaultOnce_132, v66);
    }
    if (submitApDataToAWDServer_withAwdConn__classDebugEnabled_133)
    {
      uint64_t v15 = [NSString stringWithFormat:@"%@ : Submit ApData stats: Empty container!!", @"*******PLAWDMetricsService*******"];
      v53 = (void *)MEMORY[0x263F5F638];
      v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
      v55 = [v54 lastPathComponent];
      v56 = [NSString stringWithUTF8String:"-[PLAWDCpuAP submitApDataToAWDServer:withAwdConn:]"];
      [v53 logMessage:v15 fromFile:v55 fromFunction:v56 fromLineNumber:316];

      double v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
LABEL_37:
    }
  }
  [(PLAWDCpuAP *)self resetApTable];
  char v57 = [v6 submitMetric:v7];

  return v57;
}

uint64_t __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitApDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke_128(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitApDataToAWDServer_withAwdConn__classDebugEnabled_127 = result;
  return result;
}

uint64_t __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke_134(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitApDataToAWDServer_withAwdConn__classDebugEnabled_133 = result;
  return result;
}

+ (id)entryAggregateDefinitionAwdCpu
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v21[0] = *MEMORY[0x263F5F880];
  v21[1] = v2;
  v22[0] = &unk_26E5465D0;
  v22[1] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v3;
  v23[1] = *MEMORY[0x263F5F870];
  v19[0] = @"ProcessName";
  objc_super v4 = [MEMORY[0x263F5F650] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v19[1] = @"ProcessTime";
  v20[0] = v5;
  id v6 = [MEMORY[0x263F5F650] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v20[1] = v7;
  unint64_t v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  v23[2] = *MEMORY[0x263F5F828];
  v17 = &unk_26E5465E0;
  uint64_t v15 = *MEMORY[0x263F5F820];
  double v16 = &unk_26E5465E0;
  BOOL v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  double v18 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v24[2] = v10;
  v23[3] = *MEMORY[0x263F5F830];
  double v14 = @"ApValue";
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v24[3] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (void)startCpuMetricCollection:(id)a3
{
}

- (BOOL)submitCpuDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a4;
  double v42 = objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  id v7 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
  unint64_t v8 = [MEMORY[0x263EFF910] monotonicDate];
  [v7 timeIntervalSince1970];
  double v10 = v9;
  [v8 timeIntervalSince1970];
  double v12 = v11 - v10;

  uint64_t v13 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"ApMetrics"];
  double v14 = [(PLAWDAuxMetrics *)self operator];
  uint64_t v15 = [v14 storage];
  double v39 = (void *)v13;
  uint64_t v16 = objc_msgSend(v15, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v13, 86400.0, v10, v12);

  v38 = (void *)v16;
  v17 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v16];
  double v40 = v6;
  id v41 = objc_alloc_init(MEMORY[0x263F8B070]);
  objc_msgSend(v41, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v47;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * v21);
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v23 = objc_opt_class();
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __51__PLAWDCpuAP_submitCpuDataToAWDServer_withAwdConn___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v23;
          if (submitCpuDataToAWDServer_withAwdConn__defaultOnce != -1) {
            dispatch_once(&submitCpuDataToAWDServer_withAwdConn__defaultOnce, block);
          }
          if (submitCpuDataToAWDServer_withAwdConn__classDebugEnabled)
          {
            v24 = [NSString stringWithFormat:@"dbEntry = %@ metric = %@ metricContainer = %@", v22, v41, v42];
            v25 = (void *)MEMORY[0x263F5F638];
            double v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
            double v27 = [v26 lastPathComponent];
            v28 = [NSString stringWithUTF8String:"-[PLAWDCpuAP submitCpuDataToAWDServer:withAwdConn:]"];
            [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:371];

            double v29 = PLLogCommon();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v24;
              _os_log_debug_impl(&dword_2309F8000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v19);
  }

  [(PLAWDCpuAP *)self setCpuLoadSubmitCnt:[(PLAWDCpuAP *)self cpuLoadSubmitCnt] + 1];
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v30 = objc_opt_class();
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __51__PLAWDCpuAP_submitCpuDataToAWDServer_withAwdConn___block_invoke_144;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v30;
    if (submitCpuDataToAWDServer_withAwdConn__defaultOnce_142 != -1) {
      dispatch_once(&submitCpuDataToAWDServer_withAwdConn__defaultOnce_142, v44);
    }
    if (submitCpuDataToAWDServer_withAwdConn__classDebugEnabled_143)
    {
      uint64_t v31 = [NSString stringWithFormat:@"%@ : Submit cpuLoad stats: submit cnt=%ld", @"*******PLAWDMetricsService*******", -[PLAWDCpuAP cpuLoadSubmitCnt](self, "cpuLoadSubmitCnt")];
      uint64_t v32 = (void *)MEMORY[0x263F5F638];
      uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m"];
      uint64_t v34 = [v33 lastPathComponent];
      v35 = [NSString stringWithUTF8String:"-[PLAWDCpuAP submitCpuDataToAWDServer:withAwdConn:]"];
      [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:375];

      id v36 = PLLogCommon();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }

  return 0;
}

uint64_t __51__PLAWDCpuAP_submitCpuDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitCpuDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __51__PLAWDCpuAP_submitCpuDataToAWDServer_withAwdConn___block_invoke_144(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitCpuDataToAWDServer_withAwdConn__classDebugEnabled_143 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)monitorEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMonitorEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wakeEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWakeEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)ioreportEnergyEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIoreportEnergyEventCallback:(id)a3
{
}

- (NSDate)sleepStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSleepStartTime:(id)a3
{
}

- (BOOL)isIoreportEnergy
{
  return self->_isIoreportEnergy;
}

- (void)setIsIoreportEnergy:(BOOL)a3
{
  self->_isIoreportEnergy = a3;
}

- (int64_t)apSubmitCnt
{
  return self->_apSubmitCnt;
}

- (void)setApSubmitCnt:(int64_t)a3
{
  self->_apSubmitCnt = a3;
}

- (int64_t)cpuLoadSubmitCnt
{
  return self->_cpuLoadSubmitCnt;
}

- (void)setCpuLoadSubmitCnt:(int64_t)a3
{
  self->_cpuLoadSubmitCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStartTime, 0);
  objc_storeStrong((id *)&self->_ioreportEnergyEventCallback, 0);
  objc_storeStrong((id *)&self->_wakeEventCallback, 0);

  objc_storeStrong((id *)&self->_monitorEventCallback, 0);
}

@end