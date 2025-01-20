@interface NPTUpload
+ (BOOL)supportsSecureCoding;
- (BOOL)finishedAllTasks;
- (BOOL)inTimedMode;
- (BOOL)isLastTask;
- (BOOL)isTimerCancelledError:(id)a3;
- (NPTMetricResult)results;
- (NPTUpload)initWithCoder:(id)a3;
- (NPTUpload)initWithNetworkActivityParent:(id)a3 testConfiguration:(id)a4;
- (double)checkAndReturnSpeedStablized:(id)a3;
- (double)minNonZeroValue:(double)a3 comparisonValue:(double)a4;
- (id)aggregateResults;
- (id)checkInterfaceSpecified;
- (id)completion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createHTTPBodyWithBoundary:(id)a3 usingData:(id)a4 withMimeType:(id)a5 withFileName:(id)a6;
- (id)createRandomDataOfSize:(unint64_t)a3;
- (id)createTempFileWithData:(id)a3 named:(id)a4;
- (id)delegate;
- (id)processNQResult:(id)a3;
- (id)realTimeSpeedMetricOverall;
- (id)setupNewUploadTask:(unint64_t)a3 suspensionThresholdEnum:(int)a4;
- (int)determineSuspensionThreshold;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)cancel;
- (void)cancelDispatchTimer;
- (void)cancelDispatchTimerAndSession;
- (void)cleanUp;
- (void)completeActivityWithReason:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)kickOffNewUpload:(int64_t)a3 suspensionThresholdEnum:(int)a4;
- (void)progress:(id)a3;
- (void)removeTempFileNamed:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResults:(id)a3;
- (void)setupTimer;
- (void)startLegacyUploadWithCompletion:(id)a3;
- (void)startNQUploadWithCompletion:(id)a3;
- (void)startTasks;
- (void)startUploadWithCompletion:(id)a3;
@end

@implementation NPTUpload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTUpload)initWithNetworkActivityParent:(id)a3 testConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NPTUpload;
  v9 = [(NPTUpload *)&v25 init];
  if (v9)
  {
    v10 = objc_alloc_init(NPTMetricResult);
    [(NPTUpload *)v9 setResults:v10];

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    taskDict = v9->taskDict;
    v9->taskDict = (NSMutableDictionary *)v11;

    uint64_t v13 = nw_activity_create();
    uploadActivity = v9->uploadActivity;
    v9->uploadActivity = (OS_nw_activity *)v13;

    objc_storeStrong((id *)&v9->activityParent, a3);
    nw_activity_set_parent_activity();
    if ([v8 stopAtFileSize]) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = [v8 concurrentStreams];
    }
    v9->maxConcurrentStreams = v15;
    v9->processedStreamEndCount = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    buffer = v9->buffer;
    v9->buffer = v16;

    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    v9->recentBufferTime = v18;
    v9->timedUploadLength = [v8 testDuration];
    v9->smartUpload = [v8 endWhenStable];
    uploadError = v9->uploadError;
    v9->stableSpeedToLog = 0.0;
    v9->uploadError = 0;

    v9->stopAtFileSizeEnabled = [v8 stopAtFileSize];
    uint64_t v20 = [v8 clientName];
    callingClient = v9->callingClient;
    v9->callingClient = (NSString *)v20;

    v9->maxSpeedObserved = 0.0;
    objc_storeStrong((id *)&v9->testConfig, a4);
    v9->legacy = [v8 legacyMode];
    nqConfig = v9->nqConfig;
    v9->nqConfig = 0;

    nqTest = v9->nqTest;
    v9->nqTest = 0;
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NPTUpload *)self results];
  [v4 encodeObject:v5 forKey:@"uploadResult"];
}

- (NPTUpload)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NPTUpload;
  id v3 = a3;
  id v4 = [(NPTUpload *)&v7 init];
  id v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"uploadResult", v7.receiver, v7.super_class);

  [(NPTUpload *)v4 setResults:v5];
  return v4;
}

- (void)startNQUploadWithCompletion:(id)a3
{
  id v4 = a3;
  [(NPTUpload *)self setCompletion:v4];
  id v5 = [(NPTPerformanceTestConfiguration *)self->testConfig NQUploadConfiguration];
  nqConfig = self->nqConfig;
  self->nqConfig = v5;

  objc_super v7 = [(NPTPerformanceTestConfiguration *)self->testConfig bonjourHost];

  if (v7)
  {
    id v8 = [(NPTPerformanceTestConfiguration *)self->testConfig bonjourHost];
    [(NetworkQualityConfiguration *)self->nqConfig setBonjourHost:v8];

    [(NetworkQualityConfiguration *)self->nqConfig setValidateCertificate:0];
  }
  nw_activity_activate();
  v9 = [(NPTUpload *)self checkInterfaceSpecified];
  v10 = [(NPTUpload *)self results];
  [v10 setError:v9];

  if (v9)
  {
    uint64_t v11 = [(NPTUpload *)self delegate];

    if (v11)
    {
      v12 = [(NPTUpload *)self delegate];
      [v12 upload:self didFinishWithError:v9];
    }
    uint64_t v13 = [(NPTUpload *)self completion];

    if (v13)
    {
      v14 = [(NPTUpload *)self completion];
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
      v21 = [(NPTUpload *)self delegate];

      if (v21)
      {
        v22 = [(NPTUpload *)self delegate];
        [v22 uploadWillStart];
      }
    }
    objc_initWeak(&location, self);
    v23 = self->nqTest;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __41__NPTUpload_startNQUploadWithCompletion___block_invoke;
    v24[3] = &unk_2643A17C0;
    objc_copyWeak(&v25, &location);
    [(NetworkQualityAssessment *)v23 runWithCompletionHandler:v24];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

void __41__NPTUpload_startNQUploadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = (id *)(a1 + 32);
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = +[NPTLogger network];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v5 debugDescription];
    int v25 = 138412546;
    v26 = v10;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_219415000, v9, OS_LOG_TYPE_DEFAULT, "Test complete %@, %@", (uint8_t *)&v25, 0x16u);
  }
  uint64_t v11 = (id *)(WeakRetained + 136);
  if (*((void *)WeakRetained + 17)) {
    v12 = (void *)*((void *)WeakRetained + 17);
  }
  else {
    v12 = v6;
  }
  objc_storeStrong((id *)WeakRetained + 17, v12);
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
      [v19 upload:WeakRetained didFinishWithError:v6];
    }
    else
    {
      v19 = [WeakRetained delegate];
      uint64_t v20 = [WeakRetained results];
      [v19 upload:WeakRetained didFinishWithResults:v20];
    }
  }
  v21 = [WeakRetained completion];

  if (v21)
  {
    v22 = [WeakRetained completion];
    id v23 = objc_loadWeakRetained(v7);
    v24 = [v23 results];
    ((void (**)(void, void *, id))v22)[2](v22, v24, v6);
  }
}

- (void)startUploadWithCompletion:(id)a3
{
  if (self->legacy) {
    [(NPTUpload *)self startLegacyUploadWithCompletion:a3];
  }
  else {
    [(NPTUpload *)self startNQUploadWithCompletion:a3];
  }
}

- (void)startLegacyUploadWithCompletion:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  [(NPTUpload *)self setCompletion:a3];
  nw_activity_activate();
  id v4 = [(NPTUpload *)self checkInterfaceSpecified];
  id v5 = [(NPTUpload *)self results];
  [v5 setError:v4];

  if (v4)
  {
    id v6 = [(NPTUpload *)self delegate];

    if (v6)
    {
      objc_super v7 = [(NPTUpload *)self delegate];
      [v7 upload:self didFinishWithError:v4];
    }
    id v8 = [(NPTUpload *)self completion];

    if (v8)
    {
      v9 = [(NPTUpload *)self completion];
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
    [v12 setMaxConcurrentOperationCount:1];
    [v12 setQualityOfService:33];
    [v11 setAllowsCellularAccess:v10];
    [v11 setWaitsForConnectivity:0];
    [v11 setTimeoutIntervalForRequest:3.0];
    if (!self->timedUploadLength) {
      [v11 setTimeoutIntervalForResource:(double)(90 * self->maxConcurrentStreams)];
    }
    [v11 setHTTPMaximumConnectionsPerHost:self->maxConcurrentStreams + 1];
    uint64_t v13 = [MEMORY[0x263EFC640] sessionWithConfiguration:v11 delegate:self delegateQueue:v12];
    uploadSession = self->uploadSession;
    self->uploadSession = v13;

    id v15 = (void *)MEMORY[0x263EFC5E8];
    uint64_t v16 = [(NPTPerformanceTestConfiguration *)self->testConfig uploadURL];
    v17 = [v15 requestWithURL:v16];
    request = self->request;
    self->request = v17;

    [(NSMutableURLRequest *)self->request setHTTPMethod:@"POST"];
    unint64_t timedUploadLength = self->timedUploadLength;
    double v20 = (double)timedUploadLength * 0.9;
    if (!timedUploadLength) {
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
        unint64_t v51 = (unint64_t)v24;
        _os_log_impl(&dword_219415000, v23, OS_LOG_TYPE_DEFAULT, "Force the upload over the following interface: %@", buf, 0xCu);
      }
      int v25 = self->request;
      v26 = [(NPTPerformanceTestConfiguration *)self->testConfig interfaceName];
      [(NSMutableURLRequest *)v25 setBoundInterfaceIdentifier:v26];
    }
    __int16 v27 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.wifiqa.NPTKit"];
    id v28 = [v27 infoDictionary];
    uint64_t v29 = [v28 objectForKey:@"CFBundleShortVersionString"];

    v30 = [NSString stringWithFormat:@"NPTKit/%@", v29];
    [(NSMutableURLRequest *)self->request addValue:v30 forHTTPHeaderField:@"User-Agent"];
    uint64_t v31 = [(NPTPerformanceTestConfiguration *)self->testConfig uploadSize];
    if ([(NPTUpload *)self inTimedMode])
    {
      if ([(NPTPerformanceTestConfiguration *)self->testConfig uploadSize] == 1001) {
        uint64_t v31 = 50;
      }
      else {
        uint64_t v31 = v31;
      }
    }
    v32 = [MEMORY[0x263F08C38] UUID];
    v33 = [v32 UUIDString];

    unint64_t v34 = +[NPTFileSizeConverter getFileSizeInBytes:v31];
    self->unint64_t uploadFileSize = v34;
    uint64_t v35 = (int)v34;
    v36 = [(NPTUpload *)self results];
    [v36 setFileSize:v35];

    v37 = self->request;
    v38 = [NSString stringWithFormat:@"multipart/form-data boundary=%@", v33];;
    [(NSMutableURLRequest *)v37 setValue:v38 forHTTPHeaderField:@"Content-Type"];

    if (self->uploadSession)
    {
      v39 = [(NPTUpload *)self delegate];

      if (v39)
      {
        v40 = [(NPTUpload *)self delegate];
        [v40 uploadWillStart];
      }
      v41 = +[NPTLogger network];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t maxConcurrentStreams = self->maxConcurrentStreams;
        *(_DWORD *)buf = 134217984;
        unint64_t v51 = maxConcurrentStreams;
        _os_log_impl(&dword_219415000, v41, OS_LOG_TYPE_DEFAULT, "Will start upload task to test upload speed with %lu number of streams", buf, 0xCu);
      }

      if (self->maxConcurrentStreams)
      {
        unint64_t v43 = 0;
        do
        {
          if ([(NPTUpload *)self inTimedMode])
          {
            v44 = self;
            unint64_t uploadFileSize = 0x100000;
            uint64_t v46 = 0x8000;
          }
          else
          {
            unint64_t uploadFileSize = self->uploadFileSize;
            v44 = self;
            uint64_t v46 = 0x200000;
          }
          id v47 = [(NPTUpload *)v44 setupNewUploadTask:uploadFileSize suspensionThresholdEnum:v46];
          ++v43;
        }
        while (v43 < self->maxConcurrentStreams);
      }
      if (self->timedUploadLength) {
        [(NPTUpload *)self setupTimer];
      }
      if (!self->initialTime)
      {
        v48 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
        initialTime = self->initialTime;
        self->initialTime = v48;
      }
      [(NPTUpload *)self startTasks];
    }
  }
}

- (void)cancel
{
  [(NPTUpload *)self cancelDispatchTimerAndSession];
  [(NetworkQualityAssessment *)self->nqTest cancel];
  uploadSession = self->uploadSession;
  self->uploadSession = 0;
}

- (id)createRandomDataOfSize:(unint64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:");
  id v5 = (const __SecRandom *)*MEMORY[0x263F17510];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, a3, (void *)[v6 mutableBytes]))
  {
    objc_super v7 = +[NPTLogger network];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_219415000, v7, OS_LOG_TYPE_DEFAULT, "Failed to generate random bytes to upload ", v11, 2u);
    }

    id v8 = [MEMORY[0x263EFF990] dataWithLength:a3];
  }
  else
  {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)createTempFileWithData:(id)a3 named:(id)a4
{
  id v6 = (void *)MEMORY[0x263F08850];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultManager];
  BOOL v10 = [v9 temporaryDirectory];

  uint64_t v11 = [v10 URLByAppendingPathComponent:v7 isDirectory:0];

  id v17 = 0;
  int v12 = [v8 writeToURL:v11 options:1 error:&v17];

  id v13 = v17;
  if (v13)
  {
    [(NSURLSession *)self->uploadSession invalidateAndCancel];
    v14 = +[NPTLogger fileSystem];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NPTUpload createTempFileWithData:named:](v13);
    }
  }
  if (v12) {
    id v15 = v11;
  }
  else {
    id v15 = 0;
  }

  return v15;
}

- (void)removeTempFileNamed:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  id v7 = [v6 temporaryDirectory];

  id v8 = [v7 URLByAppendingPathComponent:v5 isDirectory:0];

  v9 = [MEMORY[0x263F08850] defaultManager];
  id v14 = 0;
  [v9 removeItemAtURL:v8 error:&v14];
  id v10 = v14;

  if (v10)
  {
    uint64_t v11 = +[NPTLogger fileSystem];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NPTUpload removeTempFileNamed:](v10);
    }

    [(NSURLSession *)self->uploadSession invalidateAndCancel];
    int v12 = [(NPTUpload *)self delegate];

    if (v12)
    {
      id v13 = [(NPTUpload *)self delegate];
      [v13 upload:self didFinishWithError:v10];
    }
  }
}

- (void)setupTimer
{
  id v3 = dispatch_get_global_queue(0, 0);
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
  timeoutTimer = self->timeoutTimer;
  self->timeoutTimer = v4;

  id v6 = self->timeoutTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __23__NPTUpload_setupTimer__block_invoke;
  handler[3] = &unk_2643A17E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  id v7 = self->timeoutTimer;
  dispatch_time_t v8 = dispatch_time(0, 1000000000 * self->timedUploadLength);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_cancel_handler((dispatch_source_t)self->timeoutTimer, &__block_literal_global);
  dispatch_activate((dispatch_object_t)self->timeoutTimer);
}

uint64_t __23__NPTUpload_setupTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 72);
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
    _os_log_impl(&dword_219415000, v9, OS_LOG_TYPE_DEFAULT, "Timed Upload timer ended", v11, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) invalidateAndCancel];
}

- (void)kickOffNewUpload:(int64_t)a3 suspensionThresholdEnum:(int)a4
{
  id v4 = [(NPTUpload *)self setupNewUploadTask:a3 suspensionThresholdEnum:*(void *)&a4];
  [v4 resume];
}

- (id)setupNewUploadTask:(unint64_t)a3 suspensionThresholdEnum:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v15[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_alloc_init(NPTTaskMetrics);
  dispatch_time_t v8 = objc_alloc_init(NPTMetricResult);
  [(NPTMetricResult *)v8 setFileSize:a3];
  v9 = [(NSURLSession *)self->uploadSession uploadTaskWithStreamedRequest:self->request];
  uint64_t v14 = *MEMORY[0x263EFC890];
  id v10 = [NSNumber numberWithUnsignedInt:v4];
  v15[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v9 _setSocketProperties:0 connectionProperties:v11];

  int v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v9, "taskIdentifier"));
  [(NPTTaskMetrics *)v7 setTask:v9];
  [(NPTTaskMetrics *)v7 setResults:v8];
  [(NSMutableDictionary *)self->taskDict setObject:v7 forKeyedSubscript:v12];
  objc_msgSend(v9, "set_nw_activity:", self->uploadActivity);

  return v9;
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  uint64_t v14 = (void (**)(id, NPTUploadDataStream *))a5;
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(a4, "taskIdentifier"));
  dispatch_time_t v8 = [(NSMutableDictionary *)self->taskDict objectForKeyedSubscript:v7];
  v9 = [v8 results];

  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->taskDict objectForKeyedSubscript:v7];
    uint64_t v11 = [v10 results];
    uint64_t v12 = [v11 fileSize];

    id v13 = [[NPTUploadDataStream alloc] initWithLength:v12];
    v14[2](v14, v13);
  }
}

- (void)cancelDispatchTimerAndSession
{
  id v3 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
  endTimeAggregate = self->endTimeAggregate;
  self->endTimeAggregate = v3;

  [(NPTUpload *)self cancelDispatchTimer];
  uploadSession = self->uploadSession;

  [(NSURLSession *)uploadSession invalidateAndCancel];
}

- (void)cancelDispatchTimer
{
  timeoutTimer = self->timeoutTimer;
  if (timeoutTimer && !dispatch_source_testcancel((dispatch_source_t)self->timeoutTimer))
  {
    dispatch_source_cancel(timeoutTimer);
    uint64_t v4 = self->timeoutTimer;
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
    id v10 = NSNumber;
    [v4 speed];
    uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
    [(NSMutableArray *)buffer addObject:v11];

    if ((unint64_t)[(NSMutableArray *)self->buffer count] >= 6) {
      [(NSMutableArray *)self->buffer removeObjectAtIndex:0];
    }
    if ([(NSMutableArray *)self->buffer count] == 5)
    {
      uint64_t v12 = [(NSMutableArray *)self->buffer valueForKeyPath:@"@avg.self"];
      [v12 doubleValue];
      double v14 = v13;

      id v15 = [(NSMutableArray *)self->buffer objectAtIndexedSubscript:4];
      [v15 doubleValue];
      double v17 = vabdd_f64(v16, v14);

      double v18 = [(NSMutableArray *)self->buffer objectAtIndexedSubscript:4];
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

- (id)createHTTPBodyWithBoundary:(id)a3 usingData:(id)a4 withMimeType:(id)a5 withFileName:(id)a6
{
  v9 = (void *)MEMORY[0x263EFF990];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  double v14 = [v9 data];
  id v15 = [NSString stringWithFormat:@"--%@\r\n", v13];
  double v16 = [v15 dataUsingEncoding:4];
  [v14 appendData:v16];

  objc_msgSend(NSString, "stringWithFormat:", @"Content-Disposition: form-data; name=\"%@\"; filename=\"upload\"\r\n",
  double v17 = v10);

  double v18 = [v17 dataUsingEncoding:4];
  [v14 appendData:v18];

  double v19 = [NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", v11];

  double v20 = [v19 dataUsingEncoding:4];
  [v14 appendData:v20];

  [v14 appendData:v12];
  double v21 = [@"\r\n" dataUsingEncoding:4];
  [v14 appendData:v21];

  v22 = [NSString stringWithFormat:@"--%@--\r\n", v13];

  id v23 = [v22 dataUsingEncoding:4];
  [v14 appendData:v23];

  return v14;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  taskDict = self->taskDict;
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v22, "taskIdentifier"));
  id v10 = [(NSMutableDictionary *)taskDict objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = objc_alloc_init(NPTMetricResult);
    [(NPTMetricResult *)v11 populateWithMetrics:v7];
    id v12 = [v22 response];
    [(NPTMetricResult *)v11 populateWithURLResponse:v12];

    -[NPTMetricResult setFileSize:](v11, "setFileSize:", [v22 countOfBytesSent]);
    if (!self->timedUploadLength)
    {
      id v13 = [(NPTUpload *)self results];
      -[NPTMetricResult setFileSize:](v11, "setFileSize:", [v13 fileSize]);
    }
    double v14 = (double)[(NPTMetricResult *)v11 fileSize] * 8.0;
    [(NPTMetricResult *)v11 requestTime];
    [(NPTMetricResult *)v11 setSpeed:v14 / v15 / 1000000.0];
    double v16 = self->taskDict;
    double v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v22, "taskIdentifier"));
    double v18 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v17];
    [v18 setTaskMetrics:v7];

    double v19 = self->taskDict;
    double v20 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v22, "taskIdentifier"));
    double v21 = [(NSMutableDictionary *)v19 objectForKeyedSubscript:v20];
    [v21 setResults:v11];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v8 = [(NPTUpload *)self realTimeSpeedMetricOverall];
  v9 = [(NPTUpload *)self delegate];

  if (v9)
  {
    id v10 = [(NPTUpload *)self delegate];
    [v10 upload:self didReceiveSpeedMetric:v8];
  }
  [v8 speed];
  if (v11 > self->maxSpeedObserved)
  {
    [v8 speed];
    self->maxSpeedObserved = v12;
  }
  if (self->stableSpeedToLog == 0.0)
  {
    [(NPTUpload *)self checkAndReturnSpeedStablized:v8];
    if (v13 > 0.0)
    {
      double v14 = v13;
      self->stableSpeedToLog = v13;
      double v15 = +[NPTLogger network];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v8 bytesTransferred];
        [v8 timeSinceStart];
        int v18 = 134218496;
        double v19 = v14;
        __int16 v20 = 2048;
        uint64_t v21 = v16;
        __int16 v22 = 2048;
        uint64_t v23 = v17;
        _os_log_impl(&dword_219415000, v15, OS_LOG_TYPE_DEFAULT, "Upload task has stabilized at %f Mbps after uploading %lld bytes over %f seconds", (uint8_t *)&v18, 0x20u);
      }

      if (self->smartUpload) {
        [(NPTUpload *)self cancelDispatchTimerAndSession];
      }
    }
  }
}

- (int)determineSuspensionThreshold
{
  uint64_t v2 = [(NPTUpload *)self realTimeSpeedMetricOverall];
  [v2 speed];
  if (v3 >= 24.0)
  {
    [v2 speed];
    if (v5 >= 96.0)
    {
      [v2 speed];
      if (v6 >= 192.0)
      {
        [v2 speed];
        if (v7 >= 384.0) {
          int v4 = 0x200000;
        }
        else {
          int v4 = 0x80000;
        }
      }
      else
      {
        int v4 = 0x40000;
      }
    }
    else
    {
      int v4 = 0x20000;
    }
  }
  else
  {
    int v4 = 0x8000;
  }

  return v4;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (void *)[v10 copy];
  if (v11 && ![(NPTUpload *)self isTimerCancelledError:v11]) {
    goto LABEL_6;
  }
  double v12 = [v9 response];
  double v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 statusCode];
    if (v14 > 399)
    {
      uint64_t v15 = v14;
      uint64_t v16 = [NSString stringWithFormat:@"Upload task: %@ failed to Upload payload due to: %ld", v9, v14];
      uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
      [v17 setValue:v16 forKey:*MEMORY[0x263F08320]];
      uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPTKit" code:v15 userInfo:v17];

      double v11 = (void *)v18;
      if (v18)
      {
LABEL_6:
        double v19 = +[NPTLogger network];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[NPTUpload URLSession:task:didCompleteWithError:]((uint64_t)v9, v11, v19);
        }

        uploadError = self->uploadError;
        ++self->processedStreamEndCount;
        if (!uploadError)
        {
          objc_storeStrong((id *)&self->uploadError, v11);
          if (!self->endTimeAggregate && self->timedUploadLength) {
            [(NPTUpload *)self cancelDispatchTimerAndSession];
          }
          if (!self->timedUploadLength)
          {
            uploadSession = self->uploadSession;
            if (uploadSession) {
              [(NSURLSession *)uploadSession invalidateAndCancel];
            }
          }
        }
        goto LABEL_24;
      }
LABEL_23:
      double v11 = 0;
      ++self->processedStreamEndCount;
LABEL_24:
      if ([(NPTUpload *)self isLastTask])
      {
        int v25 = self->uploadError;
        if (v25)
        {
          if ([(NSError *)v25 code] == -999) {
            uint64_t v26 = 4;
          }
          else {
            uint64_t v26 = 3;
          }
        }
        else
        {
          if (!self->endTimeAggregate && self->timedUploadLength) {
            [(NPTUpload *)self cancelDispatchTimer];
          }
          [(NSURLSession *)self->uploadSession finishTasksAndInvalidate];
          uint64_t v26 = 2;
        }
        [(NPTUpload *)self completeActivityWithReason:v26];
        uint64_t v27 = [(NPTUpload *)self aggregateResults];
        [(NPTUpload *)self setResults:v27];

        id v28 = [(NPTUpload *)self delegate];
        LOBYTE(v27) = v28 == 0;

        if ((v27 & 1) == 0)
        {
          BOOL v29 = self->uploadError == 0;
          v30 = [(NPTUpload *)self delegate];
          uint64_t v31 = v30;
          if (v29)
          {
            v32 = [(NPTUpload *)self results];
            [v31 upload:self didFinishWithResults:v32];
          }
          else
          {
            [v30 upload:self didFinishWithError:self->uploadError];
          }
        }
        v33 = [(NPTUpload *)self completion];
        BOOL v34 = v33 == 0;

        if (!v34)
        {
          objc_initWeak((id *)buf, self);
          uint64_t v35 = [(NPTUpload *)self completion];
          id WeakRetained = objc_loadWeakRetained((id *)buf);
          v37 = [WeakRetained results];
          ((void (**)(void, void *, NSError *))v35)[2](v35, v37, self->uploadError);

          objc_destroyWeak((id *)buf);
        }
      }
      goto LABEL_40;
    }
  }
  __int16 v22 = +[NPTLogger network];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v39 = v9;
    __int16 v40 = 2048;
    uint64_t v41 = [v9 countOfBytesSent];
    _os_log_impl(&dword_219415000, v22, OS_LOG_TYPE_DEFAULT, "Upload task: %@ Upload: %lld bytes", buf, 0x16u);
  }

  if (self->endTimeAggregate || ![(NPTUpload *)self inTimedMode])
  {

    goto LABEL_23;
  }
  uint64_t v23 = [(NPTUpload *)self determineSuspensionThreshold];
  uint64_t v24 = +[NPTLogger network];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[NPTUpload URLSession:task:didCompleteWithError:]((uint64_t)v9, v23, v24);
  }

  [(NPTUpload *)self kickOffNewUpload:self->uploadFileSize suspensionThresholdEnum:v23];
  double v11 = 0;
LABEL_40:
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[NPTLogger network];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NPTUpload URLSession:didBecomeInvalidWithError:]((uint64_t)v7, v8);
    }

    [(NSURLSession *)self->uploadSession finishTasksAndInvalidate];
    [(NPTUpload *)self completeActivityWithReason:3];
    id v9 = [(NPTUpload *)self delegate];

    if (v9)
    {
      id v10 = [(NPTUpload *)self delegate];
      [v10 upload:self didFinishWithError:v7];
    }
    double v11 = [(NPTUpload *)self completion];

    if (v11)
    {
      double v12 = [(NPTUpload *)self completion];
      ((void (**)(void, void, id))v12)[2](v12, 0, v7);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = [+[NPTUpload allocWithZone:a3] init];
  double v5 = [(NPTUpload *)self results];
  [(NPTUpload *)v4 setResults:v5];

  return v4;
}

- (void)progress:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF910]);
  [v5 timeIntervalSinceDate:self->initialTime];
  double v7 = v6;
  id v8 = [v4 uplinkCapacity];
  id v9 = [v8 value];
  [v9 doubleValue];
  double v11 = v10 / 1000000.0;

  double v12 = +[NPTLogger network];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 134217984;
    double v30 = v11;
    _os_log_impl(&dword_219415000, v12, OS_LOG_TYPE_DEFAULT, "Upload progress speed: %f mbps", (uint8_t *)&v29, 0xCu);
  }

  double v13 = [NPTSpeedMetric alloc];
  uint64_t v14 = [v4 uplinkBytesTransferred];
  uint64_t v15 = (int)[v14 intValue];
  uint64_t v16 = [(NetworkQualityConfiguration *)self->nqConfig maxUplinkData];
  uint64_t v17 = [v4 uplinkResponsiveness];
  uint64_t v18 = [v17 value];
  double v19 = -[NPTSpeedMetric initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:speed:responsiveness:](v13, "initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:speed:responsiveness:", v5, v15, v16, (int)[v18 intValue], v7, v11);

  __int16 v20 = [(NPTUpload *)self delegate];

  if (v20)
  {
    uint64_t v21 = [(NPTUpload *)self delegate];
    [v21 upload:self didReceiveSpeedMetric:v19];
  }
  [(NPTSpeedMetric *)v19 speed];
  if (v22 > self->maxSpeedObserved)
  {
    [(NPTSpeedMetric *)v19 speed];
    self->maxSpeedObserved = v23;
  }
  if (self->stableSpeedToLog == 0.0)
  {
    [(NPTUpload *)self checkAndReturnSpeedStablized:v19];
    if (v24 > 0.0)
    {
      double v25 = v24;
      self->stableSpeedToLog = v24;
      uint64_t v26 = +[NPTLogger network];
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
        _os_log_impl(&dword_219415000, v26, OS_LOG_TYPE_DEFAULT, "Upload task has stabilized at %f Mbps after uploading %lld bytes over %f seconds", (uint8_t *)&v29, 0x20u);
      }
    }
  }
}

- (void)startTasks
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = self->taskDict;
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
        id v9 = [v8 task];
        [v9 resume];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)isTimerCancelledError:(id)a3
{
  return [a3 code] == -999 && self->uploadSession != 0;
}

- (BOOL)inTimedMode
{
  return self->timedUploadLength && !self->stopAtFileSizeEnabled;
}

- (BOOL)isLastTask
{
  return self->processedStreamEndCount == self->maxConcurrentStreams;
}

- (id)checkInterfaceSpecified
{
  v10[1] = *MEMORY[0x263EF8340];
  double v3 = [(NPTPerformanceTestConfiguration *)self->testConfig interfaceName];
  if (v3)
  {

LABEL_4:
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  if ([(NPTPerformanceTestConfiguration *)self->testConfig interfaceType] == 3) {
    goto LABEL_4;
  }
  uint64_t v6 = +[NPTPerformanceTestConfiguration interfaceServiceName:[(NPTPerformanceTestConfiguration *)self->testConfig interfaceType]];
  uint64_t v7 = [NSString stringWithFormat:@"Failed to find the interface: %@", v6];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.wifiqa.NPTKit" code:0 userInfo:v8];

LABEL_5:

  return v4;
}

- (id)realTimeSpeedMetricOverall
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v3 = self->taskDict;
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
        v7 += [v11 countOfBytesSent];

        long long v12 = [v10 task];
        v6 += [v12 countOfBytesExpectedToSend];
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
  if (self->uploadActivity && nw_activity_is_activated())
  {
    uint64_t v4 = +[NPTLogger network];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_219415000, v4, OS_LOG_TYPE_DEFAULT, "Completing uploadActivity", v6, 2u);
    }

    nw_activity_complete_with_reason();
    uploadActivity = self->uploadActivity;
    self->uploadActivity = 0;
  }
}

- (id)aggregateResults
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  double v3 = objc_alloc_init(NPTMetricResult);
  v116 = self;
  if ([(NSMutableDictionary *)self->taskDict count])
  {
    uint64_t v4 = [(NSMutableDictionary *)self->taskDict allKeys];
    uint64_t v5 = [v4 objectAtIndex:0];

    uint64_t v6 = [(NSMutableDictionary *)v116->taskDict objectForKeyedSubscript:v5];
    uint64_t v7 = [v6 taskMetrics];
    uint64_t v8 = [v7 transactionMetrics];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v9 requestStartDate];

    long long v11 = [(NSMutableDictionary *)v116->taskDict objectForKeyedSubscript:v5];
    long long v12 = [v11 taskMetrics];
    id v13 = [v12 transactionMetrics];
    double v14 = [v13 firstObject];
    uint64_t v15 = [v14 requestEndDate];

    endTimeAggregate = v116->endTimeAggregate;
    if (endTimeAggregate)
    {
      long long v17 = endTimeAggregate;

      long long v18 = +[NPTLogger network];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219415000, v18, OS_LOG_TYPE_DEFAULT, "Upload using synthesized end time", buf, 2u);
      }

      v114 = v17;
    }
    else
    {
      v114 = v15;
    }
    v108 = (void *)v5;
    long long v20 = [(NSMutableDictionary *)v116->taskDict objectForKeyedSubscript:v5];
    uint64_t v21 = [v20 results];
    uint64_t v22 = (void *)[v21 copy];

    [v22 setSpeed:0.0];
    [v22 setFileSize:0];
    double v23 = [NSNumber numberWithUnsignedLong:v116->maxConcurrentStreams];
    [v22 setConcurrentStreams:v23];

    [v22 setError:v116->uploadError];
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
          uint64_t v32 = [v31 requestStartDate];

          __int16 v33 = [(NSMutableDictionary *)v116->taskDict objectForKeyedSubscript:v26];
          uint64_t v34 = [v33 taskMetrics];
          uint64_t v35 = [v34 transactionMetrics];
          v36 = [v35 firstObject];
          v117 = [v36 requestEndDate];

          v37 = v32;
          if (v32 && (!v24 || [(NSDate *)v24 compare:v32] == NSOrderedDescending))
          {
            v38 = v32;

            double v24 = v38;
          }
          id v39 = v117;
          uint64_t v22 = v111;
          v115 = v24;
          if (v117 && (!v114 || [(NSDate *)v114 compare:v117] == NSOrderedAscending))
          {
            __int16 v40 = v117;

            v114 = v40;
          }
          uint64_t v41 = +[NPTLogger network];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v42 = [v27 task];
            [v27 results];
            unint64_t v43 = v110 = v37;
            [v43 domainLookupTime];
            v45 = v44;
            uint64_t v46 = [v27 results];
            [v46 connectionTime];
            uint64_t v48 = v47;
            v49 = [v27 results];
            [v49 requestTime];
            uint64_t v51 = v50;
            uint64_t v52 = [v27 results];
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
            _os_log_impl(&dword_219415000, v41, OS_LOG_TYPE_DEFAULT, "Upload Task: %@ DomainLookupTime: %f, connectionTime: %f, requestTime: %f, responseTime: %f", buf, 0x34u);

            id v39 = v117;
            v37 = v110;
          }
          v54 = [v27 results];
          objc_msgSend(v111, "setFileSize:", objc_msgSend(v111, "fileSize") + objc_msgSend(v54, "fileSize"));

          [v111 domainLookupTime];
          double v56 = v55;
          v57 = [v27 results];
          [v57 domainLookupTime];
          [(NPTUpload *)v116 minNonZeroValue:v56 comparisonValue:v58];
          objc_msgSend(v111, "setDomainLookupTime:");

          [v111 connectionTime];
          double v60 = v59;
          v61 = [v27 results];
          [v61 connectionTime];
          [(NPTUpload *)v116 minNonZeroValue:v60 comparisonValue:v62];
          objc_msgSend(v111, "setConnectionTime:");

          [v111 secureConnectionTime];
          double v64 = v63;
          v65 = [v27 results];
          [v65 secureConnectionTime];
          [(NPTUpload *)v116 minNonZeroValue:v64 comparisonValue:v66];
          objc_msgSend(v111, "setSecureConnectionTime:");

          [v111 responseTime];
          double v68 = v67;
          v69 = [v27 results];
          [v69 responseTime];
          [(NPTUpload *)v116 minNonZeroValue:v68 comparisonValue:v70];
          objc_msgSend(v111, "setResponseTime:");

          [v111 requestToResponseTime];
          double v72 = v71;
          v73 = [v27 results];
          [v73 requestToResponseTime];
          [(NPTUpload *)v116 minNonZeroValue:v72 comparisonValue:v74];
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

              v37 = v97;
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
        _os_log_impl(&dword_219415000, v99, OS_LOG_TYPE_DEFAULT, "Upload using synthesized start time", buf, 2u);
      }
    }
    [(NSDate *)v114 timeIntervalSinceDate:v24];
    if (v100 > 0.0)
    {
      objc_msgSend(v22, "setRequestTime:");
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
      _os_log_impl(&dword_219415000, v103, OS_LOG_TYPE_DEFAULT, "Upload performance test has finished at %f Mbps", buf, 0xCu);
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
  double v3 = self->taskDict;
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
        uint64_t v9 = [v8 taskMetrics];

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

- (void)cleanUp
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = self->taskDict;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMutableDictionary objectForKey:](self->taskDict, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v7), (void)v11);
        [v8 setTask:0];
        [v8 setTaskMetrics:0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uploadSession = self->uploadSession;
  self->uploadSession = 0;

  request = self->request;
  self->request = 0;
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
        uint64_t v9 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
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

  double v23 = [(NPTUpload *)self aggregateResults];
  [v23 setMaxSpeedObserved:self->maxSpeedObserved];
  double v24 = [v50 uplinkBytesTransferred];
  objc_msgSend(v23, "setFileSize:", objc_msgSend(v24, "unsignedIntValue"));

  uint64_t v25 = [v50 uplinkCapacity];
  uint64_t v26 = [v25 value];
  [v26 doubleValue];
  [v23 setSpeed:v27 / 1000000.0];

  uint64_t v28 = [v50 uplinkCapacity];
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
  uint64_t v32 = [v50 uplinkCapacity];
  __int16 v33 = objc_msgSend(v31, "initWithInteger:", objc_msgSend(v32, "confidence"));
  [v23 setSpeedConfidence:v33];

  uint64_t v34 = [v50 uplinkResponsiveness];
  uint64_t v35 = [v34 value];
  if (v35)
  {
    [v23 setResponsiveness:v35];
  }
  else
  {
    v36 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    [v23 setResponsiveness:v36];
  }
  v37 = [v50 uplinkResponsiveness];
  v38 = [v37 rating];
  if (v38)
  {
    [v23 setResponsivenessRating:v38];
  }
  else
  {
    id v39 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    [v23 setResponsivenessRating:v39];
  }
  id v40 = objc_alloc(NSNumber);
  uint64_t v41 = [v50 uplinkResponsiveness];
  uint64_t v42 = objc_msgSend(v40, "initWithInteger:", objc_msgSend(v41, "confidence"));
  [v23 setResponsivenessConfidence:v42];

  unint64_t v43 = [v50 uplinkFlows];
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
  uint64_t v46 = [v45 value];
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
  objc_storeStrong((id *)&self->uploadError, 0);
  objc_storeStrong((id *)&self->endTimeAggregate, 0);
  objc_storeStrong((id *)&self->buffer, 0);
  objc_storeStrong((id *)&self->timeoutTimer, 0);
  objc_storeStrong((id *)&self->taskDict, 0);
  objc_storeStrong((id *)&self->uploadActivity, 0);
  objc_storeStrong((id *)&self->activityParent, 0);
  objc_storeStrong((id *)&self->request, 0);
  objc_storeStrong((id *)&self->initialTime, 0);

  objc_storeStrong((id *)&self->uploadSession, 0);
}

- (void)createTempFileWithData:(void *)a1 named:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_219415000, v2, v3, "Failed to create temporary file with error: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)removeTempFileNamed:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_219415000, v2, v3, "Failed to delete temporary file with error: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)URLSession:(uint64_t)a1 task:(int)a2 didCompleteWithError:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_219415000, log, OS_LOG_TYPE_ERROR, "Set threshold to %u on rollover for task: %@", (uint8_t *)v3, 0x12u);
}

- (void)URLSession:(uint64_t)a1 task:(void *)a2 didCompleteWithError:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_219415000, a3, OS_LOG_TYPE_ERROR, "Upload task: %@ Errored with: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)URLSession:(uint64_t)a1 didBecomeInvalidWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_219415000, a2, OS_LOG_TYPE_ERROR, "Upload task became invalidated with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end