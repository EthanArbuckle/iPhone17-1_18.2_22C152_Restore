@interface PPSRequestDispatcher
- (NSDateInterval)timelineBoundaries;
- (NSURL)filepath;
- (PPSRequestDispatcher)initWithFilepath:(id)a3;
- (id)_executeRequest:(id)a3 withError:(id *)a4;
- (id)dataForRequest:(id)a3 withError:(id *)a4;
- (int64_t)_readerTypeForSubsystem:(id)a3 category:(id)a4;
- (void)dealloc;
@end

@implementation PPSRequestDispatcher

- (PPSRequestDispatcher)initWithFilepath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSRequestDispatcher;
  v5 = [(PPSRequestDispatcher *)&v11 init];
  if (v5)
  {
    if (+[PPSEntitlementChecker checkForEntitlement:@"com.apple.PerfPowerServices.data-read"])
    {
      uint64_t v6 = [v4 copy];
      filepath = v5->_filepath;
      v5->_filepath = (NSURL *)v6;
    }
    else
    {
      v8 = PPSReaderLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_258F16000, v8, OS_LOG_TYPE_DEFAULT, "[dispatcher] Invalid filepath for on-device reading. Overwriting...", v10, 2u);
      }

      filepath = v5->_filepath;
      v5->_filepath = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [&unk_2707149E0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_2707149E0);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        v8 = [(PPSRequestDispatcher *)self filepath];
        +[PPSDataIngesterRegistry releaseDataIngesterForFilepath:requestType:](PPSDataIngesterRegistry, "releaseDataIngesterForFilepath:requestType:", v8, (int)[v7 intValue]);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_2707149E0 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  v9.receiver = self;
  v9.super_class = (Class)PPSRequestDispatcher;
  [(PPSRequestDispatcher *)&v9 dealloc];
}

- (NSDateInterval)timelineBoundaries
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__PPSRequestDispatcher_timelineBoundaries__block_invoke;
  block[3] = &unk_265443378;
  block[4] = self;
  if (timelineBoundaries_onceToken != -1) {
    dispatch_once(&timelineBoundaries_onceToken, block);
  }
  return (NSDateInterval *)(id)timelineBoundaries_timelineBoundaries;
}

void __42__PPSRequestDispatcher_timelineBoundaries__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) filepath];
  int64_t v3 = +[PPSDataIngesterCommonUtilities fileTypeForFilepath:v2];

  if (v3 == 1)
  {
    uint64_t v4 = [MEMORY[0x263EFFA08] setWithObject:@"timestamp"];
    uint64_t v5 = PPSCreateSubsystemCategoryPredicate(@"PLBatteryAgent_EventBackward", @"Battery", 0);
    uint64_t v6 = [[PPSTimeSeriesRequest alloc] initWithMetrics:v4 predicate:v5 timeFilter:0];
    v7 = *(void **)(a1 + 32);
    id v26 = 0;
    v8 = [v7 dataForRequest:v6 withError:&v26];
    id v9 = v26;
    if (v9 || (unint64_t)[v8 count] <= 1)
    {
      long long v10 = PPSCreateSubsystemCategoryPredicate(@"PLCoalitionAgent_EventInterval", @"CoalitionInterval", 0);

      long long v11 = [[PPSTimeSeriesRequest alloc] initWithMetrics:v4 predicate:v10 timeFilter:0];
      long long v12 = *(void **)(a1 + 32);
      id v25 = v9;
      long long v13 = [v12 dataForRequest:v11 withError:&v25];
      id v14 = v25;

      if (v14)
      {
        uint64_t v15 = [MEMORY[0x263EFF910] date];
        uint64_t v16 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v15 endDate:v15];
        v17 = (void *)timelineBoundaries_timelineBoundaries;
        timelineBoundaries_timelineBoundaries = v16;

LABEL_9:
        return;
      }
      v8 = v13;
    }
    else
    {
      long long v13 = v8;
      long long v11 = v6;
      long long v10 = v5;
    }
    v18 = [v8 firstObject];
    [v18 monotonicTimestamp];
    double v20 = v19;

    v21 = [v8 lastObject];
    [v21 monotonicTimestamp];
    double v23 = v22;

    id v14 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v20];
    uint64_t v24 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v14 duration:v23 - v20];
    uint64_t v15 = (void *)timelineBoundaries_timelineBoundaries;
    timelineBoundaries_timelineBoundaries = v24;
    goto LABEL_9;
  }
}

- (id)dataForRequest:(id)a3 withError:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 subsystem];
  v8 = [v6 category];
  int64_t v9 = [(PPSRequestDispatcher *)self _readerTypeForSubsystem:v7 category:v8];
  if (!v9)
  {
LABEL_6:
    a4 = [(PPSRequestDispatcher *)self _executeRequest:v6 withError:a4];
    goto LABEL_9;
  }
  if (v9 == 1)
  {
    long long v10 = PPSReaderLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PPSRequestDispatcher dataForRequest:withError:](v10);
    }

    goto LABEL_6;
  }
  if (a4)
  {
    long long v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"No available reader backend.";
    long long v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a4 = [v11 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:0 userInfo:v12];

    a4 = 0;
  }
LABEL_9:

  return a4;
}

- (id)_executeRequest:(id)a3 withError:(id *)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = NSString;
  v8 = [v6 subsystem];
  int64_t v9 = [v6 category];
  long long v10 = [v7 stringWithFormat:@"%@:%@:%@", @"QueryInitialization", v8, v9];

  long long v11 = +[PPSPerformanceProfiler sharedInstance];
  [v11 startProfilingForPhase:v10];

  long long v12 = +[PPSRequestValidator sharedInstance];
  long long v13 = [(PPSRequestDispatcher *)self filepath];
  int v14 = [v12 validateDataRequest:v6 filepath:v13 withError:a4];

  if (!v14)
  {
    v18 = 0;
    goto LABEL_34;
  }
  uint64_t v15 = [v6 subsystem];
  uint64_t v16 = [v6 category];
  v17 = [(PPSRequestDispatcher *)self filepath];

  v50 = v17;
  v51 = self;
  v52 = (void *)v16;
  v53 = (void *)v15;
  if (v17)
  {
    v54 = [(PPSRequestDispatcher *)self filepath];
    +[PPSOffDeviceIngesterUtilities allDataSourcesForFilepath:subsystem:category:](PPSOffDeviceIngesterUtilities, "allDataSourcesForFilepath:subsystem:category:");
  }
  else
  {
    v54 = +[PPSOnDeviceIngesterUtilities filepathForSubsystem:v15 category:v16];
    +[PPSOnDeviceIngesterUtilities allDataSourcesForSubsystem:v15 category:v16];
  double v19 = };
  uint64_t v20 = [v6 metrics];
  if (!v20
    || (v21 = (void *)v20,
        [v6 metrics],
        double v22 = objc_claimAutoreleasedReturnValue(),
        uint64_t v23 = [v22 count],
        v22,
        v21,
        !v23))
  {
    v47 = a4;
    v48 = v12;
    v49 = v6;
    uint64_t v24 = objc_opt_new();
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v25 = v19;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v56 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = +[PPSDataIngesterCommonUtilities columnNamesForFilepath:v54 dataSource:*(void *)(*((void *)&v55 + 1) + 8 * i)];
          v31 = (void *)[v30 mutableCopy];

          [v31 removeObject:@"ID"];
          [v31 removeObject:@"FK_ID"];
          [v24 addObjectsFromArray:v31];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v27);
    }

    v32 = [MEMORY[0x263EFFA08] setWithArray:v24];
    id v6 = v49;
    [v49 setMetrics:v32];

    long long v12 = v48;
    a4 = v47;
  }
  v33 = PPSReaderLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    -[PPSRequestDispatcher _executeRequest:withError:]((uint64_t)v19, v33);
  }

  v34 = PPSReaderLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    -[PPSRequestDispatcher _executeRequest:withError:]((uint64_t)v54, v34);
  }

  v35 = PPSReaderLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[PPSRequestDispatcher _executeRequest:withError:](v6, v35);
  }

  if (v19 && v54)
  {
    v36 = +[PPSPerformanceProfiler sharedInstance];
    [v36 endProfilingForPhase:v10];

    v37 = +[PPSDataIngesterRegistry dataIngesterForFilepath:requestType:](PPSDataIngesterRegistry, "dataIngesterForFilepath:requestType:", v54, [v6 requestType]);
    v38 = v37;
    if (v37)
    {
      [v37 setShouldUseCache:v50 != 0];
      [v38 setDispatcher:v51];
      v18 = [v38 parseDataForRequest:v6 outError:a4];
LABEL_32:

      goto LABEL_33;
    }
    if (a4)
    {
      v42 = (void *)MEMORY[0x263F087E8];
      v43 = NSDictionary;
      v44 = [NSString stringWithFormat:@"Request type isn't supported."];
      v45 = [v43 dictionaryWithObject:v44 forKey:*MEMORY[0x263F08320]];
      *a4 = [v42 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:2 userInfo:v45];
    }
LABEL_31:
    v18 = 0;
    goto LABEL_32;
  }
  if (a4)
  {
    v39 = (void *)MEMORY[0x263F087E8];
    v40 = NSDictionary;
    v38 = [NSString stringWithFormat:@"Invalid data source."];
    v41 = [v40 dictionaryWithObject:v38 forKey:*MEMORY[0x263F08320]];
    *a4 = [v39 errorWithDomain:@"com.apple.PerfPowerServicesReader.request" code:5 userInfo:v41];

    goto LABEL_31;
  }
  v18 = 0;
LABEL_33:

LABEL_34:
  return v18;
}

- (int64_t)_readerTypeForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PPSRequestDispatcher *)self filepath];

  if (v8)
  {
    int64_t v9 = (void *)MEMORY[0x25A2D4DD0]();
    long long v10 = (void *)MEMORY[0x263F5D3B0];
    long long v11 = [(PPSRequestDispatcher *)self filepath];
    long long v12 = [v10 getMetadataHistoryForFilepath:v11 subsystem:v6 category:v7];

    BOOL v13 = [v12 count] != 0;
  }
  else
  {
    int v14 = [MEMORY[0x263F5D3B0] getMetadataForSubsystem:v6 category:v7];
    BOOL v13 = v14 != 0;
  }
  return !v13;
}

- (NSURL)filepath
{
  return self->_filepath;
}

- (void).cxx_destruct
{
}

- (void)dataForRequest:(os_log_t)log withError:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_258F16000, log, OS_LOG_TYPE_DEBUG, "Reader fallback -- raw data to be returned", v1, 2u);
}

- (void)_executeRequest:(void *)a1 withError:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int64_t v3 = [a1 metrics];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_258F16000, a2, OS_LOG_TYPE_DEBUG, "SELECT metrics: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_executeRequest:(uint64_t)a1 withError:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_258F16000, a2, OS_LOG_TYPE_DEBUG, "Requested data path: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_executeRequest:(uint64_t)a1 withError:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_258F16000, a2, OS_LOG_TYPE_DEBUG, "Requested data source: %@", (uint8_t *)&v2, 0xCu);
}

@end