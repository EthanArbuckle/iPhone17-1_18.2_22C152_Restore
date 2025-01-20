@interface STKDeviceLockMonitor
+ (id)sharedInstance;
- (BOOL)isDeviceLocked;
- (STKDeviceLockMonitor)init;
- (void)_updateDeviceLockState;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)init;
- (void)removeObserver:(id)a3;
- (void)setIsDeviceLocked:(BOOL)a3;
@end

@implementation STKDeviceLockMonitor

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

uint64_t __38__STKDeviceLockMonitor_sharedInstance__block_invoke()
{
  sharedInstance___instance = objc_alloc_init(STKDeviceLockMonitor);

  return MEMORY[0x270F9A758]();
}

- (STKDeviceLockMonitor)init
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)STKDeviceLockMonitor;
  v2 = [(STKDeviceLockMonitor *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_stateLock._os_unfair_lock_opaque = 0;
    v2->_observersLock._os_unfair_lock_opaque = 0;
    v2->_notify_token = -1;
    p_notify_token = &v2->_notify_token;
    objc_initWeak(&location, v2);
    v5 = dispatch_get_global_queue(33, 0);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __28__STKDeviceLockMonitor_init__block_invoke;
    v14 = &unk_2645F4678;
    objc_copyWeak(&v15, &location);
    uint32_t v6 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v3->_notify_token, v5, &v11);

    v7 = STKCommonLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *p_notify_token;
      *(_DWORD *)buf = 67109120;
      int v19 = v8;
      _os_log_impl(&dword_221DC0000, v7, OS_LOG_TYPE_DEFAULT, "Received token: %d for lock status update", buf, 8u);
    }

    if (v6)
    {
      v9 = STKCommonLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(STKDeviceLockMonitor *)v6 init];
      }
    }
    [(STKDeviceLockMonitor *)v3 _updateDeviceLockState];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __28__STKDeviceLockMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDeviceLockState];
}

- (void)dealloc
{
  int notify_token = self->_notify_token;
  if (notify_token != -1)
  {
    notify_cancel(notify_token);
    self->_int notify_token = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)STKDeviceLockMonitor;
  [(STKDeviceLockMonitor *)&v4 dealloc];
}

- (BOOL)isDeviceLocked
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_deviceLocked;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    observersList = self->_observersList;
    if (!observersList)
    {
      uint32_t v6 = [MEMORY[0x263F088B0] hashTableWithWeakObjects];
      v7 = self->_observersList;
      self->_observersList = v6;

      observersList = self->_observersList;
    }
    [(NSHashTable *)observersList addObject:v8];
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
    [(NSHashTable *)self->_observersList removeObject:v5];

    if (![(NSHashTable *)self->_observersList count])
    {
      observersList = self->_observersList;
      self->_observersList = 0;
    }
    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)_updateDeviceLockState
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  BOOL v5 = +[STKUtil isDeviceLocked];
  BOOL v6 = v5;
  if (self->_deviceLocked == v5)
  {
    v7 = 0;
  }
  else
  {
    self->_deviceLocked = v5;
    v7 = (void *)[(NSHashTable *)self->_observersList copy];
    id v8 = STKCommonLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "unlocked";
      if (v6) {
        v9 = "locked";
      }
      *(_DWORD *)buf = 136315138;
      v21 = v9;
      _os_log_impl(&dword_221DC0000, v8, OS_LOG_TYPE_DEFAULT, "Device is %s", buf, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_observersLock);
  os_unfair_lock_unlock(p_stateLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "deviceLockStateChanged:", v6, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_221DC0000, a2, OS_LOG_TYPE_ERROR, "Could not register for lock state notification: %d", (uint8_t *)v2, 8u);
}

@end