@interface PLTimeReferenceBaseband
- (BOOL)followupCurrentTimeRunning;
- (PLNSNotificationOperatorComposition)basebandTimeNotification;
- (PLTimeReferenceBaseband)initWithTimeManager:(id)a3 entryDefinitionKey:(id)a4 timeReferenceType:(int64_t)a5;
- (id)currentTime;
- (void)dealloc;
- (void)registerForTimeChangedNotification;
- (void)setBasebandTimeNotification:(id)a3;
- (void)setFollowupCurrentTimeRunning:(BOOL)a3;
- (void)timeChangedNotificationReceived:(id)a3;
@end

@implementation PLTimeReferenceBaseband

- (PLTimeReferenceBaseband)initWithTimeManager:(id)a3 entryDefinitionKey:(id)a4 timeReferenceType:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PLTimeReferenceBaseband;
  v5 = [(PLTimeReferenceDynamic *)&v10 initWithTimeManager:a3 entryDefinitionKey:a4 timeReferenceType:a5];
  v6 = v5;
  if (v5)
  {
    v5->_followupCurrentTimeRunning = 0;
    v9.receiver = v5;
    v9.super_class = (Class)PLTimeReferenceBaseband;
    [(PLTimeReferenceDynamic *)&v9 setTooFarInFutureDistance:60.0];
    v8.receiver = v6;
    v8.super_class = (Class)PLTimeReferenceBaseband;
    [(PLTimeReferenceDynamic *)&v8 setTooFarInPastDistance:3600.0];
  }
  return v6;
}

- (void)registerForTimeChangedNotification
{
  v3 = [PLNSNotificationOperatorComposition alloc];
  v4 = +[PLUtilities workQueueForClass:objc_opt_class()];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PLTimeReferenceBaseband_registerForTimeChangedNotification__block_invoke;
  v7[3] = &unk_1E6253970;
  v7[4] = self;
  v5 = [(PLNSNotificationOperatorComposition *)v3 initWithWorkQueue:v4 forNotification:@"BasebandTimeChangeNotification" withBlock:v7];
  basebandTimeNotification = self->_basebandTimeNotification;
  self->_basebandTimeNotification = v5;
}

uint64_t __61__PLTimeReferenceBaseband_registerForTimeChangedNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) timeChangedNotificationReceived:a2];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PLTimeReferenceBaseband;
  [(PLTimeReferenceBaseband *)&v2 dealloc];
}

- (id)currentTime
{
  if (+[PLPlatform hasBaseband])
  {
    v3 = +[PLABMClient sharedABMClient];
    v4 = [v3 getBasebandTimeAndLatency];

    v5 = objc_opt_class();
    objc_sync_enter(v5);
    if ([(PLTimeReferenceBaseband *)self followupCurrentTimeRunning])
    {
      objc_sync_exit(v5);
    }
    else
    {
      [(PLTimeReferenceBaseband *)self setFollowupCurrentTimeRunning:1];
      v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [(PLTimeReferenceDynamic *)self setLastQueryTime:v13];

      objc_sync_exit(v5);
      v5 = +[PLUtilities workQueueForClass:objc_opt_class()];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PLTimeReferenceBaseband_currentTime__block_invoke_29;
      block[3] = &unk_1E62538C8;
      block[4] = self;
      dispatch_async(v5, block);
    }

    if (v4)
    {
      v14 = [v4 time];
      [v4 latency];
      v12 = [v14 dateByAddingTimeInterval:-v15];

      if (+[PLDefaults debugEnabled])
      {
        uint64_t v16 = objc_opt_class();
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __38__PLTimeReferenceBaseband_currentTime__block_invoke_37;
        v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v24[4] = v16;
        if (currentTime_defaultOnce_35 != -1) {
          dispatch_once(&currentTime_defaultOnce_35, v24);
        }
        if (currentTime_classDebugEnabled_36)
        {
          v17 = [NSString stringWithFormat:@"PLTimeReferenceBaseband::currentTime=%@", v12];
          v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceBaseband.m"];
          v19 = [v18 lastPathComponent];
          v20 = [NSString stringWithUTF8String:"-[PLTimeReferenceBaseband currentTime]"];
          +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:141];

          v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      v23.receiver = self;
      v23.super_class = (Class)PLTimeReferenceBaseband;
      [(PLTimeReferenceDynamic *)&v23 checkForTimeChangeWithCurrentTime:v12];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __38__PLTimeReferenceBaseband_currentTime__block_invoke;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v6;
      if (currentTime_defaultOnce != -1) {
        dispatch_once(&currentTime_defaultOnce, v26);
      }
      if (currentTime_classDebugEnabled)
      {
        v7 = [NSString stringWithFormat:@"PLTimeReferenceBaseband::currentTime: This device doesn't have a baseband. Getting system time instead"];
        objc_super v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceBaseband.m"];
        objc_super v9 = [v8 lastPathComponent];
        objc_super v10 = [NSString stringWithUTF8String:"-[PLTimeReferenceBaseband currentTime]"];
        +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:96];

        v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    v4 = [(PLTimeReference *)self timeManager];
    v12 = [v4 currentTimeFromTimeReference:1 toTimeReference:1];
  }

  return v12;
}

BOOL __38__PLTimeReferenceBaseband_currentTime__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  currentTime_classDebugEnabled = result;
  return result;
}

void __38__PLTimeReferenceBaseband_currentTime__block_invoke_29(uint64_t a1)
{
  objc_super v2 = 0;
  int v3 = 0;
  double v4 = 0.0;
  int v5 = 5;
  do
  {
    uint64_t v6 = +[PLABMClient sharedABMClient];
    v7 = [v6 getBasebandTimeAndLatency];

    if (v7)
    {
      [v7 latency];
      double v4 = v4 + v8;
      ++v3;
      id v9 = v7;

      objc_super v2 = v9;
    }

    --v5;
  }
  while (v5);
  if (v3 > 0)
  {
    objc_super v10 = [v2 time];
    v11 = [v10 dateByAddingTimeInterval:-v4 / (double)v3];

    if (+[PLDefaults debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PLTimeReferenceBaseband_currentTime__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v12;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce != -1) {
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce, block);
      }
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled)
      {
        v13 = [NSString stringWithFormat:@"PLTimeReferenceBaseband::currentTime - followupCurrentTime=%@", v11];
        v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceBaseband.m"];
        double v15 = [v14 lastPathComponent];
        uint64_t v16 = [NSString stringWithUTF8String:"-[PLTimeReferenceBaseband currentTime]_block_invoke"];
        +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:131];

        v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    v18.receiver = *(id *)(a1 + 32);
    v18.super_class = (Class)PLTimeReferenceBaseband;
    objc_msgSendSuper2(&v18, sel_checkForTimeChangeWithCurrentTime_, v11);
  }
  [*(id *)(a1 + 32) setFollowupCurrentTimeRunning:0];
}

BOOL __38__PLTimeReferenceBaseband_currentTime__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled = result;
  return result;
}

BOOL __38__PLTimeReferenceBaseband_currentTime__block_invoke_37(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  currentTime_classDebugEnabled_36 = result;
  return result;
}

- (void)timeChangedNotificationReceived:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [v5 objectForKeyedSubscript:@"year"];
  objc_msgSend(v6, "setYear:", objc_msgSend(v7, "integerValue"));

  double v8 = [v5 objectForKeyedSubscript:@"month"];
  objc_msgSend(v6, "setMonth:", objc_msgSend(v8, "integerValue"));

  id v9 = [v5 objectForKeyedSubscript:@"day"];
  objc_msgSend(v6, "setDay:", objc_msgSend(v9, "integerValue"));

  objc_super v10 = [v5 objectForKeyedSubscript:@"hour"];
  objc_msgSend(v6, "setHour:", objc_msgSend(v10, "integerValue"));

  v11 = [v5 objectForKeyedSubscript:@"minute"];
  objc_msgSend(v6, "setMinute:", objc_msgSend(v11, "integerValue"));

  uint64_t v12 = [v5 objectForKeyedSubscript:@"second"];

  objc_msgSend(v6, "setSecond:", objc_msgSend(v12, "integerValue"));
  id v13 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v14 = (void *)[v13 initWithCalendarIdentifier:*MEMORY[0x1E4F1C3B0]];
  double v15 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v14 setTimeZone:v15];

  uint64_t v16 = [v14 dateFromComponents:v6];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PLTimeReferenceBaseband_timeChangedNotificationReceived___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v17;
    if (timeChangedNotificationReceived__defaultOnce != -1) {
      dispatch_once(&timeChangedNotificationReceived__defaultOnce, block);
    }
    if (timeChangedNotificationReceived__classDebugEnabled)
    {
      objc_super v18 = [NSString stringWithFormat:@"PLTimeReferenceBaseband::timeChangedNotificationReceived currentTime=%@", v16];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceBaseband.m"];
      v20 = [v19 lastPathComponent];
      v21 = [NSString stringWithUTF8String:"-[PLTimeReferenceBaseband timeChangedNotificationReceived:]"];
      +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:164];

      v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)PLTimeReferenceBaseband;
  [(PLTimeReferenceDynamic *)&v23 checkForTimeChangeWithCurrentTime:v16];
}

BOOL __59__PLTimeReferenceBaseband_timeChangedNotificationReceived___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  timeChangedNotificationReceived__classDebugEnabled = result;
  return result;
}

- (PLNSNotificationOperatorComposition)basebandTimeNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBasebandTimeNotification:(id)a3
{
}

- (BOOL)followupCurrentTimeRunning
{
  return self->_followupCurrentTimeRunning;
}

- (void)setFollowupCurrentTimeRunning:(BOOL)a3
{
  self->_followupCurrentTimeRunning = a3;
}

- (void).cxx_destruct
{
}

@end