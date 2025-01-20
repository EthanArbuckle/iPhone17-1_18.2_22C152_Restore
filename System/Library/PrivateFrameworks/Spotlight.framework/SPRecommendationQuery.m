@interface SPRecommendationQuery
+ (BOOL)isQuerySupported:(unint64_t)a3;
+ (unsigned)searchDomain;
- (id)buildSearchResultWithRecommendations:(id)a3 query:(id)a4;
- (void)begin:(id)a3;
- (void)start;
@end

@implementation SPRecommendationQuery

+ (unsigned)searchDomain
{
  return 11;
}

- (void)begin:(id)a3
{
  id v3 = a3;
  v4 = [v3 query];
  v5 = [v4 queryContext];

  v6 = [v5 getTrimmedSearchString];
  v7 = (void *)[v6 mutableCopy];

  v8 = [MEMORY[0x263EFF960] currentLocale];
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("Query Queue", v9);

  v58[0] = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x263F78CF8]) initWithLocale:v8 queue:v10 error:v58];
  id v12 = v58[0];
  if ([v11 isMusicRecEligible:v7])
  {
    v13 = SSDefaultsGetResources();
    v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6ee794d6-a63f-11ed-afa1-0242ac120002"];
    objc_msgSend(v13, "logForTrigger:queryID:", v14, objc_msgSend(v5, "queryIdent"));

    LODWORD(v13) = SSShowMusicRec();
    v15 = logForCSLogCategoryRecs();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235D0B000, v15, OS_LOG_TYPE_DEFAULT, "Starting Music recommendation retrieval.", buf, 2u);
      }

      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      *(void *)buf = 0;
      v53 = buf;
      uint64_t v54 = 0x3032000000;
      v55 = __Block_byref_object_copy_;
      v56 = __Block_byref_object_dispose_;
      id v57 = 0;
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __31__SPRecommendationQuery_begin___block_invoke;
      v51[3] = &unk_264C76FF8;
      v51[4] = buf;
      [v11 setCandidatesHandler:v51];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __31__SPRecommendationQuery_begin___block_invoke_86;
      v49[3] = &unk_264C77020;
      v18 = v17;
      v50 = v18;
      [v11 setCompletionHandler:v49];
      v19 = [v3 query];
      objc_msgSend(v11, "retrieveMusicWithQuery:queryID:", v7, objc_msgSend(v19, "queryIdent"));

      v20 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[SPRecommendationQuery begin:]();
      }

      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      v21 = logForCSLogCategoryRecs();
      id v41 = v12;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v48 = 0;
        _os_log_impl(&dword_235D0B000, v21, OS_LOG_TYPE_DEFAULT, "Music recommendation retrieval ended.", v48, 2u);
      }

      v22 = SPLogForSPLogCategoryTelemetry();
      unsigned int v23 = [v3 externalID];
      if (v23 && os_signpost_enabled(v22))
      {
        *(_WORD *)v48 = 0;
        _os_signpost_emit_with_name_impl(&dword_235D0B000, v22, OS_SIGNPOST_INTERVAL_END, v23, "recommendationSpotlightLatency", " enableTelemetry=YES ", v48, 2u);
      }

      *(void *)v48 = 0;
      objc_initWeak((id *)v48, v3);
      v24 = (void *)*((void *)v53 + 5);
      if (v24 && [v24 count])
      {
        v40 = [(SPRecommendationQuery *)self buildSearchResultWithRecommendations:*((void *)v53 + 5) query:v3];
        v25 = objc_opt_new();
        [v25 setPinToTop:1];
        id v26 = v25;
        [v26 setMaxInitiallyVisibleResults:1];
        [v26 setBundleIdentifier:*MEMORY[0x263F78FC0]];
        [v26 setTitle:@"Apple Music"];
        [v26 setResults:v40];
        v27 = [v3 query];
        char v28 = [v27 cancelled];

        if (v28)
        {
          v29 = logForCSLogCategoryRecs();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[SPRecommendationQuery begin:]();
          }
        }
        else
        {
          v39 = +[SPQueryTask queryQueue];
          objc_copyWeak(v46, (id *)v48);
          id v45 = v26;
          md_tracing_dispatch_async_propagating();

          objc_destroyWeak(v46);
        }
      }
      else
      {
        v38 = +[SPQueryTask queryQueue];
        v46[1] = (id)MEMORY[0x263EF8330];
        v46[2] = (id)3221225472;
        v46[3] = __31__SPRecommendationQuery_begin___block_invoke_89;
        v46[4] = &unk_264C76AB8;
        objc_copyWeak(&v47, (id *)v48);
        v46[5] = self;
        md_tracing_dispatch_async_propagating();

        objc_destroyWeak(&v47);
      }
      objc_destroyWeak((id *)v48);

      _Block_object_dispose(buf, 8);
      id v12 = v41;
    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235D0B000, v15, OS_LOG_TYPE_DEFAULT, "*warn* Music recommendation retrieval disabled from Trial.", buf, 2u);
      }

      v34 = SPLogForSPLogCategoryTelemetry();
      unsigned int v35 = [v3 externalID];
      if (v35)
      {
        unsigned int v36 = v35;
        if (os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_235D0B000, v34, OS_SIGNPOST_INTERVAL_END, v36, "recommendationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
        }
      }

      v37 = +[SPQueryTask queryQueue];
      v44 = v3;
      md_tracing_dispatch_async_propagating();

      v18 = v44;
    }
  }
  else
  {
    v30 = SPLogForSPLogCategoryTelemetry();
    unsigned int v31 = [v3 externalID];
    if (v31)
    {
      unsigned int v32 = v31;
      if (os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_235D0B000, v30, OS_SIGNPOST_INTERVAL_END, v32, "recommendationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
      }
    }

    v33 = +[SPQueryTask queryQueue];
    v43 = v3;
    md_tracing_dispatch_async_propagating();

    v18 = v43;
  }
}

void __31__SPRecommendationQuery_begin___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = logForCSLogCategoryRecs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __31__SPRecommendationQuery_begin___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

intptr_t __31__SPRecommendationQuery_begin___block_invoke_86(uint64_t a1)
{
  v2 = logForCSLogCategoryRecs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __31__SPRecommendationQuery_begin___block_invoke_86_cold_1();
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __31__SPRecommendationQuery_begin___block_invoke_89(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained storeCompletedSearch:*(void *)(a1 + 32) withSections:MEMORY[0x263EFFA68]];
}

void __31__SPRecommendationQuery_begin___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [WeakRetained storeCompletedSearch:v3 withSections:v4];
}

uint64_t __31__SPRecommendationQuery_begin___block_invoke_97(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeCompletedSearch:*(void *)(a1 + 40) withSections:MEMORY[0x263EFFA68]];
}

uint64_t __31__SPRecommendationQuery_begin___block_invoke_98(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeCompletedSearch:*(void *)(a1 + 40) withSections:MEMORY[0x263EFFA68]];
}

- (id)buildSearchResultWithRecommendations:(id)a3 query:(id)a4
{
  v65[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v57 = a4;
  id v55 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  v56 = [MEMORY[0x263F089D8] string];
  unint64_t v6 = 0;
  uint64_t v54 = *MEMORY[0x263F78FC0];
  id v58 = v5;
  do
  {
    if (v6 >= [v5 count]) {
      break;
    }
    v7 = [v5 objectAtIndexedSubscript:v6];
    v60 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v7, "trackId"));
    objc_msgSend(v56, "appendString:");
    [v56 appendString:@" "];
    v8 = objc_opt_new();
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"media:%ld", objc_msgSend(v7, "trackId"));
    [v8 setIdentifier:v9];

    dispatch_queue_t v10 = (void *)MEMORY[0x263F67A90];
    v11 = [v7 trackName];
    id v12 = [v10 textWithString:v11];
    [v8 setTitle:v12];

    v13 = objc_msgSend(NSString, "stringWithFormat:", @"https://music.apple.com/us/album/close-friends/%ld?i=%ld", objc_msgSend(v7, "collectionId"), objc_msgSend(v7, "trackId"));
    [v8 setCompletion:v13];

    id v14 = objc_alloc(NSURL);
    v15 = [v8 completion];
    BOOL v16 = (void *)[v14 initWithString:v15];
    [v8 setUrl:v16];

    [v8 setStoreIdentifier:@"278911476"];
    [v8 setSectionBundleIdentifier:v54];
    [v8 setSectionHeader:@"Apple Music"];
    [v8 setDomainName:@"media"];
    [v8 setMinimumRankOfTopHitToSuppressResult:15];
    [v8 setResultType:@"media"];
    [v8 setResultTemplate:@"generic"];
    [v8 setType:1];
    dispatch_semaphore_t v17 = [v57 query];
    objc_msgSend(v8, "setQueryId:", objc_msgSend(v17, "queryIdent"));

    id v18 = objc_alloc_init(MEMORY[0x263F677D0]);
    id v19 = objc_alloc_init(MEMORY[0x263F67870]);
    v65[0] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:1];
    v59 = v18;
    [v18 setCardSections:v20];

    id v21 = objc_alloc_init(MEMORY[0x263F67990]);
    [v19 setCommand:v21];
    [v21 setCommandDetail:@"open_media"];
    id v22 = objc_alloc_init(MEMORY[0x263F679B0]);
    [v21 setPunchout:v22];

    unsigned int v23 = [v21 punchout];
    [v23 setBundleIdentifier:@"com.apple.Music"];

    v24 = [v8 url];
    v64 = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
    id v26 = [v21 punchout];
    [v26 setUrls:v25];

    [v19 setType:@"detailed_row"];
    id v27 = objc_alloc(MEMORY[0x263F67AB0]);
    id v28 = objc_alloc(NSURL);
    v29 = [v7 artworkURL];
    v30 = (void *)[v28 initWithString:v29];
    unsigned int v31 = (void *)[v27 initWithURL:v30];
    [v19 setThumbnail:v31];

    id v32 = objc_alloc_init(MEMORY[0x263F679F0]);
    [v19 setTitle:v32];

    v33 = [v19 title];
    [v33 setStarRating:0.0];

    v34 = [v19 title];
    [v34 setMaxLines:2];

    unsigned int v35 = [v19 title];
    unsigned int v36 = [v7 trackName];
    [v35 setText:v36];

    id v37 = objc_alloc_init(MEMORY[0x263F679F0]);
    v38 = [v7 artistName];
    [v37 setText:v38];

    id v39 = objc_alloc_init(MEMORY[0x263F679F0]);
    v40 = [v7 collectionName];
    [v39 setText:v40];

    id v41 = objc_alloc_init(MEMORY[0x263F679F0]);
    [v41 setMaxLines:0];
    if ([v7 trackExplicitness]) {
      [v41 setContentAdvisory:@"Explicit"];
    }
    uint64_t v42 = [v7 trackTimeMillis];
    id v5 = v58;
    if (v42 >= 1000)
    {
      unint64_t v43 = v42 / 1000;
      if ((unint64_t)(v42 / 1000) >> 7 <= 0x2A2)
      {
        if (v43 >= 0xE10) {
          objc_msgSend(NSString, "stringWithFormat:", @"%lu:%02lu:%02lu", v43 / 0xE10, v43 % 0xE10 / 0x3C, v43 % 0x3C);
        }
        else {
        v44 = objc_msgSend(NSString, "stringWithFormat:", @"%lu:%02lu", v43 % 0xE10 / 0x3C, v43 % 0x3C, v53);
        }
        id v45 = objc_alloc_init(MEMORY[0x263F679F0]);
        [v19 setFootnote:v45];

        v46 = [v19 footnote];
        [v46 setText:v44];

        id v47 = [v19 footnote];
        [v47 setMaxLines:1];

        id v5 = v58;
      }
    }
    v63[0] = v37;
    v63[1] = v39;
    v63[2] = v41;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:3];
    [v19 setDescriptions:v48];

    [v8 setInlineCard:v59];
    [v55 addObject:v8];

    ++v6;
  }
  while (v6 != 3);
  v49 = os_log_create("com.apple.Spotlight", "recs");
  v50 = [v57 query];
  os_signpost_id_t v51 = [v50 queryIdent];

  if (v51 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v49))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v56;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v49, OS_SIGNPOST_EVENT, v51, "SRERenderingResults", "AdamIDs: %@", buf, 0xCu);
  }

  return v55;
}

- (void)start
{
  v21.receiver = self;
  v21.super_class = (Class)SPRecommendationQuery;
  [(SPKQuery *)&v21 start];
  if (![(SPKQuery *)self sendEmptyResponseIfNecessary])
  {
    uint64_t v3 = [(SPKQuery *)self userQueryString];
    v4 = (void *)[v3 mutableCopy];

    if (v4)
    {
      id v5 = [(SPKQuery *)self delegate];
      if (([v5 isPeopleSearch] & 1) == 0 && !objc_msgSend(v5, "isScopedAppSearch"))
      {
        unint64_t v6 = [v5 query];
        v7 = [v6 disabledBundles];
        int v8 = [v7 containsObject:@"com.apple.Music"];

        if (!v8)
        {
          if (start_once != -1) {
            dispatch_once(&start_once, &__block_literal_global_4);
          }
          dispatch_semaphore_t v17 = SPLogForSPLogCategoryTelemetry();
          unsigned int v18 = [v5 externalID];
          if (v18)
          {
            unsigned int v19 = v18;
            if (os_signpost_enabled(v17))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_235D0B000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "recommendationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
            }
          }

          id v5 = v5;
          md_tracing_dispatch_async_propagating();

          goto LABEL_11;
        }
        v9 = logForCSLogCategoryRecs();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_235D0B000, v9, OS_LOG_TYPE_DEFAULT, "Music recommendation disabled by settings.", buf, 2u);
        }
      }
      id v10 = objc_alloc(MEMORY[0x263F78D80]);
      unint64_t v11 = [(SPKQuery *)self queryGroupId];
      id v12 = (void *)[v10 initWithQueryID:v11 sections:MEMORY[0x263EFFA68]];
      v13 = [(SPKQuery *)self responseHandler];
      ((void (**)(void, void *))v13)[2](v13, v12);
    }
    else
    {
      id v14 = objc_alloc(MEMORY[0x263F78D80]);
      unint64_t v15 = [(SPKQuery *)self queryGroupId];
      id v5 = (id)[v14 initWithQueryID:v15 sections:MEMORY[0x263EFFA68]];
      BOOL v16 = [(SPKQuery *)self responseHandler];
      ((void (**)(void, id))v16)[2](v16, v5);
    }
LABEL_11:
  }
}

uint64_t __30__SPRecommendationQuery_start__block_invoke()
{
  start_recQueue = (uint64_t)dispatch_queue_create("Music Queue", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __30__SPRecommendationQuery_start__block_invoke_154(uint64_t a1)
{
  return [*(id *)(a1 + 32) begin:*(void *)(a1 + 40)];
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return 1;
}

- (void)begin:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_235D0B000, v0, OS_LOG_TYPE_ERROR, "Music recommendation result droped due to data store being canceled.", v1, 2u);
}

- (void)begin:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_235D0B000, v0, v1, "Waiting for Music recommendation retrieval.", v2, v3, v4, v5, v6);
}

void __31__SPRecommendationQuery_begin___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_235D0B000, v0, v1, "Music retrieval candidate got.", v2, v3, v4, v5, v6);
}

void __31__SPRecommendationQuery_begin___block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_235D0B000, v0, v1, "Music retrieval complete. Before dispatch_semaphore_signal", v2, v3, v4, v5, v6);
}

@end