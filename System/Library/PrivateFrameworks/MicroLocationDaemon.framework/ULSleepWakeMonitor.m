@interface ULSleepWakeMonitor
+ (id)_eventFromCUSleepWakeState:(int)a3;
- (CUSleepWakeMonitor)sleepWakeMonitor;
- (id)latestEventAfterAddingObserverForEventName:(id)a3;
- (void)setSleepWakeMonitor:(id)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULSleepWakeMonitor

- (void)startMonitoring:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "ULSleepWakeMonitor, startMonitoring", (uint8_t *)buf, 2u);
  }
  v7 = objc_opt_new();
  [(ULSleepWakeMonitor *)self setSleepWakeMonitor:v7];

  v8 = [(ULEventMonitor *)self queue];
  v9 = [(ULSleepWakeMonitor *)self sleepWakeMonitor];
  [v9 setDispatchQueue:v8];

  v10 = [(ULSleepWakeMonitor *)self sleepWakeMonitor];
  [v10 setLabel:@"com.apple.milod.ULSleepWakeMonitor"];

  objc_initWeak(buf, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__ULSleepWakeMonitor_startMonitoring___block_invoke;
  v13[3] = &unk_2653F8FF8;
  objc_copyWeak(&v14, buf);
  v11 = [(ULSleepWakeMonitor *)self sleepWakeMonitor];
  [v11 setSleepWakeHandler:v13];

  v12 = [(ULSleepWakeMonitor *)self sleepWakeMonitor];
  [v12 activateWithCompletion:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

void __38__ULSleepWakeMonitor_startMonitoring___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = [(id)objc_opt_class() _eventFromCUSleepWakeState:a2];
  [WeakRetained postEvent:v7];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v8 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = ULSleepWakeStateToString([v7 sleepWakeState]);
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, "ULSleepWakeMonitor, sleep state = %@", (uint8_t *)&v11, 0xCu);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (void)stopMonitoring:(id)a3
{
  id v4 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "ULSleepWakeMonitor, stopMonitoring", v7, 2u);
  }
  v6 = [(ULSleepWakeMonitor *)self sleepWakeMonitor];
  [v6 invalidate];

  [(ULSleepWakeMonitor *)self setSleepWakeMonitor:0];
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  return 0;
}

+ (id)_eventFromCUSleepWakeState:(int)a3
{
  id v4 = objc_opt_new();
  v5 = v4;
  if (a3 == 50) {
    unsigned int v6 = 50;
  }
  else {
    unsigned int v6 = 0;
  }
  if (a3 == 40) {
    unsigned int v6 = 40;
  }
  if (a3 == 30) {
    unsigned int v6 = 30;
  }
  if (a3 == 20) {
    unsigned int v7 = 20;
  }
  else {
    unsigned int v7 = 0;
  }
  if (a3 == 10) {
    unsigned int v7 = 10;
  }
  if (a3 <= 29) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v6;
  }
  [v4 setSleepWakeState:v8];
  return v5;
}

- (CUSleepWakeMonitor)sleepWakeMonitor
{
  return self->_sleepWakeMonitor;
}

- (void)setSleepWakeMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end