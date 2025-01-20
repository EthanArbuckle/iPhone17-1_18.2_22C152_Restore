@interface PPSVersioningUtilities
+ (id)_groupMetricsByBuild:(id)a3 withFilepath:(id)a4;
+ (id)buildEventsWithFilepath:(id)a3;
+ (id)timelineWithFilepath:(id)a3 andMetrics:(id)a4;
@end

@implementation PPSVersioningUtilities

+ (id)buildEventsWithFilepath:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke;
  block[3] = &unk_265443378;
  id v9 = v3;
  uint64_t v4 = buildEventsWithFilepath__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&buildEventsWithFilepath__onceToken, block);
  }
  id v6 = (id)buildEventsWithFilepath__result;

  return v6;
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke(uint64_t a1)
{
  v2 = PPSReaderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_5();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = @"Build";
    uint64_t v5 = +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:*(void *)(a1 + 32) subsystem:@"ConfigMetrics" category:@"DeviceConfig" metricName:@"Build"];
    if (v5)
    {
LABEL_11:
      v8 = (void *)v5;
      id v9 = *(id *)(a1 + 32);
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v4 = @"Build";
    uint64_t v6 = +[PPSOnDeviceIngesterUtilities metricDefinitionForSubsystem:@"ConfigMetrics" category:@"DeviceConfig" metricName:@"Build"];
    if (v6) {
      goto LABEL_13;
    }
  }
  v7 = PPSReaderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_4();
  }

  if (v3)
  {
    uint64_t v4 = @"build";
    uint64_t v5 = +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:*(void *)(a1 + 32) subsystem:@"PPTStorageOperator" category:@"Config" metricName:@"build"];
    goto LABEL_11;
  }
  uint64_t v4 = @"build";
  uint64_t v6 = +[PPSOnDeviceIngesterUtilities metricDefinitionForSubsystem:@"PPTStorageOperator" category:@"Config" metricName:@"build"];
LABEL_13:
  v8 = (void *)v6;
  id v9 = +[PPSOnDeviceIngesterUtilities filepathForMetricDefinition:v6];
LABEL_14:
  v10 = v9;
  v11 = +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:v8];
  if (v8)
  {
LABEL_20:
    v16 = +[PPSDataIngesterRegistry dataIngesterForFilepath:v10 requestType:0];
    v17 = [MEMORY[0x263EFFA08] setWithObject:v4];
    v18 = [[PPSTimeSeriesRequest alloc] initWithMetrics:v17 predicate:0 timeFilter:0 limitCount:0 offsetCount:0 readDirection:1];
    id v24 = 0;
    uint64_t v19 = [v16 parseDataForRequest:v18 outError:&v24];
    id v20 = v24;
    v21 = (void *)buildEventsWithFilepath__result;
    buildEventsWithFilepath__result = v19;

    v22 = PPSReaderLog();
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_3();
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_2(v23);
    }

    goto LABEL_26;
  }
  int64_t v12 = +[PPSDataIngesterCommonUtilities fileTypeForFilepath:v10];
  if (v12 == 2)
  {
    v13 = @"PPTStorageOperator";
    v14 = @"Config_1095_1";
    goto LABEL_19;
  }
  if (v12 == 1)
  {
    v13 = @"PLConfigAgent";
    v14 = @"EventNone_Config";
LABEL_19:
    uint64_t v15 = +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:v10 subsystem:v13 category:v14];

    v11 = (void *)v15;
    goto LABEL_20;
  }
  v16 = PPSReaderLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_1();
  }
LABEL_26:
}

+ (id)timelineWithFilepath:(id)a3 andMetrics:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (a1)
  {
    id v30 = v7;
    v33 = +[PPSVersioningUtilities _groupMetricsByBuild:v7 withFilepath:v6];
    v8 = [v33 allKeys];
    id v9 = [v8 sortedArrayUsingSelector:sel_compare_];

    id v31 = v6;
    v10 = +[PPSTimestampConverterRegistry converterForFilepath:v6];
    v11 = NSNumber;
    int64_t v12 = [MEMORY[0x263EFF910] date];
    [v12 timeIntervalSince1970];
    v28 = v10;
    objc_msgSend(v10, "monotonicTimeFromEpochTime:");
    objc_msgSend(v11, "numberWithDouble:");
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v29 = v9;
    id obj = [v9 reverseObjectEnumerator];
    uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        uint64_t v17 = 0;
        v18 = v13;
        do
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
          id v20 = [v33 objectForKeyedSubscript:v19];
          id v21 = objc_alloc(MEMORY[0x263F08798]);
          v22 = (void *)MEMORY[0x263EFF910];
          [v19 doubleValue];
          v23 = objc_msgSend(v22, "dateWithTimeIntervalSince1970:");
          id v24 = (void *)MEMORY[0x263EFF910];
          [v18 doubleValue];
          v25 = objc_msgSend(v24, "dateWithTimeIntervalSince1970:");
          v26 = (void *)[v21 initWithStartDate:v23 endDate:v25];

          [v34 setObject:v20 forKeyedSubscript:v26];
          id v13 = v19;

          ++v17;
          v18 = v13;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v15);
    }

    id v7 = v30;
    id v6 = v31;
  }

  return v34;
}

+ (id)_groupMetricsByBuild:(id)a3 withFilepath:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v53 = [MEMORY[0x263EFF9A0] dictionary];
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v60;
    id v52 = v6;
    uint64_t v47 = *(void *)v60;
    do
    {
      uint64_t v11 = 0;
      uint64_t v48 = v9;
      do
      {
        if (*(void *)v60 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = v11;
        int64_t v12 = *(void **)(*((void *)&v59 + 1) + 8 * v11);
        id v13 = [v12 subsystem];
        uint64_t v14 = [v12 category];
        uint64_t v15 = [v12 name];
        if (v6) {
          +[PPSOffDeviceIngesterUtilities metricDefinitionHistoryForFilepath:v6 subsystem:v13 category:v14 metricName:v15];
        }
        else {
        uint64_t v16 = +[PPSOnDeviceIngesterUtilities metricDefinitionHistoryForSubsystem:v13 category:v14 metricName:v15];
        }

        if (v16)
        {
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          v54 = v16;
          uint64_t v17 = [v54 countByEnumeratingWithState:&v55 objects:v65 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            v50 = v16;
            uint64_t v19 = *(void *)v56;
            id v20 = v53;
            while (1)
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v56 != v19) {
                  objc_enumerationMutation(v54);
                }
                v22 = *(void **)(*((void *)&v55 + 1) + 8 * v21);
                v23 = [v22 build];
                id v24 = [v7 objectForKeyedSubscript:v23];

                if (v24) {
                  goto LABEL_20;
                }
                v25 = (void *)MEMORY[0x263F08A98];
                v26 = [v22 build];
                v27 = [v22 build];
                v28 = [v25 predicateWithFormat:@"(build == %@ OR Build == %@)", v26, v27];

                v29 = +[PPSVersioningUtilities buildEventsWithFilepath:v52];
                id v30 = [v29 filteredTimeSeriesUsingPredicate:v28];

                id v31 = NSNumber;
                v32 = [v30 firstObject];
                [v32 monotonicTimestamp];
                v33 = objc_msgSend(v31, "numberWithDouble:");

                id v34 = PPSReaderLog();
                BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);
                if (v33)
                {
                  if (v35)
                  {
                    uint64_t v40 = [v22 build];
                    *(_DWORD *)buf = 138412546;
                    v67 = v40;
                    __int16 v68 = 2112;
                    v69 = v33;
                    _os_log_debug_impl(&dword_258F16000, v34, OS_LOG_TYPE_DEBUG, "Found build timestamp for build '%@': '%@'", buf, 0x16u);
                  }
                  long long v36 = [v22 build];
                  [v7 setObject:v33 forKey:v36];

                  id v20 = v53;
LABEL_20:
                  long long v37 = [v22 build];
                  v28 = [v7 objectForKeyedSubscript:v37];

                  long long v38 = [v20 objectForKeyedSubscript:v28];

                  if (!v38)
                  {
                    v39 = objc_opt_new();
                    [v20 setObject:v39 forKeyedSubscript:v28];
                  }
                  id v30 = [v20 objectForKeyedSubscript:v28];
                  v33 = [v22 name];
                  [v30 setObject:v22 forKeyedSubscript:v33];
                  goto LABEL_23;
                }
                if (v35) {
                  +[PPSVersioningUtilities _groupMetricsByBuild:&v64 withFilepath:v34];
                }

                id v20 = v53;
LABEL_23:

                ++v21;
              }
              while (v18 != v21);
              uint64_t v41 = [v54 countByEnumeratingWithState:&v55 objects:v65 count:16];
              uint64_t v18 = v41;
              if (!v41)
              {
                id v6 = v52;
                uint64_t v10 = v47;
                uint64_t v9 = v48;
                uint64_t v16 = v50;
                uint64_t v42 = v51;
                goto LABEL_33;
              }
            }
          }
          uint64_t v42 = v51;
        }
        else
        {
          v54 = PPSReaderLog();
          uint64_t v42 = v51;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            v43 = [v12 subsystem];
            v44 = [v12 category];
            *(_DWORD *)buf = 138412546;
            v67 = v43;
            __int16 v68 = 2112;
            v69 = v44;
            _os_log_error_impl(&dword_258F16000, v54, OS_LOG_TYPE_ERROR, "No metric history found for '%@::%@'", buf, 0x16u);
          }
        }
LABEL_33:

        uint64_t v11 = v42 + 1;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v9);
  }

  v45 = (void *)[v53 copy];
  return v45;
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_258F16000, v0, OS_LOG_TYPE_ERROR, "Unknown reader file type while attempting to read build events", v1, 2u);
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = buildEventsWithFilepath__result;
  _os_log_debug_impl(&dword_258F16000, log, OS_LOG_TYPE_DEBUG, "Successfully read build events = %@", (uint8_t *)&v1, 0xCu);
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_258F16000, v0, OS_LOG_TYPE_ERROR, "Failed to read build events!", v1, 2u);
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_258F16000, v0, OS_LOG_TYPE_DEBUG, "Falling back to PPTStorageOperator for reading build events...", v1, 2u);
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_258F16000, v0, OS_LOG_TYPE_DEBUG, "Caching build events...", v1, 2u);
}

+ (void)_groupMetricsByBuild:(void *)a3 withFilepath:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 build];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_258F16000, a4, OS_LOG_TYPE_DEBUG, "Failed to find timestamp for build '%@', skipping...", a1, 0xCu);
}

@end