@interface NTCatchUpOperation
- (BOOL)isForYouEnabled;
- (BOOL)validateOperation;
- (FCContentContext)contentContext;
- (FCFeedPersonalizing)feedPersonalizer;
- (FCNewsAppConfiguration)appConfiguration;
- (NSDate)fetchDate;
- (NSDictionary)resultsByArticleIDsRequestID;
- (NSDictionary)resultsByArticleListID;
- (NSDictionary)todayConfigOperationHeldRecordsByType;
- (NSMutableArray)articleIDsRequests;
- (NSMutableArray)articleListRequests;
- (NSMutableSet)articleIDsToExclude;
- (NTCatchUpOperation)init;
- (NTCatchUpOperationForYouFetchInfo)forYouFetchInfo;
- (NTCatchUpOperationForYouRequest)forYouRequest;
- (NTCatchUpOperationResults)forYouResults;
- (id)catchUpCompletionHandler;
- (void)_fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:(id)a3;
- (void)_fetchForYouResultsIfNeededWithCompletion:(id)a3;
- (void)addArticleIDsRequest:(id)a3;
- (void)addArticleIDsToExclude:(id)a3;
- (void)addArticleListRequest:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setAppConfiguration:(id)a3;
- (void)setArticleIDsRequests:(id)a3;
- (void)setArticleIDsToExclude:(id)a3;
- (void)setArticleListRequests:(id)a3;
- (void)setCatchUpCompletionHandler:(id)a3;
- (void)setContentContext:(id)a3;
- (void)setFeedPersonalizer:(id)a3;
- (void)setFetchDate:(id)a3;
- (void)setForYouEnabled:(BOOL)a3;
- (void)setForYouFetchInfo:(id)a3;
- (void)setForYouRequest:(id)a3;
- (void)setForYouResults:(id)a3;
- (void)setResultsByArticleIDsRequestID:(id)a3;
- (void)setResultsByArticleListID:(id)a3;
- (void)setTodayConfigOperationHeldRecordsByType:(id)a3;
- (void)validateOperation;
@end

@implementation NTCatchUpOperation

- (NTCatchUpOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)NTCatchUpOperation;
  v2 = [(FCOperation *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    articleListRequests = v2->_articleListRequests;
    v2->_articleListRequests = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    articleIDsRequests = v2->_articleIDsRequests;
    v2->_articleIDsRequests = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    articleIDsToExclude = v2->_articleIDsToExclude;
    v2->_articleIDsToExclude = (NSMutableSet *)v7;
  }
  return v2;
}

- (void)addArticleListRequest:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation addArticleListRequest:]();
  }
  uint64_t v5 = [(NTCatchUpOperation *)self articleListRequests];
  [v5 addObject:v4];
}

- (void)addArticleIDsRequest:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation addArticleIDsRequest:]();
  }
  uint64_t v5 = [(NTCatchUpOperation *)self articleIDsRequests];
  [v5 addObject:v4];
}

- (void)addArticleIDsToExclude:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation addArticleIDsToExclude:]();
  }
  uint64_t v5 = [(NTCatchUpOperation *)self articleIDsToExclude];
  [v5 unionSet:v4];
}

- (BOOL)validateOperation
{
  id v4 = [(NTCatchUpOperation *)self appConfiguration];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation validateOperation].cold.6();
  }
  uint64_t v5 = [(NTCatchUpOperation *)self contentContext];

  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation validateOperation].cold.5();
  }
  v6 = [(NTCatchUpOperation *)self feedPersonalizer];

  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation validateOperation].cold.4();
  }
  uint64_t v7 = [(NTCatchUpOperation *)self articleIDsRequests];
  uint64_t v8 = [v7 count];
  if (!v8)
  {
    v2 = [(NTCatchUpOperation *)self articleListRequests];
    if (![v2 count])
    {

LABEL_19:
      char v10 = 1;
      goto LABEL_20;
    }
  }
  v9 = [(NTCatchUpOperation *)self todayConfigOperationHeldRecordsByType];

  if (!v8) {
  if (v9)
  }
    goto LABEL_19;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation validateOperation]();
  }
  char v10 = 0;
LABEL_20:
  if ([(NTCatchUpOperation *)self isForYouEnabled]
    && ([(NTCatchUpOperation *)self forYouRequest],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[NTCatchUpOperation validateOperation]();
    }
    char v12 = 0;
  }
  else
  {
    char v12 = 1;
  }
  v13 = [(NTCatchUpOperation *)self catchUpCompletionHandler];

  if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation validateOperation]();
  }
  if (v4) {
    BOOL v14 = v5 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14 || v6 == 0) {
    char v16 = 0;
  }
  else {
    char v16 = v10;
  }
  char v17 = v16 & v12;
  if (v13) {
    return v17;
  }
  else {
    return 0;
  }
}

- (void)prepareOperation
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(NTCatchUpOperation *)self setFetchDate:v3];
}

- (void)performOperation
{
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  id v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  id v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy_;
  v18[4] = __Block_byref_object_dispose_;
  id v19 = 0;
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__NTCatchUpOperation_performOperation__block_invoke;
  v13[3] = &unk_26475C850;
  v15 = v28;
  char v16 = v26;
  char v17 = v24;
  id v4 = v3;
  BOOL v14 = v4;
  [(NTCatchUpOperation *)self _fetchForYouResultsIfNeededWithCompletion:v13];
  dispatch_group_enter(v4);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__NTCatchUpOperation_performOperation__block_invoke_2;
  v8[3] = &unk_26475C878;
  char v10 = v22;
  v11 = v20;
  char v12 = v18;
  uint64_t v5 = v4;
  v9 = v5;
  [(NTCatchUpOperation *)self _fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:v8];
  [(NTCatchUpOperation *)self qualityOfService];
  v6 = FCDispatchQueueForQualityOfService();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__NTCatchUpOperation_performOperation__block_invoke_3;
  block[3] = &unk_26475C8A0;
  block[6] = v20;
  block[7] = v28;
  block[4] = self;
  block[5] = v22;
  block[8] = v26;
  block[9] = v24;
  block[10] = v18;
  dispatch_group_notify(v5, v6, block);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

void __38__NTCatchUpOperation_performOperation__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [a2 copy];
  uint64_t v10 = *(void *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = [v8 copy];
  uint64_t v13 = *(void *)(a1[6] + 8);
  BOOL v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = [v7 copy];
  uint64_t v16 = *(void *)(a1[7] + 8);
  char v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  v18 = a1[4];

  dispatch_group_leave(v18);
}

void __38__NTCatchUpOperation_performOperation__block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [a2 copy];
  uint64_t v10 = *(void *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = [v8 copy];
  uint64_t v13 = *(void *)(a1[6] + 8);
  BOOL v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = [v7 copy];
  uint64_t v16 = *(void *)(a1[7] + 8);
  char v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  v18 = a1[4];

  dispatch_group_leave(v18);
}

void __38__NTCatchUpOperation_performOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = NTSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) items];
    uint64_t v6 = [v5 count];
    int v7 = [*(id *)(a1 + 32) isForYouEnabled];
    int v12 = 134218752;
    uint64_t v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    _os_log_impl(&dword_22592C000, v2, OS_LOG_TYPE_INFO, "fetched %lu sets of articleList headlines, %lu sets of articleIDs headlines, %lu For You headlines (enabled: %d)", (uint8_t *)&v12, 0x26u);
  }
  [*(id *)(a1 + 32) setResultsByArticleListID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(a1 + 32) setResultsByArticleIDsRequestID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(a1 + 32) setForYouResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [*(id *)(a1 + 32) setForYouFetchInfo:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (!v9) {
      goto LABEL_9;
    }
  }
  uint64_t v10 = NTSharedLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = [v9 localizedDescription];
    int v12 = 138412290;
    uint64_t v13 = (uint64_t)v11;
    _os_log_impl(&dword_22592C000, v10, OS_LOG_TYPE_ERROR, "Encountered error %@ while attempting to catch up", (uint8_t *)&v12, 0xCu);
  }
LABEL_9:
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v9];
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = NTSharedLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_22592C000, v5, OS_LOG_TYPE_ERROR, "Catch up operation failed with error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v6 = [(NTCatchUpOperation *)self catchUpCompletionHandler];
  ((void (**)(void, NTCatchUpOperation *, id))v6)[2](v6, self, v4);
}

- (void)_fetchForYouResultsIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation _fetchForYouResultsIfNeededWithCompletion:]();
  }
  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([(NTCatchUpOperation *)self isForYouEnabled])
  {
    id v27 = v5;
    id v25 = [(NTCatchUpOperation *)self contentContext];
    uint64_t v6 = [(NTCatchUpOperation *)self forYouRequest];
    id v7 = objc_alloc(MEMORY[0x263EFF9B0]);
    id v8 = [v6 rankedSubscribedTagIDs];
    uint64_t v9 = (void *)[v7 initWithArray:v8];

    uint64_t v10 = [v6 topStoriesChannelID];
    if (v10) {
      [v9 removeObject:v10];
    }
    v26 = (void *)v10;
    uint64_t v11 = [v6 localNewsTagID];
    if (v11) {
      [v9 insertObject:v11 atIndex:0];
    }
    int v12 = [(NTCatchUpOperation *)self appConfiguration];
    id v23 = (void *)MEMORY[0x263F594E0];
    v22 = [v9 set];
    uint64_t v13 = [v6 mutedTagIDs];
    __int16 v14 = [v6 purchasedTagIDs];
    uint64_t v15 = [v6 bundleSubscriptionProvider];
    uint64_t v21 = [(NTCatchUpOperation *)self qualityOfService];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke;
    v28[3] = &unk_26475C960;
    v28[4] = self;
    id v29 = v6;
    id v30 = v9;
    id v31 = v12;
    id v34 = v4;
    id v32 = v25;
    v24 = (void *)v11;
    uint64_t v5 = v27;
    id v33 = v27;
    id v16 = v25;
    id v17 = v12;
    id v18 = v9;
    id v19 = v6;
    LOBYTE(v20) = 0;
    [v23 fetchTagsForQueryingWithSubscribedTagIDs:v22 mutedTagIDs:v13 purchasedTagIDs:v14 bundleSubscriptionProvider:v15 configuration:v17 contentContext:v16 fallbackToPresubscribedTagIDs:v20 qualityOfService:v21 completionHandler:v28];
  }
  else
  {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
  }
}

void __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v79[5] = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    v59 = [*(id *)(a1 + 32) fetchDate];
    v57 = objc_msgSend(objc_alloc(MEMORY[0x263F59410]), "initWithStartDate:timeInterval:", v59, (double)-objc_msgSend(*(id *)(a1 + 40), "cutoffTime"));
    v61 = objc_msgSend(MEMORY[0x263F59468], "feedRangeFromDateRange:");
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_2;
    v76[3] = &unk_26475C8C8;
    id v77 = *(id *)(a1 + 40);
    v60 = (void *)MEMORY[0x22A638590](v76);
    id v58 = v5;
    uint64_t v6 = [v5 allObjects];
    id v7 = objc_msgSend(v6, "fc_dictionaryWithKeyBlock:", &__block_literal_global_6);

    id v8 = [*(id *)(a1 + 48) array];
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_4;
    v74[3] = &unk_26475C910;
    id v56 = v7;
    id v75 = v56;
    uint64_t v9 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v74);

    v54 = (void *)MEMORY[0x263F594E0];
    uint64_t v10 = [*(id *)(a1 + 40) hiddenFeedIDs];
    uint64_t v11 = [v10 allObjects];
    uint64_t v12 = [*(id *)(a1 + 40) allowPaidBundleFeed];
    uint64_t v13 = [*(id *)(a1 + 40) purchasedTagIDs];
    __int16 v14 = [*(id *)(a1 + 40) bundleSubscriptionProvider];
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = [*(id *)(a1 + 40) headlinesPerFeedFetchCount];
    id v17 = [*(id *)(a1 + 64) pptContext];
    LOBYTE(v51) = [v17 isRunningPPT];
    id v18 = v54;
    v55 = (void *)v9;
    id v19 = [v18 feedRequestsForTags:v9 tagBinProvider:v60 hiddenFeedIDs:v11 allowPaidBundleFeed:v12 purchasedTagIDs:v13 bundleSubscriptionProvider:v14 configuration:v15 maxCount:v16 feedRange:v61 sidecar:0 isRunningPPT:v51];

    uint64_t v20 = [v19 channelDefaultSectionRequests];
    v79[0] = v20;
    uint64_t v21 = [v19 topicRequests];
    v79[1] = v21;
    v22 = [v19 paidBundleRequests];
    v79[2] = v22;
    id v23 = [v19 hiddenFeedRequests];
    v79[3] = v23;
    v24 = [v19 channelOtherSectionsRequests];
    v79[4] = v24;
    id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:5];
    v26 = objc_msgSend(v25, "fc_arrayByFlattening");

    if ([v26 count])
    {
      id v27 = objc_msgSend(v26, "fc_subarrayWithMaxCount:", objc_msgSend(*(id *)(a1 + 40), "feedMaxCount"));
      uint64_t v28 = [MEMORY[0x263F59470] feedRequestContentEnvironmentTokenWithContext:*(void *)(a1 + 64)];
      id v29 = [*(id *)(a1 + 32) contentContext];
      id v30 = [v29 feedDatabase];
      unsigned int v31 = [v30 version];

      id v32 = NSString;
      id v33 = [*(id *)(a1 + 40) throttlingIdentifier];
      v53 = (void *)v28;
      id v34 = [v32 stringWithFormat:@"%@%@%@-%hu", @"fy-fetchdate-", v28, v33, v31];

      uint64_t v35 = [*(id *)(a1 + 72) objectForKey:v34];
      v52 = (void *)v35;
      if (v35)
      {
        [v59 timeIntervalSinceDate:v35];
        double v37 = (double)(uint64_t)v36;
        [*(id *)(a1 + 40) minimumUpdateInterval];
        BOOL v39 = v38 >= v37;
      }
      else
      {
        BOOL v39 = 0;
      }
      id v5 = v58;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v42 = v27;
      uint64_t v44 = [(NTCatchUpOperationResults *)v42 countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v71 != v46) {
              objc_enumerationMutation(v42);
            }
            [*(id *)(*((void *)&v70 + 1) + 8 * i) setCachedOnly:v39];
          }
          uint64_t v45 = [(NTCatchUpOperationResults *)v42 countByEnumeratingWithState:&v70 objects:v78 count:16];
        }
        while (v45);
      }

      id v48 = objc_alloc_init(MEMORY[0x263F59470]);
      [v48 setContext:*(void *)(a1 + 64)];
      v49 = [*(id *)(a1 + 32) appConfiguration];
      [v48 setConfiguration:v49];

      [v48 setFeedRequests:v42];
      [v48 setOptions:1];
      [v48 setExpectedNetworkEventCount:1];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_5;
      v62[3] = &unk_26475C938;
      id v68 = *(id *)(a1 + 80);
      BOOL v69 = v39;
      id v63 = *(id *)(a1 + 72);
      v43 = v59;
      id v64 = v59;
      id v65 = v34;
      uint64_t v66 = *(void *)(a1 + 32);
      id v67 = v19;
      id v50 = v34;
      [v48 setRequestCompletionHandlerWithHeldRecords:v62];
      [*(id *)(a1 + 32) associateChildOperation:v48];
      [v48 start];
    }
    else
    {
      uint64_t v40 = *(void *)(a1 + 80);
      v41 = [NTCatchUpOperationResults alloc];
      v42 = [(NTCatchUpOperationResults *)v41 initWithItems:MEMORY[0x263EFFA68] rankingFeedback:0 supplementalInterestToken:0];
      (*(void (**)(uint64_t, NTCatchUpOperationResults *, void, void))(v40 + 16))(v40, v42, 0, 0);
      id v5 = v58;
      v43 = v59;
    }
  }
}

uint64_t __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchingBin];
}

uint64_t __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (!*(unsigned char *)(a1 + 80)) {
      [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_6;
    v21[3] = &unk_26475C200;
    v21[4] = *(void *)(a1 + 56);
    uint64_t v13 = objc_msgSend(v10, "fc_arrayOfObjectsFailingTest:", v21);
    if (v13)
    {
      __int16 v14 = [NTCatchUpOperationResults alloc];
      uint64_t v15 = [*(id *)(a1 + 64) feedContextByFeedID];
      uint64_t v16 = [(NTCatchUpOperationResults *)v14 initWithFeedItems:v13 supplementalInterestToken:0 feedContextByFeedID:v15];
    }
    else
    {
      uint64_t v16 = 0;
    }
    id v17 = [NTCatchUpOperationForYouFetchInfo alloc];
    uint64_t v18 = *(unsigned __int8 *)(a1 + 80);
    id v19 = [*(id *)(a1 + 64) feedContextByFeedID];
    uint64_t v20 = [(NTCatchUpOperationForYouFetchInfo *)v17 initWithAttemptedCachedOnly:v18 feedContextByFeedID:v19];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __64__NTCatchUpOperation__fetchForYouResultsIfNeededWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 articleIDsToExclude];
  id v5 = [v3 articleID];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

- (void)_fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperation _fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:]();
  }
  id v5 = [(NTCatchUpOperation *)self articleListRequests];
  uint64_t v6 = [(NTCatchUpOperation *)self articleIDsRequests];
  if ([v5 count] || objc_msgSend(v6, "count"))
  {
    id v7 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v29 + 1) + 8 * i) articleIDs];
          __int16 v14 = [v13 set];
          [v7 unionSet:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v10);
    }

    uint64_t v15 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_106);
    uint64_t v16 = NTSharedLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [v15 count];
      uint64_t v18 = [v7 count];
      *(_DWORD *)buf = 134218754;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      double v36 = v15;
      __int16 v37 = 2048;
      uint64_t v38 = v18;
      __int16 v39 = 2112;
      uint64_t v40 = v7;
      _os_log_impl(&dword_22592C000, v16, OS_LOG_TYPE_INFO, "NTCatchUpOperation fetching headlines for articleListIDs (%lu): %@  articleIDs (%lu): %@", buf, 0x2Au);
    }

    id v19 = [(NTCatchUpOperation *)self contentContext];
    uint64_t v20 = objc_opt_new();
    uint64_t v21 = [(NTCatchUpOperation *)self appConfiguration];
    [v20 setConfiguration:v21];

    [v20 setContext:v19];
    [v20 setArticleListIDs:v15];
    [v20 setArticleIDs:v7];
    [v20 setShouldBypassRecordSourcePersistence:1];
    v22 = [(NTCatchUpOperation *)self todayConfigOperationHeldRecordsByType];
    [v20 setHeldRecordsByType:v22];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_108;
    v24[3] = &unk_26475CA20;
    id v25 = v5;
    v26 = self;
    id v27 = v8;
    id v28 = v4;
    [v20 setHeadlinesCompletionHandler:v24];
    [(FCOperation *)self associateChildOperation:v20];
    [v20 start];

    uint64_t v6 = v23;
  }
  else
  {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
  }
}

uint64_t __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 articleListID];
}

void __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_108(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_new();
  __int16 v14 = objc_opt_new();
  uint64_t v15 = *(void **)(a1 + 32);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_2;
  v37[3] = &unk_26475C9A8;
  id v30 = v10;
  id v38 = v30;
  id v16 = v14;
  id v39 = v16;
  id v17 = v12;
  id v40 = v17;
  id v29 = v9;
  id v41 = v29;
  id v18 = v13;
  id v42 = v18;
  [v15 enumerateObjectsUsingBlock:v37];
  id v19 = [*(id *)(a1 + 40) appConfiguration];
  uint64_t v20 = objc_opt_new();
  uint64_t v21 = objc_opt_new();
  v22 = *(void **)(a1 + 48);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_3;
  v31[3] = &unk_26475C9F8;
  id v32 = v11;
  id v23 = v21;
  id v33 = v23;
  id v24 = v17;
  id v34 = v24;
  id v35 = v19;
  id v36 = v20;
  id v25 = v20;
  id v26 = v19;
  id v27 = v11;
  [v22 enumerateObjectsUsingBlock:v31];
  if ([v16 count] || objc_msgSend(v23, "count")) {
    id v28 = v24;
  }
  else {
    id v28 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = [a2 articleListID];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v3)
  {
    id v4 = [*(id *)(a1 + 56) objectForKeyedSubscript:v7];
    if (v4)
    {
      id v5 = [NTCatchUpOperationResults alloc];
      uint64_t v6 = [(NTCatchUpOperationResults *)v5 initWithHeadlines:v4 rankingFeedback:0 actionURLsByArticleID:MEMORY[0x263EFFA78]];
      [*(id *)(a1 + 64) setObject:v6 forKeyedSubscript:v7];
    }
    else
    {
      [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:v7];
    }
  }
  else
  {
    [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:v7];
  }
}

void __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [v3 articleIDs];
  uint64_t v6 = [v5 array];

  id v7 = [v3 overrideHeadlineMetadataByArticleID];

  id v8 = objc_msgSend(*(id *)(a1 + 32), "nf_objectsForKeysWithoutMarker:", v6);
  if (v8)
  {
    id v9 = objc_opt_new();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_4;
    v12[3] = &unk_26475C9D0;
    id v13 = v7;
    id v14 = *(id *)(a1 + 56);
    id v15 = v9;
    id v10 = v9;
    [v8 enumerateObjectsUsingBlock:v12];
    id v11 = [[NTCatchUpOperationResults alloc] initWithHeadlines:v8 rankingFeedback:0 actionURLsByArticleID:v10];
    [*(id *)(a1 + 64) setObject:v11 forKeyedSubscript:v4];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:v4];
  }
}

void __82__NTCatchUpOperation__fetchArticleListAndArticleIDsResultsIfNeededWithCompletion___block_invoke_4(void *a1, void *a2)
{
  id v13 = a2;
  objc_opt_class();
  id v3 = FCCheckedDynamicCast();
  id v4 = (void *)a1[4];
  id v5 = [v13 articleID];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  [v3 applyHeadlineMetadata:v6 configuration:a1[5]];
  id v7 = [v6 actionURLString];
  if (v7)
  {
    id v8 = NSURL;
    id v9 = [v6 actionURLString];
    id v10 = [v8 URLWithString:v9];
  }
  else
  {
    id v10 = 0;
  }

  id v11 = (void *)a1[6];
  id v12 = [v13 articleID];
  [v11 setObject:v10 forKeyedSubscript:v12];
}

- (FCNewsAppConfiguration)appConfiguration
{
  return self->_appConfiguration;
}

- (void)setAppConfiguration:(id)a3
{
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
}

- (NSDictionary)todayConfigOperationHeldRecordsByType
{
  return self->_todayConfigOperationHeldRecordsByType;
}

- (void)setTodayConfigOperationHeldRecordsByType:(id)a3
{
}

- (NTCatchUpOperationForYouRequest)forYouRequest
{
  return self->_forYouRequest;
}

- (void)setForYouRequest:(id)a3
{
}

- (BOOL)isForYouEnabled
{
  return self->_forYouEnabled;
}

- (void)setForYouEnabled:(BOOL)a3
{
  self->_forYouEnabled = a3;
}

- (NSDictionary)resultsByArticleListID
{
  return self->_resultsByArticleListID;
}

- (void)setResultsByArticleListID:(id)a3
{
}

- (NSDictionary)resultsByArticleIDsRequestID
{
  return self->_resultsByArticleIDsRequestID;
}

- (void)setResultsByArticleIDsRequestID:(id)a3
{
}

- (NTCatchUpOperationResults)forYouResults
{
  return self->_forYouResults;
}

- (void)setForYouResults:(id)a3
{
}

- (NTCatchUpOperationForYouFetchInfo)forYouFetchInfo
{
  return self->_forYouFetchInfo;
}

- (void)setForYouFetchInfo:(id)a3
{
}

- (id)catchUpCompletionHandler
{
  return self->_catchUpCompletionHandler;
}

- (void)setCatchUpCompletionHandler:(id)a3
{
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (void)setFetchDate:(id)a3
{
}

- (NSMutableSet)articleIDsToExclude
{
  return self->_articleIDsToExclude;
}

- (void)setArticleIDsToExclude:(id)a3
{
}

- (NSMutableArray)articleListRequests
{
  return self->_articleListRequests;
}

- (void)setArticleListRequests:(id)a3
{
}

- (NSMutableArray)articleIDsRequests
{
  return self->_articleIDsRequests;
}

- (void)setArticleIDsRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleIDsRequests, 0);
  objc_storeStrong((id *)&self->_articleListRequests, 0);
  objc_storeStrong((id *)&self->_articleIDsToExclude, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong(&self->_catchUpCompletionHandler, 0);
  objc_storeStrong((id *)&self->_forYouFetchInfo, 0);
  objc_storeStrong((id *)&self->_forYouResults, 0);
  objc_storeStrong((id *)&self->_resultsByArticleIDsRequestID, 0);
  objc_storeStrong((id *)&self->_resultsByArticleListID, 0);
  objc_storeStrong((id *)&self->_forYouRequest, 0);
  objc_storeStrong((id *)&self->_todayConfigOperationHeldRecordsByType, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);

  objc_storeStrong((id *)&self->_appConfiguration, 0);
}

- (void)addArticleListRequest:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleListRequest", v6, 2u);
}

- (void)addArticleIDsRequest:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleIDsRequest", v6, 2u);
}

- (void)addArticleIDsToExclude:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articleIDs", v6, 2u);
}

- (void)validateOperation
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = (void *)[[NSString alloc] initWithFormat:@"Catch up operation must have an app configuration"];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

- (void)_fetchForYouResultsIfNeededWithCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)_fetchArticleListAndArticleIDsResultsIfNeededWithCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

@end