@interface SPQueryTask
+ (id)queryQueue;
+ (void)initialize;
- (BOOL)forceStableResults;
- (BOOL)live;
- (BOOL)readyToUpdate;
- (NSArray)sections;
- (NSArray)unsafeCombinedSuggestions;
- (NSArray)unsafeParsecSuggestions;
- (NSArray)unsafeSections;
- (NSMutableArray)mutableSections;
- (NSString)rankingDebugLog;
- (NSString)searchString;
- (NSString)sessionEntityString;
- (NSString)unsafeSessionEntityString;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)queryProcessor;
- (SPDaemonQueryToken)token;
- (SPQueryTask)init;
- (SPQueryTaskDelegate)delegate;
- (SPSearchQuery)query;
- (SPSearchQueryContext)previousQueryContext;
- (id)retainAndMergeSections:(id)a3 forState:(unint64_t)a4;
- (int64_t)maxUISuggestions;
- (unint64_t)maxTopHitAppResults;
- (unint64_t)queryIdForFeedback;
- (unint64_t)queryKind;
- (unint64_t)state;
- (unint64_t)unsafeState;
- (unint64_t)whyQuery;
- (void)disableUpdates;
- (void)enableUpdates;
- (void)postSearchAgentUpdatedResultsToDelegate:(id)a3;
- (void)pushAndPostUpdates;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setForceStableResults:(BOOL)a3;
- (void)setLive:(BOOL)a3;
- (void)setMaxTopHitAppResults:(unint64_t)a3;
- (void)setMaxUISuggestions:(int64_t)a3;
- (void)setMutableSections:(id)a3;
- (void)setPreviousQueryContext:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryKind:(unint64_t)a3;
- (void)setQueryProcessor:(id)a3;
- (void)setRankingDebugLog:(id)a3;
- (void)setSections:(id)a3;
- (void)setSessionEntityString:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setToken:(id)a3;
- (void)setUnsafeState:(unint64_t)a3;
- (void)setWhyQuery:(unint64_t)a3;
- (void)updateResultsThroughDelegate:(BOOL)a3 state:(unint64_t)a4 sections:(id)a5;
- (void)updateResultsThroughDelegate:(BOOL)a3 state:(unint64_t)a4 unchanged:(BOOL)a5 sections:(id)a6;
@end

@implementation SPQueryTask

uint64_t __69__SPQueryTask_updateResultsThroughDelegate_state_unchanged_sections___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushAndPostUpdates];
}

- (unint64_t)queryKind
{
  return self->_queryKind;
}

- (unint64_t)queryIdForFeedback
{
  v2 = [(SPQueryTask *)self query];
  v3 = [v2 queryContext];
  unint64_t v4 = [v3 queryIdent];

  return v4;
}

- (SPSearchQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (SPQueryTask)init
{
  v12.receiver = self;
  v12.super_class = (Class)SPQueryTask;
  v2 = [(SPQueryTask *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("query results", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    int v6 = _os_feature_enabled_impl();
    v2->_clientRankAndBlend = v6;
    if (v6)
    {
      v7 = (OS_dispatch_queue *)(id)sQueryQueue_0;
      queryProcessor = v2->_queryProcessor;
      v2->_queryProcessor = v7;
    }
    else
    {
      queryProcessor = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v9 = dispatch_queue_create("query processor", queryProcessor);
      v10 = v2->_queryProcessor;
      v2->_queryProcessor = (OS_dispatch_queue *)v9;
    }
  }
  return v2;
}

- (void)pushAndPostUpdates
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!atomic_load((unsigned int *)&self->_updatesDisabled))
  {
    do
    {
      unint64_t v11 = atomic_load((unint64_t *)&self->_deferredUpdate);
      unint64_t v12 = v11;
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_deferredUpdate, &v12, 0);
    }
    while (v12 != v11);
    if (!v11)
    {
      SPLogForSPLogCategoryDefault();
      dispatch_queue_t v4 = (SPQueryResponse *)objc_claimAutoreleasedReturnValue();
      os_log_type_t v34 = *MEMORY[0x263F67548] ^ 1;
      if (!os_log_type_enabled(&v4->super, v34)) {
        goto LABEL_35;
      }
      LOWORD(v42) = 0;
      v7 = "pushAndPostUpdates - nothing to post";
      p_super = &v4->super;
      os_log_type_t v9 = v34;
      uint32_t v10 = 2;
      goto LABEL_4;
    }
    dispatch_queue_t v4 = [[SPQueryResponse alloc] initWithTask:self];
    v13 = *(NSArray **)(v12 + 8);
    if (v13)
    {
      sections = self->_sections;
      self->_sections = v13;
    }
    if (*(void *)v12)
    {
      sessionEntityString = self->_sessionEntityString;
      self->_sessionEntityString = *(NSString **)v12;
    }
    v16 = (void *)[(NSArray *)self->_sections copy];
    [(SPQueryResponse *)v4 setResultSections:v16];

    [(SPQueryResponse *)v4 setSessionEntityString:self->_sessionEntityString];
    v17 = [(SPQueryTask *)self query];
    v18 = [v17 queryContext];
    v19 = [v18 queryUnderstandingOutput];

    if (!v19)
    {
LABEL_25:
      unint64_t v35 = *(void *)(v12 + 24);
      -[SPQueryResponse setState:](v4, "setState:", v35, v42, v43);
      self->_state = v35;
      int v36 = *(unsigned __int8 *)(v12 + 16);
      v37 = SPLogForSPLogCategoryDefault();
      os_log_type_t v38 = *MEMORY[0x263F67548] ^ 1;
      BOOL v39 = os_log_type_enabled(v37, v38);
      if (v36)
      {
        if (v39)
        {
          LOWORD(v42) = 0;
          _os_log_impl(&dword_235D0B000, v37, v38, "Post clear", (uint8_t *)&v42, 2u);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained resultsDidBecomeInvalid:self];
        v41 = [MEMORY[0x263F02A98] sharedInstance];
        [v41 logWithBundleID:@"com.apple.SpotlightUI" indexOperation:4 itemCount:1 reason:@"UserInput"];
      }
      else
      {
        if (v39)
        {
          LOWORD(v42) = 0;
          _os_log_impl(&dword_235D0B000, v37, v38, "Post updates", (uint8_t *)&v42, 2u);
        }

        [(SPQueryResponse *)v4 setKind:*(unsigned __int8 *)(v12 + 32)];
        [(SPQueryTask *)self postSearchAgentUpdatedResultsToDelegate:v4];
        if (self->_state - 1 > 1) {
          goto LABEL_34;
        }
        WeakRetained = [MEMORY[0x263F02A98] sharedInstance];
        [WeakRetained logWithBundleID:@"com.apple.SpotlightUI" indexOperation:5 itemCount:1 reason:@"UserInput"];
      }

LABEL_34:
      free((void *)v12);
      goto LABEL_35;
    }
    v20 = [(SPQueryTask *)self query];
    v21 = [v20 queryContext];
    v22 = [v21 queryUnderstandingOutput];
    uint64_t v23 = [v22 objectForKey:@"kQPParseResultEcrGroundedOutput"];
    v24 = (void *)v23;
    v25 = (void *)MEMORY[0x263EFFA78];
    if (v23) {
      v25 = (void *)v23;
    }
    id v26 = v25;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_24:

      goto LABEL_25;
    }
    [(SPQueryResponse *)v4 setEcrGroundedOutput:v26];
    v27 = [(SPQueryResponse *)v4 ecrGroundedOutput];
    uint64_t v28 = [v27 count];

    v29 = SPLogForSPLogCategoryDefault();
    os_log_type_t v30 = *MEMORY[0x263F67548] ^ 1;
    BOOL v31 = os_log_type_enabled(v29, v30);
    if (v28)
    {
      if (v31)
      {
        LOWORD(v42) = 0;
        os_log_type_t v32 = v30;
        v33 = "Added non empty ecrGroundedOutput to spqueryrespone";
LABEL_22:
        _os_log_impl(&dword_235D0B000, v29, v32, v33, (uint8_t *)&v42, 2u);
      }
    }
    else if (v31)
    {
      LOWORD(v42) = 0;
      os_log_type_t v32 = v30;
      v33 = "Added empty ecrGroundedOutput to spqueryrespone";
      goto LABEL_22;
    }

    goto LABEL_24;
  }
  SPLogForSPLogCategoryDefault();
  dispatch_queue_t v4 = (SPQueryResponse *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v5 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(&v4->super, v5))
  {
    unsigned int v6 = atomic_load((unsigned int *)&self->_updatesDisabled);
    LODWORD(v42) = 67109120;
    HIDWORD(v42) = v6;
    v7 = "Skip posting; updates disabled %d.";
    p_super = &v4->super;
    os_log_type_t v9 = v5;
    uint32_t v10 = 8;
LABEL_4:
    _os_log_impl(&dword_235D0B000, p_super, v9, v7, (uint8_t *)&v42, v10);
  }
LABEL_35:
}

- (void)postSearchAgentUpdatedResultsToDelegate:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_log_type_t v5 = [v11 sessionEntityString];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F41C78]);
    v8 = [v11 sessionEntityString];
    os_log_type_t v9 = (void *)[v7 initWithSessionEntityString:v8];

    uint32_t v10 = [MEMORY[0x263F41C70] sharedInstance];
    [v10 setSharedMapsUserSessionEntity:v9 shareSessionIDWithMaps:1];
  }
  [WeakRetained didReceiveResponse:v11];
}

- (NSMutableArray)mutableSections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)updateResultsThroughDelegate:(BOOL)a3 state:(unint64_t)a4 unchanged:(BOOL)a5 sections:(id)a6
{
  BOOL v6 = a5;
  queryProcessor = self->_queryProcessor;
  id v11 = a6;
  dispatch_assert_queue_V2(queryProcessor);
  unint64_t v12 = [(SPQueryTask *)self retainAndMergeSections:v11 forState:a4];

  if ([(SPQueryTask *)self readyToUpdate])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [(SPQueryTask *)self unsafeSessionEntityString];
      v16 = malloc_type_malloc(0x28uLL, 0x10600402A2A81BBuLL);
      if (v15) {
        id v17 = v15;
      }
      void *v16 = v15;
      if (v12) {
        id v18 = v12;
      }
      v16[1] = v12;
      *((unsigned char *)v16 + 16) = a3;
      v16[3] = a4;
      *((unsigned char *)v16 + 32) = v6;
      if (v6)
      {
        do
        {
          unint64_t v19 = atomic_load((unint64_t *)&self->_deferredUpdate);
          unint64_t v20 = v19;
          atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_deferredUpdate, &v20, 0);
        }
        while (v20 != v19);
        if (v19) {
          *((unsigned char *)v16 + 32) = 0;
        }
        atomic_store((unint64_t)v16, (unint64_t *)&self->_deferredUpdate);
      }
      else
      {
        do
        {
          unint64_t v19 = atomic_load((unint64_t *)&self->_deferredUpdate);
          unint64_t v21 = v19;
          atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_deferredUpdate, &v21, (unint64_t)v16);
        }
        while (v21 != v19);
      }
      if (v19)
      {
        v22 = *(const void **)(v19 + 8);
        if (v22) {
          CFRelease(v22);
        }
        if (*(void *)v19) {
          CFRelease(*(CFTypeRef *)v19);
        }
        free((void *)v19);
      }
      else
      {
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __69__SPQueryTask_updateResultsThroughDelegate_state_unchanged_sections___block_invoke;
        block[3] = &unk_264C76B08;
        block[4] = self;
        dispatch_block_t v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
        dispatch_async(dispatchQueue, v24);
      }
    }
  }
}

- (void)updateResultsThroughDelegate:(BOOL)a3 state:(unint64_t)a4 sections:(id)a5
{
}

- (id)retainAndMergeSections:(id)a3 forState:(unint64_t)a4
{
  id v4 = a3;

  return v4;
}

- (BOOL)readyToUpdate
{
  return 1;
}

- (OS_dispatch_queue)queryProcessor
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168, 1);
}

- (void)setMutableSections:(id)a3
{
}

- (SPQueryTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SPQueryTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

+ (void)initialize
{
  uint64_t v2 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
  v3 = (void *)sUserDefaults;
  sUserDefaults = v2;

  BOOL v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("query queue", v6);
  os_log_type_t v5 = (void *)sQueryQueue_0;
  sQueryQueue_0 = (uint64_t)v4;
}

+ (id)queryQueue
{
  return (id)sQueryQueue_0;
}

- (NSString)searchString
{
  return 0;
}

- (void)enableUpdates
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__SPQueryTask_enableUpdates__block_invoke;
  block[3] = &unk_264C76B08;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SPQueryTask_enableUpdates__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v1 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 8));
  if (v1 <= 0) {
    __28__SPQueryTask_enableUpdates__block_invoke_cold_1();
  }
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 8), 0xFFFFFFFF);
  v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v3, v4))
  {
    unsigned int v5 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 8));
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_235D0B000, v3, v4, "Enable updates %d", (uint8_t *)v7, 8u);
  }

  return [*(id *)(a1 + 32) pushAndPostUpdates];
}

- (void)disableUpdates
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SPQueryTask_disableUpdates__block_invoke;
  block[3] = &unk_264C76B08;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

void __29__SPQueryTask_disableUpdates__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 8), 1u);
  uint64_t v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v2, v3))
  {
    unsigned int v4 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 8));
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_235D0B000, v2, v3, "Disable updates %d", (uint8_t *)v5, 8u);
  }
}

- (BOOL)forceStableResults
{
  return self->_forceStableResults;
}

- (void)setForceStableResults:(BOOL)a3
{
  self->_forceStableResults = a3;
}

- (unint64_t)maxTopHitAppResults
{
  return self->_maxTopHitAppResults;
}

- (void)setMaxTopHitAppResults:(unint64_t)a3
{
  self->_maxTopHitAppResults = a3;
}

- (unint64_t)whyQuery
{
  return self->_whyQuery;
}

- (void)setWhyQuery:(unint64_t)a3
{
  self->_whyQuery = a3;
}

- (void)setQueryKind:(unint64_t)a3
{
  self->_queryKind = a3;
}

- (int64_t)maxUISuggestions
{
  return self->_maxUISuggestions;
}

- (void)setMaxUISuggestions:(int64_t)a3
{
  self->_maxUISuggestions = a3;
}

- (SPSearchQueryContext)previousQueryContext
{
  return self->_previousQueryContext;
}

- (void)setPreviousQueryContext:(id)a3
{
}

- (NSString)rankingDebugLog
{
  return self->_rankingDebugLog;
}

- (void)setRankingDebugLog:(id)a3
{
}

- (BOOL)live
{
  return self->_live;
}

- (void)setLive:(BOOL)a3
{
  self->_live = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSString)sessionEntityString
{
  return self->_sessionEntityString;
}

- (void)setSessionEntityString:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSArray)unsafeSections
{
  return self->_unsafeSections;
}

- (NSArray)unsafeCombinedSuggestions
{
  return self->_unsafeCombinedSuggestions;
}

- (NSArray)unsafeParsecSuggestions
{
  return self->_unsafeParsecSuggestions;
}

- (NSString)unsafeSessionEntityString
{
  return self->_unsafeSessionEntityString;
}

- (void)setQueryProcessor:(id)a3
{
}

- (SPDaemonQueryToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (unint64_t)unsafeState
{
  return self->_unsafeState;
}

- (void)setUnsafeState:(unint64_t)a3
{
  self->_unsafeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_queryProcessor, 0);
  objc_storeStrong((id *)&self->_unsafeSessionEntityString, 0);
  objc_storeStrong((id *)&self->_unsafeParsecSuggestions, 0);
  objc_storeStrong((id *)&self->_unsafeCombinedSuggestions, 0);
  objc_storeStrong((id *)&self->_unsafeSections, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sessionEntityString, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_rankingDebugLog, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_mutableSections, 0);
  objc_storeStrong((id *)&self->_previousQueryContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __28__SPQueryTask_enableUpdates__block_invoke_cold_1()
{
}

@end