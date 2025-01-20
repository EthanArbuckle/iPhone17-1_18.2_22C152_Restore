@interface NPTDownload
+ (BOOL)supportsSecureCoding;
- (BOOL)finishedAllTasks;
- (BOOL)inTimedMode;
- (BOOL)isLastTask;
- (BOOL)isTimerCancelledError:(id)a3;
- (NPTDownload)initWithCoder:(id)a3;
- (NPTDownload)initWithNetworkActivityParent:(id)a3 testConfiguration:(id)a4;
- (NPTMetricResult)results;
- (double)checkAndReturnSpeedStablized:(id)a3;
- (double)minNonZeroValue:(double)a3 comparisonValue:(double)a4;
- (id)aggregateResults;
- (id)checkInterfaceSpecified;
- (id)completion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (id)overAllResultByTask:(unint64_t)a3;
- (id)processNQResult:(id)a3;
- (id)realTimeSpeedMetric:(unint64_t)a3;
- (id)realTimeSpeedMetricOverall;
- (id)setupNewDownloadTask;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)cancel;
- (void)cancelDispatchTimer;
- (void)cancelDispatchTimerAndSession;
- (void)completeActivityWithReason:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)kickOffNewDownload;
- (void)progress:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResults:(id)a3;
- (void)setupTimer;
- (void)startDownloadWithCompletion:(id)a3;
- (void)startLegacyDownloadWithCompletion:(id)a3;
- (void)startNQDownloadWithCompletion:(id)a3;
- (void)startTasks;
@end

@implementation NPTDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTDownload)initWithNetworkActivityParent:(id)a3 testConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NPTDownload;
  v9 = [(NPTDownload *)&v26 init];
  if (v9)
  {
    v10 = objc_alloc_init(NPTMetricResult);
    [(NPTDownload *)v9 setResults:v10];

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    taskDict = v9->taskDict;
    v9->taskDict = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v9->activityParent, a3);
    uint64_t v13 = nw_activity_create();
    downloadActivity = v9->downloadActivity;
    v9->downloadActivity = (OS_nw_activity *)v13;

    nw_activity_set_parent_activity();
    if ([v8 stopAtFileSize]) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = [v8 concurrentStreams];
    }
    v9->processedStreamEndCount = 0;
    v9->maxConcurrentStreams = v15;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    buffer = v9->buffer;
    v9->buffer = v16;

    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    v9->recentBufferTime = v18;
    endTimeAggregate = v9->endTimeAggregate;
    v9->endTimeAggregate = 0;

    v9->smartDownload = [v8 endWhenStable];
    v9->timedDownloadLength = [v8 testDuration];
    v9->stableSpeedToLog = 0.0;
    downloadError = v9->downloadError;
    v9->downloadError = 0;

    v9->stopAtFileSizeEnabled = [v8 stopAtFileSize];
    uint64_t v21 = [v8 clientName];
    callingClient = v9->callingClient;
    v9->callingClient = (NSString *)v21;

    v9->maxSpeedObserved = 0.0;
    v9->legacy = [v8 legacyMode];
    nqTest = v9->nqTest;
    v9->nqTest = 0;

    nqConfig = v9->nqConfig;
    v9->nqConfig = 0;

    objc_storeStrong((id *)&v9->testConfig, a4);
  }

  return v9;
}

- (void)startNQDownloadWithCompletion:(id)a3
{
  id v4 = a3;
  [(NPTDownload *)self setCompletion:v4];
  v5 = [(NPTPerformanceTestConfiguration *)self->testConfig NQDownloadConfiguration];
  nqConfig = self->nqConfig;
  self->nqConfig = v5;

  id v7 = [(NPTPerformanceTestConfiguration *)self->testConfig bonjourHost];

  if (v7)
  {
    id v8 = [(NPTPerformanceTestConfiguration *)self->testConfig bonjourHost];
    [(NetworkQualityConfiguration *)self->nqConfig setBonjourHost:v8];

    [(NetworkQualityConfiguration *)self->nqConfig setValidateCertificate:0];
  }
  nw_activity_activate();
  v9 = [(NPTDownload *)self checkInterfaceSpecified];
  v10 = [(NPTDownload *)self results];
  [v10 setError:v9];

  if (v9)
  {
    uint64_t v11 = [(NPTDownload *)self delegate];

    if (v11)
    {
      v12 = [(NPTDownload *)self delegate];
      [v12 download:self didFinishWithError:v9];
    }
    uint64_t v13 = [(NPTDownload *)self completion];

    if (v13)
    {
      v14 = [(NPTDownload *)self completion];
      ((void (**)(void, void, void *))v14)[2](v14, 0, v9);
    }
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x263F08A48]);
    v16 = dispatch_get_global_queue(33, 0);
    [v15 setUnderlyingQueue:v16];

    [v15 setMaxConcurrentOperationCount:1];
    v17 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
    initialTime = self->initialTime;
    self->initialTime = v17;

    v19 = (NetworkQualityAssessment *)[objc_alloc(MEMORY[0x263F8C628]) initWithConfiguration:self->nqConfig delegate:self delegateQueue:v15];
    nqTest = self->nqTest;
    self->nqTest = v19;

    if (self->nqTest)
    {
      uint64_t v21 = [(NPTDownload *)self delegate];

      if (v21)
      {
        v22 = [(NPTDownload *)self delegate];
        [v22 downloadWillStart];
      }
    }
    objc_initWeak(&location, self);
    v23 = self->nqTest;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __45__NPTDownload_startNQDownloadWithCompletion___block_invoke;
    v24[3] = &unk_2643A17C0;
    objc_copyWeak(&v25, &location);
    [(NetworkQualityAssessment *)v23 runWithCompletionHandler:v24];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

void __45__NPTDownload_startNQDownloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = +[NPTLogger network];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v5 debugDescription];
    int v25 = 138412546;
    objc_super v26 = v10;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_219415000, v9, OS_LOG_TYPE_DEFAULT, "Test complete %@, %@", (uint8_t *)&v25, 0x16u);
  }
  uint64_t v11 = (id *)(WeakRetained + 128);
  if (*((void *)WeakRetained + 16)) {
    v12 = (void *)*((void *)WeakRetained + 16);
  }
  else {
    v12 = v6;
  }
  objc_storeStrong((id *)WeakRetained + 16, v12);
  uint64_t v13 = [MEMORY[0x263EFF910] now];
  v14 = (void *)*((void *)WeakRetained + 12);
  *((void *)WeakRetained + 12) = v13;

  id v15 = [WeakRetained processNQResult:v5];
  [WeakRetained setResults:v15];

  if (*v11)
  {
    if ([*v11 code] == -999) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = 3;
    }
  }
  else
  {
    uint64_t v16 = 2;
  }
  [WeakRetained completeActivityWithReason:v16];
  v17 = [WeakRetained delegate];

  if (v17)
  {
    if (v6)
    {
      double v18 = [WeakRetained results];
      [v18 setError:v6];

      v19 = [WeakRetained delegate];
      [v19 download:WeakRetained didFinishWithError:v6];
    }
    else
    {
      v19 = [WeakRetained delegate];
      v20 = [WeakRetained results];
      [v19 download:WeakRetained didFinishWithResults:v20];
    }
  }
  uint64_t v21 = [WeakRetained completion];

  if (v21)
  {
    v22 = [WeakRetained completion];
    id v23 = objc_loadWeakRetained(v7);
    v24 = [v23 results];
    ((void (**)(void, void *, id))v22)[2](v22, v24, v6);
  }
}

- (void)startDownloadWithCompletion:(id)a3
{
  if (self->legacy) {
    [(NPTDownload *)self startLegacyDownloadWithCompletion:a3];
  }
  else {
    [(NPTDownload *)self startNQDownloadWithCompletion:a3];
  }
}

- (void)startLegacyDownloadWithCompletion:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  [(NPTDownload *)self setCompletion:a3];
  nw_activity_activate();
  id v4 = [(NPTDownload *)self checkInterfaceSpecified];
  id v5 = [(NPTDownload *)self results];
  [v5 setError:v4];

  if (v4)
  {
    id v6 = [(NPTDownload *)self delegate];

    if (v6)
    {
      id v7 = [(NPTDownload *)self delegate];
      [v7 download:self didFinishWithError:v4];
    }
    id v8 = [(NPTDownload *)self completion];

    if (v8)
    {
      v9 = [(NPTDownload *)self completion];
      ((void (**)(void, void, void *))v9)[2](v9, 0, v4);
    }
  }
  else
  {
    if ([(NPTPerformanceTestConfiguration *)self->testConfig interfaceType]) {
      BOOL v10 = [(NPTPerformanceTestConfiguration *)self->testConfig interfaceType] == 3;
    }
    else {
      BOOL v10 = 1;
    }
    uint64_t v11 = [MEMORY[0x263EFC648] ephemeralSessionConfiguration];
    id v12 = objc_alloc_init(MEMORY[0x263F08A48]);
    [v12 setQualityOfService:33];
    [v12 setMaxConcurrentOperationCount:1];
    [v11 setAllowsCellularAccess:v10];
    [v11 setWaitsForConnectivity:0];
    [v11 setTimeoutIntervalForRequest:3.0];
    if (!self->timedDownloadLength) {
      [v11 setTimeoutIntervalForResource:(double)(90 * self->maxConcurrentStreams)];
    }
    [v11 setHTTPMaximumConnectionsPerHost:self->maxConcurrentStreams + 1];
    uint64_t v13 = [MEMORY[0x263EFC640] sessionWithConfiguration:v11 delegate:self delegateQueue:v12];
    downloadSession = self->downloadSession;
    self->downloadSession = v13;

    id v15 = (void *)MEMORY[0x263EFC5E8];
    uint64_t v16 = [(NPTPerformanceTestConfiguration *)self->testConfig downloadURL];
    v17 = [v15 requestWithURL:v16];
    request = self->request;
    self->request = v17;

    [(NSMutableURLRequest *)self->request setHTTPMethod:@"GET"];
    [(NSMutableURLRequest *)self->request setValue:@"application/octet-stream" forHTTPHeaderField:@"Accept"];
    unint64_t timedDownloadLength = self->timedDownloadLength;
    double v20 = (double)timedDownloadLength * 0.9;
    if (!timedDownloadLength) {
      double v20 = 60.0;
    }
    [(NSMutableURLRequest *)self->request setTimeoutInterval:v20];
    callingClient = self->callingClient;
    if (callingClient && [(NSString *)callingClient length]) {
      [(NSMutableURLRequest *)self->request setValue:self->callingClient forHTTPHeaderField:@"NPTKit-Client"];
    }
    v22 = [(NPTPerformanceTestConfiguration *)self->testConfig interfaceName];

    if (v22)
    {
      id v23 = +[NPTLogger network];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(NPTPerformanceTestConfiguration *)self->testConfig interfaceName];
        *(_DWORD *)buf = 138412290;
        unint64_t v40 = (unint64_t)v24;
        _os_log_impl(&dword_219415000, v23, OS_LOG_TYPE_DEFAULT, "Force the download over the following interface: %@", buf, 0xCu);
      }
      int v25 = self->request;
      objc_super v26 = [(NPTPerformanceTestConfiguration *)self->testConfig interfaceName];
      [(NSMutableURLRequest *)v25 setBoundInterfaceIdentifier:v26];
    }
    __int16 v27 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.wifiqa.NPTKit"];
    id v28 = [v27 infoDictionary];
    uint64_t v29 = [v28 objectForKey:@"CFBundleShortVersionString"];

    v30 = [NSString stringWithFormat:@"NPTKit/%@", v29];
    [(NSMutableURLRequest *)self->request addValue:v30 forHTTPHeaderField:@"User-Agent"];
    v31 = +[NPTLogger network];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t maxConcurrentStreams = self->maxConcurrentStreams;
      *(_DWORD *)buf = 134217984;
      unint64_t v40 = maxConcurrentStreams;
      _os_log_impl(&dword_219415000, v31, OS_LOG_TYPE_DEFAULT, "Will start download task to test download speed with %lu number of streams", buf, 0xCu);
    }

    if (self->downloadSession)
    {
      v33 = [(NPTDownload *)self delegate];

      if (v33)
      {
        v34 = [(NPTDownload *)self delegate];
        [v34 downloadWillStart];
      }
      if (self->maxConcurrentStreams)
      {
        unint64_t v35 = 0;
        do
        {
          id v36 = [(NPTDownload *)self setupNewDownloadTask];
          ++v35;
        }
        while (v35 < self->maxConcurrentStreams);
      }
      if (self->timedDownloadLength) {
        [(NPTDownload *)self setupTimer];
      }
      if (!self->initialTime)
      {
        v37 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
        initialTime = self->initialTime;
        self->initialTime = v37;
      }
      [(NPTDownload *)self startTasks];
    }
  }
}

- (void)setupTimer
{
  v3 = dispatch_get_global_queue(0, 0);
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
  timeoutTimer = self->timeoutTimer;
  self->timeoutTimer = v4;

  id v6 = self->timeoutTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __25__NPTDownload_setupTimer__block_invoke;
  handler[3] = &unk_2643A17E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  id v7 = self->timeoutTimer;
  dispatch_time_t v8 = dispatch_time(0, 1000000000 * self->timedDownloadLength);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_cancel_handler((dispatch_source_t)self->timeoutTimer, &__block_literal_global_1);
  dispatch_activate((dispatch_object_t)self->timeoutTimer);
}

uint64_t __25__NPTDownload_setupTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 72);
  if (v3 && !dispatch_source_testcancel(*(dispatch_source_t *)(v2 + 72))) {
    dispatch_source_cancel(v3);
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF910]);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  dispatch_time_t v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = 0;

  v9 = +[NPTLogger network];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_219415000, v9, OS_LOG_TYPE_DEFAULT, "Timed download timer ended", v11, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) invalidateAndCancel];
}

- (void)kickOffNewDownload
{
  id v2 = [(NPTDownload *)self setupNewDownloadTask];
  [v2 resume];
}

- (id)setupNewDownloadTask
{
  v3 = objc_alloc_init(NPTTaskMetrics);
  id v4 = [(NSURLSession *)self->downloadSession dataTaskWithRequest:self->request];
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v4, "taskIdentifier"));
  [(NPTTaskMetrics *)v3 setTask:v4];
  [(NSMutableDictionary *)self->taskDict setObject:v3 forKeyedSubscript:v5];
  objc_msgSend(v4, "set_nw_activity:", self->downloadActivity);

  return v4;
}

- (void)cancel
{
  [(NPTDownload *)self cancelDispatchTimerAndSession];
  [(NetworkQualityAssessment *)self->nqTest cancel];
  downloadSession = self->downloadSession;
  self->downloadSession = 0;
}

- (void)cancelDispatchTimerAndSession
{
  v3 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
  endTimeAggregate = self->endTimeAggregate;
  self->endTimeAggregate = v3;

  [(NPTDownload *)self cancelDispatchTimer];
  downloadSession = self->downloadSession;

  [(NSURLSession *)downloadSession invalidateAndCancel];
}

- (void)cancelDispatchTimer
{
  timeoutTimer = self->timeoutTimer;
  if (timeoutTimer && !dispatch_source_testcancel((dispatch_source_t)self->timeoutTimer))
  {
    dispatch_source_cancel(timeoutTimer);
    id v4 = self->timeoutTimer;
    self->timeoutTimer = 0;
  }
}

- (double)checkAndReturnSpeedStablized:(id)a3
{
  id v4 = a3;
  double v5 = self->recentBufferTime + 1.0;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v6 = 0.0;
  if (v5 < v7)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->recentBufferTime = v8;
    buffer = self->buffer;
    BOOL v10 = NSNumber;
    [v4 speed];
    uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
    [(NSMutableArray *)buffer addObject:v11];

    if ((unint64_t)[(NSMutableArray *)self->buffer count] >= 0xB) {
      [(NSMutableArray *)self->buffer removeObjectAtIndex:0];
    }
    if ([(NSMutableArray *)self->buffer count] == 10)
    {
      id v12 = [(NSMutableArray *)self->buffer valueForKeyPath:@"@avg.self"];
      [v12 doubleValue];
      double v14 = v13;

      id v15 = [(NSMutableArray *)self->buffer objectAtIndexedSubscript:9];
      [v15 doubleValue];
      double v17 = vabdd_f64(v16, v14);

      double v18 = [(NSMutableArray *)self->buffer objectAtIndexedSubscript:9];
      [v18 doubleValue];
      double v20 = v17 / v19;

      if (v20 < 0.1)
      {
        [v4 speed];
        double v6 = v21;
      }
    }
  }

  return v6;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v6 = [(NPTDownload *)self realTimeSpeedMetricOverall];
  double v7 = [(NPTDownload *)self delegate];

  if (v7)
  {
    double v8 = [(NPTDownload *)self delegate];
    [v8 download:self didReceiveSpeedMetric:v6];
  }
  [v6 speed];
  if (v9 > self->maxSpeedObserved)
  {
    [v6 speed];
    self->maxSpeedObserved = v10;
  }
  if (self->stableSpeedToLog == 0.0)
  {
    [(NPTDownload *)self checkAndReturnSpeedStablized:v6];
    if (v11 > 0.0)
    {
      double v12 = v11;
      self->stableSpeedToLog = v11;
      double v13 = +[NPTLogger network];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v6 bytesTransferred];
        [v6 timeSinceStart];
        int v16 = 134218496;
        double v17 = v12;
        __int16 v18 = 2048;
        uint64_t v19 = v14;
        __int16 v20 = 2048;
        uint64_t v21 = v15;
        _os_log_impl(&dword_219415000, v13, OS_LOG_TYPE_DEFAULT, "Download task has stabilized at %f Mbps after downloading %lld bytes over %f seconds", (uint8_t *)&v16, 0x20u);
      }

      if (self->smartDownload) {
        [(NPTDownload *)self cancelDispatchTimerAndSession];
      }
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v21 = a4;
  id v7 = a5;
  taskDict = self->taskDict;
  double v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v21, "taskIdentifier"));
  double v10 = [(NSMutableDictionary *)taskDict objectForKeyedSubscript:v9];

  if (v10)
  {
    double v11 = objc_alloc_init(NPTMetricResult);
    [(NPTMetricResult *)v11 populateWithMetrics:v7];
    double v12 = [v21 response];
    [(NPTMetricResult *)v11 populateWithURLResponse:v12];

    -[NPTMetricResult setFileSize:](v11, "setFileSize:", [v21 countOfBytesReceived]);
    double v13 = (double)[(NPTMetricResult *)v11 fileSize] * 8.0;
    [(NPTMetricResult *)v11 responseTime];
    [(NPTMetricResult *)v11 setSpeed:v13 / v14 / 1000000.0];
    uint64_t v15 = self->taskDict;
    int v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v21, "taskIdentifier"));
    double v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];
    [v17 setTaskMetrics:v7];

    __int16 v18 = self->taskDict;
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v21, "taskIdentifier"));
    __int16 v20 = [(NSMutableDictionary *)v18 objectForKeyedSubscript:v19];
    [v20 setResults:v11];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (void *)[v10 copy];
  if (v11 && ![(NPTDownload *)self isTimerCancelledError:v11]) {
    goto LABEL_6;
  }
  double v12 = [v9 response];
  double v13 = v12;
  if (v12 && (uint64_t v14 = [v12 statusCode], v14 > 399))
  {
    uint64_t v15 = v14;
    int v16 = [NSString stringWithFormat:@"Download task: %@ failed to download payload due to: %ld", v9, v14];
    double v17 = [MEMORY[0x263EFF9A0] dictionary];
    [v17 setValue:v16 forKey:*MEMORY[0x263F08320]];
    uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPTKit" code:v15 userInfo:v17];

    double v11 = (void *)v18;
    if (v18)
    {
LABEL_6:
      uint64_t v19 = +[NPTLogger network];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[NPTDownload URLSession:task:didCompleteWithError:]((uint64_t)v9, v11, v19);
      }

      downloadError = self->downloadError;
      ++self->processedStreamEndCount;
      if (!downloadError)
      {
        objc_storeStrong((id *)&self->downloadError, v11);
        if (!self->endTimeAggregate && self->timedDownloadLength) {
          [(NPTDownload *)self cancelDispatchTimerAndSession];
        }
        if (!self->timedDownloadLength)
        {
          downloadSession = self->downloadSession;
          if (downloadSession) {
            [(NSURLSession *)downloadSession invalidateAndCancel];
          }
        }
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v22 = +[NPTLogger network];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v9;
      __int16 v38 = 2048;
      uint64_t v39 = [v9 countOfBytesReceived];
      _os_log_impl(&dword_219415000, v22, OS_LOG_TYPE_DEFAULT, "Download task: %@ downloaded: %lld bytes", buf, 0x16u);
    }

    if (!self->endTimeAggregate && [(NPTDownload *)self inTimedMode])
    {
      [(NPTDownload *)self kickOffNewDownload];

      double v11 = 0;
      goto LABEL_38;
    }
  }
  double v11 = 0;
  ++self->processedStreamEndCount;
LABEL_22:
  if ([(NPTDownload *)self isLastTask])
  {
    id v23 = self->downloadError;
    if (v23)
    {
      if ([(NSError *)v23 code] == -999) {
        uint64_t v24 = 4;
      }
      else {
        uint64_t v24 = 3;
      }
    }
    else
    {
      if (!self->endTimeAggregate && self->timedDownloadLength) {
        [(NPTDownload *)self cancelDispatchTimer];
      }
      [(NSURLSession *)self->downloadSession finishTasksAndInvalidate];
      uint64_t v24 = 2;
    }
    [(NPTDownload *)self completeActivityWithReason:v24];
    uint64_t v25 = [(NPTDownload *)self aggregateResults];
    [(NPTDownload *)self setResults:v25];

    objc_super v26 = [(NPTDownload *)self delegate];
    LOBYTE(v25) = v26 == 0;

    if ((v25 & 1) == 0)
    {
      BOOL v27 = self->downloadError == 0;
      id v28 = [(NPTDownload *)self delegate];
      uint64_t v29 = v28;
      if (v27)
      {
        v30 = [(NPTDownload *)self results];
        [v29 download:self didFinishWithResults:v30];
      }
      else
      {
        [v28 download:self didFinishWithError:self->downloadError];
      }
    }
    v31 = [(NPTDownload *)self completion];
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      objc_initWeak((id *)buf, self);
      v33 = [(NPTDownload *)self completion];
      id WeakRetained = objc_loadWeakRetained((id *)buf);
      unint64_t v35 = [WeakRetained results];
      ((void (**)(void, void *, NSError *))v33)[2](v33, v35, self->downloadError);

      objc_destroyWeak((id *)buf);
    }
  }
LABEL_38:
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NPTDownload *)self results];
  [v4 encodeObject:v5 forKey:@"downloadResult"];
}

- (NPTDownload)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NPTDownload;
  id v3 = a3;
  id v4 = [(NPTDownload *)&v7 init];
  id v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"downloadResult", v7.receiver, v7.super_class);

  [(NPTDownload *)v4 setResults:v5];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPTDownload allocWithZone:a3] init];
  id v5 = [(NPTDownload *)self results];
  [(NPTDownload *)v4 setResults:v5];

  return v4;
}

- (void)progress:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
  [v5 timeIntervalSinceDate:self->initialTime];
  double v7 = v6;
  id v8 = [v4 downlinkCapacity];
  id v9 = [v8 value];
  [v9 doubleValue];
  double v11 = v10 / 1000000.0;

  double v12 = +[NPTLogger network];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 134217984;
    double v30 = v11;
    _os_log_impl(&dword_219415000, v12, OS_LOG_TYPE_DEFAULT, "Download progress speed: %f mbps", (uint8_t *)&v29, 0xCu);
  }

  double v13 = [NPTSpeedMetric alloc];
  uint64_t v14 = [v4 downlinkBytesTransferred];
  uint64_t v15 = (int)[v14 intValue];
  uint64_t v16 = [(NetworkQualityConfiguration *)self->nqConfig maxDownlinkData];
  double v17 = [v4 downlinkResponsiveness];
  uint64_t v18 = [v17 value];
  uint64_t v19 = -[NPTSpeedMetric initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:speed:responsiveness:](v13, "initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:speed:responsiveness:", v5, v15, v16, (int)[v18 intValue], v7, v11);

  __int16 v20 = [(NPTDownload *)self delegate];

  if (v20)
  {
    id v21 = [(NPTDownload *)self delegate];
    [v21 download:self didReceiveSpeedMetric:v19];
  }
  [(NPTSpeedMetric *)v19 speed];
  if (v22 > self->maxSpeedObserved)
  {
    [(NPTSpeedMetric *)v19 speed];
    self->maxSpeedObserved = v23;
  }
  if (self->stableSpeedToLog == 0.0)
  {
    [(NPTDownload *)self checkAndReturnSpeedStablized:v19];
    if (v24 > 0.0)
    {
      double v25 = v24;
      self->stableSpeedToLog = v24;
      objc_super v26 = +[NPTLogger network];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [(NPTSpeedMetric *)v19 bytesTransferred];
        [(NPTSpeedMetric *)v19 timeSinceStart];
        int v29 = 134218496;
        double v30 = v25;
        __int16 v31 = 2048;
        uint64_t v32 = v27;
        __int16 v33 = 2048;
        uint64_t v34 = v28;
        _os_log_impl(&dword_219415000, v26, OS_LOG_TYPE_DEFAULT, "Download task has stabilized at %f Mbps after downloading %lld bytes over %f seconds", (uint8_t *)&v29, 0x20u);
      }
    }
  }
}

- (BOOL)isTimerCancelledError:(id)a3
{
  return [a3 code] == -999 && self->downloadSession != 0;
}

- (BOOL)inTimedMode
{
  return self->timedDownloadLength && !self->stopAtFileSizeEnabled;
}

- (BOOL)isLastTask
{
  return self->processedStreamEndCount == self->maxConcurrentStreams;
}

- (id)checkInterfaceSpecified
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [(NPTPerformanceTestConfiguration *)self->testConfig interfaceName];
  if (v3)
  {

LABEL_4:
    id v4 = 0;
    goto LABEL_5;
  }
  if ([(NPTPerformanceTestConfiguration *)self->testConfig interfaceType] == 3) {
    goto LABEL_4;
  }
  double v6 = +[NPTPerformanceTestConfiguration interfaceServiceName:[(NPTPerformanceTestConfiguration *)self->testConfig interfaceType]];
  double v7 = [NSString stringWithFormat:@"Failed to find the interface: %@", v6];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.wifiqa.NPTKit" code:0 userInfo:v8];

LABEL_5:

  return v4;
}

- (void)startTasks
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->taskDict;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[NSMutableDictionary objectForKey:](self->taskDict, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        uint64_t v9 = [v8 task];
        [v9 resume];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)realTimeSpeedMetric:(unint64_t)a3
{
  taskDict = self->taskDict;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  uint64_t v6 = [(NSMutableDictionary *)taskDict objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 task];

  id v8 = objc_alloc_init(MEMORY[0x263EFF910]);
  [v8 timeIntervalSinceDate:self->initialTime];
  long long v10 = -[NPTSpeedMetric initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:]([NPTSpeedMetric alloc], "initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:", v8, [v7 countOfBytesReceived], objc_msgSend(v7, "countOfBytesExpectedToReceive"), v9);

  return v10;
}

- (id)realTimeSpeedMetricOverall
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = self->taskDict;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v3);
        }
        long long v10 = -[NSMutableDictionary objectForKey:](self->taskDict, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        long long v11 = [v10 task];
        v7 += [v11 countOfBytesReceived];

        long long v12 = [v10 task];
        v6 += [v12 countOfBytesExpectedToReceive];
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }

  id v13 = objc_alloc_init(MEMORY[0x263EFF910]);
  [v13 timeIntervalSinceDate:self->initialTime];
  uint64_t v15 = [[NPTSpeedMetric alloc] initWithPointInTime:v13 timeSinceStart:v7 bytesTransferred:v6 totalBytesExpected:v14];

  return v15;
}

- (id)overAllResultByTask:(unint64_t)a3
{
  taskDict = self->taskDict;
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  uint64_t v5 = [(NSMutableDictionary *)taskDict objectForKeyedSubscript:v4];

  uint64_t v6 = [v5 results];

  return v6;
}

- (double)minNonZeroValue:(double)a3 comparisonValue:(double)a4
{
  if (a3 != 0.0)
  {
    if (a4 <= 0.0)
    {
      return a3;
    }
    else if (a3 < a4)
    {
      return a3;
    }
  }
  return a4;
}

- (void)completeActivityWithReason:(int)a3
{
  if (self->downloadActivity && nw_activity_is_activated())
  {
    uint64_t v4 = +[NPTLogger network];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_219415000, v4, OS_LOG_TYPE_DEFAULT, "Completing downloadActivity", v6, 2u);
    }

    nw_activity_complete_with_reason();
    downloadActivity = self->downloadActivity;
    self->downloadActivity = 0;
  }
}

- (id)aggregateResults
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(NPTMetricResult);
  v116 = self;
  if ([(NSMutableDictionary *)self->taskDict count])
  {
    uint64_t v4 = [(NSMutableDictionary *)self->taskDict allKeys];
    uint64_t v5 = [v4 objectAtIndex:0];

    uint64_t v6 = [(NSMutableDictionary *)v116->taskDict objectForKeyedSubscript:v5];
    uint64_t v7 = [v6 taskMetrics];
    uint64_t v8 = [v7 transactionMetrics];
    double v9 = [v8 firstObject];
    uint64_t v10 = [v9 responseStartDate];

    long long v11 = [(NSMutableDictionary *)v116->taskDict objectForKeyedSubscript:v5];
    long long v12 = [v11 taskMetrics];
    id v13 = [v12 transactionMetrics];
    double v14 = [v13 firstObject];
    uint64_t v15 = [v14 responseEndDate];

    endTimeAggregate = v116->endTimeAggregate;
    if (endTimeAggregate)
    {
      long long v17 = endTimeAggregate;

      long long v18 = +[NPTLogger network];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219415000, v18, OS_LOG_TYPE_DEFAULT, "Download using synthesized end time", buf, 2u);
      }

      v114 = v17;
    }
    else
    {
      v114 = v15;
    }
    v108 = (void *)v5;
    long long v20 = [(NSMutableDictionary *)v116->taskDict objectForKeyedSubscript:v5];
    id v21 = [v20 results];
    uint64_t v22 = (void *)[v21 copy];

    [v22 setSpeed:0.0];
    [v22 setFileSize:0];
    double v23 = [NSNumber numberWithUnsignedLong:v116->maxConcurrentStreams];
    [v22 setConcurrentStreams:v23];

    [v22 setError:v116->downloadError];
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    obj = v116->taskDict;
    double v24 = (NSDate *)v10;
    uint64_t v113 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v118 objects:v132 count:16];
    if (v113)
    {
      uint64_t v112 = *(void *)v119;
      v111 = v22;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v119 != v112) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v118 + 1) + 8 * v25);
          uint64_t v27 = [(NSMutableDictionary *)v116->taskDict objectForKey:v26];
          uint64_t v28 = [(NSMutableDictionary *)v116->taskDict objectForKeyedSubscript:v26];
          int v29 = [v28 taskMetrics];
          double v30 = [v29 transactionMetrics];
          __int16 v31 = [v30 firstObject];
          uint64_t v32 = [v31 responseStartDate];

          __int16 v33 = [(NSMutableDictionary *)v116->taskDict objectForKeyedSubscript:v26];
          uint64_t v34 = [v33 taskMetrics];
          uint64_t v35 = [v34 transactionMetrics];
          id v36 = [v35 firstObject];
          v117 = [v36 responseEndDate];

          id v37 = v32;
          if (v32 && (!v24 || [(NSDate *)v24 compare:v32] == NSOrderedDescending))
          {
            __int16 v38 = v32;

            double v24 = v38;
          }
          uint64_t v39 = v117;
          uint64_t v22 = v111;
          v115 = v24;
          if (v117 && (!v114 || [(NSDate *)v114 compare:v117] == NSOrderedAscending))
          {
            uint64_t v40 = v117;

            v114 = v40;
          }
          uint64_t v41 = +[NPTLogger network];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = [v27 task];
            [v27 results];
            v43 = v110 = v37;
            [v43 domainLookupTime];
            v45 = v44;
            v46 = [v27 results];
            [v46 connectionTime];
            uint64_t v48 = v47;
            v49 = [v27 results];
            [v49 requestTime];
            uint64_t v51 = v50;
            v52 = [v27 results];
            [v52 responseTime];
            *(_DWORD *)buf = 138413314;
            v123 = v42;
            __int16 v124 = 2048;
            v125 = v45;
            __int16 v126 = 2048;
            uint64_t v127 = v48;
            __int16 v128 = 2048;
            uint64_t v129 = v51;
            __int16 v130 = 2048;
            uint64_t v131 = v53;
            _os_log_impl(&dword_219415000, v41, OS_LOG_TYPE_DEFAULT, "Download Task: %@ DomainLookupTime: %f, connectionTime: %f, requestTime: %f, responseTime: %f", buf, 0x34u);

            uint64_t v39 = v117;
            id v37 = v110;
          }
          v54 = [v27 results];
          objc_msgSend(v111, "setFileSize:", objc_msgSend(v111, "fileSize") + objc_msgSend(v54, "fileSize"));

          [v111 domainLookupTime];
          double v56 = v55;
          v57 = [v27 results];
          [v57 domainLookupTime];
          [(NPTDownload *)v116 minNonZeroValue:v56 comparisonValue:v58];
          objc_msgSend(v111, "setDomainLookupTime:");

          [v111 connectionTime];
          double v60 = v59;
          v61 = [v27 results];
          [v61 connectionTime];
          [(NPTDownload *)v116 minNonZeroValue:v60 comparisonValue:v62];
          objc_msgSend(v111, "setConnectionTime:");

          [v111 secureConnectionTime];
          double v64 = v63;
          v65 = [v27 results];
          [v65 secureConnectionTime];
          [(NPTDownload *)v116 minNonZeroValue:v64 comparisonValue:v66];
          objc_msgSend(v111, "setSecureConnectionTime:");

          [v111 requestTime];
          double v68 = v67;
          v69 = [v27 results];
          [v69 requestTime];
          [(NPTDownload *)v116 minNonZeroValue:v68 comparisonValue:v70];
          objc_msgSend(v111, "setRequestTime:");

          [v111 requestToResponseTime];
          double v72 = v71;
          v73 = [v27 results];
          [v73 requestToResponseTime];
          [(NPTDownload *)v116 minNonZeroValue:v72 comparisonValue:v74];
          objc_msgSend(v111, "setRequestToResponseTime:");

          v75 = [v27 results];
          v76 = [v75 cdnpop];
          uint64_t v77 = [v76 length];

          if (v77)
          {
            v78 = [v27 results];
            v79 = [v78 cdnpop];
            [v111 setCdnpop:v79];

            v80 = +[NPTLogger network];
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              v95 = [v27 task];
              v96 = [v27 results];
              [v96 cdnpop];
              v98 = v97 = v37;
              *(_DWORD *)buf = 138412546;
              v123 = v95;
              __int16 v124 = 2112;
              v125 = v98;
              _os_log_debug_impl(&dword_219415000, v80, OS_LOG_TYPE_DEBUG, "Task: %@ CDN point of presence: %@", buf, 0x16u);

              id v37 = v97;
            }
          }
          v81 = [v27 results];
          v82 = [v81 server];
          uint64_t v83 = [v82 length];

          if (v83)
          {
            v84 = [v27 results];
            v85 = [v84 server];
            [v111 setServer:v85];
          }
          v86 = [v27 results];
          v87 = [v86 appleClientASNCompany];
          uint64_t v88 = [v87 length];

          if (v88)
          {
            v89 = [v27 results];
            v90 = [v89 appleClientASNCompany];
            [v111 setAppleClientASNCompany:v90];
          }
          v91 = [v27 results];
          v92 = [v91 appleClientASN];

          if (v92)
          {
            v93 = [v27 results];
            v94 = [v93 appleClientASN];
            [v111 setAppleClientASN:v94];
          }
          ++v25;
          double v24 = v115;
        }
        while (v113 != v25);
        uint64_t v113 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v118 objects:v132 count:16];
      }
      while (v113);
    }

    if (!v24)
    {
      double v24 = v116->initialTime;
      v99 = +[NPTLogger network];
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219415000, v99, OS_LOG_TYPE_DEFAULT, "Download using synthesized start time", buf, 2u);
      }
    }
    [(NSDate *)v114 timeIntervalSinceDate:v24];
    if (v100 > 0.0)
    {
      objc_msgSend(v22, "setResponseTime:");
      double v101 = (double)(unint64_t)[v22 fileSize] * 8.0;
      [(NSDate *)v114 timeIntervalSinceDate:v24];
      [v22 setSpeed:v101 / v102 / 1000000.0];
    }
    v103 = +[NPTLogger network];
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      [v22 speed];
      *(_DWORD *)buf = 134217984;
      v123 = v104;
      _os_log_impl(&dword_219415000, v103, OS_LOG_TYPE_DEFAULT, "Download performance test has finished at %f Mbps", buf, 0xCu);
    }

    [v22 speed];
    if (v105 > v116->maxSpeedObserved)
    {
      [v22 speed];
      v116->maxSpeedObserved = v106;
    }
    objc_msgSend(v22, "setMaxSpeedObserved:");
    if (v116->stableSpeedToLog > 0.0) {
      objc_msgSend(v22, "setStableSpeed:");
    }
    long long v19 = v22;
  }
  else
  {
    long long v19 = v3;
  }

  return v19;
}

- (BOOL)finishedAllTasks
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = self->taskDict;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMutableDictionary objectForKey:](self->taskDict, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        double v9 = [v8 taskMetrics];

        if (!v9)
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)processNQResult:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v50 = a3;
  id obj = [v50 urlSessionMetrics];
  uint64_t v4 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v55;
    unint64_t v7 = 0x2643A1000uLL;
    uint64_t v49 = *(void *)v55;
    do
    {
      uint64_t v8 = 0;
      uint64_t v51 = v5;
      do
      {
        if (*(void *)v55 != v6) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
        if ([v9 hasPrefix:@"tp_"])
        {
          uint64_t v53 = v8;
          BOOL v10 = [v50 urlSessionMetrics];
          long long v11 = [v10 objectForKeyedSubscript:v9];

          if ([v11 count])
          {
            unint64_t v12 = 0;
            do
            {
              long long v13 = [v11 objectAtIndexedSubscript:v12];
              id v14 = objc_alloc_init(*(Class *)(v7 + 984));
              [v14 populateWithMetrics:v13];
              long long v15 = [v13 transactionMetrics];
              uint64_t v16 = [v15 firstObject];
              [v16 response];
              long long v18 = v17 = v7;
              [v14 populateWithURLResponse:v18];

              long long v19 = objc_alloc_init(NPTTaskMetrics);
              long long v20 = [v11 objectAtIndexedSubscript:v12];
              [(NPTTaskMetrics *)v19 setTaskMetrics:v20];

              [(NPTTaskMetrics *)v19 setResults:v14];
              taskDict = self->taskDict;
              uint64_t v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v12);
              [(NSMutableDictionary *)taskDict setObject:v19 forKeyedSubscript:v22];

              unint64_t v7 = v17;
              ++v12;
            }
            while ([v11 count] > v12);
          }

          uint64_t v6 = v49;
          uint64_t v5 = v51;
          uint64_t v8 = v53;
        }
        ++v8;
      }
      while (v8 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v5);
  }

  double v23 = [(NPTDownload *)self aggregateResults];
  [v23 setMaxSpeedObserved:self->maxSpeedObserved];
  double v24 = [v50 downlinkBytesTransferred];
  objc_msgSend(v23, "setFileSize:", objc_msgSend(v24, "unsignedIntValue"));

  uint64_t v25 = [v50 downlinkCapacity];
  uint64_t v26 = [v25 value];
  [v26 doubleValue];
  [v23 setSpeed:v27 / 1000000.0];

  uint64_t v28 = [v50 downlinkCapacity];
  int v29 = [v28 rating];
  if (v29)
  {
    [v23 setSpeedRating:v29];
  }
  else
  {
    double v30 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    [v23 setSpeedRating:v30];
  }
  id v31 = objc_alloc(NSNumber);
  uint64_t v32 = [v50 downlinkCapacity];
  __int16 v33 = objc_msgSend(v31, "initWithInteger:", objc_msgSend(v32, "confidence"));
  [v23 setSpeedConfidence:v33];

  uint64_t v34 = [v50 downlinkResponsiveness];
  uint64_t v35 = [v34 value];
  if (v35)
  {
    [v23 setResponsiveness:v35];
  }
  else
  {
    id v36 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    [v23 setResponsiveness:v36];
  }
  id v37 = [v50 downlinkResponsiveness];
  __int16 v38 = [v37 rating];
  if (v38)
  {
    [v23 setResponsivenessRating:v38];
  }
  else
  {
    uint64_t v39 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    [v23 setResponsivenessRating:v39];
  }
  id v40 = objc_alloc(NSNumber);
  uint64_t v41 = [v50 downlinkResponsiveness];
  v42 = objc_msgSend(v40, "initWithInteger:", objc_msgSend(v41, "confidence"));
  [v23 setResponsivenessConfidence:v42];

  v43 = [v50 downlinkFlows];
  if (v43)
  {
    [v23 setConcurrentStreams:v43];
  }
  else
  {
    v44 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    [v23 setConcurrentStreams:v44];
  }
  v45 = [v50 latency];
  v46 = [v45 value];
  [v23 setLatency:v46];

  uint64_t v47 = [v50 testEndpoint];
  [v23 setNqTestEndPoint:v47];

  return v23;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPTMetricResult)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->nqConfig, 0);
  objc_storeStrong((id *)&self->nqTest, 0);
  objc_storeStrong((id *)&self->testConfig, 0);
  objc_storeStrong((id *)&self->callingClient, 0);
  objc_storeStrong((id *)&self->downloadError, 0);
  objc_storeStrong((id *)&self->endTimeAggregate, 0);
  objc_storeStrong((id *)&self->buffer, 0);
  objc_storeStrong((id *)&self->timeoutTimer, 0);
  objc_storeStrong((id *)&self->taskDict, 0);
  objc_storeStrong((id *)&self->downloadActivity, 0);
  objc_storeStrong((id *)&self->activityParent, 0);
  objc_storeStrong((id *)&self->request, 0);
  objc_storeStrong((id *)&self->initialTime, 0);

  objc_storeStrong((id *)&self->downloadSession, 0);
}

- (void)URLSession:(uint64_t)a1 task:(void *)a2 didCompleteWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  double v9 = v5;
  _os_log_error_impl(&dword_219415000, a3, OS_LOG_TYPE_ERROR, "Download task: %@ Errored with: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end