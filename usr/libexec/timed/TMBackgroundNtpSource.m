@interface TMBackgroundNtpSource
- (BOOL)isFetchingTime;
- (NSString)address;
- (OS_os_transaction)reachabilityTransaction;
- (TMBackgroundNtpSource)init;
- (TMDaemonCore)daemonCore;
- (TMMonotonicClock)clock;
- (TMPreferences)preferences;
- (double)lastFetchAttempt;
- (double)lastReschedule;
- (double)schedulingInterval;
- (int64_t)burstRetryCount;
- (int64_t)servicePortRetryCount;
- (void)dealloc;
- (void)fetchTime;
- (void)setAddress:(id)a3;
- (void)setBurstRetryCount:(int64_t)a3;
- (void)setClock:(id)a3;
- (void)setDaemonCore:(id)a3;
- (void)setFetchingTime:(BOOL)a3;
- (void)setLastFetchAttempt:(double)a3;
- (void)setLastReschedule:(double)a3;
- (void)setPreferences:(id)a3;
- (void)setReachabilityTransaction:(id)a3;
- (void)setSchedulingInterval:(double)a3;
- (void)setServicePortRetryCount:(int64_t)a3;
- (void)setWantedTime:(double)a3;
@end

@implementation TMBackgroundNtpSource

- (void)setFetchingTime:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL fetchingTime = self->_fetchingTime;
  if (fetchingTime == a3)
  {
    v6 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B954(fetchingTime, v3, v6);
    }
  }
  else
  {

    if (v3) {
      v7 = (OS_os_transaction *)os_transaction_create();
    }
    else {
      v7 = 0;
    }
    self->_fetchingTransaction = v7;
  }
  self->_BOOL fetchingTime = v3;
}

- (void)fetchTime
{
  [(TMBackgroundNtpSource *)self setLastFetchAttempt:0.0];
  [(TMBackgroundNtpSource *)self setBurstRetryCount:[(TMPreferences *)self->_preferences NTPBurstRetryAttempts]];

  [(TMBackgroundNtpSource *)self setWantedTime:-INFINITY];
}

- (TMBackgroundNtpSource)init
{
  v4.receiver = self;
  v4.super_class = (Class)TMBackgroundNtpSource;
  v2 = [(TMBackgroundNtpSource *)&v4 init];
  if (v2) {
    v2->_ntpQueue = (OS_dispatch_queue *)dispatch_queue_create("NTP Queue", 0);
  }
  return v2;
}

- (void)dealloc
{
  [(TMBackgroundNtpSource *)self setAddress:0];

  reachabilityTarget = self->_reachabilityTarget;
  if (reachabilityTarget) {
    CFRelease(reachabilityTarget);
  }

  self->_clock = 0;
  self->_preferences = 0;
  [(TMBackgroundNtpSource *)self setReachabilityTransaction:0];
  dispatch_release((dispatch_object_t)self->_ntpQueue);
  self->_ntpQueue = 0;
  v4.receiver = self;
  v4.super_class = (Class)TMBackgroundNtpSource;
  [(TMBackgroundNtpSource *)&v4 dealloc];
}

- (void)setWantedTime:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v6 = sub_100013AE0(self);
  v7 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v26 = (a3 - Current) / 60.0;
    __int16 v27 = 2048;
    double v28 = v6 / 60.0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Want active time in %.2fmin. Remaining retry interval: %fmin.", buf, 0x16u);
  }
  if (Current >= a3 && v6 == 0.0)
  {
    ntpQueue = self->_ntpQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013B5C;
    block[3] = &unk_100028DB0;
    block[4] = self;
    dispatch_async(ntpQueue, block);
    return;
  }
  [(TMMonotonicClock *)[(TMBackgroundNtpSource *)self clock] coarseMonotonicTime];
  double v10 = v9;
  if (Current + v6 <= a3) {
    double v11 = a3;
  }
  else {
    double v11 = Current + v6;
  }
  double v12 = sub_100013B64(self);
  v13 = qword_1000338F8;
  BOOL v14 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
  if (v12 > 0.0)
  {
    if (!v14) {
      return;
    }
    double lastReschedule = self->_lastReschedule;
    *(_DWORD *)buf = 134218496;
    double v26 = lastReschedule;
    __int16 v27 = 2048;
    double v28 = v10;
    __int16 v29 = 2048;
    double v30 = v10 - lastReschedule;
    v16 = "not rescheduling NTP fetch activity because interval has not elapsed lastReschedule: %f wanted time: %f, elapsed %f";
    v17 = v13;
    uint32_t v18 = 32;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    return;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unscheduling wanted job", buf, 2u);
  }
  xpc_activity_unregister("com.apple.timed.ntp.wanted");
  double v19 = v11 - Current;
  v20 = qword_1000338F8;
  BOOL v21 = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT);
  if (v19 >= 9.22337204e18)
  {
    if (!v21) {
      return;
    }
    *(_WORD *)buf = 0;
    v16 = "Dropping job with infinite start time";
    v17 = v20;
    uint32_t v18 = 2;
    goto LABEL_20;
  }
  if (v21)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Scheduling wanted job", buf, 2u);
  }
  xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v22, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_int64(v22, XPC_ACTIVITY_DELAY, (uint64_t)v19);
  xpc_dictionary_set_int64(v22, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100013BE0;
  v23[3] = &unk_100028D88;
  v23[4] = self;
  xpc_activity_register("com.apple.timed.ntp.wanted", v22, v23);
  self->_double lastReschedule = v10;
  xpc_release(v22);
}

- (double)lastFetchAttempt
{
  return self->lastFetchAttempt;
}

- (void)setLastFetchAttempt:(double)a3
{
  self->lastFetchAttempt = a3;
}

- (double)schedulingInterval
{
  return self->schedulingInterval;
}

- (void)setSchedulingInterval:(double)a3
{
  self->schedulingInterval = a3;
}

- (int64_t)burstRetryCount
{
  return self->burstRetryCount;
}

- (void)setBurstRetryCount:(int64_t)a3
{
  self->burstRetryCount = a3;
}

- (double)lastReschedule
{
  return self->_lastReschedule;
}

- (void)setLastReschedule:(double)a3
{
  self->_double lastReschedule = a3;
}

- (TMPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (TMDaemonCore)daemonCore
{
  return self->_daemonCore;
}

- (void)setDaemonCore:(id)a3
{
  self->_daemonCore = (TMDaemonCore *)a3;
}

- (TMMonotonicClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (int64_t)servicePortRetryCount
{
  return self->_servicePortRetryCount;
}

- (void)setServicePortRetryCount:(int64_t)a3
{
  self->_servicePortRetryCount = a3;
}

- (OS_os_transaction)reachabilityTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 104, 1);
}

- (void)setReachabilityTransaction:(id)a3
{
}

- (BOOL)isFetchingTime
{
  return self->_fetchingTime;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAddress:(id)a3
{
}

@end