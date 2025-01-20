@interface MTSensitiveUIMonitor
+ (id)sharedMonitor;
- (BOOL)_hideSensitiveUI;
- (BOOL)_isVendorRelease;
- (BOOL)hideSensitiveUI;
- (BOOL)needPrefsUpdate;
- (BOOL)shouldHideForSensitivity:(int64_t)a3;
- (MTObserverStore)observers;
- (MTSensitiveUIMonitor)init;
- (int)notifyToken;
- (os_unfair_lock_s)lock;
- (void)_handleNotification;
- (void)_withLock:(id)a3;
- (void)addSensitiveUIObserver:(id)a3;
- (void)dealloc;
- (void)removeSensitiveUIObserver:(id)a3;
- (void)setHideSensitiveUI:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setNeedPrefsUpdate:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
- (void)setObservers:(id)a3;
@end

@implementation MTSensitiveUIMonitor

+ (id)sharedMonitor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MTSensitiveUIMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_onceToken != -1) {
    dispatch_once(&sharedMonitor_onceToken, block);
  }
  v2 = (void *)sharedMonitor_monitor;
  return v2;
}

uint64_t __37__MTSensitiveUIMonitor_sharedMonitor__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedMonitor_monitor;
  sharedMonitor_monitor = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (BOOL)_isVendorRelease
{
  if (_isVendorRelease_onceToken != -1) {
    dispatch_once(&_isVendorRelease_onceToken, &__block_literal_global_25);
  }
  return _isVendorRelease___isVendorRelease;
}

void __40__MTSensitiveUIMonitor__isVendorRelease__block_invoke()
{
  id v0 = (id)MGGetStringAnswer();
  _isVendorRelease___isVendorRelease = [@"Vendor" isEqualToString:v0];
}

- (MTSensitiveUIMonitor)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)MTSensitiveUIMonitor;
  uint64_t v2 = [(MTSensitiveUIMonitor *)&v7 init];
  if (v2)
  {
    v3 = MTLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v2;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    uint64_t v4 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (MTObserverStore *)v4;

    v2->_needPrefsUpdate = 1;
    [(MTSensitiveUIMonitor *)v2 registerForNotifications];
  }
  return v2;
}

- (void)dealloc
{
  [(MTSensitiveUIMonitor *)self unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MTSensitiveUIMonitor;
  [(MTSensitiveUIMonitor *)&v3 dealloc];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_handleNotification
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = MTLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ sensitiveUIStateChanged", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__MTSensitiveUIMonitor__handleNotification__block_invoke;
  v4[3] = &unk_1E59150A8;
  v4[4] = self;
  [(MTSensitiveUIMonitor *)self _withLock:v4];
  [(MTObserverStore *)self->_observers enumerateObserversWithBlock:&__block_literal_global_9_3];
}

uint64_t __43__MTSensitiveUIMonitor__handleNotification__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = 1;
  return result;
}

void __43__MTSensitiveUIMonitor__handleNotification__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 sensitiveUIStateChanged];
  }
}

- (BOOL)_hideSensitiveUI
{
  if ([(MTSensitiveUIMonitor *)self _isVendorRelease]) {
    return 1;
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MTSensitiveUIMonitor__hideSensitiveUI__block_invoke;
  v5[3] = &unk_1E5915B40;
  v5[4] = self;
  v5[5] = &v6;
  [(MTSensitiveUIMonitor *)self _withLock:v5];
  BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MTSensitiveUIMonitor__hideSensitiveUI__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 9))
  {
    *(unsigned char *)(v1 + 8) = 0;
    *(unsigned char *)(*(void *)(result + 32) + 9) = 0;
    uint64_t v1 = *(void *)(result + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(v1 + 8);
  return result;
}

- (void)addSensitiveUIObserver:(id)a3
{
}

- (void)removeSensitiveUIObserver:(id)a3
{
}

- (BOOL)shouldHideForSensitivity:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0 && [(MTSensitiveUIMonitor *)self _hideSensitiveUI];
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (BOOL)hideSensitiveUI
{
  return self->_hideSensitiveUI;
}

- (void)setHideSensitiveUI:(BOOL)a3
{
  self->_hideSensitiveUI = a3;
}

- (BOOL)needPrefsUpdate
{
  return self->_needPrefsUpdate;
}

- (void)setNeedPrefsUpdate:(BOOL)a3
{
  self->_needPrefsUpdate = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end