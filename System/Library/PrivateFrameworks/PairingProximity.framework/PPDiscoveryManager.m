@interface PPDiscoveryManager
+ (BOOL)isBluetoothConnected:(int64_t)a3;
+ (BOOL)isBluetoothPoweredOn:(int64_t)a3;
+ (id)sharedDiscoveryManager;
- (BOOL)bluetoothIsScanning;
- (CBCentralManager)central;
- (OS_dispatch_queue)discoveryQueue;
- (PPDiscoveryManager)init;
- (PPDiscoveryManagerDelegate)discoveryDelegate;
- (int64_t)signalLimitOverride;
- (void)_beginDiscovery;
- (void)_forceEndDiscovery;
- (void)begin;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)end;
- (void)foundAcceptableDeviceWithAdvertisingID:(id)a3 signalStrength:(id)a4;
- (void)setBluetoothIsScanning:(BOOL)a3;
- (void)setCentral:(id)a3;
- (void)setDiscoveryDelegate:(id)a3;
- (void)setDiscoveryQueue:(id)a3;
- (void)setSignalLimitOverride:(int64_t)a3;
- (void)updateFromBTState:(int64_t)a3;
@end

@implementation PPDiscoveryManager

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  discoveryQueue = self->_discoveryQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__PPDiscoveryManager_centralManagerDidUpdateState___block_invoke;
  v7[3] = &unk_264E717F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(discoveryQueue, v7);
}

uint64_t __44__PPDiscoveryManager_sharedDiscoveryManager__block_invoke()
{
  sharedDiscoveryManager_sharedDiscoveryManager = objc_alloc_init(PPDiscoveryManager);

  return MEMORY[0x270F9A758]();
}

- (PPDiscoveryManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)PPDiscoveryManager;
  v2 = [(PPDiscoveryManager *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.pairingproximity.discovery", 0);
    discoveryQueue = v2->_discoveryQueue;
    v2->_discoveryQueue = (OS_dispatch_queue *)v3;

    if (_os_feature_enabled_impl()) {
      char v5 = 1;
    }
    else {
      char v5 = MGGetBoolAnswer();
    }
    v2->_networkRelayPairingEnabled = v5;
    id v6 = v2->_discoveryQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__PPDiscoveryManager_init__block_invoke;
    block[3] = &unk_264E71778;
    v7 = v2;
    v10 = v7;
    dispatch_async(v6, block);
    v7->_signalLimitOverride = -80;
  }
  return v2;
}

- (void)begin
{
  dispatch_queue_t v3 = pbb_mobileasset_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23C80A000, v3, OS_LOG_TYPE_DEFAULT, "PPDeviceDiscovery - Began discovering", v4, 2u);
  }

  [(PPDiscoveryManager *)self _beginDiscovery];
}

+ (id)sharedDiscoveryManager
{
  if (sharedDiscoveryManager_onceToken != -1) {
    dispatch_once(&sharedDiscoveryManager_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedDiscoveryManager_sharedDiscoveryManager;

  return v2;
}

- (void)_beginDiscovery
{
  discoveryQueue = self->_discoveryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__PPDiscoveryManager__beginDiscovery__block_invoke;
  block[3] = &unk_264E71778;
  void block[4] = self;
  dispatch_async(discoveryQueue, block);
}

- (void)setSignalLimitOverride:(int64_t)a3
{
  if ((unint64_t)(a3 - 20) > 0xFFFFFFFFFFFFFF9BLL)
  {
    self->_signalLimitOverride = a3;
  }
  else
  {
    dispatch_queue_t v3 = pbb_mobileasset_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[PPDiscoveryManager setSignalLimitOverride:](v3);
    }
  }
}

void __26__PPDiscoveryManager_init__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFEF00]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 48);
  uint64_t v9 = *MEMORY[0x263EFED38];
  v10[0] = MEMORY[0x263EFFA80];
  char v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v6 = [v2 initWithDelegate:v3 queue:v4 options:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __51__PPDiscoveryManager_centralManagerDidUpdateState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) state];

  return [v1 updateFromBTState:v2];
}

- (void)updateFromBTState:(int64_t)a3
{
  BOOL v5 = +[PPDiscoveryManager isBluetoothPoweredOn:](PPDiscoveryManager, "isBluetoothPoweredOn:");
  BOOL v6 = +[PPDiscoveryManager isBluetoothConnected:a3];
  BOOL v7 = !v5 || !v6;
  if (!v7 && self->_bluetoothIsScanning)
  {
    [(PPDiscoveryManager *)self _beginDiscovery];
  }
}

void __37__PPDiscoveryManager__beginDiscovery__block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  if (+[PPDiscoveryManager isBluetoothPoweredOn:](PPDiscoveryManager, "isBluetoothPoweredOn:", [*(id *)(*(void *)(a1 + 32) + 40) state]))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v3 = [MEMORY[0x263EFEF88] UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
    v21[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    uint64_t v5 = *MEMORY[0x263EFED50];
    v19[0] = *MEMORY[0x263EFEE70];
    v19[1] = v5;
    v20[0] = MEMORY[0x263EFFA88];
    v20[1] = MEMORY[0x263EFFA88];
    uint64_t v6 = *MEMORY[0x263EFEDD8];
    v19[2] = *MEMORY[0x263EFED48];
    v19[3] = v6;
    v20[2] = MEMORY[0x263EFFA80];
    v20[3] = &unk_26F077800;
    v19[4] = *MEMORY[0x263EFEDC8];
    v20[4] = &unk_26F077818;
    BOOL v7 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];
    [v2 scanForPeripheralsWithServices:v4 options:v7];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 16))
  {
    if (!*(void *)(v8 + 8))
    {
      id v9 = objc_alloc_init(MEMORY[0x263F58238]);
      [v9 setPairingTransport:1];
      [v9 setDeviceType:1];
      v10 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 24)];
      [v9 setRssi:v10];

      uint64_t v11 = [objc_alloc(MEMORY[0x263F58240]) initWithIdentifier:0 pairingCriteria:v9 metadata:0 queue:*(void *)(*(void *)(a1 + 32) + 48)];
      v12 = *(void **)(*(void *)(a1 + 32) + 8);
      *(void *)(*(void *)(a1 + 32) + 8) = v11;

      objc_initWeak(&location, *(id *)(a1 + 32));
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __37__PPDiscoveryManager__beginDiscovery__block_invoke_27;
      v16[3] = &unk_264E717A0;
      objc_copyWeak(&v17, &location);
      [*(id *)(*(void *)(a1 + 32) + 8) setCandidateDiscoveredHandler:v16];
      v13 = *(void **)(*(void *)(a1 + 32) + 8);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __37__PPDiscoveryManager__beginDiscovery__block_invoke_30;
      v14[3] = &unk_264E717C8;
      objc_copyWeak(&v15, &location);
      [v13 activateWithCompletion:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

+ (BOOL)isBluetoothPoweredOn:(int64_t)a3
{
  return a3 == 5;
}

+ (BOOL)isBluetoothConnected:(int64_t)a3
{
  return a3 != 0;
}

- (void)end
{
  uint64_t v3 = pbb_mobileasset_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_23C80A000, v3, OS_LOG_TYPE_DEFAULT, "PPDeviceDiscovery - End discovering", v4, 2u);
  }

  [(PPDiscoveryManager *)self _forceEndDiscovery];
  self->_signalLimitOverride = -80;
}

void __37__PPDiscoveryManager__beginDiscovery__block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = pbb_mobileasset_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_23C80A000, v4, OS_LOG_TYPE_DEFAULT, "PPDeviceDiscovery - candidate discovered via NetworkRelay: %@", (uint8_t *)&v11, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = [v3 identifier];
    if (v6)
    {
      BOOL v7 = (void *)[objc_alloc(MEMORY[0x263F57758]) initWithPackedIdentifierData:v6];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = [v7 humanReadableName];
        v10 = [NSNumber numberWithInteger:WeakRetained[3]];
        [WeakRetained foundAcceptableDeviceWithAdvertisingID:v9 signalStrength:v10];
      }
    }
  }
}

void __37__PPDiscoveryManager__beginDiscovery__block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = pbb_mobileasset_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_23C80A000, v4, OS_LOG_TYPE_DEFAULT, "PPDeviceDiscovery - failed to activate NRDevicePairingManager with error %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v4 = WeakRetained;
    if (WeakRetained) {
      [(objc_class *)WeakRetained[1].isa startDiscoveryWithCompletion:&__block_literal_global_34];
    }
  }
}

void __37__PPDiscoveryManager__beginDiscovery__block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = pbb_mobileasset_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138543362;
      id v9 = v2;
      uint64_t v5 = "PPDeviceDiscovery - failed to start discovering using NetworkRelay with error %{public}@";
      int v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_23C80A000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    uint64_t v5 = "PPDeviceDiscovery - started discovering with NetworkRelay";
    int v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

- (void)_forceEndDiscovery
{
  discoveryQueue = self->_discoveryQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__PPDiscoveryManager__forceEndDiscovery__block_invoke;
  block[3] = &unk_264E71778;
  void block[4] = self;
  dispatch_async(discoveryQueue, block);
}

void __40__PPDiscoveryManager__forceEndDiscovery__block_invoke(uint64_t a1)
{
  if (+[PPDiscoveryManager isBluetoothPoweredOn:](PPDiscoveryManager, "isBluetoothPoweredOn:", [*(id *)(*(void *)(a1 + 32) + 40) state]))
  {
    [*(id *)(*(void *)(a1 + 32) + 40) stopScan];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 16))
  {
    id v3 = *(void **)(v2 + 8);
    if (v3)
    {
      [v3 cancelDiscovery];
      [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
      BOOL v4 = pbb_mobileasset_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint32_t v7 = 0;
        _os_log_impl(&dword_23C80A000, v4, OS_LOG_TYPE_DEFAULT, "PPDeviceDiscovery - stopped discovering with NetworkRelay", v7, 2u);
      }

      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(void **)(v5 + 8);
      *(void *)(v5 + 8) = 0;
    }
  }
}

- (void)foundAcceptableDeviceWithAdvertisingID:(id)a3 signalStrength:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 integerValue];
  id v9 = pbb_mobileasset_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    _os_log_impl(&dword_23C80A000, v9, OS_LOG_TYPE_DEFAULT, "Found Acceptable Device: %@ with RSSI Value: %ld", buf, 0x16u);
  }

  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  v12[0] = @"PPDiscoveredDeviceAdvertisingName";
  v12[1] = @"PPDiscoveredDeviceRSSIValue";
  v13[0] = v6;
  v13[1] = v7;
  int v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v10 postNotificationName:@"PPDeviceWasDiscoveredNotification" object:self userInfo:v11];

  if (self->_discoveryDelegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(PPDiscoveryManagerDelegate *)self->_discoveryDelegate didDiscoverDeviceWithAdvertisingID:v6 signalStrength:v8];
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__PPDiscoveryManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke;
  block[3] = &unk_264E71818;
  id v13 = v8;
  id v14 = v9;
  id v15 = self;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__PPDiscoveryManager_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke(id *a1)
{
  id v4 = [a1[4] objectForKeyedSubscript:*MEMORY[0x263EFECB0]];
  uint64_t v2 = [a1[5] integerValue];
  BOOL v3 = v2 > 19 || v2 < *((void *)a1[6] + 3);
  if (!v3 && [v4 length]) {
    [a1[6] foundAcceptableDeviceWithAdvertisingID:v4 signalStrength:a1[5]];
  }
}

- (int64_t)signalLimitOverride
{
  return self->_signalLimitOverride;
}

- (PPDiscoveryManagerDelegate)discoveryDelegate
{
  return self->_discoveryDelegate;
}

- (void)setDiscoveryDelegate:(id)a3
{
  self->_discoveryDelegate = (PPDiscoveryManagerDelegate *)a3;
}

- (CBCentralManager)central
{
  return self->_central;
}

- (void)setCentral:(id)a3
{
}

- (OS_dispatch_queue)discoveryQueue
{
  return self->_discoveryQueue;
}

- (void)setDiscoveryQueue:(id)a3
{
}

- (BOOL)bluetoothIsScanning
{
  return self->_bluetoothIsScanning;
}

- (void)setBluetoothIsScanning:(BOOL)a3
{
  self->_bluetoothIsScanning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryQueue, 0);
  objc_storeStrong((id *)&self->_central, 0);

  objc_storeStrong((id *)&self->_scanningManager, 0);
}

- (void)setSignalLimitOverride:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 138412546;
  uint64_t v2 = &unk_26F077830;
  __int16 v3 = 2112;
  id v4 = &unk_26F077848;
  _os_log_error_impl(&dword_23C80A000, log, OS_LOG_TYPE_ERROR, "Warning invalid signalLimitOverride value! Acceptable values are greater than or equal to %@ and less than %@", (uint8_t *)&v1, 0x16u);
}

@end