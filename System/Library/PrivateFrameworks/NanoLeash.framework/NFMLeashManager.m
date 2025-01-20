@interface NFMLeashManager
- (BOOL)connected;
- (BOOL)needsToScanForPeripheral;
- (BOOL)testMode;
- (CBCentralManager)centralManager;
- (CBPeripheral)discoveredPeripheral;
- (CBPeripheral)peripheral;
- (CBScalablePipe)pipe;
- (CBScalablePipeManager)pipeManager;
- (NFMLLeashBreakDelegate)leashDelegate;
- (NFMLeashManager)init;
- (NSString)leashIdentifier;
- (NSString)serviceUUID;
- (OS_dispatch_queue)externalQueue;
- (OS_dispatch_source)leashDispatchSourceTimer;
- (int64_t)centralPhase;
- (int64_t)leashMode;
- (void)beginMonitoringLeash;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)leashTest;
- (void)peripheralDidUpdateRSSI:(id)a3 error:(id)a4;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setCentralPhase:(int64_t)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDiscoveredPeripheral:(id)a3;
- (void)setExternalQueue:(id)a3;
- (void)setLeashDelegate:(id)a3;
- (void)setLeashDispatchSourceTimer:(id)a3;
- (void)setLeashIdentifier:(id)a3;
- (void)setLeashMode:(int64_t)a3;
- (void)setNeedsToScanForPeripheral:(BOOL)a3;
- (void)setPeripheral:(id)a3;
- (void)setPipe:(id)a3;
- (void)setPipeManager:(id)a3;
- (void)setProximityChangeHandler:(id)a3;
- (void)setServiceUUID:(id)a3;
- (void)setTestMode:(BOOL)a3;
- (void)stopMonitoringLeash;
- (void)update:(id)a3;
@end

@implementation NFMLeashManager

- (NFMLeashManager)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v14 = 67;
    __int16 v15 = 2080;
    v16 = "-[NFMLeashManager init]";
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  v12.receiver = self;
  v12.super_class = (Class)NFMLeashManager;
  v4 = [(NFMLeashManager *)&v12 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("NFMLeashManager-CentralManagerQueue", 0);
    centralQueue = v4->_centralQueue;
    v4->_centralQueue = (OS_dispatch_queue *)v5;

    objc_storeStrong((id *)&v4->_externalQueue, MEMORY[0x263EF83A0]);
    v4->_connected = 0;
    v4->_leashMode = -1;
    uint64_t v7 = [@"E20A39F4-73F5-4BC4-A12F-17D1AD07A961" copy];
    serviceUUID = v4->_serviceUUID;
    v4->_serviceUUID = (NSString *)v7;

    uint64_t v9 = [@"FMIP-Leash" copy];
    leashIdentifier = v4->_leashIdentifier;
    v4->_leashIdentifier = (NSString *)v9;
  }
  return v4;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  centralQueue = self->_centralQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__NFMLeashManager_setDelegate_queue___block_invoke;
  block[3] = &unk_26509BC60;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(centralQueue, block);
}

id __37__NFMLeashManager_setDelegate_queue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  v3 = (id *)(*(void *)(a1 + 32) + 104);
  return objc_storeWeak(v3, v2);
}

- (void)leashTest
{
  if (self->_proximityChangeHandler)
  {
    double v3 = *(double *)&count + 0.08;
    if (*(double *)&count + 0.08 > 360.0) {
      double v3 = 0.0;
    }
    count = *(void *)&v3;
    long double v4 = sin(v3);
    externalQueue = self->_externalQueue;
    v6[1] = 3221225472;
    v6[0] = MEMORY[0x263EF8330];
    v6[2] = __28__NFMLeashManager_leashTest__block_invoke;
    v6[3] = &unk_26509BC88;
    v6[4] = self;
    *(double *)&v6[5] = v4 * 30.0 + -60.0;
    dispatch_async(externalQueue, v6);
  }
}

uint64_t __28__NFMLeashManager_leashTest__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  double v2 = *(double *)(a1 + 40);
  v3.n128_f64[0] = v2 + (double)(rand() % 50 - 25);
  long double v4 = *(uint64_t (**)(uint64_t, __n128))(v1 + 16);
  return v4(v1, v3);
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __n128 v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v6 = 110;
    __int16 v7 = 2080;
    v8 = "-[NFMLeashManager dealloc]";
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  v4.receiver = self;
  v4.super_class = (Class)NFMLeashManager;
  [(NFMLeashManager *)&v4 dealloc];
}

- (void)setLeashMode:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_queue_t v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v9 = 138;
    __int16 v10 = 2080;
    v11 = "-[NFMLeashManager setLeashMode:]";
    __int16 v12 = 2048;
    int64_t v13 = a3;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "%d %s - leashMode: %ld", buf, 0x1Cu);
  }

  centralQueue = self->_centralQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__NFMLeashManager_setLeashMode___block_invoke;
  v7[3] = &unk_26509BC88;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(centralQueue, v7);
}

uint64_t __32__NFMLeashManager_setLeashMode___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = *(void *)(result + 40);
  return result;
}

- (void)setLeashIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v11 = 147;
    __int16 v12 = 2080;
    int64_t v13 = "-[NFMLeashManager setLeashIdentifier:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "%d %s - leashIdentifier: %@", buf, 0x1Cu);
  }

  centralQueue = self->_centralQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__NFMLeashManager_setLeashIdentifier___block_invoke;
  v8[3] = &unk_26509BCB0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(centralQueue, v8);
}

void __38__NFMLeashManager_setLeashIdentifier___block_invoke(uint64_t a1)
{
}

- (void)setServiceUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v12 = 156;
    __int16 v13 = 2080;
    __int16 v14 = "-[NFMLeashManager setServiceUUID:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "%d %s - serviceUUID: %@", buf, 0x1Cu);
  }

  centralQueue = self->_centralQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__NFMLeashManager_setServiceUUID___block_invoke;
  v8[3] = &unk_26509BCB0;
  id v9 = v4;
  __int16 v10 = self;
  id v7 = v4;
  dispatch_async(centralQueue, v8);
}

void __34__NFMLeashManager_setServiceUUID___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = a1 + 40;
    if (*(void **)(v4 + 40) == v2) {
      return;
    }
    uint64_t v5 = [v2 copy];
    int v6 = *(void **)(*(void *)v3 + 40);
    *(void *)(*(void *)v3 + 40) = v5;
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [@"E20A39F4-73F5-4BC4-A12F-17D1AD07A961" copy];
    char v7 = 0;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v3 = a1 + 40;
    int v6 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

  *(unsigned char *)(*(void *)v3 + 26) = v7;
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = nfm_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67110402;
    v21[1] = 171;
    __int16 v22 = 2080;
    v23 = "-[NFMLeashManager centralManager:didDiscoverPeripheral:advertisementData:RSSI:]";
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_impl(&dword_24011F000, v14, OS_LOG_TYPE_DEFAULT, "%d %s - central: (%@); peripheral: (%@); data: (%@), rssi: (%@)",
      (uint8_t *)v21,
      0x3Au);
  }

  __int16 v15 = [v12 objectForKey:*MEMORY[0x263EFECD8]];
  id v16 = [v15 firstObject];

  uint64_t v17 = [v16 UUIDString];
  int v18 = [v17 isEqualToString:self->_serviceUUID];

  if (v18)
  {
    v19 = (CBPeripheral *)[v11 copy];
    discoveredPeripheral = self->_discoveredPeripheral;
    self->_discoveredPeripheral = v19;

    [(CBCentralManager *)self->_centralManager connectPeripheral:self->_discoveredPeripheral options:0];
  }
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = nfm_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109890;
    v9[1] = 184;
    __int16 v10 = 2080;
    id v11 = "-[NFMLeashManager centralManager:didFailToConnectPeripheral:error:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_24011F000, v8, OS_LOG_TYPE_DEFAULT, "%d %s -- %@ / %@", (uint8_t *)v9, 0x26u);
  }
}

- (void)beginMonitoringLeash
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v7 = 189;
    __int16 v8 = 2080;
    uint64_t v9 = "-[NFMLeashManager beginMonitoringLeash]";
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  centralQueue = self->_centralQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__NFMLeashManager_beginMonitoringLeash__block_invoke;
  block[3] = &unk_26509BCD8;
  block[4] = self;
  dispatch_async(centralQueue, block);
}

void __39__NFMLeashManager_beginMonitoringLeash__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1[1]) {
    __39__NFMLeashManager_beginMonitoringLeash__block_invoke_cold_1();
  }
  if (!v1[7])
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFEF70]) initWithDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    uint64_t v1 = *(void **)(a1 + 32);
  }
  if (!v1[9])
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFEF00]) initWithDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];
    uint64_t v7 = *(void *)(a1 + 32);
    __int16 v8 = *(void **)(v7 + 72);
    *(void *)(v7 + 72) = v6;
  }
  uint64_t v9 = nfm_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[6];
    uint64_t v12 = v10[7];
    uint64_t v13 = v10[9];
    uint64_t v14 = v10[4];
    v15[1] = 202;
    __int16 v16 = 2080;
    v15[0] = 67110402;
    uint64_t v17 = "-[NFMLeashManager beginMonitoringLeash]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v14;
    _os_log_impl(&dword_24011F000, v9, OS_LOG_TYPE_DEFAULT, "%d %s - _leashIdentifier (%@); _pipeManager (%@); _centralManager (%@); _leashMode (%ld)",
      (uint8_t *)v15,
      0x3Au);
  }
}

- (void)stopMonitoringLeash
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v7 = 208;
    __int16 v8 = 2080;
    uint64_t v9 = "-[NFMLeashManager stopMonitoringLeash]";
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  centralQueue = self->_centralQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__NFMLeashManager_stopMonitoringLeash__block_invoke;
  block[3] = &unk_26509BCD8;
  block[4] = self;
  dispatch_async(centralQueue, block);
}

void __38__NFMLeashManager_stopMonitoringLeash__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  if (v3)
  {
    uint64_t v4 = [v3 state];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v4 == 2)
    {
      [*(id *)(v2 + 72) cancelPeripheralConnection:*(void *)(v2 + 80)];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  [*(id *)(v2 + 56) unregisterEndpoint:*(void *)(v2 + 48)];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = 0;

  *(void *)(*(void *)(a1 + 32) + 96) = 0;
  [*(id *)(*(void *)(a1 + 32) + 72) setDelegate:0];
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = 0;

  [*(id *)(*(void *)(a1 + 32) + 80) setDelegate:0];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(NSObject **)(v11 + 112);
  if (v12)
  {
    dispatch_source_cancel(v12);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 112);
    *(void *)(v13 + 112) = 0;

    uint64_t v11 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v11 + 25) = 0;
}

- (void)setProximityChangeHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)MEMORY[0x2455DE870](v4);
    *(_DWORD *)buf = 67109634;
    int v12 = 236;
    __int16 v13 = 2080;
    uint64_t v14 = "-[NFMLeashManager setProximityChangeHandler:]";
    __int16 v15 = 2112;
    __int16 v16 = v6;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "%d %s - handler: (%@)", buf, 0x1Cu);
  }
  centralQueue = self->_centralQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __45__NFMLeashManager_setProximityChangeHandler___block_invoke;
  v9[3] = &unk_26509BD00;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(centralQueue, v9);
}

void *__45__NFMLeashManager_setProximityChangeHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 8) != result)
  {
    *(void *)(*(void *)(a1 + 32) + 8) = [result copy];
    return (void *)MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)update:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = nfm_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    peripheral = self->_peripheral;
    v6[0] = 67109634;
    v6[1] = 249;
    __int16 v7 = 2080;
    id v8 = "-[NFMLeashManager update:]";
    __int16 v9 = 2112;
    id v10 = peripheral;
    _os_log_impl(&dword_24011F000, v4, OS_LOG_TYPE_DEFAULT, "%d %s - _peripheral: (%@)", (uint8_t *)v6, 0x1Cu);
  }

  [(CBPeripheral *)self->_peripheral readRSSI];
}

- (void)peripheralDidUpdateRSSI:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = nfm_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v17 = 256;
    __int16 v18 = 2080;
    uint64_t v19 = "-[NFMLeashManager peripheralDidUpdateRSSI:error:]";
    __int16 v20 = 2112;
    *(void *)uint64_t v21 = v6;
    *(_WORD *)&v21[8] = 2112;
    *(void *)&v21[10] = v7;
    _os_log_impl(&dword_24011F000, v8, OS_LOG_TYPE_DEFAULT, "%d %s - peripheral (%@); error (%@)", buf, 0x26u);
  }

  if (self->_proximityChangeHandler)
  {
    if (self->_connected)
    {
      __int16 v9 = [(CBPeripheral *)self->_peripheral RSSI];
      [v9 floatValue];
      double v11 = v10;
    }
    else
    {
      double v11 = 2.22507386e-308;
    }
    int v12 = nfm_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL connected = self->_connected;
      *(_DWORD *)buf = 67109890;
      int v17 = 259;
      __int16 v18 = 2080;
      uint64_t v19 = "-[NFMLeashManager peripheralDidUpdateRSSI:error:]";
      __int16 v20 = 1024;
      *(_DWORD *)uint64_t v21 = connected;
      *(_WORD *)&v21[4] = 2048;
      *(double *)&v21[6] = v11;
      _os_log_impl(&dword_24011F000, v12, OS_LOG_TYPE_DEFAULT, "%d %s - _connected (%d); rssi (%f)", buf, 0x22u);
    }

    externalQueue = self->_externalQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    _DWORD v15[2] = __49__NFMLeashManager_peripheralDidUpdateRSSI_error___block_invoke;
    v15[3] = &unk_26509BC88;
    v15[4] = self;
    *(double *)&v15[5] = v11;
    dispatch_async(externalQueue, v15);
  }
}

uint64_t __49__NFMLeashManager_peripheralDidUpdateRSSI_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(*(void *)(a1 + 32) + 8) + 16))(*(void *)(*(void *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = nfm_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v17 = 268;
    __int16 v18 = 2080;
    uint64_t v19 = "-[NFMLeashManager centralManager:didConnectPeripheral:]";
    __int16 v20 = 2112;
    double v21 = *(double *)&v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_24011F000, v8, OS_LOG_TYPE_DEFAULT, "%d %s - central (%@); peripheral (%@)", buf, 0x26u);
  }

  [(CBPeripheral *)self->_peripheral setDelegate:0];
  objc_storeStrong((id *)&self->_peripheral, a4);
  [(CBPeripheral *)self->_peripheral setDelegate:self];
  self->_BOOL connected = 1;
  [(CBPeripheral *)self->_peripheral readRSSI];
  __int16 v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_centralQueue);
  leashDispatchSourceTimer = self->_leashDispatchSourceTimer;
  self->_leashDispatchSourceTimer = v9;

  unint64_t v11 = self->_leashMode - 1;
  double v12 = 8.0;
  if (v11 <= 2) {
    double v12 = dbl_24012AC30[v11];
  }
  __int16 v13 = nfm_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v17 = 132;
    __int16 v18 = 2080;
    uint64_t v19 = "HeatBeatTimeForMode";
    __int16 v20 = 2048;
    double v21 = v12;
    _os_log_impl(&dword_24011F000, v13, OS_LOG_TYPE_DEFAULT, "%d %s - heartBeatTime: %f", buf, 0x1Cu);
  }

  dispatch_source_set_timer((dispatch_source_t)self->_leashDispatchSourceTimer, 0, (uint64_t)(v12 * 1000000000.0), (uint64_t)(v12 * 1000000000.0) / 0xAuLL);
  uint64_t v14 = self->_leashDispatchSourceTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __55__NFMLeashManager_centralManager_didConnectPeripheral___block_invoke;
  handler[3] = &unk_26509BCD8;
  handler[4] = self;
  dispatch_source_set_event_handler(v14, handler);
  dispatch_resume((dispatch_object_t)self->_leashDispatchSourceTimer);
}

uint64_t __55__NFMLeashManager_centralManager_didConnectPeripheral___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = nfm_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
    v5[0] = 67109634;
    v5[1] = 284;
    __int16 v6 = 2080;
    id v7 = "-[NFMLeashManager centralManager:didConnectPeripheral:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_24011F000, v2, OS_LOG_TYPE_DEFAULT, "%d %s - _peripheral: (%@)", (uint8_t *)v5, 0x1Cu);
  }

  return [*(id *)(*(void *)(a1 + 32) + 80) readRSSI];
}

- (void)connect
{
  if (self->_peripheral)
  {
    centralManager = self->_centralManager;
    -[CBCentralManager connectPeripheral:options:](centralManager, "connectPeripheral:options:");
  }
  else
  {
    uint64_t v3 = nfm_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "Warning: Tried to connect with nil peripheral", v4, 2u);
    }
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v13 = 303;
    __int16 v14 = 2080;
    __int16 v15 = "-[NFMLeashManager centralManagerDidUpdateState:]";
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2048;
    uint64_t v19 = [v4 state];
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "%d %s - central (%@); state (%ld)", buf, 0x26u);
  }

  if ([v4 state] == 5)
  {
    int64_t centralPhase = self->_centralPhase;
    if (centralPhase == 1)
    {
      id v7 = nfm_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24011F000, v7, OS_LOG_TYPE_DEFAULT, "Start Scanning", buf, 2u);
      }

      centralManager = self->_centralManager;
      uint64_t v9 = [MEMORY[0x263EFEF88] UUIDWithString:self->_serviceUUID];
      unint64_t v11 = v9;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
      [(CBCentralManager *)centralManager scanForPeripheralsWithServices:v10 options:0];
    }
    else if (centralPhase == 2)
    {
      [(NFMLeashManager *)self connect];
    }
  }
}

- (void)setTestMode:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v10 = 324;
    __int16 v11 = 2080;
    double v12 = "-[NFMLeashManager setTestMode:]";
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  centralQueue = self->_centralQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__NFMLeashManager_setTestMode___block_invoke;
  v7[3] = &unk_26509BD28;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(centralQueue, v7);
}

void __31__NFMLeashManager_setTestMode___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = *(unsigned char *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 24))
  {
    uint64_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(v1 + 16));
    dispatch_source_set_timer(v3, 0, 0x5F5E100uLL, 0x989680uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __31__NFMLeashManager_setTestMode___block_invoke_2;
    handler[3] = &unk_26509BCD8;
    handler[4] = *(void *)(a1 + 32);
    dispatch_source_set_event_handler(v3, handler);
    dispatch_resume(v3);
  }
}

uint64_t __31__NFMLeashManager_setTestMode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) leashTest];
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109890;
    v6[1] = 349;
    __int16 v7 = 2080;
    BOOL v8 = "-[NFMLeashManager scalablePipeManagerDidUpdateState:]";
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 state];
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "%d %s - pipeManager: (%@); state: %ld",
      (uint8_t *)v6,
      0x26u);
  }

  if ([v4 state] == 5) {
    [(CBScalablePipeManager *)self->_pipeManager registerEndpoint:self->_leashIdentifier type:1 priority:2];
  }
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = nfm_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67110146;
    v11[1] = 357;
    __int16 v12 = 2080;
    uint64_t v13 = "-[NFMLeashManager scalablePipeManager:didRegisterEndpoint:error:]";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_24011F000, v10, OS_LOG_TYPE_DEFAULT, "%d %s - pipeManager: (%@); identifier (%@); error: (%@)",
      (uint8_t *)v11,
      0x30u);
  }
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = nfm_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109890;
    v8[1] = 362;
    __int16 v9 = 2080;
    id v10 = "-[NFMLeashManager scalablePipeManager:didUnregisterEndpoint:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_24011F000, v7, OS_LOG_TYPE_DEFAULT, "%d %s - pipeManager: (%@); identifier (%@)",
      (uint8_t *)v8,
      0x26u);
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = nfm_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    int v20 = 367;
    __int16 v21 = 2080;
    __int16 v22 = "-[NFMLeashManager scalablePipeManager:pipeDidConnect:]";
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_24011F000, v8, OS_LOG_TYPE_DEFAULT, "%d %s - pipeManager: (%@); pipe (%@)", buf, 0x26u);
  }

  objc_storeStrong((id *)&self->_pipe, a4);
  __int16 v9 = [(CBScalablePipe *)self->_pipe central];
  id v10 = [v9 identifier];
  centralManager = self->_centralManager;
  __int16 v18 = v10;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  __int16 v13 = [(CBCentralManager *)centralManager retrievePeripheralsWithIdentifiers:v12];

  if ([v13 count])
  {
    id v14 = [v13 firstObject];
    peripheral = self->_peripheral;
    self->_peripheral = v14;

    [(CBCentralManager *)self->_centralManager connectPeripheral:self->_peripheral options:0];
  }
  self->_BOOL connected = 1;
  externalQueue = self->_externalQueue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__NFMLeashManager_scalablePipeManager_pipeDidConnect___block_invoke;
  v17[3] = &unk_26509BCD8;
  v17[4] = self;
  dispatch_async(externalQueue, v17);
}

void __54__NFMLeashManager_scalablePipeManager_pipeDidConnect___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = nfm_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 383;
    __int16 v5 = 2080;
    id v6 = "-[NFMLeashManager scalablePipeManager:pipeDidConnect:]_block_invoke";
    _os_log_impl(&dword_24011F000, v2, OS_LOG_TYPE_DEFAULT, "%d %s - Leashed", (uint8_t *)v4, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  [WeakRetained leashed];
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = nfm_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v11 = 390;
    __int16 v12 = 2080;
    __int16 v13 = "-[NFMLeashManager scalablePipeManager:pipeDidDisconnect:error:]";
    _os_log_impl(&dword_24011F000, v6, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  pipe = self->_pipe;
  self->_pipe = 0;

  self->_BOOL connected = 0;
  externalQueue = self->_externalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NFMLeashManager_scalablePipeManager_pipeDidDisconnect_error___block_invoke;
  block[3] = &unk_26509BCD8;
  block[4] = self;
  dispatch_async(externalQueue, block);
}

void __63__NFMLeashManager_scalablePipeManager_pipeDidDisconnect_error___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = nfm_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 396;
    __int16 v5 = 2080;
    id v6 = "-[NFMLeashManager scalablePipeManager:pipeDidDisconnect:error:]_block_invoke";
    _os_log_impl(&dword_24011F000, v2, OS_LOG_TYPE_DEFAULT, "%d %s - Leash broke", (uint8_t *)v4, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  [WeakRetained leashBroke];
}

- (int64_t)leashMode
{
  return self->_leashMode;
}

- (NSString)serviceUUID
{
  return self->_serviceUUID;
}

- (NSString)leashIdentifier
{
  return self->_leashIdentifier;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_BOOL connected = a3;
}

- (CBScalablePipeManager)pipeManager
{
  return self->_pipeManager;
}

- (void)setPipeManager:(id)a3
{
}

- (CBScalablePipe)pipe
{
  return self->_pipe;
}

- (void)setPipe:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (CBPeripheral)discoveredPeripheral
{
  return self->_discoveredPeripheral;
}

- (void)setDiscoveredPeripheral:(id)a3
{
}

- (int64_t)centralPhase
{
  return self->_centralPhase;
}

- (void)setCentralPhase:(int64_t)a3
{
  self->_int64_t centralPhase = a3;
}

- (BOOL)needsToScanForPeripheral
{
  return self->_needsToScanForPeripheral;
}

- (void)setNeedsToScanForPeripheral:(BOOL)a3
{
  self->_needsToScanForPeripheral = a3;
}

- (NFMLLeashBreakDelegate)leashDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leashDelegate);
  return (NFMLLeashBreakDelegate *)WeakRetained;
}

- (void)setLeashDelegate:(id)a3
{
}

- (OS_dispatch_source)leashDispatchSourceTimer
{
  return self->_leashDispatchSourceTimer;
}

- (void)setLeashDispatchSourceTimer:(id)a3
{
}

- (OS_dispatch_queue)externalQueue
{
  return self->_externalQueue;
}

- (void)setExternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_leashDispatchSourceTimer, 0);
  objc_destroyWeak((id *)&self->_leashDelegate);
  objc_storeStrong((id *)&self->_discoveredPeripheral, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_leashIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong((id *)&self->_centralQueue, 0);
  objc_storeStrong(&self->_proximityChangeHandler, 0);
}

void __39__NFMLeashManager_beginMonitoringLeash__block_invoke_cold_1()
{
}

@end