@interface SSRankingFeedbackHandler
+ (id)copyRenderEngagementCounts;
+ (id)sharedInstance;
- (NSMutableArray)sectionCSItems;
- (NSMutableDictionary)mapProtectionClassToBundleIdToItem;
- (OS_dispatch_queue)countQueue;
- (OS_dispatch_queue)fetchQueue;
- (SSRankingFeedbackHandler)init;
- (id)fetchResults;
- (id)getSyntheticTestRankingItem;
- (id)getSyntheticTestRankingItemsForStressTest;
- (void)_indexItemWithIdentifier:(id)a3 bundleID:(id)a4 startDate:(id)a5 pc:(id)a6;
- (void)_updateSpotlightRecentEngagementWithIdentifier:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 queryString:(id)a6 renderPosition:(id)a7;
- (void)didEngageResultWithRankingItem:(id)a3 startDate:(id)a4 protectionClass:(id)a5 query:(id)a6;
- (void)fetchBundleRenderAndEngagementInfo;
- (void)fetchBundleRenderAndEngagementInfo:(id)a3;
- (void)resetResultWithRankingItems:(id)a3;
- (void)resultsWithRankingItemsDidBecomeVisible:(id)a3 date:(id)a4 protectionClassMapping:(id)a5;
- (void)setCountQueue:(id)a3;
- (void)setFetchQueue:(id)a3;
- (void)setMapProtectionClassToBundleIdToItem:(id)a3;
- (void)setSectionCSItems:(id)a3;
- (void)stressTestCounts;
- (void)testCountsAfterCoupleYears;
- (void)testCountsAfterYear;
- (void)testCountsForRegularEngagement;
- (void)testCountsMovingCoupleOfYearsInPast;
- (void)testCountsMovingDaysInPast;
- (void)testCountsMovingYearInPast;
- (void)testCountsUptoHalfYear;
- (void)testCountsUptoMonth;
- (void)testCountsUptoOneDay;
- (void)testCountsUptoQuarter;
- (void)testCountsUptoWeek;
- (void)testCountsUptoYear;
- (void)testForDummyEntry;
- (void)testForDurationWithIntervals:(int *)a3 maxIndex:(int)a4 duration:(int64_t)a5 counts:(id)a6;
- (void)writeRenderAndEngagementInfo;
@end

@implementation SSRankingFeedbackHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_handler;
  return v2;
}

uint64_t __42__SSRankingFeedbackHandler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SSRankingFeedbackHandler);
  v1 = (void *)sharedInstance_handler;
  sharedInstance_handler = (uint64_t)v0;

  sClientRankAndBlend = _os_feature_enabled_impl();
  uint64_t v2 = objc_opt_new();
  v3 = (void *)sRenderEngagementCountValues;
  sRenderEngagementCountValues = v2;

  if (sClientRankAndBlend)
  {
    uint64_t v4 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
    v5 = (void *)sCSIndex;
    sCSIndex = v4;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FA5D60] sharedInstance];
    v5 = (void *)sIndexer;
    sIndexer = v6;
  }

  return pthread_rwlock_init(&sRWRenderEngagementValueLock, 0);
}

- (SSRankingFeedbackHandler)init
{
  v10.receiver = self;
  v10.super_class = (Class)SSRankingFeedbackHandler;
  uint64_t v2 = [(SSRankingFeedbackHandler *)&v10 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(33, 2uLL);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("queue to fetch bundle render/engagement counts", 0, v3);
    [(SSRankingFeedbackHandler *)v2 setFetchQueue:v4];

    v5 = dispatch_get_global_queue(9, 2uLL);
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("queue to update render/engagement counts", 0, v5);
    [(SSRankingFeedbackHandler *)v2 setCountQueue:v6];

    v7 = objc_opt_new();
    [(SSRankingFeedbackHandler *)v2 setMapProtectionClassToBundleIdToItem:v7];

    v8 = objc_opt_new();
    [(SSRankingFeedbackHandler *)v2 setSectionCSItems:v8];
  }
  return v2;
}

+ (id)copyRenderEngagementCounts
{
  pthread_rwlock_rdlock(&sRWRenderEngagementValueLock);
  uint64_t v2 = (void *)[(id)sRenderEngagementCountValues copy];
  pthread_rwlock_unlock(&sRWRenderEngagementValueLock);
  return v2;
}

- (void)_indexItemWithIdentifier:(id)a3 bundleID:(id)a4 startDate:(id)a5 pc:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E4F23840];
  id v13 = a3;
  id v14 = objc_alloc_init(v12);
  [v14 setUniqueIdentifier:v13];

  [v14 setIsUpdate:1];
  v15 = objc_opt_new();
  v16 = v15;
  if (v10)
  {
    [v15 setAttribute:v10 forKey:@"_kMDItemEngagementDate"];
  }
  else
  {
    v17 = [MEMORY[0x1E4F1C9C8] date];
    [v16 setAttribute:v17 forKey:@"_kMDItemEngagementDate"];
  }
  [v14 setAttributeSet:v16];
  [v14 setBundleID:v9];
  if (sClientRankAndBlend)
  {
    v18 = (void *)sCSIndex;
    v22[0] = v14;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v20 = &__block_literal_global_31;
  }
  else
  {
    v18 = (void *)sIndexer;
    id v21 = v14;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    v20 = &__block_literal_global_33;
  }
  [v18 indexSearchableItems:v19 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v11 forBundleID:v9 options:0 completionHandler:v20];
}

- (void)_updateSpotlightRecentEngagementWithIdentifier:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 queryString:(id)a6 renderPosition:(id)a7
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = (objc_class *)MEMORY[0x1E4F23850];
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  id v18 = [v14 alloc];
  v30[0] = @"_kMDItemLastSpotlightEngagementQuery";
  v30[1] = @"_kMDItemLastSpotlightEngagementRenderPosition";
  v31[0] = v16;
  v31[1] = v15;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  v20 = (void *)[v18 initWithAttributes:v19];

  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v17 domainIdentifier:0 attributeSet:v20];
  [v21 setIsUpdate:1];
  [v21 setBundleID:v12];
  v22 = [(SSRankingFeedbackHandler *)self countQueue];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __127__SSRankingFeedbackHandler__updateSpotlightRecentEngagementWithIdentifier_bundleID_protectionClass_queryString_renderPosition___block_invoke;
  v26[3] = &unk_1E634C298;
  id v27 = v21;
  id v28 = v13;
  id v29 = v12;
  id v23 = v12;
  id v24 = v13;
  id v25 = v21;
  dispatch_async(v22, v26);
}

void __127__SSRankingFeedbackHandler__updateSpotlightRecentEngagementWithIdentifier_bundleID_protectionClass_queryString_renderPosition___block_invoke(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (sClientRankAndBlend)
  {
    uint64_t v2 = (void *)sCSIndex;
    v8[0] = a1[4];
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    dispatch_queue_t v6 = &__block_literal_global_42;
  }
  else
  {
    uint64_t v2 = (void *)sIndexer;
    uint64_t v7 = a1[4];
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    dispatch_queue_t v6 = &__block_literal_global_44;
  }
  [v2 indexSearchableItems:v3 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v4 forBundleID:v5 options:0 completionHandler:v6];
}

- (void)didEngageResultWithRankingItem:(id)a3 startDate:(id)a4 protectionClass:(id)a5 query:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SSRankingFeedbackHandler *)self countQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__SSRankingFeedbackHandler_didEngageResultWithRankingItem_startDate_protectionClass_query___block_invoke;
  block[3] = &unk_1E634C2E8;
  id v20 = v10;
  id v21 = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_sync(v14, block);
}

void __91__SSRankingFeedbackHandler_didEngageResultWithRankingItem_startDate_protectionClass_query___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) rankingFeedbackBundleID];
  uint64_t v2 = *(void **)(a1 + 40);
  v3 = [*(id *)(a1 + 32) identifier];
  [v2 _indexItemWithIdentifier:v3 bundleID:v10 startDate:*(void *)(a1 + 48) pc:*(void *)(a1 + 56)];

  [*(id *)(a1 + 40) _indexItemWithIdentifier:v10 bundleID:@"com.apple.searchd" startDate:*(void *)(a1 + 48) pc:*MEMORY[0x1E4F28358]];
  if (sRenderEngagementCountValues)
  {
    pthread_rwlock_wrlock(&sRWRenderEngagementValueLock);
    uint64_t v4 = (void *)sRenderEngagementCountValues;
    uint64_t v5 = [*(id *)(a1 + 32) sectionBundleIdentifier];
    dispatch_queue_t v6 = [v4 objectForKey:v5];

    if (v6)
    {
      uint64_t v7 = (void *)[v6 copy];
    }
    else
    {
      uint64_t v7 = objc_opt_new();
    }
    [v7 incrementRankingValuesForType:0];
    [(id)sRenderEngagementCountValues setValue:v7 forKey:v10];
    pthread_rwlock_unlock(&sRWRenderEngagementValueLock);
  }
  v8 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) identifier];
  [v8 _updateSpotlightRecentEngagementWithIdentifier:v9 bundleID:v10 protectionClass:*(void *)(a1 + 56) queryString:*(void *)(a1 + 64) renderPosition:&unk_1F1860F68];
}

- (void)resultsWithRankingItemsDidBecomeVisible:(id)a3 date:(id)a4 protectionClassMapping:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SSRankingFeedbackHandler *)self countQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke;
  v15[3] = &unk_1E634C2C0;
  id v16 = v8;
  id v17 = v10;
  id v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke(uint64_t a1)
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C1885190]();
  v78 = objc_opt_new();
  uint64_t v79 = a1;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v116;
    uint64_t v85 = *(void *)v116;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v116 != v4) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_t v6 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "identifier", context);
        id v8 = [v6 rankingFeedbackBundleID];
        id v9 = *(void **)(v79 + 40);
        id v10 = [v6 identifier];
        id v11 = [v9 objectForKey:v10];

        if (v7) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          uint64_t v13 = v79;
          if (([v78 containsObject:v8] & 1) == 0)
          {
            id v14 = [*(id *)(v79 + 48) sectionCSItems];
            unint64_t v15 = [v14 count];

            if (v15 <= 0x95)
            {
              id v16 = objc_alloc_init(MEMORY[0x1E4F23840]);
              [v16 setUniqueIdentifier:v8];
              [v16 setIsUpdate:1];
              id v17 = objc_opt_new();
              id v18 = v17;
              uint64_t v19 = *(void *)(v79 + 56);
              if (v19)
              {
                [v17 setAttribute:v19 forKey:@"_kMDItemRenderDate"];
              }
              else
              {
                id v20 = [MEMORY[0x1E4F1C9C8] date];
                [v18 setAttribute:v20 forKey:@"_kMDItemRenderDate"];
              }
              [v16 setAttributeSet:v18];
              [v16 setBundleID:@"com.apple.searchd"];
              uint64_t v13 = v79;
              id v21 = [*(id *)(v79 + 48) sectionCSItems];
              [v21 addObject:v16];

              uint64_t v4 = v85;
            }
          }
          [v78 addObject:v8];
          id v22 = objc_alloc_init(MEMORY[0x1E4F23840]);
          id v23 = [v6 identifier];
          [v22 setUniqueIdentifier:v23];

          [v22 setIsUpdate:1];
          id v24 = objc_opt_new();
          id v25 = v24;
          uint64_t v26 = *(void *)(v13 + 56);
          if (v26)
          {
            [v24 setAttribute:v26 forKey:@"_kMDItemRenderDate"];
          }
          else
          {
            id v27 = [MEMORY[0x1E4F1C9C8] date];
            [v25 setAttribute:v27 forKey:@"_kMDItemRenderDate"];
          }
          [v22 setAttributeSet:v25];
          [v22 setBundleID:v8];
          if ([v11 length])
          {
            id v28 = [*(id *)(v79 + 48) mapProtectionClassToBundleIdToItem];
            id v29 = [v28 objectForKey:v11];

            if (!v29) {
              id v29 = objc_opt_new();
            }
            v30 = [v29 objectForKey:v8];
            if (!v30) {
              v30 = objc_opt_new();
            }
            if ((unint64_t)[v30 count] <= 0x95) {
              [v30 addObject:v22];
            }
            [v29 setObject:v30 forKey:v8];
            v31 = [*(id *)(v79 + 48) mapProtectionClassToBundleIdToItem];
            [v31 setObject:v29 forKey:v11];

            uint64_t v4 = v85;
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
    }
    while (v3);
  }

  if (_os_feature_enabled_impl())
  {
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    uint64_t v32 = v79;
    v33 = [*(id *)(v79 + 48) mapProtectionClassToBundleIdToItem];
    v34 = [v33 allKeys];

    id v74 = v34;
    uint64_t v76 = [v34 countByEnumeratingWithState:&v111 objects:v125 count:16];
    if (v76)
    {
      uint64_t v75 = *(void *)v112;
      uint64_t v82 = *MEMORY[0x1E4F234F8];
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v112 != v75) {
            objc_enumerationMutation(v74);
          }
          uint64_t v77 = v35;
          uint64_t v36 = *(void *)(*((void *)&v111 + 1) + 8 * v35);
          v37 = objc_msgSend(*(id *)(v32 + 48), "mapProtectionClassToBundleIdToItem", context);
          uint64_t v83 = v36;
          v38 = [v37 objectForKey:v36];

          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v81 = [v38 allKeys];
          uint64_t v86 = [v81 countByEnumeratingWithState:&v107 objects:v124 count:16];
          if (v86)
          {
            uint64_t v84 = *(void *)v108;
            v80 = v38;
            do
            {
              for (uint64_t j = 0; j != v86; ++j)
              {
                if (*(void *)v108 != v84) {
                  objc_enumerationMutation(v81);
                }
                id v40 = *(id *)(*((void *)&v107 + 1) + 8 * j);
                if (([v40 isEqual:@"com.apple.parsec.stocks"] & 1) != 0
                  || ([v40 isEqual:@"com.apple.parsec.sports"] & 1) != 0
                  || ([v40 isEqual:@"com.apple.parsec.maps"] & 1) != 0
                  || [v40 isEqual:@"com.apple.parsec.itunes.iosSoftware"])
                {
                  v41 = [v38 objectForKey:v40];
                  v42 = CS_simplifyItemArray();

                  v43 = objc_opt_new();
                  long long v103 = 0u;
                  long long v104 = 0u;
                  long long v105 = 0u;
                  long long v106 = 0u;
                  id v44 = v42;
                  uint64_t v45 = [v44 countByEnumeratingWithState:&v103 objects:v123 count:16];
                  if (v45)
                  {
                    uint64_t v46 = v45;
                    uint64_t v47 = *(void *)v104;
                    do
                    {
                      for (uint64_t k = 0; k != v46; ++k)
                      {
                        if (*(void *)v104 != v47) {
                          objc_enumerationMutation(v44);
                        }
                        v49 = [*(id *)(*((void *)&v103 + 1) + 8 * k) uniqueIdentifier];
                        [v43 addObject:v49];
                      }
                      uint64_t v46 = [v44 countByEnumeratingWithState:&v103 objects:v123 count:16];
                    }
                    while (v46);
                  }

                  if ([v43 count])
                  {
                    id obja = v40;
                    v50 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v44, "count"));
                    long long v99 = 0u;
                    long long v100 = 0u;
                    long long v101 = 0u;
                    long long v102 = 0u;
                    id v51 = v44;
                    uint64_t v52 = [v51 countByEnumeratingWithState:&v99 objects:v122 count:16];
                    if (v52)
                    {
                      uint64_t v53 = v52;
                      uint64_t v54 = *(void *)v100;
                      do
                      {
                        for (uint64_t m = 0; m != v53; ++m)
                        {
                          if (*(void *)v100 != v54) {
                            objc_enumerationMutation(v51);
                          }
                          v56 = (void *)[*(id *)(*((void *)&v99 + 1) + 8 * m) copy];
                          [v50 addObject:v56];
                        }
                        uint64_t v53 = [v51 countByEnumeratingWithState:&v99 objects:v122 count:16];
                      }
                      while (v53);
                    }

                    if (sClientRankAndBlend)
                    {
                      v96[0] = MEMORY[0x1E4F143A8];
                      v96[1] = 3221225472;
                      v96[2] = __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke_2;
                      v96[3] = &unk_1E634C6F0;
                      v97[0] = v51;
                      v97[1] = v83;
                      id v57 = obja;
                      id v98 = v57;
                      v58 = (void *)MEMORY[0x1C1885400](v96);
                      v59 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
                      uint64_t v121 = v82;
                      v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
                      v61 = [v43 array];
                      v38 = v80;
                      [v59 slowFetchAttributes:v60 protectionClass:v83 bundleID:v57 identifiers:v61 completionHandler:v58];

                      v63 = &v98;
                      v62 = (id *)v97;
                    }
                    else
                    {
                      v58 = [MEMORY[0x1E4FA5D60] sharedInstance];
                      uint64_t v120 = v82;
                      v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
                      v60 = [v43 array];
                      v93[0] = MEMORY[0x1E4F143A8];
                      v93[1] = 3221225472;
                      v93[2] = __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke_4;
                      v93[3] = &unk_1E634C718;
                      v94[0] = v50;
                      v94[1] = v83;
                      id v95 = obja;
                      [v58 fetchAttributesForProtectionClass:v83 attributes:v59 bundleID:v95 identifiers:v60 completion:v93];
                      v63 = &v95;
                      v62 = (id *)v94;
                    }

                    id v40 = obja;
                  }
                }
              }
              uint64_t v86 = [v81 countByEnumeratingWithState:&v107 objects:v124 count:16];
            }
            while (v86);
          }

          uint64_t v35 = v77 + 1;
          uint64_t v32 = v79;
        }
        while (v77 + 1 != v76);
        uint64_t v76 = [v74 countByEnumeratingWithState:&v111 objects:v125 count:16];
      }
      while (v76);
    }
  }
  if (sRenderEngagementCountValues)
  {
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v64 = v78;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v89 objects:v119 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v90;
      do
      {
        for (uint64_t n = 0; n != v66; ++n)
        {
          if (*(void *)v90 != v67) {
            objc_enumerationMutation(v64);
          }
          uint64_t v69 = *(void *)(*((void *)&v89 + 1) + 8 * n);
          pthread_rwlock_wrlock(&sRWRenderEngagementValueLock);
          v70 = [(id)sRenderEngagementCountValues objectForKey:v69];
          if (v70)
          {
            v71 = v70;
            v72 = (void *)[v70 copy];
          }
          else
          {
            v72 = objc_opt_new();
          }
          objc_msgSend(v72, "incrementRankingValuesForType:", 1, context);
          [(id)sRenderEngagementCountValues setValue:v72 forKey:v69];
          pthread_rwlock_unlock(&sRWRenderEngagementValueLock);
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v89 objects:v119 count:16];
      }
      while (v66);
    }
  }
}

void __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![v3 count]) {
    goto LABEL_23;
  }
  [MEMORY[0x1E4F1CA48] array];
  v22 = id v21 = v3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v5)
  {
    id v8 = 0;
    goto LABEL_20;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v4);
      }
      id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if (!v11) {
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_15;
      }
      uint64_t v12 = SSFetchAttributeValueIsValid(v11);

      if (!v12)
      {
        id v8 = 0;
LABEL_15:
        ++v7;
        continue;
      }
      id v8 = (void *)v12;
      uint64_t v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v7];
      if ([v8 count] == 1)
      {
        [v8 objectAtIndexedSubscript:0];
        id v23 = v8;
        id v14 = v4;
        v16 = uint64_t v15 = a1;
        id v17 = [MEMORY[0x1E4F1CA98] null];
        int v18 = [v16 isEqual:v17];

        a1 = v15;
        id v4 = v14;
        id v8 = v23;
        if (v18)
        {
          uint64_t v19 = (void *)[v13 copy];
          id v20 = [v19 attributeSet];
          [v20 setAttribute:0 forKey:@"_kMDItemRenderDate"];

          [v22 addObject:v19];
        }
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v6);
LABEL_20:

  if ([v22 count]) {
    [(id)sCSIndex indexSearchableItems:v22 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:*(void *)(a1 + 40) forBundleID:*(void *)(a1 + 48) options:0 completionHandler:&__block_literal_global_54];
  }

  id v3 = v21;
LABEL_23:
}

void __96__SSRankingFeedbackHandler_resultsWithRankingItemsDidBecomeVisible_date_protectionClassMapping___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [MEMORY[0x1E4F1CA48] array];
  v18 = uint64_t v17 = a1;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 uniqueIdentifier];
        id v11 = [v3 objectForKeyedSubscript:v10];

        if ([v11 count] == 1)
        {
          uint64_t v12 = [v11 objectAtIndexedSubscript:0];
          uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
          int v14 = [v12 isEqual:v13];

          if (v14)
          {
            uint64_t v15 = (void *)[v9 copy];
            id v16 = [v15 attributeSet];
            [v16 setAttribute:0 forKey:@"_kMDItemRenderDate"];

            [v18 addObject:v15];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  if ([v18 count]) {
    [(id)sIndexer indexSearchableItems:v18 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:*(void *)(v17 + 40) forBundleID:*(void *)(v17 + 48) options:0 completionHandler:&__block_literal_global_57];
  }
}

- (void)fetchBundleRenderAndEngagementInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SSRankingFeedbackHandler *)self fetchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke;
  block[3] = &unk_1E634C270;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke(uint64_t a1)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"_kMDItemBundleID=%@", @"com.apple.searchd"];
  id v3 = objc_opt_new();
  [v3 setInternal:1];
  [v3 setLowPriority:0];
  v43[0] = @"com.apple.searchd";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  [v3 setBundleIDs:v4];

  [v3 setMaxCount:400];
  [v3 setLive:1];
  v42[0] = *MEMORY[0x1E4F23670];
  v42[1] = @"_kMDItemRenderValues";
  v42[2] = @"_kMDItemEngagementValues";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
  [v3 setFetchAttributes:v5];

  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "setProtectionClasses:");
  }
  else
  {
    uint64_t v41 = *MEMORY[0x1E4F28358];
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    [v3 setProtectionClasses:v6];
  }
  uint64_t v7 = [v3 fetchAttributes];
  uint64_t v8 = [v7 count];

  uint64_t v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  if (sClientRankAndBlend)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_2;
    v32[3] = &unk_1E634C740;
    v32[4] = &v33;
    id v10 = (void *)MEMORY[0x1C1885400](v32);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_3;
    v29[3] = &unk_1E634C768;
    v31 = &v37;
    id v11 = v9;
    v30 = v11;
    uint64_t v12 = (void *)MEMORY[0x1C1885400](v29);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_4;
    v25[3] = &unk_1E634C790;
    long long v27 = &v33;
    id v28 = &v37;
    id v13 = v12;
    id v26 = v13;
    int v14 = (void *)MEMORY[0x1C1885400](v25);
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v2 context:v3];
    id v16 = v15;
    if (v15)
    {
      [v15 setFoundItemsHandler:v10];
      [v16 setGatherEndedHandler:v13];
      [v16 setCompletionHandler:v14];
      [v16 start];
    }
    else
    {
      dispatch_group_leave(v11);
    }

    _Block_object_dispose(&v33, 8);
    long long v19 = 0;
  }
  else
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    uint64_t v17 = (void *)sIndexer;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_5;
    v21[3] = &unk_1E634C7D8;
    id v23 = &v33;
    uint64_t v24 = v8;
    int v18 = v9;
    long long v22 = v18;
    long long v19 = [v17 startQuery:v2 withContext:v3 handler:v21];
    if (!v19) {
      dispatch_group_leave(v18);
    }

    _Block_object_dispose(&v33, 8);
    id v16 = 0;
  }
  dispatch_time_t v20 = dispatch_time(0, 250000000);
  dispatch_group_wait(v9, v20);
  if (sClientRankAndBlend)
  {
    if (v16 && !*((unsigned char *)v38 + 24)) {
      [v16 cancel];
    }
  }
  else if (v19)
  {
    [(id)sIndexer cancelQuery:v19];
  }
  _Block_object_dispose(&v37, 8);
}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  pthread_rwlock_wrlock(&sRWRenderEngagementValueLock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v2;
  uint64_t v23 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v25;
    uint64_t v21 = *MEMORY[0x1E4F22B50];
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v24 + 1) + 8 * v3);
        uint64_t v5 = objc_opt_new();
        id v6 = [v4 attributeSet];
        uint64_t v7 = [v6 attributeDictionary];
        uint64_t v8 = [v7 objectForKey:v21];
        if (v8)
        {
          uint64_t v9 = [v7 objectForKey:@"_kMDItemRenderValues"];
          uint64_t v10 = [v9 count];
          if (v10)
          {
            unint64_t v11 = v10;
            unint64_t v12 = 0;
            int v29 = 0;
            uint64_t v28 = 0;
            do
            {
              if (v12 >= v11)
              {
                *((_WORD *)&v28 + v12) = 0;
              }
              else
              {
                id v13 = [v9 objectAtIndexedSubscript:v12];
                *((_WORD *)&v28 + v12) = [v13 integerValue];
              }
              ++v12;
            }
            while (v12 != 6);
            [v5 setRankingValues:&v28 forType:1];
          }
          int v14 = [v7 objectForKey:@"_kMDItemEngagementValues"];

          uint64_t v15 = [v14 count];
          if (v15)
          {
            unint64_t v16 = v15;
            unint64_t v17 = 0;
            int v29 = 0;
            uint64_t v28 = 0;
            do
            {
              if (v17 >= v16)
              {
                *((_WORD *)&v28 + v17) = 0;
              }
              else
              {
                int v18 = [v14 objectAtIndexedSubscript:v17];
                *((_WORD *)&v28 + v17) = [v18 integerValue];
              }
              ++v17;
            }
            while (v17 != 6);
            [v5 setRankingValues:&v28 forType:0];
          }
          [(id)sRenderEngagementCountValues setObject:v5 forKey:v8];
        }
        ++v3;
      }
      while (v3 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v23);
  }

  pthread_rwlock_unlock(&sRWRenderEngagementValueLock);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void *__63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_4(void *result, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24) && !a2 && !*(unsigned char *)(*(void *)(result[6] + 8) + 24)) {
    return (void *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  return result;
}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_5(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a6;
  if (a2 == 2)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(unsigned char *)(v10 + 24))
    {
      *(unsigned char *)(v10 + 24) = 1;
      id v13 = v9;
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      id v9 = v13;
    }
  }
  else if (a2 != 1)
  {
    if (a2) {
      goto LABEL_10;
    }
    id v12 = v9;
    pthread_rwlock_wrlock(&sRWRenderEngagementValueLock);
    [a5 enumerateQueryResults:*(void *)(a1 + 48) stringCache:0 usingBlock:&__block_literal_global_73];
    pthread_rwlock_unlock(&sRWRenderEngagementValueLock);
    goto LABEL_9;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v11 + 24)) {
    goto LABEL_10;
  }
  *(unsigned char *)(v11 + 24) = 1;
  id v12 = v9;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_9:
  id v9 = v12;
LABEL_10:
}

void __63__SSRankingFeedbackHandler_fetchBundleRenderAndEngagementInfo___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = *(void **)a2;
  uint64_t v5 = (void *)*MEMORY[0x1E4F1D260];
  if (*(void *)a2 == *MEMORY[0x1E4F1D260]) {
    id v4 = 0;
  }
  id v6 = v4;
  if (v6)
  {
    uint64_t v7 = *(void **)(a2 + 8);
    if (v7 == v5) {
      uint64_t v7 = 0;
    }
    id v8 = v7;
    uint64_t v9 = [v8 count];
    if (v9)
    {
      unint64_t v10 = v9;
      unint64_t v11 = 0;
      int v21 = 0;
      uint64_t v20 = 0;
      do
      {
        if (v11 >= v10)
        {
          __int16 v13 = 0;
        }
        else
        {
          id v12 = [v8 objectAtIndexedSubscript:v11];
          __int16 v13 = [v12 integerValue];
        }
        *((_WORD *)&v20 + v11++) = v13;
      }
      while (v11 != 6);
      [v3 setRankingValues:&v20 forType:1];
    }
    int v14 = *(void **)(a2 + 16);
    if (v14 == v5) {
      int v14 = 0;
    }
    id v15 = v14;

    uint64_t v16 = [v15 count];
    if (v16)
    {
      unint64_t v17 = v16;
      unint64_t v18 = 0;
      int v21 = 0;
      uint64_t v20 = 0;
      do
      {
        if (v18 >= v17)
        {
          *((_WORD *)&v20 + v18) = 0;
        }
        else
        {
          long long v19 = [v15 objectAtIndexedSubscript:v18];
          *((_WORD *)&v20 + v18) = [v19 integerValue];
        }
        ++v18;
      }
      while (v18 != 6);
      [v3 setRankingValues:&v20 forType:0];
    }
    [(id)sRenderEngagementCountValues setObject:v3 forKey:v6];
  }
}

- (void)fetchBundleRenderAndEngagementInfo
{
}

- (void)writeRenderAndEngagementInfo
{
  uint64_t v3 = [(SSRankingFeedbackHandler *)self countQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SSRankingFeedbackHandler_writeRenderAndEngagementInfo__block_invoke;
  block[3] = &unk_1E634C270;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __56__SSRankingFeedbackHandler_writeRenderAndEngagementInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = [*(id *)(a1 + 32) mapProtectionClassToBundleIdToItem];
  uint64_t v3 = [v2 allKeys];

  uint64_t v31 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v38;
    uint64_t v30 = v1;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v3);
        }
        uint64_t v32 = v4;
        uint64_t v5 = *(void *)(*((void *)&v37 + 1) + 8 * v4);
        id v6 = [*(id *)(v1 + 32) mapProtectionClassToBundleIdToItem];
        uint64_t v7 = [v6 objectForKey:v5];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v8 = [v7 allKeys];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v34 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              int v14 = [v7 objectForKey:v13];
              id v15 = CS_simplifyItemArray();

              if (v15 && [v15 count])
              {
                uint64_t v16 = &__block_literal_global_76;
                if (!sClientRankAndBlend) {
                  uint64_t v16 = &__block_literal_global_78;
                }
                unint64_t v17 = &sIndexer;
                if (sClientRankAndBlend) {
                  unint64_t v17 = &sCSIndex;
                }
                [(id)*v17 indexSearchableItems:v15 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v5 forBundleID:v13 options:0 completionHandler:v16];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v10);
        }

        uint64_t v4 = v32 + 1;
        uint64_t v1 = v30;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v31);
  }

  unint64_t v18 = [*(id *)(v1 + 32) sectionCSItems];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    uint64_t v20 = *(void **)(v1 + 32);
    if (sClientRankAndBlend)
    {
      int v21 = (void *)sCSIndex;
      uint64_t v22 = [v20 sectionCSItems];
      uint64_t v23 = (void *)[v22 copy];
      long long v24 = CS_simplifyItemArray();
      uint64_t v25 = *MEMORY[0x1E4F28358];
      long long v26 = &__block_literal_global_80;
    }
    else
    {
      int v21 = (void *)sIndexer;
      uint64_t v22 = [v20 sectionCSItems];
      uint64_t v23 = (void *)[v22 copy];
      long long v24 = CS_simplifyItemArray();
      uint64_t v25 = *MEMORY[0x1E4F28358];
      long long v26 = &__block_literal_global_82;
    }
    [v21 indexSearchableItems:v24 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v25 forBundleID:@"com.apple.searchd" options:0 completionHandler:v26];
  }
  long long v27 = [*(id *)(v1 + 32) mapProtectionClassToBundleIdToItem];
  [v27 removeAllObjects];

  uint64_t v28 = [*(id *)(v1 + 32) sectionCSItems];
  [v28 removeAllObjects];
}

- (NSMutableDictionary)mapProtectionClassToBundleIdToItem
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMapProtectionClassToBundleIdToItem:(id)a3
{
}

- (NSMutableArray)sectionCSItems
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSectionCSItems:(id)a3
{
}

- (OS_dispatch_queue)countQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCountQueue:(id)a3
{
}

- (OS_dispatch_queue)fetchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFetchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_countQueue, 0);
  objc_storeStrong((id *)&self->_sectionCSItems, 0);
  objc_storeStrong((id *)&self->_mapProtectionClassToBundleIdToItem, 0);
}

- (id)fetchResults
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  uint64_t v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  id v24 = (id)objc_opt_new();
  id v2 = [NSString stringWithFormat:@"_kMDItemBundleID=%@ && kMDItemDisplayName=%@", @"com.apple.application", @"Reminders"];
  uint64_t v3 = objc_opt_new();
  [v3 setInternal:1];
  [v3 setLowPriority:0];
  v27[0] = @"com.apple.application";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v3 setBundleIDs:v4];

  [v3 setMaxCount:400];
  v26[0] = *MEMORY[0x1E4F23670];
  v26[1] = @"_kMDItemRenderData";
  v26[2] = @"_kMDItemEngagementData";
  v26[3] = @"_kMDItemRenderValues";
  void v26[4] = @"_kMDItemEngagementValues";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
  [v3 setFetchAttributes:v5];

  [v3 setClientBundleID:@"com.apple.application"];
  uint64_t v25 = *MEMORY[0x1E4F28358];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v3 setProtectionClasses:v6];

  uint64_t v7 = [v3 fetchAttributes];
  uint64_t v8 = [v7 count];

  uint64_t v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  uint64_t v10 = [MEMORY[0x1E4FA5D60] sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke;
  v15[3] = &unk_1E634C7D8;
  unint64_t v17 = &v19;
  uint64_t v18 = v8;
  uint64_t v11 = v9;
  uint64_t v16 = v11;
  id v12 = [v10 startQuery:v2 withContext:v3 handler:v15];

  if (!v12) {
    dispatch_group_leave(v11);
  }
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a6;
  if (a2 == 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else if (!a2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_2;
    v11[3] = &unk_1E634CA50;
    uint64_t v10 = *(void *)(a1 + 48);
    v11[4] = *(void *)(a1 + 40);
    [a5 enumerateQueryResults:v10 stringCache:0 usingBlock:v11];
  }
}

void __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = (void *)*MEMORY[0x1E4F1D260];
  if (*(void *)a2 == *MEMORY[0x1E4F1D260]) {
    uint64_t v4 = 0;
  }
  id v6 = v4;
  if (v6)
  {
    id v24 = v6;
    uint64_t v7 = objc_opt_new();
    [v7 setIdentifier:v24];
    uint64_t v8 = *(void **)(a2 + 8);
    if (v8 == v5) {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    uint64_t v10 = v9;
    if (v9)
    {
      id v27 = 0;
      id v28 = 0;
      __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_3((uint64_t)v9, v9, &v28, &v27);
      id v11 = v28;
      id v12 = v28;
      id v13 = v27;
      id v14 = v27;
      objc_storeStrong((id *)&sRenderCountSentinelDate, v11);
      objc_storeStrong((id *)&sRenderCountData, v13);
    }
    else
    {
      id v14 = 0;
      id v12 = 0;
    }
    id v15 = *(void **)(a2 + 16);
    if (v15 == v5) {
      id v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      id v25 = v14;
      id v26 = v12;
      __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_3(v17, v16, &v26, &v25);
      id v18 = v26;
      id v19 = v26;

      id v20 = v25;
      id v21 = v25;

      objc_storeStrong((id *)&sEngagementCountSentinelDate, v18);
      objc_storeStrong((id *)&sEngagementCountData, v20);
      id v14 = v21;
      id v12 = v19;
    }
    [v7 setSectionBundleIdentifier:@"com.apple.application"];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
    if (*(void **)(a2 + 24) == v5) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = *(void **)(a2 + 24);
    }
    objc_storeStrong((id *)&sRenderCounts, v22);
    if (*(void **)(a2 + 32) == v5) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = *(void **)(a2 + 32);
    }
    objc_storeStrong((id *)&sEngagementCounts, v23);

    id v6 = v24;
  }
}

void __47__SSRankingFeedbackHandler_Tests__fetchResults__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  char v9 = 0;
  if ([v6 length])
  {
    [v6 getBytes:&v9 length:1];
    if (v9 == 9)
    {
      objc_msgSend(v6, "subdataWithRange:", 1, 9);
      id v7 = objc_claimAutoreleasedReturnValue();
      uint64_t v8 = (double *)[v7 bytes];
      *a3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*v8];
      objc_msgSend(v6, "subdataWithRange:", 9, objc_msgSend(v6, "length") - 9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
}

- (void)resetResultWithRankingItems:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  uint64_t v6 = *MEMORY[0x1E4F1D260];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v31 + 1) + 8 * v9) identifier];
        id v11 = objc_alloc_init(MEMORY[0x1E4F23840]);
        [v11 setUniqueIdentifier:v10];
        [v11 setIsUpdate:1];
        [v11 setBundleID:@"com.apple.application"];
        id v12 = objc_opt_new();
        [v12 setObject:v6 forKey:@"_kMDItemRenderData"];
        [v12 setObject:v6 forKey:@"_kMDItemEngagementData"];
        id v13 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithAttributes:v12];
        [v11 setAttributeSet:v13];

        [v4 addObject:v11];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }

  id v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  id v15 = [MEMORY[0x1E4FA5D60] sharedInstance];
  id v16 = v4;
  uint64_t v17 = (void *)[v4 copy];
  uint64_t v18 = *MEMORY[0x1E4F28358];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63__SSRankingFeedbackHandler_Tests__resetResultWithRankingItems___block_invoke;
  v29[3] = &unk_1E634C9D8;
  id v19 = v14;
  uint64_t v30 = v19;
  [v15 indexSearchableItems:v17 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v18 forBundleID:@"com.apple.application" options:0 completionHandler:v29];

  dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  id v20 = objc_alloc_init(MEMORY[0x1E4F23840]);
  [v20 setUniqueIdentifier:@"com.apple.application"];
  [v20 setIsUpdate:1];
  id v21 = objc_opt_new();
  [v21 setAttribute:v6 forKey:@"_kMDItemRenderData"];
  [v21 setAttribute:v6 forKey:@"_kMDItemEngagementData"];
  [v20 setAttributeSet:v21];
  [v20 setBundleID:@"com.apple.searchd"];
  dispatch_group_enter(v19);
  uint64_t v22 = [MEMORY[0x1E4FA5D60] sharedInstance];
  id v35 = v20;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  id v24 = [v20 bundleID];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __63__SSRankingFeedbackHandler_Tests__resetResultWithRankingItems___block_invoke_2;
  v27[3] = &unk_1E634C9D8;
  id v28 = v19;
  id v25 = v19;
  [v22 indexSearchableItems:v23 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:v18 forBundleID:v24 options:0 completionHandler:v27];

  dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
}

void __63__SSRankingFeedbackHandler_Tests__resetResultWithRankingItems___block_invoke(uint64_t a1)
{
}

void __63__SSRankingFeedbackHandler_Tests__resetResultWithRankingItems___block_invoke_2(uint64_t a1)
{
}

- (id)getSyntheticTestRankingItem
{
  id v2 = objc_opt_new();
  [v2 setSectionBundleIdentifier:@"com.apple.application"];
  [v2 setIdentifier:@"com.apple.reminders"];
  return v2;
}

- (id)getSyntheticTestRankingItemsForStressTest
{
  id v2 = objc_opt_new();
  for (uint64_t i = 0; i != 100000; ++i)
  {
    uint64_t v4 = objc_opt_new();
    [v4 setSectionBundleIdentifier:@"com.apple.application"];
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.reminders.%ld", i);
    [v4 setIdentifier:v5];

    [v2 addObject:v4];
  }
  uint64_t v6 = [v2 objectAtIndexedSubscript:0];
  [v6 setIdentifier:@"com.apple.reminders"];

  uint64_t v7 = (void *)[v2 copy];
  return v7;
}

- (void)testForDurationWithIntervals:(int *)a3 maxIndex:(int)a4 duration:(int64_t)a5 counts:(id)a6
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v73 = a6;
  if (testForDurationWithIntervals_maxIndex_duration_counts__onceToken != -1) {
    dispatch_once(&testForDurationWithIntervals_maxIndex_duration_counts__onceToken, &__block_literal_global_55);
  }
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = (uint64_t *)MEMORY[0x1E4F28358];
  uint64_t v75 = a3;
  if (sStressMode == 1)
  {
    id v11 = [(SSRankingFeedbackHandler *)self getSyntheticTestRankingItemsForStressTest];
    id v12 = objc_opt_new();
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    obuint64_t j = v11;
    uint64_t v13 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v95;
      uint64_t v16 = *MEMORY[0x1E4F28358];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v95 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = [*(id *)(*((void *)&v94 + 1) + 8 * i) identifier];
          [v12 setObject:v16 forKey:v18];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
      }
      while (v14);
    }

    [(SSRankingFeedbackHandler *)self resetResultWithRankingItems:obj];
    v78 = (void *)[v12 copy];
    a3 = v75;
    uint64_t v10 = (uint64_t *)MEMORY[0x1E4F28358];
  }
  else
  {
    id v12 = [(SSRankingFeedbackHandler *)self getSyntheticTestRankingItem];
    long long v103 = v12;
    obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
    -[SSRankingFeedbackHandler resetResultWithRankingItems:](self, "resetResultWithRankingItems:");
    id v19 = [v12 identifier];
    long long v101 = v19;
    uint64_t v102 = *v10;
    v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
  }
  id v20 = [MEMORY[0x1E4F1C9C8] date];
  if ((a4 & 0x80000000) == 0)
  {
    uint64_t v21 = a4;
    do
    {
      [v20 timeIntervalSinceReferenceDate];
      uint64_t v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v22 + (double)a3[v21] * -86400.0];
      [v9 addObject:v23];

      --v21;
    }
    while (v21 != -1);
  }
  id v74 = v20;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v24 = v9;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v90 objects:v100 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v91;
    uint64_t v28 = *v10;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v91 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v30 = *(void *)(*((void *)&v90 + 1) + 8 * j);
        [(SSRankingFeedbackHandler *)self resultsWithRankingItemsDidBecomeVisible:obj date:v30 protectionClassMapping:v78];
        long long v31 = [obj objectAtIndexedSubscript:0];
        [(SSRankingFeedbackHandler *)self didEngageResultWithRankingItem:v31 startDate:v30 protectionClass:v28 query:@"a"];

        [(SSRankingFeedbackHandler *)self writeRenderAndEngagementInfo];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v90 objects:v100 count:16];
    }
    while (v26);
  }

  id v32 = [(SSRankingFeedbackHandler *)self fetchResults];
  [v74 timeIntervalSinceReferenceDate];
  long long v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v33 + (double)(*v75 + 364) * -86400.0];
  id v35 = objc_opt_new();
  uint64_t v76 = objc_opt_new();
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v36 = v24;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v86 objects:v99 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    long long v39 = 0;
    uint64_t v40 = *(void *)v87;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v87 != v40) {
          objc_enumerationMutation(v36);
        }
        v42 = *(void **)(*((void *)&v86 + 1) + 8 * k);
        if ([v42 compare:v34] == -1)
        {
          if ([v35 count]) {
            [v35 objectAtIndexedSubscript:0];
          }
          else {
          uint64_t v44 = [MEMORY[0x1E4F1C9C8] date];
          }

          long long v39 = (void *)v44;
        }
        else
        {
          if (!v39 || [v39 compare:v42] != -1)
          {
            id v43 = v42;

            long long v39 = v43;
          }
          [v35 addObject:v42];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v86 objects:v99 count:16];
    }
    while (v38);
  }
  else
  {
    long long v39 = 0;
  }
  v72 = v36;

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v45 = v35;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v82 objects:v98 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    int v48 = 0;
    uint64_t v49 = *(void *)v83;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v83 != v49) {
          objc_enumerationMutation(v45);
        }
        id v51 = *(void **)(*((void *)&v82 + 1) + 8 * m);
        __int16 v81 = 0;
        if (v48)
        {
          id v52 = [v45 objectAtIndexedSubscript:v48 - 1];
        }
        else
        {
          id v52 = v39;
        }
        uint64_t v53 = v52;
        [v51 timeIntervalSinceReferenceDate];
        double v55 = v54;
        [v53 timeIntervalSinceReferenceDate];
        int v57 = (int)((double)(86400 * ((unint64_t)(v55 - v56) / 0x15180)) / 86400.0);
        if ((a5 & 0x8000000000000000) == 0 || !v57)
        {
          __int16 v80 = 0;
          if (v57 >= 256)
          {
            __int16 v80 = (v57 + 1);
            LOBYTE(v57) = -1;
          }
          LOBYTE(v81) = v57;
          HIBYTE(v81) = 1;
          [v76 appendBytes:&v81 length:2];
          if ((_BYTE)v80) {
            [v76 appendBytes:&v80 length:2];
          }
          ++v48;
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v82 objects:v98 count:16];
    }
    while (v47);
  }

  v58 = (void *)[v76 copy];
  uint64_t v59 = [v58 length];
  if (!sRenderCountSentinelDate) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:]();
  }
  uint64_t v60 = v59;
  [v39 timeIntervalSinceReferenceDate];
  double v62 = v61;
  [(id)sRenderCountSentinelDate timeIntervalSinceReferenceDate];
  if (v62 - v63 >= 86400.0) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:]();
  }
  if (!sEngagementCountSentinelDate) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:]();
  }
  [(id)sEngagementCountSentinelDate timeIntervalSinceReferenceDate];
  double v65 = v64;
  [v39 timeIntervalSinceReferenceDate];
  if (v65 - v66 >= 86400.0) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.4();
  }
  if (([(id)sEngagementCountData isEqualToData:v58] & 1) == 0) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:]2();
  }
  if (([(id)sRenderCountData isEqualToData:v58] & 1) == 0) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:]1();
  }
  if ([(id)sRenderCountData length] != v60) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:]0();
  }
  if ([(id)sEngagementCountData length] != v60) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.9();
  }
  uint64_t v67 = [(id)sRenderCounts count];
  if (v67 != [v73 count]) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.8();
  }
  uint64_t v68 = [(id)sEngagementCounts count];
  if (v68 != [v73 count]) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.7();
  }
  uint64_t v69 = [MEMORY[0x1E4F1CAD0] setWithArray:v73];
  v70 = [MEMORY[0x1E4F1CAD0] setWithArray:sRenderCounts];
  if (([v69 isEqualToSet:v70] & 1) == 0) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.6();
  }
  v71 = [MEMORY[0x1E4F1CAD0] setWithArray:sEngagementCounts];

  if (([v69 isEqualToSet:v71] & 1) == 0) {
    -[SSRankingFeedbackHandler(Tests) testForDurationWithIntervals:maxIndex:duration:counts:].cold.5();
  }
}

uint64_t __89__SSRankingFeedbackHandler_Tests__testForDurationWithIntervals_maxIndex_duration_counts___block_invoke()
{
  userDefaults = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
  return MEMORY[0x1F41817F8]();
}

- (void)testCountsUptoOneDay
{
  int v2 = 0;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:&v2 maxIndex:0 duration:1 counts:&unk_1F18643E8];
}

- (void)testCountsUptoWeek
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  long long v2 = xmmword_1BDC5D480;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:&v2 maxIndex:3 duration:7 counts:&unk_1F1864400];
}

- (void)testCountsUptoMonth
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = xmmword_1BDC5D490;
  v2[1] = unk_1BDC5D4A0;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v2 maxIndex:7 duration:30 counts:&unk_1F1864418];
}

- (void)testCountsUptoQuarter
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = xmmword_1BDC5D4B0;
  v2[1] = unk_1BDC5D4C0;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v2 maxIndex:7 duration:90 counts:&unk_1F1864430];
}

- (void)testCountsUptoHalfYear
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = xmmword_1BDC5D4D0;
  v2[1] = unk_1BDC5D4E0;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v2 maxIndex:7 duration:180 counts:&unk_1F1864448];
}

- (void)testCountsUptoYear
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  long long v2 = xmmword_1BDC5D4F0;
  uint64_t v3 = 0x16C0000016BLL;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:&v2 maxIndex:5 duration:365 counts:&unk_1F1864460];
}

- (void)testCountsAfterYear
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = xmmword_1BDC5D508;
  v2[1] = unk_1BDC5D518;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v2 maxIndex:7 duration:381 counts:&unk_1F1864478];
}

- (void)testCountsAfterCoupleYears
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = 0x30C00000014;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v2 maxIndex:1 duration:781 counts:&unk_1F1864490];
}

- (void)testCountsMovingDaysInPast
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = 0xFFFFFFFE00000000;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v2 maxIndex:1 duration:-3 counts:&unk_1F18644A8];
}

- (void)testCountsMovingYearInPast
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = 0xFFFFFE8900000000;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v2 maxIndex:1 duration:-376 counts:&unk_1F18644C0];
}

- (void)testCountsMovingCoupleOfYearsInPast
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = 0xFFFFFCF400000000;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v2 maxIndex:1 duration:-781 counts:&unk_1F18644D8];
}

- (void)testForDummyEntry
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = 0x14000000000;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v2 maxIndex:1 duration:321 counts:&unk_1F18644F0];
}

- (void)testCountsForRegularEngagement
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bzero(v4, 0xB68uLL);
  for (uint64_t i = 0; i != 730; ++i)
    v4[i] = i;
  [(SSRankingFeedbackHandler *)self testForDurationWithIntervals:v4 maxIndex:729 duration:731 counts:&unk_1F1864508];
}

- (void)stressTestCounts
{
  uint64_t v2 = 0;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  sStressMode = 1;
  int32x4_t v3 = (int32x4_t)xmmword_1BDC5D470;
  memset(v5, 0, sizeof(v5));
  v4.i64[0] = 0x400000004;
  v4.i64[1] = 0x400000004;
  do
  {
    v5[v2] = v3;
    int32x4_t v3 = vaddq_s32(v3, v4);
    ++v2;
  }
  while (v2 != 25);
  -[SSRankingFeedbackHandler testForDurationWithIntervals:maxIndex:duration:counts:](self, "testForDurationWithIntervals:maxIndex:duration:counts:", v5, 99, 101, &unk_1F1864520, *(double *)v3.i64);
}

@end