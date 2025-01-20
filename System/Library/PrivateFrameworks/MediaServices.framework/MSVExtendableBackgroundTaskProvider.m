@interface MSVExtendableBackgroundTaskProvider
- (BOOL)_locked_acquireAssertion:(id)a3;
- (BOOL)_locked_needsAssertion;
- (MSVExtendableBackgroundTaskProvider)initWithRunningRBSDomain:(id)a3 name:(id)a4 invalidationDuration:(double)a5;
- (int64_t)_locked_taskCount;
- (unint64_t)beginTaskWithExpirationHandler:(id)a3;
- (unint64_t)beginTaskWithName:(id)a3 expirationHandler:(id)a4;
- (void)_assertionInvalidated:(id)a3 error:(id)a4;
- (void)_locked_releaseAssertion;
- (void)_locked_removeAllTasksWithError:(id)a3;
- (void)_taskDidTimeout:(unint64_t)a3;
- (void)endTask:(unint64_t)a3;
@end

@implementation MSVExtendableBackgroundTaskProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutGuards, 0);
  objc_storeStrong((id *)&self->_expirationHandlers, 0);
  objc_storeStrong((id *)&self->_explanationForExtension, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)_locked_releaseAssertion
{
  if (self->_assertion)
  {
    uint32_t v3 = arc4random();
    self->_assertionInvalidationNonce = v3;
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    v5 = dispatch_get_global_queue(9, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__MSVExtendableBackgroundTaskProvider__locked_releaseAssertion__block_invoke;
    v6[3] = &unk_1E5AD99F0;
    v6[4] = self;
    uint32_t v7 = v3;
    dispatch_after(v4, v5, v6);
  }
}

uint64_t __63__MSVExtendableBackgroundTaskProvider__locked_releaseAssertion__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  v2 = *(_DWORD **)(a1 + 32);
  if (*(_DWORD *)(a1 + 40) == v2[14])
  {
    uint64_t v3 = objc_msgSend(v2, "_locked_taskCount");
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v3)
    {
      if (*(void *)(v4 + 40))
      {
        [*(id *)(v4 + 40) invalidate];
        v5 = os_log_create("com.apple.amp.MediaServices", "Default");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          uint64_t v7 = *(void *)(v6 + 40);
          int v11 = 134218240;
          uint64_t v12 = v6;
          __int16 v13 = 2048;
          uint64_t v14 = v7;
          _os_log_impl(&dword_1A30CD000, v5, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Invalidated RBSAssertion %p", (uint8_t *)&v11, 0x16u);
        }

        uint64_t v8 = *(void *)(a1 + 32);
        v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = 0;
      }
    }
  }
  return os_unfair_recursive_lock_unlock();
}

- (BOOL)_locked_acquireAssertion:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MSVExtendableBackgroundTaskProvider *)self _locked_needsAssertion])
  {
    v5 = [MEMORY[0x1E4F96478] currentProcess];
    uint64_t v6 = [MEMORY[0x1E4F96358] attributeWithDomain:self->_domain name:self->_name];
    v35[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:v4 target:v5 attributes:v7];
    objc_initWeak(&location, self);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__1728;
    v24 = __Block_byref_object_dispose__1729;
    id v25 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__MSVExtendableBackgroundTaskProvider__locked_acquireAssertion___block_invoke;
    v18[3] = &unk_1E5AD99C8;
    objc_copyWeak(&v19, &location);
    v18[4] = &v20;
    [v8 acquireWithInvalidationHandler:v18];
    if (!v21[5])
    {
      v9 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        v28 = self;
        __int16 v29 = 2048;
        v30 = v8;
        __int16 v31 = 2114;
        v32 = v7;
        __int16 v33 = 2114;
        id v34 = v4;
        _os_log_impl(&dword_1A30CD000, v9, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Took RBSAssertion %p %{public}@ [%{public}@]", buf, 0x2Au);
      }

      v10 = self->_assertion;
      objc_storeStrong((id *)&self->_assertion, v8);
      int v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSince1970];
      self->_assertionCreatedTime = v12;

      if (v10) {
        [(RBSAssertion *)v10 invalidate];
      }
    }
    if (!self->_assertion) {
      [(MSVExtendableBackgroundTaskProvider *)self _locked_removeAllTasksWithError:v21[5]];
    }
    explanationForExtension = self->_explanationForExtension;
    self->_explanationForExtension = 0;

    objc_destroyWeak(&v19);
    _Block_object_dispose(&v20, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v14 = [v4 stringByAppendingString:@" (extension)"];
    uint64_t v15 = self->_explanationForExtension;
    self->_explanationForExtension = v14;
  }
  BOOL v16 = self->_assertion != 0;

  return v16;
}

void __64__MSVExtendableBackgroundTaskProvider__locked_acquireAssertion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _assertionInvalidated:v6 error:v5];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (void)_locked_removeAllTasksWithError:(id)a3
{
  id v4 = a3;
  timeoutGuards = self->_timeoutGuards;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __71__MSVExtendableBackgroundTaskProvider__locked_removeAllTasksWithError___block_invoke;
  v10 = &unk_1E5AD99A0;
  int v11 = self;
  id v12 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)timeoutGuards enumerateKeysAndObjectsUsingBlock:&v7];
  [(NSMutableDictionary *)self->_timeoutGuards removeAllObjects];
  [(NSMutableDictionary *)self->_expirationHandlers removeAllObjects];
}

void __71__MSVExtendableBackgroundTaskProvider__locked_removeAllTasksWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 disarm])
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:v5];
    if (v6)
    {
      uint64_t v7 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = [v5 integerValue];
        uint64_t v10 = *(void *)(a1 + 40);
        int v11 = 134218498;
        uint64_t v12 = v8;
        __int16 v13 = 2048;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Task #%ld ended [%{public}@]", (uint8_t *)&v11, 0x20u);
      }

      v6[2](v6);
    }
  }
}

- (BOOL)_locked_needsAssertion
{
  assertion = self->_assertion;
  if (!assertion || ![(RBSAssertion *)assertion isValid]) {
    return 1;
  }
  double v4 = self->_assertionCreatedTime + self->_invalidationDuration;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSince1970];
  double v7 = v4 - v6;

  return v7 < 5.0;
}

- (int64_t)_locked_taskCount
{
  return [(NSMutableDictionary *)self->_timeoutGuards count];
}

- (void)_assertionInvalidated:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v6 = (RBSAssertion *)a3;
  id v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v8 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218498;
    uint64_t v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1A30CD000, v8, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p RBSAssertion %p invalidated with error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  if (self->_assertion == v6)
  {
    self->_assertion = 0;

    if ([(MSVExtendableBackgroundTaskProvider *)self _locked_taskCount] >= 1
      && (!self->_explanationForExtension
       || !-[MSVExtendableBackgroundTaskProvider _locked_acquireAssertion:](self, "_locked_acquireAssertion:")))
    {
      [(MSVExtendableBackgroundTaskProvider *)self _locked_removeAllTasksWithError:v7];
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (void)_taskDidTimeout:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  expirationHandlers = self->_expirationHandlers;
  double v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v7 = [(NSMutableDictionary *)expirationHandlers objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218240;
      uint64_t v10 = self;
      __int16 v11 = 2048;
      unint64_t v12 = a3;
      _os_log_impl(&dword_1A30CD000, v8, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Task #%ld expired", (uint8_t *)&v9, 0x16u);
    }

    v7[2](v7);
  }
  os_unfair_recursive_lock_unlock();
}

- (void)endTask:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  timeoutGuards = self->_timeoutGuards;
  double v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v7 = [(NSMutableDictionary *)timeoutGuards objectForKeyedSubscript:v6];

  if (v7)
  {
    [v7 disarm];
    uint64_t v8 = self->_timeoutGuards;
    int v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 setObject:0 forKeyedSubscript:v9];

    expirationHandlers = self->_expirationHandlers;
    __int16 v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)expirationHandlers setObject:0 forKeyedSubscript:v11];

    unint64_t v12 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218240;
      id v14 = self;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl(&dword_1A30CD000, v12, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Task #%ld ended", (uint8_t *)&v13, 0x16u);
    }

    if (![(MSVExtendableBackgroundTaskProvider *)self _locked_taskCount]) {
      [(MSVExtendableBackgroundTaskProvider *)self _locked_releaseAssertion];
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (unint64_t)beginTaskWithExpirationHandler:(id)a3
{
  return [(MSVExtendableBackgroundTaskProvider *)self beginTaskWithName:0 expirationHandler:a3];
}

- (unint64_t)beginTaskWithName:(id)a3 expirationHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v8 = (void *)(self->_lastIdentifier + 1);
  self->_lastIdentifier = (unint64_t)v8;
  if (!v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"BackgroundTask#%ld", v8);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(MSVExtendableBackgroundTaskProvider *)self _locked_acquireAssertion:v6])
  {
    objc_initWeak(&location, self);
    int v9 = [MSVBlockGuard alloc];
    double invalidationDuration = self->_invalidationDuration;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__MSVExtendableBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke;
    v19[3] = &unk_1E5AD9978;
    objc_copyWeak(v20, &location);
    v20[1] = v8;
    __int16 v11 = [(MSVBlockGuard *)v9 initWithTimeout:v19 interruptionHandler:invalidationDuration];
    unint64_t v12 = (void *)MEMORY[0x1A62426F0](v7);
    expirationHandlers = self->_expirationHandlers;
    id v14 = [NSNumber numberWithUnsignedInteger:v8];
    [(NSMutableDictionary *)expirationHandlers setObject:v12 forKeyedSubscript:v14];

    timeoutGuards = self->_timeoutGuards;
    unint64_t v16 = [NSNumber numberWithUnsignedInteger:v8];
    [(NSMutableDictionary *)timeoutGuards setObject:v11 forKeyedSubscript:v16];

    uint64_t v17 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v23 = self;
      __int16 v24 = 2048;
      id v25 = v8;
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_1A30CD000, v17, OS_LOG_TYPE_DEFAULT, "MSVExtendableBackgroundTaskProvider %p Task #%ld started [%{public}@]", buf, 0x20u);
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v8 = 0;
  }
  os_unfair_recursive_lock_unlock();

  return (unint64_t)v8;
}

void __75__MSVExtendableBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke(uint64_t a1, uint64_t a2)
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

- (MSVExtendableBackgroundTaskProvider)initWithRunningRBSDomain:(id)a3 name:(id)a4 invalidationDuration:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MSVExtendableBackgroundTaskProvider;
  __int16 v11 = [(MSVExtendableBackgroundTaskProvider *)&v18 init];
  unint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_domain, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_double invalidationDuration = a5;
    v12->_lock = 0;
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    timeoutGuards = v12->_timeoutGuards;
    v12->_timeoutGuards = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    expirationHandlers = v12->_expirationHandlers;
    v12->_expirationHandlers = (NSMutableDictionary *)v15;
  }
  return v12;
}

@end