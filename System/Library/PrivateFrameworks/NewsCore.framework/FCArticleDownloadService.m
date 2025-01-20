@interface FCArticleDownloadService
- (BOOL)isArticleDownloadedEnoughToListen:(id)a3;
- (BOOL)isArticleDownloadedEnoughToRead:(id)a3;
- (FCANFHelper)ANFHelper;
- (FCArticleDownloadService)init;
- (FCArticleDownloadService)initWithContext:(id)a3 ANFHelper:(id)a4;
- (FCContentContext)context;
- (id)fetchCachedArticleWithID:(id)a3 completionHandler:(id)a4;
- (id)fetchCachedAudioWithArticleID:(id)a3 completionHandler:(id)a4;
@end

@implementation FCArticleDownloadService

- (FCArticleDownloadService)initWithContext:(id)a3 ANFHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCArticleDownloadService;
  v9 = [(FCArticleDownloadService *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_ANFHelper, a4);
  }

  return v10;
}

- (FCArticleDownloadService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCArticleDownloadService init]";
    __int16 v9 = 2080;
    v10 = "FCArticleDownloadService.m";
    __int16 v11 = 1024;
    int v12 = 44;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCArticleDownloadService init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)fetchCachedArticleWithID:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [FCOfflineArticleFetchOperation alloc];
  __int16 v9 = [(FCArticleDownloadService *)self context];
  v10 = [(FCArticleDownloadService *)self ANFHelper];
  __int16 v11 = [(FCOfflineArticleFetchOperation *)v8 initWithContext:v9 ANFHelper:v10 articleID:v6];

  [(FCOperation *)v11 setQualityOfService:9];
  [(FCOfflineArticleFetchOperation *)v11 setQueuePriority:0];
  [(FCOfflineArticleFetchOperation *)v11 setCachedOnly:1];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__37;
  v27[4] = __Block_byref_object_dispose__37;
  id v28 = +[FCContentArchive empty];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __71__FCArticleDownloadService_fetchCachedArticleWithID_completionHandler___block_invoke;
  v26[3] = &unk_1E5B4C040;
  v26[4] = v27;
  [(FCOfflineArticleFetchOperation *)v11 setArchiveHandler:v26];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __71__FCArticleDownloadService_fetchCachedArticleWithID_completionHandler___block_invoke_2;
  v22 = &unk_1E5B4C068;
  id v12 = v6;
  id v23 = v12;
  id v13 = v7;
  id v24 = v13;
  v25 = v27;
  [(FCOfflineArticleFetchOperation *)v11 setFetchCompletionHandler:&v19];
  v14 = (id)FCOfflineDownloadsLog;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(FCOperation *)v11 shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    id v30 = v12;
    __int16 v31 = 2114;
    v32 = v15;
    _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "Will check cache for article %{public}@ with operation %{public}@", buf, 0x16u);
  }
  +[FCTaskScheduler scheduleBackgroundDownloadOperation:v11];
  v16 = v24;
  v17 = v11;

  _Block_object_dispose(v27, 8);
  return v17;
}

void __71__FCArticleDownloadService_fetchCachedArticleWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v9[1] = a2;
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  v5 = [v3 arrayWithObjects:v9 count:2];
  uint64_t v6 = +[FCContentArchive archiveWithChildArchives:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __71__FCArticleDownloadService_fetchCachedArticleWithID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"not cached";
    uint64_t v9 = *(void *)(a1 + 32);
    if (!v6) {
      id v8 = @"success";
    }
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Concluded cache check for article %{public}@ with status %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)fetchCachedAudioWithArticleID:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [FCOfflineAudioFetchOperation alloc];
  uint64_t v9 = [(FCArticleDownloadService *)self context];
  int v10 = [(FCOfflineAudioFetchOperation *)v8 initWithContext:v9 articleID:v6];

  [(FCOperation *)v10 setQualityOfService:9];
  [(FCOfflineAudioFetchOperation *)v10 setQueuePriority:0];
  [(FCOfflineAudioFetchOperation *)v10 setCachedOnly:1];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__37;
  v26[4] = __Block_byref_object_dispose__37;
  id v27 = +[FCContentArchive empty];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__FCArticleDownloadService_fetchCachedAudioWithArticleID_completionHandler___block_invoke;
  v25[3] = &unk_1E5B4C040;
  v25[4] = v26;
  [(FCOfflineAudioFetchOperation *)v10 setArchiveHandler:v25];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __76__FCArticleDownloadService_fetchCachedAudioWithArticleID_completionHandler___block_invoke_2;
  v21 = &unk_1E5B4C068;
  id v11 = v6;
  id v22 = v11;
  id v12 = v7;
  id v23 = v12;
  id v24 = v26;
  [(FCOfflineAudioFetchOperation *)v10 setFetchCompletionHandler:&v18];
  id v13 = (id)FCOfflineDownloadsLog;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(FCOperation *)v10 shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    id v29 = v11;
    __int16 v30 = 2114;
    __int16 v31 = v14;
    _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Will check cache for audio %{public}@ with operation %{public}@", buf, 0x16u);
  }
  +[FCTaskScheduler scheduleBackgroundDownloadOperation:v10];
  uint64_t v15 = v23;
  v16 = v10;

  _Block_object_dispose(v26, 8);
  return v16;
}

void __76__FCArticleDownloadService_fetchCachedAudioWithArticleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v9[1] = a2;
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:v9 count:2];
  uint64_t v6 = +[FCContentArchive archiveWithChildArchives:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __76__FCArticleDownloadService_fetchCachedAudioWithArticleID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"not cached";
    uint64_t v9 = *(void *)(a1 + 32);
    if (!v6) {
      id v8 = @"success";
    }
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Concluded cache check for audio %{public}@ with status %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isArticleDownloadedEnoughToRead:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FCArticleDownloadService *)self context];
  id v6 = [v5 internalContentContext];
  uint64_t v7 = [v6 articleRecordSource];
  id v8 = [v7 cachedRecordWithID:v4];

  if (v8)
  {
    id v9 = v8;
    int v10 = [FCArticleContent alloc];
    uint64_t v11 = [(FCArticleDownloadService *)self context];
    __int16 v12 = [(FCArticleContent *)v10 initWithContext:v11 articleRecord:v9];

    if (v12)
    {
      id v13 = [(FCArticleContent *)v12 anfContent];
      if (v13)
      {
        id v14 = v13;
        if ([v14 isANFDocumentCached])
        {
          uint64_t v15 = FCOfflineDownloadsLog;
          if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v28 = v4;
            _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is readable", buf, 0xCu);
          }
          char v16 = 1;
        }
        else
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_23;
          v18[3] = &unk_1E5B4C0B8;
          id v19 = v4;
          id v20 = v14;
          char v16 = __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_23((uint64_t)v18);
        }
      }
      else
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_22;
        v21[3] = &unk_1E5B4C090;
        id v22 = v4;
        __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_22((uint64_t)v21);

        id v14 = 0;
        char v16 = 0;
      }
    }
    else
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_21;
      v23[3] = &unk_1E5B4C090;
      id v24 = v4;
      __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_21((uint64_t)v23);
      char v16 = 0;
      id v14 = v24;
    }
  }
  else
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke;
    v25[3] = &unk_1E5B4C090;
    id v26 = v4;
    __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke((uint64_t)v25);
    char v16 = 0;
    id v9 = v26;
  }

  return v16;
}

uint64_t __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not readable because its article record is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_21(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not readable because it has an unknown content type", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_22(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not readable because it is not ANF", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __60__FCArticleDownloadService_isArticleDownloadedEnoughToRead___block_invoke_23(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = v2;
    uint64_t v6 = [v3 anfDocumentAssetHandles];
    uint64_t v7 = [v6 firstObject];
    id v8 = [v7 uniqueKey];
    int v10 = 138543618;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not readable because its ANF document is not cached, document=%{public}@", (uint8_t *)&v10, 0x16u);
  }
  return 0;
}

- (BOOL)isArticleDownloadedEnoughToListen:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(FCArticleDownloadService *)self context];
  uint64_t v6 = [v5 internalContentContext];
  uint64_t v7 = [v6 articleRecordSource];
  id v8 = [v7 cachedRecordWithID:v4];

  if (v8)
  {
    id v9 = [v8 narrativeTrackFullIdentifier];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = [(FCArticleDownloadService *)self context];
      __int16 v12 = [v11 internalContentContext];
      uint64_t v13 = [v12 avAssetDownloadManager];
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        char v15 = -[FCAVAssetDownloadManager _isAssetInCache:](v13, v10);

        if (v15)
        {
          char v16 = FCOfflineDownloadsLog;
          if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v26 = v4;
            _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is listenable", buf, 0xCu);
          }
          BOOL v17 = 1;
          goto LABEL_12;
        }
      }
      else
      {
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_25;
      v19[3] = &unk_1E5B4C090;
      id v20 = v10;
      __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_25((uint64_t)v19);

      BOOL v17 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_24;
    v21[3] = &unk_1E5B4C090;
    id v22 = v4;
    __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_24((uint64_t)v21);

    id v10 = 0;
    BOOL v17 = 0;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke;
    v23[3] = &unk_1E5B4C090;
    id v24 = v4;
    __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke((uint64_t)v23);
    BOOL v17 = 0;
    id v10 = v24;
  }
LABEL_13:

  return v17;
}

uint64_t __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not listenable because its article record is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_24(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not listenable because it has no narrative track", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __62__FCArticleDownloadService_isArticleDownloadedEnoughToListen___block_invoke_25(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Article %{public}@ is not listenable because its narrative track is not cached", (uint8_t *)&v5, 0xCu);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ANFHelper, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end