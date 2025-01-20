@interface FCIssuesFetchOperation
- (BOOL)validateOperation;
- (FCCachePolicy)cachePolicy;
- (FCContentContext)context;
- (FCIssuesFetchOperation)init;
- (FCIssuesFetchOperation)initWithContext:(id)a3 issueIDs:(id)a4;
- (NSArray)issueIDs;
- (NSArray)resultIssues;
- (id)fetchCompletionHandler;
- (id)interestTokenHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachePolicy:(id)a3;
- (void)setContext:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setInterestTokenHandler:(id)a3;
- (void)setIssueIDs:(id)a3;
- (void)setResultIssues:(id)a3;
@end

@implementation FCIssuesFetchOperation

- (FCIssuesFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssuesFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCIssuesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 39;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCIssuesFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCIssuesFetchOperation)initWithContext:(id)a3 issueIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCIssuesFetchOperation;
  __int16 v9 = [(FCOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    uint64_t v11 = [v8 copy];
    issueIDs = v10->_issueIDs;
    v10->_issueIDs = (NSArray *)v11;
  }
  return v10;
}

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(FCIssuesFetchOperation *)self context];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"issues fetch operation requires a context"];
    int v9 = 136315906;
    v10 = "-[FCIssuesFetchOperation validateOperation]";
    __int16 v11 = 2080;
    int v12 = "FCIssuesFetchOperation.m";
    __int16 v13 = 1024;
    int v14 = 60;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  uint64_t v4 = [(FCIssuesFetchOperation *)self issueIDs];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = (void *)[[NSString alloc] initWithFormat:@"issues fetch operation requires issue IDs"];
    int v9 = 136315906;
    v10 = "-[FCIssuesFetchOperation validateOperation]";
    __int16 v11 = 2080;
    int v12 = "FCIssuesFetchOperation.m";
    __int16 v13 = 1024;
    int v14 = 64;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)performOperation
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(FCRecordChainFetchOperation);
  uint64_t v4 = [(FCIssuesFetchOperation *)self context];
  [(FCRecordChainFetchOperation *)v3 setContext:v4];

  BOOL v5 = [(FCIssuesFetchOperation *)self issueIDs];
  [(FCRecordChainFetchOperation *)v3 setTopLevelRecordIDs:v5];

  v15[0] = @"Issue";
  int v14 = @"channelTagID";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v15[1] = @"Tag";
  v16[0] = v6;
  v16[1] = MEMORY[0x1E4F1CBF0];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [(FCRecordChainFetchOperation *)v3 setLinkKeysByRecordType:v7];

  id v8 = [(FCIssuesFetchOperation *)self cachePolicy];

  if (v8)
  {
    int v12 = @"Issue";
    int v9 = [(FCIssuesFetchOperation *)self cachePolicy];
    __int16 v13 = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [(FCRecordChainFetchOperation *)v3 setCachePoliciesByRecordType:v10];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke;
  v11[3] = &unk_1E5B4E3F0;
  v11[4] = self;
  [(FCRecordChainFetchOperation *)v3 setRecordChainCompletionHandler:v11];
  [(FCOperation *)self associateChildOperation:v3];
  [(FCOperation *)v3 start];
}

void __42__FCIssuesFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __42__FCIssuesFetchOperation_performOperation__block_invoke_2;
    v31 = &unk_1E5B4BE70;
    id v32 = *(id *)(a1 + 32);
    id v33 = v6;
    [v32 finishedPerformingOperationWithError:v33];
  }
  else
  {
    id v8 = [v5 objectForKeyedSubscript:&unk_1EF8D8778];
    if ([v8 count])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_2_18;
      v26[3] = &unk_1E5B54E10;
      v26[4] = *(void *)(a1 + 32);
      int v9 = [v8 heldRecordsPassingTest:v26];
      if ([v9 count])
      {
        v10 = [v5 objectForKeyedSubscript:&unk_1EF8D8790];
        __int16 v11 = [*(id *)(a1 + 32) context];
        int v12 = [v11 tagController];
        __int16 v13 = [v12 channelsForTagRecords:v10];

        int v14 = [*(id *)(a1 + 32) issueIDs];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_23;
        v21[3] = &unk_1E5B50240;
        id v15 = v13;
        uint64_t v16 = *(void *)(a1 + 32);
        id v22 = v15;
        uint64_t v23 = v16;
        uint64_t v17 = [v9 transformRecordsInOrder:v14 withBlock:v21];
        [*(id *)(a1 + 32) setResultIssues:v17];

        v18 = [*(id *)(a1 + 32) interestTokenHandler];

        if (v18)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_3_28;
          aBlock[3] = &unk_1E5B55290;
          aBlock[4] = *(void *)(a1 + 32);
          v19 = (void (**)(void *, void *))_Block_copy(aBlock);
          v19[2](v19, v8);
          v19[2](v19, v10);
        }
        [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
      }
      else
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_3;
        v24[3] = &unk_1E5B4BE70;
        v24[4] = *(void *)(a1 + 32);
        id v25 = v8;
        __42__FCIssuesFetchOperation_performOperation__block_invoke_3((uint64_t)v24);
      }
    }
    else
    {
      v26[5] = MEMORY[0x1E4F143A8];
      v26[6] = 3221225472;
      v26[7] = __42__FCIssuesFetchOperation_performOperation__block_invoke_17;
      v26[8] = &unk_1E5B4C018;
      id v27 = *(id *)(a1 + 32);
      [v27 setResultIssues:MEMORY[0x1E4F1CBF0]];
      [v27 finishedPerformingOperationWithError:0];
    }
  }
}

uint64_t __42__FCIssuesFetchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

uint64_t __42__FCIssuesFetchOperation_performOperation__block_invoke_17(uint64_t a1)
{
  [*(id *)(a1 + 32) setResultIssues:MEMORY[0x1E4F1CBF0]];
  v2 = *(void **)(a1 + 32);
  return [v2 finishedPerformingOperationWithError:0];
}

uint64_t __42__FCIssuesFetchOperation_performOperation__block_invoke_2_18(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 context];
  id v5 = [v4 contentStoreFrontID];
  uint64_t v6 = [v3 isAllowedInStorefront:v5];

  return v6;
}

void __42__FCIssuesFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F28C58];
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) allRecordIDs];
  id v3 = objc_msgSend(v1, "fc_blockedInCurrentStorefrontErrorWithIdentifiers:", v4);
  [v2 finishedPerformingOperationWithError:v3];
}

FCIssue *__42__FCIssuesFetchOperation_performOperation__block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 channelTagID];
  int v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
    __int16 v11 = [FCIssue alloc];
    int v12 = [*(id *)(a1 + 40) context];
    __int16 v13 = [v12 assetManager];
    int v14 = [(FCIssue *)v11 initWithIssueRecord:v5 assetManager:v13 interestToken:v6 sourceChannel:v10];
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

void __42__FCIssuesFetchOperation_performOperation__block_invoke_3_28(uint64_t a1, void *a2)
{
  id v3 = [a2 interestTokensByID];
  id v4 = [v3 allValues];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__FCIssuesFetchOperation_performOperation__block_invoke_4;
  v5[3] = &unk_1E5B55268;
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __42__FCIssuesFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 interestTokenHandler];
  v4[2](v4, v3);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(FCIssuesFetchOperation *)self fetchCompletionHandler];

  if (v4)
  {
    id v5 = [(FCIssuesFetchOperation *)self fetchCompletionHandler];
    id v6 = [(FCIssuesFetchOperation *)self resultIssues];
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

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (void)setInterestTokenHandler:(id)a3
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

- (NSArray)issueIDs
{
  return self->_issueIDs;
}

- (void)setIssueIDs:(id)a3
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
  objc_storeStrong((id *)&self->_issueIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end