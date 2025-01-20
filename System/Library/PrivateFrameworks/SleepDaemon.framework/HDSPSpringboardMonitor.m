@interface HDSPSpringboardMonitor
- (BOOL)_checkSpringBoardStarted;
- (BOOL)isAppleWatch;
- (BOOL)isSpringboardStarted;
- (BOOL)springboardStarted;
- (HDSPSpringboardMonitor)initWithCallbackScheduler:(id)a3 isAppleWatch:(BOOL)a4;
- (HKSPObserverSet)observers;
- (id)_processName;
- (int)notifyToken;
- (os_unfair_lock_s)springboardStartedLock;
- (void)_checkAndNotify;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation HDSPSpringboardMonitor

- (HDSPSpringboardMonitor)initWithCallbackScheduler:(id)a3 isAppleWatch:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDSPSpringboardMonitor;
  v7 = [(HDSPSpringboardMonitor *)&v15 init];
  if (v7)
  {
    v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      __int16 v18 = 2048;
      v19 = v7;
      id v10 = v9;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    v7[8] = a4;
    *(void *)(v7 + 12) = 0xFFFFFFFFLL;
    v7[9] = [v7 _checkSpringBoardStarted];
    uint64_t v11 = [objc_alloc(MEMORY[0x263F75E20]) initWithCallbackScheduler:v6];
    v12 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v11;

    v13 = v7;
  }

  return (HDSPSpringboardMonitor *)v7;
}

- (void)_withLock:(id)a3
{
  p_springboardStartedLock = &self->_springboardStartedLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_springboardStartedLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_springboardStartedLock);
}

- (BOOL)isSpringboardStarted
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSpringboardMonitor_isSpringboardStarted__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPSpringboardMonitor *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __46__HDSPSpringboardMonitor_isSpringboardStarted__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

- (BOOL)_checkSpringBoardStarted
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (HKSPIsHomePod())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int out_token = -1;
    notify_register_check("com.apple.springboard.finishedstartup", &out_token);
    if (out_token == -1)
    {
      BOOL v3 = 0;
    }
    else
    {
      *(void *)state64 = 0;
      notify_get_state(out_token, (uint64_t *)state64);
      BOOL v3 = *(void *)state64 != 0;
    }
    v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = v5;
      uint64_t v7 = [(HDSPSpringboardMonitor *)self _processName];
      *(_DWORD *)state64 = 138543874;
      *(void *)&state64[4] = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 1024;
      BOOL v14 = v3;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ started = %d", state64, 0x1Cu);
    }
  }
  return v3;
}

- (id)_processName
{
  if (self->_isAppleWatch) {
    return @"Carousel";
  }
  else {
    return @"Springboard";
  }
}

- (void)dealloc
{
  [(HDSPSpringboardMonitor *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)HDSPSpringboardMonitor;
  [(HDSPSpringboardMonitor *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    char v4 = 0;
    [(HKSPObserverSet *)self->_observers addObserver:a3 wasFirst:&v4];
    if (v4) {
      [(HDSPSpringboardMonitor *)self _startMonitoring];
    }
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    char v4 = 0;
    [(HKSPObserverSet *)self->_observers removeObserver:a3 wasLast:&v4];
    if (v4) {
      [(HDSPSpringboardMonitor *)self _stopMonitoring];
    }
  }
}

- (void)_startMonitoring
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_notifyToken == -1)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __42__HDSPSpringboardMonitor__startMonitoring__block_invoke;
    handler[3] = &unk_2645DB218;
    handler[4] = self;
    notify_register_dispatch("com.apple.springboard.finishedstartup", &self->_notifyToken, MEMORY[0x263EF83A0], handler);
    objc_super v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = objc_opt_class();
      id v5 = v8;
      id v6 = [(HDSPSpringboardMonitor *)self _processName];
      *(_DWORD *)buf = 138543618;
      __int16 v11 = v8;
      __int16 v12 = 2114;
      __int16 v13 = v6;
      uint64_t v7 = "[%{public}@] Start monitoring %{public}@ start";
      goto LABEL_6;
    }
  }
  else
  {
    objc_super v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = objc_opt_class();
      id v5 = v4;
      id v6 = [(HDSPSpringboardMonitor *)self _processName];
      *(_DWORD *)buf = 138543618;
      __int16 v11 = v4;
      __int16 v12 = 2114;
      __int16 v13 = v6;
      uint64_t v7 = "[%{public}@] Alreay monitoring %{public}@";
LABEL_6:
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);
    }
  }

  [(HDSPSpringboardMonitor *)self _checkAndNotify];
}

uint64_t __42__HDSPSpringboardMonitor__startMonitoring__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkAndNotify];
}

- (void)_checkAndNotify
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__HDSPSpringboardMonitor__checkAndNotify__block_invoke;
  v3[3] = &unk_2645D90E8;
  v3[4] = self;
  v3[5] = &v4;
  [(HDSPSpringboardMonitor *)self _withLock:v3];
  if (*((unsigned char *)v5 + 24)) {
    [(HKSPObserverSet *)self->_observers enumerateObserversWithBlock:&__block_literal_global_31];
  }
  _Block_object_dispose(&v4, 8);
}

unsigned char *__41__HDSPSpringboardMonitor__checkAndNotify__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[9])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    result = (unsigned char *)[result _checkSpringBoardStarted];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

uint64_t __41__HDSPSpringboardMonitor__checkAndNotify__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 springboardDidStart];
}

- (void)_stopMonitoring
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
    uint64_t v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      id v6 = v5;
      char v7 = [(HDSPSpringboardMonitor *)self _processName];
      int v8 = 138543618;
      v9 = v5;
      __int16 v10 = 2114;
      __int16 v11 = v7;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stop monitoring %{public}@ start", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)isAppleWatch
{
  return self->_isAppleWatch;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (BOOL)springboardStarted
{
  return self->_springboardStarted;
}

- (os_unfair_lock_s)springboardStartedLock
{
  return self->_springboardStartedLock;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end