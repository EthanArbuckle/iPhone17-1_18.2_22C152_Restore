@interface PCSimpleTimer
+ (double)currentMachTimeInterval;
+ (id)lastSystemWakeDate;
- (BOOL)disableSystemWaking;
- (BOOL)firingIsImminent;
- (BOOL)isUserVisible;
- (BOOL)isValid;
- (PCSimpleTimer)initWithAbsoluteTime:(double)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 triggerOnGMTChange:(BOOL)a8;
- (PCSimpleTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7;
- (PCSimpleTimer)initWithTimeInterval:(double)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7;
- (id)_getTimerMode;
- (id)_getTimerRunLoop;
- (id)debugDescription;
- (id)userInfo;
- (void)_fireTimerFired;
- (void)_invalidateAllowAsync:(BOOL)a3;
- (void)_performBlockOnQueue:(id)a3;
- (void)_powerNotificationSleepIsImminent;
- (void)_powerNotificationSleepIsNotImminent;
- (void)_preventSleepFired;
- (void)_scheduleTimer;
- (void)_setPowerMonitoringEnabled:(BOOL)a3;
- (void)_setSignificantTimeChangeMonitoringEnabled:(BOOL)a3;
- (void)_significantTimeChange;
- (void)_updateTimers;
- (void)dealloc;
- (void)invalidate;
- (void)scheduleInQueue:(id)a3;
- (void)scheduleInRunLoop:(id)a3;
- (void)scheduleInRunLoop:(id)a3 inMode:(id)a4;
- (void)setDisableSystemWaking:(BOOL)a3;
- (void)setUserVisible:(BOOL)a3;
- (void)updateFireTime:(double)a3 triggerOnGMTChange:(BOOL)a4;
@end

@implementation PCSimpleTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerMode, 0);
  objc_storeStrong((id *)&self->_timerRunLoop, 0);
  objc_storeStrong(&self->_timeChangeSource, 0);
  objc_storeStrong((id *)&self->_fireTimer, 0);
  objc_storeStrong((id *)&self->_preventSleepTimer, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduledWakeDate, 0);
}

- (void)dealloc
{
  [(PCSimpleTimer *)self _invalidateAllowAsync:0];
  v3.receiver = self;
  v3.super_class = (Class)PCSimpleTimer;
  [(PCSimpleTimer *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)updateFireTime:(double)a3 triggerOnGMTChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v6 = self;
  objc_sync_enter(v6);
  double fireTime = v6->_fireTime;
  if (fireTime != a3 || v6->_triggerOnGMTChange != v4)
  {
    double earlyFireDelta = v6->_earlyFireDelta;
    v9 = +[PCLog timer];
    double v10 = fireTime + earlyFireDelta - a3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6->_fireTime];
      double v12 = v6->_earlyFireDelta;
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
      v14 = (void *)v13;
      BOOL triggerOnGMTChange = v6->_triggerOnGMTChange;
      v16 = @"YES";
      int v18 = 138544898;
      if (triggerOnGMTChange) {
        v17 = @"YES";
      }
      else {
        v17 = @"NO";
      }
      v19 = v6;
      __int16 v20 = 2114;
      if (!v4) {
        v16 = @"NO";
      }
      id v21 = v11;
      __int16 v22 = 2048;
      double v23 = v12;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      __int16 v26 = 2048;
      double v27 = v10;
      __int16 v28 = 2114;
      v29 = v17;
      __int16 v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_1D340D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updateFireTime from %{public}@ + %g to %{public}@ + %g, trigger from %{public}@ to %{public}@", (uint8_t *)&v18, 0x48u);
    }
    v6->_double earlyFireDelta = v10;
    v6->_double fireTime = a3;
    v6->_BOOL triggerOnGMTChange = v4;
    [(PCSimpleTimer *)v6 _updateTimers];
  }
  objc_sync_exit(v6);
}

- (void)setUserVisible:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_userVisible = a3;
  [(PCSimpleTimer *)obj _updateTimers];
  objc_sync_exit(obj);
}

- (void)_updateTimers
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (self->_fireTimer && [(PCDispatchTimer *)self->_preventSleepTimer isValid])
  {
    if (self->_sleepIsImminent)
    {
      objc_super v3 = +[PCLog timer];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D340D000, v3, OS_LOG_TYPE_DEFAULT, "Suspended timer for imminent system sleep", buf, 2u);
      }

      preventSleepTimer = self->_preventSleepTimer;
      v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [(PCDispatchTimer *)preventSleepTimer setFireDate:v5];

      fireTimer = self->_fireTimer;
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
LABEL_7:
      v8 = (void *)v7;
      [(PCDispatchTimer *)fireTimer setFireDate:v7];
LABEL_31:

      return;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    double v10 = Current;
    if (self->_triggerOnGMTChange && self->_lastUpdateTime - Current > 60.0)
    {
      id v11 = +[PCLog timer];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_fireTime];
        PCStringFromDate(v12);
        uint64_t v13 = (PCSimpleTimer *)objc_claimAutoreleasedReturnValue();
        double v14 = self->_lastUpdateTime - v10;
        *(_DWORD *)buf = 138543618;
        v34 = v13;
        __int16 v35 = 2048;
        double v36 = v14;
        _os_log_impl(&dword_1D340D000, v11, OS_LOG_TYPE_DEFAULT, "Firing simple timer that was scheduled to fire at [%{public}@] since time has moved backwards by at least %g seconds", buf, 0x16u);
      }
      [(PCDispatchTimer *)self->_preventSleepTimer invalidate];
      fireTimer = self->_fireTimer;
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];
      goto LABEL_7;
    }
    v15 = (void *)MEMORY[0x1E4F1C9C8];
    double fireTime = self->_fireTime;
    if (PCScheduledWakeRTCPrecision_onceToken != -1)
    {
      double v32 = self->_fireTime;
      dispatch_once(&PCScheduledWakeRTCPrecision_onceToken, &__block_literal_global_9);
      double fireTime = v32;
    }
    v17 = [v15 dateWithTimeIntervalSinceReferenceDate:fireTime - *(double *)&PCScheduledWakeRTCPrecision_scheduledWakeRTCPrecision];
    v8 = v17;
    if (self->_disableSystemWaking)
    {
      id v18 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    else
    {
      id v18 = v17;
    }
    v19 = v18;
    [(PCDispatchTimer *)self->_preventSleepTimer setFireDate:v18];
    __int16 v20 = self->_fireTimer;
    id v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_fireTime];
    [(PCDispatchTimer *)v20 setFireDate:v21];

    scheduledWakeDate = self->_scheduledWakeDate;
    if (self->_disableSystemWaking)
    {
      if (scheduledWakeDate)
      {
        double v23 = +[PCLog timer];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          PCStringFromDate(self->_scheduledWakeDate);
          double v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138543618;
          v34 = self;
          __int16 v35 = 2114;
          double v36 = v24;
          _os_log_impl(&dword_1D340D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Canceling system wake for simpletimer [%{public}@]", buf, 0x16u);
        }
        +[PCSystemWakeManager scheduleWake:0 wakeDate:self->_scheduledWakeDate acceptableDelay:self->_userVisible userVisible:self->_serviceIdentifier serviceIdentifier:self uniqueIdentifier:0.0];
        uint64_t v25 = 0;
LABEL_29:
        v31 = self->_scheduledWakeDate;
        self->_scheduledWakeDate = v25;
      }
    }
    else if (([v8 isEqualToDate:scheduledWakeDate] & 1) == 0)
    {
      __int16 v26 = +[PCLog timer];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        PCStringFromDate(self->_scheduledWakeDate);
        double v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        __int16 v28 = PCStringFromDate(v8);
        double earlyFireDelta = self->_earlyFireDelta;
        *(_DWORD *)buf = 138544130;
        v34 = self;
        __int16 v35 = 2114;
        double v36 = v27;
        __int16 v37 = 2114;
        v38 = v28;
        __int16 v39 = 2048;
        double v40 = earlyFireDelta;
        _os_log_impl(&dword_1D340D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Existing wake at %{public}@ re-scheduling to %{public}@ with leeway of %g", buf, 0x2Au);
      }
      +[PCSystemWakeManager scheduleWake:1 wakeDate:v8 acceptableDelay:self->_userVisible userVisible:self->_serviceIdentifier serviceIdentifier:self uniqueIdentifier:self->_earlyFireDelta];
      __int16 v30 = self->_scheduledWakeDate;
      if (v30) {
        +[PCSystemWakeManager scheduleWake:0 wakeDate:v30 acceptableDelay:self->_userVisible userVisible:self->_serviceIdentifier serviceIdentifier:self uniqueIdentifier:0.0];
      }
      uint64_t v25 = v8;
      goto LABEL_29;
    }
    self->_lastUpdateTime = v10;

    goto LABEL_31;
  }
}

- (void)setDisableSystemWaking:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_disableSystemWaking = a3;
  [(PCSimpleTimer *)obj _updateTimers];
  objc_sync_exit(obj);
}

- (void)scheduleInRunLoop:(id)a3 inMode:(id)a4
{
  uint64_t v13 = (NSRunLoop *)a3;
  v8 = (NSString *)a4;
  v9 = self;
  objc_sync_enter(v9);
  if (!v8)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, v9, @"PCSimpleTimer.m", 178, @"%@ run loop mode cannot be nil", objc_opt_class() object file lineNumber description];
  }
  if (!v9->_target)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, v9, @"PCSimpleTimer.m", 179, @"Cannot schedule invalidated %@", objc_opt_class() object file lineNumber description];
  }
  if (v9->_queue)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, v9, @"PCSimpleTimer.m", 180, @"Cannot schedule on runloop when already scheduled on queue %@", objc_opt_class() object file lineNumber description];
  }
  if (v9->_timerRunLoop != v13) {
    objc_storeStrong((id *)&v9->_timerRunLoop, a3);
  }
  if (v9->_timerMode != v8) {
    objc_storeStrong((id *)&v9->_timerMode, a4);
  }
  [(PCSimpleTimer *)v9 _scheduleTimer];
  objc_sync_exit(v9);
}

- (PCSimpleTimer)initWithAbsoluteTime:(double)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 triggerOnGMTChange:(BOOL)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)PCSimpleTimer;
  id v18 = [(PCSimpleTimer *)&v24 init];
  if (v18)
  {
    if (!v16 || !a6)
    {
      double v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v18, @"PCSimpleTimer.m", 119, @"%@ target and selector are required", objc_opt_class() object file lineNumber description];
    }
    v18->_double fireTime = a3;
    uint64_t v19 = [v15 copy];
    serviceIdentifier = v18->_serviceIdentifier;
    v18->_serviceIdentifier = (NSString *)v19;

    objc_storeStrong(&v18->_target, a5);
    if (a6) {
      SEL v21 = a6;
    }
    else {
      SEL v21 = 0;
    }
    v18->_selector = v21;
    objc_storeStrong(&v18->_userInfo, a7);
    v18->_BOOL triggerOnGMTChange = a8;
  }

  return v18;
}

- (void)_scheduleTimer
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  fireTimer = v2->_fireTimer;
  if (!fireTimer)
  {
    BOOL v4 = +[PCLog timer];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v2->_fireTime];
      PCStringFromDate(v5);
      v6 = (PCDispatchTimer *)objc_claimAutoreleasedReturnValue();
      int v19 = 138543618;
      __int16 v20 = v2;
      __int16 v21 = 2114;
      __int16 v22 = v6;
      _os_log_impl(&dword_1D340D000, v4, OS_LOG_TYPE_DEFAULT, "Started simple timer %{public}@ with fire date [%{public}@]", (uint8_t *)&v19, 0x16u);
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v2->_startTime = Current;
    v2->_lastUpdateTime = Current;
    queue = v2->_queue;
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (queue) {
      dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("PCSimpleTimer-timerQ", v9, queue);
    }
    else {
      dispatch_queue_t v10 = dispatch_queue_create("PCSimpleTimer-timerQ", v9);
    }
    dispatch_queue_t v11 = v10;

    double v12 = [[PCDispatchTimer alloc] initWithQueue:v11 target:v2 selector:sel__preventSleepFired fireTime:-1];
    preventSleepTimer = v2->_preventSleepTimer;
    v2->_preventSleepTimer = v12;

    double v14 = [[PCDispatchTimer alloc] initWithQueue:v11 target:v2 selector:sel__fireTimerFired fireTime:-1];
    id v15 = v2->_fireTimer;
    v2->_fireTimer = v14;

    id v16 = +[PCLog timer];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v2->_preventSleepTimer;
      id v18 = v2->_fireTimer;
      int v19 = 138544130;
      __int16 v20 = v2;
      __int16 v21 = 2114;
      __int16 v22 = v17;
      __int16 v23 = 2114;
      objc_super v24 = v18;
      __int16 v25 = 2114;
      dispatch_queue_t v26 = v11;
      _os_log_impl(&dword_1D340D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ created preventSleepTimer %{public}@ and fireTimer %{public}@ on queue %{public}@", (uint8_t *)&v19, 0x2Au);
    }

    fireTimer = v2->_fireTimer;
  }
  [(PCDispatchTimer *)fireTimer start];
  [(PCDispatchTimer *)v2->_preventSleepTimer start];
  [(PCSimpleTimer *)v2 _setPowerMonitoringEnabled:1];
  [(PCSimpleTimer *)v2 _setSignificantTimeChangeMonitoringEnabled:1];
  [(PCSimpleTimer *)v2 _updateTimers];
  objc_sync_exit(v2);
}

- (void)_invalidateAllowAsync:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v4 = self;
  objc_sync_enter(v4);
  if (v4->_target)
  {
    v5 = +[PCLog timer];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v23 = v4;
      _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating simple timer %{public}@", buf, 0xCu);
    }

    id target = v4->_target;
    v4->_id target = 0;

    v4->_selector = 0;
    timerRunLoop = v4->_timerRunLoop;
    v4->_timerRunLoop = 0;

    timerMode = v4->_timerMode;
    v4->_timerMode = 0;

    queue = v4->_queue;
    v4->_queue = 0;

    [(PCDispatchTimer *)v4->_preventSleepTimer invalidate];
    preventSleepTimer = v4->_preventSleepTimer;
    v4->_preventSleepTimer = 0;

    [(PCDispatchTimer *)v4->_fireTimer invalidate];
    fireTimer = v4->_fireTimer;
    v4->_fireTimer = 0;

    scheduledWakeDate = v4->_scheduledWakeDate;
    if (scheduledWakeDate)
    {
      [(NSDate *)scheduledWakeDate timeIntervalSinceNow];
      if (v13 >= 2.22044605e-16)
      {
        id v16 = +[PCLog timer];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          PCStringFromDate(v4->_scheduledWakeDate);
          id v17 = (PCSimpleTimer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          __int16 v23 = v17;
          _os_log_impl(&dword_1D340D000, v16, OS_LOG_TYPE_DEFAULT, "Canceling system wake for simpletimer [%{public}@]", buf, 0xCu);
        }
        +[PCSystemWakeManager scheduleWake:0 wakeDate:v4->_scheduledWakeDate acceptableDelay:v4->_userVisible userVisible:v4->_serviceIdentifier serviceIdentifier:v4 uniqueIdentifier:0.0];
      }
      else
      {
        double v14 = +[PCLog timer];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          PCStringFromDate(v4->_scheduledWakeDate);
          id v15 = (PCSimpleTimer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          __int16 v23 = v15;
          _os_log_impl(&dword_1D340D000, v14, OS_LOG_TYPE_DEFAULT, "Not canceling system wake for [%{public}@], which is in the past", buf, 0xCu);
        }
      }
      id v18 = v4->_scheduledWakeDate;
      v4->_scheduledWakeDate = 0;
    }
    if (v4->_powerAssertionID)
    {
      int v19 = +[PCLog timer];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int powerAssertionID = v4->_powerAssertionID;
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = powerAssertionID;
        _os_log_impl(&dword_1D340D000, v19, OS_LOG_TYPE_DEFAULT, "Releasing prevent sleep power assertion %i", buf, 8u);
      }

      uint64_t v21 = IOPMAssertionRelease(v4->_powerAssertionID);
      if (v21) {
        NSLog(&cfstr_FailedToReleas.isa, v4->_powerAssertionID, v21);
      }
      v4->_unsigned int powerAssertionID = 0;
    }
    if (v3) {
      [(PCSimpleTimer *)v4 _setPowerMonitoringEnabled:0];
    }
    [(PCSimpleTimer *)v4 _setSignificantTimeChangeMonitoringEnabled:0];
  }
  objc_sync_exit(v4);
}

- (void)_setSignificantTimeChangeMonitoringEnabled:(BOOL)a3
{
  p_int significantTimeChangeToken = &self->_significantTimeChangeToken;
  int significantTimeChangeToken = self->_significantTimeChangeToken;
  if (a3)
  {
    if (significantTimeChangeToken == -1)
    {
      v6 = dispatch_queue_create("PCSimpleTimer-SignificantTimeChangeQueue", 0);
      uint64_t v7 = [MEMORY[0x1E4F59E30] weakRefWithObject:self];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __60__PCSimpleTimer__setSignificantTimeChangeMonitoringEnabled___block_invoke;
      handler[3] = &unk_1E698DF18;
      id v10 = v7;
      id v8 = v7;
      notify_register_dispatch("SignificantTimeChangeNotification", p_significantTimeChangeToken, v6, handler);
    }
  }
  else if (significantTimeChangeToken != -1)
  {
    notify_cancel(significantTimeChangeToken);
    *p_int significantTimeChangeToken = -1;
  }
}

- (void)_setPowerMonitoringEnabled:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = self;
    BOOL v4 = _GetPowerMonitoringQueue();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v5 = ___EnablePowerMonitoring_block_invoke;
  }
  else
  {
    BOOL v3 = self;
    BOOL v4 = _GetPowerMonitoringQueue();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    v5 = ___DisablePowerMonitoring_block_invoke;
  }
  v9 = v5;
  id v10 = &unk_1E698DE90;
  dispatch_queue_t v11 = v3;
  v6 = v3;
  dispatch_async(v4, &block);
}

+ (id)lastSystemWakeDate
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  size_t v6 = 16;
  if (sysctlbyname("kern.waketime", &v7, &v6, 0, 0) || (uint64_t v2 = v7, v7 <= 31535999))
  {
    BOOL v3 = sysctlbyname("kern.boottime", &v7, &v6, 0, 0) == 0;
    uint64_t v2 = v7;
  }
  else
  {
    BOOL v3 = 1;
  }
  BOOL v4 = 0;
  if (v3 && v2)
  {
    BOOL v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v2 + (double)(int)v8 * 0.000001];
  }
  return v4;
}

+ (double)currentMachTimeInterval
{
  if (currentMachTimeInterval_pred != -1) {
    dispatch_once(&currentMachTimeInterval_pred, &__block_literal_global_78);
  }
  return *(double *)&currentMachTimeInterval_timeScale * (double)mach_absolute_time();
}

- (PCSimpleTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  [a3 timeIntervalSinceReferenceDate];
  id v15 = -[PCSimpleTimer initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:](self, "initWithAbsoluteTime:serviceIdentifier:target:selector:userInfo:triggerOnGMTChange:", v14, v13, a6, v12, 0);

  return v15;
}

- (PCSimpleTimer)initWithTimeInterval:(double)a3 serviceIdentifier:(id)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(PCSimpleTimer *)self initWithAbsoluteTime:v14 serviceIdentifier:v13 target:a6 selector:v12 userInfo:1 triggerOnGMTChange:CFAbsoluteTimeGetCurrent() + a3];

  return v15;
}

- (BOOL)isUserVisible
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL userVisible = v2->_userVisible;
  objc_sync_exit(v2);

  return userVisible;
}

- (void)scheduleInRunLoop:(id)a3
{
}

- (void)scheduleInQueue:(id)a3
{
  id v10 = (OS_dispatch_queue *)a3;
  size_t v6 = self;
  objc_sync_enter(v6);
  if (v6->_target)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, v6, @"PCSimpleTimer.m", 196, @"Cannot schedule invalidated %@", objc_opt_class() object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
  [v8 handleFailureInMethod:a2, v6, @"PCSimpleTimer.m", 197, @"Cannot schedule on NULL queue %@", objc_opt_class() object file lineNumber description];

LABEL_3:
  if (v6->_timerRunLoop)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, v6, @"PCSimpleTimer.m", 198, @"Cannot schedule on queue when already scheduled on runloop %@", objc_opt_class() object file lineNumber description];
  }
  if (v6->_queue != v10) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }
  [(PCSimpleTimer *)v6 _scheduleTimer];
  objc_sync_exit(v6);
}

- (BOOL)isValid
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_target != 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)firingIsImminent
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_powerAssertionID != 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)userInfo
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_userInfo;
  objc_sync_exit(v2);

  return v3;
}

- (id)_getTimerRunLoop
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_timerRunLoop;
  objc_sync_exit(v2);

  return v3;
}

- (id)_getTimerMode
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_timerMode;
  objc_sync_exit(v2);

  return v3;
}

- (void)_performBlockOnQueue:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    queue = v5->_queue;
    if (queue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PCSimpleTimer__performBlockOnQueue___block_invoke;
      block[3] = &unk_1E698E258;
      id v8 = v4;
      dispatch_async(queue, block);
    }
  }
  objc_sync_exit(v5);
}

uint64_t __38__PCSimpleTimer__performBlockOnQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_preventSleepFired
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1D340D000, a2, OS_LOG_TYPE_FAULT, "Unable to take power assertion. IOPMAssertionCreateWithDescription() returned %#x", (uint8_t *)v2, 8u);
}

- (void)_fireTimerFired
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_target)
  {
    if (!v2->_disableSystemWaking) {
      [(PCSimpleTimer *)v2 _preventSleepFired];
    }
    uint64_t v3 = +[PCLog timer];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v2;
      _os_log_impl(&dword_1D340D000, v3, OS_LOG_TYPE_DEFAULT, "SimpleTimer %{public}@ has fired", buf, 0xCu);
    }

    id v4 = v2->_target;
    v5 = v2->_timerMode;
    size_t v6 = v2->_timerRunLoop;
    queue = v2->_queue;
    if (queue) {
      id v8 = queue;
    }
    if (v2->_selector) {
      SEL selector = v2->_selector;
    }
    else {
      SEL selector = 0;
    }
    [(PCSimpleTimer *)v2 invalidate];
  }
  else
  {
    SEL selector = 0;
    v5 = 0;
    size_t v6 = 0;
    queue = 0;
    id v4 = 0;
  }
  objc_sync_exit(v2);

  if (v6 && v5)
  {
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
    [(NSRunLoop *)v6 performSelector:selector target:v4 argument:v2 order:0 modes:v10];

    CFRunLoopWakeUp([(NSRunLoop *)v6 getCFRunLoop]);
  }
  else if (queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PCSimpleTimer__fireTimerFired__block_invoke;
    block[3] = &unk_1E698E280;
    id v13 = v2;
    SEL v14 = selector;
    id v12 = v4;
    dispatch_async(queue, block);
  }
}

uint64_t __32__PCSimpleTimer__fireTimerFired__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (void)_powerNotificationSleepIsNotImminent
{
  obj = self;
  objc_sync_enter(obj);
  obj->_sleepIsImminent = 0;
  [(PCSimpleTimer *)obj _updateTimers];
  objc_sync_exit(obj);
}

- (void)_powerNotificationSleepIsImminent
{
  obj = self;
  objc_sync_enter(obj);
  obj->_sleepIsImminent = 1;
  [(PCSimpleTimer *)obj _updateTimers];
  objc_sync_exit(obj);
}

- (void)_significantTimeChange
{
  obj = self;
  objc_sync_enter(obj);
  [(PCSimpleTimer *)obj _updateTimers];
  objc_sync_exit(obj);
}

void __60__PCSimpleTimer__setSignificantTimeChangeMonitoringEnabled___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) object];
  [v1 _significantTimeChange];
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)PCSimpleTimer;
  id v4 = [(PCSimpleTimer *)&v15 description];
  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_fireTime];
  SEL selector = self->_selector;
  p_SEL selector = &self->_selector;
  size_t v6 = selector;
  uint64_t v9 = (uint64_t)*(p_selector - 1);
  if (selector) {
    id v10 = v6;
  }
  else {
    id v10 = 0;
  }
  if (*((unsigned char *)p_selector - 31)) {
    dispatch_queue_t v11 = "yes";
  }
  else {
    dispatch_queue_t v11 = "no";
  }
  id v12 = NSStringFromSelector(v10);
  id v13 = [v3 stringWithFormat:@"%@{fireDate = %@, disable system waking = %s, target = %@, selector = %@}", v4, v5, v11, v9, v12];

  return v13;
}

double __40__PCSimpleTimer_currentMachTimeInterval__block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 * 0.000000001;
  currentMachTimeInterval_timeScale = *(void *)&result;
  return result;
}

- (BOOL)disableSystemWaking
{
  return self->_disableSystemWaking;
}

@end