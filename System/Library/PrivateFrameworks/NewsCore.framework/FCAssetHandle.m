@interface FCAssetHandle
- (BOOL)isDownloadFailureRecoverable;
- (FCAssetDataProvider)dataProvider;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (NSError)downloadError;
- (NSString)filePath;
- (NSString)uniqueKey;
- (NSURL)fileURL;
- (NSURL)remoteURL;
- (id)_downloadIfNeededWithPriority:(uint64_t)a3 flags:(void *)a4 completionQueue:(void *)a5 completion:;
- (id)downloadIfNeededWithCompletion:(id)a3;
- (id)downloadIfNeededWithCompletionQueue:(id)a3 completion:(id)a4;
- (id)downloadIfNeededWithGroup:(id)a3;
- (id)downloadIfNeededWithPriority:(int64_t)a3 completion:(id)a4;
- (id)fetchDataProviderWithCompletion:(id)a3;
- (id)fetchDataProviderWithPriority:(int64_t)a3 flags:(int64_t)a4 completion:(id)a5;
- (uint64_t)_canRetryDownload;
- (uint64_t)_revisitDownloadRequestPriorities;
- (void)dealloc;
- (void)initWithDataProvider:(void *)a1;
- (void)setDataProvider:(id)a3;
- (void)setFetchGroup:(uint64_t)a1;
- (void)setFetchOperation:(uint64_t)a1;
- (void)setHoldToken:(uint64_t)a1;
- (void)setRemoteURL:(uint64_t)a1;
@end

@implementation FCAssetHandle

- (void)setRemoteURL:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setHoldToken:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)initWithDataProvider:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCAssetHandle;
    id v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      id v6 = objc_alloc_init(MEMORY[0x1E4F81C18]);
      v7 = (void *)a1[9];
      a1[9] = v6;
    }
  }

  return a1;
}

- (NSString)uniqueKey
{
  if (self) {
    self = (FCAssetHandle *)self->_assetKey;
  }
  return (NSString *)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_rawFilePath, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_holdToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_dateOfLastDownloadAttempt, 0);
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_downloadRequests, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (FCAssetHandle *)self->_fetchOperation;
  }
  [(FCAssetHandle *)self cancel];
  -[FCAssetHandle setFetchOperation:]((uint64_t)v2, 0);
  v3.receiver = v2;
  v3.super_class = (Class)FCAssetHandle;
  [(FCAssetHandle *)&v3 dealloc];
}

- (void)setFetchOperation:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

void __64__FCAssetHandle_fetchDataProviderWithPriority_flags_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) dataProvider];
  objc_super v3 = [*(id *)(a1 + 32) downloadError];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (BOOL)isDownloadFailureRecoverable
{
  objc_super v3 = [(FCAssetHandle *)self downloadError];
  if (v3)
  {
    id v4 = [(FCAssetHandle *)self downloadError];
    int v5 = objc_msgSend(v4, "fc_isHTTPNotFoundError") ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (NSError)downloadError
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)fileURL
{
  uint64_t v2 = [(FCAssetHandle *)self filePath];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:0];
  }
  else
  {
    objc_super v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSString)filePath
{
  uint64_t v2 = [(FCAssetHandle *)self dataProvider];
  objc_super v3 = [v2 filePath];

  return (NSString *)v3;
}

- (FCAssetDataProvider)dataProvider
{
  return (FCAssetDataProvider *)objc_getProperty(self, a2, 8, 1);
}

- (id)fetchDataProviderWithPriority:(int64_t)a3 flags:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = 25;
  if (!a3) {
    uint64_t v9 = 17;
  }
  if (a3 == -1) {
    uint64_t v10 = 9;
  }
  else {
    uint64_t v10 = v9;
  }
  v11 = FCDispatchQueueForQualityOfService(v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__FCAssetHandle_fetchDataProviderWithPriority_flags_completion___block_invoke;
  v15[3] = &unk_1E5B4C7C0;
  v15[4] = self;
  id v16 = v8;
  id v12 = v8;
  v13 = -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, a3, a4, v11, v15);

  return v13;
}

- (id)_downloadIfNeededWithPriority:(uint64_t)a3 flags:(void *)a4 completionQueue:(void *)a5 completion:
{
  uint64_t v9 = a4;
  id v10 = a5;
  if (a1)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__15;
    v32 = __Block_byref_object_dispose__15;
    id v33 = 0;
    v11 = [a1 dataProvider];
    if (v11)
    {
    }
    else if (-[FCAssetHandle _canRetryDownload](a1))
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__15;
      v26 = __Block_byref_object_dispose__15;
      id v27 = 0;
      id v12 = a1[9];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke;
      v15[3] = &unk_1E5B4F338;
      v15[4] = a1;
      uint64_t v20 = a3;
      uint64_t v21 = a2;
      v18 = &v22;
      v19 = &v28;
      id v17 = v10;
      id v16 = v9;
      [v12 performWithLockSync:v15];

      [(id)v23[5] start];
      _Block_object_dispose(&v22, 8);

LABEL_8:
      id v13 = (id)v29[5];
      _Block_object_dispose(&v28, 8);

      goto LABEL_9;
    }
    if (v10) {
      dispatch_async(v9, v10);
    }
    goto LABEL_8;
  }
  id v13 = 0;
LABEL_9:

  return v13;
}

- (id)downloadIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = FCCurrentQoSOrUtilityIfMain();
  if (v5 == 9) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = v5 == 33 || v5 == 25;
  }
  v7 = FCDispatchQueueForQualityOfService(v5);
  id v8 = -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, v6, 0, v7, v4);

  return v8;
}

- (id)downloadIfNeededWithPriority:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = 25;
  if (!a3) {
    uint64_t v7 = 17;
  }
  if (a3 == -1) {
    uint64_t v8 = 9;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = FCDispatchQueueForQualityOfService(v8);
  id v10 = -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, a3, 0, v9, v6);

  return v10;
}

- (id)downloadIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = FCCurrentQoSOrUtilityIfMain();
  if (v8 == 9) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v8 == 33 || v8 == 25;
  }
  id v10 = -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, v9, 0, v7, v6);

  return v10;
}

- (uint64_t)_canRetryDownload
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 downloadError];
    objc_super v3 = v2;
    if (v2)
    {
      if ((objc_msgSend(v2, "fc_isOfflineError") & 1) != 0
        || objc_msgSend(v3, "fc_isRecoverableNetworkError"))
      {
        id v4 = +[FCNetworkReachability sharedNetworkReachability];
        uint64_t v1 = [v4 isNetworkReachable];
      }
      else if (objc_msgSend(v3, "fc_isHTTPNotFoundError"))
      {
        uint64_t v1 = 0;
      }
      else
      {
        if (!*(void *)(v1 + 56) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v10 = (void *)[[NSString alloc] initWithFormat:@"shouldn't reach this point without at least one penalized download attempt"];
          int v11 = 136315906;
          id v12 = "-[FCAssetHandle _canRetryDownload]";
          __int16 v13 = 2080;
          v14 = "FCAssetHandle.m";
          __int16 v15 = 1024;
          int v16 = 381;
          __int16 v17 = 2114;
          v18 = v10;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
        }
        id v6 = [MEMORY[0x1E4F1C9C8] date];
        objc_msgSend(v6, "timeIntervalSinceDate:", objc_getProperty((id)v1, v7, 64, 1));
        double v9 = v8;

        uint64_t v1 = v9 >= fmin(exp2((double)(unint64_t)(*(void *)(v1 + 56) - 1)) * 5.0, 60.0);
      }
    }
    else
    {
      uint64_t v1 = 1;
    }
  }
  return v1;
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) dataProvider];
  if (v2)
  {

    goto LABEL_34;
  }
  if (!-[FCAssetHandle _canRetryDownload](*(void **)(a1 + 32)))
  {
LABEL_34:
    id v27 = *(void **)(a1 + 48);
    if (v27)
    {
      uint64_t v28 = *(NSObject **)(a1 + 40);
      dispatch_async(v28, v27);
    }
    return;
  }
  objc_super v3 = *(void **)(a1 + 32);
  if (!v3 || !v3[5])
  {
    id v4 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      objc_storeStrong((id *)(v5 + 40), v4);
    }

    objc_super v3 = *(void **)(a1 + 32);
    if (!v3) {
      goto LABEL_40;
    }
  }
  if (!v3[6])
  {
    if (!v3[4]) {
      goto LABEL_12;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v30 = (void *)[[NSString alloc] initWithFormat:@"asset handle should never have a non-nil fetch operation without a fetch group"];
    *(_DWORD *)location = 136315906;
    *(void *)&location[4] = "-[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]_block_invoke";
    __int16 v38 = 2080;
    v39 = "FCAssetHandle.m";
    __int16 v40 = 1024;
    int v41 = 150;
    __int16 v42 = 2114;
    v43 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);

    objc_super v3 = *(void **)(a1 + 32);
    if (v3)
    {
LABEL_12:
      id v6 = (void *)v3[5];
      goto LABEL_13;
    }
LABEL_40:
    id v6 = 0;
LABEL_13:
    if ([v6 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)[[NSString alloc] initWithFormat:@"asset handle should never have non-zero fetch interest without a fetch operation"];
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]_block_invoke";
      __int16 v38 = 2080;
      v39 = "FCAssetHandle.m";
      __int16 v40 = 1024;
      int v41 = 151;
      __int16 v42 = 2114;
      v43 = v29;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);
    }
    dispatch_group_t v7 = dispatch_group_create();
    -[FCAssetHandle setFetchGroup:](*(void *)(a1 + 32), v7);

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      double v9 = *(NSObject **)(v8 + 48);
    }
    else {
      double v9 = 0;
    }
    dispatch_group_enter(v9);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v10 + 80));
      id v12 = *(void **)(a1 + 32);
    }
    else
    {
      id v12 = 0;
      id WeakRetained = 0;
    }
    from[1] = (id)MEMORY[0x1E4F143A8];
    from[2] = (id)3221225472;
    from[3] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_9;
    from[4] = &unk_1E5B4F250;
    from[5] = v12;
    __int16 v13 = objc_msgSend(WeakRetained, "operationToFetchDataProviderForAssetHandle:completion:");
    -[FCAssetHandle setFetchOperation:](*(void *)(a1 + 32), v13);

    if (*(void *)(a1 + 32)) {
      v14 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v14);
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setFlags:*(void *)(a1 + 72)];
  }
  __int16 v15 = objc_alloc_init(FCAssetHandleDownloadRequest);
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  __int16 v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setRelativePriority:*(void *)(a1 + 80)];
  objc_initWeak((id *)location, *(id *)(a1 + 32));
  objc_initWeak(from, *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_2;
  newValue[3] = &unk_1E5B4F2C8;
  objc_copyWeak(&v34, (id *)location);
  objc_copyWeak(&v35, from);
  uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v19) {
    objc_setProperty_nonatomic_copy(v19, v18, newValue, 16);
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_6;
  v31[3] = &unk_1E5B4F310;
  objc_copyWeak(&v32, (id *)location);
  uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v21) {
    objc_setProperty_nonatomic_copy(v21, v20, v31, 24);
  }
  uint64_t v22 = *(void **)(a1 + 32);
  if (v22) {
    uint64_t v22 = (void *)v22[5];
  }
  v23 = v22;
  [v23 addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  -[FCAssetHandle _revisitDownloadRequestPriorities](*(void *)(a1 + 32));
  uint64_t v24 = *(void **)(a1 + 48);
  if (v24)
  {
    uint64_t v25 = *(void *)(a1 + 32);
    if (v25) {
      v26 = *(NSObject **)(v25 + 48);
    }
    else {
      v26 = 0;
    }
    dispatch_group_notify(v26, *(dispatch_queue_t *)(a1 + 40), v24);
  }
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(from);
  objc_destroyWeak((id *)location);
}

- (void)setFetchGroup:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = a3;
  if (v4)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__15;
    __int16 v17 = __Block_byref_object_dispose__15;
    id v18 = 0;
    id v7 = *(id *)(v4 + 72);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__FCAssetHandle__completeFetchWithDataProvider_error___block_invoke;
    v9[3] = &unk_1E5B4F360;
    v9[4] = v4;
    id v10 = v5;
    id v11 = v6;
    id v12 = &v13;
    [v7 performWithLockSync:v9];

    uint64_t v8 = v14[5];
    if (v8) {
      dispatch_group_leave(v8);
    }

    _Block_object_dispose(&v13, 8);
  }
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_3;
  v3[3] = &unk_1E5B4F2A0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  FCPerformIfNonNil(WeakRetained, v3);

  objc_destroyWeak(&v4);
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_4;
  v5[3] = &unk_1E5B4F278;
  v5[4] = v3;
  FCPerformIfNonNil(WeakRetained, v5);
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 72);
  }
  else {
    id v5 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_5;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 performWithLockSync:v7];
}

uint64_t __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    [*(id *)(v2 + 40) removeObject:v3];
    if (![*(id *)(v2 + 40) count])
    {
      [*(id *)(v2 + 32) cancel];
      uint64_t v4 = *(void **)(v2 + 32);
      *(void *)(v2 + 32) = 0;
    }
  }

  uint64_t v5 = *(void *)(a1 + 32);
  return -[FCAssetHandle _revisitDownloadRequestPriorities](v5);
}

- (uint64_t)_revisitDownloadRequestPriorities
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(result + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      uint64_t v6 = -1;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "relativePriority", (void)v10);
          if (v6 <= v8) {
            uint64_t v6 = v8;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v6 = -1;
    }

    [*(id *)(v1 + 32) setRelativePriority:v6];
    if (v6 <= 0) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = 25;
    }
    return objc_msgSend(*(id *)(v1 + 32), "setQualityOfService:", v9, (void)v10);
  }
  return result;
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  FCPerformIfNonNil(WeakRetained, &__block_literal_global_24);
}

void __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_7(uint64_t a1, void *a2)
{
  if (a2) {
    id v2 = (void *)a2[9];
  }
  else {
    id v2 = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_8;
  v4[3] = &unk_1E5B4C018;
  v4[4] = a2;
  uint64_t v3 = a2;
  [v2 performWithLockSync:v4];
}

uint64_t __80__FCAssetHandle__downloadIfNeededWithPriority_flags_completionQueue_completion___block_invoke_8(uint64_t a1)
{
  return -[FCAssetHandle _revisitDownloadRequestPriorities](*(void *)(a1 + 32));
}

- (id)downloadIfNeededWithGroup:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = [(FCAssetHandle *)self dataProvider];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    dispatch_group_enter(v4);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__FCAssetHandle_downloadIfNeededWithGroup___block_invoke;
    v8[3] = &unk_1E5B4C018;
    uint64_t v9 = v4;
    uint64_t v6 = [(FCAssetHandle *)self downloadIfNeededWithCompletion:v8];
  }
  return v6;
}

void __43__FCAssetHandle_downloadIfNeededWithGroup___block_invoke(uint64_t a1)
{
}

- (id)fetchDataProviderWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = FCCurrentQoSOrUtilityIfMain();
  if (v5 == 9) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = v5 == 33 || v5 == 25;
  }
  id v7 = FCDispatchQueueForQualityOfService(v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__FCAssetHandle_fetchDataProviderWithCompletion___block_invoke;
  v11[3] = &unk_1E5B4C7C0;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  uint64_t v9 = -[FCAssetHandle _downloadIfNeededWithPriority:flags:completionQueue:completion:]((id *)&self->super.isa, v6, 0, v7, v11);

  return v9;
}

void __49__FCAssetHandle_fetchDataProviderWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 32) dataProvider];
    uint64_t v3 = [*(id *)(a1 + 32) downloadError];
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);
  }
}

- (FCContentArchive)contentArchive
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  id v4 = [WeakRetained contentArchiveForAssetHandle:self];

  return (FCContentArchive *)v4;
}

- (FCContentManifest)contentManifest
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [FCContentManifest alloc];
  id v4 = [(FCAssetHandle *)self remoteURL];
  v16[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  if (self) {
    id Property = objc_getProperty(self, v5, 120, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v9 = [Property wrappingKeyID];
  if (v9)
  {
    if (self) {
      id v10 = objc_getProperty(self, v8, 120, 1);
    }
    else {
      id v10 = 0;
    }
    long long v11 = [v10 wrappingKeyID];
    uint64_t v15 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    long long v13 = [(FCContentManifest *)v3 initWithAssetURLs:v6 assetWrappingKeyIDs:v12];
  }
  else
  {
    long long v13 = [(FCContentManifest *)v3 initWithAssetURLs:v6 assetWrappingKeyIDs:MEMORY[0x1E4F1CBF0]];
  }

  return v13;
}

void __54__FCAssetHandle__completeFetchWithDataProvider_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataProvider];

  if (v2) {
    return;
  }
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDataProvider:");
    id v4 = *(void **)(a1 + 32);
    if (!v4) {
      goto LABEL_25;
    }
    uint64_t v5 = 0;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "fc_isCancellationError")) {
      goto LABEL_10;
    }
    id v4 = *(void **)(a1 + 32);
    if (!v4) {
      goto LABEL_25;
    }
    uint64_t v5 = *(void **)(a1 + 48);
  }
  objc_setProperty_atomic(v4, v3, v5, 16);
LABEL_10:
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v7 = *(void **)(v6 + 48);
    goto LABEL_12;
  }
LABEL_25:
  id v7 = 0;
LABEL_12:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
  -[FCAssetHandle setFetchOperation:](*(void *)(a1 + 32), 0);
  -[FCAssetHandle setFetchGroup:](*(void *)(a1 + 32), 0);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void **)(v8 + 40);
  }
  else {
    uint64_t v9 = 0;
  }
  [v9 removeAllObjects];
  id v10 = *(void **)(a1 + 48);
  if (v10 && [v10 code] != -1009 && (objc_msgSend(*(id *)(a1 + 48), "fc_isCancellationError") & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      ++*(void *)(v11 + 56);
    }
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    long long v13 = *(void **)(a1 + 32);
    if (v13)
    {
      v14 = v12;
      objc_setProperty_atomic(v13, v12, v12, 64);
      id v12 = v14;
    }
    MEMORY[0x1F41817F8](v13, v12);
  }
}

- (void)setDataProvider:(id)a3
{
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

@end