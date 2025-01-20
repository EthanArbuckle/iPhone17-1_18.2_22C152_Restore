@interface AXPhoenixDeviceLockMonitor
+ (id)sharedInstance;
- (AXPhoenixDeviceLockMonitor)init;
- (BOOL)_queryIsDeviceLocked;
- (BOOL)isDeviceLocked;
- (void)_notifyObserver:(id)a3 isDeviceLocked:(BOOL)a4 timestamp:(double)a5;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)deviceLockStateChanged:(double)a3;
- (void)setDeviceLocked:(BOOL)a3;
@end

@implementation AXPhoenixDeviceLockMonitor

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance_onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_2);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance__sharedInstance_0;
  return v2;
}

void __44__AXPhoenixDeviceLockMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXPhoenixDeviceLockMonitor);
  v1 = (void *)sharedInstance__sharedInstance_0;
  sharedInstance__sharedInstance_0 = (uint64_t)v0;
}

- (AXPhoenixDeviceLockMonitor)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AXPhoenixDeviceLockMonitor;
  v6 = [(AXPhoenixEventMonitor *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(AXPhoenixDeviceLockMonitor *)v6 setDeviceLocked:0];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v10, v12);
  queue = location[0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __56__AXPhoenixDeviceLockMonitor__startMonitoringWithQueue___block_invoke;
  v8 = &unk_264CCDFF0;
  objc_copyWeak(&v9, &v10);
  dispatch_async(queue, &v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v10);
  objc_storeStrong(location, 0);
}

void __56__AXPhoenixDeviceLockMonitor__startMonitoringWithQueue___block_invoke(id *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, location[0], (CFNotificationCallback)HandleDeviceLockStateChanged, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)"-[AXPhoenixDeviceLockMonitor _startMonitoringWithQueue:]_block_invoke");
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Started monitoring device lock/unlock state", v6, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v3 = location[0];
    uint64_t v2 = mach_absolute_time();
    [v3 deviceLockStateChanged:MachAbsoluteTimeToTimeIntervalSinceBoot_1(v2)];
  }
  objc_storeStrong(location, 0);
}

- (void)_stopMonitoring
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = self;
  oslog[1] = (os_log_t)a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v4, @"com.apple.mobile.keybagd.lock_status", 0);
  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v5, (uint64_t)"-[AXPhoenixDeviceLockMonitor _stopMonitoring]");
    _os_log_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Stopped monitoring device lock/unlock state", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)deviceLockStateChanged:(double)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16 = self;
  SEL v15 = a2;
  double v14 = a3;
  [(AXPhoenixDeviceLockMonitor *)self setDeviceLocked:[(AXPhoenixDeviceLockMonitor *)self _queryIsDeviceLocked]];
  objc_initWeak(&location, v16);
  id v12 = (id)AXLogBackTap();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    if ([(AXPhoenixDeviceLockMonitor *)v16 isDeviceLocked]) {
      id v3 = @"Locked";
    }
    else {
      id v3 = @"Unlocked";
    }
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v17, (uint64_t)"-[AXPhoenixDeviceLockMonitor deviceLockStateChanged:]", (uint64_t)v3);
    _os_log_impl(&dword_2372C8000, (os_log_t)v12, v11, "[PHOENIX] %s Device Lock Status Changed : %{public}@", v17, 0x16u);
  }
  objc_storeStrong(&v12, 0);
  uint64_t v4 = v16;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __53__AXPhoenixDeviceLockMonitor_deviceLockStateChanged___block_invoke;
  id v9 = &unk_264CCE478;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&v14;
  [(AXPhoenixEventMonitor *)v4 enumerateObserversInQueue:&v5];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __53__AXPhoenixDeviceLockMonitor_deviceLockStateChanged___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3[0]) {
    objc_msgSend(v3[0], "_notifyObserver:isDeviceLocked:timestamp:", location[0], objc_msgSend(v3[0], "isDeviceLocked") & 1, *(double *)(a1 + 40));
  }
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_queryIsDeviceLocked
{
  int v4 = MKBGetDeviceLockState();
  BOOL v3 = 1;
  if (v4 != 2) {
    return v4 == 1;
  }
  return v3;
}

- (void)_notifyObserver:(id)a3 isDeviceLocked:(BOOL)a4 timestamp:(double)a5
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(AXPhoenixEventMonitor *)v8 notifyObserver:location[0]];
  if (objc_opt_respondsToSelector()) {
    [location[0] phoenixDeviceLockMonitor:v8 didReceiveDeviceLockStateChanged:a4 timestamp:a5];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isDeviceLocked
{
  return self->_deviceLocked;
}

- (void)setDeviceLocked:(BOOL)a3
{
  self->_deviceLocked = a3;
}

@end