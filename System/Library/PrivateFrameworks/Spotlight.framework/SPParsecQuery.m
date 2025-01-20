@interface SPParsecQuery
+ (BOOL)isParsecEnabled;
+ (unsigned)searchDomain;
+ (void)activate;
+ (void)deactivate;
+ (void)getFTEStringsWithReply:(id)a3;
+ (void)initialize;
+ (void)parsecEnabled:(BOOL)a3;
- (BOOL)available;
- (BOOL)canceled;
- (BOOL)done;
- (BOOL)parsecLoaded;
- (BOOL)shouldReturnEarly;
- (BOOL)suggestionsAreBlended;
- (BOOL)webSearchLoaded;
- (NSArray)excludedDomainIdentifiers;
- (NSArray)parsecResults;
- (NSArray)parsecResultsCategoryOrder;
- (NSArray)querySuggestionResults;
- (NSDictionary)category_stats;
- (NSDictionary)server_features;
- (NSSet)appBlocklist;
- (NSString)fbq;
- (NSString)web_fbq;
- (OS_dispatch_queue)queue;
- (PRSMapsParsecRanker)mapsParsecRanker;
- (PRSQueryTask)parsecQueryTask;
- (PRSRankingConfiguration)rankingInfo;
- (SDNetworkQualityInquiry)networkConditions;
- (SPFederatedQueryTask)resultPipe;
- (SPParsecQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6;
- (SSPlistDataReader)cannedCEPValues;
- (SSPlistDataReader)cepDictionary;
- (__MDSimpleQueryEvaluator)queryEval;
- (double)computeTimeout:(double)a3;
- (double)searchTimeOut;
- (double)suggestionTimeOut;
- (double)timeOut:(BOOL)a3;
- (id)createResultObject;
- (id)findLocalCopies:(id)a3 alternativeResults:(id)a4 withQueryString:(id)a5;
- (id)findLocalCopies:(id)a3 appIdentifiers:(id)a4 adamIDs:(id)a5 alternativeResults:(id)a6 withQueryString:(id)a7;
- (id)rerankMapsResultsWithLocalSignals:(id)a3 forQueryId:(int64_t)a4;
- (unint64_t)lastKnownQuality;
- (unint64_t)quality;
- (unint64_t)startTime;
- (void)_setScore:(SPParsecQuery *)self forResult:(SEL)a2;
- (void)activate;
- (void)cancel;
- (void)checkParsecState;
- (void)deactivate;
- (void)dealloc;
- (void)finished;
- (void)geoUserSessionEntityString:(id)a3;
- (void)preheat;
- (void)query:(id)a3 didFinishWithResults:(id)a4 withSuggestions:(id)a5 withCorrections:(id)a6 withAlternativeResults:(id)a7 suggestionsAreBlended:(BOOL)a8;
- (void)queryDidFinishLoading:(id)a3;
- (void)resumeWithTimeout:(double)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCategory_stats:(id)a3;
- (void)setDone:(BOOL)a3;
- (void)setExcludedDomainIdentifiers:(id)a3;
- (void)setLastKnownQuality:(unint64_t)a3;
- (void)setNetworkConditions:(id)a3;
- (void)setParsecLoaded:(BOOL)a3;
- (void)setParsecQueryTask:(id)a3;
- (void)setParsecResults:(id)a3;
- (void)setParsecResultsCategoryOrder:(id)a3;
- (void)setParsecState:(BOOL)a3;
- (void)setQuality:(unint64_t)a3;
- (void)setQueryEval:(__MDSimpleQueryEvaluator *)a3;
- (void)setQuerySuggestionResults:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRankingInfo:(id)a3;
- (void)setResultPipe:(id)a3;
- (void)setServer_features:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setSuggestionsAreBlended:(BOOL)a3;
- (void)setWebSearchLoaded:(BOOL)a3;
- (void)start;
- (void)updateParsecBeyondTimeoutCount:(BOOL)a3;
@end

@implementation SPParsecQuery

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    SPLogInit();
    interface = [MEMORY[0x263F67488] getSharedInstance];
    MEMORY[0x270F9A758]();
  }
}

+ (unsigned)searchDomain
{
  return 2;
}

+ (BOOL)isParsecEnabled
{
  return sParsecEnabled;
}

+ (void)parsecEnabled:(BOOL)a3
{
  sParsecEnabled = a3;
  objc_msgSend((id)interface, "setParsecState:");
}

+ (void)activate
{
  if (+[SPParsecQuery isParsecEnabled])
  {
    id v3 = a1;
    objc_sync_enter(v3);
    ++sCounter;
    [(id)interface activate:CFAbsoluteTimeGetCurrent()];
    objc_sync_exit(v3);

    v4 = (void *)MEMORY[0x263F674B8];
    [v4 updateFeedbackListeners];
  }
}

+ (void)deactivate
{
  id obj = a1;
  objc_sync_enter(obj);
  if (sCounter)
  {
    --sCounter;
    [(id)interface deactivate];
  }
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"PRSStartedPlaying" object:0];

  objc_sync_exit(obj);
}

+ (void)getFTEStringsWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(id)interface searchSession];

  if (!v5)
  {
    v6 = SPLogForSPLogCategoryDefault();
    os_log_type_t v7 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, v6, v7, "Parsec session is nil in FTE. Trying to create one.", buf, 2u);
    }

    [(id)objc_opt_class() activate];
  }
  v8 = [(id)interface searchSession];

  if (v8)
  {
    v9 = [(id)interface searchSession];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __40__SPParsecQuery_getFTEStringsWithReply___block_invoke;
    v11[3] = &unk_264C77098;
    id v13 = a1;
    id v12 = v4;
    [v9 getFTEStringsWithReply:v11];
  }
  else
  {
    v10 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SPParsecQuery getFTEStringsWithReply:](v10);
    }

    (*((void (**)(id, void, void, void, void))v4 + 2))(v4, 0, 0, 0, 0);
  }
}

void __40__SPParsecQuery_getFTEStringsWithReply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = SPLogForSPLogCategoryDefault();
  os_log_type_t v16 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v15, v16))
  {
    int v17 = 138412546;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_235D0B000, v15, v16, "Got FTE reply - fteString %@, learnMore %@", (uint8_t *)&v17, 0x16u);
  }

  if (a6)
  {
    [(id)interface setSearchSession:0];
    [(id)objc_opt_class() activate];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createResultObject
{
  id v2 = objc_alloc_init(MEMORY[0x263F67480]);

  return v2;
}

- (void)finished
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235D0B000, v2, v3, "#query parsec finished", buf, 2u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  self->_queryEndTime = Current;
  double v5 = Current - self->_queryStartTime;
  double timeOut = self->_timeOut;
  if (v5 > timeOut) {
    [(SPParsecQuery *)self updateParsecBeyondTimeoutCount:v5 - timeOut <= 0.05];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
  self->_done = 1;
  pthread_mutex_lock(&self->_parsecQueryTaskMutex);
  os_log_type_t v7 = [(PRSQueryTask *)self->_parsecQueryTask category_stats];
  [(PRSRankingConfiguration *)self->_rankingInfo setSqfData:v7];

  v8 = [(PRSQueryTask *)self->_parsecQueryTask server_features];
  [(PRSRankingConfiguration *)self->_rankingInfo setServerFeatures:v8];

  v9 = [(PRSQueryTask *)self->_parsecQueryTask serverRelevanceScores];
  [(PRSRankingConfiguration *)self->_rankingInfo setServerRelevanceScores:v9];

  [(PRSQueryTask *)self->_parsecQueryTask serverRelevanceScoreThreshold];
  -[PRSRankingConfiguration setServerRelevanceScoreThreshold:](self->_rankingInfo, "setServerRelevanceScoreThreshold:");
  v10 = objc_opt_new();
  id v11 = [(PRSQueryTask *)self->_parsecQueryTask engagementSignal];
  id v12 = (void *)[v10 initWithSFEngagementSignal:v11];
  [(PRSRankingConfiguration *)self->_rankingInfo setIFunScores:v12];

  pthread_mutex_unlock(&self->_parsecQueryTaskMutex);
  [(PRSRankingConfiguration *)self->_rankingInfo setParsecCategoryOrder:self->_parsecResultsCategoryOrder];
  id v13 = [(SPParsecQuery *)self cepDictionary];
  id v14 = v13;
  if (!v13)
  {
    id v14 = [(SPParsecQuery *)self cannedCEPValues];
  }
  [(PRSRankingConfiguration *)self->_rankingInfo setQueryIndependentCategoryProbabilities:v14];
  if (!v13) {

  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v54 = 384;
  id obj = self->_parsecResults;
  uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (!v15)
  {
    float v16 = -1.0;
    goto LABEL_41;
  }
  uint64_t v57 = *(void *)v71;
  uint64_t v58 = v15;
  float v16 = -1.0;
  do
  {
    for (uint64_t i = 0; i != v58; ++i)
    {
      if (*(void *)v71 != v57) {
        objc_enumerationMutation(obj);
      }
      int v17 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      id v18 = objc_msgSend(v17, "bundleIdentifier", v54);
      v60 = v17;
      if ([v18 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"])
      {
      }
      else
      {
        __int16 v19 = [v17 bundleIdentifier];
        int v20 = [v19 hasPrefix:@"com.apple.parsec.app_distr"];

        if (!v20) {
          goto LABEL_35;
        }
      }
      v61 = objc_opt_new();
      uint64_t v21 = objc_opt_new();
      v22 = [v17 results];
      BOOL v23 = [v22 count] == 0;

      if (!v23) {
        float v16 = 0.0;
      }
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      v24 = [v60 results];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v66 objects:v77 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v67 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = *(void **)(*((void *)&v66 + 1) + 8 * j);
            v29 = [v28 applicationBundleIdentifier];
            if ([(NSSet *)self->_disabledAppSet containsObject:v29])
            {
              v30 = SPLogForSPLogCategoryDefault();
              os_log_type_t v31 = 2 * (*MEMORY[0x263F67540] == 0);
              if (os_log_type_enabled(v30, v31))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v29;
                _os_log_impl(&dword_235D0B000, v30, v31, "Skip de-duping of disabled app %@", buf, 0xCu);
              }

              [v21 addObject:v28];
            }
            else if ([(NSSet *)self->_setOfVisibleApps containsObject:v29])
            {
              v32 = SPLogForSPLogCategoryDefault();
              os_log_type_t v33 = 2 * (*MEMORY[0x263F67540] == 0);
              if (os_log_type_enabled(v32, v33))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v29;
                _os_log_impl(&dword_235D0B000, v32, v33, "De-dupped app with bundle id: %@", buf, 0xCu);
              }

              [v61 addObject:v28];
              float v16 = v16 + 1.0;
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v66 objects:v77 count:16];
        }
        while (v25);
      }

      [v60 removeResultsInArray:v61];
      [v60 removeResultsInArray:v21];
      [v60 setHiddenExtResults:v61];

LABEL_35:
      if ([v60 domain] != 1) {
        [v60 setDomain:2];
      }
    }
    uint64_t v58 = [(NSArray *)obj countByEnumeratingWithState:&v70 objects:v78 count:16];
  }
  while (v58);
LABEL_41:

  *(float *)&double v34 = v16;
  [(PRSRankingConfiguration *)self->_rankingInfo setNumAppsDeduped:v34];
  if (self->_canceled) {
    v35 = "finish_canceled";
  }
  else {
    v35 = "finished";
  }
  query_analytics_log_timing(WeakRetained, v35, "parsec", self->_startTime);
  if (!self->_canceled)
  {
    v36 = SPLogForSPLogCategoryDefault();
    os_log_type_t v37 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v36, v37))
    {
      id v38 = (id)objc_opt_class();
      qos_class_t v39 = qos_class_self();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v38;
      __int16 v75 = 1024;
      LODWORD(v76) = v39;
      _os_log_impl(&dword_235D0B000, v36, v37, "QOS %@ finished: %d", buf, 0x12u);
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v40 = +[SPQueryTask queryQueue];
    qos_class_t v41 = qos_class_self();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__SPParsecQuery_finished__block_invoke;
    block[3] = &unk_264C76AB8;
    objc_copyWeak(&v65, (id *)buf);
    id v64 = WeakRetained;
    dispatch_block_t v42 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v41, 0, block);
    dispatch_async(v40, v42);

    objc_destroyWeak(&v65);
    objc_destroyWeak((id *)buf);
  }
  v43 = SPLogForSPLogCategoryDefault();
  os_log_type_t v44 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v43, v44))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235D0B000, v43, v44, "#query parsec done", buf, 2u);
  }

  v45 = SPLogForSPLogCategoryDefault();
  os_log_type_t v46 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v45, v46))
  {
    v47 = [WeakRetained query];
    v48 = [v47 queryContext];
    v49 = [v48 searchString];
    v50 = [*(id *)((char *)&self->super.super.isa + v54) valueForKey:@"title"];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v49;
    __int16 v75 = 2112;
    v76 = v50;
    _os_log_impl(&dword_235D0B000, v45, v46, "Parsec query: %@ returned results: %@", buf, 0x16u);
  }
  pthread_mutex_lock(&self->_parsecQueryTaskMutex);
  parsecQueryTask = self->_parsecQueryTask;
  if (parsecQueryTask)
  {
    [(PRSQueryTask *)parsecQueryTask invalidateHandler];
    v52 = self;
    v53 = self->_parsecQueryTask;
  }
  else
  {
    v53 = 0;
    v52 = self;
  }
  v52->_parsecQueryTask = 0;

  pthread_mutex_unlock(&self->_parsecQueryTaskMutex);
  objc_storeWeak((id *)&self->_resultPipe, 0);
  atomic_fetch_add(&sOutstandingQueries, 0xFFFFFFFF);
}

void __25__SPParsecQuery_finished__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_log_type_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F78D80]), "initWithQueryID:sections:", objc_msgSend(WeakRetained, "queryGroupId"), WeakRetained[48]);
    id v4 = [WeakRetained responseHandler];
    ((void (**)(void, void *))v4)[2](v4, v3);

    double v5 = SPLogForSPLogCategoryDefault();
    os_log_type_t v6 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, v5, v6, "#query parsec sending results", buf, 2u);
    }

    [*(id *)(a1 + 32) externalID];
    kdebug_trace();
    os_log_type_t v7 = SPLogForSPLogCategoryTelemetry();
    unsigned int v8 = [*(id *)(a1 + 32) externalID];
    if (v8)
    {
      unsigned int v9 = v8;
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)v10 = 0;
        _os_signpost_emit_with_name_impl(&dword_235D0B000, v7, OS_SIGNPOST_INTERVAL_END, v9, "parsecLatency", " enableTelemetry=YES ", v10, 2u);
      }
    }
  }
}

- (void)queryDidFinishLoading:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v6 = *(_OWORD *)(v5 + 16);
  long long v18 = *(_OWORD *)v5;
  long long v19 = v6;
  uint64_t v20 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v7;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = v9;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "-[SPParsecQuery queryDidFinishLoading:]";
  si_tracing_log_span_begin();
  id location = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__SPParsecQuery_queryDidFinishLoading___block_invoke;
  v13[3] = &unk_264C77048;
  objc_copyWeak(&v16, &location);
  id v14 = v4;
  uint64_t v15 = self;
  id v11 = v4;
  dispatch_async(queue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  si_tracing_log_span_end();

  long long v12 = v19;
  *(_OWORD *)uint64_t v5 = v18;
  *(_OWORD *)(v5 + 16) = v12;
  *(void *)(v5 + 32) = v20;
}

void __39__SPParsecQuery_queryDidFinishLoading___block_invoke(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  os_log_type_t v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[265])
  {
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 200));
    id v4 = *(void **)(a1 + 32);
    if (v4 == *((void **)v3 + 47))
    {
      uint64_t v5 = objc_msgSend(v4, "category_stats");
      long long v6 = (void *)*((void *)v3 + 35);
      *((void *)v3 + 35) = v5;

      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "server_features");
      unsigned int v8 = (void *)*((void *)v3 + 36);
      *((void *)v3 + 36) = v7;

      v3[267] = 1;
      uint64_t v9 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __39__SPParsecQuery_queryDidFinishLoading___block_invoke_cold_1(v9);
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v3 + 200));
    if (v3[267])
    {
      v10 = +[SPQueryTask queryQueue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __39__SPParsecQuery_queryDidFinishLoading___block_invoke_101;
      v11[3] = &unk_264C77070;
      void v11[4] = *(void *)(a1 + 40);
      long long v12 = v3;
      dispatch_async(v10, v11);
    }
  }
}

void __39__SPParsecQuery_queryDidFinishLoading___block_invoke_101(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) resultPipe];
  [v2 storeWillComplete:*(void *)(a1 + 40)];
}

- (void)_setScore:(SPParsecQuery *)self forResult:(SEL)a2
{
  objc_msgSend(v2, "setScore:");
}

- (void)geoUserSessionEntityString:(id)a3
{
  id v4 = a3;
  id v5 = [(SPParsecQuery *)self resultPipe];
  [v5 setGeoUserSessionEntityString:v4];
}

- (id)findLocalCopies:(id)a3 alternativeResults:(id)a4 withQueryString:(id)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v45 = v9;
    v47 = v8;
    v52 = objc_opt_new();
    uint64_t v54 = objc_opt_new();
    uint64_t v53 = objc_opt_new();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v46 = v7;
    id obj = v7;
    uint64_t v50 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (!v50) {
      goto LABEL_24;
    }
    uint64_t v49 = *(void *)v65;
    uint64_t v10 = *MEMORY[0x263F78F50];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v65 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = v11;
        long long v12 = *(void **)(*((void *)&v64 + 1) + 8 * v11);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v13 = [v12 results];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v61 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              long long v19 = [v18 sectionBundleIdentifier];
              if ([v19 isEqualToString:v10])
              {
                disabledAppSet = self->_disabledAppSet;
                uint64_t v21 = [v18 applicationBundleIdentifier];
                LOBYTE(disabledAppSet) = [(NSSet *)disabledAppSet containsObject:v21];

                if ((disabledAppSet & 1) == 0)
                {
                  v22 = [v18 title];
                  BOOL v23 = [v22 text];
                  [v54 addObject:v23];

                  v24 = [v18 applicationBundleIdentifier];
                  uint64_t v25 = (void *)v53;
LABEL_19:
                  [v25 addObject:v24];

                  continue;
                }
              }
              else
              {
              }
              if (objc_opt_respondsToSelector())
              {
                uint64_t v26 = [v18 storeIdentifier];

                if (v26)
                {
                  v24 = [v18 storeIdentifier];
                  uint64_t v25 = v52;
                  goto LABEL_19;
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v60 objects:v69 count:16];
          }
          while (v15);
        }

        ++v11;
      }
      while (v51 + 1 != v50);
      uint64_t v50 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v50);
LABEL_24:

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v27 = v47;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v57;
      uint64_t v31 = *MEMORY[0x263F78F50];
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v57 != v30) {
            objc_enumerationMutation(v27);
          }
          os_log_type_t v33 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          double v34 = [v33 sectionBundleIdentifier];
          if ([v34 isEqualToString:v31])
          {
            v35 = self->_disabledAppSet;
            v36 = [v33 applicationBundleIdentifier];
            LOBYTE(v35) = [(NSSet *)v35 containsObject:v36];

            if ((v35 & 1) == 0)
            {
              os_log_type_t v37 = [v33 title];
              id v38 = [v37 text];
              [v54 addObject:v38];

              qos_class_t v39 = [v33 applicationBundleIdentifier];
              v40 = (void *)v53;
LABEL_36:
              [v40 addObject:v39];

              continue;
            }
          }
          else
          {
          }
          if (objc_opt_respondsToSelector())
          {
            qos_class_t v41 = [v33 storeIdentifier];

            if (v41)
            {
              qos_class_t v39 = [v33 storeIdentifier];
              v40 = v52;
              goto LABEL_36;
            }
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v29);
    }

    if ([v52 count] || objc_msgSend(v54, "count"))
    {
      dispatch_block_t v42 = (void *)v53;
      id v9 = v45;
      v43 = [(SPParsecQuery *)self findLocalCopies:v54 appIdentifiers:v53 adamIDs:v52 alternativeResults:v27 withQueryString:v45];
      id v7 = v46;
    }
    else
    {
      v43 = 0;
      id v9 = v45;
      id v7 = v46;
      dispatch_block_t v42 = (void *)v53;
    }

    id v8 = v47;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (id)findLocalCopies:(id)a3 appIdentifiers:(id)a4 adamIDs:(id)a5 alternativeResults:(id)a6 withQueryString:(id)a7
{
  v171[1] = *MEMORY[0x263EF8340];
  id v109 = a3;
  id v124 = a4;
  id v11 = a5;
  id v97 = a6;
  id v122 = a7;
  long long v12 = objc_opt_new();
  v96 = v11;
  v107 = _makeQueryStringForField(@"kMDItemAdamID", v11);
  v106 = _makeQueryStringForField(@"kMDItemDisplayName", v109);
  v105 = _makeQueryStringForField(@"kMDItemAlternateNames", v109);
  if (v106 && v105)
  {
    id v13 = [&stru_26E92AFF0 stringByAppendingFormat:@"(%@) || (%@)", v106, v105];
    uint64_t v14 = v13;
    if (!v107)
    {
      uint64_t v15 = v13;
      goto LABEL_8;
    }
    uint64_t v15 = [(__CFString *)v13 stringByAppendingString:@" || "];

    goto LABEL_6;
  }
  uint64_t v15 = &stru_26E92AFF0;
  if (v107)
  {
LABEL_6:
    uint64_t v16 = v15;
    uint64_t v15 = [(__CFString *)v15 stringByAppendingFormat:@"(%@)", v107];
  }
LABEL_8:
  if ([(__CFString *)v15 length])
  {
    v108 = v15;
  }
  else
  {

    v108 = @"false";
  }
  v110 = [(SPParsecQuery *)self resultPipe];
  int v17 = [v110 query];
  uint64_t v18 = [v17 hash];

  id v19 = objc_alloc(MEMORY[0x263F78D58]);
  uint64_t v20 = [v110 query];
  uint64_t v21 = [v20 queryContext];
  v22 = [v21 keyboardLanguage];
  BOOL v23 = [v110 query];
  v24 = [v23 queryContext];
  uint64_t v25 = -v18;
  [v24 currentTime];
  v104 = objc_msgSend(v19, "initWithSearchString:queryID:language:currentTime:", v122, v25, v22);

  uint64_t v26 = [v110 query];
  id v27 = [v26 queryContext];
  uint64_t v28 = [v27 queryKind];
  uint64_t v29 = [v110 query];
  uint64_t v30 = [v29 queryContext];
  uint64_t v31 = [v30 keyboardLanguage];
  LOBYTE(v90) = 0;
  v113 = [v104 rankingConfigurationWithMeContact:0 emailAddresses:0 phoneFavorites:0 vipList:0 clientBundle:*MEMORY[0x263F78FE0] isScopedSearch:0 spotlightQuery:v108 userQuery:v122 tokenString:0 queryKind:v28 isPeopleSearch:v90 keyboardLanguage:v31];

  id v111 = objc_alloc_init(MEMORY[0x263F02AD0]);
  [v111 setQueryID:v25];
  v171[0] = *MEMORY[0x263F08098];
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v171 count:1];
  [v111 setProtectionClasses:v32];

  [v111 setEntitledAttributes:1];
  os_log_type_t v33 = rankingPrefetchedAttributesArray();
  [v111 setFetchAttributes:v33];

  double v34 = [v113 rankingQueries];
  [v111 setRankingQueries:v34];

  uint64_t v123 = *MEMORY[0x263F674E0];
  uint64_t v170 = *MEMORY[0x263F674E0];
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v170 count:1];
  [v111 setBundleIDs:v35];

  [v111 setPriorityIndexQuery:1];
  v36 = [v110 query];
  os_log_type_t v37 = [v36 queryContext];
  [v37 currentTime];
  double v39 = v38;

  if (findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__onceToken != -1) {
    dispatch_once(&findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__onceToken, &__block_literal_global_8);
  }
  v40 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:66307 valueOptions:0 capacity:256];
  v112 = [v111 fetchAttributes];
  uint64_t v41 = [v112 count];
  v103 = [v110 query];
  dispatch_block_t v42 = [v103 queryContext];
  [v42 currentTime];
  uint64_t v44 = v43;

  v164[0] = 0;
  v164[1] = v164;
  v164[2] = 0x2020000000;
  char v165 = 0;
  v162[0] = 0;
  v162[1] = v162;
  v162[2] = 0x2020000000;
  char v163 = 0;
  id v45 = (void *)[(NSSet *)self->_disabledAppSet copy];
  v157[0] = MEMORY[0x263EF8330];
  v157[1] = 3221225472;
  v157[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2;
  v157[3] = &unk_264C770C0;
  id v119 = v45;
  id v158 = v119;
  uint64_t v161 = v44;
  id v46 = v40;
  id v159 = v46;
  v160 = v162;
  v100 = (void *)MEMORY[0x237DF3D40](v157);
  v47 = dispatch_group_create();
  dispatch_group_enter(v47);
  id v48 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v49 = objc_opt_new();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (v41)
  {
    for (uint64_t i = 0; i != v41; ++i)
    {
      v52 = [v113 requiredAttributes];
      uint64_t v53 = [v112 objectAtIndexedSubscript:i];
      int v54 = [v52 containsObject:v53];

      if (v54) {
        [v48 addIndex:i];
      }
    }
  }
  v55 = [v111 fetchAttributes];
  v155[0] = 0;
  v155[1] = v155;
  v155[2] = 0x2020000000;
  char v156 = 0;
  v145[0] = MEMORY[0x263EF8330];
  v145[1] = 3221225472;
  v145[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3;
  v145[3] = &unk_264C77110;
  id v93 = v46;
  id v146 = v93;
  id v95 = v55;
  id v147 = v95;
  id v94 = v48;
  id v148 = v94;
  id v91 = v124;
  id v149 = v91;
  id v92 = v12;
  id v150 = v92;
  id v102 = v49;
  id v151 = v102;
  v153 = v155;
  long long v56 = v47;
  v152 = v56;
  CFAbsoluteTime v154 = Current;
  long long v57 = (void *)MEMORY[0x237DF3D40](v145);
  v140[0] = MEMORY[0x263EF8330];
  v140[1] = 3221225472;
  v140[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_161;
  v140[3] = &unk_264C77138;
  v143 = v162;
  v144 = v155;
  id v98 = v57;
  id v142 = v98;
  dispatch_group_t group = v56;
  dispatch_group_t v141 = group;
  v99 = (void *)MEMORY[0x237DF3D40](v140);
  long long v58 = (void *)[objc_alloc(MEMORY[0x263F02AC8]) initWithQueryString:v108 queryContext:v111];
  v114 = v58;
  if (v58)
  {
    *(void *)id location = 0;
    objc_initWeak((id *)location, self);
    v136[0] = MEMORY[0x263EF8330];
    v136[1] = 3221225472;
    v136[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_164;
    v136[3] = &unk_264C77188;
    v138 = v164;
    objc_copyWeak(&v139, (id *)location);
    id v137 = v100;
    [v58 setFoundItemsHandler:v136];
    v133[0] = MEMORY[0x263EF8330];
    v133[1] = 3221225472;
    v133[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_4_166;
    v133[3] = &unk_264C771D8;
    objc_copyWeak(&v135, (id *)location);
    id v134 = v98;
    [v58 setPriorityGatherEndedHandler:v133];
    v130[0] = MEMORY[0x263EF8330];
    v130[1] = 3221225472;
    v130[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_6;
    v130[3] = &unk_264C77200;
    objc_copyWeak(&v132, (id *)location);
    id v131 = v99;
    [v58 setCompletionHandler:v130];
    [v58 start];

    objc_destroyWeak(&v132);
    objc_destroyWeak(&v135);

    objc_destroyWeak(&v139);
    objc_destroyWeak((id *)location);
    long long v59 = group;
  }
  else
  {
    long long v59 = group;
    dispatch_group_leave(group);
  }
  dispatch_time_t v60 = dispatch_time(0, 500000000);
  dispatch_group_wait(v59, v60);
  id v115 = [v102 allValues];
  unint64_t v117 = 0;
LABEL_22:
  if ([v115 count] > v117)
  {
    v116 = objc_msgSend(v115, "objectAtIndexedSubscript:");
    long long v61 = [v116 results];
    long long v62 = (void *)[v61 copy];

    v118 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v62, "count"));
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id obj = v62;
    uint64_t v63 = [obj countByEnumeratingWithState:&v126 objects:v169 count:16];
    if (!v63) {
      goto LABEL_46;
    }
    uint64_t v125 = *(void *)v127;
    while (1)
    {
      for (uint64_t j = 0; j != v63; ++j)
      {
        if (*(void *)v127 != v125) {
          objc_enumerationMutation(obj);
        }
        long long v65 = *(void **)(*((void *)&v126 + 1) + 8 * j);
        long long v66 = [v65 bundleID];
        if ([v66 isEqualToString:v123])
        {
          long long v67 = [v65 identifier];
          int v68 = [v119 containsObject:v67];

          if (v68)
          {
            long long v69 = SPLogForSPLogCategoryDefault();
            os_log_type_t v70 = 2 * (*MEMORY[0x263F67540] == 0);
            if (os_log_type_enabled(v69, v70))
            {
              id v71 = [v65 identifier];
              uint64_t v72 = [v71 UTF8String];
              *(_DWORD *)id location = 136315138;
              *(void *)&location[4] = v72;
              _os_log_impl(&dword_235D0B000, v69, v70, "[ProtectedApps] skipping local copy for disabled app %s", location, 0xCu);
            }
            goto LABEL_44;
          }
        }
        else
        {
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
        v74 = [WeakRetained query];
        __int16 v75 = [v74 queryContext];
        long long v69 = [v65 resultWithTime:v122 searchString:0 isCorrectedQuery:v75 withQueryContext:v39];

        if (v69)
        {
          [v69 setType:26];
          v76 = [v65 rankingItem];
          v77 = [v76 L2FeatureVector];
          if (v65) {
            BOOL v78 = v77 == 0;
          }
          else {
            BOOL v78 = 1;
          }
          int v79 = !v78;

          if (v79)
          {
            v166[0] = @"score";
            v80 = NSNumber;
            [v76 score];
            v81 = objc_msgSend(v80, "numberWithFloat:");
            v167[0] = v81;
            v166[1] = @"raw score";
            v82 = NSNumber;
            [v76 rawScore];
            v83 = objc_msgSend(v82, "numberWithFloat:");
            v167[1] = v83;
            v166[2] = @"original score";
            v84 = NSNumber;
            v85 = [v76 L2FeatureVector];
            [v85 originalL2Score];
            v86 = objc_msgSend(v84, "numberWithFloat:");
            v167[2] = v86;
            v87 = [NSDictionary dictionaryWithObjects:v167 forKeys:v166 count:3];
            [v69 setLocalFeatures:v87];
          }
          [v118 addObject:v69];
          v88 = [v65 rankingItem];
          [v88 score];
          -[NSObject setL2score:](v69, "setL2score:");
        }
        [v65 clearClientData];
LABEL_44:
      }
      uint64_t v63 = [obj countByEnumeratingWithState:&v126 objects:v169 count:16];
      if (!v63)
      {
LABEL_46:

        [v116 setResults:v118];
        ++v117;
        long long v58 = v114;
        goto LABEL_22;
      }
    }
  }

  _Block_object_dispose(v155, 8);
  _Block_object_dispose(v162, 8);
  _Block_object_dispose(v164, 8);

  return v115;
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F08080];
  v4[0] = *MEMORY[0x263F080B0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F08098];
  v4[2] = *MEMORY[0x263F08088];
  v4[3] = v1;
  v4[4] = *MEMORY[0x263F080A0];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  os_log_type_t v3 = (void *)findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__protectionClasses;
  findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__protectionClasses = v2;
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a2;
  uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v31;
    uint64_t v5 = *MEMORY[0x263F674E0];
    uint64_t v28 = *MEMORY[0x263F01E20];
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v26 = *MEMORY[0x263F674E0];
    do
    {
      uint64_t v6 = 0;
      uint64_t v25 = v3;
      do
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        id v8 = objc_msgSend(v7, "bundleID", allocator);
        if ([v8 isEqualToString:v5])
        {
          id v9 = *(void **)(a1 + 32);
          uint64_t v10 = [v7 uniqueIdentifier];
          LOBYTE(v9) = [v9 containsObject:v10];

          if (v9) {
            goto LABEL_22;
          }
        }
        else
        {
        }
        id v11 = [v7 attributeSet];
        long long v12 = [v11 attributeDictionary];
        id v13 = [v12 objectForKey:v28];
        uint64_t v14 = (const void *)[v13 UTF8String];

        if (v14)
        {
          uint64_t v15 = [v7 attributeSet];
          uint64_t v16 = [v15 expirationDate];

          if (!v16 || ([v16 timeIntervalSinceReferenceDate], v17 >= *(double *)(a1 + 56)))
          {
            uint64_t v18 = v4;
            id v19 = SPResultValueItemCreate2(v7);
            os_unfair_lock_lock((os_unfair_lock_t)&findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__heapLock);
            uint64_t v20 = NSMapGet(*(NSMapTable **)(a1 + 40), v14);
            if (!v20)
            {
              uint64_t v20 = CFBinaryHeapCreate(allocator, 0, &sResultArrayBinaryHeapCallbacks, 0);
              NSMapInsert(*(NSMapTable **)(a1 + 40), v14, v20);
              CFRelease(v20);
            }
            uint64_t v21 = (void *)findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__protectionClasses;
            if (!findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__protectionClasses) {
              __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_cold_1();
            }
            v22 = [v7 protection];
            if (([v21 containsObject:v22] & 1) == 0)
            {
              BOOL v23 = [v7 protection];
              if (([v23 isEqualToString:@"Priority"] & 1) == 0) {
                __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_cold_2();
              }
            }
            CFBinaryHeapAddValue((CFBinaryHeapRef)v20, v19);
            sprvreleaseCallback(0, (CFTypeRef *)v19);
            os_unfair_lock_unlock((os_unfair_lock_t)&findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__heapLock);
            uint64_t v4 = v18;
            uint64_t v3 = v25;
          }

          uint64_t v5 = v26;
        }

LABEL_22:
        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v3);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v76 = *MEMORY[0x263EF8340];
  memset(&v72, 0, sizeof(v72));
  NSEnumerateMapTable(&v72, *(NSMapTable **)(a1 + 32));
  os_log_type_t v70 = 0;
  id v71 = 0;
  if (NSNextMapEnumeratorPair(&v72, &v70, (void **)&v71))
  {
    int v51 = 0;
    uint64_t v49 = v62;
    uint64_t v2 = *MEMORY[0x263F01F98];
    uint64_t v53 = v1;
    uint64_t v48 = v2;
    while (1)
    {
      CFIndex Count = CFBinaryHeapGetCount(v71);
      id v4 = [NSString alloc];
      id v5 = (id)[v4 initWithCString:v70 encoding:4];
      v45[1] = v45;
      bzero((char *)v45 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0), 8 * Count);
      int v54 = (const void **)((char *)v45 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
      CFBinaryHeapGetValues(v71, v54);
      uint64_t v6 = SPL1Threshold();
      unint64_t v46 = v7;
      uint64_t v47 = v6;
      if (Count >= 1) {
        break;
      }
LABEL_36:

      if (!NSNextMapEnumeratorPair(&v72, &v70, (void **)&v71)) {
        goto LABEL_39;
      }
    }
    uint64_t v8 = 0;
    CFIndex v50 = Count;
    id v52 = v5;
    while (1)
    {
      id v9 = v54[v8];
      uint64_t v10 = *((void *)v9 + 3);
      uint64_t v56 = *((void *)v9 + 2);
      uint64_t v57 = v10;
      id v11 = *((id *)v9 + 4);
      id v59 = *((id *)v9 + 8);
      id v58 = [v59 attributeSet];
      long long v12 = [v58 attributeDictionary];
      id v13 = [v12 objectForKey:v2];
      objc_opt_class();
      id v60 = v13;
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id v21 = v59;
LABEL_35:

      if (++v8 == Count) {
        goto LABEL_36;
      }
    }
    id v55 = v11;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v14 = [*(id *)(v1 + 40) objectsAtIndexes:*(void *)(v1 + 48)];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v67 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = [v12 objectForKey:*(void *)(*((void *)&v66 + 1) + 8 * i)];

          if (v20) {
            ++v17;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v16);
    }

    uint64_t v22 = SSCompactRankingAttrsAlloc();
    uint64_t v1 = v53;
    BOOL v23 = *(void **)(v53 + 48);
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v62[0] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_4;
    v62[1] = &unk_264C770E8;
    id v63 = v12;
    id v64 = *(id *)(v1 + 40);
    uint64_t v65 = v22;
    [v23 enumerateIndexesUsingBlock:v61];
    v24 = (void *)[objc_alloc(MEMORY[0x263F78D48]) initWithAttrs:v22 isServerAlternativeResult:1];
    id v5 = v52;
    if ([v52 isEqualToString:@"com.apple.application"])
    {
      uint64_t v25 = *(void **)(v1 + 56);
      uint64_t v26 = [v24 identifier];
      if (![v25 containsObject:v26])
      {
        id v11 = v55;
LABEL_33:
        id v21 = v59;

        goto LABEL_34;
      }
      id v27 = *(void **)(v1 + 64);
      uint64_t v28 = [v24 identifier];
      LOBYTE(v27) = [v27 containsObject:v28];

      if (v27)
      {
        id v5 = v52;
        id v11 = v55;
        id v21 = v59;
LABEL_34:

        uint64_t v2 = v48;
        CFIndex Count = v50;
        goto LABEL_35;
      }
      uint64_t v29 = *(void **)(v1 + 64);
      long long v30 = [v24 identifier];
      [v29 addObject:v30];

      id v5 = v52;
    }
    uint64_t v26 = [[SPSearchCSResult alloc] initWithRankingItem:v24 clientData:v9];
    unint64_t v31 = v56;
    long long v32 = v24;
    unint64_t v33 = v57;
    -[SPSearchResult setScore:](v26, "setScore:", v56, v57);
    double v34 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:*((double *)v9 + 5)];
    [(SPSearchResult *)v26 setInterestingDate:v34];

    [(SPSearchResult *)v26 setBundleID:v5];
    id v11 = v55;
    [(SPSearchResult *)v26 setDataclass:v55];
    BOOL v35 = __PAIR128__(v33, v31) >= __PAIR128__(v46, v47);
    v24 = v32;
    if (!v35) {
      [v32 setEligibleForDemotion:1];
    }
    int v36 = [v60 hasPrefix:@"com.apple.siri."];
    uint64_t v1 = v53;
    if (v36)
    {
      os_log_type_t v37 = [(SPSearchResult *)v26 rankingItem];
      double v38 = [v37 L2FeatureVector];
      [v38 setIsSiriAction:1];

      id v11 = v55;
    }
    double v39 = [*(id *)(v1 + 72) objectForKey:v5];
    if (!v39)
    {
      double v39 = objc_opt_new();
      [v39 setDomain:1];
      [v39 setBundleIdentifier:v5];
      if ([v5 isEqualToString:@"com.apple.application"])
      {
        v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v41 = [v40 localizedStringForKey:@"DOMAIN_APPLICATION" value:&stru_26E92AFF0 table:@"Search"];
        [v39 setTitle:v41];

        id v5 = v52;
      }
      else
      {
        v40 = [MEMORY[0x263F67470] displayNameForBundleIdentifer:v5];
        [v39 setTitle:v40];
      }

      [*(id *)(v1 + 72) setObject:v39 forKey:v5];
      id v11 = v55;
    }
    [v39 addResults:v26];
    ++v51;

    goto LABEL_33;
  }
  int v51 = 0;
LABEL_39:
  *(unsigned char *)(*(void *)(*(void *)(v1 + 88) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 80));
  double v42 = CFAbsoluteTimeGetCurrent() - *(double *)(v1 + 96);
  uint64_t v43 = SPLogForSPLogCategoryDefault();
  uint64_t v44 = v43;
  if (v42 * 1000000000.0 <= 500000000.0)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v74 = v42;
      _os_log_impl(&dword_235D0B000, v44, OS_LOG_TYPE_DEFAULT, "Local copy query took %lf seconds", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3_cold_1(v51, v44, v42);
  }
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  id v5 = [v2 objectForKey:v3];

  id v4 = v5;
  if (v5)
  {
    SSCompactRankingAttrsInsertValue();
    id v4 = v5;
  }
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_161(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && !v3
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v3 = 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v4 = v3;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    id v3 = v4;
  }
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_164(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[42];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3_165;
    v7[3] = &unk_264C77160;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3_165(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_4_166(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[42];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_5;
    block[3] = &unk_264C771B0;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);
  }
}

uint64_t __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[42];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_7;
    v7[3] = &unk_264C77160;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)query:(id)a3 didFinishWithResults:(id)a4 withSuggestions:(id)a5 withCorrections:(id)a6 withAlternativeResults:(id)a7 suggestionsAreBlended:(BOOL)a8
{
  uint64_t v227 = *MEMORY[0x263EF8340];
  id v176 = a3;
  id v12 = a4;
  id v132 = a5;
  id v131 = a6;
  id v137 = a7;
  uint64_t v129 = [v12 count];
  uint64_t v161 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v129];
  v175 = objc_opt_new();
  v171 = objc_opt_new();
  uint64_t v170 = objc_opt_new();
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  id obj = v12;
  uint64_t v155 = [obj countByEnumeratingWithState:&v214 objects:v226 count:16];
  if (v155)
  {
    uint64_t v152 = *(void *)v215;
    uint64_t v149 = *MEMORY[0x263F79108];
    uint64_t v145 = *MEMORY[0x263F79070];
    uint64_t v140 = *MEMORY[0x263F790B8];
    uint64_t v142 = *MEMORY[0x263F79078];
    id v138 = (id)*MEMORY[0x263F790B0];
    uint64_t v135 = *MEMORY[0x263F79080];
    uint64_t v133 = *MEMORY[0x263F79088];
    uint64_t v127 = *MEMORY[0x263F79090];
    uint64_t v124 = *MEMORY[0x263F79098];
    uint64_t v158 = *MEMORY[0x263F78F50];
    do
    {
      for (uint64_t i = 0; i != v155; ++i)
      {
        if (*(void *)v215 != v152) {
          objc_enumerationMutation(obj);
        }
        v166 = *(void **)(*((void *)&v214 + 1) + 8 * i);
        v172 = [v166 bundleIdentifier];
        if (([v172 isEqualToString:v149] & 1) != 0
          || ([v172 isEqualToString:v145] & 1) != 0
          || ([v172 isEqualToString:v142] & 1) != 0
          || ([v172 isEqualToString:v140] & 1) != 0
          || ([v172 isEqualToString:v138] & 1) != 0
          || ([v172 isEqualToString:v135] & 1) != 0
          || ([v172 hasPrefix:@"com.apple.parsec.itunes."] & 1) != 0
          || ([v172 isEqualToString:v133] & 1) != 0
          || ([v172 isEqualToString:v127] & 1) != 0
          || ([v172 isEqualToString:v124] & 1) != 0
          || [v172 isEqualToString:v158])
        {
          [v161 setObject:v166 forKey:v172];
        }
        if ([v172 isEqualToString:v158])
        {
          id v13 = [MEMORY[0x263F089C8] indexSet];
          long long v212 = 0u;
          long long v213 = 0u;
          long long v210 = 0u;
          long long v211 = 0u;
          uint64_t v14 = [v166 results];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v210 objects:v225 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v211;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v211 != v16) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v18 = *(void **)(*((void *)&v210 + 1) + 8 * j);
                disabledAppSet = self->_disabledAppSet;
                uint64_t v20 = [v18 applicationBundleIdentifier];
                LODWORD(disabledAppSet) = [(NSSet *)disabledAppSet containsObject:v20];

                if (disabledAppSet)
                {
                  [v13 addIndex:0];
                }
                else
                {
                  id v21 = [v18 title];
                  uint64_t v22 = [v21 text];
                  if (v22)
                  {
                    BOOL v23 = [v18 applicationBundleIdentifier];
                    BOOL v24 = v23 == 0;

                    if (!v24)
                    {
                      uint64_t v25 = [v18 title];
                      uint64_t v26 = [v25 text];
                      [v171 addObject:v26];

                      id v27 = [v18 applicationBundleIdentifier];
                      [v170 addObject:v27];
                    }
                  }
                  else
                  {
                  }
                }
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v210 objects:v225 count:16];
            }
            while (v15);
          }

          if ([v13 count])
          {
            uint64_t v28 = [MEMORY[0x263EFF980] array];
            uint64_t v29 = [v166 results];
            v207[0] = MEMORY[0x263EF8330];
            v207[1] = 3221225472;
            v207[2] = __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke;
            v207[3] = &unk_264C77228;
            id v13 = v13;
            id v208 = v13;
            id v30 = v28;
            id v209 = v30;
            [v29 enumerateObjectsUsingBlock:v207];

            if ([v30 count])
            {
              unint64_t v31 = (void *)[objc_alloc(MEMORY[0x263F78D70]) initWithResultSection:v166];
              long long v32 = [MEMORY[0x263EFF9B0] orderedSetWithArray:v30];
              [v31 setResultSet:v32];

              [v161 setObject:v31 forKey:v158];
            }
            else
            {
              [v161 removeObjectForKey:v158];
            }
          }
        }
        else
        {
          long long v205 = 0u;
          long long v206 = 0u;
          long long v203 = 0u;
          long long v204 = 0u;
          id v13 = [v166 results];
          uint64_t v33 = [v13 countByEnumeratingWithState:&v203 objects:v224 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v204;
            do
            {
              for (uint64_t k = 0; k != v33; ++k)
              {
                if (*(void *)v204 != v34) {
                  objc_enumerationMutation(v13);
                }
                int v36 = *(void **)(*((void *)&v203 + 1) + 8 * k);
                if (objc_opt_respondsToSelector())
                {
                  os_log_type_t v37 = [v36 storeIdentifier];
                  BOOL v38 = v37 == 0;

                  if (!v38)
                  {
                    double v39 = [v36 storeIdentifier];
                    [v175 addObject:v39];
                  }
                }
              }
              uint64_t v33 = [v13 countByEnumeratingWithState:&v203 objects:v224 count:16];
            }
            while (v33);
          }
        }
      }
      uint64_t v155 = [obj countByEnumeratingWithState:&v214 objects:v226 count:16];
    }
    while (v155);
  }

  if ([v175 count]) {
    BOOL v40 = 1;
  }
  else {
    BOOL v40 = [v171 count] != 0;
  }
  uint64_t v41 = *MEMORY[0x263F78F50];
  double v42 = [v161 objectForKey:*MEMORY[0x263F78F50]];

  if (v42) {
    BOOL v43 = 0;
  }
  else {
    BOOL v43 = v40;
  }
  if (v43)
  {
    uint64_t v44 = [MEMORY[0x263F78D70] mutableSectionWithBundleId:v41];
    [v161 setObject:v44 forKey:v41];
  }
  id v45 = [v161 allKeys];
  v144 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v129];
  int v167 = SSEnableSpotlightTopHitPersonalizedRanking();
  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id v139 = v45;
  uint64_t v163 = [v139 countByEnumeratingWithState:&v199 objects:v223 count:16];
  if (!v163)
  {
    v143 = 0;
    goto LABEL_84;
  }
  v143 = 0;
  uint64_t v46 = *(void *)v200;
  uint64_t v150 = *MEMORY[0x263F79078];
  do
  {
    for (uint64_t m = 0; m != v163; ++m)
    {
      if (*(void *)v200 != v46) {
        objc_enumerationMutation(v139);
      }
      uint64_t v48 = *(void **)(*((void *)&v199 + 1) + 8 * m);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
      CFIndex v50 = [WeakRetained query];
      char v51 = [v50 cancelled];

      if (v51)
      {
        long long v68 = v139;
        goto LABEL_157;
      }
      v173 = [v161 objectForKey:v48];
      if (v167)
      {
        id v52 = (void *)MEMORY[0x263F78E28];
        uint64_t v53 = [v176 queryContext];
        [v53 currentTime];
        objc_msgSend(v52, "prepareServerSectionRankingItemsForTopHitNomination:currentTime:", v173);
      }
      if ([v48 isEqualToString:v41])
      {
        int v54 = [v176 queryString];
        uint64_t v55 = [(SPParsecQuery *)self findLocalCopies:v171 appIdentifiers:v170 adamIDs:v175 alternativeResults:v137 withQueryString:v54];

        v143 = (void *)v55;
      }
      else
      {
        int v54 = (void *)[objc_alloc(MEMORY[0x263F78D70]) initWithResultSection:v173];
        if (_os_feature_enabled_impl())
        {
          if ([v48 isEqualToString:v150])
          {
            uint64_t v56 = [(SPParsecQuery *)self mapsParsecRanker];
            BOOL v57 = v56 == 0;

            if (!v57)
            {
              id v58 = SPLogForSPLogCategoryDefault();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_235D0B000, v58, OS_LOG_TYPE_DEFAULT, "Geo personalization enabled, reranking geo results with local signals", buf, 2u);
              }

              id v59 = [v173 results];
              id v60 = -[SPParsecQuery rerankMapsResultsWithLocalSignals:forQueryId:](self, "rerankMapsResultsWithLocalSignals:forQueryId:", v59, [v176 queryIdent]);
              [v54 setResults:v60];
            }
          }
        }
        if (v167)
        {
          long long v61 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            long long v62 = [v54 bundleIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v62;
            _os_log_impl(&dword_235D0B000, v61, OS_LOG_TYPE_DEFAULT, "TopHit nomination for server results based on local engagement and personalization signals. Server section: %@", buf, 0xCu);
          }
          id v63 = (void *)MEMORY[0x263F78E28];
          v153 = [v176 queryString];
          id v159 = [(SPParsecQuery *)self resultPipe];
          char v156 = [v159 query];
          id v64 = [v156 queryContext];
          uint64_t v65 = [v64 keyboardLanguage];
          long long v66 = [v176 queryContext];
          [v66 currentTime];
          long long v67 = objc_msgSend(v63, "nominateServerTopHitForSection:queryString:language:currentTime:", v54, v153, v65);
          [v54 setResults:v67];
        }
        [v144 setObject:v54 forKey:v48];
      }
    }
    uint64_t v163 = [v139 countByEnumeratingWithState:&v199 objects:v223 count:16];
  }
  while (v163);
LABEL_84:

  id v146 = objc_opt_new();
  v174 = objc_opt_new();
  long long v197 = 0u;
  long long v198 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  id obja = obj;
  uint64_t v160 = [obja countByEnumeratingWithState:&v195 objects:v221 count:16];
  if (v160)
  {
    uint64_t v157 = *(void *)v196;
    uint64_t v154 = *MEMORY[0x263F790C0];
    uint64_t v69 = *MEMORY[0x263F790A8];
    uint64_t v141 = *MEMORY[0x263F79108];
    uint64_t v136 = *MEMORY[0x263F79070];
    uint64_t v134 = *MEMORY[0x263F79078];
    uint64_t v130 = *MEMORY[0x263F790B8];
    uint64_t v128 = *MEMORY[0x263F790B0];
    uint64_t v125 = *MEMORY[0x263F79080];
    uint64_t v123 = *MEMORY[0x263F79088];
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v196 != v157)
        {
          uint64_t v71 = v70;
          objc_enumerationMutation(obja);
          uint64_t v70 = v71;
        }
        uint64_t v164 = v70;
        NSMapEnumerator v72 = *(void **)(*((void *)&v195 + 1) + 8 * v70);
        v168 = objc_msgSend(v72, "bundleIdentifier", v123);
        if ([v168 isEqualToString:v154])
        {
          long long v193 = 0u;
          long long v194 = 0u;
          long long v191 = 0u;
          long long v192 = 0u;
          long long v73 = [v72 results];
          uint64_t v74 = [v73 countByEnumeratingWithState:&v191 objects:v220 count:16];
          if (v74)
          {
            uint64_t v75 = *(void *)v192;
            do
            {
              for (uint64_t n = 0; n != v74; ++n)
              {
                if (*(void *)v192 != v75) {
                  objc_enumerationMutation(v73);
                }
                uint64_t v77 = *(void *)(*((void *)&v191 + 1) + 8 * n);
                BOOL v78 = (void *)MEMORY[0x263F78E50];
                int v79 = [v176 queryContext];
                v80 = [v78 buildResultWithResult:v77 queryContext:v79];

                [v174 addObject:v80];
              }
              uint64_t v74 = [v73 countByEnumeratingWithState:&v191 objects:v220 count:16];
            }
            while (v74);
          }
        }
        else if ([v168 isEqualToString:v69])
        {
          id v151 = (void *)[objc_alloc(MEMORY[0x263F78D70]) initWithResultSection:v72];
          v81 = objc_opt_new();
          long long v189 = 0u;
          long long v190 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          v82 = [v72 results];
          uint64_t v83 = [v82 countByEnumeratingWithState:&v187 objects:v219 count:16];
          if (v83)
          {
            uint64_t v84 = *(void *)v188;
            do
            {
              for (iuint64_t i = 0; ii != v83; ++ii)
              {
                if (*(void *)v188 != v84) {
                  objc_enumerationMutation(v82);
                }
                uint64_t v86 = *(void *)(*((void *)&v187 + 1) + 8 * ii);
                v87 = (void *)MEMORY[0x263F78E50];
                v88 = [v176 queryContext];
                v89 = [v87 buildResultWithResult:v86 queryContext:v88];

                [v89 setSectionBundleIdentifier:v69];
                [v81 addObject:v89];
              }
              uint64_t v83 = [v82 countByEnumeratingWithState:&v187 objects:v219 count:16];
            }
            while (v83);
          }

          [v151 setResults:v81];
          [v146 addObject:v151];
        }
        else if (([v168 isEqualToString:v141] & 1) != 0 {
               || ([v168 isEqualToString:v136] & 1) != 0
        }
               || ([v168 isEqualToString:v134] & 1) != 0
               || ([v168 isEqualToString:v130] & 1) != 0
               || ([v168 isEqualToString:v128] & 1) != 0
               || ([v168 isEqualToString:v125] & 1) != 0
               || ([v168 hasPrefix:@"com.apple.parsec.itunes."] & 1) != 0
               || [v168 isEqualToString:v123])
        {
          uint64_t v90 = [v144 objectForKey:v168];
          if (v90) {
            [v146 addObject:v90];
          }
          else {
            [v146 addObject:v72];
          }
        }
        else
        {
          [v146 addObject:v72];
        }

        uint64_t v70 = v164 + 1;
      }
      while (v164 + 1 != v160);
      uint64_t v91 = [obja countByEnumeratingWithState:&v195 objects:v221 count:16];
      uint64_t v160 = v91;
    }
    while (v91);
  }

  if ([v143 count])
  {
    id v92 = [v146 arrayByAddingObjectsFromArray:v143];
  }
  else
  {
    id v92 = v146;
  }
  id v93 = v92;

  id v94 = [MEMORY[0x263EFF980] array];
  char v165 = objc_opt_new();
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id obj = v93;
  uint64_t v169 = [obj countByEnumeratingWithState:&v183 objects:v218 count:16];
  if (v169)
  {
    uint64_t v95 = *(void *)v184;
    do
    {
      for (juint64_t j = 0; jj != v169; ++jj)
      {
        if (*(void *)v184 != v95) {
          objc_enumerationMutation(obj);
        }
        id v97 = *(void **)(*((void *)&v183 + 1) + 8 * jj);
        id v98 = (void *)[objc_alloc(MEMORY[0x263F78D70]) initWithResultSection:v97];
        [v98 setSource:2];
        [v94 addObject:v98];
        v99 = [v97 bundleIdentifier];

        if (v99)
        {
          v100 = [v97 bundleIdentifier];
        }
        else
        {
          v101 = [v97 results];
          if (!v101) {
            goto LABEL_138;
          }
          id v102 = [v97 results];
          BOOL v103 = [v102 count] == 0;

          if (v103) {
            goto LABEL_138;
          }
          v104 = [v97 results];
          v105 = [v104 objectAtIndex:0];
          v100 = [v105 sectionBundleIdentifier];
        }
        if (v100)
        {
          [v97 setBundleIdentifier:v100];
          [v165 addObject:v100];
        }
LABEL_138:
      }
      uint64_t v169 = [obj countByEnumeratingWithState:&v183 objects:v218 count:16];
    }
    while (v169);
  }

  if (![v94 count] && !objc_msgSend(v132, "count"))
  {
    id v106 = objc_loadWeakRetained((id *)&self->_resultPipe);
    query_analytics_log_timing(v106, "finish_zero", "parsec", self->_startTime);
  }
  if (v132)
  {
    v107 = SPLogForSPLogCategoryDefault();
    os_log_type_t v108 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v107, v108))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v132;
      _os_log_impl(&dword_235D0B000, v107, v108, "Received suggestions: %@", buf, 0xCu);
    }
  }
  id v109 = [(SPParsecQuery *)self resultPipe];
  v110 = [v109 query];
  id v111 = [v110 disabledBundles];
  if ([v111 count])
  {
    v112 = (void *)MEMORY[0x263EFFA08];
    v113 = [v109 query];
    v114 = [v113 disabledBundles];
    id v115 = [v112 setWithArray:v114];
  }
  else
  {
    id v115 = 0;
  }

  if (!self->_canceled)
  {
    v116 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG)) {
      -[SPParsecQuery query:didFinishWithResults:withSuggestions:withCorrections:withAlternativeResults:suggestionsAreBlended:](v176);
    }

    unint64_t v117 = objc_msgSend(v176, "category_stats");
    [(SPParsecQuery *)self setCategory_stats:v117];

    v118 = objc_msgSend(v176, "server_features");
    [(SPParsecQuery *)self setServer_features:v118];
  }
  if ([v165 count])
  {
    id v119 = (void *)[v165 copy];
    [(SPParsecQuery *)self setParsecResultsCategoryOrder:v119];
  }
  [(SPParsecQuery *)self setQuerySuggestionResults:v174];
  self->_suggestionsAreBlended = a8;
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_189;
  block[3] = &unk_264C77250;
  objc_copyWeak(&v182, (id *)buf);
  id v121 = v94;
  id v179 = v121;
  id v122 = v115;
  id v180 = v122;
  id v181 = v176;
  dispatch_async(queue, block);
  [v109 addQueryCorrections:v131];

  objc_destroyWeak(&v182);
  objc_destroyWeak((id *)buf);

  long long v68 = v146;
LABEL_157:
}

void __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsIndex:a3])
  {
    id v6 = SPLogForSPLogCategoryDefault();
    os_log_type_t v7 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [v5 applicationBundleIdentifier];
      int v9 = 136315138;
      uint64_t v10 = [v8 UTF8String];
      _os_log_impl(&dword_235D0B000, v6, v7, "[ProtectedApps] filtered out app store result for %s", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_189(id *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[265])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = a1[4];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "bundleIdentifier", (void)v15);
          if (!v11 || ([a1[5] containsObject:v11] & 1) == 0) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    if (a1[6] == *((id *)v3 + 47))
    {
      id v12 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_189_cold_1(v4);
      }

      uint64_t v13 = [a1[6] feedbackQueryIdentifier];
      uint64_t v14 = (void *)*((void *)v3 + 37);
      *((void *)v3 + 37) = v13;

      objc_storeStrong((id *)v3 + 48, v4);
    }
    if (*((void *)v3 + 48) || !*((void *)v3 + 47)) {
      objc_msgSend(v3, "finished", (void)v15);
    }
  }
}

- (id)rerankMapsResultsWithLocalSignals:(id)a3 forQueryId:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = logForCSLogCategoryPersonalization();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  int v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "rerankMapsResultsWithLocalSignals", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v11 = [(SPParsecQuery *)self mapsParsecRanker];
  id v12 = [v11 rerankMapsResultsWithLocalSignals:v6 forQueryId:a4];

  uint64_t v13 = v10;
  uint64_t v14 = v13;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v14, OS_SIGNPOST_INTERVAL_END, v8, "rerankMapsResultsWithLocalSignals", (const char *)&unk_235D61671, v16, 2u);
  }

  return v12;
}

- (SPParsecQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6
{
  v16.receiver = self;
  v16.super_class = (Class)SPParsecQuery;
  id v6 = [(SPKQuery *)&v16 initWithUserQuery:a3 queryGroupId:a4 options:0 queryContext:a6];
  if (v6)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    os_signpost_id_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v9 = dispatch_queue_create(0, v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x263F67478] sharedInstance];
    networkConditions = v6->_networkConditions;
    v6->_networkConditions = (SDNetworkQualityInquiry *)v11;

    uint64_t v13 = objc_opt_new();
    mapsParsecRanker = v6->_mapsParsecRanker;
    v6->_mapsParsecRanker = (PRSMapsParsecRanker *)v13;

    [(SPParsecQuery *)v6 checkParsecState];
    pthread_mutex_init(&v6->_parsecQueryTaskMutex, 0);
  }
  return v6;
}

- (void)cancel
{
  self->_canceled = 1;
  id v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235D0B000, v3, v4, "#query parsec cancel", buf, 2u);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__SPParsecQuery_cancel__block_invoke;
  block[3] = &unk_264C76AE0;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __23__SPParsecQuery_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 46);
    query_analytics_log_timing(v3, "cancel", "parsec", (uint64_t)v2[50]);
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 25));
    id v4 = v2[47];
    if (v4)
    {
      [v4 invalidateHandler];
      id v5 = v2[48];
      v2[48] = 0;

      id v6 = v2[47];
      v2[47] = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 25));
    id v7 = +[SPQueryTask queryQueue];
    qos_class_t v8 = qos_class_self();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __23__SPParsecQuery_cancel__block_invoke_2;
    v12[3] = &unk_264C77070;
    id v13 = v3;
    dispatch_queue_t v9 = v2;
    uint64_t v14 = v9;
    id v10 = v3;
    dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, v12);
    dispatch_async(v7, v11);

    if (!*((unsigned char *)v9 + 266)) {
      atomic_fetch_add(&sOutstandingQueries, 0xFFFFFFFF);
    }
  }
}

void __23__SPParsecQuery_cancel__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) query];
  char v3 = [v2 cancelled];

  if ((v3 & 1) == 0)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263F78D80]), "initWithQueryID:sections:", objc_msgSend(*(id *)(a1 + 40), "queryGroupId"), 0);
    id v5 = [*(id *)(a1 + 40) responseHandler];
    ((void (**)(void, void *))v5)[2](v5, v4);
  }
  id v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v6, v7))
  {
    *(_WORD *)qos_class_t v8 = 0;
    _os_log_impl(&dword_235D0B000, v6, v7, "#query parsec sending cancel", v8, 2u);
  }
}

- (BOOL)shouldReturnEarly
{
  v3.receiver = self;
  v3.super_class = (Class)SPParsecQuery;
  if ([(SPKQuery *)&v3 shouldReturnEarly]) {
    return 1;
  }
  else {
    return [(id)objc_opt_class() isParsecEnabled] ^ 1;
  }
}

- (BOOL)available
{
  if (![(id)objc_opt_class() isParsecEnabled]) {
    return 0;
  }
  uint64_t v2 = [(id)interface searchSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)checkParsecState
{
  SPGetDisabledDomainSet();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sParsecEnabled = [v4 containsObject:@"DOMAIN_PARSEC"] ^ 1;
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isSpotlightInternetResultsAllowed];

  if ((v3 & 1) == 0) {
    sParsecEnabled = 0;
  }
}

- (void)start
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)SPParsecQuery;
  [(SPKQuery *)&v59 start];
  if (![(SPKQuery *)self sendEmptyResponseIfNecessary])
  {
    char v3 = [(SPKQuery *)self delegate];
    uint64_t v4 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v53 = *(_OWORD *)v4;
    long long v55 = *(_OWORD *)(v4 + 16);
    uint64_t v57 = *(void *)(v4 + 32);
    uint64_t v5 = *(void *)v4;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v7 = *(void *)(v4 + 8);
    *(void *)uint64_t v4 = v5;
    *(void *)(v4 + 8) = spanid;
    *(void *)(v4 + 16) = v7;
    *(unsigned char *)(v4 + 28) = 102;
    *(void *)(v4 + 32) = "-[SPParsecQuery start]";
    si_tracing_log_span_begin();
    if (([v3 isPeopleSearch] & 1) != 0 || objc_msgSend(v3, "isScopedAppSearch"))
    {
      if (objc_msgSend(v3, "isPeopleSearch", v53, v55, v57))
      {
        __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        dispatch_queue_t v9 = "people";
      }
      else
      {
        __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        dispatch_queue_t v9 = "appscoped";
      }
      query_analytics_log_timing(v3, v9, "parsec", v8);
      id v10 = objc_alloc(MEMORY[0x263F78D80]);
      unint64_t v11 = [(SPKQuery *)self queryGroupId];
      id v12 = (void *)[v10 initWithQueryID:v11 sections:MEMORY[0x263EFFA68]];
      id v13 = [(SPKQuery *)self responseHandler];
      ((void (**)(void, void *))v13)[2](v13, v12);
    }
    objc_msgSend(v3, "externalID", v53, v55, v57);
    kdebug_trace();
    uint64_t v14 = SPLogForSPLogCategoryTelemetry();
    unsigned int v15 = [v3 externalID];
    if (v15 && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_235D0B000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "parsecLatency", " enableTelemetry=YES ", buf, 2u);
    }

    __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    long long v17 = SPLogForSPLogCategoryDefault();
    os_log_type_t v18 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, v17, v18, "#query parsec start", buf, 2u);
    }

    if (!atomic_fetch_add(&sOutstandingQueries, 1u)) {
      [(SPParsecQuery *)self preheat];
    }
    id v19 = [v3 query];
    uint64_t v20 = [v19 queryContext];

    id v21 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = (id)objc_opt_class();
      BOOL v23 = [v20 searchString];
      *(_DWORD *)buf = 138412546;
      id v61 = v22;
      __int16 v62 = 2112;
      id v63 = v23;
      _os_log_impl(&dword_235D0B000, v21, OS_LOG_TYPE_INFO, "%@ Perform query %@", buf, 0x16u);
    }
    BOOL v24 = [v20 disabledDomains];
    char v25 = [v24 containsObject:&unk_26E9313F0];

    if ((v25 & 1) == 0)
    {
      uint64_t v26 = (PRSRankingConfiguration *)objc_opt_new();
      rankingInfo = self->_rankingInfo;
      self->_rankingInfo = v26;

      setOfVisibleApps = self->_setOfVisibleApps;
      if (setOfVisibleApps)
      {
        uint64_t v29 = setOfVisibleApps;
      }
      else
      {
        SPCopyVisibleApps();
        uint64_t v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
      }
      id v30 = self->_setOfVisibleApps;
      self->_setOfVisibleApps = v29;

      setOfHiddenApps = self->_setOfHiddenApps;
      if (setOfHiddenApps)
      {
        long long v32 = setOfHiddenApps;
      }
      else
      {
        SPFastHiddenAppsGetNoBuild();
        long long v32 = (NSSet *)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v33 = self->_setOfHiddenApps;
      self->_setOfHiddenApps = v32;

      uint64_t v34 = (void *)MEMORY[0x263EFFA08];
      BOOL v35 = [v20 disabledApps];
      int v36 = [v34 setWithArray:v35];
      disabledAppSet = self->_disabledAppSet;
      self->_disabledAppSet = v36;

      pthread_mutex_lock(&self->_parsecQueryTaskMutex);
      if (sParsecEnabled)
      {
        BOOL v38 = [(id)interface searchSession];
        BOOL v39 = v38 == 0;

        if (v39)
        {
          [(id)objc_opt_class() activate];
          BOOL v40 = [(id)interface searchSession];
          BOOL v41 = v40 == 0;

          if (v41) {
            query_analytics_log_timing(v3, "failed", "parsec", v16);
          }
        }
        double v42 = [v20 searchEntities];
        if ([v42 count])
        {
          BOOL v43 = [v20 searchEntities];
          uint64_t v44 = [v43 lastObject];
          id v45 = [v44 currentSearchString];
        }
        else
        {
          id v45 = [v20 searchString];
        }

        uint64_t v46 = [(id)interface searchSession];
        uint64_t v47 = [v3 externalID];
        uint64_t v48 = [v3 query];
        uint64_t v49 = objc_msgSend(v46, "queryTaskWithString:externalId:handler:queryContext:queryIdent:", v45, v47, self, v20, objc_msgSend(v48, "queryIdent"));

        if (v49)
        {
          CFIndex v50 = SPLogForSPLogCategoryDefault();
          os_log_type_t v51 = 2 * (*MEMORY[0x263F67540] == 0);
          if (os_log_type_enabled(v50, v51))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_235D0B000, v50, v51, "#query parsec start - parsec", buf, 2u);
          }

          objc_msgSend(v49, "setParsecState:", objc_msgSend((id)objc_opt_class(), "isParsecEnabled"));
          [v49 setRepresentedObject:v3];
          objc_storeStrong((id *)&self->_parsecQueryTask, v49);
        }
      }
      pthread_mutex_unlock(&self->_parsecQueryTaskMutex);
    }
    id v52 = [(id)interface searchSession];
    [v52 searchRenderTimeout];
    [(SPParsecQuery *)self resumeWithTimeout:"resumeWithTimeout:"];

    si_tracing_log_span_end();
    *(_OWORD *)uint64_t v4 = v54;
    *(_OWORD *)(v4 + 16) = v56;
    *(void *)(v4 + 32) = v58;
  }
}

- (void)activate
{
  [(id)objc_opt_class() isParsecEnabled];
  OUTLINED_FUNCTION_0_1(&dword_235D0B000, v0, v1, "activate parsec query (%s)", v2, v3, v4, v5, 2u);
}

- (void)deactivate
{
}

- (void)preheat
{
  if ([(id)objc_opt_class() isParsecEnabled])
  {
    uint64_t v2 = [(id)interface searchSession];

    if (!v2)
    {
      uint64_t v3 = objc_opt_class();
      [v3 activate];
    }
  }
}

- (double)computeTimeout:(double)a3
{
  unint64_t quality = self->_quality;
  if ((quality & 0xFFFFFFFFFFFFFFFELL) != 2
    || self->_parsecBeyondTimeoutRequestCount < 4
    || self->_lastKnownQuality != quality)
  {
    goto LABEL_11;
  }
  BOOL withinThreshold = self->_withinThreshold;
  id v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = 2 * (*MEMORY[0x263F67540] == 0);
  BOOL v8 = os_log_type_enabled(v6, v7);
  if (withinThreshold)
  {
    a3 = a3 + 0.05;
    if (v8)
    {
      __int16 v13 = 0;
      dispatch_queue_t v9 = "[Parsec] Increased timeout";
      id v10 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl(&dword_235D0B000, v6, v7, v9, v10, 2u);
    }
  }
  else
  {
    a3 = a3 * 0.5;
    if (v8)
    {
      __int16 v12 = 0;
      dispatch_queue_t v9 = "[Parsec] Cut down timeout";
      id v10 = (uint8_t *)&v12;
      goto LABEL_9;
    }
  }

LABEL_11:
  double result = 0.2;
  if (a3 > 0.0) {
    return a3;
  }
  return result;
}

- (void)resumeWithTimeout:(double)a3
{
  self->_double timeOut = a3;
  self->_queryStartTime = CFAbsoluteTimeGetCurrent();
  pthread_mutex_lock(&self->_parsecQueryTaskMutex);
  [(PRSQueryTask *)self->_parsecQueryTask resume];

  pthread_mutex_unlock(&self->_parsecQueryTaskMutex);
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_parsecQueryTaskMutex);
  v3.receiver = self;
  v3.super_class = (Class)SPParsecQuery;
  [(SPParsecQuery *)&v3 dealloc];
}

- (void)updateParsecBeyondTimeoutCount:(BOOL)a3
{
  if (a3) {
    self->_BOOL withinThreshold = 1;
  }
}

- (double)searchTimeOut
{
  objc_super v3 = [(id)interface searchSession];
  if (v3)
  {
    uint64_t v4 = [(id)interface searchSession];
    [v4 searchRenderTimeout];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.2;
  }

  [(SPParsecQuery *)self computeTimeout:v6];
  return result;
}

- (double)suggestionTimeOut
{
  objc_super v3 = [(id)interface searchSession];
  [v3 suggestionsRenderTimeout];
  double v5 = v4;

  [(SPParsecQuery *)self computeTimeout:v5];
  return result;
}

- (double)timeOut:(BOOL)a3
{
  if (a3) {
    [(SPParsecQuery *)self suggestionTimeOut];
  }
  else {
    [(SPParsecQuery *)self searchTimeOut];
  }
  return result;
}

- (SSPlistDataReader)cannedCEPValues
{
  uint64_t v2 = [(id)interface searchSession];
  objc_super v3 = [v2 cannedCEPValues];

  return (SSPlistDataReader *)v3;
}

- (SSPlistDataReader)cepDictionary
{
  uint64_t v2 = [(id)interface searchSession];
  objc_super v3 = [v2 cepDictionary];

  return (SSPlistDataReader *)v3;
}

- (NSSet)appBlocklist
{
  uint64_t v2 = [(id)interface searchSession];
  objc_super v3 = [v2 appBlocklist];

  return (NSSet *)v3;
}

- (void)setParsecState:(BOOL)a3
{
  [(id)objc_opt_class() parsecEnabled:a3];
  objc_super v3 = [MEMORY[0x263F53C50] sharedConnection];
  char v4 = [v3 isSpotlightInternetResultsAllowed];

  if ((v4 & 1) == 0)
  {
    double v5 = objc_opt_class();
    [v5 parsecEnabled:0];
  }
}

- (PRSMapsParsecRanker)mapsParsecRanker
{
  return self->_mapsParsecRanker;
}

- (NSDictionary)category_stats
{
  return self->_category_stats;
}

- (void)setCategory_stats:(id)a3
{
}

- (NSDictionary)server_features
{
  return self->_server_features;
}

- (void)setServer_features:(id)a3
{
}

- (NSString)fbq
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (NSString)web_fbq
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (NSArray)querySuggestionResults
{
  return self->_querySuggestionResults;
}

- (void)setQuerySuggestionResults:(id)a3
{
}

- (BOOL)suggestionsAreBlended
{
  return self->_suggestionsAreBlended;
}

- (void)setSuggestionsAreBlended:(BOOL)a3
{
  self->_suggestionsAreBlended = a3;
}

- (PRSRankingConfiguration)rankingInfo
{
  return (PRSRankingConfiguration *)objc_getProperty(self, a2, 320, 1);
}

- (void)setRankingInfo:(id)a3
{
}

- (__MDSimpleQueryEvaluator)queryEval
{
  return self->_queryEval;
}

- (void)setQueryEval:(__MDSimpleQueryEvaluator *)a3
{
  self->_queryEval = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SDNetworkQualityInquiry)networkConditions
{
  return (SDNetworkQualityInquiry *)objc_getProperty(self, a2, 344, 1);
}

- (void)setNetworkConditions:(id)a3
{
}

- (unint64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(unint64_t)a3
{
  self->_unint64_t quality = a3;
}

- (unint64_t)lastKnownQuality
{
  return self->_lastKnownQuality;
}

- (void)setLastKnownQuality:(unint64_t)a3
{
  self->_lastKnownQuality = a3;
}

- (SPFederatedQueryTask)resultPipe
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);

  return (SPFederatedQueryTask *)WeakRetained;
}

- (void)setResultPipe:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (PRSQueryTask)parsecQueryTask
{
  return (PRSQueryTask *)objc_getProperty(self, a2, 376, 1);
}

- (void)setParsecQueryTask:(id)a3
{
}

- (NSArray)parsecResults
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setParsecResults:(id)a3
{
}

- (NSArray)parsecResultsCategoryOrder
{
  return (NSArray *)objc_getProperty(self, a2, 392, 1);
}

- (void)setParsecResultsCategoryOrder:(id)a3
{
}

- (BOOL)parsecLoaded
{
  return self->_parsecLoaded;
}

- (void)setParsecLoaded:(BOOL)a3
{
  self->_parsecLoaded = a3;
}

- (BOOL)webSearchLoaded
{
  return self->_webSearchLoaded;
}

- (void)setWebSearchLoaded:(BOOL)a3
{
  self->_webSearchLoaded = a3;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (NSArray)excludedDomainIdentifiers
{
  return self->_excludedDomainIdentifiers;
}

- (void)setExcludedDomainIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_parsecResultsCategoryOrder, 0);
  objc_storeStrong((id *)&self->_parsecResults, 0);
  objc_storeStrong((id *)&self->_parsecQueryTask, 0);
  objc_destroyWeak((id *)&self->_resultPipe);
  objc_storeStrong((id *)&self->_networkConditions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rankingInfo, 0);
  objc_storeStrong((id *)&self->_querySuggestionResults, 0);
  objc_storeStrong((id *)&self->_web_fbq, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_server_features, 0);
  objc_storeStrong((id *)&self->_category_stats, 0);
  objc_storeStrong((id *)&self->_mapsParsecRanker, 0);
  objc_storeStrong((id *)&self->_rankingPatterns, 0);
  objc_storeStrong((id *)&self->_disabledAppSet, 0);
  objc_storeStrong((id *)&self->_setOfHiddenApps, 0);

  objc_storeStrong((id *)&self->_setOfVisibleApps, 0);
}

+ (void)getFTEStringsWithReply:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_235D0B000, log, OS_LOG_TYPE_ERROR, "===^^^ Could not create Parsec Session!", v1, 2u);
}

void __39__SPParsecQuery_queryDidFinishLoading___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_235D0B000, log, OS_LOG_TYPE_DEBUG, "Got Parsec load", v1, 2u);
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_cold_1()
{
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_cold_2()
{
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3_cold_1(int a1, NSObject *a2, double a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3[0] = 67109632;
  v3[1] = a1;
  __int16 v4 = 2048;
  double v5 = a3;
  __int16 v6 = 2048;
  uint64_t v7 = 0x3FE0000000000000;
  _os_log_error_impl(&dword_235D0B000, a2, OS_LOG_TYPE_ERROR, "Local copy query took longer than allowed timeout and missed %d results: took %lf seconds but was allowed %lf", (uint8_t *)v3, 0x1Cu);
}

- (void)query:(void *)a1 didFinishWithResults:withSuggestions:withCorrections:withAlternativeResults:suggestionsAreBlended:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "category_stats");
  OUTLINED_FUNCTION_0_1(&dword_235D0B000, v2, v3, "Category stats: %@", v4, v5, v6, v7, 2u);
}

void __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_189_cold_1(void *a1)
{
  uint64_t v1 = [a1 valueForKey:@"title"];
  OUTLINED_FUNCTION_0_1(&dword_235D0B000, v2, v3, "Got Parsec results: %@", v4, v5, v6, v7, 2u);
}

@end