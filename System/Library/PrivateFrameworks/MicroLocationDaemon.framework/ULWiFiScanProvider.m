@interface ULWiFiScanProvider
+ (BOOL)_isGoodAp:(id)a3;
+ (id)_filterGoodAPs:(id)a3;
+ (void)_protoWiFiRssiFromRawScanSingleAp:(void *)a1@<X2>;
- (BOOL)isScanInProgress;
- (OS_dispatch_queue)queue;
- (ULTimer)internalTimer;
- (ULTimer)timer;
- (ULWiFiBridge)wiFiBridge;
- (ULWiFiScanProvider)initWithDelegate:(id)a3 andQueue:(id)a4;
- (ULWiFiScanProviderDelegate)delegate;
- (void)_createAndStartWifiBridge;
- (void)issueNextScanIterrationOrStopScan:(id)a3;
- (void)onAssociatedStateChange:(id)a3;
- (void)onInterfaceInvalidation;
- (void)onWifiScanResults:(id)a3 withError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInternalTimer:(id)a3;
- (void)setIsScanInProgress:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWiFiBridge:(id)a3;
- (void)startScanTimerWithInterval:(double)a3;
- (void)startScanWithStrategyType:(id)a3 initialDelay:(double)a4;
- (void)stopScan;
- (void)stopScanTimer;
@end

@implementation ULWiFiScanProvider

- (ULWiFiScanProvider)initWithDelegate:(id)a3 andQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ULWiFiScanProvider;
  v8 = [(ULWiFiScanProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ULWiFiScanProvider *)v8 setDelegate:v6];
    [(ULWiFiScanProvider *)v9 setQueue:v7];
    [(ULWiFiScanProvider *)v9 _createAndStartWifiBridge];
  }

  return v9;
}

- (void)startScanWithStrategyType:(id)a3 initialDelay:(double)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(ULWiFiScanProvider *)self queue];
  dispatch_assert_queue_V2(v7);

  v8 = [(ULWiFiScanProvider *)self wiFiBridge];

  if (!v8) {
    [(ULWiFiScanProvider *)self _createAndStartWifiBridge];
  }
  v9 = [(ULWiFiScanProvider *)self wiFiBridge];
  char v10 = [v9 isWifiEnabled];

  if (v10)
  {
    if ([(ULWiFiScanProvider *)self isScanInProgress])
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
      }
      objc_super v11 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "wifi-provider, Attempting wifi scan while scan in progress, returning";
LABEL_13:
        _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      }
    }
    else
    {
      [(ULWiFiScanProvider *)self setIsScanInProgress:1];
      v13 = (void *)[v6 copy];
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
      }
      v14 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [NSNumber numberWithDouble:a4];
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_25631F000, v14, OS_LOG_TYPE_DEFAULT, "wifi-provider, Starting WiFi scan timer with delay: %@", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __61__ULWiFiScanProvider_startScanWithStrategyType_initialDelay___block_invoke;
      v21 = &unk_2653F9CD0;
      objc_copyWeak(&v23, (id *)buf);
      id v16 = v13;
      id v22 = v16;
      v17 = +[ULTimerFactory timerOnPrimaryQueueWithInterval:0 repeats:&v18 block:a4 + 0.000000001];
      -[ULWiFiScanProvider setInternalTimer:](self, "setInternalTimer:", v17, v18, v19, v20, v21);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
    }
    objc_super v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "wifi-provider, Start Scan While wifi is off, returning";
      goto LABEL_13;
    }
  }
}

void __61__ULWiFiScanProvider_startScanWithStrategyType_initialDelay___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
    }
    v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "wifi-provider, Starting WiFi scan with strategy: %@", (uint8_t *)&v6, 0xCu);
    }
    v5 = [WeakRetained wiFiBridge];
    [v5 startScanWithStrategy:*(void *)(a1 + 32)];
  }
}

- (void)issueNextScanIterrationOrStopScan:(id)a3
{
  id v4 = a3;
  v5 = [(ULWiFiScanProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  [v4 decrementScanIterationsOnWiFiScanComplete];
  if ([v4 scanIterations])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
    }
    int v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "wifi-provider, issuing next scan iteration", v13, 2u);
    }
    uint64_t v7 = +[ULDefaultsSingleton shared];
    uint64_t v8 = [v7 defaultsDictionary];

    v9 = [NSString stringWithUTF8String:"ULRecordingDelayBetweenScanIterations"];
    char v10 = [v8 objectForKey:v9];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      [v10 floatValue];
    }
    else {
      [&unk_2704F0F30 floatValue];
    }
    float v12 = v11;

    [(ULWiFiScanProvider *)self startScanWithStrategyType:v4 initialDelay:v12];
  }
  else
  {
    [(ULWiFiScanProvider *)self stopScanTimer];
  }
}

- (void)stopScan
{
  v3 = [(ULWiFiScanProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
  }
  id v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "wifi-provider, Stopping wifi scan", v9, 2u);
  }
  v5 = [(ULWiFiScanProvider *)self internalTimer];
  [v5 invalidate];

  int v6 = [(ULWiFiScanProvider *)self wiFiBridge];
  [v6 stopScan];

  uint64_t v7 = [(ULWiFiScanProvider *)self timer];
  [v7 invalidate];

  uint64_t v8 = [(ULWiFiScanProvider *)self delegate];
  [v8 didStopWifiRssiScanning];

  [(ULWiFiScanProvider *)self setIsScanInProgress:0];
}

- (void)startScanTimerWithInterval:(double)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = [(ULWiFiScanProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
  }
  int v6 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [NSNumber numberWithDouble:a3];
    *(_DWORD *)buf = 138412290;
    float v12 = v7;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "wifi-provider, Starting wifi scan timer with interval: %@", buf, 0xCu);
  }
  uint64_t v8 = [(ULWiFiScanProvider *)self timer];
  [v8 invalidate];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__ULWiFiScanProvider_startScanTimerWithInterval___block_invoke;
  v10[3] = &unk_2653F97F8;
  v10[4] = self;
  v9 = +[ULTimerFactory timerOnPrimaryQueueWithInterval:0 repeats:v10 block:a3];
  [(ULWiFiScanProvider *)self setTimer:v9];
}

void __49__ULWiFiScanProvider_startScanTimerWithInterval___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 didStopWifiScanTimer];
}

- (void)stopScanTimer
{
  v3 = [(ULWiFiScanProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
  }
  id v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "wifi-provider, Stopping wifi scan timer", v7, 2u);
  }
  v5 = [(ULWiFiScanProvider *)self timer];
  [v5 invalidate];

  int v6 = [(ULWiFiScanProvider *)self delegate];
  [v6 didStopWifiScanTimer];
}

+ (void)_protoWiFiRssiFromRawScanSingleAp:(void *)a1@<X2>
{
  id v3 = a1;
  CLMicroLocationProto::WiFiRssi::WiFiRssi((uint64_t)v17);
  if (!CLMicroLocationProto::DataType_IsValid((CLMicroLocationProto *)1)) {
    __assert_rtn("set_datatype", "microlocation.pb.h", 9748, "::CLMicroLocationProto::DataType_IsValid(value)");
  }
  v23 |= 1u;
  int v19 = 1;
  uint64_t v4 = [v3 RSSI];
  v23 |= 4u;
  float v20 = (float)v4;
  v5 = [v3 scanTimestamp];
  [v5 timeIntervalSinceReferenceDate];
  v23 |= 2u;
  uint64_t v18 = v6;

  id v7 = [v3 BSSID];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
  v16.var0 = CLMacAddress::newFromCLStr((uint64_t *)__p);
  unint64_t v8 = CLMacAddress::toUint64(&v16);
  v23 |= 8u;
  unint64_t v21 = v8;
  if (v15 < 0) {
    operator delete(__p[0]);
  }

  v9 = [v3 channel];
  int v10 = [v9 channelNumber];
  v23 |= 0x10u;
  int v22 = v10;

  LODWORD(v9) = [v3 isRssiInvalid];
  int v11 = [v3 isRssiOffChannel];
  CLMicroLocationProto::WiFiRssi::WiFiRssi(a2, (const CLMicroLocationProto::WiFiRssi *)v17);
  if (v9) {
    int v12 = 4096;
  }
  else {
    int v12 = 0;
  }
  if (v11) {
    int v13 = 0x8000;
  }
  else {
    int v13 = 0;
  }
  *((_DWORD *)a2 + 12) = v13 | v12;
  CLMicroLocationProto::WiFiRssi::~WiFiRssi((CLMicroLocationProto::WiFiRssi *)v17);
}

+ (id)_filterGoodAPs:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (+[ULWiFiScanProvider _isGoodAp:](ULWiFiScanProvider, "_isGoodAp:", v9, (void)v12)) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  int v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];

  return v10;
}

+ (BOOL)_isGoodAp:(id)a3
{
  id v3 = a3;
  if (([v3 isRssiInvalid] & 1) != 0
    || ([v3 isRssiOffChannel] & 1) != 0
    || ([v3 isPersonalHotSpot] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    unint64_t v4 = (unint64_t)[v3 RSSI] >> 63;
  }

  return v4;
}

- (void)_createAndStartWifiBridge
{
  id v3 = [ULWiFiBridge alloc];
  id v5 = [(ULWiFiScanProvider *)self queue];
  unint64_t v4 = -[ULWiFiBridge initWithDelegate:queue:](v3, "initWithDelegate:queue:", self);
  [(ULWiFiScanProvider *)self setWiFiBridge:v4];

  id v6 = [(ULWiFiScanProvider *)self wiFiBridge];
  [v6 start];
}

- (ULWiFiScanProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ULWiFiScanProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ULWiFiBridge)wiFiBridge
{
  return self->_wiFiBridge;
}

- (void)setWiFiBridge:(id)a3
{
}

- (BOOL)isScanInProgress
{
  return self->_isScanInProgress;
}

- (void)setIsScanInProgress:(BOOL)a3
{
  self->_isScanInProgress = a3;
}

- (ULTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (ULTimer)internalTimer
{
  return self->_internalTimer;
}

- (void)setInternalTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_internalTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_wiFiBridge, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)onWifiScanResults:(id)a3 withError:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(ULWiFiScanProvider *)self queue];
  dispatch_assert_queue_V2(v8);

  [(ULWiFiScanProvider *)self setIsScanInProgress:0];
  uint64_t v9 = [(ULWiFiScanProvider *)self delegate];
  if (v7)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
    }
    int v10 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_ERROR, "wifi-provider, WiFi scan failed with error: %@", buf, 0xCu);
    }
    [v9 didReceiveWifiScanError];
  }
  else
  {
    int v11 = +[ULWiFiScanProvider _filterGoodAPs:v6];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
    }
    long long v12 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v30 = 2112;
      v31 = v14;
      __int16 v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_25631F000, v12, OS_LOG_TYPE_DEFAULT, "wifi-provider, On WiFi APS (Good:%@/Total:%@): %@", buf, 0x20u);
    }
    uint64_t v26 = 0;
    v27 = 0;
    unint64_t v28 = 0;
    std::vector<CLMiLoProtobufWrapper::WiFiRssi>::reserve(&v26, [v6 count]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v15);
          }
          +[ULWiFiScanProvider _protoWiFiRssiFromRawScanSingleAp:](ULWiFiScanProvider, "_protoWiFiRssiFromRawScanSingleAp:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          int v19 = v27;
          if ((unint64_t)v27 >= v28)
          {
            float v20 = (CLMicroLocationProto::WiFiRssi *)std::vector<CLMiLoProtobufWrapper::WiFiRssi>::__emplace_back_slow_path<CLMiLoProtobufWrapper::WiFiRssi>(&v26, (const CLMicroLocationProto::WiFiRssi *)buf);
          }
          else
          {
            CLMicroLocationProto::WiFiRssi::WiFiRssi(v27, (const CLMicroLocationProto::WiFiRssi *)buf);
            *((_DWORD *)v19 + 12) = v34;
            float v20 = (CLMicroLocationProto::WiFiRssi *)((char *)v19 + 56);
          }
          v27 = v20;
          CLMicroLocationProto::WiFiRssi::~WiFiRssi((CLMicroLocationProto::WiFiRssi *)buf);
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v35 count:16];
      }
      while (v16);
    }

    unint64_t v21 = [MEMORY[0x263EFF910] now];
    [v9 didUpdateWifiAPs:&v26 withDate:v21];

    *(void *)buf = &v26;
    std::vector<CLMiLoProtobufWrapper::WiFiRssi>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
}

- (void)onInterfaceInvalidation
{
  id v3 = [(ULWiFiScanProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
  }
  unint64_t v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_ERROR, "wifi-provider, WiFi bridge invalidated", v6, 2u);
  }
  id v5 = [(ULWiFiScanProvider *)self delegate];
  [v5 didUpdateWiFiAssociatedState:0];

  [(ULWiFiScanProvider *)self setWiFiBridge:0];
}

- (void)onAssociatedStateChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ULWiFiScanProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_69);
  }
  id v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "wifi-provider, associatedState: %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(ULWiFiScanProvider *)self delegate];
  [v7 didUpdateWiFiAssociatedState:v4];
}

@end