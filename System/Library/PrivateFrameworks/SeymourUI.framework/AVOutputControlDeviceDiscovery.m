@interface AVOutputControlDeviceDiscovery
- (AVOutputControlDeviceDiscovery)init;
- (AVOutputDeviceDiscoverySession)session;
- (BOOL)supportsFitnessDataDestinationForDeviceIdentifier:(id)a3;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
@end

@implementation AVOutputControlDeviceDiscovery

- (AVOutputControlDeviceDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVOutputControlDeviceDiscovery;
  v2 = [(AVOutputControlDeviceDiscovery *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFA7D0]) initWithDeviceFeatures:8];
    session = v2->_session;
    v2->_session = (AVOutputDeviceDiscoverySession *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(AVOutputControlDeviceDiscovery *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)AVOutputControlDeviceDiscovery;
  [(AVOutputControlDeviceDiscovery *)&v3 dealloc];
}

- (BOOL)supportsFitnessDataDestinationForDeviceIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(AVOutputControlDeviceDiscovery *)self session];
  objc_super v6 = [v5 availableOutputDevices];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = [v12 deviceID];
        if ([v13 isEqualToString:v4])
        {
          char v14 = [v12 supportsFitnessDataDestination];

          v9 |= v14;
        }
        else
        {
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (void)activate
{
  id v2 = [(AVOutputControlDeviceDiscovery *)self session];
  [v2 setDiscoveryMode:2];
}

- (void)deactivate
{
  id v2 = [(AVOutputControlDeviceDiscovery *)self session];
  [v2 setDiscoveryMode:0];
}

- (AVOutputDeviceDiscoverySession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
}

@end