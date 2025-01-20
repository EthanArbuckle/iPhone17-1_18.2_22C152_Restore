@interface MSVSonicBackgroundTaskProvider
- (MSVSonicBackgroundTaskProvider)initWithInvalidationDuration:(double)a3;
- (unint64_t)beginTaskWithExpirationHandler:(id)a3;
- (unint64_t)beginTaskWithName:(id)a3 expirationHandler:(id)a4;
- (void)_taskDidTimeout:(unint64_t)a3;
- (void)endTask:(unint64_t)a3;
@end

@implementation MSVSonicBackgroundTaskProvider

- (unint64_t)beginTaskWithName:(id)a3 expirationHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  os_unfair_recursive_lock_lock_with_options();
  v7 = (void *)(self->_lastIdentifier + 1);
  self->_lastIdentifier = (unint64_t)v7;
  if (!v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"BackgroundTask#%ld", v7);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = [[MSVSonicAssertion alloc] initWithName:v6];
  if (v8)
  {
    objc_initWeak(&location, self);
    v9 = [MSVBlockGuard alloc];
    double invalidationDuration = self->_invalidationDuration;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__MSVSonicBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke;
    v25[3] = &unk_1E5AD9978;
    objc_copyWeak(v26, &location);
    v26[1] = v7;
    v11 = [(MSVBlockGuard *)v9 initWithTimeout:v25 interruptionHandler:invalidationDuration];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__MSVSonicBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke_2;
    v23[3] = &unk_1E5AD96E8;
    objc_copyWeak(v24, &location);
    v24[1] = v7;
    [(MSVSonicAssertion *)v8 setInvalidationHandler:v23];
    v12 = (void *)MEMORY[0x1A62426F0](v22);
    expirationHandlers = self->_expirationHandlers;
    v14 = [NSNumber numberWithUnsignedInteger:v7];
    [(NSMutableDictionary *)expirationHandlers setObject:v12 forKeyedSubscript:v14];

    timeoutGuards = self->_timeoutGuards;
    v16 = [NSNumber numberWithUnsignedInteger:v7];
    [(NSMutableDictionary *)timeoutGuards setObject:v11 forKeyedSubscript:v16];

    assertions = self->_assertions;
    v18 = [NSNumber numberWithUnsignedInteger:v7];
    [(NSMutableDictionary *)assertions setObject:v8 forKeyedSubscript:v18];

    v19 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v29 = self;
      __int16 v30 = 2048;
      v31 = v7;
      __int16 v32 = 2114;
      id v33 = v6;
      _os_log_impl(&dword_1A30CD000, v19, OS_LOG_TYPE_DEFAULT, "MSVSonicBackgroundTaskProvider %p Task #%ld [%{public}@] started", buf, 0x20u);
    }

    objc_destroyWeak(v24);
    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
  else
  {
    v20 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v29 = self;
      __int16 v30 = 2048;
      v31 = v7;
      __int16 v32 = 2114;
      id v33 = v6;
      _os_log_impl(&dword_1A30CD000, v20, OS_LOG_TYPE_DEFAULT, "MSVSonicBackgroundTaskProvider %p Task #%ld [%{public}@] failed to start", buf, 0x20u);
    }

    v7 = 0;
  }
  os_unfair_recursive_lock_unlock();

  return (unint64_t)v7;
}

- (MSVSonicBackgroundTaskProvider)initWithInvalidationDuration:(double)a3
{
  if (+[MSVSonicAssertion hasEntitlement])
  {
    v15.receiver = self;
    v15.super_class = (Class)MSVSonicBackgroundTaskProvider;
    v5 = [(MSVSonicBackgroundTaskProvider *)&v15 init];
    id v6 = v5;
    if (v5)
    {
      v5->_double invalidationDuration = a3;
      v5->_lock = 0;
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
      timeoutGuards = v6->_timeoutGuards;
      v6->_timeoutGuards = (NSMutableDictionary *)v7;

      uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
      expirationHandlers = v6->_expirationHandlers;
      v6->_expirationHandlers = (NSMutableDictionary *)v9;

      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      assertions = v6->_assertions;
      v6->_assertions = (NSMutableDictionary *)v11;
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_timeoutGuards, 0);
  objc_storeStrong((id *)&self->_expirationHandlers, 0);
}

- (void)_taskDidTimeout:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  expirationHandlers = self->_expirationHandlers;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)expirationHandlers objectForKeyedSubscript:v6];

  assertions = self->_assertions;
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
  v10 = [(NSMutableDictionary *)assertions objectForKeyedSubscript:v9];

  if (v7)
  {
    uint64_t v11 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v10 name];
      int v13 = 134218498;
      v14 = self;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      __int16 v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1A30CD000, v11, OS_LOG_TYPE_DEFAULT, "MSVSonicBackgroundTaskProvider %p Task #%ld [%{public}@] expired", (uint8_t *)&v13, 0x20u);
    }
    v7[2](v7);
  }
  os_unfair_recursive_lock_unlock();
}

- (void)endTask:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  timeoutGuards = self->_timeoutGuards;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)timeoutGuards objectForKeyedSubscript:v6];

  if (v7)
  {
    [v7 disarm];
    assertions = self->_assertions;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    v10 = [(NSMutableDictionary *)assertions objectForKeyedSubscript:v9];

    uint64_t v11 = self->_timeoutGuards;
    v12 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v11 setObject:0 forKeyedSubscript:v12];

    expirationHandlers = self->_expirationHandlers;
    v14 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)expirationHandlers setObject:0 forKeyedSubscript:v14];

    __int16 v15 = self->_assertions;
    unint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v15 setObject:0 forKeyedSubscript:v16];

    __int16 v17 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v10 name];
      int v19 = 134218498;
      v20 = self;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      __int16 v23 = 2114;
      v24 = v18;
      _os_log_impl(&dword_1A30CD000, v17, OS_LOG_TYPE_DEFAULT, "MSVSonicBackgroundTaskProvider %p Task #%ld [%{public}@] ended", (uint8_t *)&v19, 0x20u);
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (unint64_t)beginTaskWithExpirationHandler:(id)a3
{
  return [(MSVSonicBackgroundTaskProvider *)self beginTaskWithName:0 expirationHandler:a3];
}

void __70__MSVSonicBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (!a2)
  {
    [WeakRetained _taskDidTimeout:*(void *)(a1 + 40)];
    id WeakRetained = v5;
  }
  [WeakRetained endTask:*(void *)(a1 + 40)];
}

void __70__MSVSonicBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _taskDidTimeout:*(void *)(a1 + 40)];
  [WeakRetained endTask:*(void *)(a1 + 40)];
}

@end