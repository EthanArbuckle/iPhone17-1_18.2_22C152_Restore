@interface AXPhoenixMitigator
- (AXPhoenixMitigator)initWithDelegate:(id)a3 configuration:(id)a4;
- (BOOL)deviceLocked;
- (BOOL)displayOn;
- (BOOL)isHandHeld;
- (BOOL)isRunning;
- (BOOL)touchOn;
- (double)lastDeviceLockedTimestamp;
- (double)lastDeviceUnlockedTimestamp;
- (double)lastDismissalTimestamp;
- (double)lastDisplayOffTimestamp;
- (double)lastDisplayOnTimestamp;
- (double)lastTouchInteractionGainTimestamp;
- (double)lastTouchInteractionLossTimestamp;
- (double)lastWakeGestureTimestamp;
- (id)_contextInfo:(BOOL)a3;
- (id)configuration;
- (int)policyOption;
- (void)_shouldTriggerEventWithTapData:(id)a3 isDoubleTap:(BOOL)a4 completion:(id)a5;
- (void)_subscribeEventMonitor:(id)a3;
- (void)_subscribeEventMonitors;
- (void)_unsubscribeEventMonitors;
- (void)dealloc;
- (void)gestureMonitorDidReceiveSleepGesture:(id)a3 timestamp:(double)a4;
- (void)gestureMonitorDidReceiveWakeGesture:(id)a3 timestamp:(double)a4;
- (void)phoenixDeviceLockMonitor:(id)a3 didReceiveDeviceLockStateChanged:(BOOL)a4 timestamp:(double)a5;
- (void)phoenixDisplayStatusMonitor:(id)a3 didReceiveDisplayStateChanged:(BOOL)a4 timestamp:(double)a5;
- (void)phoenixEventMonitorDidReceiveEvent:(id)a3;
- (void)setDeviceLocked:(BOOL)a3;
- (void)setDisplayOn:(BOOL)a3;
- (void)setIsHandHeld:(BOOL)a3;
- (void)setLastDeviceLockedTimestamp:(double)a3;
- (void)setLastDeviceUnlockedTimestamp:(double)a3;
- (void)setLastDismissalTimestamp:(double)a3;
- (void)setLastDisplayOffTimestamp:(double)a3;
- (void)setLastDisplayOnTimestamp:(double)a3;
- (void)setLastTouchInteractionGainTimestamp:(double)a3;
- (void)setLastTouchInteractionLossTimestamp:(double)a3;
- (void)setLastWakeGestureTimestamp:(double)a3;
- (void)setPolicyOption:(int)a3;
- (void)setTouchOn:(BOOL)a3;
- (void)setTouchOn:(BOOL)a3 timestamp:(double)a4;
- (void)shouldTriggerDoubleTapEventWithTapData:(id)a3 completion:(id)a4;
- (void)shouldTriggerTripleTapEventWithTapData:(id)a3 completion:(id)a4;
- (void)startWithCompletion:(id)a3;
- (void)stop;
@end

@implementation AXPhoenixMitigator

- (AXPhoenixMitigator)initWithDelegate:(id)a3 configuration:(id)a4
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  v4 = v25;
  v25 = 0;
  v22.receiver = v4;
  v22.super_class = (Class)AXPhoenixMitigator;
  v14 = [(AXPhoenixMitigator *)&v22 init];
  v25 = v14;
  objc_storeStrong((id *)&v25, v14);
  if (v14)
  {
    objc_storeStrong((id *)&v25->_delegate, location[0]);
    dispatch_queue_t v5 = dispatch_queue_create("Serial EventMonitor queue", 0);
    queue = v25->_queue;
    v25->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)(id)[MEMORY[0x263EFF980] array];
    monitors = v25->_monitors;
    v25->_monitors = v7;

    objc_storeStrong((id *)&v25->_configuration, v23);
    uint64_t v9 = [objc_alloc(MEMORY[0x263F22890]) initWithHIDTapIdentifier:@"BackTapEventTap" HIDEventTapPriority:36 systemEventTapIdentifier:0 systemEventTapPriority:0];
    eventProcessor = v25->_eventProcessor;
    v25->_eventProcessor = (AXEventProcessor *)v9;

    [(AXEventProcessor *)v25->_eventProcessor setHIDEventFilterMask:1];
    objc_initWeak(&v21, v25);
    uint64_t v15 = MEMORY[0x263EF8330];
    int v16 = -1073741824;
    int v17 = 0;
    v18 = __53__AXPhoenixMitigator_initWithDelegate_configuration___block_invoke;
    v19 = &unk_264CCDFA0;
    objc_copyWeak(&v20, &v21);
    [(AXEventProcessor *)v25->_eventProcessor setHIDEventHandler:&v15];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v21);
  }
  v12 = v25;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v12;
}

uint64_t __53__AXPhoenixMitigator_initWithDelegate_configuration___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13[1] = a1;
  v13[0] = objc_loadWeakRetained(a1 + 4);
  if ([location[0] isTouchDown])
  {
    uint64_t v2 = mach_absolute_time();
    [v13[0] setTouchOn:1 timestamp:MachAbsoluteTimeToTimeIntervalSinceBoot(v2)];
  }
  else
  {
    id v8 = (id)[location[0] handInfo];
    __int16 v3 = [v8 initialFingerCount];
    if (v4 | (v3 == 0)) {
      char v5 = 1;
    }
    else {
      char v5 = 0;
    }
    char v11 = 0;
    BOOL v9 = 0;
    if ((v5 & 1) == 0)
    {
      id v12 = (id)[location[0] handInfo];
      char v11 = 1;
      BOOL v9 = (unsigned __int16)[v12 currentFingerCount] == 0;
    }
    if (v11) {

    }
    if (v9)
    {
      uint64_t v6 = mach_absolute_time();
      [v13[0] setTouchOn:0 timestamp:MachAbsoluteTimeToTimeIntervalSinceBoot(v6)];
    }
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (void)startWithCompletion:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v11, v13);
  queue = v13->_queue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __42__AXPhoenixMitigator_startWithCompletion___block_invoke;
  id v8 = &unk_264CCDFC8;
  objc_copyWeak(&v10, &v11);
  id v9 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(location, 0);
}

void __42__AXPhoenixMitigator_startWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v7[2] = (id)a1;
  v7[1] = (id)a1;
  v7[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7[0])
  {
    id location = (id)AXLogBackTap();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[AXPhoenixMitigator startWithCompletion:]_block_invoke");
      _os_log_impl(&dword_2372C8000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Subscribe to event monitors...", v10, 0xCu);
    }
    objc_storeStrong(&location, 0);
    [v7[0] _subscribeEventMonitors];
    [*((id *)v7[0] + 6) beginHandlingHIDEventsForReason:@"BackTapEventTap"];
    *((unsigned char *)v7[0] + 40) = 1;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v1 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    id v9 = @"Nil instance starting mitigator";
    id v4 = (id)[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v3 = (id)objc_msgSend(v1, "errorWithDomain:code:userInfo:", @"AXPhoenixErrorDomain", 1001);
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  objc_storeStrong(v7, 0);
}

- (void)stop
{
  id v10 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  queue = v10->_queue;
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __26__AXPhoenixMitigator_stop__block_invoke;
  v7 = &unk_264CCDFF0;
  objc_copyWeak(&v8, location);
  dispatch_async(queue, &v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(location);
}

void __26__AXPhoenixMitigator_stop__block_invoke(id *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v3, (uint64_t)"-[AXPhoenixMitigator stop]_block_invoke");
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Unsubscribe to event monitors...", v3, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [location[0] _unsubscribeEventMonitors];
    [*((id *)location[0] + 6) endHandlingHIDEventsForReason:@"BackTapEventTap"];
    *((unsigned char *)location[0] + 40) = 0;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isRunning
{
  int v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = self->_queue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __31__AXPhoenixMitigator_isRunning__block_invoke;
  id v9 = &unk_264CCE018;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __31__AXPhoenixMitigator_isRunning__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40) & 1;
  return result;
}

- (void)shouldTriggerDoubleTapEventWithTapData:(id)a3 completion:(id)a4
{
  $01BB1521EC52D44A8E7628F5261DCEC8 v6 = a3;
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  -[AXPhoenixMitigator _shouldTriggerEventWithTapData:isDoubleTap:completion:](v5, "_shouldTriggerEventWithTapData:isDoubleTap:completion:", 1, location[0], v6.var0, v6.var1, v6.var2, v6.var3);
  objc_storeStrong(location, 0);
}

- (void)shouldTriggerTripleTapEventWithTapData:(id)a3 completion:(id)a4
{
  $01BB1521EC52D44A8E7628F5261DCEC8 v6 = a3;
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  -[AXPhoenixMitigator _shouldTriggerEventWithTapData:isDoubleTap:completion:](v5, "_shouldTriggerEventWithTapData:isDoubleTap:completion:", 0, location[0], v6.var0, v6.var1, v6.var2, v6.var3);
  objc_storeStrong(location, 0);
}

- (void)_shouldTriggerEventWithTapData:(id)a3 isDoubleTap:(BOOL)a4 completion:(id)a5
{
  $01BB1521EC52D44A8E7628F5261DCEC8 v16 = a3;
  char v15 = self;
  SEL v14 = a2;
  BOOL v13 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  BOOL v11 = 0;
  BOOL v11 = ![(AXPhoenixMitigatorConfiguration *)v15->_configuration disableWhenDisplayOff];
  BOOL v10 = 0;
  BOOL v10 = ![(AXPhoenixMitigatorConfiguration *)v15->_configuration disableWhenDeviceLocked];
  char v9 = 0;
  id v8 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([(AXPhoenixMitigatorConfiguration *)v15->_configuration disableWhenDisplayOff])
  {
    if ([(AXPhoenixMitigator *)v15 displayOn] && v15->_lastDisplayOnTimestamp < v16.var1) {
      BOOL v11 = 1;
    }
    else {
      [v8 appendString:@"Display off"];
    }
  }
  if ([(AXPhoenixMitigatorConfiguration *)v15->_configuration disableWhenDeviceLocked])
  {
    if ([(AXPhoenixMitigator *)v15 deviceLocked] || v15->_lastDeviceUnlockedTimestamp >= v16.var1) {
      [v8 appendString:@"Device locked"];
    }
    else {
      BOOL v10 = 1;
    }
  }
  double var2 = v16.var2;
  if (v16.var2 < 0.4 || (double var2 = v16.var3, v16.var3 < 0.4)) {
    objc_msgSend(v8, "appendString:", @"Tapped too light", var2);
  }
  if ([(AXPhoenixMitigator *)v15 touchOn])
  {
    char v9 = 1;
    [v8 appendFormat:@"Touch on"];
  }
  BOOL v7 = [v8 length] == 0;
  if (location)
  {
    id v6 = [(AXPhoenixMitigator *)v15 _contextInfo:v13];
    [v6 setObject:v8 forKey:@"reason"];
    (*((void (**)(id, BOOL, id, id))location + 2))(location, v7, v6, v8);
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

- (id)configuration
{
  return self->_configuration;
}

- (void)dealloc
{
  char v4 = self;
  SEL v3 = a2;
  [(AXPhoenixMitigator *)self _unsubscribeEventMonitors];
  [(AXEventProcessor *)v4->_eventProcessor cleanup];
  [(AXEventProcessor *)v4->_eventProcessor endHandlingHIDEventsForReason:@"BackTapEventTap"];
  v2.receiver = v4;
  v2.super_class = (Class)AXPhoenixMitigator;
  [(AXPhoenixMitigator *)&v2 dealloc];
}

- (void)setIsHandHeld:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  if (self->_isHandHeld != a3)
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (id)[NSNumber numberWithBool:v10->_isHandHeld];
      id v5 = (id)[NSNumber numberWithBool:v8];
      id v4 = (id)[NSNumber numberWithDouble:v10->_lastWakeGestureTimestamp];
      id v3 = (id)[NSNumber numberWithDouble:v10->_lastDismissalTimestamp];
      __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixMitigator setIsHandHeld:]", (uint64_t)v6, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s IsHandHeld: %@ -> %@ (lastWake %@, lastSleep %@)", v11, 0x34u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v10->_isHandHeld = v8;
  }
}

- (void)setDisplayOn:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (id)[NSNumber numberWithBool:v10->_displayOn];
    id v5 = (id)[NSNumber numberWithBool:v8];
    id v4 = (id)[NSNumber numberWithDouble:v10->_lastDisplayOnTimestamp];
    id v3 = (id)[NSNumber numberWithDouble:v10->_lastDisplayOffTimestamp];
    __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixMitigator setDisplayOn:]", (uint64_t)v6, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s DisplayOn: %@ -> %@ (lastDisplayOn %@, lastDisplayOff %@)", v11, 0x34u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v10->_displayOn = v8;
  if (objc_opt_respondsToSelector()) {
    [(AXPhoenixMitigatorDelegate *)v10->_delegate phoenixMitigator:v10 displayOnDidChange:v8];
  }
}

- (void)setDeviceLocked:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  if (self->_deviceLocked != a3)
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (id)[NSNumber numberWithBool:v10->_deviceLocked];
      id v5 = (id)[NSNumber numberWithBool:v8];
      id v4 = (id)[NSNumber numberWithDouble:v10->_lastDeviceLockedTimestamp];
      id v3 = (id)[NSNumber numberWithDouble:v10->_lastDeviceUnlockedTimestamp];
      __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixMitigator setDeviceLocked:]", (uint64_t)v6, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s DeviceLocked: %@ -> %@ (lastDeviceLocked %@, lastDeviceUnlocked %@)", v11, 0x34u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v10->_deviceLocked = v8;
  }
}

- (void)setTouchOn:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  if (self->_touchOn != a3)
  {
    [(AXPhoenixMitigatorDelegate *)v10->_delegate phoenixMitigator:v10 touchOnDidChange:v8];
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      id v6 = (id)[NSNumber numberWithBool:v10->_touchOn];
      id v5 = (id)[NSNumber numberWithBool:v8];
      id v4 = (id)[NSNumber numberWithDouble:v10->_lastTouchInteractionGainTimestamp];
      id v3 = (id)[NSNumber numberWithDouble:v10->_lastTouchInteractionLossTimestamp];
      __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v11, (uint64_t)"-[AXPhoenixMitigator setTouchOn:]", (uint64_t)v6, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s TouchOn: %@ -> %@ (gained %@, lost %@)", v11, 0x34u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v10->_touchOn = v8;
  }
}

- (id)_contextInfo:(BOOL)a3
{
  id v13[2] = *MEMORY[0x263EF8340];
  BOOL v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v12[0] = @"screenLocked";
  id v6 = (id)[NSNumber numberWithBool:self->_deviceLocked];
  v13[0] = v6;
  v12[1] = @"handHeld";
  id v5 = (id)[NSNumber numberWithBool:v11->_isHandHeld];
  v13[1] = v5;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v7 = (id)[v3 initWithDictionary:v8];
  objc_storeStrong(&v8, 0);
  return v7;
}

- (void)_subscribeEventMonitors
{
  id v4 = +[AXPhoenixWakeGestureMonitor sharedInstance];
  -[AXPhoenixMitigator _subscribeEventMonitor:](self, "_subscribeEventMonitor:");

  id v5 = +[AXPhoenixDeviceLockMonitor sharedInstance];
  -[AXPhoenixMitigator _subscribeEventMonitor:](self, "_subscribeEventMonitor:");

  if ([(AXPhoenixMitigatorConfiguration *)self->_configuration disableWhenDisplayOff])
  {
    objc_super v2 = +[AXPhoenixDisplayStatusMonitor sharedInstance];
    -[AXPhoenixMitigator _subscribeEventMonitor:](self, "_subscribeEventMonitor:");
  }
}

- (void)_subscribeEventMonitor:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    [location[0] addObserver:v4];
    [(NSMutableArray *)v4->_monitors addObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)_unsubscribeEventMonitors
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v12 = self;
  SEL v11 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v12->_monitors;
  uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    uint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      objc_msgSend(v10, "removeObserver:", v12, v6);
      ++v5;
      uint64_t v6 = v2;
      if (v3 + 1 >= v2)
      {
        uint64_t v5 = 0;
        uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  [(NSMutableArray *)v12->_monitors removeAllObjects];
}

- (void)phoenixEventMonitorDidReceiveEvent:(id)a3
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v10, v12);
  queue = v12->_queue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __57__AXPhoenixMitigator_phoenixEventMonitorDidReceiveEvent___block_invoke;
  uint64_t v8 = &unk_264CCDFF0;
  objc_copyWeak(&v9, &v10);
  dispatch_async(queue, &v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v10);
  objc_storeStrong(location, 0);
}

void __57__AXPhoenixMitigator_phoenixEventMonitorDidReceiveEvent___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  objc_storeStrong(location, 0);
}

- (void)setTouchOn:(BOOL)a3 timestamp:(double)a4
{
  BOOL v4 = a3;
  if (a3) {
    [(AXPhoenixMitigator *)self setLastTouchInteractionGainTimestamp:a4];
  }
  else {
    [(AXPhoenixMitigator *)self setLastTouchInteractionLossTimestamp:a4];
  }
  [(AXPhoenixMitigator *)self setTouchOn:v4];
}

- (void)phoenixDeviceLockMonitor:(id)a3 didReceiveDeviceLockStateChanged:(BOOL)a4 timestamp:(double)a5
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v17 = a4;
  double v16 = a5;
  objc_initWeak(&v15, v19);
  queue = v19->_queue;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  SEL v11 = __90__AXPhoenixMitigator_phoenixDeviceLockMonitor_didReceiveDeviceLockStateChanged_timestamp___block_invoke;
  uint64_t v12 = &unk_264CCE040;
  objc_copyWeak(v13, &v15);
  BOOL v14 = v17;
  v13[1] = *(id *)&v16;
  dispatch_async(queue, &v8);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_storeStrong(location, 0);
}

void __90__AXPhoenixMitigator_phoenixDeviceLockMonitor_didReceiveDeviceLockStateChanged_timestamp___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (location[0])
  {
    if (*(unsigned char *)(a1 + 48)) {
      [location[0] setLastDeviceLockedTimestamp:*(double *)(a1 + 40)];
    }
    else {
      [location[0] setLastDeviceUnlockedTimestamp:*(double *)(a1 + 40)];
    }
    [location[0] setDeviceLocked:*(unsigned char *)(a1 + 48) & 1];
  }
  objc_storeStrong(location, 0);
}

- (void)phoenixDisplayStatusMonitor:(id)a3 didReceiveDisplayStateChanged:(BOOL)a4 timestamp:(double)a5
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v17 = a4;
  double v16 = a5;
  objc_initWeak(&v15, v19);
  queue = v19->_queue;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  SEL v11 = __90__AXPhoenixMitigator_phoenixDisplayStatusMonitor_didReceiveDisplayStateChanged_timestamp___block_invoke;
  uint64_t v12 = &unk_264CCE040;
  objc_copyWeak(v13, &v15);
  BOOL v14 = v17;
  v13[1] = *(id *)&v16;
  dispatch_async(queue, &v8);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_storeStrong(location, 0);
}

void __90__AXPhoenixMitigator_phoenixDisplayStatusMonitor_didReceiveDisplayStateChanged_timestamp___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (location[0])
  {
    if (*(unsigned char *)(a1 + 48)) {
      [location[0] setLastDisplayOnTimestamp:*(double *)(a1 + 40)];
    }
    else {
      [location[0] setLastDisplayOffTimestamp:*(double *)(a1 + 40)];
    }
    [location[0] setDisplayOn:*(unsigned char *)(a1 + 48) & 1];
  }
  objc_storeStrong(location, 0);
}

- (void)gestureMonitorDidReceiveWakeGesture:(id)a3 timestamp:(double)a4
{
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v14 = a4;
  objc_initWeak(&v13, v16);
  queue = v16->_queue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __68__AXPhoenixMitigator_gestureMonitorDidReceiveWakeGesture_timestamp___block_invoke;
  int v10 = &unk_264CCE068;
  objc_copyWeak(v12, &v13);
  v12[1] = *(id *)&v14;
  id v11 = location[0];
  dispatch_async(queue, &v6);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(location, 0);
}

void __68__AXPhoenixMitigator_gestureMonitorDidReceiveWakeGesture_timestamp___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (location[0])
  {
    [location[0] setLastWakeGestureTimestamp:*(double *)(a1 + 48)];
    objc_msgSend(location[0], "setIsHandHeld:", objc_msgSend(*(id *)(a1 + 32), "isDeviceHandheld") & 1);
  }
  objc_storeStrong(location, 0);
}

- (void)gestureMonitorDidReceiveSleepGesture:(id)a3 timestamp:(double)a4
{
  double v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v14 = a4;
  objc_initWeak(&v13, v16);
  queue = v16->_queue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __69__AXPhoenixMitigator_gestureMonitorDidReceiveSleepGesture_timestamp___block_invoke;
  int v10 = &unk_264CCE068;
  objc_copyWeak(v12, &v13);
  v12[1] = *(id *)&v14;
  id v11 = location[0];
  dispatch_async(queue, &v6);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(location, 0);
}

void __69__AXPhoenixMitigator_gestureMonitorDidReceiveSleepGesture_timestamp___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (location[0])
  {
    [location[0] setLastDismissalTimestamp:*(double *)(a1 + 48)];
    objc_msgSend(location[0], "setIsHandHeld:", objc_msgSend(*(id *)(a1 + 32), "isDeviceHandheld") & 1);
  }
  objc_storeStrong(location, 0);
}

- (int)policyOption
{
  return self->_policyOption;
}

- (void)setPolicyOption:(int)a3
{
  self->_policyOption = a3;
}

- (BOOL)isHandHeld
{
  return self->_isHandHeld;
}

- (double)lastWakeGestureTimestamp
{
  return self->_lastWakeGestureTimestamp;
}

- (void)setLastWakeGestureTimestamp:(double)a3
{
  self->_lastWakeGestureTimestamp = a3;
}

- (double)lastDismissalTimestamp
{
  return self->_lastDismissalTimestamp;
}

- (void)setLastDismissalTimestamp:(double)a3
{
  self->_lastDismissalTimestamp = a3;
}

- (BOOL)touchOn
{
  return self->_touchOn;
}

- (double)lastTouchInteractionGainTimestamp
{
  return self->_lastTouchInteractionGainTimestamp;
}

- (void)setLastTouchInteractionGainTimestamp:(double)a3
{
  self->_lastTouchInteractionGainTimestamp = a3;
}

- (double)lastTouchInteractionLossTimestamp
{
  return self->_lastTouchInteractionLossTimestamp;
}

- (void)setLastTouchInteractionLossTimestamp:(double)a3
{
  self->_lastTouchInteractionLossTimestamp = a3;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

- (double)lastDisplayOnTimestamp
{
  return self->_lastDisplayOnTimestamp;
}

- (void)setLastDisplayOnTimestamp:(double)a3
{
  self->_lastDisplayOnTimestamp = a3;
}

- (double)lastDisplayOffTimestamp
{
  return self->_lastDisplayOffTimestamp;
}

- (void)setLastDisplayOffTimestamp:(double)a3
{
  self->_lastDisplayOffTimestamp = a3;
}

- (BOOL)deviceLocked
{
  return self->_deviceLocked;
}

- (double)lastDeviceLockedTimestamp
{
  return self->_lastDeviceLockedTimestamp;
}

- (void)setLastDeviceLockedTimestamp:(double)a3
{
  self->_lastDeviceLockedTimestamp = a3;
}

- (double)lastDeviceUnlockedTimestamp
{
  return self->_lastDeviceUnlockedTimestamp;
}

- (void)setLastDeviceUnlockedTimestamp:(double)a3
{
  self->_lastDeviceUnlockedTimestamp = a3;
}

- (void).cxx_destruct
{
}

@end