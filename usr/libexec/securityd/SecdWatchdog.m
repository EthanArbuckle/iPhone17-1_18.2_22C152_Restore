@interface SecdWatchdog
+ (BOOL)triggerOSFaults;
+ (BOOL)watchdogrusage:(rusage_info_v6 *)a3;
+ (id)watchdog;
- (BOOL)diskUsageHigh;
- (BOOL)setWatchdogParameters:(id)a3 error:(id *)a4;
- (SecdWatchdog)init;
- (id)watchdogParameters;
- (unint64_t)secondsFromMachTime:(unint64_t)a3;
- (void)activateTimer;
- (void)runWatchdog;
@end

@implementation SecdWatchdog

- (void).cxx_destruct
{
}

- (BOOL)diskUsageHigh
{
  return self->_diskUsageHigh;
}

- (BOOL)setWatchdogParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSMutableArray array];
  v8 = self;
  objc_sync_enter(v8);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001EBBC;
  v16[3] = &unk_1002F6DD8;
  objc_copyWeak(&v18, &location);
  id v9 = v7;
  id v17 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];
  dispatch_source_cancel((dispatch_source_t)v8->_timer);
  timer = v8->_timer;
  v8->_timer = 0;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  objc_sync_exit(v8);

  [(SecdWatchdog *)v8 activateTimer];
  id v11 = [v9 count];
  id v12 = v11;
  if (a4 && v11)
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    v13 = +[NSString stringWithFormat:@"failed to set parameters: %@", v9];
    v21 = v13;
    v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.securityd.watchdog" code:0 userInfo:v14];
  }
  return v12 == 0;
}

- (id)watchdogParameters
{
  v2 = self;
  objc_sync_enter(v2);
  v9[0] = @"allowed-runtime";
  v3 = +[NSNumber numberWithUnsignedLongLong:v2->_runtimeSecondsBeforeWatchdog];
  v10[0] = v3;
  v9[1] = @"reset-period";
  v4 = +[NSNumber numberWithLong:v2->_resetPeriod];
  v10[1] = v4;
  v9[2] = @"check-period";
  v5 = +[NSNumber numberWithLong:v2->_checkPeriod];
  v10[2] = v5;
  v9[3] = @"graceful-exit-time";
  id v6 = +[NSNumber numberWithLong:v2->_gracefulExitLeeway];
  v10[3] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  objc_sync_exit(v2);

  return v7;
}

- (void)activateTimer
{
  v2 = self;
  objc_sync_enter(v2);
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v38 = v3;
  long long v39 = v3;
  long long v36 = v3;
  long long v37 = v3;
  long long v34 = v3;
  long long v35 = v3;
  long long v32 = v3;
  long long v33 = v3;
  long long v30 = v3;
  long long v31 = v3;
  long long v28 = v3;
  long long v29 = v3;
  long long v26 = v3;
  long long v27 = v3;
  long long v24 = v3;
  long long v25 = v3;
  long long v22 = v3;
  long long v23 = v3;
  long long v20 = v3;
  long long v21 = v3;
  long long v18 = v3;
  long long v19 = v3;
  long long v16 = v3;
  long long v17 = v3;
  long long v14 = v3;
  long long v15 = v3;
  long long v12 = v3;
  long long v13 = v3;
  long long v11 = v3;
  [(id)objc_opt_class() watchdogrusage:&v11];
  v2->_rusageBaseline = [(SecdWatchdog *)v2 secondsFromMachTime:(void)v12];
  v2->_lastCheckTime = CFAbsoluteTimeGetCurrent();
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v2);
  v4 = dispatch_get_global_queue(0, 0);
  dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
  timer = v2->_timer;
  v2->_timer = (OS_dispatch_source *)v5;

  dispatch_source_set_timer((dispatch_source_t)v2->_timer, 0, 1000000000 * v2->_checkPeriod, 1000000000 * v2->_checkPeriodLeeway);
  v7 = v2->_timer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F090;
  v8[3] = &unk_1003077A0;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)v2->_timer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  objc_sync_exit(v2);
}

- (void)runWatchdog
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v41 = v3;
  long long v42 = v3;
  long long v39 = v3;
  long long v40 = v3;
  long long v37 = v3;
  long long v38 = v3;
  long long v35 = v3;
  long long v36 = v3;
  long long v33 = v3;
  long long v34 = v3;
  long long v31 = v3;
  long long v32 = v3;
  long long v29 = v3;
  long long v30 = v3;
  long long v27 = v3;
  long long v28 = v3;
  long long v25 = v3;
  long long v26 = v3;
  long long v23 = v3;
  long long v24 = v3;
  long long v21 = v3;
  long long v22 = v3;
  long long v19 = v3;
  long long v20 = v3;
  long long v17 = v3;
  long long v18 = v3;
  long long v15 = v3;
  long long v16 = v3;
  long long v14 = v3;
  if ([(id)objc_opt_class() watchdogrusage:&v14])
  {
    v4 = self;
    objc_sync_enter(v4);
    unint64_t v5 = [(SecdWatchdog *)v4 secondsFromMachTime:(void)v15];
    if (v5 <= v4->_runtimeSecondsBeforeWatchdog + v4->_rusageBaseline)
    {
      if (!v4->_diskUsageHigh && *((void *)&v28 + 1) > v4->_diskUsageLimit + v4->_diskUsageBaseLine)
      {
        if ([(id)objc_opt_class() triggerOSFaults]
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          unint64_t diskUsageLimit = v4->_diskUsageLimit;
          int v12 = 134217984;
          unint64_t v13 = diskUsageLimit;
          _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "securityd have written more then %llu", (uint8_t *)&v12, 0xCu);
        }
        v4->_diskUsageHigh = 1;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current > v4->_lastCheckTime + (double)v4->_resetPeriod)
      {
        v10 = sub_10000B070("SecWatchdog");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v12) = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "resetting watchdog monitoring interval ahead another 24 hours", (uint8_t *)&v12, 2u);
        }

        v4->_lastCheckTime = Current;
        v4->_rusageBaseline = v5;
        v4->_diskUsageHigh = 0;
        v4->_diskUsageBaseLine = *((void *)&v28 + 1);
      }
    }
    else
    {
      id v6 = sub_10000B070("SecCritical");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SecWatchdog: watchdog has detected securityd/secd is using too much CPU - attempting to exit gracefully", (uint8_t *)&v12, 2u);
      }

      sub_10002C040(@"securityd watchdog triggered", 0x53C0000Cu);
      xpc_transaction_exit_clean();
      dispatch_time_t v7 = dispatch_time(0, 1000000000 * v4->_gracefulExitLeeway);
      v8 = dispatch_get_global_queue(2, 0);
      dispatch_after(v7, v8, &stru_1002F6DB0);
    }
    objc_sync_exit(v4);
  }
}

- (unint64_t)secondsFromMachTime:(unint64_t)a3
{
  if (qword_10035CB28 != -1) {
    dispatch_once(&qword_10035CB28, &stru_1002F6D90);
  }
  return qword_10035CB30 * a3 / 0x3B9ACA00;
}

- (SecdWatchdog)init
{
  v5.receiver = self;
  v5.super_class = (Class)SecdWatchdog;
  v2 = [(SecdWatchdog *)&v5 init];
  long long v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_runtimeSecondsBeforeWatchdog = xmmword_100265520;
    *(_OWORD *)&v2->_checkPeriod = xmmword_100265530;
    v2->_gracefulExitLeeway = 300;
    v2->_unint64_t diskUsageLimit = 1048576000;
    v2->_diskUsageHigh = 0;
    [(SecdWatchdog *)v2 activateTimer];
  }
  return v3;
}

+ (BOOL)triggerOSFaults
{
  return 1;
}

+ (BOOL)watchdogrusage:(rusage_info_v6 *)a3
{
  pid_t v4 = getpid();
  return proc_pid_rusage(v4, 6, (rusage_info_t *)a3) == 0;
}

+ (id)watchdog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F624;
  block[3] = &unk_1003093A8;
  block[4] = a1;
  if (qword_10035CB20 != -1) {
    dispatch_once(&qword_10035CB20, block);
  }
  v2 = (void *)qword_10035CB18;

  return v2;
}

@end