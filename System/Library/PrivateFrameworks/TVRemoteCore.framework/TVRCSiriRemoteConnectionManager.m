@interface TVRCSiriRemoteConnectionManager
+ (id)sharedInstance;
- (CBCentralManager)centralManager;
- (CBDiscovery)cbDiscovery;
- (NSMutableDictionary)connectedSiriRemotes;
- (NSMutableDictionary)didConnectHandlerBlockMap;
- (NSMutableSet)discoveredPeripherals;
- (NSMutableSet)remoteInfoSet;
- (TVRCSiriRemoteConnectionManager)init;
- (id)findingSessionStateChangedHandler;
- (int64_t)state;
- (void)_removePeripheral:(id)a3;
- (void)_sendEnableMessage:(BOOL)a3 forRemote:(id)a4;
- (void)_startCBScanIfNeeded;
- (void)_startDiscoveryForRemoteWithInfo:(id)a3 didConnectHandler:(id)a4;
- (void)_stopDiscoveryForRemoteWithInfo:(id)a3;
- (void)_stopScanning;
- (void)_updateFindingSessionState:(int64_t)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)enableFastFindMy:(BOOL)a3 forRemoteWithInfo:(id)a4;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)setCbDiscovery:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setConnectedSiriRemotes:(id)a3;
- (void)setDidConnectHandlerBlockMap:(id)a3;
- (void)setDiscoveredPeripherals:(id)a3;
- (void)setFindingSessionStateChangedHandler:(id)a3;
- (void)setRemoteInfoSet:(id)a3;
- (void)setState:(int64_t)a3;
- (void)teardown;
@end

@implementation TVRCSiriRemoteConnectionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

uint64_t __49__TVRCSiriRemoteConnectionManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(TVRCSiriRemoteConnectionManager);

  return MEMORY[0x270F9A758]();
}

- (TVRCSiriRemoteConnectionManager)init
{
  v18[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)TVRCSiriRemoteConnectionManager;
  v2 = [(TVRCSiriRemoteConnectionManager *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    connectedSiriRemotes = v2->_connectedSiriRemotes;
    v2->_connectedSiriRemotes = (NSMutableDictionary *)v3;

    id v5 = objc_alloc(MEMORY[0x263EFEF00]);
    uint64_t v17 = *MEMORY[0x263EFEE80];
    v18[0] = MEMORY[0x263EFFA88];
    v6 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v7 = [v5 initWithDelegate:v2 queue:0 options:v6];
    centralManager = v2->_centralManager;
    v2->_centralManager = (CBCentralManager *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    remoteInfoSet = v2->_remoteInfoSet;
    v2->_remoteInfoSet = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    didConnectHandlerBlockMap = v2->_didConnectHandlerBlockMap;
    v2->_didConnectHandlerBlockMap = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    discoveredPeripherals = v2->_discoveredPeripherals;
    v2->_discoveredPeripherals = (NSMutableSet *)v13;
  }
  return v2;
}

- (void)enableFastFindMy:(BOOL)a3 forRemoteWithInfo:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"Disable";
    if (v4) {
      v8 = @"Enable";
    }
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "%@ fast finding for remote with info: %@", buf, 0x16u);
  }

  if (v4)
  {
    uint64_t v9 = [(TVRCSiriRemoteConnectionManager *)self connectedSiriRemotes];
    v10 = [v6 name];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];

    if (v11)
    {
      v12 = _TVRCBLEDiscoveryLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "Valid BLE connection found. Skip starting BLE discovery.", buf, 2u);
      }

      [(TVRCSiriRemoteConnectionManager *)self _sendEnableMessage:1 forRemote:v11];
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __70__TVRCSiriRemoteConnectionManager_enableFastFindMy_forRemoteWithInfo___block_invoke;
      v13[3] = &unk_2647AF480;
      v13[4] = self;
      [(TVRCSiriRemoteConnectionManager *)self _startDiscoveryForRemoteWithInfo:v6 didConnectHandler:v13];
    }
  }
  else
  {
    [(TVRCSiriRemoteConnectionManager *)self _stopDiscoveryForRemoteWithInfo:v6];
  }
}

uint64_t __70__TVRCSiriRemoteConnectionManager_enableFastFindMy_forRemoteWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "didConnectHandler called", v6, 2u);
  }

  [*(id *)(a1 + 32) _updateFindingSessionState:4];
  [*(id *)(a1 + 32) _sendEnableMessage:1 forRemote:v3];

  return [*(id *)(a1 + 32) _stopScanning];
}

- (void)_updateFindingSessionState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    id v5 = [(TVRCSiriRemoteConnectionManager *)self findingSessionStateChangedHandler];

    if (v5)
    {
      id v6 = [(TVRCSiriRemoteConnectionManager *)self findingSessionStateChangedHandler];
      v6[2](v6, a3);
    }
  }
}

- (void)_startDiscoveryForRemoteWithInfo:(id)a3 didConnectHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v6;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Start scanning for remote with info: %@", buf, 0xCu);
  }

  uint64_t v9 = [(TVRCSiriRemoteConnectionManager *)self remoteInfoSet];
  [v9 addObject:v6];

  [(TVRCSiriRemoteConnectionManager *)self _startCBScanIfNeeded];
  if (!self->_cbDiscovery)
  {
    objc_initWeak((id *)buf, self);
    v10 = (CBDiscovery *)objc_alloc_init(MEMORY[0x263EFEF30]);
    cbDiscovery = self->_cbDiscovery;
    self->_cbDiscovery = v10;

    [(CBDiscovery *)self->_cbDiscovery setUseCase:589824];
    [(CBDiscovery *)self->_cbDiscovery setDiscoveryFlags:0x200000000];
    [(CBDiscovery *)self->_cbDiscovery addDiscoveryType:14];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke;
    v27[3] = &unk_2647AF4A8;
    objc_copyWeak(&v29, (id *)buf);
    id v28 = v7;
    [(CBDiscovery *)self->_cbDiscovery setDeviceFoundHandler:v27];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_37;
    v25[3] = &unk_2647AF4D0;
    objc_copyWeak(&v26, (id *)buf);
    [(CBDiscovery *)self->_cbDiscovery setDeviceLostHandler:v25];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_38;
    v23[3] = &unk_2647AEB88;
    objc_copyWeak(&v24, (id *)buf);
    [(CBDiscovery *)self->_cbDiscovery setInvalidationHandler:v23];
    [(CBDiscovery *)self->_cbDiscovery setInterruptionHandler:&__block_literal_global_41];
    [(CBDiscovery *)self->_cbDiscovery activateWithCompletion:&__block_literal_global_45];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  v12 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [(TVRCSiriRemoteConnectionManager *)self remoteInfoSet];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * v16) cbKeyInfo];
        [v12 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(TVRCSiriRemoteConnectionManager *)self cbDiscovery];
  [v18 setOobKeys:v12];
}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v2 = a2;
  id v3 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v2;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Device found: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = [WeakRetained remoteInfoSet];
    uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (!v42) {
      goto LABEL_36;
    }
    uint64_t v6 = *(void *)v51;
    uint64_t v44 = *MEMORY[0x263EFEE18];
    uint64_t v38 = *(void *)v51;
    v39 = v2;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v51 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v7;
        v8 = *(void **)(*((void *)&v50 + 1) + 8 * v7);
        uint64_t v9 = [v2 btAddressData];
        v10 = [v8 btAddressData];
        int v11 = [v9 isEqualToData:v10];

        v12 = _TVRCBLEDiscoveryLog();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (!v11)
        {
          if (v13)
          {
            *(_DWORD *)buf = 138412546;
            v59 = v2;
            __int16 v60 = 2112;
            v61 = v8;
            _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "Device not matched: %@ to info: %@", buf, 0x16u);
          }
LABEL_33:
          uint64_t v37 = v43;
          goto LABEL_34;
        }
        if (v13)
        {
          *(_DWORD *)buf = 138412546;
          v59 = v2;
          __int16 v60 = 2112;
          v61 = v8;
          _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "Matched device: %@ to info: %@", buf, 0x16u);
        }

        id v14 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v15 = [v2 identifier];
        uint64_t v16 = [v14 initWithUUIDString:v15];

        v12 = v16;
        if (!v16) {
          goto LABEL_33;
        }
        id v17 = [v5 centralManager];
        v41 = v16;
        uint64_t v57 = v16;
        uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
        long long v19 = [v17 retrievePeripheralsWithIdentifiers:v18];

        if (![v19 count])
        {
          long long v20 = _TVRCBLEDiscoveryLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v41;
            _os_log_error_impl(&dword_2266D3000, v20, OS_LOG_TYPE_ERROR, "Failed to find any peripherals with UUID: %@", buf, 0xCu);
          }
        }
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v21 = v19;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v56 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v47 != v24) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(NSObject **)(*((void *)&v46 + 1) + 8 * i);
              v27 = [v5 discoveredPeripherals];
              int v28 = [v27 containsObject:v26];

              if (v28)
              {
                id v29 = _TVRCBLEDiscoveryLog();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v59 = v26;
                  _os_log_impl(&dword_2266D3000, v29, OS_LOG_TYPE_DEFAULT, "Skipping since we previously discovered this peripheral: %@", buf, 0xCu);
                }
              }
              else
              {
                v30 = [v5 discoveredPeripherals];
                [v30 addObject:v26];

                v31 = _TVRCBLEDiscoveryLog();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v59 = v26;
                  _os_log_impl(&dword_2266D3000, v31, OS_LOG_TYPE_DEFAULT, "Attemping to connect to :%@", buf, 0xCu);
                }

                uint64_t v54 = v44;
                v55 = &unk_26DA62DC0;
                id v29 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
                id v32 = [v5 centralManager];
                [v32 connectPeripheral:v26 options:v29];

                [v26 setDelegate:v5];
                uint64_t v33 = (void *)[*(id *)(a1 + 32) copy];
                v34 = (void *)MEMORY[0x22A6592D0]();
                v35 = [v5 didConnectHandlerBlockMap];
                v36 = [v26 identifier];
                [v35 setObject:v34 forKeyedSubscript:v36];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v56 count:16];
          }
          while (v23);
        }

        uint64_t v6 = v38;
        v2 = v39;
        uint64_t v37 = v43;
        v12 = v41;
LABEL_34:

        uint64_t v7 = v37 + 1;
      }
      while (v7 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (!v42)
      {
LABEL_36:

        break;
      }
    }
  }
}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v3;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Device lost: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v7 = [v3 identifier];
    v8 = (void *)[v6 initWithUUIDString:v7];

    if (v8)
    {
      uint64_t v9 = [WeakRetained centralManager];
      uint64_t v24 = v8;
      v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      int v11 = [v9 retrievePeripheralsWithIdentifiers:v10];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v17, "state", (void)v19) == 1 || objc_msgSend(v17, "state") == 2)
            {
              uint64_t v18 = [WeakRetained centralManager];
              [v18 cancelPeripheralConnection:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }
    }
  }
}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_38(uint64_t a1)
{
  v2 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "CBDiscovery invalidated", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = [WeakRetained centralManager];
  [v4 stopScan];
}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_39()
{
  v0 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2266D3000, v0, OS_LOG_TYPE_DEFAULT, "CBDiscovery interrupted", v1, 2u);
  }
}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRCBLEDiscoveryLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_42_cold_1();
    }
  }
  BOOL v4 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Activated CBDiscovery", v5, 2u);
  }
}

- (void)_stopDiscoveryForRemoteWithInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Stop scanning for remote with info :%@", buf, 0xCu);
  }

  id v6 = [(TVRCSiriRemoteConnectionManager *)self remoteInfoSet];
  [v6 removeObject:v4];

  uint64_t v7 = [(TVRCSiriRemoteConnectionManager *)self connectedSiriRemotes];
  v8 = [v4 name];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    [(TVRCSiriRemoteConnectionManager *)self _sendEnableMessage:0 forRemote:v9];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__TVRCSiriRemoteConnectionManager__stopDiscoveryForRemoteWithInfo___block_invoke;
  block[3] = &unk_2647AEA98;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__TVRCSiriRemoteConnectionManager__stopDiscoveryForRemoteWithInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) teardown];
}

- (void)_stopScanning
{
  id v3 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Stop Discovery", v6, 2u);
  }

  id v4 = [(TVRCSiriRemoteConnectionManager *)self centralManager];
  [v4 stopScan];

  id v5 = [(TVRCSiriRemoteConnectionManager *)self cbDiscovery];
  [v5 invalidate];

  [(TVRCSiriRemoteConnectionManager *)self setCbDiscovery:0];
}

- (void)teardown
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down ConnectionManager", buf, 2u);
  }

  [(TVRCSiriRemoteConnectionManager *)self _updateFindingSessionState:2];
  id v4 = [(TVRCSiriRemoteConnectionManager *)self remoteInfoSet];
  [v4 removeAllObjects];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(TVRCSiriRemoteConnectionManager *)self connectedSiriRemotes];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = [(TVRCSiriRemoteConnectionManager *)self centralManager];
        uint64_t v13 = [v11 peripheral];
        [v12 cancelPeripheralConnection:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [(TVRCSiriRemoteConnectionManager *)self connectedSiriRemotes];
  [v14 removeAllObjects];

  uint64_t v15 = [(TVRCSiriRemoteConnectionManager *)self discoveredPeripherals];
  [v15 removeAllObjects];

  uint64_t v16 = [(TVRCSiriRemoteConnectionManager *)self didConnectHandlerBlockMap];
  [v16 removeAllObjects];
}

- (void)_sendEnableMessage:(BOOL)a3 forRemote:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(TVRCSiriRemoteConnectionManager *)self connectedSiriRemotes];
  uint64_t v8 = [v6 peripheral];
  uint64_t v9 = [v8 name];
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  int v11 = _TVRCBLEDiscoveryLog();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        uint64_t v13 = @"enable";
      }
      else {
        uint64_t v13 = @"disable";
      }
      uint64_t v14 = [v6 peripheral];
      int v22 = 138412546;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "Sending message to %@ fast finding for remote: %@", (uint8_t *)&v22, 0x16u);
    }
    if (v4) {
      uint64_t v15 = &enableFastFindMy;
    }
    else {
      uint64_t v15 = &disableFastFindMy;
    }
    id v12 = [MEMORY[0x263EFF990] dataWithBytes:v15 length:6];
    uint64_t v16 = malloc_type_malloc(0xAuLL, 0x723C75EFuLL);
    CCRNGStatus Bytes = CCRandomGenerateBytes(v16, 0xAuLL);
    if (Bytes)
    {
      int v18 = Bytes;
      long long v19 = _TVRCBLEDiscoveryLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[TVRCSiriRemoteConnectionManager _sendEnableMessage:forRemote:](v18, v19);
      }
    }
    else
    {
      long long v19 = [MEMORY[0x263EFF8F8] dataWithBytes:v16 length:10];
      free(v16);
      [v12 appendData:v19];
      long long v20 = [v6 peripheral];
      long long v21 = [v6 findMyCharacteristic];
      [v20 writeValue:v12 forCharacteristic:v21 type:1];

      if (v4) {
        [(TVRCSiriRemoteConnectionManager *)self _updateFindingSessionState:1];
      }
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[TVRCSiriRemoteConnectionManager _sendEnableMessage:forRemote:](v6, v12);
  }
}

- (void)_removePeripheral:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Remove peripheral: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [(TVRCSiriRemoteConnectionManager *)self discoveredPeripherals];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    uint64_t v8 = _TVRCBLEDiscoveryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Removing tracked peripheral: %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = [(TVRCSiriRemoteConnectionManager *)self discoveredPeripherals];
    [v9 removeObject:v4];

    uint64_t v10 = [(TVRCSiriRemoteConnectionManager *)self connectedSiriRemotes];
    int v11 = [v4 name];
    [v10 removeObjectForKey:v11];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = [v3 state];
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "centralManagerDidUpdateState :%ld", (uint8_t *)&v5, 0xCu);
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Did discover peripheral: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_startCBScanIfNeeded
{
  id v3 = [(TVRCSiriRemoteConnectionManager *)self centralManager];
  char v4 = [v3 isScanning];

  if ((v4 & 1) == 0)
  {
    int v5 = _TVRCBLEDiscoveryLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Started Scanning for Siri Remotes...", v7, 2u);
    }

    id v6 = [(TVRCSiriRemoteConnectionManager *)self centralManager];
    [v6 scanForPeripheralsWithServices:0 options:0];
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a4;
  int v5 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Successfully connected to Remote: %@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x263EFEF88] UUIDWithString:@"F5873412-D314-B885-A5AA-EFA546123981"];
  id v9 = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [v4 discoverServices:v7];

  int v8 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Discovering find my service for peripheral: %@", buf, 0xCu);
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v10)
  {
    uint64_t v14 = _TVRCBLEDiscoveryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, "Disconnected peripheral: %@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_10;
  }
  uint64_t v12 = [v10 code];
  id v13 = _TVRCBLEDiscoveryLog();
  uint64_t v14 = v13;
  if (v12 != 7)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[TVRCSiriRemoteConnectionManager centralManager:didDisconnectPeripheral:error:]();
    }
LABEL_10:
    uint64_t v15 = 5;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v9;
    _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, "Remote button was pressed: %@", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v15 = 6;
LABEL_11:

  [(TVRCSiriRemoteConnectionManager *)self _updateFindingSessionState:v15];
  [(TVRCSiriRemoteConnectionManager *)self _removePeripheral:v9];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRCBLEDiscoveryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 services];
    *(_DWORD *)buf = 138412290;
    id v29 = v9;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Discovered services %@", buf, 0xCu);
  }
  if (v7)
  {
    id v10 = _TVRCBLEDiscoveryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TVRCSiriRemoteConnectionManager peripheral:didDiscoverServices:]();
    }
LABEL_6:

    [(TVRCSiriRemoteConnectionManager *)self _updateFindingSessionState:3];
    goto LABEL_16;
  }
  id v11 = [v6 services];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    id v10 = _TVRCBLEDiscoveryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TVRCSiriRemoteConnectionManager peripheral:didDiscoverServices:]();
    }
    goto LABEL_6;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v6;
  id obj = [v6 services];
  uint64_t v14 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        long long v19 = [MEMORY[0x263EFEF88] UUIDWithString:@"F5873413-D314-B885-A5AA-EFA546123982"];
        uint64_t v26 = v19;
        long long v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
        [v13 discoverCharacteristics:v20 forService:v18];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v15);
  }

  id v6 = v13;
LABEL_16:
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = _TVRCBLEDiscoveryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TVRCSiriRemoteConnectionManager peripheral:didDiscoverCharacteristicsForService:error:]();
    }

    [(TVRCSiriRemoteConnectionManager *)self _updateFindingSessionState:3];
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [a4 characteristics];
    uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v16 = [v15 UUID];
          id v17 = [MEMORY[0x263EFEF88] UUIDWithString:@"F5873413-D314-B885-A5AA-EFA546123982"];
          int v18 = [v16 isEqual:v17];

          if (v18)
          {
            long long v19 = _TVRCBLEDiscoveryLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v8;
              _os_log_impl(&dword_2266D3000, v19, OS_LOG_TYPE_DEFAULT, "Found Siri Remote with find my characteristic: %@", buf, 0xCu);
            }

            long long v20 = [v8 name];

            if (!v20)
            {
              id v29 = _TVRCBLEDiscoveryLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
                -[TVRCSiriRemoteConnectionManager peripheral:didDiscoverCharacteristicsForService:error:](v29);
              }

              [(TVRCSiriRemoteConnectionManager *)self _updateFindingSessionState:3];
              goto LABEL_23;
            }
            long long v21 = objc_alloc_init(TVRCSiriRemote);
            [(TVRCSiriRemote *)v21 setPeripheral:v8];
            [(TVRCSiriRemote *)v21 setFindMyCharacteristic:v15];
            long long v22 = [(TVRCSiriRemoteConnectionManager *)self connectedSiriRemotes];
            long long v23 = [v8 name];
            [v22 setObject:v21 forKeyedSubscript:v23];

            long long v24 = [(TVRCSiriRemoteConnectionManager *)self didConnectHandlerBlockMap];
            long long v25 = [v8 identifier];
            uint64_t v26 = [v24 objectForKeyedSubscript:v25];

            if (v26)
            {
              ((void (**)(void, TVRCSiriRemote *))v26)[2](v26, v21);
              uint64_t v27 = [(TVRCSiriRemoteConnectionManager *)self didConnectHandlerBlockMap];
              int v28 = [v8 identifier];
              [v27 setObject:0 forKeyedSubscript:v28];
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_23:

    id v9 = 0;
  }
}

- (id)findingSessionStateChangedHandler
{
  return self->_findingSessionStateChangedHandler;
}

- (void)setFindingSessionStateChangedHandler:(id)a3
{
}

- (NSMutableSet)remoteInfoSet
{
  return self->_remoteInfoSet;
}

- (void)setRemoteInfoSet:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (CBDiscovery)cbDiscovery
{
  return self->_cbDiscovery;
}

- (void)setCbDiscovery:(id)a3
{
}

- (NSMutableSet)discoveredPeripherals
{
  return self->_discoveredPeripherals;
}

- (void)setDiscoveredPeripherals:(id)a3
{
}

- (NSMutableDictionary)connectedSiriRemotes
{
  return self->_connectedSiriRemotes;
}

- (void)setConnectedSiriRemotes:(id)a3
{
}

- (NSMutableDictionary)didConnectHandlerBlockMap
{
  return self->_didConnectHandlerBlockMap;
}

- (void)setDidConnectHandlerBlockMap:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didConnectHandlerBlockMap, 0);
  objc_storeStrong((id *)&self->_connectedSiriRemotes, 0);
  objc_storeStrong((id *)&self->_discoveredPeripherals, 0);
  objc_storeStrong((id *)&self->_cbDiscovery, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_remoteInfoSet, 0);

  objc_storeStrong(&self->_findingSessionStateChangedHandler, 0);
}

void __86__TVRCSiriRemoteConnectionManager__startDiscoveryForRemoteWithInfo_didConnectHandler___block_invoke_42_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "CBDiscovery failed to activate: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_sendEnableMessage:(void *)a1 forRemote:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 peripheral];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Attemping to send message to remote that is not connected: %@", v4, 0xCu);
}

- (void)_sendEnableMessage:(int)a1 forRemote:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Failed to generate random bytes Error: %d", (uint8_t *)v2, 8u);
}

- (void)centralManager:didDisconnectPeripheral:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "didDisconnectPeripheral:error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)peripheral:didDiscoverServices:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "No services available for peripheral: %@", v2, v3, v4, v5, v6);
}

- (void)peripheral:didDiscoverServices:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "didDiscoverServices: error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)peripheral:(os_log_t)log didDiscoverCharacteristicsForService:error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_2266D3000, log, OS_LOG_TYPE_FAULT, "Peripheral name is nil!", v1, 2u);
}

- (void)peripheral:didDiscoverCharacteristicsForService:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "didDiscoverCharacteristicsForService:error: %{public}@", v2, v3, v4, v5, v6);
}

@end