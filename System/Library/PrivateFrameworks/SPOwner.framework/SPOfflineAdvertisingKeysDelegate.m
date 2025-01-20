@interface SPOfflineAdvertisingKeysDelegate
- (BOOL)inLowPowerMode;
- (CBPeripheralManager)peripheralManager;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)queue;
- (SPLocalBeaconManager)beaconManager;
- (SPOfflineAdvertisingKeysDelegate)initWithBeaconManager:(id)a3;
- (id)proxy;
- (id)remoteInterface;
- (id)syncProxy;
- (int64_t)transformReason:(int64_t)a3;
- (void)enterLowPowerMode;
- (void)peripheralManager:(id)a3 offlineAdvPayloadRequestedWithReason:(int64_t)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)processKeyResponse:(id)a3;
- (void)setBeaconManager:(id)a3;
- (void)setInLowPowerMode:(BOOL)a3;
- (void)setPeripheralManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation SPOfflineAdvertisingKeysDelegate

- (SPOfflineAdvertisingKeysDelegate)initWithBeaconManager:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SPOfflineAdvertisingKeysDelegate;
  v6 = [(SPOfflineAdvertisingKeysDelegate *)&v23 init];
  if (v6)
  {
    v7 = LogCategory_OfflineAdvertising();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: SPOfflineAdvertisingKeysDelegate created.", v22, 2u);
    }

    objc_storeStrong((id *)&v6->_beaconManager, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("SPOfflineAdvertisingKeysDelegate", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F61588]);
    v12 = [(SPOfflineAdvertisingKeysDelegate *)v6 remoteInterface];
    uint64_t v13 = [v11 initWithMachServiceName:@"com.apple.icloud.searchpartyd.beaconmanager" options:0 remoteObjectInterface:v12 interruptionHandler:0 invalidationHandler:0];
    serviceDescription = v6->_serviceDescription;
    v6->_serviceDescription = (FMXPCServiceDescription *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4F1BD58]);
    v16 = v6->_queue;
    uint64_t v17 = *MEMORY[0x1E4F1BCA8];
    v24[0] = *MEMORY[0x1E4F1BC90];
    v24[1] = v17;
    v25[0] = MEMORY[0x1E4F1CC38];
    v25[1] = MEMORY[0x1E4F1CC38];
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    uint64_t v19 = [v15 initWithDelegate:v6 queue:v16 options:v18];
    peripheralManager = v6->_peripheralManager;
    v6->_peripheralManager = (CBPeripheralManager *)v19;
  }
  return v6;
}

- (id)remoteInterface
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44050];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:3];
  id v5 = objc_msgSend(v3, "setWithArray:", v4, v7, v8);
  [v2 setClasses:v5 forSelector:sel_offlineAdvertisingKeysForReason_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (id)proxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(SPOfflineAdvertisingKeysDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(SPOfflineAdvertisingKeysDelegate *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    v6 = [(SPOfflineAdvertisingKeysDelegate *)self serviceDescription];
    uint64_t v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPOfflineAdvertisingKeysDelegate *)self setSession:v7];

    uint64_t v8 = LogCategory_OfflineAdvertising();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(SPOfflineAdvertisingKeysDelegate *)self serviceDescription];
      uint64_t v10 = [v9 machService];
      int v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    id v11 = [(SPOfflineAdvertisingKeysDelegate *)self session];
    [v11 resume];
  }
  v12 = [(SPOfflineAdvertisingKeysDelegate *)self session];
  uint64_t v13 = [v12 proxy];

  return v13;
}

- (id)syncProxy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(SPOfflineAdvertisingKeysDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(SPOfflineAdvertisingKeysDelegate *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    v6 = [(SPOfflineAdvertisingKeysDelegate *)self serviceDescription];
    uint64_t v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPOfflineAdvertisingKeysDelegate *)self setSession:v7];

    uint64_t v8 = LogCategory_OfflineAdvertising();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(SPOfflineAdvertisingKeysDelegate *)self serviceDescription];
      uint64_t v10 = [v9 machService];
      int v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    id v11 = [(SPOfflineAdvertisingKeysDelegate *)self session];
    [v11 resume];
  }
  v12 = [(SPOfflineAdvertisingKeysDelegate *)self session];
  uint64_t v13 = [v12 syncProxyWithErrorHandler:&__block_literal_global_172];

  return v13;
}

void __45__SPOfflineAdvertisingKeysDelegate_syncProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = LogCategory_OfflineAdvertising();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__SPOfflineAdvertisingKeysDelegate_syncProxy__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  if ([(SPOfflineAdvertisingKeysDelegate *)self inLowPowerMode])
  {
    uint64_t v5 = LogCategory_OfflineAdvertising();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "Sending bluetoothPowerStateUpdated(SPBluetoothPowerStateLowPowerMode)", buf, 2u);
    }

    uint64_t v6 = [(SPOfflineAdvertisingKeysDelegate *)self userAgentSyncProxy];
    uint64_t v7 = v6;
    uint64_t v8 = 2;
LABEL_13:
    [v6 bluetoothPowerStateUpdated:v8];

    goto LABEL_14;
  }
  uint64_t v9 = [v4 state];
  if (v9 == 5)
  {
    id v11 = LogCategory_OfflineAdvertising();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "Sending bluetoothPowerStateUpdated(SPBluetoothPowerStateOn)", v12, 2u);
    }

    uint64_t v6 = [(SPOfflineAdvertisingKeysDelegate *)self userAgentSyncProxy];
    uint64_t v7 = v6;
    uint64_t v8 = 1;
    goto LABEL_13;
  }
  if (v9 == 4)
  {
    uint64_t v10 = LogCategory_OfflineAdvertising();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "Sending bluetoothPowerStateUpdated(SPBluetoothPowerStateOff)", v13, 2u);
    }

    uint64_t v6 = [(SPOfflineAdvertisingKeysDelegate *)self userAgentSyncProxy];
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    goto LABEL_13;
  }
LABEL_14:
}

- (void)enterLowPowerMode
{
  v3 = LogCategory_OfflineAdvertising();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: Entering low power mode", buf, 2u);
  }

  [(SPOfflineAdvertisingKeysDelegate *)self setInLowPowerMode:1];
  id v4 = LogCategory_OfflineAdvertising();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "Sending bluetoothPowerStateUpdated(SPBluetoothPowerStateLowPowerMode)", v6, 2u);
  }

  uint64_t v5 = [(SPOfflineAdvertisingKeysDelegate *)self userAgentSyncProxy];
  [v5 bluetoothPowerStateUpdated:2];
}

- (int64_t)transformReason:(int64_t)a3
{
  int64_t v3 = a3;
  if ((unint64_t)a3 >= 3)
  {
    id v4 = LogCategory_OfflineAdvertising();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SPOfflineAdvertisingKeysDelegate transformReason:](v3, v4, v5, v6, v7, v8, v9, v10);
    }

    return 0;
  }
  return v3;
}

- (void)processKeyResponse:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int has_internal_content = os_variant_has_internal_content();
  uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"__qa__log_offline_keys"];

  uint64_t v8 = LogCategory_OfflineAdvertising();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v4;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: processKeyResponse: %@", buf, 0xCu);
  }

  if ((has_internal_content & v7) == 1)
  {
    v29 = self;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v9 = [v4 objectAtIndexedSubscript:0];
    uint64_t v10 = [v9 keys];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v16 = LogCategory_OfflineAdvertising();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = objc_msgSend(v15, "fm_hexString");
            *(_DWORD *)buf = 138412290;
            id v41 = v17;
            _os_log_impl(&dword_1B2FD8000, v16, OS_LOG_TYPE_DEFAULT, "OFFLINE_KEYS: First : %@", buf, 0xCu);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v12);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v18 = [v4 objectAtIndexedSubscript:1];
    uint64_t v19 = [v18 keys];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          v25 = LogCategory_OfflineAdvertising();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = objc_msgSend(v24, "fm_hexString");
            *(_DWORD *)buf = 138412290;
            id v41 = v26;
            _os_log_impl(&dword_1B2FD8000, v25, OS_LOG_TYPE_DEFAULT, "OFFLINE_KEYS: Second: %@", buf, 0xCu);
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v21);
    }

    self = v29;
  }
  v27 = objc_msgSend(v4, "fm_map:", &__block_literal_global_180);
  v28 = [(SPOfflineAdvertisingKeysDelegate *)self peripheralManager];
  [v28 setOfflineAdvertisingParamsAndData:v27];
}

uint64_t __55__SPOfflineAdvertisingKeysDelegate_processKeyResponse___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (void)peripheralManager:(id)a3 offlineAdvPayloadRequestedWithReason:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__SPOfflineAdvertisingKeysDelegate_peripheralManager_offlineAdvPayloadRequestedWithReason___block_invoke;
  v4[3] = &unk_1E601BB60;
  v4[4] = self;
  v4[5] = a4;
  _os_activity_initiate(&dword_1B2FD8000, "offlineAdvertisingKeysForReason", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

void __91__SPOfflineAdvertisingKeysDelegate_peripheralManager_offlineAdvPayloadRequestedWithReason___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_OfflineAdvertising();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v8 = 134217984;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPOfflineAdvertisingKeysDelegate: offlineAdvPayloadRequestedWithReason: %ld", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) enterLowPowerMode];
  id v4 = [*(id *)(a1 + 32) beaconManager];
  uint64_t v5 = [*(id *)(a1 + 32) transformReason:*(void *)(a1 + 40)];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  int v7 = [v4 generateOfflineAdvertisingKeysForReason:v5 now:v6];

  [*(id *)(a1 + 32) processKeyResponse:v7];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SPLocalBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
}

- (CBPeripheralManager)peripheralManager
{
  return self->_peripheralManager;
}

- (void)setPeripheralManager:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BOOL)inLowPowerMode
{
  return self->_inLowPowerMode;
}

- (void)setInLowPowerMode:(BOOL)a3
{
  self->_inLowPowerMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__SPOfflineAdvertisingKeysDelegate_syncProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)transformReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end