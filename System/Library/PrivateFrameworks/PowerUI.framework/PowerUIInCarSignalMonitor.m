@interface PowerUIInCarSignalMonitor
+ (id)monitorWithDelegate:(id)a3;
- (BOOL)carplayConnected;
- (BOOL)inCar;
- (BOOL)navigationStarted;
- (BOOL)vehicleConnected;
- (CARSessionStatus)sessionStatus;
- (OS_os_log)log;
- (PowerUIInCarSignalMonitor)initWithDelegate:(id)a3;
- (PowerUISignalMonitorDelegate)delegate;
- (id)requiredFullChargeDate;
- (unint64_t)signalID;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCarplayConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInCar:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setNavigationStarted:(BOOL)a3;
- (void)setSessionStatus:(id)a3;
- (void)setVehicleConnected:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation PowerUIInCarSignalMonitor

- (PowerUIInCarSignalMonitor)initWithDelegate:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PowerUIInCarSignalMonitor;
  v6 = [(PowerUIInCarSignalMonitor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    os_log_t v8 = os_log_create("com.apple.powerui.signals", "inCar");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;
  }
  return v7;
}

- (void)sessionDidConnect:(id)a3
{
  BOOL v4 = [(PowerUIInCarSignalMonitor *)self inCar];
  id v5 = [(CARSessionStatus *)self->_sessionStatus currentSession];
  self->_carplayConnected = v5 != 0;

  if (v4 != [(PowerUIInCarSignalMonitor *)self inCar])
  {
    delegate = self->_delegate;
    id v7 = [MEMORY[0x263EFF910] distantFuture];
    [(PowerUISignalMonitorDelegate *)delegate monitor:self maySuggestNewFullChargeDeadline:v7];
  }
}

- (void)sessionDidDisconnect:(id)a3
{
  BOOL v4 = [(PowerUIInCarSignalMonitor *)self inCar];
  id v5 = [(CARSessionStatus *)self->_sessionStatus currentSession];
  self->_carplayConnected = v5 != 0;

  if (v4 != [(PowerUIInCarSignalMonitor *)self inCar])
  {
    delegate = self->_delegate;
    id v7 = [MEMORY[0x263EFF910] distantFuture];
    [(PowerUISignalMonitorDelegate *)delegate monitor:self maySuggestNewFullChargeDeadline:v7];
  }
}

+ (id)monitorWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithDelegate:v4];

  return v5;
}

- (unint64_t)signalID
{
  return 15;
}

- (id)requiredFullChargeDate
{
  return (id)[MEMORY[0x263EFF910] distantFuture];
}

- (void)startMonitoring
{
  int out_token = 0;
  v3 = (const char *)[@"com.apple.locationd.vehicle.connected" UTF8String];
  id v4 = dispatch_get_global_queue(-2, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke;
  handler[3] = &unk_2645A5CA8;
  handler[4] = self;
  notify_register_dispatch(v3, &out_token, v4, handler);

  uint64_t state64 = 0;
  notify_get_state(out_token, &state64);
  self->_vehicleConnected = state64 != 0;
  int v16 = 0;
  id v5 = (const char *)[@"com.apple.GeoServices.navigation.started" UTF8String];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_31;
  v15[3] = &unk_2645A5CA8;
  v15[4] = self;
  notify_register_dispatch(v5, &v16, v4, v15);

  notify_get_state(v16, &state64);
  self->_navigationStarted = state64 != 0;
  int v14 = 0;
  v6 = (const char *)[@"com.apple.locationd.vehicle.disconnected" UTF8String];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_35;
  v13[3] = &unk_2645A5CA8;
  v13[4] = self;
  notify_register_dispatch(v6, &v14, v4, v13);

  int v12 = 0;
  id v7 = (const char *)[@"com.apple.GeoServices.navigation.stopped" UTF8String];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_36;
  v11[3] = &unk_2645A5CA8;
  v11[4] = self;
  notify_register_dispatch(v7, &v12, v4, v11);

  os_log_t v8 = (CARSessionStatus *)[objc_alloc(MEMORY[0x263F30E50]) initAndWaitUntilSessionUpdated];
  sessionStatus = self->_sessionStatus;
  self->_sessionStatus = v8;

  [(CARSessionStatus *)self->_sessionStatus addSessionObserver:self];
  v10 = [(CARSessionStatus *)self->_sessionStatus currentSession];
  self->_carplayConnected = v10 != 0;
}

void __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) inCar];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  if (v2 != [*(id *)(a1 + 32) inCar])
  {
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = v3;
      v9[0] = 67109376;
      v9[1] = v2;
      __int16 v10 = 1024;
      int v11 = [v4 inCar];
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Previously: %u, Now: %u", (uint8_t *)v9, 0xEu);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    os_log_t v8 = [MEMORY[0x263EFF910] distantFuture];
    [v7 monitor:v6 maySuggestNewFullChargeDeadline:v8];
  }
}

void __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_31(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) inCar];
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
  if (v2 != [*(id *)(a1 + 32) inCar])
  {
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = v3;
      v9[0] = 67109376;
      v9[1] = v2;
      __int16 v10 = 1024;
      int v11 = [v4 inCar];
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Previously: %u, Now: %u", (uint8_t *)v9, 0xEu);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    os_log_t v8 = [MEMORY[0x263EFF910] distantFuture];
    [v7 monitor:v6 maySuggestNewFullChargeDeadline:v8];
  }
}

void __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_35(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) inCar];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  if (v2 != [*(id *)(a1 + 32) inCar])
  {
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = v3;
      v9[0] = 67109376;
      v9[1] = v2;
      __int16 v10 = 1024;
      int v11 = [v4 inCar];
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Previously: %u, Now: %u", (uint8_t *)v9, 0xEu);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    os_log_t v8 = [MEMORY[0x263EFF910] distantFuture];
    [v7 monitor:v6 maySuggestNewFullChargeDeadline:v8];
  }
}

void __44__PowerUIInCarSignalMonitor_startMonitoring__block_invoke_36(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) inCar];
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  if (v2 != [*(id *)(a1 + 32) inCar])
  {
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = v3;
      v9[0] = 67109376;
      v9[1] = v2;
      __int16 v10 = 1024;
      int v11 = [v4 inCar];
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Previously: %u, Now: %u", (uint8_t *)v9, 0xEu);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    os_log_t v8 = [MEMORY[0x263EFF910] distantFuture];
    [v7 monitor:v6 maySuggestNewFullChargeDeadline:v8];
  }
}

- (void)stopMonitoring
{
}

- (BOOL)inCar
{
  return self->_vehicleConnected || self->_navigationStarted || self->_carplayConnected;
}

- (void)setInCar:(BOOL)a3
{
  self->_inCar = a3;
}

- (BOOL)vehicleConnected
{
  return self->_vehicleConnected;
}

- (void)setVehicleConnected:(BOOL)a3
{
  self->_vehicleConnected = a3;
}

- (BOOL)navigationStarted
{
  return self->_navigationStarted;
}

- (void)setNavigationStarted:(BOOL)a3
{
  self->_navigationStarted = a3;
}

- (BOOL)carplayConnected
{
  return self->_carplayConnected;
}

- (void)setCarplayConnected:(BOOL)a3
{
  self->_carplayConnected = a3;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end