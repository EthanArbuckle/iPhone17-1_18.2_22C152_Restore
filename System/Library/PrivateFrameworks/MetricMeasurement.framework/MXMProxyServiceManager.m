@interface MXMProxyServiceManager
+ (MXMProxyServiceManager)shared;
- (BOOL)wake;
- (MetricMeasurementHelperProtocol_Internal)_proxyObject;
- (NSXPCConnection)_serviceConnection;
- (id)_sampleWithProxyMetric:(id)a3 timeout:(double)a4 stopReason:(unint64_t *)a5;
- (id)initInternal;
- (void)_quiesceBeforeIteration:(double)a3 timeout:(double)a4 response:(id)a5;
- (void)_startPerformanceTrace:(id)a3 response:(id)a4;
- (void)_stopPerformanceTrace:(id)a3;
- (void)_terminateProcessesBeforeIteration:(id)a3 response:(id)a4;
- (void)_uncacheBeforeIteration:(id)a3 response:(id)a4;
- (void)dealloc;
@end

@implementation MXMProxyServiceManager

+ (MXMProxyServiceManager)shared
{
  id v2 = (id)_shared;
  objc_sync_enter(v2);
  if (!_shared)
  {
    id v3 = [[MXMProxyServiceManager alloc] initInternal];
    v4 = (void *)_shared;
    _shared = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_shared;
  return (MXMProxyServiceManager *)v5;
}

- (id)initInternal
{
  v7.receiver = self;
  v7.super_class = (Class)MXMProxyServiceManager;
  id v2 = [(MXMProxyServiceManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.metricmeasurement.MetricMeasurementHelper"];
    serviceConnection = v2->__serviceConnection;
    v2->__serviceConnection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D154390];
    [(NSXPCConnection *)v2->__serviceConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->__serviceConnection resume];
  }
  return v2;
}

- (MetricMeasurementHelperProtocol_Internal)_proxyObject
{
  id v2 = [(MXMProxyServiceManager *)self _serviceConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];

  return (MetricMeasurementHelperProtocol_Internal *)v3;
}

void __38__MXMProxyServiceManager__proxyObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = _MXMGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21FA7B000, v3, OS_LOG_TYPE_ERROR, "Error occured with connection: %@. Nilling the manager.", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)wake
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v2 = [(MXMProxyServiceManager *)self _proxyObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__MXMProxyServiceManager_wake__block_invoke;
  v6[3] = &unk_2645250D0;
  v6[4] = &v7;
  [v2 _wakeWithPhrase:@"Copyright © 2019 Apple" response:v6];

  uint64_t v3 = (void *)v8[5];
  int v4 = [@"Copyright © 2019 Apple" stringByAppendingString:@"ACK"];
  LOBYTE(v3) = [v3 isEqualToString:v4];

  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __30__MXMProxyServiceManager_wake__block_invoke(uint64_t a1, void *a2)
{
}

- (id)_sampleWithProxyMetric:(id)a3 timeout:(double)a4 stopReason:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = [(MXMProxyServiceManager *)self _proxyObject];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__MXMProxyServiceManager__sampleWithProxyMetric_timeout_stopReason___block_invoke;
  v12[3] = &unk_2645250F8;
  v12[4] = &v17;
  v12[5] = &v13;
  [v9 _sampleWithProxyMetric:v8 timeout:v12 response:a4];

  if (a5) {
    *a5 = v14[3];
  }
  id v10 = (id)v18[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __68__MXMProxyServiceManager__sampleWithProxyMetric_timeout_stopReason___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

- (void)_startPerformanceTrace:(id)a3 response:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, uint64_t, uint64_t, uint64_t))a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v8 = [(MXMProxyServiceManager *)self _proxyObject];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__MXMProxyServiceManager__startPerformanceTrace_response___block_invoke;
  v9[3] = &unk_264525120;
  v9[4] = &v28;
  v9[5] = &v22;
  v9[6] = &v16;
  v9[7] = &v10;
  [v8 _startPerformanceTraceHelper:v6 response:v9];

  v7[2](v7, *((unsigned __int8 *)v29 + 24), v23[5], v17[5], v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void __58__MXMProxyServiceManager__startPerformanceTrace_response___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  unint64_t v7 = a2;
  unint64_t v8 = a3;
  unint64_t v9 = a4;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = (v7 | v8 | v9) == 0;
  uint64_t v10 = *(void *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = (id)v7;

  uint64_t v12 = *(void *)(a1[6] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = (id)v8;

  uint64_t v15 = *(void *)(a1[7] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

- (void)_stopPerformanceTrace:(id)a3
{
  v49[1] = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  uint64_t v30 = 0;
  char v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [(MXMProxyServiceManager *)self _proxyObject];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__MXMProxyServiceManager__stopPerformanceTrace___block_invoke;
  v11[3] = &unk_264525148;
  v11[4] = &v30;
  v11[5] = &v24;
  v11[6] = &v18;
  v11[7] = &v12;
  v11[8] = &v42;
  v11[9] = &v36;
  [v5 _stopPerformanceTraceHelper:v11];

  uint64_t v6 = v43[5];
  if (v6 && (uint64_t v7 = v37[5]) != 0)
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F08320];
    v49[0] = @"Unable to access performance trace file.";
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
    unint64_t v8 = [v9 errorWithDomain:@"InstrumentErrorDomain" code:0 userInfo:v10];

    uint64_t v6 = v43[5];
    uint64_t v7 = v37[5];
  }
  v4[2](v4, v6, v7, v8, v31[5], v25[5], v19[5], v13[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

void __48__MXMProxyServiceManager__stopPerformanceTrace___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = *(void *)(a1[4] + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v15;
  id v35 = v15;

  uint64_t v21 = *(void *)(a1[5] + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v16;
  id v23 = v16;

  uint64_t v24 = *(void *)(a1[6] + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v17;
  id v26 = v17;

  uint64_t v27 = *(void *)(a1[7] + 8);
  uint64_t v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v18;
  id v29 = v18;

  uint64_t v30 = *(void *)(a1[8] + 8);
  char v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v13;
  id v32 = v13;

  uint64_t v33 = *(void *)(a1[9] + 8);
  v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v14;
}

- (void)_quiesceBeforeIteration:(double)a3 timeout:(double)a4 response:(id)a5
{
  unint64_t v8 = (void (**)(id, void, uint64_t))a5;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  unint64_t v9 = [(MXMProxyServiceManager *)self _proxyObject];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__MXMProxyServiceManager__quiesceBeforeIteration_timeout_response___block_invoke;
  v10[3] = &unk_264525170;
  v10[4] = &v17;
  v10[5] = &v11;
  [v9 _quiesceBeforeIterationHelper:v10 timeout:a3 response:a4];

  v8[2](v8, *((unsigned __int8 *)v18 + 24), v12[5]);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __67__MXMProxyServiceManager__quiesceBeforeIteration_timeout_response___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)_uncacheBeforeIteration:(id)a3 response:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  unint64_t v8 = [(MXMProxyServiceManager *)self _proxyObject];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__MXMProxyServiceManager__uncacheBeforeIteration_response___block_invoke;
  v9[3] = &unk_264525170;
  v9[4] = &v16;
  v9[5] = &v10;
  [v8 _uncacheBeforeIterationHelper:v6 response:v9];

  v7[2](v7, *((unsigned __int8 *)v17 + 24), v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
}

void __59__MXMProxyServiceManager__uncacheBeforeIteration_response___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)_terminateProcessesBeforeIteration:(id)a3 response:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  id v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  unint64_t v8 = [(MXMProxyServiceManager *)self _proxyObject];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__MXMProxyServiceManager__terminateProcessesBeforeIteration_response___block_invoke;
  v9[3] = &unk_264525170;
  v9[4] = &v16;
  v9[5] = &v10;
  [v8 _terminateProcessesBeforeIterationHelper:v6 response:v9];

  v7[2](v7, *((unsigned __int8 *)v17 + 24), v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
}

void __70__MXMProxyServiceManager__terminateProcessesBeforeIteration_response___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)dealloc
{
  uint64_t v3 = [(MXMProxyServiceManager *)self _serviceConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MXMProxyServiceManager;
  [(MXMProxyServiceManager *)&v4 dealloc];
}

- (NSXPCConnection)_serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end