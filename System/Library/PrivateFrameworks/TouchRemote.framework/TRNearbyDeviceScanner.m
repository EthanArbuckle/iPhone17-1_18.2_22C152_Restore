@interface TRNearbyDeviceScanner
+ (void)initialize;
- (OS_dispatch_queue)scannerQ;
- (SFDeviceDiscovery)deviceDiscovery;
- (TRNearbyDeviceScanner)init;
- (TRNearbyDeviceScannerDelegate)delegate;
- (unint64_t)requestedService;
- (unint64_t)state;
- (void)_deviceFound:(id)a3;
- (void)_handleActivationWithError:(id)a3;
- (void)_handleInterruption;
- (void)_handleInvalidation;
- (void)openSession:(id)a3 withCompletion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceDiscovery:(id)a3;
- (void)setRequestedService:(unint64_t)a3;
- (void)setScannerQ:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)startScanningForDevicesWithService:(unint64_t)a3;
- (void)stopScanning;
@end

@implementation TRNearbyDeviceScanner

+ (void)initialize
{
  _TRLogEnabled = 1;
  _TRLogVerboseEnabled = 1;
}

- (TRNearbyDeviceScanner)init
{
  v6.receiver = self;
  v6.super_class = (Class)TRNearbyDeviceScanner;
  v2 = [(TRNearbyDeviceScanner *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TRNearbyDeviceScanner.scannerQ", 0);
    scannerQ = v2->_scannerQ;
    v2->_scannerQ = (OS_dispatch_queue *)v3;

    v2->_state = 1;
  }
  return v2;
}

- (void)startScanningForDevicesWithService:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = [(TRNearbyDeviceScanner *)self delegate];

  if (!v5)
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"TRNearbyDeviceScanner requires a delegate." userInfo:0];
    objc_exception_throw(v8);
  }
  if (_TRLogEnabled == 1)
  {
    objc_super v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[TRNearbyDeviceScanner startScanningForDevicesWithService:]";
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "%s Start scanning for devices with service: %lu.", buf, 0x16u);
    }
  }
  scannerQ = self->_scannerQ;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke;
  v9[3] = &unk_2642207E0;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(scannerQ, v9);
}

void __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2[2] == 1)
  {
    v2[2] = 2;
    [*(id *)(a1 + 32) setRequestedService:*(void *)(a1 + 40)];
    id v3 = objc_alloc_init(MEMORY[0x263F6C230]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.TRNearbyDeviceScanner.deviceDiscoveryQ", 0);
    [*(id *)(*(void *)(a1 + 32) + 24) setDispatchQueue:v6];

    [*(id *)(*(void *)(a1 + 32) + 24) setChangeFlags:2];
    if ([*(id *)(a1 + 32) requestedService] == 1) {
      [*(id *)(*(void *)(a1 + 32) + 24) setDiscoveryFlags:16];
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_14;
    v21[3] = &unk_264221110;
    v21[4] = *(void *)(a1 + 32);
    v7 = (void *)MEMORY[0x2166AC110](v21);
    [*(id *)(*(void *)(a1 + 32) + 24) setDeviceFoundHandler:v7];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_2;
    v20[3] = &unk_264221138;
    v20[4] = *(void *)(a1 + 32);
    id v8 = (void *)MEMORY[0x2166AC110](v20);
    [*(id *)(*(void *)(a1 + 32) + 24) setDeviceChangedHandler:v8];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_3;
    v19[3] = &unk_264220858;
    v19[4] = *(void *)(a1 + 32);
    v9 = (void *)MEMORY[0x2166AC110](v19);
    [*(id *)(*(void *)(a1 + 32) + 24) setInvalidationHandler:v9];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_4;
    v18[3] = &unk_264220858;
    v18[4] = *(void *)(a1 + 32);
    v10 = (void *)MEMORY[0x2166AC110](v18);
    [*(id *)(*(void *)(a1 + 32) + 24) setInterruptionHandler:v10];
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = *(void **)(v11 + 24);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_5;
    v17[3] = &unk_264220E88;
    v17[4] = v11;
    [v12 activateWithCompletion:v17];

    goto LABEL_11;
  }
  if (_TRLogEnabled == 1)
  {
    unint64_t v13 = TRLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[TRNearbyDeviceScanner startScanningForDevicesWithService:]_block_invoke";
      _os_log_impl(&dword_2149BE000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to start scanning. Scanner is not stopped.", buf, 0xCu);
    }

    v2 = *(void **)(a1 + 32);
  }
  uint64_t v14 = [v2 delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = *MEMORY[0x263F08338];
    v22[0] = *MEMORY[0x263F08320];
    v22[1] = v16;
    v23[0] = @"Failed to start scanning.";
    v23[1] = @"Scanner is not stopped.";
    v7 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9400 userInfo:v7];
    v9 = [*(id *)(a1 + 32) delegate];
    [v9 nearbyDeviceScanner:*(void *)(a1 + 32) didFailToStartScanningWithError:v8];
LABEL_11:
  }
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceFound:a2];
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deviceChanged:a2];
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInvalidation];
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInterruption];
}

uint64_t __60__TRNearbyDeviceScanner_startScanningForDevicesWithService___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleActivationWithError:a2];
}

- (void)stopScanning
{
  scannerQ = self->_scannerQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__TRNearbyDeviceScanner_stopScanning__block_invoke;
  block[3] = &unk_264220858;
  block[4] = self;
  dispatch_async(scannerQ, block);
}

void __37__TRNearbyDeviceScanner_stopScanning__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  if (v3 == 3)
  {
    if (_TRLogEnabled == 1)
    {
      id v8 = TRLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[TRNearbyDeviceScanner stopScanning]_block_invoke";
        _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "%s Stopping scanner.", buf, 0xCu);
      }

      v2 = *(void **)(a1 + 32);
    }
    v2[2] = 4;
    [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  }
  else if (v3 == 1)
  {
    if (_TRLogEnabled == 1)
    {
      uint64_t v4 = TRLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[TRNearbyDeviceScanner stopScanning]_block_invoke";
        _os_log_impl(&dword_2149BE000, v4, OS_LOG_TYPE_DEFAULT, "%s Scanner stopped.", buf, 0xCu);
      }

      v2 = *(void **)(a1 + 32);
    }
    v5 = [v2 delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [*(id *)(a1 + 32) delegate];
      [v7 nearbyDeviceScannerDidStopScanning:*(void *)(a1 + 32)];
LABEL_20:
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      v9 = TRLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[TRNearbyDeviceScanner stopScanning]_block_invoke";
        _os_log_impl(&dword_2149BE000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed to stop scanner. Advertiser is not started.", buf, 0xCu);
      }

      v2 = *(void **)(a1 + 32);
    }
    v10 = [v2 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v12 = *MEMORY[0x263F08338];
      v15[0] = *MEMORY[0x263F08320];
      v15[1] = v12;
      v16[0] = @"Failed to stop scanning.";
      v16[1] = @"Scanner is not started.";
      v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      unint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9301 userInfo:v7];
      uint64_t v14 = [*(id *)(a1 + 32) delegate];
      [v14 nearbyDeviceScanner:*(void *)(a1 + 32) didFailToStopScanningWithError:v13];

      goto LABEL_20;
    }
  }
}

- (void)_handleActivationWithError:(id)a3
{
  id v4 = a3;
  scannerQ = self->_scannerQ;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TRNearbyDeviceScanner__handleActivationWithError___block_invoke;
  v7[3] = &unk_264220880;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(scannerQ, v7);
}

void __52__TRNearbyDeviceScanner__handleActivationWithError___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    if (_TRLogEnabled == 1)
    {
      v2 = TRLogHandle();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void *)(a1 + 32);
        uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 24);
        int v14 = 138412546;
        uint64_t v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = v3;
        _os_log_impl(&dword_2149BE000, v2, OS_LOG_TYPE_DEFAULT, "<%@> activation error %@", (uint8_t *)&v14, 0x16u);
      }
    }
    *(void *)(*(void *)(a1 + 40) + 16) = 1;
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;

    v7 = [*(id *)(a1 + 40) delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [*(id *)(a1 + 40) delegate];
      [v9 nearbyDeviceScanner:*(void *)(a1 + 40) didFailToStartScanningWithError:*(void *)(a1 + 32)];
LABEL_14:
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      v10 = TRLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 24);
        int v14 = 138412290;
        uint64_t v15 = v11;
        _os_log_impl(&dword_2149BE000, v10, OS_LOG_TYPE_DEFAULT, "SFDeviceDiscovery activation completed <%@>", (uint8_t *)&v14, 0xCu);
      }
    }
    *(void *)(*(void *)(a1 + 40) + 16) = 3;
    uint64_t v12 = [*(id *)(a1 + 40) delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v9 = [*(id *)(a1 + 40) delegate];
      [v9 nearbyDeviceScannerDidStartScanning:*(void *)(a1 + 40)];
      goto LABEL_14;
    }
  }
}

- (void)_handleInvalidation
{
  scannerQ = self->_scannerQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TRNearbyDeviceScanner__handleInvalidation__block_invoke;
  block[3] = &unk_264220858;
  block[4] = self;
  dispatch_async(scannerQ, block);
}

void __44__TRNearbyDeviceScanner__handleInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 16) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 nearbyDeviceScannerDidStopScanning:*(void *)(a1 + 32)];
  }
  else if (_TRLogEnabled == 1)
  {
    id v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[TRNearbyDeviceScanner _handleInvalidation]_block_invoke";
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "%s Device discovery invalidated", buf, 0xCu);
    }
  }
}

- (void)_handleInterruption
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == 1)
  {
    uint64_t v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      char v5 = "-[TRNearbyDeviceScanner _handleInterruption]";
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s Device discovery interrupted", (uint8_t *)&v4, 0xCu);
    }
  }
  [(TRNearbyDeviceScanner *)self _handleInvalidation];
}

- (void)_deviceFound:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 distance] == 10)
  {
    if ([(TRNearbyDeviceScanner *)self requestedService] != 1
      || ([v4 needsSetup] & 1) != 0)
    {
      char v5 = [[TRNearbyDevice alloc] initWithRepresentedDevice:v4 supportedService:[(TRNearbyDeviceScanner *)self requestedService]];
      uint64_t v6 = [(TRNearbyDeviceScanner *)self delegate];
      [v6 nearbyDeviceScanner:self didDiscoverDevice:v5];

      goto LABEL_14;
    }
    if (_TRLogEnabled != 1) {
      goto LABEL_14;
    }
    id v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = [v4 identifier];
      int v10 = 136315394;
      uint64_t v11 = "-[TRNearbyDeviceScanner _deviceFound:]";
      __int16 v12 = 2112;
      char v13 = v8;
      v9 = "%s Device (%@) rejected. Does not support setup.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if ([v4 distance] == 20 && _TRLogEnabled == 1)
  {
    id v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = [v4 identifier];
      int v10 = 136315394;
      uint64_t v11 = "-[TRNearbyDeviceScanner _deviceFound:]";
      __int16 v12 = 2112;
      char v13 = v8;
      v9 = "%s Device (%@) rejected. Not at tap distance.";
LABEL_12:
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x16u);
    }
LABEL_13:
  }
LABEL_14:
}

- (void)openSession:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(TRClientConnection);
  char v8 = [v5 nearbyDevice];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__TRNearbyDeviceScanner_openSession_withCompletion___block_invoke;
  v12[3] = &unk_264221160;
  uint64_t v14 = v7;
  id v15 = v6;
  id v13 = v5;
  v9 = v7;
  id v10 = v5;
  id v11 = v6;
  [(TRClientConnection *)v9 connectToNearbyDevice:v8 withCompletion:v12];
}

void __52__TRNearbyDeviceScanner_openSession_withCompletion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setConnection:*(void *)(a1 + 40)];
    uint64_t v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__TRNearbyDeviceScanner_openSession_withCompletion___block_invoke_2;
    v5[3] = &unk_264220FC8;
    id v6 = v3;
    id v7 = *(id *)(a1 + 48);
    [v6 sendHeartbeatWithResponseHandler:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

void __52__TRNearbyDeviceScanner_openSession_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) startHeartbeat];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (TRNearbyDeviceScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TRNearbyDeviceScannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (SFDeviceDiscovery)deviceDiscovery
{
  return self->_deviceDiscovery;
}

- (void)setDeviceDiscovery:(id)a3
{
}

- (OS_dispatch_queue)scannerQ
{
  return self->_scannerQ;
}

- (void)setScannerQ:(id)a3
{
}

- (unint64_t)requestedService
{
  return self->_requestedService;
}

- (void)setRequestedService:(unint64_t)a3
{
  self->_requestedService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerQ, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end