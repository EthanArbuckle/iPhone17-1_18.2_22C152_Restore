@interface ULBluetoothMonitor
- (BOOL)_checkPowerOnForBluetoothState:(int64_t)a3;
- (BOOL)powerOn;
- (CBController)controller;
- (id)latestEventAfterAddingObserverForEventName:(id)a3;
- (void)_bluetoothStateChangeHandler;
- (void)_invalidationHandler;
- (void)setController:(id)a3;
- (void)setPowerOn:(BOOL)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULBluetoothMonitor

- (void)startMonitoring:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = objc_opt_new();
  [(ULBluetoothMonitor *)self setController:v6];

  v7 = [(ULEventMonitor *)self queue];
  v8 = [(ULBluetoothMonitor *)self controller];
  [v8 setDispatchQueue:v7];

  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __38__ULBluetoothMonitor_startMonitoring___block_invoke;
  v21[3] = &unk_2653F9200;
  objc_copyWeak(&v22, &location);
  v9 = [(ULBluetoothMonitor *)self controller];
  [v9 setInvalidationHandler:v21];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __38__ULBluetoothMonitor_startMonitoring___block_invoke_6;
  v19[3] = &unk_2653F9200;
  objc_copyWeak(&v20, &location);
  v10 = [(ULBluetoothMonitor *)self controller];
  [v10 setInterruptionHandler:v19];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __38__ULBluetoothMonitor_startMonitoring___block_invoke_7;
  v17[3] = &unk_2653F9200;
  objc_copyWeak(&v18, &location);
  v11 = [(ULBluetoothMonitor *)self controller];
  [v11 setBluetoothStateChangedHandler:v17];

  v12 = [(ULBluetoothMonitor *)self controller];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__ULBluetoothMonitor_startMonitoring___block_invoke_2;
  v15[3] = &unk_2653F9400;
  objc_copyWeak(&v16, &location);
  [v12 activateWithCompletion:v15];

  [(ULBluetoothMonitor *)self setPowerOn:1];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_12);
  }
  v13 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ULBluetoothMonitor powerOn](self, "powerOn"));
    *(_DWORD *)buf = 138412546;
    id v25 = v4;
    __int16 v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_DEFAULT, "[ULBluetoothMonitor]: Start monitoring: %@, powerOn: %@", buf, 0x16u);
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __38__ULBluetoothMonitor_startMonitoring___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_12);
    }
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_ERROR, "[ULBluetoothMonitor]: Invalidation called for bluetooth client", v3, 2u);
    }
    [WeakRetained _invalidationHandler];
  }
}

void __38__ULBluetoothMonitor_startMonitoring___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_12);
    }
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_ERROR, "[ULBluetoothMonitor]: Interruption called for bluetooth client", v3, 2u);
    }
  }
}

void __38__ULBluetoothMonitor_startMonitoring___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _bluetoothStateChangeHandler];
    id WeakRetained = v2;
  }
}

void __38__ULBluetoothMonitor_startMonitoring___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_12);
    }
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_ERROR, "[ULBluetoothMonitor]: activate with completion called with error: %@", (uint8_t *)&v6, 0xCu);
    }
    if (v3) {
      [WeakRetained _invalidationHandler];
    }
    else {
      [WeakRetained _bluetoothStateChangeHandler];
    }
  }
}

- (void)stopMonitoring:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_12);
  }
  int v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "[ULBluetoothMonitor]: Stop monitoring: %@", (uint8_t *)&v7, 0xCu);
  }
  [(ULBluetoothMonitor *)self _invalidationHandler];
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = +[ULEvent eventName];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    id v8 = objc_alloc_init(ULBluetoothMonitorEventPowerOn);
    [(ULBluetoothMonitorEventPowerOn *)v8 setPowerOn:[(ULBluetoothMonitor *)self powerOn]];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)_invalidationHandler
{
  id v3 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ULBluetoothMonitor *)self controller];
  [v4 invalidate];

  [(ULBluetoothMonitor *)self setController:0];
  [(ULBluetoothMonitor *)self setPowerOn:0];
}

- (void)_bluetoothStateChangeHandler
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ULBluetoothMonitor *)self controller];
  unint64_t v5 = [v4 bluetoothState];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_12);
  }
  int v6 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = NSString;
    if (v5 > 0xA) {
      id v8 = "?";
    }
    else {
      id v8 = off_2653F9420[v5];
    }
    uint64_t v9 = v6;
    v10 = [v7 stringWithUTF8String:v8];
    int v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, "[ULBluetoothMonitor]: Bluetooth state: %@", (uint8_t *)&v13, 0xCu);
  }
  BOOL v11 = [(ULBluetoothMonitor *)self _checkPowerOnForBluetoothState:v5];
  if (v11 != [(ULBluetoothMonitor *)self powerOn])
  {
    [(ULBluetoothMonitor *)self setPowerOn:v11];
    v12 = objc_alloc_init(ULBluetoothMonitorEventPowerOn);
    [(ULBluetoothMonitorEventPowerOn *)v12 setPowerOn:[(ULBluetoothMonitor *)self powerOn]];
    [(ULEventMonitor *)self postEvent:v12];
  }
}

- (BOOL)_checkPowerOnForBluetoothState:(int64_t)a3
{
  return a3 == 5 || a3 == 10;
}

- (CBController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (BOOL)powerOn
{
  return self->_powerOn;
}

- (void)setPowerOn:(BOOL)a3
{
  self->_powerOn = a3;
}

- (void).cxx_destruct
{
}

@end