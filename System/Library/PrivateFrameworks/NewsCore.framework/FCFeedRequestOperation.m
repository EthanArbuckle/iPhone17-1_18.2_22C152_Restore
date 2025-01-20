@interface FCFeedRequestOperation
+ (id)feedRequestContentEnvironmentTokenWithContext:(id)a3;
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)validateOperation;
- (FCContentContext)context;
- (FCCoreConfiguration)configuration;
- (FCEdgeCacheHint)edgeCacheHint;
- (FCFeedDatabase)feedDatabase;
- (FCFeedRequestOperation)init;
- (FCFeedResponse)_failureResponseForRequest:(void *)a3 error:;
- (NSArray)feedRequests;
- (NSArray)feedTransformations;
- (NSArray)networkEvents;
- (NSCopying)prewarmRequestKey;
- (id)_additionalHTTPHeadersForOrderFeedRequest;
- (id)progressHandler;
- (id)requestCompletionHandler;
- (id)requestCompletionHandlerWithHeldRecords;
- (int64_t)options;
- (uint64_t)_countOfDroppedFeeds;
- (unint64_t)expectedNetworkEventCount;
- (unint64_t)maxCount;
- (unint64_t)maxRetries;
- (void)_gatherAllOrderFeedResponsesWithCompletionHandler:(void *)a1;
- (void)_reportProgressWithFeedItems:(id *)a1;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)resetForRetry;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setEdgeCacheHint:(id)a3;
- (void)setExpectedNetworkEventCount:(unint64_t)a3;
- (void)setFeedDatabase:(id)a3;
- (void)setFeedRequests:(id)a3;
- (void)setFeedTransformations:(id)a3;
- (void)setMaxCount:(unint64_t)a3;
- (void)setOptions:(int64_t)a3;
- (void)setPrewarmRequestKey:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setRequestCompletionHandler:(id)a3;
- (void)setRequestCompletionHandlerWithHeldRecords:(id)a3;
- (void)setResultHeldArticleRecords:(uint64_t)a1;
- (void)setResultHeldIssueRecords:(uint64_t)a1;
- (void)setResultHeldTagRecords:(uint64_t)a1;
@end

@implementation FCFeedRequestOperation

+ (id)feedRequestContentEnvironmentTokenWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
    *(_DWORD *)buf = 136315906;
    v12 = "+[FCFeedRequestOperation feedRequestContentEnvironmentTokenWithContext:]";
    __int16 v13 = 2080;
    v14 = "FCFeedRequestOperation.m";
    __int16 v15 = 1024;
    int v16 = 89;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v4 = NSString;
  v5 = [v3 contentEnvironmentToken];
  v6 = [v3 internalContentContext];
  v7 = [v6 feedDatabase];
  v8 = [v4 stringWithFormat:@"%@-%zd", v5, objc_msgSend(v7, "endpoint")];

  return v8;
}

- (FCFeedRequestOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)FCFeedRequestOperation;
  v2 = [(FCOperation *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    progressReportedFeedItems = v2->_progressReportedFeedItems;
    v2->_progressReportedFeedItems = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resultFeedResponses = v2->_resultFeedResponses;
    v2->_resultFeedResponses = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableNetworkEvents = v2->_mutableNetworkEvents;
    v2->_mutableNetworkEvents = v7;

    v2->_queryBudget = 10;
  }
  return v2;
}

- (BOOL)validateOperation
{
  v2 = self;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = [(FCFeedRequestOperation *)self context];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v35 = (void *)[[NSString alloc] initWithFormat:@"feed request operation requires a context"];
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCFeedRequestOperation validateOperation]";
    __int16 v48 = 2080;
    v49 = "FCFeedRequestOperation.m";
    __int16 v50 = 1024;
    int v51 = 109;
    __int16 v52 = 2114;
    v53 = v35;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v4 = [(FCFeedRequestOperation *)v2 configuration];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v36 = (void *)[[NSString alloc] initWithFormat:@"feed request operation requires a configuration"];
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCFeedRequestOperation validateOperation]";
    __int16 v48 = 2080;
    v49 = "FCFeedRequestOperation.m";
    __int16 v50 = 1024;
    int v51 = 110;
    __int16 v52 = 2114;
    v53 = v36;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCFeedRequestOperation *)v2 feedRequests];
  uint64_t v6 = [v5 count];

  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v37 = (void *)[[NSString alloc] initWithFormat:@"feed request operation requires at least one request"];
    *(_DWORD *)buf = 136315906;
    v47 = "-[FCFeedRequestOperation validateOperation]";
    __int16 v48 = 2080;
    v49 = "FCFeedRequestOperation.m";
    __int16 v50 = 1024;
    int v51 = 111;
    __int16 v52 = 2114;
    v53 = v37;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v7 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(FCFeedRequestOperation *)v2 feedRequests];
  uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    objc_super v10 = MEMORY[0x1E4F14500];
    uint64_t v40 = *(void *)v42;
    v38 = v2;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v42 != v40) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        __int16 v13 = [v12 feedID];
        if (v13)
        {
          if ([v7 containsObject:v13] && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)[[NSString alloc] initWithFormat:@"only one feed request is allowed per feedID and feedID %@ is duplicated", v13];
            *(_DWORD *)buf = 136315906;
            v47 = "-[FCFeedRequestOperation validateOperation]";
            __int16 v48 = 2080;
            v49 = "FCFeedRequestOperation.m";
            __int16 v50 = 1024;
            int v51 = 125;
            __int16 v52 = 2114;
            v53 = v28;
            _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          [v7 addObject:v13];
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v24 = (void *)[[NSString alloc] initWithFormat:@"feed requests must have a feed ID"];
          *(_DWORD *)buf = 136315906;
          v47 = "-[FCFeedRequestOperation validateOperation]";
          __int16 v48 = 2080;
          v49 = "FCFeedRequestOperation.m";
          __int16 v50 = 1024;
          int v51 = 121;
          __int16 v52 = 2114;
          v53 = v24;
          _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        v14 = [v12 feedRange];
        __int16 v15 = [v14 top];

        if (!v15 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v25 = (void *)[[NSString alloc] initWithFormat:@"feed requests must have a non-nil range top"];
          *(_DWORD *)buf = 136315906;
          v47 = "-[FCFeedRequestOperation validateOperation]";
          __int16 v48 = 2080;
          v49 = "FCFeedRequestOperation.m";
          __int16 v50 = 1024;
          int v51 = 129;
          __int16 v52 = 2114;
          v53 = v25;
          _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        int v16 = [v12 feedRange];
        __int16 v17 = [v16 bottom];

        if (!v17 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)[[NSString alloc] initWithFormat:@"feed requests must have a non-nil range bottom"];
          *(_DWORD *)buf = 136315906;
          v47 = "-[FCFeedRequestOperation validateOperation]";
          __int16 v48 = 2080;
          v49 = "FCFeedRequestOperation.m";
          __int16 v50 = 1024;
          int v51 = 130;
          __int16 v52 = 2114;
          v53 = v26;
          _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        if (![v12 maxCount] && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v27 = (void *)[[NSString alloc] initWithFormat:@"feed requests must have a non-zero max count"];
          *(_DWORD *)buf = 136315906;
          v47 = "-[FCFeedRequestOperation validateOperation]";
          __int16 v48 = 2080;
          v49 = "FCFeedRequestOperation.m";
          __int16 v50 = 1024;
          int v51 = 131;
          __int16 v52 = 2114;
          v53 = v27;
          _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          if (!v13) {
            goto LABEL_44;
          }
        }
        else if (!v13)
        {
          goto LABEL_44;
        }
        v18 = [v12 feedRange];
        uint64_t v19 = [v18 top];
        if (!v19)
        {

LABEL_44:
LABEL_45:
          BOOL v30 = 0;
          v2 = v38;
          goto LABEL_46;
        }
        v20 = (void *)v19;
        v21 = [v12 feedRange];
        v22 = [v21 bottom];
        if (v22) {
          BOOL v23 = [v12 maxCount] == 0;
        }
        else {
          BOOL v23 = 1;
        }

        if (v23) {
          goto LABEL_45;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      uint64_t v9 = v29;
      BOOL v30 = 1;
      v2 = v38;
    }
    while (v29);
  }
  else
  {
    BOOL v30 = 1;
  }
LABEL_46:

  v31 = [(FCFeedRequestOperation *)v2 context];
  if (v31)
  {
    v32 = [(FCFeedRequestOperation *)v2 configuration];
    if (v32)
    {
      v33 = [(FCFeedRequestOperation *)v2 feedRequests];
      if (![v33 count]) {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (void)prepareOperation
{
  id v3 = [(FCFeedRequestOperation *)self feedDatabase];

  if (!v3)
  {
    v4 = [(FCFeedRequestOperation *)self context];
    v5 = [v4 internalContentContext];
    uint64_t v6 = [v5 feedDatabase];
    [(FCFeedRequestOperation *)self setFeedDatabase:v6];
  }
  id v8 = [(FCFeedRequestOperation *)self feedRequests];
  v7 = objc_msgSend(v8, "fc_setByTransformingWithBlock:", &__block_literal_global_110);
  if (self) {
    objc_storeStrong((id *)&self->_nonExpendableFeedIDs, v7);
  }
}

id __42__FCFeedRequestOperation_prepareOperation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isExpendable])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [v2 feedID];
  }

  return v3;
}

- (void)performOperation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__FCFeedRequestOperation_performOperation__block_invoke;
  v12[3] = &unk_1E5B4C018;
  v12[4] = self;
  id v3 = v12;
  if (self)
  {
    v4 = [(FCFeedRequestOperation *)self prewarmRequestKey];

    if (v4)
    {
      v5 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = v5;
        v7 = [(FCOperation *)self shortOperationDescription];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will wait for prewarming to finish", (uint8_t *)&buf, 0xCu);
      }
      id v8 = [(FCFeedRequestOperation *)self context];
      uint64_t v9 = [v8 internalContentContext];
      objc_super v10 = [v9 feedPrewarmer];
      uint64_t v11 = [(FCFeedRequestOperation *)self prewarmRequestKey];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v14 = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_69;
      __int16 v15 = &unk_1E5B56EF0;
      int v16 = self;
      __int16 v17 = v3;
      [v10 finishPrewarmingRequestForKey:v11 completion:&buf];
    }
    else
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v14 = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke;
      __int16 v15 = &unk_1E5B4CC80;
      int v16 = self;
      __int16 v17 = v3;
      __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke((uint64_t)&buf);
    }
  }
}

void __42__FCFeedRequestOperation_performOperation__block_invoke(uint64_t a1)
{
  v62[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) feedRequests];
  v4 = objc_msgSend(v3, "fc_dictionaryWithKeySelector:", sel_feedID);
  if (*(void *)v2) {
    objc_storeStrong((id *)(*(void *)v2 + 488), v4);
  }

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __42__FCFeedRequestOperation_performOperation__block_invoke_2;
  v53[3] = &unk_1E5B4BF78;
  v53[4] = *(void *)(a1 + 32);
  v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionary:", v53);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    objc_storeStrong((id *)(v6 + 496), v5);
  }

  v7 = [*(id *)(a1 + 32) edgeCacheHint];
  BOOL v8 = v7 == 0;

  uint64_t v9 = *(void **)(a1 + 32);
  if (!v8)
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __42__FCFeedRequestOperation_performOperation__block_invoke_3;
    v52[3] = &unk_1E5B4FD28;
    v52[4] = v9;
    objc_super v10 = v52;
    if (!v9)
    {
LABEL_29:

      return;
    }
    uint64_t v11 = [v9 feedRequests];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke;
    v55[3] = &unk_1E5B56EC8;
    v55[4] = v9;
    v12 = objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v55);

    __int16 v13 = objc_alloc_init(FCCKOrderFeedQueryOperation);
    v14 = [v9 context];
    __int16 v15 = [v14 internalContentContext];
    int v16 = [v15 contentDatabase];
    -[FCCKOrderFeedQueryOperation setDatabase:]((uint64_t)v13, v16);

    if (v13)
    {
      objc_setProperty_nonatomic_copy(v13, v17, v12, 376);
      uint64_t v18 = -[FCFeedRequestOperation _additionalHTTPHeadersForOrderFeedRequest]((uint64_t)v9);
      objc_setProperty_nonatomic_copy(v13, v19, v18, 416);
    }
    else
    {
      uint64_t v18 = -[FCFeedRequestOperation _additionalHTTPHeadersForOrderFeedRequest]((uint64_t)v9);
    }

    v21 = [v9 edgeCacheHint];
    if (v13) {
      objc_setProperty_nonatomic_copy(v13, v20, v21, 424);
    }

    v22 = [v9 feedRequests];
    if ([v22 count] == 1)
    {
      BOOL v23 = [v9 feedRequests];
      v24 = [v23 firstObject];
      uint64_t v25 = [v24 maxCount];
      if (!v13)
      {

        goto LABEL_19;
      }
      v13->_resultsLimit = v25;
    }
    else
    {
      if (!v13)
      {

        goto LABEL_19;
      }
      v13->_resultsLimit = 4000;
    }

    v13->_queryPriority = 300;
LABEL_19:
    uint64_t v29 = [v9 context];
    BOOL v30 = [v29 internalContentContext];

    v31 = [v9 context];
    v32 = [v31 contentStoreFrontID];

    v33 = (void *)MEMORY[0x1E4F82A50];
    v34 = [v30 articleRecordSource];
    v35 = [v33 keysForFeedItemAndArticleRecordWithRecordSource:v34];

    if (([v9 options] & 2) != 0)
    {
      v36 = [v30 articleRecordSource];
      v37 = [v36 desiredKeys];
      uint64_t v38 = [v35 arrayByAddingObjectsFromArray:v37];

      v35 = (void *)v38;
    }
    if (([v9 options] & 4) != 0)
    {
      long long v41 = [v30 tagRecordSource];
      long long v42 = [v41 desiredKeys];
      uint64_t v43 = [v35 arrayByAddingObjectsFromArray:v42];

      v62[0] = @"sourceChannelTagID";
      uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
      v35 = (void *)v43;
    }
    else
    {
      uint64_t v40 = 0;
    }
    if (v13)
    {
      objc_setProperty_nonatomic_copy(v13, v39, v35, 384);
      objc_setProperty_nonatomic_copy(v13, v44, v40, 408);
    }
    objc_initWeak(&location, v13);
    *(void *)newValue = MEMORY[0x1E4F143A8];
    *(void *)&newValue[8] = 3221225472;
    *(void *)&newValue[16] = __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_2;
    *(void *)&long long v57 = &unk_1E5B56F68;
    *((void *)&v57 + 1) = v9;
    objc_copyWeak(v61, &location);
    id v45 = v30;
    id v58 = v45;
    id v46 = v32;
    id v59 = v46;
    v60 = v10;
    if (v13) {
      objc_setProperty_nonatomic_copy(v13, v47, newValue, 440);
    }
    [v9 associateChildOperation:v13];
    [(FCOperation *)v13 start];

    objc_destroyWeak(v61);
    objc_destroyWeak(&location);

    goto LABEL_29;
  }
  v26 = [*(id *)(a1 + 32) feedDatabase];
  BOOL v27 = [v26 endpoint] == 1;

  if (v27)
  {
    v28 = *(void **)(a1 + 32);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __42__FCFeedRequestOperation_performOperation__block_invoke_4;
    v51[3] = &unk_1E5B4FD28;
    v51[4] = v28;
    -[FCFeedRequestOperation _gatherAllOrderFeedResponsesWithCompletionHandler:](v28, v51);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v50 = (void *)[[NSString alloc] initWithFormat:@"MultiFeed is no longer supported"];
      *(_DWORD *)newValue = 136315906;
      *(void *)&newValue[4] = "-[FCFeedRequestOperation performOperation]_block_invoke";
      *(_WORD *)&newValue[12] = 2080;
      *(void *)&newValue[14] = "FCFeedRequestOperation.m";
      *(_WORD *)&newValue[22] = 1024;
      LODWORD(v57) = 190;
      WORD2(v57) = 2114;
      *(void *)((char *)&v57 + 6) = v50;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", newValue, 0x26u);
    }
    __int16 v48 = *(void **)(a1 + 32);
    v49 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_notAvailableError");
    [v48 finishedPerformingOperationWithError:v49];
  }
}

void __42__FCFeedRequestOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = objc_msgSend(*(id *)(a1 + 32), "feedRequests", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        objc_super v10 = objc_alloc_init(FCFeedDatabaseLookup);
        v12 = [v9 feedID];
        if (v10) {
          objc_setProperty_nonatomic_copy(v10, v11, v12, 16);
        }

        __int16 v13 = [v9 feedRange];
        __int16 v15 = v13;
        if (v10)
        {
          objc_setProperty_nonatomic_copy(v10, v14, v13, 24);

          v10->_maxCount = [v9 maxCount];
          v10->_cachedOnly = [v9 cachedOnly];
          int v16 = [v9 requiredFeature];
          objc_setProperty_nonatomic_copy(v10, v17, v16, 40);
        }
        else
        {

          [v9 maxCount];
          [v9 cachedOnly];
          int v16 = [v9 requiredFeature];
        }

        uint64_t v18 = [v9 feedID];
        [v3 setObject:v10 forKey:v18];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v19 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v6 = v19;
    }
    while (v19);
  }
}

uint64_t __42__FCFeedRequestOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

uint64_t __42__FCFeedRequestOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)_gatherAllOrderFeedResponsesWithCompletionHandler:(void *)a1
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  v106 = a2;
  uint64_t v114 = (uint64_t)a1;
  if (a1)
  {
    v108 = [MEMORY[0x1E4F1CA60] dictionary];
    id newValue = [MEMORY[0x1E4F1CA48] array];
    v109 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v3 = [a1 feedRequests];
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke;
    v131[3] = &unk_1E5B56EC8;
    v131[4] = v114;
    v107 = objc_msgSend((id)v3, "fc_arrayByTransformingWithBlock:", v131);

    v105 = [MEMORY[0x1E4F1C9C8] date];
    LOBYTE(v3) = [(id)v114 maxCount] == 0;
    v4 = [(id)v114 feedDatabase];
    uint64_t v5 = v4;
    if (v3) {
      -[FCFeedDatabase performDatabaseLookups:](v4, v107);
    }
    else {
    uint64_t v6 = -[FCFeedDatabase performDatabaseLookups:boundedByCount:](v4, v107, [(id)v114 maxCount]);
    }

    uint64_t v7 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [(id)v114 shortOperationDescription];
      uint64_t v10 = objc_msgSend(v105, "fc_millisecondTimeIntervalUntilNow");
      uint64_t v11 = [v107 count];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&long long v135 = v11;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ took %llums to lookup %lu feeds in the database", buf, 0x20u);
    }
    v12 = [(id)v114 feedRequests];
    BOOL v13 = (unint64_t)[v12 count] < 3;

    if (v13)
    {
      v14 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = v14;
        int v16 = [(id)v114 shortOperationDescription];
        *(_DWORD *)long long buf = 138543874;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v107;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&long long v135 = v6;
        _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ did perform database lookups: %{public}@,\nresults:%{public}@", buf, 0x20u);
      }
    }
    v111 = [MEMORY[0x1E4F1CA48] array];
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id obj = v6;
    uint64_t v17 = [obj countByEnumeratingWithState:&v127 objects:v133 count:16];
    if (v17)
    {
      uint64_t v112 = *(void *)v128;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v128 != v112) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v127 + 1) + 8 * v18);
          long long v20 = [*(id *)(v114 + 488) objectForKey:v19];
          long long v21 = [*(id *)(v114 + 496) objectForKey:v19];
          uint64_t v22 = [obj objectForKey:v19];
          uint64_t v23 = v22;
          if (v22) {
            v24 = *(void **)(v22 + 16);
          }
          else {
            v24 = 0;
          }
          id v25 = v24;
          unint64_t v26 = [v25 count];
          if (!v21 || (v26 < v21[4] ? (BOOL v27 = v23 == 0) : (BOOL v27 = 1), v27))
          {

LABEL_35:
            v33 = objc_alloc_init(FCFeedResponse);
            [(FCFeedResponse *)v33 setFeedID:v19];
            if (v23)
            {
              id v41 = *(id *)(v23 + 16);
              [(FCFeedResponse *)v33 setFeedItems:v41];

              BOOL v42 = *(unsigned char *)(v23 + 8) != 0;
            }
            else
            {
              [(FCFeedResponse *)v33 setFeedItems:0];
              BOOL v42 = 0;
            }
            [(FCFeedResponse *)v33 setExhaustedRequestRange:v42];
            [*(id *)(v114 + 520) setObject:v33 forKey:v19];
            if (v23) {
              uint64_t v43 = *(void **)(v23 + 16);
            }
            else {
              uint64_t v43 = 0;
            }
            v34 = v43;
            [v111 addObjectsFromArray:v34];
            goto LABEL_40;
          }
          BOOL v28 = *(void *)(v23 + 40) == 0;

          if (v28) {
            goto LABEL_35;
          }
          uint64_t v29 = *(void *)(v23 + 48);
          BOOL v30 = v29 != 0;
          uint64_t v31 = v29 - 1;
          if (v30) {
            uint64_t v32 = v31;
          }
          else {
            uint64_t v32 = 0;
          }
          v33 = +[FCFeedRange feedRangeWithMaxOrder:*(void *)(v23 + 40) minOrder:v32];
          v34 = +[FCCKOrderFeedUtilities orderFeedRequestForFeedID:v19 feedRange:v33];
          if (![(id)v114 maxCount])
          {
            uint64_t v35 = v21[4];
            id v36 = *(id *)(v23 + 16);
            uint64_t v37 = [v36 count];
            if (v34) {
              v34[4] = v35 - v37;
            }
          }
          [newValue addObject:v34];
          if (v34) {
            uint64_t v38 = (void *)v34[1];
          }
          else {
            uint64_t v38 = 0;
          }
          id v39 = v38;
          [v109 setObject:v20 forKey:v39];

          id v40 = *(id *)(v23 + 56);
          [v108 setObject:v40 forKey:v19];

LABEL_40:
          ++v18;
        }
        while (v17 != v18);
        uint64_t v44 = [obj countByEnumeratingWithState:&v127 objects:v133 count:16];
        uint64_t v17 = v44;
      }
      while (v44);
    }

    -[FCFeedRequestOperation _reportProgressWithFeedItems:]((id *)v114, v111);
    if ([newValue count])
    {
      id v45 = (void *)v114;
      uint64_t v46 = *(void *)(v114 + 504);
      if (v46)
      {
        *(void *)(v114 + 504) = v46 - 1;
        v47 = [MEMORY[0x1E4F1C9C8] date];
        __int16 v48 = objc_alloc_init(FCCKBatchedOrderFeedQueryOperation);
        v49 = [(id)v114 context];
        __int16 v50 = [v49 internalContentContext];
        int v51 = [v50 contentDatabase];
        -[FCCKBatchedOrderFeedQueryOperation setDatabase:]((uint64_t)v48, v51);

        if (v48)
        {
          objc_setProperty_nonatomic_copy(v48, v52, newValue, 376);
          v53 = -[FCFeedRequestOperation _additionalHTTPHeadersForOrderFeedRequest](v114);
          objc_setProperty_nonatomic_copy(v48, v54, v53, 416);
        }
        else
        {
          v53 = -[FCFeedRequestOperation _additionalHTTPHeadersForOrderFeedRequest](v114);
        }

        v55 = [(id)v114 edgeCacheHint];
        long long v57 = v55;
        if (v48)
        {
          objc_setProperty_nonatomic_copy(v48, v56, v55, 424);

          uint64_t v58 = [(id)v114 relativePriority];
          uint64_t v59 = 300;
          if (!v58) {
            uint64_t v59 = 200;
          }
          if (v58 == -1) {
            uint64_t v59 = 100;
          }
          v48->_queryPriority = v59;
        }
        else
        {

          [(id)v114 relativePriority];
        }
        if ([(id)v114 maxCount])
        {
          if ((unint64_t)[(id)v114 maxCount] >= 0x190
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v104 = (void *)[[NSString alloc] initWithFormat:@"max count should be reasonable; pass zero if you don't want a limit"];
            *(_DWORD *)long long buf = 136315906;
            *(void *)&uint8_t buf[4] = "-[FCFeedRequestOperation _gatherAllOrderFeedResponsesWithCompletionHandler:]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "FCFeedRequestOperation.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v135) = 596;
            WORD2(v135) = 2114;
            *(void *)((char *)&v135 + 6) = v104;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          uint64_t v60 = [(id)v114 maxCount];
        }
        else
        {
          uint64_t v60 = 4000;
        }
        if (v48) {
          v48->_resultsLimit = v60;
        }
        v81 = [(id)v114 context];
        v82 = [v81 internalContentContext];

        v83 = [(id)v114 context];
        v84 = [v83 contentStoreFrontID];

        v85 = (void *)MEMORY[0x1E4F82A50];
        v86 = [v82 articleRecordSource];
        v87 = [v85 keysForFeedItemAndArticleRecordWithRecordSource:v86];

        v88 = [MEMORY[0x1E4F1CA48] array];
        if (([(id)v114 options] & 2) != 0)
        {
          v89 = [v82 articleRecordSource];
          v90 = [v89 desiredKeys];
          uint64_t v91 = [v87 arrayByAddingObjectsFromArray:v90];

          v87 = (void *)v91;
        }
        if (([(id)v114 options] & 4) != 0)
        {
          v92 = [v82 tagRecordSource];
          v93 = [v92 desiredKeys];
          uint64_t v94 = [v87 arrayByAddingObjectsFromArray:v93];

          [v88 addObject:@"sourceChannelTagID"];
          v87 = (void *)v94;
        }
        if (([(id)v114 options] & 8) != 0)
        {
          v96 = [v82 issueRecordSource];
          v97 = [v96 desiredKeys];
          uint64_t v98 = [v87 arrayByAddingObjectsFromArray:v97];

          [v88 addObject:@"parentIssueID"];
          v87 = (void *)v98;
        }
        if (v48)
        {
          objc_setProperty_nonatomic_copy(v48, v95, v87, 384);
          objc_setProperty_nonatomic_copy(v48, v99, v88, 408);
        }
        objc_initWeak((id *)buf, v48);
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v115[2] = __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_89;
        v115[3] = &unk_1E5B56F40;
        v115[4] = v114;
        objc_copyWeak(&v122, (id *)buf);
        id v100 = v82;
        id v116 = v100;
        id v117 = v109;
        id v101 = v84;
        id v118 = v101;
        id v119 = v108;
        id v102 = v47;
        id v120 = v102;
        v121 = v106;
        if (v48) {
          objc_setProperty_nonatomic_copy(v48, v103, v115, 432);
        }
        [(id)v114 associateChildOperation:v48];
        [(FCOperation *)v48 start];

        objc_destroyWeak(&v122);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v61 = (void *)FCOperationLog;
        if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        {
          v62 = v61;
          v63 = [(id)v114 shortOperationDescription];
          uint64_t v64 = [v109 count];
          v65 = [(id)v114 feedRequests];
          uint64_t v66 = [v65 count];
          *(_DWORD *)long long buf = 138543874;
          *(void *)&uint8_t buf[4] = v63;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v64;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&long long v135 = v66;
          _os_log_impl(&dword_1A460D000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ exceeded query budget, will fail remaining %lu of %lu requests", buf, 0x20u);

          id v45 = (void *)v114;
        }
        v67 = (void *)MEMORY[0x1E4F28C58];
        v68 = [v45 errorUserInfo];
        v69 = objc_msgSend(v67, "fc_exceededQueryBudgetErrorWithAdditionalUserInfo:", v68);

        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        v70 = [v109 allValues];
        uint64_t v71 = [v70 countByEnumeratingWithState:&v123 objects:v132 count:16];
        if (v71)
        {
          uint64_t v72 = *(void *)v124;
          do
          {
            for (uint64_t i = 0; i != v71; ++i)
            {
              if (*(void *)v124 != v72) {
                objc_enumerationMutation(v70);
              }
              v74 = *(void **)(*((void *)&v123 + 1) + 8 * i);
              v75 = -[FCFeedRequestOperation _failureResponseForRequest:error:](v114, v74, v69);
              id v76 = *(id *)(v114 + 520);
              v77 = [v74 feedID];
              [v76 setObject:v75 forKey:v77];
            }
            uint64_t v71 = [v70 countByEnumeratingWithState:&v123 objects:v132 count:16];
          }
          while (v71);
        }

        id v78 = *(id *)(v114 + 520);
        v79 = [v78 allValues];
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __45__FCFeedRequestOperation__countOfFailedFeeds__block_invoke;
        *(void *)&long long v135 = &unk_1E5B56F90;
        *((void *)&v135 + 1) = v114;
        objc_msgSend(v79, "fc_countOfObjectsPassingTest:", buf);

        if (([(id)v114 options] & 0x10) == 0)
        {
          id v80 = *(id *)(v114 + 480);
          if ((unint64_t)[v80 count] >= 3) {
            vcvtmd_u64_f64((double)(unint64_t)[*(id *)(v114 + 480) count] * 0.5);
          }
        }
        v106[2]();
      }
    }
    else
    {
      ((void (*)(void (**)(void), void))v106[2])(v106, 0);
    }
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v112 = a3;
  id v117 = self;
  if (v112)
  {
    id v4 = 0;
    id v5 = 0;
  }
  else
  {
    if (self) {
      resultFeedResponses = self->_resultFeedResponses;
    }
    else {
      resultFeedResponses = 0;
    }
    uint64_t v7 = [(NSMutableDictionary *)resultFeedResponses allValues];
    id v116 = [MEMORY[0x1E4F1CA48] array];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v140 objects:v156 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v141;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v141 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v140 + 1) + 8 * i);
          v12 = [v11 feedItems];
          BOOL v13 = v12 == 0;

          if (!v13)
          {
            v14 = [v11 feedItems];
            [v116 addObjectsFromArray:v14];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v140 objects:v156 count:16];
      }
      while (v8);
    }

    __int16 v15 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = v15;
      uint64_t v17 = [(FCOperation *)v117 shortOperationDescription];
      uint64_t v18 = [v116 count];
      uint64_t v19 = [obj count];
      *(_DWORD *)long long buf = 138543874;
      v147 = v17;
      __int16 v148 = 2048;
      v149 = (char *)v18;
      __int16 v150 = 2048;
      *(void *)v151 = v19;
      _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ gathered %lu feed items from %lu feeds", buf, 0x20u);
    }
    long long v20 = [(FCFeedRequestOperation *)v117 requestCompletionHandlerWithHeldRecords];
    BOOL v21 = v20 == 0;

    if (!v21)
    {
      char v22 = [(FCFeedRequestOperation *)v117 options];
      if ((v22 & 0xE) != 0)
      {
        uint64_t v23 = objc_opt_new();
        v24 = objc_opt_new();
        uint64_t v114 = objc_opt_new();
        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id v25 = v116;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v136 objects:v155 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v137;
          do
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v137 != v27) {
                objc_enumerationMutation(v25);
              }
              uint64_t v29 = *(void **)(*((void *)&v136 + 1) + 8 * v28);
              if ((v22 & 2) != 0)
              {
                BOOL v30 = [*(id *)(*((void *)&v136 + 1) + 8 * v28) articleID];
                if (v117) {
                  resultHeldArticleRecords = v117->_resultHeldArticleRecords;
                }
                else {
                  resultHeldArticleRecords = 0;
                }
                uint64_t v32 = [(FCHeldRecords *)resultHeldArticleRecords recordWithID:v30];
                BOOL v33 = v32 == 0;

                if (v33) {
                  [v23 addObject:v30];
                }
              }
              if ((v22 & 4) != 0)
              {
                v34 = [v29 sourceChannelID];
                if (v34)
                {
                  uint64_t v35 = v117 ? v117->_resultHeldTagRecords : 0;
                  id v36 = [(FCHeldRecords *)v35 recordWithID:v34];
                  BOOL v37 = v36 == 0;

                  if (v37) {
                    [v24 addObject:v34];
                  }
                }
              }
              if ((v22 & 8) != 0)
              {
                uint64_t v38 = [v29 parentIssueID];
                if (v38)
                {
                  id v39 = v117 ? v117->_resultHeldTagRecords : 0;
                  id v40 = [(FCHeldRecords *)v39 recordWithID:v38];
                  BOOL v41 = v40 == 0;

                  if (v41) {
                    [v114 addObject:v38];
                  }
                }
              }
              ++v28;
            }
            while (v26 != v28);
            uint64_t v42 = [v25 countByEnumeratingWithState:&v136 objects:v155 count:16];
            uint64_t v26 = v42;
          }
          while (v42);
        }

        uint64_t v43 = [(FCFeedRequestOperation *)v117 context];
        uint64_t v44 = [v43 internalContentContext];

        id v45 = [v44 articleRecordSource];
        uint64_t v46 = [v23 allObjects];
        v47 = [v45 cachedRecordsWithIDs:v46];

        if (v117)
        {
          __int16 v48 = v117;
          v49 = v117->_resultHeldArticleRecords;
        }
        else
        {
          v49 = 0;
          __int16 v48 = 0;
        }
        BOOL v50 = v48 == 0;
        int v51 = v49;
        __int16 v52 = +[FCHeldRecords heldRecordsByMerging:v51 with:v47];
        -[FCFeedRequestOperation setResultHeldArticleRecords:]((uint64_t)v117, v52);

        v53 = [v44 tagRecordSource];
        SEL v54 = [v24 allObjects];
        v55 = [v53 cachedRecordsWithIDs:v54];

        if (v50)
        {
          resultHeldTagRecords = 0;
          v56 = v117;
        }
        else
        {
          v56 = v117;
          resultHeldTagRecords = v117->_resultHeldTagRecords;
        }
        BOOL v58 = v56 == 0;
        uint64_t v59 = resultHeldTagRecords;
        uint64_t v60 = +[FCHeldRecords heldRecordsByMerging:v59 with:v55];
        -[FCFeedRequestOperation setResultHeldTagRecords:]((uint64_t)v117, v60);

        v61 = [v44 issueRecordSource];
        v62 = [v114 allObjects];
        v63 = [v61 cachedRecordsWithIDs:v62];

        if (v58) {
          resultHeldIssueRecords = 0;
        }
        else {
          resultHeldIssueRecords = v117->_resultHeldIssueRecords;
        }
        v65 = resultHeldIssueRecords;
        uint64_t v66 = +[FCHeldRecords heldRecordsByMerging:v65 with:v63];
        -[FCFeedRequestOperation setResultHeldIssueRecords:]((uint64_t)v117, v66);
      }
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v68 = v67;
    v69 = (void *)[v116 copy];
    uint64_t v132 = 0;
    v133 = &v132;
    uint64_t v134 = 0x2020000000;
    uint64_t v135 = 1;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    v70 = [(FCFeedRequestOperation *)v117 feedTransformations];
    uint64_t v71 = [v70 countByEnumeratingWithState:&v128 objects:v154 count:16];
    if (v71)
    {
      uint64_t v72 = *(void *)v129;
      do
      {
        for (uint64_t j = 0; j != v71; ++j)
        {
          if (*(void *)v129 != v72) {
            objc_enumerationMutation(v70);
          }
          v74 = *(void **)(*((void *)&v128 + 1) + 8 * j);
          objc_opt_class();
          if (v74 && (objc_opt_isKindOfClass() & 1) != 0)
          {
            id v75 = v74;
            id v76 = [v75 transformFeedItemsWithResults:v69];
            v127[0] = MEMORY[0x1E4F143A8];
            v127[1] = 3221225472;
            v127[2] = __55__FCFeedRequestOperation_operationWillFinishWithError___block_invoke;
            v127[3] = &unk_1E5B56E80;
            v127[4] = &v132;
            uint64_t v77 = objc_msgSend(v76, "fc_arrayByTransformingWithBlock:", v127);

            v69 = (void *)v77;
          }
          else
          {
            [v74 transformFeedItems:v69];
            id v75 = 0;
            v69 = id v76 = v69;
          }
        }
        uint64_t v71 = [v70 countByEnumeratingWithState:&v128 objects:v154 count:16];
      }
      while (v71);
    }

    if (v133[3] != 1)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v79 = v78;
      id v80 = (id)FCOperationLog;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v81 = [(FCOperation *)v117 shortOperationDescription];
        uint64_t v82 = [v116 count];
        uint64_t v83 = [v69 count];
        v84 = FCFeedFilterOptionsToNSString(v133[3]);
        *(_DWORD *)long long buf = 138544386;
        v147 = v81;
        __int16 v148 = 2048;
        v149 = (char *)v82;
        __int16 v150 = 2048;
        *(void *)v151 = v83;
        *(_WORD *)&v151[8] = 2048;
        *(void *)&v151[10] = (unint64_t)(fmax(v79 - v68, 0.0) * 1000.0);
        __int16 v152 = 2114;
        v153 = v84;
        _os_log_impl(&dword_1A460D000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@ filtered from %lu to %lu feed items, time=%llums, reasons=%{public}@", buf, 0x34u);
      }
    }
    id v85 = v69;
    v86 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v4 = v85;
    uint64_t v87 = [v4 countByEnumeratingWithState:&v123 objects:v145 count:16];
    if (v87)
    {
      uint64_t v88 = *(void *)v124;
      do
      {
        for (uint64_t k = 0; k != v87; ++k)
        {
          if (*(void *)v124 != v88) {
            objc_enumerationMutation(v4);
          }
          v90 = *(void **)(*((void *)&v123 + 1) + 8 * k);
          uint64_t v91 = [v90 feedID];
          v92 = [v86 objectForKeyedSubscript:v91];
          BOOL v93 = v92 == 0;

          if (v93)
          {
            uint64_t v94 = [MEMORY[0x1E4F1CA48] arrayWithObject:v90];
            v95 = [v90 feedID];
            [v86 setObject:v94 forKeyedSubscript:v95];
          }
          else
          {
            uint64_t v94 = [v90 feedID];
            v95 = [v86 objectForKeyedSubscript:v94];
            [v95 addObject:v90];
          }
        }
        uint64_t v87 = [v4 countByEnumeratingWithState:&v123 objects:v145 count:16];
      }
      while (v87);
    }

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v5 = obj;
    uint64_t v96 = [v5 countByEnumeratingWithState:&v119 objects:v144 count:16];
    if (v96)
    {
      uint64_t v97 = *(void *)v120;
      do
      {
        for (uint64_t m = 0; m != v96; ++m)
        {
          if (*(void *)v120 != v97) {
            objc_enumerationMutation(v5);
          }
          SEL v99 = *(void **)(*((void *)&v119 + 1) + 8 * m);
          id v100 = [v99 feedID];
          id v101 = [v86 objectForKeyedSubscript:v100];
          [v99 setFeedItems:v101];
        }
        uint64_t v96 = [v5 countByEnumeratingWithState:&v119 objects:v144 count:16];
      }
      while (v96);
    }

    _Block_object_dispose(&v132, 8);
    if (v117) {
      id v102 = v117->_resultFeedResponses;
    }
    else {
      id v102 = 0;
    }
    v103 = v102;
    uint64_t v104 = [(NSMutableDictionary *)v103 count];
    v105 = [(FCFeedRequestOperation *)v117 feedRequests];

    LOBYTE(v104) = v104 == [v105 count];
    if ((v104 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v111 = (void *)[[NSString alloc] initWithFormat:@"each feed request must have a corresponding response"];
      *(_DWORD *)long long buf = 136315906;
      v147 = "-[FCFeedRequestOperation operationWillFinishWithError:]";
      __int16 v148 = 2080;
      v149 = "FCFeedRequestOperation.m";
      __int16 v150 = 1024;
      *(_DWORD *)v151 = 327;
      *(_WORD *)&v151[4] = 2114;
      *(void *)&v151[6] = v111;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    -[FCFeedRequestOperation _reportProgressWithFeedItems:]((id *)&v117->super.super.super.isa, v4);
  }
  v106 = [(FCFeedRequestOperation *)v117 requestCompletionHandler];

  if (v106)
  {
    v107 = [(FCFeedRequestOperation *)v117 requestCompletionHandler];
    ((void (**)(void, id, id, void *))v107)[2](v107, v5, v4, v113);
  }
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __55__FCFeedRequestOperation_operationWillFinishWithError___block_invoke_52;
  v118[3] = &unk_1E5B4BF78;
  v118[4] = v117;
  v108 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionary:", v118);
  v109 = [(FCFeedRequestOperation *)v117 requestCompletionHandlerWithHeldRecords];

  if (v109)
  {
    v110 = [(FCFeedRequestOperation *)v117 requestCompletionHandlerWithHeldRecords];
    ((void (**)(void, id, id, void *, void *))v110)[2](v110, v5, v4, v108, v113);
  }
}

- (void)setResultHeldArticleRecords:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 528), a2);
  }
}

- (void)setResultHeldTagRecords:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 536), a2);
  }
}

- (void)setResultHeldIssueRecords:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 544), a2);
  }
}

id __55__FCFeedRequestOperation_operationWillFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= [v3 filteredReasons];
  if ([v3 isFiltered])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 item];
  }

  return v4;
}

- (void)_reportProgressWithFeedItems:(id *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = [a1 progressHandler];
    uint64_t v6 = _Block_copy(v5);

    if (v6)
    {
      uint64_t v7 = (void (**)(void *, void *))_Block_copy(v6);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__FCFeedRequestOperation__reportProgressWithFeedItems___block_invoke_2;
      v14[3] = &unk_1E5B56FB8;
      v14[4] = a1;
      uint64_t v8 = objc_msgSend(v3, "fc_arrayOfObjectsFailingTest:", v14);
      if ([v8 count])
      {
        v7[2](v7, v8);
        [a1[64] addObjectsFromArray:v8];
        uint64_t v9 = (void *)FCFeedDatabaseLog;
        if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = v9;
          uint64_t v11 = [a1 operationID];
          uint64_t v12 = objc_msgSend(v4, "fc_millisecondTimeIntervalUntilNow");
          uint64_t v13 = [v8 count];
          *(_DWORD *)long long buf = 138543874;
          int v16 = v11;
          __int16 v17 = 2048;
          uint64_t v18 = v12;
          __int16 v19 = 2048;
          uint64_t v20 = v13;
          _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ took %llums to report %lu feed items via progress handler", buf, 0x20u);
        }
      }
    }
  }
}

void __55__FCFeedRequestOperation_operationWillFinishWithError___block_invoke_52(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (([*(id *)(a1 + 32) options] & 2) != 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void *)(v3 + 528);
    }
    else {
      uint64_t v4 = 0;
    }
    [v9 setObject:v4 forKeyedSubscript:&unk_1EF8D7F98];
  }
  if (([*(id *)(a1 + 32) options] & 4) != 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 536);
    }
    else {
      uint64_t v6 = 0;
    }
    [v9 setObject:v6 forKeyedSubscript:&unk_1EF8D7FB0];
  }
  if (([*(id *)(a1 + 32) options] & 8) != 0)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v8 = *(void *)(v7 + 544);
    }
    else {
      uint64_t v8 = 0;
    }
    [v9 setObject:v8 forKeyedSubscript:&unk_1EF8D7FC8];
  }
}

- (unint64_t)maxRetries
{
  uint64_t v2 = [(FCFeedRequestOperation *)self configuration];
  unint64_t v3 = [v2 maxRetriesForDroppedFeeds];

  return v3;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCFeedRequestOperation;
  if ([(FCOperation *)&v13 canRetryWithError:v6 retryAfter:a4])
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v8 = [v6 domain];
    int v7 = [v8 isEqualToString:@"FCErrorDomain"];
    if (v7)
    {
      uint64_t v9 = [v6 code];

      if (v9 != 2)
      {
        LOBYTE(v7) = 0;
        goto LABEL_8;
      }
      uint64_t v10 = [FCOperationDelayedRetrySignal alloc];
      uint64_t v8 = [(FCFeedRequestOperation *)self configuration];
      [v8 delayBeforeRetryingDroppedFeeds];
      *a4 = [(FCOperationDelayedRetrySignal *)v10 initWithDelay:(double)exp2(v11 * (double)[(FCOperation *)self retryCount])];
    }
  }
LABEL_8:

  return v7;
}

- (void)resetForRetry
{
  if (self)
  {
    [(NSMutableDictionary *)self->_resultFeedResponses removeAllObjects];
    objc_storeStrong((id *)&self->_resultHeldTagRecords, 0);
    objc_storeStrong((id *)&self->_resultHeldArticleRecords, 0);
    objc_storeStrong((id *)&self->_resultHeldIssueRecords, 0);
    self->_queryBudget = 10;
  }
  else
  {
    [0 removeAllObjects];
  }
}

- (NSArray)networkEvents
{
  if (self) {
    self = (FCFeedRequestOperation *)self->_mutableNetworkEvents;
  }
  return (NSArray *)self;
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ has no prewarm request key", (uint8_t *)&v7, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 successfulRequests];
  if ([v4 count])
  {
  }
  else
  {
    uint64_t v5 = [v3 failedRequests];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2;
      v39[3] = &unk_1E5B4CC80;
      uint64_t v32 = *(void **)(a1 + 40);
      v39[4] = *(void *)(a1 + 32);
      id v40 = v32;
      __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2((uint64_t)v39);
      __int16 v15 = v40;
      goto LABEL_19;
    }
  }
  int v7 = *(void **)(a1 + 32);
  if (v7) {
    int v7 = (void *)v7[60];
  }
  uint64_t v8 = v7;
  uint64_t v9 = [v3 feedIDs];
  unint64_t v10 = 2 * objc_msgSend(v8, "fc_countOfObjectsIntersectingSet:", v9);
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    uint64_t v12 = *(void **)(v11 + 480);
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = [v12 count];

  if (v10 < v13)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_70;
    v37[3] = &unk_1E5B4CC80;
    v14 = *(void **)(a1 + 40);
    v37[4] = *(void *)(a1 + 32);
    id v38 = v14;
    __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_70((uint64_t)v37);
    __int16 v15 = v38;
LABEL_19:

    goto LABEL_20;
  }
  int v16 = [v3 successfulRequests];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_71;
  v36[3] = &unk_1E5B4E928;
  v36[4] = *(void *)(a1 + 32);
  unint64_t v17 = objc_msgSend(v16, "fc_countOfObjectsPassingTest:", v36);

  uint64_t v18 = [v3 failedRequests];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2_73;
  v35[3] = &unk_1E5B4E928;
  v35[4] = *(void *)(a1 + 32);
  uint64_t v19 = objc_msgSend(v18, "fc_countOfObjectsPassingTest:", v35);

  if (v17 >= 10 * v19)
  {
    v24 = [v3 successfulRequests];
    id v25 = objc_msgSend(v24, "fc_dictionaryWithKeyBlock:", &__block_literal_global_76);

    uint64_t v26 = [*(id *)(a1 + 32) feedRequests];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_4;
    v33[3] = &unk_1E5B56EC8;
    char v22 = v25;
    v34 = v22;
    uint64_t v27 = objc_msgSend(v26, "fc_arrayByTransformingWithBlock:", v33);
    [*(id *)(a1 + 32) setFeedRequests:v27];

    [*(id *)(a1 + 32) setEdgeCacheHint:0];
    uint64_t v28 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void **)(a1 + 32);
      BOOL v30 = v28;
      uint64_t v31 = [v29 shortOperationDescription];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v42 = v31;
      _os_log_impl(&dword_1A460D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ prewarming finished with enough successful feeds", buf, 0xCu);
    }
    goto LABEL_16;
  }
  uint64_t v20 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void **)(a1 + 32);
    char v22 = v20;
    uint64_t v23 = [v21 shortOperationDescription];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v42 = v23;
    _os_log_impl(&dword_1A460D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ prewarming finished without enough successful feeds", buf, 0xCu);

LABEL_16:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_20:
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ found no matching prewarm request", (uint8_t *)&v7, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_70(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ had insufficient overlap with prewarm request", (uint8_t *)&v7, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_71(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[60];
  }
  uint64_t v4 = v3;
  uint64_t v5 = [a2 feedID];
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_2_73(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[60];
  }
  uint64_t v4 = v3;
  uint64_t v5 = [a2 feedID];
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

uint64_t __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 feedID];
}

id __65__FCFeedRequestOperation__finishPrewarmingWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 feedID];
  uint64_t v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (void *)[v3 copy];
    uint64_t v9 = [v3 feedRange];
    unint64_t v10 = [v7 feedRange];

    uint64_t v11 = [v9 feedRangeByIntersectingWithRange:v10];
    [v8 setFeedRange:v11];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 feedID];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 520);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v5 objectForKey:v3];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      uint64_t v9 = *(void **)(v8 + 496);
    }
    else {
      uint64_t v9 = 0;
    }
    id v7 = [v9 objectForKey:v3];
  }

  return v7;
}

- (FCFeedResponse)_failureResponseForRequest:(void *)a3 error:
{
  if (a1)
  {
    id v4 = a3;
    id v5 = a2;
    uint64_t v6 = objc_alloc_init(FCFeedResponse);
    id v7 = [v5 feedID];

    [(FCFeedResponse *)v6 setFeedID:v7];
    [(FCFeedResponse *)v6 setError:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)_additionalHTTPHeadersForOrderFeedRequest
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 472) lastObject];
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 HTTPResponseHeaders];
    id v4 = [v3 objectForKeyedSubscript:@"X-Apple-News-Retry"];

    if (v4)
    {
      uint64_t v9 = @"X-Apple-News-Retry";
      v10[0] = v4;
      id v5 = (void *)MEMORY[0x1E4F1C9E8];
      id v6 = v4;
      id v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

void __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v98 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id v6 = (void *)v6[59];
  }
  id v7 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v9 = -[FCCKBatchedOrderFeedQueryOperation networkEvents](WeakRetained);
  [v7 addObjectsFromArray:v9];

  if (!v98)
  {
    if (([*(id *)(a1 + 32) options] & 2) != 0)
    {
      uint64_t v11 = [*(id *)(a1 + 40) articleRecordSource];
      if (v5) {
        uint64_t v12 = (void *)v5[1];
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;
      v14 = [v11 saveArticleRecords:v13];

      __int16 v15 = *(void **)(a1 + 32);
      if (v15) {
        __int16 v15 = (void *)v15[66];
      }
      int v16 = v15;
      unint64_t v17 = +[FCHeldRecords heldRecordsByMerging:v16 with:v14];
      -[FCFeedRequestOperation setResultHeldArticleRecords:](*(void *)(a1 + 32), v17);
    }
    if (([*(id *)(a1 + 32) options] & 4) != 0)
    {
      uint64_t v18 = [*(id *)(a1 + 40) tagRecordSource];
      if (v5) {
        uint64_t v19 = (void *)v5[3];
      }
      else {
        uint64_t v19 = 0;
      }
      id v20 = v19;
      uint64_t v21 = [v18 saveTagRecords:v20];

      char v22 = *(void **)(a1 + 32);
      if (v22) {
        char v22 = (void *)v22[67];
      }
      uint64_t v23 = v22;
      v24 = +[FCHeldRecords heldRecordsByMerging:v23 with:v21];
      -[FCFeedRequestOperation setResultHeldTagRecords:](*(void *)(a1 + 32), v24);
    }
    if (([*(id *)(a1 + 32) options] & 8) != 0)
    {
      id v25 = [*(id *)(a1 + 40) issueRecordSource];
      if (v5) {
        uint64_t v26 = (void *)v5[4];
      }
      else {
        uint64_t v26 = 0;
      }
      id v27 = v26;
      uint64_t v28 = [v25 saveRecords:v27];

      uint64_t v29 = *(void **)(a1 + 32);
      if (v29) {
        uint64_t v29 = (void *)v29[68];
      }
      BOOL v30 = v29;
      uint64_t v31 = +[FCHeldRecords heldRecordsByMerging:v30 with:v28];
      -[FCFeedRequestOperation setResultHeldIssueRecords:](*(void *)(a1 + 32), v31);
    }
    uint64_t v97 = [MEMORY[0x1E4F1C9C8] date];
    id v100 = [MEMORY[0x1E4F1CA48] array];
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    if (v5) {
      uint64_t v32 = (void *)v5[2];
    }
    else {
      uint64_t v32 = 0;
    }
    uint64_t v96 = v5;
    id obj = v32;
    uint64_t v102 = [obj countByEnumeratingWithState:&v112 objects:v131 count:16];
    uint64_t v33 = 0;
    if (v102)
    {
      uint64_t v101 = *(void *)v113;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v113 != v101) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = *(void *)(*((void *)&v112 + 1) + 8 * v34);
          id v36 = *(void **)(a1 + 48);
          if (v35) {
            BOOL v37 = *(void **)(v35 + 16);
          }
          else {
            BOOL v37 = 0;
          }
          id v38 = v37;
          id v39 = [v36 objectForKey:v38];

          id v40 = [v39 feedID];
          if (v35) {
            BOOL v41 = *(void **)(v35 + 24);
          }
          else {
            BOOL v41 = 0;
          }
          id v42 = v41;
          v108[0] = MEMORY[0x1E4F143A8];
          v108[1] = 3221225472;
          v108[2] = __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_3;
          v108[3] = &unk_1E5B56F18;
          id v43 = *(id *)(a1 + 56);
          uint64_t v44 = *(void *)(a1 + 32);
          id v109 = v43;
          uint64_t v110 = v44;
          id v45 = v40;
          id v111 = v45;
          uint64_t v46 = objc_msgSend(v42, "fc_arrayByTransformingWithBlock:", v108);

          if (!v35 || !*(unsigned char *)(v35 + 10) || [v46 count])
          {
            uint64_t v103 = v33 + 1;
            v47 = objc_msgSend(*(id *)(a1 + 32), "feedDatabase", v96);
            __int16 v48 = [v39 feedID];
            v49 = *(void **)(a1 + 64);
            BOOL v50 = [v39 feedID];
            int v51 = [v49 objectForKey:v50];
            __int16 v52 = *(void **)(a1 + 72);
            if (!v35)
            {
              -[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]((uint64_t)v47, v46, v48, v51, v52, 0, 0, 0);

              v61 = [v39 feedRange];
              long long v57 = FCFeedItemsCoveredByRange(v46, v61);

              [v100 addObjectsFromArray:v57];
              uint64_t v33 = v103;
              goto LABEL_43;
            }
            -[FCFeedDatabase saveFeedItems:forFeedID:insertionToken:requestDate:reachedToOrder:extent:reachedEnd:]((uint64_t)v47, v46, v48, v51, v52, *(unsigned char *)(v35 + 9), *(void *)(v35 + 32), *(unsigned char *)(v35 + 8));

            v53 = [v39 feedRange];
            SEL v54 = FCFeedItemsCoveredByRange(v46, v53);

            [v100 addObjectsFromArray:v54];
            uint64_t v33 = v103;
          }
          if (!*(unsigned char *)(v35 + 10)) {
            goto LABEL_44;
          }
          uint64_t v55 = *(void *)(a1 + 32);
          v56 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_feedDroppedError");
          long long v57 = -[FCFeedRequestOperation _failureResponseForRequest:error:](v55, v39, v56);

          BOOL v58 = *(void **)(a1 + 32);
          if (v58) {
            BOOL v58 = (void *)v58[65];
          }
          uint64_t v59 = v58;
          uint64_t v60 = [v39 feedID];
          [v59 setObject:v57 forKey:v60];

LABEL_43:
LABEL_44:

          ++v34;
        }
        while (v102 != v34);
        uint64_t v62 = [obj countByEnumeratingWithState:&v112 objects:v131 count:16];
        uint64_t v102 = v62;
      }
      while (v62);
    }

    v63 = (void *)FCFeedDatabaseLog;
    id v5 = v96;
    if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v64 = a1;
      v65 = *(void **)(a1 + 32);
      uint64_t v66 = v63;
      double v67 = [v65 operationID];
      uint64_t v68 = objc_msgSend(v97, "fc_millisecondTimeIntervalUntilNow");
      uint64_t v69 = v33;
      if (v96) {
        v70 = (void *)v96[1];
      }
      else {
        v70 = 0;
      }
      id v71 = v70;
      uint64_t v72 = [v71 count];
      *(_DWORD *)long long buf = 138544130;
      long long v124 = v67;
      __int16 v125 = 2048;
      uint64_t v126 = v68;
      __int16 v127 = 2048;
      uint64_t v128 = v69;
      __int16 v129 = 2048;
      uint64_t v130 = v72;
      _os_log_impl(&dword_1A460D000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ took %llums to save %lu feeds and %lu feed items in the database", buf, 0x2Au);

      a1 = v64;
    }
    -[FCFeedRequestOperation _reportProgressWithFeedItems:](*(id **)(a1 + 32), v100);
    uint64_t v73 = -[FCFeedRequestOperation _countOfDroppedFeeds](*(void *)(a1 + 32));
    unint64_t v74 = v73;
    id v75 = *(id **)(a1 + 32);
    if (v75)
    {
      if (([*(id *)(a1 + 32) options] & 0x10) != 0)
      {
        double v79 = *(void **)(a1 + 32);
      }
      else
      {
        uint64_t v76 = [v75 retryCount];
        if (v76 != [v75 maxRetries]
          || (double v77 = 0.5, (unint64_t)[v75[60] count] <= 2))
        {
          double v77 = 0.1;
        }
        unint64_t v78 = objc_msgSend(v75[60], "count", v96);
        double v79 = *(void **)(a1 + 32);
        if (v74 > vcvtmd_u64_f64(v77 * (double)v78))
        {
          uint64_t v80 = *(void *)(a1 + 80);
          v81 = (void *)MEMORY[0x1E4F28C58];
          if (v79) {
            double v79 = (void *)v79[60];
          }
          goto LABEL_62;
        }
      }
      if (v79) {
        double v79 = (void *)v79[65];
      }
    }
    else
    {
      double v79 = 0;
      if (v73)
      {
        uint64_t v80 = *(void *)(a1 + 80);
        v81 = (void *)MEMORY[0x1E4F28C58];
        id v5 = v96;
LABEL_62:
        uint64_t v82 = v79;
        uint64_t v83 = objc_msgSend(v81, "fc_requestDroppedErrorForDroppedFeeds:totalFeeds:", v74, objc_msgSend(v82, "count"));
        (*(void (**)(uint64_t, void *))(v80 + 16))(v80, v83);

LABEL_82:
        unint64_t v10 = 0;
        goto LABEL_83;
      }
      id v5 = v96;
    }
    v84 = v79;
    uint64_t v85 = [v84 count];
    v86 = [*(id *)(a1 + 32) feedRequests];

    uint64_t v87 = [v86 count];
    if (v85 == v87)
    {
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
    else
    {
      if (([*(id *)(a1 + 32) options] & 0x10) != 0)
      {
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        uint64_t v88 = *(void *)(a1 + 32);
        if (v88) {
          v89 = *(void **)(v88 + 496);
        }
        else {
          v89 = 0;
        }
        v90 = objc_msgSend(v89, "allValues", v96);
        uint64_t v91 = [v90 countByEnumeratingWithState:&v104 objects:v122 count:16];
        if (v91)
        {
          uint64_t v92 = v91;
          uint64_t v93 = *(void *)v105;
          do
          {
            for (uint64_t i = 0; i != v92; ++i)
            {
              if (*(void *)v105 != v93) {
                objc_enumerationMutation(v90);
              }
              uint64_t v95 = *(void *)(*((void *)&v104 + 1) + 8 * i);
              if (v95) {
                *(unsigned char *)(v95 + 8) = 1;
              }
            }
            uint64_t v92 = [v90 countByEnumeratingWithState:&v104 objects:v122 count:16];
          }
          while (v92);
        }
      }
      -[FCFeedRequestOperation _gatherAllOrderFeedResponsesWithCompletionHandler:](*(void *)(a1 + 32), *(void *)(a1 + 80));
    }
    goto LABEL_82;
  }
  uint64_t v116 = MEMORY[0x1E4F143A8];
  uint64_t v117 = 3221225472;
  id v118 = __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_2;
  long long v119 = &unk_1E5B4BE70;
  id v120 = *(id *)(a1 + 32);
  unint64_t v10 = v98;
  id v121 = v98;
  [v120 finishedPerformingOperationWithError:v121];

LABEL_83:
}

uint64_t __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

id __76__FCFeedRequestOperation__gatherAllOrderFeedResponsesWithCompletionHandler___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F82A50];
  uint64_t v4 = a1[4];
  id v5 = (void *)a1[5];
  id v6 = a2;
  id v7 = [v5 context];
  uint64_t v8 = [v7 internalContentContext];
  uint64_t v9 = [v8 articleRecordSource];
  unint64_t v10 = [v3 feedItemFromCKRecord:v6 storefrontID:v4 recordSource:v9];

  [v10 setFeedID:a1[6]];
  return v10;
}

- (uint64_t)_countOfDroppedFeeds
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = *(id *)(a1 + 520);
    id v3 = [v2 allValues];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__FCFeedRequestOperation__countOfDroppedFeeds__block_invoke;
    v5[3] = &unk_1E5B56F90;
    v5[4] = v1;
    uint64_t v1 = objc_msgSend(v3, "fc_countOfObjectsPassingTest:", v5);
  }
  return v1;
}

FCCKOrderFeedRequest *__78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 feedRange];
  id v5 = v4;
  if (*(void *)(a1 + 32))
  {
    id v6 = v4;
    id v7 = [v6 top];
    uint64_t v8 = [v7 date];

    uint64_t v9 = [v6 bottom];

    unint64_t v10 = [v9 date];

    uint64_t v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v12 = [v11 components:62 fromDate:v8];
    objc_msgSend(v12, "setHour:", objc_msgSend(v12, "hour") + 1);
    id v13 = [v11 dateFromComponents:v12];
    v14 = [v11 components:62 fromDate:v10];
    __int16 v15 = [v11 dateFromComponents:v14];
    int v16 = +[FCFeedRange feedRangeFromDate:v13 toDate:v15];
  }
  else
  {
    int v16 = 0;
  }
  unint64_t v17 = objc_alloc_init(FCCKOrderFeedRequest);
  uint64_t v19 = [v3 feedID];
  if (v17) {
    objc_setProperty_nonatomic_copy(v17, v18, v19, 8);
  }

  id v20 = [v16 top];
  uint64_t v21 = [v20 order];
  if (v17) {
    v17->_maxOrder = v21;
  }

  char v22 = [v16 bottom];
  uint64_t v23 = [v22 order];
  if (v17) {
    v17->_minOrder = v23;
  }

  uint64_t v24 = [v3 maxCount];
  if (v17) {
    v17->_resultsLimit = v24;
  }

  return v17;
}

void __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v83 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id v6 = (void *)v6[59];
  }
  id v7 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    unint64_t v10 = (void *)*((void *)WeakRetained + 54);
  }
  else {
    unint64_t v10 = 0;
  }
  id v11 = v10;
  [v7 addObjectsFromArray:v11];

  if (v5)
  {
    uint64_t v93 = MEMORY[0x1E4F143A8];
    uint64_t v94 = 3221225472;
    uint64_t v95 = __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_3;
    uint64_t v96 = &unk_1E5B4BE70;
    id v97 = *(id *)(a1 + 32);
    id v98 = v5;
    [v97 finishedPerformingOperationWithError:v98];

    uint64_t v12 = v5;
    id v13 = v83;
    goto LABEL_70;
  }
  v14 = v83;
  if (([*(id *)(a1 + 32) options] & 2) != 0)
  {
    __int16 v15 = [*(id *)(a1 + 40) articleRecordSource];
    if (v83) {
      int v16 = (void *)*((void *)v83 + 1);
    }
    else {
      int v16 = 0;
    }
    id v17 = v16;
    uint64_t v18 = [v15 saveArticleRecords:v17];

    uint64_t v19 = *(void **)(a1 + 32);
    if (v19) {
      uint64_t v19 = (void *)v19[66];
    }
    id v20 = v19;
    uint64_t v21 = +[FCHeldRecords heldRecordsByMerging:v20 with:v18];
    -[FCFeedRequestOperation setResultHeldArticleRecords:](*(void *)(a1 + 32), v21);

    v14 = v83;
  }
  if (([*(id *)(a1 + 32) options] & 4) != 0)
  {
    char v22 = [*(id *)(a1 + 40) tagRecordSource];
    if (v14) {
      uint64_t v23 = (void *)v14[3];
    }
    else {
      uint64_t v23 = 0;
    }
    id v24 = v23;
    id v25 = [v22 saveTagRecords:v24];

    uint64_t v26 = *(void **)(a1 + 32);
    if (v26) {
      uint64_t v26 = (void *)v26[67];
    }
    id v27 = v26;
    uint64_t v28 = +[FCHeldRecords heldRecordsByMerging:v27 with:v25];
    -[FCFeedRequestOperation setResultHeldTagRecords:](*(void *)(a1 + 32), v28);

    v14 = v83;
  }
  if (([*(id *)(a1 + 32) options] & 8) != 0)
  {
    uint64_t v29 = [*(id *)(a1 + 40) issueRecordSource];
    if (v14) {
      BOOL v30 = (void *)v14[4];
    }
    else {
      BOOL v30 = 0;
    }
    id v31 = v30;
    uint64_t v32 = [v29 saveRecords:v31];

    uint64_t v33 = *(void **)(a1 + 32);
    if (v33) {
      uint64_t v33 = (void *)v33[68];
    }
    uint64_t v34 = v33;
    uint64_t v35 = +[FCHeldRecords heldRecordsByMerging:v34 with:v32];
    -[FCFeedRequestOperation setResultHeldIssueRecords:](*(void *)(a1 + 32), v35);

    v14 = v83;
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  if (v14) {
    id v36 = (void *)v14[2];
  }
  else {
    id v36 = 0;
  }
  id obj = v36;
  uint64_t v37 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v85 = *(void *)v90;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v90 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void *)(*((void *)&v89 + 1) + 8 * v39);
        BOOL v41 = *(void **)(a1 + 32);
        if (v41) {
          BOOL v41 = (void *)v41[61];
        }
        id v42 = v41;
        if (v40) {
          id v43 = *(void **)(v40 + 16);
        }
        else {
          id v43 = 0;
        }
        id v44 = v43;
        id v45 = [v42 objectForKey:v44];

        uint64_t v46 = [v45 feedRange];
        if (!v40)
        {
          v61 = 0;
          goto LABEL_49;
        }
        if (!*(unsigned char *)(v40 + 10)) {
          goto LABEL_48;
        }
        v47 = *(id **)(a1 + 32);
        __int16 v48 = (id *)(id)v40;
        v49 = v48;
        if (v47 && (id v50 = v48[3], v51 = [v50 count], v50, v51))
        {
          __int16 v52 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_requestDroppedErrorForDroppedFeeds:totalFeeds:", 1, objc_msgSend(v47[60], "count"));
          unint64_t v53 = [v47 retryCount];
          if (v53 >= [v47 maxRetries])
          {

LABEL_48:
            v61 = *(void **)(v40 + 24);
LABEL_49:
            id v62 = v61;
            v86[0] = MEMORY[0x1E4F143A8];
            v86[1] = 3221225472;
            v86[2] = __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_4;
            v86[3] = &unk_1E5B4E8D8;
            id v63 = *(id *)(a1 + 48);
            uint64_t v64 = *(void *)(a1 + 32);
            id v87 = v63;
            uint64_t v88 = v64;
            v65 = objc_msgSend(v62, "fc_arrayByTransformingWithBlock:", v86);

            uint64_t v66 = FCFeedItemsCoveredByRange(v65, v46);
            double v67 = objc_alloc_init(FCFeedResponse);
            uint64_t v68 = [v45 feedID];
            [(FCFeedResponse *)v67 setFeedID:v68];

            [(FCFeedResponse *)v67 setFeedItems:v66];
            if (v40)
            {
              if (*(unsigned char *)(v40 + 9)) {
                BOOL v69 = 1;
              }
              else {
                BOOL v69 = *(unsigned char *)(v40 + 8) != 0;
              }
            }
            else
            {
              BOOL v69 = 0;
            }
            [(FCFeedResponse *)v67 setExhaustedRequestRange:v69];
            v70 = *(void **)(a1 + 32);
            if (v70) {
              v70 = (void *)v70[65];
            }
            id v71 = v70;
            uint64_t v72 = [v45 feedID];
            [v71 setObject:v67 forKey:v72];

            long long v57 = v87;
            goto LABEL_56;
          }
          id v99 = 0;
          char v54 = [v47 canRetryWithError:v52 retryAfter:&v99];

          if ((v54 & 1) == 0) {
            goto LABEL_48;
          }
        }
        else
        {
        }
        uint64_t v55 = *(void *)(a1 + 32);
        v56 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_feedDroppedError");
        long long v57 = -[FCFeedRequestOperation _failureResponseForRequest:error:](v55, v45, v56);

        BOOL v58 = *(void **)(a1 + 32);
        if (v58) {
          BOOL v58 = (void *)v58[65];
        }
        uint64_t v59 = v58;
        uint64_t v60 = [v45 feedID];
        [v59 setObject:v57 forKey:v60];

LABEL_56:
        ++v39;
      }
      while (v38 != v39);
      uint64_t v73 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
      uint64_t v38 = v73;
    }
    while (v73);
  }

  unint64_t v74 = -[FCFeedRequestOperation _countOfDroppedFeeds](*(void *)(a1 + 32));
  uint64_t v75 = *(void *)(a1 + 32);
  if (v75) {
    uint64_t v76 = *(void **)(v75 + 480);
  }
  else {
    uint64_t v76 = 0;
  }
  unint64_t v77 = [v76 count];
  uint64_t v78 = *(void *)(a1 + 56);
  if (v74 >= v77)
  {
    double v79 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v80 = *(void **)(a1 + 32);
    if (v80) {
      uint64_t v80 = (void *)v80[60];
    }
    v81 = v80;
    uint64_t v82 = objc_msgSend(v79, "fc_requestDroppedErrorForDroppedFeeds:totalFeeds:", 1, objc_msgSend(v81, "count"));
    (*(void (**)(uint64_t, void *))(v78 + 16))(v78, v82);
  }
  else
  {
    (*(void (**)(void, void))(v78 + 16))(*(void *)(a1 + 56), 0);
  }
  uint64_t v12 = 0;
  id v13 = v83;
LABEL_70:
}

uint64_t __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

id __78__FCFeedRequestOperation__gatherEdgeCachedFeedResponsesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F82A50];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 context];
  id v7 = [v6 internalContentContext];
  uint64_t v8 = [v7 articleRecordSource];
  uint64_t v9 = [v2 feedItemFromCKRecord:v5 storefrontID:v3 recordSource:v8];

  return v9;
}

BOOL __46__FCFeedRequestOperation__countOfDroppedFeeds__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v4 = (void *)v4[60];
  }
  id v5 = v4;
  id v6 = [v3 feedID];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v8 = [v3 error];
    if (v8)
    {
      uint64_t v9 = [v3 error];
      unint64_t v10 = [v9 domain];
      if ([v10 isEqualToString:@"FCErrorDomain"])
      {
        id v11 = [v3 error];
        BOOL v12 = [v11 code] == 7;
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

BOOL __45__FCFeedRequestOperation__countOfFailedFeeds__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v4 = (void *)v4[60];
  }
  id v5 = v4;
  id v6 = [v3 feedID];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v8 = [v3 error];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __55__FCFeedRequestOperation__reportProgressWithFeedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 512);
  }
  else {
    id v3 = 0;
  }
  return [v3 containsObject:a2];
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (FCFeedDatabase)feedDatabase
{
  return self->_feedDatabase;
}

- (void)setFeedDatabase:(id)a3
{
}

- (NSCopying)prewarmRequestKey
{
  return self->_prewarmRequestKey;
}

- (void)setPrewarmRequestKey:(id)a3
{
}

- (NSArray)feedRequests
{
  return self->_feedRequests;
}

- (void)setFeedRequests:(id)a3
{
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(unint64_t)a3
{
  self->_maxCount = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSArray)feedTransformations
{
  return self->_feedTransformations;
}

- (void)setFeedTransformations:(id)a3
{
}

- (FCEdgeCacheHint)edgeCacheHint
{
  return self->_edgeCacheHint;
}

- (void)setEdgeCacheHint:(id)a3
{
}

- (unint64_t)expectedNetworkEventCount
{
  return self->_expectedNetworkEventCount;
}

- (void)setExpectedNetworkEventCount:(unint64_t)a3
{
  self->_expectedNetworkEventCount = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)requestCompletionHandler
{
  return self->_requestCompletionHandler;
}

- (void)setRequestCompletionHandler:(id)a3
{
}

- (id)requestCompletionHandlerWithHeldRecords
{
  return self->_requestCompletionHandlerWithHeldRecords;
}

- (void)setRequestCompletionHandlerWithHeldRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHeldIssueRecords, 0);
  objc_storeStrong((id *)&self->_resultHeldTagRecords, 0);
  objc_storeStrong((id *)&self->_resultHeldArticleRecords, 0);
  objc_storeStrong((id *)&self->_resultFeedResponses, 0);
  objc_storeStrong((id *)&self->_progressReportedFeedItems, 0);
  objc_storeStrong((id *)&self->_databaseLookupsByFeedID, 0);
  objc_storeStrong((id *)&self->_feedRequestsByFeedID, 0);
  objc_storeStrong((id *)&self->_nonExpendableFeedIDs, 0);
  objc_storeStrong((id *)&self->_mutableNetworkEvents, 0);
  objc_storeStrong(&self->_requestCompletionHandlerWithHeldRecords, 0);
  objc_storeStrong(&self->_requestCompletionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_feedTransformations, 0);
  objc_storeStrong((id *)&self->_feedRequests, 0);
  objc_storeStrong((id *)&self->_prewarmRequestKey, 0);
  objc_storeStrong((id *)&self->_feedDatabase, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end