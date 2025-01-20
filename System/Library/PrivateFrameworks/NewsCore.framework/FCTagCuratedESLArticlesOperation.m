@interface FCTagCuratedESLArticlesOperation
- (FCTagCuratedESLArticlesOperation)init;
- (FCTagCuratedESLArticlesOperation)initWithTags:(id)a3 context:(id)a4 configuration:(id)a5 bundleSubscriptionManager:(id)a6;
- (NSArray)networkEvents;
- (id)completionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setCompletionHandler:(id)a3;
@end

@implementation FCTagCuratedESLArticlesOperation

- (FCTagCuratedESLArticlesOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTagCuratedESLArticlesOperation init]";
    __int16 v9 = 2080;
    v10 = "FCTagCuratedESLArticlesOperation.m";
    __int16 v11 = 1024;
    int v12 = 46;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTagCuratedESLArticlesOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCTagCuratedESLArticlesOperation)initWithTags:(id)a3 context:(id)a4 configuration:(id)a5 bundleSubscriptionManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FCTagCuratedESLArticlesOperation;
  v14 = [(FCOperation *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    tags = v14->_tags;
    v14->_tags = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_context, a4);
    objc_storeStrong((id *)&v14->_configuration, a5);
    objc_storeStrong((id *)&v14->_bundleSubscriptionManager, a6);
    uint64_t v17 = [MEMORY[0x1E4F1C978] array];
    networkEvents = v14->_networkEvents;
    v14->_networkEvents = (NSArray *)v17;
  }
  return v14;
}

- (void)prepareOperation
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke;
  v10[3] = &unk_1E5B4C2A0;
  v10[4] = self;
  v3 = __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke((uint64_t)v10);
  if ([v3 length])
  {
    if (self) {
      tags = self->_tags;
    }
    else {
      tags = 0;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_16;
    v7[3] = &unk_1E5B4E9F0;
    id v8 = v3;
    v5 = tags;
    id v6 = [(NSArray *)v5 fc_arrayByTransformingWithBlock:v7];
    if (self) {
      objc_storeStrong((id *)&self->_evergreenArticleListIDs, v6);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_4;
    v9[3] = &unk_1E5B4C018;
    v9[4] = self;
    __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_4((uint64_t)v9);
  }
}

id __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[51];
  }
  v3 = v2;
  uint64_t v4 = [v3 cachedSubscription];
  v5 = objc_getAssociatedObject((id)v4, (const void *)(v4 + 1));
  uint64_t v6 = [v5 unsignedIntegerValue];
  char v7 = v6;
  id v8 = objc_getAssociatedObject((id)v4, (const void *)~v6);
  char v9 = ([v8 unsignedIntegerValue] + 1) ^ (v7 + 1);

  if (v9)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        v14 = *(void **)(v13 + 400);
      }
      else {
        v14 = 0;
      }
      id v12 = [v14 paidTagESLArticleListIDPrefix];
      goto LABEL_13;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = *(void **)(v10 + 400);
    }
    else {
      id v11 = 0;
    }
    id v12 = [v11 freeTagESLArticleListIDPrefix];
    goto LABEL_13;
  }
  id v12 = 0;
LABEL_13:
  return v12;
}

void __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    v5 = [v3 shortOperationDescription];
    int v6 = 138543362;
    char v7 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ found no prefix for per-tag ESL article lists", (uint8_t *)&v6, 0xCu);
  }
}

id __52__FCTagCuratedESLArticlesOperation_prepareOperation__block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasEvergreenArticleList])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v5 = [v3 identifier];
    int v6 = [v4 stringByAppendingString:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)performOperation
{
  v2 = self;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (FCTagCuratedESLArticlesOperation *)self->_evergreenArticleListIDs;
  }
  if ([(FCTagCuratedESLArticlesOperation *)self count])
  {
    id v3 = (id)FCOperationLog;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(FCOperation *)v2 shortOperationDescription];
      v5 = (void *)v4;
      if (v2) {
        evergreenArticleListIDs = v2->_evergreenArticleListIDs;
      }
      else {
        evergreenArticleListIDs = 0;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v4;
      __int16 v25 = 2114;
      v26 = evergreenArticleListIDs;
      _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch from article list IDs: %{public}@", buf, 0x16u);
    }
    char v7 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
    if (v2)
    {
      uint64_t v8 = [(FCContentContext *)v2->_context internalContentContext];
      char v9 = [v8 contentDatabase];
      -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v9);

      uint64_t v10 = v2->_evergreenArticleListIDs;
    }
    else
    {
      uint64_t v13 = [0 internalContentContext];
      v14 = [v13 contentDatabase];
      -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v7, v14);

      uint64_t v10 = 0;
    }
    -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v7, v10);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_22;
    v21[3] = &unk_1E5B4BF30;
    v21[4] = v2;
    id v11 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v21);
    -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v7, v11);

    objc_initWeak((id *)buf, v7);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_2;
    v18 = &unk_1E5B4EA40;
    v19 = v2;
    objc_copyWeak(&v20, (id *)buf);
    if (v7) {
      objc_setProperty_nonatomic_copy(v7, v12, &v15, 440);
    }
    -[FCOperation associateChildOperation:](v2, "associateChildOperation:", v7, v15, v16, v17, v18, v19);
    [(FCOperation *)v7 start];
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke;
    v22[3] = &unk_1E5B4C018;
    v22[4] = v2;
    __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke((uint64_t)v22);
  }
}

uint64_t __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will end early because there are no article list IDs", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
}

void __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_22(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  int v6 = v4;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v5, @"ArticleList", 16);
  }
  v24[0] = @"articleIDs";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v7, v8, 24);
  }

  v23 = @"articleIDs";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v9, v10, 32);
  }

  [v3 addObject:v6];
  id v11 = objc_opt_new();
  uint64_t v13 = v11;
  if (v11) {
    objc_setProperty_nonatomic_copy(v11, v12, @"Article", 16);
  }
  v14 = (void *)MEMORY[0x1E4F82A50];
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    uint64_t v16 = *(void **)(v15 + 392);
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = [v16 internalContentContext];
  v18 = [v17 articleRecordSource];
  v19 = [v14 keysForArticleRecordWithRecordSource:v18];
  v21 = v19;
  if (v13)
  {
    objc_setProperty_nonatomic_copy(v13, v20, v19, 24);

    objc_setProperty_nonatomic_copy(v13, v22, MEMORY[0x1E4F1CBF0], 32);
  }
  else
  {
  }
  [v3 addObject:v13];
}

void __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_3;
    v28 = &unk_1E5B4BE70;
    id v29 = *(id *)(a1 + 32);
    id v30 = v7;
    [v29 finishedPerformingOperationWithError:v30];
  }
  else
  {
    uint64_t v9 = objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_28);
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_5;
    v23[3] = &unk_1E5B4BF78;
    id v24 = v9;
    id v11 = v9;
    id v12 = objc_msgSend(v10, "fc_dictionary:", v23);
    uint64_t v13 = objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_7;
    v21[3] = &unk_1E5B4EA18;
    v21[4] = *(void *)(a1 + 32);
    id v22 = v12;
    id v14 = v12;
    uint64_t v15 = objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", v21);
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v17 = -[FCCKBatchedMultiFetchQueryOperation networkEvents](WeakRetained);
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      objc_storeStrong((id *)(v18 + 376), v17);
    }

    uint64_t v19 = *(void *)(a1 + 32);
    if (v19)
    {
      objc_storeStrong((id *)(v19 + 424), v15);
      id v20 = *(void **)(a1 + 32);
    }
    else
    {
      id v20 = 0;
    }
    [v20 finishedPerformingOperationWithError:0];
  }
}

uint64_t __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

uint64_t __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"ArticleList"];

  return v3;
}

void __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v9 = [v8 recordID];
        uint64_t v10 = [v9 recordName];

        objc_opt_class();
        id v11 = [v8 objectForKeyedSubscript:@"articleIDs"];
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            id v12 = v11;
          }
          else {
            id v12 = 0;
          }
        }
        else
        {
          id v12 = 0;
        }
        id v13 = v12;

        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v21 != v17) {
                objc_enumerationMutation(v14);
              }
              [v3 setObject:v10 forKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * j)];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v16);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
}

uint64_t __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Article"];

  return v3;
}

id __52__FCTagCuratedESLArticlesOperation_performOperation__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F82A50];
    id v6 = *(id *)(v3 + 392);
    id v7 = a2;
    uint64_t v8 = [v6 contentStoreFrontID];
    uint64_t v9 = [*(id *)(v3 + 392) internalContentContext];
    uint64_t v10 = [v9 articleRecordSource];
    id v11 = [v5 feedItemFromCKRecord:v7 storefrontID:v8 recordSource:v10];

    if (v11)
    {
      [v11 markAsEvergreen];
      id v12 = [v11 articleID];
      id v13 = [v4 objectForKeyedSubscript:v12];
      [v11 addSurfacedByArticleListID:v13];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v9 = a3;
  id v4 = [(FCTagCuratedESLArticlesOperation *)self completionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCTagCuratedESLArticlesOperation *)self completionHandler];
    id v6 = (void *)v5;
    if (self) {
      resultFeedItems = self->_resultFeedItems;
    }
    else {
      resultFeedItems = 0;
    }
    if (resultFeedItems) {
      uint64_t v8 = resultFeedItems;
    }
    else {
      uint64_t v8 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    (*(void (**)(uint64_t, NSArray *, id))(v5 + 16))(v5, v8, v9);
  }
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
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end