@interface PLAWDAuxMetrics
+ (id)entryAggregateDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)getSharedObjWithOperator:(id)a3;
- (BOOL)doesInterfereWithChargerWithStartDate:(id)a3 withEndDate:(id)a4;
- (BOOL)dropFirstEntryReceived:(id)a3 usingFilter:(id)a4 andStartTime:(id)a5;
- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4;
- (NSMutableSet)runningMetrics;
- (PLAWDAuxMetrics)initWithOperator:(id)a3;
- (PLOperator)operator;
- (double)getRailEnergyWithEntry:(id)a3 withFilter:(id)a4 isRailForward:(BOOL)a5;
- (void)handleChargerChangeWithState:(BOOL)a3 withDate:(id)a4;
- (void)resetTableWithEntryKey:(id)a3;
- (void)setOperator:(id)a3;
- (void)setRunningMetrics:(id)a3;
- (void)startMetricCollection:(id)a3;
- (void)stopMetricCollection:(id)a3;
@end

@implementation PLAWDAuxMetrics

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

- (PLAWDAuxMetrics)initWithOperator:(id)a3
{
  id v4 = a3;
  if (self) {
    [(PLAWDAuxMetrics *)self setOperator:v4];
  }
  v5 = objc_opt_new();
  [(PLAWDAuxMetrics *)self setRunningMetrics:v5];

  if (initWithOperator__onceToken != -1) {
    dispatch_once(&initWithOperator__onceToken, &__block_literal_global);
  }

  return self;
}

uint64_t __36__PLAWDAuxMetrics_initWithOperator___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)startChargerPeriods;
  startChargerPeriods = v0;

  uint64_t v2 = objc_opt_new();
  v3 = (void *)endChargerPeriods;
  endChargerPeriods = v2;

  awdStartTime = [MEMORY[0x263EFF910] monotonicDate];

  return MEMORY[0x270F9A758]();
}

+ (id)getSharedObjWithOperator:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F5F640], "debugEnabled", a3))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __44__PLAWDAuxMetrics_getSharedObjWithOperator___block_invoke;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v15 = v3;
    if (getSharedObjWithOperator__defaultOnce != -1) {
      dispatch_once(&getSharedObjWithOperator__defaultOnce, &block);
    }
    if (getSharedObjWithOperator__classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"PLAWD AUX class %@ not implementing getSharedObj", objc_opt_class(), block, v12, v13, v14, v15];
      v5 = (void *)MEMORY[0x263F5F638];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAuxMetrics.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"+[PLAWDAuxMetrics getSharedObjWithOperator:]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:49];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  return 0;
}

uint64_t __44__PLAWDAuxMetrics_getSharedObjWithOperator___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  getSharedObjWithOperator__classDebugEnabled = result;
  return result;
}

- (void)startMetricCollection:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F5F640], "debugEnabled", a3))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __41__PLAWDAuxMetrics_startMetricCollection___block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (startMetricCollection__defaultOnce_4 != -1) {
      dispatch_once(&startMetricCollection__defaultOnce_4, &block);
    }
    if (startMetricCollection__classDebugEnabled_4)
    {
      id v4 = [NSString stringWithFormat:@"PLAWD AUX class %@ not implementing startMetricCollection", objc_opt_class(), block, v11, v12, v13, v14];
      v5 = (void *)MEMORY[0x263F5F638];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAuxMetrics.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLAWDAuxMetrics startMetricCollection:]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:55];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __41__PLAWDAuxMetrics_startMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  startMetricCollection__classDebugEnabled_4 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F5F640], "debugEnabled", a3))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __40__PLAWDAuxMetrics_stopMetricCollection___block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v3;
    if (stopMetricCollection__defaultOnce_4 != -1) {
      dispatch_once(&stopMetricCollection__defaultOnce_4, &block);
    }
    if (stopMetricCollection__classDebugEnabled_4)
    {
      id v4 = [NSString stringWithFormat:@"PLAWD AUX class %@ not implementing stopMetricCollection", objc_opt_class(), block, v11, v12, v13, v14];
      v5 = (void *)MEMORY[0x263F5F638];
      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAuxMetrics.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLAWDAuxMetrics stopMetricCollection:]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:60];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
}

uint64_t __40__PLAWDAuxMetrics_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopMetricCollection__classDebugEnabled_4 = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  if (objc_msgSend(MEMORY[0x263F5F640], "debugEnabled", a3, a4))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __53__PLAWDAuxMetrics_submitDataToAWDServer_withAwdConn___block_invoke;
    uint64_t v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v4;
    if (submitDataToAWDServer_withAwdConn__defaultOnce_2 != -1) {
      dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_2, &block);
    }
    if (submitDataToAWDServer_withAwdConn__classDebugEnabled_2)
    {
      v5 = [NSString stringWithFormat:@"PLAWD AUX class %@ not implementing submitDataToAWDServer", objc_opt_class(), block, v13, v14, v15, v16];
      v6 = (void *)MEMORY[0x263F5F638];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAuxMetrics.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLAWDAuxMetrics submitDataToAWDServer:withAwdConn:]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:65];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDDisplay startMetricCollection:]();
      }
    }
  }
  return 0;
}

uint64_t __53__PLAWDAuxMetrics_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  submitDataToAWDServer_withAwdConn__classDebugEnabled_2 = result;
  return result;
}

- (void)resetTableWithEntryKey:(id)a3
{
  id v4 = a3;
  id v6 = [(PLAWDAuxMetrics *)self operator];
  v5 = [v6 storage];
  [v5 deleteAllEntriesForKey:v4];
}

- (void)handleChargerChangeWithState:(BOOL)a3 withDate:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  uint64_t v5 = [(id)startChargerPeriods count];
  if (v4)
  {
    if (v5 != [(id)endChargerPeriods count]) {
      goto LABEL_7;
    }
    id v6 = &startChargerPeriods;
LABEL_6:
    [(id)*v6 addObject:v11];
LABEL_7:
    v8 = [MEMORY[0x263EFF910] dateWithTimeInterval:v11 sinceDate:-7200.0];
    while ([(id)endChargerPeriods count])
    {
      v9 = [(id)endChargerPeriods objectAtIndexedSubscript:0];
      uint64_t v10 = [v8 compare:v9];

      if (v10 != 1) {
        break;
      }
      [(id)startChargerPeriods removeObjectAtIndex:0];
      [(id)endChargerPeriods removeObjectAtIndex:0];
    }

    goto LABEL_12;
  }
  if (v5)
  {
    uint64_t v7 = [(id)startChargerPeriods count];
    id v6 = &endChargerPeriods;
    if (v7 == [(id)endChargerPeriods count]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_12:
}

- (BOOL)doesInterfereWithChargerWithStartDate:(id)a3 withEndDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([(id)startChargerPeriods count])
  {
    uint64_t v7 = [(id)startChargerPeriods count];
    uint64_t v8 = [(id)endChargerPeriods count];
    if ([(id)startChargerPeriods count])
    {
      for (unint64_t i = 0; [(id)startChargerPeriods count] > i; ++i)
      {
        if (v7 == v8 || i != [(id)startChargerPeriods count] - 1)
        {
          uint64_t v12 = [(id)startChargerPeriods objectAtIndexedSubscript:i];
          if ([v5 compare:v12] == -1)
          {
            uint64_t v13 = [(id)startChargerPeriods objectAtIndexedSubscript:i];
            uint64_t v14 = [v6 compare:v13];

            if (v14 == 1) {
              goto LABEL_20;
            }
          }
          else
          {
          }
          uint64_t v15 = [(id)endChargerPeriods objectAtIndexedSubscript:i];
          if ([v5 compare:v15] == -1)
          {
            uint64_t v16 = [(id)endChargerPeriods objectAtIndexedSubscript:i];
            uint64_t v17 = [v6 compare:v16];

            if (v17 == 1) {
              goto LABEL_20;
            }
          }
          else
          {
          }
          v18 = [(id)startChargerPeriods objectAtIndexedSubscript:i];
          if ([v5 compare:v18] == 1)
          {
            v19 = [(id)endChargerPeriods objectAtIndexedSubscript:i];
            uint64_t v20 = [v6 compare:v19];

            if (v20 == -1)
            {
LABEL_20:
              BOOL v21 = 1;
              goto LABEL_21;
            }
          }
          else
          {
          }
        }
        else
        {
          uint64_t v10 = [(id)startChargerPeriods objectAtIndexedSubscript:i];
          uint64_t v11 = [v5 compare:v10];

          if (v11 == 1) {
            goto LABEL_20;
          }
        }
      }
    }
  }
  BOOL v21 = 0;
LABEL_21:

  return v21;
}

- (double)getRailEnergyWithEntry:(id)a3 withFilter:(id)a4 isRailForward:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [(PLAWDAuxMetrics *)self operator];
    uint64_t v11 = [v10 storage];
    uint64_t v12 = [v8 entryKey];
    uint64_t v13 = objc_msgSend(v11, "entriesForKey:startingFromRowID:count:withFilters:", v12, objc_msgSend(v8, "entryID") - 1, -1, v9);

    if ([v13 count] == 1)
    {
      uint64_t v14 = [v13 objectAtIndexedSubscript:0];
      if (v14)
      {
        if (a5) {
          goto LABEL_7;
        }
        if (!awdStartTime) {
          goto LABEL_7;
        }
        [(id)awdStartTime timeIntervalSince1970];
        double v16 = v15;
        uint64_t v17 = [v14 entryDate];
        [v17 timeIntervalSince1970];
        double v19 = v16 - v18;

        uint64_t v20 = [v8 entryDate];
        [v20 timeIntervalSince1970];
        double v22 = v21;
        [(id)awdStartTime timeIntervalSince1970];
        double v24 = v22 - v23;

        if (v24 >= v19)
        {
LABEL_7:
          v25 = [v14 entryDate];
          v26 = [v8 entryDate];
          [(PLAWDAuxMetrics *)self doesInterfereWithChargerWithStartDate:v25 withEndDate:v26];
        }
      }
    }
  }

  return 0.0;
}

- (BOOL)dropFirstEntryReceived:(id)a3 usingFilter:(id)a4 andStartTime:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  BOOL v11 = 1;
  if (v8 && v9)
  {
    id v12 = a4;
    uint64_t v13 = [(PLAWDAuxMetrics *)self operator];
    uint64_t v14 = [v13 storage];
    double v15 = [v8 entryKey];
    double v16 = objc_msgSend(v14, "entriesForKey:startingFromRowID:count:withFilters:", v15, objc_msgSend(v8, "entryID") - 1, -1, v12);

    if ([v16 count] == 1)
    {
      uint64_t v17 = [v16 objectAtIndexedSubscript:0];
      if (v17)
      {
        [v10 timeIntervalSince1970];
        double v19 = v18;
        uint64_t v20 = [v17 entryDate];
        [v20 timeIntervalSince1970];
        double v22 = v19 - v21;

        double v23 = [v8 entryDate];
        [v23 timeIntervalSince1970];
        double v25 = v24;
        [v10 timeIntervalSince1970];
        double v27 = v25 - v26;

        BOOL v11 = v27 <= v22;
      }
      else
      {
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  return v11;
}

- (PLOperator)operator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operator);

  return (PLOperator *)WeakRetained;
}

- (void)setOperator:(id)a3
{
}

- (NSMutableSet)runningMetrics
{
  return self->_runningMetrics;
}

- (void)setRunningMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningMetrics, 0);

  objc_destroyWeak((id *)&self->_operator);
}

@end