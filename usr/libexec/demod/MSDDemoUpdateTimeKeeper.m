@interface MSDDemoUpdateTimeKeeper
+ (id)sharedInstance;
- (BOOL)canceled;
- (BOOL)shouldCleanUp:(id *)a3;
- (NSDate)date;
- (NSTimer)timer;
- (NSTimer)timerForFatalError;
- (id)setCompletionTime:(int)a3 reserveTimeForCleanup:(BOOL)a4;
- (id)setCompletionTimeForFatalError:(int)a3;
- (int64_t)timeIntervalReservedForCleanup;
- (void)canceledByUser;
- (void)forceSwitchToDemoMode:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setTimeIntervalReservedForCleanup:(int64_t)a3;
- (void)setTimer:(id)a3;
- (void)setTimerForFatalError:(id)a3;
@end

@implementation MSDDemoUpdateTimeKeeper

+ (id)sharedInstance
{
  if (qword_100189D18 != -1) {
    dispatch_once(&qword_100189D18, &stru_1001540A8);
  }
  v2 = (void *)qword_100189D10;

  return v2;
}

- (id)setCompletionTime:(int)a3 reserveTimeForCleanup:(BOOL)a4
{
  BOOL v4 = a4;
  [(MSDDemoUpdateTimeKeeper *)self setCanceled:0];
  v7 = [(MSDDemoUpdateTimeKeeper *)self timer];

  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B7DC8;
    block[3] = &unk_100151AF0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  id v8 = [(MSDDemoUpdateTimeKeeper *)self setCompletionTimeForFatalError:0];
  if (a3 < 1)
  {
    [(MSDDemoUpdateTimeKeeper *)self setDate:0];
LABEL_12:
    v21 = 0;
    goto LABEL_16;
  }
  if (v4)
  {
    [(MSDDemoUpdateTimeKeeper *)self setTimeIntervalReservedForCleanup:1800];
    a3 -= 600;
  }
  else
  {
    [(MSDDemoUpdateTimeKeeper *)self setTimeIntervalReservedForCleanup:0];
  }
  v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)a3];
  [(MSDDemoUpdateTimeKeeper *)self setDate:v9];

  v10 = [(MSDDemoUpdateTimeKeeper *)self date];
  [v10 timeIntervalSinceNow];
  double v12 = v11;
  double v13 = (double)[(MSDDemoUpdateTimeKeeper *)self timeIntervalReservedForCleanup];

  v14 = sub_100068600();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12 > v13)
  {
    if (v15)
    {
      v16 = [(MSDDemoUpdateTimeKeeper *)self date];
      [v16 timeIntervalSinceNow];
      v18 = v17;
      v19 = [(MSDDemoUpdateTimeKeeper *)self date];
      int64_t v20 = [(MSDDemoUpdateTimeKeeper *)self timeIntervalReservedForCleanup];
      *(_DWORD *)buf = 134218498;
      v29 = v18;
      __int16 v30 = 2114;
      v31 = v19;
      __int16 v32 = 2048;
      int64_t v33 = v20;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "The operation needs to complete in %lf seconds (or by %{public}@). Will indicate system to clean up %td second before that. If no clean up action is taken then the device will be forced to demo mode by then (if possible).", buf, 0x20u);
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000B7E58;
    v26[3] = &unk_100151AF0;
    v26[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);
    goto LABEL_12;
  }
  if (v15)
  {
    v22 = [(MSDDemoUpdateTimeKeeper *)self date];
    v23 = [(MSDDemoUpdateTimeKeeper *)self date];
    [v23 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543618;
    v29 = v22;
    __int16 v30 = 2048;
    v31 = v24;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Already time for clean up: %{public}@ (in %lf seconds)", buf, 0x16u);
  }
  v21 = +[NSError errorDomainMSDWithCode:3727741184 message:@"Cannot finish update within given time."];
LABEL_16:

  return v21;
}

- (id)setCompletionTimeForFatalError:(int)a3
{
  v5 = [(MSDDemoUpdateTimeKeeper *)self timerForFatalError];

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B7FE8;
    block[3] = &unk_100151AF0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (a3 >= 1)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B8078;
    v7[3] = &unk_1001529D0;
    int v8 = a3;
    v7[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
  return 0;
}

- (void)canceledByUser
{
  [(MSDDemoUpdateTimeKeeper *)self setCanceled:1];
  id v3 = [(MSDDemoUpdateTimeKeeper *)self setCompletionTimeForFatalError:0];
}

- (BOOL)shouldCleanUp:(id *)a3
{
  v5 = [(MSDDemoUpdateTimeKeeper *)self date];

  if (v5)
  {
    v6 = [(MSDDemoUpdateTimeKeeper *)self date];
    [v6 timeIntervalSinceNow];
    double v8 = v7;
    double v9 = (double)[(MSDDemoUpdateTimeKeeper *)self timeIntervalReservedForCleanup];

    if (v8 <= v9)
    {
      CFStringRef v12 = @"Cannot finish update within given time.";
      uint64_t v11 = 3727741184;
      goto LABEL_6;
    }
  }
  BOOL v10 = [(MSDDemoUpdateTimeKeeper *)self canceled];
  if (v10)
  {
    uint64_t v11 = 3727741185;
    CFStringRef v12 = @"Operation canceled.";
LABEL_6:
    *a3 = +[NSError errorDomainMSDWithCode:v11 message:v12];
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (void)forceSwitchToDemoMode:(id)a3
{
  id v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Time is up, has to force the device into demo mode.", v5, 2u);
  }

  BOOL v4 = +[MSDTargetDevice sharedInstance];
  [v4 forceSwitchToDemoModeIfNeeded];
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (int64_t)timeIntervalReservedForCleanup
{
  return self->_timeIntervalReservedForCleanup;
}

- (void)setTimeIntervalReservedForCleanup:(int64_t)a3
{
  self->_timeIntervalReservedForCleanup = a3;
}

- (NSTimer)timerForFatalError
{
  return self->_timerForFatalError;
}

- (void)setTimerForFatalError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerForFatalError, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end