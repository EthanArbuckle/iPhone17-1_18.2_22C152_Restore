@interface TVLAudioLatencyEstimator
- (CUMessageSession)session;
- (TVLAudioLatencyEstimator)initWithMessageSession:(id)a3;
- (TVLListenEngine)listenEngine;
- (TVLNetworkInterface)awdlInterface;
- (TVLNetworkInterface)wifiInterface;
- (TVLNetworkMonitor)networkMonitor;
- (TVLTimeSync)timeSync;
- (float)version;
- (id)completion;
- (id)internalProgressEventHandler;
- (id)networkInterfaceOfType:(unint64_t)a3 fromInterfaces:(id)a4;
- (id)progressEventHandler;
- (unint64_t)role;
- (void)_estimateAudioLatencyWithOptions:(id)a3 withResponseHandler:(id)a4;
- (void)_initWithMessageSession:(id)a3;
- (void)_invalidateWithError:(id)a3;
- (void)_postInternalProgressEvent:(unint64_t)a3 withInfo:(id)a4;
- (void)_postProgressEvent:(unint64_t)a3 withInfo:(id)a4;
- (void)_respondAndInvalidateWithError:(id)a3 responseHandler:(id)a4;
- (void)_sendMessage:(id)a3 withResponse:(id)a4;
- (void)_synchronizeClocksWithOptions:(id)a3 withResponseHandler:(id)a4;
- (void)_tearDown;
- (void)activate;
- (void)estimate;
- (void)estimateAudioLatencyWithToneIdentifier:(id)a3;
- (void)invalidate;
- (void)networkMonitorInterfacesDidUpdate:(id)a3;
- (void)setAwdlInterface:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setInternalProgressEventHandler:(id)a3;
- (void)setListenEngine:(id)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setProgressEventHandler:(id)a3;
- (void)setSession:(id)a3;
- (void)setTimeSync:(id)a3;
- (void)setVersion:(float)a3;
- (void)setWifiInterface:(id)a3;
- (void)startNetworkMonitoring;
@end

@implementation TVLAudioLatencyEstimator

- (TVLAudioLatencyEstimator)initWithMessageSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVLAudioLatencyEstimator;
  v5 = [(TVLAudioLatencyEstimator *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_version = 1.1;
    v5->_role = 1;
    [(TVLAudioLatencyEstimator *)v5 _initWithMessageSession:v4];
  }

  return v6;
}

- (void)startNetworkMonitoring
{
  v3 = objc_alloc_init(TVLNetworkMonitor);
  networkMonitor = self->_networkMonitor;
  self->_networkMonitor = v3;

  objc_initWeak(&location, self);
  v5 = self->_networkMonitor;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__TVLAudioLatencyEstimator_startNetworkMonitoring__block_invoke;
  v6[3] = &unk_26491E988;
  objc_copyWeak(&v7, &location);
  [(TVLNetworkMonitor *)v5 startMonitoringForInterfaceTypes:2 updateHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __50__TVLAudioLatencyEstimator_startNetworkMonitoring__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained networkMonitorInterfacesDidUpdate:v3];
}

- (void)networkMonitorInterfacesDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(TVLAudioLatencyEstimator *)self networkInterfaceOfType:3 fromInterfaces:v4];
  awdlInterface = self->_awdlInterface;
  self->_awdlInterface = v5;

  id v7 = [(TVLAudioLatencyEstimator *)self networkInterfaceOfType:2 fromInterfaces:v4];

  wifiInterface = self->_wifiInterface;
  self->_wifiInterface = v7;
}

- (id)networkInterfaceOfType:(unint64_t)a3 fromInterfaces:(id)a4
{
  id v5 = a4;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__TVLAudioLatencyEstimator_networkInterfaceOfType_fromInterfaces___block_invoke;
  v8[3] = &unk_26491E9B0;
  v8[4] = &v9;
  v8[5] = a3;
  [v5 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __66__TVLAudioLatencyEstimator_networkInterfaceOfType_fromInterfaces___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 interfaceType] == *(void *)(a1 + 40))
  {
    id v7 = [v9 ipv4];
    if (v7)
    {
    }
    else
    {
      objc_super v8 = [v9 ipv6];

      if (!v8) {
        goto LABEL_6;
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
LABEL_6:
}

- (void)_initWithMessageSession:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F38568]) initWithTemplate:v4];
  [(TVLAudioLatencyEstimator *)self setSession:v5];

  objc_initWeak(&location, self);
  id v6 = [(TVLAudioLatencyEstimator *)self session];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TVLAudioLatencyEstimator__initWithMessageSession___block_invoke;
  v7[3] = &unk_26491E688;
  objc_copyWeak(&v8, &location);
  [v6 registerRequestID:@"com.apple.tvlatency" options:0 handler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __52__TVLAudioLatencyEstimator__initWithMessageSession___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_3 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
    }
    id v9 = _TVLLogDefault_log_3;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v6;
      _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_DEFAULT, "Incoming Message: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __52__TVLAudioLatencyEstimator__initWithMessageSession___block_invoke_16;
    v17 = &unk_26491E660;
    id v10 = v6;
    id v18 = v10;
    id v19 = v7;
    uint64_t v11 = (void *)MEMORY[0x230F6CE70](&v14);
    v12 = objc_msgSend(v10, "objectForKey:", @"MESSAGE", v14, v15, v16, v17);
    if ([v12 isEqualToString:@"SYNC_CLOCK"])
    {
      v13 = [v10 objectForKey:@"OPTIONS"];
      [WeakRetained _synchronizeClocksWithOptions:v13 withResponseHandler:v11];
    }
    else if ([v12 isEqualToString:@"ESTIMATE_AUDIO_LATENCY"])
    {
      v13 = [v10 objectForKey:@"OPTIONS"];
      [WeakRetained _estimateAudioLatencyWithOptions:v13 withResponseHandler:v11];
    }
    else
    {
      if ([v12 isEqualToString:@"BEGIN_LIPSYNC_TEST"])
      {
LABEL_13:

        goto LABEL_14;
      }
      v13 = [MEMORY[0x263F087E8] errorWithDomain:@"TVLatencyErrorDomain" code:1207 userInfo:0];
      [WeakRetained _respondAndInvalidateWithError:v13 responseHandler:v11];
    }

    goto LABEL_13;
  }
LABEL_14:
}

void __52__TVLAudioLatencyEstimator__initWithMessageSession___block_invoke_16(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (_TVLLogDefault_onceToken_3 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  }
  id v9 = (id)_TVLLogDefault_log_3;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (a2)
    {
      uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
    }
    else
    {
      uint64_t v11 = 0;
    }
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    id v15 = v8;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_DEFAULT, "Responding To Message: %{public}@ | Response: %{public}@ | Error: %{public}@", (uint8_t *)&v12, 0x20u);
    if (a2) {
  }
    }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)activate
{
  id v2 = [(TVLAudioLatencyEstimator *)self session];
  [v2 activate];
}

- (void)estimate
{
}

- (void)estimateAudioLatencyWithToneIdentifier:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TVLAudioLatencyEstimator *)self _postProgressEvent:0 withInfo:0];
  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  v19[0] = v4;
  v18[0] = @"TONE";
  v18[1] = @"VERSION";
  *(float *)&double v6 = self->_version;
  id v7 = [NSNumber numberWithFloat:v6];
  v19[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v9 = (void *)[v5 initWithDictionary:v8];

  if (DeviceProductType_onceToken != -1) {
    dispatch_once(&DeviceProductType_onceToken, &__block_literal_global_205);
  }
  id v10 = (id)DeviceProductType_type;
  if (v10) {
    [v9 setObject:v10 forKey:@"DEVICE_TYPE"];
  }
  if (OSBuildVersion_onceToken != -1) {
    dispatch_once(&OSBuildVersion_onceToken, &__block_literal_global_210);
  }
  id v11 = (id)OSBuildVersion_build;
  if (v11) {
    [v9 setObject:v11 forKey:@"DEVICE_BUILD"];
  }
  objc_initWeak(&location, self);
  v16[0] = @"MESSAGE";
  v16[1] = @"OPTIONS";
  v17[0] = @"START";
  v17[1] = v9;
  int v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__TVLAudioLatencyEstimator_estimateAudioLatencyWithToneIdentifier___block_invoke;
  v13[3] = &unk_26491E9D8;
  objc_copyWeak(&v14, &location);
  [(TVLAudioLatencyEstimator *)self _sendMessage:v12 withResponse:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __67__TVLAudioLatencyEstimator_estimateAudioLatencyWithToneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    double v6 = [v3 objectForKey:@"VERSION"];

    if (v6)
    {
      id v8 = [v3 objectForKey:@"VERSION"];
      [v8 floatValue];
      objc_msgSend(v5, "setVersion:");
    }
    else
    {
      LODWORD(v7) = 1.0;
      [v5 setVersion:v7];
    }
    if (_TVLLogDefault_onceToken_3 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
    }
    id v9 = (void *)_TVLLogDefault_log_3;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      [v5 version];
      int v12 = 134217984;
      double v13 = v11;
      _os_log_impl(&dword_22C7FF000, v10, OS_LOG_TYPE_DEFAULT, "TVLatency will use protocol v%.1f", (uint8_t *)&v12, 0xCu);
    }
    [v5 startNetworkMonitoring];
  }
}

- (void)invalidate
{
}

- (void)_invalidateWithError:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TVLAudioLatencyEstimator *)self _tearDown];
  if (v4)
  {
    double v6 = @"TVLAudioLatencyEstimationProgressEventErrorObjectKey";
    v7[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(TVLAudioLatencyEstimator *)self _postProgressEvent:2 withInfo:v5];
  }
  else
  {
    [(TVLAudioLatencyEstimator *)self _postProgressEvent:3 withInfo:0];
  }
}

- (void)_tearDown
{
  +[TVLTimeSync invalidate];
  [(TVLAudioLatencyEstimator *)self setTimeSync:0];
  +[TVLListenEngine invalidate];
  [(TVLAudioLatencyEstimator *)self setListenEngine:0];
  [(TVLNetworkMonitor *)self->_networkMonitor stopMonitoring];
  networkMonitor = self->_networkMonitor;
  self->_networkMonitor = 0;
}

- (void)_sendMessage:(id)a3 withResponse:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_TVLLogDefault_onceToken_3 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  }
  id v8 = _TVLLogDefault_log_3;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "Outgoing Message: %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v9 = [(TVLAudioLatencyEstimator *)self session];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__TVLAudioLatencyEstimator__sendMessage_withResponse___block_invoke;
  v12[3] = &unk_26491EA00;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v9 sendRequestID:@"com.apple.tvlatency" options:0 request:v10 responseHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __54__TVLAudioLatencyEstimator__sendMessage_withResponse___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (_TVLLogDefault_onceToken_3 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
    }
    id v8 = (id)_TVLLogDefault_log_3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (a2)
      {
        id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
      }
      else
      {
        id v10 = 0;
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v9;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2114;
      v30 = v10;
      _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "Received Response To Message: %{public}@ | Response: %{public}@ | Error: %{public}@", buf, 0x20u);
      if (a2) {
    }
      }
    if (a2)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
      }
      int v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:a2 userInfo:0];
      [WeakRetained _invalidateWithError:v12];
LABEL_14:

      goto LABEL_15;
    }
    id v13 = objc_msgSend(MEMORY[0x263EFF9D0], "null", @"MESSAGE");
    v24 = v13;
    id v14 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    if ([v6 isEqualToDictionary:v14])
    {
    }
    else
    {
      id v15 = [v6 objectForKey:@"MESSAGE"];
      int v16 = [v15 isEqualToString:@"FAILURE"];

      if (v16)
      {
        uint64_t v17 = *(void *)(a1 + 40);
        if (v17) {
          (*(void (**)(uint64_t, void))(v17 + 16))(v17, 0);
        }
        int v12 = [v6 objectForKey:@"OPTIONS"];
        uint64_t v18 = [v12 objectForKey:@"ERROR_DOMAIN"];
        id v19 = [v12 objectForKey:@"ERROR_CODE"];
        uint64_t v20 = [v19 integerValue];

        id v21 = [MEMORY[0x263F087E8] errorWithDomain:v18 code:v20 userInfo:0];
        [WeakRetained _invalidateWithError:v21];

        goto LABEL_14;
      }
    }
    uint64_t v22 = *(void *)(a1 + 40);
    if (v22) {
      (*(void (**)(uint64_t, id))(v22 + 16))(v22, v6);
    }
  }
LABEL_15:
}

- (void)_synchronizeClocksWithOptions:(id)a3 withResponseHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v20 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = [(TVLNetworkInterface *)self->_wifiInterface ipv6];
  id v8 = [(TVLNetworkInterface *)self->_wifiInterface ipv4];
  if (v8) {
    [v6 setObject:v8 forKey:@"IPV4"];
  }
  if (v7) {
    [v6 setObject:v7 forKey:@"IPV6"];
  }
  uint64_t v9 = objc_msgSend(v23, "objectForKey:", @"IPV6", v20);
  uint64_t v10 = [v23 objectForKey:@"IPV4"];
  uint64_t v22 = [(TVLNetworkInterface *)self->_wifiInterface interfaceName];
  if (_TVLLogDefault_onceToken_3 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  }
  uint64_t v11 = (void *)_TVLLogDefault_log_3;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_INFO))
  {
    wifiInterface = self->_wifiInterface;
    id v13 = v11;
    id v14 = [(TVLNetworkInterface *)wifiInterface interfaceName];
    id v15 = [(TVLNetworkInterface *)self->_wifiInterface ipv4];
    int v16 = [(TVLNetworkInterface *)self->_wifiInterface ipv6];
    *(_DWORD *)buf = 138543874;
    __int16 v29 = v14;
    __int16 v30 = 2114;
    uint64_t v31 = v15;
    __int16 v32 = 2114;
    v33 = v16;
    _os_log_impl(&dword_22C7FF000, v13, OS_LOG_TYPE_INFO, "synchronizeClocksWithOptions WIFI %{public}@,%{public}@,%{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __78__TVLAudioLatencyEstimator__synchronizeClocksWithOptions_withResponseHandler___block_invoke;
  v24[3] = &unk_26491EA28;
  objc_copyWeak(&v25, (id *)buf);
  uint64_t v17 = (void *)MEMORY[0x230F6CE70](v24);
  if (v10 | v9
    && v22
    && ([(TVLAudioLatencyEstimator *)self session],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        +[TVLTimeSync timeSyncWithRemoteIPv4:IPv6:interface:session:master:completion:](TVLTimeSync, "timeSyncWithRemoteIPv4:IPv6:interface:session:master:completion:", v10, v9, v22, v18, 0, v17), v18, [v6 count]))
  {
    v26[0] = @"MESSAGE";
    v26[1] = @"OPTIONS";
    v27[0] = @"SYNC_CLOCK";
    v27[1] = v6;
    id v19 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    ((void (**)(void, void, void, void *))v21)[2](v21, 0, 0, v19);
  }
  else
  {
    id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"TVLatencyErrorDomain" code:1202 userInfo:0];
    [(TVLAudioLatencyEstimator *)self _respondAndInvalidateWithError:v19 responseHandler:v21];
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __78__TVLAudioLatencyEstimator__synchronizeClocksWithOptions_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      [WeakRetained setTimeSync:v6];
    }
    else
    {
      id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"TVLatencyErrorDomain" code:1203 userInfo:0];
      [v4 _invalidateWithError:v5];
    }
  }
}

- (void)_estimateAudioLatencyWithOptions:(id)a3 withResponseHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"TONE"];
  if (v8
    && ([v6 objectForKey:@"TIME"],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    uint64_t v10 = [v6 objectForKey:@"TONE"];
    id v28 = 0;
    uint64_t v11 = +[TVLToneProvider provideToneWithIdentifier:v10 error:&v28];
    id v12 = v28;

    if (v12)
    {
      if (_TVLLogDefault_onceToken_3 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
      }
      id v13 = _TVLLogDefault_log_3;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_ERROR)) {
        -[TVLAudioLatencyEstimator _estimateAudioLatencyWithOptions:withResponseHandler:]((uint64_t)v12, v13);
      }
      [(TVLAudioLatencyEstimator *)self _respondAndInvalidateWithError:v12 responseHandler:v7];
    }
    else
    {
      id v15 = [v6 objectForKey:@"TIME"];
      uint64_t v16 = [v15 unsignedLongLongValue];

      uint64_t v27 = 0;
      uint64_t v17 = [(TVLAudioLatencyEstimator *)self timeSync];
      uint64_t v18 = (void *)[v17 convertToHostTimeFromDomainTime:v16 grandmasterIdentity:&v27];

      if (_TVLLogDefault_onceToken_3 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
      }
      id v19 = _TVLLogDefault_log_3;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        __int16 v30 = v18;
        __int16 v31 = 2048;
        uint64_t v32 = v16;
        __int16 v33 = 2048;
        uint64_t v34 = v27;
        _os_log_impl(&dword_22C7FF000, v19, OS_LOG_TYPE_DEFAULT, "Estimate audio latency with startTime=%llu PTPtime=%llu GM=%llu", buf, 0x20u);
      }
      if (isInternalBuild_onceToken_0 != -1) {
        dispatch_once(&isInternalBuild_onceToken_0, &__block_literal_global_215);
      }
      if (isInternalBuild_internalBuild_0)
      {
        id v20 = +[TVLPersistenceManager URLForRecording];
      }
      else
      {
        id v20 = 0;
      }
      objc_initWeak((id *)buf, self);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke;
      v22[3] = &unk_26491EAC8;
      objc_copyWeak(v26, (id *)buf);
      id v25 = v7;
      v26[1] = v18;
      id v23 = v11;
      id v21 = v20;
      id v24 = v21;
      +[TVLListenEngine engineWithCompletion:v22];

      objc_destroyWeak(v26);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"TVLatencyErrorDomain" code:1207 userInfo:0];
    [(TVLAudioLatencyEstimator *)self _respondAndInvalidateWithError:v14 responseHandler:v7];
  }
}

void __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v6 = *(void *)(a1 + 48);
      id v19 = @"MESSAGE";
      id v7 = [MEMORY[0x263EFF9D0] null];
      v20[0] = v7;
      id v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v8);

      dispatch_time_t v9 = *(void *)(a1 + 64);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_2;
      block[3] = &unk_26491E7F0;
      block[4] = WeakRetained;
      dispatch_after(v9, MEMORY[0x263EF83A0], block);
      [WeakRetained setListenEngine:v3];
      uint64_t v10 = [WeakRetained listenEngine];
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      void v17[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_3;
      v17[3] = &unk_26491EA50;
      v17[4] = WeakRetained;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_4;
      v15[3] = &unk_26491EAA0;
      objc_copyWeak(&v16, v4);
      [v10 startListeningWithReferenceTone:v13 at:v11 saveToFile:v12 withCallback:v17 completion:v15];

      objc_destroyWeak(&v16);
    }
    else
    {
      id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"TVLatencyErrorDomain" code:1206 userInfo:0];
      [WeakRetained _respondAndInvalidateWithError:v14 responseHandler:*(void *)(a1 + 48)];
    }
  }
}

uint64_t __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postProgressEvent:1 withInfo:0];
}

void __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_3(uint64_t a1, double a2, float a3)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  v9[0] = @"TVLAudioLatencyEstimationInternalProgressEventEstimationLatencyKey";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v6 = (void *)v5;
  v9[1] = @"TVLAudioLatencyEstimationInternalProgressEventEstimationConfidenceKey";
  uint64_t v7 = MEMORY[0x263EFFA80];
  if (a3 > 0.0) {
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  v10[0] = v5;
  v10[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 _postInternalProgressEvent:0 withInfo:v8];
}

void __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v23[0] = @"TVLAudioLatencyEstimationInternalProgressEventEstimationLatencyKey";
    dispatch_time_t v9 = [NSNumber numberWithDouble:a4];
    v24[0] = v9;
    v23[1] = @"TVLAudioLatencyEstimationInternalProgressEventEstimationConfidenceKey";
    uint64_t v10 = [NSNumber numberWithBool:a2];
    v24[1] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [WeakRetained _postInternalProgressEvent:1 withInfo:v11];

    id v12 = objc_alloc(MEMORY[0x263EFF9A0]);
    v22[0] = MEMORY[0x263EFFA88];
    v21[0] = @"COMPLETE";
    v21[1] = @"LATENCY";
    uint64_t v13 = [NSNumber numberWithDouble:a4];
    v22[1] = v13;
    v21[2] = @"CONFIDENT";
    id v14 = [NSNumber numberWithBool:a2];
    v22[2] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    id v16 = (void *)[v12 initWithDictionary:v15];

    if (v7) {
      [v16 setObject:v7 forKey:@"STATISTICS"];
    }
    v19[0] = @"MESSAGE";
    v19[1] = @"OPTIONS";
    v20[0] = @"AUDIO_LATENCY_ESTIMATION";
    v20[1] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_5;
    v18[3] = &unk_26491EA78;
    v18[4] = WeakRetained;
    [WeakRetained _sendMessage:v17 withResponse:v18];
  }
}

void __81__TVLAudioLatencyEstimator__estimateAudioLatencyWithOptions_withResponseHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKey:@"MESSAGE"];
    int v6 = [v5 isEqualToString:@"ASK_RETRY"];

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = 4;
LABEL_12:
      [v7 _postProgressEvent:v8 withInfo:0];
      goto LABEL_13;
    }
    dispatch_time_t v9 = [v4 objectForKey:@"MESSAGE"];
    int v10 = [v9 isEqualToString:@"CONTINUE"];

    if (v10)
    {
      if (_TVLLogDefault_onceToken_3 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
      }
      uint64_t v11 = _TVLLogDefault_log_3;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_22C7FF000, v11, OS_LOG_TYPE_DEFAULT, "Continuing to next estimation...", v14, 2u);
      }
      [*(id *)(a1 + 32) estimate];
    }
    else
    {
      id v12 = [v4 objectForKey:@"MESSAGE"];
      int v13 = [v12 isEqualToString:@"FINAL"];

      if (v13)
      {
        id v7 = *(void **)(a1 + 32);
        uint64_t v8 = 3;
        goto LABEL_12;
      }
    }
  }
LABEL_13:
}

- (void)_respondAndInvalidateWithError:(id)a3 responseHandler:(id)a4
{
  void v17[2] = *MEMORY[0x263EF8340];
  v16[0] = @"MESSAGE";
  v16[1] = @"OPTIONS";
  v17[0] = @"FAILURE";
  v14[0] = @"ERROR_CODE";
  id v7 = NSNumber;
  id v8 = a4;
  id v9 = a3;
  int v10 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v9, "code"));
  v14[1] = @"ERROR_DOMAIN";
  v15[0] = v10;
  uint64_t v11 = [v9 domain];
  v15[1] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v17[1] = v12;
  int v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  (*((void (**)(id, void, void, void *))a4 + 2))(v8, 0, 0, v13);

  [(TVLAudioLatencyEstimator *)self _invalidateWithError:v9];
}

- (void)_postProgressEvent:(unint64_t)a3 withInfo:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__TVLAudioLatencyEstimator__postProgressEvent_withInfo___block_invoke;
  block[3] = &unk_26491EAF0;
  id v9 = v6;
  unint64_t v10 = a3;
  block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__TVLAudioLatencyEstimator__postProgressEvent_withInfo___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (_TVLLogDefault_onceToken_3 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  }
  id v2 = (id)_TVLLogDefault_log_3;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) progressEventHandler];
    uint64_t v4 = MEMORY[0x230F6CE70]();
    uint64_t v5 = (void *)v4;
    unint64_t v6 = *(void *)(a1 + 48) - 1;
    if (v6 > 3) {
      id v7 = "Start";
    }
    else {
      id v7 = off_26491EB10[v6];
    }
    uint64_t v8 = *(void *)(a1 + 40);
    int v16 = 138412802;
    uint64_t v17 = v4;
    __int16 v18 = 2082;
    id v19 = v7;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    _os_log_impl(&dword_22C7FF000, v2, OS_LOG_TYPE_DEFAULT, "Calling Progress Event Handler: %@ with Event: %{public}s | Info %{public}@", (uint8_t *)&v16, 0x20u);
  }
  id v9 = [*(id *)(a1 + 32) progressEventHandler];

  if (v9)
  {
    unint64_t v10 = [*(id *)(a1 + 32) progressEventHandler];
    v10[2](v10, *(void *)(a1 + 48), *(void *)(a1 + 40));

    if (*(void *)(a1 + 48) == 3)
    {
      if (_TVLLogDefault_onceToken_3 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
      }
      uint64_t v11 = (void *)_TVLLogDefault_log_3;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = *(void **)(a1 + 32);
        int v13 = v11;
        id v14 = [v12 progressEventHandler];
        id v15 = (void *)MEMORY[0x230F6CE70]();
        int v16 = 138412290;
        uint64_t v17 = (uint64_t)v15;
        _os_log_impl(&dword_22C7FF000, v13, OS_LOG_TYPE_DEFAULT, "Deleting Progress Event Handler: %@ | This should not be invoked again!", (uint8_t *)&v16, 0xCu);
      }
      [*(id *)(a1 + 32) setProgressEventHandler:0];
    }
  }
}

- (void)_postInternalProgressEvent:(unint64_t)a3 withInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (_TVLLogDefault_onceToken_3 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_3, &__block_literal_global_3);
  }
  id v7 = (void *)_TVLLogDefault_log_3;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    id v9 = [(TVLAudioLatencyEstimator *)self internalProgressEventHandler];
    unint64_t v10 = (void *)MEMORY[0x230F6CE70]();
    uint64_t v11 = "Final Estimation";
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = v10;
    if (!a3) {
      uint64_t v11 = "New Estimation";
    }
    __int16 v18 = 2082;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22C7FF000, v8, OS_LOG_TYPE_DEFAULT, "Calling Internal Progress Event Handler: %@ with Event: %{public}s | Info: %@", buf, 0x20u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__TVLAudioLatencyEstimator__postInternalProgressEvent_withInfo___block_invoke;
  block[3] = &unk_26491EAF0;
  id v14 = v6;
  unint64_t v15 = a3;
  block[4] = self;
  id v12 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__TVLAudioLatencyEstimator__postInternalProgressEvent_withInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalProgressEventHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) internalProgressEventHandler];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 48), *(void *)(a1 + 40));
  }
}

- (unint64_t)role
{
  return self->_role;
}

- (id)progressEventHandler
{
  return self->_progressEventHandler;
}

- (void)setProgressEventHandler:(id)a3
{
}

- (float)version
{
  return self->_version;
}

- (void)setVersion:(float)a3
{
  self->_version = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (TVLNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
}

- (TVLNetworkInterface)awdlInterface
{
  return self->_awdlInterface;
}

- (void)setAwdlInterface:(id)a3
{
}

- (TVLNetworkInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
}

- (CUMessageSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (TVLTimeSync)timeSync
{
  return self->_timeSync;
}

- (void)setTimeSync:(id)a3
{
}

- (TVLListenEngine)listenEngine
{
  return self->_listenEngine;
}

- (void)setListenEngine:(id)a3
{
}

- (id)internalProgressEventHandler
{
  return self->_internalProgressEventHandler;
}

- (void)setInternalProgressEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internalProgressEventHandler, 0);
  objc_storeStrong((id *)&self->_listenEngine, 0);
  objc_storeStrong((id *)&self->_timeSync, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong((id *)&self->_awdlInterface, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong(&self->_progressEventHandler, 0);
}

- (void)_estimateAudioLatencyWithOptions:(uint64_t)a1 withResponseHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C7FF000, a2, OS_LOG_TYPE_ERROR, "Failed to provide tone. Error=%{public}@", (uint8_t *)&v2, 0xCu);
}

@end