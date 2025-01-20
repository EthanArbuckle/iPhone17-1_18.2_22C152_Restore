@interface ULHomeSlamAnalytics
+ (id)shared;
- (BOOL)dependenciesSet;
- (OS_dispatch_queue)queue;
- (ULDatabase)db;
- (ULEnvironment)environment;
- (ULHomeSlamAnalytics)init;
- (id)_createBGTRequest;
- (uint64_t)logEventDaemonStartedAtTimestamp:(void *)a1;
- (uint64_t)logEventEnterHomeLOIAtTimestamp:(void *)a1;
- (uint64_t)logEventExitHomeLOIAtTimestamp:(void *)a1;
- (uint64_t)logEventOdometryStartedAtTimestamp:(void *)a1;
- (uint64_t)logEventOdometryStoppedAtTimestamp:(void *)a1;
- (uint64_t)logEventScreenOffAtTimestamp:(void *)a1;
- (uint64_t)logEventScreenOnAtTimestamp:(void *)a1;
- (uint64_t)logEventSleepStateRegisterAtTimestamp:(void *)a1;
- (uint64_t)logSleepStateEvent:(uint64_t)a3 atTimestamp:(int)a4;
- (void)_logEventType:(uint64_t)a3 atTimestamp:(__int16)a4;
- (void)_registerForBackgroundTask;
- (void)_runStopDetectionAnalyticsTask;
- (void)_unregisterForBackgroundTask;
- (void)dealloc;
- (void)resetDependencies;
- (void)setDb:(ULDatabase *)a3;
- (void)setDependenciesAndRegisterToBackgroundTaskWithDB:(ULDatabase *)a3 environment:(id)a4;
- (void)setDependenciesSet:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ULHomeSlamAnalytics

+ (id)shared
{
  if (ULSettings::get<ULSettings::LogOdometryAnalyticsEnabled>())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__ULHomeSlamAnalytics_shared__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[ULHomeSlamAnalytics shared]::onceToken != -1) {
      dispatch_once(&+[ULHomeSlamAnalytics shared]::onceToken, block);
    }
    id v3 = (id)+[ULHomeSlamAnalytics shared]::sharedInstance;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void __29__ULHomeSlamAnalytics_shared__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[ULHomeSlamAnalytics shared]::sharedInstance;
  +[ULHomeSlamAnalytics shared]::sharedInstance = (uint64_t)v1;
}

- (ULHomeSlamAnalytics)init
{
  v6.receiver = self;
  v6.super_class = (Class)ULHomeSlamAnalytics;
  v2 = [(ULHomeSlamAnalytics *)&v6 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.milod.homeSlamAnalytics", v3);
    [(ULHomeSlamAnalytics *)v2 setQueue:v4];
  }
  return v2;
}

- (void)setDependenciesAndRegisterToBackgroundTaskWithDB:(ULDatabase *)a3 environment:(id)a4
{
  id v6 = a4;
  v7 = [(ULHomeSlamAnalytics *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__ULHomeSlamAnalytics_setDependenciesAndRegisterToBackgroundTaskWithDB_environment___block_invoke;
  block[3] = &unk_2653F97D0;
  id v10 = v6;
  v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __84__ULHomeSlamAnalytics_setDependenciesAndRegisterToBackgroundTaskWithDB_environment___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDb:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setEnvironment:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _registerForBackgroundTask];
  v2 = *(void **)(a1 + 32);
  return [v2 setDependenciesSet:1];
}

- (void)resetDependencies
{
  id v3 = [(ULHomeSlamAnalytics *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ULHomeSlamAnalytics_resetDependencies__block_invoke;
  block[3] = &unk_2653F97F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __40__ULHomeSlamAnalytics_resetDependencies__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDb:0];
  [*(id *)(a1 + 32) setEnvironment:0];
  [*(id *)(a1 + 32) _unregisterForBackgroundTask];
  v2 = *(void **)(a1 + 32);
  return [v2 setDependenciesSet:0];
}

- (void)dealloc
{
  [(ULHomeSlamAnalytics *)self _unregisterForBackgroundTask];
  v3.receiver = self;
  v3.super_class = (Class)ULHomeSlamAnalytics;
  [(ULHomeSlamAnalytics *)&v3 dealloc];
}

- (uint64_t)logEventDaemonStartedAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 4);
}

- (uint64_t)logEventScreenOnAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 0);
}

- (uint64_t)logEventScreenOffAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 1);
}

- (uint64_t)logEventOdometryStartedAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 2);
}

- (uint64_t)logEventOdometryStoppedAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 3);
}

- (uint64_t)logEventEnterHomeLOIAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 5);
}

- (uint64_t)logEventExitHomeLOIAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 6);
}

- (uint64_t)logEventSleepStateRegisterAtTimestamp:(void *)a1
{
  return objc_msgSend(a1, "_logEventType:atTimestamp:", 100);
}

- (uint64_t)logSleepStateEvent:(uint64_t)a3 atTimestamp:(int)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a4 > 29)
  {
    switch(a4)
    {
      case 30:
        uint64_t v7 = 104;
        return [a1 _logEventType:v7 atTimestamp:a2];
      case 40:
        uint64_t v7 = 105;
        return [a1 _logEventType:v7 atTimestamp:a2];
      case 50:
        uint64_t v7 = 106;
        return [a1 _logEventType:v7 atTimestamp:a2];
    }
    goto LABEL_13;
  }
  if (!a4)
  {
LABEL_21:
    uint64_t v7 = 101;
    return [a1 _logEventType:v7 atTimestamp:a2];
  }
  if (a4 == 10)
  {
    uint64_t v7 = 102;
    return [a1 _logEventType:v7 atTimestamp:a2];
  }
  if (a4 != 20)
  {
LABEL_13:
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_34);
    }
    id v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = "";
      __int16 v15 = 1026;
      int v16 = a4;
      _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"received unknown ULSleepWakeState value\", \"state\":%{public}d}", (uint8_t *)&v11, 0x18u);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_34);
    }
    v9 = logObject_MicroLocation_Default;
    if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
    {
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = "";
      __int16 v15 = 1026;
      int v16 = a4;
      _os_signpost_emit_with_name_impl(&dword_25631F000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "received unknown ULSleepWakeState value", "{\"msg%{public}.0s\":\"received unknown ULSleepWakeState value\", \"state\":%{public}d}", (uint8_t *)&v11, 0x18u);
    }
    goto LABEL_21;
  }
  uint64_t v7 = 103;
  return [a1 _logEventType:v7 atTimestamp:a2];
}

- (void)_logEventType:(uint64_t)a3 atTimestamp:(__int16)a4
{
  uint64_t v7 = [a1 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ULHomeSlamAnalytics__logEventType_atTimestamp___block_invoke;
  block[3] = &unk_2653F9820;
  __int16 v9 = a4;
  *(double *)&void block[5] = a2;
  block[4] = a1;
  dispatch_async(v7, block);
}

void __49__ULHomeSlamAnalytics__logEventType_atTimestamp___block_invoke(uint64_t a1)
{
  CLMiLoHomeSlamAnalyticEventTable::Entry::Entry((uint64_t)&v7, *(_WORD *)(a1 + 48), *(double *)(a1 + 40));
  id v2 = *(id *)([*(id *)(a1 + 32) db] + 128);
  objc_super v3 = operator new(0x10uLL);
  v5 = v3 + 8;
  id v6 = (char *)(v3 + 8);
  *(void *)objc_super v3 = v7;
  v3[4] = v8;
  __p = v3;
  [v2 insertEntries:&__p];
  if (__p)
  {
    v5 = __p;
    operator delete(__p);
  }
}

- (void)_registerForBackgroundTask
{
  objc_initWeak(&location, self);
  objc_super v3 = [(ULHomeSlamAnalytics *)self environment];
  dispatch_queue_t v4 = [v3 backgroundSystemTaskManager];
  v5 = [(ULHomeSlamAnalytics *)self _createBGTRequest];
  id v6 = [(ULHomeSlamAnalytics *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__ULHomeSlamAnalytics__registerForBackgroundTask__block_invoke;
  v7[3] = &unk_2653F9848;
  objc_copyWeak(&v8, &location);
  [v4 registerAndSubmitTaskWithRequest:v5 usingQueue:v6 launchHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__ULHomeSlamAnalytics__registerForBackgroundTask__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [WeakRetained queue];
    dispatch_assert_queue_V2(v1);

    [WeakRetained _runStopDetectionAnalyticsTask];
  }
}

- (void)_unregisterForBackgroundTask
{
  id v3 = [(ULHomeSlamAnalytics *)self environment];
  id v2 = [v3 backgroundSystemTaskManager];
  [v2 deregisterAndCancelTaskWithIdentifier:@"com.apple.milod.homeSlamAnalytics"];
}

- (id)_createBGTRequest
{
  id v2 = +[ULDefaultsSingleton shared];
  id v3 = [v2 defaultsDictionary];

  dispatch_queue_t v4 = [NSString stringWithUTF8String:"ULHomeSlamAnalyticsInterval"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v6 = [v5 intValue];
  }
  else {
    int v6 = [&unk_2704F16C8 intValue];
  }
  int v7 = v6;

  id v8 = [[ULBGRepeatingSystemTaskRequest alloc] initWithIdentifier:@"com.apple.milod.homeSlamAnalytics" interval:(double)v7 minDurationBetweenInstances:(double)v7 * 0.8];
  [(ULBGSystemTaskRequest *)v8 setPriority:1];
  [(ULBGSystemTaskRequest *)v8 setRequiresProtectionClass:0];
  [(ULBGSystemTaskRequest *)v8 setResourceIntensive:1];
  [(ULBGSystemTaskRequest *)v8 setResources:7];
  [(ULBGSystemTaskRequest *)v8 setRequiresBuddyComplete:1];
  [(ULBGSystemTaskRequest *)v8 setRequiresUserInactivity:1];
  [(ULBGSystemTaskRequest *)v8 setPostInstall:0];
  return v8;
}

- (void)_runStopDetectionAnalyticsTask
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (ULSettings::get<ULSettings::LogOdometryAnalyticsEnabled>())
  {
    id v3 = [[ULHomeSlamAnalyticEventAnalyzer alloc] initWithDB:[(ULHomeSlamAnalytics *)self db]];
    dispatch_queue_t v4 = [(ULHomeSlamAnalyticEventAnalyzer *)v3 runStopDetectionAnalysisAtTimepoint:cl::chrono::CFAbsoluteTimeClock::now()];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_34);
    }
    v5 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = "";
      __int16 v11 = 2082;
      uint64_t v12 = [@"com.apple.MicroLocation.AllDayTriggers" UTF8String];
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"sending CoreAnalytics event\", \"event type\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
    }

    AnalyticsSendEvent();
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_34);
    }
    int v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289026;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = "";
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"not running homeslam analytics, since sending to core-analytics is disabled\"}", (uint8_t *)&v7, 0x12u);
    }
  }
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
}

- (ULEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)dependenciesSet
{
  return self->_dependenciesSet;
}

- (void)setDependenciesSet:(BOOL)a3
{
  self->_dependenciesSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end