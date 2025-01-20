@interface HDSPDevicePowerMonitor
- (BOOL)isCharging;
- (HDSPDevicePowerMonitor)init;
- (HDSPDevicePowerMonitor)initWithCallbackScheduler:(id)a3;
- (HKSPObserverSet)observers;
- (NSNumber)batteryLevelOverride;
- (NSNumber)isChargingOverride;
- (float)batteryLevel;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setBatteryLevelOverride:(id)a3;
- (void)setIsChargingOverride:(id)a3;
@end

@implementation HDSPDevicePowerMonitor

- (HDSPDevicePowerMonitor)init
{
  v3 = [MEMORY[0x263F581B8] hkspMainThreadScheduler];
  v4 = [(HDSPDevicePowerMonitor *)self initWithCallbackScheduler:v3];

  return v4;
}

- (HDSPDevicePowerMonitor)initWithCallbackScheduler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPDevicePowerMonitor;
  v5 = [(HDSPDevicePowerMonitor *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F75E20]) initWithCallbackScheduler:v4];
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)isCharging
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  isChargingOverride = self->_isChargingOverride;
  if (isChargingOverride)
  {
    return [(NSNumber *)isChargingOverride BOOLValue];
  }
  else
  {
    int v4 = HKSPIsCharging();
    v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 1024;
      int v10 = v4;
      id v6 = v8;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] charging: %d", (uint8_t *)&v7, 0x12u);
    }
    return v4;
  }
}

- (float)batteryLevel
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  batteryLevelOverride = self->_batteryLevelOverride;
  if (batteryLevelOverride)
  {
    [(NSNumber *)batteryLevelOverride floatValue];
  }
  else
  {
    HKSPBatteryLevel();
    float v5 = v4;
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2048;
      double v11 = v5;
      id v7 = v9;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] battery level: %f", (uint8_t *)&v8, 0x16u);
    }
    return v5;
  }
  return result;
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:@"com.apple.system.powersources.source"])
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v5;
      id v7 = v13;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", buf, 0x16u);
    }
    observers = self->_observers;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__HDSPDevicePowerMonitor_notificationListener_didReceiveNotificationWithName___block_invoke;
    v11[3] = &unk_2645DADA0;
    v11[4] = self;
    [(HKSPObserverSet *)observers enumerateObserversWithBlock:v11];
  }
  id v9 = [MEMORY[0x263F58190] futureWithNoResult];

  return v9;
}

void __78__HDSPDevicePowerMonitor_notificationListener_didReceiveNotificationWithName___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "deviceChangedChargingState:", objc_msgSend(v2, "isCharging"));
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (NSNumber)isChargingOverride
{
  return self->_isChargingOverride;
}

- (void)setIsChargingOverride:(id)a3
{
}

- (NSNumber)batteryLevelOverride
{
  return self->_batteryLevelOverride;
}

- (void)setBatteryLevelOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelOverride, 0);
  objc_storeStrong((id *)&self->_isChargingOverride, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end