@interface SPGeneralQueryTask
+ (id)contactEntityFromQueryContext:(id)a3;
- (BOOL)didReceiveCompleteCallback;
- (BOOL)newQuery;
- (BOOL)readyToUpdate;
- (BOOL)started;
- (NSArray)showMoreInAppInfo;
- (NSArray)supportedAppScopes;
- (NSString)mutableSessionEntityString;
- (SPClientSession)session;
- (id)displayedText;
- (id)initForSession:(id)a3 withQuery:(id)a4;
- (id)retainAndMergeSections:(id)a3 forState:(unint64_t)a4;
- (id)searchString;
- (id)unsafeSections;
- (id)unsafeSessionEntityString;
- (void)addSections:(id)a3 delayedTopHit:(BOOL)a4;
- (void)cancel;
- (void)clear;
- (void)handleOptionsForNewSections:(id)a3;
- (void)mergeRelatedContentFromSections:(id)a3 bundlesToMerge:(id)a4 mergedSectionId:(id)a5;
- (void)mergeSections;
- (void)processAppResults:(id)a3 maxAppResults:(unint64_t)a4 section:(id)a5 topHitsIndex:(unint64_t *)a6;
- (void)relatedContentSectionMerging:(id)a3;
- (void)searchDaemonQuery:(id)a3 encounteredError:(id)a4;
- (void)searchDaemonQuery:(id)a3 gotResultSet:(id)a4 replace:(BOOL)a5 partiallyComplete:(BOOL)a6 priorityFastPath:(BOOL)a7 update:(BOOL)a8 complete:(BOOL)a9 delayedTopHit:(BOOL)a10 unchanged:(BOOL)a11 forceStable:(BOOL)a12 blendingDuration:(double)a13 geoEntityString:(id)a14 supportedAppScopes:(id)a15 showMoreInAppInfo:(id)a16;
- (void)setDidReceiveCompleteCallback:(BOOL)a3;
- (void)setMutableSessionEntityString:(id)a3;
- (void)setNewQuery:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setShowMoreInAppInfo:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setSupportedAppScopes:(id)a3;
- (void)start;
- (void)truncateSuggestionsSectionToFit:(id)a3;
- (void)updateResultsWithContactHeader;
@end

@implementation SPGeneralQueryTask

+ (id)contactEntityFromQueryContext:(id)a3
{
  v3 = [a3 searchEntities];
  v4 = [v3 firstObject];

  if ([v4 isContactEntitySearch]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)initForSession:(id)a3 withQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SPQueryTask *)self init];
  v9 = v8;
  if (v8)
  {
    [(SPQueryTask *)v8 setQuery:v7];
    [(SPGeneralQueryTask *)v9 setSession:v6];
  }

  return v9;
}

- (void)updateResultsWithContactHeader
{
  id v11 = [(SPQueryTask *)self previousQueryContext];
  v3 = [(id)objc_opt_class() contactEntityFromQueryContext:v11];
  v4 = [(SPQueryTask *)self query];
  v5 = [v4 queryContext];

  id v6 = [(id)objc_opt_class() contactEntityFromQueryContext:v5];
  if (updateResultsWithContactHeader_onceToken_0 != -1) {
    dispatch_once(&updateResultsWithContactHeader_onceToken_0, &__block_literal_global_2);
  }
  if (updateResultsWithContactHeader_isPeopleViewService_0
    || v6 && (!v3 || ([v6 hasSameContactAsContactEntity:v3] & 1) == 0))
  {
    id v7 = objc_alloc(MEMORY[0x263F674A8]);
    v8 = (void *)[v7 initWithSections:MEMORY[0x263EFFA68]];
    v9 = [(SPQueryTask *)self token];
    LODWORD(v10) = 0;
    -[SPGeneralQueryTask searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:](self, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v9, v8, 1, 1, 0, 0, 0.0, v10, 0, 0, 0);
  }
}

void __52__SPGeneralQueryTask_updateResultsWithContactHeader__block_invoke()
{
  id v1 = [MEMORY[0x263F08AB0] processInfo];
  v0 = [v1 processName];
  updateResultsWithContactHeader_isPeopleViewService_0 = [v0 isEqualToString:@"PeopleViewService"];
}

- (void)start
{
  __assert_rtn("-[SPGeneralQueryTask start]", "SPGeneralQueryTask.m", 212, "self.started == NO");
}

void __27__SPGeneralQueryTask_start__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) started]) {
    __27__SPGeneralQueryTask_start__block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) setStarted:1];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  [*(id *)(a1 + 32) setMutableSections:v2];

  id v3 = objc_alloc(MEMORY[0x263F67808]);
  v4 = [*(id *)(a1 + 32) query];
  v5 = objc_msgSend(v3, "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.frontend.query.start", 0, objc_msgSend(v4, "queryIdent"));

  id v6 = [MEMORY[0x263F67498] sharedConnection];
  id v7 = [*(id *)(a1 + 32) query];
  v8 = [*(id *)(a1 + 32) queryProcessor];
  v9 = [v6 startQuery:v7 queue:v8 delegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setToken:v9];

  [*(id *)(a1 + 32) updateResultsWithContactHeader];
  uint64_t v10 = [MEMORY[0x263F674A0] sharedManager];
  id v11 = [*(id *)(a1 + 32) query];
  objc_msgSend(v10, "reportFeedback:queryId:", v5, objc_msgSend(v11, "queryIdent"));

  v12 = SPLogForSPLogCategoryTelemetry();
  v13 = [*(id *)(a1 + 32) token];
  unsigned int v14 = [v13 queryID];

  if (v14 && os_signpost_enabled(v12))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "queryUI", " enableTelemetry=YES ", v16, 2u);
  }

  v15 = [*(id *)(a1 + 32) token];
  [v15 queryID];
  kdebug_trace();
}

- (void)clear
{
  id v4 = [MEMORY[0x263F67498] sharedConnection];
  id v3 = [(SPQueryTask *)self token];
  [v4 clearInput:v3];
}

- (void)cancel
{
  id v3 = [MEMORY[0x263F02A98] sharedInstance];
  [v3 logWithBundleID:@"com.apple.SpotlightUI" indexOperation:4 itemCount:1 reason:@"UserInput"];

  id v5 = [MEMORY[0x263F67498] sharedConnection];
  id v4 = [(SPQueryTask *)self token];
  [v5 cancelQuery:v4];
}

- (id)searchString
{
  id v2 = [(SPQueryTask *)self query];
  id v3 = [v2 queryContext];
  id v4 = [v3 searchString];

  return v4;
}

- (void)mergeSections
{
  id v4 = self;
  uint64_t v207 = *MEMORY[0x263EF8340];
  id v5 = [(SPQueryTask *)self queryProcessor];
  dispatch_assert_queue_V2(v5);

  id v161 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  v151 = v4;
  id v7 = [(SPQueryTask *)v4 mutableSections];
  v8 = [v7 firstObject];

  v9 = [v8 bundleIdentifier];
  LOBYTE(v4) = [v9 isEqualToString:@"com.apple.spotlight.tophits"];

  if ((v4 & 1) == 0)
  {

    v8 = 0;
  }
  v152 = v8;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  uint64_t v10 = [v151 mutableSections];
  id v11 = (void *)[v10 copy];

  obuint64_t j = v11;
  uint64_t v163 = [v11 countByEnumeratingWithState:&v193 objects:v206 count:16];
  if (v163)
  {
    uint64_t v162 = *(void *)v194;
    uint64_t v171 = *MEMORY[0x263F78FF0];
    uint64_t v170 = *MEMORY[0x263F78E88];
    id v153 = v6;
    uint64_t v154 = *MEMORY[0x263F78FD8];
    do
    {
      for (uint64_t i = 0; i != v163; ++i)
      {
        if (*(void *)v194 != v162) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v193 + 1) + 8 * i);
        if (![v13 resultsCount]) {
          continue;
        }
        unsigned int v14 = [v13 title];
        uint64_t v164 = i;
        if (v14)
        {
          v15 = v13;
          v16 = [v13 title];
          uint64_t v17 = [v16 uppercaseString];
        }
        else
        {
          v16 = [v13 bundleIdentifier];
          if (!v16)
          {
            id v19 = 0;
            goto LABEL_14;
          }
          v15 = v13;
          uint64_t v17 = [v13 bundleIdentifier];
        }
        v18 = (void *)v17;
        id v19 = [v161 objectForKey:v17];

        v13 = v15;
LABEL_14:

        if (([v19 doNotFold] & 1) != 0 || objc_msgSend(v13, "doNotFold"))
        {

LABEL_17:
          [v6 addObject:v13];
          v20 = [v13 title];

          if (v20)
          {
            [v13 title];
            v22 = v21 = v13;
            v23 = [v22 uppercaseString];
            [v161 setObject:v21 forKey:v23];

            uint64_t i = v164;
            goto LABEL_142;
          }
          v24 = [v13 bundleIdentifier];

          uint64_t i = v164;
          if (v24)
          {
            uint64_t v25 = [v13 bundleIdentifier];
            v26 = v13;
            v22 = (void *)v25;
            [v161 setObject:v26 forKey:v25];
            goto LABEL_142;
          }
          continue;
        }
        if (!v19) {
          goto LABEL_17;
        }
        id v27 = v19;
        uint64_t v28 = [v6 indexOfObject:v27];
        v169 = v27;
        if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_141;
        }
        uint64_t v29 = v28;
        unint64_t v30 = [v13 maxInitiallyVisibleResults];
        if (v30 <= [v27 maxInitiallyVisibleResults]) {
          v31 = v27;
        }
        else {
          v31 = v13;
        }
        objc_msgSend(v27, "setMaxInitiallyVisibleResults:", objc_msgSend(v31, "maxInitiallyVisibleResults"));
        v157 = v13;
        objc_msgSend(v13, "setMaxInitiallyVisibleResults:", objc_msgSend(v27, "maxInitiallyVisibleResults"));
        [v6 replaceObjectAtIndex:v29 withObject:v27];
        id v172 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        v32 = [v27 resultSet];
        [v32 objectAtIndexedSubscript:0];
        v34 = v33 = v27;
        v35 = [v34 sectionBundleIdentifier];
        v36 = v35;
        uint64_t v37 = v154;
        if (v35)
        {
          id v156 = v35;
        }
        else
        {
          v38 = [v33 resultSet];
          v39 = [v38 objectAtIndexedSubscript:0];
          id v156 = [v39 applicationBundleIdentifier];
        }
        v40 = [v157 resultSet];
        v41 = [v40 objectAtIndexedSubscript:0];
        v42 = [v41 sectionBundleIdentifier];
        v43 = v42;
        if (v42)
        {
          id v155 = v42;
        }
        else
        {
          v44 = [v157 resultSet];
          v45 = [v44 objectAtIndexedSubscript:0];
          id v155 = [v45 applicationBundleIdentifier];
        }
        if (([v156 isEqualToString:@"com.apple.Maps"] & 1) != 0
          || [v155 isEqualToString:@"com.apple.Maps"])
        {
          v46 = v157;
          if ([v156 isEqualToString:@"com.apple.Maps"])
          {
            v47 = [v169 results];
            id v48 = (id)[v47 copy];

            [v169 clearResults];
            v49 = [v157 results];

            if (v49)
            {
              v50 = [v157 results];
              [v169 addResultsFromArray:v50];
            }
            [v157 clearResults];
            if (v48) {
              [v157 addResultsFromArray:v48];
            }
            uint64_t v51 = [v157 domain];
            objc_msgSend(v157, "setDomain:", objc_msgSend(v169, "domain"));
            [v169 setDomain:v51];
            uint64_t v52 = [v157 title];
            v53 = [v169 title];
            [v157 setTitle:v53];

            v54 = (void *)v52;
            [v169 setTitle:v52];
LABEL_77:
          }
          goto LABEL_78;
        }
        if ([v169 domain] != 2)
        {
          v55 = [v169 resultSet];
          v56 = [v55 objectAtIndexedSubscript:0];
          v57 = [v56 applicationBundleIdentifier];
          v58 = v57;
          if (v57)
          {
            id v48 = v57;
          }
          else
          {
            v59 = [v169 resultSet];
            v60 = [v59 objectAtIndexedSubscript:0];
            id v48 = [v60 sectionBundleIdentifier];
          }
          v61 = [v157 resultSet];
          v62 = [v61 objectAtIndexedSubscript:0];
          v63 = [v62 applicationBundleIdentifier];
          v64 = v63;
          if (v63)
          {
            id v160 = v63;
          }
          else
          {
            v65 = [v157 resultSet];
            v66 = [v65 objectAtIndexedSubscript:0];
            id v160 = [v66 sectionBundleIdentifier];
          }
          v67 = [v157 title];
          v165 = [v67 uppercaseString];

          long long v191 = 0u;
          long long v192 = 0u;
          long long v189 = 0u;
          long long v190 = 0u;
          id v167 = [v152 resultSet];
          uint64_t v68 = [v167 countByEnumeratingWithState:&v189 objects:v205 count:16];
          if (!v68)
          {
            v54 = v160;
            goto LABEL_76;
          }
          uint64_t v69 = v68;
          uint64_t v70 = *(void *)v190;
          id v159 = v48;
          v54 = v160;
          while (1)
          {
            for (uint64_t j = 0; j != v69; ++j)
            {
              if (*(void *)v190 != v70) {
                objc_enumerationMutation(v167);
              }
              v72 = *(void **)(*((void *)&v189 + 1) + 8 * j);
              v73 = [v72 title];
              if (!v73) {
                goto LABEL_72;
              }
              if (v48)
              {
                id v3 = [v72 resultBundleId];
                if ([v3 isEqualToString:v48]) {
                  goto LABEL_60;
                }
              }
              if (v54)
              {
                id v2 = [v72 resultBundleId];
                if ([v2 isEqualToString:v54])
                {

                  if (v48) {
LABEL_60:
                  }

LABEL_71:
                  [v172 addObject:v73];
                  goto LABEL_72;
                }
                if (!v165)
                {
                  char v74 = 0;
LABEL_67:

                  goto LABEL_68;
                }
              }
              else if (!v165)
              {
                char v74 = 0;
                goto LABEL_68;
              }
              v75 = v2;
              v76 = v3;
              v77 = [v72 sectionHeader];
              v78 = [v77 uppercaseString];
              char v74 = [v78 isEqual:v165];

              id v3 = v76;
              id v2 = v75;
              id v48 = v159;
              v54 = v160;
              if (v160) {
                goto LABEL_67;
              }
LABEL_68:
              if (v48) {

              }
              if (v74) {
                goto LABEL_71;
              }
LABEL_72:
            }
            uint64_t v69 = [v167 countByEnumeratingWithState:&v189 objects:v205 count:16];
            if (!v69)
            {
LABEL_76:

              v46 = v157;
              goto LABEL_77;
            }
          }
        }
        v46 = v157;
LABEL_78:
        id v168 = v3;
        v79 = [v46 bundleIdentifier];
        int v80 = [v79 isEqualToString:*MEMORY[0x263F67500]];

        if (v80)
        {
          v166 = v2;
          v81 = objc_opt_new();
          long long v185 = 0u;
          long long v186 = 0u;
          long long v187 = 0u;
          long long v188 = 0u;
          v82 = [v169 resultSet];
          uint64_t v83 = [v82 countByEnumeratingWithState:&v185 objects:v204 count:16];
          if (v83)
          {
            uint64_t v84 = v83;
            uint64_t v85 = *(void *)v186;
            do
            {
              for (uint64_t k = 0; k != v84; ++k)
              {
                if (*(void *)v186 != v85) {
                  objc_enumerationMutation(v82);
                }
                v87 = *(void **)(*((void *)&v185 + 1) + 8 * k);
                uint64_t v88 = [v87 resultBundleId];
                if (v88)
                {
                  v89 = (void *)v88;
                  v90 = [v87 completion];

                  if (v90)
                  {
                    v91 = [v87 resultBundleId];
                    v203[0] = v91;
                    v92 = [v87 completion];
                    v203[1] = v92;
                    v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v203 count:2];

                    [v81 setObject:v87 forKeyedSubscript:v93];
                  }
                }
              }
              uint64_t v84 = [v82 countByEnumeratingWithState:&v185 objects:v204 count:16];
            }
            while (v84);
          }

          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          v94 = [v157 resultSet];
          uint64_t v95 = [v94 countByEnumeratingWithState:&v181 objects:v202 count:16];
          if (v95)
          {
            uint64_t v96 = v95;
            uint64_t v97 = *(void *)v182;
            do
            {
              for (uint64_t m = 0; m != v96; ++m)
              {
                if (*(void *)v182 != v97) {
                  objc_enumerationMutation(v94);
                }
                v99 = *(void **)(*((void *)&v181 + 1) + 8 * m);
                uint64_t v100 = [v99 resultBundleId];
                if (v100)
                {
                  v101 = (void *)v100;
                  v102 = [v99 completion];

                  if (v102)
                  {
                    v103 = [v99 resultBundleId];
                    v201[0] = v103;
                    v104 = [v99 completion];
                    v201[1] = v104;
                    v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:v201 count:2];
                    v106 = [v81 objectForKeyedSubscript:v105];

                    if (!v106) {
                      [v169 addResults:v99];
                    }
                  }
                }
              }
              uint64_t v96 = [v94 countByEnumeratingWithState:&v181 objects:v202 count:16];
            }
            while (v96);
          }

          uint64_t v37 = v154;
          id v2 = v166;
        }
        long long v179 = 0u;
        long long v180 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        v107 = [v169 resultSet];
        uint64_t v108 = [v107 countByEnumeratingWithState:&v177 objects:v200 count:16];
        if (v108)
        {
          uint64_t v109 = v108;
          uint64_t v110 = *(void *)v178;
          do
          {
            uint64_t v111 = 0;
            do
            {
              if (*(void *)v178 != v110) {
                objc_enumerationMutation(v107);
              }
              v112 = *(void **)(*((void *)&v177 + 1) + 8 * v111);
              v113 = [v112 resultBundleId];
              int v114 = [v113 isEqualToString:v37];

              if (v114)
              {
                uint64_t v115 = [v112 contentURL];
              }
              else
              {
                v116 = [v112 resultBundleId];
                int v117 = [v116 isEqualToString:v171];

                if (v117
                  || ([v112 contentType],
                      v118 = objc_claimAutoreleasedReturnValue(),
                      int v119 = [v118 isEqualToString:v170],
                      v118,
                      v119))
                {
                  uint64_t v115 = [v112 identifier];
                }
                else
                {
                  uint64_t v121 = [v112 title];
                  if (!v121) {
                    goto LABEL_114;
                  }
                  v122 = (void *)v121;
                  v123 = [v112 title];
                  v124 = [v123 text];

                  if (!v124) {
                    goto LABEL_114;
                  }
                  uint64_t v115 = [v112 title];
                }
              }
              v120 = (void *)v115;
              if (v115)
              {
                [v172 addObject:v115];
              }
LABEL_114:
              ++v111;
            }
            while (v109 != v111);
            uint64_t v125 = [v107 countByEnumeratingWithState:&v177 objects:v200 count:16];
            uint64_t v109 = v125;
          }
          while (v125);
        }

        long long v175 = 0u;
        long long v176 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        v126 = [v157 resultSet];
        uint64_t v127 = [v126 countByEnumeratingWithState:&v173 objects:v199 count:16];
        if (!v127) {
          goto LABEL_140;
        }
        uint64_t v128 = v127;
        uint64_t v129 = *(void *)v174;
        do
        {
          uint64_t v130 = 0;
          do
          {
            if (*(void *)v174 != v129) {
              objc_enumerationMutation(v126);
            }
            v131 = *(void **)(*((void *)&v173 + 1) + 8 * v130);
            v132 = [v131 resultBundleId];
            int v133 = [v132 isEqualToString:v37];

            if (v133)
            {
              uint64_t v134 = [v131 contentURL];
            }
            else
            {
              v135 = [v131 resultBundleId];
              int v136 = [v135 isEqualToString:v171];

              if (v136
                || ([v131 contentType],
                    v137 = objc_claimAutoreleasedReturnValue(),
                    int v138 = [v137 isEqualToString:v170],
                    v137,
                    v138))
              {
                uint64_t v134 = [v131 identifier];
              }
              else
              {
                v139 = [v131 title];
                if (!v139) {
                  goto LABEL_133;
                }
                v140 = [v131 title];
                v141 = [v140 text];

                if (!v141)
                {
                  v139 = 0;
                  goto LABEL_133;
                }
                uint64_t v134 = [v131 title];
              }
            }
            v139 = (void *)v134;
            if (v134 && ([v172 containsObject:v134] & 1) == 0) {
              [v169 addResults:v131];
            }
LABEL_133:

            ++v130;
          }
          while (v128 != v130);
          uint64_t v142 = [v126 countByEnumeratingWithState:&v173 objects:v199 count:16];
          uint64_t v128 = v142;
        }
        while (v142);
LABEL_140:

        id v6 = v153;
        id v3 = v168;
LABEL_141:
        uint64_t i = v164;
        v22 = v169;

LABEL_142:
      }
      uint64_t v163 = [obj countByEnumeratingWithState:&v193 objects:v206 count:16];
    }
    while (v163);
  }

  if (_os_feature_enabled_impl() && [v6 count]) {
    [v151 relatedContentSectionMerging:v6];
  }
  uint64_t v143 = [v6 count];
  [v151 setMutableSections:v6];
  v144 = SPLogForSPLogCategoryDefault();
  os_log_type_t v145 = *MEMORY[0x263F67548] ^ 1;
  BOOL v146 = os_log_type_enabled(v144, v145);
  if (v143)
  {
    if (v146)
    {
      *(_DWORD *)buf = 138412290;
      id v198 = v6;
      os_log_type_t v147 = v145;
      v148 = "Merge sections %@";
      v149 = v144;
      uint32_t v150 = 12;
LABEL_153:
      _os_log_impl(&dword_235D0B000, v149, v147, v148, buf, v150);
    }
  }
  else if (v146)
  {
    *(_WORD *)buf = 0;
    os_log_type_t v147 = v145;
    v148 = "Empty after updates";
    v149 = v144;
    uint32_t v150 = 2;
    goto LABEL_153;
  }
}

- (void)relatedContentSectionMerging:(id)a3
{
  uint64_t v4 = relatedContentSectionMerging__onceToken_0;
  id v5 = a3;
  id v7 = v5;
  if (v4 == -1)
  {
    id v6 = v5;
  }
  else
  {
    dispatch_once(&relatedContentSectionMerging__onceToken_0, &__block_literal_global_115);
    id v6 = v7;
  }
  [(SPGeneralQueryTask *)self mergeRelatedContentFromSections:v6 bundlesToMerge:relatedContentSectionMerging__webBundles_0 mergedSectionId:SectionMergingBlendedWeb];
  [(SPGeneralQueryTask *)self mergeRelatedContentFromSections:v7 bundlesToMerge:relatedContentSectionMerging__musicBundles_0 mergedSectionId:SectionMergingBlendedMusic];
}

void __51__SPGeneralQueryTask_relatedContentSectionMerging___block_invoke()
{
  v12[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F78F88];
  v12[0] = *MEMORY[0x263F78FD8];
  v12[1] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)relatedContentSectionMerging__webBundles_0;
  relatedContentSectionMerging__webBundles_0 = v3;

  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F78FC0];
  v11[0] = *MEMORY[0x263F78F30];
  v11[1] = v6;
  uint64_t v7 = *MEMORY[0x263F78F48];
  v11[2] = *MEMORY[0x263F78F70];
  v11[3] = v7;
  v11[4] = *MEMORY[0x263F78F58];
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
  uint64_t v9 = [v5 setWithArray:v8];
  uint64_t v10 = (void *)relatedContentSectionMerging__musicBundles_0;
  relatedContentSectionMerging__musicBundles_0 = v9;
}

- (void)mergeRelatedContentFromSections:(id)a3 bundlesToMerge:(id)a4 mergedSectionId:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  if ([v7 count])
  {
    unint64_t v11 = 0;
    do
    {
      v12 = [v7 objectAtIndexedSubscript:v11];
      v13 = [v12 bundleIdentifier];
      unsigned int v14 = [v12 results];
      if ([v14 count])
      {
        int v15 = [v8 containsObject:v13];

        if (v15) {
          [v10 addObject:v12];
        }
      }
      else
      {
      }
      ++v11;
    }
    while (v11 < [v7 count]);
  }
  if ([v10 count])
  {
    v16 = [v10 objectAtIndexedSubscript:0];
    if ((unint64_t)[v10 count] >= 2)
    {
      v42 = v16;
      id v43 = v9;
      uint64_t v17 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v10;
        _os_log_impl(&dword_235D0B000, v17, OS_LOG_TYPE_DEFAULT, "[release2023SectionMerging] Merging sections %@", buf, 0xCu);
      }

      v18 = [MEMORY[0x263EFF980] array];
      id v19 = [MEMORY[0x263EFF980] array];
      if ([v10 count])
      {
        unint64_t v20 = 0;
        do
        {
          v21 = objc_msgSend(v10, "objectAtIndexedSubscript:", v20, v42);
          unint64_t v22 = [v21 maxInitiallyVisibleResults];
          if (!v22)
          {
            v23 = [v21 results];
            unint64_t v24 = [v23 count];

            if (v24 >= 3) {
              unint64_t v22 = 3;
            }
            else {
              unint64_t v22 = v24;
            }
          }
          uint64_t v25 = [v21 results];
          unint64_t v26 = [v25 count];

          if (v22 <= v26)
          {
            id v27 = [v21 results];
            uint64_t v28 = objc_msgSend(v27, "subarrayWithRange:", 0, v22);
            [v18 addObjectsFromArray:v28];
          }
          uint64_t v29 = [v21 results];
          unint64_t v30 = [v29 count];

          if (v30 > v22)
          {
            v31 = [v21 results];
            v32 = [v21 results];
            v33 = objc_msgSend(v31, "subarrayWithRange:", v22, objc_msgSend(v32, "count") - v22);
            [v19 addObjectsFromArray:v33];
          }
          [v21 clearResults];

          ++v20;
        }
        while (v20 < [v10 count]);
      }
      v16 = v42;
      objc_msgSend(v42, "addResultsFromArray:", v18, v42);
      [v16 addResultsFromArray:v19];
      objc_msgSend(v16, "setMaxInitiallyVisibleResults:", objc_msgSend(v18, "count"));

      id v9 = v43;
    }
    if ([v9 isEqualToString:SectionMergingBlendedWeb])
    {
      v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v35 = [v34 localizedStringForKey:@"DOMAIN_TITLE_BLENDED_WEB" value:&stru_26E92AFF0 table:@"SpotlightServices"];
      [v16 setTitle:v35];

      if ((unint64_t)[v10 count] >= 2)
      {
        v36 = (void *)MEMORY[0x263F78FD8];
LABEL_31:
        [v16 setPreMergeBundleIdentifier:*v36];
        goto LABEL_32;
      }
    }
    else
    {
      if (![v9 isEqualToString:SectionMergingBlendedMusic])
      {
LABEL_33:
        v40 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = [v16 bundleIdentifier];
          *(_DWORD *)buf = 138412546;
          v45 = v41;
          __int16 v46 = 2112;
          id v47 = v9;
          _os_log_impl(&dword_235D0B000, v40, OS_LOG_TYPE_DEFAULT, "[release2023SectionMerging] Section %@ becomes %@", buf, 0x16u);
        }
        [v16 setBundleIdentifier:v9];

        goto LABEL_36;
      }
      uint64_t v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v38 = [v37 localizedStringForKey:@"DOMAIN_TITLE_BLENDED_MUSIC" value:&stru_26E92AFF0 table:@"SpotlightServices"];
      [v16 setTitle:v38];

      if ((unint64_t)[v10 count] >= 2)
      {
        v36 = (void *)MEMORY[0x263F78F30];
        goto LABEL_31;
      }
    }
    v39 = [v16 bundleIdentifier];
    [v16 setPreMergeBundleIdentifier:v39];

LABEL_32:
    [v16 setMaxInitiallyVisibleResults:3];
    goto LABEL_33;
  }
LABEL_36:
}

- (void)truncateSuggestionsSectionToFit:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(SPQueryTask *)self maxUISuggestions];
  uint64_t v6 = [v4 resultSet];
  id v7 = objc_alloc(MEMORY[0x263EFF9B0]);
  unint64_t v8 = [v4 resultsCount];
  if (v8 >= v5) {
    unint64_t v9 = v5;
  }
  else {
    unint64_t v9 = v8;
  }
  uint64_t v10 = (void *)[v7 initWithCapacity:v9];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unsigned int v14 = 0;
    int64_t v15 = 0;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v18, "type", (void)v21) == 21)
        {
          if (v14) {
            id v19 = v14;
          }
          else {
            id v19 = v18;
          }
          id v20 = v19;

          unsigned int v14 = v20;
        }
        else if (v15 < v5)
        {
          [v10 addObject:v18];
          ++v15;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);

    if (v14)
    {
      if (v15 && v15 >= v5) {
        [v10 replaceObjectAtIndex:v15 - 1 withObject:v14];
      }
      else {
        [v10 addObject:v14];
      }
    }
  }
  else
  {

    unsigned int v14 = 0;
  }
  objc_msgSend(v4, "setResultSet:", v10, (void)v21);
}

- (void)handleOptionsForNewSections:(id)a3
{
  uint64_t v230 = *MEMORY[0x263EF8340];
  id v157 = a3;
  id v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = [MEMORY[0x263F08B88] currentThread];
    *(_DWORD *)buf = 134218240;
    id v227 = v6;
    __int16 v228 = 1024;
    int v229 = [v157 count];
    _os_log_impl(&dword_235D0B000, v4, v5, "[%p] handleOptions for sections (%d)", buf, 0x12u);
  }
  id v7 = SPLogForSPLogCategoryDefault();
  unint64_t v8 = (unsigned char *)MEMORY[0x263F67548];
  os_log_type_t v9 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 138412290;
    id v227 = v157;
    _os_log_impl(&dword_235D0B000, v7, v9, "handleOptionsForNewSections: %@", buf, 0xCu);
  }

  if ([v157 count])
  {
    uint64_t v10 = [(SPQueryTask *)self queryProcessor];
    dispatch_assert_queue_V2(v10);

    id v11 = SPLogForSPLogCategoryDefault();
    os_log_type_t v12 = *v8 ^ 1;
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      id v227 = v157;
      _os_log_impl(&dword_235D0B000, v11, v12, "handleOptionsForNewSections: %@", buf, 0xCu);
    }

    long long v178 = [MEMORY[0x263EFF9A0] dictionary];
    long long v173 = [MEMORY[0x263EFF9A0] dictionary];
    long long v176 = [MEMORY[0x263EFF9A0] dictionary];
    long long v177 = [MEMORY[0x263EFF9A0] dictionary];
    long long v175 = [MEMORY[0x263EFF9A0] dictionary];
    long long v174 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v13 = [(SPQueryTask *)self query];
    unsigned int v14 = [v13 queryContext];
    int64_t v15 = [v14 searchEntities];
    uint64_t v16 = [v15 firstObject];

    id v156 = v16;
    int v17 = [v16 isServerEntitySearch];
    long long v213 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v155 = self;
    v18 = [(SPQueryTask *)self mutableSections];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v213 objects:v225 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v214;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v214 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v213 + 1) + 8 * i);
          long long v24 = [v23 bundleIdentifier];
          int v25 = [v24 hasPrefix:@"com.apple.parsec."];

          if (v25)
          {
            uint64_t v26 = [v23 results];
            id v27 = [v26 firstObject];
            objc_msgSend(v23, "setDoNotFold:", objc_msgSend(v27, "doNotFold"));
          }
          createDedupeDicts(v23, v173, v178, v176, v177, v175, v174, v17);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v213 objects:v225 count:16];
      }
      while (v20);
    }

    long long v211 = 0u;
    long long v212 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    obuint64_t j = v157;
    uint64_t v28 = [obj countByEnumeratingWithState:&v209 objects:v224 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v210;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v210 != v30) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v209 + 1) + 8 * j);
          v33 = [v32 bundleIdentifier];
          int v34 = [v33 hasPrefix:@"com.apple.parsec."];

          if (v34)
          {
            v35 = [v32 results];
            v36 = [v35 firstObject];
            objc_msgSend(v32, "setDoNotFold:", objc_msgSend(v36, "doNotFold"));
          }
          createDedupeDicts(v32, v173, v178, v176, v177, v175, v174, v17);
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v209 objects:v224 count:16];
      }
      while (v29);
    }

    uint64_t v37 = [obj count];
    if (v37)
    {
      uint64_t v38 = v37;
      id v169 = (id)*MEMORY[0x263F79000];
      uint64_t v167 = *MEMORY[0x263F79020];
      uint64_t v154 = *MEMORY[0x263F78E88];
      uint64_t v171 = *MEMORY[0x263F78EB0];
      uint64_t v165 = *MEMORY[0x263F78F80];
      uint64_t v39 = *MEMORY[0x263F78F78];
      while (1)
      {
        v40 = objc_msgSend(obj, "objectAtIndex:", --v38, v154);
        v41 = [v40 bundleIdentifier];
        int v42 = [v41 hasPrefix:@"com.apple.parsec."];

        if (v42)
        {
          id v43 = [v40 results];
          uint64_t v44 = [v43 count];

          if (!v44) {
            goto LABEL_78;
          }
          uint64_t v158 = v38;
          v45 = [v40 results];
          __int16 v46 = (void *)[v45 copy];

          [v40 clearResults];
          long long v207 = 0u;
          long long v208 = 0u;
          long long v205 = 0u;
          long long v206 = 0u;
          id v47 = v46;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v205 objects:v223 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v206;
            do
            {
              for (uint64_t k = 0; k != v49; ++k)
              {
                if (*(void *)v206 != v50) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v52 = *(void **)(*((void *)&v205 + 1) + 8 * k);
                v53 = [v40 bundleIdentifier];
                int v54 = [v53 hasPrefix:@"com.apple.parsec."];

                if (!v54) {
                  goto LABEL_41;
                }
                uint64_t v55 = [v52 storeIdentifier];
                if (v55)
                {
                  v56 = (void *)v55;
                  v57 = [v52 storeIdentifier];
                  v58 = [v178 objectForKey:v57];

                  if (v58) {
                    goto LABEL_40;
                  }
                }
                uint64_t v59 = [v52 calendarIdentifier];
                if (!v59) {
                  goto LABEL_41;
                }
                v60 = (void *)v59;
                v61 = [v52 calendarIdentifier];
                v58 = [v176 objectForKey:v61];

                if (v58)
                {
LABEL_40:
                  handleHiddenResult();
                }
                else
                {
LABEL_41:
                  [v40 addResults:v52];
                }
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v205 objects:v223 count:16];
            }
            while (v49);
          }
          uint64_t v38 = v158;
          goto LABEL_77;
        }
        v62 = [v40 bundleIdentifier];
        int v63 = [v62 isEqualToString:@"com.apple.dictionary"];

        if (v63)
        {
          v64 = [v40 results];
          uint64_t v65 = [v64 count];

          if (!v65) {
            goto LABEL_78;
          }
          v66 = [v40 results];
          v67 = (void *)[v66 copy];

          [v40 clearResults];
          long long v203 = 0u;
          long long v204 = 0u;
          long long v201 = 0u;
          long long v202 = 0u;
          id v47 = v67;
          uint64_t v68 = [v47 countByEnumeratingWithState:&v201 objects:v222 count:16];
          if (v68)
          {
            uint64_t v69 = v68;
            uint64_t v70 = v38;
            uint64_t v71 = *(void *)v202;
            do
            {
              for (uint64_t m = 0; m != v69; ++m)
              {
                if (*(void *)v202 != v71) {
                  objc_enumerationMutation(v47);
                }
                v73 = *(void **)(*((void *)&v201 + 1) + 8 * m);
                char v74 = [v73 identifier];
                if (!v74
                  || ([v177 objectForKey:v74],
                      v75 = objc_claimAutoreleasedReturnValue(),
                      v75,
                      !v75))
                {
                  [v40 addResults:v73];
                }
              }
              uint64_t v69 = [v47 countByEnumeratingWithState:&v201 objects:v222 count:16];
            }
            while (v69);
            goto LABEL_76;
          }
          goto LABEL_77;
        }
        v76 = [v40 bundleIdentifier];
        if ([v76 isEqualToString:v169]) {
          break;
        }
        v77 = [v40 bundleIdentifier];
        int v78 = [v77 isEqualToString:v167];

        if (v78) {
          goto LABEL_61;
        }
        uint64_t v96 = [v40 bundleIdentifier];
        int v97 = [v96 isEqualToString:*MEMORY[0x263F67500]];

        if (v97)
        {
          uint64_t v159 = v38;
          id v161 = objc_alloc_init(MEMORY[0x263F089C8]);
          long long v193 = 0u;
          long long v194 = 0u;
          long long v195 = 0u;
          long long v196 = 0u;
          v98 = [v40 results];
          uint64_t v99 = [v98 countByEnumeratingWithState:&v193 objects:v220 count:16];
          if (v99)
          {
            uint64_t v100 = v99;
            uint64_t v101 = 0;
            uint64_t v102 = *(void *)v194;
            do
            {
              for (uint64_t n = 0; n != v100; ++n)
              {
                if (*(void *)v194 != v102) {
                  objc_enumerationMutation(v98);
                }
                v104 = *(void **)(*((void *)&v193 + 1) + 8 * n);
                v105 = [v104 identifier];
                int v106 = [v105 hasPrefix:v171];

                if (v106)
                {
                  v107 = [v104 sectionBundleIdentifier];
                  char v108 = [v107 isEqualToString:v169];

                  uint64_t v109 = v39;
                  if ((v108 & 1) != 0
                    || (objc_msgSend(v104, "sectionBundleIdentifier", v39),
                        uint64_t v110 = objc_claimAutoreleasedReturnValue(),
                        int v111 = [v110 isEqualToString:v167],
                        v110,
                        uint64_t v109 = v165,
                        v111))
                  {
                    uint64_t v112 = [v175 objectForKey:v109];
                    if (v112)
                    {
                      v113 = (void *)v112;
                      handleHiddenResult();
                      [v161 addIndex:v101 + n];
                    }
                  }
                }
              }
              uint64_t v100 = [v98 countByEnumeratingWithState:&v193 objects:v220 count:16];
              v101 += n;
            }
            while (v100);
          }

          int v114 = [v40 resultSet];
          [v114 removeObjectsAtIndexes:v161];

          [(SPGeneralQueryTask *)v155 truncateSuggestionsSectionToFit:v40];
          uint64_t v38 = v159;
          goto LABEL_80;
        }
        uint64_t v115 = [v40 bundleIdentifier];
        int v116 = [v115 isEqualToString:v154];

        if (v116)
        {
          int v117 = [v40 results];
          uint64_t v118 = [v117 count];

          if (v118)
          {
            int v119 = [v40 results];
            v120 = (void *)[v119 copy];

            [v40 clearResults];
            long long v191 = 0u;
            long long v192 = 0u;
            long long v189 = 0u;
            long long v190 = 0u;
            id v47 = v120;
            uint64_t v121 = [v47 countByEnumeratingWithState:&v189 objects:v219 count:16];
            if (v121)
            {
              uint64_t v122 = v121;
              uint64_t v70 = v38;
              uint64_t v123 = *(void *)v190;
              do
              {
                for (iuint64_t i = 0; ii != v122; ++ii)
                {
                  if (*(void *)v190 != v123) {
                    objc_enumerationMutation(v47);
                  }
                  uint64_t v125 = *(void **)(*((void *)&v189 + 1) + 8 * ii);
                  v126 = [v125 applicationBundleIdentifier];
                  uint64_t v127 = [v174 objectForKey:v126];
                  uint64_t v128 = (void *)v127;
                  if (v126) {
                    BOOL v129 = v127 == 0;
                  }
                  else {
                    BOOL v129 = 1;
                  }
                  if (v129) {
                    [v40 addResults:v125];
                  }
                  else {
                    handleHiddenResult();
                  }
                }
                uint64_t v122 = [v47 countByEnumeratingWithState:&v189 objects:v219 count:16];
              }
              while (v122);
              goto LABEL_76;
            }
LABEL_77:
          }
        }
LABEL_78:
        if (![v40 resultsCount]) {
          [obj removeObjectAtIndex:v38];
        }
LABEL_80:

        if (!v38) {
          goto LABEL_112;
        }
      }

LABEL_61:
      v79 = [v40 results];
      uint64_t v80 = [v79 count];

      if (!v80) {
        goto LABEL_78;
      }
      uint64_t v70 = v38;
      v81 = [v40 results];
      v82 = (void *)[v81 copy];

      [v40 clearResults];
      long long v199 = 0u;
      long long v200 = 0u;
      long long v197 = 0u;
      long long v198 = 0u;
      id v47 = v82;
      uint64_t v83 = [v47 countByEnumeratingWithState:&v197 objects:v221 count:16];
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v85 = *(void *)v198;
        do
        {
          for (juint64_t j = 0; jj != v84; ++jj)
          {
            if (*(void *)v198 != v85) {
              objc_enumerationMutation(v47);
            }
            v87 = *(void **)(*((void *)&v197 + 1) + 8 * jj);
            uint64_t v88 = [v87 identifier];
            int v89 = [v88 hasPrefix:v171];

            if (v89)
            {
              v90 = [v87 sectionBundleIdentifier];
              char v91 = [v90 isEqualToString:v169];

              uint64_t v92 = v39;
              if ((v91 & 1) == 0
                && (objc_msgSend(v87, "sectionBundleIdentifier", v39),
                    v93 = objc_claimAutoreleasedReturnValue(),
                    int v94 = [v93 isEqualToString:v167],
                    v93,
                    uint64_t v92 = v165,
                    !v94)
                || ([v175 objectForKey:v92], (uint64_t v95 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                [v40 addResults:v87];
                uint64_t v95 = 0;
              }
            }
            else
            {
              [v40 addResults:v87];
            }
          }
          uint64_t v84 = [v47 countByEnumeratingWithState:&v197 objects:v221 count:16];
        }
        while (v84);
      }
LABEL_76:
      uint64_t v38 = v70;
      goto LABEL_77;
    }
LABEL_112:
    [v178 removeAllObjects];
    [v173 removeAllObjects];
    [v176 removeAllObjects];
    [v177 removeAllObjects];
    [v175 removeAllObjects];
    [v174 removeAllObjects];
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id v162 = obj;
    uint64_t v166 = [v162 countByEnumeratingWithState:&v185 objects:v218 count:16];
    if (!v166) {
      goto LABEL_146;
    }
    id obja = *(id *)v186;
    uint64_t v160 = *MEMORY[0x263F674E0];
LABEL_114:
    uint64_t v130 = 0;
    while (1)
    {
      if (*(id *)v186 != obja) {
        objc_enumerationMutation(v162);
      }
      v131 = *(void **)(*((void *)&v185 + 1) + 8 * v130);
      v132 = [v131 bundleIdentifier];
      if ([v132 isEqualToString:@"com.apple.spotlight.tophits"]) {
        goto LABEL_120;
      }
      int v133 = [v131 bundleIdentifier];
      if ([v133 isEqualToString:v160]) {
        break;
      }
      v151 = [v131 bundleIdentifier];
      char v152 = [v151 isEqualToString:*MEMORY[0x263F67500]];

      if (v152) {
        goto LABEL_121;
      }
LABEL_141:
      if (++v130 == v166)
      {
        uint64_t v153 = [v162 countByEnumeratingWithState:&v185 objects:v218 count:16];
        uint64_t v166 = v153;
        if (!v153)
        {
LABEL_146:

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __50__SPGeneralQueryTask_handleOptionsForNewSections___block_invoke;
          block[3] = &unk_264C76B08;
          id v180 = v162;
          dispatch_sync(MEMORY[0x263EF83A0], block);

          goto LABEL_147;
        }
        goto LABEL_114;
      }
    }

LABEL_120:
LABEL_121:
    uint64_t v168 = v130;
    id v172 = objc_alloc_init(MEMORY[0x263F089C8]);
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    uint64_t v134 = v131;
    id v170 = [v131 results];
    uint64_t v135 = [v170 countByEnumeratingWithState:&v181 objects:v217 count:16];
    if (v135)
    {
      uint64_t v136 = v135;
      uint64_t v137 = 0;
      uint64_t v138 = *(void *)v182;
      do
      {
        for (kuint64_t k = 0; kk != v136; ++kk)
        {
          if (*(void *)v182 != v138) {
            objc_enumerationMutation(v170);
          }
          v140 = *(void **)(*((void *)&v181 + 1) + 8 * kk);
          v141 = updateDedupeDictsForResult(v140, v173, v178, v176, v177, v175, v174);
          uint64_t v142 = v141;
          if (v141)
          {
            uint64_t v143 = [v141 inlineCard];
            uint64_t v144 = [v140 inlineCard];
            os_log_type_t v145 = (void *)v144;
            if (v143) {
              BOOL v146 = 1;
            }
            else {
              BOOL v146 = v144 == 0;
            }
            if (!v146) {
              [v142 setInlineCard:v144];
            }
            os_log_type_t v147 = [v142 compactCard];

            v148 = [v140 compactCard];

            if (v147) {
              BOOL v149 = 1;
            }
            else {
              BOOL v149 = v148 == 0;
            }
            if (!v149) {
              [v142 setCompactCard:v148];
            }
            handleHiddenResult();
            [v172 addIndex:v137 + kk];
          }
        }
        uint64_t v136 = [v170 countByEnumeratingWithState:&v181 objects:v217 count:16];
        v137 += kk;
      }
      while (v136);
    }

    uint32_t v150 = [v134 resultSet];
    [v150 removeObjectsAtIndexes:v172];

    uint64_t v130 = v168;
    goto LABEL_141;
  }
LABEL_147:
}

void __50__SPGeneralQueryTask_handleOptionsForNewSections___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = [*(id *)(a1 + 32) count];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v18 = *MEMORY[0x263F674E0];
    while (1)
    {
      uint64_t v3 = [*(id *)(a1 + 32) objectAtIndex:--v2];
      id v4 = [v3 bundleIdentifier];
      if ([v4 isEqualToString:@"com.apple.spotlight.tophits"]) {
        goto LABEL_6;
      }
      os_log_type_t v5 = [v3 bundleIdentifier];
      if ([v5 isEqualToString:v18]) {
        break;
      }
      uint64_t v16 = [v3 bundleIdentifier];
      char v17 = [v16 isEqualToString:*MEMORY[0x263F67500]];

      if (v17) {
        goto LABEL_7;
      }
LABEL_21:

      if (!v2) {
        return;
      }
    }

LABEL_6:
LABEL_7:
    uint64_t v20 = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v3 results];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
          if ([v11 isLocalApplicationResult])
          {
            if (SectionMergingBlendedMusic_block_invoke_onceToken != -1) {
              dispatch_once(&SectionMergingBlendedMusic_block_invoke_onceToken, &__block_literal_global_141);
            }
            os_log_type_t v12 = (void *)SectionMergingBlendedMusic_block_invoke_sbsservice;
            uint64_t v13 = [v11 applicationBundleIdentifier];
            unsigned int v14 = [v12 folderPathToIconWithBundleIdentifier:v13];

            if ((unint64_t)[v14 count] >= 2)
            {
              int64_t v15 = [v14 firstObject];
              [v11 setAuxiliaryTopText:v15];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    uint64_t v2 = v20;
    goto LABEL_21;
  }
}

uint64_t __50__SPGeneralQueryTask_handleOptionsForNewSections___block_invoke_2()
{
  SectionMergingBlendedMusic_block_invoke_sbsservice = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)addSections:(id)a3 delayedTopHit:(BOOL)a4
{
  id v8 = a3;
  -[SPGeneralQueryTask handleOptionsForNewSections:](self, "handleOptionsForNewSections:");
  if (a4)
  {
    if (![v8 count]) {
      goto LABEL_6;
    }
    uint64_t v6 = [(SPQueryTask *)self mutableSections];
    uint64_t v7 = [v8 firstObject];
    [v6 insertObject:v7 atIndex:0];
  }
  else
  {
    uint64_t v6 = [(SPQueryTask *)self mutableSections];
    [v6 addObjectsFromArray:v8];
  }

LABEL_6:
  [(SPGeneralQueryTask *)self mergeSections];
}

- (id)unsafeSessionEntityString
{
  uint64_t v2 = [(SPGeneralQueryTask *)self mutableSessionEntityString];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)readyToUpdate
{
  return [(SPQueryTask *)self unsafeState] != 0;
}

- (id)displayedText
{
  uint64_t v3 = [(SPQueryTask *)self query];
  id v4 = [v3 queryContext];

  if ([v4 hasMarkedText])
  {
    os_log_type_t v5 = [v4 markedTextArray];
    uint64_t v6 = [v5 componentsJoinedByString:&stru_26E92AFF0];
  }
  else
  {
    uint64_t v6 = [(SPGeneralQueryTask *)self searchString];
  }

  return v6;
}

- (void)processAppResults:(id)a3 maxAppResults:(unint64_t)a4 section:(id)a5 topHitsIndex:(unint64_t *)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 bundleIdentifier];
  int v11 = [v10 isEqualToString:@"com.apple.spotlight.tophits"];

  os_log_type_t v12 = [v9 bundleIdentifier];
  char v13 = [v12 isEqualToString:*MEMORY[0x263F674E0]];

  if ((v13 & 1) != 0 || v11)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    unsigned int v14 = [v9 results];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
LABEL_5:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
        if ([v19 isLocalApplicationResult] && (objc_msgSend(v19, "isAppClip") & 1) == 0)
        {
          uint64_t v20 = [v19 title];
          [v20 setMaxLines:1];

          long long v21 = [v9 bundleIdentifier];
          int v22 = [v21 isEqualToString:@"com.apple.spotlight.tophits"];

          if (v22)
          {
            ++*a6;
            objc_msgSend(v8, "insertObject:atIndex:", v19);
          }
          else
          {
            [v8 addObject:v19];
          }
          if ([v8 count] >= a4) {
            break;
          }
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v16) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    [v9 setMaxInitiallyVisibleResults:a4];
  }
}

- (id)unsafeSections
{
  uint64_t v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235D0B000, v3, v4, "unsafeSections", buf, 2u);
  }

  os_log_type_t v5 = [(SPQueryTask *)self mutableSections];
  uint64_t v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  uint64_t v10 = [v9 firstObject];
  int v11 = [v10 bundleIdentifier];
  int v12 = [v11 isEqual:@"com.apple.spotlight.tophits"];

  if (v12)
  {
    uint64_t v13 = [v9 firstObject];
    if (v13)
    {
      unsigned int v14 = (void *)v13;
      unint64_t v15 = [(SPQueryTask *)self maxTopHitAppResults];
      uint64_t v26 = 0;
      [(SPGeneralQueryTask *)self processAppResults:0 maxAppResults:v15 section:v14 topHitsIndex:&v26];
      uint64_t v16 = [v14 resultSet];
      unint64_t v17 = [v16 count];

      if (v17 > v15)
      {
        uint64_t v18 = [v14 resultSet];
        uint64_t v19 = [v14 resultSet];
        objc_msgSend(v18, "removeObjectsInRange:", v15, objc_msgSend(v19, "count") - v15);
      }
    }
  }
  uint64_t v20 = (void *)MEMORY[0x263F78E40];
  long long v21 = [(SPQueryTask *)self query];
  int v22 = [v21 queryContext];
  long long v23 = [(SPGeneralQueryTask *)self showMoreInAppInfo];
  long long v24 = objc_msgSend(v20, "buildSectionsWithSections:queryContext:searchInAppInfo:renderState:", v9, v22, v23, -[SPQueryTask unsafeState](self, "unsafeState"));

  return v24;
}

- (void)searchDaemonQuery:(id)a3 gotResultSet:(id)a4 replace:(BOOL)a5 partiallyComplete:(BOOL)a6 priorityFastPath:(BOOL)a7 update:(BOOL)a8 complete:(BOOL)a9 delayedTopHit:(BOOL)a10 unchanged:(BOOL)a11 forceStable:(BOOL)a12 blendingDuration:(double)a13 geoEntityString:(id)a14 supportedAppScopes:(id)a15 showMoreInAppInfo:(id)a16
{
  BOOL v18 = a7;
  BOOL v19 = a6;
  BOOL v83 = a5;
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v84 = a3;
  id v22 = a4;
  id v86 = a14;
  id v23 = a15;
  id v85 = a16;
  long long v24 = [(SPQueryTask *)self queryProcessor];
  dispatch_assert_queue_V2(v24);

  id v25 = objc_alloc(MEMORY[0x263F67808]);
  uint64_t v26 = [(SPQueryTask *)self query];
  uint64_t v27 = objc_msgSend(v25, "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.frontend.query.end", 0, objc_msgSend(v26, "queryIdent"));

  uint64_t v28 = [MEMORY[0x263F674A0] sharedManager];
  uint64_t v29 = [(SPQueryTask *)self query];
  v81 = (void *)v27;
  objc_msgSend(v28, "reportFeedback:queryId:", v27, objc_msgSend(v29, "queryIdent"));

  staleResultsTimer = self->_staleResultsTimer;
  if (staleResultsTimer)
  {
    dispatch_source_cancel(staleResultsTimer);
    v31 = self->_staleResultsTimer;
    self->_staleResultsTimer = 0;
  }
  if (v19 || a8 || v18 || a9)
  {
    uint64_t v32 = 2;
    if (!v19) {
      uint64_t v32 = 3;
    }
    if (v18) {
      uint64_t v32 = 1;
    }
    if (a9) {
      uint64_t v33 = 4;
    }
    else {
      uint64_t v33 = v32;
    }
    [(SPQueryTask *)self setUnsafeState:v33];
  }
  uint64_t v34 = [v23 count];
  id v35 = v23;
  v36 = v84;
  uint64_t v37 = v86;
  if (v34) {
    [(SPGeneralQueryTask *)self setSupportedAppScopes:v35];
  }
  v82 = v35;
  if ([v85 count]) {
    [(SPGeneralQueryTask *)self setShowMoreInAppInfo:v85];
  }
  if (([(SPQueryTask *)self forceStableResults] || a12)
    && ([v22 stableSections], (uint64_t v38 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v39 = (void *)v38;
    v40 = [v22 stableSections];
  }
  else
  {
    v40 = [v22 resultSections];
  }
  if (v83)
  {
    v41 = [(SPQueryTask *)self mutableSections];
    [v41 removeAllObjects];

    [(SPGeneralQueryTask *)self setMutableSessionEntityString:0];
  }
  if (v86) {
    [(SPGeneralQueryTask *)self setMutableSessionEntityString:v86];
  }
  if ([v40 count])
  {
    if (!a11)
    {
      int v42 = (void *)[v40 mutableCopy];
      [(SPGeneralQueryTask *)self addSections:v42 delayedTopHit:a10];

      [v84 queryID];
      kdebug_trace();
      if ([(SPGeneralQueryTask *)self newQuery])
      {
        [(SPGeneralQueryTask *)self setNewQuery:0];
        id v43 = [v84 query];
        uint64_t v44 = [v43 creationStamp];
        v45 = [MEMORY[0x263F086E0] mainBundle];
        __int16 v46 = [v45 bundleIdentifier];
        sp_analytics_log_timing_with_bundle_id((uint64_t)"com.apple.searchd.query.client", "ttfr", v44, v46);

        uint64_t v37 = v86;
      }
    }
  }
  id v47 = [(SPGeneralQueryTask *)self unsafeSections];
  uint64_t v48 = SPLogForSPLogCategoryDefault();
  os_log_type_t v49 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v48, v49))
  {
    *(_DWORD *)buf = 138412290;
    double v91 = *(double *)&v47;
    _os_log_impl(&dword_235D0B000, v48, v49, "sections: %@", buf, 0xCu);
  }

  if (!a11 && [(SPGeneralQueryTask *)self readyToUpdate])
  {
    if (![(SPGeneralQueryTask *)self didReceiveCompleteCallback])
    {
      [v84 queryID];
      kdebug_trace();
      uint64_t v50 = SPLogForSPLogCategoryTelemetry();
      unsigned int v51 = [v84 queryID];
      if (v51)
      {
        unsigned int v52 = v51;
        if (os_signpost_enabled(v50))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_235D0B000, v50, OS_SIGNPOST_INTERVAL_END, v52, "queryUI", " enableTelemetry=YES ", buf, 2u);
        }
      }
    }
    v53 = [(SPGeneralQueryTask *)self session];
    int v54 = (void *)MEMORY[0x263F78E18];
    uint64_t v55 = [v84 query];
    v56 = [v55 queryContext];
    v57 = [v56 queryIntent];
    objc_msgSend(v53, "finishRanking:blendingDuration:spotlightQueryIntent:", v47, objc_msgSend(v54, "spotlightQueryIntent:", v57), a13);

    [(SPGeneralQueryTask *)self setDidReceiveCompleteCallback:1];
    if (v83) {
      v58 = "session reset";
    }
    else {
      v58 = "session complete";
    }
    uint64_t v59 = [v84 query];
    uint64_t v60 = [v59 creationStamp];
    v61 = [MEMORY[0x263F086E0] mainBundle];
    v62 = [v61 bundleIdentifier];
    unint64_t v63 = sp_analytics_log_timing_with_bundle_id((uint64_t)"com.apple.searchd.query.client", v58, v60, v62);

    v64 = SPLogForSPLogCategoryDefault();
    os_log_type_t v65 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v64, v65))
    {
      *(_DWORD *)buf = 134217984;
      double v91 = (double)v63 / 1000000000.0;
      _os_log_impl(&dword_235D0B000, v64, v65, "- SearchAgent time %gs", buf, 0xCu);
    }

    v36 = v84;
    uint64_t v37 = v86;
  }
  v66 = [v36 query];
  v67 = [v66 queryContext];
  int v68 = [v67 fetchL2Signals];

  if (v68)
  {
    id v80 = v22;
    uint64_t v69 = (void *)MEMORY[0x263F08910];
    uint64_t v70 = [(SPQueryTask *)self mutableSections];
    id v88 = 0;
    uint64_t v71 = [v69 archivedDataWithRootObject:v70 requiringSecureCoding:1 error:&v88];
    id v72 = v88;

    if (v72)
    {
      v73 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:]((uint64_t)v72, v73);
      }
      char v74 = 0;
      v75 = v85;
    }
    else
    {
      v76 = (void *)MEMORY[0x263F08928];
      v77 = (void *)MEMORY[0x263EFFA08];
      v89[0] = objc_opt_class();
      v89[1] = objc_opt_class();
      v89[2] = objc_opt_class();
      v89[3] = objc_opt_class();
      v89[4] = objc_opt_class();
      v89[5] = objc_opt_class();
      int v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:6];
      v79 = [v77 setWithArray:v78];
      id v87 = 0;
      char v74 = [v76 unarchivedObjectOfClasses:v79 fromData:v71 error:&v87];
      id v72 = v87;

      if (!v72)
      {
        v75 = v85;
        goto LABEL_57;
      }
      v73 = SPLogForSPLogCategoryDefault();
      v75 = v85;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:]((uint64_t)v72, v73);
      }
    }

LABEL_57:
    [(SPQueryTask *)self updateResultsThroughDelegate:0 state:[(SPQueryTask *)self unsafeState] unchanged:a11 sections:v74];

    id v22 = v80;
    uint64_t v37 = v86;
    goto LABEL_58;
  }
  [(SPQueryTask *)self updateResultsThroughDelegate:0 state:[(SPQueryTask *)self unsafeState] unchanged:a11 sections:v47];
  v75 = v85;
LABEL_58:
}

- (void)searchDaemonQuery:(id)a3 encounteredError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SPQueryTask *)self queryProcessor];
  dispatch_assert_queue_V2(v8);

  id v9 = [(SPQueryTask *)self token];
  LODWORD(v8) = [v9 isEqual:v6];

  if (v8)
  {
    uint64_t v10 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SPGeneralQueryTask searchDaemonQuery:encounteredError:]((uint64_t)v7, (uint64_t)v6, v10);
    }
  }
}

- (id)retainAndMergeSections:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SPGeneralQueryTask *)self session];
  id v8 = [(SPQueryTask *)self query];
  id v9 = [v8 queryContext];
  unint64_t v10 = [v9 queryKind] - 5;

  if (v10 < 4)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    int v11 = &_os_log_internal;
    int v12 = "Skipped 1";
    goto LABEL_11;
  }
  if (!v7)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    int v11 = &_os_log_internal;
    int v12 = "Skipped 2";
    goto LABEL_11;
  }
  if (a4 != 1)
  {
    uint64_t v13 = [(SPQueryTask *)self query];
    [v7 setLastSections:v6 forQuery:v13];
LABEL_13:

    goto LABEL_14;
  }
  if (self->_staleResultsFired)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    int v11 = &_os_log_internal;
    int v12 = "Skipped 3";
    goto LABEL_11;
  }
  if ([v6 count] == 1)
  {
    uint64_t v13 = [v6 objectAtIndex:0];
    unint64_t v15 = [v13 bundleIdentifier];
    int v16 = [v15 isEqual:@"com.apple.spotlight.tophits"];

    if (v16)
    {
      unint64_t v17 = [(SPQueryTask *)self query];
      BOOL v18 = (void *)[v7 copyStaleSectionsForQuery:v17];

      if ([v18 count])
      {
        BOOL v19 = (void *)[v18 mutableCopy];
        uint64_t v20 = [v18 objectAtIndex:0];
        long long v21 = [(SPQueryTask *)self queryProcessor];
        id v22 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v21);
        staleResultsTimer = self->_staleResultsTimer;
        self->_staleResultsTimer = v22;

        long long v24 = self->_staleResultsTimer;
        dispatch_time_t v25 = dispatch_time(0, 750000000);
        dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        uint64_t v26 = self->_staleResultsTimer;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __54__SPGeneralQueryTask_retainAndMergeSections_forState___block_invoke;
        handler[3] = &unk_264C76B30;
        objc_copyWeak(v33, (id *)buf);
        v33[1] = (id)1;
        id v27 = v6;
        id v32 = v27;
        dispatch_source_set_event_handler(v26, handler);
        dispatch_activate((dispatch_object_t)self->_staleResultsTimer);
        uint64_t v28 = [v20 bundleIdentifier];
        LODWORD(v26) = [v28 isEqual:@"com.apple.spotlight.tophits"];

        BOOL v29 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v29)
          {
            *(_WORD *)uint64_t v30 = 0;
            _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Merged - case 1!", v30, 2u);
          }
          [v19 replaceObjectAtIndex:0 withObject:v13];
        }
        else
        {
          if (v29)
          {
            *(_WORD *)uint64_t v30 = 0;
            _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Merged - case 2!", v30, 2u);
          }
          [v19 insertObject:v13 atIndex:0];
        }

        objc_destroyWeak(v33);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Skipped 6", buf, 2u);
        }
        BOOL v19 = v6;
      }

      id v6 = v19;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Skipped 5", buf, 2u);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    int v11 = &_os_log_internal;
    int v12 = "Skipped 4";
LABEL_11:
    _os_log_impl(&dword_235D0B000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
  }
LABEL_14:

  return v6;
}

void __54__SPGeneralQueryTask_retainAndMergeSections_forState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_log_type_t v4 = 0;
      _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Clear stale results -- timeout", v4, 2u);
    }
    *((unsigned char *)WeakRetained + 200) = 1;
    dispatch_source_cancel(*((dispatch_source_t *)WeakRetained + 24));
    uint64_t v3 = (void *)*((void *)WeakRetained + 24);
    *((void *)WeakRetained + 24) = 0;

    [WeakRetained updateResultsThroughDelegate:0 state:*(void *)(a1 + 48) unchanged:0 sections:*(void *)(a1 + 32)];
  }
}

- (SPClientSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (SPClientSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSString)mutableSessionEntityString
{
  return self->_mutableSessionEntityString;
}

- (void)setMutableSessionEntityString:(id)a3
{
}

- (NSArray)showMoreInAppInfo
{
  return self->_showMoreInAppInfo;
}

- (void)setShowMoreInAppInfo:(id)a3
{
}

- (BOOL)didReceiveCompleteCallback
{
  return self->_didReceiveCompleteCallback;
}

- (void)setDidReceiveCompleteCallback:(BOOL)a3
{
  self->_didReceiveCompleteCallbacuint64_t k = a3;
}

- (BOOL)newQuery
{
  return self->_newQuery;
}

- (void)setNewQuery:(BOOL)a3
{
  self->_newQuery = a3;
}

- (NSArray)supportedAppScopes
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSupportedAppScopes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedAppScopes, 0);
  objc_storeStrong((id *)&self->_showMoreInAppInfo, 0);
  objc_storeStrong((id *)&self->_mutableSessionEntityString, 0);
  objc_destroyWeak((id *)&self->_session);

  objc_storeStrong((id *)&self->_staleResultsTimer, 0);
}

void __27__SPGeneralQueryTask_start__block_invoke_cold_1()
{
  __assert_rtn("-[SPGeneralQueryTask start]_block_invoke", "SPGeneralQueryTask.m", 218, "self.started == NO");
}

- (void)searchDaemonQuery:(os_log_t)log encounteredError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_235D0B000, log, OS_LOG_TYPE_ERROR, "Received search error %@ for query %@", (uint8_t *)&v3, 0x16u);
}

@end