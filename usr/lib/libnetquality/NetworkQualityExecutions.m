@interface NetworkQualityExecutions
- (BOOL)currentStageIs:(int)a3;
- (BOOL)isDraining;
- (BOOL)throughputMetExitCriteria;
- (BOOL)throughputSaturated;
- (NetworkQualityExecutions)initWithConfiguration:(id)a3;
- (NetworkQualityExecutions)initWithConfiguration:(id)a3 delegate:(id)a4;
- (id)createDefaultNSURLSessionConfiguration;
- (id)createDefaultRequestwithURL:(id)a3;
- (int64_t)currentThroughput;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_cancelWithOptionalError:(id)a3;
- (void)_sendSymptomReport;
- (void)cancel;
- (void)captureError:(id)a3;
- (void)checkTimeout;
- (void)drain;
- (void)execDLWithCompletionHandler:(id)a3;
- (void)execParallelWithCompletionHandler:(id)a3;
- (void)execULWithCompletionHandler:(id)a3;
- (void)reallyExecuteDL;
- (void)reallyExecuteParallel;
- (void)reallyExecuteUL;
- (void)reportingCompletionHandler:(id)a3;
- (void)run;
- (void)runWithCompletionHandler:(id)a3;
- (void)setTimeout;
- (void)shareProgress;
@end

@implementation NetworkQualityExecutions

- (NetworkQualityExecutions)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NetworkQualityExecutions;
  v6 = [(NetworkQualityExecutions *)&v23 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  p_config = (id *)&v6->config;
  objc_storeStrong((id *)&v6->config, a3);
  uint64_t v9 = nw_activity_create();
  parentNWActivity = v7->_parentNWActivity;
  v7->_parentNWActivity = (OS_nw_activity *)v9;

  dispatch_queue_t v11 = dispatch_queue_create("com.apple.networkQuality.executions", 0);
  executionsQueue = v7->_executionsQueue;
  v7->_executionsQueue = (OS_dispatch_queue *)v11;

  v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
  operationQueue = v7->_operationQueue;
  v7->_operationQueue = v13;

  [(NSOperationQueue *)v7->_operationQueue setUnderlyingQueue:v7->_executionsQueue];
  [(NSOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:1];
  [(NSOperationQueue *)v7->_operationQueue setQualityOfService:17];
  v7->cancelled = 0;
  *(_WORD *)&v7->_throughputSaturated = 0;
  v15 = objc_alloc_init(NetworkQualityExecutionsResult);
  progressResults = v7->_progressResults;
  v7->_progressResults = v15;

  v17 = [(NetworkQualityConfiguration *)v7->config networkInterfaceName];

  if (!v17)
  {
LABEL_5:
    v7->_stage = 0;
LABEL_6:
    v20 = v7;
    goto LABEL_7;
  }
  id v18 = [*p_config networkInterfaceName];
  [v18 cStringUsingEncoding:4];
  v19 = (void *)nw_interface_create_with_name();

  if (v19)
  {

    goto LABEL_5;
  }
  netqual_log_init();
  v22 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
    -[NetworkQualityExecutions initWithConfiguration:]((void **)&v7->config, v22);
  }
  v20 = 0;
LABEL_7:

  return v20;
}

- (BOOL)currentStageIs:(int)a3
{
  return self->_stage == a3;
}

- (NetworkQualityExecutions)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v7 = a4;
  v8 = [(NetworkQualityExecutions *)self initWithConfiguration:a3];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_delegate, a4);
  }

  return v9;
}

- (id)createDefaultNSURLSessionConfiguration
{
  v3 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  [v3 setRequestCachePolicy:1];
  [v3 setURLCache:0];
  if ([(NetworkQualityConfiguration *)self->config forceHTTP3]) {
    [v3 set_allowsHTTP3:1];
  }
  if ([(NetworkQualityConfiguration *)self->config forceL4S]) {
    [v3 set_enablesL4S:1];
  }
  if ([(NetworkQualityConfiguration *)self->config forceDisableL4S]) {
    [v3 set_enablesL4S:0];
  }
  if ([(NetworkQualityConfiguration *)self->config privateRelay]) {
    [v3 set_sourceApplicationSecondaryIdentifier:@"com.apple.networkQuality.private-relay"];
  }
  if ([(NetworkQualityConfiguration *)self->config multipathServiceType]) {
    [v3 setMultipathServiceType:-[NetworkQualityConfiguration multipathServiceType](self->config, "multipathServiceType")];
  }
  if ([(NetworkQualityConfiguration *)self->config useUnifiedHTTPStack]) {
    [v3 set_usesNWLoader:1];
  }

  return v3;
}

- (id)createDefaultRequestwithURL:(id)a3
{
  v4 = [MEMORY[0x263F089E0] requestWithURL:a3];
  id v5 = [(NetworkQualityConfiguration *)self->config networkInterfaceName];

  if (v5)
  {
    v6 = [(NetworkQualityConfiguration *)self->config networkInterfaceName];
    [v4 setBoundInterfaceIdentifier:v6];
  }
  if (![(NetworkQualityConfiguration *)self->config forceHTTP1]
    && ![(NetworkQualityConfiguration *)self->config forceHTTP2])
  {
    if (![(NetworkQualityConfiguration *)self->config forceHTTP3]) {
      goto LABEL_8;
    }
    [v4 setAssumesHTTP3Capable:1];
  }
  [v4 _CFURLRequest];
  _CFURLRequestSetAllowedProtocolTypes();
LABEL_8:
  [v4 setValue:@"identity" forHTTPHeaderField:@"Accept-Encoding"];

  return v4;
}

- (void)checkTimeout
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] now];
  v4 = v3;
  if (self->_timeout)
  {
    [v3 timeIntervalSinceDate:];
    if (v5 > 0.0)
    {
      timeout = self->_timeout;
      self->_timeout = 0;

      id v7 = [NSString stringWithFormat:@"Timed out waiting for stage %s to drain", NetworkQualityStages_to_string(self->_stage)];
      netqual_log_init();
      v8 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v7;
        v10 = v8;
        *(_DWORD *)buf = 136315650;
        v17 = "-[NetworkQualityExecutions checkTimeout]";
        __int16 v18 = 1024;
        int v19 = 260;
        __int16 v20 = 2080;
        uint64_t v21 = [v9 UTF8String];
        _os_log_impl(&dword_2192FE000, v10, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] %s. Moving on.", buf, 0x1Cu);
      }
      if ([(NetworkQualityExecutions *)self isDraining])
      {
        dispatch_queue_t v11 = (void *)MEMORY[0x263F087E8];
        uint64_t v14 = *MEMORY[0x263F08320];
        v15 = v7;
        v12 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        v13 = [v11 errorWithDomain:@"NetworkQualityErrorDomain" code:1011 userInfo:v12];

        [(NetworkQualityExecutions *)self reportingCompletionHandler:v13];
      }
      else
      {
        [(NetworkQualityExecutions *)self run];
      }
    }
  }
}

- (void)shareProgress
{
  id obj = [MEMORY[0x263EFF910] now];
  [(NetworkQualityExecutions *)self checkTimeout];
  if (self->_delegate)
  {
    [obj timeIntervalSinceDate:self->_lastProgressUpdate];
    if (v3 >= 0.2)
    {
      objc_storeStrong((id *)&self->_lastProgressUpdate, obj);
      [(NetworkQualityResult *)self->_progressResults setIndex:[(NetworkQualityResult *)self->_progressResults index] + 1];
      [(NetworkQualityResult *)self->_progressResults setTimestamp:obj];
      [(NetworkQualityExecutionsDelegate *)self->_delegate progress:self->_progressResults];
    }
  }
}

- (int64_t)currentThroughput
{
  double v3 = [(NetworkQualityResult *)self->_progressResults downlinkCapacity];
  v4 = [v3 value];

  if (v4)
  {
    double v5 = [(NetworkQualityResult *)self->_progressResults downlinkCapacity];
    v6 = [v5 value];
    int64_t v7 = [v6 integerValue];
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = [(NetworkQualityResult *)self->_progressResults uplinkCapacity];
  id v9 = [v8 value];

  if (v9)
  {
    v10 = [(NetworkQualityResult *)self->_progressResults uplinkCapacity];
    dispatch_queue_t v11 = [v10 value];
    uint64_t v12 = [v11 integerValue];

    if (v12 < v7)
    {
      v13 = [(NetworkQualityResult *)self->_progressResults uplinkCapacity];
      uint64_t v14 = [v13 value];
      int64_t v7 = [v14 integerValue];
    }
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v7;
  }
}

- (void)reportingCompletionHandler:(id)a3
{
  if (!self->cancelled)
  {
    -[NetworkQualityExecutions captureError:](self, "captureError:");
    if (!a3) {
      [(NetworkQualityExecutions *)self _sendSymptomReport];
    }
    nw_activity_complete_with_reason();
    completionHandler = (void (**)(id, NetworkQualityExecutionsResult *, void *))self->_completionHandler;
    progressResults = self->_progressResults;
    int64_t v7 = [(NetworkQualityResult *)progressResults error];
    completionHandler[2](completionHandler, progressResults, v7);

    [(NetworkQualityExecutions *)self _cancelWithOptionalError:0];
  }
}

- (void)drain
{
}

uint64_t __33__NetworkQualityExecutions_drain__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) drain];
}

void __33__NetworkQualityExecutions_drain__block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  netqual_log_init();
  v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 80);
    int v10 = 136315650;
    dispatch_queue_t v11 = "-[NetworkQualityExecutions drain]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 379;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - [Draining] Canceled latency delegate %@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int64_t v7 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = 0;

  v8 = *(void **)(a1 + 32);
  if (v3)
  {
    [v8 reportingCompletionHandler:v3];
  }
  else if (!v8[10] && !v8[8] && !v8[9])
  {
    netqual_log_init();
    id v9 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      dispatch_queue_t v11 = "-[NetworkQualityExecutions drain]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 389;
      _os_log_impl(&dword_2192FE000, v9, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Finished draining stage - moving on", (uint8_t *)&v10, 0x12u);
    }
    if (([*(id *)(a1 + 32) isDraining] & 1) == 0) {
      __33__NetworkQualityExecutions_drain__block_invoke_51_cold_1();
    }
    [*(id *)(a1 + 32) run];
  }
}

void __33__NetworkQualityExecutions_drain__block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  netqual_log_init();
  v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 64);
    int v10 = 136315650;
    dispatch_queue_t v11 = "-[NetworkQualityExecutions drain]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 407;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - [Draining] Canceled dl delegate %@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int64_t v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = 0;

  v8 = *(void **)(a1 + 32);
  if (v3)
  {
    [v8 reportingCompletionHandler:v3];
  }
  else if (!v8[10] && !v8[8] && !v8[9])
  {
    netqual_log_init();
    id v9 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      dispatch_queue_t v11 = "-[NetworkQualityExecutions drain]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 417;
      _os_log_impl(&dword_2192FE000, v9, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Finished draining stage - moving on", (uint8_t *)&v10, 0x12u);
    }
    if (([*(id *)(a1 + 32) isDraining] & 1) == 0) {
      __33__NetworkQualityExecutions_drain__block_invoke_55_cold_1();
    }
    [*(id *)(a1 + 32) run];
  }
}

void __33__NetworkQualityExecutions_drain__block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  netqual_log_init();
  v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 72);
    int v10 = 136315650;
    dispatch_queue_t v11 = "-[NetworkQualityExecutions drain]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 428;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - [Draining] Canceled ul delegate %@", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int64_t v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = 0;

  v8 = *(void **)(a1 + 32);
  if (v3)
  {
    [v8 reportingCompletionHandler:v3];
  }
  else if (!v8[10] && !v8[8] && !v8[9])
  {
    netqual_log_init();
    id v9 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      dispatch_queue_t v11 = "-[NetworkQualityExecutions drain]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 438;
      _os_log_impl(&dword_2192FE000, v9, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Finished draining stage - moving on", (uint8_t *)&v10, 0x12u);
    }
    if (([*(id *)(a1 + 32) isDraining] & 1) == 0) {
      __33__NetworkQualityExecutions_drain__block_invoke_56_cold_1();
    }
    [*(id *)(a1 + 32) run];
  }
}

- (BOOL)isDraining
{
  if ([(NetworkQualityExecutions *)self currentStageIs:2]
    || [(NetworkQualityExecutions *)self currentStageIs:5]
    || [(NetworkQualityExecutions *)self currentStageIs:8])
  {
    return 1;
  }

  return [(NetworkQualityExecutions *)self currentStageIs:11];
}

- (void)setTimeout
{
}

uint64_t __38__NetworkQualityExecutions_setTimeout__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkTimeout];
}

- (void)run
{
  __assert_rtn("-[NetworkQualityExecutions run]", "Executions.m", 817, "self->latencyDelegate == nil");
}

void __31__NetworkQualityExecutions_run__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([*(id *)(a1 + 32) isDraining] & 1) == 0)
  {
    if (v3)
    {
      [v3 code];
      nw_activity_complete_with_reason();
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
        __31__NetworkQualityExecutions_run__block_invoke_cold_1();
      }
      [*(id *)(a1 + 32) reportingCompletionHandler:v3];
    }
    else
    {
      nw_activity_complete_with_reason();
      netqual_log_init();
      v4 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315394;
        uint64_t v6 = "-[NetworkQualityExecutions run]_block_invoke";
        __int16 v7 = 1024;
        int v8 = 590;
        _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Finished idle latency stage - moving to draining", (uint8_t *)&v5, 0x12u);
      }
      [*(id *)(a1 + 32) run];
    }
  }
}

void __31__NetworkQualityExecutions_run__block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    [v3 code];
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __31__NetworkQualityExecutions_run__block_invoke_82_cold_1();
    }
    [*(id *)(a1 + 32) reportingCompletionHandler:v4];
  }
  else
  {
    nw_activity_complete_with_reason();
  }
}

uint64_t __31__NetworkQualityExecutions_run__block_invoke_83(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  netqual_log_init();
  v2 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[NetworkQualityExecutions run]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 682;
    _os_log_impl(&dword_2192FE000, v2, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Parallel Responsiveness saturated", (uint8_t *)&v4, 0x12u);
  }
  return [*(id *)(a1 + 32) run];
}

void __31__NetworkQualityExecutions_run__block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    [v3 code];
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __31__NetworkQualityExecutions_run__block_invoke_96_cold_1();
    }
    [*(id *)(a1 + 32) reportingCompletionHandler:v4];
  }
  else
  {
    nw_activity_complete_with_reason();
  }
}

uint64_t __31__NetworkQualityExecutions_run__block_invoke_97(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  netqual_log_init();
  v2 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[NetworkQualityExecutions run]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 773;
    _os_log_impl(&dword_2192FE000, v2, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Downlink Responsiveness saturated", (uint8_t *)&v4, 0x12u);
  }
  return [*(id *)(a1 + 32) run];
}

void __31__NetworkQualityExecutions_run__block_invoke_110(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    [v3 code];
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __31__NetworkQualityExecutions_run__block_invoke_110_cold_1();
    }
    [*(id *)(a1 + 32) reportingCompletionHandler:v4];
  }
  else
  {
    nw_activity_complete_with_reason();
  }
}

uint64_t __31__NetworkQualityExecutions_run__block_invoke_111(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  netqual_log_init();
  v2 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[NetworkQualityExecutions run]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 862;
    _os_log_impl(&dword_2192FE000, v2, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Uplink Responsiveness saturated", (uint8_t *)&v4, 0x12u);
  }
  return [*(id *)(a1 + 32) run];
}

- (void)runWithCompletionHandler:(id)a3
{
  id v4 = a3;
  executionsQueue = self->_executionsQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke;
  v7[3] = &unk_26439D008;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(executionsQueue, v7);
}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF910] now];
  uint64_t v4 = a1 + 32;
  uint64_t v3 = *(void *)(a1 + 32);
  int v5 = *(void **)(v3 + 216);
  *(void *)(v3 + 216) = v2;

  objc_storeStrong((id *)(*(void *)v4 + 240), *(id *)(*(void *)v4 + 216));
  uint64_t v6 = MEMORY[0x21D4880C0](*(void *)(a1 + 40));
  int v7 = *(void **)(*(void *)(a1 + 32) + 200);
  *(void *)(*(void *)v4 + 200) = v6;

  id v8 = [*(id *)(a1 + 32) createDefaultNSURLSessionConfiguration];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 176) configuration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    int v10 = [*(id *)(*(void *)(a1 + 32) + 176) bonjourHost];

    if (!v10)
    {
      v49 = [*(id *)(*(void *)(a1 + 32) + 176) configuration];
      objc_opt_class();
      uint64_t isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v51 = [NetworkQualityRemoteConfiguration alloc];
        v52 = [*(id *)(*(void *)(a1 + 32) + 176) configuration];
        uint64_t v53 = [(NetworkQualityRemoteConfiguration *)v51 initWithDictionary:v52 andConfig:*(void *)(*(void *)(a1 + 32) + 176)];
        v54 = *(void **)(*(void *)(a1 + 32) + 104);
        *(void *)(*(void *)(a1 + 32) + 104) = v53;

        netqual_log_init();
        v55 = os_log_netqual;
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v88 = 136315394;
          *(void *)&v88[4] = "-[NetworkQualityExecutions runWithCompletionHandler:]_block_invoke";
          *(_WORD *)&v88[12] = 1024;
          *(_DWORD *)&v88[14] = 1024;
          _os_log_impl(&dword_2192FE000, v55, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Moving to initial stage", v88, 0x12u);
        }
        [*(id *)(a1 + 32) run];
      }
      else
      {
        uint64_t v56 = *(void *)(a1 + 40);
        id v57 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v77 = *MEMORY[0x263F08320];
        v78 = @"Unknown object type";
        v58 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        v59 = (void *)[v57 initWithDomain:@"NetworkQualityErrorDomain" code:1002 userInfo:v58];
        (*(void (**)(uint64_t, void, void *))(v56 + 16))(v56, 0, v59);
      }
      goto LABEL_33;
    }
  }
  *(void *)v88 = 0;
  *(void *)&v88[8] = v88;
  *(void *)&v88[16] = 0x3032000000;
  v89 = __Block_byref_object_copy_;
  v90 = __Block_byref_object_dispose_;
  id v91 = 0;
  dispatch_queue_t v11 = [*(id *)(*(void *)(a1 + 32) + 176) bonjourHost];
  BOOL v12 = v11 == 0;

  int v13 = *(void **)(*(void *)(a1 + 32) + 176);
  if (v12)
  {
    uint64_t v25 = [v13 configuration];
    nw_endpoint_t bonjour_service = 0;
    __int16 v20 = *(NSObject **)(*(void *)&v88[8] + 40);
    *(void *)(*(void *)&v88[8] + 40) = v25;
  }
  else
  {
    id v14 = [v13 bonjourHost];
    nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service((const char *)[v14 UTF8String], "_nq._tcp", "local");

    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    v17 = (void *)nw_resolver_create_with_endpoint();
    __int16 v18 = dispatch_get_global_queue(0, 0);
    v73[6] = MEMORY[0x263EF8330];
    v73[7] = 3221225472;
    v73[8] = __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_114;
    v73[9] = &unk_26439CFB8;
    v76 = v88;
    id v19 = v17;
    id v74 = v19;
    __int16 v20 = v16;
    v75 = v20;
    nw_resolver_set_update_handler();

    dispatch_time_t v21 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v20, v21);
    if (!*(void *)(*(void *)&v88[8] + 40))
    {
      netqual_log_init();
      uint64_t v22 = (id)os_log_netqual;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_super v23 = [*(id *)(*(void *)(a1 + 32) + 176) bonjourHost];
        __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_cold_2(v23, v87, v22);
      }

      v24 = *(void **)(*(void *)&v88[8] + 40);
      *(void *)(*(void *)&v88[8] + 40) = @"https://networkquality/.well-known/nq";
    }
  }

  netqual_log_init();
  v26 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = *(void *)(*(void *)&v88[8] + 40);
    *(_DWORD *)buf = 136315650;
    v82 = "-[NetworkQualityExecutions runWithCompletionHandler:]_block_invoke";
    __int16 v83 = 1024;
    int v84 = 934;
    __int16 v85 = 2112;
    uint64_t v86 = v27;
    _os_log_impl(&dword_2192FE000, v26, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Configuration URL: %@", buf, 0x1Cu);
  }
  [v8 setTimeoutIntervalForRequest:15.0];
  uint64_t v28 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v8 delegate:*(void *)(a1 + 32) delegateQueue:0];
  uint64_t v29 = *(void *)(a1 + 32);
  v30 = *(void **)(v29 + 88);
  *(void *)(v29 + 88) = v28;

  v31 = (void *)MEMORY[0x263F089E0];
  uint64_t v32 = [NSURL URLWithString:*(void *)(*(void *)&v88[8] + 40)];
  v33 = [v31 requestWithURL:v32];

  v34 = [*(id *)(*(void *)(a1 + 32) + 176) networkInterfaceName];
  LOBYTE(v32) = v34 == 0;

  if ((v32 & 1) == 0)
  {
    v35 = [*(id *)(*(void *)(a1 + 32) + 176) networkInterfaceName];
    [v33 setBoundInterfaceIdentifier:v35];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 176) forceHTTP3]) {
    [v33 setAssumesHTTP3Capable:1];
  }
  [v33 setValue:@"identity" forHTTPHeaderField:@"Accept-Encoding"];
  uint64_t v36 = *(void *)(a1 + 32);
  v37 = *(void **)(v36 + 88);
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_134;
  v73[3] = &unk_26439CFE0;
  v73[4] = v36;
  v73[5] = v88;
  v38 = [v37 dataTaskWithRequest:v33 completionHandler:v73];
  v39 = v38;
  if (bonjour_service)
  {
    [v38 set_hostOverride:bonjour_service];
LABEL_32:
    [v39 resume];

    _Block_object_dispose(v88, 8);
    goto LABEL_33;
  }
  v40 = [*(id *)(*(void *)(a1 + 32) + 176) hostOverride];
  BOOL v41 = v40 == 0;

  if (v41) {
    goto LABEL_32;
  }
  v42 = NSURL;
  uint64_t v43 = [*(id *)(*(void *)(a1 + 32) + 176) configuration];
  v44 = [v42 URLWithString:v43];

  v45 = [v44 port];
  LOBYTE(v43) = v45 == 0;

  if ((v43 & 1) == 0)
  {
    v46 = [v44 port];
    id v47 = [v46 stringValue];
    v48 = (const char *)[v47 UTF8String];

LABEL_31:
    id v64 = [*(id *)(*(void *)(a1 + 32) + 176) hostOverride];
    nw_endpoint_t host = nw_endpoint_create_host((const char *)[v64 UTF8String], v48);
    [v39 set_hostOverride:host];

    goto LABEL_32;
  }
  v60 = [v44 scheme];
  char v61 = [v60 isEqualToString:@"https"];

  if (v61)
  {
    v48 = "443";
    goto LABEL_31;
  }
  v62 = [v44 scheme];
  char v63 = [v62 isEqualToString:@"http"];

  if (v63)
  {
    v48 = "80";
    goto LABEL_31;
  }
  v66 = NSString;
  v67 = [*(id *)(*(void *)(a1 + 32) + 176) configuration];
  v68 = [*(id *)(*(void *)(a1 + 32) + 176) hostOverride];
  v69 = [v66 stringWithFormat:@"URL %@ not valid for use with host-override %@", v67, v68];

  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
    __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_cold_1();
  }
  v70 = (void *)MEMORY[0x263F087E8];
  uint64_t v79 = *MEMORY[0x263F08320];
  v80 = v69;
  v71 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
  v72 = [v70 errorWithDomain:@"NetworkQualityErrorDomain" code:1006 userInfo:v71];

  [*(id *)(a1 + 32) reportingCompletionHandler:v72];
  _Block_object_dispose(v88, 8);

LABEL_33:
}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_114(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  if (nw_array_get_count())
  {
    uint64_t v4 = nw_array_get_object_at_index();
    int v5 = [NSString stringWithUTF8String:nw_endpoint_get_hostname(v4)];
    if ([v5 hasSuffix:@"."])
    {
      uint64_t v6 = [v5 substringToIndex:[v5 length] - 1];

      int v5 = (void *)v6;
    }
    int v7 = [NSString stringWithUTF8String:nw_endpoint_copy_port_string(v4)];
    if ([v7 isEqualToString:@"443"]) {
      [NSString stringWithFormat:@"https://%@/.well-known/nq", v5, v11];
    }
    else {
    uint64_t v8 = [NSString stringWithFormat:@"https://%@:%@/.well-known/nq", v5, v7];
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  nw_resolver_cancel();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_134(uint64_t a1, void *a2, void *a3, void *a4)
{
  v40[3] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(*(void *)(a1 + 32) + 88) invalidateAndCancel];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 88);
  *(void *)(v10 + 88) = 0;

  id v12 = v8;
  int v13 = v12;
  if (v9)
  {
    [*(id *)(a1 + 32) reportingCompletionHandler:v9];
  }
  else
  {
    uint64_t v14 = [v12 statusCode];
    if (v7 && v14 == 200)
    {
      uint64_t v15 = [[NetworkQualityRemoteConfiguration alloc] initWithData:v7 andConfig:*(void *)(*(void *)(a1 + 32) + 176)];
      dispatch_semaphore_t v16 = v15;
      if (v15)
      {
        v17 = [(NetworkQualityRemoteConfiguration *)v15 testEndpoint];
        [*(id *)(*(void *)(a1 + 32) + 184) setTestEndpoint:v17];

        objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v16);
        netqual_log_init();
        __int16 v18 = os_log_netqual;
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[NetworkQualityExecutions runWithCompletionHandler:]_block_invoke";
          __int16 v35 = 1024;
          int v36 = 986;
          _os_log_impl(&dword_2192FE000, v18, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Moving to initial stage", buf, 0x12u);
        }
        uint64_t v19 = [MEMORY[0x263EFF910] now];
        uint64_t v20 = *(void *)(a1 + 32);
        dispatch_time_t v21 = *(void **)(v20 + 216);
        *(void *)(v20 + 216) = v19;

        [*(id *)(a1 + 32) run];
      }
      else
      {
        v30 = (void *)MEMORY[0x263F087E8];
        uint64_t v37 = *MEMORY[0x263F08320];
        v38 = @"Could not parse server side configuration";
        v31 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        uint64_t v32 = [v30 errorWithDomain:@"NetworkQualityErrorDomain" code:1000 userInfo:v31];

        [*(id *)(a1 + 32) reportingCompletionHandler:v32];
      }
    }
    else
    {
      netqual_log_init();
      uint64_t v22 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
        __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_134_cold_1(v22, v13, (uint64_t)v7);
      }
      objc_super v23 = (void *)MEMORY[0x263F087E8];
      v39[0] = @"statusCode";
      v24 = [NSNumber numberWithInteger:[v13 statusCode]];
      uint64_t v25 = [v24 stringValue];
      v39[1] = @"URL";
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      v40[0] = v25;
      v40[1] = v26;
      v39[2] = *MEMORY[0x263F08320];
      uint64_t v27 = [NSString stringWithFormat:@"Expected HTTP status code 200, got %lu", [v13 statusCode]];
      v40[2] = v27;
      uint64_t v28 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
      uint64_t v29 = [v23 errorWithDomain:@"NetworkQualityErrorDomain" code:1003 userInfo:v28];

      [*(id *)(a1 + 32) reportingCompletionHandler:v29];
    }
  }
}

- (void)captureError:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(NetworkQualityResult *)self->_progressResults error];

  if (!v4) {
    [(NetworkQualityResult *)self->_progressResults setError:v5];
  }
}

- (void)execDLWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  netqual_log_init();
  id v5 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[NetworkQualityExecutions execDLWithCompletionHandler:]";
    __int16 v21 = 1024;
    int v22 = 1045;
    _os_log_impl(&dword_2192FE000, v5, OS_LOG_TYPE_DEFAULT, "%s:%u - Running Multi-flow Download Test", buf, 0x12u);
  }
  uint64_t v6 = [(NetworkQualityRemoteConfiguration *)self->remoteConfig URLForURLType:1];
  id v7 = [(NetworkQualityExecutions *)self createDefaultRequestwithURL:v6];

  if ([(NetworkQualityConfiguration *)self->config loadGeneratingNetworkServiceType]) {
    [v7 setNetworkServiceType:-[NetworkQualityConfiguration loadGeneratingNetworkServiceType](self->config, "loadGeneratingNetworkServiceType")];
  }
  id v8 = [DownloadThroughputDelegate alloc];
  operationQueue = self->_operationQueue;
  uint64_t v10 = [(NetworkQualityRemoteConfiguration *)self->remoteConfig testEndpoint:1];
  uint64_t v11 = [(ThroughputDelegate *)v8 initWithExecution:self testName:@"tp_dl_multi_h2" withQueue:operationQueue testEndpoint:v10 withConfig:self->config resultsObject:self->_progressResults];

  if (self->dlDelegate) {
    -[NetworkQualityExecutions execDLWithCompletionHandler:]();
  }
  self->dlDelegate = v11;
  id v12 = v11;

  int v13 = (OS_nw_activity *)nw_activity_create();
  downloadThroughputNWActivity = self->_downloadThroughputNWActivity;
  self->_downloadThroughputNWActivity = v13;

  nw_activity_set_parent_activity();
  nw_activity_activate();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke;
  v18[3] = &unk_26439CF68;
  v18[4] = self;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke_171;
  v16[3] = &unk_26439D030;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [(ThroughputDelegate *)v12 executeTaskWithRequest:v7 saturationHandler:v18 completionHandler:v16];
}

uint64_t __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 64) metExitCriteria];
  netqual_log_init();
  uint64_t v3 = (void *)os_log_netqual;
  BOOL v4 = os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = *(void **)(*(void *)(a1 + 32) + 184);
      uint64_t v6 = v3;
      id v7 = [v5 downlinkCapacity];
      id v8 = [v7 value];
      double v9 = (double)[v8 integerValue] * 0.000000953674316;
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkFlows];
      uint64_t v11 = [v10 integerValue];
      id v12 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkBytesTransferred];
      int v25 = 136316162;
      uint64_t v26 = "-[NetworkQualityExecutions execDLWithCompletionHandler:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 1076;
      __int16 v29 = 2048;
      double v30 = v9;
      __int16 v31 = 2048;
      uint64_t v32 = v11;
      __int16 v33 = 2048;
      uint64_t v34 = [v12 integerValue];
      _os_log_impl(&dword_2192FE000, v6, OS_LOG_TYPE_DEFAULT, "%s:%u - Exit throughput %.3f Mbps at %lu flows, transferred %ld bytes", (uint8_t *)&v25, 0x30u);
    }
    uint64_t v13 = 249;
  }
  else
  {
    if (v4)
    {
      uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 184);
      id v15 = v3;
      dispatch_semaphore_t v16 = [v14 downlinkCapacity];
      id v17 = [v16 value];
      double v18 = (double)[v17 integerValue] * 0.000000953674316;
      uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkFlows];
      uint64_t v20 = [v19 integerValue];
      __int16 v21 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkBytesTransferred];
      int v25 = 136316162;
      uint64_t v26 = "-[NetworkQualityExecutions execDLWithCompletionHandler:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 1083;
      __int16 v29 = 2048;
      double v30 = v18;
      __int16 v31 = 2048;
      uint64_t v32 = v20;
      __int16 v33 = 2048;
      uint64_t v34 = [v21 integerValue];
      _os_log_impl(&dword_2192FE000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - Saturation throughput %.3f Mbps at %lu flows, transferred %ld bytes", (uint8_t *)&v25, 0x30u);
    }
    uint64_t v13 = 248;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + v13) = 1;
  uint64_t result = [*(id *)(a1 + 32) currentStageIs:6];
  if (result)
  {
    netqual_log_init();
    uint64_t v23 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 248)) {
        v24 = "True";
      }
      else {
        v24 = "False";
      }
      int v25 = 136315650;
      uint64_t v26 = "-[NetworkQualityExecutions execDLWithCompletionHandler:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 1090;
      __int16 v29 = 2080;
      double v30 = *(double *)&v24;
      _os_log_impl(&dword_2192FE000, v23, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Downlink saturated %s, moving to responsiveness", (uint8_t *)&v25, 0x1Cu);
    }
    return [*(id *)(a1 + 32) run];
  }
  return result;
}

void __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke_171(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 code] != -999)
    {
      id v5 = [v4 domain];
      if (v5 == @"NetworkQualityErrorDomain") {
        [v4 code];
      }
      else {
    }
      }
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke_171_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    nw_activity_complete_with_reason();
  }
}

- (void)execULWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  netqual_log_init();
  id v5 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[NetworkQualityExecutions execULWithCompletionHandler:]";
    __int16 v21 = 1024;
    int v22 = 1115;
    _os_log_impl(&dword_2192FE000, v5, OS_LOG_TYPE_DEFAULT, "%s:%u - Running Multi-flow Upload Test", buf, 0x12u);
  }
  uint64_t v6 = [(NetworkQualityRemoteConfiguration *)self->remoteConfig URLForURLType:2];
  id v7 = [(NetworkQualityExecutions *)self createDefaultRequestwithURL:v6];

  if ([(NetworkQualityConfiguration *)self->config loadGeneratingNetworkServiceType]) {
    [v7 setNetworkServiceType:-[NetworkQualityConfiguration loadGeneratingNetworkServiceType](self->config, "loadGeneratingNetworkServiceType")];
  }
  id v8 = [UploadThroughputDelegate alloc];
  operationQueue = self->_operationQueue;
  uint64_t v10 = [(NetworkQualityRemoteConfiguration *)self->remoteConfig testEndpoint:2];
  uint64_t v11 = [(ThroughputDelegate *)v8 initWithExecution:self testName:@"tp_ul_multi_h2" withQueue:operationQueue testEndpoint:v10 withConfig:self->config resultsObject:self->_progressResults];

  if (self->ulDelegate) {
    -[NetworkQualityExecutions execULWithCompletionHandler:]();
  }
  self->ulDelegate = v11;
  id v12 = v11;

  uint64_t v13 = (OS_nw_activity *)nw_activity_create();
  uploadThroughputNWActivity = self->_uploadThroughputNWActivity;
  self->_uploadThroughputNWActivity = v13;

  nw_activity_set_parent_activity();
  nw_activity_activate();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke;
  v18[3] = &unk_26439CF68;
  v18[4] = self;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke_177;
  v16[3] = &unk_26439D030;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [(ThroughputDelegate *)v12 executeTaskWithRequest:v7 saturationHandler:v18 completionHandler:v16];
}

uint64_t __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 72) metExitCriteria];
  netqual_log_init();
  id v3 = (void *)os_log_netqual;
  BOOL v4 = os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = *(void **)(*(void *)(a1 + 32) + 184);
      uint64_t v6 = v3;
      id v7 = [v5 uplinkCapacity];
      id v8 = [v7 value];
      double v9 = (double)[v8 integerValue] * 0.000000953674316;
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkFlows];
      uint64_t v11 = [v10 integerValue];
      id v12 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkBytesTransferred];
      int v25 = 136316162;
      uint64_t v26 = "-[NetworkQualityExecutions execULWithCompletionHandler:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 1146;
      __int16 v29 = 2048;
      double v30 = v9;
      __int16 v31 = 2048;
      uint64_t v32 = v11;
      __int16 v33 = 2048;
      uint64_t v34 = [v12 integerValue];
      _os_log_impl(&dword_2192FE000, v6, OS_LOG_TYPE_DEFAULT, "%s:%u - Exit throughput %.3f Mbps at %lu flows, transferred %ld bytes", (uint8_t *)&v25, 0x30u);
    }
    uint64_t v13 = 249;
  }
  else
  {
    if (v4)
    {
      uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 184);
      id v15 = v3;
      dispatch_semaphore_t v16 = [v14 uplinkCapacity];
      id v17 = [v16 value];
      double v18 = (double)[v17 integerValue] * 0.000000953674316;
      uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkFlows];
      uint64_t v20 = [v19 integerValue];
      __int16 v21 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkBytesTransferred];
      int v25 = 136316162;
      uint64_t v26 = "-[NetworkQualityExecutions execULWithCompletionHandler:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 1153;
      __int16 v29 = 2048;
      double v30 = v18;
      __int16 v31 = 2048;
      uint64_t v32 = v20;
      __int16 v33 = 2048;
      uint64_t v34 = [v21 integerValue];
      _os_log_impl(&dword_2192FE000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - Saturation throughput %.3f Mbps at %lu flows, transferred %ld bytes", (uint8_t *)&v25, 0x30u);
    }
    uint64_t v13 = 248;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + v13) = 1;
  uint64_t result = [*(id *)(a1 + 32) currentStageIs:9];
  if (result)
  {
    netqual_log_init();
    uint64_t v23 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 248)) {
        v24 = "True";
      }
      else {
        v24 = "False";
      }
      int v25 = 136315650;
      uint64_t v26 = "-[NetworkQualityExecutions execULWithCompletionHandler:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 1160;
      __int16 v29 = 2080;
      double v30 = *(double *)&v24;
      _os_log_impl(&dword_2192FE000, v23, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Uplink saturated %s, moving to responsiveness", (uint8_t *)&v25, 0x1Cu);
    }
    return [*(id *)(a1 + 32) run];
  }
  return result;
}

void __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke_177(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 code] != -999)
    {
      id v5 = [v4 domain];
      if (v5 == @"NetworkQualityErrorDomain") {
        [v4 code];
      }
      else {
    }
      }
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke_177_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    nw_activity_complete_with_reason();
  }
}

- (void)execParallelWithCompletionHandler:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  netqual_log_init();
  id v5 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v43 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]";
    __int16 v44 = 1024;
    int v45 = 1190;
    _os_log_impl(&dword_2192FE000, v5, OS_LOG_TYPE_DEFAULT, "%s:%u - Running Multi-flow Parallel Test", buf, 0x12u);
  }
  uint64_t v6 = [(NetworkQualityRemoteConfiguration *)self->remoteConfig URLForURLType:1];
  id v7 = [(NetworkQualityExecutions *)self createDefaultRequestwithURL:v6];

  if ([(NetworkQualityConfiguration *)self->config loadGeneratingNetworkServiceType]) {
    [v7 setNetworkServiceType:-[NetworkQualityConfiguration loadGeneratingNetworkServiceType](self->config, "loadGeneratingNetworkServiceType")];
  }
  id v8 = [DownloadThroughputDelegate alloc];
  operationQueue = self->_operationQueue;
  uint64_t v10 = [(NetworkQualityRemoteConfiguration *)self->remoteConfig testEndpoint:1];
  uint64_t v11 = [(ThroughputDelegate *)v8 initWithExecution:self testName:@"tp_dl_parallel_h2" withQueue:operationQueue testEndpoint:v10 withConfig:self->config resultsObject:self->_progressResults];

  if (self->dlDelegate) {
    __assert_rtn("-[NetworkQualityExecutions execParallelWithCompletionHandler:]", "Executions.m", 1206, "self->dlDelegate == nil");
  }
  objc_storeStrong((id *)&self->dlDelegate, v11);
  id v12 = [(NetworkQualityRemoteConfiguration *)self->remoteConfig URLForURLType:2];
  uint64_t v13 = [(NetworkQualityExecutions *)self createDefaultRequestwithURL:v12];

  if ([(NetworkQualityConfiguration *)self->config loadGeneratingNetworkServiceType]) {
    [v13 setNetworkServiceType:-[NetworkQualityConfiguration loadGeneratingNetworkServiceType](self->config, "loadGeneratingNetworkServiceType")];
  }
  uint64_t v14 = [UploadThroughputDelegate alloc];
  id v15 = self->_operationQueue;
  dispatch_semaphore_t v16 = [(NetworkQualityRemoteConfiguration *)self->remoteConfig testEndpoint:2];
  id v17 = [(ThroughputDelegate *)v14 initWithExecution:self testName:@"tp_ul_parallel_h2" withQueue:v15 testEndpoint:v16 withConfig:self->config resultsObject:self->_progressResults];

  if (self->ulDelegate) {
    __assert_rtn("-[NetworkQualityExecutions execParallelWithCompletionHandler:]", "Executions.m", 1223, "self->ulDelegate == nil");
  }
  objc_storeStrong((id *)&self->ulDelegate, v17);
  double v18 = (OS_nw_activity *)nw_activity_create();
  downloadThroughputNWActivity = self->_downloadThroughputNWActivity;
  self->_downloadThroughputNWActivity = v18;

  nw_activity_set_parent_activity();
  nw_activity_activate();
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke;
  v33[3] = &unk_26439D058;
  v33[4] = self;
  v33[5] = v38;
  v33[6] = v40;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_184;
  v29[3] = &unk_26439D080;
  v29[4] = self;
  id v20 = v4;
  id v30 = v20;
  __int16 v31 = v36;
  uint64_t v32 = v34;
  [(ThroughputDelegate *)v11 executeTaskWithRequest:v7 saturationHandler:v33 completionHandler:v29];
  __int16 v21 = (OS_nw_activity *)nw_activity_create();
  uploadThroughputNWActivity = self->_uploadThroughputNWActivity;
  self->_uploadThroughputNWActivity = v21;

  nw_activity_set_parent_activity();
  nw_activity_activate();
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_185;
  v28[3] = &unk_26439D058;
  v28[4] = self;
  v28[5] = v40;
  v28[6] = v38;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_186;
  v24[3] = &unk_26439D080;
  v24[4] = self;
  id v23 = v20;
  id v25 = v23;
  uint64_t v26 = v34;
  __int16 v27 = v36;
  [(ThroughputDelegate *)v17 executeTaskWithRequest:v13 saturationHandler:v28 completionHandler:v24];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  netqual_log_init();
  int v2 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 184);
    id v4 = v2;
    id v5 = [v3 downlinkCapacity];
    uint64_t v6 = [v5 value];
    double v7 = (double)[v6 integerValue] * 0.000000953674316;
    id v8 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkFlows];
    uint64_t v9 = [v8 integerValue];
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkBytesTransferred];
    uint64_t v11 = [v10 integerValue];
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v16 = 136316418;
    id v17 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 1237;
    __int16 v20 = 2048;
    double v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v9;
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    __int16 v26 = 1024;
    int v27 = v12;
    _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Download saturation throughput %.3f Mbps at %lu flows, transferred %ld bytes, uplink saturation %u", (uint8_t *)&v16, 0x36u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    int v13 = [*(id *)(*(void *)(a1 + 32) + 72) metExitCriteria];
    uint64_t v14 = 248;
    if (v13) {
      uint64_t v14 = 249;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + v14) = 1;
    if ([*(id *)(a1 + 32) currentStageIs:3])
    {
      netqual_log_init();
      id v15 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        id v17 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 1249;
        _os_log_impl(&dword_2192FE000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] parallel saturated - moving to responsiveness", (uint8_t *)&v16, 0x12u);
      }
      [*(id *)(a1 + 32) run];
    }
  }
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_184(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if ([v3 code] != -999)
    {
      uint64_t v6 = [v4 domain];
      if (v6 == @"NetworkQualityErrorDomain") {
        [v4 code];
      }
      else {
    }
      }
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_184_cold_1();
    }
    id v5 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_12;
  }
  nw_activity_complete_with_reason();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v5 = *(void (**)(void))(a1[5] + 16);
LABEL_12:
    v5();
  }
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_185(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  netqual_log_init();
  int v2 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 184);
    id v4 = v2;
    id v5 = [v3 uplinkCapacity];
    uint64_t v6 = [v5 value];
    double v7 = (double)[v6 integerValue] * 0.000000953674316;
    id v8 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkFlows];
    uint64_t v9 = [v8 integerValue];
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkBytesTransferred];
    uint64_t v11 = [v10 integerValue];
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v16 = 136316418;
    id v17 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 1288;
    __int16 v20 = 2048;
    double v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v9;
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    __int16 v26 = 1024;
    int v27 = v12;
    _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Upload saturation throughput %.3f Mbps at %lu flows, transferred %ld bytes, downlink saturation %u", (uint8_t *)&v16, 0x36u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    int v13 = [*(id *)(*(void *)(a1 + 32) + 64) metExitCriteria];
    uint64_t v14 = 248;
    if (v13) {
      uint64_t v14 = 249;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + v14) = 1;
    if ([*(id *)(a1 + 32) currentStageIs:3])
    {
      netqual_log_init();
      id v15 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        id v17 = "-[NetworkQualityExecutions execParallelWithCompletionHandler:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 1299;
        _os_log_impl(&dword_2192FE000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] parallel saturated - moving to draining", (uint8_t *)&v16, 0x12u);
      }
      [*(id *)(a1 + 32) run];
    }
  }
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_186(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if ([v3 code] != -999)
    {
      uint64_t v6 = [v4 domain];
      if (v6 == @"NetworkQualityErrorDomain") {
        [v4 code];
      }
      else {
    }
      }
    nw_activity_complete_with_reason();
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_186_cold_1();
    }
    id v5 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_12;
  }
  nw_activity_complete_with_reason();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v5 = *(void (**)(void))(a1[5] + 16);
LABEL_12:
    v5();
  }
}

- (void)reallyExecuteParallel
{
  id v3 = [MEMORY[0x263EFF910] now];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__NetworkQualityExecutions_reallyExecuteParallel__block_invoke;
  v5[3] = &unk_26439D0A8;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [(NetworkQualityExecutions *)self execParallelWithCompletionHandler:v5];
}

void __49__NetworkQualityExecutions_reallyExecuteParallel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkCapacity];
  id v5 = [v4 value];

  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF910] now];
    [v6 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v8 = v7;

    uint64_t v9 = NSNumber;
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkBytesTransferred];
    uint64_t v11 = [(uint64_t)((double)(int)(8 * [v10 intValue]) / v8) numberWithInteger:];
    int v12 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkCapacity];
    [v12 setValue:v11];

    int v13 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkCapacity];
    [v13 updateConfidence:1];
  }
  uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkCapacity];
  id v15 = [v14 value];

  if (!v15)
  {
    int v16 = [MEMORY[0x263EFF910] now];
    [v16 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v18 = v17;

    int v19 = NSNumber;
    __int16 v20 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkBytesTransferred];
    double v21 = [v19 numberWithInteger:(uint64_t)((double)(int)(8 * [v20 intValue]) / v18)];
    __int16 v22 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkCapacity];
    [v22 setValue:v21];

    uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkCapacity];
    [v23 updateConfidence:1];
  }
  [*(id *)(a1 + 32) shareProgress];
  if (v3)
  {
    __int16 v24 = [v3 domain];
    if (v24 != @"NetworkQualityErrorDomain")
    {

LABEL_12:
      [*(id *)(a1 + 32) reportingCompletionHandler:v3];
      goto LABEL_13;
    }
    if ([v3 code] != 1005) {
      goto LABEL_12;
    }
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 96))
    {
      uint64_t v25 = [v3 domain];
      if (v25 == @"NetworkQualityErrorDomain")
      {
        if ([v3 code] == 1005 && (objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
        {
          netqual_log_init();
          __int16 v26 = os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 136315394;
            uint64_t v28 = "-[NetworkQualityExecutions reallyExecuteParallel]_block_invoke";
            __int16 v29 = 1024;
            int v30 = 1361;
            _os_log_impl(&dword_2192FE000, v26, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Parallel data limit exceeded - moving to draining", (uint8_t *)&v27, 0x12u);
          }
          [*(id *)(a1 + 32) run];
        }
      }
      else
      {
      }
    }
  }
LABEL_13:
}

- (void)reallyExecuteDL
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF910] now];
  netqual_log_init();
  id v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[NetworkQualityExecutions reallyExecuteDL]";
    __int16 v10 = 1024;
    int v11 = 1371;
    _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Running dl test", buf, 0x12u);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__NetworkQualityExecutions_reallyExecuteDL__block_invoke;
  v6[3] = &unk_26439D0A8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(NetworkQualityExecutions *)self execDLWithCompletionHandler:v6];
}

void __43__NetworkQualityExecutions_reallyExecuteDL__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkCapacity];
  id v5 = [v4 value];

  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF910] now];
    [v6 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v8 = v7;

    uint64_t v9 = NSNumber;
    __int16 v10 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkBytesTransferred];
    int v11 = [(int)[v9 numberWithInteger:(uint64_t)((double)(int)(8 * [v10 intValue]) / v8)]];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkCapacity];
    [v12 setValue:v11];

    int v13 = [*(id *)(*(void *)(a1 + 32) + 184) downlinkCapacity];
    [v13 updateConfidence:1];
  }
  [*(id *)(a1 + 32) shareProgress];
  if (v3)
  {
    uint64_t v14 = [v3 domain];
    if (v14 != @"NetworkQualityErrorDomain")
    {

LABEL_10:
      [*(id *)(a1 + 32) reportingCompletionHandler:v3];
      goto LABEL_11;
    }
    if ([v3 code] != 1005) {
      goto LABEL_10;
    }
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 96))
    {
      id v15 = [v3 domain];
      if (v15 == @"NetworkQualityErrorDomain")
      {
        if ([v3 code] == 1005 && (objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
        {
          netqual_log_init();
          int v16 = os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 136315394;
            double v18 = "-[NetworkQualityExecutions reallyExecuteDL]_block_invoke";
            __int16 v19 = 1024;
            int v20 = 1394;
            _os_log_impl(&dword_2192FE000, v16, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Downlink data limit exceeded - moving to draining", (uint8_t *)&v17, 0x12u);
          }
          [*(id *)(a1 + 32) run];
        }
      }
      else
      {
      }
    }
  }
LABEL_11:
}

- (void)reallyExecuteUL
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF910] now];
  netqual_log_init();
  id v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[NetworkQualityExecutions reallyExecuteUL]";
    __int16 v10 = 1024;
    int v11 = 1404;
    _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Running ul test", buf, 0x12u);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__NetworkQualityExecutions_reallyExecuteUL__block_invoke;
  v6[3] = &unk_26439D0A8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(NetworkQualityExecutions *)self execULWithCompletionHandler:v6];
}

void __43__NetworkQualityExecutions_reallyExecuteUL__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkCapacity];
  id v5 = [v4 value];

  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF910] now];
    [v6 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v8 = v7;

    uint64_t v9 = NSNumber;
    __int16 v10 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkBytesTransferred];
    int v11 = [(int)[v9 numberWithInteger:((uint64_t)((double)(int)(8 * [v10 intValue]) / v8))];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkCapacity];
    [v12 setValue:v11];

    int v13 = [*(id *)(*(void *)(a1 + 32) + 184) uplinkCapacity];
    [v13 updateConfidence:1];
  }
  [*(id *)(a1 + 32) shareProgress];
  if (v3)
  {
    uint64_t v14 = [v3 domain];
    if (v14 != @"NetworkQualityErrorDomain")
    {

LABEL_10:
      [*(id *)(a1 + 32) reportingCompletionHandler:v3];
      goto LABEL_11;
    }
    if ([v3 code] != 1005) {
      goto LABEL_10;
    }
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 96))
    {
      id v15 = [v3 domain];
      if (v15 == @"NetworkQualityErrorDomain")
      {
        if ([v3 code] == 1005 && (objc_msgSend(*(id *)(a1 + 32), "isDraining") & 1) == 0)
        {
          netqual_log_init();
          int v16 = os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 136315394;
            double v18 = "-[NetworkQualityExecutions reallyExecuteUL]_block_invoke";
            __int16 v19 = 1024;
            int v20 = 1427;
            _os_log_impl(&dword_2192FE000, v16, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Uplink data limit exceeded - moving to draining", (uint8_t *)&v17, 0x12u);
          }
          [*(id *)(a1 + 32) run];
        }
      }
      else
      {
      }
    }
  }
LABEL_11:
}

- (void)_cancelWithOptionalError:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  netqual_log_init();
  id v5 = (id)os_log_netqual;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      uint64_t v6 = [v4 code];
    }
    else {
      uint64_t v6 = 0;
    }
    int v17 = 136315650;
    double v18 = "-[NetworkQualityExecutions _cancelWithOptionalError:]";
    __int16 v19 = 1024;
    int v20 = 1436;
    __int16 v21 = 2048;
    uint64_t v22 = v6;
    _os_log_impl(&dword_2192FE000, v5, OS_LOG_TYPE_DEFAULT, "%s:%u - Cancelling with %ld", (uint8_t *)&v17, 0x1Cu);
  }

  if (!self->cancelled)
  {
    self->cancelled = 1;
    delegate = self->_delegate;
    self->_delegate = 0;

    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    [(NetworkQualityExecutions *)self captureError:v4];
    dlDelegate = self->dlDelegate;
    if (dlDelegate)
    {
      [(ThroughputDelegate *)dlDelegate cancel];
      __int16 v10 = self->dlDelegate;
      self->dlDelegate = 0;
    }
    ulDelegate = self->ulDelegate;
    if (ulDelegate)
    {
      [(ThroughputDelegate *)ulDelegate cancel];
      uint64_t v12 = self->ulDelegate;
      self->ulDelegate = 0;
    }
    latencyDelegate = self->latencyDelegate;
    if (latencyDelegate)
    {
      [(LatencyURLSessionDelegate *)latencyDelegate cancel];
      uint64_t v14 = self->latencyDelegate;
      self->latencyDelegate = 0;
    }
    configSession = self->_configSession;
    if (configSession)
    {
      [(NSURLSession *)configSession invalidateAndCancel];
      int v16 = self->_configSession;
      self->_configSession = 0;
    }
    if (v4) {
      nw_activity_complete_with_reason();
    }
  }
}

- (void)cancel
{
  executionsQueue = self->_executionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__NetworkQualityExecutions_cancel__block_invoke;
  block[3] = &unk_26439CF68;
  block[4] = self;
  dispatch_async(executionsQueue, block);
}

void __34__NetworkQualityExecutions_cancel__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  int v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F08320];
  v6[0] = @"Test canceled by user.";
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [v2 errorWithDomain:@"NetworkQualityErrorDomain" code:1004 userInfo:v3];
  [v1 _cancelWithOptionalError:v4];
}

- (void)_sendSymptomReport
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Failed to archive dictionary. Error : %@", v2, v3, v4, v5, 2u);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v12 = a5;
  double v8 = (void (**)(id, uint64_t, void))a6;
  if ([(NetworkQualityConfiguration *)self->config validateCertificate])
  {
    v8[2](v8, 1, 0);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263F08BB8];
    __int16 v10 = [v12 protectionSpace];
    int v11 = [v9 credentialForTrust:[v10 serverTrust]];
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v11);
  }
}

- (BOOL)throughputSaturated
{
  return self->_throughputSaturated;
}

- (BOOL)throughputMetExitCriteria
{
  return self->_throughputMetExitCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProgressUpdate, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_startCapacityTest, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_progressResults, 0);
  objc_storeStrong((id *)&self->config, 0);

  objc_storeStrong((id *)&self->remoteConfig, 0);
  objc_storeStrong((id *)&self->_configSession, 0);
  objc_storeStrong((id *)&self->latencyDelegate, 0);
  objc_storeStrong((id *)&self->ulDelegate, 0);
  objc_storeStrong((id *)&self->dlDelegate, 0);
  objc_storeStrong((id *)&self->_uploadThroughputNWActivity, 0);
  objc_storeStrong((id *)&self->_downloadThroughputNWActivity, 0);
  objc_storeStrong((id *)&self->_workingLatencyNWActivity, 0);
  objc_storeStrong((id *)&self->_idleLatencyNWActivity, 0);
  objc_storeStrong((id *)&self->_parentNWActivity, 0);
  objc_storeStrong((id *)&self->_executionsQueue, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)initWithConfiguration:(void *)a1 .cold.1(void **a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  uint64_t v4 = [v2 networkInterfaceName];
  v5[0] = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2192FE000, v3, OS_LOG_TYPE_ERROR, "%s:%u - Invalid interface name %@ specified", (uint8_t *)v5, 0x1Cu);
}

void __33__NetworkQualityExecutions_drain__block_invoke_51_cold_1()
{
}

void __33__NetworkQualityExecutions_drain__block_invoke_55_cold_1()
{
}

void __33__NetworkQualityExecutions_drain__block_invoke_56_cold_1()
{
}

void __31__NetworkQualityExecutions_run__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - IdleLatencyURLSessionDelegate failed with an error: %@", v2, v3, v4, v5, 2u);
}

void __31__NetworkQualityExecutions_run__block_invoke_82_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - WorkingLatencyURLSessionDelegate failed with an error: %@", v2, v3, v4, v5, 2u);
}

void __31__NetworkQualityExecutions_run__block_invoke_96_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - WorkingLatencyURLSessionDelegate failed with an error: %@", v2, v3, v4, v5, 2u);
}

void __31__NetworkQualityExecutions_run__block_invoke_110_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - WorkingLatencyURLSessionDelegate failed with an error: %@", v2, v3, v4, v5, 2u);
}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - %@", v2, v3, v4, v5, 2u);
}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "-[NetworkQualityExecutions runWithCompletionHandler:]_block_invoke_2";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 925;
  *((_WORD *)buf + 9) = 2112;
  *(void *)(buf + 20) = a1;
  _os_log_error_impl(&dword_2192FE000, log, OS_LOG_TYPE_ERROR, "%s:%u - Timed-out resolving %@. Defaulting confURL", buf, 0x1Cu);
}

void __53__NetworkQualityExecutions_runWithCompletionHandler___block_invoke_134_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  [a2 statusCode];
  *(_DWORD *)double v7 = 136315906;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v7[7] = 962;
  v7[9] = 2048;
  uint64_t v8 = v6;
  __int16 v9 = 2048;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_2192FE000, v5, OS_LOG_TYPE_ERROR, "%s:%u - Either the HTTP response %lu or network data %p are invalid", (uint8_t *)v7, 0x26u);
}

- (void)execDLWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[NetworkQualityExecutions execDLWithCompletionHandler:]", "Executions.m", 1060, "self->dlDelegate == nil");
}

void __56__NetworkQualityExecutions_execDLWithCompletionHandler___block_invoke_171_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Test failed with an error: %@", v2, v3, v4, v5, 2u);
}

- (void)execULWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[NetworkQualityExecutions execULWithCompletionHandler:]", "Executions.m", 1130, "self->ulDelegate == nil");
}

void __56__NetworkQualityExecutions_execULWithCompletionHandler___block_invoke_177_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Test failed with an error: %@", v2, v3, v4, v5, 2u);
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_184_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Test failed with an error: %@", v2, v3, v4, v5, 2u);
}

void __62__NetworkQualityExecutions_execParallelWithCompletionHandler___block_invoke_186_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Test failed with an error: %@", v2, v3, v4, v5, 2u);
}

@end