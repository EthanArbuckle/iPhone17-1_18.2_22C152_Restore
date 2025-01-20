@interface PLAWDWifiBT
+ (id)entryAggregateDefinitionAwdBT;
+ (id)entryAggregateDefinitionAwdWifi;
+ (id)entryAggregateDefinitions;
+ (id)getSharedObjWithOperator:(id)a3;
- (BOOL)isBTRailStart;
- (BOOL)isBTStart;
- (BOOL)isWiFiRailStart;
- (BOOL)isWiFiStart;
- (BOOL)submitBtDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (BOOL)submitWiFiDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (PLEntryNotificationOperatorComposition)btEventCallback;
- (PLEntryNotificationOperatorComposition)btPowerCallback;
- (PLEntryNotificationOperatorComposition)btRailCallback;
- (PLEntryNotificationOperatorComposition)wifiEventCallback;
- (PLEntryNotificationOperatorComposition)wifiRailCallback;
- (int64_t)btSubmitCnt;
- (int64_t)wifiSubmitCnt;
- (void)addEntryToBTTable:(id)a3 withValue:(double)a4;
- (void)addEntryToWiFiTable:(id)a3 withValue:(double)a4 andBand:(id)a5;
- (void)handleBTCallback:(id)a3;
- (void)handleBTPowerCallback:(id)a3;
- (void)handleWifiCallback:(id)a3;
- (void)resetBTTable;
- (void)resetWifiTable;
- (void)setBtEventCallback:(id)a3;
- (void)setBtPowerCallback:(id)a3;
- (void)setBtRailCallback:(id)a3;
- (void)setBtSubmitCnt:(int64_t)a3;
- (void)setIsBTRailStart:(BOOL)a3;
- (void)setIsBTStart:(BOOL)a3;
- (void)setIsWiFiRailStart:(BOOL)a3;
- (void)setIsWiFiStart:(BOOL)a3;
- (void)setWifiEventCallback:(id)a3;
- (void)setWifiRailCallback:(id)a3;
- (void)setWifiSubmitCnt:(int64_t)a3;
- (void)startBtMetricCollection;
- (void)startMetricCollection:(id)a3;
- (void)startWifiMetricCollection;
- (void)stopMetricCollection:(id)a3;
@end

@implementation PLAWDWifiBT

+ (id)getSharedObjWithOperator:(id)a3
{
  v3 = (void *)plAwdWifiBT;
  if (!plAwdWifiBT)
  {
    id v4 = a3;
    v5 = [(PLAWDAuxMetrics *)[PLAWDWifiBT alloc] initWithOperator:v4];

    v6 = (void *)plAwdWifiBT;
    plAwdWifiBT = (uint64_t)v5;

    v3 = (void *)plAwdWifiBT;
  }

  return v3;
}

+ (id)entryAggregateDefinitions
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"AwdWifi";
  v3 = [a1 entryAggregateDefinitionAwdWifi];
  v7[1] = @"AwdBT";
  v8[0] = v3;
  id v4 = [a1 entryAggregateDefinitionAwdBT];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)startMetricCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 longValue];
  if (v5 == 2031624)
  {
    [(PLAWDWifiBT *)self startBtMetricCollection];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __37__PLAWDWifiBT_startMetricCollection___block_invoke_102;
      v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v19[4] = v13;
      if (startMetricCollection__defaultOnce_100 != -1) {
        dispatch_once(&startMetricCollection__defaultOnce_100, v19);
      }
      if (startMetricCollection__classDebugEnabled_101)
      {
        v7 = [NSString stringWithFormat:@"%@ : Start BT collection ", @"*******PLAWDMetricsService*******"];
        v14 = (void *)MEMORY[0x263F5F638];
        v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        v16 = [v15 lastPathComponent];
        v17 = [NSString stringWithUTF8String:"-[PLAWDWifiBT startMetricCollection:]"];
        [v14 logMessage:v7 fromFile:v16 fromFunction:v17 fromLineNumber:98];

        v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
        goto LABEL_15;
      }
    }
  }
  else if (v5 == 2031621)
  {
    [(PLAWDWifiBT *)self startWifiMetricCollection];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__PLAWDWifiBT_startMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (startMetricCollection__defaultOnce_2 != -1) {
        dispatch_once(&startMetricCollection__defaultOnce_2, block);
      }
      if (startMetricCollection__classDebugEnabled_2)
      {
        v7 = [NSString stringWithFormat:@"%@ : Start Wifi collection ", @"*******PLAWDMetricsService*******"];
        v8 = (void *)MEMORY[0x263F5F638];
        v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        v10 = [v9 lastPathComponent];
        v11 = [NSString stringWithUTF8String:"-[PLAWDWifiBT startMetricCollection:]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:92];

        v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
LABEL_15:
      }
    }
  }
  v18 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v18 addObject:v4];
}

uint64_t __37__PLAWDWifiBT_startMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled_2 = result;
  return result;
}

uint64_t __37__PLAWDWifiBT_startMetricCollection___block_invoke_102(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled_101 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAWDAuxMetrics *)self runningMetrics];
  [v5 removeObject:v4];

  uint64_t v6 = [v4 longValue];
  if (v6 == 2031624)
  {
    [(PLAWDWifiBT *)self setBtEventCallback:0];
    [(PLAWDWifiBT *)self setBtPowerCallback:0];
    [(PLAWDWifiBT *)self setBtRailCallback:0];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __36__PLAWDWifiBT_stopMetricCollection___block_invoke_111;
      v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v22[4] = v14;
      if (stopMetricCollection__defaultOnce_109 != -1) {
        dispatch_once(&stopMetricCollection__defaultOnce_109, v22);
      }
      if (stopMetricCollection__classDebugEnabled_110)
      {
        v8 = [NSString stringWithFormat:@"%@ : Stop BT collection ", @"*******PLAWDMetricsService*******"];
        v15 = (void *)MEMORY[0x263F5F638];
        v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLAWDWifiBT stopMetricCollection:]"];
        [v15 logMessage:v8 fromFile:v17 fromFunction:v18 fromLineNumber:123];

        uint64_t v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
        goto LABEL_15;
      }
    }
  }
  else if (v6 == 2031621)
  {
    [(PLAWDWifiBT *)self setWifiEventCallback:0];
    [(PLAWDWifiBT *)self setWifiRailCallback:0];
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__PLAWDWifiBT_stopMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (stopMetricCollection__defaultOnce_2 != -1) {
        dispatch_once(&stopMetricCollection__defaultOnce_2, block);
      }
      if (stopMetricCollection__classDebugEnabled_2)
      {
        v8 = [NSString stringWithFormat:@"%@ : Stop Wifi collection ", @"*******PLAWDMetricsService*******"];
        v9 = (void *)MEMORY[0x263F5F638];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLAWDWifiBT stopMetricCollection:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:116];

        uint64_t v13 = PLLogCommon();
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
    v21 = (void *)plAwdWifiBT;
    plAwdWifiBT = 0;
  }
}

uint64_t __36__PLAWDWifiBT_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopMetricCollection__classDebugEnabled_2 = result;
  return result;
}

uint64_t __36__PLAWDWifiBT_stopMetricCollection___block_invoke_111(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopMetricCollection__classDebugEnabled_110 = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 longValue];
  if (v8 == 2031624)
  {
    [(PLAWDWifiBT *)self submitBtDataToAWDServer:v6 withAwdConn:v7];
  }
  else
  {
    if (v8 != 2031621)
    {
      BOOL v9 = 0;
      goto LABEL_7;
    }
    [(PLAWDWifiBT *)self submitWiFiDataToAWDServer:v6 withAwdConn:v7];
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

+ (id)entryAggregateDefinitionAwdWifi
{
  v26[4] = *MEMORY[0x263EF8340];
  v25[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v23[0] = *MEMORY[0x263F5F880];
  v23[1] = v2;
  v24[0] = &unk_26E546630;
  v24[1] = MEMORY[0x263EFFA80];
  v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v15;
  v25[1] = *MEMORY[0x263F5F870];
  v21[0] = @"WifiState";
  uint64_t v14 = [MEMORY[0x263F5F650] sharedInstance];
  v3 = objc_msgSend(v14, "commonTypeDict_StringFormat");
  v22[0] = v3;
  v21[1] = @"Band";
  id v4 = [MEMORY[0x263F5F650] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v22[1] = v5;
  v21[2] = @"Value";
  id v6 = [MEMORY[0x263F5F650] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v22[2] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  v26[1] = v8;
  v25[2] = *MEMORY[0x263F5F828];
  v19 = &unk_26E546640;
  uint64_t v17 = *MEMORY[0x263F5F820];
  v18 = &unk_26E546640;
  BOOL v9 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  uint64_t v20 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v26[2] = v10;
  v25[3] = *MEMORY[0x263F5F830];
  v16 = @"Value";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v26[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

  return v12;
}

- (void)startWifiMetricCollection
{
  [(PLAWDWifiBT *)self setWifiSubmitCnt:0];
  [(PLAWDWifiBT *)self resetWifiTable];
  [(PLAWDWifiBT *)self setIsWiFiRailStart:1];
  [(PLAWDWifiBT *)self setIsWiFiStart:1];
  v3 = [MEMORY[0x263F5F928] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5FA40]];
  id v4 = objc_alloc(MEMORY[0x263F5F658]);
  uint64_t v5 = [(PLAWDAuxMetrics *)self operator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__PLAWDWifiBT_startWifiMetricCollection__block_invoke;
  void v8[3] = &unk_264B99DD0;
  v8[4] = self;
  id v6 = (void *)[v4 initWithOperator:v5 forEntryKey:v3 withBlock:v8];

  [(PLAWDWifiBT *)self setWifiEventCallback:v6];
  id v7 = [(PLAWDWifiBT *)self wifiEventCallback];
  [v7 requestEntry];
}

uint64_t __40__PLAWDWifiBT_startWifiMetricCollection__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleWifiCallback:a2];
  }
  return result;
}

- (void)resetWifiTable
{
  v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AwdWifi"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDWifiBT;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (void)addEntryToWiFiTable:(id)a3 withValue:(double)a4 andBand:(id)a5
{
  uint64_t v8 = *MEMORY[0x263F5F888];
  id v9 = a5;
  id v10 = a3;
  id v14 = +[PLOperator entryKeyForType:v8 andName:@"AwdWifi"];
  v11 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v14];
  [v11 setObject:v10 forKeyedSubscript:@"WifiState"];

  v12 = [NSNumber numberWithDouble:a4];
  [v11 setObject:v12 forKeyedSubscript:@"Value"];

  [v11 setObject:v9 forKeyedSubscript:@"Band"];
  uint64_t v13 = [(PLAWDAuxMetrics *)self operator];
  [v13 logEntry:v11];
}

- (void)handleWifiCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"entry"];
  if (!v5) {
    goto LABEL_146;
  }
  if ([(PLAWDWifiBT *)self isWiFiStart])
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      v268[0] = MEMORY[0x263EF8330];
      v268[1] = 3221225472;
      v268[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke;
      v268[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v268[4] = v6;
      id v7 = v268;
      if (handleWifiCallback__defaultOnce != -1) {
        dispatch_once(&handleWifiCallback__defaultOnce, v7);
      }

      if (handleWifiCallback__classDebugEnabled)
      {
        uint64_t v8 = [NSString stringWithFormat:@"%@ : Wifi first DiffProperty entry", @"*******PLAWDMetricsService*******"];
        id v9 = (void *)MEMORY[0x263F5F638];
        id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:243];

        uint64_t v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDWifiBT *)self setIsWiFiStart:0];
    v267.receiver = self;
    v267.super_class = (Class)PLAWDWifiBT;
    if ([(PLAWDAuxMetrics *)&v267 dropFirstEntryReceived:v5 usingFilter:0 andStartTime:0])
    {
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v14 = objc_opt_class();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_135;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v14;
        if (handleWifiCallback__defaultOnce_133 != -1) {
          dispatch_once(&handleWifiCallback__defaultOnce_133, block);
        }
        if (handleWifiCallback__classDebugEnabled_134)
        {
          v15 = [NSString stringWithFormat:@"%@ : Wifi DiffProperty first entry - dropped - %@", @"*******PLAWDMetricsService*******", v5];
          v16 = (void *)MEMORY[0x263F5F638];
          uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
          v18 = [v17 lastPathComponent];
          v19 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
          [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:248];

          uint64_t v20 = PLLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }

          goto LABEL_145;
        }
      }
      goto LABEL_146;
    }
  }
  v21 = [v5 objectForKeyedSubscript:@"CurrentChannel"];
  [v21 doubleValue];
  double v23 = v22;

  if (v23 <= 13.0)
  {
    v27 = @"band_2p4_ghz";
  }
  else
  {
    v24 = [v5 objectForKeyedSubscript:@"CurrentBandwidth"];
    [v24 doubleValue];
    double v26 = v25;

    if (v26 == 20.0)
    {
      v27 = @"band_5p02_ghz";
    }
    else
    {
      v241 = [v5 objectForKeyedSubscript:@"CurrentBandwidth"];
      [v241 doubleValue];
      double v243 = v242;

      if (v243 == 40.0)
      {
        v27 = @"band_5p04_ghz";
      }
      else
      {
        v244 = [v5 objectForKeyedSubscript:@"CurrentBandwidth"];
        [v244 doubleValue];
        double v246 = v245;

        if (v246 == 80.0) {
          v27 = @"band_5p08_ghz";
        }
        else {
          v27 = 0;
        }
      }
    }
  }
  v28 = [v5 objectForKeyedSubscript:@"TimeDuration"];
  [v28 doubleValue];
  double v30 = v29;

  if (v30 > 0.0)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v31 = objc_opt_class();
      v265[0] = MEMORY[0x263EF8330];
      v265[1] = 3221225472;
      v265[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_150;
      v265[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v265[4] = v31;
      v32 = v265;
      if (handleWifiCallback__defaultOnce_148 != -1) {
        dispatch_once(&handleWifiCallback__defaultOnce_148, v32);
      }

      if (handleWifiCallback__classDebugEnabled_149)
      {
        v33 = NSString;
        v34 = [v5 objectForKeyedSubscript:@"TimeDuration"];
        [v34 doubleValue];
        v36 = objc_msgSend(v33, "stringWithFormat:", @"kPLWATimeDuration = %f", v35);

        v37 = (void *)MEMORY[0x263F5F638];
        v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        v39 = [v38 lastPathComponent];
        v40 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
        [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:266];

        v41 = PLLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    v42 = [v5 objectForKeyedSubscript:@"TimeDuration"];
    [v42 doubleValue];
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", @"WifiTotalDuration", v27);
  }
  v43 = [v5 objectForKeyedSubscript:@"PMDuration"];
  [v43 doubleValue];
  if (v44 == 0.0)
  {
    v45 = [v5 objectForKeyedSubscript:@"MPCDuration"];
    [v45 doubleValue];
    double v47 = v46;

    if (v47 == 0.0) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v48 = objc_opt_class();
    v264[0] = MEMORY[0x263EF8330];
    v264[1] = 3221225472;
    v264[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_162;
    v264[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v264[4] = v48;
    v49 = v264;
    if (handleWifiCallback__defaultOnce_160 != -1) {
      dispatch_once(&handleWifiCallback__defaultOnce_160, v49);
    }

    if (handleWifiCallback__classDebugEnabled_161)
    {
      v50 = NSString;
      v51 = [v5 objectForKeyedSubscript:@"PMDuration"];
      [v51 doubleValue];
      v53 = objc_msgSend(v50, "stringWithFormat:", @"kPLWAPMDuration = %f", v52);

      v54 = (void *)MEMORY[0x263F5F638];
      v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v56 = [v55 lastPathComponent];
      v57 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
      [v54 logMessage:v53 fromFile:v56 fromFunction:v57 fromLineNumber:273];

      v58 = PLLogCommon();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v59 = objc_opt_class();
    v263[0] = MEMORY[0x263EF8330];
    v263[1] = 3221225472;
    v263[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_168;
    v263[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v263[4] = v59;
    v60 = v263;
    if (handleWifiCallback__defaultOnce_166 != -1) {
      dispatch_once(&handleWifiCallback__defaultOnce_166, v60);
    }

    if (handleWifiCallback__classDebugEnabled_167)
    {
      v61 = NSString;
      v62 = [v5 objectForKeyedSubscript:@"MPCDuration"];
      [v62 doubleValue];
      v64 = objc_msgSend(v61, "stringWithFormat:", @"kPLWAMPCDuration = %f", v63);

      v65 = (void *)MEMORY[0x263F5F638];
      v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v67 = [v66 lastPathComponent];
      v68 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
      [v65 logMessage:v64 fromFile:v67 fromFunction:v68 fromLineNumber:274];

      v69 = PLLogCommon();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  v70 = [v5 objectForKeyedSubscript:@"PMDuration"];
  [v70 doubleValue];
  double v72 = v71;
  v73 = [v5 objectForKeyedSubscript:@"MPCDuration"];
  [v73 doubleValue];
  [(PLAWDWifiBT *)self addEntryToWiFiTable:@"WifiSleepTime" withValue:v27 andBand:v72 + v74];

LABEL_50:
  v75 = [v5 objectForKeyedSubscript:@"TXDuration"];
  [v75 doubleValue];
  double v77 = v76;

  if (v77 > 0.0)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v78 = objc_opt_class();
      v262[0] = MEMORY[0x263EF8330];
      v262[1] = 3221225472;
      v262[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_177;
      v262[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v262[4] = v78;
      v79 = v262;
      if (handleWifiCallback__defaultOnce_175 != -1) {
        dispatch_once(&handleWifiCallback__defaultOnce_175, v79);
      }

      if (handleWifiCallback__classDebugEnabled_176)
      {
        v80 = NSString;
        v81 = [v5 objectForKeyedSubscript:@"TXDuration"];
        [v81 doubleValue];
        v83 = objc_msgSend(v80, "stringWithFormat:", @"kPLWATXDuration = %f", v82);

        v84 = (void *)MEMORY[0x263F5F638];
        v85 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        v86 = [v85 lastPathComponent];
        v87 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
        [v84 logMessage:v83 fromFile:v86 fromFunction:v87 fromLineNumber:281];

        v88 = PLLogCommon();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    v89 = [v5 objectForKeyedSubscript:@"TXDuration"];
    [v89 doubleValue];
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", @"WifiTxDuration", v27);
  }
  v90 = [v5 objectForKeyedSubscript:@"RXDuration"];
  [v90 doubleValue];
  double v92 = v91;

  if (v92 > 0.0)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v93 = objc_opt_class();
      v261[0] = MEMORY[0x263EF8330];
      v261[1] = 3221225472;
      v261[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_186;
      v261[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v261[4] = v93;
      v94 = v261;
      if (handleWifiCallback__defaultOnce_184 != -1) {
        dispatch_once(&handleWifiCallback__defaultOnce_184, v94);
      }

      if (handleWifiCallback__classDebugEnabled_185)
      {
        v95 = NSString;
        v96 = [v5 objectForKeyedSubscript:@"RXDuration"];
        [v96 doubleValue];
        v98 = objc_msgSend(v95, "stringWithFormat:", @"kPLWARXDuration = %f", v97);

        v99 = (void *)MEMORY[0x263F5F638];
        v100 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        v101 = [v100 lastPathComponent];
        v102 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
        [v99 logMessage:v98 fromFile:v101 fromFunction:v102 fromLineNumber:288];

        v103 = PLLogCommon();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    v104 = [v5 objectForKeyedSubscript:@"RXDuration"];
    [v104 doubleValue];
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", @"WifiRxDuration", v27);
  }
  v105 = [v5 objectForKeyedSubscript:@"HSICActiveDuration"];
  [v105 doubleValue];
  double v107 = v106;

  if (v107 > 0.0)
  {
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v108 = objc_opt_class();
      v260[0] = MEMORY[0x263EF8330];
      v260[1] = 3221225472;
      v260[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_195;
      v260[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v260[4] = v108;
      v109 = v260;
      if (handleWifiCallback__defaultOnce_193 != -1) {
        dispatch_once(&handleWifiCallback__defaultOnce_193, v109);
      }

      if (handleWifiCallback__classDebugEnabled_194)
      {
        v110 = NSString;
        v111 = [v5 objectForKeyedSubscript:@"HSICActiveDuration"];
        [v111 doubleValue];
        v113 = objc_msgSend(v110, "stringWithFormat:", @"kPLWATXDuration = %f", v112);

        v114 = (void *)MEMORY[0x263F5F638];
        v115 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        v116 = [v115 lastPathComponent];
        v117 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
        [v114 logMessage:v113 fromFile:v116 fromFunction:v117 fromLineNumber:295];

        v118 = PLLogCommon();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    v119 = [v5 objectForKeyedSubscript:@"HSICActiveDuration"];
    [v119 doubleValue];
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", @"WifiHsicDuration", v27);
  }
  v120 = [v5 objectForKeyedSubscript:@"PNOScanSSIDDuration"];
  [v120 doubleValue];
  if (v121 == 0.0)
  {
    v122 = [v5 objectForKeyedSubscript:@"PNOBSSIDDuration"];
    [v122 doubleValue];
    if (v123 == 0.0)
    {
      v124 = [v5 objectForKeyedSubscript:@"RoamScanDuration"];
      [v124 doubleValue];
      if (v125 == 0.0)
      {
        v126 = [v5 objectForKeyedSubscript:@"AssociatedScanDuration"];
        [v126 doubleValue];
        if (v127 == 0.0)
        {
          v128 = [v5 objectForKeyedSubscript:@"OtherScanDuration"];
          [v128 doubleValue];
          if (v129 == 0.0)
          {
            v250 = v27;
            v251 = self;
            id v130 = v4;
            v131 = [v5 objectForKeyedSubscript:@"UserScanDuration"];
            [v131 doubleValue];
            if (v132 == 0.0)
            {
              v247 = [v5 objectForKeyedSubscript:@"ScanDuration"];
              [v247 doubleValue];
              double v249 = v248;

              id v4 = v130;
              v27 = v250;
              self = v251;
              if (v249 == 0.0) {
                goto LABEL_139;
              }
              goto LABEL_89;
            }

            id v4 = v130;
            v27 = v250;
          }
        }
      }
    }
  }

LABEL_89:
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v133 = objc_opt_class();
    v259[0] = MEMORY[0x263EF8330];
    v259[1] = 3221225472;
    v259[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_219;
    v259[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v259[4] = v133;
    v134 = v259;
    if (handleWifiCallback__defaultOnce_217 != -1) {
      dispatch_once(&handleWifiCallback__defaultOnce_217, v134);
    }

    if (handleWifiCallback__classDebugEnabled_218)
    {
      v135 = NSString;
      v136 = [v5 objectForKeyedSubscript:@"PNOScanSSIDDuration"];
      [v136 doubleValue];
      v138 = objc_msgSend(v135, "stringWithFormat:", @"kPLWAPNOScanSSIDDuration = %f", v137);

      v139 = (void *)MEMORY[0x263F5F638];
      v140 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v141 = [v140 lastPathComponent];
      v142 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
      [v139 logMessage:v138 fromFile:v141 fromFunction:v142 fromLineNumber:305];

      v143 = PLLogCommon();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v144 = objc_opt_class();
    v258[0] = MEMORY[0x263EF8330];
    v258[1] = 3221225472;
    v258[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_225;
    v258[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v258[4] = v144;
    v145 = v258;
    if (handleWifiCallback__defaultOnce_223 != -1) {
      dispatch_once(&handleWifiCallback__defaultOnce_223, v145);
    }

    if (handleWifiCallback__classDebugEnabled_224)
    {
      v146 = NSString;
      v147 = [v5 objectForKeyedSubscript:@"PNOBSSIDDuration"];
      [v147 doubleValue];
      v149 = objc_msgSend(v146, "stringWithFormat:", @"kPLWAPNOScanBSSIDDuration = %f", v148);

      v150 = (void *)MEMORY[0x263F5F638];
      v151 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v152 = [v151 lastPathComponent];
      v153 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
      [v150 logMessage:v149 fromFile:v152 fromFunction:v153 fromLineNumber:306];

      v154 = PLLogCommon();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v155 = objc_opt_class();
    v257[0] = MEMORY[0x263EF8330];
    v257[1] = 3221225472;
    v257[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_231;
    v257[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v257[4] = v155;
    v156 = v257;
    if (handleWifiCallback__defaultOnce_229 != -1) {
      dispatch_once(&handleWifiCallback__defaultOnce_229, v156);
    }

    if (handleWifiCallback__classDebugEnabled_230)
    {
      v157 = NSString;
      v158 = [v5 objectForKeyedSubscript:@"RoamScanDuration"];
      [v158 doubleValue];
      v160 = objc_msgSend(v157, "stringWithFormat:", @"kPLWARoamScanDuration = %f", v159);

      v161 = (void *)MEMORY[0x263F5F638];
      v162 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v163 = [v162 lastPathComponent];
      v164 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
      [v161 logMessage:v160 fromFile:v163 fromFunction:v164 fromLineNumber:307];

      v165 = PLLogCommon();
      if (os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v166 = objc_opt_class();
    v256[0] = MEMORY[0x263EF8330];
    v256[1] = 3221225472;
    v256[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_237;
    v256[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v256[4] = v166;
    v167 = v256;
    if (handleWifiCallback__defaultOnce_235 != -1) {
      dispatch_once(&handleWifiCallback__defaultOnce_235, v167);
    }

    if (handleWifiCallback__classDebugEnabled_236)
    {
      v168 = NSString;
      v169 = [v5 objectForKeyedSubscript:@"AssociatedScanDuration"];
      [v169 doubleValue];
      v171 = objc_msgSend(v168, "stringWithFormat:", @"kPLWAAssociatedScanDuration = %f", v170);

      v172 = (void *)MEMORY[0x263F5F638];
      v173 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v174 = [v173 lastPathComponent];
      v175 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
      [v172 logMessage:v171 fromFile:v174 fromFunction:v175 fromLineNumber:308];

      v176 = PLLogCommon();
      if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v177 = objc_opt_class();
    v255[0] = MEMORY[0x263EF8330];
    v255[1] = 3221225472;
    v255[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_243;
    v255[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v255[4] = v177;
    v178 = v255;
    if (handleWifiCallback__defaultOnce_241 != -1) {
      dispatch_once(&handleWifiCallback__defaultOnce_241, v178);
    }

    if (handleWifiCallback__classDebugEnabled_242)
    {
      v179 = NSString;
      v180 = [v5 objectForKeyedSubscript:@"OtherScanDuration"];
      [v180 doubleValue];
      v182 = objc_msgSend(v179, "stringWithFormat:", @"kPLWAOtherScanDuration = %f", v181);

      v183 = (void *)MEMORY[0x263F5F638];
      v184 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v185 = [v184 lastPathComponent];
      v186 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
      [v183 logMessage:v182 fromFile:v185 fromFunction:v186 fromLineNumber:309];

      v187 = PLLogCommon();
      if (os_log_type_enabled(v187, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v188 = objc_opt_class();
    v254[0] = MEMORY[0x263EF8330];
    v254[1] = 3221225472;
    v254[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_249;
    v254[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v254[4] = v188;
    v189 = v254;
    if (handleWifiCallback__defaultOnce_247 != -1) {
      dispatch_once(&handleWifiCallback__defaultOnce_247, v189);
    }

    if (handleWifiCallback__classDebugEnabled_248)
    {
      v190 = NSString;
      v191 = [v5 objectForKeyedSubscript:@"UserScanDuration"];
      [v191 doubleValue];
      v193 = objc_msgSend(v190, "stringWithFormat:", @"kPLWAUserScanDuration = %f", v192);

      v194 = (void *)MEMORY[0x263F5F638];
      v195 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v196 = [v195 lastPathComponent];
      v197 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
      [v194 logMessage:v193 fromFile:v196 fromFunction:v197 fromLineNumber:310];

      v198 = PLLogCommon();
      if (os_log_type_enabled(v198, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  id v252 = v4;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v199 = objc_opt_class();
    v253[0] = MEMORY[0x263EF8330];
    v253[1] = 3221225472;
    v253[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_255;
    v253[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v253[4] = v199;
    v200 = v253;
    if (handleWifiCallback__defaultOnce_253 != -1) {
      dispatch_once(&handleWifiCallback__defaultOnce_253, v200);
    }

    if (handleWifiCallback__classDebugEnabled_254)
    {
      v201 = NSString;
      v202 = [v5 objectForKeyedSubscript:@"ScanDuration"];
      [v202 doubleValue];
      v204 = objc_msgSend(v201, "stringWithFormat:", @"kPLWAScanDuration = %f", v203);

      v205 = (void *)MEMORY[0x263F5F638];
      v206 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v207 = [v206 lastPathComponent];
      v208 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleWifiCallback:]"];
      [v205 logMessage:v204 fromFile:v207 fromFunction:v208 fromLineNumber:311];

      v209 = PLLogCommon();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  v210 = [v5 objectForKeyedSubscript:@"PNOScanSSIDDuration"];
  [v210 doubleValue];
  double v212 = v211;
  v213 = [v5 objectForKeyedSubscript:@"PNOBSSIDDuration"];
  [v213 doubleValue];
  double v215 = v212 + v214;
  v216 = [v5 objectForKeyedSubscript:@"RoamScanDuration"];
  [v216 doubleValue];
  double v218 = v215 + v217;
  v219 = [v5 objectForKeyedSubscript:@"AssociatedScanDuration"];
  [v219 doubleValue];
  double v221 = v218 + v220;
  v222 = [v5 objectForKeyedSubscript:@"OtherScanDuration"];
  [v222 doubleValue];
  double v224 = v221 + v223;
  v225 = [v5 objectForKeyedSubscript:@"UserScanDuration"];
  [v225 doubleValue];
  double v227 = v224 + v226;
  v228 = [v5 objectForKeyedSubscript:@"ScanDuration"];
  [v228 doubleValue];
  [(PLAWDWifiBT *)self addEntryToWiFiTable:@"WifiScanDuration" withValue:v27 andBand:v227 + v229];

  id v4 = v252;
LABEL_139:
  v230 = [v5 objectForKeyedSubscript:@"FRTSDuration"];
  [v230 doubleValue];
  double v232 = v231;

  if (v232 > 0.0)
  {
    v233 = [v5 objectForKeyedSubscript:@"FRTSDuration"];
    [v233 doubleValue];
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", @"WifiFrtsDuration", v27);
  }
  v234 = [v5 objectForKeyedSubscript:@"PCIESuspendDuration"];
  [v234 doubleValue];
  double v236 = v235;

  if (v236 > 0.0)
  {
    v237 = [v5 objectForKeyedSubscript:@"PCIESuspendDuration"];
    [v237 doubleValue];
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", @"WifiPcieSuspendDuration", v27);
  }
  v238 = [v5 objectForKeyedSubscript:@"PCIEActiveDuration"];
  [v238 doubleValue];
  double v240 = v239;

  if (v240 > 0.0)
  {
    v15 = [v5 objectForKeyedSubscript:@"PCIEActiveDuration"];
    [v15 doubleValue];
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", @"WifiPcieActiveDuration", v27);
LABEL_145:
  }
LABEL_146:
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_135(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_134 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_150(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_149 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_162(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_161 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_168(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_167 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_177(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_176 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_186(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_185 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_195(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_194 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_219(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_218 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_225(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_224 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_231(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_230 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_237(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_236 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_243(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_242 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_249(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_248 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_255(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleWifiCallback__classDebugEnabled_254 = result;
  return result;
}

- (BOOL)submitWiFiDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  if (v7)
  {
    uint64_t v8 = [(PLAWDWifiBT *)self wifiEventCallback];
    [v8 requestEntry];

    sleep(5u);
    id v9 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
    id v10 = [MEMORY[0x263EFF910] monotonicDate];
    [v9 timeIntervalSince1970];
    double v12 = v11;
    [v10 timeIntervalSince1970];
    double v14 = v13 - v12;

    v15 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AwdWifi"];
    v16 = [(PLAWDAuxMetrics *)self operator];
    uint64_t v17 = [v16 storage];
    uint64_t v18 = objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14);

    v80 = v18;
    v19 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v18];
    uint64_t v20 = objc_opt_new();
    v81 = v19;
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v21 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v21;
      if (submitWiFiDataToAWDServer_withAwdConn__defaultOnce != -1) {
        dispatch_once(&submitWiFiDataToAWDServer_withAwdConn__defaultOnce, block);
      }
      if (submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled)
      {
        double v22 = [NSString stringWithFormat:@"%@ : %@", @"*******PLAWDMetricsService*******", v19];
        double v23 = (void *)MEMORY[0x263F5F638];
        v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        double v25 = [v24 lastPathComponent];
        double v26 = [NSString stringWithUTF8String:"-[PLAWDWifiBT submitWiFiDataToAWDServer:withAwdConn:]"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:357];

        v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }

        v19 = v81;
      }
    }
    if (v20)
    {
      double v77 = v15;
      uint64_t v78 = v7;
      v79 = self;
      [v20 setTimestamp:0];
      [v20 setWifi2P4GHzRxDuration:0];
      [v20 setWifi2P4GHzTxDuration:0];
      [v20 setWifi5GHz20MHzRxDuration:0];
      [v20 setWifi5GHz20MHzTxDuration:0];
      [v20 setWifi5GHz40MHzRxDuration:0];
      [v20 setWifi5GHz40MHzTxDuration:0];
      [v20 setWifi5GHz80MHzRxDuration:0];
      [v20 setWifi5GHz80MHzTxDuration:0];
      [v20 setWifiFRTSDuration:0];
      [v20 setWifiHsicActiveDuration:0];
      [v20 setWifiPcieL0Duration:0];
      [v20 setWifiPcieL10Duration:0];
      [v20 setWifiPcieL11Duration:0];
      [v20 setWifiPcieL12Duration:0];
      [v20 setWifiScanDuration:0];
      [v20 setWifiSleepDuration:0];
      [v20 setWifiTotalDuration:0];
      [v20 setWifiTotalPowerMicroWatt:0];
      objc_msgSend(v20, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v28 = v19;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v85 objects:v90 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v86;
        v32 = @"WifiPcieActiveDuration";
        id v82 = v28;
        do
        {
          uint64_t v33 = 0;
          do
          {
            v34 = v32;
            if (*(void *)v86 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v35 = *(void **)(*((void *)&v85 + 1) + 8 * v33);
            id v36 = [NSString alloc];
            v37 = [v35 objectForKeyedSubscript:@"WifiState"];
            v38 = (void *)[v36 initWithFormat:@"%@", v37];

            if ([v38 isEqualToString:@"WifiTotalDuration"])
            {
              v39 = [v35 objectForKeyedSubscript:@"Value"];
              [v39 doubleValue];
              [v20 setWifiTotalDuration:v40];
LABEL_29:

              v32 = v34;
              goto LABEL_30;
            }
            if ([v38 isEqualToString:@"WifiScanDuration"])
            {
              v39 = [v35 objectForKeyedSubscript:@"Value"];
              [v39 doubleValue];
              [v20 setWifiScanDuration:v41];
              goto LABEL_29;
            }
            if ([v38 isEqualToString:@"WifiTxDuration"])
            {
              id v42 = [NSString alloc];
              v43 = [v35 objectForKeyedSubscript:@"Band"];
              v39 = (void *)[v42 initWithFormat:@"%@", v43];

              if ([v39 isEqualToString:@"band_2p4_ghz"])
              {
                double v44 = [v35 objectForKeyedSubscript:@"Value"];
                [v44 doubleValue];
                [v20 setWifi2P4GHzTxDuration:v45];
                goto LABEL_27;
              }
              if ([v39 isEqualToString:@"band_5p02_ghz"])
              {
                double v44 = [v35 objectForKeyedSubscript:@"Value"];
                [v44 doubleValue];
                [v20 setWifi5GHz20MHzTxDuration:v49];
LABEL_27:
                id v28 = v82;
              }
              else
              {
                id v28 = v82;
                if ([v39 isEqualToString:@"band_5p04_ghz"])
                {
                  double v44 = [v35 objectForKeyedSubscript:@"Value"];
                  [v44 doubleValue];
                  [v20 setWifi5GHz40MHzTxDuration:v52];
                }
                else
                {
                  if (![v39 isEqualToString:@"band_5p08_ghz"]) {
                    goto LABEL_29;
                  }
                  double v44 = [v35 objectForKeyedSubscript:@"Value"];
                  [v44 doubleValue];
                  [v20 setWifi5GHz80MHzTxDuration:v55];
                }
              }
              goto LABEL_28;
            }
            if ([v38 isEqualToString:@"WifiRxDuration"])
            {
              id v46 = [NSString alloc];
              double v47 = [v35 objectForKeyedSubscript:@"Band"];
              v39 = (void *)[v46 initWithFormat:@"%@", v47];

              if ([v39 isEqualToString:@"band_2p4_ghz"])
              {
                double v44 = [v35 objectForKeyedSubscript:@"Value"];
                [v44 doubleValue];
                [v20 setWifi2P4GHzRxDuration:v48];
                goto LABEL_27;
              }
              id v28 = v82;
              if ([v39 isEqualToString:@"band_5p02_ghz"])
              {
                double v44 = [v35 objectForKeyedSubscript:@"Value"];
                [v44 doubleValue];
                [v20 setWifi5GHz20MHzRxDuration:v51];
              }
              else if ([v39 isEqualToString:@"band_5p04_ghz"])
              {
                double v44 = [v35 objectForKeyedSubscript:@"Value"];
                [v44 doubleValue];
                [v20 setWifi5GHz40MHzRxDuration:v54];
              }
              else
              {
                if (![v39 isEqualToString:@"band_5p08_ghz"]) {
                  goto LABEL_29;
                }
                double v44 = [v35 objectForKeyedSubscript:@"Value"];
                [v44 doubleValue];
                [v20 setWifi5GHz80MHzRxDuration:v57];
              }
LABEL_28:

              goto LABEL_29;
            }
            if ([v38 isEqualToString:@"WifiSleepTime"])
            {
              v39 = [v35 objectForKeyedSubscript:@"Value"];
              [v39 doubleValue];
              [v20 setWifiSleepDuration:v50];
              goto LABEL_29;
            }
            if ([v38 isEqualToString:@"WifiFrtsDuration"])
            {
              v39 = [v35 objectForKeyedSubscript:@"Value"];
              [v39 doubleValue];
              [v20 setWifiFRTSDuration:v53];
              goto LABEL_29;
            }
            if ([v38 isEqualToString:@"WifiHsicDuration"])
            {
              v39 = [v35 objectForKeyedSubscript:@"Value"];
              [v39 doubleValue];
              [v20 setWifiHsicActiveDuration:v56];
              goto LABEL_29;
            }
            if ([v38 isEqualToString:@"WifiTotalPower"])
            {
              v39 = [v35 objectForKeyedSubscript:@"Value"];
              [v39 doubleValue];
              [v20 setWifiTotalPowerMicroWatt:v58];
              goto LABEL_29;
            }
            v32 = v34;
            if ([v38 isEqualToString:v34])
            {
              v39 = [v35 objectForKeyedSubscript:v34];
              [v39 doubleValue];
              [v20 setWifiPcieL0Duration:v59];
              goto LABEL_29;
            }
            if ([v38 isEqualToString:@"WifiPcieSuspendDuration"])
            {
              v39 = [v35 objectForKeyedSubscript:@"WifiPcieSuspendDuration"];
              [v39 doubleValue];
              [v20 setWifiPcieL12Duration:v60];
              goto LABEL_29;
            }
LABEL_30:

            ++v33;
          }
          while (v30 != v33);
          uint64_t v61 = [v28 countByEnumeratingWithState:&v85 objects:v90 count:16];
          uint64_t v30 = v61;
        }
        while (v61);
      }

      id v7 = v78;
      [v78 setMetric:v20];
      self = v79;
      [(PLAWDWifiBT *)v79 setWifiSubmitCnt:[(PLAWDWifiBT *)v79 wifiSubmitCnt] + 1];
      v15 = v77;
      v19 = v81;
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v62 = objc_opt_class();
        v84[0] = MEMORY[0x263EF8330];
        v84[1] = 3221225472;
        v84[2] = __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke_278;
        v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v84[4] = v62;
        if (submitWiFiDataToAWDServer_withAwdConn__defaultOnce_276 != -1) {
          dispatch_once(&submitWiFiDataToAWDServer_withAwdConn__defaultOnce_276, v84);
        }
        if (submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled_277)
        {
          uint64_t v63 = objc_msgSend(NSString, "stringWithFormat:", @"Submit WiFi stats: submit cnt = %ld", -[PLAWDWifiBT wifiSubmitCnt](v79, "wifiSubmitCnt"));
          v64 = (void *)MEMORY[0x263F5F638];
          v65 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
          v66 = [v65 lastPathComponent];
          v67 = [NSString stringWithUTF8String:"-[PLAWDWifiBT submitWiFiDataToAWDServer:withAwdConn:]"];
          [v64 logMessage:v63 fromFile:v66 fromFunction:v67 fromLineNumber:444];

          v68 = PLLogCommon();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }

          v19 = v81;
        }
      }
    }

    v69 = v80;
    goto LABEL_63;
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v70 = objc_opt_class();
    v83[0] = MEMORY[0x263EF8330];
    v83[1] = 3221225472;
    v83[2] = __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke_284;
    v83[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v83[4] = v70;
    if (submitWiFiDataToAWDServer_withAwdConn__defaultOnce_282 != -1) {
      dispatch_once(&submitWiFiDataToAWDServer_withAwdConn__defaultOnce_282, v83);
    }
    if (submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled_283)
    {
      v15 = [NSString stringWithFormat:@"%@ : Submit WiFi stats: Empty container!!", @"*******PLAWDMetricsService*******"];
      double v71 = (void *)MEMORY[0x263F5F638];
      double v72 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      v73 = [v72 lastPathComponent];
      double v74 = [NSString stringWithUTF8String:"-[PLAWDWifiBT submitWiFiDataToAWDServer:withAwdConn:]"];
      [v71 logMessage:v15 fromFile:v73 fromFunction:v74 fromLineNumber:448];

      v69 = PLLogCommon();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
LABEL_63:
    }
  }
  [(PLAWDWifiBT *)self resetWifiTable];
  char v75 = [v6 submitMetric:v7];

  return v75;
}

uint64_t __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke_278(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled_277 = result;
  return result;
}

uint64_t __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke_284(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled_283 = result;
  return result;
}

+ (id)entryAggregateDefinitionAwdBT
{
  v24[4] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F878];
  v21[0] = *MEMORY[0x263F5F880];
  v21[1] = v2;
  v22[0] = &unk_26E546650;
  v22[1] = MEMORY[0x263EFFA80];
  v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v3;
  v23[1] = *MEMORY[0x263F5F870];
  v19[0] = @"BTState";
  id v4 = [MEMORY[0x263F5F650] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v19[1] = @"BTValue";
  v20[0] = v5;
  id v6 = [MEMORY[0x263F5F650] sharedInstance];
  id v7 = objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v20[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v24[1] = v8;
  void v23[2] = *MEMORY[0x263F5F828];
  uint64_t v17 = &unk_26E546640;
  uint64_t v15 = *MEMORY[0x263F5F820];
  v16 = &unk_26E546640;
  id v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  uint64_t v18 = v9;
  id v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  void v24[2] = v10;
  v23[3] = *MEMORY[0x263F5F830];
  double v14 = @"BTValue";
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v24[3] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

- (void)startBtMetricCollection
{
  [(PLAWDWifiBT *)self setBtSubmitCnt:0];
  [(PLAWDWifiBT *)self resetBTTable];
  [(PLAWDWifiBT *)self setIsBTStart:1];
  [(PLAWDWifiBT *)self setIsBTRailStart:1];
  v3 = [MEMORY[0x263F5F8D8] entryKeyForType:*MEMORY[0x263F5F8A0] andName:*MEMORY[0x263F5F9A8]];
  id v4 = objc_alloc(MEMORY[0x263F5F658]);
  uint64_t v5 = [(PLAWDAuxMetrics *)self operator];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __38__PLAWDWifiBT_startBtMetricCollection__block_invoke;
  v14[3] = &unk_264B99DD0;
  v14[4] = self;
  id v6 = (void *)[v4 initWithOperator:v5 forEntryKey:v3 withBlock:v14];

  [(PLAWDWifiBT *)self setBtEventCallback:v6];
  id v7 = [(PLAWDWifiBT *)self btEventCallback];
  [v7 requestEntry];

  uint64_t v8 = [MEMORY[0x263F5F8D8] entryKeyForType:*MEMORY[0x263F5F898] andName:*MEMORY[0x263F5F9A0]];
  id v9 = objc_alloc(MEMORY[0x263F5F658]);
  id v10 = [(PLAWDAuxMetrics *)self operator];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__PLAWDWifiBT_startBtMetricCollection__block_invoke_2;
  v13[3] = &unk_264B99DD0;
  v13[4] = self;
  double v11 = (void *)[v9 initWithOperator:v10 forEntryKey:v8 withBlock:v13];

  [(PLAWDWifiBT *)self setBtPowerCallback:v11];
  double v12 = [(PLAWDWifiBT *)self btPowerCallback];
  [v12 requestEntry];
}

uint64_t __38__PLAWDWifiBT_startBtMetricCollection__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleBTCallback:a2];
  }
  return result;
}

uint64_t __38__PLAWDWifiBT_startBtMetricCollection__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleBTPowerCallback:a2];
  }
  return result;
}

- (void)resetBTTable
{
  v3 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AwdBT"];
  v4.receiver = self;
  v4.super_class = (Class)PLAWDWifiBT;
  [(PLAWDAuxMetrics *)&v4 resetTableWithEntryKey:v3];
}

- (void)addEntryToBTTable:(id)a3 withValue:(double)a4
{
  uint64_t v6 = *MEMORY[0x263F5F888];
  id v7 = a3;
  id v11 = +[PLOperator entryKeyForType:v6 andName:@"AwdBT"];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v11];
  [v8 setObject:v7 forKeyedSubscript:@"BTState"];

  id v9 = [NSNumber numberWithDouble:a4];
  [v8 setObject:v9 forKeyedSubscript:@"BTValue"];

  id v10 = [(PLAWDAuxMetrics *)self operator];
  [v10 logEntry:v8];
}

- (void)handleBTCallback:(id)a3
{
  objc_super v4 = [a3 objectForKey:@"entry"];
  sleep(1u);
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__PLAWDWifiBT_handleBTCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (handleBTCallback__defaultOnce != -1) {
      dispatch_once(&handleBTCallback__defaultOnce, block);
    }
    if (handleBTCallback__classDebugEnabled)
    {
      uint64_t v6 = [NSString stringWithFormat:@"%s - %@", "-[PLAWDWifiBT handleBTCallback:]", v4];
      id v7 = (void *)MEMORY[0x263F5F638];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      id v9 = [v8 lastPathComponent];
      id v10 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleBTCallback:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:557];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  if (v4)
  {
    double v12 = [(PLAWDAuxMetrics *)self operator];
    double v13 = [v12 storage];
    double v14 = [v4 entryKey];
    uint64_t v15 = objc_msgSend(v13, "entryForKey:withID:", v14, objc_msgSend(v4, "entryID") - 1);

    if (v15)
    {
      v16 = [v15 objectForKeyedSubscript:@"DeviceConnected"];
      int v17 = [v16 BOOLValue];

      if (v17)
      {
        uint64_t v18 = [v4 entryDate];
        [v18 timeIntervalSince1970];
        double v20 = v19;
        uint64_t v21 = [v15 entryDate];
        double v22 = [v21 laterDate:0];
        [v22 timeIntervalSince1970];
        double v24 = v20 - v23;

        if (v24 > 0.0) {
          [(PLAWDWifiBT *)self addEntryToBTTable:@"Connected" withValue:v24];
        }
      }
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v25 = objc_opt_class();
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __32__PLAWDWifiBT_handleBTCallback___block_invoke_299;
        v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v32[4] = v25;
        if (handleBTCallback__defaultOnce_297 != -1) {
          dispatch_once(&handleBTCallback__defaultOnce_297, v32);
        }
        if (handleBTCallback__classDebugEnabled_298)
        {
          double v26 = [NSString stringWithFormat:@"BT ConnectedStateCallback - %@", v15];
          v27 = (void *)MEMORY[0x263F5F638];
          id v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
          uint64_t v29 = [v28 lastPathComponent];
          uint64_t v30 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleBTCallback:]"];
          [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:567];

          uint64_t v31 = PLLogCommon();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
        }
      }
    }
  }
}

uint64_t __32__PLAWDWifiBT_handleBTCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBTCallback__classDebugEnabled = result;
  return result;
}

uint64_t __32__PLAWDWifiBT_handleBTCallback___block_invoke_299(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBTCallback__classDebugEnabled_298 = result;
  return result;
}

- (void)handleBTPowerCallback:(id)a3
{
  objc_super v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    if (![(PLAWDWifiBT *)self isBTStart]) {
      goto LABEL_17;
    }
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v5;
      if (handleBTPowerCallback__defaultOnce != -1) {
        dispatch_once(&handleBTPowerCallback__defaultOnce, v47);
      }
      if (handleBTPowerCallback__classDebugEnabled)
      {
        uint64_t v6 = [NSString stringWithFormat:@"%@ : BT Properties first entry", @"*******PLAWDMetricsService*******"];
        id v7 = (void *)MEMORY[0x263F5F638];
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        id v9 = [v8 lastPathComponent];
        id v10 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleBTPowerCallback:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:578];

        id v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }
      }
    }
    [(PLAWDWifiBT *)self setIsBTStart:0];
    v46.receiver = self;
    v46.super_class = (Class)PLAWDWifiBT;
    if ([(PLAWDAuxMetrics *)&v46 dropFirstEntryReceived:v4 usingFilter:0 andStartTime:0])
    {
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v12 = objc_opt_class();
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke_308;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = v12;
        if (handleBTPowerCallback__defaultOnce_306 != -1) {
          dispatch_once(&handleBTPowerCallback__defaultOnce_306, v45);
        }
        if (handleBTPowerCallback__classDebugEnabled_307)
        {
          double v13 = [NSString stringWithFormat:@"%@ : BT Properties first entry - dropped", @"*******PLAWDMetricsService*******"];
          double v14 = (void *)MEMORY[0x263F5F638];
          uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
          v16 = [v15 lastPathComponent];
          int v17 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleBTPowerCallback:]"];
          [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:583];

          uint64_t v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
LABEL_31:
        }
      }
    }
    else
    {
LABEL_17:
      sleep(1u);
      double v19 = [v4 objectForKeyedSubscript:@"TXPower"];
      [v19 doubleValue];
      double v21 = v20;

      if (v21 > 0.0)
      {
        double v22 = [v4 objectForKeyedSubscript:@"TXPower"];
        [v22 doubleValue];
        -[PLAWDWifiBT addEntryToBTTable:withValue:](self, "addEntryToBTTable:withValue:", @"PowerTx");
      }
      double v23 = [v4 objectForKeyedSubscript:@"RXPower"];
      [v23 doubleValue];
      double v25 = v24;

      if (v25 > 0.0)
      {
        double v26 = [v4 objectForKeyedSubscript:@"RXPower"];
        [v26 doubleValue];
        -[PLAWDWifiBT addEntryToBTTable:withValue:](self, "addEntryToBTTable:withValue:", @"PowerRx");
      }
      v27 = [v4 objectForKeyedSubscript:@"SleepPower"];
      [v27 doubleValue];
      double v29 = v28;

      if (v29 > 0.0)
      {
        uint64_t v30 = [v4 objectForKeyedSubscript:@"SleepPower"];
        [v30 doubleValue];
        -[PLAWDWifiBT addEntryToBTTable:withValue:](self, "addEntryToBTTable:withValue:", @"PowerSleep");
      }
      uint64_t v31 = [v4 objectForKeyedSubscript:@"OtherPower"];
      [v31 doubleValue];
      double v33 = v32;

      if (v33 > 0.0)
      {
        v34 = [v4 objectForKeyedSubscript:@"OtherPower"];
        [v34 doubleValue];
        -[PLAWDWifiBT addEntryToBTTable:withValue:](self, "addEntryToBTTable:withValue:", @"PowerOther");
      }
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v35 = objc_opt_class();
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v41 = 3221225472;
        id v42 = __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke_326;
        v43 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v44 = v35;
        if (handleBTPowerCallback__defaultOnce_324 != -1) {
          dispatch_once(&handleBTPowerCallback__defaultOnce_324, &block);
        }
        if (handleBTPowerCallback__classDebugEnabled_325)
        {
          double v13 = [NSString stringWithFormat:@"BT Properties Callback - %@", v4, block, v41, v42, v43, v44];
          id v36 = (void *)MEMORY[0x263F5F638];
          v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
          v38 = [v37 lastPathComponent];
          v39 = [NSString stringWithUTF8String:"-[PLAWDWifiBT handleBTPowerCallback:]"];
          [v36 logMessage:v13 fromFile:v38 fromFunction:v39 fromLineNumber:606];

          uint64_t v18 = PLLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }
          goto LABEL_31;
        }
      }
    }
  }
}

uint64_t __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBTPowerCallback__classDebugEnabled = result;
  return result;
}

uint64_t __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke_308(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBTPowerCallback__classDebugEnabled_307 = result;
  return result;
}

uint64_t __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke_326(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBTPowerCallback__classDebugEnabled_325 = result;
  return result;
}

- (BOOL)submitBtDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  if (v7)
  {
    uint64_t v8 = [(PLAWDWifiBT *)self btEventCallback];
    [v8 requestEntry];

    sleep(5u);
    id v9 = [MEMORY[0x263EFF910] monotonicDateWithTimeIntervalSinceNow:-86400.0];
    id v10 = [MEMORY[0x263EFF910] monotonicDate];
    [v9 timeIntervalSince1970];
    double v12 = v11;
    [v10 timeIntervalSince1970];
    double v14 = v13 - v12;

    uint64_t v15 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F888] andName:@"AwdBT"];
    v16 = [(PLAWDAuxMetrics *)self operator];
    int v17 = [v16 storage];
    uint64_t v18 = objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14);

    double v19 = [MEMORY[0x263F5F648] summarizeAggregateEntries:v18];
    double v20 = objc_opt_new();
    v65 = v19;
    if ([MEMORY[0x263F5F640] debugEnabled])
    {
      uint64_t v21 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v21;
      if (submitBtDataToAWDServer_withAwdConn__defaultOnce != -1) {
        dispatch_once(&submitBtDataToAWDServer_withAwdConn__defaultOnce, block);
      }
      if (submitBtDataToAWDServer_withAwdConn__classDebugEnabled)
      {
        v64 = v20;
        double v22 = [NSString stringWithFormat:@"%@ : %@", @"*******PLAWDMetricsService*******", v19];
        double v23 = (void *)MEMORY[0x263F5F638];
        double v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
        double v25 = [v24 lastPathComponent];
        double v26 = [NSString stringWithUTF8String:"-[PLAWDWifiBT submitBtDataToAWDServer:withAwdConn:]"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:628];

        v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[PLAWDDisplay startMetricCollection:]();
        }

        double v20 = v64;
        double v19 = v65;
      }
    }
    if (v20)
    {
      double v60 = v18;
      uint64_t v61 = v15;
      uint64_t v62 = v7;
      uint64_t v63 = self;
      [v20 setBtConnectedDuration:0];
      [v20 setBtOthersDuration:0];
      [v20 setBtRxDuration:0];
      [v20 setBtTxDuration:0];
      [v20 setBtSleepDuration:0];
      [v20 setBtTotalPowerMicroWatt:0];
      double v28 = v20;
      objc_msgSend(v20, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v29 = v19;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v69 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            id v35 = [NSString alloc];
            id v36 = [v34 objectForKeyedSubscript:@"BTState"];
            v37 = (void *)[v35 initWithFormat:@"%@", v36];

            if ([v37 isEqualToString:@"PowerOther"])
            {
              v38 = [v34 objectForKeyedSubscript:@"BTValue"];
              [v38 doubleValue];
              [v28 setBtOthersDuration:v39];
            }
            else if ([v37 isEqualToString:@"PowerRx"])
            {
              v38 = [v34 objectForKeyedSubscript:@"BTValue"];
              [v38 doubleValue];
              [v28 setBtRxDuration:v40];
            }
            else if ([v37 isEqualToString:@"PowerTx"])
            {
              v38 = [v34 objectForKeyedSubscript:@"BTValue"];
              [v38 doubleValue];
              [v28 setBtTxDuration:v41];
            }
            else if ([v37 isEqualToString:@"PowerSleep"])
            {
              v38 = [v34 objectForKeyedSubscript:@"BTValue"];
              [v38 doubleValue];
              [v28 setBtSleepDuration:v42];
            }
            else if ([v37 isEqualToString:@"Connected"])
            {
              v38 = [v34 objectForKeyedSubscript:@"BTValue"];
              [v38 doubleValue];
              [v28 setBtConnectedDuration:v43];
            }
            else
            {
              if (![v37 isEqualToString:@"BTTotalPower"]) {
                goto LABEL_28;
              }
              v38 = [v34 objectForKeyedSubscript:@"BTValue"];
              [v38 doubleValue];
              [v28 setBtTotalPowerMicroWatt:v44];
            }

LABEL_28:
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v68 objects:v73 count:16];
        }
        while (v31);
      }

      id v7 = v62;
      double v20 = v28;
      [v62 setMetric:v28];
      self = v63;
      [(PLAWDWifiBT *)v63 setBtSubmitCnt:[(PLAWDWifiBT *)v63 btSubmitCnt] + 1];
      double v19 = v65;
      uint64_t v18 = v60;
      uint64_t v15 = v61;
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v45 = objc_opt_class();
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        v67[2] = __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke_333;
        v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v67[4] = v45;
        if (submitBtDataToAWDServer_withAwdConn__defaultOnce_331 != -1) {
          dispatch_once(&submitBtDataToAWDServer_withAwdConn__defaultOnce_331, v67);
        }
        if (submitBtDataToAWDServer_withAwdConn__classDebugEnabled_332)
        {
          uint64_t v46 = objc_msgSend(NSString, "stringWithFormat:", @"Submit BT stats: submit cnt = %ld", -[PLAWDWifiBT btSubmitCnt](v63, "btSubmitCnt"));
          double v59 = (void *)MEMORY[0x263F5F638];
          double v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
          double v48 = [v47 lastPathComponent];
          double v49 = [NSString stringWithUTF8String:"-[PLAWDWifiBT submitBtDataToAWDServer:withAwdConn:]"];
          [v59 logMessage:v46 fromFile:v48 fromFunction:v49 fromLineNumber:665];

          double v50 = (void *)v46;
          double v51 = PLLogCommon();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
            -[PLAWDDisplay startMetricCollection:]();
          }

          double v19 = v65;
          double v20 = v28;
        }
      }
    }

    goto LABEL_38;
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v52 = objc_opt_class();
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke_339;
    v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v66[4] = v52;
    if (submitBtDataToAWDServer_withAwdConn__defaultOnce_337 != -1) {
      dispatch_once(&submitBtDataToAWDServer_withAwdConn__defaultOnce_337, v66);
    }
    if (submitBtDataToAWDServer_withAwdConn__classDebugEnabled_338)
    {
      uint64_t v15 = [NSString stringWithFormat:@"%@ : Submit BT stats: Empty container!!", @"*******PLAWDMetricsService*******"];
      double v53 = (void *)MEMORY[0x263F5F638];
      double v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m"];
      double v55 = [v54 lastPathComponent];
      double v56 = [NSString stringWithUTF8String:"-[PLAWDWifiBT submitBtDataToAWDServer:withAwdConn:]"];
      [v53 logMessage:v15 fromFile:v55 fromFunction:v56 fromLineNumber:669];

      uint64_t v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
LABEL_38:
    }
  }
  [(PLAWDWifiBT *)self resetBTTable];
  char v57 = [v6 submitMetric:v7];

  return v57;
}

uint64_t __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitBtDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke_333(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitBtDataToAWDServer_withAwdConn__classDebugEnabled_332 = result;
  return result;
}

uint64_t __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke_339(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitBtDataToAWDServer_withAwdConn__classDebugEnabled_338 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)wifiEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWifiEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)btEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBtEventCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)btPowerCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBtPowerCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wifiRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWifiRailCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)btRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBtRailCallback:(id)a3
{
}

- (BOOL)isWiFiStart
{
  return self->_isWiFiStart;
}

- (void)setIsWiFiStart:(BOOL)a3
{
  self->_isWiFiStart = a3;
}

- (BOOL)isWiFiRailStart
{
  return self->_isWiFiRailStart;
}

- (void)setIsWiFiRailStart:(BOOL)a3
{
  self->_isWiFiRailStart = a3;
}

- (BOOL)isBTStart
{
  return self->_isBTStart;
}

- (void)setIsBTStart:(BOOL)a3
{
  self->_isBTStart = a3;
}

- (BOOL)isBTRailStart
{
  return self->_isBTRailStart;
}

- (void)setIsBTRailStart:(BOOL)a3
{
  self->_isBTRailStart = a3;
}

- (int64_t)wifiSubmitCnt
{
  return self->_wifiSubmitCnt;
}

- (void)setWifiSubmitCnt:(int64_t)a3
{
  self->_wifiSubmitCnt = a3;
}

- (int64_t)btSubmitCnt
{
  return self->_btSubmitCnt;
}

- (void)setBtSubmitCnt:(int64_t)a3
{
  self->_btSubmitCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btRailCallback, 0);
  objc_storeStrong((id *)&self->_wifiRailCallback, 0);
  objc_storeStrong((id *)&self->_btPowerCallback, 0);
  objc_storeStrong((id *)&self->_btEventCallback, 0);

  objc_storeStrong((id *)&self->_wifiEventCallback, 0);
}

@end