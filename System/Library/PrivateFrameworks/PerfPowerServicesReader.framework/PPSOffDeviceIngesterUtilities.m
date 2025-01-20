@interface PPSOffDeviceIngesterUtilities
+ (id)allDataSourcesForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5;
+ (id)dataSourceForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5;
+ (id)metricDefinitionForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 metricName:(id)a6;
+ (id)metricDefinitionHistoriesForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5;
+ (id)metricDefinitionHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 metricName:(id)a6;
+ (id)metricDefinitionsForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 metricNames:(id)a6;
@end

@implementation PPSOffDeviceIngesterUtilities

+ (id)dataSourceForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x25A2D4DD0]();
  v11 = [(id)objc_opt_class() metricDefinitionHistoriesForFilepath:v7 subsystem:v8 category:v9];
  v12 = [v11 objectEnumerator];
  v13 = [v12 nextObject];
  v14 = [v13 lastObject];

  v15 = +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:v14];
  if (!v15)
  {
    v15 = [NSString stringWithFormat:@"%@_%@", v8, v9];
  }

  return v15;
}

+ (id)allDataSourcesForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = (void *)MEMORY[0x25A2D4DD0]();
  v12 = [(id)objc_opt_class() metricDefinitionHistoriesForFilepath:v7 subsystem:v8 category:v9];
  v13 = [v12 objectEnumerator];
  v14 = [v13 nextObject];
  v15 = [v14 lastObject];

  uint64_t v16 = +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:v15];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = +[PPSDataIngesterCommonUtilities allTableNamesForMetadataHistory:v12 withEntryKey:v16];
    if (v18) {
      [v10 addObjectsFromArray:v18];
    }
  }
  else
  {
    v17 = [NSString stringWithFormat:@"%@_%@", v8, v9];
  }
  [v10 addObject:v17];
  v19 = [v10 sortedArrayUsingComparator:&__block_literal_global_1];

  return v19;
}

uint64_t __78__PPSOffDeviceIngesterUtilities_allDataSourcesForFilepath_subsystem_category___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)metricDefinitionForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 metricName:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(id)objc_opt_class() metricDefinitionHistoryForFilepath:v12 subsystem:v11 category:v10 metricName:v9];

  v14 = [v13 lastObject];

  return v14;
}

+ (id)metricDefinitionsForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 metricNames:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v26 = a4;
  id v9 = a5;
  id v10 = a6;
  v23 = [MEMORY[0x263EFF9A0] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x25A2D4DD0]();
        if (([v16 isEqualToString:@"timestamp"] & 1) == 0)
        {
          v18 = [a1 metricDefinitionForFilepath:v25 subsystem:v26 category:v9 metricName:v16];
          v19 = PPSReaderLog();
          v20 = v19;
          if (v18)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v32 = v26;
              __int16 v33 = 2112;
              id v34 = v9;
              __int16 v35 = 2112;
              v36 = v16;
              _os_log_debug_impl(&dword_258F16000, v20, OS_LOG_TYPE_DEBUG, "Found metric definition for '%@::%@::%@'", buf, 0x20u);
            }

            [v23 setObject:v18 forKeyedSubscript:v16];
          }
          else
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v32 = v26;
              __int16 v33 = 2112;
              id v34 = v9;
              __int16 v35 = 2112;
              v36 = v16;
              _os_log_error_impl(&dword_258F16000, v20, OS_LOG_TYPE_ERROR, "No metric definition found for '%@::%@::%@'", buf, 0x20u);
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v13);
  }

  v21 = (void *)[v23 copy];
  return v21;
}

+ (id)metricDefinitionHistoriesForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  return (id)[MEMORY[0x263F5D3B0] getMetadataHistoryForFilepath:a3 subsystem:a4 category:a5];
}

+ (id)metricDefinitionHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 metricName:(id)a6
{
  return (id)[MEMORY[0x263F5D3B0] getMetadataHistoryForFilepath:a3 subsystem:a4 category:a5 name:a6];
}

@end