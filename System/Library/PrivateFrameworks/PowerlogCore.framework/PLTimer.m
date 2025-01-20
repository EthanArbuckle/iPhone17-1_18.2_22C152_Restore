@interface PLTimer
- (BOOL)repeats;
- (BOOL)timerActive;
- (NSDate)fireDate;
- (NSDate)lastSleepTime;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (PLEntryNotificationOperatorComposition)sleepEntryNotification;
- (PLEntryNotificationOperatorComposition)wakeEntryNotification;
- (PLTimer)initWithFireDate:(id)a3 withInterval:(double)a4 withTolerance:(double)a5 repeats:(BOOL)a6 withUserInfo:(id)a7 withQueue:(id)a8 withBlock:(id)a9;
- (double)interval;
- (double)tolerance;
- (id)block;
- (id)userInfo;
- (void)arm;
- (void)dealloc;
- (void)fire;
- (void)handleTimerFire;
- (void)invalidate;
- (void)setBlock:(id)a3;
- (void)setFireDate:(id)a3;
- (void)setInterval:(double)a3;
- (void)setLastSleepTime:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setSleepEntryNotification:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerActive:(BOOL)a3;
- (void)setTolerance:(double)a3;
- (void)setUserInfo:(id)a3;
- (void)setWakeEntryNotification:(id)a3;
@end

@implementation PLTimer

void __26__PLTimer_setTimerActive___block_invoke_23(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __26__PLTimer_setTimerActive___block_invoke_2_24;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce, &block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled)
    {
      v3 = NSString;
      v4 = [*(id *)(a1 + 32) queue];
      v5 = [v3 stringWithFormat:@"PLTimer::%@::setTimerActive: invalidate", v4, block, v11, v12, v13, v14];

      v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m"];
      v7 = [v6 lastPathComponent];
      v8 = [NSString stringWithUTF8String:"-[PLTimer setTimerActive:]_block_invoke"];
      +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:122];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

- (BOOL)timerActive
{
  uint64_t v2 = [(PLTimer *)self timer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

void __26__PLTimer_setTimerActive___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) handleTimerFire];
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    BOOL v3 = *(NSObject **)(v2 + 40);
    if (v3) {
      dispatch_source_cancel(v3);
    }
  }
  objc_sync_exit(obj);
}

- (void)handleTimerFire
{
  uint64_t v3 = [(PLTimer *)self queue];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(PLTimer *)self block];

    if (v5)
    {
      v6 = (void *)MEMORY[0x1C1869120]();
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v7 = objc_opt_class();
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        v20 = __26__PLTimer_handleTimerFire__block_invoke;
        v21 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v22 = v7;
        if (handleTimerFire_defaultOnce != -1) {
          dispatch_once(&handleTimerFire_defaultOnce, &block);
        }
        if (handleTimerFire_classDebugEnabled)
        {
          v8 = NSString;
          v9 = [(PLTimer *)self queue];
          v10 = [v8 stringWithFormat:@"PLTimer::%@::TimerFire", v9, block, v19, v20, v21, v22];

          uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m"];
          v12 = [v11 lastPathComponent];
          v13 = [NSString stringWithUTF8String:"-[PLTimer handleTimerFire]"];
          +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:146];

          uint64_t v14 = PLLogCommon();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      v15 = [(PLTimer *)self block];
      v16 = [(PLTimer *)self fireDate];
      v17 = [(PLTimer *)self userInfo];
      ((void (**)(void, void *, void *))v15)[2](v15, v16, v17);
    }
  }
}

- (id)block
{
  return objc_getProperty(self, a2, 32, 1);
}

void __26__PLTimer_setTimerActive___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) invalidate];
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 1uLL, 0, v3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(a1 + 32) + 16) timeIntervalSinceNow];
  double v8 = v7 * 1000000000.0;
  BOOL v9 = v7 < 0.0;
  double v10 = 0.0;
  if (!v9) {
    double v10 = v8;
  }
  if (v10 > 9.22337204e18) {
    double v10 = 9.22337204e18;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  unint64_t v12 = (unint64_t)(*(double *)(v11 + 48) * 1000000000.0);
  v13 = *(NSObject **)(v11 + 40);
  dispatch_time_t v14 = dispatch_time(0, (uint64_t)v10);
  uint64_t v15 = *(void *)(a1 + 32);
  if (v12)
  {
    if (*(unsigned char *)(v15 + 8)) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = -1;
    }
  }
  else
  {
    uint64_t v16 = -1;
  }
  dispatch_source_set_timer(v13, v14, v16, (unint64_t)(*(double *)(v15 + 56) * 1000000000.0));
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(NSObject **)(v17 + 40);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __26__PLTimer_setTimerActive___block_invoke_2;
  handler[3] = &unk_1E62538C8;
  handler[4] = v17;
  dispatch_source_set_event_handler(v18, handler);
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __26__PLTimer_setTimerActive___block_invoke_3;
    v31 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v32 = v19;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_2 != -1) {
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_2, &block);
    }
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_2)
    {
      v20 = NSString;
      v21 = [*(id *)(a1 + 32) queue];
      uint64_t v22 = [*(id *)(a1 + 32) fireDate];
      v23 = [v20 stringWithFormat:@"PLTimer::%@::setTimerActive: created timer with fireDate=%@", v21, v22, block, v29, v30, v31, v32];

      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"-[PLTimer setTimerActive:]_block_invoke"];
      +[PLCoreStorage logMessage:v23 fromFile:v25 fromFunction:v26 fromLineNumber:116];

      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  objc_sync_exit(v2);
}

- (void)invalidate
{
  id v2 = self;
  objc_sync_enter(v2);
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __21__PLTimer_invalidate__block_invoke;
    uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v3;
    if (invalidate_defaultOnce != -1) {
      dispatch_once(&invalidate_defaultOnce, &block);
    }
    if (invalidate_classDebugEnabled)
    {
      dispatch_source_t v4 = NSString;
      uint64_t v5 = [(PLTimer *)v2 queue];
      v6 = [v4 stringWithFormat:@"PLTimer::%@:: invalidate", v5, block, v14, v15, v16, v17];

      double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m"];
      double v8 = [v7 lastPathComponent];
      BOOL v9 = [NSString stringWithUTF8String:"-[PLTimer invalidate]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:70];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  timer = v2->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    unint64_t v12 = v2->_timer;
    v2->_timer = 0;
  }
  objc_sync_exit(v2);
}

- (void)setTimerActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PLTimer *)self queue];
  if (v3)
  {
    v6 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    double v7 = __26__PLTimer_setTimerActive___block_invoke;
  }
  else
  {
    v6 = &v8;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    double v7 = __26__PLTimer_setTimerActive___block_invoke_23;
  }
  v6[2] = (uint64_t)v7;
  v6[3] = (uint64_t)&unk_1E62538C8;
  v6[4] = (uint64_t)self;
  +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v5, v8, v9);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 64, 1);
}

- (NSDate)fireDate
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_fireDate;
  objc_sync_exit(v2);

  return v3;
}

- (void)dealloc
{
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __18__PLTimer_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (dealloc_defaultOnce != -1) {
      dispatch_once(&dealloc_defaultOnce, block);
    }
    if (dealloc_classDebugEnabled)
    {
      dispatch_source_t v4 = NSString;
      uint64_t v5 = [(PLTimer *)self queue];
      v6 = [v4 stringWithFormat:@"PLTimer::%@::dealloc: self=%@", v5, self];

      double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m"];
      uint64_t v8 = [v7 lastPathComponent];
      uint64_t v9 = [NSString stringWithUTF8String:"-[PLTimer dealloc]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:57];

      double v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  [(PLTimer *)self setTimerActive:0];
  v11.receiver = self;
  v11.super_class = (Class)PLTimer;
  [(PLTimer *)&v11 dealloc];
}

- (void)setFireDate:(id)a3
{
  dispatch_source_t v4 = (NSDate *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  fireDate = v5->_fireDate;
  v5->_fireDate = v4;

  objc_sync_exit(v5);
  [(PLTimer *)v5 setTimerActive:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSleepTime, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotification, 0);
  objc_storeStrong((id *)&self->_sleepEntryNotification, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
}

- (PLTimer)initWithFireDate:(id)a3 withInterval:(double)a4 withTolerance:(double)a5 repeats:(BOOL)a6 withUserInfo:(id)a7 withQueue:(id)a8 withBlock:(id)a9
{
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = v20;
  uint64_t v22 = 0;
  if (v19 && v20)
  {
    v28.receiver = self;
    v28.super_class = (Class)PLTimer;
    v23 = [(PLTimer *)&v28 init];
    v24 = v23;
    if (v23)
    {
      objc_storeStrong((id *)&v23->_queue, a8);
      objc_storeStrong((id *)&v24->_fireDate, a3);
      v24->_interval = a4;
      v24->_tolerance = a5;
      v24->_repeats = a6;
      objc_storeStrong(&v24->_userInfo, a7);
      uint64_t v25 = MEMORY[0x1C1869370](v21);
      id block = v24->_block;
      v24->_id block = (id)v25;

      [(PLTimer *)v24 setTimerActive:v17 != 0];
    }
    self = v24;
    uint64_t v22 = self;
  }

  return v22;
}

BOOL __18__PLTimer_dealloc__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  dealloc_classDebugEnabled = result;
  return result;
}

- (void)fire
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __15__PLTimer_fire__block_invoke;
  block[3] = &unk_1E62538C8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __15__PLTimer_fire__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleTimerFire];
}

BOOL __21__PLTimer_invalidate__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  invalidate_classDebugEnabled = result;
  return result;
}

- (void)arm
{
  if (!self->_fireDate) {
    [(PLTimer *)self setTimerActive:1];
  }
}

BOOL __26__PLTimer_setTimerActive___block_invoke_3(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_2 = result;
  return result;
}

BOOL __26__PLTimer_setTimerActive___block_invoke_2_24(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled = result;
  return result;
}

BOOL __26__PLTimer_handleTimerFire__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  handleTimerFire_classDebugEnabled = result;
  return result;
}

- (void)setQueue:(id)a3
{
}

- (void)setBlock:(id)a3
{
}

- (void)setTimer:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)tolerance
{
  return self->_tolerance;
}

- (void)setTolerance:(double)a3
{
  self->_tolerance = a3;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (void)setUserInfo:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)sleepEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSleepEntryNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWakeEntryNotification:(id)a3
{
}

- (NSDate)lastSleepTime
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastSleepTime:(id)a3
{
}

@end