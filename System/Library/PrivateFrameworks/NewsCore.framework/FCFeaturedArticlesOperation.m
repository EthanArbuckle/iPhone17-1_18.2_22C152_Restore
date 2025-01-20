@interface FCFeaturedArticlesOperation
- (BOOL)validateOperation;
- (FCFeaturedArticlesOperation)init;
- (FCFeaturedArticlesOperation)initWithContext:(id)a3;
- (NSArray)networkEvents;
- (id)fetchCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setFetchCompletionHandler:(id)a3;
@end

@implementation FCFeaturedArticlesOperation

- (FCFeaturedArticlesOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeaturedArticlesOperation init]";
    __int16 v9 = 2080;
    v10 = "FCFeaturedArticlesOperation.m";
    __int16 v11 = 1024;
    int v12 = 39;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFeaturedArticlesOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCFeaturedArticlesOperation)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCFeaturedArticlesOperation;
  id v6 = [(FCOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C978] array];
    networkEvents = v7->_networkEvents;
    v7->_networkEvents = (NSArray *)v8;
  }
  return v7;
}

- (BOOL)validateOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self && self->_context)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2)
    {
      v3 = (void *)[[NSString alloc] initWithFormat:@"current featured headlines fetch operation requires a context"];
      int v5 = 136315906;
      id v6 = "-[FCFeaturedArticlesOperation validateOperation]";
      __int16 v7 = 2080;
      uint64_t v8 = "FCFeaturedArticlesOperation.m";
      __int16 v9 = 1024;
      int v10 = 59;
      __int16 v11 = 2114;
      int v12 = v3;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (void)performOperation
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke;
  v16[3] = &unk_1E5B4E758;
  v16[4] = self;
  v3 = [MEMORY[0x1E4F81BF0] firstly:v16];
  uint64_t v4 = zalgo();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke_2;
  v15[3] = &unk_1E5B4FCD8;
  v15[4] = self;
  int v5 = [v3 thenOn:v4 then:v15];
  id v6 = zalgo();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke_3;
  v14[3] = &unk_1E5B4FD00;
  v14[4] = self;
  __int16 v7 = [v5 thenOn:v6 then:v14];
  uint64_t v8 = zalgo();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke_4;
  v13[3] = &unk_1E5B4FD00;
  v13[4] = self;
  __int16 v9 = [v7 thenOn:v8 then:v13];
  int v10 = zalgo();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__FCFeaturedArticlesOperation_performOperation__block_invoke_5;
  v12[3] = &unk_1E5B4FD28;
  v12[4] = self;
  id v11 = (id)[v9 errorOn:v10 error:v12];
}

id __47__FCFeaturedArticlesOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    BOOL v2 = [*(id *)(v1 + 384) configurationManager];
    v3 = FCCoreConfigurationPromise(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __47__FCFeaturedArticlesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = [a2 paidBundleConfig];
    uint64_t v4 = [v3 featuredArticlesTagList];

    if (v4)
    {
      id v5 = v4;
      id v6 = objc_alloc(MEMORY[0x1E4F81BF0]);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_2;
      v11[3] = &unk_1E5B50378;
      v11[4] = v2;
      id v12 = v5;
      id v7 = v5;
      uint64_t v8 = (void *)[v6 initWithResolver:v11];
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x1E4F81BF0]);
      uint64_t v8 = (void *)[v9 initWithValue:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

id __47__FCFeaturedArticlesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__FCFeaturedArticlesOperation__promiseFeedItemsFromArticleRecords___block_invoke;
    v6[3] = &unk_1E5B4FD78;
    v6[4] = v2;
    v3 = objc_msgSend(a2, "fc_arrayByTransformingWithBlock:", v6);
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t __47__FCFeaturedArticlesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(v2 + 392), a2);
    uint64_t v4 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v4 finishedPerformingOperationWithError:0];
  return 0;
}

uint64_t __47__FCFeaturedArticlesOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(FCFeaturedArticlesOperation *)self fetchCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCFeaturedArticlesOperation *)self fetchCompletionHandler];
    id v6 = (void *)v5;
    if (self) {
      resultFeedItems = self->_resultFeedItems;
    }
    else {
      resultFeedItems = 0;
    }
    (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, resultFeedItems, v8);
  }
}

void __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(FCCKMultiFetchQueryOperation);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(void **)(v8 + 384);
  }
  else {
    id v9 = 0;
  }
  int v10 = [v9 internalContentContext];
  id v11 = [v10 contentDatabase];
  -[FCCKMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v11);

  uint64_t v13 = +[FCEdgeCacheHint edgeCacheHintForFeaturedArticles];
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v12, v13, 408);
  }

  v29[0] = *(void *)(a1 + 40);
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  -[FCCKMultiFetchQueryOperation setRecordIDs:]((uint64_t)v7, v14);

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_3;
  v28[3] = &unk_1E5B4BF30;
  v28[4] = *(void *)(a1 + 32);
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v28);
  -[FCCKMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v7, v15);

  objc_initWeak(&location, v7);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_4;
  v22 = &unk_1E5B50350;
  id v16 = v6;
  uint64_t v23 = *(void *)(a1 + 32);
  id v24 = v16;
  objc_copyWeak(&v26, &location);
  id v18 = v5;
  id v25 = v18;
  if (v7) {
    objc_setProperty_nonatomic_copy(v7, v17, &v19, 432);
  }
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v7, v19, v20, v21, v22, v23);
  [(FCOperation *)v7 start];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v6 = v4;
  if (v4)
  {
    objc_setProperty_nonatomic_copy(v4, v5, @"TagList", 16);
    objc_setProperty_nonatomic_copy(v6, v7, MEMORY[0x1E4F1CBF0], 24);
  }
  v43[0] = @"tagIDs";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v8, v9, 32);
  }

  [v3 addObject:v6];
  int v10 = objc_opt_new();
  id v12 = v10;
  if (v10)
  {
    objc_setProperty_nonatomic_copy(v10, v11, @"Tag", 16);
    objc_setProperty_nonatomic_copy(v12, v13, MEMORY[0x1E4F1CBF0], 24);
  }
  v42[0] = @"latestIssueIDs";
  v42[1] = @"currentNonIssueBundleFeaturedArticleListID";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  if (v12) {
    objc_setProperty_nonatomic_copy(v12, v14, v15, 32);
  }

  [v3 addObject:v12];
  id v16 = objc_opt_new();
  id v18 = v16;
  if (v16)
  {
    objc_setProperty_nonatomic_copy(v16, v17, @"Issue", 16);
    objc_setProperty_nonatomic_copy(v18, v19, MEMORY[0x1E4F1CBF0], 24);
  }
  v41 = @"bundleFeaturedArticleIDs";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  if (v18) {
    objc_setProperty_nonatomic_copy(v18, v20, v21, 32);
  }

  [v3 addObject:v18];
  v22 = objc_opt_new();
  id v24 = v22;
  if (v22)
  {
    objc_setProperty_nonatomic_copy(v22, v23, @"ArticleList", 16);
    objc_setProperty_nonatomic_copy(v24, v25, MEMORY[0x1E4F1CBF0], 24);
  }
  v40 = @"articleIDs";
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  if (v24) {
    objc_setProperty_nonatomic_copy(v24, v26, v27, 32);
  }

  [v3 addObject:v24];
  v28 = objc_opt_new();
  v30 = v28;
  if (v28) {
    objc_setProperty_nonatomic_copy(v28, v29, @"Article", 16);
  }
  v31 = (void *)MEMORY[0x1E4F82A50];
  uint64_t v32 = *(void *)(a1 + 32);
  if (v32) {
    v33 = *(void **)(v32 + 384);
  }
  else {
    v33 = 0;
  }
  v34 = [v33 internalContentContext];
  v35 = [v34 articleRecordSource];
  v36 = [v31 keysForArticleRecordWithRecordSource:v35];
  v38 = v36;
  if (v30)
  {
    objc_setProperty_nonatomic_copy(v30, v37, v36, 24);

    objc_setProperty_nonatomic_copy(v30, v39, MEMORY[0x1E4F1CBF0], 32);
  }
  else
  {
  }
  [v3 addObject:v30];
}

void __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    id v12 = (void (**)(id, id))*(id *)(a1 + 40);
    id v11 = v6;
    v12[2](v12, v11);
  }
  else
  {
    SEL v7 = objc_msgSend(a2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_23);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v9 = WeakRetained;
    if (WeakRetained) {
      int v10 = (void *)*((void *)WeakRetained + 52);
    }
    else {
      int v10 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 376), v10);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __71__FCFeaturedArticlesOperation__promiseArticleRecordsWithConfiguration___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Article"];

  return v3;
}

id __67__FCFeaturedArticlesOperation__promiseFeedItemsFromArticleRecords___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1E4F82A50];
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[48];
  }
  id v6 = v5;
  id v7 = a2;
  uint64_t v8 = [v6 contentStoreFrontID];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    int v10 = *(void **)(v9 + 384);
  }
  else {
    int v10 = 0;
  }
  id v11 = [v10 internalContentContext];
  id v12 = [v11 articleRecordSource];
  SEL v13 = [v4 feedItemFromCKRecord:v7 storefrontID:v8 recordSource:v12];

  [v13 markAsEvergreen];
  return v13;
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end