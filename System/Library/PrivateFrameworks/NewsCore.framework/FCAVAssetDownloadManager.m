@interface FCAVAssetDownloadManager
- (FCAVAssetDownloadManager)init;
- (id)_handleAssetDownloadFromNetwork:(void *)a3 completionHandler:;
- (id)_restoreBackgroundDownloadsWithCompletionHandler:(id)a3;
- (id)downloadAsset:(void *)a3 completionHandler:;
- (id)initWithAssetCache:(void *)a3 keyCache:(void *)a4 networkReachability:;
- (id)interestTokenForCachedAsset:(id *)a1;
- (uint64_t)_isAssetInCache:(uint64_t)a1;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_callCompletionHandlersForAssetID:(void *)a3 interestToken:(void *)a4 error:;
- (void)_completeRequestForAssetID:(void *)a3 withDownloadedURL:(void *)a4 remoteURL:(void *)a5 error:;
- (void)_ensureAssetIsPurgeable:(uint64_t)a1;
- (void)restoreBackgroundDownloadsWithCompletionHandler:(uint64_t)a1;
@end

@implementation FCAVAssetDownloadManager

- (id)initWithAssetCache:(void *)a3 keyCache:(void *)a4 networkReachability:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!a1) {
    goto LABEL_7;
  }
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "networkReachability");
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCAVAssetDownloadManager initWithAssetCache:keyCache:networkReachability:]";
    __int16 v32 = 2080;
    v33 = "FCAVAssetDownloadManager.m";
    __int16 v34 = 1024;
    int v35 = 116;
    __int16 v36 = 2114;
    v37 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v29.receiver = a1;
  v29.super_class = (Class)FCAVAssetDownloadManager;
  v12 = (id *)objc_msgSendSuper2(&v29, sel_init);
  if (v12)
  {
    v13 = v12;
    objc_storeStrong(v12 + 1, a2);
    objc_storeStrong(v13 + 2, a3);
    objc_storeStrong(v13 + 3, a4);
    v14 = objc_alloc_init(FCThreadSafeMutableDictionary);
    id v15 = v13[6];
    v13[6] = v14;

    v16 = [[FCAsyncOnceOperation alloc] initWithTarget:v13 selector:sel__restoreBackgroundDownloadsWithCompletionHandler_];
    id v17 = v13[4];
    v13[4] = v16;

    id v18 = objc_alloc(MEMORY[0x1E4F81BD0]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke;
    v27[3] = &unk_1E5B4C840;
    v19 = v13;
    v28 = v19;
    uint64_t v20 = [v18 initWithConstructor:v27];
    id v21 = v19[5];
    v19[5] = (id)v20;

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke_2;
    v25[3] = &unk_1E5B4C018;
    v22 = v19;
    v26 = v22;
    +[FCTaskScheduler scheduleLowPriorityBlock:v25];
  }
  else
  {
LABEL_7:
    v22 = 0;
  }

  return v22;
}

void __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  id v4 = *(id *)(a1 + 32);
  CacheManagementEnumerateAssets();
}

- (FCAVAssetDownloadManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCAVAssetDownloadManager init]";
    __int16 v9 = 2080;
    id v10 = "FCAVAssetDownloadManager.m";
    __int16 v11 = 1024;
    int v12 = 109;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAVAssetDownloadManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

id __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F18DD0] backgroundSessionConfigurationWithIdentifier:@"com.apple.news.avasset"];
  [v2 setURLCache:0];
  [v2 setDiscretionary:0];
  objc_msgSend(v2, "set_sourceApplicationBundleIdentifier:", @"com.apple.news");
  v3 = (void *)MEMORY[0x1E4F16358];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = FCAVWorkOperationQueue();
  id v6 = [v3 sessionWithConfiguration:v2 assetDownloadDelegate:v4 delegateQueue:v5];

  return v6;
}

uint64_t __76__FCAVAssetDownloadManager_initWithAssetCache_keyCache_networkReachability___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 relativePath];
  v5 = [v4 pathExtension];
  int v6 = [v5 isEqualToString:@"movpkg"];

  if (v6) {
    -[FCAVAssetDownloadManager _ensureAssetIsPurgeable:](*(void *)(a1 + 32), v3);
  }

  return 1;
}

- (void)_ensureAssetIsPurgeable:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && [v3 priority] != 3)
  {
    [v3 setPriority:3];
    [v3 commit];
  }
}

- (void)restoreBackgroundDownloadsWithCompletionHandler:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = dispatch_get_global_queue(9, 0);
    id v5 = (id)[v3 executeWithCallbackQueue:v4 completionHandler:v6];
  }
}

- (id)interestTokenForCachedAsset:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v4 = a1[1];
    id v5 = a2;
    id v6 = [v5 identifier];
    v7 = [v4 interestTokenForAssetIdentifier:v6];

    id v8 = [v5 identifier];

    if (-[FCAVAssetDownloadManager _isAssetInCache:]((uint64_t)v2, v8)) {
      __int16 v9 = v7;
    }
    else {
      __int16 v9 = 0;
    }
    v2 = v9;
  }
  return v2;
}

- (uint64_t)_isAssetInCache:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 8) containsAssetWithIdentifier:v3])
    {
      id v4 = [*(id *)(a1 + 8) contentKeyIdentifiersForAssetIdentifier:v3];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_34;
      v11[3] = &unk_1E5B4DBB0;
      v11[4] = a1;
      id v5 = objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v11);
      if ([v5 count])
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_2;
        v8[3] = &unk_1E5B4C0B8;
        id v9 = v3;
        id v10 = v5;
        uint64_t v6 = __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_2((uint64_t)v8);
      }
      else
      {
        uint64_t v6 = 1;
      }
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke;
      v12[3] = &unk_1E5B4C090;
      id v13 = v3;
      __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke((uint64_t)v12);
      uint64_t v6 = 0;
      id v4 = v13;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)downloadAsset:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = -[FCAVAssetDownloadManager interestTokenForCachedAsset:](a1, v5);
    if (v7)
    {
      id v10 = (void (**)(id, id, void))v6;
      id v9 = v7;
      v10[2](v10, v9, 0);

      a1 = 0;
    }
    else
    {
      -[FCAVAssetDownloadManager _handleAssetDownloadFromNetwork:completionHandler:](a1, v5, v6);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

uint64_t __60__FCAVAssetDownloadManager_downloadAsset_completionHandler___block_invoke(uint64_t a1)
{
  return 0;
}

- (id)_handleAssetDownloadFromNetwork:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__44;
    v26 = __Block_byref_object_dispose__44;
    id v27 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__37;
    uint64_t v20 = __Block_byref_object_dispose__38;
    id v21 = 0;
    id v7 = a1[6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke;
    v10[3] = &unk_1E5B56838;
    id v11 = v5;
    v14 = &v22;
    int v12 = a1;
    id v13 = v6;
    uint64_t v15 = &v16;
    [v7 readWriteWithAccessor:v10];

    uint64_t v8 = v17[5];
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
    a1 = (id *)(id)v23[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  return a1;
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F567C8];
  id v9 = a5;
  id v10 = [v9 path];
  id v11 = [MEMORY[0x1E4F28B50] mainBundle];
  int v12 = [v11 bundleIdentifier];
  id v13 = [v8 assetFromPath:v10 withIdentifier:v12];

  -[FCAVAssetDownloadManager _ensureAssetIsPurgeable:]((uint64_t)self, v13);
  v14 = [v7 taskDescription];

  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    id v19 = [NSString alloc];
    uint64_t v20 = [v7 description];
    id v21 = (void *)[v19 initWithFormat:@"AVAssetDownloadTask %@ is missing a task description", v20];
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCAVAssetDownloadManager URLSession:assetDownloadTask:didFinishDownloadingToURL:]";
    __int16 v24 = 2080;
    v25 = "FCAVAssetDownloadManager.m";
    __int16 v26 = 1024;
    int v27 = 201;
    __int16 v28 = 2114;
    objc_super v29 = v21;
    _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTaskDescription) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v15 = [v7 taskDescription];
  uint64_t v16 = [v7 URLAsset];
  id v17 = [v16 URL];
  uint64_t v18 = [v7 error];
  -[FCAVAssetDownloadManager _completeRequestForAssetID:withDownloadedURL:remoteURL:error:]((uint64_t)self, v15, v9, v17, v18);
}

- (void)_completeRequestForAssetID:(void *)a3 withDownloadedURL:(void *)a4 remoteURL:(void *)a5 error:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (a1 && v9)
  {
    if (v12)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_2;
      v33[3] = &unk_1E5B4C738;
      id v34 = v9;
      id v35 = v13;
      uint64_t v36 = a1;
      __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_2((uint64_t)v33);

      v14 = v34;
LABEL_14:

      goto LABEL_15;
    }
    id v15 = *(id *)(a1 + 8);
    uint64_t v16 = [v15 interestTokenForAssetIdentifier:v9];

    id v17 = [v10 pathExtension];
    uint64_t v18 = [v11 pathExtension];
    if (([v18 isEqualToString:@"m3u8"] & 1) == 0)
    {
      id v19 = [v11 pathExtension];
      char v20 = [v19 isEqualToString:@"m3u"];

      if (v20)
      {
LABEL_9:
        id v21 = FCAVAssetLog;
        if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v9;
          _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "AV asset download succeeded for assetID=%{public}@", (uint8_t *)&buf, 0xCu);
        }
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F166C8]) initWithURL:v10 options:0];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_51;
        v26[3] = &unk_1E5B56860;
        id v27 = v9;
        uint64_t v28 = a1;
        id v29 = v10;
        id v30 = v11;
        id v31 = v17;
        id v32 = v16;
        id v22 = v16;
        id v23 = v17;
        __int16 v24 = v26;
        v25 = v24;
        if (v14)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          uint64_t v38 = __78__AVURLAsset_FCAdditions__fc_fetchContentKeyIdentifiersWithCompletionHandler___block_invoke;
          v39 = &unk_1E5B4CC80;
          v40 = v14;
          v41 = v24;
          [v14 loadValuesAsynchronouslyForKeys:&unk_1EF8D8B98 completionHandler:&buf];
        }
        goto LABEL_14;
      }
      [v11 pathExtension];
      id v17 = v18 = v17;
    }

    goto LABEL_9;
  }
LABEL_15:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = FCCheckedDynamicCast(v9, (uint64_t)v8);

    id v11 = [v10 taskDescription];

    if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      id v15 = [NSString alloc];
      uint64_t v16 = [v10 description];
      id v17 = (void *)[v15 initWithFormat:@"AVAssetDownloadTask %@ is missing a task description", v16];
      *(_DWORD *)long long buf = 136315906;
      id v19 = "-[FCAVAssetDownloadManager URLSession:task:didCompleteWithError:]";
      __int16 v20 = 2080;
      id v21 = "FCAVAssetDownloadManager.m";
      __int16 v22 = 1024;
      int v23 = 214;
      __int16 v24 = 2114;
      v25 = v17;
      _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTaskDescription) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v12 = [v10 taskDescription];
    id v13 = [v10 URLAsset];
    v14 = [v13 URL];
    -[FCAVAssetDownloadManager _completeRequestForAssetID:withDownloadedURL:remoteURL:error:]((uint64_t)self, v12, 0, v14, v7);
  }
}

uint64_t __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "AV asset does not have its content in the cache assetID=%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

BOOL __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    uint64_t v3 = (void *)v3[2];
  }
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  int v5 = v3;
  uint64_t v6 = [v4 URLWithString:a2];
  uint64_t v7 = [v5 assetKeyForURI:v6];

  return v7 == 0;
}

uint64_t __44__FCAVAssetDownloadManager__isAssetInCache___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "AV asset does not have all its keys in the cache assetID=%{public}@, missing=%{public}@", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

void __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  int v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_2;
    v57[3] = &unk_1E5B567E8;
    uint64_t v60 = *(void *)(a1 + 56);
    id v58 = v5;
    id v59 = *(id *)(a1 + 48);
    __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_2((uint64_t)v57);

    int v6 = v58;
  }
  else
  {
    int v6 = [*(id *)(a1 + 32) asset];
    if (*(void *)(a1 + 40) && -[FCAVAsset isHLS](*(void *)(a1 + 32)))
    {
      uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
      __int16 v8 = [v7 bundleIdentifier];
      char v9 = [v8 isEqualToString:@"com.apple.news"];

      if ((v9 & 1) == 0)
      {
        container_query_create();
        container_query_set_class();
        container_query_operation_set_flags();
        container_query_set_persona_unique_string();
        if (container_query_count_results() != 1)
        {
          container_query_get_last_error();
          uint64_t v10 = (void *)container_error_copy_unlocalized_description();
          id v11 = FCAVAssetLog;
          if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315138;
            v62 = v10;
            _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "Failed to create app container for AV asset downloads with error: %s", buf, 0xCu);
          }
          free(v10);
        }
        container_query_free();
      }
      id v12 = *(void **)(a1 + 40);
      if (v12) {
        id v12 = (void *)v12[5];
      }
      id v13 = v12;
      v14 = [v13 value];
      id v15 = [*(id *)(a1 + 32) identifier];
      uint64_t v16 = [v14 assetDownloadTaskWithURLAsset:v6 assetTitle:v15 assetArtworkData:0 options:0];

      id v17 = [*(id *)(a1 + 32) identifier];
      [v16 setTaskDescription:v17];

      uint64_t v18 = [FCAVAssetDownload alloc];
      id v19 = [*(id *)(a1 + 32) identifier];
      __int16 v20 = -[FCAVAssetDownload initWithAssetID:underlyingOperation:]((id *)&v18->super.isa, v19, v16);
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      __int16 v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_3;
      aBlock[3] = &unk_1E5B4C018;
      v56 = v16;
      int v23 = v16;
      __int16 v24 = _Block_copy(aBlock);
      uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      id v27 = v56;
    }
    else
    {
      uint64_t v28 = [FCAssetDownloadOperation alloc];
      uint64_t v29 = *(void *)(a1 + 40);
      if (v29) {
        uint64_t v30 = *(void *)(v29 + 24);
      }
      else {
        uint64_t v30 = 0;
      }
      id v31 = [(FCAssetDownloadOperation *)v28 initWithNetworkReachability:v30];
      id v32 = [v6 URL];
      [(FCAssetDownloadOperation *)v31 setURL:v32];

      [(FCAssetDownloadOperation *)v31 setDownloadDestination:0];
      v33 = [*(id *)(a1 + 32) identifier];
      [(FCAssetDownloadOperation *)v31 setLoggingKey:v33];

      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_4;
      v52[3] = &unk_1E5B56810;
      int8x16_t v49 = *(int8x16_t *)(a1 + 32);
      id v34 = (id)v49.i64[0];
      int8x16_t v53 = vextq_s8(v49, v49, 8uLL);
      id v54 = v6;
      [(FCAssetDownloadOperation *)v31 setFileDownloadCompletionHandler:v52];
      id v35 = [FCAVAssetDownload alloc];
      uint64_t v36 = [*(id *)(a1 + 32) identifier];
      v37 = -[FCAVAssetDownload initWithAssetID:underlyingOperation:]((id *)&v35->super.isa, v36, v31);
      uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8);
      v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = v37;

      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_5;
      v50[3] = &unk_1E5B4C018;
      v51 = v31;
      int v23 = v31;
      v40 = _Block_copy(v50);
      uint64_t v41 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v42 = *(void **)(v41 + 40);
      *(void *)(v41 + 40) = v40;

      id v27 = (void *)v53.i64[1];
    }

    v43 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v43) {
      v43 = (void *)v43[3];
    }
    v44 = *(const void **)(a1 + 48);
    v45 = v43;
    v46 = _Block_copy(v44);
    objc_msgSend(v45, "fc_safelyAddObject:", v46);

    uint64_t v47 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v48 = [*(id *)(a1 + 32) identifier];
    [v3 setObject:v47 forKeyedSubscript:v48];
  }
}

void __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2) {
    v2 = (void *)v2[3];
  }
  id v3 = *(const void **)(a1 + 40);
  uint64_t v4 = v2;
  id v5 = _Block_copy(v3);
  objc_msgSend(v4, "fc_safelyAddObject:", v5);
}

uint64_t __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) resume];
}

void __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v8 = a4;
  id v9 = a2;
  id v11 = [v7 identifier];
  uint64_t v10 = [*(id *)(a1 + 48) URL];
  -[FCAVAssetDownloadManager _completeRequestForAssetID:withDownloadedURL:remoteURL:error:](v6, v11, v9, v10, v8);
}

void __78__FCAVAssetDownloadManager__handleAssetDownloadFromNetwork_completionHandler___block_invoke_5(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addOperation:*(void *)(a1 + 32)];
}

void __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "AV asset download failed for assetID=%{public}@ with error=%{public}@", (uint8_t *)&v5, 0x16u);
  }
  -[FCAVAssetDownloadManager _callCompletionHandlersForAssetID:interestToken:error:](*(void *)(a1 + 48), *(void **)(a1 + 32), 0, *(void **)(a1 + 40));
}

- (void)_callCompletionHandlersForAssetID:(void *)a3 interestToken:(void *)a4 error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v22 = 0;
    int v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__44;
    uint64_t v26 = __Block_byref_object_dispose__44;
    id v27 = 0;
    id v10 = *(id *)(a1 + 48);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__FCAVAssetDownloadManager__callCompletionHandlersForAssetID_interestToken_error___block_invoke;
    v19[3] = &unk_1E5B511E8;
    uint64_t v21 = &v22;
    id v20 = v7;
    [v10 readWriteWithAccessor:v19];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v11 = (id)v23[5];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v14));
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
      }
      while (v12);
    }

    _Block_object_dispose(&v22, 8);
  }
}

void __89__FCAVAssetDownloadManager__completeRequestForAssetID_withDownloadedURL_remoteURL_error___block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "AV asset download will save assetID=%{public}@ with keyIdentifiers=%{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    id v7 = *(void **)(v6 + 8);
  }
  else {
    id v7 = 0;
  }
  [v7 adoptFileAtURL:*(void *)(a1 + 48) forAssetIdentifier:*(void *)(a1 + 32) remoteURL:*(void *)(a1 + 56) contentKeyIdentifiers:v3 extension:*(void *)(a1 + 64)];
  -[FCAVAssetDownloadManager _callCompletionHandlersForAssetID:interestToken:error:](*(void *)(a1 + 40), *(void **)(a1 + 32), *(void **)(a1 + 72), 0);
}

void __82__FCAVAssetDownloadManager__callCompletionHandlersForAssetID_interestToken_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v11 = a2;
  uint64_t v4 = [v11 objectForKeyedSubscript:v3];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = *(void **)(v4 + 24);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v7 copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [v11 removeObjectForKey:*(void *)(a1 + 32)];
}

- (id)_restoreBackgroundDownloadsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "AV asset download manager will look for background downloads to restore", buf, 2u);
  }
  if (self) {
    URLSession = self->_URLSession;
  }
  else {
    URLSession = 0;
  }
  id v7 = URLSession;
  uint64_t v8 = [(NFLazy *)v7 value];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __77__FCAVAssetDownloadManager__restoreBackgroundDownloadsWithCompletionHandler___block_invoke;
  long long v16 = &unk_1E5B56888;
  long long v17 = self;

  id v18 = v4;
  id v9 = v4;
  [v8 getAllTasksWithCompletionHandler:&v13];

  __int16 v10 = [FCPseudoOperation alloc];
  id v11 = -[FCPseudoOperation initWithCancelBlock:priorityBlock:](v10, "initWithCancelBlock:priorityBlock:", 0, 0, v13, v14, v15, v16, v17);

  return v11;
}

void __77__FCAVAssetDownloadManager__restoreBackgroundDownloadsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (os_log_t *)&FCAVAssetLog;
  uint64_t v5 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    *(_DWORD *)long long buf = 134217984;
    uint64_t v31 = [v3 count];
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "AV asset download manager found %lu background downloads to restore", buf, 0xCu);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        objc_opt_class();
        if (v12 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          id v13 = v12;
          uint64_t v14 = [v13 taskDescription];

          if (v14)
          {
            os_log_t v15 = *v4;
            if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = v15;
              [v13 taskDescription];
              uint64_t v17 = a1;
              v19 = id v18 = v4;
              *(_DWORD *)long long buf = 138543362;
              uint64_t v31 = (uint64_t)v19;
              _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "AV asset download manager will restore background download for asset ID %{public}@", buf, 0xCu);

              id v4 = v18;
              a1 = v17;
            }
            uint64_t v20 = *(void *)(a1 + 32);
            if (v20) {
              uint64_t v21 = *(void **)(v20 + 48);
            }
            else {
              uint64_t v21 = 0;
            }
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __77__FCAVAssetDownloadManager__restoreBackgroundDownloadsWithCompletionHandler___block_invoke_53;
            v23[3] = &unk_1E5B4BF78;
            id v13 = v13;
            id v24 = v13;
            [v21 readWriteWithAccessor:v23];
          }
        }
        else
        {
          id v13 = 0;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v22 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v9 = v22;
    }
    while (v22);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__FCAVAssetDownloadManager__restoreBackgroundDownloadsWithCompletionHandler___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [FCAVAssetDownload alloc];
  id v7 = [*(id *)(a1 + 32) taskDescription];
  uint64_t v5 = -[FCAVAssetDownload initWithAssetID:underlyingOperation:]((id *)&v4->super.isa, v7, *(void **)(a1 + 32));
  uint64_t v6 = [*(id *)(a1 + 32) taskDescription];
  [v3 setObject:v5 forKeyedSubscript:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDownloadsByAssetID, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_restoreBackgroundDownloadsOnce, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_keyCache, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
}

@end