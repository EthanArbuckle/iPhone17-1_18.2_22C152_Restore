@interface HKSPSensitiveUIMonitor
+ (id)sharedMonitor;
- (BOOL)_hideSensitiveUI;
- (BOOL)_isVendorRelease;
- (BOOL)hideSensitiveUI;
- (BOOL)needPrefsUpdate;
- (BOOL)sensitiveUIOverridden;
- (BOOL)shouldHideForSensitivity:(int64_t)a3;
- (HKSPObserverSet)observers;
- (HKSPSensitiveUIMonitor)initWithCallbackScheduler:(id)a3;
- (NPSManager)npsManager;
- (NSUserDefaults)userDefaults;
- (os_unfair_lock_s)lock;
- (void)_handleNotification;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overrideHideSensitiveUI:(BOOL)a3;
- (void)registerForNotifications;
- (void)removeObserver:(id)a3;
- (void)setCurrentSensitiveUIHidden:(BOOL)a3;
- (void)unregisterForNotifications;
@end

@implementation HKSPSensitiveUIMonitor

+ (id)sharedMonitor
{
  if (qword_1EB5385D8 != -1) {
    dispatch_once(&qword_1EB5385D8, &__block_literal_global_10);
  }
  v2 = (void *)qword_1EB5385D0;
  return v2;
}

void __39__HKSPSensitiveUIMonitor_sharedMonitor__block_invoke()
{
  v0 = [HKSPSensitiveUIMonitor alloc];
  id v3 = [MEMORY[0x1E4F7A0F0] hkspMainThreadScheduler];
  uint64_t v1 = [(HKSPSensitiveUIMonitor *)v0 initWithCallbackScheduler:v3];
  v2 = (void *)qword_1EB5385D0;
  qword_1EB5385D0 = v1;
}

- (BOOL)_isVendorRelease
{
  if (qword_1EB5385E0 != -1) {
    dispatch_once(&qword_1EB5385E0, &__block_literal_global_280_0);
  }
  return _MergedGlobals_14;
}

void __42__HKSPSensitiveUIMonitor__isVendorRelease__block_invoke()
{
  id v0 = (id)MGGetStringAnswer();
  _MergedGlobals_14 = [@"Vendor" isEqualToString:v0];
}

- (HKSPSensitiveUIMonitor)initWithCallbackScheduler:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPSensitiveUIMonitor;
  v5 = [(HKSPSensitiveUIMonitor *)&v14 init];
  if (v5)
  {
    v6 = [[HKSPObserverSet alloc] initWithCallbackScheduler:v4];
    observers = v5->_observers;
    v5->_observers = v6;

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "hksp_internalUserDefaults");
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = (NSUserDefaults *)v8;

    v10 = (NPSManager *)objc_alloc_init(MEMORY[0x1E4F79CE0]);
    npsManager = v5->_npsManager;
    v5->_npsManager = v10;

    v5->_needPrefsUpdate = 1;
    v5->_lock._os_unfair_lock_opaque = 0;
    [(HKSPSensitiveUIMonitor *)v5 registerForNotifications];
    v12 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(HKSPSensitiveUIMonitor *)self unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)HKSPSensitiveUIMonitor;
  [(HKSPSensitiveUIMonitor *)&v3 dealloc];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)registerForNotifications
{
}

- (void)unregisterForNotifications
{
}

- (void)_handleNotification
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = HKSPLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    v9 = self;
    id v4 = v7;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] sensitiveUIStateChanged", buf, 0x16u);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__HKSPSensitiveUIMonitor__handleNotification__block_invoke;
  v5[3] = &unk_1E5D32170;
  v5[4] = self;
  [(HKSPSensitiveUIMonitor *)self _withLock:v5];
  [(HKSPObserverSet *)self->_observers enumerateObserversWithBlock:&__block_literal_global_294];
}

uint64_t __45__HKSPSensitiveUIMonitor__handleNotification__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 10) = 1;
  return result;
}

void __45__HKSPSensitiveUIMonitor__handleNotification__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 sensitiveUIStateChanged];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"hideAzulSensitiveUI"])
  {
    v13 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2048;
      v19 = self;
      id v14 = v17;
      _os_log_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] NSUserDefaults key path changed", buf, 0x16u);
    }
    [(HKSPSensitiveUIMonitor *)self _handleNotification];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HKSPSensitiveUIMonitor;
    [(HKSPSensitiveUIMonitor *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)shouldHideForSensitivity:(int64_t)a3
{
  return a3 >= 2 && [(HKSPSensitiveUIMonitor *)self _hideSensitiveUI];
}

- (BOOL)_hideSensitiveUI
{
  if ([(HKSPSensitiveUIMonitor *)self _isVendorRelease]) {
    return 1;
  }
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__HKSPSensitiveUIMonitor__hideSensitiveUI__block_invoke;
  v5[3] = &unk_1E5D32A68;
  v5[4] = self;
  void v5[5] = &v6;
  [(HKSPSensitiveUIMonitor *)self _withLock:v5];
  BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__HKSPSensitiveUIMonitor__hideSensitiveUI__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 10) && !*(unsigned char *)(v2 + 8))
  {
    uint64_t v3 = [*(id *)(v2 + 24) objectForKey:@"hideAzulSensitiveUI"];
    id v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E4F1CC38];
    if (v3) {
      v5 = (void *)v3;
    }
    id v6 = v5;

    char v7 = [v6 BOOLValue];
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = v7;
    *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(v2 + 9);
}

- (void)overrideHideSensitiveUI:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__HKSPSensitiveUIMonitor_overrideHideSensitiveUI___block_invoke;
  v4[3] = &unk_1E5D31F58;
  v4[4] = self;
  BOOL v5 = a3;
  [(HKSPSensitiveUIMonitor *)self _withLock:v4];
  [(HKSPSensitiveUIMonitor *)self _handleNotification];
}

uint64_t __50__HKSPSensitiveUIMonitor_overrideHideSensitiveUI___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  *(unsigned char *)(*(void *)(result + 32) + 9) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setCurrentSensitiveUIHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = HKSPLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    char v7 = (void *)MEMORY[0x1E4F28ED0];
    id v8 = v6;
    char v9 = [v7 numberWithBool:v3];
    *(_DWORD *)buf = 138543874;
    id v14 = v6;
    __int16 v15 = 2048;
    v16 = self;
    __int16 v17 = 2114;
    __int16 v18 = v9;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] Setting current sensitive UI hidden: %{public}@", buf, 0x20u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__HKSPSensitiveUIMonitor_setCurrentSensitiveUIHidden___block_invoke;
  v12[3] = &unk_1E5D32170;
  v12[4] = self;
  [(HKSPSensitiveUIMonitor *)self _withLock:v12];
  [(NSUserDefaults *)self->_userDefaults setBool:v3 forKey:@"hideAzulSensitiveUI"];
  npsManager = self->_npsManager;
  id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:@"hideAzulSensitiveUI"];
  [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.internal.sleep" keys:v11];
}

uint64_t __54__HKSPSensitiveUIMonitor_setCurrentSensitiveUIHidden___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 10) = 1;
  return result;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (BOOL)sensitiveUIOverridden
{
  return self->_sensitiveUIOverridden;
}

- (BOOL)hideSensitiveUI
{
  return self->_hideSensitiveUI;
}

- (BOOL)needPrefsUpdate
{
  return self->_needPrefsUpdate;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end