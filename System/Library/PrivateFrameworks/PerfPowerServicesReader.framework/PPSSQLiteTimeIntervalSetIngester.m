@interface PPSSQLiteTimeIntervalSetIngester
+ (id)_filterIntervalSet:(id)a3 withTimeInterval:(id)a4;
+ (id)_stringForSourceName:(id)a3 metrics:(id)a4 predicate:(id)a5;
- (BOOL)shouldUseCache;
- (NSCache)responseCache;
- (NSURL)filepath;
- (PPSRequestDispatcher)dispatcher;
- (PPSSQLiteTimeIntervalSetIngester)initWithFilepath:(id)a3;
- (id)_computeIntervalSetForRequest:(id)a3 outError:(id *)a4;
- (id)_computeIntervalSetMapForRequest:(id)a3 outError:(id *)a4;
- (id)filterIntervalSet:(id)a3 withTimeFilter:(id)a4;
- (id)filterIntervalSetMap:(id)a3 withTimeFilter:(id)a4;
- (id)parseDataForRequest:(id)a3 outError:(id *)a4;
- (id)responseForKey:(id)a3 withinTimeWindow:(id)a4;
- (void)removeResponseForKey:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setResponse:(id)a3 forKey:(id)a4 timeWindow:(id)a5;
- (void)setResponseCache:(id)a3;
- (void)setShouldUseCache:(BOOL)a3;
@end

@implementation PPSSQLiteTimeIntervalSetIngester

- (PPSSQLiteTimeIntervalSetIngester)initWithFilepath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSSQLiteTimeIntervalSetIngester;
  v6 = [(PPSSQLiteTimeIntervalSetIngester *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filepath, a3);
    uint64_t v8 = objc_opt_new();
    responseCache = v7->_responseCache;
    v7->_responseCache = (NSCache *)v8;
  }
  return v7;
}

- (void)removeResponseForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PPSSQLiteTimeIntervalSetIngester *)self responseCache];
  [v5 removeObjectForKey:v4];
}

- (id)responseForKey:(id)a3 withinTimeWindow:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PPSSQLiteTimeIntervalSetIngester *)self responseCache];
  v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    v10 = 0;
    goto LABEL_11;
  }
  v10 = [v9 firstObject];
  objc_super v11 = [v9 lastObject];
  v12 = [MEMORY[0x263EFF9D0] null];

  if (v11 == v12) {
    goto LABEL_11;
  }
  v13 = [v9 lastObject];
  if (v13)
  {
    v14 = [v6 startDate];
    if ([v13 containsDate:v14])
    {
      v15 = [v6 endDate];
      char v16 = [v13 containsDate:v15];

      if (v16) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    v10 = 0;
  }
LABEL_10:

LABEL_11:
  return v10;
}

- (void)setResponse:(id)a3 forKey:(id)a4 timeWindow:(id)a5
{
  v14[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = v8;
  objc_super v11 = v10;
  if (!v10)
  {
    objc_super v11 = [MEMORY[0x263EFF9D0] null];
  }
  v14[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  if (!v10) {

  }
  v13 = [(PPSSQLiteTimeIntervalSetIngester *)self responseCache];
  [v13 setObject:v12 forKey:v9];
}

- (id)parseDataForRequest:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 dimensions];
  uint64_t v8 = [v7 count];

  if (v8) {
    [(PPSSQLiteTimeIntervalSetIngester *)self _computeIntervalSetMapForRequest:v6 outError:a4];
  }
  else {
  id v9 = [(PPSSQLiteTimeIntervalSetIngester *)self _computeIntervalSetForRequest:v6 outError:a4];
  }

  return v9;
}

- (id)_computeIntervalSetMapForRequest:(id)a3 outError:(id *)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 subsystem];
  uint64_t v7 = [v5 category];
  uint64_t v8 = [v5 metrics];
  id v9 = [v8 allObjects];
  id v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v5 timeFilter];
  uint64_t v12 = [v5 valueFilter];
  v13 = [(PPSSQLiteTimeIntervalSetIngester *)self filepath];
  uint64_t v14 = +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:v13 subsystem:v6 category:v7];

  v75 = (void *)v14;
  v71 = (void *)v12;
  uint64_t v15 = [(id)objc_opt_class() _stringForSourceName:v14 metrics:v10 predicate:v12];
  v79 = (void *)v11;
  if ([(PPSSQLiteTimeIntervalSetIngester *)self shouldUseCache])
  {
    v78 = [(PPSSQLiteTimeIntervalSetIngester *)self responseForKey:v15 withinTimeWindow:v11];
  }
  else
  {
    v78 = 0;
  }
  char v16 = [v10 firstObject];
  if (v16)
  {
    v17 = [v10 firstObject];
  }
  else
  {
    v17 = @"timestamp";
  }
  v18 = v17;

  v19 = [(PPSSQLiteTimeIntervalSetIngester *)self filepath];
  v74 = (void *)v6;
  v76 = +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:v19 subsystem:v6 category:v7 metricName:v18];

  context = (void *)MEMORY[0x25A2D4DD0]();
  v20 = [(PPSSQLiteTimeIntervalSetIngester *)self filepath];
  v21 = +[PPSDataIngesterRegistry dataIngesterForFilepath:v20 requestType:0];

  v72 = v10;
  v73 = (void *)v7;
  v70 = (void *)v15;
  v77 = v18;
  if (v79)
  {
    v22 = [v79 startDate];
    [v22 timeIntervalSince1970];
    double v24 = v23 + -10800.0;

    v25 = [v79 endDate];
    [v25 timeIntervalSince1970];
    double v27 = v26 + 10800.0;

    v28 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v24];
    v29 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v27];
    uint64_t v30 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v28 endDate:v29];
  }
  else
  {
    uint64_t v30 = 0;
  }
  v31 = (void *)MEMORY[0x263EFFA08];
  v32 = [v5 metrics];
  v33 = [v32 allObjects];
  v34 = [v31 setWithArray:v33];
  v35 = (void *)[v34 mutableCopy];

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v36 = [v5 dimensions];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v83 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = [*(id *)(*((void *)&v82 + 1) + 8 * i) groupBy];
        [v35 addObject:v41];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v82 objects:v88 count:16];
    }
    while (v38);
  }

  v42 = [PPSTimeSeriesRequest alloc];
  v43 = [v5 predicate];
  v66 = (void *)v30;
  v44 = [(PPSTimeSeriesRequest *)v42 initWithMetrics:v35 predicate:v43 timeFilter:v30];

  uint64_t v45 = [v21 shouldUseCache];
  [v21 setShouldUseCache:0];
  v46 = [v21 parseDataForRequest:v44 outError:a4];
  [v21 setShouldUseCache:v45];
  if (*a4)
  {
    BOOL v47 = 0;
  }
  else
  {
    v48 = [v5 dimensions];
    uint64_t v49 = [v48 count];
    BOOL v47 = v49 != 0;

    if (v49)
    {
      v65 = [[PPSTimeIntervalSetGenerator alloc] initWithFilepath:self->_filepath settings:0 directionality:+[PPSDataIngesterCommonUtilities directionalityForMetricDefinition:v76]];
      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = __78__PPSSQLiteTimeIntervalSetIngester__computeIntervalSetMapForRequest_outError___block_invoke;
      v80[3] = &unk_2654435D8;
      id v50 = v77;
      id v81 = v50;
      v68 = (void *)MEMORY[0x25A2D4FC0](v80);
      if ([v76 auxiliaryType] == 2)
      {
        uint64_t v51 = [NSString stringWithFormat:@"%@_Dynamic.%@", v75, v50];

        v77 = (void *)v51;
      }
      else
      {
        v77 = v50;
      }
      v55 = [v5 dimensions];
      v54 = v65;
      v56 = [(PPSTimeIntervalSetGenerator *)v65 intervalSetMapForTimeSeries:v46 withGroupingDimensions:v55 withIntervalStartCheckBlock:0 intervalEndCheckBlock:0 payloadBlock:v68 coalescePolicy:0];

      if (v79)
      {
        uint64_t v57 = -[PPSSQLiteTimeIntervalSetIngester filterIntervalSetMap:withTimeFilter:](self, "filterIntervalSetMap:withTimeFilter:", v56);

        v56 = (void *)v57;
      }

      v78 = v56;
    }
    else
    {
      v52 = (void *)MEMORY[0x263F087E8];
      uint64_t v86 = *MEMORY[0x263F08338];
      v87 = @"No grouping dimensions provided for interval set map request.";
      uint64_t v53 = [NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
      *a4 = [v52 errorWithDomain:@"com.apple.PerfPowerServicesReader" code:0 userInfo:v53];
      v54 = (void *)v53;
    }
  }
  if (v47)
  {
    v59 = v73;
    v58 = v74;
    v60 = v70;
    v61 = v78;
    if (v78 && [(PPSSQLiteTimeIntervalSetIngester *)self shouldUseCache]) {
      [(PPSSQLiteTimeIntervalSetIngester *)self setResponse:v78 forKey:v70 timeWindow:v79];
    }
    v62 = (void *)[v78 copy];
    v63 = v72;
  }
  else
  {
    v62 = 0;
    v59 = v73;
    v58 = v74;
    v63 = v72;
    v60 = v70;
    v61 = v78;
  }

  return v62;
}

id __78__PPSSQLiteTimeIntervalSetIngester__computeIntervalSetMapForRequest_outError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = [a4 valueForKey:@"__directionality"];
  int v10 = [v9 intValue];

  if (v10 == 1) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = v7;
  }
  uint64_t v12 = [v11 metricValueForKey:*(void *)(a1 + 32)];
  v13 = (void *)v12;
  if (v12)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    v17[0] = v12;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_computeIntervalSetForRequest:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 subsystem];
  id v7 = [v5 category];
  id v8 = [NSString stringWithFormat:@"%@_%@:%@", @"QueryExecution", v6, v7];
  id v9 = +[PPSPerformanceProfiler sharedInstance];
  [v9 startProfilingForPhase:v8];

  int v10 = [v5 metrics];
  uint64_t v11 = [v10 allObjects];

  uint64_t v12 = [v5 timeFilter];
  uint64_t v13 = [v5 valueFilter];
  uint64_t v14 = [(PPSSQLiteTimeIntervalSetIngester *)self filepath];
  uint64_t v15 = +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:v14 subsystem:v6 category:v7];

  v60 = (void *)v15;
  v61 = (void *)v13;
  v62 = (void *)v11;
  uint64_t v16 = [(id)objc_opt_class() _stringForSourceName:v15 metrics:v11 predicate:v13];
  if ([(PPSSQLiteTimeIntervalSetIngester *)self shouldUseCache]
    && ([(PPSSQLiteTimeIntervalSetIngester *)self responseForKey:v16 withinTimeWindow:v12], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v18 = (id)v17;
    v19 = [(PPSSQLiteTimeIntervalSetIngester *)self filterIntervalSet:v17 withTimeFilter:v12];
    v20 = v62;
  }
  else
  {
    v54 = v16;
    context = (void *)MEMORY[0x25A2D4DD0]();
    v21 = [(PPSSQLiteTimeIntervalSetIngester *)self filepath];
    v22 = +[PPSDataIngesterRegistry dataIngesterForFilepath:v21 requestType:0];

    v56 = v7;
    uint64_t v57 = v6;
    v55 = v8;
    if (v12)
    {
      double v23 = [v12 startDate];
      [v23 timeIntervalSince1970];
      double v25 = v24 + -10800.0;

      double v26 = [v12 endDate];
      [v26 timeIntervalSince1970];
      double v28 = v27 + 10800.0;

      v29 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v25];
      uint64_t v30 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v28];
      uint64_t v31 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v29 endDate:v30];
    }
    else
    {
      uint64_t v31 = 0;
    }
    v32 = [PPSTimeSeriesRequest alloc];
    v33 = [v5 metrics];
    v34 = [v5 predicate];
    v52 = (void *)v31;
    uint64_t v35 = [(PPSTimeSeriesRequest *)v32 initWithMetrics:v33 predicate:v34 timeFilter:v31];

    uint64_t v36 = [v22 shouldUseCache];
    [v22 setShouldUseCache:0];
    uint64_t v51 = (void *)v35;
    uint64_t v37 = [v22 parseDataForRequest:v35 outError:a4];
    [v22 setShouldUseCache:v36];
    id v38 = *a4;
    if (*a4)
    {
      id v18 = 0;
    }
    else
    {
      uint64_t v39 = [v62 firstObject];
      if (v39)
      {
        v40 = [v62 firstObject];
      }
      else
      {
        v40 = @"timestamp";
      }
      v41 = v40;

      v42 = [(PPSSQLiteTimeIntervalSetIngester *)self filepath];
      v59 = v41;
      uint64_t v43 = +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:v42 subsystem:v57 category:v56 metricName:v41];

      id v50 = (void *)v43;
      v44 = [[PPSTimeIntervalSetGenerator alloc] initWithDispatcher:self->_dispatcher settings:0 directionality:+[PPSDataIngesterCommonUtilities directionalityForMetricDefinition:v43]];
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x3032000000;
      v67 = __Block_byref_object_copy__4;
      v68 = __Block_byref_object_dispose__4;
      id v69 = [v62 firstObject];
      if (v65[5])
      {
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __75__PPSSQLiteTimeIntervalSetIngester__computeIntervalSetForRequest_outError___block_invoke;
        v63[3] = &unk_265443600;
        v63[4] = &v64;
        uint64_t v45 = (void *)MEMORY[0x25A2D4FC0](v63);
      }
      else
      {
        uint64_t v45 = 0;
      }
      v46 = v44;
      id v18 = [(PPSTimeIntervalSetGenerator *)v44 intervalSetForTimeSeries:v37 withIntervalStartCheckBlock:0 intervalEndCheckBlock:0 payloadBlock:v45 coalescePolicy:0];
      if (v12)
      {
        uint64_t v47 = [(PPSSQLiteTimeIntervalSetIngester *)self filterIntervalSet:v18 withTimeFilter:v12];

        id v18 = (id)v47;
      }

      _Block_object_dispose(&v64, 8);
    }
    v20 = v62;

    if (v38)
    {
      v19 = 0;
      id v7 = v56;
      uint64_t v6 = v57;
      uint64_t v16 = v54;
      id v8 = v55;
    }
    else
    {
      uint64_t v16 = v54;
      id v8 = v55;
      if (v18 && [(PPSSQLiteTimeIntervalSetIngester *)self shouldUseCache]) {
        [(PPSSQLiteTimeIntervalSetIngester *)self setResponse:v18 forKey:v54 timeWindow:v12];
      }
      v48 = +[PPSPerformanceProfiler sharedInstance];
      [v48 endProfilingForPhase:v55];

      id v18 = v18;
      v19 = v18;
      id v7 = v56;
      uint64_t v6 = v57;
    }
  }

  return v19;
}

id __75__PPSSQLiteTimeIntervalSetIngester__computeIntervalSetForRequest_outError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = [a4 valueForKey:@"__directionality"];
  int v10 = [v9 intValue];

  if (v10 == 1) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = v7;
  }
  uint64_t v12 = [v11 metricValueForKey:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  uint64_t v13 = (void *)v12;
  if (v12)
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v17[0] = v12;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)_filterIntervalSet:(id)a3 withTimeInterval:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v20 = a4;
  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [[PPSTimeIntervalSet alloc] initWithTimeInterval:v20];
      id v7 = [v5 intersectionFromIntervalSet:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v19 = v5;
        id v8 = v5;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              uint64_t v14 = (void *)MEMORY[0x25A2D4DD0]();
              uint64_t v15 = objc_opt_class();
              uint64_t v16 = [v8 objectForKeyedSubscript:v13];
              uint64_t v17 = [v15 _filterIntervalSet:v16 withTimeInterval:v20];

              [v7 setObject:v17 forKeyedSubscript:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v10);
        }

        id v5 = v19;
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

+ (id)_stringForSourceName:(id)a3 metrics:(id)a4 predicate:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v8);
        }
        v12 ^= (v12 << 6) + 2654435769u + (v12 >> 2) + [*(id *)(*((void *)&v18 + 1) + 8 * i) hash];
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
  else
  {
    unint64_t v12 = 0;
  }
  uint64_t v15 = [v9 hash];
  uint64_t v16 = [NSString stringWithFormat:@"%@::%lu", v7, ((v12 << 6) + 2654435769u + (v12 >> 2) + v15) ^ v12];

  return v16;
}

- (id)filterIntervalSet:(id)a3 withTimeFilter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      id v9 = [(PPSSQLiteTimeIntervalSetIngester *)self filepath];
      uint64_t v10 = +[PPSTimestampConverterRegistry converterForFilepath:v9];

      uint64_t v11 = [v8 startDate];
      [v11 timeIntervalSince1970];
      double v13 = v12;

      [v10 monotonicTimeFromEpochTime:v13];
      double v15 = v14;
      uint64_t v16 = [v8 endDate];
      [v16 timeIntervalSince1970];
      double v18 = v17;

      [v10 monotonicTimeFromEpochTime:v18];
      long long v20 = [[PPSTimeInterval alloc] initWithStartTimestamp:0 endTimestamp:v15 payload:v19];
      id v21 = [(id)objc_opt_class() _filterIntervalSet:v6 withTimeInterval:v20];
    }
    else
    {
      id v21 = v6;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)filterIntervalSetMap:(id)a3 withTimeFilter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)[v6 mutableCopy];
    if ((int)[v6 count] >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        uint64_t v10 = [v6 allKeys];
        uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

        double v12 = [v6 objectForKeyedSubscript:v11];
        double v13 = [(PPSSQLiteTimeIntervalSetIngester *)self filterIntervalSet:v12 withTimeFilter:v7];
        [v8 setObject:v13 forKeyedSubscript:v11];

        ++v9;
      }
      while (v9 < (int)[v6 count]);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSURL)filepath
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)shouldUseCache
{
  return self->_shouldUseCache;
}

- (void)setShouldUseCache:(BOOL)a3
{
  self->_shouldUseCache = a3;
}

- (PPSRequestDispatcher)dispatcher
{
  return (PPSRequestDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDispatcher:(id)a3
{
}

- (NSCache)responseCache
{
  return (NSCache *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResponseCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCache, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
}

@end