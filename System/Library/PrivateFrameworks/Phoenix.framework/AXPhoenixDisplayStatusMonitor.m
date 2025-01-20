@interface AXPhoenixDisplayStatusMonitor
+ (id)sharedInstance;
- (AXPhoenixDisplayStatusMonitor)init;
- (BOOL)_queryIsDisplayOn;
- (BOOL)isDisplayOn;
- (OS_dispatch_queue)queue;
- (int)notifyToken;
- (void)_displayStateChanged:(double)a3;
- (void)_notifyObserver:(id)a3 isDisplayOn:(BOOL)a4 timestamp:(double)a5;
- (void)_registerForSpringboardNotificationsWithQueue:(id)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)_unregisterForSpringboardNotifications;
- (void)setDisplayOn:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation AXPhoenixDisplayStatusMonitor

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance_onceToken_2;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_5);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance__sharedInstance_1;
  return v2;
}

void __47__AXPhoenixDisplayStatusMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXPhoenixDisplayStatusMonitor);
  v1 = (void *)sharedInstance__sharedInstance_1;
  sharedInstance__sharedInstance_1 = (uint64_t)v0;
}

- (AXPhoenixDisplayStatusMonitor)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AXPhoenixDisplayStatusMonitor;
  v6 = [(AXPhoenixEventMonitor *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    [(AXPhoenixDisplayStatusMonitor *)v6 setDisplayOn:0];
    [(AXPhoenixDisplayStatusMonitor *)v6 setNotifyToken:0xFFFFFFFFLL];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v11, v13);
  queue = location[0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __59__AXPhoenixDisplayStatusMonitor__startMonitoringWithQueue___block_invoke;
  v8 = &unk_264CCE318;
  objc_copyWeak(&v10, &v11);
  id v9 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(location, 0);
}

void __59__AXPhoenixDisplayStatusMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (location[0])
  {
    [location[0] setQueue:*(void *)(a1 + 32)];
    [location[0] _registerForSpringboardNotificationsWithQueue:*(void *)(a1 + 32)];
    objc_msgSend(location[0], "setDisplayOn:", objc_msgSend(location[0], "_queryIsDisplayOn") & 1);
    uint64_t v1 = mach_absolute_time();
    double v5 = MachAbsoluteTimeToTimeIntervalSinceBoot_2(v1);
    [location[0] _displayStateChanged:v5];
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      if ([location[0] isDisplayOn]) {
        v2 = @"ON";
      }
      else {
        v2 = @"OFF";
      }
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v7, (uint64_t)"-[AXPhoenixDisplayStatusMonitor _startMonitoringWithQueue:]_block_invoke", (uint64_t)v2);
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Started monitoring display on/off state. Currently: %@", v7, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_stopMonitoring
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = self;
  oslog[1] = (os_log_t)a2;
  v2 = [(AXPhoenixDisplayStatusMonitor *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  [(AXPhoenixDisplayStatusMonitor *)v4 _unregisterForSpringboardNotifications];
  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v5, (uint64_t)"-[AXPhoenixDisplayStatusMonitor _stopMonitoring]");
    _os_log_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Stopped monitoring display on/off state.", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)_registerForSpringboardNotificationsWithQueue:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v15);
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __79__AXPhoenixDisplayStatusMonitor__registerForSpringboardNotificationsWithQueue___block_invoke;
  id v10 = &unk_264CCE5B0;
  objc_copyWeak(&v11, &from);
  id v12 = (id)MEMORY[0x237E1AA80](&v6);
  int out_token = 0;
  uint32_t v4 = notify_register_dispatch((const char *)springboardDisplayNotificationName, &out_token, (dispatch_queue_t)location[0], v12);
  [(AXPhoenixDisplayStatusMonitor *)v15 setNotifyToken:out_token];
  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[AXPhoenixDisplayStatusMonitor _registerForSpringboardNotificationsWithQueue:]");
      _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Fail to register for screen state change", v16, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __79__AXPhoenixDisplayStatusMonitor__registerForSpringboardNotificationsWithQueue___block_invoke(id *a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v10 = a1;
  int v9 = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    uint64_t state64 = 0;
    uint32_t state = notify_get_state(v9, &state64);
    if (state)
    {
      os_log_t oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        id v3 = (id)[NSNumber numberWithInt:state];
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixDisplayStatusMonitor _registerForSpringboardNotificationsWithQueue:]_block_invoke", (uint64_t)v3);
        _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s notify_get_state status %@ != NOTITY_STATUS_OK", v11, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else
    {
      [location[0] setDisplayOn:state64 == 0];
      uint64_t v2 = mach_absolute_time();
      double v5 = MachAbsoluteTimeToTimeIntervalSinceBoot_2(v2);
      [location[0] _displayStateChanged:v5];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_unregisterForSpringboardNotifications
{
  if (notify_is_valid_token([(AXPhoenixDisplayStatusMonitor *)self notifyToken])) {
    notify_cancel([(AXPhoenixDisplayStatusMonitor *)self notifyToken]);
  }
  [(AXPhoenixDisplayStatusMonitor *)self setNotifyToken:0xFFFFFFFFLL];
}

- (void)_displayStateChanged:(double)a3
{
  v13 = self;
  SEL v12 = a2;
  double v11 = a3;
  objc_initWeak(&location, self);
  id v3 = v13;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __54__AXPhoenixDisplayStatusMonitor__displayStateChanged___block_invoke;
  int v8 = &unk_264CCE478;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&v11;
  [(AXPhoenixEventMonitor *)v3 enumerateObserversInQueue:&v4];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __54__AXPhoenixDisplayStatusMonitor__displayStateChanged___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3[0]) {
    objc_msgSend(v3[0], "_notifyObserver:isDisplayOn:timestamp:", location[0], objc_msgSend(v3[0], "isDisplayOn") & 1, *(double *)(a1 + 40));
  }
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_queryIsDisplayOn
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7[2] = (uint64_t)self;
  v7[1] = (uint64_t)a2;
  v7[0] = 0;
  uint32_t state = notify_get_state([(AXPhoenixDisplayStatusMonitor *)self notifyToken], v7);
  if (!state)
  {
    if (!v7[0])
    {
      char v8 = 1;
      return v8 & 1;
    }
    if (v7[0] == 1)
    {
      char v8 = 0;
      return v8 & 1;
    }
  }
  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    id v4 = (id)[NSNumber numberWithInt:state];
    id v3 = (id)[NSNumber numberWithUnsignedLongLong:v7[0]];
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v9, (uint64_t)"-[AXPhoenixDisplayStatusMonitor _queryIsDisplayOn]", (uint64_t)v4, (uint64_t)v3);
    _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Display status ambiguous: notify_get_state status %@ != NOTIFY_STATUS_OK and state == %@", v9, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  char v8 = 1;
  return v8 & 1;
}

- (void)_notifyObserver:(id)a3 isDisplayOn:(BOOL)a4 timestamp:(double)a5
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(AXPhoenixEventMonitor *)v7 notifyObserver:location[0]];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(location[0], "phoenixDisplayStatusMonitor:didReceiveDisplayStateChanged:timestamp:", v7, -[AXPhoenixDisplayStatusMonitor isDisplayOn](v7, "isDisplayOn"), a5);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isDisplayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end