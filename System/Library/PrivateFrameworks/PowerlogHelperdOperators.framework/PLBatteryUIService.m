@interface PLBatteryUIService
+ (void)load;
- (BOOL)dateIntervals:(id)a3 containDate:(id)a4;
- (BOOL)demoMode;
- (BOOL)isAppEntryValidForAdjustment:(id)a3 withQueryType:(int)a4;
- (BOOL)writeOutputDemo;
- (PLBatteryUIService)init;
- (PLXPCResponderOperatorComposition)batteryBreakdownResponder;
- (PLXPCResponderOperatorComposition)modelsResponder;
- (_PLTimeIntervalRange)getDataRangeWithNow:(id)a3;
- (_PLTimeIntervalRange)getlastDayRangeWithNow:(id)a3 withNowSystem:(id)a4;
- (_PLTimeIntervalRange)getlastXDayRangeWithNow:(id)a3 withNowSystem:(id)a4;
- (double)adjustScreenOffTimeSecsWithGraphValue:(double)a3 withGraphScreenOnSecs:(double)a4 queryType:(int)a5 andBreakdownEntries:(id)a6;
- (double)adjustScreenOnTimeSecsWithGraphValue:(double)a3 queryType:(int)a4 andBreakdownEntries:(id)a5;
- (double)floorSeconds:(double)a3;
- (id)batteryBreakdownAndGraphWithPayload:(id)a3;
- (id)batteryBreakdownWithPayload:(id)a3 withDayRange:(_PLTimeIntervalRange)a4 withXDayRange:(_PLTimeIntervalRange)a5 withDataRange:(_PLTimeIntervalRange)a6;
- (id)batteryLevelsAndChargingIntervalsInRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4;
- (id)dateAndBatteryLevelPointsInRange:(_PLTimeIntervalRange)a3;
- (id)demoModePath;
- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4;
- (id)generateTapBucketsForBucketSize:(int)a3 withNumberOfBuckets:(int)a4 withNowTime:(id)a5 withDrainThreshold:(double)a6 withQueryType:(int)a7 withDataRange:(_PLTimeIntervalRange)a8;
- (id)getLPMIntervalsSpanningRange:(_PLTimeIntervalRange)a3;
- (id)getLastChargeData;
- (id)lastXDaysWithRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4 withQueryType:(int)a5 andBatteryBreakdown:(id)a6;
- (id)modelsForGraphWithDayRange:(_PLTimeIntervalRange)a3 withXDayRange:(_PLTimeIntervalRange)a4 withDataRange:(_PLTimeIntervalRange)a5 withQueryType:(int)a6 andBatteryBreakdown:(id)a7;
- (id)modelsWithPayload:(id)a3;
- (id)screenTimeInRange:(_PLTimeIntervalRange)a3 withBucketSize:(double)a4 withNumBuckets:(int)a5 withDataRange:(_PLTimeIntervalRange)a6 withQueryType:(int)a7 andBatteryBreakdown:(id)a8;
- (void)demoModePath;
- (void)getLastChargeData;
- (void)incrementAggdKey;
- (void)initOperatorDependancies;
- (void)removeExcessUpgradePlistFiles;
- (void)setBatteryBreakdownResponder:(id)a3;
- (void)setModelsResponder:(id)a3;
- (void)testUIQuery;
@end

@implementation PLBatteryUIService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryUIService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLBatteryUIService)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLBatteryUIService;
    self = [(PLOperator *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  if ([(PLOperator *)self isDebugEnabled])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NotificationCallback, @"com.apple.powerlogd.PLBatteryUIService.batteryBreakdown", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  if (+[PLUtilities isPowerlogHelperd])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F92AA8]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__PLBatteryUIService_initOperatorDependancies__block_invoke;
    v9[3] = &unk_1E6E47958;
    v9[4] = self;
    objc_super v5 = (void *)[v4 initWithOperator:self withRegistration:&unk_1F400E7F0 withBlock:v9];
    [(PLBatteryUIService *)self setBatteryBreakdownResponder:v5];

    id v6 = objc_alloc(MEMORY[0x1E4F92AA8]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__PLBatteryUIService_initOperatorDependancies__block_invoke_42;
    v8[3] = &unk_1E6E47958;
    v8[4] = self;
    v7 = (void *)[v6 initWithOperator:self withRegistration:&unk_1F400E818 withBlock:v8];
    [(PLBatteryUIService *)self setModelsResponder:v7];
  }
}

id __46__PLBatteryUIService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __46__PLBatteryUIService_initOperatorDependancies__block_invoke_2;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v7;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce, &block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled)
    {
      v8 = [NSString stringWithFormat:@"batteryBreakdownResponder: payload=%@", v6, block, v17, v18, v19, v20];
      v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLBatteryUIService initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:100];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v14 = [*(id *)(a1 + 32) batteryBreakdownAndGraphWithPayload:v6];

  return v14;
}

uint64_t __46__PLBatteryUIService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled = result;
  return result;
}

id __46__PLBatteryUIService_initOperatorDependancies__block_invoke_42(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __46__PLBatteryUIService_initOperatorDependancies__block_invoke_2_43;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v7;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce, &block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled)
    {
      v8 = [NSString stringWithFormat:@"modelsResponder: payload=%@", v6, block, v17, v18, v19, v20];
      v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
      v11 = [v10 lastPathComponent];
      v12 = [NSString stringWithUTF8String:"-[PLBatteryUIService initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:106];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v14 = [*(id *)(a1 + 32) modelsWithPayload:v6];

  return v14;
}

uint64_t __46__PLBatteryUIService_initOperatorDependancies__block_invoke_2_43(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (_PLTimeIntervalRange)getlastDayRangeWithNow:(id)a3 withNowSystem:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  objc_super v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [v5 components:60 fromDate:v4];
  unint64_t v7 = [v6 valueForComponent:32];
  v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v29 = [v5 dateFromComponents:v6];
    *(_DWORD *)buf = 138412802;
    id v31 = v4;
    __int16 v32 = 2112;
    v33 = v29;
    __int16 v34 = 2048;
    unint64_t v35 = v7;
    _os_log_debug_impl(&dword_1E4220000, v8, OS_LOG_TYPE_DEBUG, "Date: %@ -> %@ -> %lu", buf, 0x20u);
  }
  v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService getlastDayRangeWithNow:withNowSystem:]();
  }

  unint64_t v10 = (unint64_t)((double)v7 - fmod((double)v7, 3.0) + 3.0);
  v11 = PLLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService getlastDayRangeWithNow:withNowSystem:]();
  }

  [v6 setValue:v10 forComponent:32];
  v12 = [v5 dateFromComponents:v6];
  v13 = PLLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService getlastDayRangeWithNow:withNowSystem:]();
  }

  v14 = [v12 convertFromSystemToMonotonic];
  v15 = [v14 dateByAddingTimeInterval:-86400.0];
  id v16 = v14;
  [v15 timeIntervalSince1970];
  double v18 = v17;
  [v16 timeIntervalSince1970];
  double v20 = v19;

  double v21 = v20 - v18;
  v22 = PLLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = NSString;
    v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v18];
    v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v18 + v21];
    v26 = [v23 stringWithFormat:@"Start: %@, End %@", v24, v25];

    *(_DWORD *)buf = 138412290;
    id v31 = v26;
    _os_log_impl(&dword_1E4220000, v22, OS_LOG_TYPE_INFO, "lastDayRange: %@", buf, 0xCu);
  }
  double v27 = v18;
  double v28 = v21;
  result.length = v28;
  result.location = v27;
  return result;
}

- (_PLTimeIntervalRange)getlastXDayRangeWithNow:(id)a3 withNowSystem:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  objc_super v5 = [MEMORY[0x1E4F1C9C8] nearestMidnightAfterDate:v4];
  id v6 = [v5 convertFromSystemToMonotonic];
  unint64_t v7 = [v6 dateByAddingTimeInterval:-864000.0];
  id v8 = v6;
  [v7 timeIntervalSince1970];
  double v10 = v9;
  [v8 timeIntervalSince1970];
  double v12 = v11;

  v13 = PLLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v4;
    __int16 v24 = 2112;
    v25 = v5;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_debug_impl(&dword_1E4220000, v13, OS_LOG_TYPE_DEBUG, "Next system midnight %@ -> %@ = monotonic %@", buf, 0x20u);
  }
  double v14 = v12 - v10;

  v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = NSString;
    double v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
    double v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10 + v14];
    double v19 = [v16 stringWithFormat:@"Start: %@, End %@", v17, v18];

    *(_DWORD *)buf = 138412290;
    id v23 = v19;
    _os_log_impl(&dword_1E4220000, v15, OS_LOG_TYPE_INFO, "lastXDayRange: %@", buf, 0xCu);
  }
  double v20 = v10;
  double v21 = v14;
  result.length = v21;
  result.location = v20;
  return result;
}

- (_PLTimeIntervalRange)getDataRangeWithNow:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F92D20];
  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UsageTime"];
  unint64_t v35 = [MEMORY[0x1E4F92968] entryKeyForType:v5 andName:*MEMORY[0x1E4F92B48]];
  unint64_t v7 = [(PLOperator *)self storage];
  id v8 = [v7 firstEntryForKey:v6];

  if (v8)
  {
    id v9 = [v8 entryDate];
    double v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:].cold.4();
    }
  }
  else
  {
    double v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:]();
    }

    id v9 = v4;
  }
  double v12 = [(PLOperator *)self storage];
  v13 = [v12 firstEntryForKey:v35];

  if (v13)
  {
    id v14 = [v13 entryDate];
    v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:]();
    }
  }
  else
  {
    id v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getDataRangeWithNow:]();
    }

    id v14 = v4;
  }
  double v17 = [v14 laterDate:v9];
  id v18 = v4;
  [v17 timeIntervalSince1970];
  double v20 = v19;
  [v18 timeIntervalSince1970];
  double v22 = v21;

  double v23 = v22 - v20;
  __int16 v24 = PLLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = NSString;
    __int16 v34 = v8;
    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v20];
    __int16 v26 = v13;
    id v27 = v9;
    v29 = uint64_t v28 = v6;
    v30 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v20 + v23];
    id v31 = [v25 stringWithFormat:@"Start: %@, End %@", v29, v30];

    id v8 = v34;
    id v6 = v28;
    id v9 = v27;
    v13 = v26;
    *(_DWORD *)buf = 138412290;
    v37 = v31;
    _os_log_impl(&dword_1E4220000, v24, OS_LOG_TYPE_INFO, "dataRange: %@", buf, 0xCu);
  }
  double v32 = v20;
  double v33 = v23;
  result.length = v33;
  result.location = v32;
  return result;
}

- (id)batteryBreakdownAndGraphWithPayload:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLBatteryUIService *)self demoMode])
  {
    uint64_t v5 = [(PLBatteryUIService *)self demoModePath];
    id v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v5;
      _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_INFO, "BUI Demo mode enabled, using plist at %@", buf, 0xCu);
    }

    unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
    id v8 = v7;
    if (v7) {
      id v9 = [v7 mutableCopy];
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v8 = [v5 convertFromMonotonicToSystem];
    double v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v8;
      _os_log_impl(&dword_1E4220000, v10, OS_LOG_TYPE_INFO, "Received xpc request at system time: %@", buf, 0xCu);
    }

    double v11 = PLLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:].cold.6();
    }

    [(PLBatteryUIService *)self getlastDayRangeWithNow:v5 withNowSystem:v8];
    double v13 = v12;
    double v15 = v14;
    [(PLBatteryUIService *)self getlastXDayRangeWithNow:v5 withNowSystem:v8];
    double v17 = v16;
    double v19 = v18;
    [(PLBatteryUIService *)self getDataRangeWithNow:v5];
    double v21 = v20;
    double v23 = v22;
    __int16 v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v13 + v15];
    v25 = [v24 convertFromMonotonicToSystem];
    [v25 timeIntervalSince1970];
    double v27 = v26;

    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:&unk_1F4011AE8 forKeyedSubscript:@"PLBatteryUIXPCVersionKey"];
    uint64_t v28 = -[PLBatteryUIService batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:](self, "batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:", v4, v13, v15, v17, v19, v21, v23);
    [v9 setObject:v28 forKeyedSubscript:@"Breakdown"];

    v66 = v4;
    v29 = [v4 objectForKeyedSubscript:@"PLBatteryUIQueryTypeKey"];
    uint64_t v30 = [v29 intValue];
    id v31 = [v9 objectForKeyedSubscript:@"Breakdown"];
    double v32 = -[PLBatteryUIService modelsForGraphWithDayRange:withXDayRange:withDataRange:withQueryType:andBatteryBreakdown:](self, "modelsForGraphWithDayRange:withXDayRange:withDataRange:withQueryType:andBatteryBreakdown:", v30, v31, v13, v15, v17, v19, v21, v23);
    [v9 setObject:v32 forKeyedSubscript:@"Graph"];

    double v33 = [MEMORY[0x1E4F28ED0] numberWithDouble:v27];
    [v9 setObject:v33 forKeyedSubscript:@"endOfDay"];

    [v8 timeIntervalSince1970];
    __int16 v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    [v9 setObject:v34 forKeyedSubscript:@"PLBatteryUIQueryTime"];

    uint64_t v35 = [(PLBatteryUIService *)self getLastChargeData];
    if (v35) {
      [v9 setObject:v35 forKeyedSubscript:@"PLBatteryUILastChargeKey"];
    }
    v65 = (void *)v35;
    uint64_t v36 = PLLogCommon();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = NSString;
      uint64_t v38 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v13];
      v39 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v13 + v15];
      v40 = [v37 stringWithFormat:@"Start: %@, End %@", v38, v39];

      *(_DWORD *)buf = 138412290;
      v69 = v40;
      _os_log_impl(&dword_1E4220000, v36, OS_LOG_TYPE_INFO, "Computed batteryBreakdown response, day range: %@", buf, 0xCu);
    }
    v41 = PLLogCommon();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v41, OS_LOG_TYPE_INFO, "Writing response to file", buf, 2u);
    }

    v42 = +[PLUtilities containerPath];
    v43 = [v42 stringByAppendingString:@"/Library/BatteryLife/Debug/"];
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:v43];

    v44 = [v66 objectForKeyedSubscript:@"requestingService"];
    uint64_t v64 = [v66 objectForKeyedSubscript:@"plistCopyDestination"];
    v45 = +[PLUtilities containerPath];
    v46 = [v45 stringByAppendingString:@"/Library/BatteryLife/Debug/"];

    if (v44)
    {
      v47 = [NSString stringWithFormat:@"BatteryUI%@", v44];
      v48 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v46 isDirectory:1];
      v49 = [v48 URLByAppendingPathComponent:v47];

      [v49 URLByAppendingPathExtension:@"plist"];
    }
    else
    {
      v50 = (void *)MEMORY[0x1E4F1CB10];
      v47 = +[PLUtilities containerPath];
      v49 = [v47 stringByAppendingString:@"/Library/BatteryLife/Debug/BatteryUI.plist"];
      [v50 fileURLWithPath:v49];
    v51 = };

    v52 = PLLogCommon();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:].cold.5();
    }

    id v67 = 0;
    int v53 = [v9 writeToURL:v51 error:&v67];
    id v54 = v67;
    if (v53)
    {
      v55 = v46;
      v56 = [v51 path];
      +[PLUtilities setMobileOwnerForFile:v56];

      v57 = PLLogCommon();
      v46 = v55;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:]();
      }
      v58 = (void *)v64;
    }
    else
    {
      v57 = PLLogCommon();
      v58 = (void *)v64;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:].cold.4();
      }
    }

    if (v44 && [v44 containsString:@"Upgrade"]) {
      [(PLBatteryUIService *)self removeExcessUpgradePlistFiles];
    }
    if (v58)
    {
      BOOL v59 = +[PLUtilities PLCopyItemsFromPath:v46 toPath:v58];
      v60 = PLLogCommon();
      v61 = v60;
      if (v59)
      {
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:]();
        }
      }
      else
      {
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:]();
        }

        v61 = v9;
        id v9 = 0;
      }
      v62 = v65;
    }
    else
    {
      v62 = v65;
    }

    id v4 = v66;
  }

  return v9;
}

- (id)batteryBreakdownWithPayload:(id)a3 withDayRange:(_PLTimeIntervalRange)a4 withXDayRange:(_PLTimeIntervalRange)a5 withDataRange:(_PLTimeIntervalRange)a6
{
  double length = a6.length;
  double location = a6.location;
  double v8 = a5.length;
  double v9 = a5.location;
  double v10 = a4.length;
  double v11 = a4.location;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  [(PLBatteryUIService *)self incrementAggdKey];
  double v14 = v11 + v10;
  if (v11 < location && v14 > location)
  {
    double v19 = location + length;
LABEL_14:
    if (v11 >= location) {
      double v17 = v11;
    }
    else {
      double v17 = location;
    }
    if (v14 < v19) {
      double v19 = v11 + v10;
    }
    double v18 = v19 - v17;
    goto LABEL_20;
  }
  double v19 = location + length;
  if (location < v11 && v19 > v11) {
    goto LABEL_14;
  }
  double v17 = 0.0;
  if (v11 != location || v10 <= 0.0)
  {
    double v18 = 0.0;
    goto LABEL_20;
  }
  double v18 = 0.0;
  if (length > 0.0) {
    goto LABEL_14;
  }
LABEL_20:
  double v20 = v9 + v8;
  double v97 = v8;
  double v98 = v11 + v10;
  double v96 = v10;
  if (v9 >= location || v20 <= location)
  {
    double v21 = location + length;
    if (location >= v9 || v21 <= v9)
    {
      double v22 = 0.0;
      if (v9 != location || v8 <= 0.0)
      {
        double v23 = 0.0;
        goto LABEL_34;
      }
      double v23 = 0.0;
      if (length <= 0.0) {
        goto LABEL_34;
      }
    }
  }
  else
  {
    double v21 = location + length;
  }
  if (v9 >= location) {
    double v24 = v9;
  }
  else {
    double v24 = location;
  }
  if (v20 < v21) {
    double v21 = v20;
  }
  double v22 = v24;
  double v23 = v21 - v24;
LABEL_34:
  double v99 = v20;
  v25 = PLLogCommon();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    double v26 = NSString;
    double v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v11];
    uint64_t v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v98];
    v29 = [v26 stringWithFormat:@"Start: %@, End %@", v27, v28];

    uint64_t v30 = NSString;
    id v31 = (void *)MEMORY[0x1E4F1C9C8];
    id v32 = v29;
    double v33 = [v31 dateWithTimeIntervalSince1970:v17];
    __int16 v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v17 + v18];
    uint64_t v35 = [v30 stringWithFormat:@"Start: %@, End %@", v33, v34];

    *(_DWORD *)buf = 138412546;
    v103 = v29;
    __int16 v104 = 2112;
    v105 = v35;
    _os_log_impl(&dword_1E4220000, v25, OS_LOG_TYPE_INFO, "Day: %@ -> %@", buf, 0x16u);
  }
  uint64_t v36 = PLLogCommon();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = NSString;
    uint64_t v38 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v9];
    v39 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v99];
    v40 = [v37 stringWithFormat:@"Start: %@, End %@", v38, v39];

    v41 = NSString;
    v42 = (void *)MEMORY[0x1E4F1C9C8];
    id v43 = v40;
    v44 = [v42 dateWithTimeIntervalSince1970:v22];
    v45 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22 + v23];
    v46 = [v41 stringWithFormat:@"Start: %@, End %@", v44, v45];

    *(_DWORD *)buf = 138412546;
    v103 = v40;
    __int16 v104 = 2112;
    v105 = v46;
    _os_log_impl(&dword_1E4220000, v36, OS_LOG_TYPE_INFO, "xDay: %@ -> %@", buf, 0x16u);
  }
  v47 = [v13 objectForKeyedSubscript:@"PLBatteryUIQueryTypeKey"];

  uint64_t v48 = [v47 intValue];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v49 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__PLBatteryUIService_batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v49;
    if (batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__defaultOnce != -1) {
      dispatch_once(&batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__defaultOnce, block);
    }
    if (batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__classDebugEnabled)
    {
      v50 = objc_msgSend(NSString, "stringWithFormat:", @"queryType=%i", v48);
      v51 = (void *)MEMORY[0x1E4F929B8];
      v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
      int v53 = [v52 lastPathComponent];
      id v54 = [NSString stringWithUTF8String:"-[PLBatteryUIService batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:]"];
      [v51 logMessage:v50 fromFile:v53 fromFunction:v54 fromLineNumber:296];

      v55 = PLLogCommon();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v56 = [MEMORY[0x1E4F1CA60] dictionary];
  v57 = PLLogCommon();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v57, OS_LOG_TYPE_INFO, "Computing last day breakdown", buf, 2u);
  }

  v58 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", v48, v11, v96, location, length, 3600.0);
  [v56 setObject:v58 forKeyedSubscript:@"PLBatteryUIQueryRangeDayKey"];
  BOOL v59 = PLLogCommon();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v59, OS_LOG_TYPE_INFO, "Computing week breakdown", buf, 2u);
  }

  v60 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", v48, v9, v97, location, length, 3600.0);
  [v56 setObject:v60 forKeyedSubscript:@"PLBatteryUIQueryRangeWeekKey"];

  v61 = PLLogCommon();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v61, OS_LOG_TYPE_INFO, "Computing day breakdown for taps", buf, 2u);
  }

  v62 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v98];
  [(PLBatteryBreakdownService *)self totalSumEnergyRatioCutOff];
  uint64_t v64 = -[PLBatteryUIService generateTapBucketsForBucketSize:withNumberOfBuckets:withNowTime:withDrainThreshold:withQueryType:withDataRange:](self, "generateTapBucketsForBucketSize:withNumberOfBuckets:withNowTime:withDrainThreshold:withQueryType:withDataRange:", 3600, 24, v62, v48, v63 / 24.0, location, length);
  [v56 setObject:v64 forKeyedSubscript:@"PLBatteryUIQueryRangeDayTapKey"];

  v65 = PLLogCommon();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v65, OS_LOG_TYPE_INFO, "Computing week breakdown for taps", buf, 2u);
  }

  v66 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v99];
  [(PLBatteryBreakdownService *)self totalSumEnergyRatioCutOff];
  id v67 = -[PLBatteryUIService generateTapBucketsForBucketSize:withNumberOfBuckets:withNowTime:withDrainThreshold:withQueryType:withDataRange:](self, "generateTapBucketsForBucketSize:withNumberOfBuckets:withNowTime:withDrainThreshold:withQueryType:withDataRange:", 86400, 10, v66, v48);
  [v56 setObject:v67 forKeyedSubscript:@"PLBatteryUIQueryRangeWeekTapKey"];

  v68 = PLLogCommon();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v68, OS_LOG_TYPE_INFO, "Computing suggestions", buf, 2u);
  }

  v69 = [v58 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v70 = [(PLBatteryBreakdownService *)self suggestionsWithEnergyEntries:v69];
  [v56 setObject:v70 forKeyedSubscript:@"PLBatteryUISuggestionArrayKey"];

  v71 = (void *)MEMORY[0x1E4F1C9C8];
  v72 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22];
  v73 = [v72 convertFromMonotonicToSystem];
  v74 = [v71 nearestMidnightBeforeDate:v73];

  v75 = (void *)MEMORY[0x1E4F1C9C8];
  v76 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22 + v23];
  v77 = [v76 convertFromMonotonicToSystem];
  v78 = [v75 nearestMidnightAfterDate:v77];

  [v78 timeIntervalSinceDate:v74];
  v79 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
  [v56 setObject:v79 forKeyedSubscript:@"PLBatteryUIDataDurationKey"];

  v80 = PLLogCommon();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:](v80, v81, v82, v83, v84, v85, v86, v87);
  }

  [(PLBatteryBreakdownService *)self clearState];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v88 = objc_opt_class();
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __91__PLBatteryUIService_batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange___block_invoke_123;
    v100[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v100[4] = v88;
    if (batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__defaultOnce_121 != -1) {
      dispatch_once(&batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__defaultOnce_121, v100);
    }
    if (batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__classDebugEnabled_122)
    {
      v89 = [NSString stringWithFormat:@"batteryBreakdown=%@", v56];
      v90 = (void *)MEMORY[0x1E4F929B8];
      v91 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
      v92 = [v91 lastPathComponent];
      v93 = [NSString stringWithUTF8String:"-[PLBatteryUIService batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:]"];
      [v90 logMessage:v89 fromFile:v92 fromFunction:v93 fromLineNumber:343];

      v94 = PLLogCommon();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }

  return v56;
}

uint64_t __91__PLBatteryUIService_batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__classDebugEnabled = result;
  return result;
}

uint64_t __91__PLBatteryUIService_batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange___block_invoke_123(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__classDebugEnabled_122 = result;
  return result;
}

- (id)generateTapBucketsForBucketSize:(int)a3 withNumberOfBuckets:(int)a4 withNowTime:(id)a5 withDrainThreshold:(double)a6 withQueryType:(int)a7 withDataRange:(_PLTimeIntervalRange)a8
{
  double length = a8.length;
  double location = a8.location;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  double v15 = objc_opt_new();
  if (a4 >= 1)
  {
    int v16 = 0;
    int v17 = 0;
    id v32 = v14;
    do
    {
      double v18 = [v14 dateByAddingTimeInterval:(double)v16];
      double v19 = [v18 dateByAddingTimeInterval:(double)-a3];
      id v20 = v18;
      [v19 timeIntervalSince1970];
      double v22 = v21;
      [v20 timeIntervalSince1970];
      double v24 = v23;

      double v25 = v24 - v22;
      double v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        __int16 v34 = NSString;
        double v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22];
        uint64_t v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v22 + v25];
        uint64_t v35 = [v34 stringWithFormat:@"Start: %@, End %@", v33, v28];

        id v14 = v32;
        *(_DWORD *)buf = 67109890;
        int v38 = v17;
        __int16 v39 = 1024;
        int v40 = a4 - 1;
        __int16 v41 = 1024;
        int v42 = a3;
        __int16 v43 = 2112;
        v44 = v35;
        _os_log_debug_impl(&dword_1E4220000, v26, OS_LOG_TYPE_DEBUG, "Generating tap bucket %d (of %d) of size %d with lastTapRange %@", buf, 0x1Eu);
      }
      double v27 = -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:", a7, v22, v25, location, length, 3600.0, a6);
      [v15 addObject:v27];

      ++v17;
      v16 -= a3;
    }
    while (a4 != v17);
  }
  v29 = [v15 reverseObjectEnumerator];
  uint64_t v30 = [v29 allObjects];

  return v30;
}

- (id)modelsWithPayload:(id)a3
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "monotonicDate", a3);
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v4 sinceDate:-604800.0];
  id v6 = v4;
  [v5 timeIntervalSince1970];
  double v8 = v7;
  [v6 timeIntervalSince1970];
  double v10 = v9;

  double v11 = -[PLBatteryUIService dateAndBatteryLevelPointsInRange:](self, "dateAndBatteryLevelPointsInRange:", v8, v10 - v8);
  v38[0] = @"ModelGraphName";
  v38[1] = @"ModelGraphType";
  v39[0] = @"Battery";
  v39[1] = &unk_1F400C010;
  v38[2] = @"ModelGraphArray";
  v39[2] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
  if (v11 && [v11 count])
  {
    uint64_t v35 = v12;
    v36[0] = @"ModelData";
    id v32 = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    v37[0] = v13;
    v36[1] = @"ModelMinDate";
    id v14 = [v11 firstObject];
    double v15 = [v14 objectAtIndexedSubscript:0];
    v37[1] = v15;
    v36[2] = @"ModelMaxDate";
    int v16 = [v11 lastObject];
    int v17 = [v16 objectAtIndexedSubscript:0];
    v37[2] = v17;
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __40__PLBatteryUIService_modelsWithPayload___block_invoke_158;
      v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v33[4] = v19;
      if (modelsWithPayload__defaultOnce_156 != -1) {
        dispatch_once(&modelsWithPayload__defaultOnce_156, v33);
      }
      double v12 = v32;
      if (modelsWithPayload__classDebugEnabled_157)
      {
        id v20 = [NSString stringWithFormat:@"models=%@", v18];
        double v21 = (void *)MEMORY[0x1E4F929B8];
        double v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
        double v23 = [v22 lastPathComponent];
        double v24 = [NSString stringWithUTF8String:"-[PLBatteryUIService modelsWithPayload:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:392];

        double v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
LABEL_16:
      }
    }
    else
    {
      double v12 = v32;
    }
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__PLBatteryUIService_modelsWithPayload___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v26;
      if (modelsWithPayload__defaultOnce != -1) {
        dispatch_once(&modelsWithPayload__defaultOnce, block);
      }
      if (modelsWithPayload__classDebugEnabled)
      {
        id v20 = [NSString stringWithFormat:@"dateAndBatteryLevelPoints is nil or empty!"];
        double v27 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
        v29 = [v28 lastPathComponent];
        uint64_t v30 = [NSString stringWithUTF8String:"-[PLBatteryUIService modelsWithPayload:]"];
        [v27 logMessage:v20 fromFile:v29 fromFunction:v30 fromLineNumber:383];

        double v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        double v18 = 0;
        goto LABEL_16;
      }
    }
    double v18 = 0;
  }

  return v18;
}

uint64_t __40__PLBatteryUIService_modelsWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelsWithPayload__classDebugEnabled = result;
  return result;
}

uint64_t __40__PLBatteryUIService_modelsWithPayload___block_invoke_158(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelsWithPayload__classDebugEnabled_157 = result;
  return result;
}

- (id)dateAndBatteryLevelPointsInRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (dateAndBatteryLevelPointsInRange__onceToken != -1) {
    dispatch_once(&dateAndBatteryLevelPointsInRange__onceToken, &__block_literal_global_2);
  }
  id v6 = [(PLOperator *)self storage];
  double v7 = objc_msgSend(v6, "entriesForKey:inTimeRange:withFilters:", dateAndBatteryLevelPointsInRange__batteryUIEntryKey, 0, location, length);

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (dateAndBatteryLevelPointsInRange__defaultOnce != -1) {
      dispatch_once(&dateAndBatteryLevelPointsInRange__defaultOnce, block);
    }
    if (dateAndBatteryLevelPointsInRange__classDebugEnabled)
    {
      double v9 = [NSString stringWithFormat:@"batteryEntries=%@", v7];
      double v10 = (void *)MEMORY[0x1E4F929B8];
      double v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
      double v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLBatteryUIService dateAndBatteryLevelPointsInRange:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:408];

      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  double v15 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v7;
  uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        double v21 = [v20 entryDate];
        double v22 = [v21 convertFromMonotonicToSystem];
        v40[0] = v22;
        double v23 = [v20 objectForKeyedSubscript:@"Level"];
        v40[1] = v23;
        double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];

        [v15 addObject:v24];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v17);
  }

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v25 = objc_opt_class();
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke_171;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = v25;
    if (dateAndBatteryLevelPointsInRange__defaultOnce_169 != -1) {
      dispatch_once(&dateAndBatteryLevelPointsInRange__defaultOnce_169, v34);
    }
    if (dateAndBatteryLevelPointsInRange__classDebugEnabled_170)
    {
      uint64_t v26 = [NSString stringWithFormat:@"dateAndBatteryLevelPoints=%@", v15];
      double v27 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
      v29 = [v28 lastPathComponent];
      uint64_t v30 = [NSString stringWithUTF8String:"-[PLBatteryUIService dateAndBatteryLevelPointsInRange:]"];
      [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:418];

      id v31 = PLLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }

  return v15;
}

uint64_t __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke()
{
  dateAndBatteryLevelPointsInRange__batteryUIEntryKey = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BatteryUI"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  dateAndBatteryLevelPointsInRange__classDebugEnabled = result;
  return result;
}

uint64_t __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke_171(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  dateAndBatteryLevelPointsInRange__classDebugEnabled_170 = result;
  return result;
}

- (void)incrementAggdKey
{
}

- (void)testUIQuery
{
  v3 = objc_opt_new();
  [v3 setObject:&unk_1F400C028 forKeyedSubscript:@"PLBatteryUIQueryTypeKey"];
  id v4 = [(PLBatteryUIService *)self batteryBreakdownAndGraphWithPayload:v3];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __33__PLBatteryUIService_testUIQuery__block_invoke;
    double v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (testUIQuery_defaultOnce != -1) {
      dispatch_once(&testUIQuery_defaultOnce, &block);
    }
    if (testUIQuery_classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"Response %@", v4, block, v13, v14, v15, v16];
      double v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m"];
      double v9 = [v8 lastPathComponent];
      double v10 = [NSString stringWithUTF8String:"-[PLBatteryUIService testUIQuery]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:482];

      double v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __33__PLBatteryUIService_testUIQuery__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  testUIQuery_classDebugEnabled = result;
  return result;
}

- (BOOL)demoMode
{
  if (demoMode_onceToken != -1) {
    dispatch_once(&demoMode_onceToken, &__block_literal_global_184_0);
  }
  objc_super v2 = (void *)demoMode_val;
  if (demoMode_val)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

uint64_t __30__PLBatteryUIService_demoMode__block_invoke()
{
  +[PLUtilities containerPath];
  demoMode_val = _CFPreferencesCopyValueWithContainer();
  return MEMORY[0x1F41817F8]();
}

- (id)demoModePath
{
  if (demoModePath_onceToken != -1) {
    dispatch_once(&demoModePath_onceToken, &__block_literal_global_192);
  }
  if (demoModePath_val)
  {
    objc_super v2 = PLLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      [(PLBatteryUIService *)v2 demoModePath];
    }

    double v10 = (__CFString *)(id)demoModePath_val;
  }
  else
  {
    double v10 = @"/var/mobile/bui_demo.plist";
  }
  return v10;
}

uint64_t __34__PLBatteryUIService_demoModePath__block_invoke()
{
  +[PLUtilities containerPath];
  demoModePath_val = _CFPreferencesCopyValueWithContainer();
  return MEMORY[0x1F41817F8]();
}

- (BOOL)writeOutputDemo
{
  if (writeOutputDemo_onceToken != -1) {
    dispatch_once(&writeOutputDemo_onceToken, &__block_literal_global_200);
  }
  objc_super v2 = (void *)writeOutputDemo_val;
  if (writeOutputDemo_val)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

uint64_t __37__PLBatteryUIService_writeOutputDemo__block_invoke()
{
  +[PLUtilities containerPath];
  writeOutputDemo_val = _CFPreferencesCopyValueWithContainer();
  return MEMORY[0x1F41817F8]();
}

- (id)getLastChargeData
{
  v18[2] = *MEMORY[0x1E4F143B8];
  +[PLUtilities containerPath];
  objc_super v2 = (void *)_CFPreferencesCopyValueWithContainer();
  +[PLUtilities containerPath];
  uint64_t v3 = (void *)_CFPreferencesCopyValueWithContainer();
  uint64_t v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryUIService getLastChargeData]();
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
    [v3 doubleValue];
    uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
    int v9 = [v2 intValue];
    if (v9 >= 100) {
      int v10 = 100;
    }
    else {
      int v10 = v9;
    }
    if (v10 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    v17[0] = @"PLBatteryUITimestampKey";
    double v12 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v13 = [v8 convertFromMonotonicToSystem];
    [v13 timeIntervalSince1970];
    id v14 = objc_msgSend(v12, "numberWithDouble:");
    v17[1] = @"PLBatteryUILevelKey";
    v18[0] = v14;
    double v15 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
    v18[1] = v15;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  return v6;
}

- (id)getLPMIntervalsSpanningRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  v60[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService getLPMIntervalsSpanningRange:].cold.5();
  }

  id v50 = (id)objc_opt_new();
  id v7 = objc_alloc(MEMORY[0x1E4F92A90]);
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:location];
  uint64_t v9 = [v7 initWithKey:@"timestamp" withValue:v8 withComparisonOperation:5];

  int v10 = [(PLOperator *)self storage];
  uint64_t v49 = (void *)v9;
  v60[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
  double v12 = [v10 lastEntryForKey:@"PLDuetService_EventForward_BatterySaverMode" withComparisons:v11 isSingleton:0];

  if (!v12) {
    goto LABEL_8;
  }
  uint64_t v13 = [v12 objectForKeyedSubscript:@"Value"];
  uint64_t v14 = [v13 BOOLValue];

  double v15 = PLLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService getLPMIntervalsSpanningRange:].cold.4(v14, v15, v16, v17, v18, v19, v20, v21);
  }

  if (v14)
  {
    double v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:location];
    char v23 = 1;
  }
  else
  {
LABEL_8:
    double v22 = 0;
    char v23 = 0;
  }
  uint64_t v48 = v12;
  double v24 = [(PLOperator *)self storage];
  uint64_t v25 = objc_msgSend(v24, "entriesForKey:inTimeRange:withFilters:", @"PLDuetService_EventForward_BatterySaverMode", 0, location, length);

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v47 = v25;
  uint64_t v26 = [v25 reverseObjectEnumerator];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v32 = [v31 objectForKeyedSubscript:@"Value"];
        int v33 = [v32 BOOLValue];

        __int16 v34 = PLLogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109378;
          LODWORD(v58[0]) = v33;
          WORD2(v58[0]) = 2112;
          *(void *)((char *)v58 + 6) = v31;
          _os_log_debug_impl(&dword_1E4220000, v34, OS_LOG_TYPE_DEBUG, "LPM Entry: %d %@", buf, 0x12u);
        }

        if ((v23 & 1) == v33)
        {
          long long v35 = PLLogCommon();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
            [(PLBatteryUIService *)&v51 getLPMIntervalsSpanningRange:v35];
          }
        }
        else if (v33)
        {
          [v31 entryDate];
          long long v35 = v22;
          v22 = char v23 = 1;
        }
        else
        {
          id v36 = objc_alloc(MEMORY[0x1E4F28C18]);
          long long v37 = [v31 entryDate];
          long long v35 = [v36 initWithStartDate:v22 endDate:v37];

          [v50 addObject:v35];
          long long v38 = PLLogCommon();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v58[0] = v35;
            _os_log_debug_impl(&dword_1E4220000, v38, OS_LOG_TYPE_DEBUG, "Created LPM interval %@", buf, 0xCu);
          }

          double v22 = 0;
          char v23 = 0;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v28);
  }

  if (v23)
  {
    __int16 v39 = PLLogCommon();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getLPMIntervalsSpanningRange:]();
    }

    id v40 = objc_alloc(MEMORY[0x1E4F28C18]);
    __int16 v41 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:location + length];
    uint64_t v42 = (void *)[v40 initWithStartDate:v22 endDate:v41];

    [v50 addObject:v42];
    __int16 v43 = PLLogCommon();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService getLPMIntervalsSpanningRange:]();
    }
  }
  v44 = PLLogCommon();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v58[0] = v50;
    _os_log_impl(&dword_1E4220000, v44, OS_LOG_TYPE_INFO, "LPM intervals: %@", buf, 0xCu);
  }

  id v45 = v50;
  return v45;
}

- (BOOL)dateIntervals:(id)a3 containDate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  LOBYTE(v8) = 0;
  if (v5 && v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = v5;
    uint64_t v8 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "containsDate:", v7, (void)v13))
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v8;
}

- (id)batteryLevelsAndChargingIntervalsInRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4
{
  double length = a3.length;
  double location = a3.location;
  v173[2] = *MEMORY[0x1E4F143B8];
  double v6 = a3.location + a3.length;
  if (location < a4.location && v6 > a4.location)
  {
    double v11 = a4.location + a4.length;
LABEL_14:
    if (location >= a4.location) {
      double v9 = location;
    }
    else {
      double v9 = a4.location;
    }
    if (v6 >= v11) {
      double v6 = v11;
    }
    double v10 = v6 - v9;
    goto LABEL_20;
  }
  double v11 = a4.location + a4.length;
  if (a4.location < location && v11 > location) {
    goto LABEL_14;
  }
  double v9 = 0.0;
  if (location == a4.location && length > 0.0)
  {
    double v10 = 0.0;
    if (a4.length > 0.0) {
      goto LABEL_14;
    }
  }
  else
  {
    double v10 = 0.0;
  }
LABEL_20:
  v149 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", location, v11);
  double v12 = PLLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v12, OS_LOG_TYPE_INFO, "Creating battery points and charging intervals", buf, 2u);
  }

  uint64_t v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BatteryUI"];
  uint64_t v14 = objc_opt_new();
  v145 = objc_opt_new();
  id v15 = objc_alloc(MEMORY[0x1E4F92A90]);
  long long v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:location];
  uint64_t v17 = [v15 initWithKey:@"timestamp" withValue:v16 withComparisonOperation:5];

  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"Level" withValue:&unk_1F400C028 withComparisonOperation:3];
  uint64_t v19 = [(PLOperator *)self storage];
  v137 = (void *)v18;
  v138 = (void *)v17;
  v173[0] = v17;
  v173[1] = v18;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:2];
  v139 = (void *)v13;
  uint64_t v21 = [v19 lastEntryForKey:v13 withComparisons:v20 isSingleton:0];

  v136 = v21;
  if (v21)
  {
    double v22 = [v21 objectForKeyedSubscript:@"IsCharging"];
    uint64_t v23 = [v22 BOOLValue];

    double v24 = PLLogCommon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.6(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  v152 = -[PLBatteryUIService getLPMIntervalsSpanningRange:](self, "getLPMIntervalsSpanningRange:", location, length);
  id v31 = [(PLOperator *)self storage];
  id v32 = objc_msgSend(v31, "entriesForKey:inTimeRange:withFilters:", v13, 0, v9, v10);

  int v33 = PLLogCommon();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.5(v32, v23, v33);
  }

  if ((unint64_t)[v32 count] >= 0x121)
  {
    __int16 v34 = PLLogCommon();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v166 = 0x4072C00000000000;
      _os_log_impl(&dword_1E4220000, v34, OS_LOG_TYPE_INFO, "More battery point entries than expected, has PLBatteryAgent_RateLimiterBatteryUI been set to less than default %.f s?", buf, 0xCu);
    }

    if ((unint64_t)[v32 count] >= 0x10E1)
    {
      long long v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4220000, v35, OS_LOG_TYPE_INFO, "More battery point entries than possible given 20s battery tick rate limit, double check query ranges", buf, 2u);
      }
    }
  }
  v147 = (void *)v14;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  v140 = v32;
  id v36 = [v32 reverseObjectEnumerator];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v158 objects:v172 count:16];
  if (!v37)
  {
    double v40 = 0.0;
    goto LABEL_55;
  }
  uint64_t v38 = v37;
  uint64_t v39 = *(void *)v159;
  double v40 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v38; ++i)
    {
      if (*(void *)v159 != v39) {
        objc_enumerationMutation(v36);
      }
      uint64_t v42 = *(void **)(*((void *)&v158 + 1) + 8 * i);
      __int16 v43 = [v42 objectForKeyedSubscript:@"Level"];
      int v44 = [v43 intValue];

      if (v44 < 0)
      {
        v47 = PLLogCommon();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
          -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.4((uint64_t)v171, (uint64_t)v42);
        }
      }
      else
      {
        id v45 = [v42 objectForKeyedSubscript:@"IsCharging"];
        int v46 = [v45 BOOLValue];

        if ((v23 & 1) == v46) {
          continue;
        }
        if (v46)
        {
          v47 = [v42 entryDate];
          [v47 timeIntervalSinceDate:v149];
          double v40 = v48;
          LOBYTE(v23) = 1;
        }
        else
        {
          uint64_t v49 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v40];
          v170[0] = v49;
          id v50 = (void *)MEMORY[0x1E4F28ED0];
          uint8_t v51 = [v42 entryDate];
          [v51 timeIntervalSinceDate:v149];
          long long v53 = [v50 numberWithInt:(int)v52];
          v170[1] = v53;
          v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:2];

          long long v54 = PLLogCommon();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            long long v55 = [v47 objectAtIndexedSubscript:0];
            long long v56 = [v47 objectAtIndexedSubscript:1];
            *(_DWORD *)buf = 138412546;
            *(void *)v166 = v55;
            *(_WORD *)&v166[8] = 2112;
            *(void *)&v166[10] = v56;
            _os_log_debug_impl(&dword_1E4220000, v54, OS_LOG_TYPE_DEBUG, "Created charging interval: [%@ %@]", buf, 0x16u);
          }
          [v145 addObject:v47];
          LOBYTE(v23) = 0;
        }
      }
    }
    uint64_t v38 = [v36 countByEnumeratingWithState:&v158 objects:v172 count:16];
  }
  while (v38);
LABEL_55:

  v57 = v140;
  if (v23)
  {
    v58 = [v140 firstObject];
    BOOL v59 = v58;
    if (v58)
    {
      v60 = [v58 entryDate];
      [v60 timeIntervalSinceDate:v149];
      double v62 = v61;

      double v63 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v40];
      v169[0] = v63;
      uint64_t v64 = [MEMORY[0x1E4F28ED0] numberWithInt:(int)v62];
      v169[1] = v64;
      v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:2];

      v66 = PLLogCommon();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:](v65);
      }

      [v145 addObject:v65];
    }
  }
  id v67 = v149;
  v68 = PLLogCommon();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:](v68, v69, v70, v71, v72, v73, v74, v75);
  }

  if ([MEMORY[0x1E4F92A38] isiPad]) {
    int v76 = 10;
  }
  else {
    int v76 = 20;
  }
  int v148 = v76;
  int v143 = -1;
  int v144 = 0;
  int v146 = -1;
  v135 = v67;
  do
  {
    id v77 = v67;
    [v67 timeIntervalSince1970];
    double v79 = v78;
    v80 = PLLogCommon();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      v129 = NSString;
      v130 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v79];
      v131 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v79 + 900.0];
      v132 = [v129 stringWithFormat:@"Start: %@, End %@", v130, v131, v135, v136];

      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v166 = v144;
      *(_WORD *)&v166[4] = 2112;
      *(void *)&v166[6] = v132;
      _os_log_debug_impl(&dword_1E4220000, v80, OS_LOG_TYPE_DEBUG, "Calculating battery entries for bucket %d in range %@", buf, 0x12u);
    }
    uint64_t v81 = -[PLBatteryUIService entriesInRange:fromEntries:](self, "entriesInRange:fromEntries:", v57, v79, 900.0);
    uint64_t v82 = PLLogCommon();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:]((uint64_t)v168, (uint64_t)v81);
    }

    v141 = v81;
    v142 = v77;
    if ([v81 count])
    {
      v150 = objc_opt_new();
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      id v83 = v81;
      uint64_t v84 = [v83 countByEnumeratingWithState:&v154 objects:v167 count:16];
      if (v84)
      {
        uint64_t v85 = v84;
        uint64_t v86 = 0;
        uint64_t v87 = *(void *)v155;
        do
        {
          for (uint64_t j = 0; j != v85; ++j)
          {
            if (*(void *)v155 != v87) {
              objc_enumerationMutation(v83);
            }
            v89 = *(void **)(*((void *)&v154 + 1) + 8 * j);
            v90 = [v89 objectForKeyedSubscript:@"Level"];
            int v91 = [v90 intValue];

            if ((v91 & 0x80000000) == 0)
            {
              v92 = [v89 entryDate];
              BOOL v93 = [(PLBatteryUIService *)self dateIntervals:v152 containDate:v92];

              v94 = [v89 objectForKeyedSubscript:@"IsCharging"];
              int v95 = [v94 BOOLValue];

              double v96 = [v89 objectForKeyedSubscript:@"Level"];

              if (v96)
              {
                double v97 = [v89 objectForKeyedSubscript:@"Level"];
                [v150 addObject:v97];

                double v98 = [v89 objectForKeyedSubscript:@"Level"];
                BOOL v99 = (int)[v98 intValue] <= v148;

                uint64_t v100 = v86 | 8;
                if (!v95) {
                  uint64_t v100 = v86;
                }
                if (v93) {
                  v100 |= 4uLL;
                }
                uint64_t v101 = v100 | 2;
                BOOL v102 = !v99;
              }
              else
              {
                uint64_t v103 = 9;
                if (!v95) {
                  uint64_t v103 = 1;
                }
                uint64_t v100 = v103 | v86;
                uint64_t v101 = v100 | 4;
                BOOL v102 = !v93;
              }
              if (v102) {
                uint64_t v86 = v100;
              }
              else {
                uint64_t v86 = v101;
              }
            }
          }
          uint64_t v85 = [v83 countByEnumeratingWithState:&v154 objects:v167 count:16];
        }
        while (v85);
      }
      else
      {
        uint64_t v86 = 0;
      }

      if ([v150 count])
      {
        __int16 v104 = [v150 valueForKeyPath:@"@avg.self"];
      }
      else
      {
        __int16 v104 = &unk_1F400C040;
      }
      if ((int)[v104 intValue] >= 101)
      {

        __int16 v104 = &unk_1F400C058;
      }
      if (([v104 intValue] & 0x80000000) != 0)
      {

        __int16 v104 = &unk_1F400C028;
      }
    }
    else
    {
      uint64_t v86 = 1;
      __int16 v104 = &unk_1F400C040;
    }
    v105 = PLLogCommon();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v166 = v144;
      *(_WORD *)&v166[4] = 2112;
      *(void *)&v166[6] = v104;
      *(_WORD *)&v166[14] = 2048;
      *(void *)&v166[16] = v86;
      _os_log_debug_impl(&dword_1E4220000, v105, OS_LOG_TYPE_DEBUG, "i:%d, %@, %lu", buf, 0x1Cu);
    }
    v151 = v104;

    unint64_t v106 = 0x1E4F28000;
    unint64_t v107 = 0x1E4F1C000;
    if ((v86 & 1) == 0 && v146 != -1 && (v144 - v146 - 2) <= 3)
    {
      v108 = [v147 objectAtIndexedSubscript:v146];
      v109 = [v108 objectAtIndexedSubscript:0];
      [v109 doubleValue];
      double v111 = v110;

      [v151 doubleValue];
      double v113 = v112;
      unint64_t v107 = 0x1E4F1C000uLL;
      v114 = [v147 objectAtIndexedSubscript:v146];
      v115 = [v114 objectAtIndexedSubscript:1];
      int v116 = [v115 intValue];

      unint64_t v106 = 0x1E4F28000uLL;
      if (v146 + 1 < v144)
      {
        uint64_t v117 = 0;
        uint64_t v118 = v86 & v116;
        double v119 = (v113 - v111) / (double)(v144 - v146);
        do
        {
          uint64_t v120 = v146 + 1 + v117++;
          v121 = [MEMORY[0x1E4F28ED0] numberWithDouble:floor(v111 + v119 * (double)(int)v117)];
          v164[0] = v121;
          v122 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v118];
          v164[1] = v122;
          v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:2];

          unint64_t v106 = 0x1E4F28000uLL;
          [v147 setObject:v123 atIndexedSubscript:v120];

          unint64_t v107 = 0x1E4F1C000uLL;
        }
        while (v143 - v146 != v117);
      }
    }
    int v124 = v144;
    if (v86) {
      int v125 = v146;
    }
    else {
      int v125 = v144;
    }
    int v146 = v125;
    v126 = objc_msgSend(*(id *)(v106 + 3792), "numberWithInt:", objc_msgSend(v151, "intValue"));
    v163[0] = v126;
    v127 = [*(id *)(v106 + 3792) numberWithUnsignedInteger:v86];
    v163[1] = v127;
    v128 = [*(id *)(v107 + 2424) arrayWithObjects:v163 count:2];

    [v147 addObject:v128];
    id v67 = [v142 dateByAddingTimeInterval:900.0];

    ++v143;
    ++v144;
    v57 = v140;
  }
  while (v124 != 95);
  v162[0] = v147;
  v162[1] = v145;
  v133 = [*(id *)(v107 + 2424) arrayWithObjects:v162 count:2];

  return v133;
}

- (id)screenTimeInRange:(_PLTimeIntervalRange)a3 withBucketSize:(double)a4 withNumBuckets:(int)a5 withDataRange:(_PLTimeIntervalRange)a6 withQueryType:(int)a7 andBatteryBreakdown:(id)a8
{
  double length = a6.length;
  double location = a6.location;
  double v12 = a3.length;
  double v13 = a3.location;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v96 = a8;
  double v15 = v13 + -1800.0;
  double v16 = location + length;
  if (location >= v13 + -1800.0 || v16 <= v15)
  {
    double v21 = v12 + v15;
    if (v15 >= location || v21 <= location)
    {
      double v19 = 0.0;
      if (location != v15 || length <= 0.0)
      {
        double v20 = 0.0;
        goto LABEL_20;
      }
      double v20 = 0.0;
      if (v12 <= 0.0) {
        goto LABEL_20;
      }
    }
  }
  else
  {
    double v21 = v12 + v15;
  }
  if (location >= v15) {
    double v19 = location;
  }
  else {
    double v19 = v15;
  }
  if (v16 >= v21) {
    double v16 = v21;
  }
  double v20 = v16 - v19;
LABEL_20:
  uint64_t v22 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20], @"UsageTime", v16, v21 andName];
  uint64_t v23 = [(PLOperator *)self storage];
  BOOL v93 = (void *)v22;
  BOOL v99 = objc_msgSend(v23, "entriesForKey:inTimeRange:withFilters:", v22, 0, v19, v20);

  double v24 = PLLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v24, OS_LOG_TYPE_INFO, "Creating screen times", buf, 2u);
  }

  uint64_t v100 = objc_opt_new();
  double v98 = objc_opt_new();
  uint64_t v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v12 + v15];
  if (a5 < 1)
  {
    uint64_t v27 = 0;
    LODWORD(v26) = 0;
    int v104 = 0;
  }
  else
  {
    uint64_t v106 = 0;
    int v104 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v97 = a5;
    v94 = self;
    do
    {
      uint64_t v28 = [v25 dateByAddingTimeInterval:-a4];
      id v29 = v25;
      [v28 timeIntervalSince1970];
      double v31 = v30;
      [v29 timeIntervalSince1970];
      double v33 = v32;

      double v34 = v33 - v31;
      long long v35 = -[PLBatteryUIService entriesInRange:fromEntries:](self, "entriesInRange:fromEntries:", v99, v31, v34);
      id v36 = PLLogCommon();
      v105 = v35;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        id v67 = NSString;
        v68 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v31];
        [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v31 + v34];
        uint64_t v70 = v69 = v26;
        uint64_t v71 = [v67 stringWithFormat:@"Start: %@, End %@", v68, v70];

        uint64_t v26 = v69;
        long long v35 = v105;

        uint64_t v72 = [v105 count];
        *(_DWORD *)buf = 67109634;
        int v119 = v106;
        __int16 v120 = 2112;
        *(void *)v121 = v71;
        *(_WORD *)&v121[8] = 2048;
        uint64_t v122 = v72;
        _os_log_debug_impl(&dword_1E4220000, v36, OS_LOG_TYPE_DEBUG, "Bucket %d range: %@ with %lu entries in range", buf, 0x1Cu);
      }
      uint64_t v37 = [v35 count];
      uint64_t v38 = PLLogCommon();
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
      if (v37)
      {
        if (v39)
        {
          *(_DWORD *)buf = 67109632;
          int v119 = v106;
          __int16 v120 = 1024;
          *(_DWORD *)v121 = 0;
          *(_WORD *)&v121[4] = 1024;
          *(_DWORD *)&v121[6] = 0;
          _os_log_debug_impl(&dword_1E4220000, v38, OS_LOG_TYPE_DEBUG, "Start of bucket %d On:%d Off:%d", buf, 0x14u);
        }
        id v101 = v29;
        int v102 = v27;
        int v103 = v26;

        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id v40 = v35;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v108 objects:v117 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          int v43 = 0;
          int v44 = 0;
          uint64_t v45 = *(void *)v109;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v109 != v45) {
                objc_enumerationMutation(v40);
              }
              v47 = *(void **)(*((void *)&v108 + 1) + 8 * i);
              double v48 = [v47 objectForKeyedSubscript:@"ScreenOn"];
              if (v48)
              {
                uint64_t v49 = [v47 objectForKeyedSubscript:@"ScreenOn"];
                v44 += [v49 intValue];
              }
              id v50 = [v47 objectForKeyedSubscript:@"ScreenOff"];
              if (v50)
              {
                uint8_t v51 = [v47 objectForKeyedSubscript:@"ScreenOff"];
                v43 += [v51 intValue];
              }
              int v52 = v43 + v44;
              long long v53 = PLLogCommon();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109888;
                int v119 = v106;
                __int16 v120 = 1024;
                *(_DWORD *)v121 = v44;
                *(_WORD *)&v121[4] = 1024;
                *(_DWORD *)&v121[6] = v43;
                LOWORD(v122) = 1024;
                *(_DWORD *)((char *)&v122 + 2) = v43 + v44;
                _os_log_debug_impl(&dword_1E4220000, v53, OS_LOG_TYPE_DEBUG, "Bucket %d On:%d Off:%d Total:%d", buf, 0x1Au);
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v108 objects:v117 count:16];
          }
          while (v42);
        }
        else
        {
          int v43 = 0;
          int v52 = 0;
          int v44 = 0;
        }

        double v54 = (double)v52;
        if ((double)v52 <= a4)
        {
          self = v94;
          int v56 = v103;
        }
        else
        {
          int v44 = (int)((double)v44 * a4 / v54);
          int v43 = (int)((double)v43 * a4 / v54);
          long long v55 = PLLogCommon();
          self = v94;
          int v56 = v103;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109376;
            int v119 = v44;
            __int16 v120 = 1024;
            *(_DWORD *)v121 = v43;
            _os_log_debug_impl(&dword_1E4220000, v55, OS_LOG_TYPE_DEBUG, "Normalized On:%d Off:%d", buf, 0xEu);
          }
        }
        v104 += v44;
        uint64_t v26 = (v43 + v56);
        v57 = [v96 objectForKeyedSubscript:@"PLBatteryUIQueryRangeDayTapKey"];
        v58 = [v57 objectAtIndexedSubscript:23 - v106];
        BOOL v59 = [v58 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];

        [(PLBatteryUIService *)self adjustScreenOnTimeSecsWithGraphValue:a7 queryType:v59 andBreakdownEntries:(double)v44];
        uint64_t v61 = (int)v60;
        [(PLBatteryUIService *)self adjustScreenOffTimeSecsWithGraphValue:a7 withGraphScreenOnSecs:v59 queryType:(double)v43 andBreakdownEntries:(double)(int)v61];
        uint64_t v63 = (int)v62;
        uint64_t v64 = [MEMORY[0x1E4F28ED0] numberWithInt:v61];
        [v100 addObject:v64];

        v65 = [MEMORY[0x1E4F28ED0] numberWithInt:v63];
        [v98 addObject:v65];

        v66 = PLLogCommon();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109632;
          int v119 = v106;
          __int16 v120 = 1024;
          *(_DWORD *)v121 = v104;
          *(_WORD *)&v121[4] = 1024;
          *(_DWORD *)&v121[6] = v26;
          _os_log_debug_impl(&dword_1E4220000, v66, OS_LOG_TYPE_DEBUG, "Bucket %d Totals so far on:%d off:%d", buf, 0x14u);
        }
        uint64_t v27 = (v102 + 1);

        id v29 = v101;
      }
      else
      {
        if (v39)
        {
          *(_DWORD *)buf = 67109632;
          int v119 = v106;
          __int16 v120 = 1024;
          *(_DWORD *)v121 = v104;
          *(_WORD *)&v121[4] = 1024;
          *(_DWORD *)&v121[6] = v26;
          _os_log_debug_impl(&dword_1E4220000, v38, OS_LOG_TYPE_DEBUG, "Not enough info in bucket %d, total on:%d off:%d", buf, 0x14u);
        }

        [v100 addObject:&unk_1F400C040];
        [v98 addObject:&unk_1F400C040];
      }
      uint64_t v25 = [v29 dateByAddingTimeInterval:-a4];

      ++v106;
    }
    while (v106 != v97);
  }
  ADClientSetValueForScalarKey();
  uint64_t v73 = objc_opt_new();
  [v73 setObject:@"24hr" forKeyedSubscript:@"duration"];
  uint64_t v74 = [MEMORY[0x1E4F28ED0] numberWithInt:v27];
  [v73 setObject:v74 forKeyedSubscript:@"numBuckets"];

  id v107 = v73;
  AnalyticsSendEventLazy();
  uint64_t v75 = PLLogCommon();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v119 = v27;
    _os_log_impl(&dword_1E4220000, v75, OS_LOG_TYPE_INFO, "Total screen buckets with info: %d", buf, 8u);
  }

  int v76 = PLLogCommon();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService screenTimeInRange:withBucketSize:withNumBuckets:withDataRange:withQueryType:andBatteryBreakdown:]();
  }

  id v77 = [v96 objectForKeyedSubscript:@"PLBatteryUIQueryRangeDayKey"];
  double v78 = [v77 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];

  [(PLBatteryUIService *)self adjustScreenOnTimeSecsWithGraphValue:a7 queryType:v78 andBreakdownEntries:(double)v104];
  uint64_t v80 = (int)v79;
  [(PLBatteryUIService *)self adjustScreenOffTimeSecsWithGraphValue:a7 withGraphScreenOnSecs:v78 queryType:(double)(int)v26 andBreakdownEntries:(double)(int)v80];
  uint64_t v82 = (int)v81;
  v115[0] = @"PLBatteryUIGraphHourly";
  id v83 = [v100 reverseObjectEnumerator];
  uint64_t v84 = [v83 allObjects];
  v115[1] = @"PLBatteryUIGraphTotal";
  v116[0] = v84;
  uint64_t v85 = [MEMORY[0x1E4F28ED0] numberWithInt:v80];
  v116[1] = v85;
  uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];

  v113[0] = @"PLBatteryUIGraphHourly";
  uint64_t v87 = [v98 reverseObjectEnumerator];
  uint64_t v88 = [v87 allObjects];
  v113[1] = @"PLBatteryUIGraphTotal";
  v114[0] = v88;
  v89 = [MEMORY[0x1E4F28ED0] numberWithInt:v82];
  v114[1] = v89;
  v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];

  v112[0] = v86;
  v112[1] = v90;
  int v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:2];

  return v91;
}

id __118__PLBatteryUIService_screenTimeInRange_withBucketSize_withNumBuckets_withDataRange_withQueryType_andBatteryBreakdown___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    double v12 = location + length;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "entryDate", (void)v21);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          double v16 = v15;
          [v15 timeIntervalSince1970];
          double v18 = v17;

          if (location <= v18 && v18 < v12) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)lastXDaysWithRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4 withQueryType:(int)a5 andBatteryBreakdown:(id)a6
{
  double length = a4.length;
  double location = a4.location;
  double v8 = a3.length;
  double v9 = a3.location;
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v93 = a6;
  double v10 = v9 + -1800.0;
  double v11 = v8 + v9 + -1800.0;
  BOOL v12 = v10 >= location || v11 <= location;
  if (!v12)
  {
    double v16 = location + length;
LABEL_16:
    if (v10 >= location) {
      double v14 = v10;
    }
    else {
      double v14 = location;
    }
    if (v11 >= v16) {
      double v17 = v16;
    }
    else {
      double v17 = v11;
    }
    double v15 = v17 - v14;
    goto LABEL_23;
  }
  double v16 = location + length;
  if (location < v10 && v16 > v10) {
    goto LABEL_16;
  }
  double v14 = 0.0;
  if (v10 != location || v8 <= 0.0)
  {
    double v15 = 0.0;
    goto LABEL_23;
  }
  BOOL v12 = length <= 0.0;
  double v15 = 0.0;
  if (!v12) {
    goto LABEL_16;
  }
LABEL_23:
  uint64_t v18 = *MEMORY[0x1E4F92D20];
  double v19 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UILevel"];
  double v20 = [(PLOperator *)self storage];
  int v95 = objc_msgSend(v20, "entriesForKey:inTimeRange:withFilters:", v19, 0, v14, v15);

  uint64_t v21 = +[PLOperator entryKeyForType:v18 andName:@"UsageTime"];
  long long v22 = [(PLOperator *)self storage];
  v90 = (void *)v21;
  v94 = objc_msgSend(v22, "entriesForKey:inTimeRange:withFilters:", v21, 0, v14, v15);

  long long v23 = PLLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v23, OS_LOG_TYPE_INFO, "Computing lastX days data", buf, 2u);
  }

  long long v24 = PLLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:](v94, v95);
  }

  v92 = objc_opt_new();
  uint64_t v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v11];
  uint64_t v26 = PLLogCommon();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUIService lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:]();
  }

  uint64_t v100 = 0;
  uint64_t v27 = 0;
  do
  {
    uint64_t v28 = [v25 dateByAddingTimeInterval:-86400.0];
    id v29 = v25;
    [v28 timeIntervalSince1970];
    double v31 = v30;
    [v29 timeIntervalSince1970];
    double v33 = v32;
    double v98 = v29;

    double v34 = v33 - v31;
    long long v35 = PLLogCommon();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      double v81 = NSString;
      uint64_t v82 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v31];
      id v83 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v31 + v34];
      uint64_t v84 = [v81 stringWithFormat:@"Start: %@, End %@", v82, v83];

      *(_DWORD *)buf = 67109378;
      *(_DWORD *)__int16 v120 = v100;
      *(_WORD *)&v120[4] = 2112;
      *(void *)&v120[6] = v84;
      _os_log_debug_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEBUG, "Calculating day %d range: %@", buf, 0x12u);
    }
    id v36 = -[PLBatteryUIService entriesInRange:fromEntries:](self, "entriesInRange:fromEntries:", v95, v31, v34);
    uint64_t v37 = -[PLBatteryUIService entriesInRange:fromEntries:](self, "entriesInRange:fromEntries:", v94, v31, v34);
    uint64_t v38 = PLLogCommon();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v85 = [v36 count];
      uint64_t v86 = [v37 count];
      *(_DWORD *)buf = 134218240;
      *(void *)__int16 v120 = v85;
      *(_WORD *)&v120[8] = 2048;
      *(void *)&v120[10] = v86;
      _os_log_debug_impl(&dword_1E4220000, v38, OS_LOG_TYPE_DEBUG, "Entries in range UI: %lu Usage: %lu", buf, 0x16u);
    }

    id v101 = v36;
    uint64_t v97 = v37;
    if ([v36 count] && objc_msgSend(v37, "count"))
    {
      int v102 = v27;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v110 = 0u;
      long long v109 = 0u;
      id v39 = v37;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v109 objects:v118 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        int v42 = 0;
        int v43 = 0;
        uint64_t v44 = *(void *)v110;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v110 != v44) {
              objc_enumerationMutation(v39);
            }
            int v46 = *(void **)(*((void *)&v109 + 1) + 8 * i);
            v47 = [v46 objectForKeyedSubscript:@"ScreenOn"];
            if (v47)
            {
              double v48 = [v46 objectForKeyedSubscript:@"ScreenOn"];
              v42 += [v48 intValue];
            }
            uint64_t v49 = [v46 objectForKeyedSubscript:@"ScreenOff"];
            if (v49)
            {
              id v50 = [v46 objectForKeyedSubscript:@"ScreenOff"];
              v43 += [v50 intValue];
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v109 objects:v118 count:16];
        }
        while (v41);
      }
      else
      {
        int v42 = 0;
        int v43 = 0;
      }

      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v53 = v101;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v105 objects:v117 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v52 = 0;
        uint64_t v56 = *(void *)v106;
        do
        {
          for (uint64_t j = 0; j != v55; ++j)
          {
            if (*(void *)v106 != v56) {
              objc_enumerationMutation(v53);
            }
            v58 = *(void **)(*((void *)&v105 + 1) + 8 * j);
            BOOL v59 = [v58 objectForKeyedSubscript:@"Level"];
            if (v59)
            {
              double v60 = [v58 objectForKeyedSubscript:@"Level"];
              uint64_t v52 = [v60 intValue] + v52;
            }
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v105 objects:v117 count:16];
        }
        while (v55);
      }
      else
      {
        uint64_t v52 = 0;
      }

      int v61 = v43 + v42;
      if (v43 + v42 < 86401)
      {
        int v63 = v102;
      }
      else
      {
        int v42 = (int)((double)v42 * 86400.0 / (double)v61);
        int v43 = (int)((double)v43 * 86400.0 / (double)v61);
        double v62 = PLLogCommon();
        int v63 = v102;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)__int16 v120 = v42;
          *(_WORD *)&v120[4] = 1024;
          *(_DWORD *)&v120[6] = v43;
          _os_log_debug_impl(&dword_1E4220000, v62, OS_LOG_TYPE_DEBUG, "Normalized On:%d Off:%d", buf, 0xEu);
        }
      }
      uint64_t v64 = PLLogCommon();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)__int16 v120 = v42;
        *(_WORD *)&v120[4] = 1024;
        *(_DWORD *)&v120[6] = v43;
        *(_WORD *)&v120[10] = 1024;
        *(_DWORD *)&v120[12] = v52;
        _os_log_debug_impl(&dword_1E4220000, v64, OS_LOG_TYPE_DEBUG, "On:%ds Off:%ds UI:%d%%", buf, 0x14u);
      }

      uint64_t v27 = (v63 + 1);
    }
    else
    {
      uint8_t v51 = PLLogCommon();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUIService lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:](&v103, v104, v51);
      }

      int v42 = -1;
      int v43 = -1;
      uint64_t v52 = 0xFFFFFFFFLL;
    }
    ADClientSetValueForScalarKey();
    v65 = objc_opt_new();
    [v65 setObject:@"xDay" forKeyedSubscript:@"duration"];
    v66 = [MEMORY[0x1E4F28ED0] numberWithInt:v27];
    [v65 setObject:v66 forKeyedSubscript:@"numBuckets"];

    id v96 = v65;
    AnalyticsSendEventLazy();
    id v67 = PLLogCommon();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int16 v120 = v27;
      _os_log_impl(&dword_1E4220000, v67, OS_LOG_TYPE_INFO, "Total screen buckets with info: %d", buf, 8u);
    }

    v68 = [v93 objectForKeyedSubscript:@"PLBatteryUIQueryRangeWeekTapKey"];
    uint64_t v69 = [v68 objectAtIndexedSubscript:9 - v100];
    uint64_t v70 = [v69 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];

    [(PLBatteryUIService *)self adjustScreenOnTimeSecsWithGraphValue:a5 queryType:v70 andBreakdownEntries:(double)v42];
    uint64_t v72 = (int)v71;
    [(PLBatteryUIService *)self adjustScreenOffTimeSecsWithGraphValue:a5 withGraphScreenOnSecs:v70 queryType:(double)v43 andBreakdownEntries:(double)(int)v72];
    uint64_t v74 = (int)v73;
    uint64_t v75 = objc_opt_new();
    v115 = @"PLBatteryUIGraphTotal";
    int v76 = [MEMORY[0x1E4F28ED0] numberWithInt:v72];
    int v116 = v76;
    id v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    [v75 setObject:v77 forKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];

    double v113 = @"PLBatteryUIGraphTotal";
    double v78 = [MEMORY[0x1E4F28ED0] numberWithInt:v74];
    v114 = v78;
    double v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
    [v75 setObject:v79 forKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];

    uint64_t v80 = [MEMORY[0x1E4F28ED0] numberWithInt:v52];
    [v75 setObject:v80 forKeyedSubscript:@"PLBatteryUIEnergyKey"];

    [v92 addObject:v75];
    uint64_t v25 = [v98 dateByAddingTimeInterval:-86400.0];

    ++v100;
  }
  while (v100 != 10);
  uint64_t v87 = [v92 reverseObjectEnumerator];
  uint64_t v88 = [v87 allObjects];

  return v88;
}

id __89__PLBatteryUIService_lastXDaysWithRange_withDataRange_withQueryType_andBatteryBreakdown___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)modelsForGraphWithDayRange:(_PLTimeIntervalRange)a3 withXDayRange:(_PLTimeIntervalRange)a4 withDataRange:(_PLTimeIntervalRange)a5 withQueryType:(int)a6 andBatteryBreakdown:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  double length = a5.length;
  double location = a5.location;
  double v10 = a4.length;
  double v11 = a4.location;
  double v12 = a3.length;
  double v13 = a3.location;
  v28[3] = *MEMORY[0x1E4F143B8];
  id v15 = a7;
  double v16 = objc_opt_new();
  double v17 = -[PLBatteryUIService screenTimeInRange:withBucketSize:withNumBuckets:withDataRange:withQueryType:andBatteryBreakdown:](self, "screenTimeInRange:withBucketSize:withNumBuckets:withDataRange:withQueryType:andBatteryBreakdown:", 24, v7, v15, v13, v12, 3600.0, location, length);
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];
  [v16 setObject:v18 forKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];

  double v19 = [v17 objectAtIndexedSubscript:1];
  [v16 setObject:v19 forKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];

  double v20 = -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:](self, "batteryLevelsAndChargingIntervalsInRange:withDataRange:", v13, v12, location, length);
  uint64_t v21 = [v20 objectAtIndexedSubscript:0];
  [v16 setObject:v21 forKeyedSubscript:@"PLBatteryUIBatteryLevelsKey"];

  long long v22 = [v20 objectAtIndexedSubscript:1];
  [v16 setObject:v22 forKeyedSubscript:@"PLBatteryUIChargingIntervalsKey"];

  long long v23 = -[PLBatteryUIService lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:](self, "lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:", v7, v15, v11, v10, location, length);

  v27[0] = @"PLBatteryUIErrorCodeKey";
  long long v24 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:0];
  v28[0] = v24;
  v28[1] = v16;
  v27[1] = @"PLBatteryUIGraph24hrs";
  v27[2] = @"PLBatteryUIGraphDays";
  v28[2] = v23;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

  return v25;
}

- (double)adjustScreenOnTimeSecsWithGraphValue:(double)a3 queryType:(int)a4 andBreakdownEntries:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = v8;
  double v10 = 0.0;
  if (v8)
  {
    if ([v8 count])
    {
      double v10 = a3;
      if (!a4)
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          double v10 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              double v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              if (-[PLBatteryUIService isAppEntryValidForAdjustment:withQueryType:](self, "isAppEntryValidForAdjustment:withQueryType:", v16, 0, (void)v21))
              {
                double v17 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
                [v17 doubleValue];
                -[PLBatteryUIService floorSeconds:](self, "floorSeconds:");
                double v19 = v18;

                double v10 = v10 + v19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v13);
        }
        else
        {
          double v10 = 0.0;
        }
      }
    }
  }

  return v10;
}

- (double)adjustScreenOffTimeSecsWithGraphValue:(double)a3 withGraphScreenOnSecs:(double)a4 queryType:(int)a5 andBreakdownEntries:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = v10;
  double v12 = 0.0;
  if (v10 && [v10 count])
  {
    if (a5)
    {
      double v12 = a3;
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v28;
        double v17 = 0.0;
        double v18 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            double v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (-[PLBatteryUIService isAppEntryValidForAdjustment:withQueryType:](self, "isAppEntryValidForAdjustment:withQueryType:", v20, 0, (void)v27))
            {
              long long v21 = [v20 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
              [v21 doubleValue];
              double v23 = v22;

              [(PLBatteryUIService *)self floorSeconds:v23];
              double v18 = v18 + v24;
              if (v23 > v17) {
                double v17 = v23;
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v15);
      }
      else
      {
        double v17 = 0.0;
        double v18 = 0.0;
      }

      if (v18 >= a3) {
        double v25 = a3;
      }
      else {
        double v25 = v18;
      }
      if (v25 >= v17 - a4) {
        double v12 = v25;
      }
      else {
        double v12 = v17 - a4;
      }
    }
  }

  return v12;
}

- (BOOL)isAppEntryValidForAdjustment:(id)a3 withQueryType:(int)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 != 3)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
    [v7 floatValue];
    if ((int)(v8 + 0.5) < 1)
    {
      double v9 = [v6 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
      [v9 doubleValue];
      double v11 = v10;
      double v12 = [v6 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
      [v12 doubleValue];
      double v14 = v11 + v13;

      if (v14 < 60.0) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  uint64_t v15 = [v6 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
  if ([v15 intValue] == 5)
  {
  }
  else
  {
    uint64_t v16 = [v6 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
    int v17 = [v16 intValue];

    if (v17 != 2)
    {
      BOOL v18 = 1;
      goto LABEL_10;
    }
  }
LABEL_8:
  BOOL v18 = 0;
LABEL_10:

  return v18;
}

- (double)floorSeconds:(double)a3
{
  return floor(a3 / 60.0) * 60.0;
}

- (void)removeExcessUpgradePlistFiles
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[PLUtilities containerPath];
  id v5 = [v4 stringByAppendingString:@"/Library/BatteryLife/Debug/"];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "Failed to get contents of directory %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

void __51__PLBatteryUIService_removeExcessUpgradePlistFiles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 lastPathComponent];
  int v4 = [v3 containsString:@"Upgrade"];

  if (v4) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (PLXPCResponderOperatorComposition)batteryBreakdownResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBatteryBreakdownResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)modelsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setModelsResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelsResponder, 0);
  objc_storeStrong((id *)&self->_batteryBreakdownResponder, 0);
}

- (void)getlastDayRangeWithNow:withNowSystem:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "System hour bucket: %@ -> %@");
}

- (void)getlastDayRangeWithNow:withNowSystem:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "hourNum: %lu", v2, v3, v4, v5, v6);
}

- (void)getDataRangeWithNow:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "No first RNE entry!", v2, v3, v4, v5, v6);
}

- (void)getDataRangeWithNow:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "First RNE entry at %@: %@");
}

- (void)getDataRangeWithNow:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "No first usage time entry!", v2, v3, v4, v5, v6);
}

- (void)getDataRangeWithNow:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "First usage time entry at %@: %@");
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Result copied to folder %@", v2, v3, v4, v5, v6);
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "Failed to copy to folder %@", v1, 0xCu);
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Result written to folder %@", v2, v3, v4, v5, v6);
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9(&dword_1E4220000, v0, v1, "Failed to write response to folder %@ with error %@");
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Attempting to create file %@", v2, v3, v4, v5, v6);
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "and monotonic time %@", v2, v3, v4, v5, v6);
}

- (void)batteryBreakdownWithPayload:(uint64_t)a3 withDayRange:(uint64_t)a4 withXDayRange:(uint64_t)a5 withDataRange:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)demoModePath
{
}

- (void)getLastChargeData
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9(&dword_1E4220000, v0, v1, "Missing last charge info: %@ - %@%%");
}

- (void)getLPMIntervalsSpanningRange:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Created LPM interval %@", v2, v3, v4, v5, v6);
}

- (void)getLPMIntervalsSpanningRange:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Closing open LPM interval", v2, v3, v4, v5, v6);
}

- (void)getLPMIntervalsSpanningRange:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "LPM logged with no change?", buf, 2u);
}

- (void)getLPMIntervalsSpanningRange:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getLPMIntervalsSpanningRange:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Creating LPM intervals", v2, v3, v4, v5, v6);
}

- (void)batteryLevelsAndChargingIntervalsInRange:(uint64_t)a1 withDataRange:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_8(a1, a2), "count");
  _DWORD *v3 = 134217984;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v5, v6, "Found %lu entries in range!");
}

- (void)batteryLevelsAndChargingIntervalsInRange:(uint64_t)a3 withDataRange:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)batteryLevelsAndChargingIntervalsInRange:(void *)a1 withDataRange:.cold.3(void *a1)
{
  uint64_t v2 = [a1 objectAtIndexedSubscript:0];
  uint64_t v9 = [a1 objectAtIndexedSubscript:1];
  OUTLINED_FUNCTION_10(&dword_1E4220000, v3, v4, "Capped open charging interval: [%@ %@]", v5, v6, v7, v8, 2u);
}

- (void)batteryLevelsAndChargingIntervalsInRange:(uint64_t)a1 withDataRange:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_8(a1, a2), "entryDate");
  _DWORD *v3 = 138412290;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v5, v6, "Found invalid battery entry at %@");
}

- (void)batteryLevelsAndChargingIntervalsInRange:(NSObject *)a3 withDataRange:.cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl(&dword_1E4220000, a3, OS_LOG_TYPE_DEBUG, "Iterating through %lu entries, interval open: %d", v5, 0x12u);
}

- (void)batteryLevelsAndChargingIntervalsInRange:(uint64_t)a3 withDataRange:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)screenTimeInRange:withBucketSize:withNumBuckets:withDataRange:withQueryType:andBatteryBreakdown:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Reversing buckets!", v2, v3, v4, v5, v6);
}

- (void)lastXDaysWithRange:(os_log_t)log withDataRange:withQueryType:andBatteryBreakdown:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Not enough info in range!", buf, 2u);
}

- (void)lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Start of current day: %@", v2, v3, v4, v5, v6);
}

- (void)lastXDaysWithRange:(void *)a1 withDataRange:(void *)a2 withQueryType:andBatteryBreakdown:.cold.3(void *a1, void *a2)
{
  [a1 count];
  [a2 count];
  OUTLINED_FUNCTION_10(&dword_1E4220000, v3, v4, "Calculating lastX days with %lu screen %lu ui entries", v5, v6, v7, v8, 0);
}

@end