@interface FCMultiSourceHeadlinesOperation
- (BOOL)shouldBypassRecordSourcePersistence;
- (BOOL)validateOperation;
- (FCCachePolicy)cachePolicyForArticleLists;
- (FCContentContext)context;
- (FCCoreConfiguration)configuration;
- (FCMultiSourceHeadlinesOperation)init;
- (NSArray)articleListIDs;
- (NSArray)networkEvents;
- (NSDictionary)heldRecordsByType;
- (NSDictionary)resultArticleIDHeadlinesByArticleID;
- (NSDictionary)resultArticleListHeadlinesByArticleListID;
- (NSDictionary)resultArticleListsByID;
- (NSSet)articleIDs;
- (id)headlinesCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setArticleIDs:(id)a3;
- (void)setArticleListIDs:(id)a3;
- (void)setCachePolicyForArticleLists:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setHeadlinesCompletionHandler:(id)a3;
- (void)setHeldRecordsByType:(id)a3;
- (void)setNetworkEvents:(id)a3;
- (void)setResultArticleIDHeadlinesByArticleID:(id)a3;
- (void)setResultArticleListHeadlinesByArticleListID:(id)a3;
- (void)setResultArticleListsByID:(id)a3;
- (void)setShouldBypassRecordSourcePersistence:(BOOL)a3;
@end

@implementation FCMultiSourceHeadlinesOperation

- (FCMultiSourceHeadlinesOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)FCMultiSourceHeadlinesOperation;
  v2 = [(FCOperation *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[FCCachePolicy cachePolicyWithSoftMaxAge:300.0];
    cachePolicyForArticleLists = v2->_cachePolicyForArticleLists;
    v2->_cachePolicyForArticleLists = (FCCachePolicy *)v3;

    uint64_t v5 = objc_opt_new();
    articleListIDs = v2->_articleListIDs;
    v2->_articleListIDs = (NSArray *)v5;

    uint64_t v7 = objc_opt_new();
    articleIDs = v2->_articleIDs;
    v2->_articleIDs = (NSSet *)v7;
  }
  return v2;
}

- (BOOL)validateOperation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FCMultiSourceHeadlinesOperation *)self configuration];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"multi-source headlines operation needs a configuration"];
    int v14 = 136315906;
    v15 = "-[FCMultiSourceHeadlinesOperation validateOperation]";
    __int16 v16 = 2080;
    v17 = "FCMultiSourceHeadlinesOperation.m";
    __int16 v18 = 1024;
    int v19 = 53;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
  }
  v4 = [(FCMultiSourceHeadlinesOperation *)self context];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)[[NSString alloc] initWithFormat:@"multi-source headlines operation needs a context"];
    int v14 = 136315906;
    v15 = "-[FCMultiSourceHeadlinesOperation validateOperation]";
    __int16 v16 = 2080;
    v17 = "FCMultiSourceHeadlinesOperation.m";
    __int16 v18 = 1024;
    int v19 = 54;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
  }
  if ([(FCMultiSourceHeadlinesOperation *)self shouldBypassRecordSourcePersistence]&& ([(FCMultiSourceHeadlinesOperation *)self heldRecordsByType], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)[[NSString alloc] initWithFormat:@"multi-source headlines operation requires a cached records lookup block whenever record source persistence is bypassed"];
      int v14 = 136315906;
      v15 = "-[FCMultiSourceHeadlinesOperation validateOperation]";
      __int16 v16 = 2080;
      v17 = "FCMultiSourceHeadlinesOperation.m";
      __int16 v18 = 1024;
      int v19 = 57;
      __int16 v20 = 2114;
      v21 = v13;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
    }
    char v6 = 0;
  }
  else
  {
    char v6 = 1;
  }
  uint64_t v7 = [(FCMultiSourceHeadlinesOperation *)self configuration];
  if (v7)
  {
    v8 = [(FCMultiSourceHeadlinesOperation *)self context];
    if (v8) {
      BOOL v9 = v6;
    }
    else {
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
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    uint64_t v5 = [(FCOperation *)self shortOperationDescription];
    char v6 = [(FCMultiSourceHeadlinesOperation *)self articleIDs];
    uint64_t v7 = [v6 count];
    v8 = [(FCMultiSourceHeadlinesOperation *)self articleListIDs];
    *(_DWORD *)buf = 138543874;
    v43 = v5;
    __int16 v44 = 2048;
    uint64_t v45 = v7;
    __int16 v46 = 2048;
    uint64_t v47 = [v8 count];
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch headlines for articleIDs:%lu articleListIDs:%lu", buf, 0x20u);
  }
  BOOL v9 = [(FCMultiSourceHeadlinesOperation *)self articleIDs];
  objc_super v10 = [(FCMultiSourceHeadlinesOperation *)self articleListIDs];
  v28 = [(FCMultiSourceHeadlinesOperation *)self heldRecordsByType];
  BOOL v11 = [(FCMultiSourceHeadlinesOperation *)self shouldBypassRecordSourcePersistence];
  v12 = [(FCMultiSourceHeadlinesOperation *)self context];
  v13 = (void *)MEMORY[0x1E4F1CA60];
  v40[0] = @"Article";
  v39[0] = @"sourceChannelTagID";
  v39[1] = @"parentIssueID";
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v41[0] = v14;
  v41[1] = MEMORY[0x1E4F1CBF0];
  v40[1] = @"Tag";
  v40[2] = @"Issue";
  v41[2] = MEMORY[0x1E4F1CBF0];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
  __int16 v16 = [v13 dictionaryWithDictionary:v15];

  if ([v10 count])
  {
    v38 = @"articleIDs";
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    [v16 setObject:v17 forKeyedSubscript:@"ArticleList"];
  }
  __int16 v18 = objc_alloc_init(FCRecordChainFetchOperation);
  [(FCRecordChainFetchOperation *)v18 setContext:v12];
  int v19 = (void *)MEMORY[0x1E4F1C978];
  __int16 v20 = [v9 allObjects];
  v21 = objc_msgSend(v19, "fc_arrayByAddingObjectsFromArray:toArray:", v20, v10);
  [(FCRecordChainFetchOperation *)v18 setTopLevelRecordIDs:v21];

  [(FCRecordChainFetchOperation *)v18 setLinkKeysByRecordType:v16];
  v36 = @"ArticleList";
  uint64_t v22 = [(FCMultiSourceHeadlinesOperation *)self cachePolicyForArticleLists];
  v37 = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  [(FCRecordChainFetchOperation *)v18 setCachePoliciesByRecordType:v23];

  [(FCRecordChainFetchOperation *)v18 setShouldReturnErrorWhenSomeRecordsMissing:1];
  [(FCRecordChainFetchOperation *)v18 setShouldBypassRecordSourcePersistence:v11];
  if (v11)
  {
    v24 = v34;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke;
    v34[3] = &unk_1E5B57178;
    v23 = &v35;
    id v35 = v28;
  }
  else
  {
    v24 = 0;
  }
  [(FCRecordChainFetchOperation *)v18 setCachedRecordsLookupBlock:v24];
  objc_initWeak((id *)buf, v18);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke_2;
  v29[3] = &unk_1E5B571E0;
  v29[4] = self;
  id v25 = v10;
  id v30 = v25;
  id v26 = v9;
  id v31 = v26;
  id v27 = v12;
  id v32 = v27;
  objc_copyWeak(&v33, (id *)buf);
  [(FCRecordChainFetchOperation *)v18 setRecordChainCompletionHandler:v29];
  [(FCOperation *)self associateChildOperation:v18];
  [(FCOperation *)v18 start];
  objc_destroyWeak(&v33);

  objc_destroyWeak((id *)buf);
  if (v11) {
}
  }

id __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  char v6 = [v4 objectForKeyedSubscript:a2];
  uint64_t v7 = [v6 heldRecordsForIDs:v5];

  return v7;
}

void __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v5 = a2;
  char v6 = [v5 objectForKeyedSubscript:&unk_1EF8D7FE0];
  uint64_t v7 = [v5 objectForKeyedSubscript:&unk_1EF8D7FF8];
  v8 = [v5 objectForKeyedSubscript:&unk_1EF8D8010];
  BOOL v9 = [v5 objectForKeyedSubscript:&unk_1EF8D8028];

  objc_super v10 = [*(id *)(a1 + 32) configuration];
  BOOL v11 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    v13 = v11;
    int v14 = [v12 shortOperationDescription];
    *(_DWORD *)buf = 138544130;
    v51 = v14;
    __int16 v52 = 2048;
    uint64_t v53 = [v7 count];
    __int16 v54 = 2048;
    uint64_t v55 = [v6 count];
    __int16 v56 = 2048;
    uint64_t v57 = [v9 count];
    _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ received articleRecords:%lu articleListRecords:%lu tagRecords:%lu requireSourceChannels:YES", buf, 0x2Au);
  }
  if (*(void *)(a1 + 40) && v7 && v9 && v6)
  {
    v15 = [v6 transformRecordsWithBlock:&__block_literal_global_116];
    __int16 v16 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(a1 + 32);
      log = v16;
      __int16 v18 = [v17 shortOperationDescription];
      uint64_t v19 = [v6 count];
      __int16 v20 = v7;
      v21 = v6;
      uint64_t v22 = v10;
      v23 = v8;
      uint64_t v24 = v19;
      uint64_t v25 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138543874;
      v51 = v18;
      __int16 v52 = 2048;
      uint64_t v53 = v24;
      v8 = v23;
      objc_super v10 = v22;
      char v6 = v21;
      uint64_t v7 = v20;
      __int16 v54 = 2048;
      uint64_t v55 = v25;
      _os_log_impl(&dword_1A460D000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ transformed articleListRecords:%lu into articleLists:%lu", buf, 0x20u);
    }
    id v26 = [*(id *)(a1 + 56) assetManager];
    id v27 = FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists(v10, v26, v7, v9, v8, v15, 1);
    [*(id *)(a1 + 32) setResultArticleListHeadlinesByArticleListID:v27];

    v28 = objc_msgSend(v15, "fc_dictionaryWithKeyBlock:", &__block_literal_global_28_4);
    [*(id *)(a1 + 32) setResultArticleListsByID:v28];
  }
  if (*(void *)(a1 + 48) && v7 && v9)
  {
    v29 = [*(id *)(a1 + 56) tagController];
    id v30 = [v29 channelsForTagRecords:v9];

    id v31 = [*(id *)(a1 + 56) assetManager];
    id v32 = FCHeadlinesByArticleIDFromHeldRecords(v10, v31, *(void **)(a1 + 48), v7, v30, v8, 1, 0);
    [*(id *)(a1 + 32) setResultArticleIDHeadlinesByArticleID:v32];
  }
  id v33 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v34 = *(void **)(a1 + 32);
    loga = v33;
    id v35 = [v34 shortOperationDescription];
    v36 = [*(id *)(a1 + 32) resultArticleListHeadlinesByArticleListID];
    v37 = v9;
    v38 = v7;
    v39 = v6;
    v40 = v10;
    v41 = v8;
    uint64_t v42 = [v36 count];
    v43 = [*(id *)(a1 + 32) resultArticleIDHeadlinesByArticleID];
    uint64_t v44 = [v43 count];
    *(_DWORD *)buf = 138543874;
    v51 = v35;
    __int16 v52 = 2048;
    uint64_t v53 = v42;
    v8 = v41;
    objc_super v10 = v40;
    char v6 = v39;
    uint64_t v7 = v38;
    BOOL v9 = v37;
    __int16 v54 = 2048;
    uint64_t v55 = v44;
    _os_log_impl(&dword_1A460D000, loga, OS_LOG_TYPE_DEFAULT, "%{public}@ result articleListHeadlinesByArticleListID:%lu articleIDHeadlinesByArticleID:%lu", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  __int16 v46 = [WeakRetained networkEvents];
  [*(id *)(a1 + 32) setNetworkEvents:v46];

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v49];
}

FCArticleList *__51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  char v6 = [[FCArticleList alloc] initWithRecord:v5 interestToken:v4];

  return v6;
}

uint64_t __51__FCMultiSourceHeadlinesOperation_performOperation__block_invoke_25(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v9 = a3;
  id v4 = [(FCMultiSourceHeadlinesOperation *)self headlinesCompletionHandler];

  if (v4)
  {
    id v5 = [(FCMultiSourceHeadlinesOperation *)self headlinesCompletionHandler];
    char v6 = [(FCMultiSourceHeadlinesOperation *)self resultArticleListHeadlinesByArticleListID];
    uint64_t v7 = [(FCMultiSourceHeadlinesOperation *)self resultArticleListsByID];
    v8 = [(FCMultiSourceHeadlinesOperation *)self resultArticleIDHeadlinesByArticleID];
    ((void (**)(void, void *, void *, void *, id))v5)[2](v5, v6, v7, v8, v9);
  }
}

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)articleListIDs
{
  return self->_articleListIDs;
}

- (void)setArticleListIDs:(id)a3
{
}

- (NSSet)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
}

- (FCCachePolicy)cachePolicyForArticleLists
{
  return self->_cachePolicyForArticleLists;
}

- (void)setCachePolicyForArticleLists:(id)a3
{
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void)setNetworkEvents:(id)a3
{
}

- (BOOL)shouldBypassRecordSourcePersistence
{
  return self->_shouldBypassRecordSourcePersistence;
}

- (void)setShouldBypassRecordSourcePersistence:(BOOL)a3
{
  self->_shouldBypassRecordSourcePersistence = a3;
}

- (NSDictionary)heldRecordsByType
{
  return self->_heldRecordsByType;
}

- (void)setHeldRecordsByType:(id)a3
{
}

- (id)headlinesCompletionHandler
{
  return self->_headlinesCompletionHandler;
}

- (void)setHeadlinesCompletionHandler:(id)a3
{
}

- (NSDictionary)resultArticleListHeadlinesByArticleListID
{
  return self->_resultArticleListHeadlinesByArticleListID;
}

- (void)setResultArticleListHeadlinesByArticleListID:(id)a3
{
}

- (NSDictionary)resultArticleListsByID
{
  return self->_resultArticleListsByID;
}

- (void)setResultArticleListsByID:(id)a3
{
}

- (NSDictionary)resultArticleIDHeadlinesByArticleID
{
  return self->_resultArticleIDHeadlinesByArticleID;
}

- (void)setResultArticleIDHeadlinesByArticleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultArticleIDHeadlinesByArticleID, 0);
  objc_storeStrong((id *)&self->_resultArticleListsByID, 0);
  objc_storeStrong((id *)&self->_resultArticleListHeadlinesByArticleListID, 0);
  objc_storeStrong(&self->_headlinesCompletionHandler, 0);
  objc_storeStrong((id *)&self->_heldRecordsByType, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_cachePolicyForArticleLists, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
  objc_storeStrong((id *)&self->_articleListIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end