@interface WFActionDonationRecommender
+ (WFActionDonationRecommender)sharedRecommender;
+ (id)disabledSpotlightApps;
+ (id)donationsByRemovingDuplicatesFromDonations:(id)a3 excludingAppIdentifiers:(id)a4 includingSingleDonationPerApp:(BOOL)a5;
+ (id)filterDonationsForTitleLength:(id)a3;
+ (id)filteredActionDonations:(id)a3 byApplicationAppIdentifier:(id)a4;
+ (id)getDonationsFromActionResponse:(id)a3;
- (NSArray)defaultRecommendations;
- (NSMutableDictionary)cachedActionPredictionsPerApp;
- (NSMutableDictionary)cachedDonationsPerApp;
- (NSSet)excludedAppBundleIdentifiers;
- (OS_dispatch_group)activeFetchGroup;
- (OS_dispatch_queue)workQueue;
- (WFActionDonationRecommender)init;
- (WFCachedDonations)cachedActionPredictionsForAllApps;
- (WFCachedDonations)cachedDonationsForAllApps;
- (void)_fetchDonationsWithLimit:(unint64_t)a3 applicationBundleIdentifier:(id)a4 includeSuggestedForAllApps:(BOOL)a5 completionHandler:(id)a6;
- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4;
- (void)cacheActionPredictionDonations:(id)a3 forApplicationBundleIdentifier:(id)a4 ballpark:(unint64_t)a5;
- (void)cacheRecentDonations:(id)a3 forApplicationBundleIdentifier:(id)a4 ballpark:(unint64_t)a5;
- (void)fetchDonationsWithLimit:(unint64_t)a3 applicationBundleIdentifier:(id)a4 includeSuggestedForAllApps:(BOOL)a5 completionHandler:(id)a6;
- (void)fetchRecommendedDonationsForAppPredictionsWithCompletionHandler:(id)a3;
- (void)fetchRecommendedDonationsForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)setActiveFetchGroup:(id)a3;
- (void)setCachedActionPredictionsForAllApps:(id)a3;
- (void)setCachedActionPredictionsPerApp:(id)a3;
- (void)setCachedDonationsForAllApps:(id)a3;
- (void)setCachedDonationsPerApp:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation WFActionDonationRecommender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedActionPredictionsPerApp, 0);
  objc_storeStrong((id *)&self->_cachedActionPredictionsForAllApps, 0);
  objc_storeStrong((id *)&self->_cachedDonationsPerApp, 0);
  objc_storeStrong((id *)&self->_cachedDonationsForAllApps, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_activeFetchGroup, 0);
  objc_storeStrong((id *)&self->_excludedAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultRecommendations, 0);
}

- (void)setCachedActionPredictionsPerApp:(id)a3
{
}

- (NSMutableDictionary)cachedActionPredictionsPerApp
{
  return self->_cachedActionPredictionsPerApp;
}

- (void)setCachedActionPredictionsForAllApps:(id)a3
{
}

- (WFCachedDonations)cachedActionPredictionsForAllApps
{
  return self->_cachedActionPredictionsForAllApps;
}

- (void)setCachedDonationsPerApp:(id)a3
{
}

- (NSMutableDictionary)cachedDonationsPerApp
{
  return self->_cachedDonationsPerApp;
}

- (void)setCachedDonationsForAllApps:(id)a3
{
}

- (WFCachedDonations)cachedDonationsForAllApps
{
  return self->_cachedDonationsForAllApps;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setActiveFetchGroup:(id)a3
{
}

- (OS_dispatch_group)activeFetchGroup
{
  return self->_activeFetchGroup;
}

- (void)fetchRecommendedDonationsForAppPredictionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E654D880;
  id v7 = v4;
  uint64_t v8 = 150;
  v6[4] = self;
  id v5 = v4;
  [(WFActionDonationRecommender *)self fetchDonationsWithLimit:150 applicationBundleIdentifier:0 includeSuggestedForAllApps:1 completionHandler:v6];
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v60 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E654D768;
  id v64 = v9;
  id v92 = v64;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obuint64_t j = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v87 objects:v101 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v88 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        v16 = [v15 sourceAppIdentifierForDisplay];
        v17 = v10[2](v10, v16);
        v18 = [v17 predictedActions];
        [v18 addObject:v15];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v87 objects:v101 count:16];
    }
    while (v12);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v19 = v7;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v83 objects:v100 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v84 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v83 + 1) + 8 * j);
        v25 = [v24 sourceAppIdentifierForDisplay];
        v26 = v10[2](v10, v25);
        v27 = [v26 recentActions];
        [v27 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v83 objects:v100 count:16];
    }
    while (v21);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v28 = v60;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v79 objects:v99 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v80;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v80 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v79 + 1) + 8 * k);
        v34 = v10[2](v10, v33);
        v35 = [v34 appSuggestedActions];
        v36 = [v28 objectForKeyedSubscript:v33];
        [v35 addObjectsFromArray:v36];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v79 objects:v99 count:16];
    }
    while (v30);
  }

  v37 = getWFActionDonationsLogObject();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    uint64_t v38 = *(void *)(a1 + 48);
    uint64_t v39 = [v64 count];
    *(_DWORD *)buf = 136315650;
    v94 = "-[WFActionDonationRecommender fetchRecommendedDonationsForAppPredictionsWithCompletionHandler:]_block_invoke";
    __int16 v95 = 2048;
    uint64_t v96 = v38;
    __int16 v97 = 2048;
    uint64_t v98 = v39;
    _os_log_impl(&dword_1C7F0A000, v37, OS_LOG_TYPE_INFO, "%s Successfully processed donations with limit: %lu,final app count: %lu", buf, 0x20u);
  }

  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_211;
  v77[3] = &unk_1E654D7E0;
  uint64_t v41 = a1;
  v77[4] = *(void *)(a1 + 32);
  id v78 = v40;
  id v42 = v40;
  [v64 enumerateKeysAndObjectsUsingBlock:v77];
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_4;
  v75[3] = &unk_1E654D808;
  v75[4] = *(void *)(a1 + 32);
  id v44 = v43;
  id v76 = v44;
  [v42 enumerateKeysAndObjectsUsingBlock:v75];

  id v45 = v44;
  v46 = getWFActionDonationsLogObject();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    uint64_t v47 = *(void *)(a1 + 48);
    uint64_t v48 = [v45 count];
    *(_DWORD *)buf = 136315650;
    v94 = "-[WFActionDonationRecommender fetchRecommendedDonationsForAppPredictionsWithCompletionHandler:]_block_invoke_5";
    __int16 v95 = 2048;
    uint64_t v96 = v47;
    uint64_t v41 = a1;
    __int16 v97 = 2048;
    uint64_t v98 = v48;
    _os_log_impl(&dword_1C7F0A000, v46, OS_LOG_TYPE_INFO, "%s Successfully processed donations with limit: %lu, final app count: %lu", buf, 0x20u);
  }

  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v63 = [(objc_class *)getATXClientClass() clientForConsumerType:13];
  v51 = [v63 appPredictionsForConsumerSubType:33 limit:8];
  v52 = [v51 predictedApps];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_218;
  v73[3] = &unk_1E65591A0;
  id v53 = v50;
  id v74 = v53;
  [v52 enumerateObjectsUsingBlock:v73];

  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2_221;
  v71[3] = &unk_1E654D830;
  id v72 = v53;
  id v61 = v53;
  v54 = _Block_copy(v71);
  v55 = [v45 allKeys];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_3_223;
  v69[3] = &unk_1E654D858;
  id v70 = v54;
  id v56 = v54;
  v57 = [v55 sortedArrayUsingComparator:v69];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_4_225;
  v66[3] = &unk_1E65592B0;
  id v67 = v49;
  id v68 = v45;
  id v58 = v45;
  id v59 = v49;
  [v57 enumerateObjectsUsingBlock:v66];

  (*(void (**)(void))(*(void *)(v41 + 40) + 16))();
}

id __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKey:v3];
    if (!v4)
    {
      id v4 = objc_opt_new();
      [*(id *)(a1 + 32) setObject:v4 forKey:v3];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  id v4 = a3;
  v35 = objc_opt_new();
  id v5 = objc_opt_new();
  v36 = v4;
  v37 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v6 = [v4 recentActions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 interaction];
          uint64_t v13 = [v12 intent];

          v14 = VCIntentsForAllPossibleParameterCombinationsOfIntent(v13);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2_212;
          v43[3] = &unk_1E654D790;
          id v44 = v38;
          id v45 = v5;
          id v46 = v37;
          [v14 enumerateObjectsUsingBlock:v43];
        }
        else
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v8);
  }

  v15 = [v4 appSuggestedActions];
  if ([v15 count])
  {
    v16 = [v15 firstObject];
    v17 = v35;
    [v35 addObject:v16];

    uint64_t v18 = objc_msgSend(v15, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 1);

    v15 = (void *)v18;
  }
  else
  {
    v17 = v35;
  }
  if ([v15 count]) {
    unint64_t v19 = 1;
  }
  else {
    unint64_t v19 = 2;
  }
  uint64_t v20 = [v4 predictedActions];
  unint64_t v21 = [v20 count];

  if (v19 >= v21) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = v19;
  }
  v23 = [v4 predictedActions];
  v24 = objc_msgSend(v23, "subarrayWithRange:", 0, v22);
  [v17 addObjectsFromArray:v24];

  [v17 addObjectsFromArray:v5];
  v25 = [*(id *)(a1 + 32) excludedAppBundleIdentifiers];
  v26 = +[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:v17 excludingAppIdentifiers:v25 includingSingleDonationPerApp:0];

  uint64_t v27 = [v26 count];
  BOOL v28 = v22 != 0;
  if (v22) {
    uint64_t v29 = (4 - v27) & ~((4 - v27) >> 63);
  }
  else {
    uint64_t v29 = ((4 - v27) & ~((4 - v27) >> 63)) + 1;
  }
  uint64_t v30 = [v15 count];
  if (v30 >= v29) {
    uint64_t v31 = v29;
  }
  else {
    uint64_t v31 = v30;
  }
  v32 = objc_msgSend(v15, "subarrayWithRange:", 0, v31);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_3;
  v39[3] = &unk_1E654D7B8;
  BOOL v42 = v28;
  id v40 = v26;
  uint64_t v41 = v31;
  id v33 = v26;
  [v32 enumerateObjectsUsingBlock:v39];
  [v33 addObjectsFromArray:v37];
  [*(id *)(a1 + 40) setObject:v33 forKey:v38];
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 excludedAppBundleIdentifiers];
  uint64_t v8 = +[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:v6 excludingAppIdentifiers:v7 includingSingleDonationPerApp:0];

  if ([v8 count]) {
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
  }
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_218(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

uint64_t __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2_221(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  id v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

uint64_t __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_3_223(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  uint64_t v8 = v6(v5, a2);
  uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v8 - v9;
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_4_225(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 objectForKey:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 addObject:v6];
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_2_212(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = VCInteractionDonationFromINIntent(a2, *(void **)(a1 + 32));
  id v7 = (id)v5;
  uint64_t v6 = 48;
  if (!a3) {
    uint64_t v6 = 40;
  }
  [*(id *)(a1 + v6) addObject:v5];
}

void __95__WFActionDonationRecommender_fetchRecommendedDonationsForAppPredictionsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = v5;
  if (*(void *)(a1 + 40) - 1 == a3 && ((id v6 = v5, a3) || *(unsigned char *)(a1 + 48))
    || (unint64_t v7 = a3 + 1, v8 = [*(id *)(a1 + 32) count], v6 = v9, v8 < v7))
  {
    [*(id *)(a1 + 32) addObject:v6];
  }
  else
  {
    [*(id *)(a1 + 32) insertObject:v9 atIndex:v7];
  }
}

- (void)fetchRecommendedDonationsForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  unint64_t v8 = (void (**)(id, void))a4;
  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFActionDonationRecommender.m", 332, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  if (v7) {
    uint64_t v9 = 30;
  }
  else {
    uint64_t v9 = 150;
  }
  v10 = [(WFActionDonationRecommender *)self excludedAppBundleIdentifiers];
  uint64_t v11 = v10;
  if (v7 && [v10 containsObject:v7])
  {
    v8[2](v8, 0);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __105__WFActionDonationRecommender_fetchRecommendedDonationsForApplicationBundleIdentifier_completionHandler___block_invoke;
    v13[3] = &unk_1E654D740;
    id v14 = v11;
    uint64_t v17 = v9;
    id v15 = v7;
    v16 = v8;
    [(WFActionDonationRecommender *)self fetchDonationsWithLimit:v9 applicationBundleIdentifier:v15 includeSuggestedForAllApps:0 completionHandler:v13];
  }
}

void __105__WFActionDonationRecommender_fetchRecommendedDonationsForApplicationBundleIdentifier_completionHandler___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v43 = a3;
  id v42 = a4;
  id v45 = (void *)[v6 mutableCopy];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v53;
    uint64_t v44 = *(void *)v53;
    do
    {
      uint64_t v10 = 0;
      uint64_t v46 = v8;
      do
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v52 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 interaction];
          uint64_t v13 = [v12 intent];

          id v14 = VCIntentsForAllPossibleParameterCombinationsOfIntent(v13);
          id v15 = objc_opt_new();
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v16 = v14;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v62 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v49 != v19) {
                  objc_enumerationMutation(v16);
                }
                unint64_t v21 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                unint64_t v22 = [v11 sourceAppIdentifier];
                v23 = VCInteractionDonationFromINIntent(v21, v22);

                [v15 addObject:v23];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v48 objects:v62 count:16];
            }
            while (v18);
          }

          objc_msgSend(v45, "replaceObjectsInRange:withObjectsFromArray:", objc_msgSend(v45, "indexOfObject:", v11), 1, v15);
          uint64_t v9 = v44;
          uint64_t v8 = v46;
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v8);
  }

  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v25 = a1;
  v26 = +[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:v43 excludingAppIdentifiers:a1[4] includingSingleDonationPerApp:0];
  unint64_t v27 = [v26 count];
  if (v27 >= 2) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = v27;
  }
  uint64_t v29 = objc_msgSend(v26, "subarrayWithRange:", 0, v28);
  [v24 addObjectsFromArray:v42];
  [v24 addObjectsFromArray:v29];
  [v24 addObjectsFromArray:v45];
  uint64_t v30 = +[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:v24 excludingAppIdentifiers:a1[4] includingSingleDonationPerApp:0];

  uint64_t v31 = getWFActionDonationsLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    uint64_t v32 = a1[7];
    uint64_t v33 = [v30 count];
    *(_DWORD *)buf = 136315650;
    v57 = "-[WFActionDonationRecommender fetchRecommendedDonationsForApplicationBundleIdentifier:completionHandler:]_block_invoke";
    __int16 v58 = 2048;
    uint64_t v59 = v32;
    v25 = a1;
    __int16 v60 = 2048;
    uint64_t v61 = v33;
    _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_INFO, "%s Successfully processed recommended donations with limit: %lu, count: %lu", buf, 0x20u);
  }

  v34 = getWFActionDonationsLogObject();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = v25[5];
    *(_DWORD *)buf = 136315394;
    v57 = "-[WFActionDonationRecommender fetchRecommendedDonationsForApplicationBundleIdentifier:completionHandler:]_block_invoke";
    __int16 v58 = 2114;
    uint64_t v59 = v35;
    _os_log_impl(&dword_1C7F0A000, v34, OS_LOG_TYPE_DEBUG, "%s for applicationBundleIdentifier: %{public}@", buf, 0x16u);
  }

  uint64_t v36 = v25[6];
  unint64_t v37 = v25[7];
  unint64_t v38 = [v30 count];
  if (v37 >= v38) {
    unint64_t v39 = v38;
  }
  else {
    unint64_t v39 = v37;
  }
  id v40 = objc_msgSend(v30, "subarrayWithRange:", 0, v39);
  (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v40);
}

- (void)_fetchDonationsWithLimit:(unint64_t)a3 applicationBundleIdentifier:(id)a4 includeSuggestedForAllApps:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v82 = a6;
  uint64_t v141 = 0;
  v142 = &v141;
  uint64_t v143 = 0x3032000000;
  v144 = __Block_byref_object_copy__4790;
  v145 = __Block_byref_object_dispose__4791;
  id v146 = 0;
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x3032000000;
  v138 = __Block_byref_object_copy__4790;
  v139 = __Block_byref_object_dispose__4791;
  id v140 = 0;
  uint64_t v129 = 0;
  v130 = (id *)&v129;
  uint64_t v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__4790;
  v133 = __Block_byref_object_dispose__4791;
  id v134 = 0;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x3032000000;
  v126 = __Block_byref_object_copy__4790;
  v127 = __Block_byref_object_dispose__4791;
  id v128 = 0;
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x2020000000;
  char v122 = 0;
  unint64_t v83 = a3;
  group = dispatch_group_create();
  if (2 * a3 <= 0x32) {
    unint64_t v11 = 50;
  }
  else {
    unint64_t v11 = 2 * a3;
  }
  long long v85 = self;
  long long v86 = v10;
  if (v10)
  {
    uint64_t v12 = [(WFActionDonationRecommender *)self cachedDonationsPerApp];
    uint64_t v13 = [v12 objectForKeyedSubscript:v10];
  }
  else
  {
    uint64_t v13 = [(WFActionDonationRecommender *)self cachedDonationsForAllApps];
  }
  long long v81 = v13;
  if (v13 && [v13 isValidWithBallpark:v11])
  {
    uint64_t v14 = [v13 donations];
    id v15 = (void *)v142[5];
    v142[5] = v14;

    *((unsigned char *)v120 + 24) = 1;
  }
  else
  {
    dispatch_group_enter(group);
    id v16 = getWFActionDonationsLogObject();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    uint64_t v18 = getWFActionDonationsLogObject();
    uint64_t v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FetchRecentDonations", "appIdentifier=%{signpost.telemetry:string1, Name=AppID}@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v20 = (void *)MEMORY[0x1E4FB4518];
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke;
    v112[3] = &unk_1E654D6C8;
    v116 = &v141;
    os_signpost_id_t v117 = v17;
    v115 = &v119;
    v112[4] = v85;
    id v113 = v10;
    unint64_t v118 = v11;
    v114 = group;
    [v20 fetchDonationsForApplicationBundleIdentifier:v113 limit:v11 filteringForTopLevel:0 filteringForIsEligibleForPrediction:1 filteringForRecent:1 completion:v112];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v155 = 0x2020000000;
  char v156 = 0;
  if (v10)
  {
    unint64_t v21 = [(WFActionDonationRecommender *)v85 cachedActionPredictionsPerApp];
    unint64_t v22 = [v21 objectForKeyedSubscript:v10];
  }
  else
  {
    unint64_t v22 = [(WFActionDonationRecommender *)v85 cachedActionPredictionsForAllApps];
  }
  long long v80 = v22;
  if (v22 && [v22 isValidWithBallpark:v83])
  {
    uint64_t v23 = [v22 donations];
    id v24 = (void *)v136[5];
    v136[5] = v23;

    *(unsigned char *)(*((void *)&buf + 1) + 24) = 1;
  }
  else
  {
    dispatch_group_enter(group);
    v25 = getWFActionDonationsLogObject();
    os_signpost_id_t v26 = os_signpost_id_generate(v25);

    unint64_t v27 = getWFActionDonationsLogObject();
    uint64_t v28 = v27;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)v150 = 134218242;
      v151 = (const char *)v83;
      __int16 v152 = 2112;
      uint64_t v153 = (uint64_t)v10;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "FetchPredictedDonations", "limit=%{signpost.telemetry:number1, Name=Limit}lu appIdentifier=%{signpost.telemetry:string1, Name=AppID}@", v150, 0x16u);
    }

    id v29 = objc_alloc_init(getATXActionPredictionClientClass());
    if (v10)
    {
      id v149 = v10;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v149 count:1];
    }
    else
    {
      uint64_t v30 = 0;
    }
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_192;
    v105[3] = &unk_1E654D6F0;
    v109 = &v135;
    os_signpost_id_t v110 = v26;
    p_long long buf = &buf;
    v105[4] = v85;
    id v106 = v10;
    unint64_t v111 = v83;
    v107 = group;
    [v29 getActionPredictionsForCandidateBundleIdentifiers:v30 candidateActionTypes:0 consumerType:8 consumerSubType:23 limit:v83 reply:v105];
  }
  uint64_t v31 = (void *)MEMORY[0x1E4F1CBF0];
  if (!v10)
  {
    id v40 = v130[5];
    v130[5] = (id)MEMORY[0x1E4F1CBF0];

    if (!v7) {
      goto LABEL_60;
    }
    uint64_t v41 = objc_opt_new();
    id v42 = (void *)v124[5];
    v124[5] = v41;

    id v43 = +[WFDatabase defaultDatabase];
    id v103 = 0;
    uint64_t v44 = [v43 shortcutSuggestionsForAllAppsWithLimit:4 shortcutAvailability:0 error:&v103];
    id v34 = v103;

    id v45 = getWFActionDonationsLogObject();
    uint64_t v46 = v45;
    if (v44)
    {
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        uint64_t v47 = [v44 count];
        *(_DWORD *)v150 = 136315394;
        v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAll"
               "Apps:completionHandler:]";
        __int16 v152 = 2048;
        uint64_t v153 = v47;
        long long v48 = "%s Successfully fetched %lu suggested donations from all apps";
        long long v49 = v46;
        os_log_type_t v50 = OS_LOG_TYPE_INFO;
LABEL_47:
        _os_log_impl(&dword_1C7F0A000, v49, v50, v48, v150, 0x16u);
      }
    }
    else if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v150 = 136315394;
      v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllAp"
             "ps:completionHandler:]";
      __int16 v152 = 2114;
      uint64_t v153 = (uint64_t)v34;
      long long v48 = "%s Error getting voice shortcut suggestions for all apps: %{public}@";
      long long v49 = v46;
      os_log_type_t v50 = OS_LOG_TYPE_ERROR;
      goto LABEL_47;
    }

    long long v52 = [(WFActionDonationRecommender *)v85 excludedAppBundleIdentifiers];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v33 = v44;
    uint64_t v53 = [v33 countByEnumeratingWithState:&v99 objects:v148 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v100;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v100 != v54) {
            objc_enumerationMutation(v33);
          }
          id v56 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          if (([v52 containsObject:v56] & 1) == 0)
          {
            v57 = [v33 objectForKeyedSubscript:v56];
            __int16 v58 = VCActionDonationArrayFromINShortcutArray(v57, v56);
            [(id)v124[5] setObject:v58 forKeyedSubscript:v56];
          }
        }
        uint64_t v53 = [v33 countByEnumeratingWithState:&v99 objects:v148 count:16];
      }
      while (v53);
    }

    goto LABEL_58;
  }
  uint64_t v32 = +[WFDatabase defaultDatabase];
  id v104 = 0;
  id v33 = [v32 shortcutSuggestionsForAppWithBundleIdentifier:v10 shortcutAvailability:0 error:&v104];
  id v34 = v104;

  uint64_t v35 = getWFActionDonationsLogObject();
  uint64_t v36 = v35;
  if (v34)
  {
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_DWORD *)v150 = 136315394;
    v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps"
           ":completionHandler:]";
    __int16 v152 = 2114;
    uint64_t v153 = (uint64_t)v34;
    unint64_t v37 = "%s Error getting voice shortcut suggestions: %{public}@";
    unint64_t v38 = v36;
    os_log_type_t v39 = OS_LOG_TYPE_ERROR;
    goto LABEL_39;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    uint64_t v51 = [v130[5] count];
    *(_DWORD *)v150 = 136315394;
    v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps"
           ":completionHandler:]";
    __int16 v152 = 2048;
    uint64_t v153 = v51;
    _os_log_impl(&dword_1C7F0A000, v36, OS_LOG_TYPE_INFO, "%s Successfully fetched suggested donations with donation count: %lu", v150, 0x16u);
  }

  uint64_t v36 = getWFActionDonationsLogObject();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v150 = 136315394;
    v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps"
           ":completionHandler:]";
    __int16 v152 = 2114;
    uint64_t v153 = (uint64_t)v10;
    unint64_t v37 = "%s for applicationBundleIdentifier: %{public}@";
    unint64_t v38 = v36;
    os_log_type_t v39 = OS_LOG_TYPE_DEBUG;
LABEL_39:
    _os_log_impl(&dword_1C7F0A000, v38, v39, v37, v150, 0x16u);
  }
LABEL_40:

  if (v33)
  {
    long long v52 = VCActionDonationArrayFromINShortcutArray(v33, v10);
  }
  else
  {
    long long v52 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong(v130 + 5, v52);
  if (v33)
  {
LABEL_58:

    goto LABEL_59;
  }
  id v33 = 0;
LABEL_59:

LABEL_60:
  uint64_t v59 = [(WFActionDonationRecommender *)v85 defaultRecommendations];
  __int16 v60 = +[WFActionDonationRecommender filteredActionDonations:v59 byApplicationAppIdentifier:v86];

  if ([v60 count])
  {
    uint64_t v61 = [v130[5] arrayByAddingObjectsFromArray:v60];
    id v62 = v130[5];
    v130[5] = (id)v61;

    v63 = getWFActionDonationsLogObject();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      uint64_t v64 = [v60 count];
      *(_DWORD *)v150 = 136315394;
      v151 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllAp"
             "ps:completionHandler:]";
      __int16 v152 = 2048;
      uint64_t v153 = v64;
      _os_log_impl(&dword_1C7F0A000, v63, OS_LOG_TYPE_INFO, "%s Adding %lu default recommended donations", v150, 0x16u);
    }

    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v65 = v60;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v95 objects:v147 count:16];
    if (v66)
    {
      uint64_t v67 = *(void *)v96;
      do
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v96 != v67) {
            objc_enumerationMutation(v65);
          }
          v69 = *(void **)(*((void *)&v95 + 1) + 8 * j);
          id v70 = [v69 sourceAppIdentifier];
          uint64_t v71 = [(id)v124[5] objectForKeyedSubscript:v70];
          id v72 = (void *)v71;
          if (v71) {
            v73 = (void *)v71;
          }
          else {
            v73 = v31;
          }
          id v74 = v73;

          v75 = [v74 arrayByAddingObject:v69];

          [(id)v124[5] setObject:v75 forKeyedSubscript:v70];
        }
        uint64_t v66 = [v65 countByEnumeratingWithState:&v95 objects:v147 count:16];
      }
      while (v66);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_195;
  aBlock[3] = &unk_1E654D718;
  unint64_t v94 = v83;
  void aBlock[4] = v85;
  long long v90 = &v141;
  v91 = &v135;
  id v92 = &v129;
  id v76 = v86;
  id v88 = v76;
  id v77 = v82;
  id v89 = v77;
  v93 = &v123;
  id v78 = _Block_copy(aBlock);
  long long v79 = [(WFActionDonationRecommender *)v85 workQueue];
  dispatch_group_notify(group, v79, v78);

  [(WFActionDonationRecommender *)v85 setActiveFetchGroup:group];
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);

  _Block_object_dispose(&v141, 8);
}

void __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v6 = getWFActionDonationsLogObject();
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Got duplicate callback from donations fetching. Ignoring duplicate callback.", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    os_signpost_id_t v8 = *(void *)(a1 + 72);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v7, OS_SIGNPOST_INTERVAL_END, v8, "FetchRecentDonations", "", (uint8_t *)&v13, 2u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    [*(id *)(a1 + 32) cacheRecentDonations:v4 forApplicationBundleIdentifier:*(void *)(a1 + 40) ballpark:*(void *)(a1 + 80)];
    uint64_t v9 = getWFActionDonationsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v4 count];
      int v13 = 136315394;
      uint64_t v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_INFO, "%s Successfully fetched recent donations with donation count: %lu", (uint8_t *)&v13, 0x16u);
    }

    unint64_t v11 = getWFActionDonationsLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 136315394;
      uint64_t v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEBUG, "%s for applicationBundleIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_192(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = +[WFActionDonationRecommender getDonationsFromActionResponse:a2];
  int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  int v5 = getWFActionDonationsLogObject();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Got duplicate callback from predicted donations fetching. Ignoring duplicate callback.", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    os_signpost_id_t v7 = *(void *)(a1 + 72);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v6, OS_SIGNPOST_INTERVAL_END, v7, "FetchPredictedDonations", "", (uint8_t *)&v13, 2u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    [*(id *)(a1 + 32) cacheActionPredictionDonations:v3 forApplicationBundleIdentifier:*(void *)(a1 + 40) ballpark:*(void *)(a1 + 80)];
    os_signpost_id_t v8 = getWFActionDonationsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 80);
      uint64_t v10 = [v3 count];
      int v13 = 136315650;
      uint64_t v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Successfully fetched predicted donations with ballpark: %lu, donation count: %lu", (uint8_t *)&v13, 0x20u);
    }

    unint64_t v11 = getWFActionDonationsLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 136315394;
      uint64_t v14 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApp"
            "s:completionHandler:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEBUG, "%s for applicationBundleIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

uint64_t __129__WFActionDonationRecommender__fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_195(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setActiveFetchGroup:0];
  v2 = getWFActionDonationsLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 88);
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
    int v10 = 136316162;
    unint64_t v11 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps:"
          "completionHandler:]_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_INFO, "%s Successfully fetched recommended donations with ballpark: %lu, recent count: %lu, predicted count: %lu, suggested count: %lu", (uint8_t *)&v10, 0x34u);
  }

  os_signpost_id_t v7 = getWFActionDonationsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 136315394;
    unint64_t v11 = "-[WFActionDonationRecommender _fetchDonationsWithLimit:applicationBundleIdentifier:includeSuggestedForAllApps:"
          "completionHandler:]_block_invoke";
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEBUG, "%s for applicationBundleIdentifier: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchDonationsWithLimit:(unint64_t)a3 applicationBundleIdentifier:(id)a4 includeSuggestedForAllApps:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__WFActionDonationRecommender_fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke;
  aBlock[3] = &unk_1E654D6A0;
  void aBlock[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  unint64_t v20 = a3;
  id v12 = v11;
  id v13 = v10;
  __int16 v14 = _Block_copy(aBlock);
  uint64_t v15 = [(WFActionDonationRecommender *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__WFActionDonationRecommender_fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_2;
  block[3] = &unk_1E65572A0;
  block[4] = self;
  block[5] = v14;
  dispatch_async(v15, block);
}

uint64_t __128__WFActionDonationRecommender_fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDonationsWithLimit:*(void *)(a1 + 56) applicationBundleIdentifier:*(void *)(a1 + 40) includeSuggestedForAllApps:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 48)];
}

void __128__WFActionDonationRecommender_fetchDonationsWithLimit_applicationBundleIdentifier_includeSuggestedForAllApps_completionHandler___block_invoke_2(uint64_t a1)
{
  group = [*(id *)(a1 + 32) activeFetchGroup];
  if (group)
  {
    v2 = [*(id *)(a1 + 32) workQueue];
    dispatch_group_notify(group, v2, *(dispatch_block_t *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (NSArray)defaultRecommendations
{
  defaultRecommendations = self->_defaultRecommendations;
  if (!defaultRecommendations)
  {
    uint64_t v4 = +[WFActionDonationDefaultsRecommender defaultRecommendations];
    uint64_t v5 = self->_defaultRecommendations;
    self->_defaultRecommendations = v4;

    defaultRecommendations = self->_defaultRecommendations;
  }
  return defaultRecommendations;
}

- (void)cacheActionPredictionDonations:(id)a3 forApplicationBundleIdentifier:(id)a4 ballpark:(unint64_t)a5
{
  id v11 = a4;
  id v8 = a3;
  uint64_t v9 = [[WFCachedDonations alloc] initWithDonations:v8 ballpark:a5];

  if (v11)
  {
    id v10 = [(WFActionDonationRecommender *)self cachedActionPredictionsPerApp];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  else
  {
    [(WFActionDonationRecommender *)self setCachedActionPredictionsForAllApps:v9];
  }
}

- (void)cacheRecentDonations:(id)a3 forApplicationBundleIdentifier:(id)a4 ballpark:(unint64_t)a5
{
  id v11 = a4;
  id v8 = a3;
  uint64_t v9 = [[WFCachedDonations alloc] initWithDonations:v8 ballpark:a5];

  if (v11)
  {
    id v10 = [(WFActionDonationRecommender *)self cachedDonationsPerApp];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  else
  {
    [(WFActionDonationRecommender *)self setCachedDonationsForAllApps:v9];
  }
}

- (NSSet)excludedAppBundleIdentifiers
{
  excludedAppBundleIdentifiers = self->_excludedAppBundleIdentifiers;
  if (!excludedAppBundleIdentifiers)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v5 = +[WFActionDonationRecommender disabledSpotlightApps];
    uint64_t v6 = [v4 setWithSet:v5];

    [(NSSet *)v6 addObject:*MEMORY[0x1E4FB4BB8]];
    [(NSSet *)v6 addObject:*MEMORY[0x1E4FB4BA0]];
    [(NSSet *)v6 addObject:*MEMORY[0x1E4FB4B80]];
    os_signpost_id_t v7 = self->_excludedAppBundleIdentifiers;
    self->_excludedAppBundleIdentifiers = v6;

    excludedAppBundleIdentifiers = self->_excludedAppBundleIdentifiers;
  }
  return excludedAppBundleIdentifiers;
}

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  if (!a4)
  {
    [(WFActionDonationRecommender *)self setCachedDonationsForAllApps:0];
    uint64_t v6 = [(WFActionDonationRecommender *)self cachedDonationsPerApp];
    [v6 removeAllObjects];

    [(WFActionDonationRecommender *)self setCachedActionPredictionsForAllApps:0];
    id v7 = [(WFActionDonationRecommender *)self cachedActionPredictionsPerApp];
    [v7 removeAllObjects];
  }
}

- (WFActionDonationRecommender)init
{
  v13.receiver = self;
  v13.super_class = (Class)WFActionDonationRecommender;
  v2 = [(WFActionDonationRecommender *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cachedDonationsPerApp = v2->_cachedDonationsPerApp;
    v2->_cachedDonationsPerApp = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    cachedActionPredictionsPerApp = v2->_cachedActionPredictionsPerApp;
    v2->_cachedActionPredictionsPerApp = (NSMutableDictionary *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.shortcuts.WFActionDonationRecommender.fetchRecommendedDonations", v7);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;

    id v10 = [MEMORY[0x1E4F5A7A0] sharedContext];
    [v10 addApplicationStateObserver:v2 forEvent:0];

    id v11 = v2;
  }

  return v2;
}

+ (id)disabledSpotlightApps
{
  return softLinkSPGetDisabledAppSet();
}

+ (id)getDonationsFromActionResponse:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v34 = v3;
  uint64_t v5 = [v3 actions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    uint64_t v35 = v5;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8 * v9);
        id v11 = [v10 actionUUID];
        id v12 = [v11 UUIDString];
        objc_super v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
          id v14 = [v15 UUIDString];
        }
        __int16 v16 = [v10 userActivity];

        if (v16)
        {
          id v17 = objc_alloc(MEMORY[0x1E4FB4530]);
          id v18 = [v10 userActivity];
          id v19 = [v10 bundleId];
          unint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
          BOOL v21 = (void *)[v17 initWithUserActivity:v18 identifier:v14 sourceAppIdentifier:v19 date:v20];

          if (v21) {
            [v4 addObject:v21];
          }
LABEL_12:

          goto LABEL_13;
        }
        uint64_t v22 = [v10 intent];
        if (v22)
        {
          uint64_t v23 = (void *)v22;
          id v24 = [v10 heuristic];
          uint64_t v25 = [v24 length];

          if (!v25)
          {
            os_signpost_id_t v26 = [v10 intent];
            BOOL v21 = VCIntentsForAllPossibleParameterCombinationsOfIntent(v26);

            uint64_t v36 = [v21 firstObject];
            unint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v36 response:0];
            id v28 = objc_alloc(MEMORY[0x1E4FB4520]);
            [v10 bundleId];
            v30 = id v29 = v4;
            uint64_t v31 = (void *)[v28 initWithIdentifier:v14 sourceAppIdentifier:v30 interaction:v27];

            id v4 = v29;
            if (v31) {
              [v29 addObject:v31];
            }

            uint64_t v5 = v35;
            goto LABEL_12;
          }
        }
LABEL_13:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v32 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
      uint64_t v7 = v32;
    }
    while (v32);
  }

  return v4;
}

+ (id)filterDonationsForTitleLength:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  uint64_t v5 = [v3 predicateWithBlock:&__block_literal_global_230];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

BOOL __61__WFActionDonationRecommender_filterDonationsForTitleLength___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 title];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

+ (id)filteredActionDonations:(id)a3 byApplicationAppIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__WFActionDonationRecommender_filteredActionDonations_byApplicationAppIdentifier___block_invoke;
    v12[3] = &unk_1E654D8A8;
    id v13 = v6;
    uint64_t v9 = [v8 predicateWithBlock:v12];
    id v10 = [v5 filteredArrayUsingPredicate:v9];
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

uint64_t __82__WFActionDonationRecommender_filteredActionDonations_byApplicationAppIdentifier___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 sourceAppIdentifierForDisplay];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)donationsByRemovingDuplicatesFromDonations:(id)a3 excludingAppIdentifiers:(id)a4 includingSingleDonationPerApp:(BOOL)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
        id v14 = [v13 sourceAppIdentifierForDisplay];
        if (!v14)
        {
          uint64_t v15 = getWFActionDonationsLogObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            id v17 = [v13 fullDescription];
            *(_DWORD *)long long buf = 136315394;
            id v33 = "+[WFActionDonationRecommender donationsByRemovingDuplicatesFromDonations:excludingAppIdentifiers:inclu"
                  "dingSingleDonationPerApp:]";
            __int16 v34 = 2112;
            uint64_t v35 = v17;
            _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Skipping donation with unexpected nil sourceAppIdentifier. Donation: %@", buf, 0x16u);
          }
          goto LABEL_12;
        }
        uint64_t v15 = [v13 uniqueProperty];
        if ([v7 containsObject:v15]) {
          goto LABEL_12;
        }
        __int16 v16 = [v13 sourceAppIdentifierForDisplay];
        if ([v27 containsObject:v16])
        {

LABEL_12:
          goto LABEL_13;
        }
        if (a5)
        {
          char v18 = [v25 containsObject:v14];

          if (v18) {
            goto LABEL_13;
          }
        }
        else
        {
        }
        id v19 = [v13 title];
        uint64_t v20 = [v19 length];

        if (v20)
        {
          BOOL v21 = [v13 uniqueProperty];
          [v7 addObject:v21];

          [v25 addObject:v14];
          [v24 addObject:v13];
        }
LABEL_13:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v22 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
      uint64_t v10 = v22;
    }
    while (v22);
  }

  return v24;
}

+ (WFActionDonationRecommender)sharedRecommender
{
  if (sharedRecommender_onceToken != -1) {
    dispatch_once(&sharedRecommender_onceToken, &__block_literal_global_4833);
  }
  v2 = (void *)sharedRecommender_sharedRecommender;
  return (WFActionDonationRecommender *)v2;
}

void __48__WFActionDonationRecommender_sharedRecommender__block_invoke()
{
  v0 = objc_alloc_init(WFActionDonationRecommender);
  v1 = (void *)sharedRecommender_sharedRecommender;
  sharedRecommender_sharedRecommender = (uint64_t)v0;
}

@end