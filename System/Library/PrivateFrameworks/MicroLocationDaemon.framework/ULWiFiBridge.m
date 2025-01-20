@interface ULWiFiBridge
+ (id)_ulRawScanResultsFromCWFScanResults:(id)a3 receivedDate:(id)a4;
+ (id)_ulSingleRawScanResultsFromCWFScanResult:(id)a3 receivedDate:(id)a4;
+ (id)_wiFiScanParametersFromStrategy:(id)a3;
+ (unint64_t)_ulBandFromCWFBand:(unsigned int)a3;
+ (unsigned)_ulBandToCWFBand:(unint64_t)a3;
- (BOOL)isScanInProgress;
- (BOOL)isWifiEnabled;
- (CWFInterface)wifiInterface;
- (OS_dispatch_queue)queue;
- (ULScanProviderMutableBool)doSendResultsToClient;
- (ULWiFiBridge)initWithDelegate:(id)a3 queue:(id)a4;
- (ULWiFiBridgeDelegate)delegate;
- (void)_onBSSIDChanged:(id)a3;
- (void)_onInterfaceInvalidation;
- (void)setDelegate:(id)a3;
- (void)setDoSendResultsToClient:(id)a3;
- (void)setIsScanInProgress:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setWifiInterface:(id)a3;
- (void)start;
- (void)startScanWithStrategy:(id)a3;
- (void)stopScan;
@end

@implementation ULWiFiBridge

- (ULWiFiBridge)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ULWiFiBridge;
  v8 = [(ULWiFiBridge *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(ULWiFiBridge *)v8 setQueue:v7];
    [(ULWiFiBridge *)v9 setDelegate:v6];
    v10 = [[ULScanProviderMutableBool alloc] initWithBool:0];
    [(ULWiFiBridge *)v9 setDoSendResultsToClient:v10];
  }
  return v9;
}

- (void)start
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [(ULWiFiBridge *)self queue];
  dispatch_assert_queue_V2(v3);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_5);
  }
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "#wifi-bridge, Creating WiFi interface", buf, 2u);
  }
  v5 = objc_opt_new();
  [(ULWiFiBridge *)self setWifiInterface:v5];

  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __21__ULWiFiBridge_start__block_invoke;
  v23[3] = &unk_2653F9200;
  objc_copyWeak(&v24, &location);
  id v6 = [(ULWiFiBridge *)self wifiInterface];
  [v6 setInvalidationHandler:v23];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __21__ULWiFiBridge_start__block_invoke_3;
  v21[3] = &unk_2653F9250;
  objc_copyWeak(&v22, &location);
  id v7 = [(ULWiFiBridge *)self wifiInterface];
  [v7 setEventHandler:v21];

  v8 = [(ULWiFiBridge *)self wifiInterface];
  [v8 activate];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_5);
  }
  v9 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(ULWiFiBridge *)self wifiInterface];
    v11 = [v10 interfaceName];
    *(_DWORD *)buf = 138412290;
    id v27 = v11;
    _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_DEFAULT, "#wifi-bridge, WiFi interface activated, name:%@", buf, 0xCu);
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_5);
  }
  objc_super v12 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSNumber;
    v14 = [(ULWiFiBridge *)self wifiInterface];
    v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "powerOn"));
    *(_DWORD *)buf = 138412290;
    id v27 = v15;
    _os_log_impl(&dword_25631F000, v12, OS_LOG_TYPE_DEFAULT, "#wifi-bridge, Is WiFi On, :%@", buf, 0xCu);
  }
  v16 = [(ULWiFiBridge *)self wifiInterface];
  id v20 = 0;
  [v16 startMonitoringEventType:3 error:&v20];
  id v17 = v20;

  if (v17)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_5);
    }
    v18 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v17;
      _os_log_impl(&dword_25631F000, v18, OS_LOG_TYPE_ERROR, "Error starting BSSID monitoring: %@", buf, 0xCu);
    }
  }
  v19 = [MEMORY[0x263EFF910] now];
  [(ULWiFiBridge *)self _onBSSIDChanged:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __21__ULWiFiBridge_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __21__ULWiFiBridge_start__block_invoke_2;
    block[3] = &unk_2653F91D8;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __21__ULWiFiBridge_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onInterfaceInvalidation];
}

void __21__ULWiFiBridge_start__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __21__ULWiFiBridge_start__block_invoke_4;
    v7[3] = &unk_2653F9228;
    id v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);
  }
}

void __21__ULWiFiBridge_start__block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) type] == 3)
  {
    v2 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) timestamp];
    objc_msgSend(v2, "_onBSSIDChanged:");
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_5);
    }
    id v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_ERROR, "#wifi-bridge, Unexpected CWFEvent: %@", buf, 0xCu);
    }
  }
}

- (void)startScanWithStrategy:(id)a3
{
  id v4 = a3;
  id v5 = [(ULWiFiBridge *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(ULWiFiBridge *)self isScanInProgress])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_5);
    }
    id v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_ERROR, "#wifi-bridge, WiFi scan already in progress, skipping scan", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    uint64_t v7 = [[ULScanProviderMutableBool alloc] initWithBool:1];
    [(ULWiFiBridge *)self setDoSendResultsToClient:v7];
    [(ULWiFiBridge *)self setIsScanInProgress:1];
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    objc_initWeak(buf, self);
    v9 = [(ULWiFiBridge *)self wifiInterface];
    v10 = +[ULWiFiBridge _wiFiScanParametersFromStrategy:v4];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __38__ULWiFiBridge_startScanWithStrategy___block_invoke;
    v13[3] = &unk_2653F92A0;
    objc_copyWeak(&v16, buf);
    id v11 = v8;
    id v14 = v11;
    objc_super v12 = v7;
    v15 = v12;
    [v9 performScanWithParameters:v10 reply:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
  }
}

void __38__ULWiFiBridge_startScanWithStrategy___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_5);
    }
    uint64_t v8 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
    {
      v9 = NSNumber;
      v10 = v8;
      id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      objc_super v12 = NSNumber;
      [a1[4] timeIntervalSinceNow];
      id v14 = [v12 numberWithDouble:-v13];
      *(_DWORD *)buf = 138412802;
      v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_INFO, "#wifi-bridge, Received Wifi scan results with length:%@ error: %@, time from request to callback:%@[sec]", buf, 0x20u);
    }
    v15 = [WeakRetained queue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __38__ULWiFiBridge_startScanWithStrategy___block_invoke_98;
    v16[3] = &unk_2653F9278;
    v16[4] = WeakRetained;
    id v17 = a1[5];
    id v18 = v5;
    id v19 = v6;
    dispatch_async(v15, v16);
  }
}

void __38__ULWiFiBridge_startScanWithStrategy___block_invoke_98(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  if (v5 && [*(id *)(a1 + 40) BOOLValue])
  {
    [*(id *)(a1 + 32) stopScan];
    if (*(void *)(a1 + 48))
    {
      objc_msgSend(v5, "onWifiScanResults:withError:", 0);
    }
    else
    {
      uint64_t v2 = *(void *)(a1 + 56);
      id v3 = [MEMORY[0x263EFF910] date];
      id v4 = +[ULWiFiBridge _ulRawScanResultsFromCWFScanResults:v2 receivedDate:v3];
      [v5 onWifiScanResults:v4 withError:0];
    }
  }
}

- (void)stopScan
{
  id v3 = [(ULWiFiBridge *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ULWiFiBridge *)self isScanInProgress])
  {
    [(ULWiFiBridge *)self setIsScanInProgress:0];
    id v4 = [(ULWiFiBridge *)self doSendResultsToClient];
    [v4 setBoolValue:0];
  }
}

- (BOOL)isWifiEnabled
{
  id v3 = [(ULWiFiBridge *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ULWiFiBridge *)self wifiInterface];
  LOBYTE(v3) = [v4 powerOn];

  return (char)v3;
}

- (void)_onInterfaceInvalidation
{
  id v3 = [(ULWiFiBridge *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ULWiFiBridge *)self wifiInterface];
  [v4 invalidate];

  [(ULWiFiBridge *)self setWifiInterface:0];
  id v5 = [(ULWiFiBridge *)self delegate];
  [v5 onInterfaceInvalidation];
}

- (void)_onBSSIDChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(ULWiFiBridge *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ULWiFiBridge *)self wifiInterface];
  id v14 = [v6 BSSID];

  uint64_t v7 = [(ULWiFiBridge *)self wifiInterface];
  uint64_t v8 = [v7 channel];

  if (v8) {
    v9 = -[ULWiFiScanChannel initWithBand:andChannelNumber:]([ULWiFiScanChannel alloc], "initWithBand:andChannelNumber:", +[ULWiFiBridge _ulBandFromCWFBand:](ULWiFiBridge, "_ulBandFromCWFBand:", [v8 band]), objc_msgSend(v8, "channel"));
  }
  else {
    v9 = 0;
  }
  v10 = [ULWiFiAssociatedState alloc];
  id v11 = [(ULWiFiBridge *)self wifiInterface];
  objc_super v12 = -[ULWiFiAssociatedState initWithChannel:BSSID:RSSI:time:](v10, "initWithChannel:BSSID:RSSI:time:", v9, v14, [v11 RSSI], v4);

  double v13 = [(ULWiFiBridge *)self delegate];
  [v13 onAssociatedStateChange:v12];
}

+ (id)_wiFiScanParametersFromStrategy:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F386F0]);
  objc_msgSend(v4, "setNumberOfScans:", objc_msgSend(v3, "numberOfScans"));
  objc_msgSend(v4, "setRestTime:", objc_msgSend(v3, "restTimeInMilliSeconds"));
  objc_msgSend(v4, "setDwellTime:", objc_msgSend(v3, "dwellTimeMilliSeconds"));
  objc_msgSend(v4, "setAcceptableCacheAge:", objc_msgSend(v3, "acceptableCacheAge"));
  objc_msgSend(v4, "setMaximumAge:", objc_msgSend(v3, "maximumAge"));
  [v4 setBSSType:2];
  uint64_t v5 = 1;
  [v4 setPHYMode:1];
  uint64_t v6 = [v3 scanType];
  if (v6)
  {
    if (v6 != 1) {
      goto LABEL_5;
    }
    uint64_t v5 = 2;
  }
  [v4 setScanType:v5];
LABEL_5:
  [v4 setIncludeHiddenNetworks:1];
  objc_msgSend(v4, "setScanFlags:", objc_msgSend(v3, "isLowPriority") | objc_msgSend(v3, "isLowLatency") | objc_msgSend(v3, "doAbortOngoingScan"));
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:&unk_2704F2460];
  [v4 setIncludeProperties:v7];

  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v16 = v3;
  id obj = [v3 channels];
  uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = objc_msgSend(MEMORY[0x263F386D8], "channelWithNumber:band:width:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "channelNumber"), +[ULWiFiBridge _ulBandToCWFBand:](ULWiFiBridge, "_ulBandToCWFBand:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "band")), 20);
        [v8 addObject:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
  [v4 setChannels:v14];

  return v4;
}

+ (unsigned)_ulBandToCWFBand:(unint64_t)a3
{
  if (a3 - 1 < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

+ (unint64_t)_ulBandFromCWFBand:(unsigned int)a3
{
  uint64_t v3 = a3 - 1;
  if (v3 < 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

+ (id)_ulRawScanResultsFromCWFScanResults:(id)a3 receivedDate:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = +[ULWiFiBridge _ulSingleRawScanResultsFromCWFScanResult:receivedDate:](ULWiFiBridge, "_ulSingleRawScanResultsFromCWFScanResult:receivedDate:", *(void *)(*((void *)&v16 + 1) + 8 * i), v6, (void)v16);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];

  return v14;
}

+ (id)_ulSingleRawScanResultsFromCWFScanResult:(id)a3 receivedDate:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init(ULWiFiRawScanSingleAP);
  id v6 = [v4 networkName];
  [(ULWiFiRawScanSingleAP *)v5 setSSID:v6];

  uint64_t v7 = [v4 BSSID];
  [(ULWiFiRawScanSingleAP *)v5 setBSSID:v7];

  -[ULWiFiRawScanSingleAP setRSSI:](v5, "setRSSI:", [v4 RSSI]);
  id v8 = [v4 channel];
  -[ULWiFiRawScanSingleAP setIsRssiInvalid:](v5, "setIsRssiInvalid:", ([v8 flags] >> 12) & 1);

  uint64_t v9 = [v4 channel];
  -[ULWiFiRawScanSingleAP setIsRssiOffChannel:](v5, "setIsRssiOffChannel:", ([v9 flags] >> 15) & 1);

  uint64_t v10 = [ULWiFiScanChannel alloc];
  uint64_t v11 = [v4 channel];
  unint64_t v12 = +[ULWiFiBridge _ulBandFromCWFBand:](ULWiFiBridge, "_ulBandFromCWFBand:", [v11 band]);
  double v13 = [v4 channel];
  id v14 = -[ULWiFiScanChannel initWithBand:andChannelNumber:](v10, "initWithBand:andChannelNumber:", v12, [v13 channel]);
  [(ULWiFiRawScanSingleAP *)v5 setChannel:v14];

  -[ULWiFiRawScanSingleAP setIsPersonalHotSpot:](v5, "setIsPersonalHotSpot:", [v4 isPersonalHotspot]);
  v15 = [MEMORY[0x263EFF910] now];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = v16;

  double v18 = v17 - (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
  long long v19 = (void *)MEMORY[0x263EFF910];
  unint64_t v20 = [v4 timestamp];

  uint64_t v21 = [v19 dateWithTimeIntervalSinceReferenceDate:v18 + (double)v20 / 1000000000.0];
  [(ULWiFiRawScanSingleAP *)v5 setScanTimestamp:v21];

  __int16 v22 = [(ULWiFiRawScanSingleAP *)v5 channel];

  if (v22)
  {
    uint64_t v23 = [(ULWiFiRawScanSingleAP *)v5 channel];
    uint64_t v24 = [v23 band];

    if (v24)
    {
      __int16 v22 = [(ULWiFiRawScanSingleAP *)v5 BSSID];

      if (v22) {
        __int16 v22 = v5;
      }
    }
    else
    {
      __int16 v22 = 0;
    }
  }

  return v22;
}

- (BOOL)isScanInProgress
{
  return self->_isScanInProgress;
}

- (void)setIsScanInProgress:(BOOL)a3
{
  self->_isScanInProgress = a3;
}

- (ULWiFiBridgeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ULWiFiBridgeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
}

- (ULScanProviderMutableBool)doSendResultsToClient
{
  return self->_doSendResultsToClient;
}

- (void)setDoSendResultsToClient:(id)a3
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
  objc_storeStrong((id *)&self->_doSendResultsToClient, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end