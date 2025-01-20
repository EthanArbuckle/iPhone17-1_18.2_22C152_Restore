@interface PPSMetadataStore
+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5;
+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6;
+ (id)plistMetricsFromDir:(id)a3;
+ (id)plistMetricsFromDir:(id)a3 forSubsystem:(id)a4;
+ (id)sharedStore;
- (NSMutableDictionary)metricsByID;
- (PPSMetadataStore)init;
- (id)getAllFrameworkSubsystem;
- (id)getAllSubsystem;
- (id)getMetadataForSubsystem:(id)a3;
- (id)getMetadataForSubsystem:(id)a3 category:(id)a4;
- (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5;
- (void)addMetricsToCache:(id)a3;
- (void)buildDeviceMetadata;
- (void)cacheFrameworkMetrics;
- (void)cacheFrameworkMetricsForSubsystem:(id)a3;
- (void)cachePlistMetrics;
- (void)cachePlistMetricsForSubsystem:(id)a3;
- (void)loadMetricsForSubsystem:(id)a3;
- (void)setMetricsByID:(id)a3;
@end

@implementation PPSMetadataStore

- (id)getMetadataForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_sync_enter(@"++metricsByIDSync++");
  v8 = [(PPSMetadataStore *)self metricsByID];
  v9 = [v8 objectForKeyedSubscript:v6];
  if (v9)
  {
    v10 = [(PPSMetadataStore *)self metricsByID];
    v11 = [v10 objectForKeyedSubscript:v6];
    v12 = [v11 objectForKeyedSubscript:v7];

    if (v12)
    {
LABEL_7:
      v18 = [(PPSMetadataStore *)self metricsByID];
      v19 = [v18 objectForKeyedSubscript:v6];
      v20 = [v19 objectForKeyedSubscript:v7];

      goto LABEL_9;
    }
  }
  else
  {
  }
  [(PPSMetadataStore *)self loadMetricsForSubsystem:v6];
  v13 = [(PPSMetadataStore *)self metricsByID];
  v14 = [v13 objectForKeyedSubscript:v6];

  if (v14)
  {
    v15 = [(PPSMetadataStore *)self metricsByID];
    v16 = [v15 objectForKeyedSubscript:v6];
    v17 = [v16 objectForKeyedSubscript:v7];

    if (v17) {
      goto LABEL_7;
    }
  }
  v20 = 0;
LABEL_9:
  objc_sync_exit(@"++metricsByIDSync++");

  return v20;
}

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedStore__sharedStore;
  return v2;
}

- (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_sync_enter(@"++metricsByIDSync++");
  v11 = [(PPSMetadataStore *)self metricsByID];
  v12 = [v11 objectForKeyedSubscript:v8];
  if (v12)
  {
    v13 = [(PPSMetadataStore *)self metricsByID];
    v14 = [v13 objectForKeyedSubscript:v8];
    v15 = [v14 objectForKeyedSubscript:v9];

    if (v15)
    {
LABEL_7:
      v21 = [(PPSMetadataStore *)self metricsByID];
      v22 = [v21 objectForKeyedSubscript:v8];
      v23 = [v22 objectForKeyedSubscript:v9];
      v24 = [v23 objectForKeyedSubscript:v10];

      goto LABEL_9;
    }
  }
  else
  {
  }
  [(PPSMetadataStore *)self loadMetricsForSubsystem:v8];
  v16 = [(PPSMetadataStore *)self metricsByID];
  v17 = [v16 objectForKeyedSubscript:v8];

  if (v17)
  {
    v18 = [(PPSMetadataStore *)self metricsByID];
    v19 = [v18 objectForKeyedSubscript:v8];
    v20 = [v19 objectForKeyedSubscript:v9];

    if (v20) {
      goto LABEL_7;
    }
  }
  v24 = 0;
LABEL_9:
  objc_sync_exit(@"++metricsByIDSync++");

  return v24;
}

- (NSMutableDictionary)metricsByID
{
  return self->_metricsByID;
}

uint64_t __31__PPSMetadataStore_sharedStore__block_invoke()
{
  sharedStore__sharedStore = objc_alloc_init(PPSMetadataStore);
  return MEMORY[0x270F9A758]();
}

- (PPSMetadataStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)PPSMetadataStore;
  v2 = [(PPSMetadataStore *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(PPSMetadataStore *)v2 setMetricsByID:v3];
  }
  return v2;
}

- (void)buildDeviceMetadata
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__PPSMetadataStore_buildDeviceMetadata__block_invoke;
  block[3] = &unk_265440CB0;
  block[4] = self;
  if (buildDeviceMetadata_onceToken != -1) {
    dispatch_once(&buildDeviceMetadata_onceToken, block);
  }
}

uint64_t __39__PPSMetadataStore_buildDeviceMetadata__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cacheFrameworkMetrics];
  v2 = *(void **)(a1 + 32);
  return [v2 cachePlistMetrics];
}

- (id)getAllSubsystem
{
  v2 = [(PPSMetadataStore *)self metricsByID];
  v3 = [v2 allKeys];

  return v3;
}

- (id)getAllFrameworkSubsystem
{
  return +[PPSMetricManager allDeclSubsystem];
}

- (id)getMetadataForSubsystem:(id)a3
{
  id v4 = a3;
  objc_sync_enter(@"++metricsByIDSync++");
  objc_super v5 = [(PPSMetadataStore *)self metricsByID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6
    || ([(PPSMetadataStore *)self loadMetricsForSubsystem:v4],
        [(PPSMetadataStore *)self metricsByID],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v4],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = [(PPSMetadataStore *)self metricsByID];
    id v10 = [v9 objectForKeyedSubscript:v4];
  }
  else
  {
    id v10 = 0;
  }
  objc_sync_exit(@"++metricsByIDSync++");

  return v10;
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v32 = a5;
  v33 = v10;
  id v31 = a6;
  v11 = +[PPSSQLMetadataStore queryMetadataHistoryForFilepath:subsystem:category:name:](PPSSQLMetadataStore, "queryMetadataHistoryForFilepath:subsystem:category:name:", v9, v10, v32);
  v12 = v11;
  if (v11)
  {
    id v30 = v9;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v29 = v12;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x25A2D40E0]();
          v20 = [v18 allKeys];
          v21 = [v20 firstObject];

          if (v21
            && ([v18 objectForKeyedSubscript:v21],
                v22 = objc_claimAutoreleasedReturnValue(),
                v22,
                v22))
          {
            v23 = [PPSPBMetric alloc];
            v24 = [v18 objectForKeyedSubscript:v21];
            v25 = [(PPSPBMetric *)v23 initWithData:v24];

            v26 = +[PPSMetric metricWithProto:v25 withBuild:v21];
            if (v26)
            {
              [v34 addObject:v26];
            }
            else
            {
              v27 = PPSStoreLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413058;
                v40 = v33;
                __int16 v41 = 2112;
                id v42 = v32;
                __int16 v43 = 2112;
                id v44 = v31;
                __int16 v45 = 2112;
                v46 = v21;
                _os_log_error_impl(&dword_258ED8000, v27, OS_LOG_TYPE_ERROR, "Failed to decode metric: %@_%@_%@ for build: %@", buf, 0x2Au);
              }
            }
          }
          else
          {
            v25 = PPSStoreLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138413058;
              v40 = v33;
              __int16 v41 = 2112;
              id v42 = v32;
              __int16 v43 = 2112;
              id v44 = v31;
              __int16 v45 = 2112;
              v46 = v21;
              _os_log_error_impl(&dword_258ED8000, v25, OS_LOG_TYPE_ERROR, "Failed to decode metric: %@_%@_%@ for build: %@", buf, 0x2Au);
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v15);
    }

    v12 = v29;
    id v9 = v30;
  }
  else
  {
    id v34 = 0;
  }

  return v34;
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v38 = a5;
  v39 = v8;
  id v9 = +[PPSSQLMetadataStore queryMetadataHistoryForFilepath:subsystem:category:](PPSSQLMetadataStore, "queryMetadataHistoryForFilepath:subsystem:category:", v7, v8);
  id v10 = v9;
  if (v9)
  {
    id v31 = v7;
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v30 = v10;
    id obj = v10;
    uint64_t v34 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v46;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v11;
          uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * v11);
          context = (void *)MEMORY[0x25A2D40E0]();
          uint64_t v40 = v12;
          id v13 = [obj objectForKeyedSubscript:v12];
          uint64_t v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v15 = v13;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v57 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v42 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                v21 = objc_msgSend(v20, "allKeys", v30);
                v22 = [v21 firstObject];

                if (v22
                  && ([v20 objectForKeyedSubscript:v22],
                      v23 = objc_claimAutoreleasedReturnValue(),
                      v23,
                      v23))
                {
                  v24 = [PPSPBMetric alloc];
                  v25 = [v20 objectForKeyedSubscript:v22];
                  v26 = [(PPSPBMetric *)v24 initWithData:v25];

                  v27 = +[PPSMetric metricWithProto:v26 withBuild:v22];
                  if (v27)
                  {
                    [v14 addObject:v27];
                  }
                  else
                  {
                    v28 = PPSStoreLog();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138413058;
                      v50 = v39;
                      __int16 v51 = 2112;
                      id v52 = v38;
                      __int16 v53 = 2112;
                      uint64_t v54 = v40;
                      __int16 v55 = 2112;
                      v56 = v22;
                      _os_log_error_impl(&dword_258ED8000, v28, OS_LOG_TYPE_ERROR, "Failed to decode metric: %@_%@_%@ for build: %@", buf, 0x2Au);
                    }
                  }
                }
                else
                {
                  v26 = PPSStoreLog();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138413058;
                    v50 = v39;
                    __int16 v51 = 2112;
                    id v52 = v38;
                    __int16 v53 = 2112;
                    uint64_t v54 = v40;
                    __int16 v55 = 2112;
                    v56 = v22;
                    _os_log_error_impl(&dword_258ED8000, v26, OS_LOG_TYPE_ERROR, "Failed to decode metric: %@_%@_%@ for build: %@", buf, 0x2Au);
                  }
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v57 count:16];
            }
            while (v17);
          }

          [v33 setObject:v14 forKeyedSubscript:v40];
          uint64_t v11 = v37 + 1;
        }
        while (v37 + 1 != v34);
        uint64_t v34 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v34);
    }

    id v10 = v30;
    id v7 = v31;
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

- (void)cacheFrameworkMetrics
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PPSMetadataStore_cacheFrameworkMetrics__block_invoke;
  block[3] = &unk_265440CB0;
  block[4] = self;
  if (cacheFrameworkMetrics_onceToken != -1) {
    dispatch_once(&cacheFrameworkMetrics_onceToken, block);
  }
}

void __41__PPSMetadataStore_cacheFrameworkMetrics__block_invoke(uint64_t a1)
{
  v2 = PPSStoreLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_258ED8000, v2, OS_LOG_TYPE_INFO, "Constructing all framework metrics", v4, 2u);
  }

  v3 = +[PPSMetricManager allDeclMetrics];
  [*(id *)(a1 + 32) addMetricsToCache:v3];
}

- (void)cachePlistMetrics
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__PPSMetadataStore_cachePlistMetrics__block_invoke;
  block[3] = &unk_265440CB0;
  block[4] = self;
  if (cachePlistMetrics_onceToken != -1) {
    dispatch_once(&cachePlistMetrics_onceToken, block);
  }
}

void __37__PPSMetadataStore_cachePlistMetrics__block_invoke(uint64_t a1)
{
  v2 = PPSStoreLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_258ED8000, v2, OS_LOG_TYPE_INFO, "Constructing all client plist metrics", v4, 2u);
  }

  v3 = +[PPSMetadataStore plistMetricsFromDir:@"/System/Library/PerfPowerTelemetry/MetadataReports/"];
  [*(id *)(a1 + 32) addMetricsToCache:v3];
}

- (void)cacheFrameworkMetricsForSubsystem:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = PPSStoreLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_258ED8000, v5, OS_LOG_TYPE_INFO, "Constructing all framework metrics for subsystem: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[PPSMetricManager allDeclMetricsForSubsystem:v4];
  [(PPSMetadataStore *)self addMetricsToCache:v6];
}

- (void)cachePlistMetricsForSubsystem:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = PPSStoreLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_258ED8000, v5, OS_LOG_TYPE_INFO, "Constructing all client plist metrics for subsystem: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[PPSMetadataStore plistMetricsFromDir:@"/System/Library/PerfPowerTelemetry/MetadataReports/" forSubsystem:v4];
  [(PPSMetadataStore *)self addMetricsToCache:v6];
}

+ (id)plistMetricsFromDir:(id)a3
{
  return +[PPSMetadataStore plistMetricsFromDir:a3 forSubsystem:0];
}

+ (id)plistMetricsFromDir:(id)a3 forSubsystem:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v23 = a4;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  char v28 = 0;
  if ([v6 fileExistsAtPath:v5 isDirectory:&v28]) {
    BOOL v7 = v28 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
    v21 = v6;
    uint64_t v9 = [v6 contentsOfDirectoryAtPath:v5 error:0];
    id v10 = PPSStoreLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[PPSMetadataStore plistMetricsFromDir:forSubsystem:]((uint64_t)v9, v10);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v9;
    uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(obj);
          }
          [v5 stringByAppendingString:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          v17 = id v16 = v5;
          uint64_t v18 = [NSURL fileURLWithPath:v17 isDirectory:0];
          v19 = +[PPSMetric metricsWithPlist:v18 subsystem:v23];
          [v8 addObjectsFromArray:v19];

          id v5 = v16;
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v13);
    }

    id v6 = v21;
  }

  return v8;
}

- (void)addMetricsToCache:(id)a3
{
  id v4 = a3;
  objc_sync_enter(@"++metricsByIDSync++");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__PPSMetadataStore_addMetricsToCache___block_invoke;
  v5[3] = &unk_265440C38;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  objc_sync_exit(@"++metricsByIDSync++");
}

void __38__PPSMetadataStore_addMetricsToCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 subsystem];
  id v5 = [v3 category];
  id v6 = [*(id *)(a1 + 32) metricsByID];
  BOOL v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v9 = [*(id *)(a1 + 32) metricsByID];
    [v9 setObject:v8 forKeyedSubscript:v4];
  }
  id v10 = [*(id *)(a1 + 32) metricsByID];
  uint64_t v11 = [v10 objectForKeyedSubscript:v4];
  uint64_t v12 = [v11 objectForKey:v5];

  if (!v12)
  {
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v14 = [*(id *)(a1 + 32) metricsByID];
    id v15 = [v14 objectForKeyedSubscript:v4];
    [v15 setObject:v13 forKeyedSubscript:v5];
  }
  id v16 = [*(id *)(a1 + 32) metricsByID];
  uint64_t v17 = [v16 objectForKeyedSubscript:v4];
  uint64_t v18 = [v17 objectForKeyedSubscript:v5];
  v19 = [v3 name];
  v20 = [v18 objectForKey:v19];

  if (!v20)
  {
    v21 = [*(id *)(a1 + 32) metricsByID];
    v22 = [v21 objectForKeyedSubscript:v4];
    id v23 = [v22 objectForKeyedSubscript:v5];
    long long v24 = [v3 name];
    [v23 setObject:v3 forKeyedSubscript:v24];

    goto LABEL_9;
  }
  v21 = PPSStoreLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = [v3 name];
    int v25 = 138412802;
    long long v26 = v4;
    __int16 v27 = 2112;
    char v28 = v5;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    _os_log_error_impl(&dword_258ED8000, v21, OS_LOG_TYPE_ERROR, "Duplicate metric found with subsystem:%@, category:%@, name:%@", (uint8_t *)&v25, 0x20u);
LABEL_9:
  }
}

- (void)loadMetricsForSubsystem:(id)a3
{
  id v4 = a3;
  [(PPSMetadataStore *)self cacheFrameworkMetricsForSubsystem:v4];
  [(PPSMetadataStore *)self cachePlistMetricsForSubsystem:v4];
}

- (void)setMetricsByID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)plistMetricsFromDir:(uint64_t)a1 forSubsystem:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_258ED8000, a2, OS_LOG_TYPE_DEBUG, "Found following metadata reports: %@", (uint8_t *)&v2, 0xCu);
}

@end