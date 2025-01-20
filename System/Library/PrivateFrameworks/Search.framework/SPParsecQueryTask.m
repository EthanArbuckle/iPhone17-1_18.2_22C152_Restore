@interface SPParsecQueryTask
- (BOOL)canceled;
- (BOOL)done;
- (BOOL)parsecLoaded;
- (BOOL)suggestionsAreBlended;
- (BOOL)webSearchLoaded;
- (NSArray)parsecResults;
- (NSArray)parsecResultsCategoryOrder;
- (NSArray)querySuggestionResults;
- (NSDictionary)category_stats;
- (NSDictionary)server_features;
- (NSString)fbq;
- (NSString)web_fbq;
- (OS_dispatch_queue)queue;
- (PRSQueryTask)parsecQuery;
- (PRSRankingConfiguration)rankingInfo;
- (SDSearchQuery)resultPipe;
- (SPParsecDatastore)store;
- (SPParsecQueryTask)initWithStore:(id)a3 resultPipe:(id)a4 queue:(id)a5 visibleApps:(id)a6 hiddenApps:(id)a7;
- (id)findLocalCopies:(id)a3 alternativeResults:(id)a4 withQueryString:(id)a5;
- (id)rerankMapsResultsWithLocalSignals:(id)a3 forQueryId:(int64_t)a4;
- (id)unarchiveWithQuery:(id)a3;
- (unint64_t)startTime;
- (unint64_t)type;
- (void)_setScore:(SPParsecQueryTask *)self forResult:(SEL)a2;
- (void)archiveWithQuery:(id)a3 didFinishWithResults:(id)a4 withSuggestions:(id)a5 withCorrections:(id)a6 suggestionsAreBlended:(BOOL)a7;
- (void)cancel;
- (void)dealloc;
- (void)finished;
- (void)geoUserSessionEntityString:(id)a3;
- (void)query:(id)a3 didFinishWithResults:(id)a4 withSuggestions:(id)a5 withCorrections:(id)a6 withAlternativeResults:(id)a7 suggestionsAreBlended:(BOOL)a8;
- (void)queryDidFinishLoading:(id)a3;
- (void)resumeWithArchive:(id)a3;
- (void)resumeWithTimeout:(double)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCategory_stats:(id)a3;
- (void)setDone:(BOOL)a3;
- (void)setParsecLoaded:(BOOL)a3;
- (void)setParsecQuery:(id)a3;
- (void)setParsecResults:(id)a3;
- (void)setParsecResultsCategoryOrder:(id)a3;
- (void)setQuerySuggestionResults:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRankingInfo:(id)a3;
- (void)setResultPipe:(id)a3;
- (void)setServer_features:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setSuggestionsAreBlended:(BOOL)a3;
- (void)setType:(unint64_t)a3;
- (void)setWebSearchLoaded:(BOOL)a3;
@end

@implementation SPParsecQueryTask

- (void)resumeWithTimeout:(double)a3
{
  self->_timeOut = a3;
  self->_queryStartTime = CFAbsoluteTimeGetCurrent();
  id v4 = [(SPParsecQueryTask *)self parsecQuery];
  [v4 resume];
}

- (id)unarchiveWithQuery:(id)a3
{
  v3 = +[SPParsecArchive archivePathForQuery:a3];
  id v4 = +[NSData dataWithContentsOfFile:v3];
  id v11 = 0;
  id v5 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v4 error:&v11];
  id v6 = v11;
  id v10 = v6;
  v7 = [v5 decodeTopLevelObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey error:&v10];
  id v8 = v10;

  return v7;
}

- (void)resumeWithArchive:(id)a3
{
  id v4 = a3;
  id v9 = [v4 query];
  id v5 = [v4 resultsSections];
  id v6 = [v4 suggestions];
  v7 = [v4 corrections];
  id v8 = [v4 suggestionsAreBlended];

  [(SPParsecQueryTask *)self query:v9 didFinishWithResults:v5 withSuggestions:v6 withCorrections:v7 withAlternativeResults:0 suggestionsAreBlended:v8];
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_mutex);
  v3.receiver = self;
  v3.super_class = (Class)SPParsecQueryTask;
  [(SPParsecQueryTask *)&v3 dealloc];
}

- (SPParsecQueryTask)initWithStore:(id)a3 resultPipe:(id)a4 queue:(id)a5 visibleApps:(id)a6 hiddenApps:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SPParsecQueryTask;
  v18 = [(SPParsecQueryTask *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_store, a3);
    objc_storeWeak((id *)&v19->_resultPipe, v14);
    objc_storeStrong((id *)&v19->_queue, a5);
    pthread_mutex_init(&v19->_mutex, 0);
    v19->_type = 1;
    uint64_t v20 = objc_opt_new();
    rankingInfo = v19->_rankingInfo;
    v19->_rankingInfo = (PRSRankingConfiguration *)v20;

    if (v16)
    {
      v22 = (NSSet *)v16;
    }
    else
    {
      SPCopyVisibleApps();
      v22 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    setOfVisibleApps = v19->_setOfVisibleApps;
    v19->_setOfVisibleApps = v22;

    if (v17)
    {
      v24 = (NSSet *)v17;
    }
    else
    {
      SPFastHiddenAppsGetNoBuild();
      v24 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    setOfHiddenApps = v19->_setOfHiddenApps;
    v19->_setOfHiddenApps = v24;
  }
  return v19;
}

- (void)finished
{
  uint64_t v3 = si_tracing_current_span();
  long long v4 = *(_OWORD *)(v3 + 16);
  long long v75 = *(_OWORD *)v3;
  long long v76 = v4;
  uint64_t v77 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v5;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v7;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "-[SPParsecQueryTask finished]";
  si_tracing_log_span_begin();
  id v8 = SPLogForSPLogCategoryDefault();
  os_log_type_t v9 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v8, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "#query parsec finished", buf, 2u);
  }

  if (pthread_mutex_trylock(&self->_mutex))
  {
    v52 = "pthread_mutex_trylock(&_mutex)==0";
    int v53 = 278;
    goto LABEL_53;
  }
  if (pthread_mutex_unlock(&self->_mutex))
  {
    v52 = "pthread_mutex_unlock(&_mutex)==0";
    int v53 = 279;
LABEL_53:
    __assert_rtn("-[SPParsecQueryTask finished]", "SPParsecDatastore.m", v53, v52);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  self->_queryEndTime = Current;
  double v11 = Current - self->_queryStartTime;
  double timeOut = self->_timeOut;
  uint64_t v63 = v3;
  if (v11 > timeOut) {
    [(SPParsecDatastore *)self->_store updateParsecBeyondTimeoutCount:v11 - timeOut <= 0.05];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
  self->_done = 1;
  id v13 = [(PRSQueryTask *)self->_parsecQuery category_stats];
  [(PRSRankingConfiguration *)self->_rankingInfo setSqfData:v13];

  id v14 = [(PRSQueryTask *)self->_parsecQuery server_features];
  [(PRSRankingConfiguration *)self->_rankingInfo setServerFeatures:v14];

  [(PRSRankingConfiguration *)self->_rankingInfo setParsecCategoryOrder:self->_parsecResultsCategoryOrder];
  id v15 = [(PRSQueryTask *)self->_parsecQuery serverRelevanceScores];
  [(PRSRankingConfiguration *)self->_rankingInfo setServerRelevanceScores:v15];

  [(PRSQueryTask *)self->_parsecQuery serverRelevanceScoreThreshold];
  -[PRSRankingConfiguration setServerRelevanceScoreThreshold:](self->_rankingInfo, "setServerRelevanceScoreThreshold:");
  id v16 = objc_opt_new();
  id v17 = [(PRSQueryTask *)self->_parsecQuery engagementSignal];
  id v18 = [v16 initWithSFEngagementSignal:v17];
  [(PRSRankingConfiguration *)self->_rankingInfo setIFunScores:v18];

  v19 = [(SPParsecDatastore *)self->_store cepDictionary];
  uint64_t v20 = v19;
  if (!v19)
  {
    uint64_t v20 = [(SPParsecDatastore *)self->_store cannedCEPValues];
  }
  [(PRSRankingConfiguration *)self->_rankingInfo setQueryIndependentCategoryProbabilities:v20];
  if (!v19) {

  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obj = self->_parsecResults;
  id v60 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (!v60)
  {
    float v21 = -1.0;
    goto LABEL_39;
  }
  uint64_t v59 = *(void *)v72;
  float v21 = -1.0;
  do
  {
    for (i = 0; i != v60; i = (char *)i + 1)
    {
      if (*(void *)v72 != v59) {
        objc_enumerationMutation(obj);
      }
      v62 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      v22 = [v62 bundleIdentifier];
      if ([v22 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"])
      {
      }
      else
      {
        v23 = [v62 bundleIdentifier];
        unsigned int v24 = [v23 hasPrefix:@"com.apple.parsec.app_distr"];

        if (!v24) {
          goto LABEL_33;
        }
      }
      v25 = objc_opt_new();
      v26 = [v62 results];
      BOOL v27 = [v26 count] == 0;

      if (!v27) {
        float v21 = 0.0;
      }
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      v28 = [v62 results];
      id v29 = [v28 countByEnumeratingWithState:&v67 objects:v82 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v68;
        do
        {
          for (j = 0; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v68 != v30) {
              objc_enumerationMutation(v28);
            }
            v32 = *(void **)(*((void *)&v67 + 1) + 8 * (void)j);
            v33 = [v32 applicationBundleIdentifier];
            if ([(NSSet *)self->_setOfVisibleApps containsObject:v33])
            {
              v34 = SPLogForSPLogCategoryDefault();
              os_log_type_t v35 = 2 * (gSPLogDebugAsDefault == 0);
              if (os_log_type_enabled(v34, v35))
              {
                *(_DWORD *)buf = 138412290;
                id v79 = v33;
                _os_log_impl((void *)&_mh_execute_header, v34, v35, "De-dupped app with bundle id: %@", buf, 0xCu);
              }

              uint64_t v3 = v63;
              [v25 addObject:v32];
              float v21 = v21 + 1.0;
            }
          }
          id v29 = [v28 countByEnumeratingWithState:&v67 objects:v82 count:16];
        }
        while (v29);
      }

      [v62 removeResultsInArray:v25];
      [v62 setHiddenExtResults:v25];

LABEL_33:
      if ([v62 domain] != 1) {
        [v62 setDomain:2];
      }
    }
    id v60 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v83 count:16];
  }
  while (v60);
LABEL_39:

  *(float *)&double v36 = v21;
  [(PRSRankingConfiguration *)self->_rankingInfo setNumAppsDeduped:v36];
  if (self->_canceled) {
    v37 = "finish_canceled";
  }
  else {
    v37 = "finished";
  }
  sub_1000190D4(WeakRetained, v37, "parsec", self->_startTime);
  if (!self->_canceled)
  {
    v38 = SPLogForSPLogCategoryDefault();
    os_log_type_t v39 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v38, v39))
    {
      id v40 = (id)objc_opt_class();
      qos_class_t v41 = qos_class_self();
      *(_DWORD *)buf = 138412546;
      id v79 = v40;
      __int16 v80 = 1024;
      LODWORD(v81) = v41;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "QOS %@ finished: %d", buf, 0x12u);
    }
    v42 = +[SDController workQueue];
    qos_class_t v43 = qos_class_self();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005D4B8;
    block[3] = &unk_100091E90;
    id v65 = WeakRetained;
    v66 = self;
    dispatch_block_t v44 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v43, 0, block);
    tracing_dispatch_async();
  }
  v45 = SPLogForSPLogCategoryDefault();
  os_log_type_t v46 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v45, v46))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "#query parsec done", buf, 2u);
  }

  v47 = SPLogForSPLogCategoryDefault();
  os_log_type_t v48 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v47, v48))
  {
    v49 = [WeakRetained queryContext];
    v50 = [v49 searchString];
    v51 = [(NSArray *)self->_parsecResults valueForKey:@"title"];
    *(_DWORD *)buf = 138412546;
    id v79 = v50;
    __int16 v80 = 2112;
    v81 = v51;
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Parsec query: %@ returned results: %@", buf, 0x16u);
  }
  parsecQuery = self->_parsecQuery;
  if (parsecQuery)
  {
    [(PRSQueryTask *)parsecQuery invalidateHandler];
    v55 = self->_parsecQuery;
  }
  else
  {
    v55 = 0;
  }
  self->_parsecQuery = 0;

  objc_storeWeak((id *)&self->_resultPipe, 0);
  atomic_fetch_add(dword_1000A93C8, 0xFFFFFFFF);
  si_tracing_log_span_end();
  long long v56 = v76;
  *(_OWORD *)uint64_t v3 = v75;
  *(_OWORD *)(v3 + 16) = v56;
  *(void *)(v3 + 32) = v77;
}

- (void)cancel
{
  uint64_t v3 = si_tracing_current_span();
  long long v4 = *(_OWORD *)(v3 + 16);
  long long v13 = *(_OWORD *)v3;
  long long v14 = v4;
  uint64_t v15 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v5;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v7;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "-[SPParsecQueryTask cancel]";
  si_tracing_log_span_begin();
  self->_canceled = 1;
  id v8 = SPLogForSPLogCategoryDefault();
  os_log_type_t v9 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v8, v9))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "#query parsec cancel", buf, 2u);
  }

  id v11 = objc_loadWeakRetained((id *)&self->_resultPipe);
  tracing_dispatch_async();

  si_tracing_log_span_end();
  long long v10 = v14;
  *(_OWORD *)uint64_t v3 = v13;
  *(_OWORD *)(v3 + 16) = v10;
  *(void *)(v3 + 32) = v15;
}

- (void)queryDidFinishLoading:(id)a3
{
  id v3 = a3;
  uint64_t v4 = si_tracing_current_span();
  long long v9 = *(_OWORD *)v4;
  long long v10 = *(_OWORD *)(v4 + 16);
  uint64_t v11 = *(void *)(v4 + 32);
  uint64_t v5 = *(void *)v4;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v4 + 8);
  *(void *)uint64_t v4 = v5;
  *(void *)(v4 + 8) = spanid;
  *(void *)(v4 + 16) = v7;
  *(unsigned char *)(v4 + 28) = 102;
  *(void *)(v4 + 32) = "-[SPParsecQueryTask queryDidFinishLoading:]";
  si_tracing_log_span_begin();
  id v8 = v3;
  tracing_dispatch_async();

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v4 = v9;
  *(_OWORD *)(v4 + 16) = v10;
  *(void *)(v4 + 32) = v11;
}

- (void)_setScore:(SPParsecQueryTask *)self forResult:(SEL)a2
{
  objc_msgSend(v2, "setScore:");
}

- (void)geoUserSessionEntityString:(id)a3
{
  id v4 = a3;
  id v5 = [(SPParsecQueryTask *)self resultPipe];
  [v5 setGeoUserSessionEntityString:v4];
}

- (void)archiveWithQuery:(id)a3 didFinishWithResults:(id)a4 withSuggestions:(id)a5 withCorrections:(id)a6 suggestionsAreBlended:(BOOL)a7
{
  BOOL v7 = a7;
  id v24 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = si_tracing_current_span();
  long long v25 = *(_OWORD *)v15;
  long long v26 = *(_OWORD *)(v15 + 16);
  uint64_t v27 = *(void *)(v15 + 32);
  uint64_t v16 = *(void *)v15;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v18 = *(void *)(v15 + 8);
  *(void *)uint64_t v15 = v16;
  *(void *)(v15 + 8) = spanid;
  *(void *)(v15 + 16) = v18;
  *(unsigned char *)(v15 + 28) = 102;
  *(void *)(v15 + 32) = "-[SPParsecQueryTask archiveWithQuery:didFinishWithResults:withSuggestions:withCorrections:sugg"
                          "estionsAreBlended:]";
  si_tracing_log_span_begin();
  v19 = [[SPParsecArchive alloc] initWithQuery:v24 withResults:v12 withSuggestions:v13 withCorrections:v14 suggestionsAreBlended:v7 withStore:self->_store];
  uint64_t v20 = [v24 queryString];
  float v21 = +[SPParsecArchive archivePathForQuery:v20];

  id v22 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v22 encodeObject:v19 forKey:NSKeyedArchiveRootObjectKey];
  v23 = [v22 encodedData];
  [v23 writeToFile:v21 atomically:1];

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v15 = v25;
  *(_OWORD *)(v15 + 16) = v26;
  *(void *)(v15 + 32) = v27;
}

- (id)findLocalCopies:(id)a3 alternativeResults:(id)a4 withQueryString:(id)a5
{
  id v117 = a3;
  id v114 = a4;
  id v130 = a5;
  uint64_t v7 = si_tracing_current_span();
  long long v8 = *(_OWORD *)(v7 + 16);
  long long v164 = *(_OWORD *)v7;
  long long v165 = v8;
  uint64_t v166 = *(void *)(v7 + 32);
  uint64_t v116 = v7;
  uint64_t v9 = *(void *)v7;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v11 = *(void *)(v116 + 8);
  *(void *)uint64_t v116 = v9;
  *(void *)(v116 + 8) = spanid;
  *(void *)(v116 + 16) = v11;
  *(unsigned char *)(v116 + 28) = 102;
  *(void *)(v116 + 32) = "-[SPParsecQueryTask findLocalCopies:alternativeResults:withQueryString:]";
  si_tracing_log_span_begin();
  if (![v117 count])
  {
    id v120 = 0;
    goto LABEL_78;
  }
  v133 = objc_opt_new();
  v135 = objc_opt_new();
  v134 = objc_opt_new();
  v112 = objc_opt_new();
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id obj = v117;
  locatiounint64_t n = (id *)[obj countByEnumeratingWithState:&v160 objects:v173 count:16];
  if (!location) {
    goto LABEL_22;
  }
  uint64_t v126 = *(void *)v161;
  uint64_t v12 = PRSRankingParsecAppBundleString;
  do
  {
    for (i = 0; i != location; i = (id *)((char *)i + 1))
    {
      if (*(void *)v161 != v126) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v160 + 1) + 8 * i);
      long long v156 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      id v14 = [v13 results];
      id v15 = [v14 countByEnumeratingWithState:&v156 objects:v172 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v157;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v157 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v156 + 1) + 8 * (void)j);
            v19 = [v18 sectionBundleIdentifier];
            unsigned int v20 = [v19 isEqualToString:v12];

            if (v20)
            {
              float v21 = [v18 title];
              id v22 = [v21 text];
              [v135 addObject:v22];

              v23 = [v18 applicationBundleIdentifier];
              [v134 addObject:v23];
LABEL_17:

              continue;
            }
            if (objc_opt_respondsToSelector())
            {
              id v24 = [v18 storeIdentifier];
              BOOL v25 = v24 == 0;

              if (!v25)
              {
                v23 = [v18 storeIdentifier];
                [v133 addObject:v23];
                goto LABEL_17;
              }
            }
          }
          id v15 = [v14 countByEnumeratingWithState:&v156 objects:v172 count:16];
        }
        while (v15);
      }
    }
    locatiounint64_t n = (id *)[obj countByEnumeratingWithState:&v160 objects:v173 count:16];
  }
  while (location);
LABEL_22:

  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v26 = v114;
  id v27 = [v26 countByEnumeratingWithState:&v152 objects:v171 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v153;
    uint64_t v29 = PRSRankingParsecAppBundleString;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v153 != v28) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v152 + 1) + 8 * (void)k);
        v32 = [v31 sectionBundleIdentifier];
        unsigned int v33 = [v32 isEqualToString:v29];

        if (v33)
        {
          v34 = [v31 title];
          os_log_type_t v35 = [v34 text];
          [v135 addObject:v35];

          double v36 = [v31 applicationBundleIdentifier];
          [v134 addObject:v36];
LABEL_32:

          continue;
        }
        if (objc_opt_respondsToSelector())
        {
          v37 = [v31 storeIdentifier];
          BOOL v38 = v37 == 0;

          if (!v38)
          {
            double v36 = [v31 storeIdentifier];
            [v133 addObject:v36];
            goto LABEL_32;
          }
        }
      }
      id v27 = [v26 countByEnumeratingWithState:&v152 objects:v171 count:16];
    }
    while (v27);
  }

  if ([v133 count] || objc_msgSend(v135, "count"))
  {
    v111 = sub_10005EDA8(@"kMDItemAdamID", v133);
    v109 = sub_10005EDA8(@"kMDItemDisplayName", v135);
    v108 = sub_10005EDA8(@"kMDItemAlternateNames", v135);
    if (v109 && v108)
    {
      [&stru_100094088 stringByAppendingFormat:@"(_kMDItemBundleID = \"com.apple.application\" && ((%@) || (%@)))", v109, v108];
      os_log_type_t v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v40 = v39;
      if (v111)
      {
        uint64_t v41 = [(__CFString *)v39 stringByAppendingString:@" || "];

        id v40 = (__CFString *)v41;
LABEL_43:
        uint64_t v42 = [(__CFString *)v40 stringByAppendingFormat:@"(%@)", v111];

        id v40 = (__CFString *)v42;
      }
    }
    else
    {
      id v40 = &stru_100094088;
      if (v111) {
        goto LABEL_43;
      }
    }
    v113 = v40;
    if (![(__CFString *)v40 length])
    {

      v113 = @"false";
    }
    locationa = (id *)&self->_resultPipe;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
    uint64_t v44 = (uint64_t)[WeakRetained hash];

    id v45 = objc_alloc((Class)PRSRankingItemRanker);
    id v46 = objc_loadWeakRetained((id *)&self->_resultPipe);
    v47 = [v46 queryContext];
    os_log_type_t v48 = [v47 keyboardLanguage];
    id v49 = objc_loadWeakRetained((id *)&self->_resultPipe);
    v50 = [v49 queryContext];
    [v50 currentTime];
    uint64_t v51 = -v44;
    id v107 = objc_msgSend(v45, "initWithSearchString:queryID:language:currentTime:", v130, v51, v48);

    id v52 = objc_loadWeakRetained((id *)&self->_resultPipe);
    int v53 = [v52 queryContext];
    id v54 = [v53 queryKind];
    id v55 = objc_loadWeakRetained((id *)&self->_resultPipe);
    long long v56 = [v55 queryContext];
    v57 = [v56 keyboardLanguage];
    LOBYTE(v100) = 0;
    v119 = [v107 rankingConfigurationWithMeContact:0 emailAddresses:0 phoneFavorites:0 vipList:0 clientBundle:PRSRankingSearchBundleString isScopedSearch:0 spotlightQuery:v113 userQuery:v130 tokenString:0 queryKind:v54 isPeopleSearch:v100 keyboardLanguage:v57];

    id v115 = objc_alloc_init((Class)CSSearchQueryContext);
    [v115 setQueryID:v51];
    NSFileProtectionType v170 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    v58 = +[NSArray arrayWithObjects:&v170 count:1];
    [v115 setProtectionClasses:v58];

    [v115 setEntitledAttributes:1];
    uint64_t v59 = rankingPrefetchedAttributesArray();
    [v115 setFetchAttributes:v59];

    id v60 = [v119 rankingQueries];
    [v115 setRankingQueries:v60];

    id v61 = objc_loadWeakRetained((id *)&self->_resultPipe);
    v62 = [v61 queryContext];
    [v62 currentTime];
    double v64 = v63;

    if (qword_1000A93D8 != -1) {
      dispatch_once(&qword_1000A93D8, &stru_100093C38);
    }
    id v65 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:66307 valueOptions:0 capacity:256];
    v118 = [v115 fetchAttributes];
    v66 = (char *)[v118 count];
    v149[0] = _NSConcreteStackBlock;
    v149[1] = 3221225472;
    v149[2] = sub_10005EFE4;
    v149[3] = &unk_100093C60;
    double v151 = v64;
    id v67 = v65;
    id v150 = v67;
    v106 = objc_retainBlock(v149);
    long long v68 = dispatch_group_create();
    dispatch_group_enter(v68);
    id v69 = objc_alloc_init((Class)NSMutableIndexSet);
    long long v70 = objc_opt_new();
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (v66)
    {
      for (m = 0; m != v66; ++m)
      {
        long long v73 = [v119 requiredAttributes];
        long long v74 = [v118 objectAtIndexedSubscript:m];
        unsigned int v75 = [v73 containsObject:v74];

        if (v75) {
          [v69 addIndex:m];
        }
      }
    }
    v140[0] = _NSConcreteStackBlock;
    v140[1] = 3221225472;
    v140[2] = sub_10005FC78;
    v140[3] = &unk_100093CC8;
    id v101 = v67;
    id v141 = v101;
    v147 = v66;
    id v102 = v69;
    id v142 = v102;
    id v143 = v134;
    id v144 = v112;
    id v104 = v70;
    id v145 = v104;
    dispatch_group_t group = v68;
    dispatch_group_t v146 = group;
    CFAbsoluteTime v148 = Current;
    v105 = objc_retainBlock(v140);
    long long v76 = +[SPCoreSpotlightIndexer sharedInstance];
    v110 = [v76 taskForTopHitQueryWithQueryString:v113 queryContext:v115 eventHandler:v106 resultsHandler:&stru_100093CA0 completionHandler:v105];

    if (v110)
    {
      uint64_t v77 = +[SPCoreSpotlightIndexer sharedInstance];
      [v77 startQueryTask:v110];

      v78 = group;
    }
    else
    {
      v78 = group;
      dispatch_group_leave(group);
    }
    dispatch_time_t v79 = dispatch_time(0, 500000000);
    dispatch_group_wait(v78, v79);
    id v120 = [v104 allValues];
    for (unint64_t n = 0; (unint64_t)[v120 count] > n; ++n)
    {
      v121 = objc_msgSend(v120, "objectAtIndexedSubscript:");
      __int16 v80 = [v121 results];
      id v81 = [v80 copy];

      id v127 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v81, "count"));
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id obja = v81;
      id v82 = [obja countByEnumeratingWithState:&v136 objects:v169 count:16];
      if (v82)
      {
        uint64_t v132 = *(void *)v137;
        do
        {
          for (ii = 0; ii != v82; ii = (char *)ii + 1)
          {
            if (*(void *)v137 != v132) {
              objc_enumerationMutation(obja);
            }
            v84 = *(void **)(*((void *)&v136 + 1) + 8 * (void)ii);
            id v85 = objc_loadWeakRetained(locationa);
            v86 = [v85 queryContext];
            v87 = [v84 resultWithTime:v130 searchString:0 isCorrectedQuery:v86 withQueryContext:v64];

            if (v87)
            {
              [v87 setType:26];
              v88 = [v84 rankingItem];
              v89 = [v88 L2FeatureVector];
              if (v89) {
                BOOL v90 = v84 == 0;
              }
              else {
                BOOL v90 = 1;
              }
              int v91 = !v90;

              if (v91)
              {
                v167[0] = @"score";
                [v88 score];
                v92 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
                v168[0] = v92;
                v167[1] = @"raw score";
                [v88 rawScore];
                v93 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
                v168[1] = v93;
                v167[2] = @"original score";
                v94 = [v88 L2FeatureVector];
                [v94 originalL2Score];
                v95 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
                v168[2] = v95;
                v96 = +[NSDictionary dictionaryWithObjects:v168 forKeys:v167 count:3];
                [v87 setLocalFeatures:v96];
              }
              [v127 addObject:v87];
              v97 = [v84 rankingItem];
              [v97 score];
              objc_msgSend(v87, "setL2score:");
            }
            [v84 clearClientData];
          }
          id v82 = [obja countByEnumeratingWithState:&v136 objects:v169 count:16];
        }
        while (v82);
      }

      [v121 setResults:v127];
    }

    goto LABEL_77;
  }
  id v120 = 0;
LABEL_77:

LABEL_78:
  si_tracing_log_span_end();
  long long v98 = v165;
  *(_OWORD *)uint64_t v116 = v164;
  *(_OWORD *)(v116 + 16) = v98;
  *(void *)(v116 + 32) = v166;

  return v120;
}

- (void)query:(id)a3 didFinishWithResults:(id)a4 withSuggestions:(id)a5 withCorrections:(id)a6 withAlternativeResults:(id)a7 suggestionsAreBlended:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v106 = a5;
  id v16 = a6;
  id v108 = a7;
  if (byte_1000A93F0 == 1) {
    [(SPParsecQueryTask *)self archiveWithQuery:v14 didFinishWithResults:v15 withSuggestions:v106 withCorrections:v16 suggestionsAreBlended:v8];
  }
  BOOL v104 = v8;
  id v114 = self;
  v105 = v16;
  id v120 = objc_opt_new();
  uint64_t v132 = objc_opt_new();
  int v116 = SSEnableSpotlightTopHitPersonalizedRanking();
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id obj = v15;
  id v17 = &MDItemInstantMessageAddresses_ptr;
  id v128 = [obj countByEnumeratingWithState:&v146 objects:v155 count:16];
  if (v128)
  {
    uint64_t v126 = *(void *)v147;
    uint64_t v124 = SSSectionIdentifierSuggestions;
    uint64_t v130 = SSSectionIdentifierServerRelatedSuggestions;
    uint64_t v115 = SSSectionIdentifierWebIndex;
    uint64_t v112 = SSSectionIdentifierKG;
    uint64_t v113 = SSSectionIdentifierMaps;
    uint64_t v111 = SSSectionIdentifierStocks;
    uint64_t v110 = SSSectionIdentifierSports;
    uint64_t v109 = SSSectionIdentifierMovies;
    uint64_t v103 = SSSectionIdentifierParsecDictionary;
    uint64_t v102 = SSSectionIdentifierParsecWeather;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v147 != v126) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v146 + 1) + 8 * (void)v18);
        unsigned int v20 = [v19 bundleIdentifier];
        unsigned int v21 = [v20 isEqualToString:v124];

        if (v21)
        {
          long long v144 = 0u;
          long long v145 = 0u;
          long long v142 = 0u;
          long long v143 = 0u;
          id v22 = [v19 results];
          id v23 = [v22 countByEnumeratingWithState:&v142 objects:v154 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v143;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v143 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v142 + 1) + 8 * i);
                uint64_t v28 = [v14 queryContext];
                uint64_t v29 = +[SSSuggestionResultBuilder buildResultWithResult:v27 queryContext:v28];

                [v132 addObject:v29];
              }
              id v24 = [v22 countByEnumeratingWithState:&v142 objects:v154 count:16];
            }
            while (v24);
          }

          id v17 = &MDItemInstantMessageAddresses_ptr;
          goto LABEL_54;
        }
        uint64_t v30 = [v19 bundleIdentifier];
        unsigned int v31 = [v30 isEqualToString:v130];

        if (v31)
        {
          v121 = v18;
          id v117 = [objc_alloc((Class)v17[225]) initWithResultSection:v19];
          v32 = objc_opt_new();
          long long v138 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          long long v141 = 0u;
          unsigned int v33 = [v19 results];
          id v34 = [v33 countByEnumeratingWithState:&v138 objects:v153 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v139;
            do
            {
              for (j = 0; j != v35; j = (char *)j + 1)
              {
                if (*(void *)v139 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v38 = *(void *)(*((void *)&v138 + 1) + 8 * (void)j);
                os_log_type_t v39 = [v14 queryContext];
                id v40 = +[SSSuggestionResultBuilder buildResultWithResult:v38 queryContext:v39];

                [v40 setSectionBundleIdentifier:v130];
                [v32 addObject:v40];
              }
              id v35 = [v33 countByEnumeratingWithState:&v138 objects:v153 count:16];
            }
            while (v35);
          }

          [v117 setResults:v32];
          [v120 addObject:v117];

          id v17 = &MDItemInstantMessageAddresses_ptr;
          uint64_t v18 = v121;
          goto LABEL_54;
        }
        uint64_t v41 = [v19 bundleIdentifier];
        if (([v41 isEqualToString:v115] & 1) == 0)
        {
          uint64_t v42 = [v19 bundleIdentifier];
          if (([v42 isEqualToString:v112] & 1) == 0)
          {
            qos_class_t v43 = [v19 bundleIdentifier];
            if (([v43 isEqualToString:v113] & 1) == 0)
            {
              v122 = v18;
              uint64_t v44 = [v19 bundleIdentifier];
              if (([v44 isEqualToString:v111] & 1) == 0)
              {
                id v45 = [v19 bundleIdentifier];
                if (([v45 isEqualToString:v110] & 1) == 0)
                {
                  id v46 = [v19 bundleIdentifier];
                  if (([v46 isEqualToString:v109] & 1) == 0)
                  {
                    v118 = v46;
                    v47 = [v19 bundleIdentifier];
                    if (([v47 hasPrefix:@"com.apple.parsec.itunes."] & 1) == 0)
                    {
                      id v107 = v47;
                      os_log_type_t v48 = [v19 bundleIdentifier];
                      if (([v48 isEqualToString:v103] & 1) == 0)
                      {
                        [v19 bundleIdentifier];
                        double v63 = v100 = v45;
                        unsigned __int8 v101 = [v63 isEqualToString:v102];

                        uint64_t v18 = v122;
                        if ((v101 & 1) == 0)
                        {
                          [v120 addObject:v19];
                          goto LABEL_54;
                        }
                        goto LABEL_42;
                      }

                      v47 = v107;
                    }

                    id v46 = v118;
                  }
                }
              }

              uint64_t v18 = v122;
            }
          }
        }

LABEL_42:
        id v49 = [objc_alloc((Class)v17[225]) initWithResultSection:v19];
        if (_os_feature_enabled_impl())
        {
          v50 = [v19 bundleIdentifier];
          if (![v50 isEqualToString:v113]) {
            goto LABEL_48;
          }
          uint64_t v51 = [(SPParsecDatastore *)v114->_store mapsParsecRanker];

          if (v51)
          {
            id v52 = SPLogForSPLogCategoryDefault();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Geo personalization enabled, reranking geo results with local signals", buf, 2u);
            }

            v50 = [v19 results];
            int v53 = -[SPParsecQueryTask rerankMapsResultsWithLocalSignals:forQueryId:](v114, "rerankMapsResultsWithLocalSignals:forQueryId:", v50, [v14 queryIdent]);
            [v49 setResults:v53];

LABEL_48:
          }
        }
        id v54 = v120;
        if (v116)
        {
          v123 = v18;
          id v55 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            long long v56 = [v49 bundleIdentifier];
            *(_DWORD *)buf = 138412290;
            id v152 = v56;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "TopHit nomination for server results based on local engagement and personalization signals. Server section: %@", buf, 0xCu);
          }
          v57 = [v14 queryString];
          v58 = [(SPParsecQueryTask *)v114 resultPipe];
          uint64_t v59 = [v58 queryContext];
          id v60 = [v59 keyboardLanguage];
          id v61 = [v14 queryContext];
          [v61 currentTime];
          v62 = +[SSRankingManager nominateServerTopHitForSection:queryString:language:currentTime:](SSRankingManager, "nominateServerTopHitForSection:queryString:language:currentTime:", v49, v57, v60);
          [v49 setResults:v62];

          id v54 = v120;
          uint64_t v18 = v123;
        }
        [v54 addObject:v49];

LABEL_54:
        uint64_t v18 = (char *)v18 + 1;
      }
      while (v18 != v128);
      id v64 = [obj countByEnumeratingWithState:&v146 objects:v155 count:16];
      id v128 = v64;
    }
    while (v64);
  }

  id v65 = [v14 queryString];
  v66 = [(SPParsecQueryTask *)v114 findLocalCopies:v120 alternativeResults:v108 withQueryString:v65];

  v125 = v66;
  if ([v66 count])
  {
    id v67 = [v120 arrayByAddingObjectsFromArray:v66];
  }
  else
  {
    id v67 = v120;
  }
  long long v68 = v67;

  v131 = +[NSMutableArray array];
  id v69 = objc_opt_new();
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v129 = v68;
  id v70 = [v129 countByEnumeratingWithState:&v134 objects:v150 count:16];
  id v127 = v69;
  if (v70)
  {
    id v71 = v70;
    uint64_t v72 = *(void *)v135;
    do
    {
      for (k = 0; k != v71; k = (char *)k + 1)
      {
        if (*(void *)v135 != v72) {
          objc_enumerationMutation(v129);
        }
        long long v74 = *(void **)(*((void *)&v134 + 1) + 8 * (void)k);
        id v75 = [objc_alloc((Class)v17[225]) initWithResultSection:v74];
        [v75 setSource:2];
        [v131 addObject:v75];
        long long v76 = [v74 bundleIdentifier];

        if (v76)
        {
          uint64_t v77 = [v74 bundleIdentifier];
          if (!v77) {
            goto LABEL_73;
          }
LABEL_69:
          [v74 setBundleIdentifier:v77];
          [v69 addObject:v77];

          goto LABEL_73;
        }
        uint64_t v78 = [v74 results];
        if (v78)
        {
          dispatch_time_t v79 = (void *)v78;
          __int16 v80 = [v74 results];
          id v81 = [v80 count];

          id v69 = v127;
          if (v81)
          {
            id v82 = [v74 results];
            v83 = [v82 objectAtIndex:0];
            uint64_t v77 = [v83 sectionBundleIdentifier];

            id v69 = v127;
            if (v77) {
              goto LABEL_69;
            }
          }
        }
LABEL_73:
      }
      id v71 = [v129 countByEnumeratingWithState:&v134 objects:v150 count:16];
    }
    while (v71);
  }

  v84 = v114;
  if (![v131 count] && !objc_msgSend(v106, "count"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v114->_resultPipe);
    sub_1000190D4(WeakRetained, "finish_zero", "parsec", v114->_startTime);

    id v69 = v127;
  }
  if (v106)
  {
    v86 = SPLogForSPLogCategoryDefault();
    os_log_type_t v87 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v86, v87))
    {
      *(_DWORD *)buf = 138412290;
      id v152 = v106;
      _os_log_impl((void *)&_mh_execute_header, v86, v87, "Received suggestions: %@", buf, 0xCu);
    }

    v84 = v114;
  }
  v88 = [(SPParsecQueryTask *)v84 resultPipe];
  v89 = [v88 disabledBundles];
  if ([v89 count])
  {
    BOOL v90 = [v88 disabledBundles];
    id v69 = v127;
    int v91 = +[NSSet setWithArray:v90];
  }
  else
  {
    int v91 = 0;
  }

  if (!v114->_canceled)
  {
    v92 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG)) {
      sub_100066270(v14);
    }

    v93 = objc_msgSend(v14, "category_stats");
    [(SPParsecQueryTask *)v114 setCategory_stats:v93];

    v94 = objc_msgSend(v14, "server_features");
    [(SPParsecQueryTask *)v114 setServer_features:v94];

    id v69 = v127;
  }
  v95 = v69;
  if ([v69 count])
  {
    id v96 = [v69 copy];
    [(SPParsecQueryTask *)v114 setParsecResultsCategoryOrder:v96];
  }
  [(SPParsecQueryTask *)v114 setQuerySuggestionResults:v132];
  v114->_suggestionsAreBlended = v104;
  v133 = v91;
  id v97 = v14;
  id v98 = v91;
  id v99 = v131;
  tracing_dispatch_async();
  [v88 addQueryCorrections:v105];
}

- (id)rerankMapsResultsWithLocalSignals:(id)a3 forQueryId:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = logForCSLogCategoryPersonalization();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  uint64_t v9 = v7;
  long long v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "rerankMapsResultsWithLocalSignals", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v11 = [(SPParsecDatastore *)self->_store mapsParsecRanker];
  uint64_t v12 = [v11 rerankMapsResultsWithLocalSignals:v6 forQueryId:a4];

  id v13 = v10;
  id v14 = v13;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)id v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v8, "rerankMapsResultsWithLocalSignals", (const char *)&unk_10007BB1B, v16, 2u);
  }

  return v12;
}

- (SPParsecDatastore)store
{
  return (SPParsecDatastore *)objc_getProperty(self, a2, 128, 1);
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
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)web_fbq
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
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
  return (PRSRankingConfiguration *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRankingInfo:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SDSearchQuery)resultPipe
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);

  return (SDSearchQuery *)WeakRetained;
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

- (PRSQueryTask)parsecQuery
{
  return (PRSQueryTask *)objc_getProperty(self, a2, 200, 1);
}

- (void)setParsecQuery:(id)a3
{
}

- (NSArray)parsecResults
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setParsecResults:(id)a3
{
}

- (NSArray)parsecResultsCategoryOrder
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setParsecResultsCategoryOrder:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecResultsCategoryOrder, 0);
  objc_storeStrong((id *)&self->_parsecResults, 0);
  objc_storeStrong((id *)&self->_parsecQuery, 0);
  objc_destroyWeak((id *)&self->_resultPipe);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rankingInfo, 0);
  objc_storeStrong((id *)&self->_querySuggestionResults, 0);
  objc_storeStrong((id *)&self->_web_fbq, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_server_features, 0);
  objc_storeStrong((id *)&self->_category_stats, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_setOfHiddenApps, 0);
  objc_storeStrong((id *)&self->_setOfVisibleApps, 0);

  objc_storeStrong((id *)&self->_rankingPatterns, 0);
}

@end