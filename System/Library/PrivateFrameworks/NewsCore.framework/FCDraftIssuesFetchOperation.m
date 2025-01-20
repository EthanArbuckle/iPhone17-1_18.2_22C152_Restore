@interface FCDraftIssuesFetchOperation
- (BOOL)validateOperation;
- (FCContentContext)context;
- (FCDraftIssuesFetchOperation)init;
- (FCDraftIssuesFetchOperation)initWithContext:(id)a3 issueListID:(id)a4;
- (NSArray)resultIssues;
- (NSString)issueListID;
- (id)fetchCompletionHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setContext:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setIssueListID:(id)a3;
- (void)setResultIssues:(id)a3;
@end

@implementation FCDraftIssuesFetchOperation

- (FCDraftIssuesFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCDraftIssuesFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCDraftIssuesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 38;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCDraftIssuesFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCDraftIssuesFetchOperation)initWithContext:(id)a3 issueListID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCDraftIssuesFetchOperation;
  __int16 v9 = [(FCOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_issueListID, a4);
  }

  return v10;
}

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(FCDraftIssuesFetchOperation *)self context];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"issues fetch operation requires a context"];
    int v9 = 136315906;
    v10 = "-[FCDraftIssuesFetchOperation validateOperation]";
    __int16 v11 = 2080;
    objc_super v12 = "FCDraftIssuesFetchOperation.m";
    __int16 v13 = 1024;
    int v14 = 59;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  uint64_t v4 = [(FCDraftIssuesFetchOperation *)self issueListID];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = (void *)[[NSString alloc] initWithFormat:@"fetch operation requires issue list ID"];
    int v9 = 136315906;
    v10 = "-[FCDraftIssuesFetchOperation validateOperation]";
    __int16 v11 = 2080;
    objc_super v12 = "FCDraftIssuesFetchOperation.m";
    __int16 v13 = 1024;
    int v14 = 63;
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
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(FCDraftIssuesFetchOperation *)self context];
  uint64_t v4 = [v3 internalContentContext];
  BOOL v5 = [v4 issueListRecordSource];

  id v6 = [(FCDraftIssuesFetchOperation *)self issueListID];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = [v5 fetchOperationForRecordsWithIDs:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__FCDraftIssuesFetchOperation_performOperation__block_invoke;
  v9[3] = &unk_1E5B53EC0;
  v9[4] = self;
  [v8 setFetchCompletionBlock:v9];
  [(FCOperation *)self associateChildOperation:v8];
  [v8 start];
}

void __47__FCDraftIssuesFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fetchedObject];
  BOOL v5 = [v4 onlyRecord];
  id v6 = [v5 issueIDs];

  if (v6)
  {
    id v7 = [FCIssuesFetchOperation alloc];
    id v8 = [*(id *)(a1 + 32) context];
    int v9 = [(FCIssuesFetchOperation *)v7 initWithContext:v8 issueIDs:v6];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__FCDraftIssuesFetchOperation_performOperation__block_invoke_3;
    v11[3] = &unk_1E5B4C8F8;
    v11[4] = *(void *)(a1 + 32);
    [(FCIssuesFetchOperation *)v9 setFetchCompletionHandler:v11];
    [*(id *)(a1 + 32) associateChildOperation:v9];
    [(FCOperation *)v9 start];
  }
  else
  {
    v11[5] = MEMORY[0x1E4F143A8];
    v11[6] = 3221225472;
    v11[7] = __47__FCDraftIssuesFetchOperation_performOperation__block_invoke_2;
    v11[8] = &unk_1E5B4BE70;
    id v12 = *(id *)(a1 + 32);
    id v13 = v3;
    v10 = [v13 error];
    [v12 finishedPerformingOperationWithError:v10];
  }
}

void __47__FCDraftIssuesFetchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) error];
  [v1 finishedPerformingOperationWithError:v2];
}

void __47__FCDraftIssuesFetchOperation_performOperation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    id v8 = *(void **)(a1 + 32);
    id v9 = v5;
    objc_msgSend(v8, "finishedPerformingOperationWithError:", v9, v7, 3221225472, __47__FCDraftIssuesFetchOperation_performOperation__block_invoke_4, &unk_1E5B4BE70, v8);
  }
  else
  {
    [*(id *)(a1 + 32) setResultIssues:a2];
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  }
}

uint64_t __47__FCDraftIssuesFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(FCDraftIssuesFetchOperation *)self fetchCompletionHandler];

  if (v4)
  {
    id v5 = [(FCDraftIssuesFetchOperation *)self fetchCompletionHandler];
    id v6 = [(FCDraftIssuesFetchOperation *)self resultIssues];
    ((void (**)(void, void *, id))v5)[2](v5, v6, v7);
  }
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

- (NSString)issueListID
{
  return self->_issueListID;
}

- (void)setIssueListID:(id)a3
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
  objc_storeStrong((id *)&self->_issueListID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
}

@end