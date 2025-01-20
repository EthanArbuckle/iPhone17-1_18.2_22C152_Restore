@interface WPPairing
- (BOOL)allowScreenOffScanning;
- (NSMutableSet)ignoredDevices;
- (WPPairing)initWithDelegate:(id)a3;
- (WPPairing)initWithDelegate:(id)a3 queue:(id)a4;
- (WPPairing)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5;
- (WPPairingDelegate)delegate;
- (id)clientAsString;
- (void)clearProximityPairingServiceDuplicates;
- (void)deviceDiscovered:(id)a3;
- (void)ignoreDeviceUntilNextUnlock:(id)a3 ignoreDevice:(BOOL)a4;
- (void)invalidate;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)scanningStartedOfType:(unsigned __int8)a3;
- (void)scanningStoppedOfType:(unsigned __int8)a3;
- (void)setAllowScreenOffScanning:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoredDevices:(id)a3;
- (void)startProximityPairingServiceScanning;
- (void)startProximityPairingServiceScanningWithRSSI:(id)a3 duplicates:(BOOL)a4;
- (void)startProximityPairingServiceScanningWithRSSI:(id)a3 duplicates:(BOOL)a4 scanMode:(int64_t)a5;
- (void)stateDidChange:(int64_t)a3;
- (void)stopProximityPairingServiceScanning;
@end

@implementation WPPairing

- (WPPairing)initWithDelegate:(id)a3 queue:(id)a4 machName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[WPClient isHomePod])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_4);
    }
    v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPPairing initWithDelegate:queue:machName:](v11);
    }
    v12 = 0;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)WPPairing;
    v13 = [(WPClient *)&v24 initWithQueue:v9 machName:v10];
    v14 = v13;
    if (v13)
    {
      objc_storeWeak((id *)&v13->_delegate, v8);
      uint64_t v15 = [MEMORY[0x263EFF9C0] set];
      ignoredDevices = v14->_ignoredDevices;
      v14->_ignoredDevices = (NSMutableSet *)v15;

      v14->_allowScreenOffScanning = 0;
      v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v18 = [v17 persistentDomainForName:@"com.apple.MobileBluetooth.debug"];
      v19 = [v18 objectForKeyedSubscript:@"WIPROX"];

      v20 = [v19 objectForKeyedSubscript:@"ScreenOffProxPairing"];
      v21 = v20;
      if (v20)
      {
        v14->_allowScreenOffScanning = [v20 BOOLValue];
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_147_0);
        }
        v22 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          -[WPPairing initWithDelegate:queue:machName:]((unsigned __int8 *)&v14->_allowScreenOffScanning, v22);
        }
      }
    }
    self = v14;
    v12 = self;
  }

  return v12;
}

- (WPPairing)initWithDelegate:(id)a3
{
  return [(WPPairing *)self initWithDelegate:a3 queue:0 machName:0];
}

- (WPPairing)initWithDelegate:(id)a3 queue:(id)a4
{
  return [(WPPairing *)self initWithDelegate:a3 queue:a4 machName:0];
}

- (id)clientAsString
{
  return @"WPPairing";
}

- (void)invalidate
{
  [(WPPairing *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WPPairing;
  [(WPClient *)&v3 invalidate];
}

- (void)startProximityPairingServiceScanningWithRSSI:(id)a3 duplicates:(BOOL)a4 scanMode:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = 300;
  if ((unint64_t)(a5 - 1) < 2) {
    uint64_t v9 = 60;
  }
  if (a5 == 3) {
    uint64_t v10 = 40;
  }
  else {
    uint64_t v10 = v9;
  }
  BOOL v11 = [(WPClient *)self isBubbleTestClient];
  uint64_t v12 = v11 | v6;
  if (v11) {
    uint64_t v13 = 30;
  }
  else {
    uint64_t v13 = v10;
  }
  v14 = objc_opt_new();
  v17[0] = v13;
  v17[1] = v13;
  v17[2] = 30;
  [v14 setScanningRates:v17];
  [v14 setAllowDuplicates:v12];
  [v14 setClientType:7];
  if (v8) {
    [v14 setRssiThreshold:v8];
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_155);
  }
  uint64_t v15 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v14;
    _os_log_impl(&dword_2144AA000, v15, OS_LOG_TYPE_DEFAULT, "ProximityPairing start scanning with data: %{public}@", buf, 0xCu);
  }
  v16.receiver = self;
  v16.super_class = (Class)WPPairing;
  [(WPClient *)&v16 startScanning:v14];
}

- (void)startProximityPairingServiceScanningWithRSSI:(id)a3 duplicates:(BOOL)a4
{
}

- (void)startProximityPairingServiceScanning
{
}

- (void)deviceDiscovered:(id)a3
{
  v28[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
  BOOL v6 = [v4 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
  v7 = [v4 objectForKeyedSubscript:@"kDeviceRSSI"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"kDeviceName"];
  v26 = [v4 objectForKeyedSubscript:@"kDevicePaired"];
  v25 = [v4 objectForKeyedSubscript:@"kDeviceChannel"];
  objc_super v24 = [v4 objectForKeyedSubscript:@"kDeviceTime"];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"kDeviceAddress"];
  uint64_t v10 = [v4 objectForKeyedSubscript:@"kDeviceProxPairingStatusDecrypted"];
  BOOL v11 = [v4 objectForKeyedSubscript:@"kDeviceAccessoryStatusDecrypted"];

  if ((unint64_t)[v5 length] > 6)
  {
    v23 = v6;
    v14 = [(WPPairing *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v27[0] = @"WPPairingKeyName";
      v27[1] = @"WPPairingKeyPaired";
      uint64_t v12 = (void *)v8;
      v28[0] = v8;
      v28[1] = v26;
      v27[2] = @"WPPairingKeyAdvertisingChannel";
      v27[3] = @"WPPairingKeyRSSI";
      v28[2] = v25;
      v28[3] = v7;
      v27[4] = @"WPPairingKeyDeviceTime";
      v27[5] = @"WPPairingKeyDeviceAddress";
      objc_super v16 = v9;
      v28[4] = v24;
      if (!v9)
      {
        objc_super v16 = [MEMORY[0x263EFF8F8] data];
      }
      v28[5] = v16;
      v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:6];
      v18 = (void *)[v17 mutableCopy];

      if (!v9) {
      if (v10)
      }
        [v18 setObject:v10 forKeyedSubscript:@"WPPairingKeyStatusDecrypted"];
      if (v11) {
        [v18 setObject:v11 forKeyedSubscript:@"WPPairingKeyAccessoryStatusDecrypted"];
      }
      v19 = [(WPPairing *)self delegate];
      uint64_t v20 = (void *)[v18 copy];
      [v19 pairing:self foundDevice:v23 payload:v5 rssi:v7 peerInfo:v20];

      BOOL v6 = v23;
    }
    else
    {
      uint64_t v12 = (void *)v8;
      v21 = [(WPPairing *)self delegate];
      char v22 = objc_opt_respondsToSelector();

      BOOL v6 = v23;
      if ((v22 & 1) == 0) {
        goto LABEL_19;
      }
      v18 = [(WPPairing *)self delegate];
      v19 = [v23 UUIDString];
      [v18 pairing:self foundDevice:v19 payload:v5 rssi:v7];
    }

    goto LABEL_19;
  }
  uint64_t v12 = (void *)v8;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_159);
  }
  uint64_t v13 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPPairing deviceDiscovered:](v13, v5);
  }
LABEL_19:
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  id v4 = [(WPPairing *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPPairing *)self delegate];
    [v6 pairingStartedScanning:self];
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  char v5 = [(WPPairing *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(WPPairing *)self delegate];
    [v7 pairing:self failedToStartScanningWithError:v8];
  }
}

- (void)stopProximityPairingServiceScanning
{
  objc_super v3 = objc_opt_new();
  [v3 setClientType:7];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_171);
  }
  id v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "ProximityPairing stop scanning", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)WPPairing;
  [(WPClient *)&v5 stopScanning:v3];
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  id v4 = [(WPPairing *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPPairing *)self delegate];
    [v6 pairingStoppedScanning:self];
  }
}

- (void)ignoreDeviceUntilNextUnlock:(id)a3 ignoreDevice:(BOOL)a4
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_177);
  }
  char v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPPairing ignoreDeviceUntilNextUnlock:ignoreDevice:](v5);
  }
}

- (void)clearProximityPairingServiceDuplicates
{
  objc_super v3 = objc_opt_new();
  [v3 setClientType:7];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_179_0);
  }
  id v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "ProximityPairing clear duplicate cache", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)WPPairing;
  [(WPClient *)&v5 clearDuplicateFilterCache:v3];
}

- (void)stateDidChange:(int64_t)a3
{
  int64_t v5 = [(WPClient *)self state];
  v9.receiver = self;
  v9.super_class = (Class)WPPairing;
  [(WPClient *)&v9 stateDidChange:a3];
  if ([(WPClient *)self state] != v5)
  {
    id v6 = [(WPPairing *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(WPPairing *)self delegate];
      [v8 pairingDidUpdateState:self];
    }
  }
}

- (WPPairingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPPairingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)ignoredDevices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIgnoredDevices:(id)a3
{
}

- (BOOL)allowScreenOffScanning
{
  return self->_allowScreenOffScanning;
}

- (void)setAllowScreenOffScanning:(BOOL)a3
{
  self->_allowScreenOffScanning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredDevices, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(os_log_t)log queue:machName:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "ProximityPairing is not supported on this product", v1, 2u);
}

- (void)initWithDelegate:(unsigned __int8 *)a1 queue:(NSObject *)a2 machName:.cold.2(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_2144AA000, a2, OS_LOG_TYPE_DEBUG, "Using allow screen off scanning for prox pairing: %d", (uint8_t *)v3, 8u);
}

- (void)deviceDiscovered:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 length];
  _os_log_error_impl(&dword_2144AA000, v3, OS_LOG_TYPE_ERROR, "ProximityPairing minimum advertisement data length expected: 7, received: %lu", (uint8_t *)&v4, 0xCu);
}

- (void)ignoreDeviceUntilNextUnlock:(os_log_t)log ignoreDevice:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "Unimplemented for now, will scope if it's being used", v1, 2u);
}

@end