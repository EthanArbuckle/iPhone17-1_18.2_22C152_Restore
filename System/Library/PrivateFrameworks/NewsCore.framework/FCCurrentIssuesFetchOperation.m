@interface FCCurrentIssuesFetchOperation
- (BOOL)validateOperation;
- (FCCachePolicy)cachePolicy;
- (FCContentContext)context;
- (FCCurrentIssuesFetchOperation)init;
- (FCCurrentIssuesFetchOperation)initWithContext:(id)a3;
- (NSArray)resultIssues;
- (id)fetchCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachePolicy:(id)a3;
- (void)setContext:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setResultIssues:(id)a3;
@end

@implementation FCCurrentIssuesFetchOperation

- (FCCurrentIssuesFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCurrentIssuesFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCCurrentIssuesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 45;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCurrentIssuesFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCCurrentIssuesFetchOperation)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCurrentIssuesFetchOperation;
  id v6 = [(FCOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (BOOL)validateOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(FCCurrentIssuesFetchOperation *)self context];

  if (!v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"current issues fetch operation requires a context"];
    int v5 = 136315906;
    id v6 = "-[FCCurrentIssuesFetchOperation validateOperation]";
    __int16 v7 = 2080;
    v8 = "FCCurrentIssuesFetchOperation.m";
    __int16 v9 = 1024;
    int v10 = 64;
    __int16 v11 = 2114;
    int v12 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
  }
  return v2 != 0;
}

- (void)performOperation
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v3 = [(FCCurrentIssuesFetchOperation *)self context];
  uint64_t v4 = [v3 configurationManager];
  int v5 = [v4 configuration];
  id v6 = [v5 paidBundleConfig];
  __int16 v7 = [v6 recommendableIssuesTagList];

  if (v7)
  {
    id v8 = v7;
    __int16 v9 = objc_alloc_init(FCRecordChainFetchOperation);
    int v10 = [(FCCurrentIssuesFetchOperation *)self context];
    [(FCRecordChainFetchOperation *)v9 setContext:v10];

    __int16 v11 = +[FCEdgeCacheHint edgeCacheHintForCurrentIssues];
    [(FCRecordChainFetchOperation *)v9 setEdgeCacheHint:v11];

    v28[0] = v8;
    int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [(FCRecordChainFetchOperation *)v9 setTopLevelRecordIDs:v12];

    v26[0] = @"TagList";
    v25 = @"tagIDs";
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    v27[0] = v13;
    v26[1] = @"Tag";
    v24 = @"latestIssueIDs";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v26[2] = @"Issue";
    v27[1] = v14;
    v27[2] = MEMORY[0x1E4F1CBF0];
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    [(FCRecordChainFetchOperation *)v9 setLinkKeysByRecordType:v15];

    v16 = [(FCCurrentIssuesFetchOperation *)self cachePolicy];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = +[FCCachePolicy cachePolicyWithSoftMaxAge:300.0];
    }
    v19 = v18;

    v22 = @"TagList";
    v23 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [(FCRecordChainFetchOperation *)v9 setCachePoliciesByRecordType:v20];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_2;
    v21[3] = &unk_1E5B4E3F0;
    v21[4] = self;
    [(FCRecordChainFetchOperation *)v9 setRecordChainCompletionHandler:v21];
    [(FCOperation *)self associateChildOperation:v9];
    [(FCOperation *)v9 start];
  }
  else
  {
    v21[5] = MEMORY[0x1E4F143A8];
    v21[6] = 3221225472;
    v21[7] = __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke;
    v21[8] = &unk_1E5B4C018;
    v21[9] = self;
    [(FCCurrentIssuesFetchOperation *)self setResultIssues:MEMORY[0x1E4F1CBF0]];
    [(FCOperation *)self finishedPerformingOperationWithError:0];
  }
}

uint64_t __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setResultIssues:MEMORY[0x1E4F1CBF0]];
  v2 = *(void **)(a1 + 32);
  return [v2 finishedPerformingOperationWithError:0];
}

void __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = v6;
  if (v6)
  {
    v20[5] = MEMORY[0x1E4F143A8];
    v20[6] = 3221225472;
    v20[7] = __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_3;
    v20[8] = &unk_1E5B4BE70;
    id v21 = *(id *)(a1 + 32);
    id v22 = v6;
    [v21 finishedPerformingOperationWithError:v22];
  }
  else
  {
    id v8 = [v5 objectForKeyedSubscript:&unk_1EF8D7CC8];
    __int16 v9 = [v5 objectForKeyedSubscript:&unk_1EF8D7CE0];
    int v10 = [*(id *)(a1 + 32) context];
    __int16 v11 = [v10 tagController];
    int v12 = [v11 channelsForTagRecords:v8];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_18;
    v20[3] = &unk_1E5B54E10;
    v20[4] = *(void *)(a1 + 32);
    uint64_t v13 = [v9 heldRecordsPassingTest:v20];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_2_20;
    v17[3] = &unk_1E5B50240;
    uint64_t v14 = *(void *)(a1 + 32);
    id v18 = v12;
    uint64_t v19 = v14;
    id v15 = v12;
    v16 = [v13 transformRecordsWithBlock:v17];
    [*(id *)(a1 + 32) setResultIssues:v16];

    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  }
}

uint64_t __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

uint64_t __49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_18(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 context];
  id v5 = [v4 contentStoreFrontID];
  uint64_t v6 = [v3 isAllowedInStorefront:v5];

  return v6;
}

FCIssue *__49__FCCurrentIssuesFetchOperation_performOperation__block_invoke_2_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = *(void **)(a1 + 32);
  id v8 = [v5 channelTagID];
  __int16 v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
    __int16 v11 = [FCIssue alloc];
    int v12 = [*(id *)(a1 + 40) context];
    uint64_t v13 = [v12 assetManager];
    uint64_t v14 = [(FCIssue *)v11 initWithIssueRecord:v5 assetManager:v13 interestToken:v6 sourceChannel:v10];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(FCCurrentIssuesFetchOperation *)self fetchCompletionHandler];

  if (v4)
  {
    id v5 = [(FCCurrentIssuesFetchOperation *)self fetchCompletionHandler];
    id v6 = [(FCCurrentIssuesFetchOperation *)self resultIssues];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
}

- (FCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(id)a3
{
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)resultIssues
{
  return self->_resultIssues;
}

- (void)setResultIssues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultIssues, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end