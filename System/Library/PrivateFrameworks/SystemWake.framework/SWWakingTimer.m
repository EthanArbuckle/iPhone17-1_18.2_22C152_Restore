@interface SWWakingTimer
- (BOOL)isScheduled;
- (NSString)description;
- (NSString)identifier;
- (SWWakingTimer)initWithIdentifier:(id)a3;
- (SWWakingTimer)initWithIdentifier:(id)a3 sleepMonitor:(id)a4 sleepAssertionProvider:(id)a5;
- (double)timeRemaining;
- (uint64_t)_updateScheduledWakeAndCheckCanSleep;
- (void)_lock_cancel;
- (void)_lock_setPreventSleepAssertion:(uint64_t)a1;
- (void)_setPreventSleepAssertion:(uint64_t)a1;
- (void)_timerFired:(uint64_t)a1;
- (void)_updateScheduledWakeAndAcquireSystemActivityAssertionIfNeeded;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)scheduleForDate:(id)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6;
- (void)scheduleWithFireInterval:(double)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6;
- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4;
- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4;
@end

@implementation SWWakingTimer

- (SWWakingTimer)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[SWSystemSleepMonitor monitorUsingMainQueue];
  v6 = +[SWSystemSleepAssertionProvider sharedProvider];
  v7 = [(SWWakingTimer *)self initWithIdentifier:v4 sleepMonitor:v5 sleepAssertionProvider:v6];

  return v7;
}

- (SWWakingTimer)initWithIdentifier:(id)a3 sleepMonitor:(id)a4 sleepAssertionProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SWWakingTimer;
  v12 = [(SWWakingTimer *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_sleepMonitor, a4);
    objc_storeStrong((id *)&v13->_sleepAssertionProvider, a5);
    v14 = [[SWScheduledSystemWake alloc] initWithIdentifier:v9];
    scheduledWake = v13->_scheduledWake;
    v13->_scheduledWake = v14;

    [v10 addObserver:v13];
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = SWLogTimer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    id v11 = self;
    __int16 v12 = 2114;
    v13 = self;
    _os_log_debug_impl(&dword_210809000, v4, OS_LOG_TYPE_DEBUG, "%p dealloc %{public}@", buf, 0x16u);
  }

  if (!self->_lock_invalidated)
  {
    v5 = [NSString stringWithFormat:@"%p must invalidate before dealloc : %@", self, self];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (SWWakingTimer *)(id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      v13 = v8;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2114;
      objc_super v17 = @"SWWakingTimer.m";
      __int16 v18 = 1024;
      int v19 = 53;
      __int16 v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2108128E0);
  }
  v9.receiver = self;
  v9.super_class = (Class)SWWakingTimer;
  [(SWWakingTimer *)&v9 dealloc];
}

- (BOOL)isScheduled
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_timer = self->_lock_timer;
  if (lock_timer) {
    char v5 = [(BSTimerScheduleQuerying *)lock_timer isScheduled];
  }
  else {
    char v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (double)timeRemaining
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_timer = self->_lock_timer;
  if (lock_timer)
  {
    [(BSTimerScheduleQuerying *)lock_timer timeRemaining];
    double v6 = v5;
  }
  else
  {
    double v6 = NAN;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_identifier withName:@"identifier"];
  id v4 = (id)[v3 appendObject:self->_lock_timer withName:@"timer"];
  id v5 = (id)[v3 appendBool:self->_lock_invalidated withName:@"isInvalidated"];
  double v6 = [v3 build];

  return (NSString *)v6;
}

- (void)scheduleWithFireInterval:(double)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  if (!v12)
  {
    objc_super v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      int v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      __int16 v20 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(void *)&location[4] = v18;
      __int16 v32 = 2114;
      v33 = v20;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2114;
      v37 = @"SWWakingTimer.m";
      __int16 v38 = 1024;
      int v39 = 87;
      __int16 v40 = 2114;
      v41 = v17;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x210812DB8);
  }
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"leeway cannot be negative: %f", *(void *)&a4);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(void *)&location[4] = v22;
      __int16 v32 = 2114;
      v33 = v24;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2114;
      v37 = @"SWWakingTimer.m";
      __int16 v38 = 1024;
      int v39 = 88;
      __int16 v40 = 2114;
      v41 = v21;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x210812EB0);
  }
  v13 = (void *)[objc_alloc(MEMORY[0x263F29C20]) initWithIdentifier:self->_identifier];
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    v25 = [NSString stringWithFormat:@"cannot schedule after invalidating"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(void *)&location[4] = v26;
      __int16 v32 = 2114;
      v33 = v28;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2114;
      v37 = @"SWWakingTimer.m";
      __int16 v38 = 1024;
      int v39 = 93;
      __int16 v40 = 2114;
      v41 = v25;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x210812FA4);
  }
  [(BSTimerScheduleQuerying *)self->_lock_timer invalidate];
  objc_storeStrong((id *)&self->_lock_timer, v13);
  self->_lock_leeway = a4;
  __int16 v14 = (void *)MEMORY[0x216673C60](v12);
  id lock_handler = self->_lock_handler;
  self->_id lock_handler = v14;

  -[SWWakingTimer _lock_setPreventSleepAssertion:]((uint64_t)self, 0);
  os_unfair_lock_unlock(&self->_lock);
  __int16 v16 = SWLogTimer();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 134218242;
    *(void *)&location[4] = self;
    __int16 v32 = 2114;
    v33 = self;
    _os_log_debug_impl(&dword_210809000, v16, OS_LOG_TYPE_DEBUG, "%p scheduling %{public}@", location, 0x16u);
  }

  objc_initWeak((id *)location, self);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __71__SWWakingTimer_scheduleWithFireInterval_leewayInterval_queue_handler___block_invoke;
  v29[3] = &unk_264139BE0;
  objc_copyWeak(&v30, (id *)location);
  [v13 scheduleWithFireInterval:v11 leewayInterval:v29 queue:a3 handler:a4];
  if ([(SWSystemSleepMonitor *)self->_sleepMonitor hasSleepBeenRequested]) {
    -[SWWakingTimer _updateScheduledWakeAndCheckCanSleep]((os_unfair_lock_s *)self);
  }
  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)location);
}

- (void)_lock_setPreventSleepAssertion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v8 = v3;
    id v5 = v3;
    double v6 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v5;
    id v7 = v4;

    [v7 invalidate];
    id v3 = v8;
  }
}

void __71__SWWakingTimer_scheduleWithFireInterval_leewayInterval_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  -[SWWakingTimer _timerFired:]((uint64_t)WeakRetained, v3);
}

- (void)_timerFired:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v3 = (os_unfair_lock_s *)(a1 + 48);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    id v5 = *(id *)(a1 + 56);

    double v6 = SWLogTimer();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5 == v4)
    {
      if (v7)
      {
        int v9 = 134218242;
        uint64_t v10 = a1;
        __int16 v11 = 2114;
        uint64_t v12 = a1;
        _os_log_impl(&dword_210809000, v6, OS_LOG_TYPE_INFO, "%p timer fired:%{public}@", (uint8_t *)&v9, 0x16u);
      }

      id v8 = (void (**)(void, void))MEMORY[0x216673C60](*(void *)(a1 + 64));
      os_unfair_lock_unlock(v3);
      if (v8)
      {
        v8[2](v8, a1);
        -[SWWakingTimer _setPreventSleepAssertion:](a1, 0);
      }
    }
    else
    {
      if (v7)
      {
        int v9 = 134218242;
        uint64_t v10 = a1;
        __int16 v11 = 2114;
        uint64_t v12 = a1;
        _os_log_impl(&dword_210809000, v6, OS_LOG_TYPE_INFO, "%p obsolete timer fired:%{public}@", (uint8_t *)&v9, 0x16u);
      }

      os_unfair_lock_unlock(v3);
      id v8 = 0;
    }
  }
}

- (uint64_t)_updateScheduledWakeAndCheckCanSleep
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = a1 + 12;
    os_unfair_lock_lock(a1 + 12);
    [*(id *)(v1 + 56) timeRemaining];
    if (*(void *)(v1 + 56))
    {
      double v5 = v3;
      double v6 = v3 + CFAbsoluteTimeGetCurrent();
      double v7 = fabs(v6);
      int v8 = [*(id *)(v1 + 16) isScheduled];
      if (v7 != INFINITY)
      {
        if (!v8 || ([*(id *)(v1 + 16) wakeTime], vabdd_f64(v6, v9) >= 0.25))
        {
          double v10 = *(double *)(v1 + 72);
          if ((uint64_t)v10 <= 1) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = (uint64_t)v10;
          }
          [*(id *)(v1 + 16) scheduleWake:v11 leeway:v6];
        }
        if (v5 <= 0.5)
        {
          double v12 = *(double *)(v1 + 72);
          uint64_t v13 = SWLogTimer();
          __int16 v14 = v13;
          if (v12 >= 0.0 && v12 < 10.0)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              int v17 = 134218242;
              uint64_t v18 = v1;
              __int16 v19 = 2114;
              uint64_t v20 = v1;
              _os_log_impl(&dword_210809000, v14, OS_LOG_TYPE_DEFAULT, "%p preventing sleep for:%{public}@", (uint8_t *)&v17, 0x16u);
            }

            uint64_t v1 = 0;
            goto LABEL_24;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = *(void *)(v1 + 72);
            int v17 = 134218498;
            uint64_t v18 = v1;
            __int16 v19 = 2114;
            uint64_t v20 = v1;
            __int16 v21 = 2048;
            uint64_t v22 = v16;
            _os_log_impl(&dword_210809000, v14, OS_LOG_TYPE_INFO, "%p not preventing sleep with fire imminent for %{public}@ because leeway is too large: %fs", (uint8_t *)&v17, 0x20u);
          }
        }
LABEL_23:
        uint64_t v1 = 1;
LABEL_24:
        os_unfair_lock_unlock(v2);
        return v1;
      }
      if (!v8) {
        goto LABEL_23;
      }
      id v4 = SWLogTimer();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
LABEL_22:

        [*(id *)(v1 + 16) cancelWake];
        goto LABEL_23;
      }
    }
    else
    {
      if (![*(id *)(v1 + 16) isScheduled]) {
        goto LABEL_23;
      }
      id v4 = SWLogTimer();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_22;
      }
    }
    int v17 = 134218242;
    uint64_t v18 = v1;
    __int16 v19 = 2114;
    uint64_t v20 = v1;
    _os_log_debug_impl(&dword_210809000, v4, OS_LOG_TYPE_DEBUG, "%p unscheduled, cancelling wake %{public}@", (uint8_t *)&v17, 0x16u);
    goto LABEL_22;
  }
  return v1;
}

- (void)scheduleForDate:(id)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    uint64_t v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      __int16 v21 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(void *)&location[4] = v19;
      __int16 v29 = 2114;
      id v30 = v21;
      __int16 v31 = 2048;
      __int16 v32 = self;
      __int16 v33 = 2114;
      __int16 v34 = @"SWWakingTimer.m";
      __int16 v35 = 1024;
      int v36 = 116;
      __int16 v37 = 2114;
      __int16 v38 = v18;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2108138C0);
  }
  __int16 v14 = (void *)[objc_alloc(MEMORY[0x263F29D00]) initWithIdentifier:self->_identifier];
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    uint64_t v22 = [NSString stringWithFormat:@"cannot schedule after invalidating"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (SWWakingTimer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(void *)&location[4] = v23;
      __int16 v29 = 2114;
      id v30 = v25;
      __int16 v31 = 2048;
      __int16 v32 = self;
      __int16 v33 = 2114;
      __int16 v34 = @"SWWakingTimer.m";
      __int16 v35 = 1024;
      int v36 = 121;
      __int16 v37 = 2114;
      __int16 v38 = v22;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2108139B4);
  }
  [(BSTimerScheduleQuerying *)self->_lock_timer invalidate];
  objc_storeStrong((id *)&self->_lock_timer, v14);
  v15 = (void *)MEMORY[0x216673C60](v13);
  id lock_handler = self->_lock_handler;
  self->_id lock_handler = v15;

  -[SWWakingTimer _lock_setPreventSleepAssertion:]((uint64_t)self, 0);
  os_unfair_lock_unlock(&self->_lock);
  int v17 = SWLogTimer();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 134218242;
    *(void *)&location[4] = self;
    __int16 v29 = 2114;
    id v30 = self;
    _os_log_debug_impl(&dword_210809000, v17, OS_LOG_TYPE_DEBUG, "%p scheduling %{public}@", location, 0x16u);
  }

  objc_initWeak((id *)location, self);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __62__SWWakingTimer_scheduleForDate_leewayInterval_queue_handler___block_invoke;
  v26[3] = &unk_264139C08;
  objc_copyWeak(&v27, (id *)location);
  [v14 scheduleForDate:v11 leewayInterval:v12 queue:v26 handler:a4];
  if ([(SWSystemSleepMonitor *)self->_sleepMonitor isSleepImminent]) {
    -[SWWakingTimer _updateScheduledWakeAndAcquireSystemActivityAssertionIfNeeded]((uint64_t)self);
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)location);
}

void __62__SWWakingTimer_scheduleForDate_leewayInterval_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  -[SWWakingTimer _timerFired:]((uint64_t)WeakRetained, v3);
}

- (void)_updateScheduledWakeAndAcquireSystemActivityAssertionIfNeeded
{
  if (a1 && (-[SWWakingTimer _updateScheduledWakeAndCheckCanSleep]((os_unfair_lock_s *)a1) & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) acquireSystemActivityAssertionWithIdentifier:*(void *)(a1 + 8)];
    -[SWWakingTimer _setPreventSleepAssertion:](a1, v2);
  }
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SWWakingTimer _lock_cancel]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancel
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = *(void **)(a1 + 56);
    if (v2 && [v2 isScheduled])
    {
      id v3 = SWLogTimer();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        int v5 = 134218242;
        uint64_t v6 = a1;
        __int16 v7 = 2114;
        uint64_t v8 = a1;
        _os_log_debug_impl(&dword_210809000, v3, OS_LOG_TYPE_DEBUG, "%p canceling %{public}@", (uint8_t *)&v5, 0x16u);
      }
    }
    [*(id *)(a1 + 56) invalidate];
    id v4 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    -[SWWakingTimer _lock_setPreventSleepAssertion:](a1, 0);
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  -[SWWakingTimer _lock_cancel]((uint64_t)self);
  [(SWScheduledSystemWake *)self->_scheduledWake invalidate];
  [(SWSystemSleepMonitor *)self->_sleepMonitor removeObserver:self];
  sleepMonitor = self->_sleepMonitor;
  self->_sleepMonitor = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4
{
  __int16 v7 = (void (**)(id, uint64_t, NSString *))a4;
  uint64_t v5 = -[SWWakingTimer _updateScheduledWakeAndCheckCanSleep]((os_unfair_lock_s *)self);
  uint64_t v6 = v7[2](v7, v5, self->_identifier);
  -[SWWakingTimer _setPreventSleepAssertion:]((uint64_t)self, v6);
}

- (void)_setPreventSleepAssertion:(uint64_t)a1
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if (*(unsigned char *)(a1 + 80))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
      id v4 = SWLogTimer();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 134218242;
        uint64_t v6 = a1;
        __int16 v7 = 2114;
        id v8 = v3;
        _os_log_impl(&dword_210809000, v4, OS_LOG_TYPE_DEFAULT, "%p timer invalidated while taking power assertion, will invalidate it immediately %{public}@", (uint8_t *)&v5, 0x16u);
      }

      [v3 invalidate];
    }
    else
    {
      -[SWWakingTimer _lock_setPreventSleepAssertion:](a1, v3);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    }
  }
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  int v5 = (void (**)(void))a4;
  -[SWWakingTimer _updateScheduledWakeAndAcquireSystemActivityAssertionIfNeeded]((uint64_t)self);
  v5[2]();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_handler, 0);
  objc_storeStrong((id *)&self->_lock_timer, 0);
  objc_storeStrong((id *)&self->_preventSleepAssertion, 0);
  objc_storeStrong((id *)&self->_sleepAssertionProvider, 0);
  objc_storeStrong((id *)&self->_sleepMonitor, 0);
  objc_storeStrong((id *)&self->_scheduledWake, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end