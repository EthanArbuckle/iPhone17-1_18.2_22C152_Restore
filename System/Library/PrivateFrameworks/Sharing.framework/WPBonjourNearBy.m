@interface WPBonjourNearBy
- (WPBonjourNearBy)initWithDelegate:(id)a3 queue:(id)a4;
- (int64_t)state;
- (void)_listenForSFBonjourEvents;
- (void)connectToPeer:(id)a3 withOptions:(id)a4;
- (void)disconnectFromPeer:(id)a3;
- (void)sendData:(id)a3 toPeer:(id)a4;
- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6;
- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6 options:(id)a7;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4;
- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 priority:(int64_t)a5;
- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10 useCaseList:(id)a11;
- (void)stopAdvertisingOfType:(int64_t)a3;
- (void)stopScanningForType:(int64_t)a3;
@end

@implementation WPBonjourNearBy

- (WPBonjourNearBy)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WPBonjourNearBy;
  v9 = [(WPBonjourNearBy *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_dispatch_queue, a4);
    v11 = [[SFBonjourNearBy alloc] initWithQueue:v8];
    sfBonjourNearBy = v10->_sfBonjourNearBy;
    v10->_sfBonjourNearBy = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    advertiserNearbyTypesAdvData = v10->_advertiserNearbyTypesAdvData;
    v10->_advertiserNearbyTypesAdvData = (NSMutableDictionary *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scannerNearbyTypesToScan = v10->_scannerNearbyTypesToScan;
    v10->_scannerNearbyTypesToScan = v15;

    v10->_state = 3;
    [(WPBonjourNearBy *)v10 _listenForSFBonjourEvents];
  }

  return v10;
}

- (void)_listenForSFBonjourEvents
{
  id location = 0;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke;
  v15[3] = &unk_1E5BBCB58;
  objc_copyWeak(&v16, &location);
  [(SFBonjourNearBy *)self->_sfBonjourNearBy setDeviceDidStartScanning:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2;
  v13[3] = &unk_1E5BC0700;
  objc_copyWeak(&v14, &location);
  [(SFBonjourNearBy *)self->_sfBonjourNearBy setDeviceFoundHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_135;
  v11[3] = &unk_1E5BC0700;
  objc_copyWeak(&v12, &location);
  [(SFBonjourNearBy *)self->_sfBonjourNearBy setDeviceLostHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_139;
  v9[3] = &unk_1E5BBC4A0;
  objc_copyWeak(&v10, &location);
  [(SFBonjourNearBy *)self->_sfBonjourNearBy setAdvertisingStateUpdateHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_146;
  v7[3] = &unk_1E5BC0750;
  objc_copyWeak(&v8, &location);
  [(SFBonjourNearBy *)self->_sfBonjourNearBy setDeviceDidConnectHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_150;
  v5[3] = &unk_1E5BC0778;
  objc_copyWeak(&v6, &location);
  [(SFBonjourNearBy *)self->_sfBonjourNearBy setDeviceDidDisconnectHandler:v5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_154;
  v3[3] = &unk_1E5BC07A0;
  objc_copyWeak(&v4, &location);
  [(SFBonjourNearBy *)self->_sfBonjourNearBy setDeviceDidReceiveDataHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "deviceDidStartScanning with error %@\n", buf, 0xCu);
    }

    if (objc_opt_respondsToSelector())
    {
      id v6 = (void *)WeakRetained[3];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_121;
      v7[3] = &unk_1E5BC0268;
      void v7[4] = WeakRetained;
      [v6 enumerateKeysAndObjectsUsingBlock:v7];
    }
  }
}

uint64_t __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_121(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  uint64_t v4 = [a2 unsignedIntValue];

  return [v3 nearby:v2 didStartScanningForType:v4];
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 UUIDString];
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Found device %@ with advertisementData %@\n", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_126;
      v10[3] = &unk_1E5BC06D8;
      v10[4] = WeakRetained;
      id v11 = v5;
      [v6 enumerateObjectsUsingBlock:v10];
    }
  }
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 40);
  id v5 = a2;
  id v8 = [v5 objectForKeyedSubscript:@"WPBonjourNearbyType"];
  uint64_t v6 = [v8 unsignedIntValue];
  id v7 = [v5 objectForKeyedSubscript:@"WPBonjourNearbyPayloadKey"];

  [v4 nearby:v3 didDiscoverType:v6 withData:v7 fromPeer:*(void *)(a1 + 40) peerInfo:0];
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_135(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = daemon_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 UUIDString];
    *(_DWORD *)buf = 138412290;
    __int16 v14 = v9;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Lost device %@\n", buf, 0xCu);
  }
  if (WeakRetained)
  {
    if (v6) {
      [v6 valueForKey:@"WPBonjourNearbyType"];
    }
    else {
    uint64_t v10 = [WeakRetained[3] allKeys];
    }
    if (objc_opt_respondsToSelector())
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_138;
      v11[3] = &unk_1E5BC06D8;
      void v11[4] = WeakRetained;
      id v12 = v5;
      [v10 enumerateObjectsUsingBlock:v11];
    }
  }
}

uint64_t __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 40);
  uint64_t v5 = [a2 unsignedIntValue];

  return [v4 nearby:v2 didLosePeer:v3 type:v5];
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_139(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v13 = a2;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, "Advertising state update isStarted %d with error %@\n", buf, 0x12u);
    }

    id v8 = (void *)WeakRetained[3];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_140;
    v9[3] = &unk_1E5BC0728;
    char v11 = a2;
    void v9[4] = WeakRetained;
    id v10 = v5;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 48))
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "nearby:didStartAdvertisingType:", *(void *)(a1 + 32), objc_msgSend(v6, "unsignedIntValue"));
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "nearby:didStopAdvertisingType:withError:", *(void *)(a1 + 32), objc_msgSend(v6, "unsignedIntValue"), *(void *)(a1 + 40));
  }
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_2_146(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Device didConnect %@ with error %@\n", (uint8_t *)&v9, 0x16u);
    }

    if (objc_opt_respondsToSelector()) {
      [WeakRetained[5] nearby:WeakRetained didConnectToPeer:v5 transport:0 error:v6];
    }
  }
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Device didDisConnect %@", (uint8_t *)&v6, 0xCu);
    }

    if (objc_opt_respondsToSelector()) {
      [WeakRetained[5] nearby:WeakRetained didDisconnectFromPeer:v3 error:0];
    }
  }
}

void __44__WPBonjourNearBy__listenForSFBonjourEvents__block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Device didReceiveData from %@ with data %@\n", (uint8_t *)&v9, 0x16u);
    }

    if (objc_opt_respondsToSelector()) {
      [WeakRetained[5] nearby:WeakRetained didReceiveData:v6 fromPeer:v5];
    }
  }
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4
{
}

- (void)startAdvertisingOfType:(int64_t)a3 withData:(id)a4 priority:(int64_t)a5
{
}

- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6
{
}

- (void)startAdvertisingOfType:(int64_t)a3 data:(id)a4 priority:(int64_t)a5 mode:(int64_t)a6 options:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a7;
  id v12 = self;
  objc_sync_enter(v12);
  uint64_t v13 = daemon_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = a3;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "startAdvertisingOfType %ld with data %@\n", buf, 0x16u);
  }

  advertiserNearbyTypesAdvData = v12->_advertiserNearbyTypesAdvData;
  id v15 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)advertiserNearbyTypesAdvData setObject:v10 forKeyedSubscript:v15];

  *(void *)buf = 0;
  objc_initWeak((id *)buf, v12);
  v21[0] = @"WPBonjourNearbyType";
  uint64_t v16 = [NSNumber numberWithInteger:a3];
  v21[1] = @"WPBonjourNearbyPayloadKey";
  v22[0] = v16;
  v22[1] = v10;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  sfBonjourNearBy = v12->_sfBonjourNearBy;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__WPBonjourNearBy_startAdvertisingOfType_data_priority_mode_options___block_invoke;
  v19[3] = &unk_1E5BC07C8;
  objc_copyWeak(v20, (id *)buf);
  v20[1] = (id)a3;
  v19[4] = v12;
  [(SFBonjourNearBy *)sfBonjourNearBy startAdvertisingWithData:v17 completionHandler:v19];
  objc_destroyWeak(v20);

  objc_destroyWeak((id *)buf);
  objc_sync_exit(v12);
}

void __69__WPBonjourNearBy_startAdvertisingOfType_data_priority_mode_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 5);
    uint64_t v7 = *(void *)(a1 + 48);
    if (v10)
    {
      [v6 nearby:v5 didFailToStartAdvertisingOfType:v7 withError:v10];
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 16);
      int v9 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      [v8 removeObjectForKey:v9];
    }
    else
    {
      [v6 nearby:v5 didStartAdvertisingType:v7];
    }
  }
}

- (void)stopAdvertisingOfType:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  advertiserNearbyTypesAdvData = v4->_advertiserNearbyTypesAdvData;
  id v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)advertiserNearbyTypesAdvData objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "stopAdvertisingOfType %ld", buf, 0xCu);
    }

    v19[0] = @"WPBonjourNearbyType";
    int v9 = [NSNumber numberWithInteger:a3];
    v19[1] = @"WPBonjourNearbyPayloadKey";
    v20[0] = v9;
    id v10 = v4->_advertiserNearbyTypesAdvData;
    id v11 = [NSNumber numberWithInteger:a3];
    id v12 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];
    v20[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

    __int16 v14 = v4->_advertiserNearbyTypesAdvData;
    id v15 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v14 removeObjectForKey:v15];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, v4);
    sfBonjourNearBy = v4->_sfBonjourNearBy;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__WPBonjourNearBy_stopAdvertisingOfType___block_invoke;
    v17[3] = &unk_1E5BC07F0;
    objc_copyWeak(v18, (id *)buf);
    v18[1] = (id)a3;
    [(SFBonjourNearBy *)sfBonjourNearBy stopAdvertisingForData:v13 completionHandler:v17];
    objc_destroyWeak(v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v13 = daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_impl(&dword_1A5389000, v13, OS_LOG_TYPE_DEFAULT, "No Advertising for type %ld, not stopping anything!\n", buf, 0xCu);
    }
  }

  objc_sync_exit(v4);
}

void __41__WPBonjourNearBy_stopAdvertisingOfType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[5] nearby:WeakRetained didStopAdvertisingType:*(void *)(a1 + 40) withError:v6];
  }
}

- (void)startScanningForType:(int64_t)a3 data:(id)a4 mask:(id)a5 peers:(id)a6 scanMode:(int64_t)a7 rssi:(id)a8 duplicates:(BOOL)a9 scanCache:(BOOL)a10 useCaseList:(id)a11
{
  v40[8] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a5;
  id v34 = a6;
  id v36 = a8;
  id v35 = a11;
  objc_super v18 = self;
  objc_sync_enter(v18);
  v39[0] = @"scanMode";
  v19 = [NSNumber numberWithInteger:a7];
  v40[0] = v19;
  v40[1] = v36;
  v39[1] = @"rssi";
  v39[2] = @"duplicates";
  v20 = [NSNumber numberWithBool:a9];
  v40[2] = v20;
  v39[3] = @"scanCache";
  uint64_t v21 = [NSNumber numberWithBool:a10];
  uint64_t v22 = (void *)v21;
  v23 = (void *)MEMORY[0x1E4F1CBF0];
  id v24 = v35;
  if (!v35) {
    id v24 = (id)MEMORY[0x1E4F1CBF0];
  }
  v40[3] = v21;
  v40[4] = v24;
  v39[4] = @"useCaseList";
  v39[5] = @"payloadFilterData";
  id v25 = v16;
  if (!v16)
  {
    id v25 = [MEMORY[0x1E4F1C9B8] data];
  }
  v40[5] = v25;
  v39[6] = @"payloadFilterMaskData";
  uint64_t v26 = v17;
  if (!v17)
  {
    uint64_t v26 = [MEMORY[0x1E4F1C9B8] data];
  }
  v39[7] = @"peers";
  id v27 = v34;
  if (!v34) {
    id v27 = v23;
  }
  v40[6] = v26;
  v40[7] = v27;
  v28 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v40, v39, 8, a3);
  if (!v17) {

  }
  if (!v16) {
  scannerNearbyTypesToScan = v18->_scannerNearbyTypesToScan;
  }
  v30 = [NSNumber numberWithInteger:v33];
  [(NSMutableDictionary *)scannerNearbyTypesToScan setObject:v28 forKey:v30];

  v31 = daemon_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v38 = v33;
    _os_log_impl(&dword_1A5389000, v31, OS_LOG_TYPE_DEFAULT, "[Discovery] starting for type %ld\n", buf, 0xCu);
  }

  [(SFBonjourNearBy *)v18->_sfBonjourNearBy startDiscovery];
  objc_sync_exit(v18);
}

- (void)stopScanningForType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "[Discovery] stopping for type %ld\n", (uint8_t *)&v10, 0xCu);
  }

  scannerNearbyTypesToScan = v4->_scannerNearbyTypesToScan;
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)scannerNearbyTypesToScan removeObjectForKey:v7];

  uint64_t v8 = [(NSMutableDictionary *)v4->_scannerNearbyTypesToScan allKeys];
  LODWORD(scannerNearbyTypesToScan) = [v8 count] == 0;

  sfBonjourNearBy = v4->_sfBonjourNearBy;
  if (scannerNearbyTypesToScan) {
    [(SFBonjourNearBy *)sfBonjourNearBy stopDiscovery];
  }
  else {
    [(SFBonjourNearBy *)sfBonjourNearBy startDiscovery];
  }
  objc_sync_exit(v4);
}

- (void)connectToPeer:(id)a3 withOptions:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = daemon_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, "Connecting to peer %@", (uint8_t *)&v7, 0xCu);
  }

  [(SFBonjourNearBy *)self->_sfBonjourNearBy connectToDevice:v5];
}

- (void)disconnectFromPeer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Disconnecting from peer %@", (uint8_t *)&v6, 0xCu);
  }

  [(SFBonjourNearBy *)self->_sfBonjourNearBy disconnectFromDevice:v4];
}

- (void)sendData:(id)a3 toPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  sfBonjourNearBy = self->_sfBonjourNearBy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__WPBonjourNearBy_sendData_toPeer___block_invoke;
  v11[3] = &unk_1E5BC0818;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(SFBonjourNearBy *)sfBonjourNearBy sendData:v9 toDevice:v10 completionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __35__WPBonjourNearBy_sendData_toPeer___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained[5] nearby:WeakRetained didSendData:*(void *)(a1 + 32) toPeer:*(void *)(a1 + 40) error:v4];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_dispatch_queue, 0);
  objc_storeStrong((id *)&self->_scannerNearbyTypesToScan, 0);
  objc_storeStrong((id *)&self->_advertiserNearbyTypesAdvData, 0);

  objc_storeStrong((id *)&self->_sfBonjourNearBy, 0);
}

@end