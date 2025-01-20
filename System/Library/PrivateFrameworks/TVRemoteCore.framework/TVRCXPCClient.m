@interface TVRCXPCClient
+ (id)sharedInstance;
- (NSMutableDictionary)eventObserversByID;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_source)deviceQueryRetryTimer;
- (TVRCXPCClient)init;
- (TVRCXPCRequestProtocol)remoteObject;
- (void)_broadcastStateUpdateToDevices:(id)a3;
- (void)_cancelRetryTimer;
- (void)_disconnectAllDevices;
- (void)_invalidateConnection;
- (void)_postInvalidationNotification;
- (void)_setupConnectionIfNeeded;
- (void)_startDeviceQueryRetryTimerWithEventHander:(id)a3;
- (void)addEventObserver:(id)a3 forDeviceWithIdentifier:(id)a4;
- (void)addItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5;
- (void)beginDeviceQueryWithResponse:(id)a3;
- (void)cancelAuthChallengeForDeviceWithIdentifier:(id)a3;
- (void)closeConnectionToDeviceWithIdentifier:(id)a3 withType:(unint64_t)a4;
- (void)deviceQueryUpdatedDiscoveredDevices:(id)a3;
- (void)deviceUpdatedState:(id)a3;
- (void)deviceWithState:(id)a3 encounteredAuthChallengeOfType:(int64_t)a4 attributes:(int64_t)a5 codeToEnterOnDevice:(id)a6 throttleSeconds:(int64_t)a7;
- (void)enableFindingSession:(BOOL)a3 forDeviceIdentifier:(id)a4;
- (void)enableTVRemoteOnLockscreen:(BOOL)a3 forDeviceIdentifier:(id)a4;
- (void)endDeviceQuery;
- (void)fetchActiveMREndpointUIDWithCompletion:(id)a3;
- (void)fetchUpNextInfoForDeviceWithIdentifier:(id)a3 paginationToken:(id)a4 completion:(id)a5;
- (void)fulfillAuthChallengeForDeviceWithIdentifier:(id)a3 withLocallyEnteredCode:(id)a4;
- (void)getConnectionStatusToDeviceWithIdentifier:(id)a3 response:(id)a4;
- (void)getSuggestedDevicesWithResponse:(id)a3;
- (void)launchViewServiceForDeviceWithIdentifier:(id)a3;
- (void)markAsWatchedForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5;
- (void)openConnectionToDeviceWithIdentifier:(id)a3 connectionContext:(int64_t)a4;
- (void)playItem:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5;
- (void)removeEventObserver:(id)a3 forDeviceWithIdentifier:(id)a4;
- (void)removeItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5;
- (void)sendButtonEvent:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)sendEvent:(id)a3 toDeviceWithIdentifier:(id)a4 options:(id)a5 response:(id)a6;
- (void)sendGameControllerEvent:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)sendInputReturnKeyToDeviceWithIdentifier:(id)a3;
- (void)sendInputText:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)sendInputTextPayload:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)sendTouchEvent:(id)a3 toDeviceWithIdentifier:(id)a4;
- (void)setDeviceQueryRetryTimer:(id)a3;
- (void)setEventObserversByID:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)suggestedDevices:(id)a3;
@end

@implementation TVRCXPCClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_18);
  }
  v2 = (void *)sharedInstance_sharedInstance_4;

  return v2;
}

uint64_t __31__TVRCXPCClient_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_4 = objc_alloc_init(TVRCXPCClient);

  return MEMORY[0x270F9A758]();
}

- (TVRCXPCClient)init
{
  v11.receiver = self;
  v11.super_class = (Class)TVRCXPCClient;
  v2 = [(TVRCXPCClient *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    eventObserversByID = v2->_eventObserversByID;
    v2->_eventObserversByID = v3;

    objc_initWeak(&location, v2);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __21__TVRCXPCClient_init__block_invoke;
    v8[3] = &unk_2647B01C8;
    objc_copyWeak(&v9, &location);
    _TVRCAddStateHandlerWithName((uint64_t)"TVRCEventObservers", v8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __21__TVRCXPCClient_init__block_invoke_2;
    v6[3] = &unk_2647B01C8;
    objc_copyWeak(&v7, &location);
    _TVRCAddStateHandlerWithName((uint64_t)"TVRCDeviceQuery", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __21__TVRCXPCClient_init__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v19 = [MEMORY[0x263EFF9A0] dictionary];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v17 = WeakRetained;
    id v3 = WeakRetained[4];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v8 = [v3 objectForKey:v7];
          id v9 = [MEMORY[0x263EFF980] array];
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v21 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = [*(id *)(*((void *)&v20 + 1) + 8 * j) _deviceStateDictionary];
                [v9 addObject:v15];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v12);
          }

          [v19 setObject:v9 forKeyedSubscript:v7];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v5);
    }

    WeakRetained = v17;
  }

  return v19;
}

id __21__TVRCXPCClient_init__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = +[TVRCDeviceQuery _allDiscoveredDevices];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v10 = [v9 _deviceStateDictionary];
          uint64_t v11 = [v9 identifier];
          [v2 setObject:v10 forKeyedSubscript:v11];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }

  return v2;
}

- (void)addEventObserver:(id)a3 forDeviceWithIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_eventObserversByID objectForKey:v6];
  if (v7)
  {
    v8 = v7;
    [v7 addObject:v9];
  }
  else
  {
    v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [v8 addObject:v9];
    [(NSMutableDictionary *)self->_eventObserversByID setObject:v8 forKey:v6];
  }
}

- (void)removeEventObserver:(id)a3 forDeviceWithIdentifier:(id)a4
{
  id v7 = a3;
  id v6 = [(NSMutableDictionary *)self->_eventObserversByID objectForKey:a4];
  if ([v6 containsObject:v7]) {
    [v6 removeObject:v7];
  }
}

- (void)openConnectionToDeviceWithIdentifier:(id)a3 connectionContext:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _TVRCXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to open connection to device %@", (uint8_t *)&v8, 0xCu);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject openConnectionToDeviceWithIdentifier:v6 connectionContext:a4];
}

- (void)closeConnectionToDeviceWithIdentifier:(id)a3 withType:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _TVRCXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to close connection to device %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject closeConnectionToDeviceWithIdentifier:v6 withType:a4];
}

- (void)fulfillAuthChallengeForDeviceWithIdentifier:(id)a3 withLocallyEnteredCode:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = _TVRCXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to fulfill auth challenge to device %@ and code %{public}@", (uint8_t *)&v9, 0x16u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject fulfillAuthChallengeForDeviceWithIdentifier:v6 withLocallyEnteredCode:v7];
}

- (void)cancelAuthChallengeForDeviceWithIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TVRCXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to cancel auth challenge to device %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject cancelAuthChallengeForDeviceWithIdentifier:v4];
}

- (void)sendButtonEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject sendButtonEvent:v7 toDeviceWithIdentifier:v6];
}

- (void)sendTouchEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject sendTouchEvent:v7 toDeviceWithIdentifier:v6];
}

- (void)sendGameControllerEvent:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject sendGameControllerEvent:v7 toDeviceWithIdentifier:v6];
}

- (void)sendInputText:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject sendInputText:v7 toDeviceWithIdentifier:v6];
}

- (void)sendInputReturnKeyToDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject sendInputReturnKeyToDeviceWithIdentifier:v4];
}

- (void)sendInputTextPayload:(id)a3 toDeviceWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject sendInputTextPayload:v7 toDeviceWithIdentifier:v6];
}

- (void)beginDeviceQueryWithResponse:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TVRCXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    remoteObject = self->_remoteObject;
    *(_DWORD *)buf = 138412290;
    v17 = remoteObject;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to begin device query with remoteObject:%@", buf, 0xCu);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  objc_initWeak((id *)buf, self);
  id v7 = self->_remoteObject;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke;
  v13[3] = &unk_2647B0218;
  objc_copyWeak(&v15, (id *)buf);
  id v8 = v4;
  id v14 = v8;
  [(TVRCXPCRequestProtocol *)v7 beginDeviceQueryWithResponse:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke_2;
  v10[3] = &unk_2647AFC68;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v8;
  id v11 = v9;
  [(TVRCXPCClient *)self _startDeviceQueryRetryTimerWithEventHander:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke(uint64_t a1, char a2)
{
  id v4 = _TVRCXPCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Received response. Cancelling timer", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke_8;
    block[3] = &unk_2647B01F0;
    block[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelRetryTimer];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __46__TVRCXPCClient_beginDeviceQueryWithResponse___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _invalidateConnection];
    [v3 beginDeviceQueryWithResponse:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_startDeviceQueryRetryTimerWithEventHander:(id)a3
{
  id v4 = a3;
  [(TVRCXPCClient *)self _cancelRetryTimer];
  if (!self->_deviceQueryRetryTimer)
  {
    uint64_t v5 = _TVRCXPCLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Starting DeviceQuery retry timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    deviceQueryRetryTimer = self->_deviceQueryRetryTimer;
    self->_deviceQueryRetryTimer = v6;

    id v8 = self->_deviceQueryRetryTimer;
    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    id v10 = self->_deviceQueryRetryTimer;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__TVRCXPCClient__startDeviceQueryRetryTimerWithEventHander___block_invoke;
    v11[3] = &unk_2647AFC68;
    objc_copyWeak(&v13, buf);
    id v12 = v4;
    dispatch_source_set_event_handler(v10, v11);
    dispatch_activate((dispatch_object_t)self->_deviceQueryRetryTimer);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

void __60__TVRCXPCClient__startDeviceQueryRetryTimerWithEventHander___block_invoke(uint64_t a1)
{
  v2 = _TVRCXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "DeviceQuery Retry eventHandler called", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_cancelRetryTimer
{
  if (self->_deviceQueryRetryTimer)
  {
    id v3 = _TVRCXPCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling Retry Timer", v5, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_deviceQueryRetryTimer);
    deviceQueryRetryTimer = self->_deviceQueryRetryTimer;
    self->_deviceQueryRetryTimer = 0;
  }
}

- (void)endDeviceQuery
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = _TVRCXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    remoteObject = self->_remoteObject;
    int v5 = 138412290;
    id v6 = remoteObject;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to end device query with remoteObject:%@", (uint8_t *)&v5, 0xCu);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject endDeviceQuery];
}

- (void)getSuggestedDevicesWithResponse:(id)a3
{
  id v4 = a3;
  int v5 = _TVRCXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to get suggested device if available", v6, 2u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject getSuggestedDevicesWithResponse:v4];
}

- (void)fetchActiveMREndpointUIDWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = _TVRCXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to fetch active MediaRemote endpoint", v6, 2u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject fetchActiveMREndpointUIDWithCompletion:v4];
}

- (void)sendEvent:(id)a3 toDeviceWithIdentifier:(id)a4 options:(id)a5 response:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = _TVRCXPCLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v10;
    __int16 v17 = 2114;
    id v18 = v11;
    _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to send event with ID %@ to device %{public}@", (uint8_t *)&v15, 0x16u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject sendEvent:v10 toDeviceWithIdentifier:v11 options:v13 response:v12];
}

- (void)launchViewServiceForDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = _TVRCXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to launch TVRemote view service", v6, 2u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject launchViewServiceForDeviceWithIdentifier:v4];
}

- (void)enableTVRemoteOnLockscreen:(BOOL)a3 forDeviceIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = _TVRCXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"hide";
    remoteObject = self->_remoteObject;
    if (v4) {
      id v8 = @"show";
    }
    int v10 = 138412546;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = remoteObject;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to %@ TVRemote on Lockscreen with remoteObject:%@", (uint8_t *)&v10, 0x16u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject enableTVRemoteOnLockscreen:v4 forDeviceIdentifier:v6];
}

- (void)getConnectionStatusToDeviceWithIdentifier:(id)a3 response:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRCXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to fetch connection status for %{public}@", (uint8_t *)&v9, 0xCu);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject getConnectionStatusToDeviceWithIdentifier:v6 response:v7];
}

- (void)enableFindingSession:(BOOL)a3 forDeviceIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _TVRCXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"disable";
    if (v4) {
      id v8 = @"enable";
    }
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to %@ finding session for %{public}@", (uint8_t *)&v9, 0x16u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject enableFindingSession:v4 forDeviceIdentifier:v6];
}

- (void)fetchUpNextInfoForDeviceWithIdentifier:(id)a3 paginationToken:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  __int16 v11 = _TVRCXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v8;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to fetch UpNext infos for %{public}@", (uint8_t *)&v12, 0xCu);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject fetchUpNextInfoForDeviceWithIdentifier:v8 paginationToken:v10 completion:v9];
}

- (void)markAsWatchedForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = _TVRCXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to mark %@ as watched for %{public}@", (uint8_t *)&v12, 0x16u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject markAsWatchedForDeviceWithIdentifier:v8 mediaIdentifier:v9 completion:v10];
}

- (void)addItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = _TVRCXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to add %@ to UpNext for %{public}@", (uint8_t *)&v12, 0x16u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject addItemForDeviceWithIdentifier:v8 mediaIdentifier:v9 completion:v10];
}

- (void)removeItemForDeviceWithIdentifier:(id)a3 mediaIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = _TVRCXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to remove %@ from UpNext for %{public}@", (uint8_t *)&v12, 0x16u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject removeItemForDeviceWithIdentifier:v8 mediaIdentifier:v9 completion:v10];
}

- (void)playItem:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = _TVRCXPCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Asking tvremoted to play media with item %@ for %{public}@", (uint8_t *)&v12, 0x16u);
  }

  [(TVRCXPCClient *)self _setupConnectionIfNeeded];
  [(TVRCXPCRequestProtocol *)self->_remoteObject playItem:v8 deviceIdentifier:v9 completion:v10];
}

- (void)deviceUpdatedState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__TVRCXPCClient_deviceUpdatedState___block_invoke;
  v6[3] = &unk_2647AF458;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __36__TVRCXPCClient_deviceUpdatedState___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _TVRCXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "tvremoted informed us that a device's state changed - %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _broadcastStateUpdateToDevices:*(void *)(a1 + 32)];
}

- (void)deviceWithState:(id)a3 encounteredAuthChallengeOfType:(int64_t)a4 attributes:(int64_t)a5 codeToEnterOnDevice:(id)a6 throttleSeconds:(int64_t)a7
{
  id v12 = a3;
  id v13 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __111__TVRCXPCClient_deviceWithState_encounteredAuthChallengeOfType_attributes_codeToEnterOnDevice_throttleSeconds___block_invoke;
  v16[3] = &unk_2647B0240;
  v16[4] = self;
  id v17 = v12;
  id v18 = v13;
  int64_t v19 = a4;
  int64_t v20 = a5;
  int64_t v21 = a7;
  id v14 = v13;
  id v15 = v12;
  dispatch_async(MEMORY[0x263EF83A0], v16);
}

void __111__TVRCXPCClient_deviceWithState_encounteredAuthChallengeOfType_attributes_codeToEnterOnDevice_throttleSeconds___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = _TVRCXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "tvremoted informed us that we're encountering an auth challenge.", buf, 2u);
  }

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v4 = [*(id *)(a1 + 40) identifier];
  int v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    int v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [*(id *)(a1 + 40) alternateIdentifiers];
  uint64_t v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * v11)];
        [v5 unionHashTable:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "_deviceEncounteredAuthChallengeType:attributes:codeToEnterOnDevice:throttleSeconds:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 72), (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v15);
  }

  [*(id *)(a1 + 32) _broadcastStateUpdateToDevices:*(void *)(a1 + 40)];
}

- (void)deviceQueryUpdatedDiscoveredDevices:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__TVRCXPCClient_deviceQueryUpdatedDiscoveredDevices___block_invoke;
  block[3] = &unk_2647AEA98;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__TVRCXPCClient_deviceQueryUpdatedDiscoveredDevices___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v2 = +[TVRCDeviceQuery _allDiscoveredDevices];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v59 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v9 = _TVRCXPCLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v66 = "-[TVRCXPCClient deviceQueryUpdatedDiscoveredDevices:]_block_invoke";
          __int16 v67 = 2114;
          id v68 = v8;
          _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "%s previousDevice:%{public}@", buf, 0x16u);
        }

        uint64_t v10 = [v8 identifier];
        [v3 setObject:v8 forKey:v10];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    }
    while (v5);
  }

  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  id v12 = [v3 allKeys];
  v43 = [v11 setWithArray:v12];

  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v55 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        long long v20 = _TVRCXPCLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v66 = "-[TVRCXPCClient deviceQueryUpdatedDiscoveredDevices:]_block_invoke";
          __int16 v67 = 2114;
          id v68 = v19;
          _os_log_impl(&dword_2266D3000, v20, OS_LOG_TYPE_DEFAULT, "%s deviceState:%{public}@", buf, 0x16u);
        }

        long long v21 = [v19 identifier];
        [v13 setObject:v19 forKey:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v16);
  }

  long long v22 = (void *)MEMORY[0x263EFFA08];
  long long v23 = [v13 allKeys];
  long long v24 = [v22 setWithArray:v23];

  v44 = v24;
  long long v25 = (void *)[v24 mutableCopy];
  [v25 minusSet:v43];
  id v26 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v27 = v25;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v50 + 1) + 8 * k);
        v33 = [[TVRCDevice alloc] initWithDeviceIdentifier:v32];
        v34 = [v13 objectForKey:v32];
        [(TVRCDevice *)v33 _deviceUpdatedState:v34];
        [v26 addObject:v33];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v29);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v35 = v44;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v46 objects:v62 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = [v3 objectForKey:*(void *)(*((void *)&v46 + 1) + 8 * m)];
        if (v40) {
          [v26 addObject:v40];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v46 objects:v62 count:16];
    }
    while (v37);
  }

  v41 = _TVRCXPCLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[TVRCXPCClient deviceQueryUpdatedDiscoveredDevices:]_block_invoke";
    __int16 v67 = 2114;
    id v68 = v26;
    _os_log_impl(&dword_2266D3000, v41, OS_LOG_TYPE_DEFAULT, "%s currentDevices:%{public}@", buf, 0x16u);
  }

  v42 = (void *)[v26 copy];
  +[TVRCDeviceQuery _allDiscoveredDevicesDidUpdate:v42];
}

- (void)suggestedDevices:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__TVRCXPCClient_suggestedDevices___block_invoke;
  block[3] = &unk_2647AEA98;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __34__TVRCXPCClient_suggestedDevices___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = _TVRCXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v3;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "tvremoted updated suggested devices - %{public}@", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 138543362;
    long long v15 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = +[TVRCDeviceQuery deviceForDeviceState:](TVRCDeviceQuery, "deviceForDeviceState:", v11, v15);
        id v13 = _TVRCXPCLog();
        id v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v21 = v11;
            __int16 v22 = 2114;
            long long v23 = v12;
            _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, "Updating deviceState: %{public}@ for suggested device: %{public}@", buf, 0x16u);
          }

          [v12 _deviceUpdatedState:v11];
          [v4 addObject:v12];
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            uint64_t v21 = v11;
            _os_log_error_impl(&dword_2266D3000, v14, OS_LOG_TYPE_ERROR, "Suggested deviceState %{public}@ was never discovered previously", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }

  +[TVRCDeviceQuery _updateSuggestedDevices:v4];
}

- (void)_invalidateConnection
{
  if (self->_xpcConnection)
  {
    uint64_t v3 = _TVRCXPCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating XPC connection", v5, 2u);
    }

    [(NSXPCConnection *)self->_xpcConnection invalidate];
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (void)_setupConnectionIfNeeded
{
  if (!self->_xpcConnection)
  {
    uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.tvremotecore.xpc" options:4096];
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v3;

    id v5 = self->_xpcConnection;
    uint64_t v6 = +[TVRCXPCProtocolManager requestInterface];
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    long long v7 = self->_xpcConnection;
    uint64_t v8 = +[TVRCXPCProtocolManager responseInterface];
    [(NSXPCConnection *)v7 setExportedInterface:v8];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    objc_initWeak(&location, self);
    uint64_t v9 = self->_xpcConnection;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke;
    v18[3] = &unk_2647AEB88;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v9 setInterruptionHandler:v18];
    uint64_t v10 = self->_xpcConnection;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_28;
    v16[3] = &unk_2647AEB88;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:v16];
    uint64_t v11 = _TVRCXPCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Resuming XPC connection", v15, 2u);
    }

    [(NSXPCConnection *)self->_xpcConnection activate];
    id v12 = _TVRCXPCLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "Getting remote object proxy", v15, 2u);
    }

    id v13 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_32];
    remoteObject = self->_remoteObject;
    self->_remoteObject = v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)*((void *)WeakRetained + 2);
    *((void *)WeakRetained + 2) = 0;

    id v4 = _TVRCXPCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted. Sending all devices a disconnect message.", v5, 2u);
    }

    [v2 _disconnectAllDevices];
    [v2 _postInvalidationNotification];
  }
}

void __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)*((void *)WeakRetained + 2);
    *((void *)WeakRetained + 2) = 0;

    id v4 = _TVRCXPCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated. Sending all devices a disconnect message.", v5, 2u);
    }

    [v2 _disconnectAllDevices];
    [v2 _postInvalidationNotification];
  }
}

void __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_29(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _TVRCXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_29_cold_1((uint64_t)v2, v3);
  }
}

- (void)_disconnectAllDevices
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__TVRCXPCClient__disconnectAllDevices__block_invoke;
  block[3] = &unk_2647AEA98;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __38__TVRCXPCClient__disconnectAllDevices__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(*(void *)(a1 + 32) + 32) allValues];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * v5);
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v13;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v13 != v10) {
                objc_enumerationMutation(v7);
              }
              [*(id *)(*((void *)&v12 + 1) + 8 * v11++) _disconnectDeviceDueToConnectionInterruption];
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v3);
  }
}

- (void)_broadcastStateUpdateToDevices:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__TVRCXPCClient__broadcastStateUpdateToDevices___block_invoke;
  v6[3] = &unk_2647AF458;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __48__TVRCXPCClient__broadcastStateUpdateToDevices___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 objectForKey:v3];

  if (!v4)
  {
    id v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [*(id *)(a1 + 40) alternateIdentifiers];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v10)];
        [v4 unionHashTable:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "_deviceUpdatedState:", *(void *)(a1 + 40), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)_postInvalidationNotification
{
  uint64_t v2 = _TVRCXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "Posting TVRCConnectionInvalidatedNotification", v4, 2u);
  }

  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"com.apple.TVRemoteCore.connectionInvalidatedNotification" object:0];
}

- (OS_dispatch_source)deviceQueryRetryTimer
{
  return self->_deviceQueryRetryTimer;
}

- (void)setDeviceQueryRetryTimer:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (TVRCXPCRequestProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (NSMutableDictionary)eventObserversByID
{
  return self->_eventObserversByID;
}

- (void)setEventObserversByID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventObserversByID, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_deviceQueryRetryTimer, 0);
}

void __41__TVRCXPCClient__setupConnectionIfNeeded__block_invoke_29_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Failed getting remote object proxy %{public}@", (uint8_t *)&v2, 0xCu);
}

@end