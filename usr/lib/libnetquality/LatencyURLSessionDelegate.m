@interface LatencyURLSessionDelegate
- (BOOL)metExitCriteria;
- (LatencyURLSessionDelegate)initWithConfiguration:(id)a3 testName:(id)a4 queue:(id)a5 testEndpoint:(id)a6 resultsObject:(id)a7 resultsDelegate:(id)a8 tcpKey:(id)a9 tlsKey:(id)a10 reqrespKey:(id)a11 selfKey:(id)a12;
- (int)didFinishCollectingMetrics:(id)a3 task:(id)a4;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)cancel;
- (void)cancelWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)executeTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (void)shareProgress;
- (void)waitForSaturation:(id)a3;
@end

@implementation LatencyURLSessionDelegate

- (LatencyURLSessionDelegate)initWithConfiguration:(id)a3 testName:(id)a4 queue:(id)a5 testEndpoint:(id)a6 resultsObject:(id)a7 resultsDelegate:(id)a8 tcpKey:(id)a9 tlsKey:(id)a10 reqrespKey:(id)a11 selfKey:(id)a12
{
  id v41 = a3;
  id v40 = a4;
  id obj = a5;
  id v39 = a5;
  id v38 = a6;
  id v33 = a7;
  id v37 = a7;
  id v36 = a8;
  id v35 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  v42.receiver = self;
  v42.super_class = (Class)LatencyURLSessionDelegate;
  v21 = [(LatencyURLSessionDelegate *)&v42 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_config, a3);
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sessions = v22->_sessions;
    v22->_sessions = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    tasks = v22->_tasks;
    v22->_tasks = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    metrics = v22->_metrics;
    v22->_metrics = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    workingMetrics = v22->_workingMetrics;
    v22->_workingMetrics = v29;

    objc_storeStrong((id *)&v22->_queue, obj);
    objc_storeStrong((id *)&v22->_testEndpoint, a6);
    objc_storeStrong((id *)&v22->_results, v33);
    objc_storeStrong((id *)&v22->_execution, a8);
    objc_storeStrong((id *)&v22->_tcpKey, a9);
    objc_storeStrong((id *)&v22->_tlsKey, a10);
    objc_storeStrong((id *)&v22->_reqrespKey, a11);
    objc_storeStrong((id *)&v22->_selfKey, a12);
    objc_storeStrong((id *)&v22->_testName, a4);
    v22->_parallel = 8;
    v22->_exitCriteriaCounter = 0;
  }

  return v22;
}

- (void)executeTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[LatencyURLSessionDelegate executeTaskWithRequest:completionHandler:]", "LatencyURLSessionDelegate.m", 96, "0");
}

- (void)waitForSaturation:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[LatencyURLSessionDelegate waitForSaturation:]", "LatencyURLSessionDelegate.m", 102, "0");
}

- (BOOL)metExitCriteria
{
  return self->_exitCriteriaCounter > 3;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_error, a4);
    netqual_log_init();
    v8 = (void *)os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      -[LatencyURLSessionDelegate URLSession:didBecomeInvalidWithError:]((uint64_t)v7, (uint64_t)self, v8);
    }
  }
  [(NSMutableArray *)self->_sessions removeObject:v6];
  if (![(NSMutableArray *)self->_sessions count])
  {
    cancelCompletionHandler = (void (**)(id, id))self->_cancelCompletionHandler;
    if (cancelCompletionHandler) {
      cancelCompletionHandler[2](cancelCompletionHandler, v7);
    }
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  if ([(NetworkQualityConfiguration *)self->_config validateCertificate])
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x263F08BB8];
    v9 = [v11 protectionSpace];
    v10 = [v8 credentialForTrust:[v9 serverTrust]];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v10);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v12 = a5;
  v8 = (void (**)(id, uint64_t, void))a6;
  if ([(NetworkQualityConfiguration *)self->_config validateCertificate])
  {
    v8[2](v8, 1, 0);
  }
  else
  {
    v9 = (void *)MEMORY[0x263F08BB8];
    v10 = [v12 protectionSpace];
    id v11 = [v9 credentialForTrust:[v10 serverTrust]];
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v11);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  v19[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = (void (**)(id, void))a7;
  netqual_log_init();
  v13 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
    -[LatencyURLSessionDelegate URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:](v13, v11, v10);
  }
  id v14 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v18 = *MEMORY[0x263F08320];
  v19[0] = @"Unexpected redirect on latency measuring connection";
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v16 = (NSError *)[v14 initWithDomain:@"NetworkQualityErrorDomain" code:1003 userInfo:v15];
  error = self->_error;
  self->_error = v16;

  v12[2](v12, 0);
  if (!self->_canceled) {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (int)didFinishCollectingMetrics:(id)a3 task:(id)a4
{
  v72[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NetworkQualityExecutionsResult *)self->_results mutableURLSessionMetrics];
  id v9 = [v8 valueForKey:self->_testName];

  if (!v9)
  {
    id v10 = [v6 transactionMetrics];
    id v11 = [v10 firstObject];

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v12 = [(NetworkQualityExecutionsResult *)self->_results mutableURLSessionMetrics];
    [v12 setObject:v9 forKey:self->_testName];

    v13 = [(NetworkQualityResult *)self->_results interfaceName];

    if (!v13)
    {
      id v14 = [v11 _interfaceName];
      [(NetworkQualityResult *)self->_results setInterfaceName:v14];

      -[NetworkQualityResult setIsCellular:](self->_results, "setIsCellular:", [v11 isCellular]);
    }
  }
  if ((unint64_t)[v9 count] >= 0xB) {
    [v9 removeObjectAtIndex:0];
  }
  [v9 addObject:v6];
  if ([v6 redirectCount])
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      -[LatencyURLSessionDelegate didFinishCollectingMetrics:task:]();
    }
    id v15 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v71 = *MEMORY[0x263F08320];
    v72[0] = @"Unexpected redirect when collecting metrics";
    v16 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
    v17 = (NSError *)[v15 initWithDomain:@"NetworkQualityErrorDomain" code:1002 userInfo:v16];
    error = self->_error;
    self->_error = v17;

    if (self->_canceled) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  id v19 = [v6 transactionMetrics];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    if (self->_canceled) {
      goto LABEL_14;
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v31 = [v6 transactionMetrics];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v68 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      id v49 = v7;
      int v34 = 0;
      uint64_t v35 = *(void *)v51;
      while (2)
      {
        uint64_t v36 = 0;
        int v48 = v34 + v33;
        do
        {
          if (*(void *)v51 != v35) {
            objc_enumerationMutation(v31);
          }
          id v37 = [*(id *)(*((void *)&v50 + 1) + 8 * v36) response];
          uint64_t v38 = [v37 statusCode];

          if (v38 == 200)
          {

            int v21 = v34 + v36;
            goto LABEL_31;
          }
          ++v36;
        }
        while (v33 != v36);
        uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v68 count:16];
        int v34 = v48;
        if (v33) {
          continue;
        }
        break;
      }
      id v7 = v49;
    }
    else
    {
      uint64_t v38 = 0;
    }

    netqual_log_init();
    id v39 = (void *)os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
    {
      v45 = v39;
      v46 = [v6 transactionMetrics];
      v47 = [v46 firstObject];
      *(_DWORD *)buf = 136316418;
      v57 = "-[LatencyURLSessionDelegate didFinishCollectingMetrics:task:]";
      __int16 v58 = 1024;
      int v59 = 250;
      __int16 v60 = 2048;
      uint64_t v61 = v38;
      __int16 v62 = 2112;
      id v63 = v7;
      __int16 v64 = 2112;
      id v65 = v6;
      __int16 v66 = 2112;
      v67 = v47;
      _os_log_error_impl(&dword_2192FE000, v45, OS_LOG_TYPE_ERROR, "%s:%u - This should not happen - response status code is %ld on task %@ metrics %@ tMet %@", buf, 0x3Au);
    }
    id v40 = objc_alloc(MEMORY[0x263F087E8]);
    v54[0] = *MEMORY[0x263F08320];
    v54[1] = @"statusCode";
    v55[0] = @"Incorrect response status code on latency measuring connection";
    id v41 = [NSNumber numberWithInteger:v38];
    v55[1] = v41;
    objc_super v42 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
    v43 = (NSError *)[v40 initWithDomain:@"NetworkQualityErrorDomain" code:1003 userInfo:v42];
    v44 = self->_error;
    self->_error = v43;

LABEL_11:
    (*((void (**)(void))self->_completionHandler + 2))();
LABEL_14:
    int v21 = -1;
    goto LABEL_15;
  }
  netqual_log_init();
  v23 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
    -[LatencyURLSessionDelegate didFinishCollectingMetrics:task:]((uint64_t)self, (uint64_t)v7, v23);
  }
  id v49 = v7;
  id v24 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v25 = *MEMORY[0x263F08320];
  v70[0] = @"Unexpected number of transactionMetrics";
  v69[0] = v25;
  v69[1] = @"count";
  v26 = [NSNumber numberWithInteger:0];
  v70[1] = v26;
  v69[2] = @"canceled";
  v27 = [NSNumber numberWithBool:self->_canceled];
  v70[2] = v27;
  v28 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:3];
  v29 = (NSError *)[v24 initWithDomain:@"NetworkQualityErrorDomain" code:1002 userInfo:v28];
  v30 = self->_error;
  self->_error = v29;

  if (!self->_canceled) {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  int v21 = -1;
LABEL_31:
  id v7 = v49;
LABEL_15:

  return v21;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)LatencyURLSessionDelegate;
  [(LatencyURLSessionDelegate *)&v2 dealloc];
}

- (void)shareProgress
{
}

- (void)cancelWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  self->_canceled = 1;
  v4 = (void *)MEMORY[0x21D4880C0](a3, a2);
  id cancelCompletionHandler = self->_cancelCompletionHandler;
  self->_id cancelCompletionHandler = v4;

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  if ([(NSMutableArray *)self->_sessions count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_sessions;
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
    block[2] = __57__LatencyURLSessionDelegate_cancelWithCompletionHandler___block_invoke;
    block[3] = &unk_26439CF68;
    block[4] = self;
    dispatch_async(v12, block);
  }
}

uint64_t __57__LatencyURLSessionDelegate_cancelWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 88) + 16))();
}

- (void)cancel
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_selfKey, 0);
  objc_storeStrong((id *)&self->_reqrespKey, 0);
  objc_storeStrong((id *)&self->_tlsKey, 0);
  objc_storeStrong((id *)&self->_tcpKey, 0);
  objc_storeStrong((id *)&self->_execution, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_cancelCompletionHandler, 0);
  objc_storeStrong(&self->_saturationHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testEndpoint, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_workingMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_sessions, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

- (void)URLSession:(void *)a3 didBecomeInvalidWithError:.cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = *(void **)(a2 + 16);
  id v5 = a3;
  [v4 count];
  *(_DWORD *)id v7 = 136315906;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v7[7] = 119;
  v7[9] = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_2192FE000, v5, OS_LOG_TYPE_ERROR, "%s:%u - session completed with error: %@, count: %lu", (uint8_t *)v7, 0x26u);
}

- (void)URLSession:(void *)a3 task:willPerformHTTPRedirection:newRequest:completionHandler:.cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [a2 URL];
  id v7 = [a3 originalRequest];
  uint64_t v8 = [v7 URL];
  *(_DWORD *)uint64_t v10 = 136315906;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v10[7] = 163;
  v10[9] = 2112;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v9;
  _os_log_error_impl(&dword_2192FE000, v5, OS_LOG_TYPE_ERROR, "%s:%u - Unexpected redirect to %@ for %@", (uint8_t *)v10, 0x26u);
}

- (void)didFinishCollectingMetrics:(os_log_t)log task:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = *(unsigned __int8 *)(a1 + 160);
  int v4 = 136315906;
  id v5 = "-[LatencyURLSessionDelegate didFinishCollectingMetrics:task:]";
  __int16 v6 = 1024;
  int v7 = 213;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_2192FE000, log, OS_LOG_TYPE_ERROR, "%s:%u - Unexpected number of transactionMetrics | cancelled=%d on task %@", (uint8_t *)&v4, 0x22u);
}

- (void)didFinishCollectingMetrics:task:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - This should not happen - redirects should be caught by willPerformHTTPRedirection on task %@", v2, v3, v4, v5, 2u);
}

@end