@interface FCPuzzleDownloadService
- (BOOL)isPuzzleDownloadedEnoughToUse:(id)a3;
- (FCContentContext)context;
- (FCPuzzleDownloadService)init;
- (FCPuzzleDownloadService)initWithContext:(id)a3;
- (id)fetchCachedPuzzleWithID:(id)a3 completionHandler:(id)a4;
@end

@implementation FCPuzzleDownloadService

- (FCPuzzleDownloadService)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPuzzleDownloadService;
  v6 = [(FCPuzzleDownloadService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (FCPuzzleDownloadService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPuzzleDownloadService init]";
    __int16 v9 = 2080;
    v10 = "FCPuzzleDownloadService.m";
    __int16 v11 = 1024;
    int v12 = 37;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPuzzleDownloadService init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)fetchCachedPuzzleWithID:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [FCOfflinePuzzleFetchOperation alloc];
  __int16 v9 = [(FCPuzzleDownloadService *)self context];
  v10 = [(FCOfflinePuzzleFetchOperation *)v8 initWithContext:v9 puzzleID:v6];

  [(FCOperation *)v10 setQualityOfService:9];
  [(FCOfflinePuzzleFetchOperation *)v10 setCachedOnly:1];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  id v27 = +[FCContentArchive empty];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69__FCPuzzleDownloadService_fetchCachedPuzzleWithID_completionHandler___block_invoke;
  v25[3] = &unk_1E5B4C040;
  v25[4] = v26;
  [(FCOfflinePuzzleFetchOperation *)v10 setArchiveHandler:v25];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __69__FCPuzzleDownloadService_fetchCachedPuzzleWithID_completionHandler___block_invoke_2;
  v21 = &unk_1E5B4C068;
  id v11 = v6;
  id v22 = v11;
  id v12 = v7;
  id v23 = v12;
  v24 = v26;
  [(FCOfflinePuzzleFetchOperation *)v10 setFetchCompletionHandler:&v18];
  __int16 v13 = (id)FCOfflineDownloadsLog;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(FCOperation *)v10 shortOperationDescription];
    *(_DWORD *)buf = 138543618;
    id v29 = v11;
    __int16 v30 = 2114;
    v31 = v14;
    _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Will check cache for puzzle %{public}@ with operation %{public}@", buf, 0x16u);
  }
  +[FCTaskScheduler scheduleBackgroundDownloadOperation:v10];
  uint64_t v15 = v23;
  v16 = v10;

  _Block_object_dispose(v26, 8);
  return v16;
}

void __69__FCPuzzleDownloadService_fetchCachedPuzzleWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v9[1] = a2;
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:v9 count:2];
  uint64_t v6 = +[FCContentArchive archiveWithChildArchives:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __69__FCPuzzleDownloadService_fetchCachedPuzzleWithID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    __int16 v13 = v8;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Concluded cache check for puzzle %{public}@ with status %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isPuzzleDownloadedEnoughToUse:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(FCPuzzleDownloadService *)self context];
  id v6 = [v5 internalContentContext];
  uint64_t v7 = [v6 puzzleRecordSource];
  v8 = [v7 cachedRecordWithID:v4];

  if (v8)
  {
    id v9 = v8;
    int v10 = [(FCPuzzleDownloadService *)self context];
    uint64_t v11 = [v10 internalContentContext];
    __int16 v12 = [v11 puzzleTypeRecordSource];
    __int16 v13 = [v9 puzzleTypeID];
    uint64_t v14 = [v12 cachedRecordWithID:v13];

    if (!v14)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_19;
      v43[3] = &unk_1E5B4C0B8;
      id v44 = v4;
      id v45 = v9;
      char v27 = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_19((uint64_t)v43);

      id v15 = v44;
LABEL_19:

      goto LABEL_20;
    }
    id v15 = v14;
    v16 = [(FCPuzzleDownloadService *)self context];
    v17 = [v16 flintResourceManager];
    uint64_t v18 = [v9 dataResourceID];
    uint64_t v19 = [v17 cachedResourceWithIdentifier:v18];

    __int16 v30 = v19;
    if (!v19)
    {
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_20;
      v40[3] = &unk_1E5B4C0B8;
      id v41 = v4;
      id v42 = v9;
      char v27 = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_20((uint64_t)v40);

      id v20 = v41;
LABEL_18:

      goto LABEL_19;
    }
    id v20 = v19;
    v21 = [(FCPuzzleDownloadService *)self context];
    id v22 = [v21 flintResourceManager];
    id v23 = [v15 engineResourceID];
    v24 = [v22 cachedResourceWithIdentifier:v23];

    if (v24)
    {
      id v25 = v24;
      if ([v20 isOnDisk])
      {
        if ([v25 isOnDisk])
        {
          v26 = FCOfflineDownloadsLog;
          if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v49 = v4;
            _os_log_impl(&dword_1A460D000, v26, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is usable", buf, 0xCu);
          }
          char v27 = 1;
          goto LABEL_17;
        }
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_23;
        v31[3] = &unk_1E5B4C0B8;
        id v32 = v4;
        id v33 = v25;
        char v27 = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_23((uint64_t)v31);

        v28 = v32;
      }
      else
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_22;
        v34[3] = &unk_1E5B4C0B8;
        id v35 = v4;
        id v36 = v20;
        char v27 = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_22((uint64_t)v34);

        v28 = v35;
      }
    }
    else
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_21;
      v37[3] = &unk_1E5B4C0B8;
      id v38 = v4;
      id v39 = v15;
      char v27 = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_21((uint64_t)v37);

      id v25 = v38;
    }
LABEL_17:

    goto LABEL_18;
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke;
  v46[3] = &unk_1E5B4C090;
  id v47 = v4;
  __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke((uint64_t)v46);
  char v27 = 0;
  id v9 = v47;
LABEL_20:

  return v27;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its puzzle record is not cached", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_19(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = v2;
    uint64_t v6 = [v3 puzzleTypeID];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its puzzle type record is not cached, type=%{public}@", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_20(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = v2;
    uint64_t v6 = [v3 dataResourceID];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its data resource is not cached, resource=%{public}@", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_21(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = v2;
    uint64_t v6 = [v3 engineResourceID];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its engine resource is not cached, resource=%{public}@", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_22(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = v2;
    uint64_t v6 = [v3 assetHandle];
    uint64_t v7 = [v6 uniqueKey];
    int v9 = 138543618;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its data asset is not cached, asset=%{public}@", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

uint64_t __57__FCPuzzleDownloadService_isPuzzleDownloadedEnoughToUse___block_invoke_23(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCOfflineDownloadsLog;
  if (os_log_type_enabled((os_log_t)FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = v2;
    uint64_t v6 = [v3 assetHandle];
    uint64_t v7 = [v6 uniqueKey];
    int v9 = 138543618;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Puzzle %{public}@ is not usable because its engine asset is not cached, asset=%{public}@", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

- (FCContentContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end