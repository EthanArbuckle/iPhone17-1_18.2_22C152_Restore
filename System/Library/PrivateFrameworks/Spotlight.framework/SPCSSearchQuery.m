@interface SPCSSearchQuery
+ (id)_makeUniqueFetchAttributesWithAttributes:(id)a3 extraAttributes:(id)a4;
+ (unsigned)searchDomain;
+ (void)activate;
+ (void)deactivate;
+ (void)initialize;
- (BOOL)isCJK;
- (BOOL)isPeopleSearch;
- (BOOL)isPhotosSearch;
- (BOOL)parsecAvailable;
- (PRSRankingConfiguration)rankingInfo;
- (PRSRankingItemRanker)itemRanker;
- (SPCSSearchQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6;
- (double)currentTime;
- (id).cxx_construct;
- (id)prepareRankingItems:(id)a3 withResultSets:(id)a4 totalFeatureComputationTime:(double *)a5;
- (int64_t)contentFilters;
- (int64_t)maxCount;
- (unint64_t)previousQueryKind;
- (void)_sendResponse:(id)a3;
- (void)addSearchResult:(const SPResultValueItem *)a3 withFoundBundleID:(double)a4;
- (void)buildFullSearchResults:(id)a3 withResultSets:(id)a4;
- (void)buildPeopleResults:(id)a3 withContacts:(id)a4;
- (void)cancel;
- (void)collectSearchResults:(id)a3 isSearchToolClient:(BOOL)a4;
- (void)completed:(id)a3;
- (void)constructResultsForResponse:(BOOL)a3;
- (void)dealloc;
- (void)executeQuery;
- (void)foundCompletion:(id)a3 scores:(id)a4 bundleIDs:(id)a5;
- (void)foundCompletions:(id)a3;
- (void)priorityGatherEnded;
- (void)processSection:(id)a3;
- (void)processUserActivitiesForSection:(id)a3;
- (void)rankAndSendResultsWithResponseKind:(int)a3 withResultSections:(id)a4 withResultSets:(id)a5 withiCloudDriveSection:(id)a6 withMailResultSet:(id)a7;
- (void)removeDuplicatesInSection:(id)a3;
- (void)sendResponseWithKind:(int)a3;
- (void)setContentFilters:(int64_t)a3;
- (void)setCurrentTime:(double)a3;
- (void)setIsCJK:(BOOL)a3;
- (void)setIsPeopleSearch:(BOOL)a3;
- (void)setIsPhotosSearch:(BOOL)a3;
- (void)setItemRanker:(id)a3;
- (void)setMaxCount:(int64_t)a3;
- (void)setParsecAvailable:(BOOL)a3;
- (void)setPreviousQueryKind:(unint64_t)a3;
- (void)setRankingInfo:(id)a3;
- (void)sortResultsInSection:(id)a3;
- (void)start;
- (void)updateCoreSuggestionsSection:(id)a3;
- (void)updateMailAttachmentResults:(id)a3;
@end

@implementation SPCSSearchQuery

+ (unsigned)searchDomain
{
  return 1;
}

+ (void)initialize
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x263EFFA08];
    uint64_t v3 = *MEMORY[0x263F790D0];
    v52[0] = *MEMORY[0x263F790C8];
    v52[1] = v3;
    uint64_t v5 = *MEMORY[0x263F790F0];
    uint64_t v53 = *MEMORY[0x263F790E8];
    uint64_t v4 = v53;
    uint64_t v54 = v5;
    uint64_t v7 = *MEMORY[0x263F790E0];
    uint64_t v55 = *MEMORY[0x263F790D8];
    uint64_t v6 = v55;
    uint64_t v56 = v7;
    uint64_t v8 = *MEMORY[0x263F79060];
    uint64_t v57 = *MEMORY[0x263F79030];
    uint64_t v58 = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:8];
    uint64_t v10 = [v2 setWithArray:v9];

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"com.apple.application", @"com.apple.mobilesafari", @"com.apple.Preferences", @"com.apple.MobileAddressBook", @"com.apple.shortcuts", 0);

    v14 = (void *)MEMORY[0x263EFFA08];
    v51[0] = v3;
    v51[1] = v4;
    v51[2] = v5;
    v51[3] = v6;
    v51[4] = v7;
    v51[5] = v8;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:6];
    uint64_t v16 = [v14 setWithArray:v15];

    id v18 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v50 = v3;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
    uint64_t v20 = [v18 initWithArray:v19];

    id v22 = objc_alloc(MEMORY[0x263EFFA08]);
    v49[0] = v4;
    v49[1] = v5;
    v49[2] = v6;
    v49[3] = v7;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
    uint64_t v24 = [v22 initWithArray:v23];

    uint64_t v26 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Search.framework"];

    id v28 = objc_alloc(MEMORY[0x263EFFA40]);
    v29 = (void *)*MEMORY[0x263F78FE0];
    uint64_t v30 = [v28 initWithSuiteName:*MEMORY[0x263F78FE0]];

    uint64_t v32 = [v29 UTF8String];
    uint64_t v34 = ;

    dispatch_group_t v36 = dispatch_group_create();

    {
      v38 = NSHomeDirectory();
      v39 = [v38 stringByAppendingString:@"/Library/Logs/CrashReporter/DiagnosticLogs/Search/Ranking"];

      v40 = [MEMORY[0x263F08850] defaultManager];
      [v40 createDirectoryAtPath:v39 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v41 = [MEMORY[0x263F78D00] sharedResourcesManager];
    [v41 loadAllParameters];

    {
      v42 = [MEMORY[0x263F78D00] sharedResourcesManager];
      uint64_t v43 = [v42 resourcesForClient:@"Spotlight" options:&unk_26E9312F0];

      SSDefaultsSetResources();
    }
    v46 = dispatch_get_global_queue(17, 0);
    dispatch_group_async(v45, v46, &__block_literal_global_0);

    uint64_t v47 = rankingAttributeNameArray();
  }
}

void __29__SPCSSearchQuery_initialize__block_invoke()
{
  v28[6] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263EFEA58]);
  v1 = objc_opt_new();
  v2 = (void *)[v0 initWithConfiguration:v1];

  uint64_t v3 = *MEMORY[0x263EFDFC8];
  v28[0] = *MEMORY[0x263EFDFE0];
  v28[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFDFB8];
  v28[2] = *MEMORY[0x263EFE038];
  v28[3] = v4;
  uint64_t v5 = *MEMORY[0x263EFE070];
  v28[4] = *MEMORY[0x263EFDF80];
  v28[5] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:6];
  id v26 = 0;
  uint64_t v7 = objc_msgSend(v2, "_ios_meContactWithKeysToFetch:error:", v6, &v26);
  id v8 = v26;
  if (v8)
  {
    v9 = SPLogForSPLogCategoryQuery();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __29__SPCSSearchQuery_initialize__block_invoke_cold_1((uint64_t)v27, [v8 code], v9);
    }
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    v11 = [v7 emailAddresses];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __29__SPCSSearchQuery_initialize__block_invoke_2;
    uint64_t v24 = &unk_264C76B80;
    v9 = v10;
    v25 = v9;
    [v11 enumerateObjectsUsingBlock:&v21];

    uint64_t v12 = objc_msgSend(v7, "identifier", v21, v22, v23, v24);

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = [v7 identifier];

      uint64_t v16 = [v9 copy];
    }
  }
    uint64_t v18 = 1;
  else {
    uint64_t v18 = -1;
  }
    uint64_t v19 = {;
  }
  if (_ZZZ29__SPCSSearchQuery_initialize_EUb_E34displayNameExactMatchMaskOnceToken != -1) {
    dispatch_once(&_ZZZ29__SPCSSearchQuery_initialize_EUb_E34displayNameExactMatchMaskOnceToken, &__block_literal_global_174);
  }
}

void __29__SPCSSearchQuery_initialize__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 value];
  objc_msgSend(v2, "addObject:");
}

void __29__SPCSSearchQuery_initialize__block_invoke_172()
{
  PRSRankingQueryIndexDictionary();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = [v4 objectForKeyedSubscript:*MEMORY[0x263F78EC8]];
  char v1 = [v0 integerValue];
  uint64_t v2 = 1 << v1;
  if ((v1 & 0x40) != 0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 1 << v1;
  }
  if ((v1 & 0x40) == 0) {
    uint64_t v2 = 0;
  }
  unk_26AC2E638 |= v2;
}

+ (void)activate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  {
    uint64_t v3 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v4 = [v3 effectiveValueForSetting:*MEMORY[0x263F53980]];

    uint64_t v6 = [v3 effectiveValueForSetting:*MEMORY[0x263F53990]];

    SPBuildApplicationNames();
    id v8 = SPFastHiddenAppsGetNoBuild();
    v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = [MEMORY[0x263F67460] applicationsExcludedFromUninstall];
    [v9 minusSet:v10];

    v11 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      uint64_t v18 = [v9 count];
      _os_log_impl(&dword_235D0B000, v11, OS_LOG_TYPE_DEFAULT, "%lu hiddenApps set during activate", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v12 = [v9 allObjects];

    if (+[SPCSSearchQuery activate]::onceToken[0] != -1) {
      dispatch_once(+[SPCSSearchQuery activate]::onceToken, &__block_literal_global_178);
    }
    if (v14 <= 0)
    {
      [a1 preheat];
    }
    else
    {
    }
    uint64_t v15 = [MEMORY[0x263F78E20] copyRenderEngagementCounts];

    if (+[SPCSSearchQuery activate]::mailVipOnceToken[0] != -1) {
      dispatch_once(+[SPCSSearchQuery activate]::mailVipOnceToken, &__block_literal_global_186);
    }
  }
}

void __27__SPCSSearchQuery_activate__block_invoke()
{
  id v0 = objc_opt_new();
  id v5 = 0;
  char v1 = [v0 loadDockAppListWithError:&v5];
  id v2 = v5;
  if (v1) {
    [MEMORY[0x263F78D58] setDockApps:v1];
  }
  if (v2)
  {
    uint64_t v3 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __27__SPCSSearchQuery_activate__block_invoke_cold_1((uint64_t)v2, v3, v4);
    }
  }
  if (_os_feature_enabled_impl()) {
}
  }

+ (void)deactivate
{
  {
    [MEMORY[0x263F78E28] reloadRankingParametersFromTrial];
    [MEMORY[0x263F78E28] getSuggestionsRankingThresholds];
    id v2 = (_anonymous_namespace_ *)SISetCompletionRankingWeights();
    [MEMORY[0x263F78D58] clearState];
  }
}

+ (id)_makeUniqueFetchAttributesWithAttributes:(id)a3 extraAttributes:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  uint64_t v8 = [v6 count];
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v8 + v7];
  uint64_t v10 = [MEMORY[0x263EFF9C0] setWithArray:v5];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v15, (void)v18) & 1) != 0
          || [v6 containsObject:v15])
        {
          [v9 addObject:v15];
          [v10 removeObject:v15];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  if ([v10 count])
  {
    uint64_t v16 = [v10 allObjects];
    [v9 addObjectsFromArray:v16];
  }
  return v9;
}

- (SPCSSearchQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6
{
  v21.receiver = self;
  v21.super_class = (Class)SPCSSearchQuery;
  id v6 = [(SPKQuery *)&v21 initWithUserQuery:a3 queryGroupId:a4 options:a5 queryContext:a6];
  if (v6)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v9 = dispatch_queue_create("SPCSSearchQuery", v8);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v9;

    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v12 = dispatch_queue_attr_make_with_overcommit();
    dispatch_queue_t v13 = dispatch_queue_create("SPCSSearchQuery rankq", v12);
    rankQueue = v6->_rankQueue;
    v6->_rankQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("Feedback Queue", v15);
    feedbackQueue = v6->_feedbackQueue;
    v6->_feedbackQueue = (OS_dispatch_queue *)v16;

    v6->_csQueryLock._os_unfair_lock_opaque = 0;
    v6->_suggestionsLock._os_unfair_lock_opaque = 0;
    v6->_timeoutTimerLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = objc_opt_new();
    rankingInfo = v6->_rankingInfo;
    v6->_rankingInfo = (PRSRankingConfiguration *)v18;
  }
  return v6;
}

- (void)start
{
  if (![(SPKQuery *)self isStarted]
    && ![(SPKQuery *)self sendEmptyResponseIfNecessary])
  {
    v6.receiver = self;
    v6.super_class = (Class)SPCSSearchQuery;
    [(SPKQuery *)&v6 start];
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __24__SPCSSearchQuery_start__block_invoke;
    block[3] = &unk_264C76BA8;
    block[4] = self;
    dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(dispatchQueue, v4);
  }
}

uint64_t __24__SPCSSearchQuery_start__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 executeQuery];
  }
  return result;
}

- (void)cancel
{
  v30[1] = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    os_unfair_lock_lock(&self->_timeoutTimerLock);
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_source_cancel(timeoutTimer);
      dispatch_block_t v4 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
    os_unfair_lock_unlock(&self->_timeoutTimerLock);
  }
  id v5 = [(SPKQuery *)self delegate];
  uint64_t v6 = [v5 queryIdent];
  uint64_t v7 = [v5 clientBundleID];
  v29 = @"queryID";
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:v6];
  v30[0] = v8;
  dispatch_queue_t v9 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  MEMORY[0x237DF3570]();

  id v10 = [(SPKQuery *)self queryContext];
  uint64_t v11 = [v10 queryKind];
  id v12 = v7;
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken, &__block_literal_global_666);
  }
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolDebugMode) {
    goto LABEL_8;
  }
  if (!SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolRanking)
  {

    goto LABEL_20;
  }
  if (([v12 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v12 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
LABEL_8:
    dispatch_queue_t v13 = v12;
LABEL_9:

    goto LABEL_10;
  }
  char v16 = [v12 hasPrefix:@"com.apple.ondeviceeval"];
  if (v11 == 12) {
    char v17 = 1;
  }
  else {
    char v17 = v16;
  }

  if ((v17 & 1) == 0)
  {
LABEL_20:
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F67888]) initWithStartSearch:self->_feedback];
    feedbackQueue = self->_feedbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__SPCSSearchQuery_cancel__block_invoke;
    block[3] = &unk_264C76BD0;
    id v26 = v18;
    uint64_t v28 = v6;
    id v27 = v12;
    long long v20 = feedbackQueue;
    id v10 = v18;
    qos_class_t v21 = qos_class_self();
    if (v21 < 0x1A) {
      dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    }
    else {
      dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v21, 0, block);
    }
    uint64_t v23 = v22;
    dispatch_async(v20, v22);

    dispatch_queue_t v13 = v26;
    goto LABEL_9;
  }
LABEL_10:
  os_unfair_lock_lock(&self->_csQueryLock);
  atomic_store(1u, (unsigned __int8 *)&self->_queryCanceled);
  int v14 = self->_csQuery;
  csQuery = self->_csQuery;
  self->_csQuery = 0;

  os_unfair_lock_unlock(&self->_csQueryLock);
  [(CSSearchQuery *)v14 cancel];
  v24.receiver = self;
  v24.super_class = (Class)SPCSSearchQuery;
  [(SPKQuery *)&v24 cancel];
}

void __25__SPCSSearchQuery_cancel__block_invoke(void *a1)
{
  id v2 = [MEMORY[0x263F674B0] sharedProxy];
  [v2 sendFeedbackType:6 feedback:a1[4] queryId:a1[6] clientID:a1[5]];
}

- (void)_sendResponse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SPKQuery *)self responseHandler];

    if (v5)
    {
      uint64_t v6 = [v4 sections];
      uint64_t v7 = [v6 count];

      if (v7) {
        [v4 setTopHitIsIn:1];
      }
      uint64_t v8 = [(SPKQuery *)self delegate];
      dispatch_queue_t v9 = (void *)[v8 queryIdent];
      id v10 = [v8 clientBundleID];
      uint64_t v11 = (void *)MEMORY[0x263F78E18];
      id v12 = [(SPKQuery *)self queryContext];
      dispatch_queue_t v13 = [v12 queryUnderstandingOutput];
      int v14 = [v11 queryUnderstandingParseWithQueryUnderstanding:v13];

      uint64_t v15 = [(SPKQuery *)self queryContext];
      uint64_t v16 = [v15 queryKind];
      id v17 = v10;
      if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken != -1) {
        dispatch_once(&SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken, &__block_literal_global_666);
      }
      if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolDebugMode) {
        goto LABEL_8;
      }
      if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolRanking)
      {
        if (([v17 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
          || ([v17 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
        {
LABEL_8:

LABEL_9:
          uint64_t v18 = [(SPKQuery *)self responseHandler];
          ((void (**)(void, id))v18)[2](v18, v4);

          goto LABEL_10;
        }
        char v19 = [v17 hasPrefix:@"com.apple.ondeviceeval"];
        if (v16 == 12) {
          char v20 = 1;
        }
        else {
          char v20 = v19;
        }

        if (v20) {
          goto LABEL_9;
        }
      }
      else
      {
      }
      qos_class_t v21 = (void *)[objc_alloc(MEMORY[0x263F67888]) initWithStartSearch:self->_feedback queryUnderstandingParse:v14];
      id location = 0;
      objc_initWeak(&location, self);
      objc_copyWeak(v24, &location);
      v24[1] = v9;
      id v23 = v17;
      id v22 = v21;
      md_tracing_dispatch_async_propagating();

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);
      goto LABEL_9;
    }
  }
LABEL_10:
}

void __33__SPCSSearchQuery__sendResponse___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [MEMORY[0x263F674B0] sharedProxy];
    [v3 sendFeedbackType:6 feedback:*(void *)(a1 + 32) queryId:*(void *)(a1 + 56) clientID:*(void *)(a1 + 40)];

    id v4 = (void *)v5[60];
    v5[60] = 0;

    WeakRetained = v5;
  }
}

- (void)dealloc
{
  csQuery = self->_csQuery;
  if (csQuery) {
    [(CSSearchQuery *)csQuery cancel];
  }
  if (_os_feature_enabled_impl())
  {
    os_unfair_lock_lock(&self->_timeoutTimerLock);
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_source_cancel(timeoutTimer);
      id v5 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
    os_unfair_lock_unlock(&self->_timeoutTimerLock);
  }
  v6.receiver = self;
  v6.super_class = (Class)SPCSSearchQuery;
  [(SPCSSearchQuery *)&v6 dealloc];
}

- (void)collectSearchResults:(id)a3 isSearchToolClient:(BOOL)a4
{
  BOOL v192 = a4;
  uint64_t v232 = *MEMORY[0x263EF8340];
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  id obj = a3;
  uint64_t v184 = [obj countByEnumeratingWithState:&v194 objects:v219 count:16];
  if (v184)
  {
    uint64_t v183 = *(void *)v195;
    uint64_t v181 = *MEMORY[0x263F78F10];
    uint64_t v180 = *MEMORY[0x263F78F28];
    uint64_t v179 = *MEMORY[0x263F78FB0];
    uint64_t v172 = *MEMORY[0x263F02938];
    uint64_t v178 = *MEMORY[0x263F02A08];
    do
    {
      for (uint64_t i = 0; i != v184; ++i)
      {
        if (*(void *)v195 != v183) {
          objc_enumerationMutation(obj);
        }
        id v5 = (CSSearchableItem *)*(id *)(*((void *)&v194 + 1) + 8 * i);
        objc_super v6 = [(CSSearchableItem *)v5 attributeSet];
        v191 = [v6 bundleID];

        if (v191)
        {
          uint64_t v7 = SPLogForSPLogCategoryDefault();
          os_log_type_t v8 = 2 * (*MEMORY[0x263F67540] == 0);
          if (os_log_type_enabled(v7, v8))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v191;
            _os_log_impl(&dword_235D0B000, v7, v8, "Got result for bundle %@", (uint8_t *)&buf, 0xCu);
          }

          dispatch_queue_t v9 = [(CSSearchableItem *)v5 attributeSet];
          v189 = [v9 expirationDate];

          if (!v189
            || ([v189 timeIntervalSinceReferenceDate],
                double v11 = v10,
                [(SPKQuery *)self queryContext],
                id v12 = objc_claimAutoreleasedReturnValue(),
                [v12 currentTime],
                BOOL v14 = v11 < v13,
                v12,
                !v14))
          {
            uint64_t v15 = [(CSSearchQuery *)self->_csQuery queryContext];
            uint64_t v16 = [v15 maxCount];

            if (v192 && SSEnableSearchToolCleanSlate()) {
              uint64_t v16 = 30;
            }
            int v17 = [v191 isEqualToString:v181];
            if (v17 && ![(SPCSSearchQuery *)self isPeopleSearch]) {
              v16 *= 5;
            }
            unint64_t v18 = 300;
            if ((unint64_t)(v16 - 301) >= 0xFFFFFFFFFFFFFED4) {
              unint64_t v18 = v16;
            }
            unint64_t v193 = v18;
            char v19 = [(NSMutableDictionary *)self->_foundBundleIDs objectForKey:v191];
            BOOL v20 = v19 == 0;

            if (v20)
            {
              p_resultHeaps = &self->_resultHeaps;
              id v22 = [NSNumber numberWithUnsignedLong:0xAAAAAAAAAAAAAAABLL * (((char *)self->_resultHeaps.__end_ - (char *)self->_resultHeaps.__begin_) >> 3)];
              [(NSMutableDictionary *)self->_foundBundleIDs setObject:v22 forKeyedSubscript:v191];

              unsigned int v23 = 0;
              do
              {
                end = (char *)self->_resultHeaps.__end_;
                value = (char *)self->_resultHeaps.__end_cap_.__value_;
                if (end >= value)
                {
                  begin = (char *)p_resultHeaps->__begin_;
                  unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)p_resultHeaps->__begin_) >> 3);
                  unint64_t v29 = v28 + 1;
                  if (v28 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    abort();
                  }
                  unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
                  if (2 * v30 > v29) {
                    unint64_t v29 = 2 * v30;
                  }
                  if (v30 >= 0x555555555555555) {
                    unint64_t v31 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v31 = v29;
                  }
                  if (v31)
                  {
                    if (v31 > 0xAAAAAAAAAAAAAAALL) {
                      std::__throw_bad_array_new_length[abi:nn180100]();
                    }
                    uint64_t v32 = (char *)operator new(24 * v31);
                  }
                  else
                  {
                    uint64_t v32 = 0;
                  }
                  v33 = &v32[24 * v28];
                  uint64_t v34 = &v32[24 * v31];
                  *(void *)v33 = 0;
                  *((void *)v33 + 1) = 0;
                  *((void *)v33 + 2) = 0;
                  id v26 = v33 + 24;
                  if (end == begin)
                  {
                    p_resultHeaps->__begin_ = v33;
                    self->_resultHeaps.__end_ = v26;
                    self->_resultHeaps.__end_cap_.__value_ = v34;
                  }
                  else
                  {
                    do
                    {
                      v35 = v33;
                      *((void *)v33 - 2) = 0;
                      *((void *)v33 - 1) = 0;
                      long long v36 = *(_OWORD *)(end - 24);
                      end -= 24;
                      *(_OWORD *)(v33 - 24) = v36;
                      v33 -= 24;
                      *((void *)v35 - 1) = *((void *)end + 2);
                      *(void *)end = 0;
                      *((void *)end + 1) = 0;
                      *((void *)end + 2) = 0;
                    }
                    while (end != begin);
                    end = (char *)p_resultHeaps->__begin_;
                    v37 = (void **)self->_resultHeaps.__end_;
                    p_resultHeaps->__begin_ = v33;
                    self->_resultHeaps.__end_ = v26;
                    self->_resultHeaps.__end_cap_.__value_ = v34;
                    while (v37 != (void **)end)
                    {
                      v37 -= 3;
                    }
                  }
                  if (end) {
                    operator delete(end);
                  }
                }
                else
                {
                  *(void *)end = 0;
                  *((void *)end + 1) = 0;
                  id v26 = end + 24;
                  *((void *)end + 2) = 0;
                }
                self->_resultHeaps.__end_ = v26;
                CFHashCode v231 = 0;

                CFHashCode v231 = 0;

                if (!v192) {
                  break;
                }
              }
              while (v23++ < 3);
            }
            int v39 = [v191 isEqualToString:v180];
            int v40 = [v191 isEqualToString:v179];
            if ((v39 | v17))
            {
              v41 = [(CSSearchableItem *)v5 attributeSet];
              if (v39) {
                [v41 domainIdentifier];
              }
              else {
              cf = [v41 mailConversationID];
              }
            }
            else if (v40)
            {
              v41 = [(CSSearchableItem *)v5 attributeSet];
              cf = [v41 photosContainerIdentifier];
            }
            else
            {
              v41 = [(CSSearchableItem *)v5 attributeSet];
              v42 = [v41 attributeDictionary];
              cf = [v42 objectForKeyedSubscript:v172];
            }
            uint64_t v43 = [(CSSearchableItem *)v5 attributeSet];
            v44 = [v43 attributeDictionary];
            v188 = [v44 objectForKey:v178];

            memset(v218, 0, sizeof(v218));
            v45 = [(NSMutableDictionary *)self->_foundBundleIDs objectForKeyedSubscript:v191];
            int v46 = [v45 unsignedLongValue];

            unsigned int v47 = [v188 intValue];
            int v48 = v192;
            if (v192)
            {
              int v48 = (~v47 & 3) != 0 ? 2 : 3;
              if ((v47 & 1) == 0) {
                int v48 = (v47 >> 1) & 1;
              }
            }
            uint64_t v49 = v48 + v46;
            uint64_t v50 = (char *)self->_resultHeaps.__begin_;
            v51 = (uint64_t *)&v50[24 * v49];
            uint64_t v53 = v51 + 1;
            v52 = (_anonymous_namespace_::SPResultValueItem *)v51[1];
            uint64_t v54 = *v51;
            unint64_t v55 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v52 - *v51) >> 4);
            v186 = v5;
            if (v55 >= v193)
            {
              v175 = (char *)self->_resultHeaps.__begin_;
              long long v215 = 0u;
              memset(v216, 0, sizeof(v216));
              long long v214 = 0u;
              uint64_t v61 = *v53;
              v208[0] = v214;
              v208[1] = v215;
              id v209 = *(id *)&v216[0];
              uint64_t v210 = *((void *)&v216[0] + 1);
              int v211 = v216[1];
              id v212 = *((id *)&v216[1] + 1);
              id v213 = *(id *)&v216[2];
              long long v62 = *(_OWORD *)(v61 - 64);
              v202[0] = *(_OWORD *)(v61 - 80);
              v202[1] = v62;
              id v203 = *(id *)(v61 - 48);
              uint64_t v63 = *(void *)(v61 - 40);
              int v205 = *(_DWORD *)(v61 - 32);
              uint64_t v204 = v63;
              id v206 = *(id *)(v61 - 24);
              id v207 = *(id *)(v61 - 16);
              {
                uint64_t v64 = *v51;
                uint64_t v65 = *v53;
                v174 = v51;
                if (v65 - v64 >= 81)
                {
                  uint64_t v173 = v65;
                  v166 = v51 + 1;
                  uint64_t v176 = v49;
                  uint64_t v66 = 0;
                  long long v67 = *(_OWORD *)(v64 + 16);
                  int64_t v68 = 0xCCCCCCCCCCCCCCCDLL * ((v65 - v64) >> 4);
                  long long v198 = *(_OWORD *)v64;
                  long long v199 = v67;
                  uint64_t v69 = *(void *)(v64 + 32);
                  uint64_t v168 = *(void *)(v64 + 40);
                  *(void *)(v64 + 32) = 0;
                  int v167 = *(_DWORD *)(v64 + 48);
                  uint64_t v169 = *(void *)(v64 + 56);
                  uint64_t v170 = v69;
                  uint64_t v171 = *(void *)(v64 + 64);
                  *(void *)(v64 + 56) = 0;
                  *(void *)(v64 + 64) = 0;
                  uint64_t v165 = v64;
                  do
                  {
                    uint64_t v70 = v66 + 1;
                    uint64_t v71 = v64 + 80 * (v66 + 1);
                    uint64_t v72 = 2 * v66;
                    uint64_t v66 = (2 * v66) | 1;
                    uint64_t v73 = v72 + 2;
                    if (v72 + 2 < v68)
                    {
                      long long v74 = *(_OWORD *)(v71 + 16);
                      long long buf = *(_OWORD *)v71;
                      long long v226 = v74;
                      uint64_t v75 = v64 + 80 * v70;
                      *(void *)&long long v227 = *(id *)(v75 + 32);
                      uint64_t v76 = *(void *)(v75 + 40);
                      LODWORD(v228) = *(_DWORD *)(v75 + 48);
                      *((void *)&v227 + 1) = v76;
                      id v229 = *(id *)(v75 + 56);
                      id v230 = *(id *)(v75 + 64);
                      long long v77 = *(_OWORD *)(v71 + 96);
                      long long v220 = *(_OWORD *)(v71 + 80);
                      long long v221 = v77;
                      *(void *)&long long v222 = *(id *)(v71 + 112);
                      uint64_t v78 = *(void *)(v71 + 120);
                      LODWORD(v223) = *(_DWORD *)(v71 + 128);
                      *((void *)&v222 + 1) = v78;
                      *((void *)&v223 + 1) = *(id *)(v71 + 136);
                      *(void *)&long long v224 = *(id *)(v71 + 144);
                      {
                        v71 += 80;
                        uint64_t v66 = v73;
                      }
                      id v5 = v186;
                    }
                    long long v79 = *(_OWORD *)(v71 + 16);
                    *(_OWORD *)uint64_t v64 = *(_OWORD *)v71;
                    *(_OWORD *)(v64 + 16) = v79;
                    uint64_t v80 = *(void *)(v71 + 32);
                    *(void *)(v71 + 32) = 0;
                    v81 = *(void **)(v64 + 32);
                    *(void *)(v64 + 32) = v80;

                    uint64_t v82 = *(void *)(v71 + 40);
                    *(_DWORD *)(v64 + 48) = *(_DWORD *)(v71 + 48);
                    *(void *)(v64 + 40) = v82;
                    uint64_t v83 = *(void *)(v71 + 56);
                    *(void *)(v71 + 56) = 0;
                    v84 = *(void **)(v64 + 56);
                    *(void *)(v64 + 56) = v83;

                    uint64_t v85 = *(void *)(v71 + 64);
                    *(void *)(v71 + 64) = 0;
                    v86 = *(void **)(v64 + 64);
                    *(void *)(v64 + 64) = v85;

                    uint64_t v64 = v71;
                  }
                  while (v66 <= (uint64_t)((unint64_t)(v68 - 2) >> 1));
                  v87 = (_OWORD *)(v173 - 80);
                  if (v71 == v173 - 80)
                  {
                    long long v105 = v199;
                    *(_OWORD *)uint64_t v71 = v198;
                    *(_OWORD *)(v71 + 16) = v105;
                    v106 = *(void **)(v71 + 32);
                    *(void *)(v71 + 32) = v170;

                    *(void *)(v71 + 40) = v168;
                    *(_DWORD *)(v71 + 48) = v167;
                    v107 = *(void **)(v71 + 56);
                    *(void *)(v71 + 56) = v169;

                    v108 = *(void **)(v71 + 64);
                    *(void *)(v71 + 64) = v171;
                  }
                  else
                  {
                    long long v88 = *(_OWORD *)(v173 - 64);
                    *(_OWORD *)uint64_t v71 = *v87;
                    *(_OWORD *)(v71 + 16) = v88;
                    uint64_t v90 = *(void *)(v173 - 48);
                    v89 = (void *)(v173 - 48);
                    void *v89 = 0;
                    v91 = *(void **)(v71 + 32);
                    *(void *)(v71 + 32) = v90;

                    uint64_t v92 = *(void *)(v173 - 40);
                    *(_DWORD *)(v71 + 48) = *(_DWORD *)(v173 - 32);
                    *(void *)(v71 + 40) = v92;
                    uint64_t v93 = *(void *)(v173 - 24);
                    *(void *)(v173 - 24) = 0;
                    v94 = *(void **)(v71 + 56);
                    *(void *)(v71 + 56) = v93;

                    uint64_t v95 = *(void *)(v173 - 16);
                    *(void *)(v173 - 16) = 0;
                    v96 = *(void **)(v71 + 64);
                    *(void *)(v71 + 64) = v95;

                    long long v97 = v199;
                    _OWORD *v87 = v198;
                    *(_OWORD *)(v173 - 64) = v97;
                    v98 = *(void **)(v173 - 48);
                    void *v89 = v170;

                    *(void *)(v173 - 40) = v168;
                    *(_DWORD *)(v173 - 32) = v167;
                    v99 = *(void **)(v173 - 24);
                    *(void *)(v173 - 24) = v169;

                    v100 = *(void **)(v173 - 16);
                    *(void *)(v173 - 16) = v171;
                  }
                  uint64_t v53 = v166;
                  uint64_t v49 = v176;
                }
                uint64_t v109 = *v53;
                v110 = &v175[24 * (int)v49];
                v111 = (_OWORD *)(*v53 - 80);
                unint64_t v114 = *((void *)v110 + 2);
                uint64_t v113 = (uint64_t)(v110 + 16);
                unint64_t v112 = v114;
                *uint64_t v53 = (uint64_t)v111;
                if ((unint64_t)v111 >= v114)
                {
                  uint64_t v120 = *v174;
                  uint64_t v121 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v111 - *v174) >> 4);
                  unint64_t v122 = v121 + 1;
                  if ((unint64_t)(v121 + 1) > 0x333333333333333) {
                    abort();
                  }
                  *(void *)&long long v227 = 0;
                  long long buf = 0u;
                  long long v226 = 0u;
                  unint64_t v123 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v112 - v120) >> 4);
                  if (2 * v123 > v122) {
                    unint64_t v122 = 2 * v123;
                  }
                  if (v123 >= 0x199999999999999) {
                    unint64_t v124 = 0x333333333333333;
                  }
                  else {
                    unint64_t v124 = v122;
                  }
                  v119 = v174;
                  uint64_t v125 = v226;
                  long long v126 = v215;
                  *(_OWORD *)long long v226 = v214;
                  *(_OWORD *)(v125 + 16) = v126;
                  uint64_t v127 = *(void *)&v216[0];
                  *(void *)&v216[0] = 0;
                  *(void *)(v125 + 32) = v127;
                  uint64_t v128 = *((void *)&v216[0] + 1);
                  *(_DWORD *)(v125 + 48) = v216[1];
                  *(void *)(v125 + 40) = v128;
                  long long v129 = *(_OWORD *)((char *)&v216[1] + 8);
                  *(void *)&v216[2] = 0;
                  *((void *)&v216[1] + 1) = 0;
                  *(_OWORD *)(v125 + 56) = v129;
                  *(void *)&long long v226 = v226 + 80;
                  uint64_t v109 = *v53;
                }
                else
                {
                  long long v115 = v215;
                  _OWORD *v111 = v214;
                  v111[1] = v115;
                  uint64_t v116 = *(void *)&v216[0];
                  *(void *)&v216[0] = 0;
                  *(void *)(v109 - 48) = v116;
                  uint64_t v117 = *((void *)&v216[0] + 1);
                  *(_DWORD *)(v109 - 32) = v216[1];
                  *(void *)(v109 - 40) = v117;
                  long long v118 = *(_OWORD *)((char *)&v216[1] + 8);
                  *(void *)&v216[2] = 0;
                  *((void *)&v216[1] + 1) = 0;
                  *(_OWORD *)(v109 - 24) = v118;
                  v119 = v174;
                }
                *uint64_t v53 = v109;
                uint64_t v130 = *v119;
                long long v131 = *(_OWORD *)(v61 - 64);
                long long v214 = *(_OWORD *)(v61 - 80);
                long long v215 = v131;
                objc_storeStrong((id *)v216, *(id *)(v61 - 48));
                uint64_t v132 = *(void *)(v61 - 40);
                LODWORD(v216[1]) = *(_DWORD *)(v61 - 32);
                *((void *)&v216[0] + 1) = v132;
                objc_storeStrong((id *)&v216[1] + 1, *(id *)(v61 - 24));
                objc_storeStrong((id *)&v216[2], *(id *)(v61 - 16));
              }
              if (cf)
              {
                uint64_t v228 = 0;
                id v229 = 0;
                CFHashCode v133 = CFHash(cf);
                long long buf = v214;
                long long v226 = v215;
                LODWORD(v228) = v216[1];
                v134 = (void *)*((void *)&v216[1] + 1);
                id v187 = *(id *)&v216[0];
                long long v227 = v216[0];
                v135 = *(void **)&v216[2];
                *(void *)&v216[0] = 0;
                *((void *)&v216[1] + 1) = 0;
                *(void *)&v216[2] = 0;
                id v229 = v134;
                id v230 = v135;
                CFHashCode v231 = v133;
                long long v223 = 0u;
                long long v224 = 0u;
                long long v221 = 0u;
                long long v222 = 0u;
                long long v220 = 0u;
                *((void *)&v224 + 1) = 0;
                v136 = (unsigned int *)self->_resultRankTables.__begin_;
                uint64_t v177 = v49;
                uint64_t v137 = 4 * v49;
                unint64_t v138 = v136[8 * v49];
                if (!v138
                  || (unint64_t v139 = (v133 - 1) % v138,
                      v140 = &v136[8 * v49],
                      uint64_t v143 = *((void *)v140 + 1),
                      v141 = v140 + 2,
                      uint64_t v142 = v143,
                      v144 = (id *)(v143 + 80 * v139),
                      (unint64_t v145 = (unint64_t)v144[8]) != 0)
                  && v135
                  && v145 >= (unint64_t)v135
                  && *(void *)(v142 + 80 * v139 + 72))
                {
                  v146 = self->_resultRecencyTables.__begin_;
                  unint64_t v147 = LODWORD(v146[v137]);
                  if (v147)
                  {
                    unint64_t v148 = (v133 - 1) % v147;
                    uint64_t v149 = v146[4 * v177 + 1];
                    uint64_t v150 = v149 + 80 * v148;
                    if (!*(void *)(v150 + 64)
                      || !v135
                      || *(double *)(v150 + 16) < *(double *)&v226
                      || !*(void *)(v149 + 80 * v148 + 72))
                    {
                      long long v151 = v226;
                      *(_OWORD *)uint64_t v150 = buf;
                      *(_OWORD *)(v150 + 16) = v151;
                      objc_storeStrong((id *)(v150 + 32), v187);
                      uint64_t v152 = *((void *)&v227 + 1);
                      *(_DWORD *)(v150 + 48) = v228;
                      *(void *)(v150 + 40) = v152;
                      objc_storeStrong((id *)(v150 + 56), v134);
                      objc_storeStrong((id *)(v150 + 64), v135);
                      *(void *)(v149 + 80 * v148 + 72) = v133;
                    }
                  }
                }
                else
                {
                  long long v153 = *((_OWORD *)v144 + 1);
                  long long v220 = *(_OWORD *)v144;
                  long long v221 = v153;
                  objc_storeStrong((id *)&v222, v144[4]);
                  id v154 = v144[5];
                  LODWORD(v223) = *((_DWORD *)v144 + 12);
                  *((void *)&v222 + 1) = v154;
                  objc_storeStrong((id *)&v223 + 1, v144[7]);
                  objc_storeStrong((id *)&v224, v144[8]);
                  *((void *)&v224 + 1) = *(void *)(v142 + 80 * v139 + 72);
                  long long v155 = v226;
                  uint64_t v156 = *v141 + 80 * v139;
                  *(_OWORD *)uint64_t v156 = buf;
                  *(_OWORD *)(v156 + 16) = v155;
                  objc_storeStrong((id *)(v156 + 32), v187);
                  uint64_t v157 = *((void *)&v227 + 1);
                  *(_DWORD *)(v156 + 48) = v228;
                  *(void *)(v156 + 40) = v157;
                  objc_storeStrong((id *)(v156 + 56), v134);
                  objc_storeStrong((id *)(v156 + 64), v135);
                  *(void *)(v156 + 72) = v133;
                  if ((void)v224)
                  {
                    v158 = self->_resultRecencyTables.__begin_;
                    unint64_t v159 = LODWORD(v158[v137]);
                    if (v159)
                    {
                      unint64_t v160 = (*((void *)&v224 + 1) - 1) % v159;
                      uint64_t v161 = v158[4 * v177 + 1];
                      uint64_t v162 = v161 + 80 * v160;
                      if (!*(void *)(v162 + 64)
                        || *(double *)(v162 + 16) < *(double *)&v221
                        || !*(void *)(v161 + 80 * v160 + 72))
                      {
                        long long v163 = v221;
                        *(_OWORD *)uint64_t v162 = v220;
                        *(_OWORD *)(v162 + 16) = v163;
                        objc_storeStrong((id *)(v162 + 32), (id)v222);
                        uint64_t v164 = *((void *)&v222 + 1);
                        *(_DWORD *)(v162 + 48) = v223;
                        *(void *)(v162 + 40) = v164;
                        objc_storeStrong((id *)(v162 + 56), *((id *)&v223 + 1));
                        objc_storeStrong((id *)(v162 + 64), (id)v224);
                        *(void *)(v161 + 80 * v160 + 72) = *((void *)&v224 + 1);
                      }
                    }
                  }
                }
              }
            }
            else
            {
              uint64_t v56 = &v50[24 * (int)v49];
              unint64_t v59 = *((void *)v56 + 2);
              uint64_t v57 = (uint64_t)(v56 + 16);
              unint64_t v58 = v59;
              if ((unint64_t)v52 >= v59)
              {
                if (v55 + 1 > 0x333333333333333) {
                  abort();
                }
                *(void *)&long long v227 = 0;
                long long buf = 0u;
                long long v226 = 0u;
                unint64_t v101 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v58 - v54) >> 4);
                uint64_t v102 = 2 * v101;
                if (2 * v101 <= v55 + 1) {
                  uint64_t v102 = v55 + 1;
                }
                if (v101 >= 0x199999999999999) {
                  unint64_t v103 = 0x333333333333333;
                }
                else {
                  unint64_t v103 = v102;
                }
                *(void *)&long long v226 = v226 + 80;
                uint64_t v60 = *v53;
              }
              else
              {
                uint64_t v60 = (uint64_t)v52 + 80;
                *uint64_t v53 = (uint64_t)v52 + 80;
              }
              *uint64_t v53 = v60;
              uint64_t v104 = *v51;
            }
          }
        }
      }
      uint64_t v184 = [obj countByEnumeratingWithState:&v194 objects:v219 count:16];
    }
    while (v184);
  }
}

- (void)addSearchResult:(const SPResultValueItem *)a3 withFoundBundleID:(double)a4
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v126 = *(id *)&a5;
  unsigned long long v120 = *(_OWORD *)a3;
  unint64_t v123 = [*((id *)a3 + 8) attributeSet];
  BOOL v14 = [v123 attributeDictionary];
  unint64_t v124 = [v123 uniqueIdentifier];
  if ([v126 isEqualToString:@"com.apple.spotlight.category"])
  {
    uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02758]];
    uint64_t v16 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02750]];
    int v17 = objc_opt_new();
    if (v15)
    {
      if ([v15 count])
      {
        if (v16)
        {
          uint64_t v18 = [v16 count];
          if (v18 == [v15 count])
          {
            for (unint64_t i = 0; [v15 count] > i; ++i)
            {
              BOOL v20 = [v15 objectAtIndex:i];
              qos_class_t v21 = [(SPKQuery *)self userQueryString];
              int v22 = [v20 isEqualToString:v21];

              if (v22)
              {
                unsigned int v23 = [v16 objectAtIndex:i];
                [v17 addObject:v23];
              }
            }
            if ([v17 count])
            {
              objc_super v24 = [(PRSRankingConfiguration *)self->_rankingInfo categoryEngagements];
              [v24 setValue:v17 forKey:v124];
            }
          }
        }
      }
    }
  }
  unint64_t v122 = [v14 objectForKey:*MEMORY[0x263F01F98]];
  if (v122)
  {
    if ([v126 isEqualToString:*MEMORY[0x263F674E0]]
      && [(NSSet *)self->_disabledAppSet containsObject:v124])
    {
      v25 = SPLogForSPLogCategoryDefault();
      uint64_t v125 = v25;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v124;
        id v26 = "Skipping disabled app %@";
        id v27 = v25;
        os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
        uint32_t v29 = 12;
LABEL_27:
        _os_log_impl(&dword_235D0B000, v27, v28, v26, buf, v29);
        goto LABEL_128;
      }
      goto LABEL_128;
    }
    if ([v126 isEqualToString:@"com.apple.shortcuts"])
    {
      unint64_t v30 = [v123 relatedAppBundleIdentifier];
      if (v30)
      {
        uint64_t v125 = v30;
        BOOL v31 = -[NSSet containsObject:](self->_disabledAppSet, "containsObject:");
        unint64_t v30 = v125;
        if (v31)
        {
          uint64_t v32 = SPLogForSPLogCategoryDefault();
          os_log_type_t v33 = *MEMORY[0x263F67548] ^ 1;
          if (os_log_type_enabled(v32, v33))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&buf[4] = v125;
            _os_log_impl(&dword_235D0B000, v32, v33, "Skipping shortcut for disabled app %@", buf, 0xCu);
          }

          goto LABEL_128;
        }
      }
    }
    uint64_t v125 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02340]];
    uint64_t v121 = (void *)[v126 copy];
    uint64_t v36 = [v125 length];
    uint64_t v37 = *MEMORY[0x263F02968];
    if (v36)
    {
      v38 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02968]];
      if (v38)
      {
      }
      else if (([v126 isEqualToString:*MEMORY[0x263F79048]] & 1) == 0)
      {
        id v42 = (id)*MEMORY[0x263F78ED8];

        uint64_t v121 = v42;
        goto LABEL_37;
      }
    }
    int v39 = [v14 objectForKeyedSubscript:v37];
    if (v39)
    {
      int v40 = [v14 objectForKeyedSubscript:*MEMORY[0x263F01EF0]];
      char v41 = [v40 isEqualToString:@"com.apple.DocumentManager"];

      if (v41) {
        goto LABEL_127;
      }
    }
LABEL_37:
    if (![v121 isEqualToString:*MEMORY[0x263F78FF0]])
    {
LABEL_46:
      if (v126)
      {
        v51 = [(CSSearchQuery *)self->_csQuery queryContext];
        v52 = [v51 disableBundles];
        if ([v52 containsObject:v126])
        {
          char v53 = [&unk_26E931418 containsObject:v126];

          if ((v53 & 1) == 0)
          {
            v44 = SPLogForSPLogCategoryDefault();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&buf[4] = v126;
              _os_log_impl(&dword_235D0B000, v44, OS_LOG_TYPE_DEFAULT, "[ProtectedApps] item from disabled bundle %@ was found", buf, 0xCu);
            }
            goto LABEL_126;
          }
        }
        else
        {
        }
      }
      if (![v126 isEqualToString:*MEMORY[0x263F78EE8]])
      {
LABEL_77:
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        uint64_t v65 = [(NSArray *)self->_resultAttrs objectsAtIndexes:self->_resultAttrIndexSet];
        uint64_t v66 = 0;
        uint64_t v67 = [v65 countByEnumeratingWithState:&v131 objects:v136 count:16];
        if (v67)
        {
          uint64_t v68 = *(void *)v132;
          do
          {
            for (uint64_t j = 0; j != v67; ++j)
            {
              if (*(void *)v132 != v68) {
                objc_enumerationMutation(v65);
              }
              uint64_t v70 = [v14 objectForKey:*(void *)(*((void *)&v131 + 1) + 8 * j)];
              BOOL v71 = v70 != 0;

              v66 += v71;
            }
            uint64_t v67 = [v65 countByEnumeratingWithState:&v131 objects:v136 count:16];
          }
          while (v67);
        }

        uint64_t v72 = SSCompactRankingAttrsAlloc();
        resultAttrIndexSet = self->_resultAttrIndexSet;
        v127[0] = MEMORY[0x263EF8330];
        v127[1] = 3221225472;
        v127[2] = __53__SPCSSearchQuery_addSearchResult_withFoundBundleID___block_invoke;
        v127[3] = &unk_264C76C20;
        long long v74 = v14;
        uint64_t v128 = v74;
        long long v129 = self;
        uint64_t v130 = v72;
        [(NSIndexSet *)resultAttrIndexSet enumerateIndexesUsingBlock:v127];
        uint64_t v117 = (void *)[objc_alloc(MEMORY[0x263F78D48]) initWithAttrs:v72];
        long long v118 = [v74 objectForKeyedSubscript:*MEMORY[0x263F027C0]];
        long long v115 = [v74 objectForKeyedSubscript:*MEMORY[0x263F01E20]];
        uint64_t v113 = [v74 objectForKeyedSubscript:*MEMORY[0x263F02670]];
        if (v113
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && [v113 integerValue] >= 1
          && ([v115 isEqualToString:*MEMORY[0x263F78FB0]] & 1) == 0)
        {
          if ([v115 isEqualToString:*MEMORY[0x263F78F28]])
          {
            uint64_t v108 = 100663296;
          }
          else if ([v115 isEqualToString:*MEMORY[0x263F78F38]])
          {
            uint64_t v108 = 167772160;
          }
          else if (([v115 isEqualToString:*MEMORY[0x263F78ED8]] & 1) != 0 {
                 || ([v115 isEqualToString:*MEMORY[0x263F78F08]] & 1) != 0
          }
                 || [v115 isEqualToString:*MEMORY[0x263F78EF8]])
          {
            uint64_t v108 = 301989888;
          }
          else
          {
            uint64_t v108 = 0x2000000;
          }
          [v117 setBundleIDType:v108];
          v111 = (void *)[objc_alloc(MEMORY[0x263F78D48]) initWithAttrs:SSCompactRankingAttrsCopy()];
          objc_msgSend(v111, "setBundleIDType:", objc_msgSend(v117, "bundleIDType"));
          [v111 setSectionBundleIdentifier:*MEMORY[0x263F79060]];
          uint64_t v116 = v111;
          int v112 = 1;
        }
        else
        {
          int v112 = 0;
          uint64_t v116 = 0;
        }
        if (v118 && [v118 count] == 6)
        {
          if ([v125 length]) {
            [v117 setSectionBundleIdentifier:v115];
          }
          uint64_t v75 = [(SPCSSearchQuery *)self itemRanker];
          [v75 setRenderEngagementFeaturesForItem:v117 counts:v118 isRender:1 bundleDict:self->_renderEngagementCounts];

          uint64_t v76 = [(SPCSSearchQuery *)self itemRanker];
          [v76 setRenderEngagementFeaturesForItem:v116 counts:v118 isRender:1 bundleDict:self->_renderEngagementCounts];
        }
        long long v77 = [v74 objectForKeyedSubscript:*MEMORY[0x263F02058]];

        v119 = v77;
        if (v77 && [v77 count] == 6)
        {
          if ([v125 length]) {
            [v117 setSectionBundleIdentifier:v115];
          }
          uint64_t v78 = [(SPCSSearchQuery *)self itemRanker];
          [v78 setRenderEngagementFeaturesForItem:v117 counts:v77 isRender:0 bundleDict:self->_renderEngagementCounts];

          long long v79 = [(SPCSSearchQuery *)self itemRanker];
          [v79 setRenderEngagementFeaturesForItem:v116 counts:v77 isRender:0 bundleDict:self->_renderEngagementCounts];
        }
        uint64_t v80 = [SPSearchTopHitResult alloc];
        v81 = [*((id *)a3 + 8) attributeSet];
        uint64_t v82 = *(void *)a3;
        uint64_t v83 = *((void *)a3 + 1);
        v84 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:*((double *)a3 + 2)];
        uint64_t v85 = [*((id *)a3 + 8) protection];
        unint64_t v114 = -[SPSearchTopHitResult initWithRankingItem:attributeSet:score:interestingDate:dataclass:bundleID:](v80, "initWithRankingItem:attributeSet:score:interestingDate:dataclass:bundleID:", v117, v81, v82, v83, v84, v85, v121);

        uint64_t v86 = SPL1Threshold();
        if (v120 < __PAIR128__(v87, v86)) {
          [v117 setEligibleForDemotion:1];
        }
        if ([v122 hasPrefix:@"com.apple.siri."])
        {
          long long v88 = [v117 L2FeatureVector];
          [v88 setIsSiriAction:1];
        }
        id v89 = v121;
        memset(buf, 0, sizeof(buf));
        id v90 = v89;
        std::string::basic_string[abi:nn180100]<0>(buf, (char *)[v90 UTF8String]);
        p_bundleIdToResultsMap = &self->_bundleIdToResultsMap;
        if (std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::find<std::string>(&self->_bundleIdToResultsMap.map.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)buf))
        {
          v135 = buf;
          uint64_t v92 = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_bundleIdToResultsMap, (uint64_t)buf, (uint64_t)&std::piecewise_construct, (long long **)&v135);
        }
        else
        {
          uint64_t v93 = objc_opt_new();
          [v93 setDomain:1];
          [v93 setBundleIdentifier:v90];
          uint64_t v94 = objc_opt_new();
          id v95 = v93;
          v135 = buf;
          v96 = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)p_bundleIdToResultsMap, (uint64_t)buf, (uint64_t)&std::piecewise_construct, (long long **)&v135);
          long long v97 = (void *)*((void *)v96 + 5);
          *((void *)v96 + 5) = v95;

          v98 = (void *)*((void *)v96 + 6);
          *((void *)v96 + 6) = v94;

          v135 = buf;
          uint64_t v92 = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)p_bundleIdToResultsMap, (uint64_t)buf, (uint64_t)&std::piecewise_construct, (long long **)&v135);
        }
        if ((char)buf[23] < 0) {
          operator delete(*(void **)buf);
        }

        [*((id *)v92 + 6) addObject:v114];
        if (v112)
        {
          v99 = [SPSearchTopHitResult alloc];
          v100 = [*((id *)a3 + 8) attributeSet];
          uint64_t v101 = *(void *)a3;
          uint64_t v102 = *((void *)a3 + 1);
          unint64_t v103 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:*((double *)a3 + 2)];
          uint64_t v104 = [*((id *)a3 + 8) protection];
          long long v105 = (NSString *)*MEMORY[0x263F79060];
          v106 = -[SPSearchTopHitResult initWithRankingItem:attributeSet:score:interestingDate:dataclass:bundleID:](v99, "initWithRankingItem:attributeSet:score:interestingDate:dataclass:bundleID:", v116, v100, v101, v102, v103, v104, *MEMORY[0x263F79060]);

          objc_msgSend(v116, "setEligibleForDemotion:", objc_msgSend(v117, "eligibleForDemotion"));
          if ([v115 isEqualToString:*MEMORY[0x263F78F28]]) {
            v107 = {;
          }
            [v107 addObject:v106];
          }
          else if ([v115 isEqualToString:*MEMORY[0x263F78F38]]) {
            v107 = {;
          }
            [v107 addObject:v106];
          }
          else if (([v115 isEqualToString:*MEMORY[0x263F78ED8]] & 1) != 0 {
                 || ([v115 isEqualToString:*MEMORY[0x263F78F08]] & 1) != 0
          }
                 || ([v115 isEqualToString:*MEMORY[0x263F78EF8]] & 1) != 0
                 || [v115 isEqualToString:*MEMORY[0x263F78EF0]])
            v107 = {;
            [v107 addObject:v106];
          }
          else {
            v107 = {;
          }
            [v107 addObject:v106];
          }
        }
        v44 = v128;
        goto LABEL_126;
      }
      v44 = [(SPKQuery *)self queryContext];
      uint64_t v54 = [v44 queryKind];
      unint64_t v55 = [(SPKQuery *)self delegate];
      id v56 = [v55 clientBundleID];
      if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken != -1) {
        dispatch_once(&SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken, &__block_literal_global_666);
      }
      if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolDebugMode) {
        goto LABEL_56;
      }
      if (!SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolRanking)
      {

LABEL_76:
        goto LABEL_77;
      }
      if (([v56 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
        || ([v56 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
      {
LABEL_56:
      }
      else
      {
        char v63 = [v56 hasPrefix:@"com.apple.ondeviceeval"];
        if (v54 == 12) {
          char v64 = 1;
        }
        else {
          char v64 = v63;
        }

        if ((v64 & 1) == 0) {
          goto LABEL_77;
        }
      }
      v44 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02238]];
      if (!v44)
      {
        uint64_t v60 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          -[SPCSSearchQuery addSearchResult:withFoundBundleID:](v60);
        }
        goto LABEL_74;
      }
      uint64_t v57 = [(SPKQuery *)self queryContext];
      unint64_t v58 = [v57 disabledBundles];
      int v59 = [v58 containsObject:v44];

      if (v59)
      {
        uint64_t v60 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&buf[4] = v44;
          _os_log_impl(&dword_235D0B000, v60, OS_LOG_TYPE_DEFAULT, "[ProtectedApps][personal answers] event extracted from disabled source bundle %@ was filtered out", buf, 0xCu);
        }
LABEL_74:

LABEL_126:
LABEL_127:

        goto LABEL_128;
      }
      goto LABEL_76;
    }
    uint64_t v43 = [v123 relatedAppBundleIdentifier];
    v44 = v43;
    if (!v43) {
    v45 = goto LABEL_41;
    }
    if ([v45 containsObject:v44])
    {
      BOOL v46 = [(NSSet *)self->_disabledAppSet containsObject:v44];

      if (!v46)
      {
LABEL_41:
        if (![v122 isEqualToString:@"com.apple.Preferences.thirdPartyApp"])
        {
LABEL_45:

          goto LABEL_46;
        }
        unsigned int v47 = [v14 objectForKeyedSubscript:*MEMORY[0x263F028E0]];
        objc_opt_class();
        uint64_t isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) == 0
              uint64_t v49 = objc_claimAutoreleasedReturnValue(),
              char v50 = [v49 containsObject:v47],
              v49,
              (v50 & 1) != 0))
        {

          goto LABEL_45;
        }
        uint64_t v109 = SPLogForSPLogCategoryDefault();
        os_log_type_t v110 = 2 * (*MEMORY[0x263F67540] == 0);
        if (os_log_type_enabled(v109, v110))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&buf[4] = v47;
          _os_log_impl(&dword_235D0B000, v109, v110, "Skipping for uninstalled %@", buf, 0xCu);
        }

LABEL_125:
        goto LABEL_126;
      }
    }
    else
    {
    }
    unsigned int v47 = SPLogForSPLogCategoryDefault();
    os_log_type_t v61 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v47, v61))
    {
      long long v62 = [v123 relatedAppBundleIdentifier];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v62;
      _os_log_impl(&dword_235D0B000, v47, v61, "Skipping Settings item for app %@", buf, 0xCu);
    }
    goto LABEL_125;
  }
  uint64_t v34 = SPLogForSPLogCategoryDefault();
  os_log_type_t v35 = *MEMORY[0x263F67548] ^ 1;
  uint64_t v125 = v34;
  if (os_log_type_enabled(v34, v35))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&buf[4] = v124;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v126;
    id v26 = "No UTI type for CoreSpotlight result, identifier:%@, bundleID:%@";
    id v27 = v34;
    os_log_type_t v28 = v35;
    uint32_t v29 = 22;
    goto LABEL_27;
  }
LABEL_128:
}

void __53__SPCSSearchQuery_addSearchResult_withFoundBundleID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(*(void *)(a1 + 40) + 408) objectAtIndexedSubscript:a2];
  id v6 = [v3 objectForKey:v4];

  if (v6)
  {
    if (a2 == 100 || a2 == 13) && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = [v6 absoluteString];
      SSCompactRankingAttrsInsertValue();
    }
    else
    {
      SSCompactRankingAttrsInsertValue();
    }
  }
}

- (void)constructResultsForResponse:(BOOL)a3
{
  uint64_t v157 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SPKQuery *)self queryContext];
  id v4 = self;
  uint64_t v5 = [v3 queryKind];
  id v6 = [(SPKQuery *)self delegate];
  id v7 = [v6 clientBundleID];
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken, &__block_literal_global_666);
  }
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolDebugMode) {
    goto LABEL_4;
  }
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolRanking)
  {
    if (([v7 hasPrefix:@"com.apple.omniSearch"] & 1) == 0
      && ([v7 hasPrefix:@"com.apple.intelligenceflow"] & 1) == 0)
    {
      int v81 = [v7 hasPrefix:@"com.apple.ondeviceeval"];
      if (v5 == 12) {
        int v8 = 1;
      }
      else {
        int v8 = v81;
      }
      goto LABEL_5;
    }
LABEL_4:
    int v8 = 1;
LABEL_5:
    int v88 = v8;
    goto LABEL_6;
  }
  int v88 = 0;
LABEL_6:

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = self->_foundBundleIDs;
  uint64_t v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v105 objects:v109 count:16];
  if (v9)
  {
    uint64_t v83 = *(void *)v106;
    uint64_t v10 = 4;
    if (!v88) {
      uint64_t v10 = 1;
    }
    uint64_t v90 = v10;
    do
    {
      uint64_t v85 = 0;
      uint64_t v84 = v9;
      do
      {
        if (*(void *)v106 != v83) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v105 + 1) + 8 * v85);
        id v12 = [(NSMutableDictionary *)v4->_foundBundleIDs objectForKeyedSubscript:v11];
        uint64_t v13 = [v12 unsignedIntegerValue];
        uint64_t v93 = v11;

        id v4 = self;
        BOOL v14 = (char *)self->_resultHeaps.__begin_ + 24 * v13 + 8;
        char v15 = 1;
        uint64_t v16 = v90;
        do
        {
          v15 &= *v14 == *(v14 - 1);
          v14 += 3;
          --v16;
        }
        while (v16);
        if ((v15 & 1) == 0)
        {
          uint64_t v17 = 0;
          uint64_t v89 = (int)v13;
          do
          {
            uint64_t v18 = v17 + v89;
            begin = v4->_resultHeaps.__begin_;
            BOOL v20 = &begin[3 * v17 + 3 * v89];
            uint64_t v22 = *v20;
            uint64_t v21 = v20[1];
            unsigned int v23 = v93;
            if (*v20 != v21)
            {
              do
              {
                [(SPCSSearchQuery *)v4 addSearchResult:v22 withFoundBundleID:v93];
                v22 += 80;
              }
              while (v22 != v21);
              begin = v4->_resultHeaps.__begin_;
            }
            uint64_t v91 = v17;
            if (v88)
            {
              objc_super v24 = (id **)&begin[3 * v18];
              uint64_t v94 = (uint64_t *)(v24 + 1);
              if (v24[1] != *v24)
              {
                id v87 = v93;
                long long v155 = 0u;
                long long v156 = 0u;
                v25 = *v24;
                long long v26 = *((_OWORD *)*v24 + 1);
                long long v151 = *(_OWORD *)*v24;
                long long v152 = v26;
                id v27 = v25[4];
                id v153 = v27;
                int v28 = *((_DWORD *)v25 + 12);
                id v154 = v25[5];
                LODWORD(v155) = v28;
                *((void *)&v155 + 1) = v25[7];
                *(void *)&long long v156 = v25[8];
                long long v149 = 0u;
                long long v150 = 0u;
                uint32_t v29 = *v24;
                long long v30 = *((_OWORD *)*v24 + 1);
                long long v145 = *(_OWORD *)*v24;
                long long v146 = v30;
                id v147 = v29[4];
                int v31 = *((_DWORD *)v29 + 12);
                id v148 = v29[5];
                LODWORD(v149) = v31;
                *((void *)&v149 + 1) = v29[7];
                id v32 = v29[8];
                *(void *)&long long v150 = v32;
                memset(v144, 0, sizeof(v144));
                uint64_t v86 = v18;
                if (0xCCCCCCCCCCCCCCCDLL * ((*v94 - (uint64_t)*v24) >> 4) >= 2)
                {
                  uint64_t v33 = 18;
                  unint64_t v34 = 1;
                  do
                  {
                    v138[0] = v151;
                    v138[1] = v152;
                    id v27 = v27;
                    id v139 = v27;
                    id v140 = v154;
                    int v141 = v155;
                    id v142 = *((id *)&v155 + 1);
                    id v143 = (id)v156;
                    os_log_type_t v35 = &(*v24)[v33];
                    long long v36 = *((_OWORD *)v35 - 3);
                    v132[0] = *((_OWORD *)v35 - 4);
                    v132[1] = v36;
                    id v133 = *(v35 - 4);
                    uint64_t v37 = (uint64_t)*(v35 - 3);
                    int v135 = *((_DWORD *)v35 - 4);
                    uint64_t v134 = v37;
                    id v136 = *(v35 - 1);
                    id v137 = *v35;
                    {
                      v38 = *v24;
                      int v39 = &(*v24)[v33];
                      long long v40 = *((_OWORD *)v39 - 3);
                      long long v151 = *((_OWORD *)v39 - 4);
                      long long v152 = v40;
                      id v41 = *(v39 - 4);
                      id v153 = v41;

                      id v42 = *(v39 - 3);
                      LODWORD(v155) = *((_DWORD *)v39 - 4);
                      id v154 = v42;
                      objc_storeStrong((id *)&v155 + 1, *(v39 - 1));
                      objc_storeStrong((id *)&v156, v38[v33]);
                      id v27 = v41;
                    }
                    uint64_t v43 = &(*v24)[v33];
                    long long v44 = *((_OWORD *)v43 - 3);
                    v126[0] = *((_OWORD *)v43 - 4);
                    v126[1] = v44;
                    id v127 = *(v43 - 4);
                    uint64_t v45 = (uint64_t)*(v43 - 3);
                    int v129 = *((_DWORD *)v43 - 4);
                    uint64_t v128 = v45;
                    id v130 = *(v43 - 1);
                    id v131 = *v43;
                    v120[0] = v145;
                    v120[1] = v146;
                    id v46 = v147;
                    id v121 = v46;
                    id v122 = v148;
                    int v123 = v149;
                    id v47 = *((id *)&v149 + 1);
                    id v124 = v47;
                    id v32 = (id)v150;
                    id v125 = v32;
                    {
                      int v48 = *v24;
                      uint64_t v49 = &(*v24)[v33];
                      long long v50 = *((_OWORD *)v49 - 3);
                      long long v145 = *((_OWORD *)v49 - 4);
                      long long v146 = v50;
                      id v147 = *(v49 - 4);

                      v51 = *(v49 - 3);
                      LODWORD(v149) = *((_DWORD *)v49 - 4);
                      id v148 = v51;
                      *((void *)&v149 + 1) = *(v49 - 1);

                      id v52 = v48[v33];
                      *(void *)&long long v150 = v52;

                      id v32 = v52;
                    }
                    ++v34;
                    v33 += 10;
                  }
                  while (0xCCCCCCCCCCCCCCCDLL * ((*v94 - (uint64_t)*v24) >> 4) > v34);
                }
                unint64_t v55 = SPLogForSPLogCategoryDefault();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v56 = *v94;
                  uint64_t v57 = *v24;
                  int v58 = [v27 intValue];
                  *(_DWORD *)long long buf = 67110146;
                  int v111 = -858993459 * ((unint64_t)(v56 - (void)v57) >> 4);
                  __int16 v112 = 2112;
                  uint64_t v113 = v93;
                  __int16 v114 = 1024;
                  int v115 = v58;
                  __int16 v116 = 2048;
                  double v117 = Score;
                  __int16 v118 = 2048;
                  double v119 = v54;
                  _os_log_impl(&dword_235D0B000, v55, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <_resultHeaps> added %d items for bundle = %@, retrievalType = %d (min: %f, max: %f)", buf, 0x2Cu);
                  id v32 = (id)v150;
                }

                id v4 = self;
                begin = self->_resultHeaps.__begin_;
                unsigned int v23 = v93;
                uint64_t v18 = v86;
              }
            }
            int v59 = (char *)&begin[3 * v18];
            uint64_t v62 = *((void *)v59 + 1);
            uint64_t v60 = v59 + 8;
            uint64_t v61 = v62;
            uint64_t v63 = begin[3 * v18];
            while (v61 != v63)
            {
              v61 -= 80;
            }
            *uint64_t v60 = v63;
            char v64 = (unsigned int *)((char *)v4->_resultRankTables.__begin_ + 32 * v18);
            v100[0] = MEMORY[0x263EF8330];
            v100[1] = 3221225472;
            uint64_t v101 = __47__SPCSSearchQuery_constructResultsForResponse___block_invoke;
            uint64_t v102 = &unk_264C76C48;
            unint64_t v103 = v4;
            uint64_t v104 = v23;
            uint64_t v65 = v100;
            unint64_t v66 = *v64;
            if (v66)
            {
              uint64_t v67 = 0;
              for (unint64_t i = 0; i < v66; ++i)
              {
                uint64_t v69 = (id *)(*((void *)v64 + 1) + v67);
                if (v69[9])
                {
                  long long v70 = *((_OWORD *)v69 + 1);
                  long long v151 = *(_OWORD *)v69;
                  long long v152 = v70;
                  id v153 = v69[4];
                  id v71 = v69[5];
                  LODWORD(v155) = *((_DWORD *)v69 + 12);
                  id v154 = v71;
                  *((void *)&v155 + 1) = v69[7];
                  *(void *)&long long v156 = v69[8];
                  *((void *)&v156 + 1) = v69[9];
                  v101((uint64_t)v65, (uint64_t)&v151);
                  unint64_t v66 = *v64;
                }
                v67 += 80;
              }
            }

            uint64_t v72 = (char *)self->_resultRecencyTables.__begin_;
            v95[0] = MEMORY[0x263EF8330];
            v95[1] = 3221225472;
            v96 = __47__SPCSSearchQuery_constructResultsForResponse___block_invoke_2;
            long long v97 = &unk_264C76C48;
            uint64_t v73 = &v72[32 * v18];
            v98 = self;
            v99 = v93;
            long long v74 = v95;
            unint64_t v75 = *(unsigned int *)v73;
            if (v75)
            {
              uint64_t v76 = 0;
              for (unint64_t j = 0; j < v75; ++j)
              {
                uint64_t v78 = (id *)(*((void *)v73 + 1) + v76);
                if (v78[9])
                {
                  long long v79 = *((_OWORD *)v78 + 1);
                  long long v151 = *(_OWORD *)v78;
                  long long v152 = v79;
                  id v153 = v78[4];
                  id v80 = v78[5];
                  LODWORD(v155) = *((_DWORD *)v78 + 12);
                  id v154 = v80;
                  *((void *)&v155 + 1) = v78[7];
                  *(void *)&long long v156 = v78[8];
                  *((void *)&v156 + 1) = v78[9];
                  v96((uint64_t)v74, (uint64_t)&v151);
                  unint64_t v75 = *(unsigned int *)v73;
                }
                v76 += 80;
              }
            }

            uint64_t v17 = v91 + 1;
            id v4 = self;
          }
          while (v91 + 1 != v90);
        }
        ++v85;
      }
      while (v85 != v84);
      uint64_t v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v105 objects:v109 count:16];
    }
    while (v9);
  }
}

void __47__SPCSSearchQuery_constructResultsForResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addSearchResult:a2 withFoundBundleID:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a2 + 32);
}

void __47__SPCSSearchQuery_constructResultsForResponse___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addSearchResult:a2 withFoundBundleID:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a2 + 32);
}

- (void)updateMailAttachmentResults:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v3)
  {
    id v4 = 0;
    to = *(id **)v64;
    id v47 = 0;
    uint64_t v5 = *MEMORY[0x263F027A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(id **)v64 != to) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        int v8 = [v7 attributeSet];
        uint64_t v9 = [v8 attributeDictionary];
        uint64_t v10 = [v9 objectForKeyedSubscript:v5];

        if (v10)
        {
          if (!v4)
          {
            id v4 = [MEMORY[0x263EFF9A0] dictionary];
            uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];

            id v47 = (void *)v11;
          }
          id v12 = [v7 dataclass];
          uint64_t v13 = [v4 objectForKeyedSubscript:v12];

          if (!v13)
          {
            uint64_t v13 = [MEMORY[0x263EFF980] array];
            BOOL v14 = [v7 dataclass];
            [v4 setObject:v13 forKeyedSubscript:v14];
          }
          char v15 = [v47 objectForKeyedSubscript:v10];
          if (!v15
            || (uint64_t v16 = [v7 score],
                unint64_t v18 = v17,
                uint64_t v19 = [v15 score],
                __PAIR128__(v20, v19) < __PAIR128__(v18, v16)))
          {
            [v47 setObject:v7 forKeyedSubscript:v10];
            if (v15)
            {
              uint64_t v21 = SPLogForSPLogCategoryDefault();
              os_log_type_t v22 = *MEMORY[0x263F67548] ^ 1;
              if (os_log_type_enabled(v21, v22))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_235D0B000, v21, v22, "===^^ RANKING 4 Mail higher ranked replaced", buf, 2u);
              }
            }
            else
            {
              [v13 addObject:v10];
            }
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v3);

    if (!v4)
    {
      uint64_t v37 = 0;
      goto LABEL_35;
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v44 = v4;
    uint64_t v23 = [v44 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v23)
    {
      uint64_t v40 = *(void *)v60;
      v38 = v49;
      uint64_t v39 = *MEMORY[0x263F79040];
      do
      {
        uint64_t v42 = v23;
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v60 != v40) {
            objc_enumerationMutation(v44);
          }
          uint64_t v25 = *(void *)(*((void *)&v59 + 1) + 8 * j);
          uint64_t v45 = objc_msgSend(v44, "objectForKeyedSubscript:", v25, v38);
          long long v26 = rankingAttributeNameArray();
          id v27 = dispatch_group_create();
          dispatch_group_enter(v27);
          *(void *)long long buf = 0;
          objc_initWeak((id *)buf, self);
          int v28 = [MEMORY[0x263EFF980] array];
          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          void v52[2] = __47__SPCSSearchQuery_updateMailAttachmentResults___block_invoke;
          v52[3] = &unk_264C76C70;
          objc_copyWeak(&v57, (id *)buf);
          id v29 = v45;
          id v53 = v29;
          id v30 = v26;
          id v54 = v30;
          id v31 = v28;
          id v55 = v31;
          id v32 = v27;
          uint64_t v56 = v32;
          uint64_t v33 = (void *)MEMORY[0x237DF3D40](v52);
          unint64_t v34 = [MEMORY[0x263F02AD8] defaultSearchableIndex];
          [v34 slowFetchAttributes:v30 protectionClass:v25 bundleID:v39 identifiers:v29 completionHandler:v33];

          dispatch_time_t v35 = dispatch_time(0, 300000000);
          if (!dispatch_group_wait(v32, v35))
          {
            v48[0] = MEMORY[0x263EF8330];
            v48[1] = 3221225472;
            v49[0] = __47__SPCSSearchQuery_updateMailAttachmentResults___block_invoke_244;
            v49[1] = &unk_264C76C98;
            id v50 = v47;
            id v51 = v31;
            [v29 enumerateObjectsUsingBlock:v48];
          }
          objc_destroyWeak(&v57);

          objc_destroyWeak((id *)buf);
        }
        uint64_t v23 = [v44 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v23);
    }
    long long v36 = v44;
    uint64_t v37 = v44;
  }
  else
  {
    id v47 = 0;
    uint64_t v37 = 0;
    long long v36 = obj;
  }

LABEL_35:
}

void __47__SPCSSearchQuery_updateMailAttachmentResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v18 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v2 = objc_msgSend(v18, "count", WeakRetained);
    if (v2 == [*(id *)(a1 + 32) count])
    {
      unint64_t v19 = 0;
      uint64_t v3 = (void *)*MEMORY[0x263EFFD08];
      while (v19 < [v18 count])
      {
        id v4 = objc_msgSend(v18, "objectAtIndexedSubscript:");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v5 = objc_opt_new();
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v6 = *(id *)(a1 + 40);
          uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v7)
          {
            uint64_t v8 = 0;
            uint64_t v9 = *(void *)v21;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v21 != v9) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
                id v12 = [v4 objectAtIndexedSubscript:v8 + v10];
                if (v12 != v3) {
                  [v5 setObject:v12 forKey:v11];
                }

                ++v10;
              }
              while (v7 != v10);
              uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
              v8 += v10;
            }
            while (v7);
          }

          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F02AE8]) initWithAttributes:v5];
          [*(id *)(a1 + 48) addObject:v13];
        }
        ++v19;
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    }
    else
    {
      BOOL v14 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [*(id *)(a1 + 32) count];
        *(_DWORD *)long long buf = 134218240;
        uint64_t v26 = v15;
        __int16 v27 = 2048;
        uint64_t v28 = [v18 count];
        _os_log_impl(&dword_235D0B000, v14, OS_LOG_TYPE_DEFAULT, "*warn* Could not fetch all related item attributes for mail attachments. Related items: %lu. Attributes fetched: %lu", buf, 0x16u);
      }
    }
  }
}

void __47__SPCSSearchQuery_updateMailAttachmentResults___block_invoke_244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  id v6 = [v8 attributeSet];
  uint64_t v7 = [v6 attributeDictionary];
  [v5 addAttributesFromDictionaryWithOutOverWriting:v7];

  [v8 setAttributeSet:v5];
}

- (id)prepareRankingItems:(id)a3 withResultSets:(id)a4 totalFeatureComputationTime:(double *)a5
{
  uint64_t v158 = *MEMORY[0x263EF8340];
  id v118 = a3;
  id v114 = a4;
  uint64_t v7 = [(SPCSSearchQuery *)self itemRanker];
  id v8 = [(SPKQuery *)self queryContext];
  uint64_t v9 = [(SPKQuery *)self queryContext];
  uint64_t v10 = [v9 queryKind];
  uint64_t v11 = [(SPKQuery *)self delegate];
  id v12 = [v11 clientBundleID];
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken, &__block_literal_global_666);
  }
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolDebugMode)
  {
LABEL_4:
    uint64_t v13 = 1;
    goto LABEL_5;
  }
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolRanking)
  {
    if (([v12 hasPrefix:@"com.apple.omniSearch"] & 1) == 0
      && ([v12 hasPrefix:@"com.apple.intelligenceflow"] & 1) == 0)
    {
      unsigned int v107 = [v12 hasPrefix:@"com.apple.ondeviceeval"];
      if (v10 == 12) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v107;
      }
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v13 = 0;
LABEL_5:

  [v7 parseQUQuery:v8 isSearchToolClient:v13];
  id v122 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v118, "count"));
  unint64_t v14 = 0;
  long long v132 = (void *)*MEMORY[0x263EFFD08];
  while (v14 < [v118 count])
  {
    [v122 addObject:v132];
    ++v14;
  }
  unint64_t v119 = 0;
  uint64_t v111 = *MEMORY[0x263F78F10];
  uint64_t v109 = v138;
  uint64_t v110 = *MEMORY[0x263F78F28];
  *(void *)&long long v15 = 67109378;
  long long v108 = v15;
  id v125 = self;
  while (v119 < objc_msgSend(v118, "count", v108, v109))
  {
    int v123 = [v118 objectAtIndexedSubscript:v119];
    __int16 v112 = [v114 objectAtIndexedSubscript:v119];
    uint64_t v16 = [v123 bundleIdentifier];
    int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();
    id v18 = objc_opt_new();
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v19 = v112;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v143 objects:v157 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v144;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v144 != v21) {
            objc_enumerationMutation(v19);
          }
          long long v23 = *(void **)(*((void *)&v143 + 1) + 8 * i);
          objc_super v24 = [v23 rankingItem];
          BOOL v25 = v24 == 0;

          if (!v25)
          {
            uint64_t v26 = [v23 rankingItem];
            [v26 setSectionBundleIdentifier:v16];

            __int16 v27 = [v23 rankingItem];
            [v18 addObject:v27];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v143 objects:v157 count:16];
      }
      while (v20);
    }

    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v29 = [(SPCSSearchQuery *)v125 itemRanker];
    id v30 = [v123 bundleIdentifier];
    [v29 prepareItems:v18 inBundle:v30];

    *a5 = CFAbsoluteTimeGetCurrent() - Current + *a5;
    if (IsSyndicatedPhotos)
    {
      __int16 v116 = objc_opt_new();
      double v117 = objc_opt_new();
      uint64_t v128 = [v19 count];
      id v31 = [(SPCSSearchQuery *)v125 itemRanker];
      int v126 = [v31 isNLSearch];

      id v32 = [(SPCSSearchQuery *)v125 itemRanker];
      BOOL v33 = [v32 queryTermCount] == 0;

      if (v33)
      {
        char v120 = 0;
      }
      else
      {
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        id v34 = v19;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v139 objects:v156 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v140;
          while (2)
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v140 != v36) {
                objc_enumerationMutation(v34);
              }
              v38 = [*(id *)(*((void *)&v139 + 1) + 8 * j) rankingItem];
              uint64_t v39 = v38;
              if (v38)
              {
                uint64_t v40 = [v38 L2FeatureVector];
                [v40 scoreForFeature:1929];
                float v42 = v41;

                if (v42 == 1.0)
                {

                  char v120 = 1;
                  goto LABEL_33;
                }
              }
            }
            uint64_t v35 = [v34 countByEnumeratingWithState:&v139 objects:v156 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }
        char v120 = 0;
LABEL_33:
      }
      if (v128)
      {
        uint64_t v43 = 0;
        uint64_t v130 = 0;
        char v115 = 0;
        do
        {
          id v44 = [v19 objectAtIndex:v43];
          uint64_t v45 = [v44 rankingItem];
          id v46 = v45;
          if (v45)
          {
            id v47 = [v45 L2FeatureVector];
            [v47 scoreForFeature:2392];
            float v49 = v48;

            id v50 = [v46 L2FeatureVector];
            [v50 scoreForFeature:1929];
            float v52 = v51;

            id v53 = [v46 L2FeatureVector];
            [v53 scoreForFeature:2380];
            float v55 = v54;

            if (v49 == 1.0) {
              int v56 = v126;
            }
            else {
              int v56 = 0;
            }
            if (!((v120 ^ 1) & 1 | (v52 == 1.0)) && (v56 & 1) == 0
              || (v52 == 1.0 ? (char v62 = 1) : (char v62 = v120),
                  (v62 & 1) == 0
               && v55 != 1.0
               && ([v46 photosExactMatch] & 1) == 0
               && (([v46 photosMatch] | v56) & 1) == 0))
            {
              if ((*((unsigned char *)v125 + 448) & 2) != 0)
              {
                id v57 = SPLogForSPLogCategoryDefault();
                os_log_type_t v63 = *MEMORY[0x263F67548] ^ 1;
                if (os_log_type_enabled(v57, v63))
                {
                  long long v64 = [v46 identifier];
                  int v65 = [v46 photosExactMatch];
                  int v66 = [v46 photosMatch];
                  *(_DWORD *)long long buf = 138413314;
                  *(void *)long long v149 = v64;
                  *(_WORD *)&v149[8] = 1024;
                  *(_DWORD *)&v149[10] = v65;
                  __int16 v150 = 1024;
                  int v151 = v66;
                  __int16 v152 = 2048;
                  double v153 = v49;
                  __int16 v154 = 1024;
                  int v155 = v126;
                  _os_log_impl(&dword_235D0B000, v57, v63, "#####=== [Pommes Ranking] photo filtering ignored id:%@ exact:%d match:%d nl:%.0f isNL:%d", buf, 0x28u);
                }
              }
              else
              {
                [v116 addIndex:v43];
                [v117 addIndex:v130];
                id v57 = SPLogForSPLogCategoryDefault();
                os_log_type_t v58 = *MEMORY[0x263F67548] ^ 1;
                if (os_log_type_enabled(v57, v58))
                {
                  long long v59 = [v46 identifier];
                  int v60 = [v46 photosExactMatch];
                  int v61 = [v46 photosMatch];
                  *(_DWORD *)long long buf = 138413314;
                  *(void *)long long v149 = v59;
                  *(_WORD *)&v149[8] = 1024;
                  *(_DWORD *)&v149[10] = v60;
                  __int16 v150 = 1024;
                  int v151 = v61;
                  __int16 v152 = 2048;
                  double v153 = v49;
                  __int16 v154 = 1024;
                  int v155 = v126;
                  _os_log_impl(&dword_235D0B000, v57, v58, "#####=== photo filtered id:%@ exact:%d match:%d nl:%.0f isNL:%d", buf, 0x28u);
                }
                char v115 = 1;
              }
            }
            ++v130;
          }

          ++v43;
        }
        while (v128 != v43);
        if (v115)
        {
          [v18 removeObjectsAtIndexes:v117];
          [v19 removeObjectsAtIndexes:v116];
        }
      }
    }
    uint64_t v67 = [v123 resultsCount];
    if (!v125->_isPeopleSearch) {
      goto LABEL_94;
    }
    unint64_t v68 = v67;
    if ([v16 isEqualToString:v111])
    {
      if (v68 < 0xC9) {
        goto LABEL_94;
      }
    }
    else
    {
      char v69 = [v16 isEqualToString:v110];
      if (v68 > 0xC8) {
        char v70 = v69;
      }
      else {
        char v70 = 0;
      }
      if ((v70 & 1) == 0) {
        goto LABEL_94;
      }
    }
    id v127 = objc_opt_new();
    int v129 = objc_opt_new();
    id v131 = [v123 resultSet];
    id v71 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v68];
    uint64_t v72 = 0;
    uint64_t v73 = v71;
    do
    {
      long long v74 = [v131 objectAtIndex:v72];
      unint64_t v75 = [v74 rankingItem];
      if (v75) {
        [v71 addObject:v75];
      }

      ++v72;
      id v71 = v73;
    }
    while (v68 != v72);
    v137[0] = MEMORY[0x263EF8330];
    v137[1] = 3221225472;
    v138[0] = __82__SPCSSearchQuery_prepareRankingItems_withResultSets_totalFeatureComputationTime___block_invoke;
    v138[1] = &unk_264C76CC0;
    _OWORD v138[2] = v125;
    [v73 sortWithOptions:16 usingComparator:v137];
    unint64_t v76 = [v73 count];
    if (v76 >= 0xC9)
    {
      for (uint64_t k = 200; k != v76; ++k)
      {
        uint64_t v78 = [v71 objectAtIndexedSubscript:k];
        long long v79 = [v78 L2FeatureVector];
        LODWORD(v80) = -8388608;
        [v79 setOriginalL2Score:v80];

        id v71 = v73;
      }
    }
    uint64_t v81 = 0;
    int v121 = 0;
    char v124 = 0;
    do
    {
      while (1)
      {
        uint64_t v82 = [v131 objectAtIndex:v81];
        uint64_t v83 = [v82 rankingItem];
        uint64_t v84 = v83;
        if (!v83) {
          goto LABEL_84;
        }
        uint64_t v85 = [v83 L2FeatureVector];
        [v85 originalL2Score];
        BOOL v87 = v86 == -INFINITY;

        if (!v87) {
          goto LABEL_84;
        }
        uint64_t v88 = [v18 indexOfObject:v84];
        if (v88 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        [v127 addIndex:v81];
        [v129 addIndex:v88];

        ++v121;
        char v124 = 1;
        if (v68 - 1 == v81++) {
          goto LABEL_90;
        }
      }
      uint64_t v89 = SPLogForSPLogCategoryDefault();
      os_log_type_t v90 = *MEMORY[0x263F67548] ^ 1;
      if (os_log_type_enabled(v89, v90))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_235D0B000, v89, v90, "Item to remove not found in array of ranking items", buf, 2u);
      }

LABEL_84:
      ++v81;
      uint64_t v91 = v73;
    }
    while (v68 != v81);
    if ((v124 & 1) == 0) {
      goto LABEL_93;
    }
LABEL_90:
    uint64_t v93 = SPLogForSPLogCategoryDefault();
    os_log_type_t v94 = *MEMORY[0x263F67548] ^ 1;
    if (os_log_type_enabled(v93, v94))
    {
      *(_DWORD *)long long buf = v108;
      *(_DWORD *)long long v149 = v121;
      *(_WORD *)&v149[4] = 2112;
      *(void *)&v149[6] = v16;
      _os_log_impl(&dword_235D0B000, v93, v94, "Removing %d items from %@", buf, 0x12u);
    }

    uint64_t v91 = v73;
    [v18 removeObjectsAtIndexes:v129];
    [v131 removeObjectsAtIndexes:v127];
LABEL_93:

LABEL_94:
    if ([v18 count])
    {
      id v95 = (void *)[v18 copy];
      [v122 setObject:v95 atIndexedSubscript:v119];
    }
    [v18 removeAllObjects];

    ++v119;
  }
  v96 = objc_opt_new();
  for (unint64_t m = 0; m < [v122 count]; ++m)
  {
    v98 = [v122 objectAtIndexedSubscript:m];
    if (v98 != v132)
    {
      v99 = [v122 objectAtIndexedSubscript:m];
      [v96 addObjectsFromArray:v99];
    }
  }
  v100 = objc_opt_new();
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v101 = v96;
  uint64_t v102 = [v101 countByEnumeratingWithState:&v133 objects:v147 count:16];
  if (v102)
  {
    uint64_t v103 = 0;
    uint64_t v104 = *(void *)v134;
    do
    {
      for (uint64_t n = 0; n != v102; ++n)
      {
        if (*(void *)v134 != v104) {
          objc_enumerationMutation(v101);
        }
        if (*(void **)(*((void *)&v133 + 1) + 8 * n) == v132) {
          [v100 addIndex:v103 + n];
        }
      }
      uint64_t v102 = [v101 countByEnumeratingWithState:&v133 objects:v147 count:16];
      v103 += n;
    }
    while (v102);
  }

  [v101 removeObjectsAtIndexes:v100];
  return v101;
}

uint64_t __82__SPCSSearchQuery_prepareRankingItems_withResultSets_totalFeatureComputationTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 interestingDate];
  uint64_t v7 = [v5 interestingDate];
  [v6 timeIntervalSinceReferenceDate];
  double v9 = v8;
  [*(id *)(a1 + 32) currentTime];
  double v11 = v10;
  [v7 timeIntervalSinceReferenceDate];
  double v13 = v12;
  [*(id *)(a1 + 32) currentTime];
  double v15 = v13 - v14;
  if (v9 - v11 <= v15) {
    uint64_t v16 = v9 - v11 < v15;
  }
  else {
    uint64_t v16 = -1;
  }

  return v16;
}

- (void)buildFullSearchResults:(id)a3 withResultSets:(id)a4
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v86 = a3;
  id v66 = a4;
  long long v74 = objc_opt_new();
  char v69 = objc_opt_new();
  id v6 = [(SPKQuery *)self queryContext];
  uint64_t v7 = [v6 queryKind];
  double v8 = [(SPKQuery *)self delegate];
  id v9 = [v8 clientBundleID];
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken, &__block_literal_global_666);
  }
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolDebugMode) {
    goto LABEL_4;
  }
  if (!SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolRanking)
  {
    int v76 = 0;
    goto LABEL_6;
  }
  if (([v9 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v9 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
LABEL_4:
    int v10 = 1;
  }
  else
  {
    int v62 = [v9 hasPrefix:@"com.apple.ondeviceeval"];
    if (v7 == 12) {
      int v10 = 1;
    }
    else {
      int v10 = v62;
    }
  }
  int v76 = v10;
LABEL_6:

  unint64_t v91 = 0;
  uint64_t v96 = *MEMORY[0x263F790C8];
  uint64_t v89 = *MEMORY[0x263F790D0];
  uint64_t v75 = *MEMORY[0x263F790E8];
  uint64_t v70 = *MEMORY[0x263F790F0];
  uint64_t v67 = *MEMORY[0x263F790D8];
  uint64_t v64 = *MEMORY[0x263F790E0];
  uint64_t v92 = *MEMORY[0x263F79100];
  uint64_t v85 = *MEMORY[0x263F79058];
  uint64_t v83 = *MEMORY[0x263F790A0];
  uint64_t v80 = *MEMORY[0x263F78E88];
  uint64_t v73 = *MEMORY[0x263F79030];
  uint64_t v72 = *MEMORY[0x263F78F00];
  uint64_t v68 = *MEMORY[0x263F78F90];
  uint64_t v84 = *MEMORY[0x263F79048];
  uint64_t v82 = *MEMORY[0x263F78F38];
  uint64_t v79 = *MEMORY[0x263F78F08];
  uint64_t v78 = *MEMORY[0x263F78EF8];
  uint64_t v77 = *MEMORY[0x263F78EF0];
  uint64_t v88 = *MEMORY[0x263F79060];
  while (v91 < objc_msgSend(v86, "count", v63))
  {
    BOOL v87 = objc_msgSend(v86, "objectAtIndexedSubscript:");
    os_log_type_t v90 = [v87 bundleIdentifier];
    if (([v90 isEqualToString:v96] & 1) == 0
      && ([v90 isEqualToString:v89] & 1) == 0
      && ([v90 isEqualToString:v75] & 1) == 0
      && ([v90 isEqualToString:v70] & 1) == 0
      && ([v90 isEqualToString:v67] & 1) == 0
      && ([v90 isEqualToString:v64] & 1) == 0)
    {
      os_log_type_t v63 = [v66 objectAtIndexedSubscript:v91];
      if (SSSectionIsSyndicatedPhotos())
      {
        double v11 = [MEMORY[0x263F78E08] sharedInstance];
        double v12 = [v87 resultSet];
        double v13 = [(SPKQuery *)self userQueryString];
        [(SPCSSearchQuery *)self currentTime];
        objc_msgSend(v11, "sortAndFilterRankedPhotosItemsFilterFromSet:maxCount:userQuery:currentTime:", v12, 20, v13);
      }
      id v71 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v63, "count"));
      uint64_t v81 = objc_opt_new();
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id obj = v63;
      uint64_t v14 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
      if (v14)
      {
        uint64_t v94 = *(void *)v98;
        do
        {
          uint64_t v95 = v14;
          for (uint64_t i = 0; i != v95; ++i)
          {
            if (*(void *)v98 != v94) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void **)(*((void *)&v97 + 1) + 8 * i);
            double currentTime = self->_currentTime;
            id v18 = [(SPKQuery *)self userQueryString];
            id v19 = [(SPKQuery *)self queryContext];
            uint64_t v20 = [v16 resultWithTime:v18 searchString:0 isCorrectedQuery:v19 withQueryContext:currentTime];

            uint64_t v21 = [v16 rankingItem];
            long long v22 = [v21 L2FeatureVector];
            if (v22) {
              BOOL v23 = v16 == 0;
            }
            else {
              BOOL v23 = 1;
            }
            int v24 = !v23;

            if (v24)
            {
              v102[0] = @"score";
              BOOL v25 = NSNumber;
              [v21 score];
              uint64_t v26 = objc_msgSend(v25, "numberWithFloat:");
              v103[0] = v26;
              v102[1] = @"raw score";
              __int16 v27 = NSNumber;
              [v21 rawScore];
              uint64_t v28 = objc_msgSend(v27, "numberWithFloat:");
              v103[1] = v28;
              v102[2] = @"original score";
              uint64_t v29 = NSNumber;
              id v30 = [v21 L2FeatureVector];
              [v30 originalL2Score];
              id v31 = objc_msgSend(v29, "numberWithFloat:");
              v103[2] = v31;
              id v32 = [NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:3];
              [v20 setLocalFeatures:v32];
            }
            BOOL v33 = [v16 rankingItem];
            [v33 score];
            objc_msgSend(v20, "setL2score:");

            id v34 = [v20 sectionBundleIdentifier];
            uint64_t v35 = [v20 resultBundleId];
            char v36 = [v34 isEqual:v96];
            p_queryId = &self->super._queryId;
            if (v36)
            {
LABEL_30:
              [(id)p_queryId[33] addResults:v20];
              goto LABEL_32;
            }
            if (([v34 isEqual:v92] & 1) == 0)
            {
              if ([v34 isEqual:v89])
              {
                if ([v35 isEqual:v84])
                {
                  v38 = [v21 sectionBundleIdentifier];
                  char v39 = [v38 isEqualToString:v88];

                  p_userQueryString = (id *)&self->super._userQueryString;
                  if ((v39 & 1) == 0) {
                    goto LABEL_56;
                  }
LABEL_55:
                  [p_userQueryString[33] addResults:v20];
                  goto LABEL_56;
                }
                if ([v35 isEqual:v82])
                {
                  uint64_t v45 = [v21 sectionBundleIdentifier];
                  char v46 = [v45 isEqualToString:v88];

                  p_userQueryString = (id *)&self->super._trimmedUserQueryString;
                  if (v46) {
                    goto LABEL_55;
                  }
                }
                else
                {
                  v101[0] = v79;
                  v101[1] = v78;
                  v101[2] = v77;
                  id v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:3];
                  int v51 = [v50 containsObject:v35];

                  p_userQueryString = (id *)&self->super._ranker;
                  if (!v51) {
                    goto LABEL_55;
                  }
                  float v52 = [v21 sectionBundleIdentifier];
                  char v53 = [v52 isEqualToString:v88];

                  p_userQueryString = (id *)&self->super._delegate;
                  if (v53) {
                    goto LABEL_55;
                  }
                }
LABEL_56:
                float v54 = [v21 sectionBundleIdentifier];
                int v55 = [v54 isEqualToString:v88];

                p_queryId = &self->super._queryGroupId;
                if (v55) {
                  goto LABEL_30;
                }
                goto LABEL_32;
              }
              if (([v34 isEqual:v85] & 1) == 0 && !objc_msgSend(v34, "isEqual:", v83))
              {
                if (([v34 isEqual:v80] & 1) != 0 || !objc_msgSend(v35, "isEqual:", v73))
                {
                  int v56 = [v20 userActivityRequiredString];
                  if ([(__CFString *)v56 length])
                  {
                    id v57 = [v87 bundleIdentifier];
                    if ([v57 isEqual:v72]) {
                      goto LABEL_77;
                    }
                    os_log_type_t v58 = [v87 bundleIdentifier];
                    if ([v58 isEqual:v68]) {
                      goto LABEL_75;
                    }
                    long long v59 = [v87 bundleIdentifier];
                    char IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

                    if (IsSyndicatedPhotos) {
                      goto LABEL_32;
                    }
                  }
                  else
                  {
                  }
                  if (([v34 hasPrefix:@"com.apple"] & 1) != 0
                    || ![MEMORY[0x263F78DF0] isLowEngagementBundle:v34]
                    || [v20 hasTextContentMatch])
                  {
                    goto LABEL_69;
                  }
                  goto LABEL_70;
                }
                if (([v20 hasTextContentMatch] | v76) == 1)
                {
                  id v47 = [v20 contactIdentifier];
                  BOOL v48 = v47 == 0;

                  if (!v48)
                  {
                    float v49 = [v20 contactIdentifier];
                    [v69 setObject:v20 forKey:v49];
                  }
LABEL_69:
                  [v71 addObject:v20];
                  goto LABEL_32;
                }
LABEL_70:
                int v60 = v34;
                if (v60) {
                  int v56 = v60;
                }
                else {
                  int v56 = @"empty_bundle";
                }
                int v61 = [v81 objectForKeyedSubscript:v56];
                id v57 = v61;
                if (v61)
                {
                  os_log_type_t v58 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v61, "unsignedIntValue") + 1);
                  [v81 setObject:v58 forKeyedSubscript:v56];
LABEL_75:
                }
                else
                {
                  [v81 setObject:&unk_26E931378 forKeyedSubscript:v56];
                }
LABEL_77:

LABEL_78:
                goto LABEL_32;
              }
              float v41 = [v20 personIdentifier];
              if (v41)
              {
                float v42 = [v20 personIdentifier];
                int v43 = [v42 hasPrefix:@"com.apple.spotlight"];

                if (v43)
                {
                  id v44 = [v20 personType];
                  if (([v44 isEqual:@"ml"] & 1) != 0
                    || ([v20 hasTextContentMatch] & 1) == 0)
                  {

                    if ((v76 & 1) == 0) {
                      goto LABEL_70;
                    }
                  }
                  else
                  {
                  }
                  int v56 = [v20 personIdentifier];
                  [v74 setObject:v20 forKey:v56];
                  goto LABEL_78;
                }
              }
            }
LABEL_32:
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
        }
        while (v14);
      }

      [v87 setResults:v71];
      [v81 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_274];
    }
    ++v91;
  }
  [(SPCSSearchQuery *)self buildPeopleResults:v74 withContacts:v69];
}

void __57__SPCSSearchQuery_buildFullSearchResults_withResultSets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = SPLogForSPLogCategoryRanking();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 1024;
    int v10 = [v5 unsignedIntValue];
    _os_log_impl(&dword_235D0B000, v6, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] Filtering section=%@: removed items count=%u", (uint8_t *)&v7, 0x12u);
  }
}

- (void)updateCoreSuggestionsSection:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v25 = a3;
  uint64_t v3 = [v25 results];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    id v5 = 0;
    uint64_t v6 = *(void *)v31;
    while (2)
    {
      uint64_t v7 = 0;
      id v8 = v5;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        __int16 v9 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
        if (v8)
        {
          int v10 = [*(id *)(*((void *)&v30 + 1) + 8 * v7) relatedBundleID];
          char v11 = [v8 isEqualToString:v10];

          if ((v11 & 1) == 0)
          {

            goto LABEL_15;
          }
        }
        id v5 = [v9 relatedBundleID];

        ++v7;
        id v8 = v5;
      }
      while (v4 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v4) {
        continue;
      }
      break;
    }

    if (v5)
    {
      int v24 = [MEMORY[0x263F67470] displayNameForBundleIdentifer:v5];
      if (v24)
      {
          -[SPCSSearchQuery updateCoreSuggestionsSection:]::nameFormat = {;
        }
        objc_msgSend(NSString, "stringWithFormat:", -[SPCSSearchQuery updateCoreSuggestionsSection:]::nameFormat, v24);
        int v12 = 0;
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_15:

    id v5 = 0;
  }
    -[SPCSSearchQuery updateCoreSuggestionsSection:]::name = {;
  }
  id v13 = (id)-[SPCSSearchQuery updateCoreSuggestionsSection:]::name;
  int v24 = 0;
  int v12 = 1;
LABEL_18:
  [v25 setTitle:v13];
  if (v12)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v14 = [v25 results];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v19 = [v18 relatedBundleID];
          BOOL v20 = v19 == 0;

          if (!v20)
          {
            uint64_t v21 = (void *)MEMORY[0x263F67470];
            long long v22 = [v18 relatedBundleID];
            BOOL v23 = [v21 displayNameForBundleIdentifer:v22];
            [v18 setFootnote:v23];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v15);
    }
  }
}

- (void)buildPeopleResults:(id)a3 withContacts:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v58 = a4;
  int v55 = v5;
  if ([v5 count])
  {
    uint64_t v6 = [v5 keysSortedByValueUsingComparator:&__block_literal_global_289];
    float v49 = (void *)[v6 mutableCopy];

    uint64_t v7 = [v58 keysSortedByValueUsingComparator:&__block_literal_global_291];
    id v8 = (void *)[v7 mutableCopy];

    int v56 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v58, "count", v8));
    id v50 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v55, "count"));
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obj = v8;
    id v9 = 0;
    uint64_t v10 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v68 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = [v58 objectForKeyedSubscript:*(void *)(*((void *)&v67 + 1) + 8 * i)];
          [v56 addObject:v13];
          if (!v9) {
            id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          }
          uint64_t v14 = [v13 title];
          uint64_t v15 = [v14 text];
          BOOL v16 = v15 == 0;

          if (!v16)
          {
            unint64_t v17 = [v13 title];
            id v18 = [v17 text];
            id v19 = [v18 lowercaseString];
            [v9 addObject:v19];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
      }
      while (v10);
    }

    [(SFMutableResultSection *)self->_bundleIdToResultsMap.contactResultsSection setResults:v56];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v20 = v49;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v21)
    {
      uint64_t v54 = *(void *)v64;
      uint64_t v53 = *MEMORY[0x263F790A0];
      id v51 = v20;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v64 != v54) {
            objc_enumerationMutation(v20);
          }
          BOOL v23 = [v55 objectForKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * j)];
          int v24 = [v23 title];
          id v25 = [v24 text];
          long long v26 = [v25 lowercaseString];

          long long v27 = [v23 sectionBundleIdentifier];
          long long v28 = v27;
          if (v27) {
            int v29 = [v27 isEqual:v53];
          }
          else {
            int v29 = 0;
          }
          long long v30 = [v23 contactIdentifier];
          BOOL v31 = v30 == 0;

          if (v31)
          {
            if ([v9 containsObject:v26]) {
              goto LABEL_35;
            }
          }
          else if ([obj count])
          {
            long long v32 = [v23 contactIdentifier];
            long long v33 = [v58 objectForKeyedSubscript:v32];

            if (v33)
            {
              id v34 = [v23 personIdentifier];
              [v33 setPersonIdentifier:v34];

              uint64_t v35 = [v23 personQueryIdentifier];
              [v33 setPersonQueryIdentifier:v35];

              if (v29) {
                uint64_t v36 = 1;
              }
              else {
                uint64_t v36 = [v33 hasTextContentMatch];
              }
              [v33 setHasTextContentMatch:v36];
              [v23 rankingScore];
              objc_msgSend(v33, "setRankingScore:");
              [v33 setType:37];
              if ([v33 hasTextContentMatch])
              {
                float v41 = (void *)MEMORY[0x263F78E50];
                float v42 = [(SPKQuery *)self queryContext];
                int v43 = [v41 buildResultWithResult:v33 queryContext:v42];

                os_unfair_lock_lock(&self->_suggestionsLock);
                [(NSMutableArray *)self->_suggestionResults addObject:v43];
                os_unfair_lock_unlock(&self->_suggestionsLock);

                id v20 = v51;
              }
            }

            goto LABEL_35;
          }
          [v23 rankingScore];
          if (v37 > 0.0)
          {
            if (v29)
            {
              v38 = (void *)MEMORY[0x263F78E50];
              char v39 = [(SPKQuery *)self queryContext];
              uint64_t v40 = [v38 buildResultWithResult:v23 queryContext:v39];

              os_unfair_lock_lock(&self->_suggestionsLock);
              [(NSMutableArray *)self->_suggestionResults addObject:v40];
              os_unfair_lock_unlock(&self->_suggestionsLock);

              id v20 = v51;
            }
            [v50 addObject:v23];
          }
LABEL_35:
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v21);
    }

    [(SFMutableResultSection *)self->_bundleIdToResultsMap.peopleResultsSection setResults:v50];
    goto LABEL_47;
  }
  if ([v58 count])
  {
    id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v58, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v44 = v58;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v60 != v46) {
            objc_enumerationMutation(v44);
          }
          BOOL v48 = [v44 objectForKeyedSubscript:*(void *)(*((void *)&v59 + 1) + 8 * k)];
          [v20 addObject:v48];
        }
        uint64_t v45 = [v44 countByEnumeratingWithState:&v59 objects:v71 count:16];
      }
      while (v45);
    }

    [(SFMutableResultSection *)self->_bundleIdToResultsMap.contactResultsSection setResults:v20];
LABEL_47:
  }
}

uint64_t __51__SPCSSearchQuery_buildPeopleResults_withContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  [v6 rankingScore];
  double v9 = v8;
  [v7 rankingScore];
  if (v9 <= v10) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = -1;
  }

  return v11;
}

uint64_t __51__SPCSSearchQuery_buildPeopleResults_withContacts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  [v6 rankingScore];
  double v9 = v8;
  [v7 rankingScore];
  if (v9 <= v10) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = -1;
  }

  return v11;
}

- (void)sortResultsInSection:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v21 = a3;
  [MEMORY[0x263F78D58] sortResultsInSection:v21 currentTime:self->_currentTime];
  id v4 = [v21 bundleIdentifier];
  int v5 = [v4 isEqual:*MEMORY[0x263F79028]];

  if (v5)
  {
    id v20 = v21;
    id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [v20 resultSet];
    uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v6)
    {
      int v29 = 0;
      id v7 = 0;
      goto LABEL_34;
    }
    id v7 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v28 = *(void *)v36;
    int v29 = 0;
    while (1)
    {
      uint64_t v8 = 0;
      double v9 = v7;
      do
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
        uint64_t v33 = -1;
        uint64_t v34 = -1;
        uint64_t v31 = -1;
        uint64_t v32 = -1;
        uint64_t v30 = -1;
        uint64_t v11 = [v10 interestingDate];
        int v12 = [v10 compatibilityTitle];
        if (!v11)
        {
          id v7 = v9;
LABEL_29:
          [v23 addObject:v10];
          goto LABEL_30;
        }
        id v13 = [MEMORY[0x263F78DE0] calendar];
        [v13 getEra:0 year:&v34 month:&v33 day:&v32 fromDate:v11];

        uint64_t v14 = [MEMORY[0x263F78DE0] calendar];
        [v14 getEra:0 yearForWeekOfYear:0 weekOfYear:&v30 weekday:&v31 fromDate:v11];

        uint64_t v15 = [v10 domainIdentifier];
        id v7 = (void *)v15;
        BOOL v16 = 0;
        if (v12 && v15)
        {
          if ([v9 isEqualToString:v15]
            && [v29 isEqualToString:v12])
          {
            BOOL v16 = v31 == v26 || v32 == v27;
            if (v34 == v25 && v33 == v24 && (v32 == v27 - 1 || v32 == v27 + 1)) {
              BOOL v16 = 1;
            }
          }
          else
          {
            BOOL v16 = 0;
          }
        }
        id v19 = v12;

        uint64_t v26 = v31;
        uint64_t v27 = v32;
        int v29 = v19;
        uint64_t v24 = v33;
        uint64_t v25 = v34;
        if (!v16) {
          goto LABEL_29;
        }
LABEL_30:

        ++v8;
        double v9 = v7;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (!v6)
      {
LABEL_34:

        [v20 clearResults];
        [v20 addResultsFromArray:v23];

        break;
      }
    }
  }
}

- (void)processUserActivitiesForSection:(id)a3
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v90 = a3;
  id v91 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v89 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v3 = [v90 results];
  id v4 = (void *)[v3 copy];

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v110 objects:v120 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v111;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v111 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v110 + 1) + 8 * i);
        double v9 = [v8 externalIdentifier];
        if (!v9)
        {
          double v10 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            unint64_t v119 = v8;
            _os_log_error_impl(&dword_235D0B000, v10, OS_LOG_TYPE_ERROR, "result missing identifier %@", buf, 0xCu);
          }
        }
        uint64_t v11 = [v8 userActivityRequiredString];
        if (v9) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 0;
        }
        int v13 = v12;

        if (v13)
        {
          [v91 setObject:v8 forKey:v9];
          uint64_t v14 = [v8 compatibilityTitle];
          if (v14) {
            [v89 addObject:v14];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v110 objects:v120 count:16];
    }
    while (v5);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v15 = obj;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v106 objects:v117 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v107;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v107 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(void **)(*((void *)&v106 + 1) + 8 * j);
        id v20 = [v19 relatedUniqueIdentifier];
        if (v20)
        {
          id v21 = [v19 userActivityRequiredString];
          BOOL v22 = v21 == 0;

          if (v22)
          {
            id v23 = [v91 objectForKey:v20];
            BOOL v24 = v23 == 0;

            if (v24)
            {
              [v91 setObject:v19 forKey:v20];
              uint64_t v25 = [v19 compatibilityTitle];
              if (v25) {
                [v89 addObject:v25];
              }
            }
          }
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v106 objects:v117 count:16];
    }
    while (v16);
  }

  id v85 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v87 = v15;
  uint64_t v26 = [v87 countByEnumeratingWithState:&v102 objects:v116 count:16];
  if (v26)
  {
    uint64_t v92 = *(void *)v103;
    do
    {
      uint64_t v93 = v26;
      for (uint64_t k = 0; k != v93; ++k)
      {
        if (*(void *)v103 != v92) {
          objc_enumerationMutation(v87);
        }
        uint64_t v28 = *(void **)(*((void *)&v102 + 1) + 8 * k);
        int v29 = objc_msgSend(v28, "compatibilityTitle", v85);
        if (!v29 && ([v28 hasDetail] & 1) == 0)
        {
          uint64_t v30 = [v28 sectionBundleIdentifier];
          int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();
          if (IsSyndicatedPhotos
            && ([v28 contentType],
                id v86 = objc_claimAutoreleasedReturnValue(),
                ![v86 isEqualToString:@"public.item"]))
          {
          }
          else
          {
            uint64_t v32 = [v28 identifier];
            char v33 = [v32 hasPrefix:@"synthetic-bookmark-"];

            if (IsSyndicatedPhotos) {
            if ((v33 & 1) == 0)
            }
            {
              [v90 removeResults:v28];
              goto LABEL_68;
            }
          }
        }
        uint64_t v34 = [v28 userActivityRequiredString];
        BOOL v35 = v34 == 0;

        if (!v35)
        {
          long long v36 = [v28 relatedUniqueIdentifier];
          if (v36)
          {
            long long v37 = [v28 fileProviderIdentifier];
            BOOL v38 = v37 == 0;

            if (v38)
            {
              char v39 = [v91 objectForKey:v36];
              uint64_t v40 = v39;
              if (v39)
              {
                uint64_t v41 = [v39 score];
                unint64_t v43 = v42;
                uint64_t v44 = [v28 score];
                objc_msgSend(v40, "setScore:", __PAIR128__(v45, v44) + __PAIR128__(v43, v41));
                [v90 removeResults:v28];
                if (([v40 hasAssociatedUserActivity] & 1) == 0)
                {
                  objc_msgSend(v40, "setPubliclyIndexable:", objc_msgSend(v28, "publiclyIndexable"));
                  [v40 setHasAssociatedUserActivity:1];
                  uint64_t v46 = [v28 launchDates];
                  [v40 setLaunchDates:v46];
                  goto LABEL_65;
                }
              }
              else
              {
                id v47 = [v85 objectForKey:v36];
                uint64_t v46 = v47;
                if (v47)
                {
                  uint64_t v48 = [v47 score];
                  unint64_t v50 = v49;
                  uint64_t v51 = [v28 score];
                  uint64_t v52 = v51;
                  unint64_t v54 = v53;
                  if (__PAIR128__(v53, v51) >= __PAIR128__(v50, v48))
                  {
                    uint64_t v57 = [v28 buddyScore];
                    objc_msgSend(v28, "setBuddyScore:", __PAIR128__(v58, v57) + __PAIR128__(v50, v48));
                    [v90 removeResults:v46];
                    [v85 setObject:v28 forKey:v36];
                  }
                  else
                  {
                    uint64_t v55 = [v46 buddyScore];
                    objc_msgSend(v46, "setBuddyScore:", __PAIR128__(v56, v55) + __PAIR128__(v54, v52));
                    [v90 removeResults:v28];
                  }
                }
                else
                {
                  [v85 setObject:v28 forKey:v36];
                }
LABEL_65:
              }
            }
          }
          else if (v29)
          {
            if ([v89 containsObject:v29] && (objc_msgSend(v28, "hasDetail") & 1) == 0) {
              [v90 removeResults:v28];
            }
            else {
              [v89 addObject:v29];
            }
          }
        }
LABEL_68:
      }
      uint64_t v26 = [v87 countByEnumeratingWithState:&v102 objects:v116 count:16];
    }
    while (v26);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v59 = [v90 resultSet];
  uint64_t v60 = [v59 countByEnumeratingWithState:&v98 objects:v115 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v99;
    do
    {
      for (uint64_t m = 0; m != v60; ++m)
      {
        if (*(void *)v99 != v61) {
          objc_enumerationMutation(v59);
        }
        long long v63 = *(void **)(*((void *)&v98 + 1) + 8 * m);
        uint64_t v64 = objc_msgSend(v63, "score", v85);
        unint64_t v66 = v65;
        uint64_t v67 = [v63 buddyScore];
        objc_msgSend(v63, "setScore:", __PAIR128__(v68, v67) + __PAIR128__(v66, v64));
      }
      uint64_t v60 = [v59 countByEnumeratingWithState:&v98 objects:v115 count:16];
    }
    while (v60);
  }

  id v69 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v70 = v87;
  uint64_t v71 = [v70 countByEnumeratingWithState:&v94 objects:v114 count:16];
  if (v71)
  {
    uint64_t v72 = *(void *)v95;
    do
    {
      for (uint64_t n = 0; n != v71; ++n)
      {
        if (*(void *)v95 != v72) {
          objc_enumerationMutation(v70);
        }
        uint64_t v74 = *(void **)(*((void *)&v94 + 1) + 8 * n);
        uint64_t v75 = objc_msgSend(v74, "itemIdentifier", v85);
        BOOL v76 = v75 == 0;

        if (!v76)
        {
          uint64_t v77 = [v74 itemIdentifier];
          uint64_t v78 = [v69 objectForKey:v77];

          if (v78)
          {
            uint64_t v79 = [v78 score];
            unint64_t v81 = v80;
            uint64_t v82 = [v74 score];
            if (__PAIR128__(v83, v82) < __PAIR128__(v81, v79))
            {
              [v90 removeResults:v74];
LABEL_88:

              continue;
            }
            [v90 removeResults:v78];
          }
          uint64_t v84 = [v74 itemIdentifier];
          [v69 setObject:v74 forKey:v84];

          goto LABEL_88;
        }
      }
      uint64_t v71 = [v70 countByEnumeratingWithState:&v94 objects:v114 count:16];
    }
    while (v71);
  }
}

- (void)removeDuplicatesInSection:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v64 = a3;
  uint64_t v5 = [v64 results];
  uint64_t v61 = self;
  uint64_t v6 = (void *)[v5 copy];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (v8)
  {
    uint64_t v3 = buf;
    uint64_t v9 = *(void *)v75;
    double v10 = (unsigned char *)MEMORY[0x263F67540];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v75 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v12 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        int v13 = [v12 sectionBundleIdentifier];
        uint64_t v14 = [v12 externalIdentifier];
        if (v14)
        {
          if ([v7 containsObject:v14])
          {
            [v64 removeResults:v12];
            id v15 = SPLogForSPLogCategoryQuery();
            os_log_type_t v16 = 2 * (*v10 == 0);
            if (os_log_type_enabled(v15, v16))
            {
              *(_DWORD *)long long buf = 138412546;
              unint64_t v81 = v13;
              __int16 v82 = 2112;
              unint64_t v83 = v14;
              _os_log_impl(&dword_235D0B000, v15, v16, "Remove duplicate for %@ / %@", buf, 0x16u);
            }
          }
          else
          {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v8);
  }

  uint64_t v17 = [(SPKQuery *)v61 queryContext];
  id v18 = (__CFString *)[v17 queryKind];
  id v19 = [(SPKQuery *)v61 delegate];
  id v20 = [v19 clientBundleID];
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken != -1) {
    dispatch_once(&SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::onceToken, &__block_literal_global_666);
  }
  if (SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolDebugMode) {
    goto LABEL_17;
  }
  if (!SPQueryKindIsSearchToolSearch(SPQueryKind,NSString *)::isSearchToolRanking)
  {
    char v60 = 0;
    goto LABEL_19;
  }
  if (([v20 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v20 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
LABEL_17:
    char v21 = 1;
  }
  else
  {
    char v30 = [v20 hasPrefix:@"com.apple.ondeviceeval"];
    if (v18 == (__CFString *)12) {
      char v21 = 1;
    }
    else {
      char v21 = v30;
    }
  }
  char v60 = v21;
LABEL_19:

  if (v60) {
    goto LABEL_61;
  }
  BOOL v22 = [v64 bundleIdentifier];
  int v23 = [v22 isEqualToString:*MEMORY[0x263F78F28]];

  if (v23)
  {
    [v7 removeAllObjects];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v62 = obj;
    uint64_t v24 = [v62 countByEnumeratingWithState:&v70 objects:v79 count:16];
    if (v24)
    {
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v71;
      id v18 = @"attachmentDomain";
      while (1)
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v71 != v26) {
            objc_enumerationMutation(v62);
          }
          uint64_t v3 = *(void **)(*((void *)&v70 + 1) + 8 * j);
          uint64_t v28 = [v3 domainIdentifier];

          int v29 = [v28 isEqualToString:@"attachmentDomain"];
          if ((v29 | [v28 isEqualToString:@"chatDomain"]) == 1)
          {
            uint64_t v25 = [v3 accountIdentifier];

            if (!v25) {
              continue;
            }
          }
          else
          {
            uint64_t v25 = v28;
            if (!v28) {
              continue;
            }
          }
          if ([v7 containsObject:v25]) {
            [v64 removeResults:v3];
          }
          else {
            [v7 addObject:v25];
          }
        }
        uint64_t v24 = [v62 countByEnumeratingWithState:&v70 objects:v79 count:16];
        if (!v24)
        {

          goto LABEL_44;
        }
      }
    }
    uint64_t v25 = v62;
LABEL_44:
  }
  id v20 = [v64 bundleIdentifier];
  int v31 = [v20 isEqualToString:*MEMORY[0x263F78FB8]];

  if (!v31) {
    goto LABEL_61;
  }
  [v7 removeAllObjects];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v32 = obj;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (!v33) {
    goto LABEL_60;
  }
  id v18 = *(__CFString **)v67;
  do
  {
    for (uint64_t k = 0; k != v33; ++k)
    {
      if (*(__CFString **)v67 != v18) {
        objc_enumerationMutation(v32);
      }
      id v20 = *(id *)(*((void *)&v66 + 1) + 8 * k);
      uint64_t v3 = [v20 stringForDedupe];
      if (v3)
      {
        BOOL v35 = [v20 domainIdentifier];
        if ([v35 isEqualToString:@"com.apple.siri.interactions"])
        {
        }
        else
        {
          long long v36 = [v20 domainIdentifier];
          int v37 = [v36 isEqualToString:@"com.apple.siri.upcomingmedia"];

          if (!v37) {
            continue;
          }
        }
        BOOL v38 = [v20 stringForDedupe];
        int v39 = [v7 containsObject:v38];

        if (v39)
        {
          [v64 removeResults:v20];
        }
        else
        {
          uint64_t v40 = [v20 stringForDedupe];
          [v7 addObject:v40];
        }
      }
    }
    uint64_t v33 = [v32 countByEnumeratingWithState:&v66 objects:v78 count:16];
  }
  while (v33);
LABEL_60:

LABEL_61:
  if (SSEnableSpotlightTopHitPersonalizedRanking())
  {
    uint64_t v41 = [(SPKQuery *)v61 queryContext];
    unint64_t v42 = [v41 searchEntities];
    uint64_t v43 = [v42 count];
    if (v43)
    {
      id v18 = [(SPKQuery *)v61 queryContext];
      uint64_t v3 = [(__CFString *)v18 searchEntities];
      id v20 = [v3 lastObject];
      if ([v20 isScopedSearch])
      {
        unsigned int v59 = 1;
        goto LABEL_66;
      }
    }
    uint64_t v44 = [(SPKQuery *)v61 queryContext];
    unsigned int v59 = [v44 isAdvancedSyntax];

    if (v43)
    {
LABEL_66:
    }
    uint64_t v57 = (void *)MEMORY[0x263F78D58];
    long long v63 = [(SPKQuery *)v61 userQueryString];
    unint64_t v58 = [(SPKQuery *)v61 queryContext];
    uint64_t v45 = [v58 queryIdent];
    uint64_t v46 = [(SPKQuery *)v61 queryContext];
    id v47 = [v46 searchEntities];
    uint64_t v48 = [v47 count];
    unint64_t v49 = [(SPKQuery *)v61 queryContext];
    [v49 currentTime];
    double v51 = v50;
    uint64_t v52 = [(SPKQuery *)v61 queryContext];
    uint64_t v53 = [v52 queryKind];
    unint64_t v54 = [(SPKQuery *)v61 delegate];
    uint64_t v55 = [v54 clientBundleID];
    LOBYTE(v56) = v60;
    [v57 thresholdResultsInSection:v64 userQuery:v63 queryID:v45 isEntitiesSearch:v48 != 0 currentTime:v59 isScopedSearch:v53 queryKind:v51 clientBundleID:v55 isSearchToolClient:v56];
  }
}

- (void)processSection:(id)a3
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v122 = a3;
  long long v105 = [(SPKQuery *)self userQueryString];
  id v4 = self;
  uint64_t v6 = *(void *)self->_topHitThreshold;
  uint64_t v5 = *(void *)&self->_topHitThreshold[8];
  long long v109 = v4;
  BOOL isPeopleSearch = v4->_isPeopleSearch;
  uint64_t v8 = SPMaxVisibleResultsCountPerSection();
  uint64_t v9 = [v122 bundleIdentifier];
  int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

  uint64_t v11 = 50;
  if (!IsSyndicatedPhotos) {
    uint64_t v11 = v8;
  }
  char v12 = IsSyndicatedPhotos ^ 1;
  if (isPeopleSearch) {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    if (SSSnippetModernizationEnabled() && v109->_isPhotosSearch) {
      uint64_t v11 = 50;
    }
    else {
      uint64_t v11 = 20;
    }
  }
  if (isPeopleSearch) {
    uint64_t v11 = 50;
  }
  if (v11 <= 0) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = v11;
  }
  [v122 setMaxInitiallyVisibleResults:v13];
  uint64_t v14 = (void *)MEMORY[0x263F67470];
  id v15 = [v122 bundleIdentifier];
  uint64_t v16 = [v14 displayNameForBundleIdentifer:v15];

  long long v104 = (void *)v16;
  if (v16) {
    [v122 setTitle:v16];
  }
  uint64_t v17 = [v122 bundleIdentifier];
  int v18 = [v17 isEqualToString:@"com.apple.CoreSuggestions"];

  if (v18) {
    [(SPCSSearchQuery *)v109 updateCoreSuggestionsSection:v122];
  }
  id v19 = [v122 title];

  if (!v19)
  {
    [v122 setTitle:@"?"];
    [v122 setResults:MEMORY[0x263EFFA68]];
  }
  id v20 = [v122 bundleIdentifier];
  int v21 = [v20 isEqual:@"com.apple.mobilesafari"];

  int v103 = v21;
  if (v21)
  {
    EvaluatorWithBlocuint64_t k = _MDCreateSimpleQueryEvaluatorWithBlock();
    if (EvaluatorWithBlock) {
      _MDSimpleQuerySetWidcardAttributes();
    }
    id v112 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v110 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v108 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v115 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v113 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    int v23 = [v122 resultSet];
    uint64_t v107 = EvaluatorWithBlock;
    id obj = v23;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v127 objects:v135 count:16];
    if (v24)
    {
      uint64_t v121 = *(void *)v128;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v128 != v121) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v27 = [v26 contentURL];
            if (v27)
            {
              uint64_t v28 = [v26 title];
              int v29 = [v28 text];
              BOOL v30 = v29 == 0;

              if (!v30)
              {
                int v31 = NSURL;
                id v32 = [v26 contentURL];
                uint64_t v33 = [v31 URLWithString:v32];

                if (!v33) {
                  goto LABEL_66;
                }
                uint64_t v34 = [MEMORY[0x263F08BA0] componentsWithURL:v33 resolvingAgainstBaseURL:1];
                BOOL v35 = v34;
                if (!v34) {
                  goto LABEL_65;
                }
                [v34 setQuery:0];
                [v35 setFragment:0];
                double v117 = [v35 string];
                objc_msgSend(v115, "objectForKey:");
                id v119 = (id)objc_claimAutoreleasedReturnValue();
                long long v36 = [v26 title];
                int v37 = [v36 text];
                id v118 = [v119 objectForKey:v37];

                if (v118)
                {
                  BOOL v38 = [v118 contentURL];
                  unint64_t v39 = [v38 length];
                  uint64_t v40 = [v26 contentURL];
                  LOBYTE(v39) = v39 > [v40 length];

                  if (v39)
                  {
                    [v113 addObject:v118];
                    __int16 v116 = [v26 title];
                    uint64_t v41 = [v116 text];
                    [v119 setObject:v26 forKey:v41];
                    goto LABEL_63;
                  }
                  [v113 addObject:v26];
LABEL_64:

LABEL_65:
LABEL_66:

                  continue;
                }
                if (!v119)
                {
                  id v119 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                  [v115 setObject:v119 forKey:v117];
                }
                unint64_t v42 = [v26 title];
                uint64_t v43 = [v42 text];
                [v119 setObject:v26 forKey:v43];

                [v35 setPath:@"/"];
                __int16 v116 = [v35 URL];
                uint64_t v44 = [v116 host];
                id v114 = (void *)v44;
                uint64_t v45 = [v116 scheme];
                if (v45) {
                  BOOL v46 = v44 == 0;
                }
                else {
                  BOOL v46 = 1;
                }
                char v47 = v46;

                if (v47)
                {
LABEL_46:
                  uint64_t v41 = v114;
                }
                else
                {
                  uint64_t v48 = [v116 scheme];
                  uint64_t v111 = [v48 caseInsensitiveCompare:@"https"];

                  uint64_t v41 = v114;
                  if ([v116 isEqual:v33])
                  {
                    [v112 addObject:v114];
                    [v110 removeObjectForKey:v114];
                    [v108 removeObject:v114];
                  }
                  else if (([v112 containsObject:v114] & 1) == 0)
                  {
                    unint64_t v49 = [v110 objectForKeyedSubscript:v114];
                    if (v49)
                    {
                      char v50 = [v108 containsObject:v114];
                      if (v111) {
                        char v51 = 1;
                      }
                      else {
                        char v51 = v50;
                      }

                      char v52 = (v107 == 0) | v51;
                      uint64_t v41 = v114;
                      if (v52) {
                        goto LABEL_63;
                      }
                    }
                    else if (!v107)
                    {
                      goto LABEL_63;
                    }
                    if (_MDSimpleQueryObjectMatches())
                    {
                      uint64_t v53 = [v26 title];
                      unint64_t v54 = [v53 text];
                      BOOL v55 = _MDStringPrefixOfString() == -1;

                      if (v55)
                      {
                        long long v106 = objc_opt_new();
                        long long v102 = objc_opt_new();
                        long long v100 = objc_opt_new();
                        [v100 setBundleIdentifier:@"com.apple.mobilesafari"];
                        [v102 setThumbnail:v100];
                        uint64_t v56 = [MEMORY[0x263F679F0] textWithString:v114];
                        [v102 setTitle:v56];

                        uint64_t v57 = [MEMORY[0x263F679B0] punchoutWithURL:v116];
                        long long v134 = v57;
                        unint64_t v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v134 count:1];
                        [v102 setPunchoutOptions:v58];

                        unsigned int v59 = [MEMORY[0x263F679F0] textWithString:v114];
                        long long v133 = v59;
                        char v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v133 count:1];
                        [v102 setDescriptions:v60];

                        uint64_t v61 = objc_opt_new();
                        [v106 setInlineCard:v61];

                        long long v132 = v102;
                        id v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v132 count:1];
                        long long v63 = [v106 inlineCard];
                        [v63 setCardSections:v62];

                        long long v101 = [v116 absoluteString];
                        objc_msgSend(v106, "setContentURL:");
                        objc_msgSend(v106, "setTopHit:", objc_msgSend(v26, "topHit"));
                        objc_msgSend(v106, "setForceNoTopHit:", objc_msgSend(v26, "forceNoTopHit"));
                        uint64_t v64 = [v26 score];
                        objc_msgSend(v106, "setScore:", v64, v65);
                        long long v66 = [v26 protectionClass];
                        [v106 setProtectionClass:v66];

                        [v26 rankingScore];
                        objc_msgSend(v106, "setRankingScore:");
                        long long v67 = [v26 applicationBundleIdentifier];
                        [v106 setApplicationBundleIdentifier:v67];

                        long long v68 = [v26 sectionBundleIdentifier];
                        [v106 setSectionBundleIdentifier:v68];

                        long long v69 = [v26 resultBundleId];
                        [v106 setResultBundleId:v69];

                        objc_msgSend(v106, "setType:", objc_msgSend(v26, "type"));
                        objc_msgSend(v106, "setQueryId:", objc_msgSend(v26, "queryId"));
                        [v106 setCompletedQuery:v114];
                        [v106 setCompletion:v114];
                        long long v70 = [v26 identifier];
                        long long v71 = [@"synthetic-bookmark-" stringByAppendingString:v70];
                        [v106 setIdentifier:v71];

                        long long v72 = [v26 rankingItem];
                        [v72 attributes];
                        uint64_t v73 = SSCompactRankingAttrsCopy();

                        SSCompactRankingAttrsUpdateValue();
                        SSCompactRankingAttrsUpdateValue();
                        SSCompactRankingAttrsUpdateValue();
                        long long v74 = (void *)[objc_alloc(MEMORY[0x263F78D48]) initWithAttrs:v73];
                        [v106 setRankingItem:v74];

                        long long v75 = [v26 rankingItem];
                        long long v76 = [v75 L2FeatureVector];
                        [v76 originalL2Score];
                        int v78 = v77;
                        uint64_t v79 = [v106 rankingItem];
                        unint64_t v80 = [v79 L2FeatureVector];
                        LODWORD(v81) = v78;
                        [v80 setOriginalL2Score:v81];

                        [v110 setObject:v106 forKey:v114];
                        if (!v111) {
                          [v108 addObject:v114];
                        }
                      }
                      goto LABEL_46;
                    }
                  }
                }
LABEL_63:

                goto LABEL_64;
              }
            }
          }
        }
        int v23 = obj;
        uint64_t v24 = [obj countByEnumeratingWithState:&v127 objects:v135 count:16];
      }
      while (v24);
    }

    if (v107) {
      _MDSimpleQueryDeallocate();
    }
    if ([v110 count])
    {
      __int16 v82 = [v110 allValues];
      unint64_t v83 = [v122 resultSet];
      [v83 addObjectsFromArray:v82];
    }
    uint64_t v84 = [v122 resultSet];
    [v84 minusSet:v113];
  }
  int v85 = SSEnableSpotlightTopHitPersonalizedRanking();
  if (v85)
  {
    id v86 = [v122 bundleIdentifier];
  }
  else
  {
    char v87 = 0;
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v88 = [v122 resultSet];
  uint64_t v89 = [v88 countByEnumeratingWithState:&v123 objects:v131 count:16];
  if (v89)
  {
    uint64_t v90 = *(void *)v124;
    do
    {
      for (uint64_t j = 0; j != v89; ++j)
      {
        if (*(void *)v124 != v90) {
          objc_enumerationMutation(v88);
        }
        uint64_t v92 = *(void **)(*((void *)&v123 + 1) + 8 * j);
        uint64_t v93 = [v92 score];
        if (v93 & v6 | v94 & v5) {
          char v95 = v87;
        }
        else {
          char v95 = 1;
        }
        if ((v95 & 1) == 0 && [v92 topHit] != 2) {
          [v92 setTopHit:SSSetTopHitWithReasonType()];
        }
        long long v96 = [v122 bundleIdentifier];
        [v92 setSectionBundleIdentifier:v96];
      }
      uint64_t v89 = [v88 countByEnumeratingWithState:&v123 objects:v131 count:16];
    }
    while (v89);
  }

  id v97 = v122;
  if (((v85 | v103 ^ 1) & 1) == 0)
  {
    long long v98 = (void *)MEMORY[0x263F78E28];
    long long v99 = [(SPKQuery *)v109 userQueryString];
    [v98 determineTopHitsForSafariSection:v122 forQuery:v99];

    id v97 = v122;
    [MEMORY[0x263F78E28] moveSafariTopHitsToTopOfSection:v122];
  }
  [(SPCSSearchQuery *)v109 sortResultsInSection:v97];
  [(SPCSSearchQuery *)v109 processUserActivitiesForSection:v97];
  [(SPCSSearchQuery *)v109 removeDuplicatesInSection:v97];
}

CFTypeRef __34__SPCSSearchQuery_processSection___block_invoke(uint64_t a1, const void *a2, void *a3)
{
  id v4 = a3;
  if (([v4 isEqualToString:@"_ModifiedHostName_"] & 1) != 0
    || [v4 isEqualToString:@"kMDItemDisplayName"])
  {
    CFTypeRef v5 = CFRetain(a2);
  }
  else
  {
    CFTypeRef v5 = 0;
  }

  return v5;
}

- (void)rankAndSendResultsWithResponseKind:(int)a3 withResultSections:(id)a4 withResultSets:(id)a5 withiCloudDriveSection:(id)a6 withMailResultSet:(id)a7
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v84 = a4;
  id v83 = a5;
  id v85 = a6;
  id v11 = a7;
  val = self;
  unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_queryCanceled);
  if (v12) {
    goto LABEL_74;
  }
  id v81 = v11;
  uint64_t v13 = SPLogForSPLogCategoryRanking();
  uint64_t v14 = [(SPKQuery *)self queryContext];
  os_signpost_id_t v15 = [v14 queryIdent];

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SPCSSearchQuery.rankAndSend", (const char *)&unk_235D61671, buf, 2u);
  }

  uint64_t v16 = [v84 count];
  if (v16 != [v83 count]) {
    __assert_rtn("-[SPCSSearchQuery rankAndSendResultsWithResponseKind:withResultSections:withResultSets:withiCloudDriveSection:withMailResultSet:]", "SPCSSearchQuery.mm", 2819, "resultSections.count == resultSets.count");
  }
  double v97 = 0.0;
  int v78 = [(SPCSSearchQuery *)self prepareRankingItems:v84 withResultSets:v83 totalFeatureComputationTime:&v97];
  __uint64_t v17 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if ([(NSArray *)self->_resultAttrs containsObject:*MEMORY[0x263F02688]])
  {
    uint64_t v18 = 1;
  }
  else
  {
    id v19 = [(CSSearchQuery *)self->_csQuery queryContext];
    uint64_t v18 = [v19 fetchl2Signals];
  }
  id v20 = [(CSSearchQuery *)self->_csQuery queryContext];
  [v20 queryID];

  int v21 = [(SPCSSearchQuery *)self itemRanker];
  char v22 = *((unsigned char *)self + 448);
  SPL2Threshold();
  objc_msgSend(v21, "updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:", v78, v22 & 1, 0, 0, v18);

  long long v76 = [(SPKQuery *)val delegate];
  int v23 = (void *)[v76 queryIdent];
  int v77 = [v76 clientBundleID];
  uint64_t v79 = (void *)[objc_alloc(MEMORY[0x263F67808]) initWithEvent:@"com.apple.spotlight.feature.extraction" timeInterval:0 queryId:v23];
  unint64_t v80 = (void *)[objc_alloc(MEMORY[0x263F67808]) initWithEvent:@"com.apple.spotlight.indomain.score.computation" timeInterval:0 queryId:v23];
  [v80 setNanosecondInterval:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v17];
  [v79 setNanosecondInterval:(unint64_t)(v97 * 1000000000.0)];
  id location = 0;
  objc_initWeak(&location, val);
  objc_copyWeak(v95, &location);
  id v74 = v79;
  uint64_t v92 = v74;
  v95[1] = v23;
  id v72 = v77;
  uint64_t v93 = v72;
  id v75 = v80;
  uint64_t v94 = v75;
  md_tracing_dispatch_async_propagating();
  if (v81) {
    -[SPCSSearchQuery updateMailAttachmentResults:](val, "updateMailAttachmentResults:", v81, v72, v74, v75);
  }
  -[SPCSSearchQuery buildFullSearchResults:withResultSets:](val, "buildFullSearchResults:withResultSets:", v84, v83, v72);
  if (v85)
  {
    id v24 = v85;
    id v91 = [MEMORY[0x263EFF9A0] dictionary];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    uint64_t v25 = [v24 resultSet];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v106 objects:buf count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v107 != v27) {
            objc_enumerationMutation(v25);
          }
          int v29 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          BOOL v30 = [v29 documentIdentifier];
          if (v30) {
            [v91 setObject:v29 forKeyedSubscript:v30];
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v106 objects:buf count:16];
      }
      while (v26);
    }
  }
  else
  {
    id v91 = 0;
  }
  if ((a3 & 0xFFFFFFFE) != 2)
  {
    BOOL isPhotosSearch = val->_isPhotosSearch;
    id v89 = v84;
    if (isPhotosSearch)
    {
LABEL_26:
LABEL_41:
      id v44 = (id)*v33;
      id v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v89, "count"));
      long long v101 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v98 = 0u;
      id v45 = v89;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v98 objects:&v106 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v99;
        do
        {
          for (uint64_t j = 0; j != v46; ++j)
          {
            if (*(void *)v99 != v47) {
              objc_enumerationMutation(v45);
            }
            unint64_t v49 = *(void **)(*((void *)&v98 + 1) + 8 * j);
            char v50 = [v49 bundleIdentifier];
            char v51 = [v44 containsObject:v50];

            if ((v51 & 1) == 0) {
              [v31 addObject:v49];
            }
          }
          uint64_t v46 = [v45 countByEnumeratingWithState:&v98 objects:&v106 count:16];
        }
        while (v46);
      }

      goto LABEL_51;
    }
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v34 = v89;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v102 objects:buf count:16];
    if (v35)
    {
      uint64_t v36 = 0;
      uint64_t v37 = *(void *)v103;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v103 != v37) {
            objc_enumerationMutation(v34);
          }
          unint64_t v39 = *(void **)(*((void *)&v102 + 1) + 8 * k);
          uint64_t v41 = [v39 bundleIdentifier];
          if ([v40 containsObject:v41])
          {
            unint64_t v42 = [v39 results];
            BOOL v43 = [v42 count] != 0;

            v36 += v43;
          }
          else
          {
          }
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v102 objects:buf count:16];
      }
      while (v35);

      if (v36 == 1) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    goto LABEL_41;
  }
  id v31 = v84;
LABEL_51:
  uint64_t v88 = v31;
  uint64_t v87 = [v31 count];
  if (v87)
  {
    for (uint64_t m = 0; m != v87; ++m)
    {
      uint64_t v53 = [v31 objectAtIndexedSubscript:m];
      unint64_t v54 = [v53 results];
      BOOL v55 = [v54 count] == 0;

      if (!v55) {
        [(SPCSSearchQuery *)val processSection:v53];
      }

      id v31 = v88;
    }
    if (v85)
    {
      for (uint64_t n = 0; n != v87; ++n)
      {
        id v57 = [v31 objectAtIndexedSubscript:n];
        id v58 = v85;
        id v59 = v91;
        uint64_t v90 = v57;
        if (v57 != v58)
        {
          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          char v60 = [v57 resultSet];
          uint64_t v61 = [v60 countByEnumeratingWithState:&v106 objects:buf count:16];
          if (v61)
          {
            uint64_t v62 = *(void *)v107;
            do
            {
              for (iuint64_t i = 0; ii != v61; ++ii)
              {
                if (*(void *)v107 != v62) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v64 = [*(id *)(*((void *)&v106 + 1) + 8 * ii) documentIdentifier];
                uint64_t v65 = [v59 objectForKeyedSubscript:v64];
                if (v65)
                {
                  [v58 removeResults:v65];
                }
              }
              uint64_t v61 = [v60 countByEnumeratingWithState:&v106 objects:buf count:16];
            }
            while (v61);
          }
        }
        id v31 = v88;
      }
    }
  }
  long long v66 = objc_msgSend(objc_alloc(MEMORY[0x263F78D80]), "initWithQueryID:kind:sections:", -[SPKQuery queryGroupId](val, "queryGroupId"), a3, v31);
  long long v67 = [(SPKQuery *)val userQueryString];
  [v66 setUserQueryString:v67];

  os_unfair_lock_lock(&val->_suggestionsLock);
  long long v68 = (void *)[(NSMutableArray *)val->_suggestionResults copy];
  [v66 setLocalSuggestionResults:v68];

  os_unfair_lock_unlock(&val->_suggestionsLock);
  [(SPCSSearchQuery *)val _sendResponse:v66];
  long long v69 = SPLogForSPLogCategoryRanking();
  long long v70 = [(SPKQuery *)val queryContext];
  os_signpost_id_t v71 = [v70 queryIdent];

  if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_235D0B000, v69, OS_SIGNPOST_INTERVAL_END, v71, "SPCSSearchQuery.rankAndSend", (const char *)&unk_235D61671, buf, 2u);
  }

  objc_destroyWeak(v95);
  objc_destroyWeak(&location);

  id v11 = v81;
LABEL_74:
}

void __129__SPCSSearchQuery_rankAndSendResultsWithResponseKind_withResultSections_withResultSets_withiCloudDriveSection_withMailResultSet___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [MEMORY[0x263F674B0] sharedProxy];
    [v3 sendFeedbackType:21 feedback:*(void *)(a1 + 32) queryId:*(void *)(a1 + 64) clientID:*(void *)(a1 + 40)];

    id v4 = [MEMORY[0x263F674B0] sharedProxy];
    [v4 sendFeedbackType:21 feedback:*(void *)(a1 + 48) queryId:*(void *)(a1 + 64) clientID:*(void *)(a1 + 40)];

    id WeakRetained = v5;
  }
}

- (void)sendResponseWithKind:(int)a3
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_queryCanceled);
  if (v3) {
    return;
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v6 = self->_foundBundleIDs;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v97 objects:v102 count:16];
  val = self;
  unsigned int v71 = a3;
  if (!v7)
  {
    unsigned int v8 = a3 & 0xFFFFFFFE;
LABEL_23:

    [(SPCSSearchQuery *)val constructResultsForResponse:v8 == 2];
    unsigned __int8 v20 = atomic_load((unsigned __int8 *)&val->_queryCanceled);
    if (v20) {
      return;
    }
    if (v8 != 2)
    {
      int v21 = (NSString *)*MEMORY[0x263F79060];
      id obja = (id)objc_claimAutoreleasedReturnValue();
      v23 = char v22 = (NSString *)*MEMORY[0x263F790E8];
      [obja unionOrderedSet:v23];

      id objb = (id)objc_claimAutoreleasedReturnValue();
      v25 = id v24 = (NSString *)*MEMORY[0x263F790F0];
      [objb unionOrderedSet:v25];

      id objc = (id)objc_claimAutoreleasedReturnValue();
      v27 = uint64_t v26 = (NSString *)*MEMORY[0x263F790D8];
      [objc unionOrderedSet:v27];
      uint64_t v28 = ;
      [v28 removeAllObjects];
      int v29 = ;
      [v29 removeAllObjects];
      BOOL v30 = ;
      [v30 removeAllObjects];
    }
    p_bundleIdToResultsMap = (_anonymous_namespace_::BundleIdToResultMap *)&val->_bundleIdToResultsMap;
    id obj = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:val->_bundleIdToResultsMap.map.__table_.__p2_.__value_];
    id v75 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:val->_bundleIdToResultsMap.map.__table_.__p2_.__value_];
    long long v69 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:val->_bundleIdToResultsMap.map.__table_.__p2_.__value_];
    next = (id *)val->_bundleIdToResultsMap.map.__table_.__p1_.__value_.__next_;
    if (!next)
    {
      uint64_t v73 = 0;
      id v74 = 0;
      char v33 = 0;
LABEL_51:
      uint64_t v47 = obj;
      if ([(NSMutableDictionary *)obj count])
      {
        if (v8 == 2)
        {
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v48 = v70;
          uint64_t v49 = [v48 countByEnumeratingWithState:&v93 objects:v101 count:16];
          if (v49)
          {
            uint64_t v50 = *(void *)v94;
            do
            {
              for (uint64_t i = 0; i != v49; ++i)
              {
                if (*(void *)v94 != v50) {
                  objc_enumerationMutation(v48);
                }
                char v52 = *(NSString **)(*((void *)&v93 + 1) + 8 * i);
                  uint64_t v53 = {;
                  [v53 removeAllObjects];
                }
                else
                {
                  std::string::basic_string[abi:nn180100]<0>(buf, (char *)[(NSString *)v52 UTF8String]);
                  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__erase_unique<std::string>(p_bundleIdToResultsMap, (uint64_t)buf);
                  if (v92 < 0) {
                    operator delete(*(void **)buf);
                  }
                }
              }
              uint64_t v49 = [v48 countByEnumeratingWithState:&v93 objects:v101 count:16];
            }
            while (v49);
          }

          uint64_t v47 = obj;
        }
        if (v33)
        {
          unint64_t v54 = (void *)[(NSMutableDictionary *)v47 copy];
          id v55 = [v75 copy];
          *(void *)long long buf = 0;
          objc_initWeak((id *)buf, val);
          rankQueue = val->_rankQueue;
          qos_class_t v57 = qos_class_self();
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __40__SPCSSearchQuery_sendResponseWithKind___block_invoke_2;
          block[3] = &unk_264C76D78;
          objc_copyWeak(&v86, (id *)buf);
          unsigned int v87 = v71;
          id v82 = v54;
          id v83 = v55;
          id v84 = v74;
          id v85 = v73;
          id v58 = v55;
          id v59 = v54;
          dispatch_block_t v60 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v57, 0, block);
          dispatch_async(rankQueue, v60);

          objc_destroyWeak(&v86);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          id v61 = objc_alloc(MEMORY[0x263F78D80]);
          uint64_t v62 = [(SPKQuery *)val queryGroupId];
          long long v63 = (void *)[v61 initWithQueryID:v62 kind:v71 sections:MEMORY[0x263EFFA68]];
          uint64_t v64 = [(SPKQuery *)val userQueryString];
          [v63 setUserQueryString:v64];

          os_unfair_lock_lock(&val->_suggestionsLock);
          uint64_t v65 = (void *)[(NSMutableArray *)val->_suggestionResults copy];
          [v63 setLocalSuggestionResults:v65];

          os_unfair_lock_unlock(&val->_suggestionsLock);
          *(void *)long long buf = 0;
          objc_initWeak((id *)buf, val);
          long long v66 = val->_rankQueue;
          LODWORD(v65) = qos_class_self();
          v88[0] = MEMORY[0x263EF8330];
          v88[1] = 3221225472;
          v88[2] = __40__SPCSSearchQuery_sendResponseWithKind___block_invoke;
          v88[3] = &unk_264C76D50;
          objc_copyWeak(&v90, (id *)buf);
          id v89 = v63;
          id v67 = v63;
          dispatch_block_t v68 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)v65, 0, v88);
          dispatch_async(v66, v68);

          objc_destroyWeak(&v90);
          objc_destroyWeak((id *)buf);
        }
      }

      id v19 = v75;
      goto LABEL_69;
    }
    char v33 = 0;
    uint64_t v73 = 0;
    id v74 = 0;
    uint64_t v34 = *MEMORY[0x263F78ED8];
    uint64_t v72 = *MEMORY[0x263F79040];
    while (1)
    {
      id v35 = next[5];
      id v36 = next[6];
      uint64_t v37 = [v35 bundleIdentifier];
      BOOL v38 = v37;
      if (v8 != 2)
      {
        [(NSMutableDictionary *)obj addObject:v35];
        [v75 addObject:v36];
        goto LABEL_39;
      }
      id v39 = v37;
      {
        {

LABEL_38:
          -[NSMutableDictionary addObject:](obj, "addObject:", v35, v69);
          uint64_t v41 = [MEMORY[0x263EFF9B0] orderedSetWithOrderedSet:v36];
          [v75 addObject:v41];

          [v69 addObject:v39];
LABEL_39:
          if (objc_msgSend(v38, "isEqualToString:", v34, v69))
          {
            uint64_t v42 = [(NSMutableDictionary *)obj lastObject];
            BOOL v43 = v74;
            id v74 = (void *)v42;
            goto LABEL_43;
          }
          if ([v38 isEqualToString:v72])
          {
            uint64_t v44 = [v75 lastObject];
            BOOL v43 = v73;
            uint64_t v73 = (void *)v44;
LABEL_43:
          }
          if (v33)
          {
            BOOL v45 = 0;
          }
          else
          {
            uint64_t v46 = [v75 lastObject];
            BOOL v45 = [v46 count] != 0;
          }
          v33 |= v45;
          goto LABEL_48;
        }

        if (v40) {
          goto LABEL_38;
        }
      }
      else
      {
      }
LABEL_48:

      next = (id *)*next;
      if (!next) {
        goto LABEL_51;
      }
    }
  }
  id obj = v6;
  unsigned int v8 = a3 & 0xFFFFFFFE;
  uint64_t v9 = *(void *)v98;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v98 != v9) {
      objc_enumerationMutation(v6);
    }
    id v11 = *(void **)(*((void *)&v97 + 1) + 8 * v10);
    unsigned __int8 v12 = [(NSMutableDictionary *)val->_foundBundleIDs objectForKeyedSubscript:v11];
    uint64_t v13 = [v12 unsignedIntegerValue];

    if (v8 != 2 || ![v11 isEqualToString:@"com.apple.searchd.engagement"]) {
      goto LABEL_17;
    }
    uint64_t v14 = SPLogForSPLogCategoryQuery();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_235D0B000, v14, OS_LOG_TYPE_DEFAULT, "Found com.apple.searchd.engagement", buf, 2u);
    }

    uint64_t v15 = (uint64_t)val->_resultHeaps.__begin_ + 24 * v13;
    uint64_t v16 = *(_OWORD **)v15;
    __uint64_t v17 = *(_OWORD **)(v15 + 8);
    if (v16 != v17) {
      break;
    }
LABEL_14:
    uint64_t v18 = SPLogForSPLogCategoryQuery();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_235D0B000, v18, OS_LOG_TYPE_DEFAULT, "Found no exact-match on previous engagement", buf, 2u);
    }

LABEL_17:
    if (++v10 == v7)
    {
      uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v97 objects:v102 count:16];
      if (!v7) {
        goto LABEL_23;
      }
      goto LABEL_4;
    }
  }
  {
    v16 += 5;
    if (v16 == v17) {
      goto LABEL_14;
    }
  }
  id v19 = SPLogForSPLogCategoryQuery();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_235D0B000, v19, OS_LOG_TYPE_DEFAULT, "Delay returning results; previous engagement of non-priority result found",
      buf,
      2u);
  }
LABEL_69:
}

void __40__SPCSSearchQuery_sendResponseWithKind___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _sendResponse:*(void *)(a1 + 32)];
}

void __40__SPCSSearchQuery_sendResponseWithKind___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained rankAndSendResultsWithResponseKind:*(unsigned int *)(a1 + 72) withResultSections:*(void *)(a1 + 32) withResultSets:*(void *)(a1 + 40) withiCloudDriveSection:*(void *)(a1 + 48) withMailResultSet:*(void *)(a1 + 56)];
}

- (void)executeQuery
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_235D0B000, a2, OS_LOG_TYPE_DEBUG, "[debug][personal answers][query] personalAnswersQueries = %@", (uint8_t *)&v2, 0xCu);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 60, *(id *)(a1 + 32));
    uint64_t v3 = [MEMORY[0x263F674B0] sharedProxy];
    [v3 sendFeedbackType:5 feedback:*(void *)(a1 + 32) queryId:*(void *)(a1 + 56) clientID:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_3;
  block[3] = &unk_264C76DA0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  char v9 = *(unsigned char *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained foundItems:*(void *)(a1 + 32) isSearchToolClient:*(unsigned __int8 *)(a1 + 48)];
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(NSObject **)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_5;
  v14[3] = &unk_264C76DF0;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v18);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained foundCompletion:*(void *)(a1 + 32) scores:*(void *)(a1 + 40) bundleIDs:*(void *)(a1 + 48)];
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_7;
  v6[3] = &unk_264C76D50;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained foundCompletions:*(void *)(a1 + 32)];
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_8(uint64_t a1)
{
  char v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_9;
  block[3] = &unk_264C76E68;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained priorityGatherEnded];
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_11;
  v6[3] = &unk_264C76D50;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained completed:*(void *)(a1 + 32)];
}

- (void)foundCompletion:(id)a3 scores:(id)a4 bundleIDs:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_completionSuggestions objectForKey:v21];

  if (!v10)
  {
    id v11 = [MEMORY[0x263F02B08] emptySuggestion];
    id v12 = (void *)MEMORY[0x263F02B08];
    id v13 = [(SPKQuery *)self userQueryString];
    uint64_t v14 = [v12 updatedSuggestionWithCurrentSuggestion:v11 userString:v13 tokens:MEMORY[0x263EFFA68]];

    id v15 = (void *)MEMORY[0x263F02B08];
    id v16 = [(SPKQuery *)self userQueryString];
    id v17 = [v15 suggestionWithCurrentSuggestion:v14 userQueryString:v16 completion:v21 attributes:v9 scores:v8 options:MEMORY[0x263EFFA78]];

    if (v17)
    {
      id v18 = (void *)MEMORY[0x263F78E50];
      id v19 = [(SPKQuery *)self queryContext];
      unsigned __int8 v20 = [v18 buildResultWithSpotlightSuggestion:v17 queryContext:v19];

      [(NSMutableDictionary *)self->_completionSuggestions setObject:v20 forKey:v21];
    }
  }
}

- (void)foundCompletions:(id)a3
{
  p_suggestionsLocuint64_t k = &self->_suggestionsLock;
  os_unfair_lock_lock(&self->_suggestionsLock);
  BOOL v5 = (*((unsigned char *)self + 384) & 1) != 0
    || [(NSMutableDictionary *)self->_completionSuggestions count]
    || [(NSMutableArray *)self->_suggestionResults count] != 0;
  *((unsigned char *)self + 384) = *((unsigned char *)self + 384) & 0xFE | v5;
  suggestionResults = self->_suggestionResults;
  id v7 = [(NSMutableDictionary *)self->_completionSuggestions allValues];
  [(NSMutableArray *)suggestionResults addObjectsFromArray:v7];

  os_unfair_lock_unlock(p_suggestionsLock);
}

- (void)priorityGatherEnded
{
}

uint64_t __38__SPCSSearchQuery_priorityGatherEnded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendResponseWithKind:3];
}

- (void)completed:(id)a3
{
  id v7 = a3;
  {
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      BOOL v5 = timeoutTimer;
      dispatch_source_cancel(v5);
      uint64_t v6 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
  }
  [(SPCSSearchQuery *)self sendResponseWithKind:4];
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (int64_t)contentFilters
{
  return self->_contentFilters;
}

- (void)setContentFilters:(int64_t)a3
{
  self->_contentFilters = a3;
}

- (PRSRankingItemRanker)itemRanker
{
  return self->_itemRanker;
}

- (void)setItemRanker:(id)a3
{
}

- (BOOL)isCJK
{
  return *((unsigned char *)self + 448) & 1;
}

- (void)setIsCJK:(BOOL)a3
{
  *((unsigned char *)self + 448) = *((unsigned char *)self + 448) & 0xFE | a3;
}

- (BOOL)isPeopleSearch
{
  return self->_isPeopleSearch;
}

- (void)setIsPeopleSearch:(BOOL)a3
{
  self->_BOOL isPeopleSearch = a3;
}

- (BOOL)isPhotosSearch
{
  return self->_isPhotosSearch;
}

- (void)setIsPhotosSearch:(BOOL)a3
{
  self->_BOOL isPhotosSearch = a3;
}

- (BOOL)parsecAvailable
{
  return self->_parsecAvailable;
}

- (void)setParsecAvailable:(BOOL)a3
{
  self->_parsecAvailable = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_double currentTime = a3;
}

- (unint64_t)previousQueryKind
{
  return self->_previousQueryKind;
}

- (void)setPreviousQueryKind:(unint64_t)a3
{
  self->_previousQueryKind = a3;
}

- (PRSRankingConfiguration)rankingInfo
{
  return (PRSRankingConfiguration *)objc_getProperty(self, a2, 536, 1);
}

- (void)setRankingInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingInfo, 0);
  objc_storeStrong((id *)&self->_itemRanker, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_renderEngagementCounts, 0);
  objc_storeStrong((id *)&self->_disabledAppSet, 0);
  objc_storeStrong((id *)&self->_resultAttrIndexSet, 0);
  objc_storeStrong((id *)&self->_resultAttrs, 0);
  objc_storeStrong((id *)&self->_suggestionResults, 0);
  objc_storeStrong((id *)&self->_completionSuggestions, 0);

  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::~__hash_table((uint64_t)&self->_bundleIdToResultsMap);
  begiuint64_t n = (void **)self->_resultHeaps.__begin_;
  if (begin)
  {
    end = (void **)self->_resultHeaps.__end_;
    BOOL v5 = self->_resultHeaps.__begin_;
    if (end != begin)
    {
      do
      {
        end -= 3;
      }
      while (end != begin);
      BOOL v5 = self->_resultHeaps.__begin_;
    }
    self->_resultHeaps.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_foundBundleIDs, 0);
  objc_storeStrong((id *)&self->_csQuery, 0);
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_storeStrong((id *)&self->_rankQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (id).cxx_construct
{
  self->_resultHeaps.__end_ = 0;
  self->_resultHeaps.__end_cap_.__value_ = 0;
  self->_resultHeaps.__begin_ = 0;
  self->_resultRankTables.__end_ = 0;
  self->_resultRankTables.__end_cap_.__value_ = 0;
  self->_resultRankTables.__begin_ = 0;
  self->_resultRecencyTables.__end_ = 0;
  self->_resultRecencyTables.__end_cap_.__value_ = 0;
  self->_resultRecencyTables.__begin_ = 0;
  p_bundleIdToResultsMap = &self->_bundleIdToResultsMap;
  self->_bundleIdToResultsMap.map.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_bundleIdToResultsMap.map.__table_.__p1_.__value_.__next_ = 0u;
  self->_bundleIdToResultsMap.map.__table_.__p3_.__value_ = 1.0;
  self->_bundleIdToResultsMap.photosSectiouint64_t n = 0;
  *(_OWORD *)&self->_bundleIdToResultsMap.contactResultsSectiouint64_t n = 0u;
  *(_OWORD *)&self->_bundleIdToResultsMap.syndicatedPhotosInFilesSectiouint64_t n = 0u;
  *(_OWORD *)&self->_bundleIdToResultsMap.syndicatedPhotosInMessagesSectiouint64_t n = 0u;
  uint64_t v4 = *(_OWORD *)&self->_bundleIdToResultsMap.syndicatedLinkSection = 0u;
  syndicatedLinkSectiouint64_t n = p_bundleIdToResultsMap->syndicatedLinkSection;
  p_bundleIdToResultsMap->syndicatedLinkSectiouint64_t n = (SFMutableResultSection *)v4;
  uint64_t v6 = ;
  syndicatedPhotosInAppsSectiouint64_t n = p_bundleIdToResultsMap->syndicatedPhotosInAppsSection;
  p_bundleIdToResultsMap->syndicatedPhotosInAppsSectiouint64_t n = (SFMutableResultSection *)v6;
  uint64_t v8 = ;
  syndicatedPhotosInMessagesSectiouint64_t n = p_bundleIdToResultsMap->syndicatedPhotosInMessagesSection;
  p_bundleIdToResultsMap->syndicatedPhotosInMessagesSectiouint64_t n = (SFMutableResultSection *)v8;
  uint64_t v10 = ;
  syndicatedPhotosInNotesSectiouint64_t n = p_bundleIdToResultsMap->syndicatedPhotosInNotesSection;
  p_bundleIdToResultsMap->syndicatedPhotosInNotesSectiouint64_t n = (SFMutableResultSection *)v10;
  uint64_t v12 = ;
  syndicatedPhotosInFilesSectiouint64_t n = p_bundleIdToResultsMap->syndicatedPhotosInFilesSection;
  p_bundleIdToResultsMap->syndicatedPhotosInFilesSectiouint64_t n = (SFMutableResultSection *)v12;
  uint64_t v14 = ;
  syndicatedGeneralPhotosSectiouint64_t n = p_bundleIdToResultsMap->syndicatedGeneralPhotosSection;
  p_bundleIdToResultsMap->syndicatedGeneralPhotosSectiouint64_t n = (SFMutableResultSection *)v14;
  uint64_t v16 = ;
  contactResultsSectiouint64_t n = p_bundleIdToResultsMap->contactResultsSection;
  p_bundleIdToResultsMap->contactResultsSectiouint64_t n = (SFMutableResultSection *)v16;
  uint64_t v18 = ;
  peopleResultsSectiouint64_t n = p_bundleIdToResultsMap->peopleResultsSection;
  p_bundleIdToResultsMap->peopleResultsSectiouint64_t n = (SFMutableResultSection *)v18;
  uint64_t v20 = ;
  photosSectiouint64_t n = p_bundleIdToResultsMap->photosSection;
  p_bundleIdToResultsMap->photosSectiouint64_t n = (SFMutableResultSection *)v20;

  return self;
}

void __29__SPCSSearchQuery_initialize__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_235D0B000, a3, (uint64_t)a3, "got error fetching me card info: %ld", (uint8_t *)a1);
}

void __27__SPCSSearchQuery_activate__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_235D0B000, a2, a3, "Error loading home screen config cache: %@", (uint8_t *)&v3);
}

- (void)addSearchResult:(os_log_t)log withFoundBundleID:.cold.1(os_log_t log)
{
  *(_WORD *)char v1 = 0;
  _os_log_error_impl(&dword_235D0B000, log, OS_LOG_TYPE_ERROR, "[ProtectedApps][personal answers] event source bundle identifier is missing from attrDictionary, event was filtered out", v1, 2u);
}

@end