@interface AXPhoenixWakeGestureMonitor
+ (id)sharedInstance;
- (AXPhoenixWakeGestureMonitor)init;
- (BOOL)isDeviceHandheld;
- (CMWakeGestureManager)gestureManager;
- (double)dismissalTimestamp;
- (double)wakeGestureTimestamp;
- (void)_didReceiveSleepGesture;
- (void)_didReceiveWakeGesture;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setDismissalTimestamp:(double)a3;
- (void)setGestureManager:(id)a3;
- (void)setWakeGestureTimestamp:(double)a3;
- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4;
@end

@implementation AXPhoenixWakeGestureMonitor

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

void __45__AXPhoenixWakeGestureMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXPhoenixWakeGestureMonitor);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;
}

- (AXPhoenixWakeGestureMonitor)init
{
  SEL v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)AXPhoenixWakeGestureMonitor;
  v8 = [(AXPhoenixEventMonitor *)&v6 init];
  objc_storeStrong((id *)&v8, v8);
  if (v8 && ([getCMWakeGestureManagerClass() isWakeGestureAvailable] & 1) != 0)
  {
    v4 = v8;
    id v5 = (id)[getCMWakeGestureManagerClass() sharedManager];
    -[AXPhoenixWakeGestureMonitor setGestureManager:](v4, "setGestureManager:");
  }
  v3 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(AXPhoenixWakeGestureMonitor *)v7 gestureManager];
  [(CMWakeGestureManager *)v3 setDelegate:v7];

  v4 = [(AXPhoenixWakeGestureMonitor *)v7 gestureManager];
  [(CMWakeGestureManager *)v4 startWakeGestureUpdates];

  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)"-[AXPhoenixWakeGestureMonitor _startMonitoringWithQueue:]");
    _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Started monitoring wake gesture", v8, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)_stopMonitoring
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  oslog[2] = &self->super.super;
  oslog[1] = (os_log_t)a2;
  v2 = [(AXPhoenixWakeGestureMonitor *)self gestureManager];
  [(CMWakeGestureManager *)v2 stopWakeGestureUpdates];

  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v4, (uint64_t)"-[AXPhoenixWakeGestureMonitor _stopMonitoring]");
    _os_log_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Stopped monitoring wake gesture", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (BOOL)isDeviceHandheld
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = +[AXPhoenixWakeGestureMonitor sharedInstance];
  uint64_t v2 = mach_absolute_time();
  double v17 = MachAbsoluteTimeToTimeIntervalSinceBoot_0(v2);
  [location[0] wakeGestureTimestamp];
  double v16 = v3;
  [location[0] dismissalTimestamp];
  double v15 = v4;
  char v14 = 0;
  if (v16 <= v4)
  {
    os_log_t v8 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v19, (uint64_t)"-[AXPhoenixWakeGestureMonitor isDeviceHandheld]");
      _os_log_impl(&dword_2372C8000, v8, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Tagging as FarField as user dismissed", v19, 0xCu);
    }
    objc_storeStrong((id *)&v8, 0);
  }
  else
  {
    float v5 = v17 - v16;
    float v13 = v5;
    if (v5 >= 8.0)
    {
      os_log_t v10 = (os_log_t)(id)AXLogBackTap();
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_0((uint64_t)v20, (uint64_t)"-[AXPhoenixWakeGestureMonitor isDeviceHandheld]", COERCE__INT64(v13));
        _os_log_impl(&dword_2372C8000, v10, v9, "[PHOENIX] %s Tagging as farfield as last user interaction %f secs back", v20, 0x16u);
      }
      objc_storeStrong((id *)&v10, 0);
    }
    else
    {
      char v14 = 1;
      os_log_t oslog = (os_log_t)(id)AXLogBackTap();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_0((uint64_t)v21, (uint64_t)"-[AXPhoenixWakeGestureMonitor isDeviceHandheld]", COERCE__INT64(v13));
        _os_log_impl(&dword_2372C8000, oslog, type, "[PHOENIX] %s Tagging as handheld as user interacted in last %f secs", v21, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  char v7 = v14;
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  os_log_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 == 1)
  {
    char v7 = v10;
    uint64_t v4 = mach_absolute_time();
    [(AXPhoenixWakeGestureMonitor *)v7 setWakeGestureTimestamp:MachAbsoluteTimeToTimeIntervalSinceBoot_0(v4)];
    [(AXPhoenixWakeGestureMonitor *)v10 _didReceiveWakeGesture];
  }
  else if (a4 == 3)
  {
    objc_super v6 = v10;
    uint64_t v5 = mach_absolute_time();
    [(AXPhoenixWakeGestureMonitor *)v6 setDismissalTimestamp:MachAbsoluteTimeToTimeIntervalSinceBoot_0(v5)];
    [(AXPhoenixWakeGestureMonitor *)v10 _didReceiveSleepGesture];
  }
  objc_storeStrong(location, 0);
}

- (void)_didReceiveWakeGesture
{
  float v13 = self;
  SEL v12 = a2;
  [(AXPhoenixWakeGestureMonitor *)self wakeGestureTimestamp];
  v11 = v2;
  double v3 = v13;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  os_log_t v8 = __53__AXPhoenixWakeGestureMonitor__didReceiveWakeGesture__block_invoke;
  os_log_type_t v9 = &unk_264CCE100;
  v10[0] = v13;
  v10[1] = v11;
  v4.receiver = v3;
  v4.super_class = (Class)AXPhoenixWakeGestureMonitor;
  -[AXPhoenixEventMonitor enumerateObserversInQueue:](&v4, sel_enumerateObserversInQueue_);
  objc_storeStrong(v10, 0);
}

void __53__AXPhoenixWakeGestureMonitor__didReceiveWakeGesture__block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) notifyObserver:location[0]];
  if (objc_opt_respondsToSelector()) {
    [location[0] gestureMonitorDidReceiveWakeGesture:*(void *)(a1 + 32) timestamp:*(double *)(a1 + 40)];
  }
  objc_storeStrong(location, 0);
}

- (void)_didReceiveSleepGesture
{
  float v13 = self;
  SEL v12 = a2;
  [(AXPhoenixWakeGestureMonitor *)self dismissalTimestamp];
  v11 = v2;
  double v3 = v13;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  os_log_t v8 = __54__AXPhoenixWakeGestureMonitor__didReceiveSleepGesture__block_invoke;
  os_log_type_t v9 = &unk_264CCE100;
  v10[0] = v13;
  v10[1] = v11;
  v4.receiver = v3;
  v4.super_class = (Class)AXPhoenixWakeGestureMonitor;
  -[AXPhoenixEventMonitor enumerateObserversInQueue:](&v4, sel_enumerateObserversInQueue_);
  objc_storeStrong(v10, 0);
}

void __54__AXPhoenixWakeGestureMonitor__didReceiveSleepGesture__block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) notifyObserver:location[0]];
  if (objc_opt_respondsToSelector()) {
    [location[0] gestureMonitorDidReceiveSleepGesture:*(void *)(a1 + 32) timestamp:*(double *)(a1 + 40)];
  }
  objc_storeStrong(location, 0);
}

- (double)wakeGestureTimestamp
{
  return self->_wakeGestureTimestamp;
}

- (void)setWakeGestureTimestamp:(double)a3
{
  self->_wakeGestureTimestamp = a3;
}

- (double)dismissalTimestamp
{
  return self->_dismissalTimestamp;
}

- (void)setDismissalTimestamp:(double)a3
{
  self->_dismissalTimestamp = a3;
}

- (CMWakeGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (void)setGestureManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end