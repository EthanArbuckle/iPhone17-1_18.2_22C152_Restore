@interface FCGlobalCuratedESLArticlesOperation
- (FCGlobalCuratedESLArticlesOperation)init;
- (FCGlobalCuratedESLArticlesOperation)initWithContext:(id)a3 configuration:(id)a4 contentVariantProvider:(id)a5;
- (NSArray)networkEvents;
- (id)completionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setCompletionHandler:(id)a3;
@end

@implementation FCGlobalCuratedESLArticlesOperation

- (FCGlobalCuratedESLArticlesOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCGlobalCuratedESLArticlesOperation init]";
    __int16 v9 = 2080;
    v10 = "FCGlobalCuratedESLArticlesOperation.m";
    __int16 v11 = 1024;
    int v12 = 45;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCGlobalCuratedESLArticlesOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCGlobalCuratedESLArticlesOperation)initWithContext:(id)a3 configuration:(id)a4 contentVariantProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FCGlobalCuratedESLArticlesOperation;
  int v12 = [(FCOperation *)&v17 init];
  __int16 v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_contentVariantProvider, a5);
    uint64_t v14 = [MEMORY[0x1E4F1C978] array];
    networkEvents = v13->_networkEvents;
    v13->_networkEvents = (NSArray *)v14;
  }
  return v13;
}

- (void)prepareOperation
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__FCGlobalCuratedESLArticlesOperation_prepareOperation__block_invoke;
  v4[3] = &unk_1E5B505B0;
  v4[4] = self;
  v3 = __55__FCGlobalCuratedESLArticlesOperation_prepareOperation__block_invoke((uint64_t)v4);
  if (self) {
    objc_storeStrong((id *)&self->_evergreenArticleListIDs, v3);
  }
}

id __55__FCGlobalCuratedESLArticlesOperation_prepareOperation__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 400);
  }
  else {
    v3 = 0;
  }
  uint64_t v4 = (void *)[v3 preferredContentVariant];
  if (v4 == (void *)1)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        v8 = *(void **)(v7 + 392);
      }
      else {
        v8 = 0;
      }
      uint64_t v4 = [v8 paidGlobalESLArticleListIDs];
      goto LABEL_14;
    }
  }
  else
  {
    if (v4) {
      goto LABEL_14;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        id v6 = *(void **)(v5 + 392);
      }
      else {
        id v6 = 0;
      }
      uint64_t v4 = [v6 freeGlobalESLArticleListIDs];
      goto LABEL_14;
    }
  }
  uint64_t v4 = 0;
LABEL_14:
  return v4;
}

- (void)performOperation
{
  uint64_t v2 = self;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (FCGlobalCuratedESLArticlesOperation *)self->_evergreenArticleListIDs;
  }
  if ([(FCGlobalCuratedESLArticlesOperation *)self count])
  {
    v3 = (id)FCOperationLog;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(FCOperation *)v2 shortOperationDescription];
      uint64_t v5 = (void *)v4;
      if (v2) {
        evergreenArticleListIDs = v2->_evergreenArticleListIDs;
      }
      else {
        evergreenArticleListIDs = 0;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v4;
      __int16 v29 = 2114;
      v30 = evergreenArticleListIDs;
      _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch from article list IDs: %{public}@", buf, 0x16u);
    }
    uint64_t v7 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
    if (v2) {
      context = v2->_context;
    }
    else {
      context = 0;
    }
    id v9 = [(FCContentContext *)context internalContentContext];
    id v10 = [v9 contentDatabase];
    -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v10);

    int v12 = +[FCEdgeCacheHint edgeCacheHintForEvergreenArticles];
    if (v7) {
      objc_setProperty_nonatomic_copy(v7, v11, v12, 416);
    }

    if (v2) {
      __int16 v13 = v2->_evergreenArticleListIDs;
    }
    else {
      __int16 v13 = 0;
    }
    -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v7, v13);
    if (v7) {
      v7->_maxBatchSize = 1;
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_18;
    v25[3] = &unk_1E5B4BF30;
    v25[4] = v2;
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v25);
    -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v7, v14);

    uint64_t v15 = objc_opt_new();
    newValue[0] = MEMORY[0x1E4F143A8];
    newValue[1] = 3221225472;
    newValue[2] = __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_2;
    newValue[3] = &unk_1E5B51910;
    newValue[4] = v2;
    id v17 = v15;
    id v24 = v17;
    if (v7) {
      objc_setProperty_nonatomic_copy(v7, v16, newValue, 432);
    }
    objc_initWeak((id *)buf, v7);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_4;
    v20[3] = &unk_1E5B554E0;
    v20[4] = v2;
    objc_copyWeak(&v22, (id *)buf);
    id v19 = v17;
    id v21 = v19;
    if (v7) {
      objc_setProperty_nonatomic_copy(v7, v18, v20, 440);
    }
    [(FCOperation *)v2 associateChildOperation:v7];
    [(FCOperation *)v7 start];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke;
    v26[3] = &unk_1E5B4C018;
    v26[4] = v2;
    __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke((uint64_t)v26);
  }
}

uint64_t __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will end early because there are no article list IDs", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
}

void __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_18(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v6 = v4;
  if (v4)
  {
    objc_setProperty_nonatomic_copy(v4, v5, @"ArticleList", 16);
    objc_setProperty_nonatomic_copy(v6, v7, MEMORY[0x1E4F1CBF0], 24);
  }
  v22[0] = @"articleIDs";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v8, v9, 32);
  }

  [v3 addObject:v6];
  id v10 = objc_opt_new();
  int v12 = v10;
  if (v10) {
    objc_setProperty_nonatomic_copy(v10, v11, @"Article", 16);
  }
  __int16 v13 = (void *)MEMORY[0x1E4F82A50];
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    uint64_t v15 = *(void **)(v14 + 384);
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = [v15 internalContentContext];
  id v17 = [v16 articleRecordSource];
  v18 = [v13 keysForArticleRecordWithRecordSource:v17];
  v20 = v18;
  if (v12)
  {
    objc_setProperty_nonatomic_copy(v12, v19, v18, 24);

    objc_setProperty_nonatomic_copy(v12, v21, MEMORY[0x1E4F1CBF0], 32);
  }
  else
  {
  }
  [v3 addObject:v12];
}

void __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_25_0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(a1 + 32);
  SEL v7 = objc_msgSend(v5, "fc_onlyObject");

  id v8 = v7;
  uint64_t v9 = v8;
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__FCGlobalCuratedESLArticlesOperation__feedItemsFromArticleRecords_sourceArticleListID___block_invoke;
    v12[3] = &unk_1E5B4EA18;
    v12[4] = v6;
    id v13 = v8;
    id v10 = objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v12);
  }
  else
  {
    id v10 = 0;
  }

  [*(id *)(a1 + 40) addObjectsFromArray:v10];
}

uint64_t __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Article"];

  return v3;
}

void __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_4(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    id v13 = a1[4];
    id v14 = v5;
    objc_msgSend(v13, "finishedPerformingOperationWithError:", v14, v12, 3221225472, __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_5, &unk_1E5B4BE70, v13);
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
    id v8 = -[FCCKBatchedMultiFetchQueryOperation networkEvents](WeakRetained);
    uint64_t v9 = (id *)a1[4];
    if (v9) {
      objc_storeStrong(v9 + 47, v8);
    }

    id v10 = [a1[5] readOnlyArray];
    id v11 = (id *)a1[4];
    if (v11) {
      objc_storeStrong(v11 + 52, v10);
    }

    [a1[4] finishedPerformingOperationWithError:0];
  }
}

uint64_t __55__FCGlobalCuratedESLArticlesOperation_performOperation__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(FCGlobalCuratedESLArticlesOperation *)self completionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCGlobalCuratedESLArticlesOperation *)self completionHandler];
    uint64_t v6 = (void *)v5;
    if (self) {
      resultFeedItems = self->_resultFeedItems;
    }
    else {
      resultFeedItems = 0;
    }
    if (resultFeedItems) {
      id v8 = resultFeedItems;
    }
    else {
      id v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, v8, v9);
  }
}

id __88__FCGlobalCuratedESLArticlesOperation__feedItemsFromArticleRecords_sourceArticleListID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1E4F82A50];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    uint64_t v5 = (void *)v5[48];
  }
  uint64_t v6 = v5;
  id v7 = a2;
  id v8 = [v6 contentStoreFrontID];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    id v10 = *(void **)(v9 + 384);
  }
  else {
    id v10 = 0;
  }
  id v11 = [v10 internalContentContext];
  uint64_t v12 = [v11 articleRecordSource];
  id v13 = [v4 feedItemFromCKRecord:v7 storefrontID:v8 recordSource:v12];

  [v13 markAsEvergreen];
  [v13 addSurfacedByArticleListID:*(void *)(a1 + 40)];
  return v13;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong((id *)&self->_evergreenArticleListIDs, 0);
  objc_storeStrong((id *)&self->_contentVariantProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end