@interface SWScheduledSystemWake
- (BOOL)isScheduled;
- (NSString)description;
- (NSString)identifier;
- (SWScheduledSystemWake)initWithIdentifier:(id)a3;
- (double)wakeTime;
- (int64_t)leeway;
- (void)_cancelWakeAtDate:(void *)a3 identifier:;
- (void)cancelWake;
- (void)dealloc;
- (void)invalidate;
- (void)scheduleWake:(double)a3 leeway:(int64_t)a4;
@end

@implementation SWScheduledSystemWake

- (SWScheduledSystemWake)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWScheduledSystemWake;
  v6 = [(SWScheduledSystemWake *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    id v5 = [NSString stringWithFormat:@"%p must invalidate before dealloc : %@", self, self];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      v13 = v8;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2114;
      v17 = @"SWScheduledSystemWake.m";
      __int16 v18 = 1024;
      int v19 = 44;
      __int16 v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2108144C0);
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)SWScheduledSystemWake;
  [(SWScheduledSystemWake *)&v9 dealloc];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C30] sharedInstance];
  v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v4 appendString:self->_identifier withName:@"identifier"];
  id v5 = [v3 formatDateAsLongYMDHMSZPosixLocaleWithDate:self->_lock_wakeDate];
  [v4 appendString:v5 withName:@"wakeDate"];

  [(NSDate *)self->_lock_wakeDate timeIntervalSinceNow];
  id v6 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", @"timeRemaining", 1);
  id v7 = (id)[v4 appendTimeInterval:@"leeway" withName:0 decomposeUnits:(double)self->_lock_leeway];
  v8 = [v4 build];

  return (NSString *)v8;
}

- (BOOL)isScheduled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_wakeDate != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)wakeTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_wakeDate = self->_lock_wakeDate;
  if (lock_wakeDate)
  {
    [(NSDate *)lock_wakeDate timeIntervalSinceReferenceDate];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (int64_t)leeway
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_wakeDate = self->_lock_wakeDate;
  if (lock_wakeDate)
  {
    [(NSDate *)lock_wakeDate timeIntervalSinceReferenceDate];
    int64_t v6 = (uint64_t)v5;
  }
  else
  {
    int64_t v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)scheduleWake:(double)a3 leeway:(int64_t)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    v26 = [NSString stringWithFormat:@"%p scheduled wake can not be rescheduled after invalidation : %@", self, self];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (SWScheduledSystemWake *)(id)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (SWScheduledSystemWake *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v36 = v27;
      __int16 v37 = 2114;
      v38 = v29;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2114;
      v42 = @"SWScheduledSystemWake.m";
      __int16 v43 = 1024;
      int v44 = 84;
      __int16 v45 = 2114;
      v46 = v26;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x210814AECLL);
  }
  objc_super v9 = self->_lock_wakeDate;
  v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:a3];
  lock_wakeDate = self->_lock_wakeDate;
  self->_lock_wakeDate = v10;

  self->_lock_leeway = a4;
  __int16 v12 = self->_lock_wakeIdentifier;
  v13 = NSString;
  identifier = self->_identifier;
  v15 = [MEMORY[0x263F08C38] UUID];
  __int16 v16 = [v15 UUIDString];
  v17 = [v13 stringWithFormat:@"%@:%@", identifier, v16];
  lock_wakeIdentifier = self->_lock_wakeIdentifier;
  self->_lock_wakeIdentifier = v17;

  v33[0] = @"scheduledby";
  v33[1] = @"time";
  int v19 = self->_lock_wakeDate;
  v34[0] = self->_lock_wakeIdentifier;
  v34[1] = v19;
  v33[2] = @"leeway";
  __int16 v20 = [NSNumber numberWithInteger:self->_lock_leeway];
  v34[2] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];

  uint64_t v22 = +[SWPreventSystemSleepAssertion sharedHighPriorityQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SWScheduledSystemWake_scheduleWake_leeway___block_invoke;
  block[3] = &unk_264139988;
  id v23 = v21;
  id v31 = v23;
  v32 = self;
  dispatch_async(v22, block);

  if (v9)
  {
    [(NSDate *)self->_lock_wakeDate timeIntervalSinceDate:v9];
    if (fabs(v24) < 1.0) {
      goto LABEL_7;
    }
  }
  v25 = SWLogTimer();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v36 = self;
    __int16 v37 = 2114;
    v38 = self;
    _os_log_impl(&dword_210809000, v25, OS_LOG_TYPE_INFO, "%p scheduling system wake: %{public}@", buf, 0x16u);
  }

  if (v9) {
LABEL_7:
  }
    -[SWScheduledSystemWake _cancelWakeAtDate:identifier:]((uint64_t)self, v9, v12);
  os_unfair_lock_unlock(p_lock);
}

void __45__SWScheduledSystemWake_scheduleWake_leeway___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (IOPMRequestSysWake())
  {
    v2 = SWLogTimer();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 134218242;
      uint64_t v6 = v3;
      __int16 v7 = 2114;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_210809000, v2, OS_LOG_TYPE_ERROR, "%p failed to request system wake:%{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_cancelWakeAtDate:(void *)a3 identifier:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    __int16 v7 = +[SWPreventSystemSleepAssertion sharedHighPriorityQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__SWScheduledSystemWake__cancelWakeAtDate_identifier___block_invoke;
    block[3] = &unk_264139C30;
    id v9 = v5;
    id v10 = v6;
    uint64_t v11 = a1;
    dispatch_async(v7, block);
  }
}

- (void)cancelWake
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_wakeDate)
  {
    uint64_t v4 = SWLogTimer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 134218242;
      id v9 = self;
      __int16 v10 = 2114;
      uint64_t v11 = self;
      _os_log_impl(&dword_210809000, v4, OS_LOG_TYPE_INFO, "%p canceling system wake: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    lock_wakeDate = self->_lock_wakeDate;
    if (lock_wakeDate)
    {
      -[SWScheduledSystemWake _cancelWakeAtDate:identifier:]((uint64_t)self, lock_wakeDate, self->_lock_wakeIdentifier);
      id v6 = self->_lock_wakeDate;
      self->_lock_wakeDate = 0;

      lock_wakeIdentifier = self->_lock_wakeIdentifier;
      self->_lock_wakeIdentifier = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  [(SWScheduledSystemWake *)self cancelWake];
}

void __54__SWScheduledSystemWake__cancelWakeAtDate_identifier___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  IOReturn v2 = IOPMCancelScheduledPowerEvent(*(CFDateRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), @"wake");
  if (v2)
  {
    IOReturn v3 = v2;
    uint64_t v4 = [MEMORY[0x263F29C30] sharedInstance];
    id v5 = SWLogTimer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      id v8 = [v4 formatDateAsLongYMDHMSZPosixLocaleWithDate:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) timeIntervalSinceNow];
      id v9 = objc_msgSend(v4, "formatDuration:");
      int v10 = 134219010;
      uint64_t v11 = v7;
      __int16 v12 = 1024;
      IOReturn v13 = v3;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      id v17 = v8;
      __int16 v18 = 2114;
      int v19 = v9;
      _os_log_error_impl(&dword_210809000, v5, OS_LOG_TYPE_ERROR, "%p failed (%d) to cancel system wake id:%{public}@ date:%{public}@ (in %{public}@", (uint8_t *)&v10, 0x30u);
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lock_wakeIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_wakeDate, 0);
}

@end