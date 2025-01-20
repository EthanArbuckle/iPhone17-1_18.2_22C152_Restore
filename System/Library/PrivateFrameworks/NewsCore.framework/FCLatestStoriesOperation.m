@interface FCLatestStoriesOperation
- (FCCloudContext)context;
- (FCCoreConfiguration)configuration;
- (FCDateRange)dateRange;
- (FCLatestStoriesOperation)initWithContext:(id)a3 dateRange:(id)a4 totalLimit:(unint64_t)a5 perFeedLimit:(unint64_t)a6;
- (NSArray)resultHeadlines;
- (id)_constructFeedRequestsFromTags:(id)a3;
- (id)headlinesCompletionHandler;
- (unint64_t)perFeedLimit;
- (unint64_t)totalLimit;
- (void)_fetchTagsForQueryingWithCompletionHandler:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setHeadlinesCompletionHandler:(id)a3;
- (void)setResultHeadlines:(id)a3;
@end

@implementation FCLatestStoriesOperation

- (FCLatestStoriesOperation)initWithContext:(id)a3 dateRange:(id)a4 totalLimit:(unint64_t)a5 perFeedLimit:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCLatestStoriesOperation;
  v13 = [(FCOperation *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v14->_dateRange, a4);
    v14->_totalLimit = a5;
    v14->_perFeedLimit = a6;
  }

  return v14;
}

- (void)prepareOperation
{
  id v6 = [(FCLatestStoriesOperation *)self context];
  v3 = [v6 configurationManager];
  v4 = [v3 configuration];
  configuration = self->_configuration;
  self->_configuration = v4;
}

- (void)performOperation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__FCLatestStoriesOperation_performOperation__block_invoke;
  v2[3] = &unk_1E5B50898;
  v2[4] = self;
  [(FCLatestStoriesOperation *)self _fetchTagsForQueryingWithCompletionHandler:v2];
}

void __44__FCLatestStoriesOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v7 = [*(id *)(a1 + 32) _constructFeedRequestsFromTags:v5];
    v8 = [v7 allRequests];
    v9 = [v7 feedContextByFeedID];
    v10 = objc_alloc_init(FCFeedRequestOperation);
    id v11 = [*(id *)(a1 + 32) configuration];
    [(FCFeedRequestOperation *)v10 setConfiguration:v11];

    id v12 = [*(id *)(a1 + 32) context];
    [(FCFeedRequestOperation *)v10 setContext:v12];

    [(FCFeedRequestOperation *)v10 setFeedRequests:v8];
    -[FCFeedRequestOperation setMaxCount:](v10, "setMaxCount:", [*(id *)(a1 + 32) totalLimit]);
    [(FCFeedRequestOperation *)v10 setOptions:[(FCFeedRequestOperation *)v10 options] | 0xE];
    [(FCFeedRequestOperation *)v10 setOptions:[(FCFeedRequestOperation *)v10 options] | 0x10];
    v13 = +[FCFeedDatabase temporaryFeedDatabaseWithEndpoint:1];
    [(FCFeedRequestOperation *)v10 setFeedDatabase:v13];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __44__FCLatestStoriesOperation_performOperation__block_invoke_3;
    v18 = &unk_1E5B4E6E8;
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = v9;
    id v14 = v9;
    [(FCFeedRequestOperation *)v10 setRequestCompletionHandler:&v15];
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v10, v15, v16, v17, v18, v19);
    [(FCOperation *)v10 start];
  }
  else
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __44__FCLatestStoriesOperation_performOperation__block_invoke_2;
    v24 = &unk_1E5B4BE70;
    id v25 = *(id *)(a1 + 32);
    id v26 = v6;
    [v25 finishedPerformingOperationWithError:v26];
  }
}

uint64_t __44__FCLatestStoriesOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

void __44__FCLatestStoriesOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc_init(FCFeedItemHeadlinesOperation);
  id v6 = [*(id *)(a1 + 32) context];
  [(FCFeedItemHeadlinesOperation *)v5 setContext:v6];

  v7 = [*(id *)(a1 + 32) configuration];
  [(FCFeedItemHeadlinesOperation *)v5 setConfiguration:v7];

  [(FCFeedItemHeadlinesOperation *)v5 setFeedItems:v4];
  v8 = [*(id *)(a1 + 32) context];
  v9 = [v8 feedPersonalizer];
  [(FCFeedItemHeadlinesOperation *)v5 setPersonalizer:v9];

  [(FCFeedItemHeadlinesOperation *)v5 setFeedPersonalizationConfigurationSet:0];
  [(FCFeedItemHeadlinesOperation *)v5 setFeedContextByFeedID:*(void *)(a1 + 40)];
  [(FCFeedItemHeadlinesOperation *)v5 setCachedOnly:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__FCLatestStoriesOperation_performOperation__block_invoke_4;
  v10[3] = &unk_1E5B4C8F8;
  v10[4] = *(void *)(a1 + 32);
  [(FCFeedItemHeadlinesOperation *)v5 setHeadlinesCompletionHandler:v10];
  [*(id *)(a1 + 32) associateChildOperation:v5];
  [(FCOperation *)v5 start];
}

void __44__FCLatestStoriesOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResultHeadlines:a2];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(FCLatestStoriesOperation *)self headlinesCompletionHandler];

  if (v4)
  {
    id v5 = [(FCLatestStoriesOperation *)self headlinesCompletionHandler];
    id v6 = [(FCLatestStoriesOperation *)self resultHeadlines];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (void)_fetchTagsForQueryingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FCLatestStoriesOperation *)self context];
  id v6 = [v5 subscriptionList];
  id v7 = FCDispatchQueueForQualityOfService([(FCLatestStoriesOperation *)self qualityOfService]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__FCLatestStoriesOperation__fetchTagsForQueryingWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5B508C0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 performFirstSyncWithCallbackQueue:v7 completion:v9];
}

void __71__FCLatestStoriesOperation__fetchTagsForQueryingWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v17 = [*(id *)(a1 + 32) context];
  uint64_t v16 = [v17 subscriptionList];
  id v12 = [v16 allSubscribedTagIDs];
  uint64_t v15 = [*(id *)(a1 + 32) context];
  id v14 = [v15 subscriptionList];
  id v11 = [v14 mutedTagIDs];
  v13 = [*(id *)(a1 + 32) context];
  v2 = [v13 purchaseController];
  v3 = [v2 allPurchasedTagIDs];
  id v4 = [*(id *)(a1 + 32) context];
  id v5 = [v4 bundleSubscriptionManager];
  id v6 = [*(id *)(a1 + 32) configuration];
  id v7 = [*(id *)(a1 + 32) context];
  id v8 = [*(id *)(a1 + 32) context];
  v9 = [v8 pptContext];
  LOBYTE(v10) = [v9 isRunningPPT] ^ 1;
  +[FCForYouQueryUtilities fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:](FCForYouQueryUtilities, "fetchTagsForQueryingWithSubscribedTagIDs:mutedTagIDs:purchasedTagIDs:bundleSubscriptionProvider:configuration:contentContext:fallbackToPresubscribedTagIDs:qualityOfService:completionHandler:", v12, v11, v3, v5, v6, v7, v10, [*(id *)(a1 + 32) qualityOfService], *(void *)(a1 + 40));
}

- (id)_constructFeedRequestsFromTags:(id)a3
{
  id v4 = a3;
  id v5 = [(FCLatestStoriesOperation *)self dateRange];
  id v6 = +[FCFeedRange feedRangeFromDateRange:v5];

  id v7 = [v4 allObjects];

  id v8 = [(FCLatestStoriesOperation *)self context];
  v9 = [v8 purchaseController];
  uint64_t v10 = [v9 allPurchasedTagIDs];
  id v11 = [(FCLatestStoriesOperation *)self context];
  id v12 = [v11 bundleSubscriptionManager];
  v13 = [(FCLatestStoriesOperation *)self configuration];
  unint64_t v14 = [(FCLatestStoriesOperation *)self perFeedLimit];
  uint64_t v15 = +[FCForYouQueryUtilities feedRequestsForTags:v7 tagBinProvider:&__block_literal_global_36 hiddenFeedIDs:MEMORY[0x1E4F1CBF0] purchasedTagIDs:v10 bundleSubscriptionProvider:v12 configuration:v13 maxCount:v14 feedRange:v6 sidecar:0 options:2];

  return v15;
}

uint64_t __59__FCLatestStoriesOperation__constructFeedRequestsFromTags___block_invoke()
{
  return 1;
}

- (id)headlinesCompletionHandler
{
  return self->_headlinesCompletionHandler;
}

- (void)setHeadlinesCompletionHandler:(id)a3
{
}

- (FCCloudContext)context
{
  return self->_context;
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (FCDateRange)dateRange
{
  return self->_dateRange;
}

- (unint64_t)totalLimit
{
  return self->_totalLimit;
}

- (unint64_t)perFeedLimit
{
  return self->_perFeedLimit;
}

- (NSArray)resultHeadlines
{
  return self->_resultHeadlines;
}

- (void)setResultHeadlines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeadlines, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_headlinesCompletionHandler, 0);
}

@end