@interface MSDSystemMonitor
+ (id)sharedInstance;
- (BOOL)coreDuetTriggeredPause;
- (BOOL)diskSpaceTriggeredPause;
- (MSDSystemMonitorObserver)observer;
- (NSSet)foregroundAllowedApps;
- (NSTimer)diskSpaceMonitoringTimer;
- (_CDClientContext)coreDuetContext;
- (_CDContextualChangeRegistration)applicationRegistration;
- (unint64_t)systemIdleDuration;
- (void)processCoreDuetCallBack;
- (void)processDiskSpaceMonitorCallback;
- (void)registerObserver:(id)a3;
- (void)setApplicationRegistration:(id)a3;
- (void)setCoreDuetTriggeredPause:(BOOL)a3;
- (void)setDiskSpaceMonitoringTimer:(id)a3;
- (void)setDiskSpaceTriggeredPause:(BOOL)a3;
- (void)setForegroundAllowedApps:(id)a3;
- (void)setObserver:(id)a3;
- (void)startDiskSpaceMonitoring;
- (void)startPowerForegroundAppMonitoring;
- (void)startSystemIdleDetection;
- (void)stopDiskSpaceMonitoring;
- (void)stopSystemIdleDetection;
- (void)unregisterObserver;
@end

@implementation MSDSystemMonitor

+ (id)sharedInstance
{
  if (qword_100189BF8 != -1) {
    dispatch_once(&qword_100189BF8, &stru_100153720);
  }
  v2 = (void *)qword_100189BF0;

  return v2;
}

- (unint64_t)systemIdleDuration
{
  v3 = [(MSDSystemMonitor *)self coreDuetContext];
  v4 = +[_CDContextQueries keyPathForInUseStatus];
  v5 = [v3 objectForKeyedSubscript:v4];

  if ([v5 BOOLValue])
  {
    unint64_t v6 = 0;
  }
  else
  {
    v7 = [(MSDSystemMonitor *)self coreDuetContext];
    v8 = +[_CDContextQueries keyPathForLastUseDate];
    v9 = [v7 objectForKeyedSubscript:v8];

    v10 = +[NSDate now];
    [v10 timeIntervalSinceDate:v9];
    double v12 = v11;

    double v13 = 0.0;
    if (v12 > 0.0) {
      double v13 = v12;
    }
    unint64_t v6 = (unint64_t)v13;
  }
  return v6;
}

- (void)registerObserver:(id)a3
{
  id v6 = a3;
  if (([v6 conformsToProtocol:&OBJC_PROTOCOL___MSDSystemMonitorObserver] & 1) == 0)
  {
    v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MSDSystemMonitor.m" lineNumber:123 description:@"Observer does not conform to protocol"];
  }
  [(MSDSystemMonitor *)self setObserver:v6];
}

- (void)unregisterObserver
{
}

- (void)startSystemIdleDetection
{
  [(MSDSystemMonitor *)self setCoreDuetTriggeredPause:0];
  [(MSDSystemMonitor *)self setDiskSpaceTriggeredPause:0];
  [(MSDSystemMonitor *)self startPowerForegroundAppMonitoring];

  [(MSDSystemMonitor *)self startDiskSpaceMonitoring];
}

- (void)stopSystemIdleDetection
{
  [(MSDSystemMonitor *)self setCoreDuetTriggeredPause:0];
  [(MSDSystemMonitor *)self setDiskSpaceTriggeredPause:0];
  v3 = [(MSDSystemMonitor *)self coreDuetContext];
  v4 = [(MSDSystemMonitor *)self applicationRegistration];
  [v3 deregisterCallback:v4];

  [(MSDSystemMonitor *)self stopDiskSpaceMonitoring];
}

- (_CDClientContext)coreDuetContext
{
  return (_CDClientContext *)+[_CDClientContext userContext];
}

- (void)startDiskSpaceMonitoring
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008A078;
  v2[3] = &unk_100151AC8;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)stopDiskSpaceMonitoring
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008A204;
  v2[3] = &unk_100151AC8;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)processDiskSpaceMonitorCallback
{
  obj = self;
  objc_sync_enter(obj);
  v2 = +[MSDTargetDevice sharedInstance];
  id v3 = [v2 getFreeSpace];

  if ((unint64_t)v3 + 0xFFFFF > 0x1FFFFE)
  {
    [(MSDSystemMonitor *)obj setDiskSpaceTriggeredPause:0];
    CFStringRef v4 = 0;
  }
  else
  {
    [(MSDSystemMonitor *)obj setDiskSpaceTriggeredPause:1];
    CFStringRef v4 = @"diskSpaceTriggeredPause";
  }
  v5 = [(MSDSystemMonitor *)obj observer];

  if (v5)
  {
    id v6 = [(MSDSystemMonitor *)obj observer];
    uint64_t v7 = [(MSDSystemMonitor *)obj coreDuetTriggeredPause]
      || [(MSDSystemMonitor *)obj diskSpaceTriggeredPause];
    [v6 didReceiveNewPauseStatus:v7 forReason:v4];
  }
  objc_sync_exit(obj);
}

- (void)startPowerForegroundAppMonitoring
{
  objc_initWeak(&location, self);
  id v3 = +[_CDContextQueries keyPathForInUseStatus];
  v16[0] = v3;
  CFStringRef v4 = +[_CDContextQueries keyPathForForegroundApp];
  v16[1] = v4;
  v5 = +[_CDContextQueries keyPathForBatteryLevel];
  v16[2] = v5;
  id v6 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  v16[3] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v16 count:4];
  v8 = +[_CDContextualPredicate predicateForChangeAtKeyPaths:v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008A5F4;
  v13[3] = &unk_100153748;
  objc_copyWeak(&v14, &location);
  v9 = objc_retainBlock(v13);
  v10 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.mobilestoredemo" contextualPredicate:v8 callback:v9];
  [(MSDSystemMonitor *)self setApplicationRegistration:v10];

  double v11 = [(MSDSystemMonitor *)self coreDuetContext];
  double v12 = [(MSDSystemMonitor *)self applicationRegistration];
  [v11 registerCallback:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)processCoreDuetCallBack
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MSDSystemMonitor *)v2 coreDuetContext];
  CFStringRef v4 = +[_CDContextQueries keyPathForForegroundApp];
  v5 = [v3 objectForKeyedSubscript:v4];

  id v6 = [(MSDSystemMonitor *)v2 coreDuetContext];
  uint64_t v7 = +[_CDContextQueries keyPathForInUseStatus];
  v8 = [v6 objectForKeyedSubscript:v7];
  unsigned int v9 = [v8 BOOLValue];

  v10 = [(MSDSystemMonitor *)v2 coreDuetContext];
  double v11 = +[_CDContextQueries keyPathForBatteryLevel];
  double v12 = [v10 objectForKeyedSubscript:v11];
  id v13 = [v12 unsignedIntegerValue];

  id v14 = [(MSDSystemMonitor *)v2 coreDuetContext];
  uint64_t v15 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  v16 = [v14 objectForKeyedSubscript:v15];

  v17 = +[MSDPlatform sharedInstance];
  LOBYTE(v15) = [v17 tvOS];

  if (v15)
  {
LABEL_2:
    int v18 = 0;
    CFStringRef v19 = 0;
    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  CFStringRef v19 = @"batteryLevelTriggeredPause";
  if ((unint64_t)v13 >= 0x15)
  {
    if ((unint64_t)v13 <= 0x31)
    {
      v23 = +[_CDContextQueries batteryExternalConnectedKey];
      v24 = [v16 objectForKey:v23];
      unsigned int v25 = [v24 BOOLValue];

      if (v25) {
        CFStringRef v19 = 0;
      }
      int v18 = v25 ^ 1;
      if (!v9) {
        goto LABEL_13;
      }
      goto LABEL_6;
    }
    goto LABEL_2;
  }
  int v18 = 1;
  if (!v9)
  {
LABEL_13:
    int v22 = 0;
    goto LABEL_14;
  }
LABEL_6:
  v20 = [(MSDSystemMonitor *)v2 foregroundAllowedApps];
  unsigned int v21 = [v20 containsObject:v5];

  int v22 = v21 ^ 1;
  if (!v21) {
    CFStringRef v19 = @"systemInUseTriggeredPause";
  }
LABEL_14:
  v26 = sub_100068600();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_1000D6498((uint64_t)v5, v9, v26);
  }

  [(MSDSystemMonitor *)v2 setCoreDuetTriggeredPause:v18 | v22];
  v27 = [(MSDSystemMonitor *)v2 observer];

  if (v27)
  {
    v28 = [(MSDSystemMonitor *)v2 observer];
    uint64_t v29 = [(MSDSystemMonitor *)v2 coreDuetTriggeredPause]
       || [(MSDSystemMonitor *)v2 diskSpaceTriggeredPause];
    [v28 didReceiveNewPauseStatus:v29 forReason:v19];
  }
  objc_sync_exit(v2);
}

- (_CDContextualChangeRegistration)applicationRegistration
{
  return self->_applicationRegistration;
}

- (void)setApplicationRegistration:(id)a3
{
}

- (NSTimer)diskSpaceMonitoringTimer
{
  return self->_diskSpaceMonitoringTimer;
}

- (void)setDiskSpaceMonitoringTimer:(id)a3
{
}

- (NSSet)foregroundAllowedApps
{
  return self->_foregroundAllowedApps;
}

- (void)setForegroundAllowedApps:(id)a3
{
}

- (MSDSystemMonitorObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (MSDSystemMonitorObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (BOOL)coreDuetTriggeredPause
{
  return self->_coreDuetTriggeredPause;
}

- (void)setCoreDuetTriggeredPause:(BOOL)a3
{
  self->_coreDuetTriggeredPause = a3;
}

- (BOOL)diskSpaceTriggeredPause
{
  return self->_diskSpaceTriggeredPause;
}

- (void)setDiskSpaceTriggeredPause:(BOOL)a3
{
  self->_diskSpaceTriggeredPause = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_foregroundAllowedApps, 0);
  objc_storeStrong((id *)&self->_diskSpaceMonitoringTimer, 0);

  objc_storeStrong((id *)&self->_applicationRegistration, 0);
}

@end