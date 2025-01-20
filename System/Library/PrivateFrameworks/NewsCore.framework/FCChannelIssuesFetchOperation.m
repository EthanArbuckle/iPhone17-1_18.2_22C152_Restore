@interface FCChannelIssuesFetchOperation
- (BOOL)validateOperation;
- (FCCachePolicy)cachePolicy;
- (FCChannelIssuesFetchOperation)init;
- (FCChannelIssuesFetchOperation)initWithContext:(id)a3 channelIDs:(id)a4 issueSet:(int64_t)a5;
- (FCContentContext)context;
- (NSArray)channelIDs;
- (NSDictionary)resultIssuesByChannel;
- (id)fetchCompletionHandler;
- (int64_t)issueSet;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setCachePolicy:(id)a3;
- (void)setChannelIDs:(id)a3;
- (void)setContext:(id)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setIssueSet:(int64_t)a3;
- (void)setResultIssuesByChannel:(id)a3;
@end

@implementation FCChannelIssuesFetchOperation

- (FCChannelIssuesFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCChannelIssuesFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCChannelIssuesFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 38;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCChannelIssuesFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCChannelIssuesFetchOperation)initWithContext:(id)a3 channelIDs:(id)a4 issueSet:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCChannelIssuesFetchOperation;
  __int16 v11 = [(FCOperation *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    uint64_t v13 = [v10 copy];
    channelIDs = v12->_channelIDs;
    v12->_channelIDs = (NSArray *)v13;

    v12->_issueSet = a5;
  }

  return v12;
}

- (BOOL)validateOperation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(FCChannelIssuesFetchOperation *)self context];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"channel issues fetch operation requires a context"];
    int v9 = 136315906;
    id v10 = "-[FCChannelIssuesFetchOperation validateOperation]";
    __int16 v11 = 2080;
    int v12 = "FCChannelIssuesFetchOperation.m";
    __int16 v13 = 1024;
    int v14 = 61;
    __int16 v15 = 2114;
    objc_super v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);
  }
  uint64_t v4 = [(FCChannelIssuesFetchOperation *)self channelIDs];

  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"channel issues fetch operation requires channel IDs"];
    int v9 = 136315906;
    id v10 = "-[FCChannelIssuesFetchOperation validateOperation]";
    __int16 v11 = 2080;
    int v12 = "FCChannelIssuesFetchOperation.m";
    __int16 v13 = 1024;
    int v14 = 65;
    __int16 v15 = 2114;
    objc_super v16 = v8;
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
  v20[3] = *MEMORY[0x1E4F143B8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke;
  v15[3] = &unk_1E5B505B0;
  v15[4] = self;
  v3 = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke((uint64_t)v15);
  uint64_t v4 = objc_alloc_init(FCRecordChainFetchOperation);
  BOOL v5 = [(FCChannelIssuesFetchOperation *)self context];
  [(FCRecordChainFetchOperation *)v4 setContext:v5];

  id v6 = [(FCChannelIssuesFetchOperation *)self channelIDs];
  [(FCRecordChainFetchOperation *)v4 setTopLevelRecordIDs:v6];

  v20[0] = v3;
  v19[0] = @"Tag";
  v19[1] = @"IssueList";
  v18 = @"issueIDs";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v19[2] = @"Issue";
  v20[1] = v7;
  v20[2] = MEMORY[0x1E4F1CBF0];
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  [(FCRecordChainFetchOperation *)v4 setLinkKeysByRecordType:v8];

  int v9 = [(FCChannelIssuesFetchOperation *)self cachePolicy];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[FCCachePolicy cachePolicyWithSoftMaxAge:300.0];
  }
  int v12 = v11;

  v16[0] = @"Tag";
  v16[1] = @"IssueList";
  v17[0] = v12;
  v17[1] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [(FCRecordChainFetchOperation *)v4 setCachePoliciesByRecordType:v13];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_2;
  v14[3] = &unk_1E5B4E3F0;
  v14[4] = self;
  [(FCRecordChainFetchOperation *)v4 setRecordChainCompletionHandler:v14];
  [(FCOperation *)self associateChildOperation:v4];
  [(FCOperation *)v4 start];
}

id __49__FCChannelIssuesFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)[*(id *)(a1 + 32) issueSet];
  if (v1 == (void *)1)
  {
    id v6 = @"latestIssueIDs";
    v7 = @"archiveIssueListID";
    v2 = (void *)MEMORY[0x1E4F1C978];
    v3 = &v6;
    uint64_t v4 = 2;
  }
  else
  {
    if (v1) {
      goto LABEL_6;
    }
    v8[0] = @"latestIssueIDs";
    v2 = (void *)MEMORY[0x1E4F1C978];
    v3 = (__CFString **)v8;
    uint64_t v4 = 1;
  }
  v1 = objc_msgSend(v2, "arrayWithObjects:count:", v3, v4, v6, v7, v8[0]);
LABEL_6:
  return v1;
}

void __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v29[5] = MEMORY[0x1E4F143A8];
    v29[6] = 3221225472;
    v29[7] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_3;
    v29[8] = &unk_1E5B4BE70;
    id v30 = *(id *)(a1 + 32);
    id v31 = v6;
    [v30 finishedPerformingOperationWithError:v31];
    v8 = v31;
  }
  else
  {
    uint64_t v22 = [v5 objectForKeyedSubscript:&unk_1EF8D80B8];
    int v9 = [v5 objectForKeyedSubscript:&unk_1EF8D80D0];
    id v10 = [v5 objectForKeyedSubscript:&unk_1EF8D80E8];
    id v11 = [*(id *)(a1 + 32) context];
    int v12 = [v11 tagController];
    __int16 v13 = [v12 channelsForTagRecords:v22];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_23;
    v29[3] = &unk_1E5B54E10;
    v29[4] = *(void *)(a1 + 32);
    int v14 = [v9 heldRecordsPassingTest:v29];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_2_25;
    v26[3] = &unk_1E5B50240;
    uint64_t v15 = *(void *)(a1 + 32);
    id v27 = v13;
    uint64_t v28 = v15;
    id v16 = v13;
    uint64_t v17 = [v14 transformRecordsByIDWithBlock:v26];
    v18 = [v16 allValues];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_4;
    v23[3] = &unk_1E5B587B8;
    v23[4] = *(void *)(a1 + 32);
    id v24 = v10;
    id v25 = v17;
    id v19 = v17;
    id v20 = v10;
    v21 = objc_msgSend(v18, "fc_dictionaryWithValueBlock:", v23);
    [*(id *)(a1 + 32) setResultIssuesByChannel:v21];

    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
    v8 = (void *)v22;
  }
}

uint64_t __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

uint64_t __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_23(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 context];
  id v5 = [v4 contentStoreFrontID];
  uint64_t v6 = [v3 isAllowedInStorefront:v5];

  return v6;
}

FCIssue *__49__FCChannelIssuesFetchOperation_performOperation__block_invoke_2_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = [v5 channelTagID];
  int v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
    id v11 = [FCIssue alloc];
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

id __49__FCChannelIssuesFetchOperation_performOperation__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v5 = [*(id *)(a1 + 32) issueSet];
  if (v5 == 1)
  {
    v7 = [v3 currentIssueIDs];
    [v4 addObjectsFromArray:v7];

    v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v3 backIssuesListID];
    id v6 = (void *)v9;
    if (v9) {
      id v10 = (__CFString *)v9;
    }
    else {
      id v10 = &stru_1EF8299B8;
    }
    id v11 = [v8 recordWithID:v10];
    int v12 = [v11 issueIDs];
    [v4 addObjectsFromArray:v12];
  }
  else
  {
    if (v5) {
      goto LABEL_9;
    }
    id v6 = [v3 currentIssueIDs];
    [v4 addObjectsFromArray:v6];
  }

LABEL_9:
  __int16 v13 = *(void **)(a1 + 48);
  int v14 = [v4 array];
  uint64_t v15 = objc_msgSend(v13, "nf_objectsForKeysWithoutMarker:", v14);

  return v15;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(FCChannelIssuesFetchOperation *)self fetchCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCChannelIssuesFetchOperation *)self fetchCompletionHandler];
    id v6 = [(FCChannelIssuesFetchOperation *)self resultIssuesByChannel];
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

- (NSArray)channelIDs
{
  return self->_channelIDs;
}

- (void)setChannelIDs:(id)a3
{
}

- (int64_t)issueSet
{
  return self->_issueSet;
}

- (void)setIssueSet:(int64_t)a3
{
  self->_issueSet = a3;
}

- (NSDictionary)resultIssuesByChannel
{
  return self->_resultIssuesByChannel;
}

- (void)setResultIssuesByChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultIssuesByChannel, 0);
  objc_storeStrong((id *)&self->_channelIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end