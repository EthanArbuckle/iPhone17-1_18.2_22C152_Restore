@interface PRBTLocalizer
+ (BOOL)isInternalBuild;
- (BOOL)configure;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (NSNumber)txPower;
- (NSTimer)btTrendTimer;
- (NSTimer)measurementTimer;
- (NSTimer)utRetryTimer;
- (NSUUID)productUUID;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)estimatorQueue;
- (OS_dispatch_queue)proximityQueue;
- (PRBTCoreAnalytics)analytics;
- (PRBTLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6 productUUID:(id)a7;
- (PRBTLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6 productUUID:(id)a7 withAnalytics:(BOOL)a8;
- (PRBTLocalizerDelegate)delegate;
- (PRBTProximityMeasurement)latestProximityMeasurement;
- (PRBTRangingSession)session;
- (PRRemoteDevice)remoteDevice;
- (id).cxx_construct;
- (void)checkForMeasurementTimeout;
- (void)dealloc;
- (void)didConnectDevice:(id)a3 error:(id)a4;
- (void)didFailWithError:(id)a3;
- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5;
- (void)didReceiveNewBTRSSI:(id)a3;
- (void)didStartRangingOnDevice:(id)a3 withError:(id)a4;
- (void)didStopOwnerRangingOnDevice:(id)a3 withError:(id)a4;
- (void)logEstimatorOutput:(RSSIFilterResult *)a3;
- (void)notifyDelegateOfFilterOutput:(RSSIFilterResult *)a3;
- (void)notifyDelegateOfRawMeasurement:(id)a3;
- (void)processRssiMeasurement:(id)a3;
- (void)resetBtTrend;
- (void)sendBTLocalizerChangedState:(unint64_t)a3;
- (void)setAnalytics:(id)a3;
- (void)setBtTrendTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setEstimatorQueue:(id)a3;
- (void)setLatestProximityMeasurement:(id)a3;
- (void)setMeasurementTimer:(id)a3;
- (void)setProductUUID:(id)a3;
- (void)setProximityQueue:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setSession:(id)a3;
- (void)setTxPower:(id)a3;
- (void)setUtRetryTimer:(id)a3;
- (void)updateDelegateWithSelector:(SEL)a3 object:(id)a4;
@end

@implementation PRBTLocalizer

+ (BOOL)isInternalBuild
{
  if (+[PRBTLocalizer isInternalBuild]::onceToken != -1) {
    dispatch_once(&+[PRBTLocalizer isInternalBuild]::onceToken, &__block_literal_global_0);
  }
  return +[PRBTLocalizer isInternalBuild]::isInternalBuild;
}

uint64_t __32__PRBTLocalizer_isInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  +[PRBTLocalizer isInternalBuild]::isInternalBuild = result;
  return result;
}

- (PRBTLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6 productUUID:(id)a7
{
  return [(PRBTLocalizer *)self initWithDelegate:a3 queue:a4 id:a5 isUT:a6 productUUID:a7 withAnalytics:1];
}

- (PRBTLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6 productUUID:(id)a7 withAnalytics:(BOOL)a8
{
  v38[1] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (!v15)
  {
    v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PRBTLocalizer.mm", 109, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
LABEL_10:
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PRBTLocalizer.mm", 110, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v16) {
    goto LABEL_10;
  }
LABEL_3:
  v36.receiver = self;
  v36.super_class = (Class)PRBTLocalizer;
  v19 = [(PRBTLocalizer *)&v36 init];
  v20 = v19;
  if (v19)
  {
    [(PRBTLocalizer *)v19 setDelegate:v15];
    [(PRBTLocalizer *)v20 setDelegateQueue:v16];
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.findmy.btranging", 0);
    [(PRBTLocalizer *)v20 setProximityQueue:v21];

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.findmy.btlocalizer", 0);
    [(PRBTLocalizer *)v20 setEstimatorQueue:v22];

    v23 = (void *)[objc_alloc(MEMORY[0x263F623D0]) initWithCompanionUUID:v17];
    [(PRBTLocalizer *)v20 setRemoteDevice:v23];

    [(PRBTLocalizer *)v20 setProductUUID:v18];
    id v24 = objc_alloc(MEMORY[0x263F623B8]);
    v25 = [(PRBTLocalizer *)v20 proximityQueue];
    v26 = (void *)[v24 initWithDelegate:v20 queue:v25];
    [(PRBTLocalizer *)v20 setSession:v26];

    v20->_localizerState = 0;
    v20->_clientState = 0;
    v20->_isUT = a6;
    v20->_didFetchTxPower = 0;
    v20->_shouldLogAnalytics = a8;
    v20->_lastMeasurementTime = PRCommonGetMachContinuousTimeSeconds();
    os_log_t v27 = os_log_create("com.apple.proximity", "btlocalizer");
    logger = v20->_logger;
    v20->_logger = (OS_os_log *)v27;

    if (v20->_shouldLogAnalytics)
    {
      v29 = objc_alloc_init(PRBTCoreAnalytics);
      [(PRBTLocalizer *)v20 setAnalytics:v29];

      v30 = [v17 UUIDString];
      if ([(id)objc_opt_class() isInternalBuild])
      {
        v37 = @"deviceId";
        v38[0] = v30;
        v31 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
        v32 = [(PRBTLocalizer *)v20 analytics];
        [v32 setCustomData:v31];
      }
    }
  }

  return v20;
}

- (BOOL)configure
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = self->_logger;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PRBTLocalizer *)self remoteDevice];
    v5 = [v4 UUID];
    v6 = [v5 UUIDString];
    int v23 = 138412290;
    id v24 = v6;
    _os_log_impl(&dword_230EC1000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "BTLocalizer configuring for item %@", (uint8_t *)&v23, 0xCu);
  }
  int clientState = self->_clientState;
  if (clientState)
  {
    v8 = self->_logger;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(PRBTLocalizer *)self remoteDevice];
      v10 = [v9 UUID];
      v11 = [v10 UUIDString];
      int v23 = 138412290;
      id v24 = v11;
      _os_log_impl(&dword_230EC1000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: Unexpected call to configure", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_10;
  }
  self->_int clientState = 1;
  v12 = self->_logger;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(PRBTLocalizer *)self remoteDevice];
    v14 = [v13 UUID];
    id v15 = [v14 UUIDString];
    int v23 = 138412290;
    id v24 = v15;
    _os_log_impl(&dword_230EC1000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: Setting _clientState to LOCALIZER_CLIENT_CONFIGURING configure", (uint8_t *)&v23, 0xCu);
  }
  id v16 = [(PRBTLocalizer *)self session];
  id v17 = [(PRBTLocalizer *)self remoteDevice];
  id v18 = [v17 UUID];
  v19 = [NSNumber numberWithBool:self->_isUT];
  [v16 fetchTxPower:v18 isUT:v19];

  if (self->_shouldLogAnalytics)
  {
    v8 = [(PRBTLocalizer *)self analytics];
    BOOL isUT = self->_isUT;
    dispatch_queue_t v21 = [(PRBTLocalizer *)self productUUID];
    [(OS_os_log *)v8 configureSession:!isUT withProductUUID:v21];

LABEL_10:
  }
  return clientState == 0;
}

- (BOOL)start:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = self->_logger;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(PRBTLocalizer *)self remoteDevice];
    v6 = [v5 UUID];
    v7 = [v6 UUIDString];
    int v18 = 138412290;
    v19 = v7;
    _os_log_impl(&dword_230EC1000, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "BTLocalizer start for item %@", (uint8_t *)&v18, 0xCu);
  }
  int clientState = self->_clientState;
  if (clientState != 2)
  {
    v13 = self->_logger;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(PRBTLocalizer *)self remoteDevice];
      id v15 = [v14 UUID];
      id v16 = [v15 UUIDString];
      int v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_230EC1000, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: Unexpected call to start", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_11;
  }
  self->_int clientState = 3;
  self->_localizerState = 2;
  [(PRBTLocalizer *)self sendBTLocalizerChangedState:2];
  BOOL v9 = !self->_isUT;
  v10 = [(PRBTLocalizer *)self session];
  [(PRBTLocalizer *)self remoteDevice];
  if (v9) {
    v11 = {;
  }
    v12 = [v11 UUID];
    [v10 startOwnerRanging:v12];
  }
  else {
    v11 = {;
  }
    v12 = [v11 UUID];
    [v10 startUTRanging:v12];
  }

  if (self->_shouldLogAnalytics)
  {
    v13 = [(PRBTLocalizer *)self analytics];
    [(OS_os_log *)v13 start];
LABEL_11:
  }
  return clientState == 2;
}

- (BOOL)stop:(id *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v4 = self->_logger;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(PRBTLocalizer *)self remoteDevice];
    v6 = [v5 UUID];
    v7 = [v6 UUIDString];
    *(_DWORD *)buf = 138412290;
    v41 = v7;
    _os_log_impl(&dword_230EC1000, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "BTLocalizer stop for item %@", buf, 0xCu);
  }
  int clientState = self->_clientState;
  if (clientState == 3)
  {
    self->_int clientState = 2;
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __22__PRBTLocalizer_stop___block_invoke;
    block[3] = &unk_264BC1B80;
    objc_copyWeak(&v38, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    if (self->_isUT)
    {
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __22__PRBTLocalizer_stop___block_invoke_2;
      v35[3] = &unk_264BC1B80;
      objc_copyWeak(&v36, &location);
      BOOL v9 = (void *)MEMORY[0x263EF83A0];
      dispatch_async(MEMORY[0x263EF83A0], v35);

      v10 = self->_logger;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(PRBTLocalizer *)self remoteDevice];
        v12 = [v11 UUID];
        v13 = [v12 UUIDString];
        *(_DWORD *)buf = 138412290;
        v41 = v13;
        _os_log_impl(&dword_230EC1000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "BTlocalizer sending stop UT ranging command for item %@", buf, 0xCu);
      }
      v14 = [(PRBTLocalizer *)self session];
      id v15 = [(PRBTLocalizer *)self remoteDevice];
      id v16 = [v15 UUID];
      [v14 stopUTRanging:v16];

      self->_unint64_t localizerState = 1;
      [(PRBTLocalizer *)self sendBTLocalizerChangedState:1];
      objc_destroyWeak(&v36);
    }
    else
    {
      unint64_t localizerState = self->_localizerState;
      if (localizerState == 2)
      {
        v31 = self->_logger;
        if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [(PRBTLocalizer *)self remoteDevice];
          v33 = [v32 UUID];
          v34 = [v33 UUIDString];
          *(_DWORD *)buf = 138412290;
          v41 = v34;
          _os_log_impl(&dword_230EC1000, (os_log_t)v31, OS_LOG_TYPE_DEFAULT, "BTlocalizer has requested ranging for %@ and will send stop later", buf, 0xCu);
        }
      }
      else if (localizerState == 3)
      {
        id v24 = self->_logger;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [(PRBTLocalizer *)self remoteDevice];
          v26 = [v25 UUID];
          os_log_t v27 = [v26 UUIDString];
          *(_DWORD *)buf = 138412290;
          v41 = v27;
          _os_log_impl(&dword_230EC1000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "BTlocalizer sending stop owner ranging command for item %@", buf, 0xCu);
        }
        v28 = [(PRBTLocalizer *)self session];
        v29 = [(PRBTLocalizer *)self remoteDevice];
        v30 = [v29 UUID];
        [v28 stopOwnerRanging:v30];

        self->_unint64_t localizerState = 4;
        [(PRBTLocalizer *)self sendBTLocalizerChangedState:4];
      }
    }
    if (self->_shouldLogAnalytics)
    {
      id v17 = [(PRBTLocalizer *)self analytics];
      [v17 stop];
    }
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  else
  {
    int v18 = self->_logger;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(PRBTLocalizer *)self remoteDevice];
      uint64_t v20 = [v19 UUID];
      dispatch_queue_t v21 = [v20 UUIDString];
      *(_DWORD *)buf = 138412290;
      v41 = v21;
      _os_log_impl(&dword_230EC1000, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: Unexpected call to stop", buf, 0xCu);
    }
  }
  return clientState == 3;
}

void __22__PRBTLocalizer_stop___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v1);
    v3 = [v6 measurementTimer];
    [v3 invalidate];

    [v6 setMeasurementTimer:0];
    v4 = [v6 btTrendTimer];
    [v4 invalidate];

    [v6 setBtTrendTimer:0];
    v5 = v6;
  }
  else
  {
    v5 = 0;
  }
}

void __22__PRBTLocalizer_stop___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v1);
    v3 = [v5 utRetryTimer];
    [v3 invalidate];

    [v5 setUtRetryTimer:0];
    v4 = v5;
  }
  else
  {
    v4 = 0;
  }
}

- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self->_logger;
  BOOL v13 = os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v13)
    {
      id v19 = [v10 UUIDString];
      int v20 = 136315394;
      uint64_t v21 = [v19 UTF8String];
      __int16 v22 = 1024;
      LODWORD(v23) = [v9 intValue];
      _os_log_impl(&dword_230EC1000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "BTlocalizer didFetchTxPower from device:%s txPower:%d", (uint8_t *)&v20, 0x12u);
    }
    self->_didFetchTxPower = 1;
    objc_storeStrong((id *)&self->_txPower, a3);
    [(NSNumber *)self->_txPower intValue];
    operator new();
  }
  if (v13)
  {
    id v14 = [v10 UUIDString];
    int v20 = 136315394;
    uint64_t v21 = [v14 UTF8String];
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl(&dword_230EC1000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "BTlocalizer could not fetch TX power from device:%s #error:%@", (uint8_t *)&v20, 0x16u);
  }
  id v15 = [(PRBTLocalizer *)self session];
  id v16 = [(PRBTLocalizer *)self remoteDevice];
  id v17 = [v16 UUID];
  int v18 = [NSNumber numberWithBool:self->_isUT];
  [v15 fetchTxPower:v17 isUT:v18];
}

- (void)didStartRangingOnDevice:(id)a3 withError:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = self->_logger;
  BOOL v9 = os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = [v6 UUIDString];
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = [v10 UTF8String];
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_230EC1000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "BTlocalizer could not start ranging on device:%s #error:%@", buf, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      id v11 = [v6 UUIDString];
      *(_DWORD *)buf = 136315138;
      uint64_t v34 = [v11 UTF8String];
      _os_log_impl(&dword_230EC1000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "BTlocalizer didStartRangingOnDevice:%s", buf, 0xCu);
    }
    if (self->_clientState == 3)
    {
      if (self->_localizerState == 2) {
        [(PRBTLocalizer *)self sendBTLocalizerChangedState:3];
      }
      self->_unint64_t localizerState = 3;
      if (self->_isUT)
      {
        objc_initWeak((id *)buf, self);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __51__PRBTLocalizer_didStartRangingOnDevice_withError___block_invoke;
        block[3] = &unk_264BC1B80;
        objc_copyWeak(&v32, (id *)buf);
        dispatch_async(MEMORY[0x263EF83A0], block);
        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v12 = self->_logger;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = [(PRBTLocalizer *)self remoteDevice];
        id v14 = [v13 UUID];
        id v15 = [v14 UUIDString];
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = (uint64_t)v15;
        _os_log_impl(&dword_230EC1000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "BTlocalizer received didStartRangingOnDevice despite client not ranging for item %@", buf, 0xCu);
      }
      BOOL isUT = self->_isUT;
      id v17 = self->_logger;
      BOOL v18 = os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT);
      if (isUT)
      {
        if (v18)
        {
          id v19 = [(PRBTLocalizer *)self remoteDevice];
          int v20 = [v19 UUID];
          uint64_t v21 = [v20 UUIDString];
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = (uint64_t)v21;
          _os_log_impl(&dword_230EC1000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "BTlocalizer sending stop UT ranging command for item %@", buf, 0xCu);
        }
        __int16 v22 = [(PRBTLocalizer *)self session];
        id v23 = [(PRBTLocalizer *)self remoteDevice];
        uint64_t v24 = [v23 UUID];
        [v22 stopUTRanging:v24];
      }
      else
      {
        if (v18)
        {
          uint64_t v25 = [(PRBTLocalizer *)self remoteDevice];
          v26 = [v25 UUID];
          os_log_t v27 = [v26 UUIDString];
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = (uint64_t)v27;
          _os_log_impl(&dword_230EC1000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "BTlocalizer sending stop owner ranging command for item %@", buf, 0xCu);
        }
        v28 = [(PRBTLocalizer *)self session];
        v29 = [(PRBTLocalizer *)self remoteDevice];
        v30 = [v29 UUID];
        [v28 stopOwnerRanging:v30];
      }
    }
  }
}

void __51__PRBTLocalizer_didStartRangingOnDevice_withError___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    v4 = [v3 utRetryTimer];
    [v4 invalidate];

    [v3 setUtRetryTimer:0];
    id v5 = (void *)MEMORY[0x263EFFA20];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__PRBTLocalizer_didStartRangingOnDevice_withError___block_invoke_2;
    v8[3] = &unk_264BC1BA8;
    id v6 = v3;
    id v9 = v6;
    id v7 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:110.0];
    [v6 setUtRetryTimer:v7];
  }
}

void __51__PRBTLocalizer_didStartRangingOnDevice_withError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(id *)(*(void *)(a1 + 32) + 16);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) remoteDevice];
    id v6 = [v5 UUID];
    id v7 = [v6 UUIDString];
    int v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_230EC1000, v4, OS_LOG_TYPE_DEFAULT, "BTlocalizer resending start UT ranging for item %@", (uint8_t *)&v11, 0xCu);
  }
  v8 = [*(id *)(a1 + 32) session];
  id v9 = [*(id *)(a1 + 32) remoteDevice];
  id v10 = [v9 UUID];
  [v8 startUTRanging:v10];
}

- (void)didStopOwnerRangingOnDevice:(id)a3 withError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_isUT)
  {
    v8 = self->_logger;
    BOOL v9 = os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        id v10 = [v6 UUIDString];
        int v12 = 136315394;
        uint64_t v13 = [v10 UTF8String];
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_230EC1000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "BTlocalizer could not stop owner ranging on device:%s #error:%@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      if (v9)
      {
        id v11 = [v6 UUIDString];
        int v12 = 136315394;
        uint64_t v13 = [v11 UTF8String];
        __int16 v14 = 2112;
        id v15 = 0;
        _os_log_impl(&dword_230EC1000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "BTlocalizer stopped owner ranging on device:%s #error:%@", (uint8_t *)&v12, 0x16u);
      }
      self->_unint64_t localizerState = 1;
      [(PRBTLocalizer *)self sendBTLocalizerChangedState:1];
    }
  }
}

- (void)sendBTLocalizerChangedState:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PRBTLocalizer *)self remoteDevice];
    id v7 = [v6 UUID];
    v8 = [v7 UUIDString];
    *(_DWORD *)buf = 138412546;
    int v20 = v8;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    _os_log_impl(&dword_230EC1000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: ItemLocalizer changed state: %ld", buf, 0x16u);
  }
  BOOL v9 = [(PRBTLocalizer *)self delegateQueue];
  if (v9)
  {
    id v10 = [(PRBTLocalizer *)self delegateQueue];
  }
  else
  {
    id v10 = MEMORY[0x263EF83A0];
    id v11 = MEMORY[0x263EF83A0];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__PRBTLocalizer_sendBTLocalizerChangedState___block_invoke;
    block[3] = &unk_264BC1BD0;
    objc_copyWeak(v18, (id *)buf);
    id v17 = WeakRetained;
    v18[1] = (id)a3;
    dispatch_async(v10, block);

    objc_destroyWeak(v18);
    objc_destroyWeak((id *)buf);
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __45__PRBTLocalizer_sendBTLocalizerChangedState___block_invoke_2;
    v13[3] = &unk_264BC1BD0;
    objc_copyWeak(v15, (id *)buf);
    id v14 = WeakRetained;
    v15[1] = (id)a3;
    dispatch_async(v10, v13);

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }
}

void __45__PRBTLocalizer_sendBTLocalizerChangedState___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v2);
    [*(id *)(a1 + 32) btLocalizerChangedState:*(void *)(a1 + 48)];
    v4 = v5;
  }
  else
  {
    v4 = 0;
  }
}

void __45__PRBTLocalizer_sendBTLocalizerChangedState___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = v4;
    id v7 = [v4 remoteDevice];
    v8 = [v7 UUID];
    [v5 btLocalizerChangedState:v6 onItem:v8];
  }
}

- (void)didConnectDevice:(id)a3 error:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = self->_logger;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(PRBTLocalizer *)self remoteDevice];
    v8 = [v7 UUID];
    id v9 = [v8 UUIDString];
    int v10 = 138412546;
    id v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_230EC1000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "BTlocalizer didConnectDevice %@ error: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)updateDelegateWithSelector:(SEL)a3 object:(id)a4
{
  id v6 = a4;
  id v7 = [(PRBTLocalizer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v8 = [(PRBTLocalizer *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__PRBTLocalizer_updateDelegateWithSelector_object___block_invoke;
    block[3] = &unk_264BC1BF8;
    id v10 = v7;
    SEL v12 = a3;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __51__PRBTLocalizer_updateDelegateWithSelector_object___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (void)didReceiveNewBTRSSI:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PRBTLocalizer *)self remoteDevice];
    id v7 = [v6 UUID];
    id v8 = [v7 UUIDString];
    [v4 timestamp];
    *(_DWORD *)buf = 138413058;
    id v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 1024;
    int v21 = objc_msgSend(v4, "rssi_dbm");
    __int16 v22 = 1024;
    int v23 = [v4 channel];
    _os_log_impl(&dword_230EC1000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "BTlocalizer received new measurement from %@ with timestamp %f, RSSI %d, channel %d", buf, 0x22u);
  }
  if (self->_localizerState == 3)
  {
    [(PRBTLocalizer *)self notifyDelegateOfRawMeasurement:v4];
    objc_initWeak((id *)buf, self);
    id v10 = [(PRBTLocalizer *)self estimatorQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke;
    block[3] = &unk_264BC1C20;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v4;
    dispatch_async(v10, block);

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke_2;
    v11[3] = &unk_264BC1B80;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_async(MEMORY[0x263EF83A0], v11);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v2);
    [*(id *)(a1 + 32) timestamp];
    v6[6] = v4;
    [v6 processRssiMeasurement:*(void *)(a1 + 32)];
    id v5 = v6;
  }
  else
  {
    id v5 = 0;
  }
}

void __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    uint64_t v4 = [v3 measurementTimer];
    [v4 invalidate];

    [v3 setMeasurementTimer:0];
    id v5 = (void *)MEMORY[0x263EFFA20];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke_3;
    v8[3] = &unk_264BC1BA8;
    id v6 = v3;
    id v9 = v6;
    id v7 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:10.0];
    [v6 setMeasurementTimer:v7];
  }
}

uint64_t __37__PRBTLocalizer_didReceiveNewBTRSSI___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkForMeasurementTimeout];
}

- (void)checkForMeasurementTimeout
{
  objc_initWeak(&location, self);
  id v3 = [(PRBTLocalizer *)self estimatorQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__PRBTLocalizer_checkForMeasurementTimeout__block_invoke;
  v4[3] = &unk_264BC1B80;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__PRBTLocalizer_checkForMeasurementTimeout__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    double v4 = PRCommonGetMachContinuousTimeSeconds() - *((double *)v3 + 6);
    id v5 = *((id *)v3 + 2);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4 <= 10.0)
    {
      if (v6)
      {
        uint64_t v16 = [v3 remoteDevice];
        id v17 = [v16 UUID];
        __int16 v18 = [v17 UUIDString];
        int v19 = 138412290;
        __int16 v20 = v18;
        _os_log_impl(&dword_230EC1000, v5, OS_LOG_TYPE_DEFAULT, "BTlocalizer measurement timer for %@ fired erroneously - no need to send unknown level", (uint8_t *)&v19, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        id v7 = [v3 remoteDevice];
        id v8 = [v7 UUID];
        id v9 = [v8 UUIDString];
        int v19 = 138412546;
        __int16 v20 = v9;
        __int16 v21 = 2048;
        uint64_t v22 = 0x4024000000000000;
        _os_log_impl(&dword_230EC1000, v5, OS_LOG_TYPE_DEFAULT, "BTlocalizer has not received new measurements from %@ in %2.1f seconds - resetting proximity level", (uint8_t *)&v19, 0x16u);
      }
      id v10 = [PRBTProximityMeasurement alloc];
      double MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
      id v12 = [v3 remoteDevice];
      id v13 = [v12 UUID];
      id v14 = [(PRBTProximityMeasurement *)v10 initWithTime:0 proximityLevel:0 rssi:v13 continuousProximityLevel:0 uuid:MachContinuousTimeSeconds proximityTrend:-128.0];
      [v3 setLatestProximityMeasurement:v14];

      id v15 = [v3 latestProximityMeasurement];
      [v3 updateDelegateWithSelector:sel_didUpdateBTProximity_ object:v15];

      if (*((unsigned char *)v3 + 42)) {
        [*((id *)v3 + 19) revokeProximityLevel];
      }
    }
  }
  else
  {
    id v3 = 0;
  }
}

- (void)notifyDelegateOfRawMeasurement:(id)a3
{
  id v14 = a3;
  double v4 = [PRBTRssiMeasurement alloc];
  [v14 timestamp];
  double v6 = v5;
  uint64_t v7 = objc_msgSend(v14, "rssi_dbm");
  unsigned int v8 = [v14 channel] - 37;
  if (v8 >= 3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = v8;
  }
  id v10 = [(PRBTLocalizer *)self remoteDevice];
  id v11 = [v10 UUID];
  id v12 = [(PRBTRssiMeasurement *)v4 initWithTime:v7 rssi:v9 channel:v11 uuid:v6];

  [(PRBTLocalizer *)self updateDelegateWithSelector:sel_willIntegrateBTRSSI_ object:v12];
  if (self->_shouldLogAnalytics)
  {
    id v13 = [(PRBTLocalizer *)self analytics];
    [v13 updateWithRssiMeasurement:v12];
  }
}

- (void)processRssiMeasurement:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 channel] == 37)
  {
    int v5 = 0;
    goto LABEL_7;
  }
  if ([v4 channel] == 38)
  {
    int v5 = 1;
    goto LABEL_7;
  }
  if ([v4 channel] == 39)
  {
    int v5 = 2;
LABEL_7:
    int v17 = objc_msgSend(v4, "rssi_dbm");
    [v4 timestamp];
    uint64_t v18 = v6;
    int v19 = v5;
    BTFinding::PRRSSIFilter::addRSSImeasurement((uint64_t)self->_rssiFilter.__ptr_.__value_, (uint64_t)&v17, (uint64_t)v22);
    if (v23)
    {
      *(_OWORD *)buf = *(_OWORD *)v22;
      long long v21 = *(_OWORD *)&v22[16];
      v16[0] = *(_OWORD *)v22;
      v16[1] = *(_OWORD *)&v22[16];
      [(PRBTLocalizer *)self logEstimatorOutput:v16];
      v15[0] = *(_OWORD *)buf;
      v15[1] = v21;
      [(PRBTLocalizer *)self notifyDelegateOfFilterOutput:v15];
    }
    else
    {
      uint64_t v7 = self->_logger;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v8 = [(PRBTLocalizer *)self remoteDevice];
        uint64_t v9 = [v8 UUID];
        id v10 = [v9 UUIDString];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl(&dword_230EC1000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "BTlocalizer for %@ no output produced for estimator input", buf, 0xCu);
      }
    }
    goto LABEL_15;
  }
  id v11 = self->_logger;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = [(PRBTLocalizer *)self remoteDevice];
    id v13 = [v12 UUID];
    id v14 = [v13 UUIDString];
    *(_DWORD *)uint64_t v22 = 138412546;
    *(void *)&v22[4] = v14;
    *(_WORD *)&v22[12] = 1024;
    *(_DWORD *)&v22[14] = [v4 channel];
    _os_log_error_impl(&dword_230EC1000, (os_log_t)v11, OS_LOG_TYPE_ERROR, "BTlocalizer for %@ received a measurement with an unusable channel %d, discarding measurement", v22, 0x12u);
  }
LABEL_15:
}

- (void)logEstimatorOutput:(RSSIFilterResult *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int var2 = a3->var2;
  if (var2 == 2)
  {
    uint64_t v6 = self->_logger;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(PRBTLocalizer *)self remoteDevice];
      id v14 = [v13 UUID];
      id v15 = [v14 UUIDString];
      double var3 = a3->var3;
      double var0 = a3->var0;
      double var1 = a3->var1;
      int v25 = 138413058;
      v26 = v15;
      __int16 v27 = 2048;
      double v28 = var0;
      __int16 v29 = 2048;
      double v30 = var3;
      __int16 v31 = 2048;
      double v32 = var1;
      _os_log_impl(&dword_230EC1000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "BTlocalizer received estimator output for %@ with level: FAR, rssi: %f dB, continuous level: %3.2f, timestamp %f s", (uint8_t *)&v25, 0x2Au);
    }
  }
  else if (var2 == 1)
  {
    uint64_t v6 = self->_logger;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [(PRBTLocalizer *)self remoteDevice];
      __int16 v20 = [v19 UUID];
      long long v21 = [v20 UUIDString];
      double v22 = a3->var3;
      double v23 = a3->var0;
      double v24 = a3->var1;
      int v25 = 138413058;
      v26 = v21;
      __int16 v27 = 2048;
      double v28 = v23;
      __int16 v29 = 2048;
      double v30 = v22;
      __int16 v31 = 2048;
      double v32 = v24;
      _os_log_impl(&dword_230EC1000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "BTlocalizer received estimator output for %@ with level: CLOSE, rssi: %f dB, continuous level: %3.2f, timestamp %f s", (uint8_t *)&v25, 0x2Au);
    }
  }
  else
  {
    if (var2) {
      return;
    }
    uint64_t v6 = self->_logger;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(PRBTLocalizer *)self remoteDevice];
      unsigned int v8 = [v7 UUID];
      uint64_t v9 = [v8 UUIDString];
      double v10 = a3->var3;
      double v11 = a3->var0;
      double v12 = a3->var1;
      int v25 = 138413058;
      v26 = v9;
      __int16 v27 = 2048;
      double v28 = v11;
      __int16 v29 = 2048;
      double v30 = v10;
      __int16 v31 = 2048;
      double v32 = v12;
      _os_log_impl(&dword_230EC1000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "BTlocalizer received estimator output for %@ with level: NEARBY, rssi: %f dB, continuous level: %3.2f, timestamp %f s", (uint8_t *)&v25, 0x2Au);
    }
  }
}

- (void)notifyDelegateOfFilterOutput:(RSSIFilterResult *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t var2 = a3->var2;
  if (var2 > 2) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = qword_230EF8DA0[var2];
  }
  latestProximityMeasurement = self->_latestProximityMeasurement;
  if (!latestProximityMeasurement
    || (uint64_t v8 = [(PRBTProximityMeasurement *)latestProximityMeasurement proximityLevel]) == 0)
  {
LABEL_8:
    double v11 = self->_logger;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = [(PRBTLocalizer *)self remoteDevice];
      id v13 = [v12 UUID];
      id v14 = [v13 UUIDString];
      *(_DWORD *)buf = 138412290;
      v40 = v14;
      _os_log_impl(&dword_230EC1000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BTlocalizer current bt rssi trend for %@ : UNKNOWN", buf, 0xCu);
    }
    unint64_t v10 = 0;
LABEL_11:

    goto LABEL_12;
  }
  unint64_t v9 = v8;
  if (v6 != v8)
  {
    double v24 = self->_logger;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [(PRBTLocalizer *)self remoteDevice];
      v26 = [v25 UUID];
      __int16 v27 = [v26 UUIDString];
      *(_DWORD *)buf = 138412802;
      v40 = v27;
      __int16 v41 = 2048;
      unint64_t v42 = v9;
      __int16 v43 = 2048;
      unint64_t v44 = v6;
      _os_log_impl(&dword_230EC1000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "BTlocalizer detected a level change %@ with previous level: %lu, new level: %lu", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__PRBTLocalizer_notifyDelegateOfFilterOutput___block_invoke;
    block[3] = &unk_264BC1B80;
    objc_copyWeak(&v38, (id *)buf);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
    if (v6 <= v9)
    {
LABEL_21:
      double v11 = self->_logger;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v31 = [(PRBTLocalizer *)self remoteDevice];
        double v32 = [v31 UUID];
        uint64_t v33 = [v32 UUIDString];
        *(_DWORD *)buf = 138412290;
        v40 = v33;
        _os_log_impl(&dword_230EC1000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BTlocalizer current bt rssi trend for %@ : DECREASING", buf, 0xCu);
      }
      unint64_t v10 = 1;
    }
    else
    {
LABEL_18:
      double v11 = self->_logger;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        double v28 = [(PRBTLocalizer *)self remoteDevice];
        __int16 v29 = [v28 UUID];
        double v30 = [v29 UUIDString];
        *(_DWORD *)buf = 138412290;
        v40 = v30;
        _os_log_impl(&dword_230EC1000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BTlocalizer current bt rssi trend for %@ : INCREASING", buf, 0xCu);
      }
      unint64_t v10 = 3;
    }
    goto LABEL_11;
  }
  unint64_t v10 = [(PRBTProximityMeasurement *)self->_latestProximityMeasurement proximityTrend];
  switch(v10)
  {
    case 0uLL:
      goto LABEL_8;
    case 1uLL:
      goto LABEL_21;
    case 2uLL:
      double v11 = self->_logger;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [(PRBTLocalizer *)self remoteDevice];
        __int16 v35 = [v34 UUID];
        id v36 = [v35 UUIDString];
        *(_DWORD *)buf = 138412290;
        v40 = v36;
        _os_log_impl(&dword_230EC1000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "BTlocalizer current bt rssi trend for %@ : STABLE", buf, 0xCu);
      }
      unint64_t v10 = 2;
      goto LABEL_11;
    case 3uLL:
      goto LABEL_18;
    default:
      break;
  }
LABEL_12:
  id v15 = [PRBTProximityMeasurement alloc];
  double var0 = a3->var0;
  double var1 = a3->var1;
  uint64_t v18 = [NSNumber numberWithDouble:a3->var3];
  int v19 = [(PRBTLocalizer *)self remoteDevice];
  __int16 v20 = [v19 UUID];
  long long v21 = [(PRBTProximityMeasurement *)v15 initWithTime:v6 proximityLevel:v18 rssi:v20 continuousProximityLevel:v10 uuid:var1 proximityTrend:var0];
  double v22 = self->_latestProximityMeasurement;
  self->_latestProximityMeasurement = v21;

  [(PRBTLocalizer *)self updateDelegateWithSelector:sel_didUpdateBTProximity_ object:self->_latestProximityMeasurement];
  if (self->_shouldLogAnalytics)
  {
    double v23 = [(PRBTLocalizer *)self analytics];
    [v23 updateWithProximityLevel:self->_latestProximityMeasurement];
  }
}

void __46__PRBTLocalizer_notifyDelegateOfFilterOutput___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    id v4 = [v3 btTrendTimer];
    [v4 invalidate];

    [v3 setBtTrendTimer:0];
    int v5 = (void *)MEMORY[0x263EFFA20];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__PRBTLocalizer_notifyDelegateOfFilterOutput___block_invoke_2;
    v8[3] = &unk_264BC1BA8;
    id v6 = v3;
    id v9 = v6;
    uint64_t v7 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:9.5];
    [v6 setBtTrendTimer:v7];
  }
}

uint64_t __46__PRBTLocalizer_notifyDelegateOfFilterOutput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetBtTrend];
}

- (void)resetBtTrend
{
  objc_initWeak(&location, self);
  id v3 = [(PRBTLocalizer *)self estimatorQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__PRBTLocalizer_resetBtTrend__block_invoke;
  v4[3] = &unk_264BC1B80;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__PRBTLocalizer_resetBtTrend__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = (id *)objc_loadWeakRetained(v1);
    id v4 = v3[2];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 remoteDevice];
      id v6 = [v5 UUID];
      uint64_t v7 = [v6 UUIDString];
      int v21 = 134218242;
      uint64_t v22 = 0x4023000000000000;
      __int16 v23 = 2112;
      double v24 = v7;
      _os_log_impl(&dword_230EC1000, v4, OS_LOG_TYPE_DEFAULT, "BTLocalizer has not seen a bt level change in %2.1f seconds seconds - resetting trend to stable for %@", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v8 = [v3 latestProximityMeasurement];
    [v8 timestamp];
    double v10 = v9;
    double v11 = [v3 latestProximityMeasurement];
    uint64_t v12 = [v11 proximityLevel];
    id v13 = [v3 latestProximityMeasurement];
    [v13 rssi];
    double v15 = v14;
    uint64_t v16 = [v3 latestProximityMeasurement];
    int v17 = [v16 continuousProximityLevel];
    uint64_t v18 = [v3 latestProximityMeasurement];
    int v19 = [v18 uuid];
    __int16 v20 = +[PRBTProximityMeasurement btProximityWithTime:v12 proximityLevel:v17 rssi:v19 continuousProximityLevel:2 uuid:v10 proximityTrend:v15];
    [v3 setLatestProximityMeasurement:v20];
  }
}

- (void)didFailWithError:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_logger;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PRBTLocalizer *)self remoteDevice];
    uint64_t v7 = [v6 UUID];
    uint64_t v8 = [v7 UUIDString];
    *(_DWORD *)buf = 138412546;
    __int16 v35 = v8;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v4;
    _os_log_impl(&dword_230EC1000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "BTlocalizer for %@ didFailWithError: %@", buf, 0x16u);
  }
  if (self->_shouldLogAnalytics)
  {
    double v9 = [(PRBTLocalizer *)self analytics];
    [v9 rangingFailedWithError:v4];
  }
  if ([v4 code] == 303 || objc_msgSend(v4, "code") == 304)
  {
    [(PRBTLocalizer *)self updateDelegateWithSelector:sel_didFailWithError_ object:v4];
    objc_initWeak((id *)buf, self);
    double v10 = [(PRBTLocalizer *)self estimatorQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__PRBTLocalizer_didFailWithError___block_invoke_40;
    block[3] = &unk_264BC1B80;
    objc_copyWeak(&v29, (id *)buf);
    dispatch_async(v10, block);

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __34__PRBTLocalizer_didFailWithError___block_invoke_2_41;
    v26[3] = &unk_264BC1B80;
    objc_copyWeak(&v27, (id *)buf);
    dispatch_async(MEMORY[0x263EF83A0], v26);
    double v11 = [(PRBTLocalizer *)self delegateQueue];
    if (v11)
    {
      uint64_t v12 = [(PRBTLocalizer *)self delegateQueue];
    }
    else
    {
      uint64_t v12 = MEMORY[0x263EF83A0];
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __34__PRBTLocalizer_didFailWithError___block_invoke_3;
      v22[3] = &unk_264BC1C48;
      objc_copyWeak(&v25, (id *)buf);
      id v23 = WeakRetained;
      id v24 = v4;
      dispatch_async(v12, v22);

      objc_destroyWeak(&v25);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    double v14 = self->_logger;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = [(PRBTLocalizer *)self remoteDevice];
      uint64_t v16 = [v15 UUID];
      int v17 = [v16 UUIDString];
      uint64_t v18 = [v4 code];
      *(_DWORD *)buf = 138412546;
      __int16 v35 = v17;
      __int16 v36 = 2048;
      uint64_t v37 = v18;
      _os_log_impl(&dword_230EC1000, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: BTLocalizer received error code %lld", buf, 0x16u);
    }
    if (self->_isUT)
    {
      objc_initWeak((id *)buf, self);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __34__PRBTLocalizer_didFailWithError___block_invoke;
      v32[3] = &unk_264BC1B80;
      objc_copyWeak(&v33, (id *)buf);
      dispatch_async(MEMORY[0x263EF83A0], v32);
      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    int v19 = [(PRBTLocalizer *)self session];
    [v19 invalidate];

    [(PRBTLocalizer *)self setSession:0];
    objc_initWeak((id *)buf, self);
    dispatch_time_t v20 = dispatch_time(0, 100000000);
    int v21 = [(PRBTLocalizer *)self proximityQueue];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __34__PRBTLocalizer_didFailWithError___block_invoke_2;
    v30[3] = &unk_264BC1C20;
    objc_copyWeak(&v31, (id *)buf);
    v30[4] = self;
    dispatch_after(v20, v21, v30);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
}

void __34__PRBTLocalizer_didFailWithError___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v3 = [v5 utRetryTimer];
    [v3 invalidate];

    [v5 setUtRetryTimer:0];
    id v4 = v5;
  }
  else
  {
    id v4 = 0;
  }
}

void __34__PRBTLocalizer_didFailWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = (id *)objc_loadWeakRetained(v2);
    id v5 = v4[2];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 remoteDevice];
      uint64_t v7 = [v6 UUID];
      uint64_t v8 = [v7 UUIDString];
      int v38 = 138412290;
      v39 = v8;
      _os_log_impl(&dword_230EC1000, v5, OS_LOG_TYPE_DEFAULT, "#btranging-retry %@: PRBTRangingSession initWithDelegate", (uint8_t *)&v38, 0xCu);
    }
    id v9 = objc_alloc(MEMORY[0x263F623B8]);
    double v10 = *(void **)(a1 + 32);
    double v11 = [v10 proximityQueue];
    uint64_t v12 = (void *)[v9 initWithDelegate:v10 queue:v11];
    [v4 setSession:v12];

    id v13 = (char *)v4[4];
    if ((unint64_t)(v13 - 2) < 2)
    {
      int v21 = *((unsigned __int8 *)v4 + 41);
      if (*((_DWORD *)v4 + 6) == 3)
      {
        uint64_t v22 = *(id *)(*(void *)(a1 + 32) + 16);
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            id v24 = [v4 remoteDevice];
            id v25 = [v24 UUID];
            v26 = [v25 UUIDString];
            int v38 = 138412290;
            v39 = v26;
            _os_log_impl(&dword_230EC1000, v22, OS_LOG_TYPE_DEFAULT, "BTlocalizer reattempt start UT ranging for %@", (uint8_t *)&v38, 0xCu);
          }
          uint64_t v18 = [*(id *)(a1 + 32) session];
          int v19 = [*(id *)(a1 + 32) remoteDevice];
          dispatch_time_t v20 = [v19 UUID];
          [v18 startUTRanging:v20];
        }
        else
        {
          if (v23)
          {
            __int16 v35 = [v4 remoteDevice];
            __int16 v36 = [v35 UUID];
            uint64_t v37 = [v36 UUIDString];
            int v38 = 138412290;
            v39 = v37;
            _os_log_impl(&dword_230EC1000, v22, OS_LOG_TYPE_DEFAULT, "BTlocalizer reattempt start owner ranging for %@", (uint8_t *)&v38, 0xCu);
          }
          uint64_t v18 = [*(id *)(a1 + 32) session];
          int v19 = [*(id *)(a1 + 32) remoteDevice];
          dispatch_time_t v20 = [v19 UUID];
          [v18 startOwnerRanging:v20];
        }
        goto LABEL_27;
      }
      if (!*((unsigned char *)v4 + 41))
      {
        double v14 = *(id *)(*(void *)(a1 + 32) + 16);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          double v32 = [v4 remoteDevice];
          id v33 = [v32 UUID];
          uint64_t v34 = [v33 UUIDString];
          int v38 = 138412290;
          v39 = v34;
          _os_log_impl(&dword_230EC1000, v14, OS_LOG_TYPE_DEFAULT, "BTLocalizer stop for %@", (uint8_t *)&v38, 0xCu);
        }
LABEL_10:

        uint64_t v18 = [*(id *)(a1 + 32) session];
        int v19 = [*(id *)(a1 + 32) remoteDevice];
        dispatch_time_t v20 = [v19 UUID];
        [v18 stopOwnerRanging:v20];
LABEL_27:
      }
    }
    else
    {
      if (v13)
      {
        if (v13 != (char *)4 || *((unsigned char *)v4 + 41)) {
          goto LABEL_28;
        }
        double v14 = *(id *)(*(void *)(a1 + 32) + 16);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          double v15 = [v4 remoteDevice];
          uint64_t v16 = [v15 UUID];
          int v17 = [v16 UUIDString];
          int v38 = 138412290;
          v39 = v17;
          _os_log_impl(&dword_230EC1000, v14, OS_LOG_TYPE_DEFAULT, "BTLocalizer reattempt stop owner ranging for %@", (uint8_t *)&v38, 0xCu);
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 40))
      {
        id v27 = *(id *)(*(void *)(a1 + 32) + 16);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          double v28 = [v4 remoteDevice];
          id v29 = [v28 UUID];
          double v30 = [v29 UUIDString];
          int v38 = 138412290;
          v39 = v30;
          _os_log_impl(&dword_230EC1000, v27, OS_LOG_TYPE_DEFAULT, "BTlocalizer reattempt fetchTX power for %@", (uint8_t *)&v38, 0xCu);
        }
        uint64_t v18 = [v4 session];
        int v19 = [v4 remoteDevice];
        dispatch_time_t v20 = [v19 UUID];
        id v31 = [NSNumber numberWithBool:*((unsigned __int8 *)v4 + 41)];
        [v18 fetchTxPower:v20 isUT:v31];

        goto LABEL_27;
      }
    }
LABEL_28:
  }
}

void __34__PRBTLocalizer_didFailWithError___block_invoke_40(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained(v1);
    id v3 = [PRBTProximityMeasurement alloc];
    double MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
    id v5 = [v9 remoteDevice];
    id v6 = [v5 UUID];
    uint64_t v7 = [(PRBTProximityMeasurement *)v3 initWithTime:0 proximityLevel:0 rssi:v6 continuousProximityLevel:0 uuid:MachContinuousTimeSeconds proximityTrend:-128.0];
    [v9 setLatestProximityMeasurement:v7];

    uint64_t v8 = [v9 latestProximityMeasurement];
    [v9 updateDelegateWithSelector:sel_didUpdateBTProximity_ object:v8];
  }
}

void __34__PRBTLocalizer_didFailWithError___block_invoke_2_41(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(v1);
    id v3 = [v7 measurementTimer];
    [v3 invalidate];

    [v7 setMeasurementTimer:0];
    id v4 = [v7 btTrendTimer];
    [v4 invalidate];

    [v7 setBtTrendTimer:0];
    id v5 = [v7 utRetryTimer];
    [v5 invalidate];

    [v7 setUtRetryTimer:0];
    id v6 = v7;
  }
  else
  {
    id v6 = 0;
  }
}

void __34__PRBTLocalizer_didFailWithError___block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v9 = v4;
    id v7 = [v4 remoteDevice];
    uint64_t v8 = [v7 UUID];
    [v5 didFailWithError:v6 onItem:v8];
  }
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = self->_logger;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PRBTLocalizer *)self remoteDevice];
    id v5 = [v4 UUID];
    uint64_t v6 = [v5 UUIDString];
    *(_DWORD *)buf = 138412290;
    int v17 = v6;
    _os_log_impl(&dword_230EC1000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "%@: Destructing PRBTLocalizer and invalidating nearbyd XCP connection.", buf, 0xCu);
  }
  if (!self->_isUT && self->_localizerState == 3)
  {
    id v7 = [(PRBTLocalizer *)self session];
    uint64_t v8 = [(PRBTLocalizer *)self remoteDevice];
    id v9 = [v8 UUID];
    [v7 stopOwnerRanging:v9];
  }
  if (self->_shouldLogAnalytics)
  {
    double v10 = [(PRBTLocalizer *)self analytics];
    [v10 deinit];
  }
  double v11 = [(PRBTLocalizer *)self measurementTimer];
  [v11 invalidate];

  uint64_t v12 = [(PRBTLocalizer *)self utRetryTimer];
  [v12 invalidate];

  id v13 = [(PRBTLocalizer *)self btTrendTimer];
  [v13 invalidate];

  double v14 = [(PRBTLocalizer *)self session];
  [v14 invalidate];

  [(PRBTLocalizer *)self setSession:0];
  v15.receiver = self;
  v15.super_class = (Class)PRBTLocalizer;
  [(PRBTLocalizer *)&v15 dealloc];
}

- (PRBTLocalizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRBTLocalizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PRBTRangingSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (PRRemoteDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
}

- (OS_dispatch_queue)proximityQueue
{
  return self->_proximityQueue;
}

- (void)setProximityQueue:(id)a3
{
}

- (NSTimer)measurementTimer
{
  return self->_measurementTimer;
}

- (void)setMeasurementTimer:(id)a3
{
}

- (NSTimer)utRetryTimer
{
  return self->_utRetryTimer;
}

- (void)setUtRetryTimer:(id)a3
{
}

- (NSTimer)btTrendTimer
{
  return self->_btTrendTimer;
}

- (void)setBtTrendTimer:(id)a3
{
}

- (PRBTProximityMeasurement)latestProximityMeasurement
{
  return self->_latestProximityMeasurement;
}

- (void)setLatestProximityMeasurement:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)estimatorQueue
{
  return self->_estimatorQueue;
}

- (void)setEstimatorQueue:(id)a3
{
}

- (NSNumber)txPower
{
  return self->_txPower;
}

- (void)setTxPower:(id)a3
{
}

- (PRBTCoreAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_txPower, 0);
  objc_storeStrong((id *)&self->_estimatorQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_latestProximityMeasurement, 0);
  objc_storeStrong((id *)&self->_btTrendTimer, 0);
  objc_storeStrong((id *)&self->_utRetryTimer, 0);
  objc_storeStrong((id *)&self->_measurementTimer, 0);
  objc_storeStrong((id *)&self->_proximityQueue, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
  value = self->_rssiFilter.__ptr_.__value_;
  p_rssiFilter = &self->_rssiFilter;
  uint64_t v3 = (uint64_t)value;
  p_rssiFilter->__ptr_.__value_ = 0;
  if (value)
  {
    std::default_delete<BTFinding::PRRSSIFilter>::operator()[abi:ne180100]((uint64_t)p_rssiFilter, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end