@interface FCCKBatchedOrderFeedQueryOperation
- (FCCKBatchedOrderFeedQueryOperation)init;
- (FCThreadSafeMutableArray)allErrors;
- (FCThreadSafeMutableArray)allFeedItemAndArticleRecords;
- (FCThreadSafeMutableArray)allFeedResponses;
- (FCThreadSafeMutableArray)allIssueRecords;
- (FCThreadSafeMutableArray)allNetworkEvents;
- (FCThreadSafeMutableArray)allTagRecords;
- (id)networkEvents;
- (id)promiseRejectBlock;
- (id)promiseResolveBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setDatabase:(uint64_t)a1;
@end

@implementation FCCKBatchedOrderFeedQueryOperation

- (FCCKBatchedOrderFeedQueryOperation)init
{
  v22.receiver = self;
  v22.super_class = (Class)FCCKBatchedOrderFeedQueryOperation;
  v2 = [(FCOperation *)&v22 init];
  if (v2)
  {
    v3 = objc_alloc_init(FCThreadSafeMutableArray);
    allFeedItemAndArticleRecords = v2->_allFeedItemAndArticleRecords;
    v2->_allFeedItemAndArticleRecords = v3;

    v5 = objc_alloc_init(FCThreadSafeMutableArray);
    allFeedResponses = v2->_allFeedResponses;
    v2->_allFeedResponses = v5;

    v7 = objc_alloc_init(FCThreadSafeMutableArray);
    allTagRecords = v2->_allTagRecords;
    v2->_allTagRecords = v7;

    v9 = objc_alloc_init(FCThreadSafeMutableArray);
    allIssueRecords = v2->_allIssueRecords;
    v2->_allIssueRecords = v9;

    v11 = objc_alloc_init(FCThreadSafeMutableArray);
    allNetworkEvents = v2->_allNetworkEvents;
    v2->_allNetworkEvents = v11;

    v13 = objc_alloc_init(FCThreadSafeMutableArray);
    allErrors = v2->_allErrors;
    v2->_allErrors = v13;

    id v15 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__FCCKBatchedOrderFeedQueryOperation_init__block_invoke;
    v20[3] = &unk_1E5B4EEF0;
    v16 = v2;
    v21 = v16;
    uint64_t v17 = [v15 initWithResolver:v20];
    queryCompletionPromise = v16->_queryCompletionPromise;
    v16->_queryCompletionPromise = (NFPromise *)v17;
  }
  return v2;
}

void __42__FCCKBatchedOrderFeedQueryOperation_init__block_invoke(uint64_t a1, const void *a2, void *a3)
{
  id v5 = a3;
  v6 = _Block_copy(a2);
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 496);
  *(void *)(v7 + 496) = v6;

  v9 = _Block_copy(v5);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 504);
  *(void *)(v10 + 504) = v9;
}

- (id)networkEvents
{
  if (a1)
  {
    v1 = [a1 allNetworkEvents];
    v2 = [v1 readOnlyArray];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)performOperation
{
  dispatch_group_t v3 = dispatch_group_create();
  if (self) {
    feedRequests = self->_feedRequests;
  }
  else {
    feedRequests = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke;
  v8[3] = &unk_1E5B4E3A0;
  v8[4] = self;
  dispatch_group_t v9 = v3;
  id v5 = v3;
  [(NSArray *)feedRequests fc_visitSubarraysWithMaxCount:400 block:v8];
  v6 = FCDispatchQueueForQualityOfService([(FCCKBatchedOrderFeedQueryOperation *)self qualityOfService]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke_3;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  dispatch_group_notify(v5, v6, block);
}

void __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(FCCKOrderFeedQueryOperation);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 368);
  }
  else {
    uint64_t v7 = 0;
  }
  -[FCCKOrderFeedQueryOperation setDatabase:]((uint64_t)v4, v7);
  if (v5) {
    objc_setProperty_nonatomic_copy(v5, v8, v3, 376);
  }
  dispatch_group_t v9 = *(void **)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = (void *)v9[48];
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v10 = 0;
  if (v5)
  {
LABEL_7:
    objc_setProperty_nonatomic_copy(v5, v8, v10, 384);
    dispatch_group_t v9 = *(void **)(a1 + 32);
  }
LABEL_8:
  if (v9)
  {
    unint64_t v11 = v9[49];
    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  unint64_t v11 = 0;
  if (v5)
  {
LABEL_10:
    v5->_resultsLimit = v11;
    dispatch_group_t v9 = *(void **)(a1 + 32);
  }
LABEL_11:
  if (v9)
  {
    unint64_t v12 = v9[50];
    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unint64_t v12 = 0;
  if (v5)
  {
LABEL_13:
    v5->_queryPriority = v12;
    dispatch_group_t v9 = *(void **)(a1 + 32);
  }
LABEL_14:
  if (v9)
  {
    v13 = (void *)v9[51];
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v13 = 0;
  if (v5)
  {
LABEL_16:
    objc_setProperty_nonatomic_copy(v5, v8, v13, 408);
    dispatch_group_t v9 = *(void **)(a1 + 32);
  }
LABEL_17:
  if (v9)
  {
    v14 = (void *)v9[52];
    if (!v5) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v14 = 0;
  if (v5)
  {
LABEL_19:
    objc_setProperty_nonatomic_copy(v5, v8, v14, 416);
    dispatch_group_t v9 = *(void **)(a1 + 32);
  }
LABEL_20:
  if (v9)
  {
    id v15 = (void *)v9[53];
    if (!v5) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  id v15 = 0;
  if (v5) {
LABEL_22:
  }
    objc_setProperty_nonatomic_copy(v5, v8, v15, 424);
LABEL_23:
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  objc_initWeak(&location, v5);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke_2;
  v20 = &unk_1E5B59250;
  uint64_t v21 = *(void *)(a1 + 32);
  objc_copyWeak(&v23, &location);
  id v22 = *(id *)(a1 + 40);
  if (v5) {
    objc_setProperty_nonatomic_copy(v5, v16, &v17, 440);
  }
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v5, v17, v18, v19, v20, v21);
  [(FCOperation *)v5 start];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v25 = a3;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v7 = [v5 allFeedItemAndArticleRecords];
  if (v6) {
    v8 = (void *)v6[1];
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  [v7 addObjectsFromArray:v9];

  uint64_t v10 = [*(id *)(a1 + 32) allFeedResponses];
  if (v6) {
    unint64_t v11 = (void *)v6[2];
  }
  else {
    unint64_t v11 = 0;
  }
  id v12 = v11;
  [v10 addObjectsFromArray:v12];

  v13 = [*(id *)(a1 + 32) allTagRecords];
  if (v6) {
    v14 = (void *)v6[3];
  }
  else {
    v14 = 0;
  }
  id v15 = v14;
  [v13 addObjectsFromArray:v15];

  v16 = [*(id *)(a1 + 32) allIssueRecords];
  if (v6) {
    uint64_t v17 = (void *)v6[4];
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  [v16 addObjectsFromArray:v18];
  v19 = [*(id *)(a1 + 32) allNetworkEvents];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v21 = WeakRetained;
  if (WeakRetained) {
    id v22 = (void *)*((void *)WeakRetained + 54);
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;
  [v19 addObjectsFromArray:v23];

  if (v25)
  {
    v24 = [*(id *)(a1 + 32) allErrors];
    [v24 addObject:v25];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__FCCKBatchedOrderFeedQueryOperation_performOperation__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allErrors];
  id v3 = [v2 firstObject];

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v3];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v18 = a3;
  v4 = [(FCCKBatchedOrderFeedQueryOperation *)self allTagRecords];
  id v5 = [v4 readOnlyArray];
  uint64_t v6 = objc_msgSend(v5, "fc_uniqueByValueBlock:", &__block_literal_global_139);

  uint64_t v7 = [(FCCKBatchedOrderFeedQueryOperation *)self allIssueRecords];
  v8 = [v7 readOnlyArray];
  id v9 = objc_msgSend(v8, "fc_uniqueByValueBlock:", &__block_literal_global_8_2);

  uint64_t v10 = [FCCKOrderFeedQueryResult alloc];
  unint64_t v11 = [(FCCKBatchedOrderFeedQueryOperation *)self allFeedItemAndArticleRecords];
  id v12 = [v11 readOnlyArray];
  v13 = [(FCCKBatchedOrderFeedQueryOperation *)self allFeedResponses];
  v14 = [v13 readOnlyArray];
  id v15 = -[FCCKOrderFeedQueryResult initWithFeedItemAndArticleRecords:feedResponses:tagRecords:issueRecords:]((id *)&v10->super.isa, v12, v14, v6, v9);

  if (v18) {
    [(FCCKBatchedOrderFeedQueryOperation *)self promiseRejectBlock];
  }
  else {
  v16 = [(FCCKBatchedOrderFeedQueryOperation *)self promiseResolveBlock];
  }
  v16[2]();

  if (self)
  {
    queryCompletionHandler = (void (**)(id, id *, id))self->_queryCompletionHandler;
    if (queryCompletionHandler) {
      queryCompletionHandler[2](queryCompletionHandler, v15, v18);
    }
  }
}

id __67__FCCKBatchedOrderFeedQueryOperation_operationWillFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 recordID];
  id v3 = [v2 recordName];

  return v3;
}

id __67__FCCKBatchedOrderFeedQueryOperation_operationWillFinishWithError___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 recordID];
  id v3 = [v2 recordName];

  return v3;
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

- (FCThreadSafeMutableArray)allFeedItemAndArticleRecords
{
  return self->_allFeedItemAndArticleRecords;
}

- (FCThreadSafeMutableArray)allFeedResponses
{
  return self->_allFeedResponses;
}

- (FCThreadSafeMutableArray)allTagRecords
{
  return self->_allTagRecords;
}

- (FCThreadSafeMutableArray)allIssueRecords
{
  return self->_allIssueRecords;
}

- (FCThreadSafeMutableArray)allNetworkEvents
{
  return self->_allNetworkEvents;
}

- (FCThreadSafeMutableArray)allErrors
{
  return self->_allErrors;
}

- (id)promiseResolveBlock
{
  return self->_promiseResolveBlock;
}

- (id)promiseRejectBlock
{
  return self->_promiseRejectBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promiseRejectBlock, 0);
  objc_storeStrong(&self->_promiseResolveBlock, 0);
  objc_storeStrong((id *)&self->_allErrors, 0);
  objc_storeStrong((id *)&self->_allNetworkEvents, 0);
  objc_storeStrong((id *)&self->_allIssueRecords, 0);
  objc_storeStrong((id *)&self->_allTagRecords, 0);
  objc_storeStrong((id *)&self->_allFeedResponses, 0);
  objc_storeStrong((id *)&self->_allFeedItemAndArticleRecords, 0);
  objc_storeStrong((id *)&self->_queryCompletionPromise, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_articleLinkKeys, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_feedRequests, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end