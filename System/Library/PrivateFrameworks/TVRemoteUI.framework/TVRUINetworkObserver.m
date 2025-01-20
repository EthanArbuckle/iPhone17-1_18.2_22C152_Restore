@interface TVRUINetworkObserver
- (BOOL)isBluetoothAvailable;
- (BOOL)isNetworkReachable;
- (CBController)cbController;
- (OS_dispatch_queue)queue;
- (TVRUINetworkObserver)init;
- (WFClient)wifiClient;
- (WFWiFiStateMonitor)wifiStateMonitor;
- (id)bluetoothAvailabilityDidUpdate;
- (id)wifiStateUpdatedHandler;
- (void)_updateBluetoothAvailability:(BOOL)a3;
- (void)_wifiStateUpdatedWithOldState:(int64_t)a3 newState:(int64_t)a4;
- (void)dealloc;
- (void)setBluetoothAvailabilityDidUpdate:(id)a3;
- (void)setCbController:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWifiClient:(id)a3;
- (void)setWifiStateMonitor:(id)a3;
- (void)setWifiStateUpdatedHandler:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation TVRUINetworkObserver

- (TVRUINetworkObserver)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)TVRUINetworkObserver;
  v2 = [(TVRUINetworkObserver *)&v7 init];
  if (v2)
  {
    v3 = _TVRUINetworkObserverLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = @"com.apple.tvremote.network_observer";
      _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Setting up %@ background queue", buf, 0xCu);
    }

    dispatch_queue_t v4 = dispatch_queue_create((const char *)[@"com.apple.tvremote.network_observer" UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dealloc
{
  wifiStateMonitor = self->_wifiStateMonitor;
  if (wifiStateMonitor)
  {
    [(WFWiFiStateMonitor *)wifiStateMonitor stopMonitoring];
    dispatch_queue_t v4 = self->_wifiStateMonitor;
    self->_wifiStateMonitor = 0;
  }
  cbController = self->_cbController;
  if (cbController)
  {
    [(CBController *)cbController invalidate];
    v6 = self->_cbController;
    self->_cbController = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)TVRUINetworkObserver;
  [(TVRUINetworkObserver *)&v7 dealloc];
}

- (void)startObserving
{
  objc_initWeak(&location, self);
  v3 = [(TVRUINetworkObserver *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__TVRUINetworkObserver_startObserving__block_invoke;
  block[3] = &unk_264800468;
  objc_copyWeak(&v15, &location);
  dispatch_async(v3, block);

  dispatch_queue_t v4 = [(TVRUINetworkObserver *)self cbController];

  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFEF18]);
    [(TVRUINetworkObserver *)self setCbController:v5];

    v6 = [(TVRUINetworkObserver *)self queue];
    objc_super v7 = [(TVRUINetworkObserver *)self cbController];
    [v7 setDispatchQueue:v6];

    v8 = [(TVRUINetworkObserver *)self cbController];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__TVRUINetworkObserver_startObserving__block_invoke_2;
    v12[3] = &unk_264800E40;
    objc_copyWeak(&v13, &location);
    [v8 activateWithCompletion:v12];

    uint64_t v10 = MEMORY[0x263EF8330];
    objc_copyWeak(&v11, &location);
    v9 = [(TVRUINetworkObserver *)self cbController];
    [v9 setBluetoothStateChangedHandler:&v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __38__TVRUINetworkObserver_startObserving__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = _TVRUINetworkObserverLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "Observing Wi-Fi and Bluetooth changes", buf, 2u);
    }

    dispatch_queue_t v4 = [WeakRetained wifiClient];

    if (!v4)
    {
      if (objc_opt_class())
      {
        id v5 = objc_alloc_init(MEMORY[0x263F86340]);
        [WeakRetained setWifiClient:v5];
      }
      else
      {
        id v5 = _TVRUINetworkObserverLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          __38__TVRUINetworkObserver_startObserving__block_invoke_cold_1(v5);
        }
      }
    }
    v6 = [WeakRetained wifiStateMonitor];

    if (!v6)
    {
      objc_super v7 = _TVRUINetworkObserverLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Monitoring Wi-Fi state", buf, 2u);
      }

      id v8 = objc_alloc(MEMORY[0x263F86358]);
      v9 = [WeakRetained wifiClient];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __38__TVRUINetworkObserver_startObserving__block_invoke_4;
      v11[3] = &unk_264800E18;
      objc_copyWeak(&v12, v1);
      uint64_t v10 = (void *)[v8 initWithClient:v9 handler:v11];
      [WeakRetained setWifiStateMonitor:v10];

      objc_destroyWeak(&v12);
    }
  }
}

void __38__TVRUINetworkObserver_startObserving__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _wifiStateUpdatedWithOldState:a2 newState:a3];
}

void __38__TVRUINetworkObserver_startObserving__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = _TVRUINetworkObserverLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Monitoring Bluetooth state", v6, 2u);
  }

  if (v3)
  {
    id v5 = _TVRUINetworkObserverLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __38__TVRUINetworkObserver_startObserving__block_invoke_2_cold_1((uint64_t)v3, v5);
    }
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    [v5 _updateBluetoothAvailability:[v5 isBluetoothAvailable]];
  }
}

void __38__TVRUINetworkObserver_startObserving__block_invoke_9(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained cbController];
    uint64_t v4 = [v3 bluetoothState];

    id v5 = _TVRUINetworkObserverLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth state = %ld", (uint8_t *)&v6, 0xCu);
    }

    if (v4 != 1) {
      objc_msgSend(v2, "_updateBluetoothAvailability:", objc_msgSend(v2, "isBluetoothAvailable"));
    }
  }
}

- (void)stopObserving
{
  id v3 = [(TVRUINetworkObserver *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__TVRUINetworkObserver_stopObserving__block_invoke;
  block[3] = &unk_2647FFF70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__TVRUINetworkObserver_stopObserving__block_invoke(uint64_t a1)
{
  v2 = _TVRUINetworkObserverLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "Stop observing Wi-Fi and Bluetooth changes", v6, 2u);
  }

  id v3 = [*(id *)(a1 + 32) wifiStateMonitor];
  [v3 stopMonitoring];

  [*(id *)(a1 + 32) setWifiStateMonitor:0];
  uint64_t v4 = [*(id *)(a1 + 32) cbController];
  [v4 invalidate];

  return [*(id *)(a1 + 32) setCbController:0];
}

- (BOOL)isNetworkReachable
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TVRUINetworkObserver *)self wifiStateMonitor];

  if (v3)
  {
    uint64_t v4 = [(WFWiFiStateMonitor *)self->_wifiStateMonitor state];
    LODWORD(v3) = v4 == 4;
    id v5 = _TVRUINetworkObserverLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = @"not associated";
      if (v4 == 4) {
        int v6 = @"associated";
      }
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi is %@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (+[TVRUIFeatures isAWDLEnabled]) {
    LODWORD(v3) = v3 | [(TVRUINetworkObserver *)self isBluetoothAvailable];
  }
  uint64_t v7 = _TVRUINetworkObserverLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"unreachable";
    if (v3) {
      uint64_t v8 = @"reachable";
    }
    int v10 = 138412290;
    id v11 = v8;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Network is %@", (uint8_t *)&v10, 0xCu);
  }

  return v3;
}

- (BOOL)isBluetoothAvailable
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TVRUINetworkObserver *)self cbController];

  if (v3)
  {
    uint64_t v4 = [(TVRUINetworkObserver *)self cbController];
    uint64_t v5 = [v4 bluetoothState];

    BOOL v7 = v5 == 5 || v5 == 10;
    uint64_t v8 = _TVRUINetworkObserverLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Bluetooth available = %d", (uint8_t *)v10, 8u);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_wifiStateUpdatedWithOldState:(int64_t)a3 newState:(int64_t)a4
{
  BOOL v7 = [(TVRUINetworkObserver *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__TVRUINetworkObserver__wifiStateUpdatedWithOldState_newState___block_invoke;
  block[3] = &unk_264800E90;
  void block[5] = a4;
  block[6] = a3;
  void block[4] = self;
  dispatch_async(v7, block);
}

void __63__TVRUINetworkObserver__wifiStateUpdatedWithOldState_newState___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 40) != *(void *)(a1 + 48))
  {
    v2 = _TVRUINetworkObserverLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WFWiFiStateMonitorStringForState();
      uint64_t v4 = WFWiFiStateMonitorStringForState();
      *(_DWORD *)buf = 138412546;
      int v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_227326000, v2, OS_LOG_TYPE_DEFAULT, "Wi-Fi %@ -> %@", buf, 0x16u);
    }
    unint64_t v5 = *(void *)(a1 + 40) - 2;
    if (v5 > 3) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_2273F4348[v5];
    }
    BOOL v7 = [*(id *)(a1 + 32) wifiStateUpdatedHandler];

    if (v7)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __63__TVRUINetworkObserver__wifiStateUpdatedWithOldState_newState___block_invoke_23;
      v8[3] = &unk_264800E68;
      v8[4] = *(void *)(a1 + 32);
      v8[5] = v6;
      dispatch_async(MEMORY[0x263EF83A0], v8);
    }
  }
}

void __63__TVRUINetworkObserver__wifiStateUpdatedWithOldState_newState___block_invoke_23(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) wifiStateUpdatedHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)_updateBluetoothAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(TVRUINetworkObserver *)self bluetoothAvailabilityDidUpdate];

  if (v5)
  {
    uint64_t v6 = _TVRUINetworkObserverLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = @"unavailable";
      if (v3) {
        BOOL v7 = @"available";
      }
      *(_DWORD *)buf = 138412290;
      __int16 v11 = v7;
      _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth availability changed to %@", buf, 0xCu);
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__TVRUINetworkObserver__updateBluetoothAvailability___block_invoke;
    v8[3] = &unk_264800DF0;
    v8[4] = self;
    BOOL v9 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

void __53__TVRUINetworkObserver__updateBluetoothAvailability___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bluetoothAvailabilityDidUpdate];
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));
}

- (id)wifiStateUpdatedHandler
{
  return self->_wifiStateUpdatedHandler;
}

- (void)setWifiStateUpdatedHandler:(id)a3
{
}

- (id)bluetoothAvailabilityDidUpdate
{
  return self->_bluetoothAvailabilityDidUpdate;
}

- (void)setBluetoothAvailabilityDidUpdate:(id)a3
{
}

- (CBController)cbController
{
  return self->_cbController;
}

- (void)setCbController:(id)a3
{
}

- (WFWiFiStateMonitor)wifiStateMonitor
{
  return self->_wifiStateMonitor;
}

- (void)setWifiStateMonitor:(id)a3
{
}

- (WFClient)wifiClient
{
  return self->_wifiClient;
}

- (void)setWifiClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wifiClient, 0);
  objc_storeStrong((id *)&self->_wifiStateMonitor, 0);
  objc_storeStrong((id *)&self->_cbController, 0);
  objc_storeStrong(&self->_bluetoothAvailabilityDidUpdate, 0);
  objc_storeStrong(&self->_wifiStateUpdatedHandler, 0);
}

void __38__TVRUINetworkObserver_startObserving__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "WiFIKit not available", v1, 2u);
}

void __38__TVRUINetworkObserver_startObserving__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_227326000, a2, OS_LOG_TYPE_ERROR, "Failed to activate BLE Controller: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end