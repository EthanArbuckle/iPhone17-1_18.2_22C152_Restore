@interface RMSTVRemoteCoreDeviceController
+ (id)sharedController;
- (id)_deviceForIdentifier:(id)a3;
- (void)_finishDiscoveryWithDevice:(id)a3 forIdentifier:(id)a4;
- (void)deviceQueryDidUpdateDevices:(id)a3;
- (void)discoverDeviceWithIdentifier:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
@end

@implementation RMSTVRemoteCoreDeviceController

+ (id)sharedController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__RMSTVRemoteCoreDeviceController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_instance;
  return v2;
}

uint64_t __51__RMSTVRemoteCoreDeviceController_sharedController__block_invoke(uint64_t a1)
{
  sharedController_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)discoverDeviceWithIdentifier:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = [(RMSTVRemoteCoreDeviceController *)self _deviceForIdentifier:v8];
  if (v10)
  {
    if (v9) {
      v9[2](v9, v10);
    }
  }
  else
  {
    discoveryCompletionHandlers = self->_discoveryCompletionHandlers;
    if (!discoveryCompletionHandlers)
    {
      v12 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      v13 = self->_discoveryCompletionHandlers;
      self->_discoveryCompletionHandlers = v12;

      discoveryCompletionHandlers = self->_discoveryCompletionHandlers;
    }
    v14 = (void *)MEMORY[0x23ECE8BF0](v9);
    [(NSMapTable *)discoveryCompletionHandlers setObject:v14 forKey:v8];

    if (!self->_deviceQuery)
    {
      v15 = (TVRCDeviceQuery *)objc_alloc_init(MEMORY[0x263F7C9A0]);
      deviceQuery = self->_deviceQuery;
      self->_deviceQuery = v15;

      [(TVRCDeviceQuery *)self->_deviceQuery setDelegate:self];
      [(TVRCDeviceQuery *)self->_deviceQuery start];
    }
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __90__RMSTVRemoteCoreDeviceController_discoverDeviceWithIdentifier_timeout_completionHandler___block_invoke;
    v18[3] = &unk_264E747C0;
    v18[4] = self;
    id v19 = v8;
    dispatch_after(v17, MEMORY[0x263EF83A0], v18);
  }
}

uint64_t __90__RMSTVRemoteCoreDeviceController_discoverDeviceWithIdentifier_timeout_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishDiscoveryWithDevice:0 forIdentifier:*(void *)(a1 + 40)];
}

- (void)deviceQueryDidUpdateDevices:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = (void *)[(NSMapTable *)self->_discoveryCompletionHandlers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10 = [(RMSTVRemoteCoreDeviceController *)self _deviceForIdentifier:v9];
        if (v10) {
          [(RMSTVRemoteCoreDeviceController *)self _finishDiscoveryWithDevice:v10 forIdentifier:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)_deviceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TVRCDeviceQuery *)self->_deviceQuery devices];
  uint64_t v6 = (void *)MEMORY[0x263F08A98];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__RMSTVRemoteCoreDeviceController__deviceForIdentifier___block_invoke;
  v12[3] = &unk_264E747E8;
  id v13 = v4;
  id v7 = v4;
  id v8 = [v6 predicateWithBlock:v12];
  uint64_t v9 = [v5 filteredSetUsingPredicate:v8];
  v10 = [v9 anyObject];

  return v10;
}

uint64_t __56__RMSTVRemoteCoreDeviceController__deviceForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 info];
    uint64_t v5 = [v6 containsID:*(void *)(a1 + 32)];
  }
  return v5;
}

- (void)_finishDiscoveryWithDevice:(id)a3 forIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_discoveryCompletionHandlers objectForKey:v6];
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);
  }
  [(NSMapTable *)self->_discoveryCompletionHandlers removeObjectForKey:v6];
  if (![(NSMapTable *)self->_discoveryCompletionHandlers count])
  {
    [(TVRCDeviceQuery *)self->_deviceQuery stop];
    deviceQuery = self->_deviceQuery;
    self->_deviceQuery = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_deviceQuery, 0);
}

@end