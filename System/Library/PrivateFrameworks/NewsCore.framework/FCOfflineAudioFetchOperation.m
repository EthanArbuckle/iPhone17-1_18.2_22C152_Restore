@interface FCOfflineAudioFetchOperation
- (BOOL)cachedOnly;
- (BOOL)validateOperation;
- (FCOfflineAudioFetchOperation)initWithContext:(id)a3 articleID:(id)a4;
- (OS_dispatch_queue)archiveQueue;
- (OS_dispatch_queue)fetchCompletionQueue;
- (OS_dispatch_queue)progressQueue;
- (id)archiveHandler;
- (id)fetchCompletionHandler;
- (id)progressHandler;
- (void)_handleArchive:(void *)a1;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setArchiveHandler:(id)a3;
- (void)setArchiveQueue:(id)a3;
- (void)setCachedOnly:(BOOL)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setFetchCompletionQueue:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setProgressQueue:(id)a3;
@end

@implementation FCOfflineAudioFetchOperation

- (FCOfflineAudioFetchOperation)initWithContext:(id)a3 articleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCOfflineAudioFetchOperation;
  v9 = [(FCOperation *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    uint64_t v11 = [v8 copy];
    articleID = v10->_articleID;
    v10->_articleID = (NSString *)v11;

    v13 = objc_alloc_init(FCThreadSafeMutableArray);
    resultInterestTokens = v10->_resultInterestTokens;
    v10->_resultInterestTokens = v13;
  }
  return v10;
}

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self && self->_context)
  {
    char v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)[[NSString alloc] initWithFormat:@"offline article fetch operation requires a context"];
      int v8 = 136315906;
      v9 = "-[FCOfflineAudioFetchOperation validateOperation]";
      __int16 v10 = 2080;
      uint64_t v11 = "FCOfflineAudioFetchOperation.m";
      __int16 v12 = 1024;
      int v13 = 65;
      __int16 v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
    }
    char v3 = 0;
    if (!self) {
      goto LABEL_9;
    }
  }
  if (self->_articleID)
  {
    char v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"offline article fetch operation requires an article ID"];
    int v8 = 136315906;
    v9 = "-[FCOfflineAudioFetchOperation validateOperation]";
    __int16 v10 = 2080;
    uint64_t v11 = "FCOfflineAudioFetchOperation.m";
    __int16 v12 = 1024;
    int v13 = 69;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  char v4 = 0;
  return v4 & v3;
}

- (void)performOperation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(FCOperation *)self shortOperationDescription];
    BOOL v5 = [(FCOfflineAudioFetchOperation *)self cachedOnly];
    v6 = @"fetch";
    if (v5) {
      v6 = @"lookup cached";
    }
    if (self) {
      articleID = self->_articleID;
    }
    else {
      articleID = 0;
    }
    *(_DWORD *)buf = 138543874;
    v20 = v4;
    __int16 v21 = 2114;
    v22 = v6;
    __int16 v23 = 2114;
    v24 = articleID;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will %{public}@ article id=%{public}@", buf, 0x20u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__FCOfflineAudioFetchOperation_performOperation__block_invoke;
  v18[3] = &unk_1E5B4E758;
  v18[4] = self;
  int v8 = [MEMORY[0x1E4F81BF0] firstly:v18];
  v9 = zalgo();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_2;
  v17[3] = &unk_1E5B5C648;
  v17[4] = self;
  __int16 v10 = [v8 thenOn:v9 then:v17];
  uint64_t v11 = zalgo();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_3;
  v16[3] = &unk_1E5B55240;
  v16[4] = self;
  __int16 v12 = [v10 thenOn:v11 then:v16];
  int v13 = zalgo();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_4;
  v15[3] = &unk_1E5B4FD28;
  v15[4] = self;
  id v14 = (id)[v12 errorOn:v13 error:v15];
}

id __48__FCOfflineAudioFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke;
    v5[3] = &unk_1E5B4EEF0;
    v5[4] = v1;
    char v3 = (void *)[v2 initWithResolver:v5];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

id __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    char v3 = [a2 narrativeTrack];
    char v4 = v3;
    if (v3)
    {
      id v5 = v3;
      id v6 = objc_alloc(MEMORY[0x1E4F81BF0]);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_2;
      v10[3] = &unk_1E5B50378;
      v10[4] = v2;
      id v11 = v5;
      id v7 = v5;
      int v8 = (void *)[v6 initWithResolver:v10];
    }
    else
    {
      int v8 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:0];
    }
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

uint64_t __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  return 0;
}

uint64_t __48__FCOfflineAudioFetchOperation_performOperation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(FCOfflineAudioFetchOperation *)self fetchCompletionQueue];

  id v6 = [(FCOfflineAudioFetchOperation *)self fetchCompletionHandler];

  if (v5)
  {
    if (v6)
    {
      id v7 = [(FCOfflineAudioFetchOperation *)self fetchCompletionQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__FCOfflineAudioFetchOperation_operationWillFinishWithError___block_invoke;
      v12[3] = &unk_1E5B4BE70;
      v12[4] = self;
      id v13 = v4;
      dispatch_async(v7, v12);
    }
  }
  else if (v6)
  {
    int v8 = [(FCOfflineAudioFetchOperation *)self fetchCompletionHandler];
    if (self) {
      resultInterestTokens = self->_resultInterestTokens;
    }
    else {
      resultInterestTokens = 0;
    }
    __int16 v10 = resultInterestTokens;
    id v11 = [(FCThreadSafeMutableArray *)v10 readOnlyArray];
    ((void (**)(void, void *, id))v8)[2](v8, v11, v4);
  }
}

void __61__FCOfflineAudioFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) fetchCompletionHandler];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[55];
  }
  char v3 = v2;
  id v4 = [v3 readOnlyArray];
  v5[2](v5, v4, *(void *)(a1 + 40));
}

void __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [FCArticleHeadlinesFetchOperation alloc];
  int v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9 = (void *)v8[53];
    int v8 = (void *)v8[54];
  }
  else
  {
    v9 = 0;
  }
  v26[0] = v8;
  __int16 v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = v8;
  id v12 = v9;
  id v13 = [v10 arrayWithObjects:v26 count:1];
  id v14 = [(FCArticleHeadlinesFetchOperation *)v7 initWithContext:v12 articleIDs:v13 ignoreCacheForArticleIDs:0];

  [(FCFetchOperation *)v14 setShouldFailOnMissingObjects:1];
  if ([*(id *)(a1 + 32) cachedOnly]) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [(FCFetchOperation *)v14 setCachePolicy:v15];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_2;
  v25[3] = &unk_1E5B552B8;
  v25[4] = *(void *)(a1 + 32);
  [(FCArticleHeadlinesFetchOperation *)v14 setInterestTokenHandler:v25];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_3;
  __int16 v21 = &unk_1E5B50778;
  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = v6;
  id v24 = v5;
  id v16 = v5;
  id v17 = v6;
  [(FCFetchOperation *)v14 setFetchCompletionBlock:&v18];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v14, v18, v19, v20, v21, v22);
  [(FCOperation *)v14 start];
}

uint64_t __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      return [*(id *)(v2 + 440) addObject:a2];
    }
  }
  return result;
}

void __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_4;
    v15[3] = &unk_1E5B4EFB8;
    id v16 = v3;
    id v4 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = v4;
    __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_4((uint64_t)v15);
  }
  else
  {
    id v5 = [v3 fetchedObject];
    id v6 = [v5 firstObject];
    id v7 = v6;
    if (v6)
    {
      if ([v6 conformsToProtocol:&unk_1EF8E9808]) {
        int v8 = v7;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    id v9 = v8;

    __int16 v10 = *(void **)(a1 + 32);
    id v11 = [v9 contentArchive];
    -[FCOfflineAudioFetchOperation _handleArchive:](v10, v11);

    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [v3 fetchedObject];
    id v14 = [v13 firstObject];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);
  }
}

void __48__FCOfflineAudioFetchOperation__promiseHeadline__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) status];
  if (v2 == 2)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = (void *)MEMORY[0x1E4F28C58];
    id v9 = [*(id *)(a1 + 32) missingObjectDescriptions];
    id v5 = objc_msgSend(v7, "fc_notCachedErrorWithMissingObjects:");
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 40) errorUserInfo];
    id v5 = objc_msgSend(v3, "fc_operationCancelledErrorWithAdditionalUserInfo:");
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t))(v8 + 16))(v8);
LABEL_7:
}

- (void)_handleArchive:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && v3)
  {
    id v5 = [a1 archiveQueue];

    uint64_t v6 = [a1 archiveHandler];

    if (v5)
    {
      if (v6)
      {
        id v7 = [a1 archiveQueue];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __47__FCOfflineAudioFetchOperation__handleArchive___block_invoke_2;
        v9[3] = &unk_1E5B4BE70;
        v9[4] = a1;
        id v10 = v4;
        dispatch_async(v7, v9);
      }
    }
    else if (v6)
    {
      uint64_t v8 = [a1 archiveHandler];
      ((void (**)(void, void *))v8)[2](v8, v4);
    }
  }
}

void __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [FCAudioTrackFetchOperation alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 424);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = [(FCAudioTrackFetchOperation *)v7 initWithContext:v9 audioTrack:*(void *)(a1 + 40)];
  -[FCAudioTrackFetchOperation setCachedOnly:](v10, "setCachedOnly:", [*(id *)(a1 + 32) cachedOnly]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_3;
  v20[3] = &unk_1E5B552B8;
  v20[4] = *(void *)(a1 + 32);
  [(FCAudioTrackFetchOperation *)v10 setInterestTokenHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_4;
  v19[3] = &unk_1E5B552E0;
  v19[4] = *(void *)(a1 + 32);
  [(FCAudioTrackFetchOperation *)v10 setArchiveHandler:v19];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_5;
  id v16 = &unk_1E5B544B8;
  id v17 = v6;
  id v18 = v5;
  id v11 = v5;
  id v12 = v6;
  [(FCAudioTrackFetchOperation *)v10 setFetchCompletionHandler:&v13];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v10, v13, v14, v15, v16);
  [(FCOperation *)v10 start];
}

uint64_t __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      return [*(id *)(v2 + 440) addObject:a2];
    }
  }
  return result;
}

void __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_4(uint64_t a1, void *a2)
{
}

void __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v7 = (void (**)(id, id))*(id *)(a1 + 32);
    id v6 = v3;
    v7[2](v7, v6);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = objc_opt_new();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t __66__FCOfflineAudioFetchOperation__promiseNarrativeTrackForHeadline___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __47__FCOfflineAudioFetchOperation__handleArchive___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) archiveHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (id)archiveHandler
{
  return self->archiveHandler;
}

- (void)setArchiveHandler:(id)a3
{
}

- (OS_dispatch_queue)archiveQueue
{
  return self->archiveQueue;
}

- (void)setArchiveQueue:(id)a3
{
}

- (BOOL)cachedOnly
{
  return self->cachedOnly;
}

- (void)setCachedOnly:(BOOL)a3
{
  self->cachedOnly = a3;
}

- (id)fetchCompletionHandler
{
  return self->fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)fetchCompletionQueue
{
  return self->fetchCompletionQueue;
}

- (void)setFetchCompletionQueue:(id)a3
{
}

- (id)progressHandler
{
  return self->progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (OS_dispatch_queue)progressQueue
{
  return self->progressQueue;
}

- (void)setProgressQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultInterestTokens, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->progressQueue, 0);
  objc_storeStrong(&self->progressHandler, 0);
  objc_storeStrong((id *)&self->fetchCompletionQueue, 0);
  objc_storeStrong(&self->fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->archiveQueue, 0);
  objc_storeStrong(&self->archiveHandler, 0);
}

@end