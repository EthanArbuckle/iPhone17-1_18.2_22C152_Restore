@interface NetworkQualityAssessment
- (NetworkQualityAssessment)initWithConfiguration:(id)a3;
- (NetworkQualityAssessment)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (void)cancel;
- (void)finalizeResults:(id)a3 withError:(id)a4 withCompletionHandler:(id)a5;
- (void)progress:(id)a3;
- (void)runWithCompletionHandler:(id)a3;
@end

@implementation NetworkQualityAssessment

- (NetworkQualityAssessment)initWithConfiguration:(id)a3
{
  return [(NetworkQualityAssessment *)self initWithConfiguration:a3 delegate:0 delegateQueue:0];
}

- (NetworkQualityAssessment)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NetworkQualityAssessment;
  v11 = [(NetworkQualityAssessment *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    config = v11->_config;
    v11->_config = (NetworkQualityConfiguration *)v12;

    objc_storeStrong((id *)&v11->_delegate, a4);
    objc_storeStrong((id *)&v11->_delegateQueue, a5);
    v11->_testRunning = 0;
    v14 = objc_alloc_init(NetworkQualityResult);
    progressResults = v11->_progressResults;
    v11->_progressResults = v14;

    v11->_resultsIndex = 0;
    delegate = v11->_delegate;
    v17 = [NetworkQualityExecutions alloc];
    v18 = v11->_config;
    if (delegate) {
      uint64_t v19 = [(NetworkQualityExecutions *)v17 initWithConfiguration:v18 delegate:v11];
    }
    else {
      uint64_t v19 = [(NetworkQualityExecutions *)v17 initWithConfiguration:v18];
    }
    execution = v11->_execution;
    v11->_execution = (NetworkQualityExecutions *)v19;
  }
  return v11;
}

- (void)progress:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  v6 = [v4 workingLatencyResults];
  v7 = (void *)[v6 copy];
  [v5 setWorkingLatencyValues:v7];

  id v8 = [v4 idleLatencyResults];
  id v9 = (void *)[v8 copy];
  [v5 setIdleLatencyValues:v9];

  id v10 = [v4 mutableOtherValues];

  v11 = [v10 objectForKey:@"protocols_seen"];

  if (v11 && [v11 count])
  {
    uint64_t v12 = [v11 allKeys];
    v13 = [v12 objectAtIndex:0];
    [v5 setAppProtocol:v13];
  }
  if (self->_delegate)
  {
    ++self->_resultsIndex;
    [v5 setIndex:];
    [v5 finalizeResult];
    delegateQueue = self->_delegateQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __37__NetworkQualityAssessment_progress___block_invoke;
    v15[3] = &unk_26439D268;
    v15[4] = self;
    id v16 = v5;
    [(NSOperationQueue *)delegateQueue addOperationWithBlock:v15];
  }
}

uint64_t __37__NetworkQualityAssessment_progress___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) progress:*(void *)(a1 + 40)];
}

- (void)finalizeResults:(id)a3 withError:(id)a4 withCompletionHandler:(id)a5
{
  id v34 = a3;
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = a4;
  id v10 = (void *)[v34 copy];
  v11 = [v34 workingLatencyResults];
  uint64_t v12 = (void *)[v11 copy];
  [v10 setWorkingLatencyValues:v12];

  v13 = [v34 idleLatencyResults];
  v14 = (void *)[v13 copy];
  [v10 setIdleLatencyValues:v14];

  v15 = [v34 mutableOtherValues];
  id v16 = [v15 objectForKeyedSubscript:@"protocols_seen"];

  if (v16 && [v16 count])
  {
    v17 = [v16 allKeys];
    v18 = [v17 objectAtIndex:0];
    [v10 setAppProtocol:v18];

    [v10 setProtocolNames:v16];
  }
  uint64_t v19 = [v34 mutableOtherValues];
  v20 = [v19 objectForKeyedSubscript:@"protocols_seen"];
  v21 = [v20 objectForKeyedSubscript:@"proxied"];
  [v10 setProxied:v21 != 0];

  objc_super v22 = [v34 mutableOtherValues];
  v23 = (void *)[v22 copy];
  [v10 setOtherValues:v23];

  v24 = [v34 mutableURLSessionMetrics];
  v25 = (void *)[v24 copy];
  [v10 setUrlSessionMetrics:v25];

  v26 = [(NetworkQualityResult *)self->_progressResults testEndpoint];

  if (v26)
  {
    v27 = [(NetworkQualityResult *)self->_progressResults testEndpoint];
    [v10 setTestEndpoint:v27];
  }
  uint64_t v28 = [(NetworkQualityConfiguration *)self->_config hostOverride];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [v10 testEndpoint];

    if (!v30)
    {
      v31 = [(NetworkQualityConfiguration *)self->_config hostOverride];
      [v10 setTestEndpoint:v31];
    }
  }
  if ([(NetworkQualityConfiguration *)self->_config latencyMeasurementServiceType])
  {
    v32 = NetworkQualityNetworkServiceType_ToString([(NetworkQualityConfiguration *)self->_config latencyMeasurementServiceType]);
    [v10 setLatencyMeasurementServiceType:v32];
  }
  if ([(NetworkQualityConfiguration *)self->_config loadGeneratingNetworkServiceType])
  {
    v33 = NetworkQualityNetworkServiceType_ToString([(NetworkQualityConfiguration *)self->_config loadGeneratingNetworkServiceType]);
    [v10 setLoadGeneratingNetworkServiceType:v33];
  }
  ++self->_resultsIndex;
  [v10 setIndex:];
  [v10 finalizeResult];
  v8[2](v8, v10, v9);
}

- (void)runWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_testRunning)
  {
    objc_sync_exit(v5);

    v6 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"NetworkQualityErrorDomain" code:1002 userInfo:0];
    v4[2](v4, 0, v6);
  }
  else
  {
    v5->_testRunning = 1;
    objc_sync_exit(v5);

    execution = v5->_execution;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__NetworkQualityAssessment_runWithCompletionHandler___block_invoke;
    v8[3] = &unk_26439D290;
    v8[4] = v5;
    id v9 = v4;
    [(NetworkQualityExecutions *)execution runWithCompletionHandler:v8];
  }
}

uint64_t __53__NetworkQualityAssessment_runWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finalizeResults:a2 withError:a3 withCompletionHandler:*(void *)(a1 + 40)];
}

- (void)cancel
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressResults, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_execution, 0);
}

@end