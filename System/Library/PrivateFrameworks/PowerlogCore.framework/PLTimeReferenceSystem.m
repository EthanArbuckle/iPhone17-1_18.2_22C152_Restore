@interface PLTimeReferenceSystem
- (id)currentTime;
- (void)dealloc;
- (void)registerForClockSetNotification;
- (void)registerForDayChangedNotification;
- (void)registerForTimeChangedNotification;
- (void)registerForTimeZoneChangedNotification;
- (void)timeChangedToMidnightLocalTime;
@end

@implementation PLTimeReferenceSystem

- (void)registerForTimeChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)timeChangedNotificationReceived, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)registerForClockSetNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)clockSetNotificationReceived, @"com.apple.system.clock_set", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)registerForDayChangedNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_dayChangedNotificationReceived_ name:*MEMORY[0x1E4F1C2E0] object:0];
}

- (void)registerForTimeZoneChangedNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_timeZoneChangedNotificationReceived_ name:*MEMORY[0x1E4F1C4F8] object:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)PLTimeReferenceSystem;
  [(PLTimeReferenceSystem *)&v4 dealloc];
}

- (id)currentTime
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  objc_super v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLTimeReferenceDynamic *)self setLastQueryTime:v4];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PLTimeReferenceSystem_currentTime__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (currentTime_defaultOnce_1 != -1) {
      dispatch_once(&currentTime_defaultOnce_1, block);
    }
    if (currentTime_classDebugEnabled_1)
    {
      v6 = [NSString stringWithFormat:@"PLTimeReferenceSystem::currentTime=%@", v3];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceSystem.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLTimeReferenceSystem currentTime]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:46];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        [(PLSubmissionFileSP *)(uint64_t)v6 copyAndPrepareLog];
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PLTimeReferenceSystem;
  [(PLTimeReferenceDynamic *)&v12 checkForTimeChangeWithCurrentTime:v3];
  return v3;
}

BOOL __36__PLTimeReferenceSystem_currentTime__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  currentTime_classDebugEnabled_1 = result;
  return result;
}

- (void)timeChangedToMidnightLocalTime
{
  v14.receiver = self;
  v14.super_class = (Class)PLTimeReferenceSystem;
  id v3 = [(PLTimeReferenceDynamic *)&v14 timeChangeBlocks];
  objc_sync_enter(v3);
  v13.receiver = self;
  v13.super_class = (Class)PLTimeReferenceSystem;
  objc_super v4 = [(PLTimeReferenceDynamic *)&v13 timeChangeBlocks];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"PLCoreStorage"];

  if (v5)
  {
    v5[2](v5, 0.0);
  }
  else if (+[PLDefaults debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PLTimeReferenceSystem_timeChangedToMidnightLocalTime__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (timeChangedToMidnightLocalTime_defaultOnce != -1) {
      dispatch_once(&timeChangedToMidnightLocalTime_defaultOnce, block);
    }
    if (timeChangedToMidnightLocalTime_classDebugEnabled)
    {
      v7 = [NSString stringWithFormat:@"PLTimeReferenceSystem::timeChangedToMidnightLocalTime: No timeChangeBlock for PLCoreStorage"];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceSystem.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLTimeReferenceSystem timeChangedToMidnightLocalTime]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:55];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        [(PLSubmissionFileSP *)(uint64_t)v7 copyAndPrepareLog];
      }
    }
  }

  objc_sync_exit(v3);
}

BOOL __55__PLTimeReferenceSystem_timeChangedToMidnightLocalTime__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  timeChangedToMidnightLocalTime_classDebugEnabled = result;
  return result;
}

@end