@interface ULBuddyMonitor
- (BOOL)_checkBuddyComplete;
- (BOOL)buddyComplete;
- (ULBuddyMonitor)init;
- (ULBuddyMonitor)initWithNotificationHelper:(id)a3;
- (ULDarwinNotificationHelper)notificationHelper;
- (id)latestEventAfterAddingObserverForEventName:(id)a3;
- (void)_handleBuddyCompleteNotification;
- (void)setBuddyComplete:(BOOL)a3;
- (void)setNotificationHelper:(id)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULBuddyMonitor

- (ULBuddyMonitor)init
{
  uint64_t v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_);
}

- (ULBuddyMonitor)initWithNotificationHelper:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULBuddyMonitor;
  v5 = [(ULEventMonitor *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ULBuddyMonitor *)v5 setNotificationHelper:v4];
  }

  return v6;
}

- (void)startMonitoring:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  [(ULBuddyMonitor *)self setBuddyComplete:[(ULBuddyMonitor *)self _checkBuddyComplete]];
  if (![(ULBuddyMonitor *)self buddyComplete])
  {
    objc_initWeak((id *)location, self);
    v6 = [(ULBuddyMonitor *)self notificationHelper];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __34__ULBuddyMonitor_startMonitoring___block_invoke;
    v11[3] = &unk_2653F9200;
    objc_copyWeak(&v12, (id *)location);
    [v6 addObserverForNotificationName:*MEMORY[0x263F67FC8] handler:v11];

    [(ULBuddyMonitor *)self setBuddyComplete:[(ULBuddyMonitor *)self _checkBuddyComplete]];
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_84);
  }
  v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = v7;
    BOOL v9 = [(ULBuddyMonitor *)self buddyComplete];
    v10 = @"NO";
    if (v9) {
      v10 = @"YES";
    }
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v4;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, buddyComplete: %@", location, 0x16u);
  }
}

void __34__ULBuddyMonitor_startMonitoring___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleBuddyCompleteNotification];
    id WeakRetained = v2;
  }
}

- (void)stopMonitoring:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(ULBuddyMonitor *)self notificationHelper];
  [v6 removeObserverForNotificationName:*MEMORY[0x263F67FC8]];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_84);
  }
  v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }
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
    int v8 = objc_alloc_init(ULBuddyMonitorEventBuddyComplete);
    [(ULBuddyMonitorEventBuddyComplete *)v8 setBuddyComplete:[(ULBuddyMonitor *)self buddyComplete]];
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (void)_handleBuddyCompleteNotification
{
  v3 = [(ULEventMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ULBuddyMonitor__handleBuddyCompleteNotification__block_invoke;
  block[3] = &unk_2653F91D8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __50__ULBuddyMonitor__handleBuddyCompleteNotification__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBuddyComplete:1];
  id v2 = objc_alloc_init(ULBuddyMonitorEventBuddyComplete);
  [(ULBuddyMonitorEventBuddyComplete *)v2 setBuddyComplete:1];
  [*(id *)(a1 + 32) postEvent:v2];
}

- (BOOL)_checkBuddyComplete
{
  return BYSetupAssistantNeedsToRun() ^ 1;
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (BOOL)buddyComplete
{
  return self->_buddyComplete;
}

- (void)setBuddyComplete:(BOOL)a3
{
  self->_buddyComplete = a3;
}

- (void).cxx_destruct
{
}

@end