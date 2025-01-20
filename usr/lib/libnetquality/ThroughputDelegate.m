@interface ThroughputDelegate
- (BOOL)checkLimits;
- (BOOL)metExitCriteria;
- (ThroughputDelegate)initWithExecution:(id)a3 testName:(id)a4 withQueue:(id)a5 testEndpoint:(id)a6 withConfig:(id)a7 resultsObject:(id)a8;
- (id)amendRequest:(id)a3;
- (id)createTaskWithRequest:(id)a3 session:(id)a4;
- (id)getSessions;
- (id)lastUpdate;
- (int)executeTaskWithRequest:(id)a3 saturationHandler:(id)a4 completionHandler:(id)a5;
- (unint64_t)maxFlows;
- (unint64_t)minFlows;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)addNewThroughputMeasurement:(unint64_t)a3;
- (void)addTasks;
- (void)cancel;
- (void)cancelWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)shareProgress;
- (void)updateResultsWithByteCount;
- (void)updateResultsWithFlowCount;
- (void)updateResultsWithThroughput:(int64_t)a3 confidence:(int64_t)a4;
@end

@implementation ThroughputDelegate

- (ThroughputDelegate)initWithExecution:(id)a3 testName:(id)a4 withQueue:(id)a5 testEndpoint:(id)a6 withConfig:(id)a7 resultsObject:(id)a8
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id obj = a6;
  id v17 = a6;
  id v18 = a7;
  id v42 = a8;
  id v19 = a8;
  v44.receiver = self;
  v44.super_class = (Class)ThroughputDelegate;
  v20 = [(ThroughputDelegate *)&v44 init];
  if (v20)
  {
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sessions = v20->_sessions;
    v20->_sessions = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    probeSessions = v20->_probeSessions;
    v20->_probeSessions = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    tasks = v20->_tasks;
    v20->_tasks = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uploadStream = v20->_uploadStream;
    v20->_uploadStream = v27;

    objc_storeStrong((id *)&v20->_nqConfig, a7);
    start = v20->_start;
    v20->_start = 0;

    v30 = [[ThroughputSaturationDetection alloc] initWithConfig:v18];
    saturation = v20->_saturation;
    v20->_saturation = v30;

    v20->_saturation_reached = 0;
    objc_storeStrong((id *)&v20->_queue, a5);
    objc_storeStrong((id *)&v20->_testEndpoint, obj);
    int v32 = instance_id++;
    v20->_int instanceId = v32;
    objc_storeStrong((id *)&v20->_results, v42);
    objc_storeStrong((id *)&v20->_execution, a3);
    objc_storeStrong((id *)&v20->_testName, a4);
    uint64_t v33 = [MEMORY[0x263EFF910] now];
    lastUpdate = v20->_lastUpdate;
    v20->_lastUpdate = (NSDate *)v33;

    netqual_log_init();
    v35 = (void *)os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      int instanceId = v20->_instanceId;
      testName = v20->_testName;
      v38 = v35;
      uint64_t v39 = [(NSString *)testName UTF8String];
      *(_DWORD *)buf = 136315906;
      v46 = "-[ThroughputDelegate initWithExecution:testName:withQueue:testEndpoint:withConfig:resultsObject:]";
      __int16 v47 = 1024;
      int v48 = 98;
      __int16 v49 = 1024;
      int v50 = instanceId;
      __int16 v51 = 2080;
      uint64_t v52 = v39;
      _os_log_impl(&dword_2192FE000, v38, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] - created Throughput instance with name %s", buf, 0x22u);
    }
  }

  return v20;
}

- (id)lastUpdate
{
  return self->_lastUpdate;
}

- (id)getSessions
{
  return self->_probeSessions;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v13 = a5;
  v6 = [(NetworkQualityExecutionsResult *)self->_results mutableURLSessionMetrics];
  id v7 = [v6 valueForKey:self->_testName];

  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    v8 = [(NetworkQualityExecutionsResult *)self->_results mutableURLSessionMetrics];
    [v8 setObject:v7 forKey:self->_testName];

    v9 = [v13 transactionMetrics];
    v10 = [v9 firstObject];

    v11 = [(NetworkQualityResult *)self->_results interfaceName];

    if (!v11)
    {
      v12 = [v10 _interfaceName];
      [(NetworkQualityResult *)self->_results setInterfaceName:v12];

      -[NetworkQualityResult setIsCellular:](self->_results, "setIsCellular:", [v10 isCellular]);
    }
  }
  [v7 addObject:v13];
}

- (void)dealloc
{
  tasks = self->_tasks;
  self->_tasks = 0;

  sessions = self->_sessions;
  self->_sessions = 0;

  probeSessions = self->_probeSessions;
  self->_probeSessions = 0;

  v6.receiver = self;
  v6.super_class = (Class)ThroughputDelegate;
  [(ThroughputDelegate *)&v6 dealloc];
}

- (void)addTasks
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (self->_canceled) {
    return;
  }
  if (self->_exitCriteriaMet) {
    return;
  }
  unint64_t v3 = [(NSMutableArray *)self->_tasks count];
  if (v3 >= [(ThroughputDelegate *)self maxFlows]) {
    return;
  }
  if ([(NSMutableArray *)self->_tasks count])
  {
    int v4 = 1;
    goto LABEL_7;
  }
  int v4 = [(ThroughputDelegate *)self minFlows];
  if (v4 >= 1)
  {
LABEL_7:
    int v21 = v4;
    do
    {
      uint64_t v5 = [(NSMutableArray *)self->_tasks count];
      if (v5 == [(ThroughputDelegate *)self maxFlows] || self->_exitCriteriaMet) {
        break;
      }
      objc_super v6 = [(NetworkQualityExecutions *)self->_execution createDefaultNSURLSessionConfiguration];
      id v7 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v6 delegate:self delegateQueue:self->_queue];
      [(NSMutableArray *)self->_sessions addObject:v7];
      v8 = [(ThroughputDelegate *)self createTaskWithRequest:self->_request session:v7];
      [v8 set_hostOverride:self->_testEndpoint];
      [(NSMutableArray *)self->_tasks addObject:v8];
      netqual_log_init();
      v9 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        int instanceId = self->_instanceId;
        request = self->_request;
        *(_DWORD *)buf = 136316418;
        v24 = "-[ThroughputDelegate addTasks]";
        __int16 v25 = 1024;
        int v26 = 171;
        __int16 v27 = 1024;
        int v28 = instanceId;
        __int16 v29 = 2112;
        *(void *)v30 = v8;
        *(_WORD *)&v30[8] = 2112;
        *(void *)&v30[10] = v7;
        *(_WORD *)&v30[18] = 2112;
        *(void *)&v30[20] = request;
        _os_log_impl(&dword_2192FE000, v9, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] - added task %@ to %@ for %@", buf, 0x36u);
      }
      [v8 resume];

      --v4;
    }
    while (v4);
    int v4 = v21;
  }
  [(ThroughputDelegate *)self updateResultsWithFlowCount];
  netqual_log_init();
  v12 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = self->_instanceId;
    if (v4 <= 1) {
      id v14 = (const char *)&unk_21931AF3B;
    }
    else {
      id v14 = "s";
    }
    int v15 = v4;
    tasks = self->_tasks;
    id v17 = v12;
    uint64_t v18 = [(NSMutableArray *)tasks count];
    *(_DWORD *)buf = 136316418;
    v24 = "-[ThroughputDelegate addTasks]";
    __int16 v25 = 1024;
    int v26 = 178;
    __int16 v27 = 1024;
    int v28 = v13;
    __int16 v29 = 1024;
    *(_DWORD *)v30 = v15;
    *(_WORD *)&v30[4] = 2080;
    *(void *)&v30[6] = v14;
    *(_WORD *)&v30[14] = 2048;
    *(void *)&v30[16] = v18;
    _os_log_impl(&dword_2192FE000, v17, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Added %u more task%s, now %lu", buf, 0x32u);
  }
  dispatch_time_t v19 = dispatch_time(0, 1000000000);
  v20 = [(NSOperationQueue *)self->_queue underlyingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__ThroughputDelegate_addTasks__block_invoke;
  block[3] = &unk_26439CF68;
  block[4] = self;
  dispatch_after(v19, v20, block);
}

uint64_t __30__ThroughputDelegate_addTasks__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addTasks];
  v2 = *(void **)(a1 + 32);

  return [v2 shareProgress];
}

- (id)createTaskWithRequest:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)amendRequest:(id)a3
{
  id v3 = a3;

  return v3;
}

- (int)executeTaskWithRequest:(id)a3 saturationHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x263EFF910];
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 date];
  objc_storeStrong((id *)&self->_start, v12);
  objc_storeStrong((id *)&self->_current, self->_start);
  id v13 = (void *)MEMORY[0x21D4880C0](v11);

  id saturationHandler = self->_saturationHandler;
  self->_id saturationHandler = v13;

  int v15 = (void *)MEMORY[0x21D4880C0](v10);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v15;

  id v17 = [(ThroughputDelegate *)self amendRequest:v8];
  request = self->_request;
  self->_request = v17;

  netqual_log_init();
  dispatch_time_t v19 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    int instanceId = self->_instanceId;
    int v22 = 136315906;
    v23 = "-[ThroughputDelegate executeTaskWithRequest:saturationHandler:completionHandler:]";
    __int16 v24 = 1024;
    int v25 = 215;
    __int16 v26 = 1024;
    int v27 = instanceId;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_2192FE000, v19, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Starting ... request: %@", (uint8_t *)&v22, 0x22u);
  }
  [(ThroughputDelegate *)self addTasks];

  return 0;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  netqual_log_init();
  id v8 = os_log_netqual;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    {
      int instanceId = self->_instanceId;
      int v12 = 136316162;
      id v13 = "-[ThroughputDelegate URLSession:didBecomeInvalidWithError:]";
      __int16 v14 = 1024;
      int v15 = 225;
      __int16 v16 = 1024;
      int v17 = instanceId;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_error_impl(&dword_2192FE000, v8, OS_LOG_TYPE_ERROR, "%s:%u - [%d] Closing session %@ with error %@", (uint8_t *)&v12, 0x2Cu);
    }
  }
  else if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = self->_instanceId;
    int v12 = 136315906;
    id v13 = "-[ThroughputDelegate URLSession:didBecomeInvalidWithError:]";
    __int16 v14 = 1024;
    int v15 = 227;
    __int16 v16 = 1024;
    int v17 = v10;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_2192FE000, v8, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Closing session %@", (uint8_t *)&v12, 0x22u);
  }
  [(NSMutableArray *)self->_sessions removeObject:v6];
  [(NSMutableArray *)self->_probeSessions removeObject:v6];
  if (![(NSMutableArray *)self->_sessions count])
  {
    cancelCompletionHandler = (void (**)(id, id))self->_cancelCompletionHandler;
    if (cancelCompletionHandler) {
      cancelCompletionHandler[2](cancelCompletionHandler, v7);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v10)
  {
LABEL_4:
    BOOL v14 = v11 != 0;
    netqual_log_init();
    int v15 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
    {
      int instanceId = self->_instanceId;
      int v22 = 136316418;
      v23 = "-[ThroughputDelegate URLSession:task:didCompleteWithError:]";
      __int16 v24 = 1024;
      int v25 = 247;
      __int16 v26 = 1024;
      int v27 = instanceId;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v8;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      _os_log_impl(&dword_2192FE000, v15, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Closing task %@ of session %@ with error %@", (uint8_t *)&v22, 0x36u);
    }
    goto LABEL_10;
  }
  int v12 = [v10 domain];
  if ([v12 isEqualToString:*MEMORY[0x263F08570]])
  {
    uint64_t v13 = [v11 code];

    if (v13 == -999) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  netqual_log_init();
  int v17 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
  {
    int v21 = self->_instanceId;
    int v22 = 136316418;
    v23 = "-[ThroughputDelegate URLSession:task:didCompleteWithError:]";
    __int16 v24 = 1024;
    int v25 = 245;
    __int16 v26 = 1024;
    int v27 = v21;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    uint64_t v33 = v11;
    _os_log_error_impl(&dword_2192FE000, v17, OS_LOG_TYPE_ERROR, "%s:%u - [%d] Force-closing task %@ of session %@ with error %@", (uint8_t *)&v22, 0x36u);
  }
  BOOL v14 = 0;
LABEL_10:
  [(NSMutableArray *)self->_tasks removeObject:v9];
  if (!v11 || v14)
  {
    if (![(NSMutableArray *)self->_tasks count])
    {
      netqual_log_init();
      id v19 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = self->_instanceId;
        int v22 = 136315650;
        v23 = "-[ThroughputDelegate URLSession:task:didCompleteWithError:]";
        __int16 v24 = 1024;
        int v25 = 271;
        __int16 v26 = 1024;
        int v27 = v20;
        _os_log_impl(&dword_2192FE000, v19, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] Reaching completion", (uint8_t *)&v22, 0x18u);
      }
      __int16 v18 = (void (*)(void))*((void *)self->_completionHandler + 2);
      goto LABEL_20;
    }
  }
  else
  {
    if (!self->_error) {
      objc_storeStrong((id *)&self->_error, a5);
    }
    if (!self->_canceled)
    {
      objc_storeStrong((id *)&self->_error, a5);
      __int16 v18 = (void (*)(void))*((void *)self->_completionHandler + 2);
LABEL_20:
      v18();
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  v19[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (void (**)(id, uint64_t))a6;
  if ([v8 statusCode] == 200)
  {
    v9[2](v9, 1);
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"Expected HTTP status code 200, got %lu", [v8 statusCode]];
    netqual_log_init();
    id v11 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      -[ThroughputDelegate URLSession:dataTask:didReceiveResponse:completionHandler:]((uint64_t)v10, v11);
    }
    int v17 = (void *)MEMORY[0x263F087E8];
    v18[0] = @"statusCode";
    int v12 = [NSNumber numberWithInteger:[v8 statusCode]];
    uint64_t v13 = [v12 stringValue];
    v19[0] = v13;
    v18[1] = @"URL";
    BOOL v14 = [(NSURLRequest *)self->_request URL];
    v18[2] = *MEMORY[0x263F08320];
    v19[1] = v14;
    v19[2] = v10;
    int v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    __int16 v16 = [v17 errorWithDomain:@"NetworkQualityErrorDomain" code:1003 userInfo:v15];

    if (!self->_canceled)
    {
      objc_storeStrong((id *)&self->_error, v16);
      if (!self->_error) {
        objc_storeStrong((id *)&self->_error, v16);
      }
      (*((void (**)(void))self->_completionHandler + 2))();
    }
    v9[2](v9, 0);
  }
}

- (void)addNewThroughputMeasurement:(unint64_t)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  self->_currentBytesTransferred += a3;
  [(ThroughputDelegate *)self updateResultsWithByteCount];
  if (![(ThroughputDelegate *)self checkLimits])
  {
    current = self->_current;
    self->_byte_accumulator += a3;
    [v5 timeIntervalSinceDate:current];
    double v8 = v7;
    if (v7 >= 0.2)
    {
      uint64_t v9 = (uint64_t)((double)(8 * self->_byte_accumulator) / v7);
      netqual_log_init();
      id v10 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEBUG))
      {
        int instanceId = self->_instanceId;
        saturation = self->_saturation;
        v23 = v10;
        [(SaturationDetection *)saturation getAverage];
        int64_t currentBytesTransferred = self->_currentBytesTransferred;
        int64_t byte_accumulator = self->_byte_accumulator;
        int v27 = 136316930;
        __int16 v28 = "-[ThroughputDelegate addNewThroughputMeasurement:]";
        __int16 v29 = 1024;
        int v30 = 342;
        __int16 v31 = 1024;
        int v32 = instanceId;
        __int16 v33 = 2048;
        double v34 = (double)v9 * 0.000000953674316;
        __int16 v35 = 2048;
        double v36 = v25 * 0.000000953674316;
        __int16 v37 = 2048;
        int64_t v38 = currentBytesTransferred;
        __int16 v39 = 2048;
        int64_t v40 = byte_accumulator;
        __int16 v41 = 2048;
        double v42 = v8;
        _os_log_debug_impl(&dword_2192FE000, v23, OS_LOG_TYPE_DEBUG, "%s:%u - [%d] throughput is now: %.3f Mbps avg %.3f Mbps at %ld bytes transferred, accumulated %ld over %.3f seconds", (uint8_t *)&v27, 0x4Au);
      }
      self->_int64_t byte_accumulator = 0;
      objc_storeStrong((id *)&self->_current, v5);
      *(float *)&double v11 = (float)v9;
      if ([(SaturationDetection *)self->_saturation add:v11] && !self->_saturation_reached)
      {
        netqual_log_init();
        uint64_t v13 = (void *)os_log_netqual;
        if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = self->_instanceId;
          int v15 = self->_saturation;
          __int16 v16 = v13;
          [(SaturationDetection *)v15 getSaturation];
          int v27 = 136316162;
          int64_t v18 = self->_currentBytesTransferred;
          __int16 v28 = "-[ThroughputDelegate addNewThroughputMeasurement:]";
          __int16 v29 = 1024;
          int v30 = 348;
          __int16 v31 = 1024;
          int v32 = v14;
          __int16 v33 = 2048;
          double v34 = v17 * 0.000000953674316;
          __int16 v35 = 2048;
          double v36 = *(double *)&v18;
          _os_log_impl(&dword_2192FE000, v16, OS_LOG_TYPE_DEFAULT, "%s:%u - [%d] achieved saturation at %.3f Mbps with %ld bytes", (uint8_t *)&v27, 0x2Cu);
        }
        self->_saturation_reached = 1;
        [(SaturationDetection *)self->_saturation getSaturation];
        [(ThroughputDelegate *)self updateResultsWithThroughput:(uint64_t)v19 confidence:3];
        id saturationHandler = (void (**)(void))self->_saturationHandler;
        if (saturationHandler) {
          saturationHandler[2]();
        }
      }
      else
      {
        [(SaturationDetection *)self->_saturation getAverage];
        [(ThroughputDelegate *)self updateResultsWithThroughput:(uint64_t)v12 confidence:2];
        [(ThroughputDelegate *)self shareProgress];
      }
    }
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v11 = a4;
  double v7 = (void (**)(id, uint64_t, void))a5;
  if ([(NetworkQualityConfiguration *)self->_nqConfig validateCertificate])
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    double v8 = (void *)MEMORY[0x263F08BB8];
    uint64_t v9 = [v11 protectionSpace];
    id v10 = [v8 credentialForTrust:[v9 serverTrust]];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v10);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v12 = a5;
  double v8 = (void (**)(id, uint64_t, void))a6;
  if ([(NetworkQualityConfiguration *)self->_nqConfig validateCertificate])
  {
    v8[2](v8, 1, 0);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263F08BB8];
    id v10 = [v12 protectionSpace];
    id v11 = [v9 credentialForTrust:[v10 serverTrust]];
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v11);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = (void (**)(id, void))a7;
  netqual_log_init();
  uint64_t v13 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
  {
    int instanceId = self->_instanceId;
    int v15 = v13;
    __int16 v16 = [v11 URL];
    float v17 = [v10 originalRequest];
    int64_t v18 = [v17 URL];
    int v19 = 136316162;
    int v20 = "-[ThroughputDelegate URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:]";
    __int16 v21 = 1024;
    int v22 = 389;
    __int16 v23 = 1024;
    int v24 = instanceId;
    __int16 v25 = 2112;
    __int16 v26 = v16;
    __int16 v27 = 2112;
    __int16 v28 = v18;
    _os_log_error_impl(&dword_2192FE000, v15, OS_LOG_TYPE_ERROR, "%s:%u - [%d] Unexpected redirect to %@ for %@", (uint8_t *)&v19, 0x2Cu);
  }
  v12[2](v12, 0);
}

- (BOOL)metExitCriteria
{
  return self->_exitCriteriaMet && !self->_saturation_reached;
}

- (void)cancelWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  self->_canceled = 1;
  int v4 = (void *)MEMORY[0x21D4880C0](a3, a2);
  id cancelCompletionHandler = self->_cancelCompletionHandler;
  self->_id cancelCompletionHandler = v4;

  id saturationHandler = self->_saturationHandler;
  self->_id saturationHandler = 0;

  if ([(NSMutableArray *)self->_sessions count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v7 = self->_sessions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v11++) invalidateAndCancel];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else if (self->_cancelCompletionHandler)
  {
    id v12 = [(NSOperationQueue *)self->_queue underlyingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__ThroughputDelegate_cancelWithCompletionHandler___block_invoke;
    block[3] = &unk_26439CF68;
    block[4] = self;
    dispatch_async(v12, block);
  }
}

uint64_t __50__ThroughputDelegate_cancelWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 136) + 16))();
}

- (void)cancel
{
}

- (void)shareProgress
{
}

- (void)updateResultsWithFlowCount
{
}

- (void)updateResultsWithByteCount
{
}

- (void)updateResultsWithThroughput:(int64_t)a3 confidence:(int64_t)a4
{
}

- (BOOL)checkLimits
{
}

- (unint64_t)minFlows
{
}

- (unint64_t)maxFlows
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_execution, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_saturationHandler, 0);
  objc_storeStrong(&self->_cancelCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testEndpoint, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_saturation, 0);
  objc_storeStrong((id *)&self->_nqConfig, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_uploadStream, 0);
  objc_storeStrong((id *)&self->_probeSessions, 0);
  objc_storeStrong((id *)&self->_sessions, 0);

  objc_storeStrong((id *)&self->_tasks, 0);
}

- (void)URLSession:(uint64_t)a1 dataTask:(NSObject *)a2 didReceiveResponse:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  id v3 = "-[ThroughputDelegate URLSession:dataTask:didReceiveResponse:completionHandler:]";
  __int16 v4 = 1024;
  int v5 = 289;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_2192FE000, a2, OS_LOG_TYPE_ERROR, "%s:%u - %@", (uint8_t *)&v2, 0x1Cu);
}

@end