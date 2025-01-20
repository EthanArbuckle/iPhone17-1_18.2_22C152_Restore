@interface PLBLDService
+ (id)entryEventPointBLD;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLBLDService)init;
- (PLXPCResponderOperatorComposition)batteryBreakdownResponder;
- (PLXPCResponderOperatorComposition)logBUIResultsResponder;
- (id)batteryBreakdownWithPayload:(id)a3;
- (id)bldEntryWithBatteryBreakdown:(id)a3;
- (void)initOperatorDependancies;
- (void)setBatteryBreakdownResponder:(id)a3;
- (void)setLogBUIResultsResponder:(id)a3;
@end

@implementation PLBLDService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBLDService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"BLD";
  objc_super v2 = +[PLBLDService entryEventPointBLD];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointBLD
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v17 = *MEMORY[0x1E4F92CD0];
  v18 = &unk_1F40124B8;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20[0] = v2;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"BUIOutput";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v16[0] = v4;
  v15[1] = @"JSON";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v16[1] = v6;
  v15[2] = @"LastUpDateTime";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_DateFormat");
  v16[2] = v8;
  v15[3] = @"BLDRetail";
  uint64_t v13 = *MEMORY[0x1E4F92D10];
  v14 = &unk_1F400E638;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v16[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v11;
}

- (PLBLDService)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLBLDService;
    self = [(PLOperator *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA8]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __40__PLBLDService_initOperatorDependancies__block_invoke;
  v6[3] = &unk_1E6E47958;
  v6[4] = self;
  v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F4011978 withBlock:v6];
  [(PLBLDService *)self setBatteryBreakdownResponder:v4];

  if ([(PLOperator *)self isDebugEnabled])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NotificationCallback_0, @"com.apple.powerlogd.BLD.batteryBreakdown", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

id __40__PLBLDService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = [*(id *)(a1 + 32) batteryBreakdownWithPayload:v6];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __40__PLBLDService_initOperatorDependancies__block_invoke_2;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v21 = v8;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1, &block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1)
    {
      v9 = [NSString stringWithFormat:@"%s/%d: result=%@, payload=%@", "-[PLBLDService initOperatorDependancies]_block_invoke", 101, v7, v6, block, v18, v19, v20, v21];
      v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
      v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLBLDService initOperatorDependancies]_block_invoke"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:101];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v22 = @"result";
  v23[0] = v7;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  return v15;
}

uint64_t __40__PLBLDService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1 = result;
  return result;
}

- (id)batteryBreakdownWithPayload:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:@"PLBatteryUIQueryTypeKey"];
  uint64_t v5 = [v4 intValue];

  v98 = self;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke;
    v107[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v107[4] = v6;
    if (batteryBreakdownWithPayload__defaultOnce != -1) {
      dispatch_once(&batteryBreakdownWithPayload__defaultOnce, v107);
    }
    if (batteryBreakdownWithPayload__classDebugEnabled)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"queryType=%i", v5);
      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
      v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:119];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      self = v98;
    }
  }
  if (v5 == 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint64_t v97 = objc_opt_new();
    v14 = [MEMORY[0x1E4F1CA60] dictionary];
    v15 = [v13 dateByAddingTimeInterval:-86400.0];
    id v16 = v13;
    [v15 timeIntervalSince1970];
    double v18 = v17;
    [v16 timeIntervalSince1970];
    double v20 = v19;

    v94 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v18, v20 - v18, 0.0, 0.0, 3600.0);
    [v14 setObject:v94 forKeyedSubscript:@"PLBatteryUIQueryRangeDayKey"];
    uint64_t v21 = [(PLBLDService *)self bldEntryWithBatteryBreakdown:v14];
    if (+[PLUtilities isPowerlogHelperd])
    {
      v22 = (void *)v97;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v23 = objc_opt_class();
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_67;
        v106[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v106[4] = v23;
        if (batteryBreakdownWithPayload__defaultOnce_65 != -1) {
          dispatch_once(&batteryBreakdownWithPayload__defaultOnce_65, v106);
        }
        if (batteryBreakdownWithPayload__classDebugEnabled_66)
        {
          v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%d: past day results generated", "-[PLBLDService batteryBreakdownWithPayload:]", 140);
          v25 = (void *)MEMORY[0x1E4F929B8];
          v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
          v27 = [v26 lastPathComponent];
          v28 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
          [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:140];

          v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }

          v22 = (void *)v97;
          self = v98;
        }
      }
      v30 = [v21 serialized];
      [v22 addObject:v30];
    }
    else
    {
      [(PLOperator *)self logEntry:v21];
      v22 = (void *)v97;
    }
    v31 = [MEMORY[0x1E4F1CA60] dictionary];

    v32 = [v16 dateByAddingTimeInterval:-604800.0];
    id v33 = v16;
    [v32 timeIntervalSince1970];
    double v35 = v34;
    [v33 timeIntervalSince1970];
    double v37 = v36;

    v38 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v35, v37 - v35, 0.0, 0.0, 3600.0);
    [v31 setObject:v38 forKeyedSubscript:@"PLBatteryUIQueryRangeWeekKey"];

    v39 = [(PLBLDService *)self bldEntryWithBatteryBreakdown:v31];
    v93 = v21;
    v95 = v39;
    v96 = v33;
    if (+[PLUtilities isPowerlogHelperd])
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v40 = objc_opt_class();
        v105[0] = MEMORY[0x1E4F143A8];
        v105[1] = 3221225472;
        v105[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_76;
        v105[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v105[4] = v40;
        if (batteryBreakdownWithPayload__defaultOnce_74 != -1) {
          dispatch_once(&batteryBreakdownWithPayload__defaultOnce_74, v105);
        }
        if (batteryBreakdownWithPayload__classDebugEnabled_75)
        {
          v41 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%d: past week results generated", "-[PLBLDService batteryBreakdownWithPayload:]", 156);
          v42 = (void *)MEMORY[0x1E4F929B8];
          v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
          v44 = [v43 lastPathComponent];
          v45 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
          [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:156];

          v46 = PLLogCommon();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }

          id v33 = v96;
          v22 = (void *)v97;
          v39 = v95;
        }
      }
      v47 = [v39 serialized];
      [v22 addObject:v47];
    }
    else
    {
      [(PLOperator *)self logEntry:v39];
    }
    v48 = [v33 convertFromMonotonicToSystem];
    uint64_t v49 = 6;
    do
    {
      v50 = (void *)MEMORY[0x1E4F1C9C8];
      v51 = [v48 dateByAddingTimeInterval:-600.0];
      v52 = [v50 nearestMidnightBeforeDate:v51];

      v53 = @"PLBatteryUIQueryRangeTodayKey";
      if (v49 != 6)
      {
        v54 = NSString;
        v55 = [MEMORY[0x1E4F28ED0] numberWithInt:v49];
        v53 = [v54 stringWithFormat:@"PLBatteryUIQueryRangeDay_%@_Key", v55];
      }
      v56 = [MEMORY[0x1E4F1CA60] dictionary];

      v57 = [v52 convertFromSystemToMonotonic];
      v58 = [v48 convertFromSystemToMonotonic];
      [v57 timeIntervalSince1970];
      double v60 = v59;
      [v58 timeIntervalSince1970];
      double v62 = v61 - v60;

      v63 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v60, v62, 0.0, 0.0, 3600.0);
      [v56 setObject:v63 forKeyedSubscript:v53];

      v64 = [(PLBLDService *)self bldEntryWithBatteryBreakdown:v56];
      if (+[PLUtilities isPowerlogHelperd])
      {
        v99 = v52;
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v65 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_89;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v65;
          if (batteryBreakdownWithPayload__defaultOnce_87 != -1) {
            dispatch_once(&batteryBreakdownWithPayload__defaultOnce_87, block);
          }
          if (batteryBreakdownWithPayload__classDebugEnabled_88)
          {
            v66 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%d: past N days results generated", "-[PLBLDService batteryBreakdownWithPayload:]", 177);
            v67 = (void *)MEMORY[0x1E4F929B8];
            v68 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
            v69 = [v68 lastPathComponent];
            v70 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
            [v67 logMessage:v66 fromFile:v69 fromFunction:v70 fromLineNumber:177];

            v71 = PLLogCommon();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v109 = v66;
              _os_log_debug_impl(&dword_1E4220000, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v22 = (void *)v97;
            self = v98;
          }
        }
        v72 = [v64 serialized];
        [v22 addObject:v72];

        v52 = v99;
      }
      else
      {
        [(PLOperator *)self logEntry:v64];
      }

      uint64_t v49 = (v49 - 1);
      v31 = v56;
      v48 = v52;
    }
    while (v49 != -1);
    v73 = [MEMORY[0x1E4F1CA60] dictionary];
    v74 = [v94 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
    v75 = [(PLBatteryBreakdownService *)self suggestionsWithEnergyEntries:v74];
    [v73 setObject:v75 forKeyedSubscript:@"PLBatteryUISuggestionArrayKey"];

    v76 = [(PLBLDService *)self bldEntryWithBatteryBreakdown:v73];
    if (+[PLUtilities isPowerlogHelperd])
    {
      v100 = v52;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v77 = objc_opt_class();
        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_101;
        v103[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v103[4] = v77;
        if (batteryBreakdownWithPayload__defaultOnce_99 != -1) {
          dispatch_once(&batteryBreakdownWithPayload__defaultOnce_99, v103);
        }
        if (batteryBreakdownWithPayload__classDebugEnabled_100)
        {
          v78 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%d: suggestion array generated", "-[PLBLDService batteryBreakdownWithPayload:]", 199);
          v79 = (void *)MEMORY[0x1E4F929B8];
          v80 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
          v81 = [v80 lastPathComponent];
          v82 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
          [v79 logMessage:v78 fromFile:v81 fromFunction:v82 fromLineNumber:199];

          v83 = PLLogCommon();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }

          v22 = (void *)v97;
        }
      }
      v84 = [v76 serialized];
      [v22 addObject:v84];

      v52 = v100;
    }
    else
    {
      [(PLOperator *)self logEntry:v76];
    }
    [(PLBatteryBreakdownService *)self clearState];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v85 = objc_opt_class();
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_107;
      v102[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v102[4] = v85;
      if (batteryBreakdownWithPayload__defaultOnce_105 != -1) {
        dispatch_once(&batteryBreakdownWithPayload__defaultOnce_105, v102);
      }
      if (batteryBreakdownWithPayload__classDebugEnabled_106)
      {
        v101 = v52;
        v86 = [NSString stringWithFormat:@"%s/%d: allEntries=%@", "-[PLBLDService batteryBreakdownWithPayload:]", 210, v22];
        v87 = (void *)MEMORY[0x1E4F929B8];
        v88 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
        v89 = [v88 lastPathComponent];
        v90 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
        [v87 logMessage:v86 fromFile:v89 fromFunction:v90 fromLineNumber:210];

        v91 = PLLogCommon();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

        v22 = (void *)v97;
        v52 = v101;
      }
    }
  }
  else
  {
    v22 = 0;
  }
  return v22;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  batteryBreakdownWithPayload__classDebugEnabled = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_67(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  batteryBreakdownWithPayload__classDebugEnabled_66 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_76(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  batteryBreakdownWithPayload__classDebugEnabled_75 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_89(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  batteryBreakdownWithPayload__classDebugEnabled_88 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_101(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  batteryBreakdownWithPayload__classDebugEnabled_100 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_107(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  batteryBreakdownWithPayload__classDebugEnabled_106 = result;
  return result;
}

- (id)bldEntryWithBatteryBreakdown:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PLBLDService_bldEntryWithBatteryBreakdown___block_invoke;
  block[3] = &unk_1E6E47848;
  block[4] = self;
  if (bldEntryWithBatteryBreakdown__onceToken != -1) {
    dispatch_once(&bldEntryWithBatteryBreakdown__onceToken, block);
  }
  id v5 = objc_alloc(MEMORY[0x1E4F929D0]);
  uint64_t v6 = (void *)[v5 initWithEntryKey:bldEntryWithBatteryBreakdown__entryKey];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"BLDRetail"];
  v7 = [v6 entryDate];
  [v6 setObject:v7 forKeyedSubscript:@"LastUpDateTime"];

  uint64_t v8 = +[PLUtilities JSONSanitizeDictionary:v4];
  v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:0];
  if (v9)
  {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"JSON"];
    uint64_t v10 = [[NSString alloc] initWithData:v9 encoding:4];
  }
  else
  {
    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"JSON"];
    uint64_t v10 = [v8 description];
  }
  v11 = (void *)v10;
  [v6 setObject:v10 forKeyedSubscript:@"BUIOutput"];

  return v6;
}

uint64_t __45__PLBLDService_bldEntryWithBatteryBreakdown___block_invoke()
{
  bldEntryWithBatteryBreakdown__entryKey = [(id)objc_opt_class() entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BLD"];
  return MEMORY[0x1F41817F8]();
}

- (PLXPCResponderOperatorComposition)batteryBreakdownResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBatteryBreakdownResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)logBUIResultsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLogBUIResultsResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logBUIResultsResponder, 0);
  objc_storeStrong((id *)&self->_batteryBreakdownResponder, 0);
}

@end