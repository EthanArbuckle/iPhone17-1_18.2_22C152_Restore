@interface ULPrivacyMonitor
- (BOOL)_checkLocationServicesEnabledForAuthorizationStatus:(int)a3;
- (BOOL)locationServicesEnabled;
- (CLLocationManager)locationManager;
- (ULDarwinNotificationHelper)notificationHelper;
- (ULPrivacyMonitor)init;
- (ULPrivacyMonitor)initWithNotificationHelper:(id)a3;
- (id)_locationAuthorizationStatusToString:(int)a3;
- (id)latestEventAfterAddingObserverForEventName:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationServicesEnabled:(BOOL)a3;
- (void)setNotificationHelper:(id)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULPrivacyMonitor

- (ULPrivacyMonitor)init
{
  uint64_t v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULPrivacyMonitor)initWithNotificationHelper:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULPrivacyMonitor;
  v5 = [(ULEventMonitor *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ULPrivacyMonitor *)v5 setNotificationHelper:v4];
  }

  return v6;
}

- (void)startMonitoring:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(MEMORY[0x263F00A60]);
  v7 = [(ULEventMonitor *)self queue];
  objc_super v8 = (void *)[v6 initWithEffectiveBundlePath:@"/System/Library/LocationBundles/Routine.bundle" delegate:self onQueue:v7];
  [(ULPrivacyMonitor *)self setLocationManager:v8];

  [(ULPrivacyMonitor *)self setLocationServicesEnabled:1];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_121);
  }
  v9 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    BOOL v11 = [(ULPrivacyMonitor *)self locationServicesEnabled];
    v12 = @"NO";
    if (v11) {
      v12 = @"YES";
    }
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, locationServicesEnabled: %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)stopMonitoring:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_121);
  }
  id v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v7, 0xCu);
  }
  [(ULPrivacyMonitor *)self setLocationManager:0];
  [(ULPrivacyMonitor *)self setLocationServicesEnabled:0];
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[ULEvent eventName];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    id v8 = objc_alloc_init(ULPrivacyMonitorEventLocationServices);
    [(ULPrivacyMonitorEventLocationServices *)v8 setLocationServicesEnabled:[(ULPrivacyMonitor *)self locationServicesEnabled]];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (BOOL)_checkLocationServicesEnabledForAuthorizationStatus:(int)a3
{
  return a3 == 3;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (BOOL)locationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = [(ULPrivacyMonitor *)self locationManager];
  uint64_t v6 = [v5 authorizationStatus];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_121);
  }
  int v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = [(ULPrivacyMonitor *)self _locationAuthorizationStatusToString:v6];
    int v12 = 138412290;
    int v13 = v9;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "location manager did change auth status: %@", (uint8_t *)&v12, 0xCu);
  }
  BOOL v10 = [(ULPrivacyMonitor *)self _checkLocationServicesEnabledForAuthorizationStatus:v6];
  if (v10 != [(ULPrivacyMonitor *)self locationServicesEnabled])
  {
    [(ULPrivacyMonitor *)self setLocationServicesEnabled:v10];
    BOOL v11 = objc_alloc_init(ULPrivacyMonitorEventLocationServices);
    [(ULPrivacyMonitorEventLocationServices *)v11 setLocationServicesEnabled:v10];
    [(ULEventMonitor *)self postEvent:v11];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v6);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_121);
  }
  int v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_ERROR, "Location manager failed with error: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)_locationAuthorizationStatusToString:(int)a3
{
  if (a3 > 4) {
    return @"Unkown";
  }
  else {
    return off_2653FA368[a3];
  }
}

@end