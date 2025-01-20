@interface WPHeySiri
+ (int64_t)holdVouchers;
- (BOOL)isScanning;
- (WPHeySiri)initWithDelegate:(id)a3 queue:(id)a4;
- (WPHeySiriProtocol)delegate;
- (id)clientAsString;
- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)advertisingPendingOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfType:(unsigned __int8)a3;
- (void)advertisingStartedOfTypeAt:(unsigned __int8)a3;
- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)invalidate;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)scanningStartedOfType:(unsigned __int8)a3;
- (void)scanningStoppedOfType:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setIsScanning:(BOOL)a3;
- (void)startAdvertisingWithData:(id)a3;
- (void)startScanning;
- (void)startScanningAndAdvertisingWithData:(id)a3;
- (void)startScanningAndAdvertisingWithOptions:(id)a3;
- (void)stateDidChange:(int64_t)a3;
- (void)stopAdvertising;
- (void)stopScanning;
- (void)stopScanningAndAdvertising;
- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4;
- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4;
@end

@implementation WPHeySiri

- (WPHeySiri)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_sync_enter(&unk_26C53E0D0);
  v13.receiver = self;
  v13.super_class = (Class)WPHeySiri;
  v8 = [(WPClient *)&v13 initWithQueue:v7 machName:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_16);
    }
    v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "HeySiri _delegate assigned", v12, 2u);
    }
    v9->_isScanning = 0;
  }
  objc_sync_exit(&unk_26C53E0D0);

  return v9;
}

- (id)clientAsString
{
  return @"WPHeySiri";
}

- (void)invalidate
{
  objc_sync_enter(&unk_26C53E0D0);
  [(WPHeySiri *)self setDelegate:0];
  objc_sync_exit(&unk_26C53E0D0);
  v3.receiver = self;
  v3.super_class = (Class)WPHeySiri;
  [(WPClient *)&v3 invalidate];
}

+ (int64_t)holdVouchers
{
  return 12;
}

- (void)startScanningAndAdvertisingWithData:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_156_1);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "HeySiri start advertise and scan", v6, 2u);
  }
  [(WPHeySiri *)self startAdvertisingWithData:v4];
  [(WPHeySiri *)self startScanning];
}

- (void)stopScanningAndAdvertising
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_158_0);
  }
  objc_super v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "HeySiri stop advertise and scan", v4, 2u);
  }
  [(WPHeySiri *)self stopAdvertising];
  [(WPHeySiri *)self stopScanning];
}

- (void)startAdvertisingWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[WPAdvertisingRequest requestForClientType:8];
  [v5 setUpdateTime:45.0];
  id v6 = [v4 objectForKeyedSubscript:@"WPHeySiriAdvertisingData"];

  [v5 setAdvertisingData:v6];
  if (+[WPClient isHomePodOrIOS]) {
    uint64_t v7 = startAdvertisingWithData__rates[arc4random_uniform(6u)];
  }
  else {
    uint64_t v7 = 48;
  }
  [v5 setAdvertisingRate:v7];
  v8 = (void *)[objc_alloc(NSNumber) initWithLongLong:clock_gettime_nsec_np(_CLOCK_MONOTONIC) / 0xF4240];
  [v5 setAdvertisementRequestedAt:v8];

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_162_1);
  }
  v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = [v5 advertisingData];
    v12 = [v5 advertisementRequestedAt];
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    __int16 v16 = 2048;
    uint64_t v17 = [v12 longLongValue];
    _os_log_impl(&dword_2144AA000, v10, OS_LOG_TYPE_DEFAULT, "HeySiri start advertising data=%@ at %llu", buf, 0x16u);
  }
  v13.receiver = self;
  v13.super_class = (Class)WPHeySiri;
  [(WPClient *)&v13 startAdvertising:v5];
}

- (void)stopAdvertising
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_166);
  }
  objc_super v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "HeySiri stop advertising", buf, 2u);
  }
  id v4 = +[WPAdvertisingRequest requestForClientType:8];
  v5.receiver = self;
  v5.super_class = (Class)WPHeySiri;
  [(WPClient *)&v5 stopAdvertising:v4];
}

- (void)updateAdvertisingRequest:(id)a3 withUpdate:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  [v6 updateTime];
  if (v8 <= 0.0)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_173_1);
    }
    __int16 v16 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPHeySiri updateAdvertisingRequest:withUpdate:](v16, v6);
    }
  }
  else
  {
    [v6 setUpdateTime:0.0];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_170);
    }
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPHeySiri updateAdvertisingRequest:withUpdate:]((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
    [(WPHeySiri *)self stopAdvertising];
  }
  v7[2](v7, 0);
}

- (void)startScanning
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_175_0);
  }
  objc_super v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "HeySiri start scanning", buf, 2u);
  }
  if ([(WPHeySiri *)self isScanning])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_178_0);
    }
    id v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "HeySiri already scanning, do not restart", buf, 2u);
    }
  }
  else
  {
    [(WPHeySiri *)self setIsScanning:1];
    objc_super v5 = objc_opt_new();
    [v5 setUpdateTime:10.0];
    int64x2_t v7 = vdupq_n_s64(0x1EuLL);
    uint64_t v8 = 30;
    [v5 setScanningRates:&v7];
    [v5 setActiveScanning:0];
    [v5 setAllowDuplicates:1];
    if (+[WPClient isHomePod]) {
      [v5 setAllowDuplicates:0];
    }
    [v5 setRssiThreshold:&unk_26C53E0E8];
    [v5 setClientType:8];
    [v5 setPriorityCritical:1];
    v6.receiver = self;
    v6.super_class = (Class)WPHeySiri;
    [(WPClient *)&v6 startScanning:v5];
  }
}

- (void)stopScanning
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_185);
  }
  objc_super v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "HeySiri stop scanning", buf, 2u);
  }
  [(WPHeySiri *)self setIsScanning:0];
  id v4 = objc_opt_new();
  [v4 setClientType:8];
  v5.receiver = self;
  v5.super_class = (Class)WPHeySiri;
  [(WPClient *)&v5 stopScanning:v4];
}

- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4
{
  id v6 = a3;
  int64x2_t v7 = (void (**)(id, void))a4;
  [v6 updateTime];
  if (v8 <= 0.0)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_192_0);
    }
    __int16 v16 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPHeySiri updateScanningRequest:withUpdate:](v16, v6, self);
    }
    [(WPHeySiri *)self setIsScanning:0];
  }
  else
  {
    [v6 setUpdateTime:0.0];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_189_0);
    }
    v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPHeySiri updateScanningRequest:withUpdate:]((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
    [(WPHeySiri *)self stopScanning];
  }
  v7[2](v7, 0);
}

- (void)stateDidChange:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WPHeySiri;
  [(WPClient *)&v7 stateDidChange:a3];
  objc_sync_enter(&unk_26C53E0D0);
  id v4 = [(WPHeySiri *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPHeySiri *)self delegate];
    [v6 heySiriDidUpdateState:self];
  }
  objc_sync_exit(&unk_26C53E0D0);
}

- (void)advertisingStartedOfType:(unsigned __int8)a3
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_198_1);
  }
  id v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "HeySiri started advertising", v8, 2u);
  }
  objc_sync_enter(&unk_26C53E0D0);
  char v5 = [(WPHeySiri *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(WPHeySiri *)self delegate];
    [v7 heySiriStartedAdvertising:self];
  }
  objc_sync_exit(&unk_26C53E0D0);
}

- (void)advertisingStartedOfTypeAt:(unsigned __int8)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = mach_absolute_time();
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_202_0);
  }
  char v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = v4;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "HeySiri started advertising at %llu", (uint8_t *)&v9, 0xCu);
  }
  objc_sync_enter(&unk_26C53E0D0);
  char v6 = [(WPHeySiri *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(WPHeySiri *)self delegate];
    [v8 heySiriStartedAdvertisingAt:self timeStamp:v4];
  }
  objc_sync_exit(&unk_26C53E0D0);
}

- (void)advertisingStoppedOfType:(unsigned __int8)a3 withError:(id)a4
{
  id v5 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_206_0);
  }
  char v6 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_2144AA000, v6, OS_LOG_TYPE_DEFAULT, "HeySiri stopped advertising", v10, 2u);
  }
  objc_sync_enter(&unk_26C53E0D0);
  char v7 = [(WPHeySiri *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(WPHeySiri *)self delegate];
    [v9 heySiriStoppedAdvertising:self];
  }
  objc_sync_exit(&unk_26C53E0D0);
}

- (void)advertisingFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  objc_sync_enter(&unk_26C53E0D0);
  id v5 = [(WPHeySiri *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(WPHeySiri *)self delegate];
    [v7 heySiri:self failedToStartAdvertisingWithError:v8];
  }
  objc_sync_exit(&unk_26C53E0D0);
}

- (void)advertisingPendingOfType:(unsigned __int8)a3
{
  objc_sync_enter(&unk_26C53E0D0);
  uint64_t v4 = [(WPHeySiri *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(WPHeySiri *)self delegate];
    [v6 heySiriAdvertisingPending:self];
  }

  objc_sync_exit(&unk_26C53E0D0);
}

- (void)deviceDiscovered:(id)a3
{
  v17[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_sync_enter(&unk_26C53E0D0);
  char v5 = [(WPHeySiri *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [v4 objectForKeyedSubscript:@"kDeviceAdvertisingData"];
    id v8 = [v4 objectForKeyedSubscript:@"kDevicePeripheralUUID"];
    int v9 = [v4 objectForKeyedSubscript:@"kDeviceAddress"];
    uint64_t v10 = [v4 objectForKeyedSubscript:@"kDeviceTime"];
    uint64_t v11 = [v4 objectForKeyedSubscript:@"kDeviceRSSI"];
    if (v7 && (unint64_t)[v7 length] >= 5)
    {
      uint64_t v12 = objc_msgSend(v7, "subdataWithRange:", 4, objc_msgSend(v7, "length") - 4);
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_216_1);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
        -[WPHeySiri deviceDiscovered:]();
      }
      v17[0] = v8;
      v16[0] = @"WPHeySiriKeyDeviceUUID";
      v16[1] = @"WPHeySiriKeyDeviceAddress";
      uint64_t v13 = v9;
      if (!v9)
      {
        uint64_t v13 = [MEMORY[0x263EFF8F8] data];
      }
      v17[1] = v13;
      v17[2] = v12;
      v16[2] = @"WPHeySiriKeyManufacturerData";
      v16[3] = @"WPHeySiriKeyDeviceTime";
      v16[4] = @"WPHeySiriKeyDeviceRSSI";
      v17[3] = v10;
      v17[4] = v11;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
      if (!v9) {

      }
      uint64_t v15 = [(WPHeySiri *)self delegate];
      [v15 heySiri:self foundDevice:v8 withInfo:v14];
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_221_0);
      }
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPHeySiri deviceDiscovered:]();
      }
    }
  }
  objc_sync_exit(&unk_26C53E0D0);
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_223_0);
  }
  id v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "HeySiri started scanning", v8, 2u);
  }
  objc_sync_enter(&unk_26C53E0D0);
  char v5 = [(WPHeySiri *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(WPHeySiri *)self delegate];
    [v7 heySiriStartedScanning:self];
  }
  objc_sync_exit(&unk_26C53E0D0);
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_227_0);
  }
  id v4 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "HeySiri stopped scanning", v8, 2u);
  }
  objc_sync_enter(&unk_26C53E0D0);
  char v5 = [(WPHeySiri *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(WPHeySiri *)self delegate];
    [v7 heySiriStoppedScanning:self];
  }
  objc_sync_exit(&unk_26C53E0D0);
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v8 = a3;
  [(WPHeySiri *)self setIsScanning:0];
  objc_sync_enter(&unk_26C53E0D0);
  char v5 = [(WPHeySiri *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(WPHeySiri *)self delegate];
    [v7 heySiri:self failedToStartScanningWithError:v8];
  }
  objc_sync_exit(&unk_26C53E0D0);
}

- (WPHeySiriProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPHeySiriProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (void).cxx_destruct
{
}

- (void)startScanningAndAdvertisingWithOptions:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_277_0);
  }
  char v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v4;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "HeySiri startScanningAndAdvertisingWithDataAndOptions %@", buf, 0xCu);
  }
  if (![(WPClient *)self isTestClient])
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_283);
    }
    int v9 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPHeySiri(Test) startScanningAndAdvertisingWithOptions:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F08320];
    v45 = @"Non-test client calling test API.";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    v19 = [v17 errorWithDomain:@"WPErrorDomain" code:29 userInfo:v18];

    [(WPHeySiri *)self scanningFailedToStart:v19 ofType:8];
    [(WPHeySiri *)self advertisingFailedToStart:v19 ofType:8];
    goto LABEL_51;
  }
  char v6 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestScan"];
  if (v6)
  {
    char v7 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestScan"];
    char v8 = [v7 BOOLValue] ^ 1;
  }
  else
  {
    char v8 = 1;
  }

  uint64_t v20 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestAdvertise"];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestAdvertise"];
    int v23 = [v22 BOOLValue];

    if (v23)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_287);
      }
      v24 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2144AA000, v24, OS_LOG_TYPE_DEFAULT, "HeySiri start advertising", buf, 2u);
      }
      v25 = +[WPAdvertisingRequest requestForClientType:8];
      [v25 setUpdateTime:45.0];
      v26 = [v4 objectForKeyedSubscript:@"WPHeySiriAdvertisingData"];
      if (v26)
      {
        v27 = [v4 objectForKeyedSubscript:@"WPHeySiriAdvertisingData"];
        [v25 setAdvertisingData:v27];
      }
      else
      {
        [v25 setAdvertisingData:0];
      }

      v28 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestAdvertisingRate"];
      if (v28)
      {
        v29 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestAdvertisingRate"];
        objc_msgSend(v25, "setAdvertisingRate:", objc_msgSend(v29, "integerValue"));
      }
      else
      {
        [v25 setAdvertisingRate:48];
      }

      v30 = [v25 advertisingData];

      if (v30)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_290);
        }
        v31 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
          -[WPHeySiri(Test) startScanningAndAdvertisingWithOptions:](v31, v25);
        }
      }
      else
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_293);
        }
        v32 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPHeySiri(Test) startScanningAndAdvertisingWithOptions:](v32);
        }
      }
      v43.receiver = self;
      v43.super_class = (Class)WPHeySiri;
      [(WPClient *)&v43 startAdvertising:v25];
    }
  }
  if ((v8 & 1) == 0)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_296);
    }
    v33 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144AA000, v33, OS_LOG_TYPE_DEFAULT, "HeySiri start scanning", buf, 2u);
    }
    [(WPHeySiri *)self setIsScanning:1];
    v34 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestScanDutyCycle"];
    if (v34)
    {
      v35 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestScanDutyCycle"];
      uint64_t v36 = [v35 integerValue];
    }
    else
    {
      uint64_t v36 = 100;
    }

    v19 = objc_opt_new();
    v42[0] = 3000 / v36;
    v42[1] = 3000 / v36;
    v42[2] = 30;
    [v19 setScanningRates:v42];
    v37 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestActiveScan"];
    if (v37)
    {
      v38 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestActiveScan"];
      objc_msgSend(v19, "setActiveScanning:", objc_msgSend(v38, "BOOLValue"));
    }
    else
    {
      [v19 setActiveScanning:0];
    }

    v39 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestScanWithDups"];
    if (v39)
    {
      v40 = [v4 objectForKeyedSubscript:@"kWPHeySiriTestScanWithDups"];
      objc_msgSend(v19, "setAllowDuplicates:", objc_msgSend(v40, "BOOLValue"));
    }
    else
    {
      [v19 setAllowDuplicates:0];
    }

    [v19 setRssiThreshold:&unk_26C53E0E8];
    [v19 setClientType:8];
    [v19 setPriorityCritical:1];
    v41.receiver = self;
    v41.super_class = (Class)WPHeySiri;
    [(WPClient *)&v41 startScanning:v19];
LABEL_51:
  }
}

- (void)updateAdvertisingRequest:(uint64_t)a3 withUpdate:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateAdvertisingRequest:(void *)a1 withUpdate:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = a1;
  [a2 updateTime];
  int v5 = 134217984;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_2144AA000, v3, OS_LOG_TYPE_ERROR, "HeySiri advertising updateTime set to %.2f", (uint8_t *)&v5, 0xCu);
}

- (void)updateScanningRequest:(uint64_t)a3 withUpdate:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateScanningRequest:(void *)a3 withUpdate:.cold.2(void *a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = a1;
  [a2 updateTime];
  int v7 = 134218240;
  uint64_t v8 = v6;
  __int16 v9 = 1024;
  int v10 = [a3 isScanning];
  _os_log_error_impl(&dword_2144AA000, v5, OS_LOG_TYPE_ERROR, "HeySiri scan updateTime set to %.2f, current scan: %d", (uint8_t *)&v7, 0x12u);
}

- (void)deviceDiscovered:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_2144AA000, v0, OS_LOG_TYPE_ERROR, "HeySiri invalid TLD=%@ from %{public}@", v1, 0x16u);
}

- (void)deviceDiscovered:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_2144AA000, v0, OS_LOG_TYPE_DEBUG, "HeySiri data=%@ from %{public}@", v1, 0x16u);
}

@end