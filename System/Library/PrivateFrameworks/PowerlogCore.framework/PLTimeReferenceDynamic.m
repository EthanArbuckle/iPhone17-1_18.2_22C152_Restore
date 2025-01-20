@interface PLTimeReferenceDynamic
+ (double)nearestDistanceFromDate:(id)a3 toRegionWithStartDate:(id)a4 andEndDate:(id)a5;
- (BOOL)shouldQueryCurrentTime;
- (NSDate)lastQueryTime;
- (NSMutableArray)offsetHistory;
- (NSMutableDictionary)timeChangeBlocks;
- (PLTimeReferenceDynamic)initWithTimeManager:(id)a3 entryDefinitionKey:(id)a4 timeReferenceType:(int64_t)a5;
- (PLTimer)periodicCurrentTime;
- (double)tooFarInFutureDistance;
- (double)tooFarInPastDistance;
- (id)newOffsetEntryWithCurrentTime;
- (id)removeTimeOffsetFromReferenceTime:(id)a3;
- (int)offsetHistoryHead;
- (void)checkForTimeChangeWithCurrentTime:(id)a3;
- (void)initializeOffsetHistoryWithEntries:(id)a3;
- (void)initializeOffsetWithEntries:(id)a3;
- (void)notifyTimeChange:(double)a3;
- (void)registerForClockSetNotification;
- (void)registerForTimeChangedCallbackWithIdentifier:(id)a3 usingBlock:(id)a4;
- (void)registerForTimeChangedNotification;
- (void)setLastQueryTime:(id)a3;
- (void)setOffset:(double)a3;
- (void)setOffsetHistory:(id)a3;
- (void)setOffsetHistoryHead:(int)a3;
- (void)setPeriodicCurrentTime:(id)a3;
- (void)setTimeChangeBlocks:(id)a3;
- (void)setTooFarInFutureDistance:(double)a3;
- (void)setTooFarInPastDistance:(double)a3;
- (void)unregisterForTimeChangedCallbackWithIdentifier:(id)a3;
@end

@implementation PLTimeReferenceDynamic

void __60__PLTimeReferenceDynamic_removeTimeOffsetFromReferenceTime___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) offset];
  double v2 = 3.40282347e38;
  if (v3 != 3.40282347e38)
  {
    id obj = [*(id *)(a1 + 32) offsetHistory];
    objc_sync_enter(obj);
    unint64_t v4 = 0;
    double v5 = 0.0;
    for (int i = -1; ; --i)
    {
      v7 = [*(id *)(a1 + 32) offsetHistory];
      unint64_t v8 = [v7 count];

      if (v8 <= v4) {
        break;
      }
      int v9 = [*(id *)(a1 + 32) offsetHistoryHead];
      v10 = [*(id *)(a1 + 32) offsetHistory];
      unint64_t v11 = (i + v9) % (unint64_t)[v10 count];

      if ((v11 & 0x80000000) != 0)
      {
        v12 = [*(id *)(a1 + 32) offsetHistory];
        LODWORD(v11) = [v12 count] + v11;
      }
      v13 = [*(id *)(a1 + 32) offsetHistory];
      v14 = [v13 objectAtIndexedSubscript:(int)v11];

      v15 = [v14 objectForKeyedSubscript:@"startReferenceTime"];
      v16 = [v14 objectForKeyedSubscript:@"endReferenceTime"];
      [(id)objc_opt_class() nearestDistanceFromDate:*(void *)(a1 + 40) toRegionWithStartDate:v15 andEndDate:v16];
      double v18 = fabs(v17);
      if (v18 < v2)
      {
        v19 = [v14 objectForKeyedSubscript:@"offset"];
        [v19 doubleValue];
        double v5 = v20;

        if (v18 < 1.0)
        {

          break;
        }
        double v2 = v18;
      }

      ++v4;
    }
    objc_sync_exit(obj);

    uint64_t v21 = [*(id *)(a1 + 40) dateByAddingTimeInterval:-v5];
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    [*(id *)(a1 + 32) tooFarInFutureDistance];
    if ((objc_msgSend(v24, "isInMonotonicFutureWithDistance:") & 1) != 0
      || (v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40),
          [*(id *)(a1 + 32) tooFarInPastDistance],
          objc_msgSend(v25, "isInMonotonicPastWithDistance:")))
    {
      if ([*(id *)(a1 + 32) shouldQueryCurrentTime]) {
        id v26 = (id)[*(id *)(a1 + 32) currentTime];
      }
      v27 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) offset];
      uint64_t v29 = [v27 dateByAddingTimeInterval:-v28];
      uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
      v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;

      v32 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      [*(id *)(a1 + 32) tooFarInFutureDistance];
      if ((objc_msgSend(v32, "isInMonotonicFutureWithDistance:") & 1) != 0
        || (v33 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40),
            [*(id *)(a1 + 32) tooFarInPastDistance],
            objc_msgSend(v33, "isInMonotonicPastWithDistance:")))
      {
        if (+[PLPlatform internalBuild])
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __60__PLTimeReferenceDynamic_removeTimeOffsetFromReferenceTime___block_invoke_2;
          block[3] = &unk_1E6254390;
          v47 = @"PLTimeReferenceDynamic_TimeCorrection_Debug";
          char v48 = 0;
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce != -1) {
            dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce, block);
          }
          int v34 = PLSubmissionAnalyticsStateSuccess_block_invoke_3_objectForKey;

          if (v34)
          {
            v35 = +[PLOperator entryKeyForType:@"EventPoint" andName:@"TimeCorrection"];
            v36 = [[PLEntry alloc] initWithEntryKey:v35];
            v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "timeReferenceType"));
            [(PLEntry *)v36 setObject:v37 forKeyedSubscript:@"TimeReferenceType"];

            [(PLEntry *)v36 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"TimeInReference"];
            [(PLEntry *)v36 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:@"ProjectedTimeInMonotonic"];
            v38 = [MEMORY[0x1E4F29060] callStackSymbols];
            v39 = [v38 componentsJoinedByString:@", "];
            [(PLEntry *)v36 setObject:v39 forKeyedSubscript:@"CallStack"];

            v40 = +[PowerlogCore sharedCore];
            v41 = [v40 storage];
            [v41 writeEntry:v36 withCompletionBlock:&__block_literal_global_41];
          }
        }
        uint64_t v42 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        uint64_t v43 = *(void *)(*(void *)(a1 + 48) + 8);
        v44 = *(void **)(v43 + 40);
        *(void *)(v43 + 40) = v42;
      }
    }
  }
}

- (NSMutableArray)offsetHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (double)tooFarInFutureDistance
{
  return self->_tooFarInFutureDistance;
}

- (int)offsetHistoryHead
{
  return self->_offsetHistoryHead;
}

+ (double)nearestDistanceFromDate:(id)a3 toRegionWithStartDate:(id)a4 andEndDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  [v9 timeIntervalSinceDate:v8];
  double v11 = v10;
  [v7 timeIntervalSinceDate:v9];
  double v13 = v12;

  [v7 timeIntervalSinceDate:v8];
  double v15 = v14;

  double result = -1.0;
  if (v15 >= 0.0)
  {
    if (v11 <= 0.0 || (double result = 0.0, v13 <= 0.0))
    {
      double result = fabs(v11);
      double v17 = fabs(v13);
      if (result >= v17) {
        return v17;
      }
    }
  }
  return result;
}

- (double)tooFarInPastDistance
{
  return self->_tooFarInPastDistance;
}

- (BOOL)shouldQueryCurrentTime
{
  double v2 = [(PLTimeReferenceDynamic *)self lastQueryTime];
  [v2 timeIntervalSinceMonitonicNow];
  BOOL v4 = fabs(v3) > 600.0;

  return v4;
}

- (NSDate)lastQueryTime
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (id)removeTimeOffsetFromReferenceTime:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  id v17 = [MEMORY[0x1E4F1C9C8] date];
  double v5 = +[PLUtilities workQueueForKey:@"PLTimeReferenceDynamic::removeTimeOffsetFromReferenceTime"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PLTimeReferenceDynamic_removeTimeOffsetFromReferenceTime___block_invoke;
  block[3] = &unk_1E62539E0;
  void block[4] = self;
  id v10 = v4;
  double v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (PLTimeReferenceDynamic)initWithTimeManager:(id)a3 entryDefinitionKey:(id)a4 timeReferenceType:(int64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)PLTimeReferenceDynamic;
  double v5 = [(PLTimeReference *)&v13 initWithTimeManager:a3 entryDefinitionKey:a4 timeReferenceType:a5];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    timeChangeBlocks = v5->_timeChangeBlocks;
    v5->_timeChangeBlocks = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    offsetHistory = v5->_offsetHistory;
    v5->_offsetHistory = (NSMutableArray *)v8;

    v5->_offsetHistoryHead = 0;
    v5->_tooFarInFutureDistance = 2147483650.0;
    v5->_tooFarInPastDistance = 2147483650.0;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastQueryTime = v5->_lastQueryTime;
    v5->_lastQueryTime = (NSDate *)v10;
  }
  return v5;
}

- (void)initializeOffsetWithEntries:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PLTimeReferenceDynamic;
  id v4 = a3;
  [(PLTimeReference *)&v14 initializeOffsetWithEntries:v4];
  [(PLTimeReferenceDynamic *)self initializeOffsetHistoryWithEntries:v4];

  if (!+[PLUtilities isPowerlogHelperd])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (initializeOffsetWithEntries__defaultOnce != -1) {
      dispatch_once(&initializeOffsetWithEntries__defaultOnce, block);
    }
    if (initializeOffsetWithEntries__classDebugEnabled) {
      double v6 = 10.0;
    }
    else {
      double v6 = 1800.0;
    }
    if (initializeOffsetWithEntries__classDebugEnabled) {
      double v7 = 10.0;
    }
    else {
      double v7 = 60.0;
    }
    uint64_t v8 = [PLTimer alloc];
    id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v7];
    uint64_t v10 = +[PLUtilities workQueueForClass:objc_opt_class()];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke_2;
    v12[3] = &unk_1E6254400;
    v12[4] = self;
    double v11 = [(PLTimer *)v8 initWithFireDate:v9 withInterval:1 withTolerance:0 repeats:v10 withUserInfo:v12 withQueue:v6 withBlock:0.0];
    [(PLTimeReferenceDynamic *)self setPeriodicCurrentTime:v11];
  }
}

BOOL __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  initializeOffsetWithEntries__classDebugEnabled = result;
  return result;
}

id __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke_2(uint64_t a1)
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    objc_super v13 = __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke_3;
    objc_super v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v15 = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_6 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_6, &block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_6)
    {
      double v3 = NSString;
      id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "timeReferenceType"));
      uint64_t v5 = [v3 stringWithFormat:@"PLTimeReferenceDynamic::periodicCurrentTime: timeReferenceType=%@", v4, block, v12, v13, v14, v15];

      double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
      double v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic initializeOffsetWithEntries:]_block_invoke_2"];
      +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:71];

      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  return (id)[*(id *)(a1 + 32) currentTime];
}

BOOL __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke_3(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_6 = result;
  return result;
}

- (void)initializeOffsetHistoryWithEntries:(id)a3
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v33 = v3;
  if (v3 && (id v4 = v3, [v3 count]))
  {
    int v5 = [v4 count];
    if (v5 < 1)
    {
      double v6 = 0;
      v35 = 0;
      uint64_t v24 = 0;
    }
    else
    {
      int v36 = 0;
      v35 = 0;
      double v6 = 0;
      unint64_t v7 = v5;
      double v8 = 3.40282347e38;
      do
      {
        id v9 = objc_msgSend(v4, "objectAtIndexedSubscript:", (v7 - 1), v33);
        uint64_t v10 = [(PLTimeReference *)self entryDefinitionKey];
        double v11 = [v9 objectForKeyedSubscript:v10];
        [v11 doubleValue];
        double v13 = v12;

        if (vabdd_f64(v13, v8) > 1.0)
        {
          objc_super v14 = [v9 entryDate];

          if (v35) {
            [v35 dateByAddingTimeInterval:v13];
          }
          else {
          uint64_t v15 = [MEMORY[0x1E4F1C9C8] distantFuture];
          }
          v16 = [(PLTimeReferenceDynamic *)self offsetHistory];
          objc_sync_enter(v16);
          id v17 = [(PLTimeReferenceDynamic *)self offsetHistory];
          v38[0] = @"offset";
          double v18 = [NSNumber numberWithDouble:v13];
          v39[0] = v18;
          v38[1] = @"startReferenceTime";
          v19 = [v14 dateByAddingTimeInterval:v13];
          v38[2] = @"endReferenceTime";
          v39[1] = v19;
          v39[2] = v15;
          double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
          uint64_t v21 = (void *)[v20 mutableCopy];
          [v17 insertObject:v21 atIndex:0];

          objc_sync_exit(v16);
          uint64_t v22 = [v9 entryDate];

          ++v36;
          double v8 = v13;
          double v6 = v14;
          v35 = (void *)v22;
        }

        id v4 = v33;
        if (v36 > 2) {
          break;
        }
      }
      while (v7-- > 1);
      if (v36 >= 3) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = v36;
      }
    }
    -[PLTimeReferenceDynamic setOffsetHistoryHead:](self, "setOffsetHistoryHead:", v24, v33);
  }
  else
  {
    v25 = objc_msgSend(MEMORY[0x1E4F1C9C8], "monotonicDate", v33);
    [(PLTimeReference *)self offset];
    double v6 = objc_msgSend(v25, "dateByAddingTimeInterval:");

    if (v6)
    {
      id v26 = [(PLTimeReferenceDynamic *)self offsetHistory];
      objc_sync_enter(v26);
      v27 = [(PLTimeReferenceDynamic *)self offsetHistory];
      v40[0] = @"offset";
      double v28 = NSNumber;
      [(PLTimeReference *)self offset];
      uint64_t v29 = objc_msgSend(v28, "numberWithDouble:");
      v41[0] = v29;
      v41[1] = v6;
      v40[1] = @"startReferenceTime";
      v40[2] = @"endReferenceTime";
      uint64_t v30 = [MEMORY[0x1E4F1C9C8] distantFuture];
      v41[2] = v30;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
      v32 = (void *)[v31 mutableCopy];
      [v27 addObject:v32];

      objc_sync_exit(v26);
      [(PLTimeReferenceDynamic *)self setOffsetHistoryHead:1];
    }
  }
}

- (void)registerForTimeChangedNotification
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PLTimeReferenceDynamic_registerForTimeChangedNotification__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (registerForTimeChangedNotification_defaultOnce != -1) {
      dispatch_once(&registerForTimeChangedNotification_defaultOnce, block);
    }
    if (registerForTimeChangedNotification_classDebugEnabled)
    {
      id v3 = [NSString stringWithFormat:@"PLTimeReferenceDynamic::registerForTimeChangedNotification WARNING: inherited class must implement"];
      id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
      int v5 = [v4 lastPathComponent];
      double v6 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic registerForTimeChangedNotification]"];
      +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:132];

      unint64_t v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __60__PLTimeReferenceDynamic_registerForTimeChangedNotification__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  registerForTimeChangedNotification_classDebugEnabled = result;
  return result;
}

- (void)registerForClockSetNotification
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PLTimeReferenceDynamic_registerForClockSetNotification__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (registerForClockSetNotification_defaultOnce != -1) {
      dispatch_once(&registerForClockSetNotification_defaultOnce, block);
    }
    if (registerForClockSetNotification_classDebugEnabled)
    {
      id v3 = [NSString stringWithFormat:@"PLTimeReferenceDynamic::registerForClockSetNotification WARNING: inherited class must implement"];
      id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
      int v5 = [v4 lastPathComponent];
      double v6 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic registerForClockSetNotification]"];
      +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:137];

      unint64_t v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __57__PLTimeReferenceDynamic_registerForClockSetNotification__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  registerForClockSetNotification_classDebugEnabled = result;
  return result;
}

- (void)checkForTimeChangeWithCurrentTime:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLTimeReference *)self offset];
  double v6 = objc_msgSend(v5, "dateByAddingTimeInterval:");

  if (v6)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v7 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      double v20 = __60__PLTimeReferenceDynamic_checkForTimeChangeWithCurrentTime___block_invoke;
      uint64_t v21 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v22 = v7;
      if (checkForTimeChangeWithCurrentTime__defaultOnce != -1) {
        dispatch_once(&checkForTimeChangeWithCurrentTime__defaultOnce, &block);
      }
      if (checkForTimeChangeWithCurrentTime__classDebugEnabled)
      {
        double v8 = NSString;
        id v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLTimeReference timeReferenceType](self, "timeReferenceType"));
        uint64_t v10 = [v8 stringWithFormat:@"PLTimeReferenceDynamic::checkForTimeChangeWithCurrentTime: timeReferenceType=%@, prevTimeInReference=%@, currentTimeInReference=%@", v9, v6, v4, block, v19, v20, v21, v22];

        double v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
        double v12 = [v11 lastPathComponent];
        double v13 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic checkForTimeChangeWithCurrentTime:]"];
        +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:147];

        objc_super v14 = PLLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    [(PLTimeReference *)self offset];
    double v16 = v15;
    [v4 timeIntervalSinceDate:v6];
    [(PLTimeReferenceDynamic *)self setOffset:v16 + v17];
  }
}

BOOL __60__PLTimeReferenceDynamic_checkForTimeChangeWithCurrentTime___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  checkForTimeChangeWithCurrentTime__classDebugEnabled = result;
  return result;
}

- (id)newOffsetEntryWithCurrentTime
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLTimeReference *)self offset];
  id v4 = objc_msgSend(v3, "dateByAddingTimeInterval:");

  if (v4)
  {
    v11[0] = @"offset";
    int v5 = NSNumber;
    [(PLTimeReference *)self offset];
    double v6 = objc_msgSend(v5, "numberWithDouble:");
    v12[0] = v6;
    v12[1] = v4;
    v11[1] = @"startReferenceTime";
    v11[2] = @"endReferenceTime";
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v12[2] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    id v9 = (void *)[v8 mutableCopy];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)setOffset:(double)a3
{
  int v5 = +[PLUtilities workQueueForKey:@"PLTimeReferenceDynamic::setOffset"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PLTimeReferenceDynamic_setOffset___block_invoke;
  v6[3] = &unk_1E6253E70;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(v5, v6);
}

void __36__PLTimeReferenceDynamic_setOffset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) offset];
  if (v2 != 3.40282347e38)
  {
    double v3 = *(double *)(a1 + 40);
    [*(id *)(a1 + 32) offset];
    double v5 = v3 - v4;
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__PLTimeReferenceDynamic_setOffset___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v6;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_0 != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_0, block);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_0)
      {
        uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"PLTimeReferenceDynamic::setOffset: delta=%f", *(void *)&v5);
        double v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
        id v9 = [v8 lastPathComponent];
        uint64_t v10 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic setOffset:]_block_invoke"];
        +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:176];

        double v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if (fabs(v5) >= 1.0)
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v12 = objc_opt_class();
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __36__PLTimeReferenceDynamic_setOffset___block_invoke_50;
        v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v41[4] = v12;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_48 != -1) {
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_48, v41);
        }
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_49)
        {
          double v13 = NSString;
          objc_super v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "timeReferenceType"));
          [*(id *)(a1 + 32) offset];
          double v16 = [v13 stringWithFormat:@"PLTimeReferenceDynamic::setOffset: timeReferenceType=%@, oldOffset=%f, newOffset=%f", v14, v15, *(void *)(a1 + 40)];

          double v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
          double v18 = [v17 lastPathComponent];
          uint64_t v19 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic setOffset:]_block_invoke_2"];
          +[PLCoreStorage logMessage:v16 fromFile:v18 fromFunction:v19 fromLineNumber:180];

          double v20 = PLLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      uint64_t v21 = [*(id *)(a1 + 32) offsetHistory];
      objc_sync_enter(v21);
      uint64_t v22 = [*(id *)(a1 + 32) offsetHistory];
      uint64_t v23 = [v22 count];

      if (v23)
      {
        uint64_t v24 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        [*(id *)(a1 + 32) offset];
        v25 = objc_msgSend(v24, "dateByAddingTimeInterval:");

        if (v25)
        {
          int v26 = [*(id *)(a1 + 32) offsetHistoryHead];
          v27 = [*(id *)(a1 + 32) offsetHistory];
          unint64_t v28 = (v26 - 1) % (unint64_t)[v27 count];

          if ((v28 & 0x80000000) != 0)
          {
            uint64_t v29 = [*(id *)(a1 + 32) offsetHistory];
            LODWORD(v28) = [v29 count] + v28;
          }
          uint64_t v30 = [*(id *)(a1 + 32) offsetHistory];
          v31 = [v30 objectAtIndexedSubscript:(int)v28];

          [v31 setObject:v25 forKeyedSubscript:@"endReferenceTime"];
        }
      }
      objc_sync_exit(v21);

      double v32 = *(double *)(a1 + 40);
      v40.receiver = *(id *)(a1 + 32);
      v40.super_class = (Class)PLTimeReferenceDynamic;
      objc_msgSendSuper2(&v40, sel_setOffset_, v32);
      id v33 = [*(id *)(a1 + 32) offsetHistory];
      objc_sync_enter(v33);
      int v34 = (void *)[*(id *)(a1 + 32) newOffsetEntryWithCurrentTime];
      if (v34)
      {
        v35 = [*(id *)(a1 + 32) offsetHistory];
        uint64_t v36 = [v35 count];

        v37 = [*(id *)(a1 + 32) offsetHistory];
        if (v36 == 3) {
          objc_msgSend(v37, "setObject:atIndexedSubscript:", v34, (int)objc_msgSend(*(id *)(a1 + 32), "offsetHistoryHead"));
        }
        else {
          [v37 addObject:v34];
        }

        int v38 = [*(id *)(a1 + 32) offsetHistoryHead];
        v39 = [*(id *)(a1 + 32) offsetHistory];
        objc_msgSend(*(id *)(a1 + 32), "setOffsetHistoryHead:", ((v38 + 1) % (unint64_t)objc_msgSend(v39, "count")));
      }
      objc_sync_exit(v33);

      [*(id *)(a1 + 32) notifyTimeChange:v5];
    }
  }
}

BOOL __36__PLTimeReferenceDynamic_setOffset___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_0 = result;
  return result;
}

BOOL __36__PLTimeReferenceDynamic_setOffset___block_invoke_50(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_49 = result;
  return result;
}

BOOL __60__PLTimeReferenceDynamic_removeTimeOffsetFromReferenceTime___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_objectForKey = result;
  return result;
}

- (void)registerForTimeChangedCallbackWithIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(PLTimeReferenceDynamic *)self timeChangeBlocks];
    objc_sync_enter(v9);
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__PLTimeReferenceDynamic_registerForTimeChangedCallbackWithIdentifier_usingBlock___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v10;
      if (registerForTimeChangedCallbackWithIdentifier_usingBlock__defaultOnce != -1) {
        dispatch_once(&registerForTimeChangedCallbackWithIdentifier_usingBlock__defaultOnce, block);
      }
      if (registerForTimeChangedCallbackWithIdentifier_usingBlock__classDebugEnabled)
      {
        double v11 = [NSString stringWithFormat:@"identifier=%@", v6];
        uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
        double v13 = [v12 lastPathComponent];
        objc_super v14 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic registerForTimeChangedCallbackWithIdentifier:usingBlock:]"];
        +[PLCoreStorage logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:322];

        uint64_t v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    double v16 = (void *)MEMORY[0x1C1869370](v8);
    double v17 = [(PLTimeReferenceDynamic *)self timeChangeBlocks];
    [v17 setObject:v16 forKeyedSubscript:v6];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v18 = objc_opt_class();
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __82__PLTimeReferenceDynamic_registerForTimeChangedCallbackWithIdentifier_usingBlock___block_invoke_76;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v18;
      if (registerForTimeChangedCallbackWithIdentifier_usingBlock__defaultOnce_74 != -1) {
        dispatch_once(&registerForTimeChangedCallbackWithIdentifier_usingBlock__defaultOnce_74, v26);
      }
      if (registerForTimeChangedCallbackWithIdentifier_usingBlock__classDebugEnabled_75)
      {
        uint64_t v19 = NSString;
        double v20 = [(PLTimeReferenceDynamic *)self timeChangeBlocks];
        uint64_t v21 = [v19 stringWithFormat:@"self.timeChangeBlocks=%@", v20];

        uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
        uint64_t v23 = [v22 lastPathComponent];
        uint64_t v24 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic registerForTimeChangedCallbackWithIdentifier:usingBlock:]"];
        +[PLCoreStorage logMessage:v21 fromFile:v23 fromFunction:v24 fromLineNumber:324];

        v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    objc_sync_exit(v9);
  }
}

BOOL __82__PLTimeReferenceDynamic_registerForTimeChangedCallbackWithIdentifier_usingBlock___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  registerForTimeChangedCallbackWithIdentifier_usingBlock__classDebugEnabled = result;
  return result;
}

BOOL __82__PLTimeReferenceDynamic_registerForTimeChangedCallbackWithIdentifier_usingBlock___block_invoke_76(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  registerForTimeChangedCallbackWithIdentifier_usingBlock__classDebugEnabled_75 = result;
  return result;
}

- (void)unregisterForTimeChangedCallbackWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(PLTimeReferenceDynamic *)self timeChangeBlocks];
    objc_sync_enter(v5);
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__PLTimeReferenceDynamic_unregisterForTimeChangedCallbackWithIdentifier___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v6;
      if (unregisterForTimeChangedCallbackWithIdentifier__defaultOnce != -1) {
        dispatch_once(&unregisterForTimeChangedCallbackWithIdentifier__defaultOnce, block);
      }
      if (unregisterForTimeChangedCallbackWithIdentifier__classDebugEnabled)
      {
        id v7 = [NSString stringWithFormat:@"identifier=%@", v4];
        double v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
        id v9 = [v8 lastPathComponent];
        uint64_t v10 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic unregisterForTimeChangedCallbackWithIdentifier:]"];
        +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:331];

        double v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    uint64_t v12 = [(PLTimeReferenceDynamic *)self timeChangeBlocks];
    [v12 removeObjectForKey:v4];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __73__PLTimeReferenceDynamic_unregisterForTimeChangedCallbackWithIdentifier___block_invoke_82;
      v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v21[4] = v13;
      if (unregisterForTimeChangedCallbackWithIdentifier__defaultOnce_80 != -1) {
        dispatch_once(&unregisterForTimeChangedCallbackWithIdentifier__defaultOnce_80, v21);
      }
      if (unregisterForTimeChangedCallbackWithIdentifier__classDebugEnabled_81)
      {
        objc_super v14 = NSString;
        uint64_t v15 = [(PLTimeReferenceDynamic *)self timeChangeBlocks];
        double v16 = [v14 stringWithFormat:@"self.timeChangeBlocks=%@", v15];

        double v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m"];
        uint64_t v18 = [v17 lastPathComponent];
        uint64_t v19 = [NSString stringWithUTF8String:"-[PLTimeReferenceDynamic unregisterForTimeChangedCallbackWithIdentifier:]"];
        +[PLCoreStorage logMessage:v16 fromFile:v18 fromFunction:v19 fromLineNumber:333];

        double v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    objc_sync_exit(v5);
  }
}

BOOL __73__PLTimeReferenceDynamic_unregisterForTimeChangedCallbackWithIdentifier___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  unregisterForTimeChangedCallbackWithIdentifier__classDebugEnabled = result;
  return result;
}

BOOL __73__PLTimeReferenceDynamic_unregisterForTimeChangedCallbackWithIdentifier___block_invoke_82(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  unregisterForTimeChangedCallbackWithIdentifier__classDebugEnabled_81 = result;
  return result;
}

- (void)notifyTimeChange:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 != 0.0)
  {
    double v5 = [(PLTimeReferenceDynamic *)self timeChangeBlocks];
    objc_sync_enter(v5);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [(PLTimeReferenceDynamic *)self timeChangeBlocks];
    id v7 = [v6 allValues];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          uint64_t v12 = (void *)MEMORY[0x1C1869120]();
          (*(void (**)(uint64_t, double))(v11 + 16))(v11, a3);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v5);
  }
}

- (NSMutableDictionary)timeChangeBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimeChangeBlocks:(id)a3
{
}

- (void)setTooFarInFutureDistance:(double)a3
{
  self->_tooFarInFutureDistance = a3;
}

- (void)setTooFarInPastDistance:(double)a3
{
  self->_tooFarInPastDistance = a3;
}

- (void)setLastQueryTime:(id)a3
{
}

- (void)setOffsetHistory:(id)a3
{
}

- (void)setOffsetHistoryHead:(int)a3
{
  self->_offsetHistoryHead = a3;
}

- (PLTimer)periodicCurrentTime
{
  return (PLTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPeriodicCurrentTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicCurrentTime, 0);
  objc_storeStrong((id *)&self->_offsetHistory, 0);
  objc_storeStrong((id *)&self->_lastQueryTime, 0);
  objc_storeStrong((id *)&self->_timeChangeBlocks, 0);
}

@end