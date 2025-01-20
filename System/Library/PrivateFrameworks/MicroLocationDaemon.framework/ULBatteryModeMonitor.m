@interface ULBatteryModeMonitor
- (BOOL)_checkLowPowerMode;
- (BOOL)_checkUnlimitedPower;
- (BOOL)lowPowerMode;
- (BOOL)unlimitedPower;
- (ULBatteryModeMonitor)init;
- (ULBatteryModeMonitor)initWithNotificationHelper:(id)a3;
- (ULDarwinNotificationHelper)notificationHelper;
- (id)latestEventAfterAddingObserverForEventName:(id)a3;
- (void)_handleIOPSNotifyAdapterChangeNotification;
- (void)_handleNSProcessInfoPowerStateDidChangeNotification:(id)a3;
- (void)_startMonitoringForLowPowerMode;
- (void)_startMonitoringForUnlimitedPower;
- (void)_stopMonitoringForLowPowerMode;
- (void)_stopMonitoringForUnlimitedPower;
- (void)setLowPowerMode:(BOOL)a3;
- (void)setNotificationHelper:(id)a3;
- (void)setUnlimitedPower:(BOOL)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULBatteryModeMonitor

- (ULBatteryModeMonitor)init
{
  uint64_t v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULBatteryModeMonitor)initWithNotificationHelper:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULBatteryModeMonitor;
  v5 = [(ULEventMonitor *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ULBatteryModeMonitor *)v5 setNotificationHelper:v4];
  }

  return v6;
}

- (void)startMonitoring:(id)a3
{
  id v9 = a3;
  id v4 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = +[ULEvent eventName];
  int v6 = [v9 isEqual:v5];

  if (v6)
  {
    [(ULBatteryModeMonitor *)self _startMonitoringForUnlimitedPower];
  }
  else
  {
    v7 = +[ULEvent eventName];
    int v8 = [v9 isEqual:v7];

    if (v8) {
      [(ULBatteryModeMonitor *)self _startMonitoringForLowPowerMode];
    }
  }
}

- (void)stopMonitoring:(id)a3
{
  id v9 = a3;
  id v4 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = +[ULEvent eventName];
  int v6 = [v9 isEqual:v5];

  if (v6)
  {
    [(ULBatteryModeMonitor *)self _stopMonitoringForUnlimitedPower];
  }
  else
  {
    v7 = +[ULEvent eventName];
    int v8 = [v9 isEqual:v7];

    if (v8) {
      [(ULBatteryModeMonitor *)self _stopMonitoringForLowPowerMode];
    }
  }
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = +[ULEvent eventName];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    int v8 = objc_alloc_init(ULBatteryModeMonitorEventUnlimitedPower);
    [(ULBatteryModeMonitorEventUnlimitedPower *)v8 setUnlimitedPower:[(ULBatteryModeMonitor *)self unlimitedPower]];
  }
  else
  {
    id v9 = +[ULEvent eventName];
    int v10 = [v4 isEqual:v9];

    if (v10)
    {
      v11 = objc_alloc_init(ULBatteryModeMonitorEventLowPowerMode);
      [(ULBatteryModeMonitorEventLowPowerMode *)v11 setLowPowerMode:[(ULBatteryModeMonitor *)self lowPowerMode]];
    }
    int v8 = 0;
  }

  return v8;
}

- (void)_startMonitoringForUnlimitedPower
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v3 = [(ULBatteryModeMonitor *)self notificationHelper];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  int v10 = __57__ULBatteryModeMonitor__startMonitoringForUnlimitedPower__block_invoke;
  v11 = &unk_2653F9200;
  objc_copyWeak(&v12, &location);
  [v3 addObserverForNotificationName:@"com.apple.system.powermanagement.poweradapter" handler:&v8];

  [(ULBatteryModeMonitor *)self setUnlimitedPower:[(ULBatteryModeMonitor *)self _checkUnlimitedPower]];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_21);
  }
  id v4 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = +[ULEvent eventName];
    BOOL v6 = [(ULBatteryModeMonitor *)self unlimitedPower];
    int v7 = @"NO";
    if (v6) {
      int v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, unlimitedPower: %@", buf, 0x16u);
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __57__ULBatteryModeMonitor__startMonitoringForUnlimitedPower__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleIOPSNotifyAdapterChangeNotification];
    id WeakRetained = v2;
  }
}

- (void)_startMonitoringForLowPowerMode
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleNSProcessInfoPowerStateDidChangeNotification_ name:*MEMORY[0x263F08450] object:0];

  [(ULBatteryModeMonitor *)self setLowPowerMode:[(ULBatteryModeMonitor *)self _checkLowPowerMode]];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_21);
  }
  id v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    BOOL v6 = +[ULEvent eventName];
    BOOL v7 = [(ULBatteryModeMonitor *)self lowPowerMode];
    uint64_t v8 = @"NO";
    if (v7) {
      uint64_t v8 = @"YES";
    }
    int v9 = 138412546;
    int v10 = v6;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, lowPowerMode: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_stopMonitoringForUnlimitedPower
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_21);
  }
  v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5 = +[ULEvent eventName];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v7, 0xCu);
  }
  BOOL v6 = [(ULBatteryModeMonitor *)self notificationHelper];
  [v6 removeObserverForNotificationName:@"com.apple.system.powermanagement.poweradapter"];

  [(ULBatteryModeMonitor *)self setUnlimitedPower:0];
}

- (void)_stopMonitoringForLowPowerMode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_21);
  }
  v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5 = +[ULEvent eventName];
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v7, 0xCu);
  }
  BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F08450] object:0];

  [(ULBatteryModeMonitor *)self setLowPowerMode:0];
}

- (void)_handleIOPSNotifyAdapterChangeNotification
{
  v3 = [(ULEventMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ULBatteryModeMonitor__handleIOPSNotifyAdapterChangeNotification__block_invoke;
  block[3] = &unk_2653F91D8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __66__ULBatteryModeMonitor__handleIOPSNotifyAdapterChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _checkUnlimitedPower];
  if (v2 != [*(id *)(a1 + 32) unlimitedPower])
  {
    [*(id *)(a1 + 32) setUnlimitedPower:v2];
    v3 = objc_alloc_init(ULBatteryModeMonitorEventUnlimitedPower);
    [(ULBatteryModeMonitorEventUnlimitedPower *)v3 setUnlimitedPower:v2];
    [*(id *)(a1 + 32) postEvent:v3];
  }
}

- (void)_handleNSProcessInfoPowerStateDidChangeNotification:(id)a3
{
  id v4 = [(ULEventMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__ULBatteryModeMonitor__handleNSProcessInfoPowerStateDidChangeNotification___block_invoke;
  block[3] = &unk_2653F91D8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __76__ULBatteryModeMonitor__handleNSProcessInfoPowerStateDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _checkLowPowerMode];
  if (v2 != [*(id *)(a1 + 32) lowPowerMode])
  {
    [*(id *)(a1 + 32) setLowPowerMode:v2];
    v3 = objc_alloc_init(ULBatteryModeMonitorEventLowPowerMode);
    [(ULBatteryModeMonitorEventLowPowerMode *)v3 setLowPowerMode:v2];
    [*(id *)(a1 + 32) postEvent:v3];
  }
}

- (BOOL)_checkUnlimitedPower
{
  return MEMORY[0x270EF4930](self, a2);
}

- (BOOL)_checkLowPowerMode
{
  uint64_t v2 = [MEMORY[0x263F08AB0] processInfo];
  char v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (BOOL)unlimitedPower
{
  return self->_unlimitedPower;
}

- (void)setUnlimitedPower:(BOOL)a3
{
  self->_unlimitedPower = a3;
}

- (BOOL)lowPowerMode
{
  return self->_lowPowerMode;
}

- (void)setLowPowerMode:(BOOL)a3
{
  self->_lowPowerMode = a3;
}

- (void).cxx_destruct
{
}

@end