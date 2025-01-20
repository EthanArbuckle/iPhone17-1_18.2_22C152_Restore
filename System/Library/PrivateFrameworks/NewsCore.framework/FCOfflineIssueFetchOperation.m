@interface FCOfflineIssueFetchOperation
- (BOOL)cachedOnly;
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (BOOL)validateOperation;
- (FCOfflineIssueFetchOperation)init;
- (FCOfflineIssueFetchOperation)initWithContext:(id)a3 ANFHelper:(id)a4 issue:(id)a5;
- (FCOfflineIssueFetchOperation)initWithContext:(id)a3 ANFHelper:(id)a4 issueID:(id)a5;
- (OS_dispatch_queue)archiveQueue;
- (OS_dispatch_queue)fetchCompletionQueue;
- (OS_dispatch_queue)progressQueue;
- (id)_itemIdentifiersForKey:(void *)a3 fromMetadataJSONData:;
- (id)_promiseANFArticlesForArticleIDs:(void *)a1 withDownloadProgressMin:(void *)a2 downloadProgressMax:(double)a3;
- (id)archiveHandler;
- (id)fetchCompletionHandler;
- (id)progressHandler;
- (unint64_t)maxRetries;
- (void)_handleArchive:(void *)a1;
- (void)_updateProgress:(double *)a1;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)resetForRetry;
- (void)setArchiveHandler:(id)a3;
- (void)setArchiveQueue:(id)a3;
- (void)setCachedOnly:(BOOL)a3;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setFetchCompletionQueue:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setProgressQueue:(id)a3;
@end

@implementation FCOfflineIssueFetchOperation

- (FCOfflineIssueFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCOfflineIssueFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCOfflineIssueFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 77;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCOfflineIssueFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCOfflineIssueFetchOperation)initWithContext:(id)a3 ANFHelper:(id)a4 issueID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FCOfflineIssueFetchOperation;
  int v12 = [(FCOperation *)&v19 init];
  __int16 v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_ANFHelper, a4);
    uint64_t v14 = [v11 copy];
    issueID = v13->_issueID;
    v13->_issueID = (NSString *)v14;

    v16 = objc_alloc_init(FCThreadSafeMutableArray);
    resultInterestTokens = v13->_resultInterestTokens;
    v13->_resultInterestTokens = v16;
  }
  return v13;
}

- (FCOfflineIssueFetchOperation)initWithContext:(id)a3 ANFHelper:(id)a4 issue:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a5 identifier];
  id v11 = [(FCOfflineIssueFetchOperation *)self initWithContext:v9 ANFHelper:v8 issueID:v10];

  return v11;
}

- (BOOL)validateOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self && self->_context)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2)
    {
      v3 = (void *)[[NSString alloc] initWithFormat:@"offline issue fetch operation requires a context"];
      int v5 = 136315906;
      id v6 = "-[FCOfflineIssueFetchOperation validateOperation]";
      __int16 v7 = 2080;
      id v8 = "FCOfflineIssueFetchOperation.m";
      __int16 v9 = 1024;
      int v10 = 108;
      __int16 v11 = 2114;
      int v12 = v3;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

- (void)prepareOperation
{
  BOOL v2 = self;
  if (self) {
    self = (FCOfflineIssueFetchOperation *)self->_context;
  }
  id v5 = [(FCOfflineIssueFetchOperation *)self appConfigurationManager];
  v3 = [v5 possiblyUnfetchedAppConfiguration];
  uint64_t v4 = [v3 offlineDownloadsConfig];
  if (v2) {
    objc_storeStrong((id *)&v2->_config, v4);
  }
}

- (void)performOperation
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__82;
  v31[4] = __Block_byref_object_dispose__82;
  id v32 = 0;
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(FCOperation *)self shortOperationDescription];
    if ([(FCOfflineIssueFetchOperation *)self cachedOnly]) {
      id v5 = @"lookup cached";
    }
    else {
      id v5 = @"fetch";
    }
    if (self)
    {
      id v6 = self->_issueID;
      config = self->_config;
    }
    else
    {
      id v6 = 0;
      config = 0;
    }
    id v8 = config;
    if ([(FCOfflineDownloadsConfiguration *)v8 useSmallestArticleThumbnails]) {
      __int16 v9 = @"small";
    }
    else {
      __int16 v9 = @"normal";
    }
    if (self) {
      int v10 = self->_config;
    }
    else {
      int v10 = 0;
    }
    __int16 v11 = v10;
    BOOL v12 = [(FCOfflineDownloadsConfiguration *)v11 useSmallestArticleImages];
    *(_DWORD *)buf = 138544386;
    if (v12) {
      uint64_t v13 = @"small";
    }
    else {
      uint64_t v13 = @"normal";
    }
    v34 = v4;
    __int16 v35 = 2114;
    v36 = v5;
    __int16 v37 = 2114;
    v38 = v6;
    __int16 v39 = 2114;
    v40 = v9;
    __int16 v41 = 2114;
    v42 = v13;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will %{public}@ issue id=%{public}@, thumbnail variant=%{public}@, image variant=%{public}@", buf, 0x34u);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke;
  v30[3] = &unk_1E5B4E758;
  v30[4] = self;
  v24 = [MEMORY[0x1E4F81BF0] firstly:v30];
  uint64_t v14 = zalgo();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_2;
  v29[3] = &unk_1E5B5BD18;
  v29[4] = self;
  v29[5] = v31;
  uint64_t v15 = [v24 thenOn:v14 then:v29];
  v16 = zalgo();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_3;
  v28[3] = &unk_1E5B5BD40;
  v28[4] = self;
  v28[5] = v31;
  v17 = [v15 thenOn:v16 then:v28];
  v18 = zalgo();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_4;
  v27[3] = &unk_1E5B5BD40;
  v27[4] = self;
  v27[5] = v31;
  objc_super v19 = [v17 thenOn:v18 then:v27];
  v20 = zalgo();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_26;
  v26[3] = &unk_1E5B55240;
  v26[4] = self;
  v21 = [v19 thenOn:v20 then:v26];
  v22 = zalgo();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_2_28;
  v25[3] = &unk_1E5B4FD28;
  v25[4] = self;
  id v23 = (id)[v21 errorOn:v22 error:v25];

  _Block_object_dispose(v31, 8);
}

id __48__FCOfflineIssueFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke;
    v5[3] = &unk_1E5B4EEF0;
    v5[4] = v1;
    v3 = (void *)[v2 initWithResolver:v5];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = v4;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke;
    v10[3] = &unk_1E5B50378;
    id v11 = v6;
    uint64_t v12 = v5;
    id v8 = (void *)[v7 initWithResolver:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v1)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke;
    v6[3] = &unk_1E5B50378;
    id v7 = v2;
    uint64_t v8 = v1;
    id v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) type];
  if (v3 == 1)
  {
    v20 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)(a1 + 32);
      v22 = v20;
      id v23 = [v21 shortOperationDescription];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_1A460D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ will download PDF pages", (uint8_t *)&buf, 0xCu);
    }
    v24 = *(void **)(a1 + 32);
    id v12 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v24)
    {
      uint64_t v1 = 0;
      goto LABEL_15;
    }
    id v25 = objc_alloc(MEMORY[0x1E4F81BF0]);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v31 = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke;
    id v32 = &unk_1E5B50378;
    id v33 = v12;
    id v34 = v24;
    uint64_t v26 = [v25 initWithResolver:&buf];
    goto LABEL_13;
  }
  if (v3) {
    goto LABEL_16;
  }
  id v4 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 shortOperationDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will download ANF pages", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) metadataJSONAssetHandle];
  __int16 v9 = [v8 dataProvider];

  uint64_t v1 = *(void **)(a1 + 32);
  int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v9)
  {
    id v11 = v10;
    id v12 = v11;
    if (!v1)
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v13 = [v11 metadataJSONAssetHandle];
    uint64_t v14 = [v13 dataProvider];

    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F81BF0];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v31 = __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke_2;
      id v32 = &unk_1E5B4FEB0;
      id v33 = v1;
      id v16 = v12;
      id v34 = v16;
      v17 = [v15 firstly:&buf];
      v18 = zalgo();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke_3;
      v28[3] = &unk_1E5B5BD90;
      v28[4] = v1;
      id v29 = v16;
      uint64_t v1 = [v17 thenOn:v18 then:v28];

      objc_super v19 = v34;
LABEL_14:

      goto LABEL_15;
    }
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v31 = __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke;
    id v32 = &unk_1E5B4E758;
    id v33 = v12;
    uint64_t v26 = __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke((uint64_t)&buf);
LABEL_13:
    uint64_t v1 = (void *)v26;
    objc_super v19 = v33;
    goto LABEL_14;
  }
  if (v1)
  {
    id v12 = [v10 allArticleIDs];
    uint64_t v1 = -[FCOfflineIssueFetchOperation _promiseANFArticlesForArticleIDs:withDownloadProgressMin:downloadProgressMax:](v1, v12, 1.0);
    goto LABEL_15;
  }
LABEL_16:
  return v1;
}

uint64_t __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_26(uint64_t a1)
{
  return 0;
}

uint64_t __48__FCOfflineIssueFetchOperation_performOperation__block_invoke_2_28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[FCOfflineIssueFetchOperation _updateProgress:]((double *)self, 1.0);
  }
  uint64_t v5 = [(FCOfflineIssueFetchOperation *)self fetchCompletionQueue];

  id v6 = [(FCOfflineIssueFetchOperation *)self fetchCompletionHandler];

  if (v5)
  {
    if (v6)
    {
      id v7 = [(FCOfflineIssueFetchOperation *)self fetchCompletionQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__FCOfflineIssueFetchOperation_operationWillFinishWithError___block_invoke;
      v12[3] = &unk_1E5B4BE70;
      v12[4] = self;
      id v13 = v4;
      dispatch_async(v7, v12);
    }
  }
  else if (v6)
  {
    uint64_t v8 = [(FCOfflineIssueFetchOperation *)self fetchCompletionHandler];
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

- (void)_updateProgress:(double *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1 && ([a1 isFinished] & 1) == 0)
  {
    if (a1[58] > a2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v7 = (void *)[[NSString alloc] initWithFormat:@"fetch progress should never go backward"];
      *(_DWORD *)long long buf = 136315906;
      int v10 = "-[FCOfflineIssueFetchOperation _updateProgress:]";
      __int16 v11 = 2080;
      id v12 = "FCOfflineIssueFetchOperation.m";
      __int16 v13 = 1024;
      int v14 = 649;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    a1[58] = a2;
    id v4 = [a1 progressQueue];

    uint64_t v5 = [a1 progressHandler];

    if (v4)
    {
      if (!v5) {
        return;
      }
      uint64_t v6 = [a1 progressQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__FCOfflineIssueFetchOperation__updateProgress___block_invoke_111;
      block[3] = &unk_1E5B4C018;
      block[4] = a1;
      dispatch_async((dispatch_queue_t)v6, block);
    }
    else
    {
      if (!v5) {
        return;
      }
      uint64_t v6 = [a1 progressHandler];
      (*(void (**)(double))(v6 + 16))(a1[58]);
    }
  }
}

void __61__FCOfflineIssueFetchOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v5 = [*(id *)(a1 + 32) fetchCompletionHandler];
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[57];
  }
  uint64_t v3 = v2;
  id v4 = [v3 readOnlyArray];
  v5[2](v5, v4, *(void *)(a1 + 40));
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6 = a3;
  if ([(FCOfflineIssueFetchOperation *)self cachedOnly]) {
    goto LABEL_6;
  }
  id v7 = [v6 domain];
  if (![v7 isEqualToString:@"FCErrorDomain"])
  {

    goto LABEL_6;
  }
  uint64_t v8 = [v6 code];

  if (v8 != 21)
  {
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  *a4 = (id)objc_opt_new();
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (void)resetForRetry
{
  uint64_t v3 = +[FCCachePolicy ignoreCacheCachePolicy];
  id v4 = v3;
  if (self)
  {
    uint64_t v5 = v3;
    objc_storeStrong((id *)&self->_issueRecordCachePolicy, v3);
    id v4 = v5;
  }
  MEMORY[0x1F41817F8](v3, v4);
}

void __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [FCIssuesFetchOperation alloc];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    BOOL v9 = (void *)v8[53];
    uint64_t v8 = (void *)v8[55];
  }
  else
  {
    BOOL v9 = 0;
  }
  v28[0] = v8;
  int v10 = (void *)MEMORY[0x1E4F1C978];
  __int16 v11 = v8;
  id v12 = v9;
  __int16 v13 = [v10 arrayWithObjects:v28 count:1];
  int v14 = [(FCIssuesFetchOperation *)v7 initWithContext:v12 issueIDs:v13];

  if ([*(id *)(a1 + 32) cachedOnly])
  {
    __int16 v15 = +[FCCachePolicy cachedOnlyCachePolicy];
    [(FCIssuesFetchOperation *)v14 setCachePolicy:v15];
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      uint64_t v17 = *(void *)(v16 + 472);
    }
    else {
      uint64_t v17 = 0;
    }
    [(FCIssuesFetchOperation *)v14 setCachePolicy:v17];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke_2;
  v27[3] = &unk_1E5B552B8;
  v27[4] = *(void *)(a1 + 32);
  [(FCIssuesFetchOperation *)v14 setInterestTokenHandler:v27];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke_3;
  id v23 = &unk_1E5B5BD68;
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = v6;
  id v26 = v5;
  id v18 = v5;
  id v19 = v6;
  [(FCIssuesFetchOperation *)v14 setFetchCompletionHandler:&v20];
  objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v14, v20, v21, v22, v23, v24);
  [(FCOperation *)v14 start];
}

uint64_t __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke_2(uint64_t result, uint64_t a2)
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

void __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v13 = (void (**)(id, id))*(id *)(a1 + 40);
    id v12 = v6;
    v13[2](v13, v12);
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v5 firstObject];
    BOOL v9 = [v8 contentArchive];
    -[FCOfflineIssueFetchOperation _handleArchive:](v7, v9);

    uint64_t v10 = *(void *)(a1 + 48);
    __int16 v11 = [v5 firstObject];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
}

uint64_t __45__FCOfflineIssueFetchOperation__promiseIssue__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_handleArchive:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    id v5 = [a1 archiveQueue];

    id v6 = [a1 archiveHandler];

    if (v5)
    {
      if (v6)
      {
        id v7 = [a1 archiveQueue];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __47__FCOfflineIssueFetchOperation__handleArchive___block_invoke_2;
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

void __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) metadataJSONAssetHandle];

  if (v7)
  {
    uint64_t v8 = [FCAssetsFetchOperation alloc];
    BOOL v9 = [*(id *)(a1 + 32) metadataJSONAssetHandle];
    id v10 = [(FCAssetsFetchOperation *)v8 initWithAssetHandle:v9];

    [(FCOperation *)v10 setPurpose:@"offlineDownload"];
    if ([*(id *)(a1 + 40) cachedOnly]) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
    [(FCFetchOperation *)v10 setCachePolicy:v11];
    -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v10, "setCanSendFetchCompletionSynchronously:", [*(id *)(a1 + 40) cachedOnly]);
    [(FCAssetsFetchOperation *)v10 setMaxConcurrentFetchCount:20];
    [(FCFetchOperation *)v10 setShouldFailOnMissingObjects:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_46;
    v20[3] = &unk_1E5B552B8;
    v20[4] = *(void *)(a1 + 40);
    [(FCAssetsFetchOperation *)v10 setInterestTokenHandler:v20];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2_47;
    v19[3] = &unk_1E5B552E0;
    v19[4] = *(void *)(a1 + 40);
    [(FCAssetsFetchOperation *)v10 setArchiveHandler:v19];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    __int16 v15 = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_3;
    uint64_t v16 = &unk_1E5B55308;
    id v17 = v5;
    id v18 = v6;
    id v12 = v6;
    [(FCFetchOperation *)v10 setFetchCompletionBlock:&v13];
    objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v10, v13, v14, v15, v16);
    [(FCOperation *)v10 start];
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2;
    v21[3] = &unk_1E5B4CC80;
    id v22 = *(id *)(a1 + 32);
    id v23 = v6;
    id v10 = (FCAssetsFetchOperation *)v6;
    __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2((uint64_t)v21);

    id v12 = v22;
  }
}

void __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    id v4 = [NSString alloc];
    id v5 = [*(id *)(a1 + 32) identifier];
    id v6 = (void *)[v4 initWithFormat:@"An issue is missing its metadata JSON asset handle, issueID=%@", v5];
    *(_DWORD *)long long buf = 136315906;
    uint64_t v8 = "-[FCOfflineIssueFetchOperation _promiseMetadataForIssue:]_block_invoke_2";
    __int16 v9 = 2080;
    id v10 = "FCOfflineIssueFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 239;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingIssueMetadata) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_missingAssetErrorWithAssetHandles:", MEMORY[0x1E4F1CBF0]);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

uint64_t __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_46(uint64_t result, uint64_t a2)
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

void __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_2_47(uint64_t a1, void *a2)
{
}

void __57__FCOfflineIssueFetchOperation__promiseMetadataForIssue___block_invoke_3(uint64_t a1, void *a2)
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

void __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [FCAssetsFetchOperation alloc];
  uint64_t v8 = FCOfflineThumbnailAssetHandlesForIssue(*(void **)(a1 + 32));
  __int16 v9 = [(FCAssetsFetchOperation *)v7 initWithAssetHandles:v8];

  [(FCOperation *)v9 setPurpose:@"offlineDownload"];
  if ([*(id *)(a1 + 40) cachedOnly]) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [(FCFetchOperation *)v9 setCachePolicy:v10];
  -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v9, "setCanSendFetchCompletionSynchronously:", [*(id *)(a1 + 40) cachedOnly]);
  [(FCAssetsFetchOperation *)v9 setMaxConcurrentFetchCount:20];
  [(FCFetchOperation *)v9 setShouldFailOnMissingObjects:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_2;
  v20[3] = &unk_1E5B552B8;
  v20[4] = *(void *)(a1 + 40);
  [(FCAssetsFetchOperation *)v9 setInterestTokenHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_3;
  v19[3] = &unk_1E5B552E0;
  v19[4] = *(void *)(a1 + 40);
  [(FCAssetsFetchOperation *)v9 setArchiveHandler:v19];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_4;
  uint64_t v16 = &unk_1E5B55308;
  id v17 = v5;
  id v18 = v6;
  id v11 = v6;
  id v12 = v5;
  [(FCFetchOperation *)v9 setFetchCompletionBlock:&v13];
  objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v9, v13, v14, v15, v16);
  [(FCOperation *)v9 start];
}

uint64_t __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_2(uint64_t result, uint64_t a2)
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

void __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_3(uint64_t a1, void *a2)
{
}

void __59__FCOfflineIssueFetchOperation__promiseCoverImageForIssue___block_invoke_4(uint64_t a1, void *a2)
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

- (id)_promiseANFArticlesForArticleIDs:(void *)a1 withDownloadProgressMin:(void *)a2 downloadProgressMax:(double)a3
{
  id v5 = a2;
  if (a1)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke;
    v8[3] = &unk_1E5B5BDE0;
    v8[4] = a1;
    id v9 = v5;
    uint64_t v10 = 0;
    double v11 = a3;
    a1 = (void *)[v6 initWithResolver:v8];
  }
  return a1;
}

id __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F81BF0]);
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = [*(id *)(a1 + 32) metadataJSONAssetHandle];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v6 = objc_msgSend(v3, "fc_missingAssetErrorWithAssetHandles:", v5);
  id v7 = (void *)[v2 initWithError:v6];

  return v7;
}

id __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) metadataJSONAssetHandle];
  uint64_t v4 = [v3 dataProvider];
  id v5 = [v4 data];
  id v6 = -[FCOfflineIssueFetchOperation _itemIdentifiersForKey:fromMetadataJSONData:](v2, @"articleIdentifier", v5);

  id v7 = -[FCOfflineIssueFetchOperation _promiseANFArticlesForArticleIDs:withDownloadProgressMin:downloadProgressMax:](*(void **)(a1 + 32), v6, 0.9);

  return v7;
}

- (id)_itemIdentifiersForKey:(void *)a3 fromMetadataJSONData:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (v6)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      id v9 = (void *)MEMORY[0x1A6260FD0]();
      objc_opt_class();
      id v43 = 0;
      uint64_t v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v43];
      id v11 = v43;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          id v12 = v10;
        }
        else {
          id v12 = 0;
        }
      }
      else
      {
        id v12 = 0;
      }
      id v14 = v12;

      if (v14)
      {
        v36 = v11;
        id v15 = v14;
        objc_opt_class();
        uint64_t v16 = [v15 objectForKeyedSubscript:@"items"];
        if (v16)
        {
          if (objc_opt_isKindOfClass()) {
            id v17 = v16;
          }
          else {
            id v17 = 0;
          }
        }
        else
        {
          id v17 = 0;
        }
        id v19 = v17;

        if (v19)
        {
          id v33 = v15;
          id v34 = v9;
          uint64_t v35 = v7;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v32 = v19;
          id v20 = v19;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v44 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v38 != v23) {
                  objc_enumerationMutation(v20);
                }
                id v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                objc_opt_class();
                if (v25)
                {
                  if (objc_opt_isKindOfClass()) {
                    id v26 = v25;
                  }
                  else {
                    id v26 = 0;
                  }
                }
                else
                {
                  id v26 = 0;
                }
                id v27 = v26;
                objc_opt_class();
                v28 = [v27 objectForKeyedSubscript:v5];
                if (v28)
                {
                  if (objc_opt_isKindOfClass()) {
                    id v29 = v28;
                  }
                  else {
                    id v29 = 0;
                  }
                }
                else
                {
                  id v29 = 0;
                }
                id v30 = v29;

                objc_msgSend(v8, "fc_safelyAddObject:", v30);
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v44 count:16];
            }
            while (v22);
          }

          id v9 = v34;
          id v7 = v35;
          id v19 = v32;
          id v15 = v33;
        }

        id v13 = v8;
      }
      else
      {
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __76__FCOfflineIssueFetchOperation__itemIdentifiersForKey_fromMetadataJSONData___block_invoke_2;
        v41[3] = &unk_1E5B518C8;
        v41[4] = a1;
        id v42 = v11;
        id v18 = v11;
        __76__FCOfflineIssueFetchOperation__itemIdentifiersForKey_fromMetadataJSONData___block_invoke_2((uint64_t)v41);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v13 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id __57__FCOfflineIssueFetchOperation__promiseANFPagesForIssue___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke;
    v6[3] = &unk_1E5B5BDE0;
    id v7 = v2;
    uint64_t v8 = v1;
    long long v9 = xmmword_1A4974BE0;
    uint64_t v4 = (void *)[v3 initWithResolver:v6];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [FCOfflineANFArticlesFetchOperation alloc];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    long long v9 = (void *)v8[53];
    uint64_t v10 = (void *)v8[56];
    id v11 = (void *)v8[54];
  }
  else
  {
    uint64_t v10 = 0;
    long long v9 = 0;
    id v11 = 0;
  }
  id v12 = *(void **)(a1 + 40);
  id v13 = v10;
  id v14 = v9;
  id v15 = -[FCOfflineANFArticlesFetchOperation initWithContext:config:ANFHelper:articleIDs:]((id *)&v7->super.super.super.isa, v14, v13, v11, v12);

  if (v15)
  {
    v15[48] = (id)2;
    v15[47] = (id)20;
    *((unsigned char *)v15 + 368) = [*(id *)(a1 + 32) cachedOnly];
  }
  else
  {
    [*(id *)(a1 + 32) cachedOnly];
  }
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_2;
  newValue[3] = &unk_1E5B552B8;
  uint64_t v17 = *(void *)(a1 + 32);
  newValue[4] = v17;
  if (v15)
  {
    objc_setProperty_nonatomic_copy(v15, v16, newValue, 400);
    uint64_t v17 = *(void *)(a1 + 32);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_3;
  v26[3] = &unk_1E5B552E0;
  v26[4] = v17;
  if (v15)
  {
    objc_setProperty_nonatomic_copy(v15, v16, v26, 408);
    uint64_t v17 = *(void *)(a1 + 32);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_4;
  v24[3] = &unk_1E5B5BDB8;
  long long v25 = *(_OWORD *)(a1 + 48);
  v24[4] = v17;
  if (v15) {
    objc_setProperty_nonatomic_copy(v15, v16, v24, 392);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_5;
  v21[3] = &unk_1E5B544B8;
  id v22 = v6;
  id v23 = v5;
  id v18 = v5;
  id v20 = v6;
  if (v15) {
    objc_setProperty_nonatomic_copy(v15, v19, v21, 416);
  }
  [*(id *)(a1 + 32) associateChildOperation:v15];
  [v15 start];
}

uint64_t __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_2(uint64_t result, uint64_t a2)
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

void __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_3(uint64_t a1, void *a2)
{
}

void __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_4(uint64_t a1, double a2)
{
}

void __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_5(uint64_t a1, void *a2)
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

uint64_t __109__FCOfflineIssueFetchOperation__promiseANFArticlesForArticleIDs_withDownloadProgressMin_downloadProgressMax___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) metadataJSONAssetHandle];
  uint64_t v8 = [v7 dataProvider];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 32) metadataJSONAssetHandle];
    id v11 = [v10 dataProvider];
    id v12 = [v11 data];
    -[FCOfflineIssueFetchOperation _itemIdentifiersForKey:fromMetadataJSONData:](v9, @"asset", v12);
    id v13 = (FCResourcesFetchOperation *)objc_claimAutoreleasedReturnValue();

    id v14 = [FCResourcesFetchOperation alloc];
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      uint64_t v16 = *(void *)(v15 + 424);
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [(FCResourcesFetchOperation *)v14 initWithContext:v16 resourceIDs:v13 downloadAssets:1];
    [(FCOperation *)v17 setPurpose:@"offlineDownload"];
    [(FCResourcesFetchOperation *)v17 setMaxConcurrentFetchCount:20];
    [(FCFetchOperation *)v17 setShouldFailOnMissingObjects:1];
    if ([*(id *)(a1 + 40) cachedOnly]) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 0;
    }
    [(FCFetchOperation *)v17 setCachePolicy:v18];
    -[FCFetchOperation setCanSendFetchCompletionSynchronously:](v17, "setCanSendFetchCompletionSynchronously:", [*(id *)(a1 + 40) cachedOnly]);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_3;
    v30[3] = &unk_1E5B552B8;
    v30[4] = *(void *)(a1 + 40);
    [(FCResourcesFetchOperation *)v17 setInterestTokenHandler:v30];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_4;
    v29[3] = &unk_1E5B552E0;
    v29[4] = *(void *)(a1 + 40);
    [(FCResourcesFetchOperation *)v17 setArchiveHandler:v29];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_5;
    v27[3] = &unk_1E5B5BDB8;
    long long v28 = *(_OWORD *)(a1 + 48);
    v27[4] = *(void *)(a1 + 40);
    [(FCResourcesFetchOperation *)v17 setProgressHandler:v27];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_6;
    id v23 = &unk_1E5B5BE08;
    id v25 = v5;
    id v26 = v6;
    uint64_t v24 = *(void *)(a1 + 40);
    id v19 = v6;
    [(FCFetchOperation *)v17 setFetchCompletionBlock:&v20];
    objc_msgSend(*(id *)(a1 + 40), "associateChildOperation:", v17, v20, v21, v22, v23, v24);
    [(FCOperation *)v17 start];
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_2;
    v31[3] = &unk_1E5B4C7C0;
    id v33 = v6;
    id v32 = *(id *)(a1 + 32);
    id v13 = v6;
    __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_2((uint64_t)v31);

    uint64_t v17 = v33;
  }
}

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) metadataJSONAssetHandle];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v5 = objc_msgSend(v1, "fc_missingAssetErrorWithAssetHandles:", v4);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

uint64_t __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_3(uint64_t result, uint64_t a2)
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

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_4(uint64_t a1, void *a2)
{
}

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_5(uint64_t a1, double a2)
{
}

void __107__FCOfflineIssueFetchOperation__promiseReplicaAdPagesForIssue_withDownloadProgressMin_downloadProgressMax___block_invoke_6(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 status];
  if (v3 == 1)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [*(id *)(a1 + 32) errorUserInfo];
    uint64_t v8 = objc_msgSend(v6, "fc_operationCancelledErrorWithAdditionalUserInfo:", v7);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  }
  else
  {
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      [v9 error];
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 40);
      [v9 fetchedObject];
    id v7 = };
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v93 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) metadataJSONAssetHandle];
  id v7 = [v6 dataProvider];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) metadataJSONAssetHandle];
    uint64_t v10 = [v9 dataProvider];
    id v11 = [v10 data];
    v91 = v10;
    v92 = v5;
    v90 = v11;
    if (!v8)
    {
      uint64_t v16 = 0;
LABEL_92:

      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_3;
      v118[3] = &unk_1E5B55DC8;
      v118[4] = *(void *)(a1 + 40);
      objc_msgSend(v16, "fc_arrayByTransformingWithBlock:", v118);
      v64 = uint64_t v63 = a1;
      v65 = objc_msgSend(v64, "fc_setByTransformingWithBlock:", &__block_literal_global_64_0);
      if ([v65 count])
      {
        if (![*(id *)(v63 + 40) cachedOnly])
        {
          if (!*(void *)(v63 + 40)) {
            goto LABEL_105;
          }
          uint64_t v67 = v63;
          v68 = [*(id *)(v63 + 32) issueRecord];
          v69 = [v68 pdfResourceArchiveURL];

          if (v69)
          {
            v70 = [MEMORY[0x1E4F1CB10] URLWithString:v69];
          }
          else
          {
            v70 = 0;
          }

          uint64_t v63 = v67;
          if (v70)
          {
            v71 = [FCResourceArchiveFetchOperation alloc];
            uint64_t v72 = *(void *)(v67 + 40);
            if (v72) {
              uint64_t v73 = *(void *)(v72 + 424);
            }
            else {
              uint64_t v73 = 0;
            }
            v74 = [(FCResourceArchiveFetchOperation *)v71 initWithArchiveURL:v70 context:v73];
            [(FCResourceArchiveFetchOperation *)v74 setMaxConcurrentFetchCount:20];
            v111[0] = MEMORY[0x1E4F143A8];
            v111[1] = 3221225472;
            v111[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_3_69;
            v111[3] = &unk_1E5B552B8;
            uint64_t v75 = v67;
            v111[4] = *(void *)(v67 + 40);
            [(FCResourceArchiveFetchOperation *)v74 setInterestTokenHandler:v111];
            v110[0] = MEMORY[0x1E4F143A8];
            v110[1] = 3221225472;
            v110[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_4_70;
            v110[3] = &unk_1E5B552E0;
            v110[4] = *(void *)(v67 + 40);
            [(FCResourceArchiveFetchOperation *)v74 setArchiveHandler:v110];
            v109[0] = MEMORY[0x1E4F143A8];
            v109[1] = 3221225472;
            v109[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5_71;
            v109[3] = &unk_1E5B50848;
            v109[4] = *(void *)(v67 + 40);
            [(FCResourceArchiveFetchOperation *)v74 setProgressHandler:v109];
            v106[0] = MEMORY[0x1E4F143A8];
            v106[1] = 3221225472;
            v106[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_6;
            v106[3] = &unk_1E5B514F8;
            v76 = &v107;
            id v107 = v92;
            v77 = &v108;
            id v108 = v93;
            [(FCResourceArchiveFetchOperation *)v74 setFetchCompletionHandler:v106];
            [*(id *)(v75 + 40) associateChildOperation:v74];
            [(FCOperation *)v74 start];
          }
          else
          {
LABEL_105:
            v78 = [FCResourcesFetchOperation alloc];
            uint64_t v79 = v63;
            uint64_t v80 = *(void *)(v63 + 40);
            if (v80) {
              uint64_t v81 = *(void *)(v80 + 424);
            }
            else {
              uint64_t v81 = 0;
            }
            v74 = [(FCResourcesFetchOperation *)v78 initWithContext:v81 resourceIDs:v16 downloadAssets:1];
            [(FCOperation *)v74 setPurpose:@"offlineDownload"];
            [(FCResourceArchiveFetchOperation *)v74 setMaxConcurrentFetchCount:20];
            [(FCResourceArchiveFetchOperation *)v74 setShouldFailOnMissingObjects:1];
            v105[0] = MEMORY[0x1E4F143A8];
            v105[1] = 3221225472;
            v105[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_8;
            v105[3] = &unk_1E5B552B8;
            v105[4] = *(void *)(v79 + 40);
            [(FCResourceArchiveFetchOperation *)v74 setInterestTokenHandler:v105];
            v104[0] = MEMORY[0x1E4F143A8];
            v104[1] = 3221225472;
            v104[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_9;
            v104[3] = &unk_1E5B552E0;
            v104[4] = *(void *)(v79 + 40);
            [(FCResourceArchiveFetchOperation *)v74 setArchiveHandler:v104];
            v103[0] = MEMORY[0x1E4F143A8];
            v103[1] = 3221225472;
            v103[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_10;
            v103[3] = &unk_1E5B50848;
            v103[4] = *(void *)(v79 + 40);
            [(FCResourceArchiveFetchOperation *)v74 setProgressHandler:v103];
            v100[0] = MEMORY[0x1E4F143A8];
            v100[1] = 3221225472;
            v100[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_11;
            v100[3] = &unk_1E5B5BE08;
            v76 = &v101;
            id v101 = v93;
            v77 = &v102;
            id v82 = v92;
            uint64_t v83 = *(void *)(v79 + 40);
            id v102 = v82;
            v100[4] = v83;
            [(FCResourceArchiveFetchOperation *)v74 setFetchCompletionBlock:v100];
            [*(id *)(v79 + 40) associateChildOperation:v74];
            [(FCOperation *)v74 start];
            v70 = 0;
          }

          goto LABEL_109;
        }
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2_67;
        v112[3] = &unk_1E5B4C7C0;
        id v114 = v92;
        id v113 = v65;
        __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2_67((uint64_t)v112);

        v66 = v114;
      }
      else
      {
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v115[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5;
        v115[3] = &unk_1E5B4E088;
        v115[4] = *(void *)(v63 + 40);
        id v116 = v64;
        id v117 = v93;
        __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5((uint64_t)v115);

        v66 = v116;
      }

LABEL_109:
      id v5 = v92;
      goto LABEL_110;
    }
    id v12 = v11;
    if (!v11)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_92;
    }
    v89 = v9;
    objc_opt_class();
    id v130 = 0;
    id v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v12 options:0 error:&v130];
    id v14 = v130;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    id v17 = v15;

    v88 = v17;
    if (!v17)
    {
      v135[0] = MEMORY[0x1E4F143A8];
      v135[1] = 3221225472;
      v135[2] = __65__FCOfflineIssueFetchOperation__resourceIDsFromMetadataJSONData___block_invoke_2;
      v135[3] = &unk_1E5B518C8;
      v135[4] = v8;
      id v136 = v14;
      uint64_t v16 = __65__FCOfflineIssueFetchOperation__resourceIDsFromMetadataJSONData___block_invoke_2((uint64_t)v135);

      id v9 = v89;
LABEL_91:

      goto LABEL_92;
    }
    id v85 = v14;
    id v18 = v17;
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    objc_opt_class();
    v87 = v18;
    id v19 = [v18 objectForKeyedSubscript:@"pages"];
    if (v19)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    id v21 = v20;

    id v22 = v21;
    id v9 = v89;
    uint64_t v86 = a1;
    if (v22)
    {
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      obuint64_t j = v22;
      uint64_t v23 = [obj countByEnumeratingWithState:&v131 objects:v135 count:16];
      if (!v23)
      {
LABEL_90:

        id v14 = v85;
        a1 = v86;
        goto LABEL_91;
      }
      uint64_t v24 = v23;
      v84 = v22;
      uint64_t v25 = *(void *)v132;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v132 != v25) {
            objc_enumerationMutation(obj);
          }
          id v27 = *(void **)(*((void *)&v131 + 1) + 8 * i);
          objc_opt_class();
          if (v27)
          {
            if (objc_opt_isKindOfClass()) {
              long long v28 = v27;
            }
            else {
              long long v28 = 0;
            }
          }
          else
          {
            long long v28 = 0;
          }
          id v29 = v28;
          objc_opt_class();
          id v30 = [v29 objectForKeyedSubscript:@"pageAsset"];
          if (v30)
          {
            if (objc_opt_isKindOfClass()) {
              v31 = v30;
            }
            else {
              v31 = 0;
            }
          }
          else
          {
            v31 = 0;
          }
          id v32 = v31;

          objc_msgSend(v16, "fc_safelyAddObject:", v32);
          objc_opt_class();
          id v33 = [v29 objectForKeyedSubscript:@"thumbnailAssetLQ"];
          if (v33)
          {
            if (objc_opt_isKindOfClass()) {
              id v34 = v33;
            }
            else {
              id v34 = 0;
            }
          }
          else
          {
            id v34 = 0;
          }
          id v35 = v34;

          objc_msgSend(v16, "fc_safelyAddObject:", v35);
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v131 objects:v135 count:16];
      }
      while (v24);
    }
    else
    {
      v84 = 0;
      objc_opt_class();
      v36 = [v87 objectForKeyedSubscript:@"content"];
      if (v36)
      {
        if (objc_opt_isKindOfClass()) {
          long long v37 = v36;
        }
        else {
          long long v37 = 0;
        }
      }
      else
      {
        long long v37 = 0;
      }
      id v38 = v37;

      objc_opt_class();
      obuint64_t j = v38;
      long long v39 = [v38 objectForKeyedSubscript:@"pageLayouts"];
      if (v39)
      {
        if (objc_opt_isKindOfClass()) {
          long long v40 = v39;
        }
        else {
          long long v40 = 0;
        }
      }
      else
      {
        long long v40 = 0;
      }
      id v41 = v40;

      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id v94 = [v41 allValues];
      uint64_t v97 = [v94 countByEnumeratingWithState:&v126 objects:v135 count:16];
      if (v97)
      {
        uint64_t v96 = *(void *)v127;
        do
        {
          uint64_t v42 = 0;
          do
          {
            if (*(void *)v127 != v96) {
              objc_enumerationMutation(v94);
            }
            uint64_t v99 = v42;
            id v43 = *(void **)(*((void *)&v126 + 1) + 8 * v42);
            objc_opt_class();
            if (v43)
            {
              if (objc_opt_isKindOfClass()) {
                v44 = v43;
              }
              else {
                v44 = 0;
              }
            }
            else
            {
              v44 = 0;
            }
            uint64_t v45 = v16;
            id v46 = v44;
            objc_opt_class();
            v98 = v46;
            v47 = [v46 objectForKeyedSubscript:@"pdfOverlays"];
            if (v47)
            {
              if (objc_opt_isKindOfClass()) {
                v48 = v47;
              }
              else {
                v48 = 0;
              }
            }
            else
            {
              v48 = 0;
            }
            id v49 = v48;

            long long v124 = 0u;
            long long v125 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            id v50 = v49;
            uint64_t v51 = [v50 countByEnumeratingWithState:&v122 objects:&v131 count:16];
            if (v51)
            {
              uint64_t v52 = v51;
              uint64_t v53 = *(void *)v123;
              do
              {
                for (uint64_t j = 0; j != v52; ++j)
                {
                  if (*(void *)v123 != v53) {
                    objc_enumerationMutation(v50);
                  }
                  v55 = *(void **)(*((void *)&v122 + 1) + 8 * j);
                  objc_opt_class();
                  if (v55)
                  {
                    if (objc_opt_isKindOfClass()) {
                      v56 = v55;
                    }
                    else {
                      v56 = 0;
                    }
                  }
                  else
                  {
                    v56 = 0;
                  }
                  id v57 = v56;
                  objc_opt_class();
                  v58 = [v57 objectForKeyedSubscript:@"url"];
                  if (v58)
                  {
                    if (objc_opt_isKindOfClass()) {
                      v59 = v58;
                    }
                    else {
                      v59 = 0;
                    }
                  }
                  else
                  {
                    v59 = 0;
                  }
                  id v60 = v59;

                  if (v60)
                  {
                    v61 = [MEMORY[0x1E4F1CB10] URLWithString:v60];
                    v62 = [v61 host];

                    objc_msgSend(v45, "fc_safelyAddObject:", v62);
                  }
                }
                uint64_t v52 = [v50 countByEnumeratingWithState:&v122 objects:&v131 count:16];
              }
              while (v52);
            }

            uint64_t v42 = v99 + 1;
            uint64_t v16 = v45;
          }
          while (v99 + 1 != v97);
          uint64_t v97 = [v94 countByEnumeratingWithState:&v126 objects:v135 count:16];
        }
        while (v97);
      }
    }
    id v9 = v89;
    id v22 = v84;
    goto LABEL_90;
  }
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2;
  v119[3] = &unk_1E5B4C7C0;
  id v121 = v5;
  id v120 = *(id *)(a1 + 32);
  __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2((uint64_t)v119);

  uint64_t v16 = v121;
LABEL_110:
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) metadataJSONAssetHandle];
  uint64_t v4 = objc_msgSend(v2, "arrayWithObjects:", v6, 0);
  id v5 = objc_msgSend(v1, "fc_missingAssetErrorWithAssetHandles:", v4);
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

FCResource *__57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [FCResource alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 424);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [(FCResource *)v4 initWithPermanentURLForResourceID:v3 cacheLifetimeHint:0 contentContext:v6];

  return v7;
}

id __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isOnDisk])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [v2 resourceID];
  }

  return v3;
}

uint64_t __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 shortOperationDescription];
    *(_DWORD *)long long buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ already has all PDF pages in the cache", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_65;
  v10[3] = &unk_1E5B57FD8;
  uint64_t v6 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  [v6 enumerateObjectsUsingBlock:v10];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) contentArchive];
  -[FCOfflineIssueFetchOperation _handleArchive:](v7, v8);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 assetHandle];
  id v8 = (id)v3;
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 88);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = v5;
  if (v2) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    [*(id *)(v2 + 456) addObject:v5];
  }
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_2_67(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_notCachedErrorWithMissingObjects:", *(void *)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_3_69(uint64_t result, uint64_t a2)
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

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_4_70(uint64_t a1, void *a2)
{
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_5_71(uint64_t a1, double a2)
{
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v6 = (void (**)(id, id))*(id *)(a1 + 32);
    id v5 = v4;
    v6[2](v6, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_8(uint64_t result, uint64_t a2)
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

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_9(uint64_t a1, void *a2)
{
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_10(uint64_t a1, double a2)
{
}

void __57__FCOfflineIssueFetchOperation__promisePDFPagesForIssue___block_invoke_11(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 status];
  if (v3 == 1)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    BOOL v7 = [*(id *)(a1 + 32) errorUserInfo];
    id v8 = objc_msgSend(v6, "fc_operationCancelledErrorWithAdditionalUserInfo:", v7);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  }
  else
  {
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      [v9 error];
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 40);
      [v9 fetchedObject];
    BOOL v7 = };
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }
}

uint64_t __76__FCOfflineIssueFetchOperation__itemIdentifiersForKey_fromMetadataJSONData___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = v2;
    uint64_t v6 = [v4 shortOperationDescription];
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ error occurred trying to parse issue metadata JSON: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return MEMORY[0x1E4F1CBF0];
}

uint64_t __65__FCOfflineIssueFetchOperation__resourceIDsFromMetadataJSONData___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = v2;
    uint64_t v6 = [v4 shortOperationDescription];
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "%{public}@ error occurred trying to parse issue metadata JSON: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return MEMORY[0x1E4F1CBF0];
}

void __48__FCOfflineIssueFetchOperation__updateProgress___block_invoke_111(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) progressHandler];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v3.n128_u64[0] = *(void *)(v4 + 464);
  }
  else {
    v3.n128_u64[0] = 0;
  }
  id v5 = (id)v2;
  (*(void (**)(__n128))(v2 + 16))(v3);
}

void __47__FCOfflineIssueFetchOperation__handleArchive___block_invoke_2(uint64_t a1)
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
  objc_storeStrong((id *)&self->_issueRecordCachePolicy, 0);
  objc_storeStrong((id *)&self->_resultInterestTokens, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_issueID, 0);
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