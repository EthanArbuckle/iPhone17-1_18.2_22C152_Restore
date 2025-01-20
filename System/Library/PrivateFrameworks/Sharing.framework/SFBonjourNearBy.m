@interface SFBonjourNearBy
- (BOOL)isLocalEndpoint:(id)a3;
- (BOOL)sendData:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (BOOL)startDiscovery;
- (BOOL)stopAdvertisingForData:(id)a3 completionHandler:(id)a4;
- (NSMutableDictionary)advToBrowserNwToSFendpoints;
- (NSMutableDictionary)advToBrowserUuidToSFendpoints;
- (NSMutableDictionary)browserToAdvNwToSFendpoints;
- (NSMutableDictionary)browserToAdvUuidToSFendpoints;
- (NSMutableSet)advertiserAdvs;
- (NSMutableSet)resultChanges;
- (OS_nw_browser)browser;
- (OS_nw_endpoint)endpoint;
- (OS_nw_listener)listener;
- (SFBonjourNearBy)initWithQueue:(id)a3;
- (id)_endpointForUniqueID:(id)a3;
- (id)_handleConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4;
- (id)advertisingStateUpdateHandler;
- (id)deviceDidConnectHandler;
- (id)deviceDidDisconnectHandler;
- (id)deviceDidReceiveDataHandler;
- (id)deviceDidStartScanning;
- (id)deviceDidStopScanning;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)discoveryStateUpdateHandler;
- (id)getUniqueServiceNameForAdvertiser;
- (id)randomUUID;
- (int)advertiserState;
- (int)browserState;
- (void)_cleanUp;
- (void)_cleanupAdvertiser;
- (void)_cleanupBrowser;
- (void)_reportCachedDiscoveryResults;
- (void)_sendAdvMessageWithData:(id)a3 isStart:(BOOL)a4 completionHandler:(id)a5;
- (void)_sendMessage:(id)a3 withType:(id)a4 toDevice:(id)a5 completionCallback:(id)a6;
- (void)_sendMessage:(id)a3 withType:(id)a4 toEndpoint:(id)a5 completionCallback:(id)a6;
- (void)_startAdvertiser;
- (void)_startBrowser;
- (void)_stopAdvertising;
- (void)_stopBrowser;
- (void)_updateAdvertiserState;
- (void)_updateBrowserState;
- (void)connectToDevice:(id)a3;
- (void)dealloc;
- (void)disconnectFromDevice:(id)a3;
- (void)handleBrowseResults:(id)a3;
- (void)setAdvToBrowserNwToSFendpoints:(id)a3;
- (void)setAdvToBrowserUuidToSFendpoints:(id)a3;
- (void)setAdvertiserAdvs:(id)a3;
- (void)setAdvertiserState:(int)a3;
- (void)setAdvertisingStateUpdateHandler:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setBrowserState:(int)a3;
- (void)setBrowserToAdvNwToSFendpoints:(id)a3;
- (void)setBrowserToAdvUuidToSFendpoints:(id)a3;
- (void)setDeviceDidConnectHandler:(id)a3;
- (void)setDeviceDidDisconnectHandler:(id)a3;
- (void)setDeviceDidReceiveDataHandler:(id)a3;
- (void)setDeviceDidStartScanning:(id)a3;
- (void)setDeviceDidStopScanning:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryStateUpdateHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)setResultChanges:(id)a3;
- (void)startAdvertisingWithData:(id)a3 completionHandler:(id)a4;
- (void)stopDiscovery;
@end

@implementation SFBonjourNearBy

- (SFBonjourNearBy)initWithQueue:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SFBonjourNearBy;
  v6 = [(SFBonjourNearBy *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serialQueue, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    advertiserAdvs = v7->_advertiserAdvs;
    v7->_advertiserAdvs = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    advToBrowserNwToSFendpoints = v7->_advToBrowserNwToSFendpoints;
    v7->_advToBrowserNwToSFendpoints = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    advToBrowserUuidToSFendpoints = v7->_advToBrowserUuidToSFendpoints;
    v7->_advToBrowserUuidToSFendpoints = v12;

    v7->_advertiserState = 0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    browserToAdvNwToSFendpoints = v7->_browserToAdvNwToSFendpoints;
    v7->_browserToAdvNwToSFendpoints = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    browserToAdvUuidToSFendpoints = v7->_browserToAdvUuidToSFendpoints;
    v7->_browserToAdvUuidToSFendpoints = v16;

    v7->_browserState = 0;
    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    resultChanges = v7->_resultChanges;
    v7->_resultChanges = (NSMutableSet *)v18;

    uint64_t v20 = [(SFBonjourNearBy *)v7 randomUUID];
    localAdvertiserUUIDString = v7->_localAdvertiserUUIDString;
    v7->_localAdvertiserUUIDString = (NSString *)v20;

    uint64_t v22 = [(SFBonjourNearBy *)v7 randomUUID];
    localBrowserUUIDString = v7->_localBrowserUUIDString;
    v7->_localBrowserUUIDString = (NSString *)v22;

    v24 = daemon_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v7->_localAdvertiserUUIDString;
      v26 = v7->_localBrowserUUIDString;
      *(_DWORD *)buf = 138412546;
      v30 = v25;
      __int16 v31 = 2112;
      v32 = v26;
      _os_log_impl(&dword_1A5389000, v24, OS_LOG_TYPE_DEFAULT, "LocalAdvID %@, LocalBrowserID: %@", buf, 0x16u);
    }
  }
  return v7;
}

- (id)randomUUID
{
  v2 = [MEMORY[0x1E4F29128] UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)getUniqueServiceNameForAdvertiser
{
  v2 = [(NSString *)self->_localAdvertiserUUIDString lowercaseString];
  v3 = objc_msgSend(v2, "substringWithRange:", 12, 12);

  return v3;
}

- (void)_startAdvertiser
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Unable to start SFBonjourNearbyAdvertiser", v2, v3, v4, v5, v6);
}

void __35__SFBonjourNearBy__startAdvertiser__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20[0] = 67109120;
      v20[1] = a2;
      _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "advertiser state handler with state %d", (uint8_t *)v20, 8u);
    }

    if (v6)
    {
      v9 = daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __35__SFBonjourNearBy__startAdvertiser__block_invoke_cold_2();
      }
    }
    switch(a2)
    {
      case 4:
        v13 = daemon_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20[0]) = 0;
          _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "advertiser cancelled", (uint8_t *)v20, 2u);
        }

        [WeakRetained setListener:0];
        [WeakRetained _cleanupAdvertiser];
        v14 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        if (v14) {
          uint64_t v12 = (uint64_t)nw_error_copy_cf_error(v14);
        }
        else {
          uint64_t v12 = 0;
        }
        v16 = [WeakRetained advertisingStateUpdateHandler];

        if (v16)
        {
          v17 = [WeakRetained advertisingStateUpdateHandler];
          v17[2](v17, 0, v12);
        }
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
        v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = 0;

        goto LABEL_26;
      case 3:
        v15 = daemon_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __35__SFBonjourNearBy__startAdvertiser__block_invoke_cold_1();
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
        uint64_t v12 = [WeakRetained listener];
        nw_listener_cancel((nw_listener_t)v12);
        goto LABEL_26;
      case 2:
        v10 = daemon_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20[0]) = 0;
          _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "advertiser is ready", (uint8_t *)v20, 2u);
        }

        [WeakRetained setAdvertiserState:2];
        v11 = [WeakRetained advertisingStateUpdateHandler];

        if (v11)
        {
          uint64_t v12 = [WeakRetained advertisingStateUpdateHandler];
          (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, 1, 0);
LABEL_26:
        }
        break;
    }
  }
}

void __35__SFBonjourNearBy__startAdvertiser__block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained _handleConnection:v3 isAdvToBrowserConnection:1];

  id v6 = daemon_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "New Adv to browser connection %@ (endpoint %@)", (uint8_t *)&v7, 0x16u);
  }
}

- (void)startAdvertisingWithData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SFBonjourNearBy_startAdvertisingWithData_completionHandler___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __62__SFBonjourNearBy_startAdvertisingWithData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) advertiserAdvs];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v13 = 138412290;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Already advertising for advData %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) advertiserAdvs];
    [v6 addObject:*(void *)(a1 + 40)];

    id v7 = daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v13 = 138412290;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Starting advertising with advData %@", (uint8_t *)&v13, 0xCu);
    }

    int v9 = [*(id *)(a1 + 32) advertiserState];
    id v10 = *(unsigned char **)(a1 + 32);
    if (v9 == 3)
    {
      v10[25] = 1;
    }
    else
    {
      int v11 = [v10 advertiserState];
      id v12 = *(void **)(a1 + 32);
      if (v11 == 2) {
        [v12 _sendAdvMessageWithData:*(void *)(a1 + 40) isStart:1 completionHandler:*(void *)(a1 + 48)];
      }
      else {
        [v12 _startAdvertiser];
      }
    }
  }
}

- (void)_stopAdvertising
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(SFBonjourNearBy *)self advertiserState] == 2)
  {
    [(SFBonjourNearBy *)self setAdvertiserState:3];
    listener = self->_listener;
    nw_listener_cancel(listener);
  }
  else
  {
    uint64_t v4 = daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = [(SFBonjourNearBy *)self advertiserState];
      _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Unable to stop advertiser, invalid state : %d", (uint8_t *)v5, 8u);
    }
  }
}

- (BOOL)stopAdvertisingForData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SFBonjourNearBy_stopAdvertisingForData_completionHandler___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);

  return 1;
}

uint64_t __60__SFBonjourNearBy_stopAdvertisingForData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(*(void *)(a1 + 32) + 160) containsObject:*(void *)(a1 + 40)];
  int v3 = daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Stop advertising for advData %@", (uint8_t *)&v9, 0xCu);
    }

    if ([*(id *)(a1 + 32) advertiserState] == 2) {
      [*(id *)(a1 + 32) _sendAdvMessageWithData:*(void *)(a1 + 40) isStart:0 completionHandler:*(void *)(a1 + 48)];
    }
    [*(id *)(*(void *)(a1 + 32) + 160) removeObject:*(void *)(a1 + 40)];
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 160) count];
    if (!result)
    {
      id v7 = daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "No more advertisements, stopping advertiser completely.", (uint8_t *)&v9, 2u);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
      return [*(id *)(a1 + 32) _stopAdvertising];
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Unable to stop advertising for advData %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t result = *(void *)(a1 + 48);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 40), 0);
    }
  }
  return result;
}

- (void)_cleanupAdvertiser
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(SFBonjourNearBy *)self advertiserState])
  {
    int v3 = daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up the advertiser", v5, 2u);
    }

    BOOL v4 = [(SFBonjourNearBy *)self advToBrowserNwToSFendpoints];
    [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_51];

    [(SFBonjourNearBy *)self _updateAdvertiserState];
  }
}

void __37__SFBonjourNearBy__cleanupAdvertiser__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (([v3 isConnected] & 1) == 0) {
    [v3 cancel];
  }
}

- (void)_updateAdvertiserState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(SFBonjourNearBy *)self advToBrowserNwToSFendpoints];
  id v4 = [v3 keysOfEntriesPassingTest:&__block_literal_global_150];

  if (![v4 count] && !self->_listener)
  {
    [(SFBonjourNearBy *)self setAdvertiserState:0];
    if (self->_shouldRestartAdvertising)
    {
      self->_shouldRestartAdvertising = 0;
      [(SFBonjourNearBy *)self _startAdvertiser];
    }
  }
}

uint64_t __41__SFBonjourNearBy__updateAdvertiserState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isConnected] ^ 1;
}

- (void)_startBrowser
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Unable to start the browser", v2, v3, v4, v5, v6);
}

void __32__SFBonjourNearBy__startBrowser__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint8_t v6 = daemon_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "nw_browser_state_t changed:%d error:%@", (uint8_t *)v12, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 - 2) >= 2)
    {
      if (a2 == 1)
      {
        [WeakRetained setBrowserState:2];
        int v9 = daemon_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v12[0]) = 0;
          _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_DEFAULT, "SFbonjourNearbyBrowser successfully started", (uint8_t *)v12, 2u);
        }

        uint64_t v10 = [v8 deviceDidStartScanning];

        if (v10)
        {
          uint64_t v11 = [v8 deviceDidStartScanning];
          v11[2](v11, 0);
        }
      }
    }
    else
    {
      [WeakRetained setBrowser:0];
      [v8 _cleanupBrowser];
    }
  }
}

void __32__SFBonjourNearBy__startBrowser__block_invoke_151(uint64_t a1, void *a2, void *a3, int a4)
{
  old_uint64_t result = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    nw_browse_result_change_t changes = nw_browse_result_get_changes(old_result, v7);
    if (changes >= 2)
    {
      uint64_t v10 = [[SFBonjourBrowserResultChanges alloc] initWithOldResult:old_result freshResult:v7 change:changes];
      uint64_t v11 = [WeakRetained resultChanges];
      [v11 addObject:v10];

      if (a4)
      {
        id v12 = [WeakRetained resultChanges];
        __int16 v13 = (void *)[v12 copy];

        id v14 = [WeakRetained resultChanges];
        [v14 removeAllObjects];

        [WeakRetained handleBrowseResults:v13];
      }
    }
  }
}

- (BOOL)startDiscovery
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFBonjourNearBy_startDiscovery__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(serialQueue, block);
  return 1;
}

unsigned char *__33__SFBonjourNearBy_startDiscovery__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) browserState];
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (v2 == 3)
  {
    result[24] = 1;
  }
  else
  {
    int v4 = [result browserState];
    id v5 = *(void **)(a1 + 32);
    if (v4 == 2)
    {
      return (unsigned char *)[v5 _reportCachedDiscoveryResults];
    }
    else
    {
      return (unsigned char *)[v5 _startBrowser];
    }
  }
  return result;
}

- (void)_stopBrowser
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(SFBonjourNearBy *)self browserState] == 2)
  {
    [(SFBonjourNearBy *)self setBrowserState:3];
    browser = self->_browser;
    nw_browser_cancel(browser);
  }
  else
  {
    int v4 = daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = [(SFBonjourNearBy *)self browserState];
      _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "StopBrowser is not stopping. current browser state %d", (uint8_t *)v5, 8u);
    }
  }
}

- (void)stopDiscovery
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SFBonjourNearBy_stopDiscovery__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __32__SFBonjourNearBy_stopDiscovery__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  return [*(id *)(a1 + 32) _stopBrowser];
}

- (void)_reportCachedDiscoveryResults
{
  id location = 0;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SFBonjourNearBy__reportCachedDiscoveryResults__block_invoke;
  v4[3] = &unk_1E5BBCB80;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__SFBonjourNearBy__reportCachedDiscoveryResults__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained && [WeakRetained browserState] == 2)
  {
    uint64_t v3 = [v2 browserToAdvNwToSFendpoints];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __48__SFBonjourNearBy__reportCachedDiscoveryResults__block_invoke_2;
    v4[3] = &unk_1E5BC0A68;
    void v4[4] = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

void __48__SFBonjourNearBy__reportCachedDiscoveryResults__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  int v4 = [*(id *)(a1 + 32) deviceFoundHandler];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) deviceFoundHandler];
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    id v7 = [v11 remoteUniqueIDString];
    uint64_t v8 = (void *)[v6 initWithUUIDString:v7];
    int v9 = [v11 remoteAdvDataSet];
    uint64_t v10 = [v9 allObjects];
    ((void (**)(void, void *, void *))v5)[2](v5, v8, v10);
  }
}

- (void)_cleanupBrowser
{
  if ([(SFBonjourNearBy *)self browserState])
  {
    uint64_t v3 = daemon_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up browser", v7, 2u);
    }

    int v4 = [(SFBonjourNearBy *)self browserToAdvNwToSFendpoints];
    [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_155_0];

    [(SFBonjourNearBy *)self _updateBrowserState];
    id v5 = [(SFBonjourNearBy *)self deviceDidStopScanning];

    if (v5)
    {
      id v6 = [(SFBonjourNearBy *)self deviceDidStopScanning];
      v6[2](v6, 0);
    }
  }
}

void __34__SFBonjourNearBy__cleanupBrowser__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (([v3 isConnected] & 1) == 0) {
    [v3 cancel];
  }
}

- (void)_updateBrowserState
{
  id v3 = [(SFBonjourNearBy *)self browserToAdvNwToSFendpoints];
  id v4 = [v3 keysOfEntriesPassingTest:&__block_literal_global_157];

  if (![v4 count] && !self->_browser)
  {
    [(SFBonjourNearBy *)self setBrowserState:0];
    if (self->_shouldRestartBrowsing)
    {
      self->_shouldRestartBrowsing = 0;
      [(SFBonjourNearBy *)self _startBrowser];
    }
  }
}

uint64_t __38__SFBonjourNearBy__updateBrowserState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isConnected] ^ 1;
}

- (void)handleBrowseResults:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v25;
    *(void *)&long long v6 = 138412290;
    long long v23 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v10, "change", v23) & 2) != 0)
        {
          v16 = [v10 freshResult];
          id v12 = nw_browse_result_copy_endpoint(v16);

          if (![(SFBonjourNearBy *)self isLocalEndpoint:v12])
          {
            v17 = [(SFBonjourNearBy *)self browserToAdvNwToSFendpoints];
            uint64_t v18 = [v17 objectForKey:v12];

            id v14 = daemon_log();
            BOOL v19 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
            if (v18)
            {
              if (v19)
              {
                *(_DWORD *)buf = v23;
                v29 = v12;
                _os_log_impl(&dword_1A5389000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate endpoint %@", buf, 0xCu);
              }
            }
            else
            {
              if (v19)
              {
                *(_DWORD *)buf = 138412546;
                v29 = v12;
                __int16 v30 = 2048;
                __int16 v31 = v12;
                _os_log_impl(&dword_1A5389000, v14, OS_LOG_TYPE_DEFAULT, "Found endpoint %@, (%p)", buf, 0x16u);
              }

              uint64_t v20 = +[SFBonjourEndpoint createConnectionParameters];
              id v14 = nw_connection_create(v12, v20);

              uint64_t v21 = [(SFBonjourNearBy *)self _handleConnection:v14 isAdvToBrowserConnection:0];
              uint64_t v22 = daemon_log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v29 = v14;
                __int16 v30 = 2112;
                __int16 v31 = v21;
                _os_log_impl(&dword_1A5389000, v22, OS_LOG_TYPE_DEFAULT, "New Browser to Adv connection %@ (endpoint %@)", buf, 0x16u);
              }
            }
            goto LABEL_21;
          }
        }
        else
        {
          if (([v10 change] & 4) == 0) {
            continue;
          }
          id v11 = [v10 oldResult];
          id v12 = nw_browse_result_copy_endpoint(v11);

          if (![(SFBonjourNearBy *)self isLocalEndpoint:v12])
          {
            __int16 v13 = [(SFBonjourNearBy *)self browserToAdvNwToSFendpoints];
            id v14 = [v13 objectForKey:v12];

            uint64_t v15 = daemon_log();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v12;
              __int16 v30 = 2112;
              __int16 v31 = v14;
              _os_log_impl(&dword_1A5389000, v15, OS_LOG_TYPE_DEFAULT, "Removing endpoint %@ %@", buf, 0x16u);
            }

            [v14 cancel];
LABEL_21:
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }
}

- (id)_handleConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4
{
  BOOL v4 = a4;
  long long v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6)
  {
    uint64_t v7 = 40;
    if (v4) {
      uint64_t v7 = 32;
    }
    uint64_t v8 = *(id *)((char *)&self->super.isa + v7);
    int v9 = [[SFBonjourEndpoint alloc] initWithConnection:v6 isAdvToBrowserConnection:v4 localUniqueID:v8 withQueue:self->_serialQueue];
    if (v9)
    {
      uint64_t v10 = nw_connection_copy_endpoint(v6);
      if (v4) {
        [(SFBonjourNearBy *)self advToBrowserNwToSFendpoints];
      }
      else {
      id v11 = [(SFBonjourNearBy *)self browserToAdvNwToSFendpoints];
      }
      [v11 setObject:v9 forKey:v10];

      location[0] = 0;
      objc_initWeak(location, self);
      id from = 0;
      objc_initWeak(&from, v9);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      _DWORD v20[2] = __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke;
      v20[3] = &unk_1E5BC0A90;
      objc_copyWeak(&v21, &from);
      objc_copyWeak(&v22, location);
      BOOL v23 = v4;
      [(SFBonjourEndpoint *)v9 setDidConnectHandler:v20];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_2;
      v17[3] = &unk_1E5BC0AB8;
      objc_copyWeak(&v18, location);
      objc_copyWeak(&v19, &from);
      [(SFBonjourEndpoint *)v9 setDidDisconnectHandler:v17];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_171;
      v14[3] = &unk_1E5BC0AE0;
      objc_copyWeak(&v15, location);
      objc_copyWeak(&v16, &from);
      [(SFBonjourEndpoint *)v9 setDidReceiveDataHandler:v14];
      id v12 = v9;
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);
    }
    else
    {
      uint64_t v10 = daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SFBonjourNearBy _handleConnection:isAdvToBrowserConnection:]();
      }
    }
  }
  else
  {
    uint64_t v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SFBonjourNearBy _handleConnection:isAdvToBrowserConnection:](v4, v8);
    }
    int v9 = 0;
  }

  return v9;
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (v3 && WeakRetained)
  {
    BOOL v4 = [WeakRetained remoteUniqueIDString];

    uint64_t v5 = daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!v4)
    {
      if (v6) {
        __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_cold_1();
      }
      goto LABEL_13;
    }
    if (v6) {
      __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_cold_2(WeakRetained, v5);
    }

    if (*(unsigned char *)(a1 + 48)) {
      [v3 advToBrowserUuidToSFendpoints];
    }
    else {
    uint64_t v7 = [v3 browserToAdvUuidToSFendpoints];
    }
    uint64_t v8 = [WeakRetained remoteUniqueIDString];
    [v7 setObject:WeakRetained forKey:v8];

    if ([WeakRetained isAdvToBrowserConnection])
    {
      uint64_t v5 = [v3[20] allObjects];
      int v9 = [WeakRetained remoteUniqueIDString];
      [v3 _sendMessage:v5 withType:@"SFBonjourNearbyMessageTypeStartAdvertiseData" toDevice:v9 completionCallback:&__block_literal_global_170_0];

LABEL_13:
    }
  }
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v4 = v3;
  if (!WeakRetained || !v3) {
    goto LABEL_20;
  }
  uint64_t v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_2_cold_1(v4, v5);
  }

  BOOL v6 = [v4 remoteUniqueIDString];

  if (v6)
  {
    uint64_t v7 = [WeakRetained deviceDidDisconnectHandler];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      int v9 = [v4 isConnected];

      if (v9)
      {
        uint64_t v10 = [WeakRetained deviceDidDisconnectHandler];
        id v11 = objc_alloc(MEMORY[0x1E4F29128]);
        id v12 = [v4 remoteUniqueIDString];
        __int16 v13 = (void *)[v11 initWithUUIDString:v12];
        ((void (**)(void, void *))v10)[2](v10, v13);
LABEL_12:

        goto LABEL_13;
      }
    }
    uint64_t v14 = [WeakRetained deviceLostHandler];
    if (v14)
    {
      id v15 = (void *)v14;
      char v16 = [v4 isAdvToBrowserConnection];

      if ((v16 & 1) == 0)
      {
        uint64_t v10 = [WeakRetained deviceLostHandler];
        id v17 = objc_alloc(MEMORY[0x1E4F29128]);
        id v12 = [v4 remoteUniqueIDString];
        __int16 v13 = (void *)[v17 initWithUUIDString:v12];
        ((void (*)(void (**)(void, void), void *, void))v10[2])(v10, v13, 0);
        goto LABEL_12;
      }
    }
  }
LABEL_13:
  if ([v4 isAdvToBrowserConnection])
  {
    id v18 = [WeakRetained advToBrowserNwToSFendpoints];
    id v19 = [v4 remoteEndpoint];
    [v18 removeObjectForKey:v19];

    uint64_t v20 = [v4 remoteUniqueIDString];

    if (v20)
    {
      id v21 = [WeakRetained advToBrowserUuidToSFendpoints];
      id v22 = [v4 remoteUniqueIDString];
      [v21 removeObjectForKey:v22];
    }
    [WeakRetained _updateAdvertiserState];
  }
  else
  {
    BOOL v23 = [WeakRetained browserToAdvNwToSFendpoints];
    long long v24 = [v4 remoteEndpoint];
    [v23 removeObjectForKey:v24];

    long long v25 = [v4 remoteUniqueIDString];

    if (v25)
    {
      long long v26 = [WeakRetained browserToAdvUuidToSFendpoints];
      long long v27 = [v4 remoteUniqueIDString];
      [v26 removeObjectForKey:v27];
    }
    [WeakRetained _updateBrowserState];
  }
LABEL_20:
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_171(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v6 = v5;
  if (WeakRetained && v5)
  {
    uint64_t v34 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:&v34 error:0];
    if (!v7)
    {
      uint64_t v10 = daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_171_cold_1();
      }
      goto LABEL_20;
    }
    uint64_t v8 = [v6 remoteUniqueIDString];

    int v9 = daemon_log();
    uint64_t v10 = v9;
    if (!v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_171_cold_2();
      }
      goto LABEL_20;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v7;
      __int16 v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_1A5389000, v10, OS_LOG_TYPE_DEFAULT, "Received browser endpoint message %@ from endpoint %@", buf, 0x16u);
    }

    uint64_t v10 = [v7 objectForKeyedSubscript:@"SFBonjourNearbyMessageType"];
    if ([v10 isEqualToString:@"SFBonjourNearbyMessageTypeStartAdvertiseData"])
    {
      id v11 = [v6 remoteAdvDataSet];
      id v12 = [v7 objectForKeyedSubscript:@"SFBonjourNearbyMessageValue"];
      [v11 addObjectsFromArray:v12];

      __int16 v13 = [WeakRetained deviceFoundHandler];

      if (v13)
      {
        uint64_t v14 = [WeakRetained deviceFoundHandler];
LABEL_17:
        uint64_t v20 = v14;
        id v21 = objc_alloc(MEMORY[0x1E4F29128]);
        id v22 = [v6 remoteUniqueIDString];
        BOOL v23 = (void *)[v21 initWithUUIDString:v22];
        long long v24 = [v7 objectForKeyedSubscript:@"SFBonjourNearbyMessageValue"];
        (*(void (**)(uint64_t, void *, void *))(v20 + 16))(v20, v23, v24);

        goto LABEL_18;
      }
    }
    else
    {
      if (![v10 isEqualToString:@"SFBonjourNearbyMessageTypeStopAdvertiseData"])
      {
        if ([v10 isEqualToString:@"SFBonjourNearbyMessageTypeConnect"])
        {
          [v6 setIsConnected:1];
          long long v25 = [WeakRetained deviceDidConnectHandler];

          if (!v25) {
            goto LABEL_20;
          }
          uint64_t v20 = [WeakRetained deviceDidConnectHandler];
          id v26 = objc_alloc(MEMORY[0x1E4F29128]);
          id v22 = [v6 remoteUniqueIDString];
          BOOL v23 = (void *)[v26 initWithUUIDString:v22];
          (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v23, 0);
        }
        else
        {
          if (![v10 isEqualToString:@"SFBonjourNearbyMessageTypeDisconnect"])
          {
            if ([v10 isEqualToString:@"SFBonjourNearbyMessageTypeDataPacket"])
            {
              v29 = [WeakRetained deviceDidReceiveDataHandler];

              if (!v29) {
                goto LABEL_20;
              }
              uint64_t v20 = [v7 objectForKeyedSubscript:@"SFBonjourNearbyMessageValue"];
              __int16 v30 = [WeakRetained deviceDidReceiveDataHandler];
              id v31 = objc_alloc(MEMORY[0x1E4F29128]);
              v32 = [v6 remoteUniqueIDString];
              uint64_t v33 = (void *)[v31 initWithUUIDString:v32];
              ((void (**)(void, void *, uint64_t))v30)[2](v30, v33, v20);
            }
            else
            {
              uint64_t v20 = daemon_log();
              if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v10;
                _os_log_impl(&dword_1A5389000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "SFBonjourNearBy unknown message type:%@", buf, 0xCu);
              }
            }
            goto LABEL_19;
          }
          [v6 setIsConnected:0];
          long long v27 = [WeakRetained deviceDidDisconnectHandler];

          if (!v27) {
            goto LABEL_20;
          }
          uint64_t v20 = [WeakRetained deviceDidDisconnectHandler];
          id v28 = objc_alloc(MEMORY[0x1E4F29128]);
          id v22 = [v6 remoteUniqueIDString];
          BOOL v23 = (void *)[v28 initWithUUIDString:v22];
          (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v23);
        }
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      id v15 = [v6 remoteAdvDataSet];
      char v16 = (void *)MEMORY[0x1E4F1CAD0];
      id v17 = [v7 objectForKeyedSubscript:@"SFBonjourNearbyMessageValue"];
      id v18 = [v16 setWithArray:v17];
      [v15 minusSet:v18];

      id v19 = [WeakRetained deviceLostHandler];

      if (v19)
      {
        uint64_t v14 = [WeakRetained deviceLostHandler];
        goto LABEL_17;
      }
    }
LABEL_20:
  }
}

- (void)_sendMessage:(id)a3 withType:(id)a4 toEndpoint:(id)a5 completionCallback:(id)a6
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v30[0] = @"SFBonjourNearbyMessageType";
  v30[1] = @"SFBonjourNearbyMessageValue";
  v31[0] = v11;
  v31[1] = v10;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  id v15 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:200 options:0 error:0];
  char v16 = daemon_log();
  id v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v25 = v14;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl(&dword_1A5389000, v17, OS_LOG_TYPE_DEFAULT, "Sending payload %@ to endpoint %@", buf, 0x16u);
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__SFBonjourNearBy__sendMessage_withType_toEndpoint_completionCallback___block_invoke;
    v22[3] = &unk_1E5BBCD68;
    id v23 = v13;
    [v12 sendDataMessage:v15 completion:v22];
    id v18 = v23;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[SFBonjourNearBy _sendMessage:withType:toEndpoint:completionCallback:]();
  }

  if (v13)
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28760];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29 = @"Unable to send message, failed to serialize payload";
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v18 = [v19 errorWithDomain:v20 code:-6700 userInfo:v21];

    (*((void (**)(id, void *))v13 + 2))(v13, v18);
LABEL_9:
  }
}

uint64_t __71__SFBonjourNearBy__sendMessage_withType_toEndpoint_completionCallback___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_sendMessage:(id)a3 withType:(id)a4 toDevice:(id)a5 completionCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id location = 0;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__SFBonjourNearBy__sendMessage_withType_toDevice_completionCallback___block_invoke;
  v19[3] = &unk_1E5BC0B08;
  objc_copyWeak(&v24, &location);
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  dispatch_async(serialQueue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __69__SFBonjourNearBy__sendMessage_withType_toDevice_completionCallback___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained _endpointForUniqueID:*(void *)(a1 + 32)];
    if (v4 && *(void *)(a1 + 40) && *(void *)(a1 + 48))
    {
      objc_msgSend(v3, "_sendMessage:withType:toEndpoint:completionCallback:");
    }
    else
    {
      id v5 = daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __69__SFBonjourNearBy__sendMessage_withType_toDevice_completionCallback___block_invoke_cold_1();
      }

      if (*(void *)(a1 + 56))
      {
        BOOL v6 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v7 = *MEMORY[0x1E4F28760];
        uint64_t v10 = *MEMORY[0x1E4F28568];
        v11[0] = @"Unable to send message, invalid params";
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
        int v9 = [v6 errorWithDomain:v7 code:-6705 userInfo:v8];

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
  }
}

- (void)_sendAdvMessageWithData:(id)a3 isStart:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = @"SFBonjourNearbyMessageTypeStopAdvertiseData";
  if (v6) {
    uint64_t v10 = @"SFBonjourNearbyMessageTypeStartAdvertiseData";
  }
  id v11 = v10;
  id v12 = [(SFBonjourNearBy *)self advToBrowserUuidToSFendpoints];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__SFBonjourNearBy__sendAdvMessageWithData_isStart_completionHandler___block_invoke;
  v16[3] = &unk_1E5BC0B30;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  id v18 = v11;
  id v14 = v9;
  id v19 = v14;
  id v15 = v11;
  [v12 enumerateKeysAndObjectsUsingBlock:v16];

  if (v14) {
    (*((void (**)(id, id, void))v14 + 2))(v14, v13, 0);
  }
}

void __69__SFBonjourNearBy__sendAdvMessageWithData_isStart_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  v11[0] = *(void *)(a1 + 40);
  BOOL v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  BOOL v6 = [v4 arrayWithObjects:v11 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__SFBonjourNearBy__sendAdvMessageWithData_isStart_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5BBE0F8;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  [v3 _sendMessage:v6 withType:v7 toDevice:v5 completionCallback:v8];
}

uint64_t __69__SFBonjourNearBy__sendAdvMessageWithData_isStart_completionHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 40);
    if (v2) {
      return (*(uint64_t (**)(void, void, uint64_t))(v2 + 16))(*(void *)(result + 40), *(void *)(result + 32), a2);
    }
  }
  return result;
}

- (void)connectToDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUIDString];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SFBonjourNearBy_connectToDevice___block_invoke;
  v7[3] = &unk_1E5BBCBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SFBonjourNearBy *)self _sendMessage:MEMORY[0x1E4F1CC08] withType:@"SFBonjourNearbyMessageTypeConnect" toDevice:v5 completionCallback:v7];
}

void __35__SFBonjourNearBy_connectToDevice___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) UUIDString];
  id v5 = [v3 _endpointForUniqueID:v4];

  if (!v8) {
    [v5 setIsConnected:1];
  }
  id v6 = [*(id *)(a1 + 32) deviceDidConnectHandler];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) deviceDidConnectHandler];
    ((void (**)(void, void, id))v7)[2](v7, *(void *)(a1 + 40), v8);
  }
}

- (void)disconnectFromDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUIDString];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SFBonjourNearBy_disconnectFromDevice___block_invoke;
  v7[3] = &unk_1E5BBCBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SFBonjourNearBy *)self _sendMessage:MEMORY[0x1E4F1CC08] withType:@"SFBonjourNearbyMessageTypeDisconnect" toDevice:v5 completionCallback:v7];
}

void __40__SFBonjourNearBy_disconnectFromDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) UUIDString];
  id v10 = [v2 _endpointForUniqueID:v3];

  [v10 setIsConnected:0];
  id v4 = [*(id *)(a1 + 32) deviceDidDisconnectHandler];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) deviceDidDisconnectHandler];
    v5[2](v5, *(void *)(a1 + 40));
  }
  uint64_t v6 = [*(id *)(a1 + 32) deviceLostHandler];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    char v8 = [v10 isAdvToBrowserConnection];

    if ((v8 & 1) == 0)
    {
      id v9 = [*(id *)(a1 + 32) deviceLostHandler];
      v9[2](v9, *(void *)(a1 + 40), 0);
    }
  }
}

- (BOOL)sendData:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 UUIDString];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__SFBonjourNearBy_sendData_toDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E5BC0B58;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(SFBonjourNearBy *)self _sendMessage:v14 withType:@"SFBonjourNearbyMessageTypeDataPacket" toDevice:v11 completionCallback:v16];

  return 1;
}

void __55__SFBonjourNearBy_sendData_toDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__SFBonjourNearBy_sendData_toDevice_completionHandler___block_invoke_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (BOOL)isLocalEndpoint:(id)a3
{
  id v4 = [NSString stringWithUTF8String:nw_endpoint_get_bonjour_service_name((nw_endpoint_t)a3)];
  uint64_t v5 = [(SFBonjourNearBy *)self getUniqueServiceNameForAdvertiser];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (id)_endpointForUniqueID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SFBonjourNearBy _endpointForUniqueID:]();
    }
    goto LABEL_8;
  }
  uint64_t v5 = [(SFBonjourNearBy *)self advToBrowserUuidToSFendpoints];
  char v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v7 = [(SFBonjourNearBy *)self browserToAdvUuidToSFendpoints];
    char v6 = [v7 objectForKeyedSubscript:v4];

    if (!v6)
    {
      id v8 = daemon_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SFBonjourNearBy _endpointForUniqueID:]();
      }
LABEL_8:

      char v6 = 0;
    }
  }

  return v6;
}

- (void)_cleanUp
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SFBonjourNearBy__cleanUp__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __27__SFBonjourNearBy__cleanUp__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopBrowser];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _stopAdvertising];
}

- (void)dealloc
{
  [(SFBonjourNearBy *)self _cleanUp];
  v3.receiver = self;
  v3.super_class = (Class)SFBonjourNearBy;
  [(SFBonjourNearBy *)&v3 dealloc];
}

- (id)advertisingStateUpdateHandler
{
  return self->_advertisingStateUpdateHandler;
}

- (void)setAdvertisingStateUpdateHandler:(id)a3
{
}

- (id)discoveryStateUpdateHandler
{
  return self->_discoveryStateUpdateHandler;
}

- (void)setDiscoveryStateUpdateHandler:(id)a3
{
}

- (id)deviceDidStartScanning
{
  return self->_deviceDidStartScanning;
}

- (void)setDeviceDidStartScanning:(id)a3
{
}

- (id)deviceDidStopScanning
{
  return self->_deviceDidStopScanning;
}

- (void)setDeviceDidStopScanning:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceDidConnectHandler
{
  return self->_deviceDidConnectHandler;
}

- (void)setDeviceDidConnectHandler:(id)a3
{
}

- (id)deviceDidDisconnectHandler
{
  return self->_deviceDidDisconnectHandler;
}

- (void)setDeviceDidDisconnectHandler:(id)a3
{
}

- (id)deviceDidReceiveDataHandler
{
  return self->_deviceDidReceiveDataHandler;
}

- (void)setDeviceDidReceiveDataHandler:(id)a3
{
}

- (OS_nw_listener)listener
{
  return (OS_nw_listener *)objc_getProperty(self, a2, 128, 1);
}

- (void)setListener:(id)a3
{
}

- (OS_nw_browser)browser
{
  return (OS_nw_browser *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBrowser:(id)a3
{
}

- (OS_nw_endpoint)endpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 144, 1);
}

- (NSMutableSet)resultChanges
{
  return (NSMutableSet *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResultChanges:(id)a3
{
}

- (NSMutableSet)advertiserAdvs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAdvertiserAdvs:(id)a3
{
}

- (NSMutableDictionary)advToBrowserNwToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAdvToBrowserNwToSFendpoints:(id)a3
{
}

- (NSMutableDictionary)advToBrowserUuidToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAdvToBrowserUuidToSFendpoints:(id)a3
{
}

- (NSMutableDictionary)browserToAdvNwToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setBrowserToAdvNwToSFendpoints:(id)a3
{
}

- (NSMutableDictionary)browserToAdvUuidToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBrowserToAdvUuidToSFendpoints:(id)a3
{
}

- (int)browserState
{
  return self->_browserState;
}

- (void)setBrowserState:(int)a3
{
  self->_browserState = a3;
}

- (int)advertiserState
{
  return self->_advertiserState;
}

- (void)setAdvertiserState:(int)a3
{
  self->_advertiserState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserToAdvUuidToSFendpoints, 0);
  objc_storeStrong((id *)&self->_browserToAdvNwToSFendpoints, 0);
  objc_storeStrong((id *)&self->_advToBrowserUuidToSFendpoints, 0);
  objc_storeStrong((id *)&self->_advToBrowserNwToSFendpoints, 0);
  objc_storeStrong((id *)&self->_advertiserAdvs, 0);
  objc_storeStrong((id *)&self->_resultChanges, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_deviceDidReceiveDataHandler, 0);
  objc_storeStrong(&self->_deviceDidDisconnectHandler, 0);
  objc_storeStrong(&self->_deviceDidConnectHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_deviceDidStopScanning, 0);
  objc_storeStrong(&self->_deviceDidStartScanning, 0);
  objc_storeStrong(&self->_discoveryStateUpdateHandler, 0);
  objc_storeStrong(&self->_advertisingStateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_localBrowserUUIDString, 0);
  objc_storeStrong((id *)&self->_localAdvertiserUUIDString, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __35__SFBonjourNearBy__startAdvertiser__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "advertiser failed", v2, v3, v4, v5, v6);
}

void __35__SFBonjourNearBy__startAdvertiser__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "advertiser error %@", v2, v3, v4, v5, v6);
}

- (void)_handleConnection:(char)a1 isAdvToBrowserConnection:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Got nil connection (isAdvToBrowserConnection : %d)", (uint8_t *)v2, 8u);
}

- (void)_handleConnection:isAdvToBrowserConnection:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Failed to create endpoint for connection %@", v2, v3, v4, v5, v6);
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Did not get remoteUniqueIDString from endpoint %@", v2, v3, v4, v5, v6);
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 isAdvToBrowserConnection];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_1A5389000, a2, v3, "Established [%@] connection for endpoint %@", v4);
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 isAdvToBrowserConnection];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_1A5389000, a2, v3, "[%@] connection closed for endpoint %@", v4);
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_171_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A5389000, v0, (uint64_t)v0, "Unable to deserialize data: %@, for endpoint %@", v1);
}

void __62__SFBonjourNearBy__handleConnection_isAdvToBrowserConnection___block_invoke_171_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1A5389000, v0, (uint64_t)v0, "Received browser endpoint message %@ from endpoint %@ without uuid", v1);
}

- (void)_sendMessage:withType:toEndpoint:completionCallback:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Unable to send message, failed to serialize payload %@", v2, v3, v4, v5, v6);
}

void __69__SFBonjourNearBy__sendMessage_withType_toDevice_completionCallback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_1A5389000, v0, v1, "Unable to send message %@ with type %@ to deviceID %@ (Invalid params)");
}

void __55__SFBonjourNearBy_sendData_toDevice_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_1A5389000, v0, v1, "Failed to send data %@ to device %@, error %@");
}

- (void)_endpointForUniqueID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Empty uniqueID!", v2, v3, v4, v5, v6);
}

- (void)_endpointForUniqueID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1A5389000, v0, v1, "Unable to find endpoint for deviceID %@", v2, v3, v4, v5, v6);
}

@end