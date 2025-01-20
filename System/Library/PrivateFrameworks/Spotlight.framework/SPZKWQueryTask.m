@interface SPZKWQueryTask
+ (int)maxSuggestedApps;
+ (void)initialize;
- (id)unsafeSections;
- (id)unsafeSessionEntityString;
- (void)addApplicationResultsFromPredictionResponse:(id)a3 toSection:(id)a4 queryIdent:(unint64_t)a5;
- (void)start;
@end

@implementation SPZKWQueryTask

void __34__SPZKWQueryTask_maxSuggestedApps__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];
  if (v0) {
    CFRelease(v0);
  }
  if (v1 == 3) {
    int v2 = 12;
  }
  else {
    int v2 = 8;
  }
  maxSuggestedApps_maxSuggestedApps = v2;
}

+ (void)initialize
{
  uint64_t v2 = [MEMORY[0x263F25010] clientForConsumerType:1];
  v3 = (void *)atxClient;
  atxClient = v2;

  v4 = (void *)MEMORY[0x263F78E30];

  [v4 preheat];
}

- (void)start
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __23__SPZKWQueryTask_start__block_invoke;
  v8[3] = &unk_264C772A0;
  v8[4] = self;
  v3 = (void *)MEMORY[0x237DF3D40](v8, a2);
  kdebug_trace();
  v4 = SPLogForSPLogCategoryTelemetry();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "zkwLatency", " enableTelemetry=YES ", buf, 2u);
  }

  [(SPQueryTask *)self queryIdForFeedback];
  v5 = (void (*)(void))v3[2];
  v6 = v3;
  v5();
}

void __23__SPZKWQueryTask_start__block_invoke_104(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = [*(id *)(a1 + 32) mutableSections];
  v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  v19 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v24 + 1) + 8 * v6);
        v8 = objc_opt_new();
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v9 = [v7 results];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v21;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v9);
              }
              v13 = (void *)[objc_alloc(MEMORY[0x263F679D8]) initWithResult:*(void *)(*((void *)&v20 + 1) + 8 * v12) hiddenResults:0 duplicateResults:0 localResultPosition:0];
              [v8 addObject:v13];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v10);
        }

        v14 = (void *)[objc_alloc(MEMORY[0x263F67A40]) initWithResults:v8 section:v7 localSectionPosition:0 personalizationScore:0.0];
        [v19 addObject:v14];

        ++v6;
      }
      while (v6 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  v15 = (void *)[objc_alloc(MEMORY[0x263F679B8]) initWithSections:v19 blendingDuration:0.0];
  v16 = [MEMORY[0x263F674A0] sharedManager];
  [v16 didRankSections:v15];
}

uint64_t __83__SPZKWQueryTask_addApplicationResultsFromPredictionResponse_toSection_queryIdent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = a2;
  [v7 setQueryId:v6];
  [v7 setSectionBundleIdentifier:*MEMORY[0x263F67530]];
  [*(id *)(a1 + 32) addResults:v7];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  LODWORD(v6) = *(_DWORD *)(v8 + 24) + 1;
  *(_DWORD *)(v8 + 24) = v6;
  uint64_t result = [(id)objc_opt_class() maxSuggestedApps];
  if ((int)v6 >= (int)result) {
    *a4 = 1;
  }
  return result;
}

+ (int)maxSuggestedApps
{
  if (maxSuggestedApps_onceToken != -1) {
    dispatch_once(&maxSuggestedApps_onceToken, &__block_literal_global_9);
  }
  return maxSuggestedApps_maxSuggestedApps;
}

- (id)unsafeSessionEntityString
{
  return 0;
}

void __23__SPZKWQueryTask_start__block_invoke(uint64_t a1, dispatch_qos_class_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  queue = [v4 queryProcessor];
  dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, a2, 0, v5);

  dispatch_async(queue, v6);
}

- (void)addApplicationResultsFromPredictionResponse:(id)a3 toSection:(id)a4 queryIdent:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__SPZKWQueryTask_addApplicationResultsFromPredictionResponse_toSection_queryIdent___block_invoke;
  v11[3] = &unk_264C77278;
  unint64_t v15 = a5;
  id v10 = v9;
  v13 = self;
  v14 = v16;
  id v12 = v10;
  [v8 enumerateAtxSearchResults:v11];

  _Block_object_dispose(v16, 8);
}

void __23__SPZKWQueryTask_start__block_invoke_89(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  __uint64_t v2 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v3 = (void *)[objc_alloc(MEMORY[0x263F67A58]) initWithInput:&stru_26E92AFF0 triggerEvent:9 searchType:1 indexType:3 queryId:*(void *)(a1 + 48)];
  v4 = [MEMORY[0x263F674A0] sharedManager];
  [v4 didStartSearch:v3];

  id v5 = [*(id *)(a1 + 32) query];
  dispatch_block_t v6 = [v5 queryContext];
  uint64_t v7 = [v6 deviceAuthenticationState];

  if (v7 == 2)
  {
    id v8 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, v8, OS_LOG_TYPE_DEFAULT, "Skipping app predictions because in biometry lockout", buf, 2u);
    }

    id v9 = 0;
    id v10 = 0;
  }
  else
  {
    id v10 = objc_msgSend((id)atxClient, "appPredictionsForConsumerSubType:limit:", 9, objc_msgSend((id)objc_opt_class(), "maxSuggestedApps"));
    uint64_t v11 = [v10 error];

    if (v11)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [v10 predictedApps];
    }
  }
  uint64_t v12 = [objc_alloc(MEMORY[0x263F67888]) initWithStartSearch:v3];
  v13 = [MEMORY[0x263F674A0] sharedManager];
  v51 = (void *)v12;
  [v13 didEndSearch:v12];

  sp_analytics_log_timing((uint64_t)"com.apple.searchd.query.ZKW", "finish", v2);
  v14 = [*(id *)(a1 + 32) delegate];
  id v15 = objc_alloc_init(MEMORY[0x263F78D70]);
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v17 = [v16 localizedStringForKey:@"DOMAIN_ZKWS" value:&stru_26E92AFF0 table:0];
  [v15 setTitle:v17];

  [v15 setBundleIdentifier:*MEMORY[0x263F67530]];
  if (v7 == 2
    || ([v10 error], uint64_t v18 = objc_claimAutoreleasedReturnValue(), v18, !v18))
  {
    v19 = [v10 uuid];
    long long v20 = [v19 UUIDString];
    [v15 setResultSetIdentifier:v20];

    [*(id *)(a1 + 32) addApplicationResultsFromPredictionResponse:v10 toSection:v15 queryIdent:*(void *)(a1 + 48)];
    uint64_t v21 = [v9 count];
    ++_MergedGlobals;
    if (!v21)
    {
      ++dword_26AC2EA2C;
      long long v22 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __23__SPZKWQueryTask_start__block_invoke_89_cold_1(v22);
      }
    }
  }
  v52 = v9;
  long long v23 = objc_opt_new();
  [*(id *)(a1 + 32) setMutableSections:v23];

  long long v24 = [v15 results];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    long long v26 = [*(id *)(a1 + 32) mutableSections];
    [v26 addObject:v15];

    long long v27 = *(void **)(a1 + 32);
    v28 = [v27 mutableSections];
    [v27 updateResultsThroughDelegate:0 state:2 sections:v28];
  }
  v29 = [*(id *)(a1 + 32) query];
  uint64_t v30 = [v29 queryContext];
  uint64_t v31 = [v30 deviceAuthenticationState];

  dispatch_group_t v32 = dispatch_group_create();
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __23__SPZKWQueryTask_start__block_invoke_104;
  v60[3] = &unk_264C76B08;
  v60[4] = *(void *)(a1 + 32);
  v33 = (void *)MEMORY[0x237DF3D40](v60);
  v34 = [v15 results];
  uint64_t v35 = [v34 count];

  v36 = SPLogForSPLogCategoryDefault();
  BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if (v35)
  {
    if (!v37) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v38 = "zkw has apps";
  }
  else
  {
    if (!v37) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v38 = "zkw has no apps";
  }
  _os_log_impl(&dword_235D0B000, v36, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
LABEL_22:

  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __23__SPZKWQueryTask_start__block_invoke_108;
  v57[3] = &unk_264C772C8;
  v57[4] = *(void *)(a1 + 32);
  v39 = v32;
  v58 = v39;
  id v40 = v33;
  id v59 = v40;
  v41 = (void *)MEMORY[0x237DF3D40](v57);
  if (v31)
  {
    v42 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [*(id *)(a1 + 32) mutableSections];
      uint64_t v44 = [v43 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v62 = v44;
      _os_log_impl(&dword_235D0B000, v42, OS_LOG_TYPE_DEFAULT, "zkw sending %ld sections", buf, 0xCu);
    }
    v45 = *(void **)(a1 + 32);
    v46 = [v45 mutableSections];
    [v45 updateResultsThroughDelegate:0 state:4 sections:v46];

    kdebug_trace();
    v47 = SPLogForSPLogCategoryTelemetry();
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_235D0B000, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "zkwLatency", " enableTelemetry=YES ", buf, 2u);
    }

    v48 = [*(id *)(a1 + 32) queryProcessor];
    dispatch_group_notify(v39, v48, v40);
  }
  else
  {
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __23__SPZKWQueryTask_start__block_invoke_109;
    v53[3] = &unk_264C77318;
    v49 = *(void (***)(void, void, void))(a1 + 40);
    uint64_t v50 = *(void *)(a1 + 32);
    uint64_t v56 = *(void *)(a1 + 48);
    v53[4] = v50;
    v54 = v49;
    id v55 = v41;
    ((void (**)(void, uint64_t, void *))v49)[2](v54, 25, v53);
  }
}

void __23__SPZKWQueryTask_start__block_invoke_108(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = [*(id *)(a1 + 32) mutableSections];
  v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  id v5 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = [v4 count];
    _os_log_impl(&dword_235D0B000, v5, OS_LOG_TYPE_DEFAULT, "zkw sending %ld sections", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(a1 + 32) updateResultsThroughDelegate:0 state:4 sections:v4];
  kdebug_trace();
  dispatch_block_t v6 = SPLogForSPLogCategoryTelemetry();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "zkwLatency", " enableTelemetry=YES ", (uint8_t *)&v9, 2u);
  }

  uint64_t v7 = *(NSObject **)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) queryProcessor];
  dispatch_group_notify(v7, v8, *(dispatch_block_t *)(a1 + 48));
}

void __23__SPZKWQueryTask_start__block_invoke_109(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F250D0] suggestedResultResponseWithLimit:5];
  v3 = [v2 topics];
  v4 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v53 = [v3 count];
    _os_log_impl(&dword_235D0B000, v4, OS_LOG_TYPE_DEFAULT, "zkw proactive response: %lu topics", buf, 0xCu);
  }

  long long v50 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  id v5 = [v2 sections];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v47 + 1) + 8 * i) results];
        v8 += [v11 count];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v7);

    if (v8 && [v3 count] >= v8)
    {
      uint64_t v12 = [MEMORY[0x263F36D78] requestWithTopics:v3 triggerEvent:21 queryId:*(void *)(a1 + 56)];
      v13 = +[SPPARSession spotlightPARSession];
      v14 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v12 topics];
        uint64_t v16 = [v15 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v53 = v16;
        _os_log_impl(&dword_235D0B000, v14, OS_LOG_TYPE_DEFAULT, "zkw parsec response: %lu topics", buf, 0xCu);
      }
      if (v12 && v13)
      {
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __23__SPZKWQueryTask_start__block_invoke_113;
        v39[3] = &unk_264C772F0;
        id v40 = v3;
        id v17 = v12;
        uint64_t v18 = *(void *)(a1 + 32);
        id v41 = v17;
        uint64_t v42 = v18;
        id v19 = v2;
        uint64_t v20 = *(void *)(a1 + 56);
        id v43 = v19;
        uint64_t v46 = v20;
        id v44 = *(id *)(a1 + 40);
        id v45 = *(id *)(a1 + 48);
        uint64_t v21 = [v13 taskWithRequest:v17 completion:v39];
        [v21 resume];
      }
      else
      {
        if (!v13)
        {
          long long v23 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            __23__SPZKWQueryTask_start__block_invoke_109_cold_3(v23, v24, v25, v26, v27, v28, v29, v30);
          }
        }
        if (!v12)
        {
          uint64_t v31 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            __23__SPZKWQueryTask_start__block_invoke_109_cold_2(v31, v32, v33, v34, v35, v36, v37, v38);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }

      goto LABEL_21;
    }
  }
  else
  {

    unint64_t v8 = 0;
  }
  long long v22 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    __23__SPZKWQueryTask_start__block_invoke_109_cold_1(v3, v8, v22);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_21:
}

void __23__SPZKWQueryTask_start__block_invoke_113(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v60 = a2;
  id v7 = a3;
  id v61 = a4;
  uint64_t v62 = v7;
  unint64_t v8 = [v7 sections];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [*(id *)(a1 + 32) count];

  if (v9 == v10)
  {
    if (v61)
    {
      uint64_t v11 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __23__SPZKWQueryTask_start__block_invoke_113_cold_1((uint64_t)v61, v11);
      }
    }
    uint64_t v12 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [*(id *)(a1 + 40) topics];
      uint64_t v14 = [v13 count];
      id v15 = [v62 results];
      uint64_t v16 = [v15 count];
      id v17 = [v62 sections];
      *(_DWORD *)buf = 134218496;
      uint64_t v87 = v14;
      __int16 v88 = 2048;
      uint64_t v89 = v16;
      __int16 v90 = 2048;
      uint64_t v91 = [v17 count];
      _os_log_impl(&dword_235D0B000, v12, OS_LOG_TYPE_DEFAULT, "zkw parsec response complete: sent %lu topics; got %lu results, %lu sections",
        buf,
        0x20u);
    }
    v65 = [v62 sections];
    uint64_t v63 = [v65 count];
    id v64 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v63)
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        uint64_t v18 = [*(id *)(a1 + 40) topics];
        id v19 = [v18 objectAtIndex:i];

        v67 = [v65 objectAtIndexedSubscript:i];
        v66 = (void *)[objc_alloc(MEMORY[0x263F78D70]) initWithSection:v67];
        id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id obj = [v67 results];
        uint64_t v21 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v80;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v80 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void *)(*((void *)&v79 + 1) + 8 * j);
              uint64_t v25 = SPLogForSPLogCategoryDefault();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v26 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                uint64_t v87 = v26;
                _os_log_impl(&dword_235D0B000, v25, OS_LOG_TYPE_DEFAULT, "zkw parsec response: result for %@", buf, 0xCu);
              }

              uint64_t v27 = (void *)MEMORY[0x263F78E30];
              uint64_t v28 = [*(id *)(a1 + 48) query];
              uint64_t v29 = [v28 queryContext];
              uint64_t v30 = [v27 updateResult:v24 topic:v19 queryContext:v29];

              if (v30)
              {
                [v20 addObject:v30];
              }
              else
              {
                uint64_t v31 = SPLogForSPLogCategoryDefault();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_235D0B000, v31, OS_LOG_TYPE_DEFAULT, "zkw result builder: unable to resolve local result", buf, 2u);
                }
              }
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
          }
          while (v21);
        }

        [v66 setResults:v20];
        [v64 addObject:v66];
      }
    }
    [*(id *)(a1 + 56) createSectionsFromServerResults:v64];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obja = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [obja countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v76;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v76 != v33) {
            objc_enumerationMutation(obja);
          }
          uint64_t v35 = *(void **)(*((void *)&v75 + 1) + 8 * k);
          uint64_t v36 = (void *)MEMORY[0x263F78E40];
          uint64_t v37 = [v35 bundleIdentifier];
          LODWORD(v36) = [v36 isZKWRecentBundle:v37];

          if (v36)
          {
            uint64_t v38 = [MEMORY[0x263F78E40] makeClearProactiveCategoryButtonItemWithCategory:1 shouldClearWholeSection:1 result:0];
            [v35 setButton:v38];

            v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v40 = [v39 localizedStringForKey:@"CLEAR" value:&stru_26E92AFF0 table:@"SpotlightServices"];
            id v41 = [v35 button];
            [v41 setTitle:v40];

            uint64_t v42 = [v35 button];
            [v42 setImage:0];
          }
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v43 = [v35 results];
          uint64_t v44 = [v43 countByEnumeratingWithState:&v71 objects:v83 count:16];
          if (v44)
          {
            uint64_t v45 = *(void *)v72;
            do
            {
              for (uint64_t m = 0; m != v44; ++m)
              {
                if (*(void *)v72 != v45) {
                  objc_enumerationMutation(v43);
                }
                long long v47 = *(void **)(*((void *)&v71 + 1) + 8 * m);
                [v47 setQueryId:*(void *)(a1 + 80)];
                [MEMORY[0x263F78E40] injectRecentsOptionsIntoResult:v47];
              }
              uint64_t v44 = [v43 countByEnumeratingWithState:&v71 objects:v83 count:16];
            }
            while (v44);
          }
        }
        uint64_t v32 = [obja countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v32);
    }

    if (objc_opt_respondsToSelector())
    {
      long long v48 = [*(id *)(a1 + 56) performSelector:sel_codePathIdTrigger];
      if (v48) {
        SSDefaultsLogForTrigger();
      }
    }
    else
    {
      long long v48 = 0;
    }
    if ([obja count])
    {
      id v58 = *(id *)(a1 + 48);
      objc_sync_enter(v58);
      id v59 = [*(id *)(a1 + 48) mutableSections];
      [v59 addObjectsFromArray:obja];

      objc_sync_exit(v58);
    }

    long long v50 = v65;
  }
  else
  {
    long long v49 = SPLogForSPLogCategoryDefault();
    long long v50 = v49;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      __23__SPZKWQueryTask_start__block_invoke_113_cold_2(v49, v51, v52, v53, v54, v55, v56, v57);
      long long v50 = v49;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (id)unsafeSections
{
  id v2 = [(SPQueryTask *)self mutableSections];
  v3 = (void *)[v2 copy];

  return v3;
}

void __23__SPZKWQueryTask_start__block_invoke_89_cold_1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = 134218496;
  uint64_t v2 = 0;
  __int16 v3 = 1024;
  int v4 = _MergedGlobals;
  __int16 v5 = 1024;
  int v6 = dword_26AC2EA2C;
  _os_log_error_impl(&dword_235D0B000, log, OS_LOG_TYPE_ERROR, "=====^^^^ AppPredictionClient missing data, count -> applications:%lu requests:%d missingAllDataRequests:%d", (uint8_t *)&v1, 0x18u);
}

void __23__SPZKWQueryTask_start__block_invoke_109_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 134218240;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_235D0B000, a3, OS_LOG_TYPE_ERROR, "zkw proactive response mismatch: %lu topics, %lu section results", (uint8_t *)&v5, 0x16u);
}

void __23__SPZKWQueryTask_start__block_invoke_109_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __23__SPZKWQueryTask_start__block_invoke_109_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __23__SPZKWQueryTask_start__block_invoke_113_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235D0B000, a2, OS_LOG_TYPE_ERROR, "zkw parsec response completed with error: %@", (uint8_t *)&v2, 0xCu);
}

void __23__SPZKWQueryTask_start__block_invoke_113_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end