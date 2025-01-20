@interface SSPommesRanker
+ (id)sharedPommesRanker;
+ (int64_t)BaseL1Compare:(id)a3 to:(id)a4;
+ (int64_t)BaseL2Compare:(id)a3 to:(id)a4;
+ (int64_t)MailL1Compare:(id)a3 to:(id)a4;
+ (int64_t)MailL2Compare:(id)a3 to:(id)a4;
- (float)estimatedMaxPommesL1Score;
- (void)setEstimatedMaxPommesL1Score:(float)a3;
- (void)sortAndFilterRankedItems:(id)a3 maxCount:(int64_t)a4 bundleID:(id)a5 userQuery:(id)a6 queryID:(int64_t)a7 privateQuery:(BOOL)a8 currentTime:(double)a9;
- (void)updateScoresForItems:(id)a3 withSectionBundle:(id)a4 userQuery:(id)a5 queryID:(int64_t)a6 currentTime:(double)a7 collectL2Signals:(BOOL)a8 keyboardLanguage:(id)a9 onlyEmbeddingResults:(BOOL)a10;
@end

@implementation SSPommesRanker

+ (id)sharedPommesRanker
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SSPommesRanker_sharedPommesRanker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPommesRanker_onceToken != -1) {
    dispatch_once(&sharedPommesRanker_onceToken, block);
  }
  v2 = (void *)sharedPommesRanker_pommesRanker;
  return v2;
}

uint64_t __36__SSPommesRanker_sharedPommesRanker__block_invoke(uint64_t a1)
{
  sharedPommesRanker_pommesRanker = (uint64_t)objc_alloc(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (void)updateScoresForItems:(id)a3 withSectionBundle:(id)a4 userQuery:(id)a5 queryID:(int64_t)a6 currentTime:(double)a7 collectL2Signals:(BOOL)a8 keyboardLanguage:(id)a9 onlyEmbeddingResults:(BOOL)a10
{
  BOOL v11 = a8;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a9;
  if (SSSectionIsSyndicatedPhotos(v18))
  {
    if ((unint64_t)[v17 count] >= 0x14)
    {
      v21 = SSPommesRankerLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v47 = SSRedactString(v19, 0);
        *(_DWORD *)buf = 138413058;
        id v58 = v18;
        __int16 v59 = 2048;
        int64_t v60 = a6;
        __int16 v61 = 2112;
        int64_t v62 = (int64_t)v47;
        __int16 v63 = 2048;
        uint64_t v64 = [v17 count];
        _os_log_debug_impl(&dword_1BDB2A000, v21, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] Following L1Score and L2Score logs will be truncated to first 20 items (total=%lu)", buf, 0x2Au);
      }
    }
    int64_t v51 = a6;
    BOOL v54 = v11;
    id v53 = v18;
    v56 = +[SSPommesPhotosRanker sharedInstance];
    v22 = [MEMORY[0x1E4F29128] UUID];
    v55 = [v22 UUIDString];

    v23 = objc_opt_new();
    v24 = objc_opt_new();
    if ([v17 count])
    {
      unint64_t v25 = 0;
      do
      {
        v26 = [v17 objectAtIndexedSubscript:v25];
        [v56 updatePhotosRankingItemScore:v26 userQuery:v19 currentTime:v54 collectL2Signals:v20 keyboardLanguage:v55 uniqueSessionID:a10 onlyEmbeddingResults:a7 amlInputs:v23];

        if (v25 <= 0x13)
        {
          v27 = SSPommesRankerLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v33 = SSRedactString(v19, 0);
            v50 = [v17 objectAtIndexedSubscript:v25];
            v34 = [v50 identifier];
            v49 = [v17 objectAtIndexedSubscript:v25];
            [v49 pommesL1Score];
            double v36 = v35;
            v48 = [v17 objectAtIndexedSubscript:v25];
            [v48 l2Score];
            *(_DWORD *)buf = 134219522;
            id v58 = (id)(v25 + 1);
            __int16 v59 = 2112;
            int64_t v60 = (int64_t)v53;
            __int16 v61 = 2048;
            int64_t v62 = v51;
            __int16 v63 = 2112;
            uint64_t v64 = (uint64_t)v33;
            __int16 v65 = 2112;
            v66 = v34;
            __int16 v67 = 2048;
            double v68 = v36;
            __int16 v69 = 2048;
            double v70 = v37;
            _os_log_debug_impl(&dword_1BDB2A000, v27, OS_LOG_TYPE_DEBUG, "%lu. [bundle=%@][qid=%lu][query=\"%@\"] item %@: L1Score=%.04f, L2Score=%.04f", buf, 0x48u);
          }
        }
        v28 = [v17 objectAtIndexedSubscript:v25];
        v29 = [v28 identifier];
        objc_msgSend(NSString, "stringWithFormat:", @"spotlight-photoId-%tu", v25);
        id v30 = v19;
        v32 = id v31 = v20;
        [v24 setValue:v29 forKey:v32];

        id v20 = v31;
        id v19 = v30;

        ++v25;
      }
      while (v25 < [v17 count]);
    }
    [v56 donateFeatureDictionaries:v23 sessionId:v55 metadata:v24];

    id v18 = v53;
  }
  else
  {
    id v38 = v18;
    char v39 = [MEMORY[0x1E4FA5D58] isSafariBundle:v38];
    v40 = updateSafariRankingItemScore;
    if ((v39 & 1) != 0
      || (char v41 = [MEMORY[0x1E4FA5D58] isCalendarBundle:v38],
          v40 = updateCalendarRankingItemScore,
          (v41 & 1) != 0))
    {
      v42 = v40;
    }
    else if ([MEMORY[0x1E4FA5D58] isMessagesBundle:v38])
    {
      v42 = updateMessagesRankingItemScore;
    }
    else
    {
      v42 = updateMailRankingItemScore;
    }

    v43 = SSPommesRankerLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      SSRedactString(v19, 0);
      v44 = id v52 = v20;
      *(_DWORD *)buf = 138413058;
      id v58 = v38;
      __int16 v59 = 2048;
      int64_t v60 = a6;
      __int16 v61 = 2112;
      int64_t v62 = (int64_t)v44;
      __int16 v63 = 2048;
      uint64_t v64 = [v17 count];
      _os_log_impl(&dword_1BDB2A000, v43, OS_LOG_TYPE_DEFAULT, "[bundle=%@][qid=%lu][query=\"%@\"] calculating Pommes L2 score for %lu items", buf, 0x2Au);

      id v20 = v52;
    }

    if ([v17 count])
    {
      unint64_t v45 = 0;
      do
      {
        v46 = [v17 objectAtIndexedSubscript:v45];
        ((void (*)(void *, id, int64_t, SSPommesRanker *, BOOL, id, double))v42)(v46, v19, a6, self, v11, v20, a7);

        ++v45;
      }
      while (v45 < [v17 count]);
    }
  }
}

+ (int64_t)BaseL1Compare:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 pommesL1Score];
  float v8 = v7;
  [v6 pommesL1Score];
  if (v8 != 0.0 && v9 != 0.0)
  {
    if (v8 != v9)
    {
      if (v8 <= v9) {
        int64_t v10 = 1;
      }
      else {
        int64_t v10 = -1;
      }
      goto LABEL_13;
    }
LABEL_12:
    BOOL v11 = [v5 identifier];
    v12 = [v6 identifier];
    int64_t v10 = [v11 compare:v12];

    goto LABEL_13;
  }
  if (v8 == 0.0) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = -1;
  }
  if (v8 == 0.0 && v9 == 0.0) {
    goto LABEL_12;
  }
LABEL_13:

  return v10;
}

+ (int64_t)BaseL2Compare:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 l2Score];
  float v8 = v7;
  [v6 l2Score];
  if (v8 == 0.0 || v9 == 0.0)
  {
    if (v8 == 0.0) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = -1;
    }
    if (v8 != 0.0 || v9 != 0.0) {
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v10 = v8 <= v9;
    if (v8 != v9) {
      goto LABEL_13;
    }
  }
  [v5 pommesL1Score];
  float v13 = v12;
  [v6 pommesL1Score];
  if (v13 != 0.0 && v14 != 0.0)
  {
    BOOL v10 = v13 <= v14;
    if (v13 != v14)
    {
LABEL_13:
      if (v10) {
        int64_t v11 = 1;
      }
      else {
        int64_t v11 = -1;
      }
      goto LABEL_22;
    }
LABEL_21:
    v15 = [v5 identifier];
    v16 = [v6 identifier];
    int64_t v11 = [v15 compare:v16];

    goto LABEL_22;
  }
  if (v13 == 0.0) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = -1;
  }
  if (v13 == 0.0 && v14 == 0.0) {
    goto LABEL_21;
  }
LABEL_22:

  return v11;
}

+ (int64_t)MailL1Compare:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 pommesL1Score];
  float v8 = v7;
  [v6 pommesL1Score];
  if (v8 != 0.0 && v9 != 0.0)
  {
    if (v8 != v9)
    {
      if (v8 <= v9) {
        int64_t v10 = 1;
      }
      else {
        int64_t v10 = -1;
      }
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  if (v8 == 0.0) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = -1;
  }
  if (v8 == 0.0 && v9 == 0.0)
  {
LABEL_12:
    int64_t v11 = [v5 mailDate];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;

    float v14 = [v6 mailDate];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;

    if (v13 >= v16)
    {
      if (v13 <= v16)
      {
        id v17 = [v5 identifier];
        id v18 = [v6 identifier];
        int64_t v10 = [v17 compare:v18];
      }
      else
      {
        int64_t v10 = -1;
      }
    }
    else
    {
      int64_t v10 = 1;
    }
  }
LABEL_17:

  return v10;
}

+ (int64_t)MailL2Compare:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 l2Score];
  float v8 = v7;
  [v6 l2Score];
  if (v8 == 0.0 || v9 == 0.0)
  {
    if (v8 == 0.0) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = -1;
    }
    if (v8 != 0.0 || v9 != 0.0) {
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v10 = v8 <= v9;
    if (v8 != v9) {
      goto LABEL_13;
    }
  }
  [v5 pommesL1Score];
  float v13 = v12;
  [v6 pommesL1Score];
  if (v13 != 0.0 && v14 != 0.0)
  {
    BOOL v10 = v13 <= v14;
    if (v13 != v14)
    {
LABEL_13:
      if (v10) {
        int64_t v11 = 1;
      }
      else {
        int64_t v11 = -1;
      }
      goto LABEL_16;
    }
    goto LABEL_22;
  }
  if (v13 == 0.0) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = -1;
  }
  if (v13 == 0.0 && v14 == 0.0)
  {
LABEL_22:
    double v16 = [v5 mailDate];
    [v16 timeIntervalSinceReferenceDate];
    double v18 = v17;

    id v19 = [v6 mailDate];
    [v19 timeIntervalSinceReferenceDate];
    double v21 = v20;

    if (v18 >= v21)
    {
      if (v18 <= v21)
      {
        v22 = [v5 identifier];
        v23 = [v6 identifier];
        int64_t v11 = [v22 compare:v23];
      }
      else
      {
        int64_t v11 = -1;
      }
    }
    else
    {
      int64_t v11 = 1;
    }
  }
LABEL_16:

  return v11;
}

- (void)sortAndFilterRankedItems:(id)a3 maxCount:(int64_t)a4 bundleID:(id)a5 userQuery:(id)a6 queryID:(int64_t)a7 privateQuery:(BOOL)a8 currentTime:(double)a9
{
  BOOL v10 = a8;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  if (SSSectionIsSyndicatedPhotos(v15))
  {
    double v17 = +[SSPommesPhotosRanker sharedInstance];
    [v17 sortAndFilterRankedPhotosItems:v14 maxCount:a4 userQuery:v16 currentTime:a9];
  }
  else
  {
    v88 = v16;
    char IsMailOrPommesCTL = SSSectionIsMailOrPommesCTL(v15);
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __104__SSPommesRanker_sortAndFilterRankedItems_maxCount_bundleID_userQuery_queryID_privateQuery_currentTime___block_invoke;
    v100[3] = &__block_descriptor_33_e59_q24__0___SSPommesTopHitResult__8___SSPommesTopHitResult__16l;
    char v101 = IsMailOrPommesCTL;
    [v14 sortWithOptions:1 usingComparator:v100];
    id v19 = (void *)[v14 copy];
    double v20 = [MEMORY[0x1E4F1CA80] set];
    v85 = v14;
    [v14 removeAllObjects];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id obj = v19;
    uint64_t v21 = [obj countByEnumeratingWithState:&v96 objects:v113 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v97;
LABEL_5:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v97 != v23) {
          objc_enumerationMutation(obj);
        }
        unint64_t v25 = *(void **)(*((void *)&v96 + 1) + 8 * v24);
        if ([v20 count] >= (unint64_t)a4) {
          break;
        }
        v26 = [v25 identifier];
        char v27 = [v20 containsObject:v26];

        if ((v27 & 1) == 0)
        {
          [v85 addObject:v25];
          v28 = [v25 identifier];
          [v20 addObject:v28];
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [obj countByEnumeratingWithState:&v96 objects:v113 count:16];
          if (v22) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    log = SSPommesRankerLog();
    BOOL v29 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      id v14 = v85;
      id v16 = v88;
      if (v29)
      {
        uint64_t v30 = [obj count];
        uint64_t v31 = [v85 count];
        *(_DWORD *)buf = 138413058;
        id v104 = v15;
        __int16 v105 = 2048;
        int64_t v106 = a7;
        __int16 v107 = 2048;
        uint64_t v108 = v30;
        __int16 v109 = 2048;
        uint64_t v110 = v31;
        _os_log_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEFAULT, "[bundle=%@][qid=%lu] sorted and filtered %lu items. Final items count: %lu", buf, 0x2Au);
      }
    }
    else
    {
      if (v29)
      {
        v32 = SSRedactString(v88, 0);
        uint64_t v33 = [obj count];
        uint64_t v34 = [v85 count];
        *(_DWORD *)buf = 138413314;
        id v104 = v15;
        __int16 v105 = 2048;
        int64_t v106 = a7;
        __int16 v107 = 2112;
        uint64_t v108 = (uint64_t)v32;
        __int16 v109 = 2048;
        uint64_t v110 = v33;
        __int16 v111 = 2048;
        uint64_t v112 = v34;
        _os_log_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEFAULT, "[bundle=%@][qid=%lu][query=\"%@\"] sorted and filtered %lu items. Final items count: %lu", buf, 0x34u);
      }
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      log = obj;
      uint64_t v35 = [log countByEnumeratingWithState:&v92 objects:v102 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v93;
        id v87 = v15;
        do
        {
          uint64_t v38 = 0;
          uint64_t v90 = v36;
          do
          {
            if (*(void *)v93 != v37) {
              objc_enumerationMutation(log);
            }
            char v39 = *(void **)(*((void *)&v92 + 1) + 8 * v38);
            v40 = [v39 identifier];
            uint64_t v41 = [v40 length];

            if (v41)
            {
              v42 = NSString;
              v43 = [v39 description];
              v44 = [v42 stringWithFormat:@"%@", v43];

              uint64_t v45 = [v39 rankingItem];
              if (v45)
              {
                v46 = (void *)v45;
                v47 = v20;
                v48 = [v39 rankingItem];
                v49 = [v48 l2Features];

                if (v49)
                {
                  v50 = [v39 rankingItem];
                  int64_t v51 = [v50 l2Features];
                  id v52 = [v51 objectForKey:@"embSim"];

                  if (v52)
                  {
                    id v53 = NSString;
                    BOOL v54 = [v39 rankingItem];
                    v55 = [v54 l2Features];
                    v56 = [v55 objectForKeyedSubscript:@"embSim"];
                    [v56 doubleValue];
                    id v58 = [v53 stringWithFormat:@", embSim = %.04f", v57];
                    uint64_t v59 = [v44 stringByAppendingString:v58];

                    v44 = (void *)v59;
                  }
                  int64_t v60 = [v39 rankingItem];
                  __int16 v61 = [v60 l2Features];
                  int64_t v62 = [v61 objectForKey:@"freshness"];

                  if (v62)
                  {
                    __int16 v63 = NSString;
                    uint64_t v64 = [v39 rankingItem];
                    __int16 v65 = [v64 l2Features];
                    v66 = [v65 objectForKeyedSubscript:@"freshness"];
                    [v66 doubleValue];
                    double v68 = [v63 stringWithFormat:@", freshness = %.04f", v67];
                    uint64_t v69 = [v44 stringByAppendingString:v68];

                    v44 = (void *)v69;
                  }
                  double v70 = [v39 rankingItem];
                  uint64_t v71 = [v70 l2Features];
                  v72 = [v71 objectForKey:@"engagement"];

                  if (v72)
                  {
                    v73 = NSString;
                    v74 = [v39 rankingItem];
                    v75 = [v74 l2Features];
                    v76 = [v75 objectForKeyedSubscript:@"engagement"];
                    [v76 doubleValue];
                    v78 = [v73 stringWithFormat:@", engagement = %.04f", v77];
                    uint64_t v79 = [v44 stringByAppendingString:v78];

                    v44 = (void *)v79;
                  }
                  id v15 = v87;
                }
                double v20 = v47;
                uint64_t v36 = v90;
              }
              v80 = [v39 identifier];
              int v81 = [v20 containsObject:v80];

              if (v81)
              {
                uint64_t v82 = [v44 stringByAppendingString:@" (TH)"];

                v44 = (void *)v82;
              }
              v83 = SSPommesRankerLog();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                v84 = SSRedactString(v88, 0);
                *(_DWORD *)buf = 138413058;
                id v104 = v15;
                __int16 v105 = 2048;
                int64_t v106 = a7;
                __int16 v107 = 2112;
                uint64_t v108 = (uint64_t)v84;
                __int16 v109 = 2112;
                uint64_t v110 = (uint64_t)v44;
                _os_log_impl(&dword_1BDB2A000, v83, OS_LOG_TYPE_DEFAULT, "[bundle=%@][qid=%lu][query=\"%@\"] %@", buf, 0x2Au);
              }
            }
            ++v38;
          }
          while (v36 != v38);
          uint64_t v36 = [log countByEnumeratingWithState:&v92 objects:v102 count:16];
        }
        while (v36);
      }
      id v14 = v85;
      id v16 = v88;
    }
  }
}

int64_t __104__SSPommesRanker_sortAndFilterRankedItems_maxCount_bundleID_userQuery_queryID_privateQuery_currentTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 rankingItem];
  float v7 = [v5 rankingItem];

  if (v4) {
    int64_t v8 = +[SSPommesRanker MailL2Compare:v6 to:v7];
  }
  else {
    int64_t v8 = +[SSPommesRanker BaseL2Compare:v6 to:v7];
  }
  int64_t v9 = v8;

  return v9;
}

- (float)estimatedMaxPommesL1Score
{
  return self->_estimatedMaxPommesL1Score;
}

- (void)setEstimatedMaxPommesL1Score:(float)a3
{
  self->_estimatedMaxPommesL1Score = a3;
}

@end