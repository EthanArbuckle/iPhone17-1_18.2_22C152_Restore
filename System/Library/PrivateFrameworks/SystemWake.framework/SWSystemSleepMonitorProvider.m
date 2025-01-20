@interface SWSystemSleepMonitorProvider
- (SWSystemSleepMonitorProvider)init;
- (void)allowPowerChange:(int64_t)a3;
- (void)cancelPowerChange:(int64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)registerForSystemPowerOnQueue:(id)a3 withDelegate:(id)a4;
@end

@implementation SWSystemSleepMonitorProvider

- (SWSystemSleepMonitorProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)SWSystemSleepMonitorProvider;
  result = [(SWSystemSleepMonitorProvider *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)registerForSystemPowerOnQueue:(id)a3 withDelegate:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v8 = a3;
  v9 = (SWSystemSleepMonitorProvider *)a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_registered)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_registered"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (SWSystemSleepMonitorProvider *)(id)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      v26 = v18;
      __int16 v27 = 2114;
      v28 = v20;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2114;
      v32 = @"SWSystemSleepMonitor.m";
      __int16 v33 = 1024;
      *(_DWORD *)v34 = 557;
      *(_WORD *)&v34[4] = 2114;
      *(void *)&v34[6] = v17;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080DFE4);
  }
  objc_storeStrong((id *)&self->_lock_queue, a3);
  self->_lock_registered = 1;
  v10 = [MEMORY[0x263F29D18] referenceWithObject:v9];
  lock_weakDelegateWrapper = self->_lock_weakDelegateWrapper;
  self->_lock_weakDelegateWrapper = v10;

  io_connect_t v12 = IORegisterForSystemPower(self->_lock_weakDelegateWrapper, &self->_lock_systemPowerPort, (IOServiceInterestCallback)SWSystemPowerCallback, &self->_lock_systemPowerNotifier);
  self->_lock_systemPowerConnection = v12;
  if (!v12)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_systemPowerConnection != IO_OBJECT_NULL"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (SWSystemSleepMonitorProvider *)(id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138544642;
      v26 = v22;
      __int16 v27 = 2114;
      v28 = v24;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2114;
      v32 = @"SWSystemSleepMonitor.m";
      __int16 v33 = 1024;
      *(_DWORD *)v34 = 567;
      *(_WORD *)&v34[4] = 2114;
      *(void *)&v34[6] = v21;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080E0E4);
  }
  IONotificationPortSetDispatchQueue(self->_lock_systemPowerPort, v8);
  v13 = SWLogPower();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    lock_systemPowerConnection = (__CFString *)self->_lock_systemPowerConnection;
    lock_systemPowerPort = self->_lock_systemPowerPort;
    uint64_t lock_systemPowerNotifier = self->_lock_systemPowerNotifier;
    *(_DWORD *)buf = 134219264;
    v26 = self;
    __int16 v27 = 2048;
    v28 = v8;
    __int16 v29 = 2048;
    v30 = v9;
    __int16 v31 = 2048;
    v32 = lock_systemPowerConnection;
    __int16 v33 = 2048;
    *(void *)v34 = lock_systemPowerPort;
    *(_WORD *)&v34[8] = 2048;
    *(void *)&v34[10] = lock_systemPowerNotifier;
    _os_log_debug_impl(&dword_210809000, v13, OS_LOG_TYPE_DEBUG, "%p registerForSystemPowerOnQueue:%p withDelegate:%p -- connection:%llu port:%llu notifier:%llu", buf, 0x3Eu);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_invalidated"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v16 = v9;
      __int16 v17 = 2114;
      v18 = v11;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2114;
      v22 = @"SWSystemSleepMonitor.m";
      __int16 v23 = 1024;
      int v24 = 583;
      __int16 v25 = 2114;
      v26 = v8;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080E470);
  }
  v5 = self->_lock_weakDelegateWrapper;
  os_unfair_lock_unlock(p_lock);
  lock_queue = self->_lock_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SWSystemSleepMonitorProvider_dealloc__block_invoke;
  block[3] = &unk_264139938;
  v14 = v5;
  v7 = v5;
  dispatch_async(lock_queue, block);

  v12.receiver = self;
  v12.super_class = (Class)SWSystemSleepMonitorProvider;
  [(SWSystemSleepMonitorProvider *)&v12 dealloc];
}

id __39__SWSystemSleepMonitorProvider_dealloc__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) object];
}

- (void)invalidate
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_invalidated = self->_lock_invalidated;
  self->_BOOL lock_invalidated = 1;
  if (!lock_invalidated)
  {
    v5 = SWLogPower();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lock_systemPowerConnection = (void *)self->_lock_systemPowerConnection;
      lock_systemPowerPort = self->_lock_systemPowerPort;
      uint64_t lock_systemPowerNotifier = self->_lock_systemPowerNotifier;
      int v13 = 134218752;
      v14 = self;
      __int16 v15 = 2048;
      id v16 = lock_systemPowerConnection;
      __int16 v17 = 2048;
      v18 = lock_systemPowerPort;
      __int16 v19 = 2048;
      uint64_t v20 = lock_systemPowerNotifier;
      _os_log_debug_impl(&dword_210809000, v5, OS_LOG_TYPE_DEBUG, "%p unregisterForSystemPower -- connection:%llu port:%llu notifier:%llu", (uint8_t *)&v13, 0x2Au);
    }

    IODeregisterForSystemPower(&self->_lock_systemPowerNotifier);
    IONotificationPortDestroy(self->_lock_systemPowerPort);
    IOServiceClose(self->_lock_systemPowerConnection);
    self->_lock_systemPowerConnection = 0;
    v6 = SWLogPower();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

    if (v7)
    {
      v8 = [(BSZeroingWeakReference *)self->_lock_weakDelegateWrapper object];
      id v9 = SWLogPower();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 134218240;
        v14 = self;
        __int16 v15 = 2048;
        id v16 = v8;
        _os_log_debug_impl(&dword_210809000, v9, OS_LOG_TYPE_DEBUG, "%p invalidated sleep monitor: %p", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)allowPowerChange:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    BOOL v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_invalidated"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      v14 = v10;
      __int16 v15 = 2048;
      id v16 = self;
      __int16 v17 = 2114;
      v18 = @"SWSystemSleepMonitor.m";
      __int16 v19 = 1024;
      int v20 = 614;
      __int16 v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080E834);
  }
  IOAllowPowerChange(self->_lock_systemPowerConnection, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)cancelPowerChange:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    BOOL v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_invalidated"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      v14 = v10;
      __int16 v15 = 2048;
      id v16 = self;
      __int16 v17 = 2114;
      v18 = @"SWSystemSleepMonitor.m";
      __int16 v19 = 1024;
      int v20 = 621;
      __int16 v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080E9F8);
  }
  IOCancelPowerChange(self->_lock_systemPowerConnection, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_weakDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_lock_queue, 0);
}

@end