@interface FCCurrentMagazineContentFetchOperation
- (BOOL)validateOperation;
- (FCCachePolicy)cachedPolicy;
- (FCCurrentMagazineContentFetchOperation)init;
- (FCCurrentMagazineContentFetchOperation)initWithContext:(id)a3 configIssueIDs:(id)a4 configArticleIDs:(id)a5 trendingArticleListID:(id)a6;
- (id)_filterInaccessibleHeadlines:(uint64_t)a1;
- (id)_filterInaccessibleIssues:(uint64_t)a1;
- (id)fetchCompletionHandler;
- (int64_t)contentOptions;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachedPolicy:(id)a3;
- (void)setContentOptions:(int64_t)a3;
- (void)setFetchCompletionHandler:(id)a3;
@end

@implementation FCCurrentMagazineContentFetchOperation

- (FCCurrentMagazineContentFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCurrentMagazineContentFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCCurrentMagazineContentFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 57;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCurrentMagazineContentFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCCurrentMagazineContentFetchOperation)initWithContext:(id)a3 configIssueIDs:(id)a4 configArticleIDs:(id)a5 trendingArticleListID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)FCCurrentMagazineContentFetchOperation;
  uint64_t v15 = [(FCOperation *)&v25 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    uint64_t v17 = [v12 copy];
    configIssueIDs = v16->_configIssueIDs;
    v16->_configIssueIDs = (NSArray *)v17;

    uint64_t v19 = [v13 copy];
    configArticleIDs = v16->_configArticleIDs;
    v16->_configArticleIDs = (NSArray *)v19;

    uint64_t v21 = [v14 copy];
    trendingArticleListID = v16->_trendingArticleListID;
    v16->_trendingArticleListID = (NSString *)v21;

    cachedPolicy = v16->_cachedPolicy;
    v16->_cachedPolicy = 0;

    v16->_contentOptions = 7;
  }

  return v16;
}

- (BOOL)validateOperation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self && self->_context)
  {
    char v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)[[NSString alloc] initWithFormat:@"current magazine content fetch operation requires a context"];
      int v10 = 136315906;
      id v11 = "-[FCCurrentMagazineContentFetchOperation validateOperation]";
      __int16 v12 = 2080;
      id v13 = "FCCurrentMagazineContentFetchOperation.m";
      __int16 v14 = 1024;
      int v15 = 84;
      __int16 v16 = 2114;
      uint64_t v17 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
    }
    char v3 = 0;
    if (!self)
    {
LABEL_9:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)[[NSString alloc] initWithFormat:@"current magazine content fetch operation requires config issue IDs"];
        int v10 = 136315906;
        id v11 = "-[FCCurrentMagazineContentFetchOperation validateOperation]";
        __int16 v12 = 2080;
        id v13 = "FCCurrentMagazineContentFetchOperation.m";
        __int16 v14 = 1024;
        int v15 = 88;
        __int16 v16 = 2114;
        uint64_t v17 = v8;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
      }
      char v4 = 0;
      if (!self) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  if (!self->_configIssueIDs) {
    goto LABEL_9;
  }
  char v4 = 1;
LABEL_12:
  if (self->_configArticleIDs)
  {
    char v5 = 1;
    return v5 & v3 & v4;
  }
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = (void *)[[NSString alloc] initWithFormat:@"current magazine content fetch operation requires config article IDs"];
    int v10 = 136315906;
    id v11 = "-[FCCurrentMagazineContentFetchOperation validateOperation]";
    __int16 v12 = 2080;
    id v13 = "FCCurrentMagazineContentFetchOperation.m";
    __int16 v14 = 1024;
    int v15 = 92;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
  }
  char v5 = 0;
  return v5 & v3 & v4;
}

- (void)performOperation
{
  char v3 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__20;
  v26[4] = __Block_byref_object_dispose__20;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__20;
  v24[4] = __Block_byref_object_dispose__20;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__20;
  v22[4] = __Block_byref_object_dispose__20;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__20;
  v20[4] = __Block_byref_object_dispose__20;
  id v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__20;
  v18[4] = __Block_byref_object_dispose__20;
  id v19 = 0;
  dispatch_group_enter(v3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke;
  v11[3] = &unk_1E5B50150;
  id v13 = v26;
  __int16 v14 = v24;
  int v15 = v22;
  __int16 v16 = v20;
  uint64_t v17 = v18;
  char v4 = v3;
  __int16 v12 = v4;
  char v5 = v11;
  if (self)
  {
    id v6 = self->_context;
    v7 = [(FCCloudContext *)v6 configurationManager];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke;
    v28[3] = &unk_1E5B502D8;
    v28[4] = self;
    v8 = v5;

    id v29 = v8;
    FCCoreConfigurationFetch(v7, v28);
  }
  __int16 v9 = FCDispatchQueueForQualityOfService([(FCCurrentMagazineContentFetchOperation *)self qualityOfService]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke_2;
  v10[3] = &unk_1E5B50178;
  v10[4] = self;
  v10[5] = v18;
  v10[6] = v26;
  v10[7] = v24;
  v10[8] = v22;
  v10[9] = v20;
  dispatch_group_notify(v4, v9, v10);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

void __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v11;
  id v30 = v11;

  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v12;
  id v20 = v12;

  uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v13;
  id v23 = v13;

  uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
  id v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v14;
  id v26 = v14;

  uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
  v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v15;
  id v29 = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(v2 + 8) + 40)) {
    return objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", MEMORY[0x1E4F143A8], 3221225472, __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke_3, &unk_1E5B4F3B0, *(void *)(a1 + 32), v2);
  }
  uint64_t v4 = -[FCCurrentMagazineContentFetchOperation _filterInaccessibleIssues:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  char v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6)
  {
    if (v4) {
      v8 = (void *)v4;
    }
    else {
      v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)(v6 + 424), v8);
  }

  uint64_t v9 = -[FCCurrentMagazineContentFetchOperation _filterInaccessibleHeadlines:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  int v10 = (void *)v9;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    if (v9) {
      id v12 = (void *)v9;
    }
    else {
      id v12 = v7;
    }
    objc_storeStrong((id *)(v11 + 432), v12);
  }

  uint64_t v13 = -[FCCurrentMagazineContentFetchOperation _filterInaccessibleIssues:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  id v14 = (void *)v13;
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15)
  {
    if (v13) {
      uint64_t v16 = (void *)v13;
    }
    else {
      uint64_t v16 = v7;
    }
    objc_storeStrong((id *)(v15 + 440), v16);
  }

  uint64_t v17 = -[FCCurrentMagazineContentFetchOperation _filterInaccessibleHeadlines:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  uint64_t v18 = (void *)v17;
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19)
  {
    if (v17) {
      id v20 = (void *)v17;
    }
    else {
      id v20 = v7;
    }
    objc_storeStrong((id *)(v19 + 448), v20);
  }

  uint64_t v21 = *(void **)(a1 + 32);
  return [v21 finishedPerformingOperationWithError:0];
}

uint64_t __58__FCCurrentMagazineContentFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)_filterInaccessibleIssues:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(id *)(a1 + 392);
    id v4 = a2;
    char v5 = [v3 issueAccessChecker];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__FCCurrentMagazineContentFetchOperation__filterInaccessibleIssues___block_invoke;
    v9[3] = &unk_1E5B50328;
    id v10 = v5;
    id v6 = v5;
    v7 = objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v9);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_filterInaccessibleHeadlines:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(id *)(a1 + 392);
    id v4 = a2;
    char v5 = [v3 articleAccessChecker];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__FCCurrentMagazineContentFetchOperation__filterInaccessibleHeadlines___block_invoke;
    v9[3] = &unk_1E5B50300;
    id v10 = v5;
    id v6 = v5;
    v7 = objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v9);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    char v5 = (id)FCOperationLog;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [(FCOperation *)self shortOperationDescription];
      if (self) {
        resultConfigIssues = self->_resultConfigIssues;
      }
      else {
        resultConfigIssues = 0;
      }
      v7 = resultConfigIssues;
      uint64_t v22 = [(NSArray *)v7 count];
      if (self) {
        resultConfigHeadlines = self->_resultConfigHeadlines;
      }
      else {
        resultConfigHeadlines = 0;
      }
      uint64_t v9 = resultConfigHeadlines;
      uint64_t v10 = [(NSArray *)v9 count];
      if (self) {
        resultCurrentIssues = self->_resultCurrentIssues;
      }
      else {
        resultCurrentIssues = 0;
      }
      id v12 = resultCurrentIssues;
      uint64_t v13 = [(NSArray *)v12 count];
      if (self) {
        resultTrendingHeadlines = self->_resultTrendingHeadlines;
      }
      else {
        resultTrendingHeadlines = 0;
      }
      uint64_t v15 = resultTrendingHeadlines;
      *(_DWORD *)buf = 138544386;
      id v25 = v23;
      __int16 v26 = 2048;
      uint64_t v27 = v22;
      __int16 v28 = 2048;
      uint64_t v29 = v10;
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      __int16 v32 = 2048;
      uint64_t v33 = [(NSArray *)v15 count];
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with %lu config issues, %lu config headlines, %lu current issues, and %lu trending headlines", buf, 0x34u);
    }
  }
  uint64_t v16 = [(FCCurrentMagazineContentFetchOperation *)self fetchCompletionHandler];

  if (v16)
  {
    uint64_t v17 = [(FCCurrentMagazineContentFetchOperation *)self fetchCompletionHandler];
    if (self)
    {
      uint64_t v18 = self->_resultConfigIssues;
      uint64_t v19 = self->_resultConfigHeadlines;
      id v20 = self->_resultCurrentIssues;
      uint64_t v21 = self->_resultTrendingHeadlines;
    }
    else
    {
      id v20 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v21 = 0;
    }
    ((void (**)(void, NSArray *, NSArray *, NSArray *, NSArray *, id))v17)[2](v17, v18, v19, v20, v21, v4);
  }
}

void __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v33[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_2;
  v25[3] = &unk_1E5B501A0;
  v25[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v26 = v5;
  id v6 = objc_msgSend(v4, "fc_array:", v25);
  if ([v6 count])
  {
    v7 = objc_alloc_init(FCRecordChainFetchOperation);
    v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v10 = *(void *)(v9 + 392);
    }
    else {
      uint64_t v10 = 0;
    }
    [(FCRecordChainFetchOperation *)v7 setContext:v10];
    [(FCRecordChainFetchOperation *)v8 setTopLevelRecordIDs:v6];
    v32[0] = @"TagList";
    uint64_t v31 = @"tagIDs";
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v33[0] = v11;
    v32[1] = @"Tag";
    __int16 v30 = @"latestIssueIDs";
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    v33[1] = v12;
    v32[2] = @"Issue";
    uint64_t v29 = @"channelTagID";
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    v33[2] = v13;
    v32[3] = @"Article";
    v28[0] = @"sourceChannelTagID";
    v28[1] = @"parentIssueID";
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v33[3] = v14;
    v32[4] = @"ArticleList";
    uint64_t v27 = @"articleIDs";
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    v33[4] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:5];
    [(FCRecordChainFetchOperation *)v8 setLinkKeysByRecordType:v16];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_4;
    v23[3] = &unk_1E5B501C8;
    v23[4] = *(void *)(a1 + 32);
    [(FCRecordChainFetchOperation *)v8 setDynamicCachePolicyBlock:v23];
    uint64_t v17 = +[FCEdgeCacheHint edgeCacheHintForMagazineContent];
    [(FCRecordChainFetchOperation *)v8 setEdgeCacheHint:v17];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_5;
    v20[3] = &unk_1E5B502B0;
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 32);
    id v22 = v18;
    v20[4] = v19;
    id v21 = v5;
    [(FCRecordChainFetchOperation *)v8 setRecordChainCompletionHandler:v20];
    [*(id *)(a1 + 32) associateChildOperation:v8];
    [(FCOperation *)v8 start];
  }
  else
  {
    v23[5] = MEMORY[0x1E4F143A8];
    v23[6] = 3221225472;
    v23[7] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_3;
    v23[8] = &unk_1E5B4CA88;
    id v24 = *(id *)(a1 + 40);
    (*((void (**)(id, void, void, void, void, void))v24 + 2))(v24, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 0);
    v8 = (FCRecordChainFetchOperation *)v24;
  }
}

void __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (([*(id *)(a1 + 32) contentOptions] & 4) != 0)
  {
    id v3 = [*(id *)(a1 + 40) paidBundleConfig];
    id v4 = [v3 recommendableIssuesTagList];
    objc_msgSend(v11, "fc_safelyAddObject:", v4);
  }
  if ([*(id *)(a1 + 32) contentOptions])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 416);
    }
    else {
      uint64_t v6 = 0;
    }
    objc_msgSend(v11, "fc_safelyAddObject:", v6);
  }
  if (([*(id *)(a1 + 32) contentOptions] & 2) != 0)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v8 = *(void *)(v7 + 400);
    }
    else {
      uint64_t v8 = 0;
    }
    [v11 addObjectsFromArray:v8];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v10 = *(void *)(v9 + 408);
    }
    else {
      uint64_t v10 = 0;
    }
    [v11 addObjectsFromArray:v10];
  }
}

uint64_t __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) cachedPolicy];
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[FCCachePolicy cachePolicyWithSoftMaxAge:60.0];
  }
  id v4 = v3;

  return v4;
}

void __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v75 = MEMORY[0x1E4F143A8];
    uint64_t v76 = 3221225472;
    v77 = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_6;
    v78 = &unk_1E5B4C7C0;
    id v80 = *(id *)(a1 + 48);
    id v79 = v6;
    (*((void (**)(id, void, void, void, void, id))v80 + 2))(v80, 0, 0, 0, 0, v79);

    id v7 = v80;
  }
  else
  {
    v53 = [v5 objectForKeyedSubscript:&unk_1EF8D7860];
    v63 = [v5 objectForKeyedSubscript:&unk_1EF8D7878];
    uint64_t v8 = [v5 objectForKeyedSubscript:&unk_1EF8D7890];
    v62 = [v5 objectForKeyedSubscript:&unk_1EF8D78A8];
    v59 = [v5 objectForKeyedSubscript:&unk_1EF8D78C0];
    uint64_t v9 = *(void **)(a1 + 32);
    if (v9) {
      uint64_t v9 = (void *)v9[49];
    }
    uint64_t v10 = v9;
    id v11 = [v10 tagController];
    id v12 = [v11 channelsForTagRecords:v63];

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    id v14 = *(void **)(a1 + 32);
    if (v14) {
      id v14 = (void *)v14[49];
    }
    uint64_t v15 = v14;
    uint64_t v16 = [v15 subscriptionController];
    uint64_t v17 = [v16 mutedTagIDs];
    id v18 = [v13 setWithArray:v17];

    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_37;
    v73[3] = &unk_1E5B501F0;
    v73[4] = *(void *)(a1 + 32);
    id v19 = v18;
    id v74 = v19;
    v61 = [v62 heldRecordsPassingTest:v73];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_2_40;
    v71[3] = &unk_1E5B50218;
    v71[4] = *(void *)(a1 + 32);
    id v55 = v19;
    id v72 = v55;
    id v20 = [v8 heldRecordsPassingTest:v71];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_3_42;
    v68[3] = &unk_1E5B50240;
    id v21 = v12;
    uint64_t v22 = *(void *)(a1 + 32);
    id v69 = v21;
    uint64_t v70 = v22;
    v60 = v20;
    id v23 = [v20 transformRecordsByIDWithBlock:v68];
    id v24 = *(void **)(a1 + 32);
    id v25 = *(void **)(a1 + 40);
    v56 = v8;
    if (v24) {
      id v24 = (void *)v24[49];
    }
    id v26 = v24;
    uint64_t v27 = [v26 assetManager];
    __int16 v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = [v62 allRecordIDs];
    __int16 v30 = [v28 setWithArray:v29];
    v58 = FCHeadlinesByArticleIDFromHeldRecords(v25, v27, v30, v61, v21, v60, 1, 1);

    uint64_t v31 = [v59 transformRecordsByIDWithBlock:&__block_literal_global_50_1];
    __int16 v32 = *(void **)(a1 + 32);
    uint64_t v33 = *(void **)(a1 + 40);
    if (v32) {
      __int16 v32 = (void *)v32[49];
    }
    uint64_t v34 = v32;
    v35 = [v34 assetManager];
    v52 = v31;
    v36 = [v31 allValues];
    v57 = FCHeadlinesByArticleListIDFromHeldRecordsAndArticleLists(v33, v35, v61, v63, v60, v36, 1);

    v37 = (void *)MEMORY[0x1E4F1C978];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_6_52;
    v64[3] = &unk_1E5B50288;
    id v7 = v53;
    id v65 = v7;
    id v54 = v21;
    id v66 = v54;
    id v38 = v23;
    id v67 = v38;
    v39 = objc_msgSend(v37, "fc_array:", v64);
    uint64_t v40 = *(void *)(a1 + 32);
    if (v40) {
      uint64_t v41 = *(void *)(v40 + 400);
    }
    else {
      uint64_t v41 = 0;
    }
    v42 = objc_msgSend(v38, "nf_objectsForKeysWithoutMarker:", v41);
    uint64_t v43 = *(void *)(a1 + 32);
    if (v43) {
      uint64_t v44 = *(void *)(v43 + 408);
    }
    else {
      uint64_t v44 = 0;
    }
    v45 = objc_msgSend(v58, "nf_objectsForKeysWithoutMarker:", v44);
    uint64_t v46 = *(void *)(a1 + 32);
    if (v46) {
      uint64_t v47 = *(void *)(v46 + 416);
    }
    else {
      uint64_t v47 = 0;
    }
    v48 = objc_msgSend(v57, "fc_safeObjectForKey:", v47);
    v49 = v48;
    if (v48)
    {
      id v50 = v48;
    }
    else
    {
      id v50 = [MEMORY[0x1E4F1C978] array];
    }
    v51 = v50;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, 0, *(void *)(a1 + 32));
}

uint64_t __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[49];
  }
  id v5 = v4;
  id v6 = [v5 contentStoreFrontID];
  if ([v3 isAllowedInStorefront:v6])
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v3 sourceChannelTagID];
    if ([v7 containsObject:v8])
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v10 = +[FCRestrictions sharedInstance];
      uint64_t v9 = objc_msgSend(v10, "isNewsVersionAllowed:", objc_msgSend(v3, "minimumNewsVersion"));
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_2_40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[49];
  }
  id v5 = v4;
  id v6 = [v5 contentStoreFrontID];
  if ([v3 isAllowedInStorefront:v6])
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v3 channelTagID];
    uint64_t v9 = [v7 containsObject:v8] ^ 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

FCIssue *__92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_3_42(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v5 channelTagID];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
    id v11 = [FCIssue alloc];
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      uint64_t v13 = *(void **)(v12 + 392);
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = [v13 assetManager];
    uint64_t v15 = [(FCIssue *)v11 initWithIssueRecord:v5 assetManager:v14 interestToken:v6 sourceChannel:v10];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

FCArticleList *__92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_5_47(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[FCArticleList alloc] initWithRecord:v5 interestToken:v4];

  return v6;
}

void __92__FCCurrentMagazineContentFetchOperation__fetchConfigContentAndCurrentIssuesWithCompletion___block_invoke_6_52(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "allRecords", 0);
  id v5 = [v4 firstObject];
  id v6 = [v5 tagIDs];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * v10)];
        uint64_t v12 = v11;
        if (v11)
        {
          uint64_t v13 = *(void **)(a1 + 48);
          id v14 = [v11 currentIssueIDs];
          uint64_t v15 = objc_msgSend(v13, "nf_objectsForKeysWithoutMarker:", v14);
          objc_msgSend(v3, "fc_safelyAddObjectsFromArray:", v15);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

uint64_t __71__FCCurrentMagazineContentFetchOperation__filterInaccessibleHeadlines___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  return [*(id *)(a1 + 32) hasAccessToItem:a2 blockedReason:&v3 error:0];
}

uint64_t __68__FCCurrentMagazineContentFetchOperation__filterInaccessibleIssues___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  return [*(id *)(a1 + 32) hasAccessToItem:a2 blockedReason:&v3 error:0];
}

- (FCCachePolicy)cachedPolicy
{
  return self->_cachedPolicy;
}

- (void)setCachedPolicy:(id)a3
{
}

- (int64_t)contentOptions
{
  return self->_contentOptions;
}

- (void)setContentOptions:(int64_t)a3
{
  self->_contentOptions = a3;
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTrendingHeadlines, 0);
  objc_storeStrong((id *)&self->_resultCurrentIssues, 0);
  objc_storeStrong((id *)&self->_resultConfigHeadlines, 0);
  objc_storeStrong((id *)&self->_resultConfigIssues, 0);
  objc_storeStrong((id *)&self->_trendingArticleListID, 0);
  objc_storeStrong((id *)&self->_configArticleIDs, 0);
  objc_storeStrong((id *)&self->_configIssueIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedPolicy, 0);
}

@end