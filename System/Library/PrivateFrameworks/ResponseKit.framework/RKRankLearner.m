@interface RKRankLearner
- (BOOL)insertRankingInfo:(id)a3 forLanguageID:(id)a4;
- (RKRankLearner)init;
- (id)getDBManager:(id)a3;
- (id)getDBManager:(id)a3 withCustomPath:(id)a4;
- (id)getRankedResponses:(id)a3 forRecipientID:(id)a4 withLanguageID:(id)a5;
- (id)rankResponses:(id)a3;
- (id)updateFeaturesForResponse:(id)a3 selectCounts:(id)a4 inputMethodCounts:(id)a5 sourceCounts:(id)a6 currentTime:(id)a7 languageCode:(id)a8;
- (void)flushRankingData:(id)a3;
@end

@implementation RKRankLearner

- (RKRankLearner)init
{
  v6.receiver = self;
  v6.super_class = (Class)RKRankLearner;
  v2 = [(RKRankLearner *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = (void *)_languageRankingModel;
    _languageRankingModel = (uint64_t)v3;
  }
  return v2;
}

- (id)getDBManager:(id)a3
{
  id v3 = a3;
  v4 = [(id)_languageRankingModel objectForKeyedSubscript:v3];

  if (v4)
  {
    v5 = [(id)_languageRankingModel objectForKeyedSubscript:v3];
  }
  else
  {
    v5 = [[RKRankingDataManager alloc] initWithLanguageID:v3];
    [(id)_languageRankingModel setObject:v5 forKeyedSubscript:v3];
  }

  return v5;
}

- (id)getDBManager:(id)a3 withCustomPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)_languageRankingModel objectForKeyedSubscript:v5];

  if (v7)
  {
    v8 = [(id)_languageRankingModel objectForKeyedSubscript:v5];
  }
  else
  {
    v9 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v6];
    v8 = [[RKRankingDataManager alloc] initWithDatabaseFilename:v9];
    [(id)_languageRankingModel setObject:v8 forKeyedSubscript:v5];
  }

  return v8;
}

- (BOOL)insertRankingInfo:(id)a3 forLanguageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"category"];
  int v9 = [v8 isEqualToString:@"Unknown"];
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[RKRankLearner insertRankingInfo:forLanguageID:]();
    }
  }
  else
  {
    v10 = [(RKRankLearner *)self getDBManager:v7];
    [v10 insertRankingInfoFromDictionary:v6];
  }
  return v9 ^ 1;
}

- (id)updateFeaturesForResponse:(id)a3 selectCounts:(id)a4 inputMethodCounts:(id)a5 sourceCounts:(id)a6 currentTime:(id)a7 languageCode:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [v13 componentsSeparatedByString:@" "];
  unint64_t v20 = [v19 count];

  if (([v18 isEqualToString:@"zh-Hans"] & 1) != 0
    || ([v18 isEqualToString:@"ja"] & 1) != 0
    || ([v18 isEqualToString:@"th"] & 1) != 0
    || [v18 isEqualToString:@"ko"])
  {
    unint64_t v21 = [v13 length];
    BOOL v22 = v21 > 0x14;
  }
  else
  {
    BOOL v22 = 0;
    unint64_t v21 = v20;
  }
  v23 = 0;
  if (v20 <= 5 && !v22)
  {
    v24 = [v14 objectForKeyedSubscript:v13];
    int v25 = [v24 count];

    if (v25 >= 2)
    {
      v26 = [v14 objectForKeyedSubscript:v13];
      v59 = [v26 timestamp];

      [v17 timeIntervalSinceDate:v59];
      double v28 = v27 / 86400.0;
      v29 = [v16 objectForKeyedSubscript:v13];
      id v62 = v15;
      v30 = [NSNumber numberWithUnsignedInteger:1];
      [v29 objectForKeyedSubscript:v30];
      v31 = unsigned int v58 = v25;
      id v60 = v17;
      int v32 = [v31 intValue];

      v33 = [v16 objectForKeyedSubscript:v13];
      v34 = [NSNumber numberWithUnsignedInteger:0];
      v35 = [v33 objectForKeyedSubscript:v34];
      id v61 = v16;
      int v36 = [v35 intValue];

      double v37 = (double)v32 / (double)(v36 + v32);
      double v38 = (double)v36 / (double)(v36 + v32);
      v39 = [v15 objectForKeyedSubscript:v13];
      v40 = [NSNumber numberWithUnsignedInteger:0];
      v41 = [v39 objectForKeyedSubscript:v40];
      LODWORD(v35) = [v41 intValue];

      v42 = [v15 objectForKeyedSubscript:v13];
      v43 = [NSNumber numberWithUnsignedInteger:1];
      v44 = [v42 objectForKeyedSubscript:v43];
      LODWORD(v34) = [v44 intValue];

      v45 = [v15 objectForKeyedSubscript:v13];
      v46 = [NSNumber numberWithUnsignedInteger:2];
      v47 = [v45 objectForKeyedSubscript:v46];
      int v48 = [v47 intValue];

      id v17 = v60;
      int v49 = v34 + v35 + v48;
      double v50 = (double)(int)v35 / (double)v49;
      double v51 = (double)(int)v34 / (double)v49;
      double v52 = (double)v48 / (double)v49;
      v53 = [v14 objectForKeyedSubscript:v13];
      uint64_t v54 = [v53 hasSameRecipient];

      id v15 = v62;
      v55 = [RKResponseFeatures alloc];
      uint64_t v56 = v54;
      id v16 = v61;
      v23 = [(RKResponseFeatures *)v55 initWithFeatures:v13 count:v58 numOfElapsedDays:v21 sourceAppCount:v56 sourceNotificationCount:v28 inputSourceCannedCount:v37 inputSourceScribbleCount:v38 inputSourceDictationCount:v50 responseLength:v51 sameRecipientCount:v52];
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (id)getRankedResponses:(id)a3 forRecipientID:(id)a4 withLanguageID:(id)a5
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v110 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v9];
  v106 = [v10 objectForKey:*MEMORY[0x263EFF508]];

  v11 = [(RKRankLearner *)self getDBManager:v9];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__RKRankLearner_getRankedResponses_forRecipientID_withLanguageID___block_invoke;
  block[3] = &unk_2642D22B8;
  block[4] = self;
  v103 = v9;
  if (getRankedResponses_forRecipientID_withLanguageID__onceToken != -1) {
    dispatch_once(&getRankedResponses_forRecipientID_withLanguageID__onceToken, block);
  }
  v102 = v11;
  v104 = v8;
  v12 = [v11 fetchRankingInfoForCategory:v8];
  v116 = objc_opt_new();
  id v13 = objc_opt_new();
  v111 = objc_opt_new();
  id v14 = objc_opt_new();
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  obuint64_t j = v12;
  v117 = v14;
  uint64_t v112 = [obj countByEnumeratingWithState:&v126 objects:v133 count:16];
  if (v112)
  {
    uint64_t v108 = *(void *)v127;
    unint64_t v15 = 0x263F08000uLL;
    do
    {
      for (uint64_t i = 0; i != v112; ++i)
      {
        if (*(void *)v127 != v108) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v126 + 1) + 8 * i);
        id v18 = [v17 recipientId];
        uint64_t v19 = [v18 isEqualToString:v110];

        unint64_t v20 = [v17 timestamp];
        unint64_t v21 = [v17 response];
        BOOL v22 = [v13 objectForKeyedSubscript:v21];

        v114 = v20;
        if (v22)
        {
          v23 = [v17 response];
          v24 = [v13 objectForKeyedSubscript:v23];
          int v25 = [v24 count];

          id v26 = v20;
          double v27 = [v17 response];
          double v28 = [v13 objectForKeyedSubscript:v27];
          v29 = [v28 timestamp];
          uint64_t v30 = [v26 compare:v29];

          if (v30 == -1)
          {
            v31 = [v17 response];
            int v32 = [v13 objectForKeyedSubscript:v31];
            uint64_t v33 = [v32 timestamp];

            id v26 = (id)v33;
          }
          v34 = [v17 response];
          v35 = [v13 objectForKeyedSubscript:v34];
          [v35 setCount:(v25 + 1)];

          int v36 = [v17 response];
          double v37 = [v13 objectForKeyedSubscript:v36];
          [v37 setTimestamp:v26];

          double v38 = [v17 response];
          v39 = [v13 objectForKeyedSubscript:v38];
          uint64_t v40 = v19 | [v39 hasSameRecipient];
          v41 = [v17 response];
          v42 = [v13 objectForKeyedSubscript:v41];
          [v42 setHasSameRecipient:v40];

          v43 = v111;
          id v14 = v117;
          unint64_t v15 = 0x263F08000;
        }
        else
        {
          v44 = [[RKResponseCountTimestampRecipient alloc] initWithCount:1 timestamp:v20 hasSameRecipient:v19];
          v45 = [v17 response];
          [v13 setObject:v44 forKeyedSubscript:v45];

          id v26 = (id)objc_opt_new();
          v46 = [NSNumber numberWithInt:0];
          v47 = [NSNumber numberWithUnsignedInteger:1];
          [v26 setObject:v46 forKey:v47];

          int v48 = [NSNumber numberWithInt:0];
          int v49 = [NSNumber numberWithUnsignedInteger:0];
          [v26 setObject:v48 forKey:v49];

          double v50 = [v17 response];
          v43 = v111;
          [v111 setObject:v26 forKeyedSubscript:v50];

          double v38 = objc_opt_new();
          double v51 = [NSNumber numberWithInt:0];
          double v52 = [NSNumber numberWithUnsignedInteger:0];
          [v38 setObject:v51 forKey:v52];

          v53 = [NSNumber numberWithInt:0];
          uint64_t v54 = [NSNumber numberWithUnsignedInteger:1];
          [v38 setObject:v53 forKey:v54];

          v55 = [NSNumber numberWithInt:0];
          uint64_t v56 = [NSNumber numberWithUnsignedInteger:2];
          [v38 setObject:v55 forKey:v56];

          v39 = [v17 response];
          [v14 setObject:v38 forKeyedSubscript:v39];
        }

        v57 = [v17 response];
        unsigned int v58 = [v43 objectForKeyedSubscript:v57];
        v59 = objc_msgSend(*(id *)(v15 + 2584), "numberWithUnsignedInteger:", objc_msgSend(v17, "source"));
        id v60 = [v58 objectForKeyedSubscript:v59];
        uint64_t v61 = [v60 intValue] + 1;

        id v62 = [NSNumber numberWithInt:v61];
        v63 = [v17 response];
        v64 = [v43 objectForKeyedSubscript:v63];
        v65 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "source"));
        [v64 setObject:v62 forKeyedSubscript:v65];

        v66 = [v17 response];
        v67 = [v14 objectForKeyedSubscript:v66];
        v68 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "inputMethod"));
        v69 = [v67 objectForKeyedSubscript:v68];
        uint64_t v70 = [v69 intValue] + 1;

        uint64_t v71 = v70;
        unint64_t v15 = 0x263F08000uLL;
        v72 = [NSNumber numberWithInt:v71];
        v73 = [v17 response];
        v74 = [v14 objectForKeyedSubscript:v73];
        v75 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "inputMethod"));
        [v74 setObject:v72 forKeyedSubscript:v75];
      }
      uint64_t v112 = [obj countByEnumeratingWithState:&v126 objects:v133 count:16];
    }
    while (v112);
  }

  uint64_t v76 = [MEMORY[0x263EFF910] date];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v77 = v13;
  uint64_t v78 = [v77 countByEnumeratingWithState:&v122 objects:v132 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v123;
    do
    {
      for (uint64_t j = 0; j != v79; ++j)
      {
        if (*(void *)v123 != v80) {
          objc_enumerationMutation(v77);
        }
        uint64_t v82 = *(void *)(*((void *)&v122 + 1) + 8 * j);
        v83 = [(RKRankLearner *)self updateFeaturesForResponse:v82 selectCounts:v77 inputMethodCounts:v117 sourceCounts:v111 currentTime:v76 languageCode:v106];
        [v116 setObject:v83 forKeyedSubscript:v82];
      }
      uint64_t v79 = [v77 countByEnumeratingWithState:&v122 objects:v132 count:16];
    }
    while (v79);
  }
  v109 = (void *)v76;

  v113 = objc_opt_new();
  v115 = objc_opt_new();
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v84 = obj;
  uint64_t v85 = [v84 countByEnumeratingWithState:&v118 objects:v131 count:16];
  v86 = v117;
  if (v85)
  {
    uint64_t v87 = v85;
    uint64_t v88 = *(void *)v119;
    do
    {
      for (uint64_t k = 0; k != v87; ++k)
      {
        if (*(void *)v119 != v88) {
          objc_enumerationMutation(v84);
        }
        v90 = *(void **)(*((void *)&v118 + 1) + 8 * k);
        v91 = [v90 response];
        v92 = [v116 objectForKeyedSubscript:v91];

        if (v92)
        {
          v93 = [v90 response];
          v94 = [v77 objectForKeyedSubscript:v93];
          int v95 = [v94 count];

          BOOL v96 = v95 < 2;
          v86 = v117;
          if (!v96)
          {
            v97 = [v90 response];
            char v98 = [v115 containsObject:v97];

            if ((v98 & 1) == 0)
            {
              v99 = [v90 response];
              [v115 addObject:v99];

              [v113 addObject:v92];
            }
          }
        }
      }
      uint64_t v87 = [v84 countByEnumeratingWithState:&v118 objects:v131 count:16];
    }
    while (v87);
  }

  v100 = [(RKRankLearner *)self rankResponses:v113];

  return v100;
}

void __66__RKRankLearner_getRankedResponses_forRecipientID_withLanguageID___block_invoke()
{
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v0 = NSURL;
  v1 = [v7 pathForResource:@"RKAssetsConstantClasses" ofType:@"plist"];
  v2 = [v0 URLWithString:v1];

  id v3 = [RKResponseCollection alloc];
  v4 = [[RKBundleDataProvider alloc] initWithAssetPlist:v2];
  uint64_t v5 = [(RKResponseCollection *)v3 initWithDynamicDataURL:0 displayStringsProvider:v4];
  id v6 = (void *)getRankedResponses_forRecipientID_withLanguageID__responseCollection;
  getRankedResponses_forRecipientID_withLanguageID__responseCollection = v5;
}

- (id)rankResponses:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v11 = [v10 response];
        unint64_t v12 = [v10 responseLength];
        [v10 numOfElapsedDays];
        double v39 = exp(v13 / -30.0);
        double v14 = log((double)(int)([v10 count] + 1));
        [v10 normalizedSourceAppCount];
        double v16 = log(v15 + 1.0);
        [v10 normalizedSourceNotificationCount];
        double v18 = log(v17 + 1.0);
        [v10 normalizedInputMethodCannedCount];
        double v20 = log(v19 + 1.0);
        [v10 normalizedInputMethodScribbleCount];
        double v22 = log(v21 + 1.0);
        [v10 normalizedInputMethodDictationCount];
        double v24 = log(v23 + 1.0);
        double v25 = log((double)(int)([v10 sameRecipientCount] + 1));
        [v10 normalizedInputMethodDictationCount];
        if (v26 <= 0.0 && ([v10 normalizedInputMethodScribbleCount], v27 <= 0.0))
        {
          uint64_t v31 = 0;
        }
        else
        {
          [v10 normalizedInputMethodDictationCount];
          double v29 = v28;
          [v10 normalizedInputMethodScribbleCount];
          if (v29 <= v30) {
            uint64_t v31 = 1;
          }
          else {
            uint64_t v31 = 2;
          }
        }
        int v32 = [[RKRankedResponse alloc] initWithResponse:v11 inputMethod:v31 score:1.0 / sqrt((double)v12) + (v25 + v14 + v16 * 0.5 + v18 * 0.5 + v20 * 0.2 + v22 * 0.4 + v24 * 0.4) * v39];
        [v4 addObject:v32];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v7);
  }

  uint64_t v33 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"score" ascending:0];
  v34 = [MEMORY[0x263EFF8C0] arrayWithObject:v33];
  v35 = [v4 sortedArrayUsingDescriptors:v34];
  if ((unint64_t)[v35 count] < 4)
  {
    id v36 = v35;
  }
  else
  {
    objc_msgSend(v35, "subarrayWithRange:", 0, 3);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v37 = v36;

  return v37;
}

- (void)flushRankingData:(id)a3
{
  id v3 = [(RKRankLearner *)self getDBManager:a3];
  [v3 flushRankingData];
}

- (void)insertRankingInfo:forLanguageID:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Category is marked as Unknown, cannot insert the messages", v0, 2u);
}

@end