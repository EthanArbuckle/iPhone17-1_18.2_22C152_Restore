@interface HDSPSystemMonitor
+ (id)_platformSpecificReadyProviderForEnvironment:(id)a3;
- (BOOL)isSystemReady;
- (BOOL)systemReady;
- (HDSPApplicationWorkspaceMonitor)applicationWorkspaceMonitor;
- (HDSPDevicePowerMonitor)devicePowerMonitor;
- (HDSPDeviceUnlockMonitor)deviceUnlockMonitor;
- (HDSPEnvironment)environment;
- (HDSPSystemMonitor)initWithEnvironment:(id)a3;
- (HDSPSystemMonitor)initWithEnvironment:(id)a3 watchOnWristMonitor:(id)a4 devicePowerMonitor:(id)a5 deviceUnlockMonitor:(id)a6;
- (HDSPSystemMonitor)initWithEnvironment:(id)a3 watchOnWristMonitor:(id)a4 devicePowerMonitor:(id)a5 deviceUnlockMonitor:(id)a6 systemReadyProvider:(id)a7 applicationWorkspaceMonitor:(id)a8;
- (HDSPSystemReadyDelegate)delegate;
- (HDSPSystemReadyProvider)systemReadyProvider;
- (HDSPWatchOnWristMonitor)watchOnWristMonitor;
- (HKSPMutexProvider)mutexProvider;
- (id)diagnosticDescription;
- (void)_withLock:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)setDelegate:(id)a3;
- (void)systemDidBecomeReady;
@end

@implementation HDSPSystemMonitor

+ (id)_platformSpecificReadyProviderForEnvironment:(id)a3
{
  id v3 = a3;
  v4 = [v3 behavior];
  int v5 = [v4 isAppleWatch];
  v6 = off_2645D8BB8;
  if (!v5) {
    v6 = off_2645D8A20;
  }
  v7 = (void *)[objc_alloc(*v6) initWithEnvironment:v3];

  return v7;
}

- (HDSPSystemMonitor)initWithEnvironment:(id)a3
{
  id v4 = a3;
  int v5 = [v4 behavior];
  int v6 = [v5 isAppleWatch];

  if (v6)
  {
    v7 = [HDSPWatchOnWristMonitor alloc];
    v8 = [v4 userDefaults];
    v9 = [v4 defaultCallbackScheduler];
    v10 = [(HDSPWatchOnWristMonitor *)v7 initWithUserDefaults:v8 callbackScheduler:v9];

    v11 = [HDSPDevicePowerMonitor alloc];
    v12 = [v4 defaultCallbackScheduler];
    v13 = [(HDSPDevicePowerMonitor *)v11 initWithCallbackScheduler:v12];
  }
  else
  {
    v10 = 0;
    v13 = 0;
  }
  v14 = [HDSPDeviceUnlockMonitor alloc];
  v15 = [v4 defaultCallbackScheduler];
  v16 = [(HDSPDeviceUnlockMonitor *)v14 initWithCallbackScheduler:v15];
  v17 = [(HDSPSystemMonitor *)self initWithEnvironment:v4 watchOnWristMonitor:v10 devicePowerMonitor:v13 deviceUnlockMonitor:v16];

  return v17;
}

- (HDSPSystemMonitor)initWithEnvironment:(id)a3 watchOnWristMonitor:(id)a4 devicePowerMonitor:(id)a5 deviceUnlockMonitor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(id)objc_opt_class() _platformSpecificReadyProviderForEnvironment:v13];
  v15 = objc_alloc_init(HDSPApplicationWorkspaceMonitor);
  v16 = [(HDSPSystemMonitor *)self initWithEnvironment:v13 watchOnWristMonitor:v12 devicePowerMonitor:v11 deviceUnlockMonitor:v10 systemReadyProvider:v14 applicationWorkspaceMonitor:v15];

  return v16;
}

- (HDSPSystemMonitor)initWithEnvironment:(id)a3 watchOnWristMonitor:(id)a4 devicePowerMonitor:(id)a5 deviceUnlockMonitor:(id)a6 systemReadyProvider:(id)a7 applicationWorkspaceMonitor:(id)a8
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v32 = a7;
  id obj = a8;
  id v31 = a8;
  v33.receiver = self;
  v33.super_class = (Class)HDSPSystemMonitor;
  v18 = [(HDSPSystemMonitor *)&v33 init];
  if (v18)
  {
    v19 = HKSPLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v35 = v20;
      __int16 v36 = 2114;
      id v37 = v32;
      id v29 = v17;
      id v21 = v16;
      id v22 = v15;
      id v23 = v20;
      _os_log_impl(&dword_221A52000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing with %{public}@", buf, 0x16u);

      id v15 = v22;
      id v16 = v21;
      id v17 = v29;
    }

    objc_storeWeak((id *)&v18->_environment, v14);
    objc_storeStrong((id *)&v18->_systemReadyProvider, a7);
    [(HDSPSystemReadyProvider *)v18->_systemReadyProvider setDelegate:v18];
    objc_storeStrong((id *)&v18->_deviceUnlockMonitor, a6);
    objc_storeStrong((id *)&v18->_devicePowerMonitor, a5);
    objc_storeStrong((id *)&v18->_watchOnWristMonitor, a4);
    objc_storeStrong((id *)&v18->_applicationWorkspaceMonitor, obj);
    v24 = [v14 mutexGenerator];
    uint64_t v25 = v24[2]();
    mutexProvider = v18->_mutexProvider;
    v18->_mutexProvider = (HKSPMutexProvider *)v25;

    v27 = v18;
  }

  return v18;
}

- (void)_withLock:(id)a3
{
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = a3;
  int v5 = [v4 diagnostics];
  [v5 addProvider:self];

  int v6 = [v4 notificationListener];
  [v6 addObserver:self->_deviceUnlockMonitor];

  id v7 = [v4 notificationListener];

  [v7 addObserver:self->_devicePowerMonitor];
}

- (BOOL)isSystemReady
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__HDSPSystemMonitor_isSystemReady__block_invoke;
  v9[3] = &unk_2645D90E8;
  v9[4] = self;
  v9[5] = &v10;
  [(HDSPSystemMonitor *)self _withLock:v9];
  if (*((unsigned char *)v11 + 24))
  {
    v2 = HKSPLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v15 = v3;
      id v4 = v3;
      _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] system is ready", buf, 0xCu);
    }
  }
  else
  {
    v2 = HKSPLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v15 = v5;
      id v6 = v5;
      _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] system not ready", buf, 0xCu);
    }
  }

  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __34__HDSPSystemMonitor_isSystemReady__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    char v3 = 1;
  }
  else
  {
    result = [*(id *)(v2 + 64) isSystemReady];
    *(unsigned char *)(*(void *)(v1 + 32) + 8) = result;
    char v3 = *(unsigned char *)(*(void *)(v1 + 32) + 8);
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)systemDidBecomeReady
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained systemDidBecomeReady];
}

- (id)diagnosticDescription
{
  char v3 = (void *)MEMORY[0x263F089D8];
  BOOL v4 = [(HDSPSystemMonitor *)self isSystemReady];
  int v5 = [(HDSPSystemMonitor *)self deviceUnlockMonitor];
  id v6 = objc_msgSend(v3, "stringWithFormat:", @"Ready: %d\nHas Been Unlocked: %d\n", v4, objc_msgSend(v5, "hasBeenUnlockedSinceBoot"));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v8 = [WeakRetained behavior];
  int v9 = [v8 isAppleWatch];

  if (v9)
  {
    uint64_t v10 = [(HDSPSystemMonitor *)self devicePowerMonitor];
    unsigned int v11 = [v10 isCharging];
    uint64_t v12 = [(HDSPSystemMonitor *)self devicePowerMonitor];
    [v12 batteryLevel];
    double v14 = v13;
    id v15 = [(HDSPSystemMonitor *)self watchOnWristMonitor];
    objc_msgSend(v6, "appendFormat:", @"Charging: %d\nBattery: %f\nOn Wrist: %d\n", v11, *(void *)&v14, objc_msgSend(v15, "isOnWrist"));
  }

  return v6;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HDSPSystemReadyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPSystemReadyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HDSPDeviceUnlockMonitor)deviceUnlockMonitor
{
  return self->_deviceUnlockMonitor;
}

- (HDSPDevicePowerMonitor)devicePowerMonitor
{
  return self->_devicePowerMonitor;
}

- (HDSPApplicationWorkspaceMonitor)applicationWorkspaceMonitor
{
  return self->_applicationWorkspaceMonitor;
}

- (HDSPWatchOnWristMonitor)watchOnWristMonitor
{
  return self->_watchOnWristMonitor;
}

- (HDSPSystemReadyProvider)systemReadyProvider
{
  return self->_systemReadyProvider;
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_systemReadyProvider, 0);
  objc_storeStrong((id *)&self->_watchOnWristMonitor, 0);
  objc_storeStrong((id *)&self->_applicationWorkspaceMonitor, 0);
  objc_storeStrong((id *)&self->_devicePowerMonitor, 0);
  objc_storeStrong((id *)&self->_deviceUnlockMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_environment);
}

@end