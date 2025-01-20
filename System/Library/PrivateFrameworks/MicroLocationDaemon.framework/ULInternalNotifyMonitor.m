@interface ULInternalNotifyMonitor
- (ULDarwinNotificationHelper)notificationHelper;
- (ULInternalNotifyMonitor)init;
- (ULInternalNotifyMonitor)initWithNotificationHelper:(id)a3;
- (id)_identifierFromEventName:(id)a3;
- (void)_handleNotificationForEventName:(id)a3;
- (void)_startMonitoringForEventName:(id)a3 identifier:(id)a4;
- (void)_stopMonitoringForEventName:(id)a3 identifier:(id)a4;
- (void)setNotificationHelper:(id)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULInternalNotifyMonitor

- (ULInternalNotifyMonitor)init
{
  uint64_t v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULInternalNotifyMonitor)initWithNotificationHelper:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULInternalNotifyMonitor;
  v5 = [(ULEventMonitor *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ULInternalNotifyMonitor *)v5 setNotificationHelper:v4];
  }

  return v6;
}

- (void)startMonitoring:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ULInternalNotifyMonitor *)self _identifierFromEventName:v4];
  [(ULInternalNotifyMonitor *)self _startMonitoringForEventName:v4 identifier:v6];
}

- (void)stopMonitoring:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ULInternalNotifyMonitor *)self _identifierFromEventName:v4];
  [(ULInternalNotifyMonitor *)self _stopMonitoringForEventName:v4 identifier:v6];
}

- (void)_startMonitoringForEventName:(id)a3 identifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_super v8 = [(ULInternalNotifyMonitor *)self notificationHelper];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__ULInternalNotifyMonitor__startMonitoringForEventName_identifier___block_invoke;
  v11[3] = &unk_2653F94F0;
  objc_copyWeak(&v13, &location);
  id v9 = v6;
  id v12 = v9;
  [v8 addObserverForNotificationName:v7 handler:v11];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_24);
  }
  v10 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v9;
    _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@", buf, 0xCu);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __67__ULInternalNotifyMonitor__startMonitoringForEventName_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleNotificationForEventName:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_stopMonitoringForEventName:(id)a3 identifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_24);
  }
  objc_super v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v10, 0xCu);
  }
  id v9 = [(ULInternalNotifyMonitor *)self notificationHelper];
  [v9 removeObserverForNotificationName:v7];
}

- (void)_handleNotificationForEventName:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__ULInternalNotifyMonitor__handleNotificationForEventName___block_invoke;
  v7[3] = &unk_2653F9228;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__ULInternalNotifyMonitor__handleNotificationForEventName___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(NSClassFromString(*(NSString **)(a1 + 32)));
  [*(id *)(a1 + 40) postEvent:v2];
}

- (id)_identifierFromEventName:(id)a3
{
  id v3 = a3;
  id v4 = +[ULEvent eventName];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = @"com.apple.milod.action-localize";
  }
  else
  {
    id v7 = +[ULEvent eventName];
    char v8 = [v3 isEqual:v7];

    if (v8)
    {
      id v6 = @"com.apple.milod.action-record";
    }
    else
    {
      id v9 = +[ULEvent eventName];
      char v10 = [v3 isEqual:v9];

      if (v10)
      {
        id v6 = @"com.apple.milod.action-purge";
      }
      else
      {
        id v11 = +[ULEvent eventName];
        int v12 = [v3 isEqual:v11];

        if (v12) {
          id v6 = @"com.apple.milod.action-settings-refresh";
        }
        else {
          id v6 = 0;
        }
      }
    }
  }

  return v6;
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end