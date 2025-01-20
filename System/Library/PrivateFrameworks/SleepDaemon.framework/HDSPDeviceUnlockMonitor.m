@interface HDSPDeviceUnlockMonitor
- (BOOL)_latestKeyBagValueForHasBeenUnlockedSinceBoot;
- (BOOL)hasBeenUnlockedSinceBoot;
- (HDSPDeviceUnlockMonitor)init;
- (HDSPDeviceUnlockMonitor)initWithCallbackScheduler:(id)a3;
- (HKSPObserverSet)observers;
- (NSNumber)overrideDeviceHasBeenUnlockedSinceBoot;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (os_unfair_lock_s)monitorLock;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)handleFirstUnlock;
- (void)removeObserver:(id)a3;
- (void)setOverrideDeviceHasBeenUnlockedSinceBoot:(id)a3;
@end

@implementation HDSPDeviceUnlockMonitor

- (HDSPDeviceUnlockMonitor)init
{
  v3 = [MEMORY[0x263F581B8] hkspMainThreadScheduler];
  v4 = [(HDSPDeviceUnlockMonitor *)self initWithCallbackScheduler:v3];

  return v4;
}

- (HDSPDeviceUnlockMonitor)initWithCallbackScheduler:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDSPDeviceUnlockMonitor;
  v5 = [(HDSPDeviceUnlockMonitor *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_monitorLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [objc_alloc(MEMORY[0x263F75E20]) initWithCallbackScheduler:v4];
    observers = v6->_observers;
    v6->_observers = (HKSPObserverSet *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  p_monitorLock = &self->_monitorLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_monitorLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_monitorLock);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)setOverrideDeviceHasBeenUnlockedSinceBoot:(id)a3
{
  objc_storeStrong((id *)&self->_overrideDeviceHasBeenUnlockedSinceBoot, a3);
  id v5 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__HDSPDeviceUnlockMonitor_setOverrideDeviceHasBeenUnlockedSinceBoot___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  [(HDSPDeviceUnlockMonitor *)self _withLock:v6];
}

uint64_t __69__HDSPDeviceUnlockMonitor_setOverrideDeviceHasBeenUnlockedSinceBoot___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  v3 = [(HDSPDeviceUnlockMonitor *)self overrideDeviceHasBeenUnlockedSinceBoot];

  if (v3)
  {
    id v4 = [(HDSPDeviceUnlockMonitor *)self overrideDeviceHasBeenUnlockedSinceBoot];
    char v5 = [v4 BOOLValue];

    return v5;
  }
  else
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__HDSPDeviceUnlockMonitor_hasBeenUnlockedSinceBoot__block_invoke;
    v8[3] = &unk_2645D90E8;
    v8[4] = self;
    v8[5] = &v9;
    [(HDSPDeviceUnlockMonitor *)self _withLock:v8];
    char v7 = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&v9, 8);
    return v7;
  }
}

void __51__HDSPDeviceUnlockMonitor_hasBeenUnlockedSinceBoot__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    char v3 = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = [v2 _latestKeyBagValueForHasBeenUnlockedSinceBoot];
    id v4 = HKSPLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = objc_opt_class();
      int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 1024;
      int v11 = v6;
      id v7 = v5;
      _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] found initial hasBeenUnlockedSinceBoot value of [%d]", (uint8_t *)&v8, 0x12u);
    }
    char v3 = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (BOOL)_latestKeyBagValueForHasBeenUnlockedSinceBoot
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = MKBDeviceUnlockedSinceBoot();
  uint64_t v3 = v2;
  if ((v2 & 0x80000000) == 0) {
    return v2 == 1;
  }
  char v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = objc_opt_class();
    id v7 = NSNumber;
    id v8 = v6;
    uint64_t v9 = [v7 numberWithInt:v3];
    int v10 = 138543618;
    int v11 = v6;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] received an error when calling MKBDeviceUnlockedSinceBoot().  Error code: [%@]", (uint8_t *)&v10, 0x16u);
  }
  return 0;
}

- (void)handleFirstUnlock
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] handleFirstUnlock", buf, 0xCu);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__HDSPDeviceUnlockMonitor_handleFirstUnlock__block_invoke;
  v5[3] = &unk_2645D90C0;
  v5[4] = self;
  [(HDSPDeviceUnlockMonitor *)self _withLock:v5];
  [(HKSPObserverSet *)self->_observers enumerateObserversWithBlock:&__block_literal_global_5];
}

uint64_t __44__HDSPDeviceUnlockMonitor_handleFirstUnlock__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  return result;
}

uint64_t __44__HDSPDeviceUnlockMonitor_handleFirstUnlock__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 deviceHasBeenUnlocked];
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:@"com.apple.mobile.keybagd.first_unlock"])
  {
    int v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v10 = 138543618;
      *(void *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v5;
      id v7 = *(id *)&v10[4];
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v10, 0x16u);
    }
    [(HDSPDeviceUnlockMonitor *)self handleFirstUnlock];
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", *(_OWORD *)v10, *(void *)&v10[16], v11);

  return v8;
}

- (os_unfair_lock_s)monitorLock
{
  return self->_monitorLock;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (NSNumber)overrideDeviceHasBeenUnlockedSinceBoot
{
  return self->_overrideDeviceHasBeenUnlockedSinceBoot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDeviceHasBeenUnlockedSinceBoot, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end