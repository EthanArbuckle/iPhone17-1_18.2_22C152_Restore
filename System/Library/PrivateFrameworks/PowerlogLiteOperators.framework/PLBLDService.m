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
  v18 = &unk_1F29F0380;
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
  v14 = &unk_1F29E4C90;
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
  v6[3] = &unk_1E692A118;
  v6[4] = self;
  v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29E8C58 withBlock:v6];
  [(PLBLDService *)self setBatteryBreakdownResponder:v4];

  if ([(PLOperator *)self isDebugEnabled])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NotificationCallback, @"com.apple.powerlogd.BLD.batteryBreakdown", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

id __40__PLBLDService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = [*(id *)(a1 + 32) batteryBreakdownWithPayload:v6];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLBLDService_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD57A08 != -1) {
      dispatch_once(&qword_1EBD57A08, block);
    }
    if (_MergedGlobals_1_7)
    {
      v9 = [NSString stringWithFormat:@"%s/%d: result=%@, payload=%@", "-[PLBLDService initOperatorDependancies]_block_invoke", 101, v7, v6];
      v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
      v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLBLDService initOperatorDependancies]_block_invoke"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:101];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v18 = @"result";
  v19 = v7;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  return v15;
}

uint64_t __40__PLBLDService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_7 = result;
  return result;
}

- (id)batteryBreakdownWithPayload:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:@"PLBatteryUIQueryTypeKey"];
  uint64_t v5 = [v4 intValue];

  id v6 = &off_1D2B02000;
  v103 = self;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke;
    v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v112[4] = v7;
    if (qword_1EBD57A10 != -1) {
      dispatch_once(&qword_1EBD57A10, v112);
    }
    if (byte_1EBD57A01)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"queryType=%i", v5);
      v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:119];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      self = v103;
    }
  }
  if (v5 == 1)
  {
    v14 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint64_t v102 = objc_opt_new();
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v16 = [v14 dateByAddingTimeInterval:-86400.0];
    id v17 = v14;
    [v16 timeIntervalSince1970];
    double v19 = v18;
    [v17 timeIntervalSince1970];
    double v21 = v20;

    v99 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v19, v21 - v19, 0.0, 0.0, 3600.0);
    [v15 setObject:v99 forKeyedSubscript:@"PLBatteryUIQueryRangeDayKey"];
    uint64_t v22 = [(PLBLDService *)self bldEntryWithBatteryBreakdown:v15];
    v23 = &off_1D2B02000;
    v101 = v22;
    if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
    {
      v24 = (void *)v102;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v25 = objc_opt_class();
        v111[0] = MEMORY[0x1E4F143A8];
        v111[1] = 3221225472;
        v111[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_67;
        v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v111[4] = v25;
        if (qword_1EBD57A18 != -1) {
          dispatch_once(&qword_1EBD57A18, v111);
        }
        if (byte_1EBD57A02)
        {
          v26 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%d: past day results generated", "-[PLBLDService batteryBreakdownWithPayload:]", 140);
          v27 = (void *)MEMORY[0x1E4F929B8];
          v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
          v29 = [v28 lastPathComponent];
          v30 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
          [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:140];

          v31 = PLLogCommon();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v26;
            _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v24 = (void *)v102;
          self = v103;
          uint64_t v22 = v101;
          v23 = &off_1D2B02000;
        }
      }
      v32 = [v22 serialized];
      [v24 addObject:v32];
    }
    else
    {
      [(PLOperator *)self logEntry:v22];
      v24 = (void *)v102;
    }
    v33 = [MEMORY[0x1E4F1CA60] dictionary];

    v34 = [v17 dateByAddingTimeInterval:-604800.0];
    id v35 = v17;
    [v34 timeIntervalSince1970];
    double v37 = v36;
    [v35 timeIntervalSince1970];
    double v39 = v38;

    v40 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v37, v39 - v37, 0.0, 0.0, 3600.0);
    [v33 setObject:v40 forKeyedSubscript:@"PLBatteryUIQueryRangeWeekKey"];

    v41 = [(PLBLDService *)self bldEntryWithBatteryBreakdown:v33];
    v100 = v41;
    if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v42 = objc_opt_class();
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_76;
        v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v110[4] = v42;
        if (qword_1EBD57A20 != -1) {
          dispatch_once(&qword_1EBD57A20, v110);
        }
        if (byte_1EBD57A03)
        {
          v43 = v23;
          v44 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%d: past week results generated", "-[PLBLDService batteryBreakdownWithPayload:]", 156);
          v45 = (void *)MEMORY[0x1E4F929B8];
          v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
          v47 = [v46 lastPathComponent];
          v48 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
          [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:156];

          v23 = v43;
          v49 = PLLogCommon();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = *((void *)v43 + 348);
            v114 = v44;
            _os_log_debug_impl(&dword_1D2690000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v24 = (void *)v102;
          v41 = v100;
          id v6 = &off_1D2B02000;
        }
      }
      v50 = [v41 serialized];
      [v24 addObject:v50];
    }
    else
    {
      [(PLOperator *)self logEntry:v41];
    }
    v98 = v35;
    v51 = [v35 convertFromMonotonicToSystem];
    uint64_t v52 = 6;
    uint64_t v53 = *((void *)v6 + 347);
    int v97 = *((void *)v23 + 348);
    do
    {
      v54 = (void *)MEMORY[0x1E4F1C9C8];
      v55 = [v51 dateByAddingTimeInterval:-600.0];
      v56 = [v54 nearestMidnightBeforeDate:v55];

      v57 = @"PLBatteryUIQueryRangeTodayKey";
      if (v52 != 6)
      {
        v58 = NSString;
        v59 = [NSNumber numberWithInt:v52];
        v57 = [v58 stringWithFormat:@"PLBatteryUIQueryRangeDay_%@_Key", v59];
      }
      v60 = [MEMORY[0x1E4F1CA60] dictionary];

      v61 = [v56 convertFromSystemToMonotonic];
      v62 = [v51 convertFromSystemToMonotonic];
      [v61 timeIntervalSince1970];
      double v64 = v63;
      [v62 timeIntervalSince1970];
      double v66 = v65 - v64;

      v67 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v64, v66, 0.0, 0.0, 3600.0);
      [v60 setObject:v67 forKeyedSubscript:v57];

      v68 = [(PLBLDService *)self bldEntryWithBatteryBreakdown:v60];
      if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
      {
        v104 = v56;
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v69 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = v53;
          block[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_89;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v69;
          if (qword_1EBD57A28 != -1) {
            dispatch_once(&qword_1EBD57A28, block);
          }
          if (byte_1EBD57A04)
          {
            v70 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%d: past N days results generated", "-[PLBLDService batteryBreakdownWithPayload:]", 177);
            v71 = (void *)MEMORY[0x1E4F929B8];
            v72 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
            v73 = [v72 lastPathComponent];
            v74 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
            [v71 logMessage:v70 fromFile:v73 fromFunction:v74 fromLineNumber:177];

            v75 = PLLogCommon();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v97;
              v114 = v70;
              _os_log_debug_impl(&dword_1D2690000, v75, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v24 = (void *)v102;
            self = v103;
          }
        }
        v76 = [v68 serialized];
        [v24 addObject:v76];

        v56 = v104;
      }
      else
      {
        [(PLOperator *)self logEntry:v68];
      }

      uint64_t v52 = (v52 - 1);
      v33 = v60;
      v51 = v56;
    }
    while (v52 != -1);
    v77 = [MEMORY[0x1E4F1CA60] dictionary];
    v78 = [v99 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
    v79 = [(PLBatteryBreakdownService *)self suggestionsWithEnergyEntries:v78];
    [v77 setObject:v79 forKeyedSubscript:@"PLBatteryUISuggestionArrayKey"];

    v80 = [(PLBLDService *)self bldEntryWithBatteryBreakdown:v77];
    if ([MEMORY[0x1E4F92A88] isPowerlogHelperd])
    {
      v105 = v56;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v81 = objc_opt_class();
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = v53;
        v108[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_101;
        v108[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v108[4] = v81;
        if (qword_1EBD57A30 != -1) {
          dispatch_once(&qword_1EBD57A30, v108);
        }
        if (byte_1EBD57A05)
        {
          v82 = objc_msgSend(NSString, "stringWithFormat:", @"%s/%d: suggestion array generated", "-[PLBLDService batteryBreakdownWithPayload:]", 199);
          v83 = (void *)MEMORY[0x1E4F929B8];
          v84 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
          v85 = [v84 lastPathComponent];
          v86 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
          [v83 logMessage:v82 fromFile:v85 fromFunction:v86 fromLineNumber:199];

          v87 = PLLogCommon();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v97;
            v114 = v82;
            _os_log_debug_impl(&dword_1D2690000, v87, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v24 = (void *)v102;
        }
      }
      v88 = [v80 serialized];
      [v24 addObject:v88];

      v56 = v105;
    }
    else
    {
      [(PLOperator *)self logEntry:v80];
    }
    [(PLBatteryBreakdownService *)self clearState];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v89 = objc_opt_class();
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = v53;
      v107[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_107;
      v107[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v107[4] = v89;
      if (qword_1EBD57A38 != -1) {
        dispatch_once(&qword_1EBD57A38, v107);
      }
      if (byte_1EBD57A06)
      {
        v106 = v56;
        v90 = [NSString stringWithFormat:@"%s/%d: allEntries=%@", "-[PLBLDService batteryBreakdownWithPayload:]", 210, v24];
        v91 = (void *)MEMORY[0x1E4F929B8];
        v92 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m"];
        v93 = [v92 lastPathComponent];
        v94 = [NSString stringWithUTF8String:"-[PLBLDService batteryBreakdownWithPayload:]"];
        [v91 logMessage:v90 fromFile:v93 fromFunction:v94 fromLineNumber:210];

        v95 = PLLogCommon();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v97;
          v114 = v90;
          _os_log_debug_impl(&dword_1D2690000, v95, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v24 = (void *)v102;
        v56 = v106;
      }
    }
  }
  else
  {
    v24 = 0;
  }
  return v24;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57A01 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_67(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57A02 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_76(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57A03 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_89(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57A04 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_101(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57A05 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_107(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57A06 = result;
  return result;
}

- (id)bldEntryWithBatteryBreakdown:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PLBLDService_bldEntryWithBatteryBreakdown___block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  if (qword_1EBD57A40 != -1) {
    dispatch_once(&qword_1EBD57A40, block);
  }
  id v5 = objc_alloc(MEMORY[0x1E4F929D0]);
  id v6 = (void *)[v5 initWithEntryKey:qword_1EBD57A48];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"BLDRetail"];
  uint64_t v7 = [v6 entryDate];
  [v6 setObject:v7 forKeyedSubscript:@"LastUpDateTime"];

  uint64_t v8 = [MEMORY[0x1E4F92A88] JSONSanitizeDictionary:v4];
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
  qword_1EBD57A48 = [(id)objc_opt_class() entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BLD"];
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