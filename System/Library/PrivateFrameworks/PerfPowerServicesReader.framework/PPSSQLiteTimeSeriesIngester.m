@interface PPSSQLiteTimeSeriesIngester
+ (id)_stringForSourceNames:(id)a3 metrics:(id)a4 predicate:(id)a5;
+ (id)filterTimeSeries:(id)a3 withPredicate:(id)a4;
+ (unint64_t)_hashForStringArray:(id)a3;
- (BOOL)shouldUseCache;
- (NSCache)responseCache;
- (NSURL)filepath;
- (PPSRequestDispatcher)dispatcher;
- (PPSSQLiteTimeSeriesIngester)initWithFilepath:(id)a3;
- (id)_convertSQLiteDataFromQuery:(id)a3 withMetricDefinitions:(id)a4 error:(id *)a5;
- (id)_validBaseMetricFromDefinitions:(id)a3;
- (id)parseDataForRequest:(id)a3 outError:(id *)a4;
- (id)responseForKey:(id)a3 withinTimeWindow:(id)a4;
- (void)removeResponseForKey:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setResponse:(id)a3 forKey:(id)a4 timeWindow:(id)a5;
- (void)setResponseCache:(id)a3;
- (void)setShouldUseCache:(BOOL)a3;
@end

@implementation PPSSQLiteTimeSeriesIngester

- (PPSSQLiteTimeSeriesIngester)initWithFilepath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSSQLiteTimeSeriesIngester;
  v6 = [(PPSSQLiteTimeSeriesIngester *)&v11 init];
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
  id v5 = [(PPSSQLiteTimeSeriesIngester *)self responseCache];
  [v5 removeObjectForKey:v4];
}

- (id)responseForKey:(id)a3 withinTimeWindow:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PPSSQLiteTimeSeriesIngester *)self responseCache];
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
  v13 = [(PPSSQLiteTimeSeriesIngester *)self responseCache];
  [v13 setObject:v12 forKey:v9];
}

- (id)parseDataForRequest:(id)a3 outError:(id *)a4
{
  v79[2] = *MEMORY[0x263EF8340];
  id v67 = a3;
  v69 = [v67 subsystem];
  v68 = [v67 category];
  v66 = [NSString stringWithFormat:@"%@:%@:%@_Prepare", @"QueryExecution", v69, v68];
  id v4 = +[PPSPerformanceProfiler sharedInstance];
  [v4 startProfilingForPhase:v66];

  v64 = [v67 valueFilter];
  v65 = [v67 timeFilter];
  if (v65)
  {
    id v5 = [(PPSSQLiteTimeSeriesIngester *)self filepath];
    id v6 = +[PPSTimestampConverterRegistry converterForFilepath:v5];

    id v7 = [v65 startDate];
    [v7 timeIntervalSince1970];
    double v9 = v8;

    [v6 monotonicTimeFromEpochTime:v9];
    double v11 = v10;
    v12 = [v65 endDate];
    [v12 timeIntervalSince1970];
    double v14 = v13;

    [v6 monotonicTimeFromEpochTime:v14];
    v62 = +[PPSPredicateUtilities predicateForStartTimestamp:endTimestamp:withKeyPath:](PPSPredicateUtilities, "predicateForStartTimestamp:endTimestamp:withKeyPath:", v11, v15);
    if (v64)
    {
      char v16 = (void *)MEMORY[0x263F08730];
      v79[0] = v64;
      v79[1] = v62;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:2];
      id v61 = [v16 andPredicateWithSubpredicates:v17];
    }
    else
    {
      id v61 = v62;
    }
  }
  else
  {
    id v61 = v64;
    v62 = 0;
  }
  v18 = [v67 metrics];
  v19 = [v18 allObjects];

  if (([v19 containsObject:@"timestamp"] & 1) == 0)
  {
    uint64_t v20 = [v19 arrayByAddingObject:@"timestamp"];

    v19 = (void *)v20;
  }
  v21 = [(PPSSQLiteTimeSeriesIngester *)self filepath];
  v22 = +[PPSOffDeviceIngesterUtilities metricDefinitionsForFilepath:v21 subsystem:v69 category:v68 metricNames:v19];
  v71 = (void *)[v22 mutableCopy];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v23 = v19;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (v24)
  {
    char v25 = 0;
    uint64_t v26 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v73 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v29 = [v71 objectForKeyedSubscript:v28];
        if (v29)
        {
          v25 |= +[PPSDataIngesterCommonUtilities directionalityForMetricDefinition:v29] == 3;
        }
        else
        {
          uint64_t v31 = [v28 rangeOfString:@"_[0-9.]+$" options:1024];
          if (v31 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v32 = [MEMORY[0x263EFF9D0] null];
            [v71 setObject:v32 forKeyedSubscript:v28];
          }
          else
          {
            v33 = objc_msgSend(v28, "stringByReplacingCharactersInRange:withString:", v31, v30, &stru_270709350);
            v34 = [(PPSSQLiteTimeSeriesIngester *)self filepath];
            v35 = +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:v34 subsystem:v69 category:v68 metricName:v33];
            [v71 setObject:v35 forKeyedSubscript:v33];
          }
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v78 count:16];
    }
    while (v24);

    if (v25 & 1) == 0 || ([v23 containsObject:@"timestampEnd"])
    {
      v36 = v23;
      goto LABEL_27;
    }
    v36 = [v23 arrayByAddingObject:@"timestampEnd"];

    id v23 = [MEMORY[0x263EFF9D0] null];
    [v71 setObject:v23 forKeyedSubscript:@"timestampEnd"];
  }
  else
  {
    v36 = v23;
  }

LABEL_27:
  v37 = @"ASC";
  if ([v67 readDirection] == 1)
  {
    v38 = @"DESC";

    v37 = v38;
  }
  v39 = [(PPSSQLiteTimeSeriesIngester *)self filepath];
  v63 = +[PPSOffDeviceIngesterUtilities allDataSourcesForFilepath:v39 subsystem:v69 category:v68];

  v60 = [(id)objc_opt_class() _stringForSourceNames:v63 metrics:v36 predicate:v64];
  if ([(PPSSQLiteTimeSeriesIngester *)self shouldUseCache]
    && ([(PPSSQLiteTimeSeriesIngester *)self responseForKey:v60 withinTimeWindow:v65], (id v40 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v41 = [(id)objc_opt_class() filterTimeSeries:v40 withPredicate:v62];
  }
  else
  {
    v58 = [[PPSSQLiteEntity alloc] initWithTableNames:v63];
    v42 = [PPSSQLiteQueryDescriptor alloc];
    v43 = objc_msgSend(v61, "pps_sqlPredicateForSelect");
    v44 = -[PPSSQLiteQueryDescriptor initWithEntity:predicate:limitCount:offsetCount:](v42, "initWithEntity:predicate:limitCount:offsetCount:", v58, v43, [v67 limitCount], objc_msgSend(v67, "offsetCount"));

    v77 = @"timestamp";
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
    [(PPSSQLiteQueryDescriptor *)v44 setOrderByProperties:v45];

    v76 = v37;
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
    [(PPSSQLiteQueryDescriptor *)v44 setOrderByDirections:v46];

    v47 = [PPSSQLiteDatabase alloc];
    v48 = [(PPSSQLiteTimeSeriesIngester *)self filepath];
    v49 = [(PPSSQLiteDatabase *)v47 initWithDatabaseURL:v48];

    v50 = [[PPSSQLiteQuery alloc] initWithDatabase:v49 descriptor:v44];
    v51 = PPSReaderLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      -[PPSSQLiteTimeSeriesIngester parseDataForRequest:outError:](v50, (uint64_t)v36, v51);
    }

    v52 = +[PPSPerformanceProfiler sharedInstance];
    [v52 endProfilingForPhase:v66];

    uint64_t v53 = [NSString stringWithFormat:@"%@:%@:%@_SQLEnumerate", @"QueryExecution", v69, v68];

    v54 = +[PPSPerformanceProfiler sharedInstance];
    [v54 startProfilingForPhase:v53];

    [(PPSSQLiteDatabase *)v49 openForReadingWithError:a4];
    if (*a4)
    {
      [(PPSSQLiteDatabase *)v49 close];
      v55 = 0;
    }
    else
    {
      v55 = -[PPSSQLiteTimeSeriesIngester _convertSQLiteDataFromQuery:withMetricDefinitions:error:](self, "_convertSQLiteDataFromQuery:withMetricDefinitions:error:", v50, v71);
      [(PPSSQLiteDatabase *)v49 close];
      if (v55 && [(PPSSQLiteTimeSeriesIngester *)self shouldUseCache]) {
        [(PPSSQLiteTimeSeriesIngester *)self setResponse:v55 forKey:v60 timeWindow:v65];
      }
    }
    v56 = +[PPSPerformanceProfiler sharedInstance];
    [v56 endProfilingForPhase:v53];

    id v40 = v55;
    v66 = (void *)v53;
    v41 = v40;
  }

  return v41;
}

- (id)_validBaseMetricFromDefinitions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = (void *)[v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        double v8 = objc_msgSend(v3, "objectForKeyedSubscript:", v7, (void)v12);
        double v9 = [MEMORY[0x263EFF9D0] null];
        int v10 = [v8 isEqual:v9];

        if (!v10)
        {
          id v4 = [v3 objectForKeyedSubscript:v7];
          goto LABEL_11;
        }
      }
      id v4 = (void *)[v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_convertSQLiteDataFromQuery:(id)a3 withMetricDefinitions:(id)a4 error:(id *)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v42 = v7;
  if (v7)
  {
    id v40 = a5;
    double v9 = objc_opt_new();
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v39 = v8;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v63 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          if (([v14 isEqualToString:@"timestamp"] & 1) != 0
            || [v14 isEqualToString:@"timestampEnd"])
          {
            [v9 addObject:v14];
          }
          else
          {
            long long v15 = [v10 objectForKeyedSubscript:v14];
            char v16 = +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:v15];
            if ([v15 auxiliaryType] == 2)
            {
              uint64_t v17 = [NSString stringWithFormat:@"%@_Dynamic.%@", v16, v14];
              [v9 addObject:v17];
            }
            else if ([v15 auxiliaryType] == 3)
            {
              if ([v15 fixedArraySize])
              {
                if ([v15 fixedArraySize])
                {
                  uint64_t v18 = 0;
                  do
                  {
                    v19 = [NSString stringWithFormat:@"%@_%d", v14, v18];
                    [v9 addObject:v19];

                    uint64_t v18 = (v18 + 1);
                  }
                  while (v18 < [v15 fixedArraySize]);
                }
              }
              else
              {
                uint64_t v20 = [NSString stringWithFormat:@"%@_Array_%@.%@", v16, v14, v14];
                [v9 addObject:v20];
              }
            }
            else
            {
              [v9 addObject:v14];
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v62 objects:v66 count:16];
      }
      while (v11);
    }

    v21 = [v42 columnNamesForProperties:v9];
    v22 = PPSReaderLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PPSSQLiteTimeSeriesIngester _convertSQLiteDataFromQuery:withMetricDefinitions:error:]();
    }

    uint64_t v23 = [v21 count];
    if (v23 != [v9 count]) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Number of column and metric names should be the same."];
    }
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__2;
    v60 = __Block_byref_object_dispose__2;
    id v61 = [(PPSSQLiteTimeSeriesIngester *)self _validBaseMetricFromDefinitions:v10];
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x3032000000;
    uint64_t v53 = __Block_byref_object_copy__2;
    v54 = __Block_byref_object_dispose__2;
    id v55 = (id)objc_opt_new();
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __87__PPSSQLiteTimeSeriesIngester__convertSQLiteDataFromQuery_withMetricDefinitions_error___block_invoke;
    v44[3] = &unk_265443500;
    v44[4] = self;
    id v24 = v21;
    id v45 = v24;
    id v25 = v10;
    id v46 = v25;
    id v47 = v42;
    v48 = &v56;
    v49 = &v50;
    [v47 enumerateProperties:v9 error:v40 enumerationHandler:v44];
    uint64_t v26 = (void *)v57[5];
    if (v26)
    {
      v27 = [MEMORY[0x263EFF9D0] null];
      char v28 = [v26 isEqual:v27];

      if ((v28 & 1) == 0)
      {
        v29 = +[PPSRecipeEngine sharedInstance];
        uint64_t v30 = [v29 createTimeSeriesRecipeForMetric:v57[5]];

        if (v30)
        {
          uint64_t v31 = +[PPSRecipeEngine sharedInstance];
          uint64_t v32 = v51[5];
          id v43 = 0;
          uint64_t v33 = [v31 executeTimeSeriesRecipe:v30 on:v32 metrics:v25 error:&v43];
          id v34 = v43;
          v35 = (void *)v51[5];
          v51[5] = v33;

          if (v34)
          {
            v36 = PPSReaderLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              -[PPSSQLiteTimeSeriesIngester _convertSQLiteDataFromQuery:withMetricDefinitions:error:]();
            }
          }
        }
      }
    }
    id v37 = (id)v51[5];

    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v56, 8);

    id v8 = v39;
  }
  else
  {
    id v37 = 0;
  }

  return v37;
}

uint64_t __87__PPSSQLiteTimeSeriesIngester__convertSQLiteDataFromQuery_withMetricDefinitions_error___block_invoke(uint64_t a1, void *a2, PPSSQLiteRow *a3)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a2;
  context = (void *)MEMORY[0x25A2D4DD0]();
  id v6 = objc_opt_new();
  id v7 = [*(id *)(a1 + 32) filepath];
  v54 = +[PPSTimestampConverterRegistry converterForFilepath:v7];

  if ([*(id *)(a1 + 40) count])
  {
    unint64_t v8 = 0;
    double v9 = 0.0;
    double v10 = 0.0;
    v51 = v6;
    id v53 = v5;
    do
    {
      uint64_t v11 = [v5 objectAtIndexedSubscript:v8];
      int v12 = [v11 isEqualToString:@"timestamp"];

      long long v13 = [v5 objectAtIndexedSubscript:v8];
      if (v12)
      {
        double v9 = PPSSQLiteColumnValueWithNameAsDouble((uint64_t)a3, v13);

        [v54 systemOffsetFromMonotonicTime:v9];
        double v10 = v14;
      }
      else
      {
        long long v15 = a3;
        char v16 = PPSSQLiteColumnValueWithNameAsFoundationType(a3, v13);

        uint64_t v17 = *(void **)(a1 + 48);
        uint64_t v18 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
        v19 = [v17 objectForKeyedSubscript:v18];

        if (v19)
        {
          uint64_t v20 = [MEMORY[0x263EFF9D0] null];
          char v21 = [v19 isEqual:v20];

          if ((v21 & 1) == 0)
          {
            if (+[PPSEnumerationDecoder isDecodableMetric:v19])
            {
              uint64_t v22 = +[PPSEnumerationDecoder decodeValue:v16 withMetric:v19];

              char v16 = (void *)v22;
            }
            uint64_t v23 = +[PPSRecipeEngine sharedInstance];
            id v24 = [v23 createMetricRecipeForMetric:v19];

            if (v24)
            {
              id v25 = +[PPSRecipeEngine sharedInstance];
              id v56 = 0;
              uint64_t v26 = [v25 executeMetricRecipe:v24 on:v16 metric:v19 error:&v56];
              id v27 = v56;

              if (v27)
              {
                char v28 = PPSReaderLog();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v58 = v24;
                  _os_log_error_impl(&dword_258F16000, v28, OS_LOG_TYPE_ERROR, "Metric Recipe '%@' failed during time series ingestion", buf, 0xCu);
                }
              }
              char v16 = (void *)v26;
              id v6 = v51;
            }
          }
        }
        uint64_t v29 = (uint64_t)v16;
        if (!v16)
        {
          uint64_t v29 = [MEMORY[0x263EFF9D0] null];
          uint64_t v52 = (void *)v29;
        }
        uint64_t v30 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
        [v6 setValue:v29 forKey:v30];

        if (!v16) {
        a3 = v15;
        }
        id v5 = v53;
      }
      ++v8;
    }
    while (v8 < [*(id *)(a1 + 40) count]);
  }
  else
  {
    double v10 = 0.0;
    double v9 = 0.0;
  }
  uint64_t v31 = [*(id *)(a1 + 56) descriptor];
  uint64_t v32 = [v31 entity];
  uint64_t v33 = [v32 tableNames];

  id v34 = +[PPSEvent eventWithMonotonicTimestamp:timeOffset:dictionary:groupId:](PPSEvent, "eventWithMonotonicTimestamp:timeOffset:dictionary:groupId:", v6, [(id)objc_opt_class() _hashForStringArray:v33], v9, v10);
  v35 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v35)
  {
    v36 = [MEMORY[0x263EFF9D0] null];
    char v37 = [v35 isEqual:v36];

    if ((v37 & 1) == 0)
    {
      v38 = NSString;
      id v39 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) subsystem];
      id v40 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) category];
      v41 = [v38 stringWithFormat:@"%@:%@", v39, v40];
      [v34 setLabel:v41];

      v42 = +[PPSRecipeEngine sharedInstance];
      id v43 = [v42 createEventRecipeForMetric:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

      if (v43)
      {
        v44 = +[PPSRecipeEngine sharedInstance];
        uint64_t v45 = *(void *)(a1 + 48);
        id v55 = 0;
        uint64_t v46 = [v44 executeEventRecipe:v43 on:v34 metrics:v45 error:&v55];
        id v47 = v55;

        if (v47)
        {
          v48 = PPSReaderLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            __87__PPSSQLiteTimeSeriesIngester__convertSQLiteDataFromQuery_withMetricDefinitions_error___block_invoke_cold_1();
          }
        }
        id v34 = (void *)v46;
      }
    }
  }
  if (v34) {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addEvent:v34];
  }

  return 1;
}

+ (unint64_t)_hashForStringArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 ^= (v6 << 6) + (v6 >> 2) + 2654435769u + [*(id *)(*((void *)&v10 + 1) + 8 * i) hash];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)_stringForSourceNames:(id)a3 metrics:(id)a4 predicate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = [(id)objc_opt_class() _hashForStringArray:v8];

  uint64_t v11 = [v7 hash];
  uint64_t v12 = (v11 + (v10 << 6) + (v10 >> 2) + 2654435769u) ^ v10;
  long long v13 = NSString;
  double v14 = [v9 componentsJoinedByString:@","];

  uint64_t v15 = [v13 stringWithFormat:@"%@::%lu", v14, v12];

  return v15;
}

+ (id)filterTimeSeries:(id)a3 withPredicate:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v20 = a4;
  if (!v20)
  {
    id v6 = v5;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 filteredTimeSeriesUsingPredicate:v20];
LABEL_5:
    id v7 = v6;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v19 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v15 = (void *)MEMORY[0x25A2D4DD0]();
          char v16 = objc_opt_class();
          uint64_t v17 = [v9 objectForKeyedSubscript:v14];
          uint64_t v18 = [v16 filterTimeSeries:v17 withPredicate:v20];

          [v7 setObject:v18 forKeyedSubscript:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v5 = v19;
  }
  else
  {
    id v7 = 0;
  }
LABEL_6:

  return v7;
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

- (void)parseDataForRequest:(NSObject *)a3 outError:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 selectSQLWithProperties:a2];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_258F16000, a3, OS_LOG_TYPE_DEBUG, "Query before value-binding: %@", v5, 0xCu);
}

- (void)_convertSQLiteDataFromQuery:withMetricDefinitions:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_258F16000, v0, OS_LOG_TYPE_ERROR, "Time Series Recipe '%@' failed during time series ingestion", v1, 0xCu);
}

- (void)_convertSQLiteDataFromQuery:withMetricDefinitions:error:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_258F16000, v1, OS_LOG_TYPE_DEBUG, "Column Names %@ Properties %@", v2, 0x16u);
}

void __87__PPSSQLiteTimeSeriesIngester__convertSQLiteDataFromQuery_withMetricDefinitions_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_258F16000, v0, OS_LOG_TYPE_ERROR, "Event Recipe '%@' failed during time series ingestion", v1, 0xCu);
}

@end