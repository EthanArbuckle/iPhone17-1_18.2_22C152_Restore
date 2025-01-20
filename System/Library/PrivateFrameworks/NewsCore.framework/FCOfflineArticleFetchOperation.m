@interface FCOfflineArticleFetchOperation
- (BOOL)cachedOnly;
- (BOOL)validateOperation;
- (FCOfflineArticleFetchOperation)initWithContext:(id)a3 ANFHelper:(id)a4 articleID:(id)a5;
- (OS_dispatch_queue)archiveQueue;
- (OS_dispatch_queue)fetchCompletionQueue;
- (OS_dispatch_queue)progressQueue;
- (id)archiveHandler;
- (id)fetchCompletionHandler;
- (id)progressHandler;
- (void)_handleArchive:(void *)a1;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setArchiveHandler:(id)a3;
- (void)setArchiveQueue:(id)a3;
- (void)setCachedOnly:(BOOL)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setFetchCompletionQueue:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setProgressQueue:(id)a3;
@end

@implementation FCOfflineArticleFetchOperation

- (FCOfflineArticleFetchOperation)initWithContext:(id)a3 ANFHelper:(id)a4 articleID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCOfflineArticleFetchOperation;
  v12 = [(FCOperation *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_ANFHelper, a4);
    uint64_t v14 = [v11 copy];
    articleID = v13->_articleID;
    v13->_articleID = (NSString *)v14;

    v16 = objc_alloc_init(FCThreadSafeMutableArray);
    resultInterestTokens = v13->_resultInterestTokens;
    v13->_resultInterestTokens = v16;
  }
  return v13;
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
      v7 = (void *)[[NSString alloc] initWithFormat:@"offline article fetch operation requires a context"];
      int v10 = 136315906;
      id v11 = "-[FCOfflineArticleFetchOperation validateOperation]";
      __int16 v12 = 2080;
      v13 = "FCOfflineArticleFetchOperation.m";
      __int16 v14 = 1024;
      int v15 = 81;
      __int16 v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
    }
    char v3 = 0;
    if (!self)
    {
LABEL_9:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)[[NSString alloc] initWithFormat:@"offline article fetch operation requires a flint helper"];
        int v10 = 136315906;
        id v11 = "-[FCOfflineArticleFetchOperation validateOperation]";
        __int16 v12 = 2080;
        v13 = "FCOfflineArticleFetchOperation.m";
        __int16 v14 = 1024;
        int v15 = 85;
        __int16 v16 = 2114;
        v17 = v8;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
      }
      char v4 = 0;
      if (!self) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
  }
  if (!self->_ANFHelper) {
    goto LABEL_9;
  }
  char v4 = 1;
LABEL_12:
  if (self->_articleID)
  {
    char v5 = 1;
    return v5 & v3 & v4;
  }
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = (void *)[[NSString alloc] initWithFormat:@"offline article fetch operation requires an article ID"];
    int v10 = 136315906;
    id v11 = "-[FCOfflineArticleFetchOperation validateOperation]";
    __int16 v12 = 2080;
    v13 = "FCOfflineArticleFetchOperation.m";
    __int16 v14 = 1024;
    int v15 = 89;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
  }
  char v5 = 0;
  return v5 & v3 & v4;
}

- (void)prepareOperation
{
  v2 = self;
  if (self) {
    self = (FCOfflineArticleFetchOperation *)self->_context;
  }
  id v5 = [(FCOfflineArticleFetchOperation *)self appConfigurationManager];
  char v3 = [v5 possiblyUnfetchedAppConfiguration];
  char v4 = [v3 offlineDownloadsConfig];
  if (v2) {
    objc_storeStrong((id *)&v2->_config, v4);
  }
}

- (void)performOperation
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__67;
  v28[4] = __Block_byref_object_dispose__67;
  id v29 = 0;
  char v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = [(FCOperation *)self shortOperationDescription];
    if ([(FCOfflineArticleFetchOperation *)self cachedOnly]) {
      id v5 = @"lookup cached";
    }
    else {
      id v5 = @"fetch";
    }
    if (self)
    {
      v6 = self->_articleID;
      config = self->_config;
    }
    else
    {
      v6 = 0;
      config = 0;
    }
    v8 = config;
    if ([(FCOfflineDownloadsConfiguration *)v8 useSmallestArticleThumbnails]) {
      id v9 = @"small";
    }
    else {
      id v9 = @"normal";
    }
    if (self) {
      int v10 = self->_config;
    }
    else {
      int v10 = 0;
    }
    id v11 = v10;
    BOOL v12 = [(FCOfflineDownloadsConfiguration *)v11 useSmallestArticleImages];
    *(_DWORD *)buf = 138544386;
    if (v12) {
      v13 = @"small";
    }
    else {
      v13 = @"normal";
    }
    v31 = v4;
    __int16 v32 = 2114;
    v33 = v5;
    __int16 v34 = 2114;
    v35 = v6;
    __int16 v36 = 2114;
    v37 = v9;
    __int16 v38 = 2114;
    v39 = v13;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will %{public}@ article id=%{public}@, thumbnail variant=%{public}@, image variant=%{public}@", buf, 0x34u);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke;
  v27[3] = &unk_1E5B4E758;
  v27[4] = self;
  __int16 v14 = [MEMORY[0x1E4F81BF0] firstly:v27];
  int v15 = zalgo();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_2;
  v26[3] = &unk_1E5B59EB0;
  v26[4] = self;
  v26[5] = v28;
  __int16 v16 = [v14 thenOn:v15 then:v26];
  v17 = zalgo();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_3;
  v25[3] = &unk_1E5B59ED8;
  v25[4] = self;
  v25[5] = v28;
  uint64_t v18 = [v16 thenOn:v17 then:v25];
  objc_super v19 = zalgo();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_4;
  v24[3] = &unk_1E5B55240;
  v24[4] = self;
  v20 = [v18 thenOn:v19 then:v24];
  v21 = zalgo();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_5;
  v23[3] = &unk_1E5B4FD28;
  v23[4] = self;
  id v22 = (id)[v20 errorOn:v21 error:v23];

  _Block_object_dispose(v28, 8);
}

id __50__FCOfflineArticleFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke;
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

id __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7 = v6;
  if (v5)
  {
    if ([v6 contentType] == 2)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_2;
      v14[3] = &unk_1E5B50378;
      v14[4] = v5;
      id v15 = v7;
      id v9 = (void *)[v8 initWithResolver:v14];
    }
    else
    {
      int v10 = (void *)MEMORY[0x1E4F28C58];
      v16[0] = *MEMORY[0x1E4F28568];
      v14[0] = @"Offline downloads are only supported for ANF articles.";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v16 count:1];
      BOOL v12 = [v10 errorWithDomain:@"FCErrorDomain" code:42 userInfo:v11];

      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F81BF0]) initWithError:v12];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) parentIssue];
    char v3 = v2;
    if (v2)
    {
      id v4 = v2;
      id v5 = objc_alloc(MEMORY[0x1E4F81BF0]);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_2;
      v11[3] = &unk_1E5B50378;
      id v12 = v4;
      uint64_t v13 = v1;
      id v6 = v4;
      v7 = (void *)[v5 initWithResolver:v11];
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
      id v9 = objc_opt_new();
      v7 = (void *)[v8 initWithValue:v9];
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  return 0;
}

uint64_t __50__FCOfflineArticleFetchOperation_performOperation__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(FCOfflineArticleFetchOperation *)self fetchCompletionQueue];

  id v6 = [(FCOfflineArticleFetchOperation *)self fetchCompletionHandler];

  if (v5)
  {
    if (v6)
    {
      v7 = [(FCOfflineArticleFetchOperation *)self fetchCompletionQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63__FCOfflineArticleFetchOperation_operationWillFinishWithError___block_invoke;
      v12[3] = &unk_1E5B4BE70;
      v12[4] = self;
      id v13 = v4;
      dispatch_async(v7, v12);
    }
  }
  else if (v6)
  {
    id v8 = [(FCOfflineArticleFetchOperation *)self fetchCompletionHandler];
    if (self) {
      resultInterestTokens = self->_resultInterestTokens;
    }
    else {
      resultInterestTokens = 0;
    }
    int v10 = resultInterestTokens;
    id v11 = [(FCThreadSafeMutableArray *)v10 readOnlyArray];
    ((void (**)(void, void *, id))v8)[2](v8, v11, v4);
  }
}

void __63__FCOfflineArticleFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) fetchCompletionHandler];
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[57];
  }
  char v3 = v2;
  id v4 = [v3 readOnlyArray];
  v5[2](v5, v4, *(void *)(a1 + 40));
}

void __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [FCArticleHeadlinesFetchOperation alloc];
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = (void *)v8[53];
    id v8 = (void *)v8[55];
  }
  else
  {
    id v9 = 0;
  }
  v26[0] = v8;
  int v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = v8;
  id v12 = v9;
  id v13 = [v10 arrayWithObjects:v26 count:1];
  __int16 v14 = [(FCArticleHeadlinesFetchOperation *)v7 initWithContext:v12 articleIDs:v13 ignoreCacheForArticleIDs:0];

  [(FCFetchOperation *)v14 setShouldFailOnMissingObjects:1];
  if ([*(id *)(a1 + 32) cachedOnly]) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [(FCFetchOperation *)v14 setCachePolicy:v15];
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v14, "setCanSendFetchCompletionSynchronously:", [*(id *)(a1 + 32) cachedOnly]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_2;
  v25[3] = &unk_1E5B552B8;
  v25[4] = *(void *)(a1 + 32);
  [(FCArticleHeadlinesFetchOperation *)v14 setInterestTokenHandler:v25];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_3;
  v21 = &unk_1E5B50778;
  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = v6;
  id v24 = v5;
  id v16 = v5;
  id v17 = v6;
  [(FCFetchOperation *)v14 setFetchCompletionBlock:&v18];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v14, v18, v19, v20, v21, v22);
  [(FCOperation *)v14 start];
}

uint64_t __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      return [*(id *)(v2 + 456) addObject:a2];
    }
  }
  return result;
}

void __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_4;
    v15[3] = &unk_1E5B4EFB8;
    id v16 = v3;
    id v4 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = v4;
    __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_4((uint64_t)v15);
  }
  else
  {
    id v5 = [v3 fetchedObject];
    id v6 = [v5 firstObject];
    v7 = v6;
    if (v6)
    {
      if ([v6 conformsToProtocol:&unk_1EF8E9808]) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
    id v9 = v8;

    int v10 = *(void **)(a1 + 32);
    id v11 = [v9 contentArchive];
    -[FCOfflineArticleFetchOperation _handleArchive:](v10, v11);

    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [v3 fetchedObject];
    __int16 v14 = [v13 firstObject];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);
  }
}

void __50__FCOfflineArticleFetchOperation__promiseHeadline__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) status];
  if (v2 == 2)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    v7 = (void *)MEMORY[0x1E4F28C58];
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
        v7 = [a1 archiveQueue];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __49__FCOfflineArticleFetchOperation__handleArchive___block_invoke_2;
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

void __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [FCOfflineANFArticlesFetchOperation alloc];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = (void *)v8[53];
    id v10 = (void *)v8[56];
    uint64_t v8 = (void *)v8[54];
  }
  else
  {
    id v10 = 0;
    id v9 = 0;
  }
  v30[0] = *(void *)(a1 + 40);
  id v11 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v12 = v8;
  id v13 = v10;
  id v14 = v9;
  uint64_t v15 = [v11 arrayWithObjects:v30 count:1];
  id v16 = -[FCOfflineANFArticlesFetchOperation initWithContext:config:ANFHelper:headlines:]((id *)&v7->super.super.super.isa, v14, v13, v12, v15);

  if (v16)
  {
    v16[47] = (id)20;
    *((unsigned char *)v16 + 368) = [*(id *)(a1 + 32) cachedOnly];
  }
  else
  {
    [*(id *)(a1 + 32) cachedOnly];
  }
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_3;
  newValue[3] = &unk_1E5B552B8;
  uint64_t v18 = *(void *)(a1 + 32);
  newValue[4] = v18;
  if (v16)
  {
    objc_setProperty_nonatomic_copy(v16, v17, newValue, 400);
    uint64_t v18 = *(void *)(a1 + 32);
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_4;
  v28[3] = &unk_1E5B552E0;
  v28[4] = v18;
  if (v16) {
    objc_setProperty_nonatomic_copy(v16, v17, v28, 408);
  }
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_5;
  v25 = &unk_1E5B544B8;
  id v26 = v6;
  id v27 = v5;
  id v19 = v5;
  id v21 = v6;
  if (v16) {
    objc_setProperty_nonatomic_copy(v16, v20, &v22, 416);
  }
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v16, v22, v23, v24, v25);
  [v16 start];
}

uint64_t __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      return [*(id *)(v2 + 456) addObject:a2];
    }
  }
  return result;
}

void __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_4(uint64_t a1, void *a2)
{
}

void __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v7 = (void (**)(id, id))*(id *)(a1 + 32);
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

uint64_t __57__FCOfflineArticleFetchOperation__promiseANFForHeadline___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [FCAssetsFetchOperation alloc];
  uint64_t v8 = [*(id *)(a1 + 32) coverImageAssetHandle];
  id v9 = [(FCAssetsFetchOperation *)v7 initWithAssetHandle:v8];

  [(FCOperation *)v9 setPurpose:@"offlineDownload"];
  if ([*(id *)(a1 + 40) cachedOnly]) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [(FCFetchOperation *)v9 setCachePolicy:v10];
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v9, "setCanSendFetchCompletionSynchronously:", [*(id *)(a1 + 40) cachedOnly]);
  [(FCFetchOperation *)v9 setShouldFailOnMissingObjects:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_3;
  v20[3] = &unk_1E5B552B8;
  v20[4] = *(void *)(a1 + 40);
  [(FCAssetsFetchOperation *)v9 setInterestTokenHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_4;
  v19[3] = &unk_1E5B552E0;
  v19[4] = *(void *)(a1 + 40);
  [(FCAssetsFetchOperation *)v9 setArchiveHandler:v19];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_5;
  id v16 = &unk_1E5B55308;
  id v17 = v5;
  id v18 = v6;
  id v11 = v6;
  id v12 = v5;
  [(FCFetchOperation *)v9 setFetchCompletionBlock:&v13];
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v9, v13, v14, v15, v16);
  [(FCOperation *)v9 start];
}

uint64_t __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      return [*(id *)(v2 + 456) addObject:a2];
    }
  }
  return result;
}

void __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_4(uint64_t a1, void *a2)
{
}

void __64__FCOfflineArticleFetchOperation__promiseIssueCoverForHeadline___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 error];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    [v3 fetchedObject];
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

void __49__FCOfflineArticleFetchOperation__handleArchive___block_invoke_2(uint64_t a1)
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
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->progressQueue, 0);
  objc_storeStrong(&self->progressHandler, 0);
  objc_storeStrong((id *)&self->fetchCompletionQueue, 0);
  objc_storeStrong(&self->fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->archiveQueue, 0);
  objc_storeStrong(&self->archiveHandler, 0);
}

@end