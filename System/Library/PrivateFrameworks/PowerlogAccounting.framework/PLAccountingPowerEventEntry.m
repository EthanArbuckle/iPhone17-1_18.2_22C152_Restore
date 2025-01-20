@interface PLAccountingPowerEventEntry
+ (BOOL)isValidPower:(double)a3 forRootNodeID:(id)a4;
+ (double)minPowerDifference;
+ (double)minPowerPercentageDifference;
+ (void)load;
- (BOOL)isEmptyEvent;
- (BOOL)isEqualContentsWithEvent:(id)a3;
- (NSNumber)rootNodeID;
- (PLAccountingPowerEventEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withRange:(id)a5;
- (double)power;
- (id)subEntryKey;
- (int)instanceDirectionality;
@end

@implementation PLAccountingPowerEventEntry

- (PLAccountingPowerEventEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withRange:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((int)[v8 intValue] < 1
    || (+[PLAccountingEngine deviceRootNodeIDs],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 containsObject:v8],
        v10,
        !v11)
    || ![(id)objc_opt_class() isValidPower:v8 forRootNodeID:a4])
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)PLAccountingPowerEventEntry;
  v12 = [(PLAccountingEventEntry *)&v22 initWithRange:v9];
  self = v12;
  if (v12)
  {
    [(PLEntry *)v12 setObject:v8 forKeyedSubscript:*MEMORY[0x263F5F7E8]];
    v13 = [NSNumber numberWithLong:llround(a4 * 1000.0)];
    [(PLEntry *)self setObject:v13 forKeyedSubscript:*MEMORY[0x263F5F7E0]];

    LODWORD(v13) = [(PLAccountingPowerEventEntry *)self instanceDirectionality];
    if (v13 != [(id)objc_opt_class() classDirectionality])
    {
      v15 = [NSString stringWithFormat:@"ERROR: Directionality mismatch for rootNodeID=%@", v8];
      v16 = (void *)MEMORY[0x263F5F638];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Power/PLAccountingPowerEventEntry.m"];
      v18 = [v17 lastPathComponent];
      v19 = [NSString stringWithUTF8String:"-[PLAccountingPowerEventEntry initWithRootNodeID:withPower:withRange:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:69];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }

      goto LABEL_10;
    }
  }
  self = self;
  v14 = self;
LABEL_11:

  return v14;
}

- (int)instanceDirectionality
{
  v2 = [(PLAccountingPowerEventEntry *)self rootNodeID];
  v3 = objc_msgSend(&unk_26DA69FA0, "objectAtIndexedSubscript:", (int)objc_msgSend(v2, "intValue"));
  int v4 = [v3 intValue];

  return v4;
}

+ (BOOL)isValidPower:(double)a3 forRootNodeID:(id)a4
{
  id v5 = a4;
  if (a3 < 0.0)
  {
    if (![MEMORY[0x263F5F640] debugEnabled]) {
      goto LABEL_16;
    }
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke_19;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (isValidPower_forRootNodeID__defaultOnce_17 != -1) {
      dispatch_once(&isValidPower_forRootNodeID__defaultOnce_17, block);
    }
    if (!isValidPower_forRootNodeID__classDebugEnabled_18) {
      goto LABEL_16;
    }
    v7 = [NSString stringWithFormat:@"ERROR: Negative power of %.2f mWh received for rootNodeID:%@", *(void *)&a3, v5];
    id v8 = (void *)MEMORY[0x263F5F638];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Power/PLAccountingPowerEventEntry.m"];
    v10 = [v9 lastPathComponent];
    int v11 = [NSString stringWithUTF8String:"+[PLAccountingPowerEventEntry isValidPower:forRootNodeID:]"];
    [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:37];

    v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLAccountingDependency activate]();
    }
    goto LABEL_15;
  }
  if (a3 <= 10000.0)
  {
    BOOL v18 = 1;
    goto LABEL_18;
  }
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    objc_super v22 = __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke_25;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v24 = v13;
    if (isValidPower_forRootNodeID__defaultOnce_23 != -1) {
      dispatch_once(&isValidPower_forRootNodeID__defaultOnce_23, &v20);
    }
    if (isValidPower_forRootNodeID__classDebugEnabled_24)
    {
      v7 = [NSString stringWithFormat:@"ERROR:  %.2f mWh received for rootNodeID:%@ exceeds max threshold of %d", *(void *)&a3, v5, 10000, v20, v21, v22, v23, v24];
      v14 = (void *)MEMORY[0x263F5F638];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Power/PLAccountingPowerEventEntry.m"];
      v16 = [v15 lastPathComponent];
      v17 = [NSString stringWithUTF8String:"+[PLAccountingPowerEventEntry isValidPower:forRootNodeID:]"];
      [v14 logMessage:v7 fromFile:v16 fromFunction:v17 fromLineNumber:40];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
LABEL_15:
    }
  }
LABEL_16:
  BOOL v18 = 0;
LABEL_18:

  return v18;
}

- (id)subEntryKey
{
  return [(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F7E8]];
}

- (BOOL)isEqualContentsWithEvent:(id)a3
{
  id v4 = a3;
  [(PLAccountingPowerEventEntry *)self power];
  if (v5 == 0.0)
  {
    [v4 power];
    BOOL v7 = v6 == 0.0;
  }
  else
  {
    [(PLAccountingPowerEventEntry *)self power];
    double v9 = v8;
    [v4 power];
    double v11 = vabdd_f64(v9, v10);
    [(id)objc_opt_class() minPowerDifference];
    if (v11 <= v12)
    {
      BOOL v7 = 1;
    }
    else
    {
      [(PLAccountingPowerEventEntry *)self power];
      double v14 = v13;
      [v4 power];
      double v16 = vabdd_f64(v14, v15);
      [(PLAccountingPowerEventEntry *)self power];
      double v18 = v16 / v17 * 100.0;
      [(id)objc_opt_class() minPowerPercentageDifference];
      BOOL v7 = v18 <= v19;
    }
  }

  return v7;
}

- (double)power
{
  v2 = [(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F7E0]];
  [v2 doubleValue];
  double v4 = v3 / 1000.0;

  return v4;
}

+ (double)minPowerDifference
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__PLAccountingPowerEventEntry_minPowerDifference__block_invoke;
  v4[3] = &unk_2647B5078;
  double v5 = @"PLAccountingDebugService_Debug";
  char v6 = 0;
  if (minPowerDifference_defaultOnce != -1) {
    dispatch_once(&minPowerDifference_defaultOnce, v4);
  }
  int v2 = minPowerDifference_objectForKey;

  double result = 0.0;
  if (!v2) {
    return 3.0;
  }
  return result;
}

+ (double)minPowerPercentageDifference
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__PLAccountingPowerEventEntry_minPowerPercentageDifference__block_invoke;
  v4[3] = &unk_2647B5078;
  double v5 = @"PLAccountingDebugService_Debug";
  char v6 = 0;
  if (minPowerPercentageDifference_defaultOnce != -1) {
    dispatch_once(&minPowerPercentageDifference_defaultOnce, v4);
  }
  int v2 = minPowerPercentageDifference_objectForKey;

  double result = 0.0;
  if (!v2) {
    return 3.0;
  }
  return result;
}

- (NSNumber)rootNodeID
{
  return (NSNumber *)[(PLEntry *)self objectForKeyedSubscript:*MEMORY[0x263F5F7E8]];
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingPowerEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __49__PLAccountingPowerEventEntry_minPowerDifference__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  minPowerDifference_objectForKey = result;
  return result;
}

uint64_t __59__PLAccountingPowerEventEntry_minPowerPercentageDifference__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  minPowerPercentageDifference_objectForKey = result;
  return result;
}

uint64_t __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  isValidPower_forRootNodeID__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke_19(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  isValidPower_forRootNodeID__classDebugEnabled_18 = result;
  return result;
}

uint64_t __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke_25(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  isValidPower_forRootNodeID__classDebugEnabled_24 = result;
  return result;
}

- (BOOL)isEmptyEvent
{
  [(PLAccountingPowerEventEntry *)self power];
  return v2 == 0.0;
}

@end