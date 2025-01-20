@interface RMSTVRemoteCoreServiceProvider
+ (id)_serviceWithDevice:(id)a3;
- (RMSServiceProviderDelegate)delegate;
- (RMSTVRemoteCoreServiceProvider)init;
- (void)_didDiscoverDevice:(id)a3;
- (void)_didRemoveDevice:(id)a3;
- (void)beginDiscovery;
- (void)deviceQueryDidUpdateDevices:(id)a3;
- (void)endDiscovery;
- (void)setDelegate:(id)a3;
@end

@implementation RMSTVRemoteCoreServiceProvider

- (RMSTVRemoteCoreServiceProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)RMSTVRemoteCoreServiceProvider;
  v2 = [(RMSTVRemoteCoreServiceProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    services = v2->_services;
    v2->_services = (NSMapTable *)v3;
  }
  return v2;
}

- (void)beginDiscovery
{
  deviceQuery = self->_deviceQuery;
  if (!deviceQuery)
  {
    v4 = (TVRCDeviceQuery *)objc_alloc_init(MEMORY[0x263F7C9A0]);
    v5 = self->_deviceQuery;
    self->_deviceQuery = v4;

    [(TVRCDeviceQuery *)self->_deviceQuery setDelegate:self];
    deviceQuery = self->_deviceQuery;
  }
  [(TVRCDeviceQuery *)deviceQuery start];
}

- (void)endDiscovery
{
}

- (void)deviceQueryDidUpdateDevices:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v4 = self->_devices;
  v5 = [(TVRCDeviceQuery *)self->_deviceQuery devices];
  objc_super v6 = (void *)[(NSSet *)v4 mutableCopy];
  [v6 minusSet:v5];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        [(RMSTVRemoteCoreServiceProvider *)self _didRemoveDevice:*(void *)(*((void *)&v23 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  v12 = (void *)[(NSSet *)v5 mutableCopy];
  [v12 minusSet:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[RMSTVRemoteCoreServiceProvider _didDiscoverDevice:](self, "_didDiscoverDevice:", *(void *)(*((void *)&v19 + 1) + 8 * v17++), (void)v19);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  devices = self->_devices;
  self->_devices = v5;
}

- (void)_didDiscoverDevice:(id)a3
{
  id v4 = a3;
  id v8 = [(id)objc_opt_class() _serviceWithDevice:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serviceProvider:self serviceDidBecomeAvailable:v8];

  services = self->_services;
  id v7 = [v8 uniqueIdentifier];
  [(NSMapTable *)services setObject:v8 forKey:v7];
}

- (void)_didRemoveDevice:(id)a3
{
  id v4 = a3;
  id v8 = [(id)objc_opt_class() _serviceWithDevice:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serviceProvider:self serviceDidBecomeUnavailable:v8];

  services = self->_services;
  id v7 = [v8 uniqueIdentifier];
  [(NSMapTable *)services removeObjectForKey:v7];
}

+ (id)_serviceWithDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(RMSService);
  [(RMSService *)v4 setServiceType:2];
  [(RMSService *)v4 setServiceFlags:2];
  v5 = [v3 identifier];
  [(RMSService *)v4 setUniqueIdentifier:v5];

  objc_super v6 = [v3 name];
  [(RMSService *)v4 setDisplayName:v6];

  id v7 = [(RMSService *)v4 uniqueIdentifier];
  [(RMSService *)v4 setNetworkName:v7];

  id v8 = [(RMSService *)v4 uniqueIdentifier];
  [(RMSService *)v4 setHomeSharingGroupKey:v8];

  if (_os_feature_enabled_impl()) {
    [(RMSService *)v4 setDevice:v3];
  }

  return v4;
}

- (RMSServiceProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RMSServiceProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceQuery, 0);
}

@end