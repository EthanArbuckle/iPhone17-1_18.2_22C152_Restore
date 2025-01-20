@interface STKIncomingCallUIStateMonitor
+ (STKIncomingCallUIStateMonitor)sharedInstance;
- (BOOL)isShowingIncomingCallUI;
- (STKIncomingCallUIStateMonitor)init;
- (double)_fallbackTimerDuration;
- (void)_refreshState;
- (void)_setIncomingCallUIState:(BOOL)a3 forReason:(id)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setIsShowingIncomingCallUI:(BOOL)a3;
@end

@implementation STKIncomingCallUIStateMonitor

+ (STKIncomingCallUIStateMonitor)sharedInstance
{
  if (sharedInstance___once_0 != -1) {
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance___instance_0;

  return (STKIncomingCallUIStateMonitor *)v2;
}

uint64_t __47__STKIncomingCallUIStateMonitor_sharedInstance__block_invoke()
{
  sharedInstance___instance_0 = objc_alloc_init(STKIncomingCallUIStateMonitor);

  return MEMORY[0x270F9A758]();
}

- (STKIncomingCallUIStateMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)STKIncomingCallUIStateMonitor;
  v2 = [(STKIncomingCallUIStateMonitor *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_observersLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    v4 = dispatch_get_global_queue(33, 0);
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __37__STKIncomingCallUIStateMonitor_init__block_invoke;
    v9 = &unk_2645F4678;
    objc_copyWeak(&v10, &location);
    notify_register_dispatch("MPInCallAlertStateChangeNotification", &v3->_inCallAlertVisibleNotifyToken, v4, &v6);

    [(STKIncomingCallUIStateMonitor *)v3 _refreshState];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __37__STKIncomingCallUIStateMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshState];
}

- (BOOL)isShowingIncomingCallUI
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_showingIncomingCallUI;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    observersLock_observers = self->_observersLock_observers;
    if (!observersLock_observers)
    {
      uint64_t v6 = [MEMORY[0x263F088B0] hashTableWithWeakObjects];
      uint64_t v7 = self->_observersLock_observers;
      self->_observersLock_observers = v6;

      observersLock_observers = self->_observersLock_observers;
    }
    [(NSHashTable *)observersLock_observers addObject:v8];
    os_unfair_lock_unlock(&self->_observersLock);
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observersLock_observers removeObject:v5];

    if (![(NSHashTable *)self->_observersLock_observers count])
    {
      observersLock_observers = self->_observersLock_observers;
      self->_observersLock_observers = 0;
    }
    os_unfair_lock_unlock(p_observersLock);
  }
}

- (double)_fallbackTimerDuration
{
  return 300.0;
}

- (void)_refreshState
{
  uint64_t state64 = 0;
  notify_get_state(self->_inCallAlertVisibleNotifyToken, &state64);
  [(STKIncomingCallUIStateMonitor *)self _setIncomingCallUIState:state64 != 0 forReason:@"Refresh"];
}

- (void)_setIncomingCallUIState:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_lock(&self->_observersLock);
  if (self->_lock_showingIncomingCallUI == v4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    self->_lock_showingIncomingCallUI = v4;
    [(BSTimer *)self->_fallbackTimer cancel];
    fallbackTimer = self->_fallbackTimer;
    self->_fallbackTimer = 0;

    uint64_t v7 = (void *)[(NSHashTable *)self->_observersLock_observers copy];
    v9 = STKCommonLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      BOOL v28 = v4;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_221DC0000, v9, OS_LOG_TYPE_DEFAULT, "Incoming call UI state changed to: %d for reason: %{public}@", buf, 0x12u);
    }

    if (v4)
    {
      id v10 = (void *)MEMORY[0x263F29CF0];
      [(STKIncomingCallUIStateMonitor *)self _fallbackTimerDuration];
      double v12 = v11;
      v13 = dispatch_get_global_queue(33, 0);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __67__STKIncomingCallUIStateMonitor__setIncomingCallUIState_forReason___block_invoke;
      v25[3] = &unk_2645F4458;
      v25[4] = self;
      v14 = [v10 scheduledTimerWithFireInterval:v13 queue:v25 handler:v12];
      v15 = self->_fallbackTimer;
      self->_fallbackTimer = v14;
    }
  }
  os_unfair_lock_unlock(&self->_observersLock);
  os_unfair_lock_unlock(&self->_lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "incomingCallUIStateDidChange:", v4, (void)v21);
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v18);
  }
}

uint64_t __67__STKIncomingCallUIStateMonitor__setIncomingCallUIState_forReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setIncomingCallUIState:0 forReason:@"Timeout - falling back to NO"];
}

- (void)setIsShowingIncomingCallUI:(BOOL)a3
{
  self->_isShowingIncomingCallUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTimer, 0);

  objc_storeStrong((id *)&self->_observersLock_observers, 0);
}

@end