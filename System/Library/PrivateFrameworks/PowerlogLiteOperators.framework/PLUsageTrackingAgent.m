@interface PLUsageTrackingAgent
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionUsageTime;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLUsageTrackingAgent)init;
- (USUsageReporter)usageReporter;
- (void)logEntriesFromUsageReports:(id)a3;
- (void)logEventIntervalUsageTime;
- (void)setUsageReporter:(id)a3;
@end

@implementation PLUsageTrackingAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLUsageTrackingAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"UsageTime";
  objc_super v2 = +[PLUsageTrackingAgent entryEventIntervalDefinitionUsageTime];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventIntervalDefinitionUsageTime
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F0880;
  v16[1] = MEMORY[0x1E4F1CC38];
  v15[2] = *MEMORY[0x1E4F92C08];
  v16[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"timestampEnd";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v14[0] = v5;
  v13[1] = @"bundleID";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v14[1] = v7;
  v13[2] = @"screenTime";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLUsageTrackingAgent)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLUsageTrackingAgent;
    self = [(PLAgent *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (void)logEventIntervalUsageTime
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    v3 = objc_opt_new();
    [(PLUsageTrackingAgent *)self setUsageReporter:v3];

    v4 = [(PLUsageTrackingAgent *)self usageReporter];

    if (v4)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v5 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (qword_1EBD5BE48 != -1) {
          dispatch_once(&qword_1EBD5BE48, block);
        }
        if (_MergedGlobals_92)
        {
          v6 = [NSString stringWithFormat:@"Logging UsageTracking reports"];
          v7 = (void *)MEMORY[0x1E4F929B8];
          v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m"];
          v9 = [v8 lastPathComponent];
          v10 = [NSString stringWithUTF8String:"-[PLUsageTrackingAgent logEventIntervalUsageTime]"];
          [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:128];

          v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v6;
            _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v12 = objc_opt_new();
      v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v14 = [v13 components:60 fromDate:v12];
      objc_msgSend(v14, "setValue:forComponent:", objc_msgSend(v14, "valueForComponent:", 32) + 1, 32);
      v15 = [v13 dateFromComponents:v14];

      id v16 = objc_alloc(MEMORY[0x1E4F28C18]);
      v17 = [v15 dateByAddingTimeInterval:-86400.0];
      v18 = (void *)[v16 initWithStartDate:v17 endDate:v15];

      v19 = [(PLUsageTrackingAgent *)self usageReporter];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_37;
      v26[3] = &unk_1E692CFD8;
      v26[4] = self;
      [v19 fetchReportsDuringInterval:v18 partitionInterval:v26 completionHandler:3600.0];

      v20 = [MEMORY[0x1E4F1C9C8] nearestMidnightAfterDate:v15];
      id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
      v22 = [v20 dateByAddingTimeInterval:-864000.0];
      v23 = (void *)[v21 initWithStartDate:v22 endDate:v20];

      v24 = [(PLUsageTrackingAgent *)self usageReporter];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_42;
      v25[3] = &unk_1E692CFD8;
      v25[4] = self;
      [v24 fetchReportsDuringInterval:v23 partitionInterval:v25 completionHandler:86400.0];
    }
  }
}

uint64_t __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_92 = result;
  return result;
}

void __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_37(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_2;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v24 = v13;
      if (qword_1EBD5BE50 != -1) {
        dispatch_once(&qword_1EBD5BE50, &block);
      }
      if (byte_1EBD5BE41)
      {
        v14 = [NSString stringWithFormat:@"%@", v12, block, v21, v22, v23, v24];
        v15 = (void *)MEMORY[0x1E4F929B8];
        id v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLUsageTrackingAgent logEventIntervalUsageTime]_block_invoke"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:144];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v14;
          _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) logEntriesFromUsageReports:v9];
  }
}

uint64_t __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE41 = result;
  return result;
}

void __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_42(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_2_43;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v24 = v13;
      if (qword_1EBD5BE58 != -1) {
        dispatch_once(&qword_1EBD5BE58, &block);
      }
      if (byte_1EBD5BE42)
      {
        v14 = [NSString stringWithFormat:@"%@", v12, block, v21, v22, v23, v24];
        v15 = (void *)MEMORY[0x1E4F929B8];
        id v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLUsageTrackingAgent logEventIntervalUsageTime]_block_invoke"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:156];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v14;
          _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) logEntriesFromUsageReports:v9];
  }
}

uint64_t __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_2_43(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE42 = result;
  return result;
}

- (void)logEntriesFromUsageReports:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (qword_1EBD5BE60 != -1) {
        dispatch_once(&qword_1EBD5BE60, block);
      }
      if (byte_1EBD5BE43)
      {
        v7 = [NSString stringWithFormat:@"Creating entries from UT"];
        v8 = (void *)MEMORY[0x1E4F929B8];
        id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m"];
        id v10 = [v9 lastPathComponent];
        id v11 = [NSString stringWithUTF8String:"-[PLUsageTrackingAgent logEntriesFromUsageReports:]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:167];

        id v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v7;
          _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v13 = objc_opt_new();
    v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"UsageTime"];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_48;
    v26[3] = &unk_1E692D050;
    id v15 = v14;
    id v27 = v15;
    id v16 = v13;
    id v28 = v16;
    [v5 enumerateObjectsUsingBlock:v26];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_4;
      v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v25[4] = v17;
      if (qword_1EBD5BE68 != -1) {
        dispatch_once(&qword_1EBD5BE68, v25);
      }
      if (byte_1EBD5BE44)
      {
        v18 = objc_msgSend(NSString, "stringWithFormat:", @"Logging %lu UT reports", objc_msgSend(v16, "count"));
        v19 = (void *)MEMORY[0x1E4F929B8];
        v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m"];
        uint64_t v21 = [v20 lastPathComponent];
        v22 = [NSString stringWithUTF8String:"-[PLUsageTrackingAgent logEntriesFromUsageReports:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:198];

        v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v18;
          _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if ([v16 count])
    {
      id v30 = v15;
      id v31 = v16;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [(PLOperator *)self logEntries:v24 withGroupID:v15];
    }
  }
}

uint64_t __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE43 = result;
  return result;
}

void __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 categoryUsage];
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v3 interval];
    v7 = [v6 startDate];
    v8 = [v7 convertFromSystemToMonotonic];

    id v9 = [v3 interval];
    id v10 = [v9 endDate];
    id v11 = [v10 convertFromSystemToMonotonic];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_2;
    void v14[3] = &unk_1E692D028;
    id v15 = *(id *)(a1 + 32);
    id v16 = v8;
    id v17 = v11;
    id v18 = *(id *)(a1 + 40);
    id v12 = v11;
    id v13 = v8;
    [v5 enumerateObjectsUsingBlock:v14];
  }
}

void __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_2(id *a1, void *a2)
{
  id v3 = [a2 applicationUsage];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_3;
    v5[3] = &unk_1E692D000;
    id v6 = a1[4];
    id v7 = a1[5];
    id v8 = a1[6];
    id v9 = a1[7];
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

void __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 applicationUsageByBundleIdentifier];
  id v4 = [v3 allValues];
  uint64_t v5 = [v4 valueForKeyPath:@"@sum.self"];

  [v5 doubleValue];
  if (v6 != 0.0)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:*(void *)(a1 + 32)];
    [v7 setEntryDate:*(void *)(a1 + 40)];
    [v7 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"timestampEnd"];
    id v8 = [v9 canonicalBundleIdentifier];
    [v7 setObject:v8 forKeyedSubscript:@"bundleID"];

    [v7 setObject:v5 forKeyedSubscript:@"screenTime"];
    [*(id *)(a1 + 56) addObject:v7];
  }
}

uint64_t __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_4(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BE44 = result;
  return result;
}

- (USUsageReporter)usageReporter
{
  return (USUsageReporter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUsageReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end