@interface WakingTimerScheduler
+ (id)sharedInstance;
+ (unint64_t)now;
+ (void)cancelScheduledWake:(id)a3;
- (BOOL)dispatchTimerScheduled;
- (IONotificationPort)systemPowerPort;
- (NSDate)requestedWakeDate;
- (NSHashTable)timers;
- (OS_dispatch_source)dispatchTimer;
- (WakingTimer)timerWithEarliestDeadline;
- (WakingTimerScheduler)init;
- (unsigned)systemPowerConnection;
- (unsigned)systemPowerNotifier;
- (void)cancelScheduledWake;
- (void)cancelTimer:(id)a3;
- (void)clearDispatchTimer;
- (void)evaluateTimers;
- (void)evaluateTimers:(unint64_t)a3;
- (void)handleTimeEvent;
- (void)scheduleTimer:(id)a3;
- (void)scheduleTimerWithEarliestDeadline:(id)a3 now:(unint64_t)a4;
- (void)scheduleWakeWithDelayBeforeFireTime:(unint64_t)a3 gracePeriod:(double)a4;
- (void)setDispatchTimer:(id)a3;
- (void)setDispatchTimerScheduled:(BOOL)a3;
- (void)setRequestedWakeDate:(id)a3;
- (void)setSystemPowerConnection:(unsigned int)a3;
- (void)setSystemPowerNotifier:(unsigned int)a3;
- (void)setSystemPowerPort:(IONotificationPort *)a3;
- (void)setTimerWithEarliestDeadline:(id)a3;
- (void)setTimers:(id)a3;
- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4;
@end

@implementation WakingTimerScheduler

- (WakingTimerScheduler)init
{
  v37.receiver = self;
  v37.super_class = (Class)WakingTimerScheduler;
  id v2 = [(WakingTimerScheduler *)&v37 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    v5 = +[MagicSwitchEnabler sharedInstance];
    v6 = [v5 workQueue];
    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    v9 = *((void *)v2 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100009300;
    handler[3] = &unk_100018538;
    id v10 = v2;
    id v36 = v10;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 5), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    int out_token = 0;
    v11 = +[MagicSwitchEnabler sharedInstance];
    v12 = [v11 workQueue];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100009374;
    v32[3] = &unk_100018650;
    id v13 = v10;
    id v33 = v13;
    uint32_t v14 = notify_register_dispatch("com.apple.system.timezone", &out_token, v12, v32);

    if (v14)
    {
      v15 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v39 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed to register observer for the time zone change notification with status: (%u)", buf, 8u);
      }
    }
    v16 = +[MagicSwitchEnabler sharedInstance];
    v17 = [v16 workQueue];
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_1000093E8;
    v30 = &unk_100018650;
    id v18 = v13;
    id v31 = v18;
    uint32_t v19 = notify_register_dispatch("com.apple.system.clock_set", &out_token, v17, &v27);

    if (v19)
    {
      v20 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v39 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed to register observer for the system clock change notification with status: (%u)", buf, 8u);
      }
    }
    io_connect_t v21 = IORegisterForSystemPower(v18, (IONotificationPortRef *)v18 + 7, (IOServiceInterestCallback)j__objc_msgSend_systemPowerChanged_notificationID_, (io_object_t *)v18 + 4);
    *((_DWORD *)v18 + 3) = v21;
    if (v21)
    {
      v22 = (IONotificationPort *)*((void *)v18 + 7);
      v23 = +[MagicSwitchEnabler sharedInstance];
      v24 = [v23 workQueue];
      IONotificationPortSetDispatchQueue(v22, v24);
    }
    else
    {
      v25 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed to register for Power events!", buf, 2u);
      }
    }
  }
  return (WakingTimerScheduler *)v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009500;
  block[3] = &unk_100018670;
  block[4] = a1;
  if (qword_100021A38 != -1) {
    dispatch_once(&qword_100021A38, block);
  }
  id v2 = (void *)qword_100021A30;

  return v2;
}

- (void)scheduleTimer:(id)a3
{
  id v4 = a3;
  if ([(NSHashTable *)self->_timers containsObject:v4])
  {
    v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Timer already scheduled", (uint8_t *)&v14, 2u);
    }
  }
  v6 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v7 = v6;
    v8 = [v4 identifier];
    int v14 = 134218242;
    id v15 = v4;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Scheduling timer (%p) with identifier: (%@)", (uint8_t *)&v14, 0x16u);
  }
  [(NSHashTable *)self->_timers addObject:v4];
  id v9 = [(id)objc_opt_class() now];
  [v4 setStartTime:v9];
  double v10 = (double)(unint64_t)[v4 startTime];
  [v4 delay];
  [v4 setEarliestFireTime:(unint64_t)(v10 + v11 * 1000000000.0)];
  double v12 = (double)(unint64_t)[v4 earliestFireTime];
  [v4 gracePeriod];
  [v4 setDeadline:(unint64_t)(v12 + v13 * 1000000000.0)];
  [(WakingTimerScheduler *)self evaluateTimers:v9];
}

- (void)cancelTimer:(id)a3
{
  id v4 = (WakingTimer *)a3;
  v5 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    dispatch_source_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Cancelling timer (%p)", (uint8_t *)&v6, 0xCu);
  }
  [(NSHashTable *)self->_timers removeObject:v4];
  if (self->_timerWithEarliestDeadline == v4) {
    self->_timerWithEarliestDeadline = 0;
  }
  [(WakingTimerScheduler *)self evaluateTimers];
}

+ (unint64_t)now
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC);
}

- (void)handleTimeEvent
{
  self->_timerWithEarliestDeadline = 0;
  [(WakingTimerScheduler *)self evaluateTimers];
}

- (void)evaluateTimers
{
  if ([(NSHashTable *)self->_timers count]) {
    id v3 = [(id)objc_opt_class() now];
  }
  else {
    id v3 = 0;
  }

  [(WakingTimerScheduler *)self evaluateTimers:v3];
}

- (void)evaluateTimers:(unint64_t)a3
{
  v5 = [(NSHashTable *)self->_timers allObjects];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ((unint64_t)[v11 earliestFireTime] < a3)
        {
          if (!v8) {
            v8 = objc_opt_new();
          }
          [v8 addObject:v11];
          [(NSHashTable *)self->_timers removeObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if ([v8 count])
  {
    int v12 = sub_10000B82C((uint64_t)"com.apple.MagicSwitch.WakingTimerScheduler.Fire");
    double v13 = +[MagicSwitchEnabler sharedInstance];
    int v14 = [v13 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009BE4;
    block[3] = &unk_100018698;
    id v33 = v8;
    int v34 = v12;
    dispatch_async(v14, block);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = self->_timers;
  id v16 = [(NSHashTable *)v15 countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (!v16)
  {

LABEL_31:
    [(WakingTimerScheduler *)self clearDispatchTimer];
    [(WakingTimerScheduler *)self cancelScheduledWake];
    id v18 = 0;
    goto LABEL_32;
  }
  id v17 = v16;
  v26 = v5;
  id v18 = 0;
  uint64_t v19 = *(void *)v29;
  do
  {
    for (j = 0; j != v17; j = (char *)j + 1)
    {
      if (*(void *)v29 != v19) {
        objc_enumerationMutation(v15);
      }
      io_connect_t v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
      if (v18)
      {
        id v22 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) deadline];
        if (v22 < (id)[(WakingTimer *)v18 deadline])
        {
          v23 = v21;

          id v18 = v23;
        }
      }
      else
      {
        id v18 = v21;
      }
    }
    id v17 = [(NSHashTable *)v15 countByEnumeratingWithState:&v28 objects:v39 count:16];
  }
  while (v17);

  v5 = v26;
  if (!v18) {
    goto LABEL_31;
  }
  if (v18 != self->_timerWithEarliestDeadline) {
    [(WakingTimerScheduler *)self scheduleTimerWithEarliestDeadline:v18 now:a3];
  }
LABEL_32:
  if ([(NSHashTable *)self->_timers count])
  {
    if (!self->_requestedWakeDate)
    {
      v24 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No wake scheduled despite there being a timer", buf, 2u);
      }
    }
    if (!self->_dispatchTimerScheduled)
    {
      v25 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Dispatch timer not running despite there being a timer", buf, 2u);
      }
    }
  }
}

- (void)scheduleTimerWithEarliestDeadline:(id)a3 now:(unint64_t)a4
{
  id v6 = (WakingTimer *)a3;
  id v7 = (char *)[(WakingTimer *)v6 earliestFireTime] - a4;
  [(WakingTimer *)v6 gracePeriod];
  uint64_t v9 = (unint64_t)(v8 * 1000000000.0);
  double v10 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218496;
    double v13 = v6;
    __int16 v14 = 2048;
    double v15 = (double)(unint64_t)v7 / 1000000000.0;
    __int16 v16 = 2048;
    double v17 = (double)v9 / 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Scheduling wake for timer (%p) in (%.3f) sec with (%.3f) sec leeway", (uint8_t *)&v12, 0x20u);
  }
  dispatch_time_t v11 = dispatch_walltime(0, (int64_t)v7);
  dispatch_source_set_timer((dispatch_source_t)self->_dispatchTimer, v11, 0xFFFFFFFFFFFFFFFFLL, v9);
  self->_dispatchTimerScheduled = 1;
  [(WakingTimer *)v6 gracePeriod];
  -[WakingTimerScheduler scheduleWakeWithDelayBeforeFireTime:gracePeriod:](self, "scheduleWakeWithDelayBeforeFireTime:gracePeriod:", v7);
  self->_timerWithEarliestDeadline = v6;
}

- (void)clearDispatchTimer
{
  if (self->_dispatchTimerScheduled)
  {
    dispatch_source_set_timer((dispatch_source_t)self->_dispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    self->_dispatchTimerScheduled = 0;
  }
}

- (void)scheduleWakeWithDelayBeforeFireTime:(unint64_t)a3 gracePeriod:(double)a4
{
  p_requestedWakeDate = &self->_requestedWakeDate;
  if (self->_requestedWakeDate) {
    [(WakingTimerScheduler *)self cancelScheduledWake];
  }
  id v7 = +[NSDate dateWithTimeIntervalSinceNow:(double)(a3 / 0x3B9ACA00)];
  double v8 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v8;
    [v7 timeIntervalSinceNow];
    int v16 = 134218240;
    double v17 = v7;
    __int16 v18 = 2048;
    double v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "WakingTimerScheduler --- Scheduling wake for date (%p) in (%.3f) seconds", (uint8_t *)&v16, 0x16u);
  }
  v23[0] = v7;
  v22[0] = @"time";
  v22[1] = @"leeway";
  dispatch_time_t v11 = +[NSNumber numberWithDouble:a4];
  v22[2] = @"scheduledby";
  v23[1] = v11;
  v23[2] = @"com.apple.MagicSwitch.WakingTimerScheduler.IOPM";
  int v12 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

  int v13 = IOPMRequestSysWake();
  if (v13)
  {
    int v14 = v13;
    double v15 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412802;
      double v17 = v7;
      __int16 v18 = 2048;
      double v19 = a4;
      __int16 v20 = 1024;
      int v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed to schedule wake at date (%@) with grace period (%f) with error: (%d)", (uint8_t *)&v16, 0x1Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)p_requestedWakeDate, v7);
  }
}

+ (void)cancelScheduledWake:(id)a3
{
  CFDateRef v3 = (const __CFDate *)a3;
  id v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    CFDateRef v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "WakingTimerScheduler --- Cancelling wake for date: (%p)", (uint8_t *)&v12, 0xCu);
  }
  IOReturn v5 = IOPMCancelScheduledPowerEvent(v3, @"com.apple.MagicSwitch.WakingTimerScheduler.IOPM", @"wake");
  if (v5)
  {
    IOReturn v6 = v5;
    if (v5 == -536870160)
    {
      uint64_t v7 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        CFDateRef v13 = v3;
        double v8 = "WakingTimerScheduler --- Failed to cancel wake for date (%@) with error: kIOReturnNotFound";
        uint64_t v9 = v7;
        uint32_t v10 = 12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      uint64_t v11 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        CFDateRef v13 = v3;
        __int16 v14 = 1024;
        IOReturn v15 = v6;
        double v8 = "WakingTimerScheduler --- Failed to cancel wake for date (%@) with error: (%d)";
        uint64_t v9 = v11;
        uint32_t v10 = 18;
        goto LABEL_9;
      }
    }
  }
}

- (void)cancelScheduledWake
{
  if (self->_requestedWakeDate)
  {
    [(id)objc_opt_class() cancelScheduledWake:self->_requestedWakeDate];
    requestedWakeDate = self->_requestedWakeDate;
    self->_requestedWakeDate = 0;
  }
}

- (void)systemPowerChanged:(unsigned int)a3 notificationID:(void *)a4
{
  if (a3 == -536870288
    || (a3 == -536870144 || a3 == -536870272)
    && ([(WakingTimerScheduler *)self evaluateTimers], a3 == -536870272))
  {
    IOReturn v7 = IOAllowPowerChange(self->_systemPowerConnection, (intptr_t)a4);
    if (v7)
    {
      IOReturn v8 = v7;
      uint64_t v9 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109376;
        v10[1] = a3;
        __int16 v11 = 1024;
        IOReturn v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Failed allow Power change (%u) with error: (%d)", (uint8_t *)v10, 0xEu);
      }
    }
  }
}

- (NSHashTable)timers
{
  return self->_timers;
}

- (void)setTimers:(id)a3
{
}

- (WakingTimer)timerWithEarliestDeadline
{
  return self->_timerWithEarliestDeadline;
}

- (void)setTimerWithEarliestDeadline:(id)a3
{
  self->_timerWithEarliestDeadline = (WakingTimer *)a3;
}

- (OS_dispatch_source)dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)setDispatchTimer:(id)a3
{
}

- (BOOL)dispatchTimerScheduled
{
  return self->_dispatchTimerScheduled;
}

- (void)setDispatchTimerScheduled:(BOOL)a3
{
  self->_dispatchTimerScheduled = a3;
}

- (NSDate)requestedWakeDate
{
  return self->_requestedWakeDate;
}

- (void)setRequestedWakeDate:(id)a3
{
}

- (unsigned)systemPowerConnection
{
  return self->_systemPowerConnection;
}

- (void)setSystemPowerConnection:(unsigned int)a3
{
  self->_systemPowerConnection = a3;
}

- (unsigned)systemPowerNotifier
{
  return self->_systemPowerNotifier;
}

- (void)setSystemPowerNotifier:(unsigned int)a3
{
  self->_systemPowerNotifier = a3;
}

- (IONotificationPort)systemPowerPort
{
  return self->_systemPowerPort;
}

- (void)setSystemPowerPort:(IONotificationPort *)a3
{
  self->_systemPowerPort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedWakeDate, 0);
  objc_storeStrong((id *)&self->_dispatchTimer, 0);

  objc_storeStrong((id *)&self->_timers, 0);
}

@end