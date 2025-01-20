@interface ULAirplaneModeMonitor
- (BOOL)_checkAirplaneMode;
- (BOOL)airplaneMode;
- (RadiosPreferences)radiosPref;
- (id)latestEventAfterAddingObserverForEventName:(id)a3;
- (void)airplaneModeChanged;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setRadiosPref:(id)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULAirplaneModeMonitor

- (void)startMonitoring:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(MEMORY[0x263F255D8]);
  v7 = [(ULEventMonitor *)self queue];
  v8 = (void *)[v6 initWithQueue:v7];
  [(ULAirplaneModeMonitor *)self setRadiosPref:v8];

  v9 = [(ULAirplaneModeMonitor *)self radiosPref];
  [v9 setDelegate:self];

  [(ULAirplaneModeMonitor *)self setAirplaneMode:[(ULAirplaneModeMonitor *)self _checkAirplaneMode]];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_111);
  }
  v10 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    BOOL v12 = [(ULAirplaneModeMonitor *)self airplaneMode];
    v13 = @"NO";
    if (v12) {
      v13 = @"YES";
    }
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, airplaneMode: %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)stopMonitoring:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_111);
  }
  id v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }
  v7 = [(ULAirplaneModeMonitor *)self radiosPref];
  [v7 setDelegate:0];

  [(ULAirplaneModeMonitor *)self setRadiosPref:0];
  [(ULAirplaneModeMonitor *)self setAirplaneMode:0];
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
    int v8 = objc_alloc_init(ULAirplaneModeMonitorEventAirplaneMode);
    [(ULAirplaneModeMonitorEventAirplaneMode *)v8 setAirplaneMode:[(ULAirplaneModeMonitor *)self airplaneMode]];
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (BOOL)_checkAirplaneMode
{
  v2 = [(ULAirplaneModeMonitor *)self radiosPref];
  char v3 = [v2 airplaneMode];

  return v3;
}

- (void)airplaneModeChanged
{
  char v3 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(ULAirplaneModeMonitor *)self _checkAirplaneMode];
  if (v4 != [(ULAirplaneModeMonitor *)self airplaneMode])
  {
    [(ULAirplaneModeMonitor *)self setAirplaneMode:v4];
    v5 = objc_alloc_init(ULAirplaneModeMonitorEventAirplaneMode);
    [(ULAirplaneModeMonitorEventAirplaneMode *)v5 setAirplaneMode:v4];
    [(ULEventMonitor *)self postEvent:v5];
  }
}

- (RadiosPreferences)radiosPref
{
  return self->_radiosPref;
}

- (void)setRadiosPref:(id)a3
{
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_airplaneMode = a3;
}

- (void).cxx_destruct
{
}

@end