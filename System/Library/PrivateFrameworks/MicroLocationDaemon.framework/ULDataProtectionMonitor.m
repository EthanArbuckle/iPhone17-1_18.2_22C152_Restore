@interface ULDataProtectionMonitor
- (BOOL)_checkDataAvailable;
- (BOOL)dataAvailable;
- (ULDarwinNotificationHelper)notificationHelper;
- (ULDataProtectionMonitor)init;
- (ULDataProtectionMonitor)initWithNotificationHelper:(id)a3;
- (id)latestEventAfterAddingObserverForEventName:(id)a3;
- (int)_checkHasContentProtection;
- (void)_handleKeyBagLockStatusChangeNotification;
- (void)setDataAvailable:(BOOL)a3;
- (void)setNotificationHelper:(id)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULDataProtectionMonitor

- (ULDataProtectionMonitor)init
{
  uint64_t v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULDataProtectionMonitor)initWithNotificationHelper:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULDataProtectionMonitor;
  v5 = [(ULEventMonitor *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ULDataProtectionMonitor *)v5 setNotificationHelper:v4];
  }

  return v6;
}

- (void)startMonitoring:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(ULDataProtectionMonitor *)self _checkHasContentProtection] == 1)
  {
    objc_initWeak((id *)location, self);
    v6 = [(ULDataProtectionMonitor *)self notificationHelper];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __43__ULDataProtectionMonitor_startMonitoring___block_invoke;
    v11[3] = &unk_2653F9200;
    objc_copyWeak(&v12, (id *)location);
    [v6 addObserverForNotificationName:@"com.apple.mobile.keybagd.lock_status" handler:v11];

    [(ULDataProtectionMonitor *)self setDataAvailable:[(ULDataProtectionMonitor *)self _checkDataAvailable]];
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
  }
  else
  {
    [(ULDataProtectionMonitor *)self setDataAvailable:1];
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  }
  v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = v7;
    BOOL v9 = [(ULDataProtectionMonitor *)self dataAvailable];
    v10 = @"NO";
    if (v9) {
      v10 = @"YES";
    }
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v4;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, dataAvailable: %@", location, 0x16u);
  }
}

void __43__ULDataProtectionMonitor_startMonitoring___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleKeyBagLockStatusChangeNotification];
    id WeakRetained = v2;
  }
}

- (void)stopMonitoring:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  }
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }
  v7 = [(ULDataProtectionMonitor *)self notificationHelper];
  [v7 removeObserverForNotificationName:@"com.apple.mobile.keybagd.lock_status"];

  [(ULDataProtectionMonitor *)self setDataAvailable:0];
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = +[ULEvent eventName];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    int v8 = objc_alloc_init(ULDataProtectionMonitorEventDataAvailable);
    [(ULDataProtectionMonitorEventDataAvailable *)v8 setDataAvailable:[(ULDataProtectionMonitor *)self dataAvailable]];
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (void)_handleKeyBagLockStatusChangeNotification
{
  v3 = [(ULEventMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ULDataProtectionMonitor__handleKeyBagLockStatusChangeNotification__block_invoke;
  block[3] = &unk_2653F91D8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __68__ULDataProtectionMonitor__handleKeyBagLockStatusChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _checkDataAvailable];
  if (v2 != [*(id *)(a1 + 32) dataAvailable])
  {
    [*(id *)(a1 + 32) setDataAvailable:v2];
    v3 = objc_alloc_init(ULDataProtectionMonitorEventDataAvailable);
    [(ULDataProtectionMonitorEventDataAvailable *)v3 setDataAvailable:v2];
    [*(id *)(a1 + 32) postEvent:v3];
  }
}

- (BOOL)_checkDataAvailable
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = MKBGetDeviceLockState();
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  }
  v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSNumber;
    v5 = v3;
    v6 = [v4 numberWithInt:v2];
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "Lock state: %@", (uint8_t *)&v9, 0xCu);
  }
  return v2 == 3 || v2 == 0;
}

- (int)_checkHasContentProtection
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = MKBDeviceFormattedForContentProtection();
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_95);
  }
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"YES";
    if (!v2) {
      id v4 = @"NO";
    }
    int v6 = 138412290;
    int v7 = v4;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "Init, content protection: %@", (uint8_t *)&v6, 0xCu);
  }
  return v2;
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (BOOL)dataAvailable
{
  return self->_dataAvailable;
}

- (void)setDataAvailable:(BOOL)a3
{
  self->_dataAvailable = a3;
}

- (void).cxx_destruct
{
}

@end