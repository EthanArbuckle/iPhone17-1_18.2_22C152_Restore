@interface MediaStreamMonitor
- (MSIOSAlbumSharingDaemon)albumSharingDaemon;
- (MediaStreamMonitor)init;
- (id)_dormantTimerWithSelector:(SEL)a3;
- (id)_scheduleNextBTAJobNextActivityDate:(id)a3 jobName:(const char *)a4 serviceName:(id)a5 createJobBlock:(id)a6;
- (void)MSAlbumSharingDaemonDidIdle:(id)a3;
- (void)MSAlbumSharingDaemonDidUnidle:(id)a3;
- (void)MSAlbumSharingDaemonDidUnidleMomentarily:(id)a3;
- (void)_didIdle;
- (void)_didUnidle;
- (void)_resetIdleTimer;
- (void)_startIdleTimerWithInterval:(double)a3;
- (void)_stopIdleTimer;
- (void)albumSharingDaemonPokeTimerDidFire:(id)a3;
- (void)dealloc;
- (void)mstreamdIdleTimerDidFire:(id)a3;
- (void)setAlbumSharingDaemon:(id)a3;
@end

@implementation MediaStreamMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumSharingDaemonPokeTimer, 0);
  objc_destroyWeak((id *)&self->_albumSharingDaemon);
  objc_storeStrong((id *)&self->_idleStateNotificationTimer, 0);

  objc_storeStrong((id *)&self->_idleTimer, 0);
}

- (void)setAlbumSharingDaemon:(id)a3
{
}

- (MSIOSAlbumSharingDaemon)albumSharingDaemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_albumSharingDaemon);

  return (MSIOSAlbumSharingDaemon *)WeakRetained;
}

- (void)mstreamdIdleTimerDidFire:(id)a3
{
  id v4 = a3;
  v5 = +[NSThread currentThread];
  v6 = +[NSThread mainThread];

  if (v5 == v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Idle timer fired.", (uint8_t *)&v24, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_albumSharingDaemon);
    v8 = [WeakRetained nextActivityDate];

    v9 = [(MediaStreamMonitor *)self _scheduleNextBTAJobNextActivityDate:v8 jobName:"com.apple.mediastream.mstreamd.as.wakeup" serviceName:@"Shared Stream" createJobBlock:&stru_1000188A8];
    BackgroundTaskAgentRemoveJob();
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Monitoring for external power.", (uint8_t *)&v24, 2u);
      }
      xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
      v12 = (const char *)kBackgroundTaskAgentJobWindowStartTime;
      v13 = +[NSDate date];
      [v13 timeIntervalSinceReferenceDate];
      xpc_dictionary_set_double(v11, v12, v14 + 10.0);

      v15 = (const char *)kBackgroundTaskAgentJobWindowEndTime;
      v16 = +[NSDate date];
      [v16 timeIntervalSinceReferenceDate];
      xpc_dictionary_set_double(v11, v15, v17 + 86400.0);

      xpc_dictionary_set_double(v11, kBackgroundTaskAgentPowerPluggedinTime, 2.0);
      xpc_dictionary_set_BOOL(v11, kBackgroundTaskAgentNetworkRequired, 1);
      xpc_dictionary_set_BOOL(v11, kBackgroundTaskAgentCellularAllowed, 0);
      BackgroundTaskAgentAddJob();

      if (!v9)
      {
LABEL_15:
        byte_10001E380 = 1;
        if (!v8) {
          goto LABEL_27;
        }
        goto LABEL_16;
      }
    }
    else if (v10)
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not monitoring for external power.", (uint8_t *)&v24, 2u);
      if (!v9) {
        goto LABEL_15;
      }
    }
    else if (!v9)
    {
      goto LABEL_15;
    }
    if (!v8)
    {
LABEL_27:
      if (byte_10001E380 != 1) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
LABEL_16:
    id v18 = objc_loadWeakRetained((id *)&self->_albumSharingDaemon);
    unsigned int v19 = [v18 isWaitingForAuth];

    if (v19)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "We are waiting for the user to refresh their iCloud passcode. Not quitting.", (uint8_t *)&v24, 2u);
      }
LABEL_26:
      [(MediaStreamMonitor *)self _startIdleTimerWithInterval:1800.0];
      goto LABEL_27;
    }
    if (v9)
    {
      id v20 = v9;
      [v20 timeIntervalSinceNow];
      if (v21 > 0.0 && v21 < 1800.0)
      {
        id v22 = objc_loadWeakRetained((id *)&self->_albumSharingDaemon);
        unsigned int v23 = [v22 isInRetryState];

        if (v23)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 138412290;
            id v25 = v20;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "We have retries pending. The next event is scheduled for %@, which is less than 30 minutes away. Not quitting.", (uint8_t *)&v24, 0xCu);
          }

          goto LABEL_26;
        }
      }
    }
    [(NSTimer *)self->_idleTimer invalidate];
    byte_10001E380 = 1;
LABEL_31:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000188C8);
LABEL_32:

    goto LABEL_33;
  }
  [(MediaStreamMonitor *)self performSelectorOnMainThread:"mstreamdIdleTimerDidFire:" withObject:v4 waitUntilDone:1];
LABEL_33:
}

- (id)_scheduleNextBTAJobNextActivityDate:(id)a3 jobName:(const char *)a4 serviceName:(id)a5 createJobBlock:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = (void (**)(id, id))a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Checking on job state for %{public}@", (uint8_t *)&v21, 0xCu);
  }
  xpc_object_t v11 = (void *)BackgroundTaskAgentCopyJob();
  v12 = v11;
  if (!v8)
  {
    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v18)
      {
        int v21 = 138543362;
        id v22 = v9;
        unsigned int v19 = "No more scheduled jobs for %{public}@. Unscheduling.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v21, 0xCu);
      }
    }
    else if (v18)
    {
      int v21 = 138543362;
      id v22 = v9;
      unsigned int v19 = "No jobs scheduled for %{public}@.";
      goto LABEL_18;
    }
    BackgroundTaskAgentRemoveJob();
    id v14 = 0;
    goto LABEL_20;
  }
  if (v11)
  {
    v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:xpc_dictionary_get_double(v11, kBackgroundTaskAgentJobWindowStartTime)];
    id v14 = v13;
    if (v13 && [v13 compare:v8] != (id)-1) {
      goto LABEL_20;
    }
    BackgroundTaskAgentRemoveJob();
  }
  id v14 = v8;
  v15 = +[NSDate date];
  if ([v14 compare:v15] == (id)-1)
  {
    id v16 = v15;

    id v14 = v16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v21 = 138543362;
    id v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Scheduling Photo Stream job for %{public}@", (uint8_t *)&v21, 0xCu);
  }
  double v17 = v10[2](v10, v14);
  BackgroundTaskAgentAddJob();

LABEL_20:

  return v14;
}

- (void)albumSharingDaemonPokeTimerDidFire:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate distantFuture];
  [v4 setFireDate:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_albumSharingDaemon);
  [WeakRetained retryOutstandingActivities];
}

- (void)MSAlbumSharingDaemonDidUnidleMomentarily:(id)a3
{
}

- (void)MSAlbumSharingDaemonDidUnidle:(id)a3
{
  albumSharingDaemonPokeTimer = self->_albumSharingDaemonPokeTimer;
  v5 = +[NSDate distantFuture];
  [(NSTimer *)albumSharingDaemonPokeTimer setFireDate:v5];

  [(MediaStreamMonitor *)self _didUnidle];
}

- (void)MSAlbumSharingDaemonDidIdle:(id)a3
{
  id v9 = [a3 nextActivityDate];
  if (v9)
  {
    id v4 = +[NSDate distantPast];
    unsigned __int8 v5 = [v9 isEqualToDate:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = v9;
      [v6 timeIntervalSinceNow];
      if (v7 < 300.0)
      {
        uint64_t v8 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");

        id v6 = (id)v8;
      }
      [(NSTimer *)self->_albumSharingDaemonPokeTimer setFireDate:v6];
    }
  }
  [(MediaStreamMonitor *)self _didIdle];
}

- (void)_didUnidle
{
  int busyCount = self->_busyCount;
  self->_int busyCount = busyCount + 1;
  if (!busyCount)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Daemon unidled.", v6, 2u);
    }
    [(MediaStreamMonitor *)self _stopIdleTimer];
    idleStateNotificationTimer = self->_idleStateNotificationTimer;
    unsigned __int8 v5 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
    [(NSTimer *)idleStateNotificationTimer setFireDate:v5];
  }
}

- (void)_resetIdleTimer
{
  v3 = [(NSTimer *)self->_idleTimer fireDate];
  id v4 = +[NSDate date];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (v6 < 40.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v7 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Extending exit timer period.", v7, 2u);
    }
    [(MediaStreamMonitor *)self _startIdleTimerWithInterval:40.0];
  }
}

- (void)_didIdle
{
  int v2 = self->_busyCount - 1;
  self->_int busyCount = v2;
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Daemon idled.", buf, 2u);
    }
    id v4 = +[NSThread currentThread];
    double v5 = +[NSThread mainThread];

    if (v4 == v5)
    {
      double v6 = +[MSPauseManager sharedManager];
      unsigned int v7 = [v6 isPaused];

      if (v7)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)BOOL v10 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Not starting exit timer because daemon is paused.", v10, 2u);
        }
      }
      else
      {
        [(MediaStreamMonitor *)self _startIdleTimerWithInterval:40.0];
      }
      idleStateNotificationTimer = self->_idleStateNotificationTimer;
      id v9 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
      [(NSTimer *)idleStateNotificationTimer setFireDate:v9];
    }
    else
    {
      [(MediaStreamMonitor *)self performSelectorOnMainThread:"_didIdle" withObject:0 waitUntilDone:1];
    }
  }
}

- (void)_stopIdleTimer
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v5 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Stopping idle timer", v5, 2u);
  }
  idleTimer = self->_idleTimer;
  id v4 = +[NSDate distantFuture];
  [(NSTimer *)idleTimer setFireDate:v4];
}

- (void)_startIdleTimerWithInterval:(double)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134217984;
    double v8 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Starting idle check timer with an interval of %.1f seconds.", (uint8_t *)&v7, 0xCu);
  }
  idleTimer = self->_idleTimer;
  double v6 = +[NSDate dateWithTimeIntervalSinceNow:a3];
  [(NSTimer *)idleTimer setFireDate:v6];
}

- (void)dealloc
{
  [(NSTimer *)self->_idleStateNotificationTimer invalidate];
  [(NSTimer *)self->_idleTimer invalidate];
  [(NSTimer *)self->_albumSharingDaemonPokeTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MediaStreamMonitor;
  [(MediaStreamMonitor *)&v3 dealloc];
}

- (MediaStreamMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)MediaStreamMonitor;
  int v2 = [(MediaStreamMonitor *)&v11 init];
  objc_super v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(MediaStreamMonitor *)v2 _dormantTimerWithSelector:"mstreamdIdleTimerDidFire:"];
    idleTimer = v3->_idleTimer;
    v3->_idleTimer = (NSTimer *)v4;

    double v6 = +[NSRunLoop currentRunLoop];
    [v6 addTimer:v3->_idleTimer forMode:NSDefaultRunLoopMode];

    uint64_t v7 = [(MediaStreamMonitor *)v3 _dormantTimerWithSelector:"albumSharingDaemonPokeTimerDidFire:"];
    albumSharingDaemonPokeTimer = v3->_albumSharingDaemonPokeTimer;
    v3->_albumSharingDaemonPokeTimer = (NSTimer *)v7;

    id v9 = +[NSRunLoop currentRunLoop];
    [v9 addTimer:v3->_albumSharingDaemonPokeTimer forMode:NSDefaultRunLoopMode];
  }
  return v3;
}

- (id)_dormantTimerWithSelector:(SEL)a3
{
  id v5 = objc_alloc((Class)NSTimer);
  double v6 = +[NSDate distantFuture];
  id v7 = [v5 initWithFireDate:v6 interval:self target:a3 selector:0 userInfo:1 repeats:1000000000.0];

  return v7;
}

@end