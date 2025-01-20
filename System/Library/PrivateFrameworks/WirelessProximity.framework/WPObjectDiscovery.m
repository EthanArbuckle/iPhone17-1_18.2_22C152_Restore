@interface WPObjectDiscovery
- (BOOL)isScanningEnabled;
- (BOOL)isValidScanOptions:(id)a3;
- (BOOL)isValidScanRequest:(id)a3;
- (OS_dispatch_queue)queue;
- (WPObjectDiscovery)init;
- (WPObjectDiscovery)initWithDelegate:(id)a3 queue:(id)a4;
- (WPObjectDiscoveryDelegate)delegate;
- (id)clientAsString;
- (id)scanRequestFromScanMode:(int64_t)a3 UpdateTime:(double)a4;
- (id)scanRequestFromScanOptions:(id)a3;
- (void)deviceDiscovered:(id)a3;
- (void)devicesDiscovered:(id)a3;
- (void)invalidate;
- (void)receivedTestResponse:(id)a3;
- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4;
- (void)scanningFailedWithError:(id)a3;
- (void)scanningStartedOfType:(unsigned __int8)a3;
- (void)scanningStoppedOfType:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)startScanning;
- (void)startScanningWithMode:(int64_t)a3;
- (void)startScanningWithMode:(int64_t)a3 Timeout:(double)a4;
- (void)startScanningWithOptions:(id)a3;
- (void)startTest;
- (void)stateDidChange:(int64_t)a3;
- (void)stopScanning;
- (void)stopTest;
- (void)updateBeaconingExtended:(id)a3;
- (void)updateBeaconingInterval:(id)a3;
- (void)updateBeaconingKeys:(id)a3;
- (void)updateBeaconingState:(id)a3;
- (void)updateBeaconingStatus:(id)a3;
- (void)updateNearOwnerTokens:(id)a3;
- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4;
@end

@implementation WPObjectDiscovery

- (WPObjectDiscovery)initWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_189);
    }
    v8 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPObjectDiscovery initWithDelegate:queue:](v8);
    }
    v9 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WPObjectDiscovery;
    v10 = [(WPClient *)&v16 initWithQueue:v7 machName:0];
    p_isa = (id *)&v10->super.super.isa;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_delegate, v6);
      objc_storeWeak(p_isa + 15, v7);
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_13);
      }
      v12 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        v14 = [p_isa delegate];
        *(_DWORD *)buf = 134218240;
        v18 = p_isa;
        __int16 v19 = 2048;
        v20 = v14;
        _os_log_impl(&dword_2144AA000, v13, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery initWithDelegate self: %p, delegate: %p", buf, 0x16u);
      }
    }
    self = p_isa;
    v9 = self;
  }

  return v9;
}

- (WPObjectDiscovery)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF488];
  v5 = NSStringFromSelector(a2);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer for %@", v5, v7 format];

  return 0;
}

- (id)clientAsString
{
  return @"WPObjectDiscovery";
}

- (void)invalidate
{
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_197_2);
  }
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery invalidate by client", buf, 2u);
  }
  [(WPObjectDiscovery *)self setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)WPObjectDiscovery;
  [(WPClient *)&v4 invalidate];
}

- (id)scanRequestFromScanOptions:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 objectForKeyedSubscript:@"WPObjectDiscoveryScanKeyAdvBuffer"];
  v5 = [v3 objectForKeyedSubscript:@"WPObjectDiscoveryScanKeyAllowDuplicates"];
  id v6 = [v3 objectForKeyedSubscript:@"WPObjectDiscoveryScanKeyScanWhenLocked"];
  id v7 = [v3 objectForKeyedSubscript:@"WPObjectDiscoveryScanKeyScreenOffRate"];
  v8 = [v3 objectForKeyedSubscript:@"WPObjectDiscoveryScanKeyScreenOnRate"];
  v9 = [v3 objectForKeyedSubscript:@"WPObjectDiscoveryScanKeyTimeout"];

  uint64_t v10 = [v8 integerValue];
  uint64_t v11 = [v7 integerValue];
  v12 = objc_opt_new();
  v14[0] = v10;
  v14[1] = v11;
  v14[2] = 30;
  [v12 setScanningRates:v14];
  objc_msgSend(v12, "setAdvBuffer:", objc_msgSend(v4, "integerValue") & 7);
  objc_msgSend(v12, "setScanWhenLocked:", objc_msgSend(v6, "BOOLValue"));
  [v12 setScanCache:0];
  objc_msgSend(v12, "setAllowDuplicates:", objc_msgSend(v5, "BOOLValue"));
  [v12 setRssiThreshold:&unk_26C53DFF8];
  [v12 setClientType:18];
  if (v9)
  {
    [v9 doubleValue];
    objc_msgSend(v12, "setUpdateTime:");
  }

  return v12;
}

- (id)scanRequestFromScanMode:(int64_t)a3 UpdateTime:(double)a4
{
  if (_os_feature_enabled_impl())
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_205_0);
    }
    id v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPObjectDiscovery scanRequestFromScanMode:UpdateTime:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if ((unint64_t)a3 > 9)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v14 = 30;
  }
  else
  {
    uint64_t v14 = qword_2144DEC70[a3];
    uint64_t v15 = qword_2144DECC0[a3];
    uint64_t v16 = qword_2144DED10[a3];
  }
  v17 = objc_opt_new();
  v19[0] = v15;
  v19[1] = v16;
  v19[2] = v14;
  [v17 setScanningRates:v19];
  [v17 setScanWhenLocked:a3 > 4];
  [v17 setScanCache:0];
  [v17 setAllowDuplicates:1];
  [v17 setRssiThreshold:&unk_26C53DFF8];
  [v17 setClientType:18];
  [v17 setUpdateTime:a4];
  if (a3 <= 4) {
    [v17 setAdvBuffer:5];
  }

  return v17;
}

- (void)startScanning
{
}

- (void)startScanningWithMode:(int64_t)a3
{
  if (_os_feature_enabled_impl())
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_209_0);
    }
    v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPObjectDiscovery startScanningWithMode:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  [(WPObjectDiscovery *)self startScanningWithMode:a3 Timeout:0.0];
}

- (void)scanningFailedWithError:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_211_1);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
  }
  v5 = [(WPObjectDiscovery *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08320];
    v12[0] = v4;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"WPErrorDomain" code:10 userInfo:v8];

    uint64_t v10 = [(WPObjectDiscovery *)self delegate];
    [v10 objectDiscovery:self failedToStartScanningWithError:v9];
  }
}

- (BOOL)isScanningEnabled
{
  return 1;
}

- (void)startScanningWithMode:(int64_t)a3 Timeout:(double)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_217);
    }
    uint64_t v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPObjectDiscovery startScanningWithMode:Timeout:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if ([(WPObjectDiscovery *)self isScanningEnabled])
  {
    if (a3 >= 5 && (a4 > 6.0 || a4 == 0.0))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"ObjectDiscovery scanning mode above %s (%ld) requires timeout of %0.2fs or less", "Normal", 4, 0x4018000000000000);
      [(WPObjectDiscovery *)self scanningFailedWithError:v15];
    }
    else
    {
      uint64_t v15 = [(WPObjectDiscovery *)self scanRequestFromScanMode:a3 UpdateTime:a4];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_224_1);
      }
      uint64_t v16 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v19 = v15;
        _os_log_impl(&dword_2144AA000, v16, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery start scanning: %{public}@", buf, 0xCu);
      }
      v17.receiver = self;
      v17.super_class = (Class)WPObjectDiscovery;
      [(WPClient *)&v17 startScanning:v15];
    }
  }
}

- (BOOL)isValidScanOptions:(id)a3
{
  v30[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30[0] = @"WPObjectDiscoveryScanKeyAdvBuffer";
  v30[1] = @"WPObjectDiscoveryScanKeyAllowDuplicates";
  v30[2] = @"WPObjectDiscoveryScanKeyScanWhenLocked";
  v30[3] = @"WPObjectDiscoveryScanKeyScreenOffRate";
  v30[4] = @"WPObjectDiscoveryScanKeyScreenOnRate";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:5];
  char v6 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = [v4 objectForKeyedSubscript:v12];

        if (!v13) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v9);
  }

  uint64_t v14 = [v6 count];
  if (v14)
  {
    uint64_t v15 = [NSString stringWithFormat:@"ObjectDiscovery scan mandatory options missing %@ ", v6];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_233);
    }
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
    }
    uint64_t v16 = [(WPObjectDiscovery *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08320];
      v28 = v15;
      __int16 v19 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      uint64_t v20 = [v18 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v19];

      uint64_t v21 = [(WPObjectDiscovery *)self delegate];
      [v21 objectDiscovery:self failedToStartScanningWithError:v20];
    }
  }

  return v14 == 0;
}

- (BOOL)isValidScanRequest:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 scanningRates];
    uint64_t v6 = v16;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (([v5 advBuffer] & 4) != 0)
  {
    id v7 = 0;
    BOOL v8 = 1;
    if (!v6 || v6 == 966 || v6 == 0xFFFF) {
      goto LABEL_20;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"ObjectDiscovery ADV Buffer scan with unsupported interval %ld ", v6);
  }
  else
  {
    if (v6)
    {
      id v7 = 0;
LABEL_19:
      BOOL v8 = 1;
      goto LABEL_20;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"ObjectDiscovery screen-off scan with unsupported interval %ld ", 0);
  id v7 = };
  if (!v7) {
    goto LABEL_19;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_241);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPTest startAdvertisingOfType:data:priority:mode:options:]();
  }
  uint64_t v9 = [(WPObjectDiscovery *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v17 = *MEMORY[0x263F08320];
  v18[0] = v7;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  uint64_t v13 = [v11 errorWithDomain:@"WPErrorDomain" code:8 userInfo:v12];

  uint64_t v14 = [(WPObjectDiscovery *)self delegate];
  [v14 objectDiscovery:self failedToStartScanningWithError:v13];

  BOOL v8 = 0;
LABEL_20:

  return v8;
}

- (void)startScanningWithOptions:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_243_0);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery startScanningWithOptions %@", buf, 0xCu);
  }
  if (_os_feature_enabled_impl())
  {
    if ([(WPObjectDiscovery *)self isScanningEnabled]
      && [(WPObjectDiscovery *)self isValidScanOptions:v4])
    {
      uint64_t v6 = [(WPObjectDiscovery *)self scanRequestFromScanOptions:v4];
      if ([(WPObjectDiscovery *)self isValidScanRequest:v6])
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_249);
        }
        id v7 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v10 = v6;
          _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery start scanning: %{public}@", buf, 0xCu);
        }
        v8.receiver = self;
        v8.super_class = (Class)WPObjectDiscovery;
        [(WPClient *)&v8 startScanning:v6];
      }
    }
  }
  else
  {
    [(WPObjectDiscovery *)self scanningFailedWithError:@"ObjectDiscovery startScanningWithOptions API is disabled"];
  }
}

- (void)stopScanning
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(WPObjectDiscovery *)self isScanningEnabled])
  {
    id v3 = objc_opt_new();
    [v3 setClientType:18];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_251);
    }
    id v4 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_2144AA000, v4, OS_LOG_TYPE_DEFAULT, "ObjectDiscovery stop scanning: %{public}@", buf, 0xCu);
    }
    v5.receiver = self;
    v5.super_class = (Class)WPObjectDiscovery;
    [(WPClient *)&v5 stopScanning:v3];
  }
}

- (void)updateScanningRequest:(id)a3 withUpdate:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  [v6 setUpdateTime:0.0];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_255);
  }
  uint64_t v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_2144AA000, v8, OS_LOG_TYPE_INFO, "ObjectDiscovery timed-out scanning request: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  [(WPObjectDiscovery *)self stopScanning];
  v7[2](v7, 0);
}

- (void)stateDidChange:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WPObjectDiscovery;
  [(WPClient *)&v8 stateDidChange:a3];
  id v4 = [(WPObjectDiscovery *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WPObjectDiscovery *)self delegate];
    [v6 objectDiscoveryUpdatedState:self];
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_261_1);
  }
  id v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPObjectDiscovery stateDidChange:](v7, self);
  }
}

- (void)deviceDiscovered:(id)a3
{
  id v9 = a3;
  id v4 = (void *)MEMORY[0x2166A2110]();
  char v5 = [(WPObjectDiscovery *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:v9];
    if (v7)
    {
      objc_super v8 = [(WPObjectDiscovery *)self delegate];
      [v8 objectDiscovery:self foundDevice:v7];
    }
  }
}

- (void)devicesDiscovered:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x2166A2110]();
  char v6 = [(WPObjectDiscovery *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy_;
    uint64_t v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    id v17 = (id)objc_opt_new();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __39__WPObjectDiscovery_devicesDiscovered___block_invoke;
    v11[3] = &unk_26420E988;
    v11[4] = &v12;
    [v4 enumerateObjectsUsingBlock:v11];
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_269_0);
    }
    objc_super v8 = (id)WiProxLog;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[WPObjectDiscovery devicesDiscovered:](buf, [(id)v13[5] count], v8);
    }

    id v9 = [(WPObjectDiscovery *)self delegate];
    id v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v13[5]];
    [v9 objectDiscovery:self foundDevices:v10];

    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __39__WPObjectDiscovery_devicesDiscovered___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[WPDObjectDiscoveryData objectDiscoveryReportFromAdvReport:a2];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }

  return MEMORY[0x270F9A758]();
}

- (void)scanningStartedOfType:(unsigned __int8)a3
{
  id v4 = [(WPObjectDiscovery *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_273_0);
    }
    char v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPObjectDiscovery scanningStartedOfType:](v6);
    }
    char v7 = [(WPObjectDiscovery *)self delegate];
    [v7 objectDiscoveryStartedScanning:self];
  }
}

- (void)scanningStoppedOfType:(unsigned __int8)a3
{
  id v4 = [(WPObjectDiscovery *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_277);
    }
    char v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPObjectDiscovery scanningStoppedOfType:](v6);
    }
    char v7 = [(WPObjectDiscovery *)self delegate];
    [v7 objectDiscoveryStoppedScanning:self];
  }
}

- (void)scanningFailedToStart:(id)a3 ofType:(unsigned __int8)a4
{
  id v5 = a3;
  char v6 = [(WPObjectDiscovery *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_279);
    }
    objc_super v8 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPObjectDiscovery scanningFailedToStart:ofType:](v8, v5);
    }
    id v9 = [(WPObjectDiscovery *)self delegate];
    [v9 objectDiscovery:self failedToStartScanningWithError:v5];
  }
}

- (WPObjectDiscoveryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPObjectDiscoveryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);

  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)receivedTestResponse:(id)a3
{
  id v3 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_326_1);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPObjectDiscovery(Test) receivedTestResponse:]();
  }
}

- (void)startTest
{
  v7[1] = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_328_0);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    [(WPObjectDiscovery(Test) *)self startTest];
  }
  if ([(WPClient *)self isTestClient])
  {
    char v6 = @"kWPTestRequestKeyID";
    v7[0] = &unk_26C53E010;
    id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    v5.receiver = self;
    v5.super_class = (Class)WPObjectDiscovery;
    [(WPClient *)&v5 sendTestRequest:v4];
  }
}

- (void)stopTest
{
  v7[1] = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_335_0);
  }
  id v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    [(WPObjectDiscovery(Test) *)self stopTest];
  }
  if ([(WPClient *)self isTestClient])
  {
    char v6 = @"kWPTestRequestKeyID";
    v7[0] = &unk_26C53E028;
    id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    v5.receiver = self;
    v5.super_class = (Class)WPObjectDiscovery;
    [(WPClient *)&v5 sendTestRequest:v4];
  }
}

- (void)updateBeaconingState:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_339_0);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPObjectDiscovery(Test) updateBeaconingState:]();
  }
  if ([(WPClient *)self isTestClient])
  {
    v7[0] = @"kWPTestRequestKeyID";
    v7[1] = @"kWPTestBeaconStateKey";
    v8[0] = &unk_26C53E040;
    v8[1] = v4;
    objc_super v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    [(WPClient *)&v6 sendTestRequest:v5];
  }
}

- (void)updateBeaconingKeys:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_345_1);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPObjectDiscovery(Test) updateBeaconingKeys:]();
  }
  if ([(WPClient *)self isTestClient])
  {
    v7[0] = @"kWPTestRequestKeyID";
    v7[1] = @"kWPTestBeaconKeysKey";
    v8[0] = &unk_26C53E058;
    v8[1] = v4;
    objc_super v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    [(WPClient *)&v6 sendTestRequest:v5];
  }
}

- (void)updateBeaconingStatus:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_349);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPObjectDiscovery(Test) updateBeaconingStatus:]();
  }
  if ([(WPClient *)self isTestClient])
  {
    v7[0] = @"kWPTestRequestKeyID";
    v7[1] = @"kWPTestBeaconStatusKey";
    v8[0] = &unk_26C53E070;
    v8[1] = v4;
    objc_super v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    [(WPClient *)&v6 sendTestRequest:v5];
  }
}

- (void)updateBeaconingExtended:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_353_1);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPObjectDiscovery(Test) updateBeaconingExtended:]();
  }
  if ([(WPClient *)self isTestClient])
  {
    v7[0] = @"kWPTestRequestKeyID";
    v7[1] = @"kWPTestBeaconExtendedKey";
    v8[0] = &unk_26C53E088;
    v8[1] = v4;
    objc_super v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    [(WPClient *)&v6 sendTestRequest:v5];
  }
}

- (void)updateNearOwnerTokens:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_357);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPObjectDiscovery(Test) updateNearOwnerTokens:]();
  }
  if ([(WPClient *)self isTestClient])
  {
    v7[0] = @"kWPTestRequestKeyID";
    v7[1] = @"kWPTestNearOwnerTokensKey";
    v8[0] = &unk_26C53E0A0;
    v8[1] = v4;
    objc_super v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    [(WPClient *)&v6 sendTestRequest:v5];
  }
}

- (void)updateBeaconingInterval:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_361);
  }
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPObjectDiscovery(Test) updateBeaconingInterval:]();
  }
  if ([(WPClient *)self isTestClient])
  {
    v7[0] = @"kWPTestRequestKeyID";
    v7[1] = @"kWPTestBeaconIntervalKey";
    v8[0] = &unk_26C53E0B8;
    v8[1] = v4;
    objc_super v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
    v6.receiver = self;
    v6.super_class = (Class)WPObjectDiscovery;
    [(WPClient *)&v6 sendTestRequest:v5];
  }
}

- (void)initWithDelegate:(os_log_t)log queue:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "ObjectDiscovery is disabled via wiprox", v1, 2u);
}

- (void)scanRequestFromScanMode:(uint64_t)a3 UpdateTime:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startScanningWithMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startScanningWithMode:(uint64_t)a3 Timeout:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stateDidChange:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = a1;
  [a2 state];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_2144AA000, v3, OS_LOG_TYPE_DEBUG, "ObjectDiscovery state set to %{public}ld", v4, 0xCu);
}

- (void)devicesDiscovered:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_2144AA000, log, OS_LOG_TYPE_DEBUG, "ObjectDiscovery ADV Buffer read event with %lu peers", buf, 0xCu);
}

- (void)scanningStartedOfType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2144AA000, log, OS_LOG_TYPE_DEBUG, "ObjectDiscovery scanning started.", v1, 2u);
}

- (void)scanningStoppedOfType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2144AA000, log, OS_LOG_TYPE_DEBUG, "ObjectDiscovery scanning stopped.", v1, 2u);
}

- (void)scanningFailedToStart:(void *)a1 ofType:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2144AA000, v3, OS_LOG_TYPE_ERROR, "ObjectDiscovery scanning failed to start with error: %@", v5, 0xCu);
}

@end