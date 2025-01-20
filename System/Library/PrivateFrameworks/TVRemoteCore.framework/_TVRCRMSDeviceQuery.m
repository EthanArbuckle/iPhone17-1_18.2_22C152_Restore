@interface _TVRCRMSDeviceQuery
- (BOOL)_shouldReportDevice:(id)a3;
- (TVRCServiceDeviceQueryDelegate)delegate;
- (TVRMSDiscoverySession)legacyDiscoverySession;
- (TVRMSService)service;
- (void)discoverySessionDidUpdateAvailableServices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLegacyDiscoverySession:(id)a3;
- (void)setService:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _TVRCRMSDeviceQuery

- (void)start
{
  v3 = _TVRCRMSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Starting query for RMS devices", v8, 2u);
  }

  v4 = +[TVRMSDiscoverySession localDiscoverySession];
  [(_TVRCRMSDeviceQuery *)self setLegacyDiscoverySession:v4];

  v5 = [(_TVRCRMSDeviceQuery *)self legacyDiscoverySession];
  [v5 setDiscoveryTypes:6];

  v6 = [(_TVRCRMSDeviceQuery *)self legacyDiscoverySession];
  [v6 setDelegate:self];

  v7 = [(_TVRCRMSDeviceQuery *)self legacyDiscoverySession];
  [v7 beginDiscovery];
}

- (void)stop
{
  v3 = _TVRCRMSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Stopping query for RMS devices", v6, 2u);
  }

  v4 = [(_TVRCRMSDeviceQuery *)self legacyDiscoverySession];
  [v4 endDiscovery];

  v5 = [(_TVRCRMSDeviceQuery *)self legacyDiscoverySession];
  [v5 setDelegate:0];

  [(_TVRCRMSDeviceQuery *)self setLegacyDiscoverySession:0];
}

- (void)discoverySessionDidUpdateAvailableServices:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "-discoverySessionDidUpdateAvailableServices: %{public}@", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v15 = v4;
  v6 = [v4 availableServices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([(_TVRCRMSDeviceQuery *)self _shouldReportDevice:v11])
        {
          v12 = +[_TVRCRMSDeviceWrapper wrapperWithDevice:v11];
          v13 = +[_TVRCRMSDeviceImpl implWithDevice:v12];
          v14 = [(_TVRCRMSDeviceQuery *)self delegate];
          [v14 addedDevice:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (BOOL)_shouldReportDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _TVRCRMSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    uint64_t v14 = (uint64_t)v3;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Checking if we should report this RMS device: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v3 serviceType];
    int v13 = 134217984;
    uint64_t v14 = v6;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "   --> Service Type: %ld", (uint8_t *)&v13, 0xCu);
  }

  if (v3) {
    BOOL v7 = [v3 serviceType] == 2;
  }
  else {
    BOOL v7 = 0;
  }
  uint64_t v8 = _TVRCRMSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v3 serviceDiscoverySource];
    int v13 = 134217984;
    uint64_t v14 = v9;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "   --> Service Discovery Source: %ld", (uint8_t *)&v13, 0xCu);
  }

  BOOL v10 = v7 && [v3 serviceDiscoverySource] == 2;
  uint64_t v11 = _TVRCRMSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    LODWORD(v14) = v10;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "   --> Should Report: %d", (uint8_t *)&v13, 8u);
  }

  return v10;
}

- (TVRCServiceDeviceQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRCServiceDeviceQueryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRMSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (TVRMSDiscoverySession)legacyDiscoverySession
{
  return self->_legacyDiscoverySession;
}

- (void)setLegacyDiscoverySession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyDiscoverySession, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end