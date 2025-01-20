@interface HDSPWatchOnWristMonitor
- (BOOL)_lock_isOnWrist;
- (BOOL)isOnWrist;
- (BOOL)isWristDetectEnabled;
- (HDSPWatchOnWristMonitor)initWithUserDefaults:(id)a3;
- (HDSPWatchOnWristMonitor)initWithUserDefaults:(id)a3 callbackScheduler:(id)a4;
- (HKSPObserverSet)observers;
- (HKSPUserDefaults)userDefaults;
- (HKWristDetectionSettingManager)wristDetectionSettingsManager;
- (NSDate)lastOnWristDate;
- (id)_lock_lastOnWristDate;
- (os_unfair_lock_s)lock;
- (void)_lock_setIsOnWrist:(BOOL)a3;
- (void)_lock_setLastOnWristDate:(id)a3;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3;
@end

@implementation HDSPWatchOnWristMonitor

- (HDSPWatchOnWristMonitor)initWithUserDefaults:(id)a3
{
  v4 = (void *)MEMORY[0x263F581B8];
  id v5 = a3;
  v6 = [v4 hkspMainThreadScheduler];
  v7 = [(HDSPWatchOnWristMonitor *)self initWithUserDefaults:v5 callbackScheduler:v6];

  return v7;
}

- (HDSPWatchOnWristMonitor)initWithUserDefaults:(id)a3 callbackScheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDSPWatchOnWristMonitor;
  v9 = [(HDSPWatchOnWristMonitor *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F75E20]) initWithCallbackScheduler:v8];
    observers = v10->_observers;
    v10->_observers = (HKSPObserverSet *)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
    v13 = (HKWristDetectionSettingManager *)objc_alloc_init(MEMORY[0x263F0A950]);
    wristDetectionSettingsManager = v10->_wristDetectionSettingsManager;
    v10->_wristDetectionSettingsManager = v13;

    v15 = v10;
  }

  return v10;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)addObserver:(id)a3
{
  char v4 = 0;
  [(HKSPObserverSet *)self->_observers addObserver:a3 wasFirst:&v4];
  if (v4) {
    [(HKWristDetectionSettingManager *)self->_wristDetectionSettingsManager registerObserver:self];
  }
}

- (void)removeObserver:(id)a3
{
  char v4 = 0;
  [(HKSPObserverSet *)self->_observers removeObserver:a3 wasLast:&v4];
  if (v4) {
    [(HKWristDetectionSettingManager *)self->_wristDetectionSettingsManager unregisterObserver:self];
  }
}

- (BOOL)isOnWrist
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__HDSPWatchOnWristMonitor_isOnWrist__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPWatchOnWristMonitor *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __36__HDSPWatchOnWristMonitor_isOnWrist__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_lock_isOnWrist");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_lock_isOnWrist
{
  return [(HKSPUserDefaults *)self->_userDefaults hksp_BOOLForKey:@"isOnWrist"];
}

- (void)_lock_setIsOnWrist:(BOOL)a3
{
}

- (NSDate)lastOnWristDate
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HDSPWatchOnWristMonitor_lastOnWristDate__block_invoke;
  v4[3] = &unk_2645D9630;
  v4[4] = self;
  v4[5] = &v5;
  [(HDSPWatchOnWristMonitor *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

uint64_t __42__HDSPWatchOnWristMonitor_lastOnWristDate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_lock_lastOnWristDate");

  return MEMORY[0x270F9A758]();
}

- (id)_lock_lastOnWristDate
{
  return (id)[(HKSPUserDefaults *)self->_userDefaults hksp_objectForKey:@"lastOnWristDate"];
}

- (void)_lock_setLastOnWristDate:(id)a3
{
}

- (BOOL)isWristDetectEnabled
{
  return [(HKWristDetectionSettingManager *)self->_wristDetectionSettingsManager isWristDetectEnabled];
}

- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] wristDetectionSettingManagerDidObserveWristDetectChange", (uint8_t *)&v6, 0xCu);
  }
  [(HKSPObserverSet *)self->_observers enumerateObserversWithBlock:&__block_literal_global_6];
}

void __83__HDSPWatchOnWristMonitor_wristDetectionSettingManagerDidObserveWristDetectChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 wristDetectEnabledDidChange];
  }
}

- (HKWristDetectionSettingManager)wristDetectionSettingsManager
{
  return self->_wristDetectionSettingsManager;
}

- (HKSPUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_wristDetectionSettingsManager, 0);
}

@end