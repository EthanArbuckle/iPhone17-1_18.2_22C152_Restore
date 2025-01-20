@interface MSVBackgroundTaskProvider
+ (id)sharedProvider;
- (BOOL)_locked_acquireAssertion;
- (MSVBackgroundTaskProvider)init;
- (NSMutableDictionary)timeoutGuards;
- (unint64_t)beginTaskWithExpirationHandler:(id)a3;
- (unint64_t)beginTaskWithName:(id)a3 expirationHandler:(id)a4;
- (unint64_t)lastIdentifier;
- (void)_locked_releaseAssertion;
- (void)endTask:(unint64_t)a3;
- (void)setLastIdentifier:(unint64_t)a3;
- (void)setTimeoutGuards:(id)a3;
@end

@implementation MSVBackgroundTaskProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutGuards, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

- (void)setTimeoutGuards:(id)a3
{
}

- (NSMutableDictionary)timeoutGuards
{
  return self->_timeoutGuards;
}

- (void)setLastIdentifier:(unint64_t)a3
{
  self->_lastIdentifier = a3;
}

- (unint64_t)lastIdentifier
{
  return self->_lastIdentifier;
}

- (void)endTask:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(MSVBackgroundTaskProvider *)self timeoutGuards];
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    [v8 disarm];
    v9 = [(MSVBackgroundTaskProvider *)self timeoutGuards];
    v10 = [NSNumber numberWithUnsignedInteger:a3];
    [v9 setObject:0 forKeyedSubscript:v10];

    [(MSVBackgroundTaskProvider *)self _locked_releaseAssertion];
    v11 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      unint64_t v13 = a3;
      _os_log_impl(&dword_1A30CD000, v11, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Background Task #%ld ended", (uint8_t *)&v12, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)beginTaskWithExpirationHandler:(id)a3
{
  return [(MSVBackgroundTaskProvider *)self beginTaskWithName:0 expirationHandler:a3];
}

- (unint64_t)beginTaskWithName:(id)a3 expirationHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(MSVBackgroundTaskProvider *)self _locked_acquireAssertion])
  {
    unint64_t v9 = [(MSVBackgroundTaskProvider *)self lastIdentifier] + 1;
    [(MSVBackgroundTaskProvider *)self setLastIdentifier:v9];
    if (!v6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"BackgroundTask#%ld", v9);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = [MSVBlockGuard alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__MSVBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke;
    v16[3] = &unk_1E5AD98D8;
    unint64_t v20 = v9;
    id v6 = v6;
    id v17 = v6;
    v18 = self;
    id v19 = v7;
    v11 = [(MSVBlockGuard *)v10 initWithTimeout:v16 interruptionHandler:30.0];
    int v12 = [(MSVBackgroundTaskProvider *)self timeoutGuards];
    unint64_t v13 = [NSNumber numberWithUnsignedInteger:v9];
    [v12 setObject:v11 forKeyedSubscript:v13];

    uint64_t v14 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v22 = v9;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl(&dword_1A30CD000, v14, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Background Task #%ld started (%{public}@)", buf, 0x16u);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

uint64_t __65__MSVBackgroundTaskProvider_beginTaskWithName_expirationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 32);
    int v9 = 134218242;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1A30CD000, v4, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Background Task #%ld expired (%{public}@)", (uint8_t *)&v9, 0x16u);
  }

  if (!a2)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
  return [*(id *)(a1 + 40) endTask:*(void *)(a1 + 56)];
}

- (void)_locked_releaseAssertion
{
  int64_t assertionCount = self->_assertionCount;
  self->_int64_t assertionCount = assertionCount - 1;
  if (assertionCount <= 1)
  {
    self->_int64_t assertionCount = 0;
    uint32_t v4 = arc4random();
    self->_assertionInvalidationNonce = v4;
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    uint64_t v6 = dispatch_get_global_queue(9, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__MSVBackgroundTaskProvider__locked_releaseAssertion__block_invoke;
    v7[3] = &unk_1E5AD99F0;
    v7[4] = self;
    uint32_t v8 = v4;
    dispatch_after(v5, v6, v7);
  }
}

void __53__MSVBackgroundTaskProvider__locked_releaseAssertion__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 40) == *(_DWORD *)(v2 + 32) && *(uint64_t *)(v2 + 24) <= 0 && *(void *)(v2 + 16))
  {
    v3 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Invalidating Process Assertion Timeout", v6, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_time_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
}

- (BOOL)_locked_acquireAssertion
{
  v3 = self->_assertion;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([(BKSProcessAssertion *)v3 valid])
    {
      BKSProcessAssertionBackgroundTimeRemaining();
      if (v5 >= 5.0)
      {
        ++self->_assertionCount;
LABEL_13:
        BOOL v12 = 1;
        goto LABEL_14;
      }
    }
  }
  uint64_t v6 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A30CD000, v6, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Taking Process Assertion", buf, 2u);
  }

  uint64_t v7 = (BKSProcessAssertion *)[objc_alloc(MEMORY[0x1E4F4E280]) initWithPID:getpid() flags:1 reason:4 name:@"MSVBackgroundTaskProvider"];
  assertion = self->_assertion;
  self->_assertion = v7;

  char v9 = [(BKSProcessAssertion *)self->_assertion acquire];
  if (v4)
  {
    uint64_t v10 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1A30CD000, v10, OS_LOG_TYPE_DEFAULT, "[MSVBackgroundTaskProvider] Invalidating Existing Process Assertion", v14, 2u);
    }

    [(BKSProcessAssertion *)v4 invalidate];
  }
  ++self->_assertionCount;
  if (v9) {
    goto LABEL_13;
  }
  __int16 v11 = self->_assertion;
  self->_assertion = 0;
  self->_int64_t assertionCount = 0;

  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (MSVBackgroundTaskProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSVBackgroundTaskProvider;
  uint64_t v2 = [(MSVBackgroundTaskProvider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [(MSVBackgroundTaskProvider *)v3 setTimeoutGuards:v4];
  }
  return v3;
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_1151);
  }
  uint64_t v2 = (void *)sharedProvider_sharedInstance;
  return v2;
}

uint64_t __43__MSVBackgroundTaskProvider_sharedProvider__block_invoke()
{
  sharedProvider_sharedInstance = objc_alloc_init(MSVBackgroundTaskProvider);
  return MEMORY[0x1F41817F8]();
}

@end