@interface WorkingLatencyURLSessionDelegate
- (BOOL)checkLimits;
- (WorkingLatencyURLSessionDelegate)initWithConfiguration:(id)a3 testName:(id)a4 queue:(id)a5 testEndpoint:(id)a6 resultsObject:(id)a7 resultsDelegate:(id)a8 urlSessions:(id)a9 tcpKey:(id)a10 tlsKey:(id)a11 reqrespKey:(id)a12 selfKey:(id)a13;
- (int64_t)currentResponsivenessConfidenceValue;
- (int64_t)getProbeTimeout;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)executeTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (void)isDownlinkTest;
- (void)scheduleNewTaskForeign;
- (void)scheduleNewTaskSelf;
- (void)waitForSaturation:(id)a3;
@end

@implementation WorkingLatencyURLSessionDelegate

- (WorkingLatencyURLSessionDelegate)initWithConfiguration:(id)a3 testName:(id)a4 queue:(id)a5 testEndpoint:(id)a6 resultsObject:(id)a7 resultsDelegate:(id)a8 urlSessions:(id)a9 tcpKey:(id)a10 tlsKey:(id)a11 reqrespKey:(id)a12 selfKey:(id)a13
{
  id v19 = a3;
  id v55 = a9;
  v56.receiver = self;
  v56.super_class = (Class)WorkingLatencyURLSessionDelegate;
  v20 = [(LatencyURLSessionDelegate *)&v56 initWithConfiguration:v19 testName:a4 queue:a5 testEndpoint:a6 resultsObject:a7 resultsDelegate:a8 tcpKey:a10 tlsKey:a11 reqrespKey:a12 selfKey:a13];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workingSessions, a9);
    v21->_probeLoadConnections = 1;
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    tcpTmpArray = v21->_tcpTmpArray;
    v21->_tcpTmpArray = v22;

    v24 = [TrimmedMean alloc];
    unint64_t v25 = (unint64_t)((double)[(NetworkQualityConfiguration *)v21->super._config movingAveragePeriod]/ 0.2);
    *(float *)&double v26 = (float)[(NetworkQualityConfiguration *)v21->super._config trimmedMeanThreshold]/ 100.0;
    uint64_t v27 = [(TrimmedMean *)v24 initWithSize:v25 withTrimAt:v26];
    tcpTrim = v21->_tcpTrim;
    v21->_tcpTrim = (TrimmedMean *)v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    tlsTmpArray = v21->_tlsTmpArray;
    v21->_tlsTmpArray = v29;

    v31 = [TrimmedMean alloc];
    unint64_t v32 = (unint64_t)((double)[(NetworkQualityConfiguration *)v21->super._config movingAveragePeriod]/ 0.2);
    *(float *)&double v33 = (float)[(NetworkQualityConfiguration *)v21->super._config trimmedMeanThreshold]/ 100.0;
    uint64_t v34 = [(TrimmedMean *)v31 initWithSize:v32 withTrimAt:v33];
    tlsTrim = v21->_tlsTrim;
    v21->_tlsTrim = (TrimmedMean *)v34;

    v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    h2TmpArray = v21->_h2TmpArray;
    v21->_h2TmpArray = v36;

    v38 = [TrimmedMean alloc];
    unint64_t v39 = (unint64_t)((double)[(NetworkQualityConfiguration *)v21->super._config movingAveragePeriod]/ 0.2);
    *(float *)&double v40 = (float)[(NetworkQualityConfiguration *)v21->super._config trimmedMeanThreshold]/ 100.0;
    uint64_t v41 = [(TrimmedMean *)v38 initWithSize:v39 withTrimAt:v40];
    h2Trim = v21->_h2Trim;
    v21->_h2Trim = (TrimmedMean *)v41;

    v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    selfTmpArray = v21->_selfTmpArray;
    v21->_selfTmpArray = v43;

    v45 = [TrimmedMean alloc];
    unint64_t v46 = (unint64_t)((double)[(NetworkQualityConfiguration *)v21->super._config movingAveragePeriod]/ 0.2);
    *(float *)&double v47 = (float)[(NetworkQualityConfiguration *)v21->super._config trimmedMeanThreshold]/ 100.0;
    uint64_t v48 = [(TrimmedMean *)v45 initWithSize:v46 withTrimAt:v47];
    selfTrim = v21->_selfTrim;
    v21->_selfTrim = (TrimmedMean *)v48;

    v50 = [[LatencySaturationDetection alloc] initWithConfig:v19];
    saturation = v21->_saturation;
    v21->_saturation = v50;

    v21->_saturation_reached = 0;
    v21->_exit_value = 60000.0 / (float)[v19 latencyCriteria];
    uint64_t v52 = [MEMORY[0x263EFF910] now];
    start = v21->_start;
    v21->_start = (NSDate *)v52;

    objc_storeStrong((id *)&v21->_current, v21->_start);
  }

  return v21;
}

- (int64_t)getProbeTimeout
{
  uint64_t v3 = [(NetworkQualityExecutions *)self->super._execution currentThroughput];
  if (![(NetworkQualityExecutions *)self->super._execution currentThroughput]) {
    return 1000000000;
  }
  float v4 = 24000.0 / (float)((float)((float)v3 * 5.0) / 100.0);
  if (v4 > 1.0) {
    float v4 = 1.0;
  }
  float v5 = v4 * 1000000000.0;
  BOOL v6 = v4 < 0.04;
  float v7 = 40000000.0;
  if (!v6) {
    return (uint64_t)v5;
  }
  return (uint64_t)v7;
}

- (void)scheduleNewTaskSelf
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!self->super._canceled && self->_probeLoadConnections)
  {
    if ([(NSMutableArray *)self->_workingSessions count]
      && (unint64_t)[(NSMutableArray *)self->super._tasks count] <= 0x32
      && (unint64_t)[(NSMutableArray *)self->super._sessions count] < 0x33)
    {
      float v5 = [(NSMutableArray *)self->_workingSessions objectAtIndex:arc4random_uniform([(NSMutableArray *)self->_workingSessions count])];
      BOOL v6 = [v5 dataTaskWithRequest:self->super._request];
      [v6 setDelegate:self];
      [v6 set_hostOverride:self->super._testEndpoint];
      [(NSMutableArray *)self->super._tasks addObject:v6];
      unint64_t v7 = [(WorkingLatencyURLSessionDelegate *)self getProbeTimeout];
      netqual_log_init();
      v8 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        tasks = self->super._tasks;
        v10 = v8;
        LODWORD(tasks) = [(NSMutableArray *)tasks count];
        int v11 = [(NSMutableArray *)self->super._sessions count];
        *(_DWORD *)buf = 136316674;
        v17 = "-[WorkingLatencyURLSessionDelegate scheduleNewTaskSelf]";
        __int16 v18 = 1024;
        int v19 = 780;
        __int16 v20 = 2112;
        v21 = v6;
        __int16 v22 = 2112;
        v23 = v5;
        __int16 v24 = 1024;
        int v25 = (int)tasks;
        __int16 v26 = 1024;
        int v27 = v11;
        __int16 v28 = 2048;
        unint64_t v29 = v7 / 0xF4240;
        _os_log_impl(&dword_2192FE000, v10, OS_LOG_TYPE_DEFAULT, "%s:%u - Created Self WorkingLatencyTask %@ on session %@, task-count %u session-count %u next in %llu ms", buf, 0x3Cu);
      }
      [v6 resume];
      dispatch_time_t v12 = dispatch_time(0, v7);
      v13 = [(NSOperationQueue *)self->super._queue underlyingQueue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __55__WorkingLatencyURLSessionDelegate_scheduleNewTaskSelf__block_invoke_240;
      v14[3] = &unk_26439CF68;
      v14[4] = self;
      dispatch_after(v12, v13, v14);
    }
    else
    {
      dispatch_time_t v3 = dispatch_time(0, [(WorkingLatencyURLSessionDelegate *)self getProbeTimeout]);
      float v4 = [(NSOperationQueue *)self->super._queue underlyingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__WorkingLatencyURLSessionDelegate_scheduleNewTaskSelf__block_invoke;
      block[3] = &unk_26439CF68;
      block[4] = self;
      dispatch_after(v3, v4, block);
    }
  }
}

uint64_t __55__WorkingLatencyURLSessionDelegate_scheduleNewTaskSelf__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleNewTaskSelf];
}

uint64_t __55__WorkingLatencyURLSessionDelegate_scheduleNewTaskSelf__block_invoke_240(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleNewTaskSelf];
}

- (void)scheduleNewTaskForeign
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!self->super._canceled)
  {
    if ((unint64_t)[(NSMutableArray *)self->super._tasks count] <= 0x32
      && (unint64_t)[(NSMutableArray *)self->super._sessions count] < 0x33)
    {
      float v5 = [(NetworkQualityExecutions *)self->super._execution createDefaultNSURLSessionConfiguration];
      BOOL v6 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v5 delegate:self delegateQueue:self->super._queue];
      [(NSMutableArray *)self->super._sessions addObject:v6];
      unint64_t v7 = [v6 dataTaskWithRequest:self->super._request];
      [v7 setDelegate:self];
      [v7 set_hostOverride:self->super._testEndpoint];
      [(NSMutableArray *)self->super._tasks addObject:v7];
      unint64_t v8 = [(WorkingLatencyURLSessionDelegate *)self getProbeTimeout];
      netqual_log_init();
      v9 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        tasks = self->super._tasks;
        int v11 = v9;
        LODWORD(tasks) = [(NSMutableArray *)tasks count];
        int v12 = [(NSMutableArray *)self->super._sessions count];
        *(_DWORD *)buf = 136316674;
        __int16 v18 = "-[WorkingLatencyURLSessionDelegate scheduleNewTaskForeign]";
        __int16 v19 = 1024;
        int v20 = 817;
        __int16 v21 = 2112;
        __int16 v22 = v7;
        __int16 v23 = 2112;
        __int16 v24 = v6;
        __int16 v25 = 1024;
        int v26 = (int)tasks;
        __int16 v27 = 1024;
        int v28 = v12;
        __int16 v29 = 2048;
        unint64_t v30 = v8 / 0xF4240;
        _os_log_impl(&dword_2192FE000, v11, OS_LOG_TYPE_DEFAULT, "%s:%u - Created Foreign WorkingLatencyTask %@ on session %@, task-count %u session-count %u next in %llu ms", buf, 0x3Cu);
      }
      [v7 resume];
      dispatch_time_t v13 = dispatch_time(0, v8);
      v14 = [(NSOperationQueue *)self->super._queue underlyingQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __58__WorkingLatencyURLSessionDelegate_scheduleNewTaskForeign__block_invoke_241;
      v15[3] = &unk_26439CF68;
      v15[4] = self;
      dispatch_after(v13, v14, v15);
    }
    else
    {
      dispatch_time_t v3 = dispatch_time(0, [(WorkingLatencyURLSessionDelegate *)self getProbeTimeout]);
      float v4 = [(NSOperationQueue *)self->super._queue underlyingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__WorkingLatencyURLSessionDelegate_scheduleNewTaskForeign__block_invoke;
      block[3] = &unk_26439CF68;
      block[4] = self;
      dispatch_after(v3, v4, block);
    }
  }
}

uint64_t __58__WorkingLatencyURLSessionDelegate_scheduleNewTaskForeign__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleNewTaskForeign];
}

uint64_t __58__WorkingLatencyURLSessionDelegate_scheduleNewTaskForeign__block_invoke_241(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleNewTaskForeign];
}

- (void)executeTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  BOOL v6 = (NSURLRequest *)a3;
  unint64_t v7 = (void *)MEMORY[0x21D4880C0](a4);
  id completionHandler = self->super._completionHandler;
  self->super._id completionHandler = v7;

  request = self->super._request;
  self->super._request = v6;
  v10 = v6;

  dispatch_time_t v11 = dispatch_time(0, [(WorkingLatencyURLSessionDelegate *)self getProbeTimeout]);
  int v12 = [(NSOperationQueue *)self->super._queue underlyingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__WorkingLatencyURLSessionDelegate_executeTaskWithRequest_completionHandler___block_invoke;
  block[3] = &unk_26439CF68;
  block[4] = self;
  dispatch_after(v11, v12, block);

  dispatch_time_t v13 = dispatch_time(0, [(WorkingLatencyURLSessionDelegate *)self getProbeTimeout]);
  v14 = [(NSOperationQueue *)self->super._queue underlyingQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__WorkingLatencyURLSessionDelegate_executeTaskWithRequest_completionHandler___block_invoke_2;
  v15[3] = &unk_26439CF68;
  v15[4] = self;
  dispatch_after(v13, v14, v15);
}

uint64_t __77__WorkingLatencyURLSessionDelegate_executeTaskWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleNewTaskForeign];
}

uint64_t __77__WorkingLatencyURLSessionDelegate_executeTaskWithRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleNewTaskSelf];
}

- (void)waitForSaturation:(id)a3
{
  self->super._saturationHandler = (id)MEMORY[0x21D4880C0](a3, a2);

  MEMORY[0x270F9A758]();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(NSMutableArray *)self->super._tasks removeObject:a4];
  if (!self->super._canceled)
  {
    if ([(NSMutableArray *)self->super._sessions indexOfObject:v8] != 0x7FFFFFFFFFFFFFFFLL) {
      [v8 invalidateAndCancel];
    }
    if (v9)
    {
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
        -[WorkingLatencyURLSessionDelegate URLSession:task:didCompleteWithError:]();
      }
      if (!self->super._canceled)
      {
        objc_storeStrong((id *)&self->super._error, a5);
        (*((void (**)(void))self->super._completionHandler + 2))();
      }
    }
  }
}

- (void)isDownlinkTest
{
  self->isDownlink = 1;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v195 = *MEMORY[0x263EF8340];
  double v8 = COERCE_DOUBLE(a3);
  id v9 = a4;
  id v10 = a5;
  if (!self->_saturation_reached && ![(WorkingLatencyURLSessionDelegate *)self checkLimits])
  {
    int v11 = [(LatencyURLSessionDelegate *)self didFinishCollectingMetrics:v10 task:v9];
    if ((v11 & 0x80000000) == 0)
    {
      unsigned int v12 = v11;
      dispatch_time_t v13 = [v10 transactionMetrics];
      v164 = [v13 objectAtIndex:v12];

      if ([(NSMutableArray *)self->_workingSessions indexOfObject:*(void *)&v8] != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (([v164 isReusedConnection] & 1) == 0)
        {
          netqual_log_init();
          double v33 = os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&uint8_t buf[4] = "-[WorkingLatencyURLSessionDelegate URLSession:task:didFinishCollectingMetrics:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 905;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = "-[WorkingLatencyURLSessionDelegate URLSession:task:didFinishCollectingMetrics:]";
            *(_WORD *)&buf[28] = 2112;
            *(void *)&buf[30] = v9;
            *(_WORD *)&buf[38] = 2112;
            double v186 = v8;
            _os_log_impl(&dword_2192FE000, v33, OS_LOG_TYPE_DEFAULT, "%s:%u - %s - request for task %@ was not reused on session %@", buf, 0x30u);
          }
          self->_probeLoadConnections = 0;
          goto LABEL_109;
        }
        if (!self->_probeLoadConnections)
        {
LABEL_109:

          goto LABEL_110;
        }
      }
      if ([(NSMutableArray *)self->super._sessions indexOfObject:*(void *)&v8] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v159 = self->super._selfKey;
        selfTmpArray = self->_selfTmpArray;
        v15 = NSNumber;
        id obj = [v164 responseEndDate];
        id v162 = [v164 requestStartDate];
        [obj timeIntervalSinceDate:v162];
        uint64_t v17 = [v15 numberWithInt:(int)(v16 * 1000.0)];
        __int16 v18 = selfTmpArray;
        __int16 v19 = (void *)v17;
        [(NSMutableArray *)v18 addObject:v17];
        goto LABEL_63;
      }
      int v20 = [(NetworkQualityExecutionsResult *)self->super._results workingLatencyResults];
      id obj = [v20 valueForKey:self->super._tcpKey];

      if (!obj)
      {
        id obj = objc_alloc_init(MEMORY[0x263EFF980]);
        __int16 v21 = [(NetworkQualityExecutionsResult *)self->super._results workingLatencyResults];
        [v21 setObject:obj forKey:self->super._tcpKey];
      }
      __int16 v22 = [(NetworkQualityExecutionsResult *)self->super._results workingLatencyResults];
      id v162 = [v22 valueForKey:self->super._tlsKey];

      if (!v162)
      {
        id v162 = objc_alloc_init(MEMORY[0x263EFF980]);
        __int16 v23 = [(NetworkQualityExecutionsResult *)self->super._results workingLatencyResults];
        [v23 setObject:v162 forKey:self->super._tlsKey];
      }
      __int16 v24 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
      id v158 = [v24 valueForKey:@"ecn_values"];

      if (!v158)
      {
        id v158 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        __int16 v25 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
        [v25 setObject:v158 forKey:@"ecn_values"];
      }
      int v26 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
      id v156 = [v26 valueForKey:@"l4s_enablement"];

      if (!v156)
      {
        id v156 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        __int16 v27 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
        [v27 setObject:v156 forKey:@"l4s_enablement"];
      }
      nw_establishment_report_t report = [v164 _establishmentReport];
      if (!report)
      {
LABEL_28:
        unint64_t v39 = [v164 networkProtocolName];
        if (v39)
        {
          double v40 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
          id v41 = [v40 objectForKey:@"protocols_seen"];

          if (!v41)
          {
            id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            v42 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
            [v42 setValue:v41 forKey:@"protocols_seen"];
          }
          uint64_t v43 = [v41 objectForKey:v39];
          if (v43) {
            v44 = (void *)v43;
          }
          else {
            v44 = &unk_26CAB1D68;
          }
          v45 = [NSNumber numberWithInt:[v44 intValue] + 1];

          [v41 setObject:v45 forKey:v39];
        }

        unint64_t v46 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
        id v47 = [v46 objectForKey:@"proxy_state"];

        if (!v47)
        {
          id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          uint64_t v48 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
          [v48 setValue:v47 forKey:@"proxy_state"];
        }
        int v49 = [v164 isProxyConnection];
        v50 = @"not_proxied";
        if (v49) {
          v50 = @"proxied";
        }
        v51 = v50;
        uint64_t v52 = [v47 objectForKey:v51];
        if (v52) {
          v53 = (void *)v52;
        }
        else {
          v53 = &unk_26CAB1D68;
        }
        v54 = [NSNumber numberWithInt:[v53 intValue] + 1];

        [v47 setObject:v54 forKey:v51];
        id v55 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
        id v56 = [v55 objectForKey:@"interface-type"];

        if (!v56)
        {
          id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v57 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
          [v57 setValue:v56 forKey:@"interface-type"];
        }
        id v58 = [v164 _interfaceName];
        [v58 UTF8String];
        v59 = nw_interface_create_with_name();

        v60 = NSString;
        nw_interface_type_t type = nw_interface_get_type(v59);
        v62 = [v60 stringWithUTF8String:nw_interface_type_to_string(type)];
        uint64_t v63 = [v56 objectForKey:v62];
        if (v63) {
          v64 = (void *)v63;
        }
        else {
          v64 = &unk_26CAB1D68;
        }
        v65 = [NSNumber numberWithInt:[v64 intValue] + 1];

        [v56 setObject:v65 forKey:v62];
        v66 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
        id v67 = [v66 objectForKey:@"rat"];

        if (!v67)
        {
          id v67 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v68 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
          [v68 setValue:v67 forKey:@"rat"];
        }
        if (nw_interface_get_radio_type())
        {
          v69 = [NSString stringWithUTF8String:nw_interface_radio_type_to_string()];
        }
        else
        {
          v69 = @"unknown";
        }

        uint64_t v70 = [v67 objectForKey:v69];

        if (v70) {
          v71 = (void *)v70;
        }
        else {
          v71 = &unk_26CAB1D68;
        }
        v72 = [NSNumber numberWithInt:[v71 intValue] + 1];

        [v67 setObject:v72 forKey:v69];
        v73 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
        id v74 = [v73 objectForKey:@"multipath"];

        if (!v74)
        {
          id v74 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v75 = [(NetworkQualityExecutionsResult *)self->super._results mutableOtherValues];
          [v75 setValue:v74 forKey:@"multipath"];
        }
        int v76 = [v164 isMultipath];
        v77 = @"disabled";
        if (v76) {
          v77 = @"negotiated";
        }
        v78 = v77;
        uint64_t v79 = [v74 objectForKey:v78];
        if (v79) {
          v80 = (void *)v79;
        }
        else {
          v80 = &unk_26CAB1D68;
        }
        v81 = [NSNumber numberWithInt:[v80 intValue] + 1];

        [v74 setObject:v81 forKey:v78];
        v159 = self->super._reqrespKey;
        h2TmpArray = self->_h2TmpArray;
        v83 = NSNumber;
        v84 = [v164 responseEndDate];
        v85 = [v164 requestStartDate];
        [v84 timeIntervalSinceDate:v85];
        v87 = [v83 numberWithInt:(int)(v86 * 1000.0)];
        [(NSMutableArray *)h2TmpArray addObject:v87];

        __int16 v19 = v158;
LABEL_63:

        v88 = [(NetworkQualityExecutionsResult *)self->super._results workingLatencyResults];
        id v163 = [v88 valueForKey:v159];

        if (!v163)
        {
          id v163 = objc_alloc_init(MEMORY[0x263EFF980]);
          v89 = [(NetworkQualityExecutionsResult *)self->super._results workingLatencyResults];
          [v89 setObject:v163 forKey:v159];
        }
        v90 = NSNumber;
        v91 = [v164 responseEndDate];
        v92 = [v164 requestStartDate];
        [v91 timeIntervalSinceDate:v92];
        v94 = [v90 numberWithInt:(int)(v93 * 1000.0)];
        [v163 addObject:v94];

        id obja = [MEMORY[0x263EFF910] now];
        [obja timeIntervalSinceDate:self->_start];
        if (v95 < 0.2) {
          goto LABEL_108;
        }
        objc_storeStrong((id *)&self->_start, obja);
        [(TrimmedMean *)self->_tcpTrim add:self->_tcpTmpArray];
        v96 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        tcpTmpArray = self->_tcpTmpArray;
        self->_tcpTmpArray = v96;

        [(TrimmedMean *)self->_tlsTrim add:self->_tlsTmpArray];
        v98 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        tlsTmpArray = self->_tlsTmpArray;
        self->_tlsTmpArray = v98;

        [(TrimmedMean *)self->_h2Trim add:self->_h2TmpArray];
        v100 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        v101 = self->_h2TmpArray;
        self->_h2TmpArray = v100;

        [(TrimmedMean *)self->_selfTrim add:self->_selfTmpArray];
        v102 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        v103 = self->_selfTmpArray;
        self->_selfTmpArray = v102;

        [(TrimmedMean *)self->_tcpTrim getTrimmedMean];
        float v105 = v104;
        [(TrimmedMean *)self->_tlsTrim getTrimmedMean];
        float v107 = v106;
        [(TrimmedMean *)self->_h2Trim getTrimmedMean];
        float v109 = v108;
        [(TrimmedMean *)self->_selfTrim getTrimmedMean];
        float v111 = *(float *)&v110;
        float v112 = fabsf(v105);
        float v113 = fabsf(v107);
        float v114 = fabsf(v109);
        if (v112 >= 0.00000011921 || v113 >= 0.00000011921 || (float v115 = 0.0, v114 >= 0.00000011921))
        {
          int v116 = v105 != 0.0;
          if (v107 != 0.0) {
            ++v116;
          }
          if (v109 != 0.0) {
            ++v116;
          }
          float v115 = (float)((float)(v105 + v107) + v109) / (float)v116;
        }
        float v117 = fabsf(*(float *)&v110);
        if (fabsf(v115) < 0.00000011921)
        {
          HIDWORD(v110) = 872415232;
          if (v117 < 0.00000011921)
          {
LABEL_108:

            goto LABEL_109;
          }
        }
        else
        {
          *(void *)&double v110 = LODWORD(v115) | 0x3400000000000000;
          if (v117 >= 0.00000011921) {
            *(float *)&double v110 = (float)(v111 + v115) * 0.5;
          }
        }
        float v157 = v113;
        float v153 = v117;
        float reporta = v114;
        float v118 = 60000.0 / *(float *)&v110;
        *(float *)&double v110 = 60000.0 / *(float *)&v110;
        if ([(SaturationDetection *)self->_saturation add:v110]
          && ([(NetworkQualityExecutions *)self->super._execution throughputSaturated]
           || [(NetworkQualityExecutions *)self->super._execution throughputMetExitCriteria]))
        {
          if (self->super._saturationHandler) {
            self->_saturation_reached = 1;
          }
          [(SaturationDetection *)self->_saturation getSaturation];
        }
        else
        {
          [(SaturationDetection *)self->_saturation getAverage];
        }
        float v120 = v119;
        netqual_log_init();
        v121 = (id)os_log_netqual;
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136317186;
          *(void *)&uint8_t buf[4] = "-[WorkingLatencyURLSessionDelegate URLSession:task:didFinishCollectingMetrics:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1165;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v118;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = v120;
          *(_WORD *)&buf[38] = 2048;
          double v186 = v105;
          __int16 v187 = 2048;
          double v188 = v107;
          __int16 v189 = 2048;
          double v190 = v109;
          __int16 v191 = 2048;
          double v192 = v115;
          __int16 v193 = 2048;
          double v194 = v111;
          _os_log_impl(&dword_2192FE000, v121, OS_LOG_TYPE_DEFAULT, "%s:%u - Responsiveness: %.3f, Saturated: %.3f tcpMean: %.3f tlsMean: %.3f rrMean %.3f foreignMean %.3f srrMean %.3f", buf, 0x58u);
        }

        BOOL v122 = !self->isDownlink;
        *(float *)&double v123 = v120;
        v124 = [NSNumber numberWithFloat:v123];
        results = self->super._results;
        if (v122)
        {
          v141 = [(NetworkQualityResult *)results uplinkResponsiveness];
          [v141 setValue:v124];

          v142 = NSNumber;
          v143 = [(NetworkQualityResult *)self->super._results uplinkResponsiveness];
          v144 = [v143 value];
          v145 = [v142 numberWithLong:+[NetworkQualityResult ratingForResponsivenessScore:](NetworkQualityResult, "ratingForResponsivenessScore:", [v144 integerValue])];
          v146 = [(NetworkQualityResult *)self->super._results uplinkResponsiveness];
          [v146 setRating:v145];

          v147 = [(NetworkQualityResult *)self->super._results uplinkResponsiveness];
          [v147 updateConfidence:-[WorkingLatencyURLSessionDelegate currentResponsivenessConfidenceValue](self, "currentResponsivenessConfidenceValue")];

          if (v112 >= 0.00000011921)
          {
            v133.n128_f32[0] = 60000.0 / v105;
            v148 = [NSNumber numberWithFloat:v133.n128_f64[0]];
            [(NetworkQualityResult *)self->super._results setUplinkTCPResponsiveness:v148];
          }
          HIDWORD(v149) = 872415232;
          v134.n128_f32[0] = v157;
          if (v157 >= 0.00000011921)
          {
            *(float *)&double v149 = 60000.0 / v107;
            v150 = [NSNumber numberWithFloat:v149, v134.n128_f64[0]];
            [(NetworkQualityResult *)self->super._results setUplinkTLSResponsiveness:v150];
          }
          HIDWORD(v151) = 872415232;
          v134.n128_f32[0] = reporta;
          if (reporta >= 0.00000011921)
          {
            *(float *)&double v151 = 60000.0 / v109;
            v152 = [NSNumber numberWithFloat:v151, v134.n128_f64[0]];
            [(NetworkQualityResult *)self->super._results setUplinkHTTPForeignResponsiveness:v152];
          }
          v133.n128_u64[0] = 0x3400000034000000;
          v134.n128_f32[0] = v153;
          if (v153 < 0.00000011921) {
            goto LABEL_105;
          }
          v133.n128_f32[0] = 60000.0 / v111;
          v140 = [NSNumber numberWithFloat:v133.n128_f64[0] v134.n128_f64[0]];
          [(NetworkQualityResult *)self->super._results setUplinkHTTPSelfResponsiveness:v140];
        }
        else
        {
          v126 = [(NetworkQualityResult *)results downlinkResponsiveness];
          [v126 setValue:v124];

          v127 = NSNumber;
          v128 = [(NetworkQualityResult *)self->super._results downlinkResponsiveness];
          v129 = [v128 value];
          v130 = [v127 numberWithLong:+[NetworkQualityResult ratingForResponsivenessScore:](NetworkQualityResult, "ratingForResponsivenessScore:", [v129 integerValue])];
          v131 = [(NetworkQualityResult *)self->super._results downlinkResponsiveness];
          [v131 setRating:v130];

          v132 = [(NetworkQualityResult *)self->super._results downlinkResponsiveness];
          [v132 updateConfidence:-[WorkingLatencyURLSessionDelegate currentResponsivenessConfidenceValue](self, "currentResponsivenessConfidenceValue")];

          if (v112 >= 0.00000011921)
          {
            v133.n128_f32[0] = 60000.0 / v105;
            v135 = [NSNumber numberWithFloat:v133.n128_f64[0]];
            [(NetworkQualityResult *)self->super._results setDownlinkTCPResponsiveness:v135];
          }
          HIDWORD(v136) = 872415232;
          v134.n128_f32[0] = v157;
          if (v157 >= 0.00000011921)
          {
            *(float *)&double v136 = 60000.0 / v107;
            v137 = [NSNumber numberWithFloat:v136, v134.n128_f64[0]];
            [(NetworkQualityResult *)self->super._results setDownlinkTLSResponsiveness:v137];
          }
          HIDWORD(v138) = 872415232;
          v134.n128_f32[0] = reporta;
          if (reporta >= 0.00000011921)
          {
            *(float *)&double v138 = 60000.0 / v109;
            v139 = [NSNumber numberWithFloat:v138, v134.n128_f64[0]];
            [(NetworkQualityResult *)self->super._results setDownlinkHTTPForeignResponsiveness:v139];
          }
          v133.n128_u64[0] = 0x3400000034000000;
          v134.n128_f32[0] = v153;
          if (v153 < 0.00000011921) {
            goto LABEL_105;
          }
          v133.n128_f32[0] = 60000.0 / v111;
          v140 = [NSNumber numberWithFloat:v133.n128_f64[0] v134.n128_f64[0]];
          [(NetworkQualityResult *)self->super._results setDownlinkHTTPSelfResponsiveness:v140];
        }

LABEL_105:
        if (self->_saturation_reached)
        {
          (*((void (**)(__n128, __n128))self->super._completionHandler + 2))(v133, v134);
          v133.n128_f64[0] = (*((double (**)(void))self->super._saturationHandler + 2))();
        }
        [(LatencyURLSessionDelegate *)self shareProgress];
        goto LABEL_108;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&buf[24] = __Block_byref_object_copy__0;
      *(void *)&buf[32] = __Block_byref_object_dispose__0;
      double v186 = 0.0;
      uint64_t v181 = 0;
      v182 = &v181;
      uint64_t v183 = 0x2020000000;
      uint64_t v184 = 0;
      uint64_t v177 = 0;
      v178 = &v177;
      uint64_t v179 = 0x2020000000;
      char v180 = 0;
      uint64_t v173 = 0;
      v174 = &v173;
      uint64_t v175 = 0x2020000000;
      uint64_t v176 = 0;
      enumerate_block[0] = MEMORY[0x263EF8330];
      enumerate_block[1] = 3221225472;
      enumerate_block[2] = __79__WorkingLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke;
      enumerate_block[3] = &unk_26439D1C8;
      v169 = buf;
      v170 = &v181;
      id v168 = v10;
      v171 = &v177;
      v172 = &v173;
      nw_establishment_report_enumerate_protocols(report, enumerate_block);
      if (*((unsigned char *)v178 + 24))
      {
        int v28 = [NSNumber numberWithUnsignedLongLong:v174[3]];
        [obj addObject:v28];

        __int16 v29 = self->_tcpTmpArray;
        unint64_t v30 = [NSNumber numberWithUnsignedLongLong:v174[3]];
        [(NSMutableArray *)v29 addObject:v30];
      }
      uint64_t v31 = *(void *)(*(void *)&buf[8] + 40);
      unint64_t v32 = (void *)MEMORY[0x21D487E20]();
      if (MEMORY[0x21D487E30](v31, v32))
      {
      }
      else
      {
        uint64_t v34 = *(void *)(*(void *)&buf[8] + 40);
        v35 = (void *)nw_protocol_copy_quic_connection_definition();
        LODWORD(v34) = MEMORY[0x21D487E30](v34, v35);

        if (!v34)
        {
LABEL_27:
          id v165 = v158;
          id v166 = v156;
          nw_establishment_report_enumerate_protocol_l4s_state();

          _Block_object_dispose(&v173, 8);
          _Block_object_dispose(&v177, 8);
          _Block_object_dispose(&v181, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_28;
        }
      }
      v36 = [NSNumber numberWithUnsignedLongLong:v182[3]];
      [v162 addObject:v36];

      v37 = self->_tlsTmpArray;
      v38 = [NSNumber numberWithUnsignedLongLong:v182[3]];
      [(NSMutableArray *)v37 addObject:v38];

      goto LABEL_27;
    }
  }
LABEL_110:
}

uint64_t __79__WorkingLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  if (([*(id *)(a1 + 32) isProxy] & 1) == 0)
  {
    nw_protocol_definition_t v7 = nw_protocol_copy_tcp_definition();
    int v8 = MEMORY[0x21D487E30](v6, v7);

    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
    }
  }

  return 1;
}

uint64_t __79__WorkingLatencyURLSessionDelegate_URLSession_task_didFinishCollectingMetrics___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, uint64_t a4, int a5)
{
  id v8 = a2;
  nw_protocol_definition_t v9 = nw_protocol_copy_tcp_definition();
  if (MEMORY[0x21D487E30](v8, v9))
  {
  }
  else
  {
    id v10 = (void *)nw_protocol_copy_quic_connection_definition();
    int v11 = MEMORY[0x21D487E30](v8, v10);

    if (!v11)
    {
      uint64_t v21 = 1;
      goto LABEL_13;
    }
  }
  unsigned int v12 = [NSString stringWithUTF8String:nw_connection_client_accurate_ecn_state_to_string(a3)];
  uint64_t v13 = [*(id *)(a1 + 32) objectForKey:v12];
  if (v13) {
    v14 = (void *)v13;
  }
  else {
    v14 = &unk_26CAB1D68;
  }
  v15 = [NSNumber numberWithInt:[v14 intValue] + 1];

  [*(id *)(a1 + 32) setObject:v15 forKey:v12];
  double v16 = @"disabled";
  if (a5) {
    double v16 = @"enabled";
  }
  uint64_t v17 = *(void **)(a1 + 40);
  __int16 v18 = v16;
  __int16 v19 = [v17 objectForKey:v18];

  if (!v19) {
    __int16 v19 = &unk_26CAB1D68;
  }
  int v20 = [NSNumber numberWithInt:[v19 intValue] + 1];

  [*(id *)(a1 + 40) setObject:v20 forKey:v18];
  uint64_t v21 = 0;
LABEL_13:

  return v21;
}

- (int64_t)currentResponsivenessConfidenceValue
{
  if (!self->_probeLoadConnections
    || ![(NetworkQualityExecutions *)self->super._execution throughputSaturated])
  {
    return 1;
  }
  if (self->_saturation_reached) {
    return 3;
  }
  return 2;
}

- (BOOL)checkLimits
{
  if (!self->super._saturationHandler) {
    return 0;
  }
  if (![(LatencyURLSessionDelegate *)self metExitCriteria])
  {
    float v4 = [MEMORY[0x263EFF910] now];
    [v4 timeIntervalSinceDate:self->_current];
    if (v5 >= 0.2)
    {
      objc_storeStrong((id *)&self->_current, v4);
      [(SaturationDetection *)self->_saturation getAverage];
      int exitCriteriaCounter = self->super._exitCriteriaCounter;
      if (self->_exit_value >= (float)(uint64_t)v7)
      {
        if (exitCriteriaCounter >= 1)
        {
          BOOL v3 = 0;
          self->super._int exitCriteriaCounter = 0;
          goto LABEL_7;
        }
      }
      else
      {
        self->super._int exitCriteriaCounter = exitCriteriaCounter + 1;
        if ([(LatencyURLSessionDelegate *)self metExitCriteria])
        {
          (*((void (**)(void))self->super._saturationHandler + 2))();
          [(LatencyURLSessionDelegate *)self shareProgress];
          BOOL v3 = 1;
          goto LABEL_7;
        }
      }
    }
    BOOL v3 = 0;
LABEL_7:

    return v3;
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_saturation, 0);
  objc_storeStrong((id *)&self->_selfTrim, 0);
  objc_storeStrong((id *)&self->_selfTmpArray, 0);
  objc_storeStrong((id *)&self->_h2Trim, 0);
  objc_storeStrong((id *)&self->_h2TmpArray, 0);
  objc_storeStrong((id *)&self->_tlsTrim, 0);
  objc_storeStrong((id *)&self->_tlsTmpArray, 0);
  objc_storeStrong((id *)&self->_tcpTrim, 0);
  objc_storeStrong((id *)&self->_tcpTmpArray, 0);

  objc_storeStrong((id *)&self->_workingSessions, 0);
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Load failed with error: %@", v2, v3, v4, v5, 2u);
}

@end