@interface FCIssueDownloadService
- (FCANFHelper)ANFHelper;
- (FCArticleDownloadServiceType)articleDownloadService;
- (FCContentContext)context;
- (FCIssueDownloadService)init;
- (FCIssueDownloadService)initWithContext:(id)a3 ANFHelper:(id)a4 articleDownloadService:(id)a5;
- (id)fetchCachedIssueWithID:(id)a3 completionHandler:(id)a4;
- (int64_t)isIssueDownloadedEnoughToRead:(id)a3;
@end

@implementation FCIssueDownloadService

- (FCIssueDownloadService)initWithContext:(id)a3 ANFHelper:(id)a4 articleDownloadService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCIssueDownloadService;
  v12 = [(FCIssueDownloadService *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_ANFHelper, a4);
    objc_storeStrong((id *)&v13->_articleDownloadService, a5);
  }

  return v13;
}

- (FCIssueDownloadService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssueDownloadService init]";
    __int16 v9 = 2080;
    id v10 = "FCIssueDownloadService.m";
    __int16 v11 = 1024;
    int v12 = 39;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCIssueDownloadService init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)fetchCachedIssueWithID:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [FCOfflineIssueFetchOperation alloc];
  __int16 v9 = [(FCIssueDownloadService *)self context];
  id v10 = [(FCIssueDownloadService *)self ANFHelper];
  __int16 v11 = [(FCOfflineIssueFetchOperation *)v8 initWithContext:v9 ANFHelper:v10 issueID:v6];

  [(FCOperation *)v11 setQualityOfService:9];
  [(FCOfflineIssueFetchOperation *)v11 setCachedOnly:1];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__50;
  v27[4] = __Block_byref_object_dispose__50;
  id v28 = +[FCContentArchive empty];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__FCIssueDownloadService_fetchCachedIssueWithID_completionHandler___block_invoke;
  v26[3] = &unk_1E5B4C040;
  v26[4] = v27;
  [(FCOfflineIssueFetchOperation *)v11 setArchiveHandler:v26];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __67__FCIssueDownloadService_fetchCachedIssueWithID_completionHandler___block_invoke_2;
  v22 = &unk_1E5B4C068;
  id v12 = v6;
  id v23 = v12;
  id v13 = v7;
  id v24 = v13;
  v25 = v27;
  [(FCOfflineIssueFetchOperation *)v11 setFetchCompletionHandler:&v19];
  v14 = (id)FCOfflineDownloadsLog;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(FCOperation *)v11 shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    id v30 = v12;
    __int16 v31 = 2114;
    v32 = v15;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "Will check cache for issue %{public}@ with operation %{public}@", buf, 0x16u);
  }
  +[FCTaskScheduler scheduleBackgroundDownloadOperation:v11];
  v16 = v24;
  v17 = v11;

  _Block_object_dispose(v27, 8);
  return v17;
}

void __67__FCIssueDownloadService_fetchCachedIssueWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v9[1] = a2;
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  v5 = [v3 arrayWithObjects:v9 count:2];
  uint64_t v6 = +[FCContentArchive archiveWithChildArchives:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __67__FCIssueDownloadService_fetchCachedIssueWithID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"not cached";
    uint64_t v9 = *(void *)(a1 + 32);
    if (!v6) {
      v8 = @"success";
    }
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Concluded cache check for issue %{public}@ with status %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int64_t)isIssueDownloadedEnoughToRead:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FCIssueDownloadService *)self context];
  id v6 = [v5 internalContentContext];
  uint64_t v7 = [v6 issueRecordSource];
  v8 = [v7 cachedRecordWithID:v4];

  if (v8)
  {
    id v9 = v8;
    int v10 = [(FCIssueDownloadService *)self context];
    uint64_t v11 = [v10 assetManager];
    __int16 v12 = [v9 generateMetadataJSONAssetHandleWithAssetManager:v11];

    if (v12)
    {
      id v13 = [v12 dataProvider];

      if (v13)
      {
        int v14 = [v9 type];
        if (v14 == 2)
        {
          v21 = FCOfflineDownloadsLog;
          if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v32 = v4;
            _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ has unknown readability because it's a PDF issue'", buf, 0xCu);
          }
          int64_t v19 = -1;
          goto LABEL_18;
        }
        if (v14 != 1
          || ([(FCIssueDownloadService *)self articleDownloadService],
              uint64_t v15 = objc_claimAutoreleasedReturnValue(),
              [v9 coverArticleID],
              v16 = objc_claimAutoreleasedReturnValue(),
              char v17 = [v15 isArticleDownloadedEnoughToRead:v16],
              v16,
              v15,
              (v17 & 1) != 0))
        {
          v18 = FCOfflineDownloadsLog;
          if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v32 = v4;
            _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is readable", buf, 0xCu);
          }
          int64_t v19 = 1;
          goto LABEL_18;
        }
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_21;
        v23[3] = &unk_1E5B53FE0;
        id v24 = v4;
        __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_21((uint64_t)v23);
        uint64_t v20 = v24;
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_20;
        v25[3] = &unk_1E5B53FE0;
        id v26 = v4;
        __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_20((uint64_t)v25);
        uint64_t v20 = v26;
      }
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_19;
      v27[3] = &unk_1E5B53FE0;
      id v28 = v4;
      __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_19((uint64_t)v27);
      uint64_t v20 = v28;
    }

    int64_t v19 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke;
  v29[3] = &unk_1E5B53FE0;
  id v30 = v4;
  __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke((uint64_t)v29);
  int64_t v19 = 0;
  id v9 = v30;
LABEL_19:

  return v19;
}

uint64_t __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is not readable because its issue record is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_19(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is not readable because it has no metadata asset handle", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_20(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is not readable because its metadata is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __56__FCIssueDownloadService_isIssueDownloadedEnoughToRead___block_invoke_21(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Issue %{public}@ is not readable because its cover article is not readable", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCANFHelper)ANFHelper
{
  return self->_ANFHelper;
}

- (FCArticleDownloadServiceType)articleDownloadService
{
  return self->_articleDownloadService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleDownloadService, 0);
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end