@interface SPCBLeechScanner
+ (id)remoteInterface;
- (BOOL)containsOnlyNSSecureCodable:(id)a3;
- (BOOL)enabled;
- (BOOL)isScanning;
- (CBCentralManager)centralManager;
- (FMQueueSynchronizer)queueSynchronizer;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)serialQueue;
- (SPCBLeechScanner)init;
- (SPCBPeripheralManagementXPCProtocol)proxy;
- (id)fixupDictionary:(id)a3;
- (int)notifyToken;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)handleStateChange:(unint64_t)a3;
- (void)init;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsScanning:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
- (void)setProxy:(id)a3;
- (void)setQueueSynchronizer:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)startScanning;
- (void)stopScanning;
@end

@implementation SPCBLeechScanner

- (SPCBLeechScanner)init
{
  v30.receiver = self;
  v30.super_class = (Class)SPCBLeechScanner;
  v2 = [(SPCBLeechScanner *)&v30 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SPOwner.SPCBLeechScanner", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F61558]) initWithQueue:v2->_serialQueue];
    queueSynchronizer = v2->_queueSynchronizer;
    v2->_queueSynchronizer = (FMQueueSynchronizer *)v6;

    v8 = v2->_serialQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __24__SPCBLeechScanner_init__block_invoke;
    handler[3] = &unk_1E601C198;
    v9 = v2;
    v29 = v9;
    uint32_t v10 = notify_register_dispatch("com.apple.SPOwner.SPCBLeechScanner", &v2->_notifyToken, v8, handler);
    if (v10)
    {
      int v11 = v10;
      v12 = LogCategory_CBPeripheralManagement();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(SPCBLeechScanner *)v11 init];
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __24__SPCBLeechScanner_init__block_invoke_2;
    aBlock[3] = &unk_1E601B8D0;
    v13 = v9;
    v27 = v13;
    v14 = _Block_copy(aBlock);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __24__SPCBLeechScanner_init__block_invoke_2;
    v24[3] = &unk_1E601B8D0;
    v15 = v13;
    v25 = v15;
    v16 = _Block_copy(v24);
    id v17 = objc_alloc(MEMORY[0x1E4F61588]);
    v18 = +[SPCBLeechScanner remoteInterface];
    uint64_t v19 = [v17 initWithMachServiceName:@"com.apple.searchparty.managedperipheral" options:0 remoteObjectInterface:v18 interruptionHandler:v14 invalidationHandler:v16];
    serviceDescription = v15->_serviceDescription;
    v15->_serviceDescription = (FMXPCServiceDescription *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1BD18]) initWithDelegate:v15 queue:v2->_serialQueue];
    centralManager = v15->_centralManager;
    v15->_centralManager = (CBCentralManager *)v21;
  }
  return v2;
}

uint64_t __24__SPCBLeechScanner_init__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) handleStateChange:state64];
}

uint64_t __24__SPCBLeechScanner_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) interruptionHandler:a2];
}

{
  return [*(id *)(a1 + 32) invalidationHandler:a2];
}

- (void)handleStateChange:(unint64_t)a3
{
  *(void *)&v15[5] = *MEMORY[0x1E4F143B8];
  v5 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    *(void *)v15 = a3;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: handleStateChange: %llu", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v6 = [(SPCBLeechScanner *)self centralManager];
  uint64_t v7 = [v6 state];

  [(SPCBLeechScanner *)self setEnabled:a3 != 0];
  v8 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [(SPCBLeechScanner *)self enabled];
    BOOL v10 = [(SPCBLeechScanner *)self isScanning];
    int v14 = 67109376;
    v15[0] = v9;
    LOWORD(v15[1]) = 1024;
    *(_DWORD *)((char *)&v15[1] + 2) = v10;
    _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: enabled: %u isScanning: %u", (uint8_t *)&v14, 0xEu);
  }

  if (![(SPCBLeechScanner *)self enabled] && ![(SPCBLeechScanner *)self isScanning] && v7 != 5)
  {
    int v11 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v12 = "SPCBLeechScanner: Do nothing -- scanner is already stopped (000)";
LABEL_39:
      _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 2u);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  if (![(SPCBLeechScanner *)self enabled] && ![(SPCBLeechScanner *)self isScanning] && v7 == 5)
  {
    int v11 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v12 = "SPCBLeechScanner: Do nothing -- scanner is already stopped (001)";
      goto LABEL_39;
    }
LABEL_40:

    return;
  }
  if (![(SPCBLeechScanner *)self enabled] && [(SPCBLeechScanner *)self isScanning] && v7 != 5
    || ![(SPCBLeechScanner *)self enabled] && [(SPCBLeechScanner *)self isScanning] && v7 == 5)
  {
    goto LABEL_33;
  }
  if ([(SPCBLeechScanner *)self enabled] && ![(SPCBLeechScanner *)self isScanning] && v7 != 5)
  {
    int v11 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v12 = "SPCBLeechScanner: Do nothing -- scanner is already stopped (100)";
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  if ([(SPCBLeechScanner *)self enabled] && ![(SPCBLeechScanner *)self isScanning] && v7 == 5)
  {
    [(SPCBLeechScanner *)self startScanning];
    return;
  }
  if ([(SPCBLeechScanner *)self enabled] && [(SPCBLeechScanner *)self isScanning] && v7 != 5)
  {
LABEL_33:
    [(SPCBLeechScanner *)self stopScanning];
    return;
  }
  if ([(SPCBLeechScanner *)self enabled] && [(SPCBLeechScanner *)self isScanning] && v7 == 5)
  {
    int v11 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v12 = "SPCBLeechScanner: Do nothing -- scanner is already running (111)";
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  v13 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[SPCBLeechScanner handleStateChange:](self);
  }
}

- (void)startScanning
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SPCBLeechScanner *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: startScanning", v7, 2u);
  }

  uint64_t v8 = *MEMORY[0x1E4F1BC78];
  v9[0] = &unk_1F0B31E28;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [(SPCBLeechScanner *)self centralManager];
  [v6 scanForPeripheralsWithServices:0 options:v5 completion:&__block_literal_global_7];

  [(SPCBLeechScanner *)self setIsScanning:1];
}

void __33__SPCBLeechScanner_startScanning__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __33__SPCBLeechScanner_startScanning__block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)stopScanning
{
  v3 = [(SPCBLeechScanner *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: stopScanning", v6, 2u);
  }

  v5 = [(SPCBLeechScanner *)self centralManager];
  [v5 stopScan];

  [(SPCBLeechScanner *)self setIsScanning:0];
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  dispatch_queue_t v4 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: interruptionHandler %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: invalidationHandler %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(SPCBLeechScanner *)self setSession:0];
}

- (SPCBPeripheralManagementXPCProtocol)proxy
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__2;
  int v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  id v3 = [(SPCBLeechScanner *)self queueSynchronizer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__SPCBLeechScanner_proxy__block_invoke;
  v6[3] = &unk_1E601C1E0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 conditionalSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SPCBPeripheralManagementXPCProtocol *)v4;
}

void __25__SPCBLeechScanner_proxy__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];

  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F61590]);
    id v4 = [*(id *)(a1 + 32) serviceDescription];
    int v5 = (void *)[v3 initWithServiceDescription:v4];
    [*(id *)(a1 + 32) setSession:v5];

    int v6 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) serviceDescription];
      uint64_t v8 = [v7 machService];
      int v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: Establishing XPC connection to %{public}@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v9 = [*(id *)(a1 + 32) session];
    [v9 resume];
  }
  BOOL v10 = [*(id *)(a1 + 32) session];
  uint64_t v11 = [v10 proxy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_4 != -1) {
    dispatch_once(&remoteInterface_onceToken_4, &__block_literal_global_14);
  }
  id v2 = (void *)remoteInterface_interface_3;

  return v2;
}

uint64_t __35__SPCBLeechScanner_remoteInterface__block_invoke()
{
  remoteInterface_interface_3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44110];

  return MEMORY[0x1F41817F8]();
}

- (void)centralManagerDidUpdateState:(id)a3
{
  [a3 state];
  uint64_t v4 = [(SPCBLeechScanner *)self enabled];

  [(SPCBLeechScanner *)self handleStateChange:v4];
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a6;
  BOOL v10 = [(SPCBLeechScanner *)self serialQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_1B2FD8000, v11, OS_LOG_TYPE_DEFAULT, "SPCBLeechScanner: didDiscoverPeripheral: %{public}@  RSSI: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v12 = [(SPCBLeechScanner *)self fixupDictionary:v8];
  if ([(SPCBLeechScanner *)self containsOnlyNSSecureCodable:v12])
  {
    v13 = [(SPCBLeechScanner *)self proxy];
    -[NSObject leechScannerDiscoveredAdvertisementData:rssi:completion:](v13, "leechScannerDiscoveredAdvertisementData:rssi:completion:", v12, [v9 intValue], &__block_literal_global_71_0);
  }
  else
  {
    v13 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SPCBLeechScanner centralManager:didDiscoverPeripheral:advertisementData:RSSI:](v13);
    }
  }
}

void __80__SPCBLeechScanner_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __80__SPCBLeechScanner_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (id)fixupDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = *MEMORY[0x1E4F1BC38];
  int v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1BC38]];
  if (v6)
  {
    id v17 = v4;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = [v6 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          int v14 = [v6 objectForKeyedSubscript:v13];
          id v15 = [v13 data];
          [v7 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    uint64_t v4 = v17;
    [v17 setObject:v7 forKeyedSubscript:v5];
  }

  return v4;
}

- (BOOL)containsOnlyNSSecureCodable:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    int v6 = [v5 allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (([v11 conformsToProtocol:&unk_1F0B32870] & 1) == 0)
          {
            uint64_t v23 = LogCategory_CBPeripheralManagement();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[SPCBLeechScanner containsOnlyNSSecureCodable:]();
            }

LABEL_38:
            BOOL v14 = 0;
            goto LABEL_39;
          }
          uint64_t v12 = [v5 objectForKey:v11];
          BOOL v13 = [(SPCBLeechScanner *)self containsOnlyNSSecureCodable:v12];

          if (!v13) {
            goto LABEL_38;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
        BOOL v14 = 1;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v14 = 1;
    }
LABEL_39:

    goto LABEL_40;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v5 = v4;
    uint64_t v15 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
LABEL_15:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v5);
        }
        if (![(SPCBLeechScanner *)self containsOnlyNSSecureCodable:*(void *)(*((void *)&v29 + 1) + 8 * v18)])break; {
        if (v16 == ++v18)
        }
        {
          uint64_t v16 = [v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v16) {
            goto LABEL_15;
          }
          goto LABEL_31;
        }
      }
LABEL_32:
      BOOL v14 = 0;
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v5 = v4;
    uint64_t v19 = [v5 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
LABEL_25:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v5);
        }
        if (!-[SPCBLeechScanner containsOnlyNSSecureCodable:](self, "containsOnlyNSSecureCodable:", *(void *)(*((void *)&v25 + 1) + 8 * v22), (void)v25))goto LABEL_32; {
        if (v20 == ++v22)
        }
        {
          uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v20) {
            goto LABEL_25;
          }
          break;
        }
      }
    }
LABEL_31:
    BOOL v14 = 1;
LABEL_33:

    goto LABEL_40;
  }
  if ([v4 conformsToProtocol:&unk_1F0B32870])
  {
    BOOL v14 = 1;
    goto LABEL_41;
  }
  uint64_t v5 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SPCBLeechScanner containsOnlyNSSecureCodable:]();
  }
  BOOL v14 = 0;
LABEL_40:

LABEL_41:
  return v14;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMQueueSynchronizer)queueSynchronizer
{
  return self->_queueSynchronizer;
}

- (void)setQueueSynchronizer:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
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

- (void)setProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_queueSynchronizer, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPCBLeechScanner: notify_register_dispatch error: %u", (uint8_t *)v2, 8u);
}

- (void)handleStateChange:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 centralManager];
  [v1 state];
  OUTLINED_FUNCTION_0_2(&dword_1B2FD8000, v2, v3, "SPCBLeechScanner: Unexpected state: enabled: %llu centralState: %lu", v4, v5, v6, v7, 0);
}

void __33__SPCBLeechScanner_startScanning__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPCBLeechScanner: scan error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)centralManager:(os_log_t)log didDiscoverPeripheral:advertisementData:RSSI:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2FD8000, log, OS_LOG_TYPE_ERROR, "SPCBLeechScanner: advertisementData is not NSSecureCodable!", v1, 2u);
}

void __80__SPCBLeechScanner_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPCBLeechScanner: leechScannerDiscoveredAdvertisementData error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)containsOnlyNSSecureCodable:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_1(v0);
  OUTLINED_FUNCTION_0_2(&dword_1B2FD8000, v2, v3, "SPCBLeechScanner: NSDictionary key not NSSecureCodable: %@: %@!", v4, v5, v6, v7, v8);
}

- (void)containsOnlyNSSecureCodable:.cold.2()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1_1(v0);
  OUTLINED_FUNCTION_0_2(&dword_1B2FD8000, v2, v3, "SPCBLeechScanner: not NSSecureCodable: %@: %@!", v4, v5, v6, v7, v8);
}

@end