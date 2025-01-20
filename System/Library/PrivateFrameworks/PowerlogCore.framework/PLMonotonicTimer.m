@interface PLMonotonicTimer
+ (BOOL)debugInstance;
+ (id)debugScheduledTimerWithMonotonicFireDate:(id)a3 withInterval:(double)a4 withQueue:(id)a5 withBlock:(id)a6;
+ (id)scheduledTimerWithMonotonicFireDate:(id)a3 withInterval:(double)a4 withQueue:(id)a5 withBlock:(id)a6;
- (NSDate)monotonicFireDate;
- (NSMutableSet)canceledFireDates;
- (OS_dispatch_queue)queue;
- (PLEntryNotificationOperatorComposition)wakeEntryNotification;
- (PLMonotonicTimer)initWithMonotonicFireDate:(id)a3 withInterval:(double)a4 withQueue:(id)a5 withBlock:(id)a6;
- (double)interval;
- (id)block;
- (id)description;
- (void)_cancel;
- (void)_setMonotonicFireDate:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)fire;
- (void)reschedule;
- (void)schedule;
- (void)setBlock:(id)a3;
- (void)setCanceledFireDates:(id)a3;
- (void)setInterval:(double)a3;
- (void)setMonotonicFireDate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWakeEntryNotification:(id)a3;
- (void)timerFiredForMonotonicFireDate:(id)a3;
@end

@implementation PLMonotonicTimer

void __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_64(uint64_t a1)
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1, block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1)
    {
      v3 = [NSString stringWithFormat:@"run block begin"];
      v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
      v5 = [v4 lastPathComponent];
      v6 = [NSString stringWithUTF8String:"-[PLMonotonicTimer timerFiredForMonotonicFireDate:]_block_invoke"];
      +[PLCoreStorage logMessage:v3 fromFile:v5 fromFunction:v6 fromLineNumber:206];

      v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v8 = [*(id *)(a1 + 32) block];
  v8[2](v8, *(void *)(a1 + 40));

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_70;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v9;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_68 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_68, &v15);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_69)
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"run block end", v15, v16, v17, v18, v19);
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
      v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLMonotonicTimer timerFiredForMonotonicFireDate:]_block_invoke_2"];
      +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:208];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

- (id)block
{
  return objc_getProperty(self, a2, 32, 1);
}

void __28__PLMonotonicTimer_schedule__block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained timerFiredForMonotonicFireDate:*(void *)(a1 + 32)];
}

- (void)timerFiredForMonotonicFireDate:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v6;
    if (timerFiredForMonotonicFireDate__defaultOnce != -1) {
      dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce, v52);
    }
    if (timerFiredForMonotonicFireDate__classDebugEnabled)
    {
      v7 = [NSString stringWithFormat:@"self=%@, now=%@, monotonicFireDate=%@", self, v5, v4];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
      uint64_t v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLMonotonicTimer timerFiredForMonotonicFireDate:]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:187];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v12 = [(PLMonotonicTimer *)self canceledFireDates];
  int v13 = [v12 containsObject:v4];

  if (v13)
  {
    v14 = [(PLMonotonicTimer *)self canceledFireDates];
    [v14 removeObject:v4];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_54;
      v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v51[4] = v15;
      if (timerFiredForMonotonicFireDate__defaultOnce_52 != -1) {
        dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce_52, v51);
      }
      if (timerFiredForMonotonicFireDate__classDebugEnabled_53)
      {
        uint64_t v16 = NSString;
        v17 = [(PLMonotonicTimer *)self canceledFireDates];
        v18 = [v16 stringWithFormat:@"canceled for self=%@ with canceledFireDates=%@", self, v17];

        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
        v20 = [v19 lastPathComponent];
        v21 = [NSString stringWithUTF8String:"-[PLMonotonicTimer timerFiredForMonotonicFireDate:]"];
        +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:192];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
LABEL_22:
      }
    }
  }
  else
  {
    [v5 timeIntervalSinceDate:v4];
    if (v23 >= 0.0)
    {
      monotonicFireDate = self->_monotonicFireDate;
      self->_monotonicFireDate = 0;

      v29 = [(PLMonotonicTimer *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_64;
      block[3] = &unk_1E62539B8;
      block[4] = self;
      id v49 = v5;
      dispatch_async(v29, block);

      [(PLMonotonicTimer *)self interval];
      if (v30 > 0.0)
      {
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v31 = objc_opt_class();
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_77;
          v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v47[4] = v31;
          if (timerFiredForMonotonicFireDate__defaultOnce_75 != -1) {
            dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce_75, v47);
          }
          if (timerFiredForMonotonicFireDate__classDebugEnabled_76)
          {
            v32 = NSString;
            [(PLMonotonicTimer *)self interval];
            v34 = objc_msgSend(v32, "stringWithFormat:", @"rescheduling periodic timer with interval=%f", v33);
            v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
            v36 = [v35 lastPathComponent];
            v37 = [NSString stringWithUTF8String:"-[PLMonotonicTimer timerFiredForMonotonicFireDate:]"];
            +[PLCoreStorage logMessage:v34 fromFile:v36 fromFunction:v37 fromLineNumber:213];

            v38 = PLLogCommon();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
            }
          }
        }
        [(PLMonotonicTimer *)self interval];
        v39 = objc_msgSend(v4, "dateByAddingTimeInterval:");
        [(PLMonotonicTimer *)self _setMonotonicFireDate:v39];
      }
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v40 = objc_opt_class();
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_83;
        v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v46[4] = v40;
        if (timerFiredForMonotonicFireDate__defaultOnce_81 != -1) {
          dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce_81, v46);
        }
        if (timerFiredForMonotonicFireDate__classDebugEnabled_82)
        {
          v41 = [NSString stringWithFormat:@"end"];
          v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
          v43 = [v42 lastPathComponent];
          v44 = [NSString stringWithUTF8String:"-[PLMonotonicTimer timerFiredForMonotonicFireDate:]"];
          +[PLCoreStorage logMessage:v41 fromFile:v43 fromFunction:v44 fromLineNumber:216];

          v45 = PLLogCommon();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
    }
    else if (+[PLDefaults debugEnabled])
    {
      uint64_t v24 = objc_opt_class();
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_60;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v24;
      if (timerFiredForMonotonicFireDate__defaultOnce_58 != -1) {
        dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce_58, v50);
      }
      if (timerFiredForMonotonicFireDate__classDebugEnabled_59)
      {
        v18 = [NSString stringWithFormat:@"time mismatch for self=%@", self];
        v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
        v26 = [v25 lastPathComponent];
        v27 = [NSString stringWithUTF8String:"-[PLMonotonicTimer timerFiredForMonotonicFireDate:]"];
        +[PLCoreStorage logMessage:v18 fromFile:v26 fromFunction:v27 fromLineNumber:198];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
        goto LABEL_22;
      }
    }
  }
}

- (double)interval
{
  return self->_interval;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)canceledFireDates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)_setMonotonicFireDate:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  monotonicFireDate = self->_monotonicFireDate;
  if (v5 | (unint64_t)monotonicFireDate
    && (!v5 || !monotonicFireDate || ![(NSDate *)monotonicFireDate isEqualToDate:v5]))
  {
    [(PLMonotonicTimer *)self _cancel];
    objc_storeStrong((id *)&self->_monotonicFireDate, a3);
    [(PLMonotonicTimer *)self schedule];
  }
  MEMORY[0x1F41817F8]();
}

- (void)_cancel
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__PLMonotonicTimer__cancel__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (_cancel_defaultOnce != -1) {
      dispatch_once(&_cancel_defaultOnce, block);
    }
    if (_cancel_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"begin for self=%@", self];
      unint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
      uint64_t v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLMonotonicTimer _cancel]"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:173];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v9 = [(PLMonotonicTimer *)self monotonicFireDate];

  if (v9)
  {
    v10 = [(PLMonotonicTimer *)self canceledFireDates];
    v11 = [(PLMonotonicTimer *)self monotonicFireDate];
    [v10 addObject:v11];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __27__PLMonotonicTimer__cancel__block_invoke_42;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v12;
      if (_cancel_defaultOnce_40 != -1) {
        dispatch_once(&_cancel_defaultOnce_40, v28);
      }
      if (_cancel_classDebugEnabled_41)
      {
        int v13 = NSString;
        v14 = [(PLMonotonicTimer *)self canceledFireDates];
        uint64_t v15 = [v13 stringWithFormat:@"self=%@, canceledFireDates=%@", self, v14];

        uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLMonotonicTimer _cancel]"];
        +[PLCoreStorage logMessage:v15 fromFile:v17 fromFunction:v18 fromLineNumber:178];

        uint64_t v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    monotonicFireDate = self->_monotonicFireDate;
    self->_monotonicFireDate = 0;

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v21 = objc_opt_class();
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __27__PLMonotonicTimer__cancel__block_invoke_48;
      v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v27[4] = v21;
      if (_cancel_defaultOnce_46 != -1) {
        dispatch_once(&_cancel_defaultOnce_46, v27);
      }
      if (_cancel_classDebugEnabled_47)
      {
        v22 = [NSString stringWithFormat:@"end for self=%@", self];
        double v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
        uint64_t v24 = [v23 lastPathComponent];
        v25 = [NSString stringWithUTF8String:"-[PLMonotonicTimer _cancel]"];
        +[PLCoreStorage logMessage:v22 fromFile:v24 fromFunction:v25 fromLineNumber:181];

        v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
  }
}

- (void)schedule
{
  uint64_t v3 = [(PLMonotonicTimer *)self monotonicFireDate];

  if (v3)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __28__PLMonotonicTimer_schedule__block_invoke;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = v4;
      if (schedule_defaultOnce != -1) {
        dispatch_once(&schedule_defaultOnce, v36);
      }
      if (schedule_classDebugEnabled)
      {
        unint64_t v5 = [NSString stringWithFormat:@"begin for self=%@", self];
        uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
        v7 = [v6 lastPathComponent];
        v8 = [NSString stringWithUTF8String:"-[PLMonotonicTimer schedule]"];
        +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:152];

        uint64_t v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v11 = [(PLMonotonicTimer *)self monotonicFireDate];
    uint64_t v12 = (void *)[v11 copy];

    [v12 timeIntervalSinceDate:v10];
    if (v13 >= 0.0) {
      double v14 = v13;
    }
    else {
      double v14 = 0.0;
    }
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v15 = objc_opt_class();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __28__PLMonotonicTimer_schedule__block_invoke_30;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v15;
      if (schedule_defaultOnce_28 != -1) {
        dispatch_once(&schedule_defaultOnce_28, v35);
      }
      if (schedule_classDebugEnabled_29)
      {
        uint64_t v16 = [NSString stringWithFormat:@"self=%@, now=%@, timeInterval=%f", self, v10, *(void *)&v14];
        v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
        v18 = [v17 lastPathComponent];
        uint64_t v19 = [NSString stringWithUTF8String:"-[PLMonotonicTimer schedule]"];
        +[PLCoreStorage logMessage:v16 fromFile:v18 fromFunction:v19 fromLineNumber:161];

        v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    objc_initWeak(&location, self);
    dispatch_time_t v21 = dispatch_walltime(0, (uint64_t)(v14 * 1000000000.0));
    v22 = +[PLUtilities workQueueForClass:objc_opt_class()];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__PLMonotonicTimer_schedule__block_invoke_34;
    block[3] = &unk_1E6254700;
    objc_copyWeak(&v33, &location);
    id v23 = v12;
    id v32 = v23;
    dispatch_after(v21, v22, block);

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v24 = objc_opt_class();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __28__PLMonotonicTimer_schedule__block_invoke_2;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v24;
      if (schedule_defaultOnce_35 != -1) {
        dispatch_once(&schedule_defaultOnce_35, v30);
      }
      if (schedule_classDebugEnabled_36)
      {
        v25 = [NSString stringWithFormat:@"end for self=%@", self];
        v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
        v27 = [v26 lastPathComponent];
        v28 = [NSString stringWithUTF8String:"-[PLMonotonicTimer schedule]"];
        +[PLCoreStorage logMessage:v25 fromFile:v27 fromFunction:v28 fromLineNumber:168];

        v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
}

- (NSDate)monotonicFireDate
{
  return self->_monotonicFireDate;
}

uint64_t __41__PLMonotonicTimer_setMonotonicFireDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setMonotonicFireDate:*(void *)(a1 + 40)];
}

- (void)setMonotonicFireDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[PLUtilities workQueueForClass:objc_opt_class()];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PLMonotonicTimer_setMonotonicFireDate___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (PLMonotonicTimer)initWithMonotonicFireDate:(id)a3 withInterval:(double)a4 withQueue:(id)a5 withBlock:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  double v14 = v13;
  if (a4 < 0.0 || v12 == 0 || v13 == 0)
  {
    v17 = 0;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PLMonotonicTimer;
    v18 = [(PLMonotonicTimer *)&v30 init];
    uint64_t v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_monotonicFireDate, a3);
      v19->_interval = a4;
      objc_storeStrong((id *)&v19->_queue, a5);
      uint64_t v20 = [v14 copy];
      id block = v19->_block;
      v19->_id block = (id)v20;

      uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
      canceledFireDates = v19->_canceledFireDates;
      v19->_canceledFireDates = (NSMutableSet *)v22;

      objc_initWeak(&location, v19);
      uint64_t v24 = +[PLTimeManager sharedInstance];
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"PLMonotonicTimer_%p", v19);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __79__PLMonotonicTimer_initWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke;
      v27[3] = &unk_1E62546D8;
      objc_copyWeak(&v28, &location);
      [v24 registerForTimeChangedCallbackWithIdentifier:v25 forTimeReference:1 usingBlock:v27];

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    self = v19;
    v17 = self;
  }

  return v17;
}

void __79__PLMonotonicTimer_initWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PLUtilities workQueueForClass:objc_opt_class()];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PLMonotonicTimer_initWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke_2;
  block[3] = &unk_1E62546B0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_sync(v2, block);

  objc_destroyWeak(&v4);
}

void __79__PLMonotonicTimer_initWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reschedule];
}

+ (id)scheduledTimerWithMonotonicFireDate:(id)a3 withInterval:(double)a4 withQueue:(id)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([a1 debugInstance])
  {
    id v13 = 0;
  }
  else
  {
    double v14 = [[PLMonotonicTimer alloc] initWithMonotonicFireDate:v10 withInterval:v11 withQueue:v12 withBlock:a4];
    uint64_t v15 = +[PLUtilities workQueueForClass:objc_opt_class()];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__PLMonotonicTimer_scheduledTimerWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke;
    block[3] = &unk_1E62538C8;
    id v13 = v14;
    v18 = v13;
    dispatch_sync(v15, block);
  }
  return v13;
}

uint64_t __89__PLMonotonicTimer_scheduledTimerWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) schedule];
}

+ (id)debugScheduledTimerWithMonotonicFireDate:(id)a3 withInterval:(double)a4 withQueue:(id)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([a1 debugInstance])
  {
    id v13 = [[PLMonotonicTimer alloc] initWithMonotonicFireDate:v10 withInterval:v11 withQueue:v12 withBlock:a4];
    double v14 = +[PLUtilities workQueueForClass:objc_opt_class()];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__PLMonotonicTimer_debugScheduledTimerWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke;
    block[3] = &unk_1E62538C8;
    uint64_t v15 = v13;
    v18 = v15;
    dispatch_sync(v14, block);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __94__PLMonotonicTimer_debugScheduledTimerWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) schedule];
}

- (void)dealloc
{
  uint64_t v3 = +[PLTimeManager sharedInstance];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"PLMonotonicTimer_%p", self);
  [v3 unregisterForTimeChangedCallbackWithIdentifier:v4 forTimeReference:1];

  v5.receiver = self;
  v5.super_class = (Class)PLMonotonicTimer;
  [(PLMonotonicTimer *)&v5 dealloc];
}

- (void)fire
{
  uint64_t v3 = +[PLUtilities workQueueForClass:objc_opt_class()];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__PLMonotonicTimer_fire__block_invoke;
  block[3] = &unk_1E62538C8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __24__PLMonotonicTimer_fire__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setMonotonicFireDate:0];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v2 timerFiredForMonotonicFireDate:v3];
}

- (void)cancel
{
  id v3 = +[PLUtilities workQueueForClass:objc_opt_class()];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__PLMonotonicTimer_cancel__block_invoke;
  block[3] = &unk_1E62538C8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __26__PLMonotonicTimer_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (id)description
{
  uint64_t v2 = [(PLMonotonicTimer *)self monotonicFireDate];
  id v3 = [v2 description];

  return v3;
}

+ (BOOL)debugInstance
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__PLMonotonicTimer_debugInstance__block_invoke;
  v4[3] = &unk_1E6254390;
  objc_super v5 = @"PLMonotonicTimerDebugInstance_Enabled";
  char v6 = 0;
  if (debugInstance_defaultOnce != -1) {
    dispatch_once(&debugInstance_defaultOnce, v4);
  }
  char v2 = debugInstance_objectForKey;

  return v2;
}

BOOL __33__PLMonotonicTimer_debugInstance__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults BOOLForKey:*(void *)(a1 + 32) ifNotSet:*(unsigned __int8 *)(a1 + 40)];
  debugInstance_objectForKey = result;
  return result;
}

BOOL __28__PLMonotonicTimer_schedule__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  schedule_classDebugEnabled = result;
  return result;
}

BOOL __28__PLMonotonicTimer_schedule__block_invoke_30(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  schedule_classDebugEnabled_29 = result;
  return result;
}

BOOL __28__PLMonotonicTimer_schedule__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  schedule_classDebugEnabled_36 = result;
  return result;
}

BOOL __27__PLMonotonicTimer__cancel__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  _cancel_classDebugEnabled = result;
  return result;
}

BOOL __27__PLMonotonicTimer__cancel__block_invoke_42(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  _cancel_classDebugEnabled_41 = result;
  return result;
}

BOOL __27__PLMonotonicTimer__cancel__block_invoke_48(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  _cancel_classDebugEnabled_47 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  timerFiredForMonotonicFireDate__classDebugEnabled = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_54(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  timerFiredForMonotonicFireDate__classDebugEnabled_53 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_60(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  timerFiredForMonotonicFireDate__classDebugEnabled_59 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_70(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_69 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_77(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  timerFiredForMonotonicFireDate__classDebugEnabled_76 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_83(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  timerFiredForMonotonicFireDate__classDebugEnabled_82 = result;
  return result;
}

- (void)reschedule
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__PLMonotonicTimer_reschedule__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v3;
    if (reschedule_defaultOnce != -1) {
      dispatch_once(&reschedule_defaultOnce, block);
    }
    if (reschedule_classDebugEnabled)
    {
      id v4 = [NSString stringWithFormat:@"begin for self=%@", self];
      objc_super v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
      char v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLMonotonicTimer reschedule]"];
      +[PLCoreStorage logMessage:v4 fromFile:v6 fromFunction:v7 fromLineNumber:222];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v9 = [(PLMonotonicTimer *)self monotonicFireDate];
  [(PLMonotonicTimer *)self _setMonotonicFireDate:0];
  id v10 = [(PLMonotonicTimer *)self canceledFireDates];
  int v11 = [v10 containsObject:v9];

  if (v11)
  {
    id v12 = [(PLMonotonicTimer *)self canceledFireDates];
    [v12 removeObject:v9];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __30__PLMonotonicTimer_reschedule__block_invoke_89;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v13;
      if (reschedule_defaultOnce_87 != -1) {
        dispatch_once(&reschedule_defaultOnce_87, v28);
      }
      if (reschedule_classDebugEnabled_88)
      {
        double v14 = NSString;
        uint64_t v15 = [(PLMonotonicTimer *)self canceledFireDates];
        uint64_t v16 = [v14 stringWithFormat:@"self=%@, self.canceledFireDates=%@", self, v15];

        v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
        v18 = [v17 lastPathComponent];
        uint64_t v19 = [NSString stringWithUTF8String:"-[PLMonotonicTimer reschedule]"];
        +[PLCoreStorage logMessage:v16 fromFile:v18 fromFunction:v19 fromLineNumber:231];

        uint64_t v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
  }
  [(PLMonotonicTimer *)self _setMonotonicFireDate:v9];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __30__PLMonotonicTimer_reschedule__block_invoke_95;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v27[4] = v21;
    if (reschedule_defaultOnce_93 != -1) {
      dispatch_once(&reschedule_defaultOnce_93, v27);
    }
    if (reschedule_classDebugEnabled_94)
    {
      uint64_t v22 = [NSString stringWithFormat:@"end for self=%@", self];
      id v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m"];
      uint64_t v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLMonotonicTimer reschedule]"];
      +[PLCoreStorage logMessage:v22 fromFile:v24 fromFunction:v25 fromLineNumber:235];

      v26 = PLLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __30__PLMonotonicTimer_reschedule__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  reschedule_classDebugEnabled = result;
  return result;
}

BOOL __30__PLMonotonicTimer_reschedule__block_invoke_89(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  reschedule_classDebugEnabled_88 = result;
  return result;
}

BOOL __30__PLMonotonicTimer_reschedule__block_invoke_95(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  reschedule_classDebugEnabled_94 = result;
  return result;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void)setQueue:(id)a3
{
}

- (void)setBlock:(id)a3
{
}

- (void)setCanceledFireDates:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWakeEntryNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeEntryNotification, 0);
  objc_storeStrong((id *)&self->_canceledFireDates, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monotonicFireDate, 0);
}

@end