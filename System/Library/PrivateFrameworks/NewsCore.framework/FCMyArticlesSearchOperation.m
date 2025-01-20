@interface FCMyArticlesSearchOperation
- (BOOL)cachedOnly;
- (BOOL)channelsOnly;
- (BOOL)validateOperation;
- (FCCloudContext)context;
- (FCDateRange)dateRange;
- (FCFeedItemFeature)feature;
- (FCForYouQuerySidecar)sidecar;
- (FCMyArticlesSearchOperation)init;
- (NSArray)resultFeedItems;
- (NSDictionary)resultFeedContextByFeedID;
- (id)_cappedFeedItemsFromResponses:(id)a3 allFeedItems:(id)a4;
- (id)searchCompletionHandler;
- (unint64_t)filterOptions;
- (unint64_t)maxFeedItems;
- (void)_generateFeedRequestsForFeedRange:(id)a3 completionHandler:(id)a4;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachedOnly:(BOOL)a3;
- (void)setChannelsOnly:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDateRange:(id)a3;
- (void)setFeature:(id)a3;
- (void)setFilterOptions:(unint64_t)a3;
- (void)setMaxFeedItems:(unint64_t)a3;
- (void)setResultFeedContextByFeedID:(id)a3;
- (void)setResultFeedItems:(id)a3;
- (void)setSearchCompletionHandler:(id)a3;
- (void)setSidecar:(id)a3;
@end

@implementation FCMyArticlesSearchOperation

- (FCMyArticlesSearchOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCMyArticlesSearchOperation;
  result = [(FCOperation *)&v3 init];
  if (result)
  {
    result->_channelsOnly = 1;
    result->_cachedOnly = 1;
  }
  return result;
}

- (BOOL)validateOperation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(FCMyArticlesSearchOperation *)self context];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)[[NSString alloc] initWithFormat:@"articles search operation requires a context"];
    int v18 = 136315906;
    v19 = "-[FCMyArticlesSearchOperation validateOperation]";
    __int16 v20 = 2080;
    v21 = "FCMyArticlesSearchOperation.m";
    __int16 v22 = 1024;
    int v23 = 51;
    __int16 v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);
  }
  v4 = [(FCMyArticlesSearchOperation *)self feature];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)[[NSString alloc] initWithFormat:@"articles search operation requires a feature"];
    int v18 = 136315906;
    v19 = "-[FCMyArticlesSearchOperation validateOperation]";
    __int16 v20 = 2080;
    v21 = "FCMyArticlesSearchOperation.m";
    __int16 v22 = 1024;
    int v23 = 52;
    __int16 v24 = 2114;
    v25 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);
  }
  uint64_t v5 = [(FCMyArticlesSearchOperation *)self dateRange];
  if (!v5
    || (v6 = (void *)v5,
        [(FCMyArticlesSearchOperation *)self dateRange],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isFinite],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)[[NSString alloc] initWithFormat:@"articles search operation requires a finite date range"];
      int v18 = 136315906;
      v19 = "-[FCMyArticlesSearchOperation validateOperation]";
      __int16 v20 = 2080;
      v21 = "FCMyArticlesSearchOperation.m";
      __int16 v22 = 1024;
      int v23 = 53;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);
    }
  }
  v9 = [(FCMyArticlesSearchOperation *)self context];
  if (v9)
  {
    v10 = [(FCMyArticlesSearchOperation *)self feature];
    if (v10)
    {
      v11 = [(FCMyArticlesSearchOperation *)self dateRange];
      if (v11)
      {
        v12 = [(FCMyArticlesSearchOperation *)self dateRange];
        char v13 = [v12 isFinite];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)performOperation
{
  objc_super v3 = [(FCMyArticlesSearchOperation *)self dateRange];
  v4 = +[FCFeedRange feedRangeFromDateRange:v3];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__FCMyArticlesSearchOperation_performOperation__block_invoke;
  v5[3] = &unk_1E5B4EA90;
  v5[4] = self;
  [(FCMyArticlesSearchOperation *)self _generateFeedRequestsForFeedRange:v4 completionHandler:v5];
}

void __47__FCMyArticlesSearchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 || ![v7 count])
  {
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:v9];
  }
  else
  {
    v10 = objc_alloc_init(FCFeedRequestOperation);
    v11 = [*(id *)(a1 + 32) context];
    [(FCFeedRequestOperation *)v10 setContext:v11];

    [(FCFeedRequestOperation *)v10 setConfiguration:v8];
    [(FCFeedRequestOperation *)v10 setFeedRequests:v7];
    uint64_t v12 = [*(id *)(a1 + 32) filterOptions];
    int v18 = [*(id *)(a1 + 32) context];
    char v13 = [v18 configurationManager];
    v14 = [v13 configuration];
    v15 = [*(id *)(a1 + 32) context];
    v16 = +[FCFeedTransformationFilter transformationWithFilterOptions:v12 configuration:v14 context:v15];
    v20[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [(FCFeedRequestOperation *)v10 setFeedTransformations:v17];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__FCMyArticlesSearchOperation_performOperation__block_invoke_2;
    v19[3] = &unk_1E5B4EA68;
    v19[4] = *(void *)(a1 + 32);
    [(FCFeedRequestOperation *)v10 setRequestCompletionHandler:v19];
    [*(id *)(a1 + 32) associateChildOperation:v10];
    [(FCOperation *)v10 start];
  }
}

void __47__FCMyArticlesSearchOperation_performOperation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v9 = a4;
  id v8 = [v7 _cappedFeedItemsFromResponses:a2 allFeedItems:a3];
  [*(id *)(a1 + 32) setResultFeedItems:v8];

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v9];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v13 = a3;
  v4 = [(FCMyArticlesSearchOperation *)self resultFeedItems];

  if (v13)
  {
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v5 = self;
    uint64_t v6 = 0;
  }
  else
  {
    if (v4) {
      goto LABEL_7;
    }
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    uint64_t v5 = self;
  }
  [(FCMyArticlesSearchOperation *)v5 setResultFeedItems:v6];
LABEL_7:
  id v7 = [(FCMyArticlesSearchOperation *)self searchCompletionHandler];

  id v9 = v13;
  if (v7)
  {
    v10 = [(FCMyArticlesSearchOperation *)self searchCompletionHandler];
    v11 = [(FCMyArticlesSearchOperation *)self resultFeedItems];
    uint64_t v12 = [(FCMyArticlesSearchOperation *)self resultFeedContextByFeedID];
    ((void (**)(void, void *, void *, id))v10)[2](v10, v11, v12, v13);

    id v9 = v13;
  }
  MEMORY[0x1F41817F8](v8, v9);
}

- (void)_generateFeedRequestsForFeedRange:(id)a3 completionHandler:(id)a4
{
  id v23 = a3;
  id v22 = a4;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__11;
  v41[4] = __Block_byref_object_dispose__11;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__11;
  v39[4] = __Block_byref_object_dispose__11;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__11;
  v37[4] = __Block_byref_object_dispose__11;
  id v38 = 0;
  uint64_t v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  id v7 = [(FCMyArticlesSearchOperation *)self context];
  uint64_t v8 = [v7 configurationManager];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke;
  v33[3] = &unk_1E5B4EAB8;
  v35 = v41;
  v36 = v39;
  id v9 = v6;
  v34 = v9;
  FCCoreConfigurationFetch(v8, v33);

  dispatch_group_enter(v9);
  v10 = [(FCMyArticlesSearchOperation *)self context];
  v11 = [v10 tagController];
  uint64_t v12 = [(FCMyArticlesSearchOperation *)self context];
  id v13 = [v12 subscriptionList];
  v14 = [v13 allSubscribedTagIDs];
  v15 = [v14 allObjects];
  uint64_t v16 = [(FCMyArticlesSearchOperation *)self qualityOfService];
  v17 = FCDispatchQueueForQualityOfService([(FCMyArticlesSearchOperation *)self qualityOfService]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_2;
  v30[3] = &unk_1E5B4EAE0;
  v32 = v37;
  int v18 = v9;
  v31 = v18;
  [v11 fetchTagsForTagIDs:v15 qualityOfService:v16 callbackQueue:v17 completionHandler:v30];

  v19 = FCDispatchQueueForQualityOfService([(FCMyArticlesSearchOperation *)self qualityOfService]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_3;
  block[3] = &unk_1E5B4EB58;
  id v26 = v22;
  v27 = v37;
  v28 = v39;
  v29 = v41;
  block[4] = self;
  id v25 = v23;
  id v20 = v23;
  id v21 = v22;
  dispatch_group_notify(v18, v19, block);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v41, 8);
}

void __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 copy];
  uint64_t v10 = *(void *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = a1[4];
  dispatch_group_leave(v12);
}

void __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 allValues];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v7);
}

void __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  objc_super v3 = [v2 purchaseController];
  uint64_t v4 = [v3 allPurchasedTagIDs];

  if ([*(id *)(a1 + 32) channelsOnly])
  {
    uint64_t v5 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "fc_arrayOfObjectsPassingTest:", &__block_literal_global_19);
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]) {
    BOOL v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_5;
    aBlock[3] = &unk_1E5B4EB30;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v31 = v9;
    aBlock[4] = v10;
    id v11 = v4;
    uint64_t v12 = *(void *)(a1 + 72);
    id v29 = v11;
    uint64_t v32 = v12;
    id v30 = *(id *)(a1 + 40);
    id v23 = _Block_copy(aBlock);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v27 = [*(id *)(a1 + 32) context];
    id v26 = [v27 subscriptionList];
    id v21 = [v26 mutedTagIDs];
    id v25 = [*(id *)(a1 + 32) context];
    __int16 v24 = [v25 purchaseController];
    id v13 = [v24 allPurchasedTagIDs];
    v14 = [*(id *)(a1 + 32) context];
    v15 = [v14 bundleSubscriptionManager];
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v17 = [*(id *)(a1 + 32) context];
    int v18 = [*(id *)(a1 + 32) context];
    v19 = [v18 pptContext];
    LOBYTE(v20) = [v19 isRunningPPT] ^ 1;
    +[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:](FCForYouQueryUtilities, "fetchTagsForQueryingWithSubscribedTags:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:", v22, v21, v13, v15, v16, v17, v20, [*(id *)(a1 + 32) qualityOfService], v23);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

BOOL __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 tagType] != 1;
}

void __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_6;
    aBlock[3] = &unk_1E5B4EB08;
    aBlock[4] = *(void *)(a1 + 32);
    id v25 = _Block_copy(aBlock);
    id v26 = v5;
    uint64_t v6 = [v5 allObjects];
    uint64_t v7 = *(void *)(a1 + 40);
    BOOL v8 = [*(id *)(a1 + 32) context];
    id v9 = [v8 bundleSubscriptionManager];
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = [*(id *)(a1 + 32) sidecar];
    id v13 = [*(id *)(a1 + 32) context];
    v14 = [v13 pptContext];
    LOBYTE(v24) = [v14 isRunningPPT];
    v15 = +[FCForYouQueryUtilities feedRequestsForTags:v6 tagBinProvider:v25 hiddenFeedIDs:MEMORY[0x1E4F1CBF0] allowPaidBundleFeed:1 purchasedTagIDs:v7 bundleSubscriptionProvider:v9 configuration:v10 maxCount:1000 feedRange:v11 sidecar:v12 isRunningPPT:v24];

    uint64_t v16 = [v15 feedContextByFeedID];
    [*(id *)(a1 + 32) setResultFeedContextByFeedID:v16];

    v17 = [v15 allRequests];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_msgSend(v22, "setCachedOnly:", objc_msgSend(*(id *)(a1 + 32), "cachedOnly"));
          id v23 = [*(id *)(a1 + 32) feature];
          [v22 setRequiredFeature:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v19);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    id v5 = v26;
  }
}

uint64_t __83__FCMyArticlesSearchOperation__generateFeedRequestsForFeedRange_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  if ([a2 tagType] != 1) {
    return 3;
  }
  objc_super v3 = [*(id *)(a1 + 32) context];
  uint64_t v4 = FCFeedBinForTopicsInForYou(v3);

  return v4;
}

- (id)_cappedFeedItemsFromResponses:(id)a3 allFeedItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FCMyArticlesSearchOperation *)self maxFeedItems]
    && (unint64_t v8 = [v7 count], v8 > -[FCMyArticlesSearchOperation maxFeedItems](self, "maxFeedItems")))
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = [v6 sortedArrayUsingSelector:sel_compareFeedItemCount_];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__FCMyArticlesSearchOperation__cappedFeedItemsFromResponses_allFeedItems___block_invoke_2;
    v15[3] = &unk_1E5B4EB80;
    v15[4] = self;
    id v11 = v9;
    id v16 = v11;
    id v17 = v6;
    [v10 enumerateObjectsUsingBlock:v15];
    uint64_t v12 = v17;
    id v13 = v11;
  }
  else
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __74__FCMyArticlesSearchOperation__cappedFeedItemsFromResponses_allFeedItems___block_invoke;
    id v21 = &unk_1E5B4C840;
    id v22 = v7;
    id v10 = v22;
    id v13 = v10;
  }

  return v13;
}

id __74__FCMyArticlesSearchOperation__cappedFeedItemsFromResponses_allFeedItems___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __74__FCMyArticlesSearchOperation__cappedFeedItemsFromResponses_allFeedItems___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 maxFeedItems];
  unint64_t v8 = v7 - [*(id *)(a1 + 40) count];
  double v9 = (double)v8 / (double)(unint64_t)([*(id *)(a1 + 48) count] - a3);
  id v10 = [v6 feedItems];
  double v11 = (double)(unint64_t)[v10 count];

  if (v9 >= v11)
  {
    v15 = *(void **)(a1 + 40);
    id v16 = [v6 feedItems];

    [v15 addObjectsFromArray:v16];
  }
  else
  {
    uint64_t v12 = [v6 feedItems];

    id v16 = [v12 sortedArrayUsingSelector:sel_compareGlobalUserFeedbackDescending_];

    id v13 = *(void **)(a1 + 40);
    v14 = objc_msgSend(v16, "fc_subarrayWithMaxCount:", (unint64_t)v9);
    [v13 addObjectsFromArray:v14];
  }
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (FCFeedItemFeature)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (FCDateRange)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
}

- (FCForYouQuerySidecar)sidecar
{
  return self->_sidecar;
}

- (void)setSidecar:(id)a3
{
}

- (BOOL)channelsOnly
{
  return self->_channelsOnly;
}

- (void)setChannelsOnly:(BOOL)a3
{
  self->_channelsOnly = a3;
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->_cachedOnly = a3;
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(unint64_t)a3
{
  self->_filterOptions = a3;
}

- (unint64_t)maxFeedItems
{
  return self->_maxFeedItems;
}

- (void)setMaxFeedItems:(unint64_t)a3
{
  self->_maxFeedItems = a3;
}

- (id)searchCompletionHandler
{
  return self->_searchCompletionHandler;
}

- (void)setSearchCompletionHandler:(id)a3
{
}

- (NSArray)resultFeedItems
{
  return self->_resultFeedItems;
}

- (void)setResultFeedItems:(id)a3
{
}

- (NSDictionary)resultFeedContextByFeedID
{
  return (NSDictionary *)objc_getProperty(self, a2, 440, 1);
}

- (void)setResultFeedContextByFeedID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedContextByFeedID, 0);
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong(&self->_searchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_sidecar, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end