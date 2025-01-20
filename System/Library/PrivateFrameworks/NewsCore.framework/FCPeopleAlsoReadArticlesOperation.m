@interface FCPeopleAlsoReadArticlesOperation
- (FCContentContext)contentContext;
- (FCFeedItemServiceCursor)cursor;
- (FCPeopleAlsoReadArticlesOperation)init;
- (FCPeopleAlsoReadArticlesOperation)initWithContentContext:(id)a3 configuration:(id)a4 readingHistory:(id)a5 cursor:(id)a6;
- (FCPeopleAlsoReadConfiguration)configuration;
- (FCReadingHistory)readingHistory;
- (NSArray)networkEvents;
- (NSArray)resultFeedItems;
- (NSDate)referenceDate;
- (id)_feedItemFromArticleRecord:(id)a3 articleListsByArticleID:(id)a4;
- (id)completionHandler;
- (void)_continueOperation;
- (void)_continueOperationWithSeedArticleIDs:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setCompletionHandler:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentContext:(id)a3;
- (void)setCursor:(id)a3;
- (void)setNetworkEvents:(id)a3;
- (void)setReadingHistory:(id)a3;
- (void)setReferenceDate:(id)a3;
- (void)setResultFeedItems:(id)a3;
@end

@implementation FCPeopleAlsoReadArticlesOperation

- (FCPeopleAlsoReadArticlesOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPeopleAlsoReadArticlesOperation init]";
    __int16 v9 = 2080;
    v10 = "FCPeopleAlsoReadArticlesOperation.m";
    __int16 v11 = 1024;
    int v12 = 46;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPeopleAlsoReadArticlesOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPeopleAlsoReadArticlesOperation)initWithContentContext:(id)a3 configuration:(id)a4 readingHistory:(id)a5 cursor:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPeopleAlsoReadArticlesOperation initWithContentContext:configuration:readingHistory:cursor:]";
    __int16 v26 = 2080;
    v27 = "FCPeopleAlsoReadArticlesOperation.m";
    __int16 v28 = 1024;
    int v29 = 54;
    __int16 v30 = 2114;
    v31 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12) {
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "configuration");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPeopleAlsoReadArticlesOperation initWithContentContext:configuration:readingHistory:cursor:]";
    __int16 v26 = 2080;
    v27 = "FCPeopleAlsoReadArticlesOperation.m";
    __int16 v28 = 1024;
    int v29 = 55;
    __int16 v30 = 2114;
    v31 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "readingHistory");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPeopleAlsoReadArticlesOperation initWithContentContext:configuration:readingHistory:cursor:]";
    __int16 v26 = 2080;
    v27 = "FCPeopleAlsoReadArticlesOperation.m";
    __int16 v28 = 1024;
    int v29 = 56;
    __int16 v30 = 2114;
    v31 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v23.receiver = self;
  v23.super_class = (Class)FCPeopleAlsoReadArticlesOperation;
  uint64_t v15 = [(FCOperation *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contentContext, a3);
    objc_storeStrong((id *)&v16->_configuration, a4);
    objc_storeStrong((id *)&v16->_readingHistory, a5);
    uint64_t v17 = [v14 copy];
    cursor = v16->_cursor;
    v16->_cursor = (FCFeedItemServiceCursor *)v17;
  }
  return v16;
}

- (void)prepareOperation
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(FCPeopleAlsoReadArticlesOperation *)self setReferenceDate:v3];
}

- (void)performOperation
{
  id v3 = [(FCPeopleAlsoReadArticlesOperation *)self readingHistory];
  int v4 = [v3 isWaitingForFirstSync];

  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__FCPeopleAlsoReadArticlesOperation_performOperation__block_invoke;
    v5[3] = &unk_1E5B4C018;
    v5[4] = self;
    __53__FCPeopleAlsoReadArticlesOperation_performOperation__block_invoke((uint64_t)v5);
  }
  else
  {
    [(FCPeopleAlsoReadArticlesOperation *)self _continueOperation];
  }
}

void __53__FCPeopleAlsoReadArticlesOperation_performOperation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"People Also Read requires synced reading history.");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishedPerformingOperationWithError:v2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v9 = a3;
  int v4 = [(FCPeopleAlsoReadArticlesOperation *)self completionHandler];

  if (v4)
  {
    v5 = [(FCPeopleAlsoReadArticlesOperation *)self completionHandler];
    uint64_t v6 = [(FCPeopleAlsoReadArticlesOperation *)self resultFeedItems];
    v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = MEMORY[0x1E4F1CBF0];
    }
    ((void (**)(void, uint64_t, id))v5)[2](v5, v8, v9);
  }
}

- (void)_continueOperation
{
  id v3 = [(FCPeopleAlsoReadArticlesOperation *)self configuration];
  int v4 = [(FCPeopleAlsoReadArticlesOperation *)self readingHistory];
  v5 = objc_msgSend(v4, "mostRecentlyReadArticlesWithMaxCount:", objc_msgSend(v3, "seedMaxCount"));

  uint64_t v6 = [(FCPeopleAlsoReadArticlesOperation *)self referenceDate];
  v7 = objc_msgSend(v6, "dateByAddingTimeInterval:", (double)-objc_msgSend(v3, "seedMaxIntervalSinceLastReadSeconds"));

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke;
  v22[3] = &unk_1E5B4BE28;
  id v23 = v7;
  v24 = self;
  id v8 = v7;
  id v9 = objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v22);
  v10 = objc_msgSend(v9, "fc_setByTransformingWithBlock:", &__block_literal_global);
  id v11 = [FCArticleHeadlinesFetchOperation alloc];
  id v12 = [(FCPeopleAlsoReadArticlesOperation *)self contentContext];
  id v13 = [v10 allObjects];
  id v14 = [(FCArticleHeadlinesFetchOperation *)v11 initWithContext:v12 articleIDs:v13 ignoreCacheForArticleIDs:MEMORY[0x1E4F1CBF0]];

  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_2;
  v19 = &unk_1E5B4BEC0;
  v20 = self;
  id v21 = v3;
  id v15 = v3;
  [(FCFetchOperation *)v14 setFetchCompletionBlock:&v16];
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v14, v16, v17, v18, v19, v20);
  [(FCOperation *)v14 start];
}

uint64_t __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 lastVisitedAt];
  uint64_t v5 = objc_msgSend(v4, "fc_isLaterThanOrEqualTo:", *(void *)(a1 + 32));

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      id v8 = v6;
      id v9 = [v7 shortOperationDescription];
      v10 = [v3 articleID];
      id v11 = [v3 lastVisitedAt];
      uint64_t v12 = *(void *)(a1 + 32);
      int v14 = 138544130;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ excluding as a seed %@ because it was last visited at %@, which is prior to the earliest allowed date of %@", (uint8_t *)&v14, 0x2Au);
    }
  }

  return v5;
}

uint64_t __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_22(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

void __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_3;
    __int16 v20 = &unk_1E5B4BE70;
    id v21 = *(id *)(a1 + 32);
    id v22 = v3;
    int v4 = [v22 error];
    [v21 finishedPerformingOperationWithError:v4];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) referenceDate];
    uint64_t v6 = objc_msgSend(v5, "dateByAddingTimeInterval:", (double)-objc_msgSend(*(id *)(a1 + 40), "seedMaxAgeSeconds"));

    v7 = [v3 fetchedObject];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_4;
    int v14 = &unk_1E5B4BE98;
    uint64_t v8 = *(void *)(a1 + 32);
    id v15 = v6;
    uint64_t v16 = v8;
    id v9 = v6;
    v10 = objc_msgSend(v7, "fc_setByTransformingWithBlock:", &v11);
    objc_msgSend(*(id *)(a1 + 32), "_continueOperationWithSeedArticleIDs:", v10, v11, v12, v13, v14);
  }
}

void __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) error];
  [v1 finishedPerformingOperationWithError:v2];
}

id __55__FCPeopleAlsoReadArticlesOperation__continueOperation__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 publishDate];
  int v5 = objc_msgSend(v4, "fc_isLaterThanOrEqualTo:", *(void *)(a1 + 32));

  if (v5)
  {
    uint64_t v6 = [v3 articleID];
  }
  else
  {
    v7 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void **)(a1 + 40);
      id v9 = v7;
      v10 = [v8 shortOperationDescription];
      uint64_t v11 = [v3 articleID];
      uint64_t v12 = [v3 publishDate];
      uint64_t v13 = *(void *)(a1 + 32);
      int v15 = 138544130;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      __int16 v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ excluding as a seed %@ because it was published at %@, which is prior to the earliest allowed date of %@", (uint8_t *)&v15, 0x2Au);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_continueOperationWithSeedArticleIDs:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    v7 = [(FCOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    v63 = v7;
    __int16 v64 = 2048;
    uint64_t v65 = [v4 count];
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ querying using %ld seeds", buf, 0x16u);
  }
  v42 = self;
  uint64_t v8 = [(FCPeopleAlsoReadArticlesOperation *)self configuration];
  id v9 = +[FCAppleAccount sharedAccount];
  v10 = [v9 contentStoreFrontID];

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = [v8 candidateArticleListIDForSeedArticleID:*(void *)(*((void *)&v57 + 1) + 8 * i) storeFrontID:v10];
        [v11 addObject:v16];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v13);
  }

  __int16 v17 = [(FCPeopleAlsoReadArticlesOperation *)v42 cursor];
  uint64_t v18 = [v17 feedItems];
  __int16 v19 = objc_msgSend(v18, "fc_dictionaryWithKeyBlock:", &__block_literal_global_31);

  __int16 v20 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v21 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v23 = (void *)MEMORY[0x1E4F1C978];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_2;
  v50[3] = &unk_1E5B4BF08;
  v50[4] = v42;
  id v41 = v8;
  id v51 = v41;
  id v24 = v11;
  id v52 = v24;
  id v25 = v21;
  id v53 = v25;
  id v40 = v22;
  id v54 = v40;
  id v38 = v19;
  id v55 = v38;
  id v26 = v20;
  id v56 = v26;
  v27 = objc_msgSend(v23, "fc_array:", v50);
  __int16 v28 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
  int v29 = [(FCPeopleAlsoReadArticlesOperation *)v42 contentContext];
  __int16 v30 = [v29 internalContentContext];
  v31 = [v30 contentDatabase];
  -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v28, v31);

  -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v28, v27);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_3;
  v49[3] = &unk_1E5B4BF30;
  v49[4] = v42;
  uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v49);
  -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v28, v32);

  objc_initWeak((id *)buf, v28);
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_4;
  newValue[3] = &unk_1E5B4BFF0;
  newValue[4] = v42;
  id v33 = v25;
  id v44 = v33;
  id v34 = v26;
  id v45 = v34;
  id v35 = v24;
  id v46 = v35;
  id v36 = v41;
  id v47 = v36;
  objc_copyWeak(&v48, (id *)buf);
  if (v28) {
    objc_setProperty_nonatomic_copy(v28, v37, newValue, 440);
  }
  -[FCOperation associateChildOperation:](v42, "associateChildOperation:", v28, v38);
  [(FCOperation *)v28 start];
  objc_destroyWeak(&v48);

  objc_destroyWeak((id *)buf);
}

uint64_t __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_2(id *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[4] contentContext];
  int v5 = [v4 internalContentContext];
  uint64_t v6 = [v5 articleListRecordSource];

  v7 = objc_opt_new();
  [v7 setCachePolicy:4];
  objc_msgSend(v7, "setMaximumCachedAge:", (double)objc_msgSend(a1[5], "candidateArticleListMaxCachedAgeSeconds"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a1[6];
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    uint64_t v22 = v7;
    uint64_t v23 = v6;
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      uint64_t v24 = v9;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * v11);
        uint64_t v13 = [v6 cachedRecordWithID:v12];
        if (v13 && ![v6 isRecordStale:v13 withCachePolicy:v7])
        {
          [a1[7] setObject:v13 forKeyedSubscript:v12];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v14 = [v13 articleIDs];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v27 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
                [a1[8] setObject:v13 forKeyedSubscript:v19];
                __int16 v20 = [a1[9] objectForKeyedSubscript:v19];
                if (v20) {
                  [a1[10] setObject:v20 forKeyedSubscript:v19];
                }
                else {
                  [v3 addObject:v19];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v16);
          }

          v7 = v22;
          uint64_t v6 = v23;
          uint64_t v10 = v21;
          uint64_t v9 = v24;
        }
        else
        {
          [v3 addObject:v12];
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }
}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_3(uint64_t a1, void *a2)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v6 = v4;
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v5, @"ArticleList", 16);
  }
  v23[0] = @"articleIDs";
  v23[1] = @"type";
  v23[2] = @"metadata";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v7, v8, 24);
  }

  uint64_t v22 = @"articleIDs";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v9, v10, 32);
  }

  [v3 addObject:v6];
  uint64_t v11 = objc_opt_new();
  uint64_t v13 = v11;
  if (v11) {
    objc_setProperty_nonatomic_copy(v11, v12, @"Article", 16);
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F82A50];
  uint64_t v15 = [*(id *)(a1 + 32) contentContext];
  uint64_t v16 = [v15 internalContentContext];
  uint64_t v17 = [v16 articleRecordSource];
  uint64_t v18 = [v14 keysForArticleRecordWithRecordSource:v17];
  __int16 v20 = v18;
  if (v13)
  {
    objc_setProperty_nonatomic_copy(v13, v19, v18, 24);

    objc_setProperty_nonatomic_copy(v13, v21, MEMORY[0x1E4F1CBF0], 32);
  }
  else
  {
  }
  [v3 addObject:v13];
}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_4(id *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v63 = MEMORY[0x1E4F143A8];
    uint64_t v64 = 3221225472;
    uint64_t v65 = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_5;
    uint64_t v66 = &unk_1E5B4BE70;
    id v67 = a1[4];
    id v68 = v7;
    [v67 finishedPerformingOperationWithError:v68];
    uint64_t v9 = v68;
  }
  else
  {
    uint64_t v10 = objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_41);
    uint64_t v11 = [a1[4] contentContext];
    uint64_t v12 = [v11 internalContentContext];
    uint64_t v13 = [v12 articleListRecordSource];
    v49 = (void *)v10;
    uint64_t v14 = [v13 saveRecords:v10];

    uint64_t v15 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v16 = [a1[5] allValues];
    id v48 = v14;
    uint64_t v17 = [v14 allRecords];
    uint64_t v18 = objc_msgSend(v15, "fc_arrayByAddingObjectsFromArray:toArray:", v16, v17);

    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_7;
    v61[3] = &unk_1E5B4BF78;
    id v20 = v18;
    id v62 = v20;
    SEL v21 = objc_msgSend(v19, "fc_dictionary:", v61);
    uint64_t v22 = objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_46);
    uint64_t v23 = (void *)MEMORY[0x1E4F1C9E8];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_9;
    v56[3] = &unk_1E5B4BFA0;
    id v57 = a1[6];
    id v24 = v22;
    id v25 = a1[4];
    id v47 = v24;
    id v58 = v24;
    id v59 = v25;
    id v26 = v21;
    id v60 = v26;
    long long v27 = objc_msgSend(v23, "fc_dictionary:", v56);
    long long v28 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = a1[4];
      long long v30 = v28;
      long long v31 = [v29 shortOperationDescription];
      uint64_t v32 = [a1[7] count];
      *(_DWORD *)buf = 138543618;
      v70 = v31;
      __int16 v71 = 2048;
      uint64_t v72 = v32;
      _os_log_impl(&dword_1A460D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ accepted %ld seeds", buf, 0x16u);
    }
    long long v33 = [a1[4] referenceDate];
    id v34 = objc_msgSend(v33, "dateByAddingTimeInterval:", (double)-objc_msgSend(a1[8], "candidateMaxAgeSeconds"));

    id v35 = [MEMORY[0x1E4F1CA48] array];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_47;
    v50[3] = &unk_1E5B4BFC8;
    id v51 = a1[7];
    id v36 = v27;
    id v52 = v36;
    id v37 = v34;
    id v53 = v37;
    id v38 = v35;
    id v39 = a1[4];
    id v54 = v38;
    id v55 = v39;
    [v20 enumerateObjectsUsingBlock:v50];
    id v40 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = a1[4];
      v42 = v40;
      v43 = [v41 shortOperationDescription];
      uint64_t v44 = [v38 count];
      *(_DWORD *)buf = 138543618;
      v70 = v43;
      __int16 v71 = 2048;
      uint64_t v72 = v44;
      _os_log_impl(&dword_1A460D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ accepted %ld co-reads", buf, 0x16u);
    }
    WeakRetained = (id *)objc_loadWeakRetained(a1 + 9);
    id v46 = -[FCCKBatchedMultiFetchQueryOperation networkEvents](WeakRetained);
    [a1[4] setNetworkEvents:v46];

    [a1[4] setResultFeedItems:v38];
    [a1[4] finishedPerformingOperationWithError:0];

    uint64_t v9 = v49;
  }
}

uint64_t __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

uint64_t __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"ArticleList"];

  return v3;
}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [[FCArticleList alloc] initWithRecord:*(void *)(*((void *)&v19 + 1) + 8 * v7) interestToken:0];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v9 = [(FCArticleList *)v8 articleIDs];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              [v3 setObject:v8 forKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v13++)];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
}

uint64_t __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = [a2 recordType];
  uint64_t v3 = [v2 isEqualToString:@"Article"];

  return v3;
}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 48), "_feedItemFromArticleRecord:articleListsByArticleID:", v9, *(void *)(a1 + 56), (void)v13);
        uint64_t v11 = [v9 recordID];
        uint64_t v12 = [v11 recordName];
        [v3 setObject:v10 forKeyedSubscript:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void __74__FCPeopleAlsoReadArticlesOperation__continueOperationWithSeedArticleIDs___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 base];
  uint64_t v5 = [v4 identifier];

  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    id v24 = v5;
    id v25 = v3;
    uint64_t v6 = [v3 articleIDs];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      uint64_t v10 = (os_log_t *)&FCOperationLog;
      id v26 = v6;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          long long v13 = [v12 publishDate];
          int v14 = objc_msgSend(v13, "fc_isLaterThanOrEqualTo:", *(void *)(a1 + 48));

          if (v14)
          {
            [*(id *)(a1 + 56) addObject:v12];
          }
          else
          {
            os_log_t v15 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = *(void **)(a1 + 64);
              long long v17 = v15;
              uint64_t v18 = [v16 shortOperationDescription];
              long long v19 = [v12 articleID];
              [v12 publishDate];
              uint64_t v20 = v9;
              v22 = long long v21 = v10;
              uint64_t v23 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138544130;
              uint64_t v32 = v18;
              __int16 v33 = 2112;
              id v34 = v19;
              __int16 v35 = 2112;
              id v36 = v22;
              __int16 v37 = 2112;
              uint64_t v38 = v23;
              _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ excluding as a co-read %@ because it was published at %@, which is prior to the earliest allowed date of %@", buf, 0x2Au);

              uint64_t v10 = v21;
              uint64_t v9 = v20;

              uint64_t v6 = v26;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v8);
    }

    uint64_t v5 = v24;
    id v3 = v25;
  }
}

- (id)_feedItemFromArticleRecord:(id)a3 articleListsByArticleID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F82A50];
  id v8 = a3;
  uint64_t v9 = [(FCPeopleAlsoReadArticlesOperation *)self contentContext];
  uint64_t v10 = [v9 contentStoreFrontID];
  uint64_t v11 = [(FCPeopleAlsoReadArticlesOperation *)self contentContext];
  uint64_t v12 = [v11 internalContentContext];
  long long v13 = [v12 articleRecordSource];
  int v14 = [v7 feedItemFromCKRecord:v8 storefrontID:v10 recordSource:v13];

  if (v14)
  {
    os_log_t v15 = [v14 articleID];
    long long v16 = [v6 objectForKeyedSubscript:v15];

    if (v16)
    {
      long long v17 = [v16 identifier];
      [v14 addSurfacedByArticleListID:v17];

      uint64_t v18 = [v16 editorialMetadata];
      long long v19 = [v18 articleMetadata];
      uint64_t v20 = [v14 articleID];
      long long v21 = [v19 objectForKeyedSubscript:v20];

      [v21 conditionalScore];
      objc_msgSend(v14, "applyConditionalScore:");
    }
  }

  return v14;
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

- (void)setNetworkEvents:(id)a3
{
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (FCPeopleAlsoReadConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (void)setReadingHistory:(id)a3
{
}

- (FCFeedItemServiceCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (NSArray)resultFeedItems
{
  return self->_resultFeedItems;
}

- (void)setResultFeedItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFeedItems, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end