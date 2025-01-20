@interface SWPreventSystemSleepAssertion
+ (id)sharedHighPriorityQueue;
- (BOOL)isActive;
- (SWPreventSystemSleepAssertion)initWithIdentifier:(id)a3;
- (void)acquireWithTimeout:(double)a3 handler:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SWPreventSystemSleepAssertion

+ (id)sharedHighPriorityQueue
{
  if (qword_26AB24FC0 != -1) {
    dispatch_once(&qword_26AB24FC0, &__block_literal_global_2);
  }
  v2 = (void *)qword_26AB24FB8;
  return v2;
}

uint64_t __56__SWPreventSystemSleepAssertion_sharedHighPriorityQueue__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("SWPreventSystemSleepAssertion workloop");
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = (uint64_t)inactive;

  dispatch_workloop_set_scheduler_priority();
  dispatch_activate((dispatch_object_t)_MergedGlobals_2);
  qword_26AB24FB8 = (uint64_t)dispatch_queue_create_with_target_V2("SWPreventSystemSleepAssertionQueue", 0, (dispatch_queue_t)_MergedGlobals_2);
  return MEMORY[0x270F9A758]();
}

- (SWPreventSystemSleepAssertion)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWPreventSystemSleepAssertion;
  v5 = [(SWPreventSystemSleepAssertion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    *(void *)&v5->_lock_assertionID = 0;
    v5->_lock_timeoutTime = 0.0;
    v5->_invalidated = 0;
    v5->_lock_state = 0;
  }

  return v5;
}

- (void)acquireWithTimeout:(double)a3 handler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_state = self->_lock_state;
  if (lock_state)
  {
    v11 = [NSString stringWithFormat:@"SWPreventSystemSleepAssertion:%p id:%@ state:%u can only be acquired once", self, self->_identifier, lock_state];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      id v19 = v12;
      __int16 v20 = 2114;
      v21 = v14;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2114;
      v25 = @"SWPreventSystemSleepAssertion.m";
      __int16 v26 = 1024;
      int v27 = 69;
      __int16 v28 = 2114;
      v29 = v11;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x210815590);
  }
  self->_unint64_t lock_state = 1;
  os_unfair_lock_unlock(&self->_lock);
  objc_super v9 = +[SWPreventSystemSleepAssertion sharedHighPriorityQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SWPreventSystemSleepAssertion_acquireWithTimeout_handler___block_invoke;
  block[3] = &unk_264139B48;
  double v17 = a3;
  block[4] = self;
  id v16 = v7;
  id v10 = v7;
  dispatch_async(v9, block);
}

void __60__SWPreventSystemSleepAssertion_acquireWithTimeout_handler___block_invoke(uint64_t a1)
{
  v25[4] = *MEMORY[0x263EF8340];
  double v1 = *(double *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (void (**)(id, uint64_t))*(id *)(a1 + 40);
  if (!v2) {
    goto LABEL_23;
  }
  IOPMAssertionID AssertionID = 0;
  if (v1 <= 0.0)
  {
    IOReturn v7 = IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, *(CFStringRef *)(v2 + 8), &AssertionID);
  }
  else
  {
    v24[0] = @"AssertType";
    v24[1] = @"AssertName";
    uint64_t v4 = *(void *)(v2 + 8);
    v25[0] = @"NoIdleSleepAssertion";
    v25[1] = v4;
    v24[2] = @"TimeoutSeconds";
    v5 = [NSNumber numberWithDouble:v1];
    v24[3] = @"TimeoutAction";
    v25[2] = v5;
    v25[3] = @"TimeoutActionRelease";
    CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];

    IOReturn v7 = IOPMAssertionCreateWithProperties(v6, &AssertionID);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  uint64_t v8 = *(void *)(v2 + 32);
  if (v8 != 3)
  {
    if (!v7)
    {
      *(_DWORD *)(v2 + 16) = AssertionID;
      *(void *)(v2 + 32) = 2;
      if (v1 > 0.0)
      {
        BSContinuousMachTimeNow();
        *(double *)(v2 + 24) = v1 + v12;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
      objc_super v9 = SWLogPower();
      uint64_t v10 = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(v2 + 8);
        *(_DWORD *)buf = 134218498;
        uint64_t v19 = v2;
        __int16 v20 = 2114;
        uint64_t v21 = v13;
        __int16 v22 = 1024;
        LODWORD(v23) = AssertionID;
        _os_log_impl(&dword_210809000, v9, OS_LOG_TYPE_INFO, "%p power assertion taken identifier:%{public}@ id:%d", buf, 0x1Cu);
      }
      goto LABEL_12;
    }
    *(void *)(v2 + 32) = 3;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
LABEL_9:
    objc_super v9 = SWLogPower();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(v2 + 8);
      *(_DWORD *)buf = 134218498;
      uint64_t v19 = v2;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      _os_log_error_impl(&dword_210809000, v9, OS_LOG_TYPE_ERROR, "%p error:%ld creating power assertion identifier:%{public}@", buf, 0x20u);
    }
    uint64_t v10 = 0;
LABEL_12:

    BOOL v11 = v8 == 3;
    if (!v3) {
      BOOL v11 = 1;
    }
    if (!v11) {
      v3[2](v3, v10);
    }
    goto LABEL_23;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  if (v7) {
    goto LABEL_9;
  }
  v14 = SWLogPower();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(v2 + 8);
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v2;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    __int16 v22 = 1024;
    LODWORD(v23) = AssertionID;
    _os_log_impl(&dword_210809000, v14, OS_LOG_TYPE_DEFAULT, "%p power assertion take complete after invalidation, will release immediately, identifier:%@ id:%d", buf, 0x1Cu);
  }

  IOPMAssertionRelease(AssertionID);
LABEL_23:
}

- (BOOL)isActive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_assertionID)
  {
    if (self->_lock_timeoutTime == 0.0)
    {
      BOOL v5 = 1;
    }
    else
    {
      BSContinuousMachTimeNow();
      BOOL v5 = v4 < self->_lock_timeoutTime;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)invalidate
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int lock_assertionID = self->_lock_assertionID;
  self->_unsigned int lock_assertionID = 0;
  unint64_t lock_state = self->_lock_state;
  self->_unint64_t lock_state = 3;
  if (!lock_assertionID)
  {
    os_unfair_lock_unlock(p_lock);
    switch(lock_state)
    {
      case 0uLL:
        double v12 = SWLogPower();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_13;
        }
        identifier = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v25 = self;
        __int16 v26 = 2114;
        int v27 = identifier;
        v14 = "%p invalidated power assertion before starting acquisition identifier:%{public}@";
        goto LABEL_23;
      case 1uLL:
        double v12 = SWLogPower();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_13;
        }
        __int16 v20 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v25 = self;
        __int16 v26 = 2114;
        int v27 = v20;
        v14 = "%p invalidated power assertion during acquisition identifier:%{public}@";
        goto LABEL_23;
      case 2uLL:
        if (self->_lock_state == 2)
        {
          uint64_t v16 = [NSString stringWithFormat:@"SWPreventSystemSleepAssertion:%p id:%@ state:%u acquired but assertionID null before invalidation", self, self->_identifier, 2];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            double v17 = (SWPreventSystemSleepAssertion *)(id)objc_claimAutoreleasedReturnValue();
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            uint64_t v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v25 = v17;
            __int16 v26 = 2114;
            int v27 = v19;
            __int16 v28 = 2048;
            v29 = self;
            __int16 v30 = 2114;
            v31 = @"SWPreventSystemSleepAssertion.m";
            __int16 v32 = 1024;
            int v33 = 177;
            __int16 v34 = 2114;
            v35 = v16;
            _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v16 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x210815D4CLL);
        }
        return;
      case 3uLL:
        double v12 = SWLogPower();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_13;
        }
        uint64_t v21 = self->_identifier;
        *(_DWORD *)buf = 134218242;
        v25 = self;
        __int16 v26 = 2114;
        int v27 = v21;
        v14 = "%p already invalidated power assertion identifier:%{public}@";
LABEL_23:
        _os_log_debug_impl(&dword_210809000, v12, OS_LOG_TYPE_DEBUG, v14, buf, 0x16u);
        goto LABEL_13;
      default:
        return;
    }
  }
  if (self->_lock_timeoutTime == 0.0)
  {
    os_unfair_lock_unlock(p_lock);
LABEL_10:
    uint64_t v10 = SWLogPower();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = self->_identifier;
      *(_DWORD *)buf = 134218498;
      v25 = self;
      __int16 v26 = 2114;
      int v27 = v15;
      __int16 v28 = 1024;
      LODWORD(v29) = lock_assertionID;
      _os_log_impl(&dword_210809000, v10, OS_LOG_TYPE_INFO, "%p will invalidate power assertion; identifier:%{public}@ id:%d",
        buf,
        0x1Cu);
    }
    goto LABEL_12;
  }
  BSContinuousMachTimeNow();
  double v8 = v7;
  double lock_timeoutTime = self->_lock_timeoutTime;
  os_unfair_lock_unlock(p_lock);
  if (v8 < lock_timeoutTime) {
    goto LABEL_10;
  }
  uint64_t v10 = SWLogPower();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    BOOL v11 = self->_identifier;
    *(_DWORD *)buf = 134218498;
    v25 = self;
    __int16 v26 = 2114;
    int v27 = v11;
    __int16 v28 = 1024;
    LODWORD(v29) = lock_assertionID;
    _os_log_debug_impl(&dword_210809000, v10, OS_LOG_TYPE_DEBUG, "%p power assertion timed out; identifier:%{public}@ id:%d",
      buf,
      0x1Cu);
  }
LABEL_12:

  double v12 = +[SWPreventSystemSleepAssertion sharedHighPriorityQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SWPreventSystemSleepAssertion_invalidate__block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  unsigned int v23 = lock_assertionID;
  dispatch_async(v12, block);
LABEL_13:
}

uint64_t __43__SWPreventSystemSleepAssertion_invalidate__block_invoke(uint64_t a1)
{
  return IOPMAssertionRelease(*(_DWORD *)(a1 + 32));
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_state = self->_lock_state;
  if (lock_state != 3)
  {
    CFDictionaryRef v6 = [NSString stringWithFormat:@"SWPreventSystemSleepAssertion:%p id:%@ state:%u dealloced before invalidation", self, self->_identifier, lock_state];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      double v8 = (objc_class *)objc_opt_class();
      objc_super v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      v18 = @"SWPreventSystemSleepAssertion.m";
      __int16 v19 = 1024;
      int v20 = 188;
      __int16 v21 = 2114;
      __int16 v22 = v6;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x210815FD8);
  }
  os_unfair_lock_unlock(p_lock);
  v10.receiver = self;
  v10.super_class = (Class)SWPreventSystemSleepAssertion;
  [(SWPreventSystemSleepAssertion *)&v10 dealloc];
}

- (void).cxx_destruct
{
}

@end