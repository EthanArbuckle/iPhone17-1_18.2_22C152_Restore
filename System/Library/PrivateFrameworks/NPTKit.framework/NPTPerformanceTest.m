@interface NPTPerformanceTest
+ (BOOL)supportsSecureCoding;
+ (id)performanceTestWithConfiguration:(id)a3;
+ (id)performanceTestWithDefaultConfiguration;
- (BOOL)inTimedMode;
- (NPTPerformanceTest)init;
- (NPTPerformanceTest)initWithCoder:(id)a3;
- (NPTPerformanceTest)initWithConfiguration:(id)a3;
- (NPTPerformanceTestConfiguration)configuration;
- (NPTResults)results;
- (NSDictionary)_additionalMetadata;
- (NSDictionary)dictionary;
- (NSDictionary)metadata;
- (id)NQRatingFromEnum:(int64_t)a3;
- (id)_metadataDidChangeHandler;
- (id)collectorsWithoutCDNDebug;
- (id)convertDateToISO8601String:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (id)fetchAWDMetric;
- (id)getFlattenedDictionary;
- (id)getFlattenedMetadataDictionary:(id)a3;
- (id)getTransformedDataForCoreAnalytics;
- (id)timestampMasked;
- (id)timestampMaskedString;
- (void)activateActivity;
- (void)cancelAllNetworking;
- (void)completeActivityWithReason:(int)a3;
- (void)dealloc;
- (void)download:(id)a3 didFinishWithError:(id)a4;
- (void)download:(id)a3 didFinishWithResults:(id)a4;
- (void)download:(id)a3 didReceiveSpeedMetric:(id)a4;
- (void)downloadWillStart;
- (void)encodeWithCoder:(id)a3;
- (void)fetchAndSaveWRMMetrics;
- (void)logFrameworkUsage:(int)a3;
- (void)pingDidFinishWithError:(id)a3;
- (void)pingDidFinishWithResults:(id)a3;
- (void)pingWillStartPinging;
- (void)save;
- (void)saveToAWD;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInTimedMode:(BOOL)a3;
- (void)setMetadataDidChangeHandler:(id)a3;
- (void)setResults:(id)a3;
- (void)set_additionalMetadata:(id)a3;
- (void)set_metadataDidChangeHandler:(id)a3;
- (void)startDownloadWithCompletion:(id)a3;
- (void)startMetadataCollectionWithCompletion:(id)a3;
- (void)startPingWithCompletion:(id)a3;
- (void)startTestWithCompletion:(id)a3;
- (void)startUploadWithCompletion:(id)a3;
- (void)stopMetadataCollection;
- (void)upload:(id)a3 didFinishWithError:(id)a4;
- (void)upload:(id)a3 didFinishWithResults:(id)a4;
- (void)upload:(id)a3 didReceiveSpeedMetric:(id)a4;
- (void)uploadWillStart;
@end

@implementation NPTPerformanceTest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTPerformanceTest)init
{
  v25.receiver = self;
  v25.super_class = (Class)NPTPerformanceTest;
  v2 = [(NPTPerformanceTest *)&v25 init];
  if (v2)
  {
    uint64_t v3 = nw_activity_create();
    performanceTestActivity = v2->performanceTestActivity;
    v2->performanceTestActivity = (OS_nw_activity *)v3;

    v5 = [NPTDownload alloc];
    v6 = v2->performanceTestActivity;
    v7 = objc_alloc_init(NPTPerformanceTestConfiguration);
    uint64_t v8 = [(NPTDownload *)v5 initWithNetworkActivityParent:v6 testConfiguration:v7];
    download = v2->download;
    v2->download = (NPTDownload *)v8;

    v10 = [NPTUpload alloc];
    v11 = v2->performanceTestActivity;
    v12 = objc_alloc_init(NPTPerformanceTestConfiguration);
    uint64_t v13 = [(NPTUpload *)v10 initWithNetworkActivityParent:v11 testConfiguration:v12];
    upload = v2->upload;
    v2->upload = (NPTUpload *)v13;

    v15 = [[NPTPing alloc] initWithNetworkActivityParent:v2->performanceTestActivity];
    ping = v2->ping;
    v2->ping = v15;

    [(NPTPing *)v2->ping setDelegate:v2];
    [(NPTDownload *)v2->download setDelegate:v2];
    [(NPTUpload *)v2->upload setDelegate:v2];
    v17 = objc_alloc_init(NPTResults);
    [(NPTPerformanceTest *)v2 setResults:v17];

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    snapshots = v2->snapshots;
    v2->snapshots = v18;

    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    uint64_t v22 = [v21 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26CAC3728];
    uuid = v2->uuid;
    v2->uuid = (NSString *)v22;

    [(NPTPerformanceTest *)v2 set_additionalMetadata:0];
  }
  return v2;
}

- (NPTPerformanceTest)initWithConfiguration:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NPTPerformanceTest;
  v5 = [(NPTPerformanceTest *)&v29 init];
  if (v5)
  {
    uint64_t v6 = nw_activity_create();
    performanceTestActivity = v5->performanceTestActivity;
    v5->performanceTestActivity = (OS_nw_activity *)v6;

    uint64_t v8 = [[NPTDownload alloc] initWithNetworkActivityParent:v5->performanceTestActivity testConfiguration:v4];
    download = v5->download;
    v5->download = v8;

    v10 = [[NPTUpload alloc] initWithNetworkActivityParent:v5->performanceTestActivity testConfiguration:v4];
    upload = v5->upload;
    v5->upload = v10;

    v12 = [NPTPing alloc];
    uint64_t v13 = v5->performanceTestActivity;
    v14 = [v4 pingHost];
    uint64_t v15 = [(NPTPing *)v12 initWithNetworkActivityParent:v13 pingTarget:v14];
    ping = v5->ping;
    v5->ping = (NPTPing *)v15;

    [(NPTPing *)v5->ping setDelegate:v5];
    [(NPTDownload *)v5->download setDelegate:v5];
    [(NPTUpload *)v5->upload setDelegate:v5];
    v17 = objc_alloc_init(NPTResults);
    [(NPTPerformanceTest *)v5 setResults:v17];

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    snapshots = v5->snapshots;
    v5->snapshots = v18;

    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    uint64_t v22 = [v21 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26CAC3728];
    uuid = v5->uuid;
    v5->uuid = (NSString *)v22;

    [(NPTPerformanceTest *)v5 setConfiguration:v4];
    v24 = v5->uuid;
    objc_super v25 = [(NPTPerformanceTest *)v5 configuration];
    [v25 setUuid:v24];

    [(NPTPerformanceTest *)v5 set_additionalMetadata:0];
    if (([v4 legacyMode] & 1) == 0) {
      [(NPTPerformanceTest *)v5 logFrameworkUsage:3];
    }
    v26 = +[NPTLogger network];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v4 description];
      *(_DWORD *)buf = 138412290;
      v31 = v27;
      _os_log_impl(&dword_219415000, v26, OS_LOG_TYPE_DEFAULT, "Configuration settings: %@", buf, 0xCu);
    }
  }

  return v5;
}

- (void)dealloc
{
  [(NPTPerformanceTest *)self completeActivityWithReason:1];
  v3.receiver = self;
  v3.super_class = (Class)NPTPerformanceTest;
  [(NPTPerformanceTest *)&v3 dealloc];
}

+ (id)performanceTestWithConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [[NPTPerformanceTest alloc] initWithConfiguration:v3];

  return v4;
}

+ (id)performanceTestWithDefaultConfiguration
{
  v2 = +[NPTPerformanceTestConfiguration defaultConfiguration];
  id v3 = +[NPTPerformanceTest performanceTestWithConfiguration:v2];

  return v3;
}

- (NSDictionary)dictionary
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [(NPTPerformanceTest *)self metadata];
  v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(NPTPerformanceTest *)self results];
  v7 = [v6 asDictionary];
  [v5 setValue:v7 forKey:@"results"];

  uint64_t v8 = [NSDictionary dictionaryWithDictionary:v5];

  return (NSDictionary *)v8;
}

- (NSDictionary)metadata
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NPTMetadataCollector *)self->collector cachedMetadata];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(NPTPerformanceTest *)self configuration];
    int v6 = [v5 collectMetadata];

    if (v6)
    {
      restoredMetadata = self->restoredMetadata;
      if (!restoredMetadata)
      {
        uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        v9 = self->restoredMetadata;
        self->restoredMetadata = v8;

        [(NSMutableDictionary *)self->restoredMetadata setObject:self->uuid forKeyedSubscript:@"uuid"];
        restoredMetadata = self->restoredMetadata;
      }
      v10 = [(NPTMetadataCollector *)self->collector cachedMetadata];
      [(NSMutableDictionary *)restoredMetadata addEntriesFromDictionary:v10];

      v11 = [(NSMutableDictionary *)self->restoredMetadata objectForKeyedSubscript:@"device_states"];
      v12 = [(NSMutableDictionary *)self->snapshots objectForKeyedSubscript:@"wrmMetrics"];
      [v11 addEntriesFromDictionary:v12];

      uint64_t v13 = [NSDictionary dictionaryWithDictionary:self->restoredMetadata];
      v14 = [(NPTPerformanceTest *)self results];
      [v14 setMetadata:v13];
    }
  }
  uint64_t v15 = self->restoredMetadata;
  if (!v15)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v17 = self->restoredMetadata;
    self->restoredMetadata = v16;

    v18 = [(NPTPerformanceTest *)self configuration];
    int v19 = [v18 collectMetadata];

    if (v19)
    {
      v20 = self->restoredMetadata;
      v21 = +[NPTMetadataCollector fetch];
      [(NSMutableDictionary *)v20 addEntriesFromDictionary:v21];

      uint64_t v22 = [(NPTPerformanceTest *)self _additionalMetadata];

      if (v22)
      {
        v23 = [(NSMutableDictionary *)self->restoredMetadata objectForKeyedSubscript:@"metadata"];
        v24 = [(NPTPerformanceTest *)self _additionalMetadata];
        [v23 addEntriesFromDictionary:v24];

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        objc_super v25 = [(NPTPerformanceTest *)self _additionalMetadata];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v41;
          do
          {
            uint64_t v29 = 0;
            do
            {
              if (*(void *)v41 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * v29);
              v31 = [(NSMutableDictionary *)self->restoredMetadata objectForKeyedSubscript:@"metadata"];
              uint64_t v32 = [v31 objectForKey:v30];

              if (!v32)
              {
                v33 = [(NPTPerformanceTest *)self _additionalMetadata];
                v34 = [v33 objectForKeyedSubscript:v30];
                v35 = [(NSMutableDictionary *)self->restoredMetadata objectForKeyedSubscript:@"metadata"];
                [v35 setObject:v34 forKeyedSubscript:v30];
              }
              ++v29;
            }
            while (v27 != v29);
            uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
          }
          while (v27);
        }
      }
    }
    [(NSMutableDictionary *)self->restoredMetadata setObject:self->uuid forKeyedSubscript:@"uuid"];
    v36 = [NSDictionary dictionaryWithDictionary:self->restoredMetadata];
    v37 = [(NPTPerformanceTest *)self results];
    [v37 setMetadata:v36];

    uint64_t v15 = self->restoredMetadata;
  }
  v38 = [NSDictionary dictionaryWithDictionary:v15];

  return (NSDictionary *)v38;
}

- (void)startPingWithCompletion:(id)a3
{
  id v4 = a3;
  [(NPTPerformanceTest *)self activateActivity];
  [(NPTPerformanceTest *)self logFrameworkUsage:0];
  v5 = [(NPTPerformanceTest *)self configuration];
  int v6 = [v5 pingAddressStyle];
  BOOL v7 = v6 == 0;
  BOOL v8 = v6 != 0;

  ping = self->ping;
  id v10 = [(NPTPerformanceTest *)self configuration];
  -[NPTPing startWithNumberOfPings:forcingIPv4:forcingIPv6:completion:](ping, "startWithNumberOfPings:forcingIPv4:forcingIPv6:completion:", [v10 pingCount], v7, v8, v4);
}

- (void)startDownloadWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(NPTPerformanceTest *)self activateActivity];
  [(NPTPerformanceTest *)self logFrameworkUsage:1];
  BOOL v7 = [(NPTPerformanceTest *)self configuration];
  int v8 = [v7 collectMetadata];

  if (v8)
  {
    v9 = +[NPTMetadataCollector fetch];
    snapshots = self->snapshots;
    uint64_t v3 = [v9 objectForKeyedSubscript:@"metadata"];
    [(NSMutableDictionary *)snapshots setValue:v3 forKey:@"beforeDownloadSnapshot"];
  }
  v11 = +[NPTLogger network];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [(NPTPerformanceTest *)self inTimedMode];
    if (v12
      && ([(NPTPerformanceTest *)self configuration],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v3 downloadSize] == 1001))
    {
      int v13 = 0;
      int v14 = 1000;
    }
    else
    {
      id v4 = [(NPTPerformanceTest *)self configuration];
      int v14 = [v4 downloadSize];
      int v13 = 1;
    }
    v15[0] = 67109120;
    v15[1] = v14;
    _os_log_impl(&dword_219415000, v11, OS_LOG_TYPE_DEFAULT, "Will test download speed by downloading %u megabytes from Apple CDN Server", (uint8_t *)v15, 8u);
    if (v13) {

    }
    if (v12) {
  }
    }

  [(NPTDownload *)self->download startDownloadWithCompletion:v6];
}

- (void)startUploadWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(NPTPerformanceTest *)self activateActivity];
  [(NPTPerformanceTest *)self logFrameworkUsage:2];
  BOOL v7 = [(NPTPerformanceTest *)self configuration];
  int v8 = [v7 collectMetadata];

  if (v8)
  {
    v9 = +[NPTMetadataCollector fetch];
    snapshots = self->snapshots;
    uint64_t v3 = [v9 objectForKeyedSubscript:@"metadata"];
    [(NSMutableDictionary *)snapshots setValue:v3 forKey:@"beforeUploadSnapshot"];
  }
  v11 = +[NPTLogger network];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [(NPTPerformanceTest *)self inTimedMode];
    if (v12
      && ([(NPTPerformanceTest *)self configuration],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v3 uploadSize] == 1001))
    {
      int v13 = 0;
      int v14 = 50;
    }
    else
    {
      id v4 = [(NPTPerformanceTest *)self configuration];
      int v14 = [v4 uploadSize];
      int v13 = 1;
    }
    v15[0] = 67109120;
    v15[1] = v14;
    _os_log_impl(&dword_219415000, v11, OS_LOG_TYPE_DEFAULT, "Will test upload speed by uploading %u megabytes to Apple CDN Server", (uint8_t *)v15, 8u);
    if (v13) {

    }
    if (v12) {
  }
    }

  [(NPTUpload *)self->upload startUploadWithCompletion:v6];
}

- (void)startTestWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[NPTLogger network];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NPTPerformanceTest *)self configuration];
    BOOL v7 = [v6 uuid];
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_219415000, v5, OS_LOG_TYPE_DEFAULT, "Performance test %@ will start", buf, 0xCu);
  }
  [(NPTPerformanceTest *)self activateActivity];
  objc_initWeak((id *)buf, self);
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id WeakRetained = objc_loadWeakRetained((id *)buf);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__NPTPerformanceTest_startTestWithCompletion___block_invoke;
  v12[3] = &unk_2643A1A60;
  id v10 = v8;
  id v13 = v10;
  objc_copyWeak(&v16, (id *)buf);
  int v14 = self;
  id v11 = v4;
  id v15 = v11;
  [WeakRetained startPingWithCompletion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __46__NPTPerformanceTest_startTestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__NPTPerformanceTest_startTestWithCompletion___block_invoke_2;
  v9[3] = &unk_2643A1A38;
  id v10 = *(id *)(a1 + 32);
  objc_copyWeak(&v13, (id *)(a1 + 56));
  id v8 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v8;
  [WeakRetained startDownloadWithCompletion:v9];

  objc_destroyWeak(&v13);
}

void __46__NPTPerformanceTest_startTestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__NPTPerformanceTest_startTestWithCompletion___block_invoke_3;
  v11[3] = &unk_2643A1A10;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  id v12 = v8;
  uint64_t v13 = v9;
  id v14 = v10;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  [WeakRetained startUploadWithCompletion:v11];

  objc_destroyWeak(&v15);
}

void __46__NPTPerformanceTest_startTestWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  if ([*(id *)(a1 + 32) count])
  {
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(a1 + 32)];
  }
  else
  {
    BOOL v7 = 0;
  }
  if ([v7 count]) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 2;
  }
  [*(id *)(a1 + 40) completeActivityWithReason:v8];
  uint64_t v9 = +[NPTLogger network];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [*(id *)(a1 + 40) configuration];
    uint64_t v11 = [v10 uuid];
    int v15 = 138412290;
    id v16 = v11;
    _os_log_impl(&dword_219415000, v9, OS_LOG_TYPE_DEFAULT, "Performance test %@ has finished", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v12 = *(void *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v14 = [WeakRetained results];
  (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v14, v7);
}

- (void)save
{
}

uint64_t __26__NPTPerformanceTest_save__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) getFlattenedDictionary];
}

- (void)saveToAWD
{
}

- (id)fetchAWDMetric
{
  v2 = [(NPTPerformanceTest *)self getFlattenedDictionary];
  uint64_t v3 = +[AWDNetworkPerformanceMetricInitializer createPerformanceMetricFromDictionary:v2];

  return v3;
}

- (void)activateActivity
{
  if ((nw_activity_is_activated() & 1) == 0)
  {
    v2 = +[NPTLogger network];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_219415000, v2, OS_LOG_TYPE_DEFAULT, "Activating performanceTestActivity", v3, 2u);
    }

    nw_activity_activate();
  }
}

- (void)completeActivityWithReason:(int)a3
{
  if (self->performanceTestActivity && nw_activity_is_activated())
  {
    id v4 = +[NPTLogger network];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_219415000, v4, OS_LOG_TYPE_DEFAULT, "Completing performanceTestActivity", v6, 2u);
    }

    nw_activity_complete_with_reason();
    performanceTestActivity = self->performanceTestActivity;
    self->performanceTestActivity = 0;
  }
}

- (id)timestampMasked
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF910]);
  uint64_t v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v4 = [v3 components:62 fromDate:v2];
  [v4 setMinute:0];
  [v4 setSecond:0];
  id v5 = [v3 dateFromComponents:v4];

  return v5;
}

- (id)convertDateToISO8601String:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F088C0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x263EFFA18] localTimeZone];
  [v5 setTimeZone:v6];

  BOOL v7 = [v5 stringForObjectValue:v4];

  return v7;
}

- (id)timestampMaskedString
{
  uint64_t v3 = [(NPTPerformanceTest *)self timestampMasked];
  id v4 = [(NPTPerformanceTest *)self convertDateToISO8601String:v3];

  return v4;
}

- (id)getFlattenedMetadataDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [v3 objectForKeyedSubscript:@"device_states"];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v3 objectForKeyedSubscript:@"device_states"];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"initial_state"];
        [v4 addEntriesFromDictionary:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)getFlattenedDictionary
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(NPTMetadataCollector *)self->collector cachedMetadata];
  if (v4)
  {
    uint64_t v5 = [(NPTPerformanceTest *)self metadata];
    [(NPTPerformanceTest *)self getFlattenedMetadataDictionary:v5];
  }
  else
  {
    uint64_t v5 = [(NPTPerformanceTest *)self dictionary];
    [v5 valueForKey:@"metadata"];
  v144 = };

  v145 = self;
  uint64_t v6 = [(NPTPerformanceTest *)self dictionary];
  uint64_t v7 = [v6 valueForKey:@"results"];

  uint64_t v8 = [v7 valueForKey:@"download_results"];
  uint64_t v9 = [v7 valueForKey:@"upload_results"];
  id v10 = [v7 valueForKey:@"ping_results"];
  v140 = v7;
  v141 = [v7 valueForKey:@"network_quality_results"];
  uint64_t v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.wifiqa.NPTKit"];
  uint64_t v12 = [v11 infoDictionary];
  v143 = [v12 objectForKey:@"CFBundleShortVersionString"];

  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v159 objects:v166 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v160;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v160 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v159 + 1) + 8 * i);
        uint64_t v19 = [v13 valueForKey:v18];
        if (v19)
        {
          uint64_t v20 = [@"download_" stringByAppendingString:v18];
          [v3 setObject:v19 forKey:v20];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v159 objects:v166 count:16];
    }
    while (v15);
  }

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v21 = v9;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v155 objects:v165 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v156;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v156 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v155 + 1) + 8 * j);
        uint64_t v27 = [v21 valueForKey:v26];
        if (v27)
        {
          uint64_t v28 = [@"upload_" stringByAppendingString:v26];
          [v3 setObject:v27 forKey:v28];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v155 objects:v165 count:16];
    }
    while (v23);
  }

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v29 = v10;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v151 objects:v164 count:16];
  v146 = v29;
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v152;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v152 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v151 + 1) + 8 * k);
        if (([v34 isEqual:@"pings"] & 1) == 0)
        {
          v35 = [v29 valueForKey:v34];
          if (v35)
          {
            v36 = [@"ping_" stringByAppendingString:v34];
            [v3 setObject:v35 forKey:v36];
          }
          id v29 = v146;
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v151 objects:v164 count:16];
    }
    while (v31);
  }

  v37 = v141;
  if (![v141 count])
  {
    v38 = [(NPTPerformanceTest *)v145 configuration];
    char v39 = [v38 legacyMode];

    if ((v39 & 1) == 0)
    {
      id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v41 = [v13 objectForKeyedSubscript:@"responsiveness"];
      double v42 = 0.0;
      double v43 = 0.0;
      if (v41)
      {
        v44 = [v13 objectForKey:@"responsiveness"];
        [v44 doubleValue];
        double v43 = v45;
      }
      v46 = [v21 objectForKeyedSubscript:@"responsiveness"];
      if (v46)
      {
        v47 = [v21 objectForKey:@"responsiveness"];
        [v47 doubleValue];
        double v42 = v48;
      }
      double v49 = v43 + v42;
      BOOL v51 = v42 <= 0.0;
      double v50 = 0.0;
      BOOL v51 = v51 || v43 <= 0.0;
      if (v51) {
        double v52 = v49;
      }
      else {
        double v52 = v49 * 0.5;
      }
      v53 = -[NPTPerformanceTest NQRatingFromEnum:](v145, "NQRatingFromEnum:", [MEMORY[0x263F8C650] ratingForResponsivenessScore:(uint64_t)v52]);
      [v40 setObject:v53 forKeyedSubscript:@"rating"];

      v54 = [v13 objectForKeyedSubscript:@"speed"];
      double v55 = 0.0;
      if (v54)
      {
        v56 = [v13 objectForKey:@"speed"];
        [v56 doubleValue];
        double v55 = v57;
      }
      v58 = [v21 objectForKeyedSubscript:@"speed"];
      if (v58)
      {
        v59 = [v21 objectForKey:@"speed"];
        [v59 doubleValue];
        double v50 = v60;
      }
      v61 = [NSNumber numberWithDouble:v52];
      [v40 setObject:v61 forKeyedSubscript:@"responsiveness"];

      v62 = [NSNumber numberWithDouble:v55];
      [v40 setObject:v62 forKeyedSubscript:@"download_speed"];

      v63 = [NSNumber numberWithDouble:v50];
      [v40 setObject:v63 forKeyedSubscript:@"upload_speed"];

      v64 = [v13 objectForKeyedSubscript:@"error"];

      if (v64)
      {
        v65 = [v13 objectForKeyedSubscript:@"error"];
        [v40 setObject:v65 forKeyedSubscript:@"error"];

        v66 = [v13 objectForKeyedSubscript:@"error_domain"];
        [v40 setObject:v66 forKeyedSubscript:@"error_domain"];

        v67 = [v13 objectForKeyedSubscript:@"error_code"];
        [v40 setObject:v67 forKeyedSubscript:@"error_code"];
      }
      v68 = [v21 objectForKeyedSubscript:@"error"];

      if (v68)
      {
        v69 = [v21 objectForKeyedSubscript:@"error"];
        [v40 setObject:v69 forKeyedSubscript:@"error"];

        v70 = [v21 objectForKeyedSubscript:@"error_domain"];
        [v40 setObject:v70 forKeyedSubscript:@"error_domain"];

        v71 = [v21 objectForKeyedSubscript:@"error_code"];
        [v40 setObject:v71 forKeyedSubscript:@"error_code"];
      }
      uint64_t v72 = [NSDictionary dictionaryWithDictionary:v40];

      v37 = (void *)v72;
    }
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v73 = v37;
  uint64_t v74 = [v73 countByEnumeratingWithState:&v147 objects:v163 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v148;
    do
    {
      for (uint64_t m = 0; m != v75; ++m)
      {
        if (*(void *)v148 != v76) {
          objc_enumerationMutation(v73);
        }
        uint64_t v78 = *(void *)(*((void *)&v147 + 1) + 8 * m);
        v79 = [v73 valueForKey:v78];
        if (v79)
        {
          v80 = [@"network_quality_" stringByAppendingString:v78];
          [v3 setObject:v79 forKey:v80];
        }
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v147 objects:v163 count:16];
    }
    while (v75);
  }

  [v3 addEntriesFromDictionary:v144];
  p_isa = (id *)&v145->super.isa;
  [v3 setValue:v145->uuid forKey:@"npt_uuid"];
  v82 = NSNumber;
  v83 = [(NPTPerformanceTest *)v145 configuration];
  v84 = objc_msgSend(v82, "numberWithBool:", objc_msgSend(v83, "interfaceType") == 1);
  [v3 setValue:v84 forKey:@"use_wifi_was_specified"];

  [v3 setValue:v143 forKey:@"nptkit_framework_version"];
  v85 = [(NPTPerformanceTest *)v145 configuration];
  v86 = [v85 clientName];
  [v3 setValue:v86 forKey:@"calling_client"];

  v87 = NSNumber;
  v88 = [(NPTPerformanceTest *)v145 configuration];
  v89 = objc_msgSend(v87, "numberWithBool:", objc_msgSend(v88, "legacyMode"));
  [v3 setValue:v89 forKey:@"legacy_mode"];

  uint64_t v90 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:&unk_26CAD5A28];
  v91 = [(NPTPerformanceTest *)v145 results];
  v92 = [v91 downloadResults];
  v93 = [v92 isCellular];
  v142 = (void *)v90;
  if ([v93 BOOLValue])
  {
  }
  else
  {
    v94 = [(NPTPerformanceTest *)v145 results];
    v95 = [v94 uploadResults];
    v96 = [v95 isCellular];
    char v138 = [v96 BOOLValue];

    p_isa = (id *)&v145->super.isa;
    uint64_t v90 = (uint64_t)v142;

    if ((v138 & 1) == 0) {
      [v142 addObject:@"cellular_cellid"];
    }
  }
  [v3 removeObjectsForKeys:v90];
  if (p_isa[7]
    && ([p_isa configuration],
        v97 = objc_claimAutoreleasedReturnValue(),
        int v98 = [v97 collectMetadata],
        v97,
        v98))
  {
    v99 = [p_isa[7] objectForKeyedSubscript:@"beforeDownloadSnapshot"];
    if (v99)
    {
      v100 = [p_isa[7] objectForKeyedSubscript:@"afterDownloadSnapshot"];

      if (v100)
      {
        uint64_t v101 = [p_isa[7] valueForKey:@"beforeDownloadSnapshot"];
        v99 = [p_isa[7] valueForKey:@"afterDownloadSnapshot"];
      }
      else
      {
        uint64_t v101 = 0;
        v99 = 0;
      }
    }
    else
    {
      uint64_t v101 = 0;
    }
    uint64_t v104 = [p_isa[7] objectForKeyedSubscript:@"beforeUploadSnapshot"];
    if (v104
      && (v105 = (void *)v104,
          [p_isa[7] objectForKeyedSubscript:@"afterUploadSnapshot"],
          v106 = objc_claimAutoreleasedReturnValue(),
          v106,
          v105,
          v106))
    {
      v139 = [p_isa[7] valueForKey:@"beforeUploadSnapshot"];
      v137 = [p_isa[7] valueForKey:@"afterUploadSnapshot"];
    }
    else
    {
      v137 = 0;
      v139 = 0;
    }
    v102 = (void *)v101;
    v103 = v99;
  }
  else
  {
    v102 = 0;
    v103 = 0;
    v137 = 0;
    v139 = 0;
  }
  v107 = [(NPTMetadataCollector *)v145->collector cachedMetadata];
  v108 = [v107 objectForKeyedSubscript:@"device_states"];
  v109 = [v108 objectForKeyedSubscript:@"cellular"];
  v110 = +[NPTCellularCollector calculateMaxCellularTPutEstimates:v109];

  v136 = v110;
  v111 = [v110 objectForKeyedSubscript:@"cellular_max_download_estimate"];
  [v3 setObject:v111 forKeyedSubscript:@"download_max_cellular_estimate"];

  v112 = [v110 objectForKeyedSubscript:@"cellular_max_upload_estimate"];
  [v3 setObject:v112 forKeyedSubscript:@"upload_max_cellular_estimate"];

  v113 = [v102 objectForKeyedSubscript:@"cellular_radio_access_technology"];
  [v3 setObject:v113 forKeyedSubscript:@"download_start_rat"];

  v114 = [v103 objectForKeyedSubscript:@"cellular_radio_access_technology"];
  [v3 setObject:v114 forKeyedSubscript:@"download_end_rat"];

  v115 = [v102 objectForKeyedSubscript:@"network_primary_ipv4_interface_name"];
  [v3 setObject:v115 forKeyedSubscript:@"download_start_primary_ipv4_interface"];

  v116 = [v103 objectForKeyedSubscript:@"network_primary_ipv4_interface_name"];
  [v3 setObject:v116 forKeyedSubscript:@"download_end_primary_ipv4_interface"];

  v117 = [v102 objectForKeyedSubscript:@"cellular_data_bearer_technology"];
  [v3 setObject:v117 forKeyedSubscript:@"download_start_data_bearer_technology"];

  v118 = [v103 objectForKeyedSubscript:@"cellular_data_bearer_technology"];
  [v3 setObject:v118 forKeyedSubscript:@"download_end_data_bearer_technology"];

  v119 = [v102 objectForKeyedSubscript:@"cellular_radio_frequency"];
  [v3 setObject:v119 forKeyedSubscript:@"download_start_radio_frequency"];

  v120 = [v103 objectForKeyedSubscript:@"cellular_radio_frequency"];
  [v3 setObject:v120 forKeyedSubscript:@"download_end_radio_frequency"];

  v121 = [v102 objectForKeyedSubscript:@"cellular_download_estimate"];
  [v3 setObject:v121 forKeyedSubscript:@"download_start_cellular_estimate"];

  v122 = [v103 objectForKeyedSubscript:@"cellular_download_estimate"];
  [v3 setObject:v122 forKeyedSubscript:@"download_end_cellular_estimate"];

  v123 = [v139 objectForKeyedSubscript:@"cellular_radio_access_technology"];
  [v3 setObject:v123 forKeyedSubscript:@"upload_start_rat"];

  v124 = [v137 objectForKeyedSubscript:@"cellular_radio_access_technology"];
  [v3 setObject:v124 forKeyedSubscript:@"upload_end_rat"];

  v125 = [v139 objectForKeyedSubscript:@"network_primary_ipv4_interface_name"];
  [v3 setObject:v125 forKeyedSubscript:@"upload_start_primary_ipv4_interface"];

  v126 = [v137 objectForKeyedSubscript:@"network_primary_ipv4_interface_name"];
  [v3 setObject:v126 forKeyedSubscript:@"upload_end_primary_ipv4_interface"];

  v127 = [v139 objectForKeyedSubscript:@"cellular_data_bearer_technology"];
  [v3 setObject:v127 forKeyedSubscript:@"upload_start_data_bearer_technology"];

  v128 = [v137 objectForKeyedSubscript:@"cellular_data_bearer_technology"];
  [v3 setObject:v128 forKeyedSubscript:@"upload_end_data_bearer_technology"];

  v129 = [v139 objectForKeyedSubscript:@"cellular_radio_frequency"];
  [v3 setObject:v129 forKeyedSubscript:@"upload_start_radio_frequency"];

  v130 = [v137 objectForKeyedSubscript:@"cellular_radio_frequency"];
  [v3 setObject:v130 forKeyedSubscript:@"upload_end_radio_frequency"];

  v131 = [v139 objectForKeyedSubscript:@"cellular_upload_estimate"];
  [v3 setObject:v131 forKeyedSubscript:@"upload_start_cellular_estimate"];

  v132 = [v137 objectForKeyedSubscript:@"cellular_upload_estimate"];
  [v3 setObject:v132 forKeyedSubscript:@"upload_end_cellular_estimate"];

  v133 = [(NPTPerformanceTest *)v145 timestampMaskedString];
  [v3 setObject:v133 forKeyedSubscript:@"performance_test_start_time"];

  v134 = [NSDictionary dictionaryWithDictionary:v3];

  return v134;
}

- (id)getTransformedDataForCoreAnalytics
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [(NPTPerformanceTest *)self getDataForCoreAnalytics];
  id v3 = (void *)[v2 mutableCopy];
  objc_super v25 = [MEMORY[0x263EFFA08] setWithArray:&unk_26CAD5A40];
  id v4 = [MEMORY[0x263EFFA08] setWithArray:&unk_26CAD5A58];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          if (([v10 containsString:@"_speed"] & 1) != 0
            || [v10 containsString:@"_estimate"])
          {
            id v13 = [v5 objectForKeyedSubscript:v10];
            [v13 doubleValue];
            double v15 = v14;

            uint64_t v16 = [NSNumber numberWithDouble:v15 * 125000.0];
            [v3 setObject:v16 forKeyedSubscript:v10];
          }
          if (([v10 containsString:@"_time"] & 1) != 0
            || [v25 containsObject:v10])
          {
            long long v17 = [v5 objectForKeyedSubscript:v10];
            [v17 doubleValue];
            double v19 = v18;

            uint64_t v20 = [NSNumber numberWithDouble:v19 * 1000.0];
            [v3 setObject:v20 forKeyedSubscript:v10];
          }
          if ([v4 containsObject:v10])
          {
            id v21 = [NSString stringWithFormat:@"%@_histogram", v10];
            uint64_t v22 = [v3 objectForKeyedSubscript:v10];
            [v3 setObject:v22 forKeyedSubscript:v21];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  uint64_t v23 = [NSDictionary dictionaryWithDictionary:v3];

  return v23;
}

- (void)cancelAllNetworking
{
  [(NPTPing *)self->ping cancel];
  [(NPTDownload *)self->download cancel];
  [(NPTUpload *)self->upload cancel];

  [(NPTPerformanceTest *)self completeActivityWithReason:4];
}

- (BOOL)inTimedMode
{
  id v3 = [(NPTPerformanceTest *)self configuration];
  if ([v3 testDuration])
  {
    id v4 = [(NPTPerformanceTest *)self configuration];
    int v5 = [v4 stopAtFileSize] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)NQRatingFromEnum:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"No Rating";
  }
  else {
    return off_2643A1AF8[a3];
  }
}

- (void)fetchAndSaveWRMMetrics
{
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = +[NPTMetadataCollector fetchWRMMetrics];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  v14[0] = @"initial_state";
  v14[1] = @"events";
  v15[0] = v3;
  v15[1] = v5;
  v14[2] = @"errors";
  _DWORD v15[2] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  [v4 setObject:v6 forKeyedSubscript:@"wrm"];

  snapshots = self->snapshots;
  uint64_t v8 = [NSDictionary dictionaryWithDictionary:v4];
  [(NSMutableDictionary *)snapshots setValue:v8 forKey:@"wrmMetrics"];

  uint64_t v9 = [(NPTMetadataCollector *)self->collector cachedMetadata];

  id v10 = [(NPTPerformanceTest *)self metadata];
  if (!v9)
  {
    uint64_t v11 = [(NSMutableDictionary *)self->restoredMetadata objectForKeyedSubscript:@"metadata"];
    [v11 addEntriesFromDictionary:v3];

    restoredMetadata = self->restoredMetadata;
    id v13 = [(NPTPerformanceTest *)self results];
    [v13 setMetadata:restoredMetadata];
  }
}

- (void)logFrameworkUsage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v6 forKeyedSubscript:@"feature"];

  uint64_t v7 = [(NPTPerformanceTest *)self configuration];

  if (v7)
  {
    uint64_t v8 = [(NPTPerformanceTest *)self configuration];
    uint64_t v9 = [v8 asDictionary];
    [v5 addEntriesFromDictionary:v9];
  }
  if ([v5 count])
  {
    id v10 = v5;
    AnalyticsSendEventLazy();
  }
}

id __40__NPTPerformanceTest_logFrameworkUsage___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)pingDidFinishWithResults:(id)a3
{
  id v8 = a3;
  id v4 = [(NPTPerformanceTest *)self results];
  [v4 setPingResults:v8];

  id v5 = [(NPTPerformanceTest *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(NPTPerformanceTest *)self delegate];
    [v7 performanceTest:self didFinishWithPingResults:v8];
  }
}

- (void)pingWillStartPinging
{
  uint64_t v3 = [(NPTPerformanceTest *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(NPTPerformanceTest *)self delegate];
    [v5 performanceTestWillStartPing];
  }
}

- (void)pingDidFinishWithError:(id)a3
{
  id v8 = a3;
  char v4 = [(NPTPing *)self->ping results];
  uint64_t v5 = [(NPTPerformanceTest *)self results];
  [(id)v5 setPingResults:v4];

  char v6 = [(NPTPerformanceTest *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v7 = [(NPTPerformanceTest *)self delegate];
    [v7 performanceTest:self didFinishPingWithError:v8];
  }
}

- (void)download:(id)a3 didFinishWithResults:(id)a4
{
  id v16 = a4;
  uint64_t v5 = [(NPTPerformanceTest *)self results];
  [v5 setDownloadResults:v16];

  char v6 = [(NPTPerformanceTest *)self configuration];
  int v7 = [v6 collectMetadata];

  if (v7)
  {
    id v8 = +[NPTMetadataCollector fetch];
    snapshots = self->snapshots;
    id v10 = [v8 objectForKeyedSubscript:@"metadata"];
    [(NSMutableDictionary *)snapshots setValue:v10 forKey:@"afterDownloadSnapshot"];

    uint64_t v11 = [(NPTPerformanceTest *)self configuration];
    if ([v11 collectWRMMetrics])
    {
      uint64_t v12 = [(NSMutableDictionary *)self->snapshots objectForKeyedSubscript:@"wrmMetrics"];

      if (!v12) {
        [(NPTPerformanceTest *)self fetchAndSaveWRMMetrics];
      }
    }
    else
    {
    }
  }
  id v13 = [(NPTPerformanceTest *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    double v15 = [(NPTPerformanceTest *)self delegate];
    [v15 performanceTest:self didFinishWithDownloadResults:v16];
  }
}

- (void)downloadWillStart
{
  uint64_t v3 = [(NPTPerformanceTest *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(NPTPerformanceTest *)self delegate];
    [v5 performanceTestWillStartDownload];
  }
}

- (void)download:(id)a3 didReceiveSpeedMetric:(id)a4
{
  id v8 = a4;
  id v5 = [(NPTPerformanceTest *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(NPTPerformanceTest *)self delegate];
    [v7 performanceTest:self didReceiveDownloadSpeedMetric:v8];
  }
}

- (void)download:(id)a3 didFinishWithError:(id)a4
{
  id v10 = a4;
  char v6 = [a3 results];
  uint64_t v7 = [(NPTPerformanceTest *)self results];
  [(id)v7 setDownloadResults:v6];

  id v8 = [(NPTPerformanceTest *)self delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v9 = [(NPTPerformanceTest *)self delegate];
    [v9 performanceTest:self didFinishDownloadWithError:v10];
  }
}

- (void)upload:(id)a3 didFinishWithResults:(id)a4
{
  id v16 = a4;
  id v5 = [(NPTPerformanceTest *)self results];
  [v5 setUploadResults:v16];

  char v6 = [(NPTPerformanceTest *)self configuration];
  int v7 = [v6 collectMetadata];

  if (v7)
  {
    id v8 = +[NPTMetadataCollector fetch];
    snapshots = self->snapshots;
    id v10 = [v8 objectForKeyedSubscript:@"metadata"];
    [(NSMutableDictionary *)snapshots setValue:v10 forKey:@"afterUploadSnapshot"];

    uint64_t v11 = [(NPTPerformanceTest *)self configuration];
    if ([v11 collectWRMMetrics])
    {
      uint64_t v12 = [(NSMutableDictionary *)self->snapshots objectForKeyedSubscript:@"wrmMetrics"];

      if (!v12) {
        [(NPTPerformanceTest *)self fetchAndSaveWRMMetrics];
      }
    }
    else
    {
    }
  }
  id v13 = [(NPTPerformanceTest *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    double v15 = [(NPTPerformanceTest *)self delegate];
    [v15 performanceTest:self didFinishWithUploadResults:v16];
  }
}

- (void)uploadWillStart
{
  uint64_t v3 = [(NPTPerformanceTest *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(NPTPerformanceTest *)self delegate];
    [v5 performanceTestWillStartUpload];
  }
}

- (void)upload:(id)a3 didReceiveSpeedMetric:(id)a4
{
  id v8 = a4;
  id v5 = [(NPTPerformanceTest *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(NPTPerformanceTest *)self delegate];
    [v7 performanceTest:self didReceiveUploadSpeedMetric:v8];
  }
}

- (void)upload:(id)a3 didFinishWithError:(id)a4
{
  id v10 = a4;
  char v6 = [a3 results];
  uint64_t v7 = [(NPTPerformanceTest *)self results];
  [(id)v7 setUploadResults:v6];

  id v8 = [(NPTPerformanceTest *)self delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v9 = [(NPTPerformanceTest *)self delegate];
    [v9 performanceTest:self didFinishUploadWithError:v10];
  }
}

- (void)encodeWithCoder:(id)a3
{
  download = self->download;
  id v7 = a3;
  [v7 encodeObject:download forKey:@"download"];
  [v7 encodeObject:self->upload forKey:@"upload"];
  [v7 encodeObject:self->ping forKey:@"ping"];
  id v5 = [(NPTPerformanceTest *)self metadata];
  [v7 encodeObject:v5 forKey:@"metadata"];

  char v6 = [(NPTPerformanceTest *)self results];
  [v7 encodeObject:v6 forKey:@"results"];

  [v7 encodeObject:self->uuid forKey:@"npt_uuid"];
}

- (NPTPerformanceTest)initWithCoder:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NPTPerformanceTest;
  id v3 = a3;
  char v4 = [(NPTPerformanceTest *)&v20 init];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"download"];
  download = v4->download;
  v4->download = (NPTDownload *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"upload"];
  upload = v4->upload;
  v4->upload = (NPTUpload *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ping"];
  ping = v4->ping;
  v4->ping = (NPTPing *)v9;

  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0, v20.receiver, v20.super_class);
  uint64_t v14 = [v3 decodeObjectOfClasses:v13 forKey:@"metadata"];
  restoredMetadata = v4->restoredMetadata;
  v4->restoredMetadata = (NSMutableDictionary *)v14;

  id v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"results"];
  [(NPTPerformanceTest *)v4 setResults:v16];

  uint64_t v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"npt_uuid"];

  uuid = v4->uuid;
  v4->uuid = (NSString *)v17;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(NPTPerformanceTest *)self configuration];

  char v6 = +[NPTPerformanceTest allocWithZone:a3];
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = [(NPTPerformanceTest *)self configuration];
    uint64_t v9 = [(NPTPerformanceTest *)v7 initWithConfiguration:v8];

    id v10 = [(NPTPerformanceTest *)self configuration];
    [(NPTPerformanceTest *)v9 setConfiguration:v10];

    return v9;
  }
  else
  {
    return [(NPTPerformanceTest *)v6 init];
  }
}

- (id)collectorsWithoutCDNDebug
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [NPTMetadataCollector alloc];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:7];
  char v4 = -[NPTMetadataCollector initWithCollectorTypes:](v2, "initWithCollectorTypes:", v3, v6, v7, v8, v9, v10, v11);

  return v4;
}

- (void)startMetadataCollectionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(NPTMetadataCollector);
  collector = self->collector;
  self->collector = v5;

  uint64_t v7 = [(NPTPerformanceTest *)self configuration];
  uint64_t v8 = [v7 downloadURL];
  uint64_t v9 = [v8 absoluteString];
  if ([v9 containsString:@"npt.cdn-apple.com"])
  {

LABEL_5:
    goto LABEL_6;
  }
  uint64_t v10 = [(NPTPerformanceTest *)self configuration];
  uint64_t v11 = [v10 uploadURL];
  uint64_t v12 = [v11 absoluteString];
  char v13 = [v12 containsString:@"npt.cdn-apple.com"];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [(NPTPerformanceTest *)self collectorsWithoutCDNDebug];
    uint64_t v7 = self->collector;
    self->collector = v14;
    goto LABEL_5;
  }
LABEL_6:
  double v15 = self->collector;
  id v16 = [(NPTPerformanceTest *)self metadataDidChangeHandler];
  [(NPTMetadataCollector *)v15 setMetadataDidChangeHandler:v16];

  objc_initWeak(&location, self);
  uint64_t v17 = self->collector;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__NPTPerformanceTest_startMetadataCollectionWithCompletion___block_invoke;
  v19[3] = &unk_2643A1AB0;
  objc_copyWeak(&v21, &location);
  id v18 = v4;
  id v20 = v18;
  [(NPTMetadataCollector *)v17 startCollectingWithCompletion:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __60__NPTPerformanceTest_startMetadataCollectionWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained metadata];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);
  }
}

- (void)stopMetadataCollection
{
}

- (void)setMetadataDidChangeHandler:(id)a3
{
  id v4 = a3;
  [(NPTPerformanceTest *)self set_metadataDidChangeHandler:v4];
  if (self->collector)
  {
    objc_initWeak(&location, self);
    collector = self->collector;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__NPTPerformanceTest_setMetadataDidChangeHandler___block_invoke;
    v6[3] = &unk_2643A1AD8;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [(NPTMetadataCollector *)collector setMetadataDidChangeHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __50__NPTPerformanceTest_setMetadataDidChangeHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = (id)[WeakRetained metadata];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPTPerformanceTestConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NPTResults)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSDictionary)_additionalMetadata
{
  return self->__additionalMetadata;
}

- (void)set_additionalMetadata:(id)a3
{
}

- (void)setInTimedMode:(BOOL)a3
{
  self->_inTimedMode = a3;
}

- (id)_metadataDidChangeHandler
{
  return self->__metadataDidChangeHandler;
}

- (void)set_metadataDidChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__metadataDidChangeHandler, 0);
  objc_storeStrong((id *)&self->__additionalMetadata, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->collector, 0);
  objc_storeStrong((id *)&self->snapshots, 0);
  objc_storeStrong((id *)&self->performanceTestActivity, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->restoredMetadata, 0);
  objc_storeStrong((id *)&self->ping, 0);
  objc_storeStrong((id *)&self->upload, 0);

  objc_storeStrong((id *)&self->download, 0);
}

@end