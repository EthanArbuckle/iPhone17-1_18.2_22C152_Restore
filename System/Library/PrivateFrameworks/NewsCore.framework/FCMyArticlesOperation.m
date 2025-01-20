@interface FCMyArticlesOperation
+ (BOOL)prewarmDateRange:(id)a3 context:(id)a4;
+ (id)_prewarmRequestKeyForDateRange:(uint64_t)a1;
- (BOOL)includeEvergreenFeedItems;
- (BOOL)validateOperation;
- (FCCloudContext)context;
- (FCCoreConfiguration)configuration;
- (FCDateRange)dateRange;
- (FCForYouQuerySidecar)sidecar;
- (FCMyArticlesOperation)init;
- (FCMyArticlesTiming)timing;
- (id)feedItemCompletionBlock;
- (id)progressHandler;
- (int64_t)binOverride;
- (unint64_t)maxNumberOfFeedsToQuery;
- (unint64_t)perFeedLimit;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setBinOverride:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setDateRange:(id)a3;
- (void)setFeedItemCompletionBlock:(id)a3;
- (void)setIncludeEvergreenFeedItems:(BOOL)a3;
- (void)setMaxNumberOfFeedsToQuery:(unint64_t)a3;
- (void)setPerFeedLimit:(unint64_t)a3;
- (void)setProgressHandler:(id)a3;
- (void)setSidecar:(id)a3;
@end

@implementation FCMyArticlesOperation

- (FCMyArticlesOperation)init
{
  v7.receiver = self;
  v7.super_class = (Class)FCMyArticlesOperation;
  v2 = [(FCOperation *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_binOverride = 0;
    v4 = [[FCMyArticlesTiming alloc] initWithTotalTime:0.0 feedsNetworkTime:0.0 evergreenNetworkTime:0.0 scoringTime:0.0];
    timing = v3->_timing;
    v3->_timing = v4;
  }
  return v3;
}

- (BOOL)validateOperation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(FCMyArticlesOperation *)self configuration];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"my articles operation must have a configuration"];
    int v14 = 136315906;
    v15 = "-[FCMyArticlesOperation validateOperation]";
    __int16 v16 = 2080;
    v17 = "FCMyArticlesOperation.m";
    __int16 v18 = 1024;
    int v19 = 90;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
  }
  v4 = [(FCMyArticlesOperation *)self context];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)[[NSString alloc] initWithFormat:@"my articles operation must have a context"];
    int v14 = 136315906;
    v15 = "-[FCMyArticlesOperation validateOperation]";
    __int16 v16 = 2080;
    v17 = "FCMyArticlesOperation.m";
    __int16 v18 = 1024;
    int v19 = 91;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
  }
  v5 = [(FCMyArticlesOperation *)self dateRange];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"my articles operation must have a date range"];
    int v14 = 136315906;
    v15 = "-[FCMyArticlesOperation validateOperation]";
    __int16 v16 = 2080;
    v17 = "FCMyArticlesOperation.m";
    __int16 v18 = 1024;
    int v19 = 92;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
  }
  v6 = [(FCMyArticlesOperation *)self configuration];
  if (v6)
  {
    objc_super v7 = [(FCMyArticlesOperation *)self context];
    if (v7)
    {
      v8 = [(FCMyArticlesOperation *)self dateRange];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)performOperation
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__FCMyArticlesOperation_performOperation__block_invoke;
  v13[3] = &unk_1E5B50898;
  v13[4] = self;
  v3 = v13;
  if (self)
  {
    v4 = [(FCMyArticlesOperation *)self context];
    v5 = [(FCMyArticlesOperation *)self configuration];
    v6 = [(FCMyArticlesOperation *)self context];
    objc_super v7 = [v6 pptContext];
    char v8 = [v7 isRunningPPT];

    BOOL v9 = [v4 subscriptionList];
    v10 = FCDispatchQueueForQualityOfService([(FCMyArticlesOperation *)self qualityOfService]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__FCMyArticlesOperation__fetchTagsForQueryingWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E5B51C88;
    id v15 = v4;
    id v16 = v5;
    char v19 = v8;
    v17 = self;
    __int16 v18 = v3;
    id v11 = v5;
    id v12 = v4;
    [v9 performFirstSyncWithCallbackQueue:v10 completion:v14];
  }
}

void __41__FCMyArticlesOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v65 = a1;
    objc_super v7 = *(void **)(a1 + 32);
    id v8 = v5;
    id v66 = v6;
    id v67 = v5;
    v64 = v8;
    if (v7)
    {
      BOOL v9 = v8;
      v10 = [v7 dateRange];
      v68 = +[FCFeedRange feedRangeFromDateRange:v10];

      id v11 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        v13 = [v7 shortOperationDescription];
        int v14 = [v68 dateRange];
        id v15 = [v14 description];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ querying date range %{public}@", buf, 0x16u);
      }
      id v16 = NewsCoreUserDefaults();
      char v17 = [v16 BOOLForKey:@"exclude_hidden_feeds"];

      __int16 v18 = [v7 configuration];
      v63 = v18;
      if (v17)
      {
        v60 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v60 = [v18 hiddenFeedIDs];
      }
      char v19 = (void *)MEMORY[0x1E4F1CAD0];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke;
      v80 = &unk_1E5B4CD98;
      v81 = v7;
      v82 = v9;
      __int16 v20 = objc_msgSend(v19, "fc_set:", buf);
      v21 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = v21;
        v23 = [v7 shortOperationDescription];
        v24 = objc_msgSend(v20, "fc_arrayByTransformingWithBlock:", &__block_literal_global_28_1);
        v25 = [v24 description];
        *(_DWORD *)aBlock = 138543618;
        *(void *)&aBlock[4] = v23;
        *(_WORD *)&aBlock[12] = 2114;
        *(void *)&aBlock[14] = v25;
        _os_log_impl(&dword_1A460D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ querying tags %{public}@", aBlock, 0x16u);
      }
      *(void *)aBlock = MEMORY[0x1E4F143A8];
      *(void *)&aBlock[8] = 3221225472;
      *(void *)&aBlock[16] = __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_29;
      v86 = &unk_1E5B4EB08;
      v87 = v7;
      v69 = _Block_copy(aBlock);
      v62 = v20;
      v26 = [v20 allObjects];
      v27 = [v7 context];
      v28 = [v27 purchaseController];
      v29 = [v28 allPurchasedTagIDs];
      v30 = [v7 context];
      v31 = [v30 bundleSubscriptionManager];
      v61 = v30;
      if ([v7 perFeedLimit]) {
        uint64_t v32 = [v7 perFeedLimit];
      }
      else {
        uint64_t v32 = 1000;
      }
      v33 = [v7 sidecar];
      v34 = [v7 context];
      v35 = [v34 pptContext];
      LOBYTE(v59) = [v35 isRunningPPT];
      v36 = +[FCForYouQueryUtilities feedRequestsForTags:v26 tagBinProvider:v69 hiddenFeedIDs:v60 allowPaidBundleFeed:1 purchasedTagIDs:v29 bundleSubscriptionProvider:v31 configuration:v63 maxCount:v32 feedRange:v68 sidecar:v33 isRunningPPT:v59];
    }
    else
    {
      v36 = 0;
    }

    v37 = [v36 allRequests];
    v38 = [v36 feedContextByFeedID];
    v39 = objc_msgSend(v37, "fc_arrayByTransformingWithBlock:", &__block_literal_global_52);
    v40 = *(void **)(v65 + 32);
    if (v40)
    {
      if (![v40 maxNumberOfFeedsToQuery])
      {
        v41 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        objc_msgSend(v41, "setFc_lastKnownFeedIDs:", v39);
      }
      v42 = *(void **)(v65 + 32);
    }
    else
    {
      v42 = 0;
    }
    v70 = v36;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __41__FCMyArticlesOperation_performOperation__block_invoke_4;
    v71[3] = &unk_1E5B4C980;
    v71[4] = v42;
    id v72 = v38;
    id v43 = v38;
    v44 = v71;
    if (v42)
    {
      id v45 = v37;
      v46 = [v42 configuration];
      v47 = [v42 context];
      v48 = +[FCFeedTransformationFilter transformationWithFilterOptions:282 configuration:v46 context:v47];
      v89[0] = v48;
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:1];

      v50 = objc_alloc_init(FCFeedRequestOperation);
      v51 = [v42 context];
      [(FCFeedRequestOperation *)v50 setContext:v51];

      v52 = [v42 configuration];
      [(FCFeedRequestOperation *)v50 setConfiguration:v52];

      [(FCFeedRequestOperation *)v50 setFeedRequests:v45];
      [(FCFeedRequestOperation *)v50 setFeedTransformations:v49];
      [(FCFeedRequestOperation *)v50 setExpectedNetworkEventCount:1];
      if (![v42 maxNumberOfFeedsToQuery])
      {
        v53 = [v42 dateRange];
        v54 = +[FCMyArticlesOperation _prewarmRequestKeyForDateRange:]((uint64_t)FCMyArticlesOperation, v53);
        [(FCFeedRequestOperation *)v50 setPrewarmRequestKey:v54];
      }
      v55 = [v42 progressHandler];

      if (v55)
      {
        *(void *)aBlock = MEMORY[0x1E4F143A8];
        *(void *)&aBlock[8] = 3221225472;
        *(void *)&aBlock[16] = __83__FCMyArticlesOperation__fetchAllFeedItemsWithFeedRequests_feedContext_completion___block_invoke;
        v86 = &unk_1E5B4E3A0;
        v87 = v42;
        id v88 = v43;
        [(FCFeedRequestOperation *)v50 setProgressHandler:aBlock];
      }
      v56 = v50;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __83__FCMyArticlesOperation__fetchAllFeedItemsWithFeedRequests_feedContext_completion___block_invoke_2;
      v80 = &unk_1E5B51CF0;
      v81 = v42;
      v57 = v56;
      v82 = v57;
      v58 = v44;
      v83 = v57;
      id v84 = v58;
      [(FCFeedRequestOperation *)v57 setRequestCompletionHandler:buf];
      [v42 associateChildOperation:v57];
      [(FCOperation *)v57 start];
    }
    id v6 = v66;
    id v5 = v67;
  }
  else
  {
    uint64_t v73 = MEMORY[0x1E4F143A8];
    uint64_t v74 = 3221225472;
    v75 = __41__FCMyArticlesOperation_performOperation__block_invoke_2;
    v76 = &unk_1E5B4BE70;
    id v77 = *(id *)(a1 + 32);
    id v78 = v6;
    [v77 finishedPerformingOperationWithError:v78];
  }
}

uint64_t __41__FCMyArticlesOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

uint64_t __41__FCMyArticlesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 feedID];
}

void __41__FCMyArticlesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = a3;
  if (v5) {
    objc_storeStrong((id *)(v5 + 456), a2);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 464), *(id *)(a1 + 40));
    objc_super v7 = *(void **)(a1 + 32);
  }
  else
  {
    objc_super v7 = 0;
  }
  [v7 finishedPerformingOperationWithError:v8];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v11 = a3;
  v4 = [(FCMyArticlesOperation *)self feedItemCompletionBlock];

  if (v4)
  {
    uint64_t v5 = [(FCMyArticlesOperation *)self feedItemCompletionBlock];
    uint64_t v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
    if (self)
    {
      objc_super v7 = self->_resultFeedItems;
      id v8 = v7;
      if (v7) {
        uint64_t v6 = v7;
      }
      resultFeedContextByFeedID = self->_resultFeedContextByFeedID;
    }
    else
    {
      id v8 = 0;
      resultFeedContextByFeedID = 0;
    }
    if (resultFeedContextByFeedID) {
      v10 = resultFeedContextByFeedID;
    }
    else {
      v10 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    ((void (**)(void, NSArray *, NSDictionary *, id))v5)[2](v5, v6, v10, v11);
  }
}

void __68__FCMyArticlesOperation__fetchTagsForQueryingWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) subscriptionList];
  v2 = [v9 allSubscribedTagIDs];
  v3 = [*(id *)(a1 + 32) subscriptionList];
  v4 = [v3 mutedTagIDs];
  uint64_t v5 = [*(id *)(a1 + 32) purchaseController];
  uint64_t v6 = [v5 allPurchasedTagIDs];
  objc_super v7 = [*(id *)(a1 + 32) bundleSubscriptionManager];
  LOBYTE(v8) = *(unsigned char *)(a1 + 64) == 0;
  +[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:](FCForYouQueryUtilities, "fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:", v2, v4, v6, v7, *(void *)(a1 + 40), *(void *)(a1 + 32), v8, [*(id *)(a1 + 48) qualityOfService], *(void *)(a1 + 56));
}

void __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) maxNumberOfFeedsToQuery])
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 feedPersonalizer];
    objc_super v7 = [*(id *)(a1 + 40) allObjects];
    uint64_t v8 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", &__block_literal_global_23_0);
    id v9 = [v6 rankTagIDsDescending:v8];
    v10 = objc_msgSend(v9, "fc_subarrayWithMaxCount:", objc_msgSend(*(id *)(a1 + 32), "maxNumberOfFeedsToQuery"));
    id v11 = [v4 setWithArray:v10];

    id v12 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_3;
    v15[3] = &unk_1E5B4EE98;
    id v16 = v11;
    id v13 = v11;
    int v14 = objc_msgSend(v12, "fc_setOfObjectsPassingTest:", v15);
    [v3 unionSet:v14];
  }
  else
  {
    [v3 unionSet:*(void *)(a1 + 40)];
  }
}

uint64_t __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __56__FCMyArticlesOperation__constructFeedRequestsFromTags___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) binOverride])
  {
    uint64_t v4 = [*(id *)(a1 + 32) binOverride];
  }
  else if ([v3 tagType] == 1)
  {
    uint64_t v5 = [*(id *)(a1 + 32) context];
    uint64_t v4 = FCFeedBinForTopicsInForYou(v5);
  }
  else
  {
    uint64_t v4 = 3;
  }

  return v4;
}

+ (id)_prewarmRequestKeyForDateRange:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = +[FCPair pairWithFirst:@"MyArticles" second:v2];

  return v3;
}

void __83__FCMyArticlesOperation__fetchAllFeedItemsWithFeedRequests_feedContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 progressHandler];
  v5[2](v5, v4, *(void *)(a1 + 40));
}

void __83__FCMyArticlesOperation__fetchAllFeedItemsWithFeedRequests_feedContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v36 = a2;
  id v7 = a3;
  id v34 = a4;
  uint64_t v8 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    v10 = v8;
    id v11 = [v9 shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    v38 = v11;
    __int16 v39 = 2048;
    uint64_t v40 = [v7 count];
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with %lu unique feed items", buf, 0x16u);
  }
  id v12 = (void *)MEMORY[0x1E4F28C18];
  id v13 = (void *)MEMORY[0x1E4F1C9C8];
  objc_msgSend(*(id *)(a1 + 32), "operationStartTime", v34);
  int v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
  id v15 = [MEMORY[0x1E4F1C9C8] date];
  id v16 = objc_msgSend(v12, "fc_safeDateIntervalWithStartDate:endDate:", v14, v15);

  char v17 = [FCMyArticlesTiming alloc];
  __int16 v18 = [*(id *)(a1 + 40) networkEvents];
  uint64_t v19 = *(void *)(a1 + 32);
  if (!v19)
  {
    double v20 = 0.0;
    if (!v17) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  double v20 = *(double *)(v19 + 472);
  if (v17)
  {
LABEL_5:
    v21 = (void *)MEMORY[0x1E4F1CBF0];
    id v22 = MEMORY[0x1E4F1CBF0];
    id v23 = v18;
    [v16 duration];
    double v25 = v24;
    v26 = (void *)MEMORY[0x1E4F28C18];
    v27 = objc_msgSend(v23, "fc_arrayByTransformingWithBlock:", &__block_literal_global_137);

    objc_msgSend(v26, "fc_durationOfDateIntervalsIgnoringOverlap:", v27);
    double v29 = v28;
    v30 = (void *)MEMORY[0x1E4F28C18];
    v31 = objc_msgSend(v21, "fc_arrayByTransformingWithBlock:", &__block_literal_global_139);

    objc_msgSend(v30, "fc_durationOfDateIntervalsIgnoringOverlap:", v31);
    char v17 = [(FCMyArticlesTiming *)v17 initWithTotalTime:v25 feedsNetworkTime:v29 evergreenNetworkTime:v32 scoringTime:v20];

    uint64_t v19 = *(void *)(a1 + 32);
  }
LABEL_6:
  v33 = *(void **)(v19 + 448);
  *(void *)(v19 + 448) = v17;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 48) setRequestCompletionHandler:0];
}

+ (BOOL)prewarmDateRange:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v9 = objc_msgSend(v8, "fc_lastKnownFeedIDs");

  if (v9)
  {
    id v10 = v9;
    id v11 = +[FCFeedRange feedRangeFromDateRange:v6];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__FCMyArticlesOperation_prewarmDateRange_context___block_invoke_2;
    v19[3] = &unk_1E5B4DDA8;
    id v20 = v11;
    id v12 = v11;
    id v13 = objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", v19);

    int v14 = +[FCMyArticlesOperation _prewarmRequestKeyForDateRange:]((uint64_t)a1, v6);
    id v15 = [[FCFeedPrewarmRequest alloc] initWithRequestKey:v14 feedRequests:v13 options:1 edgeCacheHint:0];
    id v16 = [v7 internalContentContext];
    char v17 = [v16 feedPrewarmer];
    [v17 startPrewarmingRequest:v15];
  }
  return v9 != 0;
}

FCFeedRequest *__50__FCMyArticlesOperation_prewarmDateRange_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(FCFeedRequest);
  [(FCFeedRequest *)v4 setFeedID:v3];

  [(FCFeedRequest *)v4 setFeedRange:*(void *)(a1 + 32)];
  [(FCFeedRequest *)v4 setMaxCount:1000];
  return v4;
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
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

- (BOOL)includeEvergreenFeedItems
{
  return self->_includeEvergreenFeedItems;
}

- (void)setIncludeEvergreenFeedItems:(BOOL)a3
{
  self->_includeEvergreenFeedItems = a3;
}

- (int64_t)binOverride
{
  return self->_binOverride;
}

- (void)setBinOverride:(int64_t)a3
{
  self->_binOverride = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)feedItemCompletionBlock
{
  return self->_feedItemCompletionBlock;
}

- (void)setFeedItemCompletionBlock:(id)a3
{
}

- (unint64_t)maxNumberOfFeedsToQuery
{
  return self->_maxNumberOfFeedsToQuery;
}

- (void)setMaxNumberOfFeedsToQuery:(unint64_t)a3
{
  self->_maxNumberOfFeedsToQuery = a3;
}

- (unint64_t)perFeedLimit
{
  return self->_perFeedLimit;
}

- (void)setPerFeedLimit:(unint64_t)a3
{
  self->_perFeedLimit = a3;
}

- (FCMyArticlesTiming)timing
{
  return self->_timing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedContextByFeedID, 0);
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong(&self->_feedItemCompletionBlock, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_sidecar, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end