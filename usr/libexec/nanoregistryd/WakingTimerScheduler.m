@interface WakingTimerScheduler
+ (id)sharedInstance;
+ (id)timerQueue;
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

+ (id)timerQueue
{
  if (qword_1001A11C0 != -1) {
    dispatch_once(&qword_1001A11C0, &stru_100167E58);
  }
  v2 = (void *)qword_1001A11B8;

  return v2;
}

- (WakingTimerScheduler)init
{
  v38.receiver = self;
  v38.super_class = (Class)WakingTimerScheduler;
  id v2 = [(WakingTimerScheduler *)&v38 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable hashTableWithOptions:0];
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    v5 = +[WakingTimerScheduler timerQueue];
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
    v7 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v6;

    v8 = *((void *)v2 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006BEE8;
    handler[3] = &unk_1001655F8;
    id v9 = v2;
    id v37 = v9;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 5), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    int out_token = 0;
    v10 = +[WakingTimerScheduler timerQueue];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10006BF84;
    v33[3] = &unk_100165958;
    id v11 = v9;
    id v34 = v11;
    uint32_t v12 = notify_register_dispatch("com.apple.system.timezone", &out_token, v10, v33);

    if (v12)
    {
      v13 = nr_daemon_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (v14)
      {
        v15 = nr_daemon_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          uint32_t v40 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to register observer for the time zone change notification with status: (%u)", buf, 8u);
        }
      }
    }
    v16 = +[WakingTimerScheduler timerQueue];
    v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = sub_10006C020;
    v31 = &unk_100165958;
    id v17 = v11;
    id v32 = v17;
    uint32_t v18 = notify_register_dispatch("com.apple.system.clock_set", &out_token, v16, &v28);

    if (v18)
    {
      v19 = nr_daemon_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        v21 = nr_daemon_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          uint32_t v40 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to register observer for the system clock change notification with status: (%u)", buf, 8u);
        }
      }
    }
    io_connect_t v22 = IORegisterForSystemPower(v17, (IONotificationPortRef *)v17 + 7, (IOServiceInterestCallback)j__objc_msgSend_systemPowerChanged_notificationID_, (io_object_t *)v17 + 4);
    *((_DWORD *)v17 + 3) = v22;
    if (v22)
    {
      v23 = (IONotificationPort *)*((void *)v17 + 7);
      v24 = +[WakingTimerScheduler timerQueue];
      IONotificationPortSetDispatchQueue(v23, v24);
    }
    else
    {
      v26 = nr_daemon_log();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (!v27) {
        goto LABEL_15;
      }
      v24 = nr_daemon_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to register for Power events!", buf, 2u);
      }
    }

LABEL_15:
  }
  return (WakingTimerScheduler *)v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C160;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A11D0 != -1) {
    dispatch_once(&qword_1001A11D0, block);
  }
  id v2 = (void *)qword_1001A11C8;

  return v2;
}

- (void)scheduleTimer:(id)a3
{
  id v4 = a3;
  v5 = +[WakingTimerScheduler timerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006C250;
  v7[3] = &unk_100165530;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)cancelTimer:(id)a3
{
  id v4 = a3;
  v5 = +[WakingTimerScheduler timerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006C48C;
  v7[3] = &unk_100165530;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
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
  id v4 = self;
  v5 = [(NSHashTable *)self->_timers allObjects];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ((unint64_t)[v11 earliestFireTime] < a3)
        {
          if (!v8) {
            id v8 = objc_opt_new();
          }
          [v8 addObject:v11];
          [(NSHashTable *)v4->_timers removeObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
  if ([v8 count])
  {
    int v12 = sub_1000D9E3C((uint64_t)"com.apple.NanoRegistry.WakingTimerScheduler.Fire");
    v13 = +[WakingTimerScheduler timerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006C958;
    block[3] = &unk_100167E80;
    id v29 = v8;
    int v30 = v12;
    dispatch_async(v13, block);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v14 = v4->_timers;
  id v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v24 objects:v35 count:16];
  if (!v15)
  {

LABEL_31:
    [(WakingTimerScheduler *)v4 clearDispatchTimer];
    [(WakingTimerScheduler *)v4 cancelScheduledWake];
    id v17 = 0;
    goto LABEL_32;
  }
  id v16 = v15;
  v23 = v4;
  id v17 = 0;
  uint64_t v18 = *(void *)v25;
  do
  {
    for (j = 0; j != v16; j = (char *)j + 1)
    {
      if (*(void *)v25 != v18) {
        objc_enumerationMutation(v14);
      }
      BOOL v20 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
      if (v17)
      {
        id v21 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) deadline];
        if (v21 < (id)[(WakingTimer *)v17 deadline])
        {
          io_connect_t v22 = v20;

          id v17 = v22;
        }
      }
      else
      {
        id v17 = v20;
      }
    }
    id v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v24 objects:v35 count:16];
  }
  while (v16);

  id v4 = v23;
  if (!v17) {
    goto LABEL_31;
  }
  if (v17 != v23->_timerWithEarliestDeadline) {
    [(WakingTimerScheduler *)v23 scheduleTimerWithEarliestDeadline:v17 now:a3];
  }
LABEL_32:
  [(NSHashTable *)v4->_timers count];
}

- (void)scheduleTimerWithEarliestDeadline:(id)a3 now:(unint64_t)a4
{
  id v6 = (WakingTimer *)a3;
  id v7 = (char *)[(WakingTimer *)v6 earliestFireTime] - a4;
  [(WakingTimer *)v6 gracePeriod];
  uint64_t v9 = (unint64_t)(v8 * 1000000000.0);
  v10 = nr_daemon_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    int v12 = nr_daemon_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218496;
      id v15 = v6;
      __int16 v16 = 2048;
      double v17 = (double)(unint64_t)v7 / 1000000000.0;
      __int16 v18 = 2048;
      double v19 = (double)v9 / 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Scheduling wake for timer (%p) in (%.3f) sec with (%.3f) sec leeway", (uint8_t *)&v14, 0x20u);
    }
  }
  dispatch_time_t v13 = dispatch_walltime(0, (int64_t)v7);
  dispatch_source_set_timer((dispatch_source_t)self->_dispatchTimer, v13, 0xFFFFFFFFFFFFFFFFLL, v9);
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
  if (self->_requestedWakeDate) {
    [(WakingTimerScheduler *)self cancelScheduledWake];
  }
  id v7 = +[NSDate dateWithTimeIntervalSinceNow:(double)(a3 / 0x3B9ACA00)];
  double v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v7 timeIntervalSinceNow];
      int v20 = 134218240;
      id v21 = v7;
      __int16 v22 = 2048;
      double v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scheduling wake for date (%p) in (%.3f) seconds", (uint8_t *)&v20, 0x16u);
    }
  }
  v27[0] = v7;
  v26[0] = @"time";
  v26[1] = @"leeway";
  int v12 = +[NSNumber numberWithDouble:a4];
  v26[2] = @"scheduledby";
  v27[1] = v12;
  v27[2] = @"com.apple.NanoRegistry.WakingTimerScheduler.IOPM";
  dispatch_time_t v13 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

  int v14 = IOPMRequestSysWake();
  if (!v14)
  {
    double v19 = v7;
    p_super = &self->_requestedWakeDate->super;
    self->_requestedWakeDate = v19;
LABEL_12:

    goto LABEL_13;
  }
  int v15 = v14;
  __int16 v16 = nr_daemon_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    p_super = nr_daemon_log();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412802;
      id v21 = v7;
      __int16 v22 = 2048;
      double v23 = a4;
      __int16 v24 = 1024;
      int v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Failed to schedule wake at date (%@) with grace period (%f) with error: (%d)", (uint8_t *)&v20, 0x1Cu);
    }
    goto LABEL_12;
  }
LABEL_13:
}

+ (void)cancelScheduledWake:(id)a3
{
  CFDateRef v3 = (const __CFDate *)a3;
  id v4 = nr_daemon_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = nr_daemon_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      CFDateRef v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cancelling wake for date: (%p)", (uint8_t *)&v17, 0xCu);
    }
  }
  IOReturn v7 = IOPMCancelScheduledPowerEvent(v3, @"com.apple.NanoRegistry.WakingTimerScheduler.IOPM", @"wake");
  if (v7)
  {
    IOReturn v8 = v7;
    if (v7 == -536870160)
    {
      BOOL v9 = nr_daemon_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        double v11 = nr_daemon_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412290;
          CFDateRef v18 = v3;
          int v12 = "Failed to cancel wake for date (%@) with error: kIOReturnNotFound";
          dispatch_time_t v13 = v11;
          uint32_t v14 = 12;
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      int v15 = nr_daemon_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        double v11 = nr_daemon_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412546;
          CFDateRef v18 = v3;
          __int16 v19 = 1024;
          IOReturn v20 = v8;
          int v12 = "Failed to cancel wake for date (%@) with error: (%d)";
          dispatch_time_t v13 = v11;
          uint32_t v14 = 18;
          goto LABEL_13;
        }
LABEL_14:
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
      BOOL v9 = nr_daemon_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        double v11 = nr_daemon_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12[0] = 67109376;
          v12[1] = a3;
          __int16 v13 = 1024;
          IOReturn v14 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed allow Power change (%u) with error: (%d)", (uint8_t *)v12, 0xEu);
        }
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