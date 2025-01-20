@interface SPCoreSpotlightTask
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)queryID;
- (BOOL)addJob:(id)a3;
- (BOOL)canceled;
- (BOOL)critical;
- (BOOL)finished;
- (BOOL)hasPausedResults;
- (BOOL)wasCanceledByClient;
- (BOOL)willAsyncStart;
- (CSSearchQueryContext)queryContext;
- (NSMutableArray)jobs;
- (NSMutableArray)matchInfo;
- (NSSet)knownBundleIds;
- (NSString)clientBundleID;
- (NSString)queryString;
- (SPCoreSpotlightTask)initWithQueryString:(id)a3 queryContext:(id)a4;
- (SPQueryResultsQueue)resultsQueue;
- (__CFArray)copyMatchInfo;
- (__SIQuery)_makeSIQueryWithQueryString:(id)a3 queryContext:(id)a4;
- (__SIQuery)siQuery;
- (double)startTime;
- (id)_makeAdditionalQueryStringForQueryContext:(id)a3;
- (id)_makeBundleQueryStringForField:(id)a3 withBundleIDs:(id)a4;
- (id)_makeBundleQueryStringForQueryContext:(id)a3;
- (id)_makeDisabledBundlesQueryStringForQueryContext:(id)a3;
- (id)_makeFilterQueryStringForQueryContext:(id)a3;
- (id)_makeInstantAnswersQueryStringForQueryContext:(id)a3;
- (id)_makePrefsQueryStringWithBundleIDs:(id)a3;
- (id)_pommesBundlesWithQueryContext:(id)a3;
- (id)completionBlock;
- (id)scheduleBlock;
- (void)addMatchInfo:(_MDPlistContainer *)a3;
- (void)cancel;
- (void)dealloc;
- (void)finishWithError:(id)a3;
- (void)pauseResults;
- (void)poll;
- (void)removeJob:(id)a3;
- (void)resumeResults;
- (void)schedule;
- (void)setCanceled:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCritical:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setHasPausedResults:(BOOL)a3;
- (void)setJobs:(id)a3;
- (void)setKnownBundleIds:(id)a3;
- (void)setMatchInfo:(id)a3;
- (void)setQueryContext:(id)a3;
- (void)setQueryID:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setResultsQueue:(id)a3;
- (void)setScheduleBlock:(id)a3;
- (void)setSiQuery:(__SIQuery *)a3;
- (void)setStartTime:(double)a3;
- (void)setWasCanceledByClient:(BOOL)a3;
- (void)setWillAsyncStart:(BOOL)a3;
- (void)start;
@end

@implementation SPCoreSpotlightTask

- (__SIQuery)_makeSIQueryWithQueryString:(id)a3 queryContext:(id)a4
{
  v132[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 filterQuery];
  v94 = v7;
  if ([v7 length]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  *((void *)&v89 + 1) = v8;
  cf = [v6 fetchAttributes];

  uint64_t v92 = [v6 nonTopHitFetchAttributeIndexesBits];
  *(void *)&long long v89 = [v6 rankingQueries];

  uint64_t v88 = [v6 maxCount];
  if ([v6 lowPriority]) {
    uint64_t v9 = 270336;
  }
  else {
    uint64_t v9 = 270339;
  }
  v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    qos_class_t v11 = qos_class_self();
    int v12 = [v6 lowPriority];
    uint64_t v13 = 3;
    if (v12) {
      uint64_t v13 = 0;
    }
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v11;
    LOWORD(v104) = 2048;
    *(void *)((char *)&v104 + 2) = v13;
    _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_INFO, "QoS _mSIQWQS: %d prio: %lld", buf, 0x12u);
  }

  if ([v6 grouped]) {
    uint64_t v14 = v9 | 0x800;
  }
  else {
    uint64_t v14 = v9;
  }
  if ([v6 live]) {
    v14 |= 0x400uLL;
  }
  if ([v6 disableBlockingOnIndex]) {
    uint64_t v15 = v14 | 0x10000000;
  }
  else {
    uint64_t v15 = v14;
  }
  if ([v6 disableResultStreaming] && objc_msgSend(v6, "attribute")) {
    v15 |= 0x20000000uLL;
  }
  v16 = [v6 preferredLanguages];
  if (![v16 count])
  {
    uint64_t v17 = [MEMORY[0x263EFF960] preferredLanguages];

    v16 = (void *)v17;
  }
  v98 = v16;
  if ([v5 length])
  {
    if ([v6 attribute])
    {
      if ([v5 characterAtIndex:0] == 64) {
        goto LABEL_32;
      }
      v18 = @"@(%@)";
      goto LABEL_31;
    }
    if ([v6 counting] && objc_msgSend(v5, "characterAtIndex:", 0) != 35)
    {
      v18 = @"#(%@)";
LABEL_31:
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", v18, v5);

      id v5 = (id)v19;
    }
  }
LABEL_32:
  v20 = [v6 options];
  v21 = [v20 objectForKeyedSubscript:@"SPQueryOptionDateQueryContext"];
  char v87 = [v21 BOOLValue];

  v22 = [v6 options];
  v23 = [v22 objectForKeyedSubscript:@"SPQueryOptionDisableMetadataSearch"];
  uint64_t v24 = [v23 BOOLValue];

  v25 = [v6 options];
  v26 = [v25 objectForKeyedSubscript:@"SPQueryOptionDisableSemanticSearch"];
  uint64_t v27 = [v26 BOOLValue];

  v28 = [v6 options];
  v29 = [v28 objectForKeyedSubscript:@"SPQueryOptionDisableU2"];
  uint64_t v30 = [v29 BOOLValue];

  v131[0] = @"disableMetadataSearch";
  v31 = [NSNumber numberWithBool:v24];
  v132[0] = v31;
  v131[1] = @"disableSemanticSearch";
  v32 = [NSNumber numberWithBool:v27];
  v132[1] = v32;
  v131[2] = @"disableU2";
  v33 = [NSNumber numberWithBool:v30];
  v132[2] = v33;
  v131[3] = @"maxANNResultCount";
  v34 = [NSNumber numberWithInteger:1000];
  v132[3] = v34;
  v35 = [NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:4];
  v100 = (void *)[v35 mutableCopy];

  if (_makeSIQueryWithQueryString_queryContext__onceToken != -1) {
    dispatch_once(&_makeSIQueryWithQueryString_queryContext__onceToken, &__block_literal_global_260);
  }
  id v36 = objc_alloc(MEMORY[0x263F02B40]);
  v37 = [v6 queryEmbedding];
  v38 = (void *)[v36 initWithEncodedData:v37];

  if (v38)
  {
    dispatch_async((dispatch_queue_t)_makeSIQueryWithQueryString_queryContext__dasCheckpointQueue, &__block_literal_global_264);
    v39 = [v38 vectors];
    [v100 setObject:v39 forKey:@"vectors"];

    v40 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v38, "dimension"));
    [v100 setObject:v40 forKey:@"vec_dimensions"];

    v41 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v38, "format"));
    [v100 setObject:v41 forKey:@"vec_data_format"];

    v42 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v38, "version"));
    [v100 setObject:v42 forKey:@"vec_version"];
  }
  v43 = [(SPCoreSpotlightTask *)self _pommesBundlesWithQueryContext:v6];
  v44 = [v6 clientBundleID];
  if (+[SDPommesFeature isSearchCLIBundle:v44]) {
    int v45 = [v6 pommes];
  }
  else {
    int v45 = 0;
  }

  if ([v6 rankingType] == 1) {
    goto LABEL_46;
  }
  int v46 = [v6 internal];
  if (((v46 ^ 1 | v45) & 1) == 0)
  {
    if (![v6 grouped] || !objc_msgSend(v6, "maxCount")) {
      goto LABEL_47;
    }
    v47 = [v6 rankingQueries];
    id v48 = (id)[v47 count];

    if (!v48) {
      goto LABEL_48;
    }
LABEL_46:
    id v48 = v43;
    goto LABEL_48;
  }
  if (v46) {
    goto LABEL_46;
  }
LABEL_47:
  id v48 = 0;
LABEL_48:
  v49 = [v6 filterQueries];
  uint64_t v50 = [(SPCoreSpotlightTask *)self _makeBundleQueryStringForQueryContext:v6];
  v97 = [(SPCoreSpotlightTask *)self _makeAdditionalQueryStringForQueryContext:v6];
  v96 = [(SPCoreSpotlightTask *)self _makeInstantAnswersQueryStringForQueryContext:v6];
  uint64_t v51 = [(SPCoreSpotlightTask *)self _makeDisabledBundlesQueryStringForQueryContext:v6];
  uint64_t v52 = v51;
  v85 = (void *)v50;
  v86 = v38;
  v84 = (void *)v51;
  if (!v49)
  {
    if (v50)
    {
      if (v51)
      {
        v129[0] = v50;
        v129[1] = v51;
        v56 = (void *)MEMORY[0x263EFF8C0];
        v57 = v129;
        uint64_t v58 = 2;
LABEL_63:
        v49 = [v56 arrayWithObjects:v57 count:v58];
        goto LABEL_64;
      }
      uint64_t v128 = v50;
      v56 = (void *)MEMORY[0x263EFF8C0];
      v57 = &v128;
    }
    else
    {
      if (!v51)
      {
        v49 = 0;
        goto LABEL_64;
      }
      uint64_t v127 = v51;
      v56 = (void *)MEMORY[0x263EFF8C0];
      v57 = &v127;
    }
    uint64_t v58 = 1;
    goto LABEL_63;
  }
  if (v50)
  {
    if (v51)
    {
      v130[0] = v50;
      v130[1] = v51;
      v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v130 count:2];
      uint64_t v54 = [v49 arrayByAddingObjectsFromArray:v53];
      v55 = v49;
      v49 = (void *)v54;

      goto LABEL_64;
    }
    v59 = v49;
    uint64_t v60 = v50;
  }
  else
  {
    if (!v51) {
      goto LABEL_64;
    }
    v59 = v49;
    uint64_t v60 = v52;
  }
  uint64_t v61 = [v59 arrayByAddingObject:v60];

  v49 = (void *)v61;
LABEL_64:
  uint64_t v62 = SIUserCtxCreateWithLanguages();
  [v6 entitledAttributes];
  SIUserCtxSetEntitlements();
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  $F838635BB3F9A44A0CF925E26405FB30 v112 = ($F838635BB3F9A44A0CF925E26405FB30)0;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v108 = 0u;
  *(void *)buf = 1;
  *(void *)&long long v104 = v5;
  v95 = v5;
  *((void *)&v104 + 1) = v97;
  v105 = v96;
  uint64_t v106 = 0;
  v81 = [v6 completionString];
  v107 = v81;
  *(void *)&long long v108 = [v6 completionResultCount];
  DWORD2(v108) = [v6 completionOptions];
  v80 = [v6 completionAttributes];
  *(void *)&long long v109 = v80;
  v79 = [v6 completionWeights];
  *((void *)&v109 + 1) = v79;
  v63 = [v6 scopes];
  long long v110 = (unint64_t)v63;
  *(void *)&long long v111 = cf;
  *((void *)&v111 + 1) = v62;
  CFTypeRef cfa = (CFTypeRef)v62;
  uint64_t v64 = [v6 queryID];
  unint64_t add = atomic_fetch_add(gQueryID, 1u);
  v112.queryId = v64;
  v112.internalQueryId = add;
  *(void *)&long long v113 = v15;
  *((void *)&v113 + 1) = [v6 maxRankedResultCount];
  *(void *)&long long v114 = v88;
  v66 = [v6 groupingRules];
  *((void *)&v114 + 1) = v66;
  long long v115 = v89;
  *(void *)&long long v116 = 0;
  [v6 currentTime];
  *((void *)&v116 + 1) = v67;
  v68 = [v6 userQuery];
  *(void *)&long long v117 = v68;
  *((void *)&v117 + 1) = v49;
  v90 = v49;
  LOWORD(v118) = [v6 strongRankingQueryCount];
  WORD1(v118) = [v6 dominantRankingQueryCount];
  WORD2(v118) = [v6 dominatedRankingQueryCount];
  WORD3(v118) = [v6 shortcutBit];
  WORD4(v118) = [v6 highMatchBit];
  WORD5(v118) = [v6 lowMatchBit];
  WORD6(v118) = [v6 highRecencyBit];
  HIWORD(v118) = [v6 lowRecencyBit];
  *(void *)&long long v119 = v92;
  *(void *)&long long v120 = [v6 fuzzyMask];
  *((void *)&v120 + 1) = v69;
  *(void *)&long long v121 = [v6 fuzzyMatch];
  *((void *)&v121 + 1) = v70;
  v93 = v43;
  LOBYTE(v122) = [v43 count] != 0;
  v91 = v48;
  *((void *)&v122 + 1) = v48;
  v71 = [v6 rewriteContext];
  v72 = [v71 tokenRewrites];
  *(void *)&long long v123 = v72;
  v73 = [v6 queryUnderstandingOutput];
  *((void *)&v123 + 1) = v73;
  *(void *)&long long v124 = v100;
  v74 = [v6 attributedUserQuery];
  *((void *)&v124 + 1) = v74;
  v75 = [v6 clientBundleID];
  *(void *)&long long v125 = v75;
  v76 = [v6 resultMatchingAttributes];
  *((void *)&v125 + 1) = v76;
  LOBYTE(v126) = v87;
  BYTE1(v126) = [v6 computePhotosDerivedAttributes];

  v77 = (__SIQuery *)SIQueryCreateWithParameters();
  self->_queryID = v112;
  if ([v6 maximumBatchSize])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v101 = 134217984;
      uint64_t v102 = [v6 maximumBatchSize];
      _os_log_impl(&dword_21F1CE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Setting batching parameters corresponding to requested maximum batch size %zd", v101, 0xCu);
    }
    [v6 maximumBatchSize];
    [v6 maximumBatchSize];
    [v6 maximumBatchSize];
    SIQuerySetBatchingParameters();
  }
  if (cfa) {
    CFRelease(cfa);
  }

  return v77;
}

- (id)_pommesBundlesWithQueryContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if ([v3 pommes])
  {
    id v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "_pBWQC: uP: YES", buf, 2u);
    }

    id v6 = [v3 clientBundleID];

    if (v6)
    {
      v7 = [v3 clientBundleID];
      BOOL v8 = +[SDPommesFeature usingPommesRankingForClientBundle:v7];

      if (v8)
      {
        uint64_t v9 = [v3 clientBundleID];
        [v4 addObject:v9];
      }
    }
    v10 = [v3 bundleIDs];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      int v12 = objc_msgSend(v3, "bundleIDs", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            if (+[SDPommesFeature usingPommesRankingForClientBundle:v17])
            {
              [v4 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v14);
      }
    }
    else
    {
      v18 = [v3 clientBundleID];
      BOOL v19 = +[SDPommesFeature isSearchToolClientBundle:v18];

      if (v19) {
        +[SDPommesFeature allBundleIDsUsingPommesRankingSearchTool];
      }
      else {
      int v12 = +[SDPommesFeature allBundleIDsUsingPommesRanking];
      }
      [v4 addObjectsFromArray:v12];
    }
  }
  v20 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    if ([v3 pommes]) {
      v21 = @"YES";
    }
    else {
      v21 = @"NO";
    }
    if ([v4 count]) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = v21;
    __int16 v31 = 2112;
    v32 = v22;
    _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_INFO, "_pBWQC: uP: %@, iPB: %@", buf, 0x16u);
  }

  v23 = [v4 allObjects];

  return v23;
}

- (id)_makeInstantAnswersQueryStringForQueryContext:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 bundleIDs];
  id v5 = [v3 instantAnswersBundleIDs];
  int v46 = [v3 instantAnswersQueries];
  if ([v5 count] || objc_msgSend(v46, "count"))
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v47 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v43 = v5;
    if (!_os_feature_enabled_impl() || v4 && [v4 count])
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v65 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        v40 = v4;
        uint64_t v10 = *(void *)v53;
        uint64_t v45 = *MEMORY[0x263F01E20];
        uint64_t v42 = *(void *)v53;
        do
        {
          uint64_t v11 = 0;
          uint64_t v44 = v9;
          do
          {
            if (*(void *)v53 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v52 + 1) + 8 * v11);
            if ([v5 containsObject:v12])
            {
              id v13 = (id)[[NSString alloc] initWithFormat:@"(%@ == %@)", v45, v12];
              [v47 addObject:v13];
            }
            else
            {
              long long v50 = 0u;
              long long v51 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              id v13 = v46;
              uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v64 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                id v16 = v7;
                uint64_t v17 = *(void *)v49;
                do
                {
                  for (uint64_t i = 0; i != v15; ++i)
                  {
                    if (*(void *)v49 != v17) {
                      objc_enumerationMutation(v13);
                    }
                    BOOL v19 = [*(id *)(*((void *)&v48 + 1) + 8 * i) stringByReplacingOccurrencesOfString:@"<:b:>" withString:v12];
                    [v6 addObject:v19];
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v48 objects:v64 count:16];
                }
                while (v15);
                uint64_t v10 = v42;
                id v5 = v43;
                id v7 = v16;
                uint64_t v9 = v44;
              }
            }

            ++v11;
          }
          while (v11 != v9);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v65 count:16];
        }
        while (v9);
        id v4 = v40;
      }
    }
    else
    {
      v41 = v4;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v20 = v5;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v67 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v61;
        uint64_t v24 = *MEMORY[0x263F01E20];
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v61 != v23) {
              objc_enumerationMutation(v20);
            }
            long long v26 = [NSString stringWithFormat:@"(%@ == %@)", v24, *(void *)(*((void *)&v60 + 1) + 8 * j)];
            [v47 addObject:v26];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v67 count:16];
        }
        while (v22);
      }

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v7 = v46;
      uint64_t v27 = [v7 countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v57 != v29) {
              objc_enumerationMutation(v7);
            }
            __int16 v31 = [NSString stringWithFormat:@"(%@)", *(void *)(*((void *)&v56 + 1) + 8 * k)];
            [v6 addObject:v31];
          }
          uint64_t v28 = [v7 countByEnumeratingWithState:&v56 objects:v66 count:16];
        }
        while (v28);
      }
      id v4 = v41;
      id v5 = v43;
    }

    v32 = [v47 allObjects];
    v33 = [v32 componentsJoinedByString:@" || "];

    uint64_t v34 = [v6 allObjects];
    v35 = [v34 componentsJoinedByString:@" || "];

    if ([v33 length] && objc_msgSend(v35, "length"))
    {
      id v36 = [NSString stringWithFormat:@"((%@) && (%@))", v33, v35];
    }
    else
    {
      if (v33) {
        v37 = v33;
      }
      else {
        v37 = v35;
      }
      id v36 = v37;
    }
    v38 = v36;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (id)_makeDisabledBundlesQueryStringForQueryContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = [a3 disableBundles];
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v26 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
          uint64_t v12 = [MEMORY[0x263F02A50] sharedInstance];
          char v13 = [v12 isFPBundleID:v11];

          if ((v13 & 1) == 0)
          {
            if ([(NSSet *)self->_knownBundleIds containsObject:v11])
            {
              [v5 addObject:v11];
            }
            else
            {
              uint64_t v14 = logForCSLogCategoryDefault();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v11;
                _os_log_debug_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_DEBUG, "Skipping unknown disabled bundle %@", buf, 0xCu);
              }
            }
            if ([v11 isEqualToString:@"com.apple.MobileAddressBook"]) {
              [v5 addObject:@"com.apple.spotlight.contacts"];
            }
            if ([v11 isEqualToString:@"com.apple.spotlight.events"]) {
              [v5 addObject:@"com.apple.spotlight.events"];
            }
            if ([v11 isEqualToString:@"com.apple.usernotificationsd"]) {
              [v5 addObject:@"com.apple.usernotificationsd"];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v8);
    }

    if (v5)
    {
      uint64_t v15 = [(SPCoreSpotlightTask *)self _makeBundleQueryStringForField:@"_kMDItemBundleID" withBundleIDs:v5];
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v17 = [(SPCoreSpotlightTask *)self _makeBundleQueryStringForField:@"kMDItemRelatedAppBundleIdentifier" withBundleIDs:v5];
    v18 = [(SPCoreSpotlightTask *)self _makePrefsQueryStringWithBundleIDs:v6];
    BOOL v19 = [MEMORY[0x263F02A50] sharedInstance];
    id v20 = [v19 filterForDisabledBundles:v6];

    uint64_t v21 = @"false";
    if (v20) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = @"false";
    }
    if (v15) {
      uint64_t v23 = v15;
    }
    else {
      uint64_t v23 = @"false";
    }
    if (v18) {
      uint64_t v24 = v18;
    }
    else {
      uint64_t v24 = @"false";
    }
    if (v17) {
      uint64_t v21 = v17;
    }
    id v16 = [NSString stringWithFormat:@"(!((%@) || (%@) || (%@) || ((%@) && _kMDItemBundleID!=\"com.apple.people.screenTimeRequest\"", v22, v23, v24, v21];

    id v4 = v26;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)_makeBundleQueryStringForQueryContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 bundleIDs];
  uint64_t v5 = [v3 additionalBundleIDs];
  id v6 = [v3 instantAnswersBundleIDs];
  uint64_t v7 = (void *)[v4 mutableCopy];
  v18 = (void *)v5;
  [v7 removeObjectsInArray:v5];
  [v7 removeObjectsInArray:v6];
  BOOL v19 = v4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    uint64_t v13 = *MEMORY[0x263F01E20];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"(%@ == %@)", v13, *(void *)(*((void *)&v20 + 1) + 8 * i)];
        [v8 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    id v16 = [v8 componentsJoinedByString:@" || "];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)_makeAdditionalQueryStringForQueryContext:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 bundleIDs];
  uint64_t v5 = [v3 additionalBundleIDs];
  __int16 v31 = [v3 additionalQueries];
  if ([v5 count] || objc_msgSend(v31, "count"))
  {
    id v27 = v3;
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v32 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v26 = v4;
    obuint64_t j = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      uint64_t v30 = *MEMORY[0x263F01E20];
      uint64_t v28 = *(void *)v39;
      do
      {
        uint64_t v10 = 0;
        uint64_t v29 = v8;
        do
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * v10);
          if ([v5 containsObject:v11])
          {
            id v12 = (id)[[NSString alloc] initWithFormat:@"(%@ == %@)", v30, v11];
            [v32 addObject:v12];
          }
          else
          {
            long long v36 = 0u;
            long long v37 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v12 = v31;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v35;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v35 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = [*(id *)(*((void *)&v34 + 1) + 8 * i) stringByReplacingOccurrencesOfString:@"<:b:>" withString:v11];
                  [v6 addObject:v17];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
              }
              while (v14);
              uint64_t v9 = v28;
              uint64_t v8 = v29;
            }
          }

          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v8);
    }

    v18 = [v32 allObjects];
    BOOL v19 = [v18 componentsJoinedByString:@" || "];

    long long v20 = [v6 allObjects];
    long long v21 = [v20 componentsJoinedByString:@" || "];

    if ([v19 length] && objc_msgSend(v21, "length"))
    {
      id v22 = [NSString stringWithFormat:@"((%@) && (%@))", v19, v21];
    }
    else
    {
      if (v19) {
        long long v23 = v19;
      }
      else {
        long long v23 = v21;
      }
      id v22 = v23;
    }
    uint64_t v24 = v22;

    id v4 = v26;
    id v3 = v27;
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (void)setWillAsyncStart:(BOOL)a3
{
  self->_willAsyncStart = a3;
}

- (void)setScheduleBlock:(id)a3
{
}

- (void)setKnownBundleIds:(id)a3
{
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)critical
{
  return self->_critical;
}

- (id)_makeBundleQueryStringForField:(id)a3 withBundleIDs:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"FieldMatch(%@, "), v5;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      char v12 = 1;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          if (v12) {
            uint64_t v14 = @"\"%@\"";
          }
          else {
            uint64_t v14 = @", \"%@\"";
          }
          objc_msgSend(v7, "appendFormat:", v14, *(void *)(*((void *)&v16 + 1) + 8 * i));
          char v12 = 0;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        char v12 = 0;
      }
      while (v10);
    }

    if ([v8 containsObject:@"com.apple.MobileAddressBook"]
      && ([v8 containsObject:@"com.apple.CoreSuggestions"] & 1) == 0)
    {
      [v7 appendString:@", \"com.apple.CoreSuggestions\""];
    }
    [v7 appendString:@""]);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)start
{
  OUTLINED_FUNCTION_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Start query %@", v2, v3, v4, v5, v6);
}

- (void)schedule
{
  OUTLINED_FUNCTION_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "schedule query %@", v2, v3, v4, v5, v6);
}

- (CSSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)queryID
{
  unint64_t internalQueryId = self->_queryID.internalQueryId;
  unint64_t queryId = self->_queryID.queryId;
  result.var1 = internalQueryId;
  result.var0 = queryId;
  return result;
}

- (SPQueryResultsQueue)resultsQueue
{
  return self->_resultsQueue;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (BOOL)addJob:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    BOOL v6 = [(SPCoreSpotlightTask *)v5 canceled];
    if (!v6) {
      [(NSMutableArray *)v5->_jobs addObject:v4];
    }
    objc_sync_exit(v5);

    BOOL v7 = !v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (__SIQuery)siQuery
{
  return self->_siQuery;
}

- (BOOL)willAsyncStart
{
  return self->_willAsyncStart;
}

- (BOOL)finished
{
  return self->_finished;
}

- (NSString)clientBundleID
{
  return (NSString *)[(CSSearchQueryContext *)self->_queryContext clientBundleID];
}

- (void)removeJob:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NSMutableArray *)v4->_jobs count];
  if (v5)
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSMutableArray *)v4->_jobs objectAtIndex:v6];
      if (v7 == v8) {
        break;
      }

      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    [(NSMutableArray *)v4->_jobs removeObjectAtIndex:v6];
  }
LABEL_7:
  objc_sync_exit(v4);
}

- (void)setSiQuery:(__SIQuery *)a3
{
  self->_siQuery = a3;
}

- (SPCoreSpotlightTask)initWithQueryString:(id)a3 queryContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SPCoreSpotlightTask;
  uint64_t v9 = [(SPCoreSpotlightTask *)&v21 init];
  if (v9)
  {
    v9->_queryID.unint64_t queryId = [v8 queryID];
    objc_storeStrong((id *)&v9->_queryString, a3);
    objc_storeStrong((id *)&v9->_queryContext, a4);
    uint64_t v10 = [v8 clientBundleID];
    if (v10 || [v8 disableResultStreaming])
    {
      uint64_t v11 = (SPQueryResultsQueue *)[[NSString alloc] initWithFormat:@"%@.%ld.%p", v10, objc_msgSend(v8, "queryID"), v9];
      char v12 = [SPQueryResultsQueue alloc];
      uint64_t v13 = +[SPQueryResultsQueue sharedInstanceDispatchQueue:0];
      uint64_t v14 = [v13 dispatchQueue];
      uint64_t v15 = [(SPQueryResultsQueue *)v12 initWithIdentifier:v11 dispatchQueue:v14];
      resultsQueue = v9->_resultsQueue;
      v9->_resultsQueue = (SPQueryResultsQueue *)v15;
    }
    else
    {
      uint64_t v17 = +[SPQueryResultsQueue sharedInstanceDispatchQueue:0];
      uint64_t v11 = v9->_resultsQueue;
      v9->_resultsQueue = (SPQueryResultsQueue *)v17;
    }

    -[SPQueryResultsQueue setLive:](v9->_resultsQueue, "setLive:", [v8 live]);
    long long v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    jobs = v9->_jobs;
    v9->_jobs = v18;

    v9->_critical = 0;
  }

  return v9;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SPCoreSpotlightTask finishWithError:]();
  }

  self->_finished = 1;
  scheduleBlocuint64_t k = self->_scheduleBlock;
  self->_scheduleBlocuint64_t k = 0;

  id v7 = (void (**)(void, void))MEMORY[0x223C48320](self->_completionBlock);
  completionBlocuint64_t k = self->_completionBlock;
  self->_completionBlocuint64_t k = 0;

  if (v7) {
    ((void (**)(void, id))v7)[2](v7, v4);
  }
  if (self->_siQuery)
  {
    SIQueryRelease();
    self->_siQuery = 0;
  }
  uint64_t v9 = logForCSLogCategoryQuery();
  uint64_t v10 = [(SPCoreSpotlightTask *)self queryID];
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)char v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_21F1CE000, v9, OS_SIGNPOST_INTERVAL_END, v11, "SPCoreSpotlightLatency", (const char *)&unk_21F27672A, v12, 2u);
    }
  }
}

- (BOOL)wasCanceledByClient
{
  return self->_wasCanceledByClient;
}

- (void)cancel
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  [(SPCoreSpotlightTask *)v2 setCanceled:1];
  jobs = v2->_jobs;
  if (jobs)
  {
    id v4 = jobs;
    uint64_t v5 = v2->_jobs;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v2->_jobs = 0;

  objc_sync_exit(v2);
  uint64_t v6 = [(NSMutableArray *)jobs count];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = jobs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "cancel", (void)v12);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v8);
  }

  [(SPQueryResultsQueue *)v2->_resultsQueue cancel];
  [(SPCoreSpotlightTask *)v2 resumeResults];
  os_signpost_id_t v11 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = v2;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_INFO, "Canceled task:%p (%lu jobs)", buf, 0x16u);
  }
}

- (void)dealloc
{
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void)resumeResults
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  if ([(SPCoreSpotlightTask *)obj hasPausedResults])
  {
    [(SPCoreSpotlightTask *)obj setHasPausedResults:0];
    [(SPQueryResultsQueue *)obj->_resultsQueue resumeResults];
  }
  objc_sync_exit(obj);
}

- (BOOL)hasPausedResults
{
  return self->_hasPausedResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_jobs, 0);
  objc_storeStrong((id *)&self->_knownBundleIds, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_scheduleBlock, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_resultsQueue, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

- (id)_makePrefsQueryStringWithBundleIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", CFSTR("(_kMDItemBundleID=\"com.apple.Preferences\" && FieldMatch(kMDItemTheme, "));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      char v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          if (v9) {
            os_signpost_id_t v11 = @"\"%@\"";
          }
          else {
            os_signpost_id_t v11 = @", \"%@\"";
          }
          objc_msgSend(v4, "appendFormat:", v11, *(void *)(*((void *)&v13 + 1) + 8 * i));
          char v9 = 0;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        char v9 = 0;
      }
      while (v7);
    }

    [v4 appendString:@"]"));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_makeFilterQueryStringForQueryContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [a3 filterQueries];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "length", (void)v16))
        {
          uint64_t v11 = [v10 length] + 2;
          long long v12 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:v11];
          objc_msgSend(v12, "appendString:", @"(");
          [v12 appendString:v10];
          [v12 appendString:@""]);
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    long long v13 = [v4 componentsJoinedByString:@" && "];
    long long v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v13;
      _os_log_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_INFO, "With filters: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

void __64__SPCoreSpotlightTask__makeSIQueryWithQueryString_queryContext___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.corespotlight.das.checkpoints", v2);
  uint64_t v1 = (void *)_makeSIQueryWithQueryString_queryContext__dasCheckpointQueue;
  _makeSIQueryWithQueryString_queryContext__dasCheckpointQueue = (uint64_t)v0;
}

void __64__SPCoreSpotlightTask__makeSIQueryWithQueryString_queryContext___block_invoke_2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_queue_t v0 = (void *)MEMORY[0x223C480D0]();
  id v3 = 0;
  char v1 = [MEMORY[0x263F298F0] reportFeatureCheckpoint:70 forFeature:900 error:&v3];
  id v2 = v3;
  if ((v1 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21F1CE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to report DAS checkpoint BGSystemTaskFeatureCheckpointAvailable: %@", buf, 0xCu);
  }
}

- (void)pauseResults
{
  *(_DWORD *)a5 = 134218240;
  *(void *)(a5 + 4) = a1;
  *(_WORD *)(a5 + 12) = 2048;
  *(void *)(a5 + 14) = a4;
  _os_log_debug_impl(&dword_21F1CE000, log, OS_LOG_TYPE_DEBUG, "Pause query (%lld,%lld)", (uint8_t *)a5, 0x16u);
}

- (void)poll
{
}

- (void)addMatchInfo:(_MDPlistContainer *)a3
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  matchInfo = obj->_matchInfo;
  if (!matchInfo)
  {
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = obj->_matchInfo;
    obj->_matchInfo = v5;

    matchInfo = obj->_matchInfo;
  }
  [(NSMutableArray *)matchInfo addObject:a3];
  objc_sync_exit(obj);
}

- (__CFArray)copyMatchInfo
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = (__CFArray *)[(NSMutableArray *)v2->_matchInfo copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setQueryString:(id)a3
{
}

- (void)setResultsQueue:(id)a3
{
}

- (void)setQueryContext:(id)a3
{
}

- (void)setQueryID:(id)a3
{
  self->_queryID = ($F838635BB3F9A44A0CF925E26405FB30)a3;
}

- (void)setWasCanceledByClient:(BOOL)a3
{
  self->_wasCanceledByClient = a3;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void)setHasPausedResults:(BOOL)a3
{
  self->_hasPausedResults = a3;
}

- (id)scheduleBlock
{
  return self->_scheduleBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (NSSet)knownBundleIds
{
  return self->_knownBundleIds;
}

- (void)setCritical:(BOOL)a3
{
  self->_critical = a3;
}

- (NSMutableArray)jobs
{
  return self->_jobs;
}

- (void)setJobs:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSMutableArray)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
}

- (void)finishWithError:.cold.1()
{
  OUTLINED_FUNCTION_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Finish query %@", v2, v3, v4, v5, v6);
}

@end