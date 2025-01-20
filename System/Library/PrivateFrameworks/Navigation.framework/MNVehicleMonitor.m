@interface MNVehicleMonitor
- (MNVehicleMonitorDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation MNVehicleMonitor

- (void)dealloc
{
  [(MNVehicleMonitor *)self stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)MNVehicleMonitor;
  [(MNVehicleMonitor *)&v3 dealloc];
}

- (void)startMonitoring
{
  objc_super v3 = MNGetMNVehicleMonitorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Start monitoring vehicle connection.", (uint8_t *)buf, 2u);
  }

  v4 = dispatch_get_global_queue(21, 0);
  objc_initWeak(buf, self);
  v5 = (const char *)[ (id) *MEMORY[0x1E4F22300] UTF8String];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __35__MNVehicleMonitor_startMonitoring__block_invoke;
  handler[3] = &unk_1E60F7738;
  objc_copyWeak(&v12, buf);
  notify_register_dispatch(v5, &self->_vehicleConnectedToken, v4, handler);
  v6 = (const char *)[ (id) *MEMORY[0x1E4F22308] UTF8String];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__MNVehicleMonitor_startMonitoring__block_invoke_8;
  v8[3] = &unk_1E60F7788;
  v7 = v4;
  v9 = v7;
  objc_copyWeak(&v10, buf);
  notify_register_dispatch(v6, &self->_vehicleDisconnectedToken, v7, v8);
  self->_isMonitoring = 1;
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

void __35__MNVehicleMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = MNGetMNVehicleMonitorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "Received vehicle connected notification.", (uint8_t *)&v8, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      v9 = "-[MNVehicleMonitor startMonitoring]_block_invoke";
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_8;
  }
  id v5 = objc_loadWeakRetained(WeakRetained + 1);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = objc_loadWeakRetained(v4 + 1);
    [v7 vehicleMonitorDidConnectToVehicle:v4];
LABEL_8:
  }
}

void __35__MNVehicleMonitor_startMonitoring__block_invoke_8(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  objc_super v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MNVehicleMonitor_startMonitoring__block_invoke_2;
  block[3] = &unk_1E60F7760;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_after(v2, v3, block);
  objc_destroyWeak(&v5);
}

void __35__MNVehicleMonitor_startMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = +[MNCarPlayConnectionMonitor sharedInstance];
  int v3 = [v2 isConnected];

  v4 = MNGetMNVehicleMonitorLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Received vehicle disconnected notification.", (uint8_t *)&v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)&WeakRetained[1].isa);
      char v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0) {
        goto LABEL_12;
      }
      v9 = objc_loadWeakRetained((id *)&v4[1].isa);
      [v9 vehicleMonitorDidDisconnectFromVehicle:v4];
    }
    else
    {
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315138;
        v11 = "-[MNVehicleMonitor startMonitoring]_block_invoke";
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v10, 0xCu);
      }
    }

    goto LABEL_12;
  }
  if (v5)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_DEFAULT, "Received vehicle disconnected notification, but a CarPlay connection is still detected. Ignoring notification.", (uint8_t *)&v10, 2u);
  }
LABEL_12:
}

- (void)stopMonitoring
{
  if (self->_isMonitoring)
  {
    int v3 = MNGetMNVehicleMonitorLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Stop monitoring vehicle connection.", v6, 2u);
    }

    int vehicleConnectedToken = self->_vehicleConnectedToken;
    if (vehicleConnectedToken) {
      notify_cancel(vehicleConnectedToken);
    }
    int vehicleDisconnectedToken = self->_vehicleDisconnectedToken;
    if (vehicleDisconnectedToken) {
      notify_cancel(vehicleDisconnectedToken);
    }
    self->_isMonitoring = 0;
  }
}

- (MNVehicleMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNVehicleMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end