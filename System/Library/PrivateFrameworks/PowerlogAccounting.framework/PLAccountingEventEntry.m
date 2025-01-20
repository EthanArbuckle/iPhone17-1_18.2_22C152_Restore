@interface PLAccountingEventEntry
+ (int)classDirectionality;
- (BOOL)canMergeWithEvent:(id)a3;
- (BOOL)isEmptyEvent;
- (BOOL)isEqualContentsWithEvent:(id)a3;
- (BOOL)used;
- (PLAccountingEventEntry)initWithRange:(id)a3;
- (PLAccountingRange)range;
- (id)rangeSinceEvent:(id)a3;
- (int)instanceDirectionality;
- (void)mergeWithEvent:(id)a3;
- (void)setRange:(id)a3;
- (void)setUsed:(BOOL)a3;
@end

@implementation PLAccountingEventEntry

- (PLAccountingRange)range
{
  v2 = self;
  objc_sync_enter(v2);
  range = v2->_range;
  if (!range)
  {
    v4 = [(PLEntry *)v2 entryDate];
    v5 = [(PLEntry *)v2 objectForKeyedSubscript:@"StartOffset"];
    [v5 doubleValue];
    v7 = [v4 dateByAddingTimeInterval:v6 / 1000.0];

    v8 = [(PLEntry *)v2 entryDate];
    v9 = [(PLEntry *)v2 objectForKeyedSubscript:@"EndOffset"];
    [v9 doubleValue];
    v11 = [v8 dateByAddingTimeInterval:v10 / 1000.0];

    if ([(id)objc_opt_class() classDirectionality] == 4) {
      v12 = v7;
    }
    else {
      v12 = v11;
    }
    uint64_t v13 = +[PLAccountingRange rangeWithStartDate:v7 withEndDate:v12];
    v14 = v2->_range;
    v2->_range = (PLAccountingRange *)v13;

    range = v2->_range;
  }
  v15 = range;
  objc_sync_exit(v2);

  return v15;
}

- (void).cxx_destruct
{
}

- (void)setRange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  objc_sync_enter(v6);
  if (![(PLAccountingRange *)v6->_range isEqual:v5])
  {
    objc_storeStrong((id *)&v6->_range, a3);
    v7 = [v5 startDate];
    v8 = [v5 endDate];
    v9 = [MEMORY[0x263F5F698] sharedCore];
    double v10 = [v9 storage];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __35__PLAccountingEventEntry_setRange___block_invoke;
    v13[3] = &unk_2647B4FB8;
    id v11 = v7;
    id v14 = v11;
    v15 = v6;
    id v12 = v8;
    id v16 = v12;
    [v10 blockingUpdateEntry:v6 withBlock:v13];
  }
  objc_sync_exit(v6);
}

- (BOOL)used
{
  return self->_used;
}

- (id)rangeSinceEvent:(id)a3
{
  id v4 = a3;
  switch([(id)objc_opt_class() classDirectionality])
  {
    case 1u:
      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_30;
      }
      uint64_t v5 = objc_opt_class();
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke;
      v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v48[4] = v5;
      if (rangeSinceEvent__defaultOnce != -1) {
        dispatch_once(&rangeSinceEvent__defaultOnce, v48);
      }
      if (!rangeSinceEvent__classDebugEnabled) {
        goto LABEL_30;
      }
      double v6 = [NSString stringWithFormat:@"forward"];
      v7 = (void *)MEMORY[0x263F5F638];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m"];
      v9 = [v8 lastPathComponent];
      double v10 = [NSString stringWithUTF8String:"-[PLAccountingEventEntry rangeSinceEvent:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:81];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
      break;
    case 2u:
      if ([MEMORY[0x263F5F640] debugEnabled])
      {
        uint64_t v14 = objc_opt_class();
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_25;
        v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v47[4] = v14;
        if (rangeSinceEvent__defaultOnce_23 != -1) {
          dispatch_once(&rangeSinceEvent__defaultOnce_23, v47);
        }
        if (rangeSinceEvent__classDebugEnabled_24)
        {
          v15 = [NSString stringWithFormat:@"backward"];
          id v16 = (void *)MEMORY[0x263F5F638];
          v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m"];
          v18 = [v17 lastPathComponent];
          v19 = [NSString stringWithUTF8String:"-[PLAccountingEventEntry rangeSinceEvent:]"];
          [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:86];

          v20 = PLLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[PLAccountingDependency activate]();
          }
        }
      }
      v21 = [v4 range];
      uint64_t v13 = [v21 endDate];

      v22 = [(PLAccountingEventEntry *)self range];
      uint64_t v23 = [v22 endDate];
      goto LABEL_31;
    case 3u:
      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_30;
      }
      uint64_t v24 = objc_opt_class();
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_31;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v24;
      if (rangeSinceEvent__defaultOnce_29 != -1) {
        dispatch_once(&rangeSinceEvent__defaultOnce_29, v46);
      }
      if (!rangeSinceEvent__classDebugEnabled_30) {
        goto LABEL_30;
      }
      double v6 = [NSString stringWithFormat:@"interval"];
      v25 = (void *)MEMORY[0x263F5F638];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLAccountingEventEntry rangeSinceEvent:]"];
      [v25 logMessage:v6 fromFile:v27 fromFunction:v28 fromLineNumber:91];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
      break;
    case 4u:
      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_30;
      }
      uint64_t v29 = objc_opt_class();
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_37;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v29;
      if (rangeSinceEvent__defaultOnce_35 != -1) {
        dispatch_once(&rangeSinceEvent__defaultOnce_35, v45);
      }
      if (!rangeSinceEvent__classDebugEnabled_36) {
        goto LABEL_30;
      }
      double v6 = [NSString stringWithFormat:@"point"];
      v30 = (void *)MEMORY[0x263F5F638];
      v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m"];
      v32 = [v31 lastPathComponent];
      v33 = [NSString stringWithUTF8String:"-[PLAccountingEventEntry rangeSinceEvent:]"];
      [v30 logMessage:v6 fromFile:v32 fromFunction:v33 fromLineNumber:96];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
      break;
    default:
      id v12 = 0;
      uint64_t v13 = 0;
      goto LABEL_32;
  }

LABEL_30:
  v34 = [v4 range];
  uint64_t v13 = [v34 startDate];

  v22 = [(PLAccountingEventEntry *)self range];
  uint64_t v23 = [v22 startDate];
LABEL_31:
  id v12 = (void *)v23;

LABEL_32:
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v35 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_43;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v35;
    if (rangeSinceEvent__defaultOnce_41 != -1) {
      dispatch_once(&rangeSinceEvent__defaultOnce_41, block);
    }
    if (rangeSinceEvent__classDebugEnabled_42)
    {
      v36 = [NSString stringWithFormat:@"startDate=%@, endDate=%@", v13, v12];
      v37 = (void *)MEMORY[0x263F5F638];
      v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m"];
      v39 = [v38 lastPathComponent];
      v40 = [NSString stringWithUTF8String:"-[PLAccountingEventEntry rangeSinceEvent:]"];
      [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:100];

      v41 = PLLogCommon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[PLAccountingDependency activate]();
      }
    }
  }
  v42 = +[PLAccountingRange rangeWithStartDate:v13 withEndDate:v12];

  return v42;
}

- (PLAccountingEventEntry)initWithRange:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    double v6 = [(id)objc_opt_class() entryKey];
    v20.receiver = self;
    v20.super_class = (Class)PLAccountingEventEntry;
    v7 = [(PLEntry *)&v20 initWithEntryKey:v6];

    if (v7)
    {
      v7->_used = 0;
      objc_storeStrong((id *)&v7->_range, a3);
      v8 = [v5 startDate];
      v9 = [v5 endDate];
      if (v8)
      {
        double v10 = NSNumber;
        id v11 = [(PLEntry *)v7 entryDate];
        [v8 timeIntervalSinceDate:v11];
        uint64_t v13 = [v10 numberWithDouble:v12 * 1000.0];
        [(PLEntry *)v7 setObject:v13 forKeyedSubscript:@"StartOffset"];
      }
      if (v9 && [(id)objc_opt_class() classDirectionality] != 4)
      {
        uint64_t v14 = NSNumber;
        v15 = [(PLEntry *)v7 entryDate];
        [v9 timeIntervalSinceDate:v15];
        v17 = [v14 numberWithDouble:v16 * 1000.0];
        [(PLEntry *)v7 setObject:v17 forKeyedSubscript:@"EndOffset"];
      }
    }
    self = v7;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)canMergeWithEvent:(id)a3
{
  return [(PLAccountingEventEntry *)self instanceDirectionality] != 4;
}

- (void)setUsed:(BOOL)a3
{
  self->_used = a3;
}

- (void)mergeWithEvent:(id)a3
{
  id v4 = a3;
  int v5 = [(PLAccountingEventEntry *)self instanceDirectionality];
  if (v5 == [v4 instanceDirectionality])
  {
    switch([(id)objc_opt_class() classDirectionality])
    {
      case 1u:
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v6 = objc_opt_class();
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __41__PLAccountingEventEntry_mergeWithEvent___block_invoke;
          v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v43[4] = v6;
          if (mergeWithEvent__defaultOnce != -1) {
            dispatch_once(&mergeWithEvent__defaultOnce, v43);
          }
          if (mergeWithEvent__classDebugEnabled)
          {
            v7 = [NSString stringWithFormat:@"forward"];
            v8 = (void *)MEMORY[0x263F5F638];
            v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m"];
            double v10 = [v9 lastPathComponent];
            id v11 = [NSString stringWithUTF8String:"-[PLAccountingEventEntry mergeWithEvent:]"];
            [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:116];

            double v12 = PLLogCommon();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
            goto LABEL_31;
          }
        }
        break;
      case 2u:
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v13 = objc_opt_class();
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_49;
          v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v42[4] = v13;
          if (mergeWithEvent__defaultOnce_47 != -1) {
            dispatch_once(&mergeWithEvent__defaultOnce_47, v42);
          }
          if (mergeWithEvent__classDebugEnabled_48)
          {
            uint64_t v14 = [NSString stringWithFormat:@"backward"];
            v15 = (void *)MEMORY[0x263F5F638];
            double v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m"];
            v17 = [v16 lastPathComponent];
            v18 = [NSString stringWithUTF8String:"-[PLAccountingEventEntry mergeWithEvent:]"];
            [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:120];

            v19 = PLLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        v7 = [v4 range];
        double v12 = [v7 endDate];
        objc_super v20 = +[PLAccountingRange rangeWithStartDate:0 withEndDate:v12];
        [(PLAccountingEventEntry *)self setRange:v20];

        goto LABEL_31;
      case 3u:
        if ([MEMORY[0x263F5F640] debugEnabled])
        {
          uint64_t v21 = objc_opt_class();
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_52;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v21;
          if (mergeWithEvent__defaultOnce_50 != -1) {
            dispatch_once(&mergeWithEvent__defaultOnce_50, block);
          }
          if (mergeWithEvent__classDebugEnabled_51)
          {
            v22 = [NSString stringWithFormat:@"interval"];
            uint64_t v23 = (void *)MEMORY[0x263F5F638];
            uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m"];
            v25 = [v24 lastPathComponent];
            v26 = [NSString stringWithUTF8String:"-[PLAccountingEventEntry mergeWithEvent:]"];
            [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:125];

            v27 = PLLogCommon();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              -[PLAccountingDependency activate]();
            }
          }
        }
        v7 = [(PLAccountingEventEntry *)self range];
        double v12 = [v7 startDate];
        v28 = [v4 range];
        uint64_t v29 = [v28 endDate];
        v30 = +[PLAccountingRange rangeWithStartDate:v12 withEndDate:v29];
        [(PLAccountingEventEntry *)self setRange:v30];

        goto LABEL_31;
      case 4u:
        if (![MEMORY[0x263F5F640] debugEnabled]) {
          break;
        }
        uint64_t v31 = objc_opt_class();
        uint64_t v36 = MEMORY[0x263EF8330];
        uint64_t v37 = 3221225472;
        v38 = __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_55;
        v39 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v40 = v31;
        if (mergeWithEvent__defaultOnce_53 != -1) {
          dispatch_once(&mergeWithEvent__defaultOnce_53, &v36);
        }
        if (!mergeWithEvent__classDebugEnabled_54) {
          break;
        }
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"point", v36, v37, v38, v39, v40);
        v32 = (void *)MEMORY[0x263F5F638];
        v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m"];
        v34 = [v33 lastPathComponent];
        uint64_t v35 = [NSString stringWithUTF8String:"-[PLAccountingEventEntry mergeWithEvent:]"];
        [v32 logMessage:v7 fromFile:v34 fromFunction:v35 fromLineNumber:130];

        double v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[PLAccountingDependency activate]();
        }
LABEL_31:

        break;
      default:
        break;
    }
  }
}

void __35__PLAccountingEventEntry_setRange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = NSNumber;
    id v4 = [*(id *)(a1 + 40) entryDate];
    [v2 timeIntervalSinceDate:v4];
    uint64_t v6 = [v3 numberWithDouble:v5 * 1000.0];
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"StartOffset"];
  }
  if (*(void *)(a1 + 48) && [(id)objc_opt_class() classDirectionality] != 4)
  {
    v7 = NSNumber;
    v8 = *(void **)(a1 + 48);
    id v11 = [*(id *)(a1 + 40) entryDate];
    [v8 timeIntervalSinceDate:v11];
    double v10 = [v7 numberWithDouble:v9 * 1000.0];
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:@"EndOffset"];
  }
}

+ (int)classDirectionality
{
  return 0;
}

- (int)instanceDirectionality
{
  return 0;
}

- (BOOL)isEqualContentsWithEvent:(id)a3
{
  return 0;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rangeSinceEvent__classDebugEnabled = result;
  return result;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_25(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rangeSinceEvent__classDebugEnabled_24 = result;
  return result;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_31(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rangeSinceEvent__classDebugEnabled_30 = result;
  return result;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_37(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rangeSinceEvent__classDebugEnabled_36 = result;
  return result;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_43(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  rangeSinceEvent__classDebugEnabled_42 = result;
  return result;
}

uint64_t __41__PLAccountingEventEntry_mergeWithEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  mergeWithEvent__classDebugEnabled = result;
  return result;
}

uint64_t __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_49(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  mergeWithEvent__classDebugEnabled_48 = result;
  return result;
}

uint64_t __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_52(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  mergeWithEvent__classDebugEnabled_51 = result;
  return result;
}

uint64_t __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_55(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  mergeWithEvent__classDebugEnabled_54 = result;
  return result;
}

- (BOOL)isEmptyEvent
{
  return 1;
}

@end