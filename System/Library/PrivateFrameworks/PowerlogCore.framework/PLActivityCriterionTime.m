@interface PLActivityCriterionTime
+ (double)minTimeInterval;
+ (id)timeCriterionWithInterval:(double)a3;
- (PLActivityCriterionTime)initWithInterval:(double)a3;
- (PLMonotonicTimer)timer;
- (double)interval;
- (double)rescheduleDelay;
- (id)description;
- (void)dealloc;
- (void)didCompleteActivity:(id)a3;
- (void)didDisableActivity:(id)a3;
- (void)didEnableActivity:(id)a3;
- (void)didInterruptActivity:(id)a3;
- (void)setInterval:(double)a3;
- (void)setRescheduleDelay:(double)a3;
- (void)setTimer:(id)a3;
@end

@implementation PLActivityCriterionTime

uint64_t __45__PLActivityCriterionTime_didEnableActivity___block_invoke_30(uint64_t a1)
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __45__PLActivityCriterionTime_didEnableActivity___block_invoke_2;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v13 = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_5 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_5, &block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_5)
    {
      v3 = [NSString stringWithFormat:@"PLActivityCriterionTime::timer block fired for criterion=%@", *(void *)(a1 + 32), block, v10, v11, v12, v13];
      v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m"];
      v5 = [v4 lastPathComponent];
      v6 = [NSString stringWithUTF8String:"-[PLActivityCriterionTime didEnableActivity:]_block_invoke"];
      +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:62];

      v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  return [*(id *)(a1 + 32) setSatisfied:1];
}

- (PLMonotonicTimer)timer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 40, 1);
}

- (double)interval
{
  return self->_interval;
}

- (void)didCompleteActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLActivityCriterionTime_didCompleteActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didCompleteActivity__defaultOnce_0 != -1) {
      dispatch_once(&didCompleteActivity__defaultOnce_0, block);
    }
    if (didCompleteActivity__classDebugEnabled_0)
    {
      v6 = [NSString stringWithFormat:@"PLActivityCriterionTime::didCompleteActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLActivityCriterionTime didCompleteActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:68];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PLActivityCriterionTime;
  [(PLActivityCriterion *)&v14 didCompleteActivity:v4];
  [(PLActivityCriterion *)self setSatisfied:0];
  v11 = (void *)MEMORY[0x1E4F1C9C8];
  [(PLActivityCriterionTime *)self interval];
  v12 = objc_msgSend(v11, "monotonicDateWithTimeIntervalSinceNow:");
  uint64_t v13 = [(PLActivityCriterionTime *)self timer];
  [v13 setMonotonicFireDate:v12];
}

- (PLActivityCriterionTime)initWithInterval:(double)a3
{
  if (a3 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLActivityCriterionTime;
    id v4 = [(PLActivityCriterion *)&v8 init];
    if (v4)
    {
      [(id)objc_opt_class() minTimeInterval];
      if (v5 <= a3) {
        double v5 = a3;
      }
      v4->_interval = v5;
    }
    self = v4;
    v6 = self;
  }

  return v6;
}

+ (id)timeCriterionWithInterval:(double)a3
{
  v3 = [[PLActivityCriterionTime alloc] initWithInterval:a3];
  return v3;
}

+ (double)minTimeInterval
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PLActivityCriterionTime_minTimeInterval__block_invoke;
  v4[3] = &unk_1E6253E70;
  double v5 = @"PLActivityCriterionTime_minTimeInterval";
  uint64_t v6 = 0x404E000000000000;
  if (minTimeInterval_defaultOnce != -1) {
    dispatch_once(&minTimeInterval_defaultOnce, v4);
  }
  double v2 = *(double *)&minTimeInterval_objectForKey;

  return v2;
}

uint64_t __42__PLActivityCriterionTime_minTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t result = +[PLDefaults doubleForKey:*(void *)(a1 + 32) ifNotSet:*(double *)(a1 + 40)];
  minTimeInterval_objectForKey = v2;
  return result;
}

- (void)dealloc
{
  [(PLMonotonicTimer *)self->_timer cancel];
  v3.receiver = self;
  v3.super_class = (Class)PLActivityCriterionTime;
  [(PLActivityCriterionTime *)&v3 dealloc];
}

- (void)didEnableActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLActivityCriterionTime_didEnableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didEnableActivity__defaultOnce_1 != -1) {
      dispatch_once(&didEnableActivity__defaultOnce_1, block);
    }
    if (didEnableActivity__classDebugEnabled_1)
    {
      uint64_t v6 = [NSString stringWithFormat:@"PLActivityCriterionTime::didEnableActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m"];
      objc_super v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLActivityCriterionTime didEnableActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:49];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)PLActivityCriterionTime;
  [(PLActivityCriterion *)&v26 didEnableActivity:v4];
  v11 = [(PLActivityCriterion *)self delegate];
  v12 = [v11 lastCompletedDate];
  if (v12)
  {
    uint64_t v13 = [(PLActivityCriterion *)self delegate];
    objc_super v14 = [v13 lastCompletedDate];
  }
  else
  {
    objc_super v14 = [MEMORY[0x1E4F1C9C8] distantPast];
  }

  [(PLActivityCriterionTime *)self interval];
  v15 = objc_msgSend(v14, "dateByAddingTimeInterval:");
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __45__PLActivityCriterionTime_didEnableActivity___block_invoke_25;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v16;
    if (didEnableActivity__defaultOnce_23 != -1) {
      dispatch_once(&didEnableActivity__defaultOnce_23, v25);
    }
    if (didEnableActivity__classDebugEnabled_24)
    {
      v17 = [NSString stringWithFormat:@"PLActivityCriterionTime::didEnableActivity:%@ for criterion=%@, lastCompletedDate=%@, fireDate=%@", v4, self, v14, v15];
      v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m"];
      v19 = [v18 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLActivityCriterionTime didEnableActivity:]"];
      +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:55];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v22 = dispatch_get_global_queue(2, 0);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __45__PLActivityCriterionTime_didEnableActivity___block_invoke_30;
  v24[3] = &unk_1E62554A8;
  v24[4] = self;
  v23 = +[PLMonotonicTimer scheduledTimerWithMonotonicFireDate:v15 withInterval:v22 withQueue:v24 withBlock:0.0];
  [(PLActivityCriterionTime *)self setTimer:v23];
}

BOOL __45__PLActivityCriterionTime_didEnableActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didEnableActivity__classDebugEnabled_1 = result;
  return result;
}

BOOL __45__PLActivityCriterionTime_didEnableActivity___block_invoke_25(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didEnableActivity__classDebugEnabled_24 = result;
  return result;
}

BOOL __45__PLActivityCriterionTime_didEnableActivity___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_5 = result;
  return result;
}

BOOL __47__PLActivityCriterionTime_didCompleteActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didCompleteActivity__classDebugEnabled_0 = result;
  return result;
}

- (void)didInterruptActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLActivityCriterionTime_didInterruptActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didInterruptActivity__defaultOnce_0 != -1) {
      dispatch_once(&didInterruptActivity__defaultOnce_0, block);
    }
    if (didInterruptActivity__classDebugEnabled_0)
    {
      uint64_t v6 = [NSString stringWithFormat:@"PLActivityCriterionTime::didInterruptActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m"];
      objc_super v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLActivityCriterionTime didInterruptActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:79];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PLActivityCriterionTime;
  [(PLActivityCriterion *)&v14 didInterruptActivity:v4];
  [(PLActivityCriterion *)self setSatisfied:0];
  v11 = (void *)MEMORY[0x1E4F1C9C8];
  [(PLActivityCriterionTime *)self rescheduleDelay];
  v12 = objc_msgSend(v11, "monotonicDateWithTimeIntervalSinceNow:");
  uint64_t v13 = [(PLActivityCriterionTime *)self timer];
  [v13 setMonotonicFireDate:v12];
}

BOOL __48__PLActivityCriterionTime_didInterruptActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didInterruptActivity__classDebugEnabled_0 = result;
  return result;
}

- (void)didDisableActivity:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLActivityCriterionTime_didDisableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didDisableActivity__defaultOnce_1 != -1) {
      dispatch_once(&didDisableActivity__defaultOnce_1, block);
    }
    if (didDisableActivity__classDebugEnabled_1)
    {
      uint64_t v6 = [NSString stringWithFormat:@"PLActivityCriterionTime::didDisableActivity:%@ for criterion=%@", v4, self];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m"];
      objc_super v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLActivityCriterionTime didDisableActivity:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:90];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PLActivityCriterionTime;
  [(PLActivityCriterion *)&v12 didDisableActivity:v4];
  v11 = [(PLActivityCriterionTime *)self timer];
  [v11 cancel];

  [(PLActivityCriterionTime *)self setTimer:0];
}

BOOL __46__PLActivityCriterionTime_didDisableActivity___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  didDisableActivity__classDebugEnabled_1 = result;
  return result;
}

- (double)rescheduleDelay
{
  [(PLActivityCriterionTime *)self interval];
  double v3 = v2 / 10.0;
  [(id)objc_opt_class() minTimeInterval];
  if (v3 >= result) {
    return v3;
  }
  return result;
}

- (id)description
{
  double v2 = NSString;
  [(PLActivityCriterionTime *)self interval];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"(interval=%f)", v3);
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void)setRescheduleDelay:(double)a3
{
  self->_rescheduleDelay = a3;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end