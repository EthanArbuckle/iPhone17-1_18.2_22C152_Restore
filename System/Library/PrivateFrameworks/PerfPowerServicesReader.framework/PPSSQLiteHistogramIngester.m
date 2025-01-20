@interface PPSSQLiteHistogramIngester
- (BOOL)shouldUseCache;
- (NSURL)filepath;
- (PPSRequestDispatcher)dispatcher;
- (PPSSQLiteHistogramIngester)initWithFilepath:(id)a3;
- (id)_convertSQLiteDataFromQuery:(id)a3 withDimensions:(id)a4 outError:(id *)a5;
- (id)parseDataForRequest:(id)a3 outError:(id *)a4;
- (void)setDispatcher:(id)a3;
- (void)setShouldUseCache:(BOOL)a3;
@end

@implementation PPSSQLiteHistogramIngester

- (PPSSQLiteHistogramIngester)initWithFilepath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSSQLiteHistogramIngester;
  v6 = [(PPSSQLiteHistogramIngester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_filepath, a3);
  }

  return v7;
}

- (id)parseDataForRequest:(id)a3 outError:(id *)a4
{
  v59[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v52 = [v5 subsystem];
  v51 = [v5 category];
  v49 = [v5 valueFilter];
  v53 = [v5 timeFilter];
  v6 = [v5 metrics];
  v7 = [v6 allObjects];

  if (v53)
  {
    v8 = [(PPSSQLiteHistogramIngester *)self filepath];
    objc_super v9 = +[PPSTimestampConverterRegistry converterForFilepath:v8];

    v10 = [v53 startDate];
    [v10 timeIntervalSince1970];
    double v12 = v11;

    [v9 monotonicTimeFromEpochTime:v12];
    double v14 = v13;
    v15 = [v53 endDate];
    [v15 timeIntervalSince1970];
    double v17 = v16;

    [v9 monotonicTimeFromEpochTime:v17];
    v19 = +[PPSPredicateUtilities predicateForStartTimestamp:@"timestamp" endTimestamp:v14 withKeyPath:v18];
    v20 = v19;
    if (v49)
    {
      v21 = (void *)MEMORY[0x263F08730];
      v59[0] = v49;
      v59[1] = v19;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
      id v48 = [v21 andPredicateWithSubpredicates:v22];
    }
    else
    {
      id v48 = v19;
    }
  }
  else
  {
    id v48 = v49;
  }
  v23 = [(PPSSQLiteHistogramIngester *)self filepath];
  v24 = +[PPSOffDeviceIngesterUtilities metricDefinitionsForFilepath:v23 subsystem:v52 category:v51 metricNames:v7];
  v25 = (void *)[v24 mutableCopy];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v26 = v7;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v55 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        v31 = [v25 objectForKeyedSubscript:v30];
        BOOL v32 = v31 == 0;

        if (v32)
        {
          v33 = [MEMORY[0x263EFF9D0] null];
          [v25 setObject:v33 forKeyedSubscript:v30];
        }
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v27);
  }

  v34 = [(PPSSQLiteHistogramIngester *)self filepath];
  v35 = +[PPSOffDeviceIngesterUtilities allDataSourcesForFilepath:v34 subsystem:v52 category:v51];

  v36 = [[PPSSQLiteEntity alloc] initWithTableNames:v35];
  v37 = [PPSSQLiteQueryDescriptor alloc];
  v38 = objc_msgSend(v48, "pps_sqlPredicateForSelect");
  v39 = [(PPSSQLiteQueryDescriptor *)v37 initWithEntity:v36 predicate:v38];

  v40 = [PPSSQLiteDatabase alloc];
  v41 = [(PPSSQLiteHistogramIngester *)self filepath];
  v42 = [(PPSSQLiteDatabase *)v40 initWithDatabaseURL:v41];

  v43 = [[PPSSQLiteQuery alloc] initWithDatabase:v42 descriptor:v39];
  v44 = PPSReaderLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    -[PPSSQLiteHistogramIngester parseDataForRequest:outError:](v43, (uint64_t)v26, v44);
  }

  [(PPSSQLiteDatabase *)v42 openForReadingWithError:a4];
  if (*a4)
  {
    v45 = 0;
  }
  else
  {
    v46 = [v5 dimensions];
    v45 = [(PPSSQLiteHistogramIngester *)self _convertSQLiteDataFromQuery:v43 withDimensions:v46 outError:a4];
  }
  [(PPSSQLiteDatabase *)v42 close];

  return v45;
}

- (id)_convertSQLiteDataFromQuery:(id)a3 withDimensions:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__3;
    v25 = __Block_byref_object_dispose__3;
    id v26 = [[PPSHistogram alloc] initWithDimensions:v8];
    objc_super v9 = [v8 valueForKeyPath:@"@unionOfObjects.metricName"];
    v10 = [v7 columnNamesForProperties:v9];
    uint64_t v11 = [v10 count];
    if (v11 != [v9 count]) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Number of columns and metric names should be the same."];
    }
    uint64_t v12 = [v10 count];
    if (v12 != [v8 count]) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Number of columns and histogram dimensions should be the same."];
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__PPSSQLiteHistogramIngester__convertSQLiteDataFromQuery_withDimensions_outError___block_invoke;
    v16[3] = &unk_265443528;
    uint64_t v20 = v11;
    id v13 = v10;
    id v17 = v13;
    id v18 = v8;
    v19 = &v21;
    [v7 enumerateProperties:v9 error:a5 enumerationHandler:v16];
    id v14 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

uint64_t __82__PPSSQLiteHistogramIngester__convertSQLiteDataFromQuery_withDimensions_outError___block_invoke(uint64_t a1, void *a2, PPSSQLiteRow *a3)
{
  id v5 = a2;
  v6 = (void *)MEMORY[0x25A2D4DD0]();
  id v7 = objc_opt_new();
  if (*(void *)(a1 + 56))
  {
    unint64_t v8 = 0;
    do
    {
      objc_super v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v8];
      v10 = PPSSQLiteColumnValueWithNameAsNumber(a3, v9);

      if (v10) {
        [v7 addObject:v10];
      }

      ++v8;
    }
    while (v8 < *(void *)(a1 + 56));
  }
  uint64_t v11 = [v7 count];
  if (v11 == [*(id *)(a1 + 40) count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) recordSample:v7];
  }

  return 1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
}

- (void)parseDataForRequest:(NSObject *)a3 outError:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4 = [a1 selectSQLWithProperties:a2];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_258F16000, a3, OS_LOG_TYPE_DEBUG, "Query before value-binding: %@", (uint8_t *)&v5, 0xCu);
}

@end