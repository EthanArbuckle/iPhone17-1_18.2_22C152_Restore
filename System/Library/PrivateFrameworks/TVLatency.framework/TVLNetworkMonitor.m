@interface TVLNetworkMonitor
- (BOOL)isMonitoring;
- (NSNetServiceBrowser)awdlServiceBrowser;
- (OS_dispatch_queue)monitorQueue;
- (OS_nw_path_monitor)awdl_monitor;
- (OS_nw_path_monitor)ethernet_monitor;
- (OS_nw_path_monitor)wifi_monitor;
- (TVLNetworkInterface)awdl;
- (TVLNetworkInterface)ethernet;
- (TVLNetworkInterface)wifi;
- (TVLNetworkMonitor)init;
- (id)updateHandler;
- (unint64_t)monitoringOptions;
- (void)dealloc;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)setAwdl:(id)a3;
- (void)setAwdlServiceBrowser:(id)a3;
- (void)setAwdl_monitor:(id)a3;
- (void)setEthernet:(id)a3;
- (void)setEthernet_monitor:(id)a3;
- (void)setMonitorQueue:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setMonitoringOptions:(unint64_t)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setWifi:(id)a3;
- (void)setWifi_monitor:(id)a3;
- (void)startMonitoringForInterfaceTypes:(unint64_t)a3 updateHandler:(id)a4;
- (void)stopMonitoring;
@end

@implementation TVLNetworkMonitor

- (TVLNetworkMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVLNetworkMonitor;
  v2 = [(TVLNetworkMonitor *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create((const char *)TVLNetworkMonitorQueueLabel, MEMORY[0x263EF83A8]);
    monitorQueue = v2->_monitorQueue;
    v2->_monitorQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(TVLNetworkMonitor *)self stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)TVLNetworkMonitor;
  [(TVLNetworkMonitor *)&v3 dealloc];
}

- (void)startMonitoringForInterfaceTypes:(unint64_t)a3 updateHandler:(id)a4
{
  id v6 = a4;
  if (_TVLLogDefault_onceToken_5 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
  }
  v7 = _TVLLogDefault_log_5;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22C7FF000, v7, OS_LOG_TYPE_DEFAULT, "TVLNetworkMonitor:startMonitoringForInterfaceTypes", (uint8_t *)buf, 2u);
  }
  if (![(TVLNetworkMonitor *)self isMonitoring])
  {
    self->_monitoringOptions = a3;
    v8 = (void *)MEMORY[0x230F6CE70](v6);
    id updateHandler = self->_updateHandler;
    self->_id updateHandler = v8;

    objc_initWeak(buf, self);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke;
    v35[3] = &unk_26491ECA8;
    objc_copyWeak(&v36, buf);
    v10 = (void *)MEMORY[0x230F6CE70](v35);
    if ((a3 & 4) != 0 && !self->_awdl_monitor)
    {
      v15 = (NSNetServiceBrowser *)objc_alloc_init(MEMORY[0x263F089F0]);
      awdlServiceBrowser = self->_awdlServiceBrowser;
      self->_awdlServiceBrowser = v15;

      [(NSNetServiceBrowser *)self->_awdlServiceBrowser setIncludesPeerToPeer:1];
      [(NSNetServiceBrowser *)self->_awdlServiceBrowser setDelegate:self];
      [(NSNetServiceBrowser *)self->_awdlServiceBrowser searchForServicesOfType:@"_tvlatency._udp" inDomain:@"local."];
      v17 = nw_parameters_create();
      nw_parameters_set_required_interface_subtype();
      nw_parameters_set_include_peer_to_peer(v17, 1);
      evaluator_for_endpoint = (OS_nw_path_monitor *)nw_path_create_evaluator_for_endpoint();
      awdl_monitor = self->_awdl_monitor;
      self->_awdl_monitor = evaluator_for_endpoint;

      nw_path_monitor_set_queue((nw_path_monitor_t)self->_awdl_monitor, (dispatch_queue_t)self->_monitorQueue);
      nw_path_monitor_set_update_handler((nw_path_monitor_t)self->_awdl_monitor, v10);
      objc_initWeak(&location, self);
      v20 = self->_awdl_monitor;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_2_14;
      v31[3] = &unk_26491ECD0;
      objc_copyWeak(&v33, &location);
      id v32 = v10;
      nw_path_monitor_set_update_handler(v20, v31);
      nw_path_monitor_start((nw_path_monitor_t)self->_awdl_monitor);
      self->_monitoring = 1;

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);

      if ((a3 & 2) != 0)
      {
LABEL_9:
        if (!self->_wifi_monitor)
        {
          v11 = nw_parameters_create();
          nw_parameters_set_required_interface_type(v11, nw_interface_type_wifi);
          nw_parameters_set_required_interface_subtype();
          v12 = (OS_nw_path_monitor *)nw_path_create_evaluator_for_endpoint();
          wifi_monitor = self->_wifi_monitor;
          self->_wifi_monitor = v12;

          nw_path_monitor_set_queue((nw_path_monitor_t)self->_wifi_monitor, (dispatch_queue_t)self->_monitorQueue);
          objc_initWeak(&location, self);
          v14 = self->_wifi_monitor;
          update_handler[0] = MEMORY[0x263EF8330];
          update_handler[1] = 3221225472;
          update_handler[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_3;
          update_handler[3] = &unk_26491ECD0;
          objc_copyWeak(&v30, &location);
          id v29 = v10;
          nw_path_monitor_set_update_handler(v14, update_handler);
          nw_path_monitor_start((nw_path_monitor_t)self->_wifi_monitor);
          self->_monitoring = 1;

          objc_destroyWeak(&v30);
          objc_destroyWeak(&location);
        }
      }
    }
    else if ((a3 & 2) != 0)
    {
      goto LABEL_9;
    }
    if ((a3 & 1) != 0 && !self->_ethernet_monitor)
    {
      v21 = nw_parameters_create();
      nw_parameters_set_required_interface_type(v21, nw_interface_type_wired);
      v22 = (OS_nw_path_monitor *)nw_path_create_evaluator_for_endpoint();
      ethernet_monitor = self->_ethernet_monitor;
      self->_ethernet_monitor = v22;

      nw_path_monitor_set_queue((nw_path_monitor_t)self->_ethernet_monitor, (dispatch_queue_t)self->_monitorQueue);
      objc_initWeak(&location, self);
      v24 = self->_ethernet_monitor;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_4;
      v25[3] = &unk_26491ECD0;
      objc_copyWeak(&v27, &location);
      id v26 = v10;
      nw_path_monitor_set_update_handler(v24, v25);
      nw_path_monitor_start((nw_path_monitor_t)self->_ethernet_monitor);
      self->_monitoring = 1;

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    objc_destroyWeak(&v36);
    objc_destroyWeak(buf);
  }
}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    enumerate_block[0] = MEMORY[0x263EF8330];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_2;
    enumerate_block[3] = &unk_26491EC80;
    objc_copyWeak(&v21, v4);
    v20 = v3;
    nw_path_enumerate_interfaces(v20, enumerate_block);
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = objc_msgSend(WeakRetained, "awdl_monitor");
    if (v7)
    {
      v8 = [WeakRetained awdl];

      if (v8)
      {
        v9 = [WeakRetained awdl];
        [v6 addObject:v9];
      }
    }
    v10 = objc_msgSend(WeakRetained, "wifi_monitor");
    if (v10)
    {
      v11 = [WeakRetained wifi];

      if (v11)
      {
        v12 = [WeakRetained wifi];
        [v6 addObject:v12];
      }
    }
    v13 = objc_msgSend(WeakRetained, "ethernet_monitor");
    if (v13)
    {
      v14 = [WeakRetained ethernet];

      if (v14)
      {
        v15 = [WeakRetained ethernet];
        [v6 addObject:v15];
      }
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_10;
    v17[3] = &unk_26491EC08;
    v17[4] = WeakRetained;
    id v18 = v6;
    id v16 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v17);

    objc_destroyWeak(&v21);
  }
}

BOOL __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = [NSString stringWithUTF8String:nw_interface_get_name(v3)];
    if (v5)
    {
      if (nw_interface_get_subtype() == 1002)
      {
        if (_TVLLogDefault_onceToken_5 != -1) {
          dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
        }
        id v6 = _TVLLogDefault_log_5;
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_INFO))
        {
          int v11 = 138543362;
          v12 = v5;
          _os_log_impl(&dword_22C7FF000, v6, OS_LOG_TYPE_INFO, "TVLNetworkMonitor found AWDL %{public}@", (uint8_t *)&v11, 0xCu);
        }
        v7 = [[TVLNetworkInterface alloc] initWithInterfaceType:3 interfaceName:v5];
        [WeakRetained setAwdl:v7];
      }
      else if (nw_interface_get_type(v3) == nw_interface_type_wifi)
      {
        if (nw_path_get_status(*(nw_path_t *)(a1 + 32)) != nw_path_status_satisfied) {
          goto LABEL_10;
        }
        if (_TVLLogDefault_onceToken_5 != -1) {
          dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
        }
        v9 = _TVLLogDefault_log_5;
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_INFO))
        {
          int v11 = 138543362;
          v12 = v5;
          _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_INFO, "TVLNetworkMonitor found WIFI %{public}@", (uint8_t *)&v11, 0xCu);
        }
        v7 = [[TVLNetworkInterface alloc] initWithInterfaceType:2 interfaceName:v5];
        [WeakRetained setWifi:v7];
      }
      else
      {
        if (nw_interface_get_type(v3) != nw_interface_type_wired
          || nw_path_get_status(*(nw_path_t *)(a1 + 32)) != nw_path_status_satisfied)
        {
          goto LABEL_10;
        }
        if (_TVLLogDefault_onceToken_5 != -1) {
          dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
        }
        v10 = _TVLLogDefault_log_5;
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_INFO))
        {
          int v11 = 138543362;
          v12 = v5;
          _os_log_impl(&dword_22C7FF000, v10, OS_LOG_TYPE_INFO, "TVLNetworkMonitor found ETHERNET %{public}@", (uint8_t *)&v11, 0xCu);
        }
        v7 = [[TVLNetworkInterface alloc] initWithInterfaceType:1 interfaceName:v5];
        [WeakRetained setEthernet:v7];
      }
    }
LABEL_10:
  }
  return WeakRetained != 0;
}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_10(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) updateHandler];
  v2 = (void *)[*(id *)(a1 + 40) copy];
  v3[2](v3, v2);
}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_2_14(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setAwdl:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setWifi:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__TVLNetworkMonitor_startMonitoringForInterfaceTypes_updateHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setEthernet:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopMonitoring
{
  if (_TVLLogDefault_onceToken_5 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_5, &__block_literal_global_5);
  }
  id v3 = _TVLLogDefault_log_5;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_22C7FF000, v3, OS_LOG_TYPE_DEFAULT, "TVLNetworkMonitor:stopMonitoring", v14, 2u);
  }
  awdl_monitor = self->_awdl_monitor;
  if (awdl_monitor)
  {
    nw_path_monitor_cancel(awdl_monitor);
    id v5 = self->_awdl_monitor;
    self->_awdl_monitor = 0;

    [(NSNetServiceBrowser *)self->_awdlServiceBrowser stop];
    awdlServiceBrowser = self->_awdlServiceBrowser;
    self->_awdlServiceBrowser = 0;

    awdl = self->_awdl;
    self->_awdl = 0;
  }
  wifi_monitor = self->_wifi_monitor;
  if (wifi_monitor)
  {
    nw_path_monitor_cancel(wifi_monitor);
    v9 = self->_wifi_monitor;
    self->_wifi_monitor = 0;

    wifi = self->_wifi;
    self->_wifi = 0;
  }
  ethernet_monitor = self->_ethernet_monitor;
  if (ethernet_monitor)
  {
    nw_path_monitor_cancel(ethernet_monitor);
    v12 = self->_ethernet_monitor;
    self->_ethernet_monitor = 0;

    ethernet = self->_ethernet;
    self->_ethernet = 0;
  }
  self->_monitoringOptions = 0;
  self->_monitoring = 0;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (unint64_t)monitoringOptions
{
  return self->_monitoringOptions;
}

- (void)setMonitoringOptions:(unint64_t)a3
{
  self->_monitoringOptions = a3;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
}

- (NSNetServiceBrowser)awdlServiceBrowser
{
  return self->_awdlServiceBrowser;
}

- (void)setAwdlServiceBrowser:(id)a3
{
}

- (OS_nw_path_monitor)awdl_monitor
{
  return self->_awdl_monitor;
}

- (void)setAwdl_monitor:(id)a3
{
}

- (OS_nw_path_monitor)wifi_monitor
{
  return self->_wifi_monitor;
}

- (void)setWifi_monitor:(id)a3
{
}

- (OS_nw_path_monitor)ethernet_monitor
{
  return self->_ethernet_monitor;
}

- (void)setEthernet_monitor:(id)a3
{
}

- (TVLNetworkInterface)awdl
{
  return self->_awdl;
}

- (void)setAwdl:(id)a3
{
}

- (TVLNetworkInterface)wifi
{
  return self->_wifi;
}

- (void)setWifi:(id)a3
{
}

- (TVLNetworkInterface)ethernet
{
  return self->_ethernet;
}

- (void)setEthernet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ethernet, 0);
  objc_storeStrong((id *)&self->_wifi, 0);
  objc_storeStrong((id *)&self->_awdl, 0);
  objc_storeStrong((id *)&self->_ethernet_monitor, 0);
  objc_storeStrong((id *)&self->_wifi_monitor, 0);
  objc_storeStrong((id *)&self->_awdl_monitor, 0);
  objc_storeStrong((id *)&self->_awdlServiceBrowser, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);

  objc_storeStrong(&self->_updateHandler, 0);
}

@end