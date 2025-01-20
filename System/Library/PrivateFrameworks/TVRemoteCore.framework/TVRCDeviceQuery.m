@interface TVRCDeviceQuery
+ (id)_allDiscoveredDevices;
+ (id)deviceForDeviceState:(id)a3;
+ (void)_allDiscoveredDevicesDidUpdate:(id)a3;
+ (void)_updateSuggestedDevices:(id)a3;
+ (void)fetchActiveEndpointUIDWithCompletion:(id)a3;
+ (void)getConnectionStatusToDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (NSSet)devices;
- (TVRCDeviceQueryDelegate)delegate;
- (void)dealloc;
- (void)fetchSuggestedDevicesWithResponse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
@end

@implementation TVRCDeviceQuery

+ (id)_allDiscoveredDevices
{
  if (__lastKnownDeviceSet)
  {
    id v2 = (id)__lastKnownDeviceSet;
  }
  else
  {
    id v2 = [MEMORY[0x263EFFA08] set];
  }

  return v2;
}

+ (void)_allDiscoveredDevicesDidUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 copy];
  v4 = (void *)__lastKnownDeviceSet;
  __lastKnownDeviceSet = v3;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)[(id)__activeQueries copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "delegate", (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v11 deviceQueryDidUpdateDevices:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

+ (void)_updateSuggestedDevices:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)[(id)__activeQueries copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "delegate", (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v9 didUpdateSuggestedDevices:v3];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

+ (void)getConnectionStatusToDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TVRCXPCClient sharedInstance];
  [v7 getConnectionStatusToDeviceWithIdentifier:v6 response:v5];
}

- (void)dealloc
{
  [(TVRCDeviceQuery *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)TVRCDeviceQuery;
  [(TVRCDeviceQuery *)&v3 dealloc];
}

- (NSSet)devices
{
  return (NSSet *)(id)__lastKnownDeviceSet;
}

- (void)start
{
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TVRCDeviceQuery startWithCompletionHandler:]();
  }

  id v6 = (void *)__activeQueries;
  if (!__activeQueries)
  {
    uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    uint64_t v8 = (void *)__activeQueries;
    __activeQueries = v7;

    id v6 = (void *)__activeQueries;
  }
  [v6 addObject:self];
  if ([(id)__activeQueries count] == 1)
  {
    v9 = +[TVRCXPCClient sharedInstance];
    [v9 beginDeviceQueryWithResponse:v4];
LABEL_11:

    goto LABEL_12;
  }
  if (v4) {
    v4[2](v4, 1);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 deviceQueryDidUpdateDevices:self];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)stop
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_2266D3000, v0, OS_LOG_TYPE_DEBUG, "STOP: Active queries: %@ - before removing: %@", v1, 0x16u);
}

- (void)fetchSuggestedDevicesWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = +[TVRCXPCClient sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__TVRCDeviceQuery_fetchSuggestedDevicesWithResponse___block_invoke;
  v7[3] = &unk_2647AF8F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getSuggestedDevicesWithResponse:v7];
}

void __53__TVRCDeviceQuery_fetchSuggestedDevicesWithResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend((id)objc_opt_class(), "deviceForDeviceState:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  long long v12 = (void *)[v4 copy];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

+ (void)fetchActiveEndpointUIDWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[TVRCXPCClient sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__TVRCDeviceQuery_fetchActiveEndpointUIDWithCompletion___block_invoke;
  v6[3] = &unk_2647AF920;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchActiveMREndpointUIDWithCompletion:v6];
}

uint64_t __56__TVRCDeviceQuery_fetchActiveEndpointUIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)deviceForDeviceState:(id)a3
{
  id v3 = a3;
  id v4 = +[TVRCDeviceQuery _allDiscoveredDevices];
  id v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[TVRCDeviceQuery deviceForDeviceState:]((uint64_t)v4, v5);
  }

  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__1;
  long long v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__TVRCDeviceQuery_deviceForDeviceState___block_invoke;
  v9[3] = &unk_2647AF948;
  id v6 = v3;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v4 enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __40__TVRCDeviceQuery_deviceForDeviceState___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [v9 identifier];
  id v7 = [*(id *)(a1 + 32) identifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (TVRCDeviceQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRCDeviceQueryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)startWithCompletionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_2266D3000, v0, OS_LOG_TYPE_DEBUG, "START: Active queries: %@ - before adding: %@", v1, 0x16u);
}

+ (void)deviceForDeviceState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2266D3000, a2, OS_LOG_TYPE_DEBUG, "Discovered devices: %@", (uint8_t *)&v2, 0xCu);
}

@end