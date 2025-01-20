@interface FCResourceArchiveFetchOperation
- (BOOL)validateOperation;
- (FCResourceArchiveFetchOperation)initWithArchiveURL:(id)a3 context:(id)a4;
- (id)archiveHandler;
- (id)fetchCompletionHandler;
- (id)interestTokenHandler;
- (id)progressHandler;
- (unint64_t)maxConcurrentFetchCount;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setArchiveHandler:(id)a3;
- (void)setDownloadTask:(uint64_t)a1;
- (void)setFetchCompletionHandler:(id)a3;
- (void)setInterestTokenHandler:(id)a3;
- (void)setMaxConcurrentFetchCount:(unint64_t)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation FCResourceArchiveFetchOperation

- (FCResourceArchiveFetchOperation)initWithArchiveURL:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCResourceArchiveFetchOperation;
  v8 = [(FCOperation *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    archiveURL = v8->_archiveURL;
    v8->_archiveURL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self && self->_archiveURL)
  {
    char v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)[[NSString alloc] initWithFormat:@"resource archive fetch operation requires a URL"];
      int v8 = 136315906;
      uint64_t v9 = "-[FCResourceArchiveFetchOperation validateOperation]";
      __int16 v10 = 2080;
      v11 = "FCResourceArchiveFetchOperation.m";
      __int16 v12 = 1024;
      int v13 = 81;
      __int16 v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
    }
    char v3 = 0;
    if (!self) {
      goto LABEL_9;
    }
  }
  if (self->_context)
  {
    char v4 = 1;
    return v4 & v3;
  }
LABEL_9:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"resource archive fetch operation requires a context"];
    int v8 = 136315906;
    uint64_t v9 = "-[FCResourceArchiveFetchOperation validateOperation]";
    __int16 v10 = 2080;
    v11 = "FCResourceArchiveFetchOperation.m";
    __int16 v12 = 1024;
    int v13 = 85;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  char v4 = 0;
  return v4 & v3;
}

- (void)performOperation
{
  if (self) {
    archiveURL = self->_archiveURL;
  }
  else {
    archiveURL = 0;
  }
  char v4 = [MEMORY[0x1E4F18D50] requestWithURL:archiveURL];
  FCOperationFlagsApplyToURLRequest([(FCOperation *)self flags], v4);
  v5 = [MEMORY[0x1E4F18DC0] sharedSession];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__FCResourceArchiveFetchOperation_performOperation__block_invoke;
  v11[3] = &unk_1E5B507D8;
  v11[4] = self;
  id v6 = [v5 downloadTaskWithRequest:v4 completionHandler:v11];
  -[FCResourceArchiveFetchOperation setDownloadTask:]((uint64_t)self, v6);

  if (self) {
    downloadTask = self->_downloadTask;
  }
  else {
    downloadTask = 0;
  }
  [(NSURLSessionDownloadTask *)downloadTask addObserver:self forKeyPath:@"countOfBytesReceived" options:0 context:FCResourceArchiveFetchOperationKVOContext];
  int v8 = [(FCResourceArchiveFetchOperation *)self progressHandler];

  if (v8)
  {
    uint64_t v9 = [(FCResourceArchiveFetchOperation *)self progressHandler];
    v9[2](0.0);
  }
  if (self)
  {
    [(FCOperation *)self associateChildOperation:self->_downloadTask];
    __int16 v10 = self->_downloadTask;
  }
  else
  {
    [0 associateChildOperation:0];
    __int16 v10 = 0;
  }
  [(NSURLSessionDownloadTask *)v10 resume];
}

void __51__FCResourceArchiveFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    v43 = __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_2;
    v44 = &unk_1E5B4BE70;
    id v45 = *(id *)(a1 + 32);
    id v46 = v6;
    [v45 finishedPerformingOperationWithError:v46];
  }
  else
  {
    int v8 = *(void **)(a1 + 32);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v38 = __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_3;
    v39 = &unk_1E5B4C8F8;
    v40 = v8;
    uint64_t v9 = v37;
    __int16 v10 = v9;
    if (v8)
    {
      v36 = v9;
      id v11 = a2;
      __int16 v12 = [v8 progressHandler];

      if (v12)
      {
        int v13 = [v8 progressHandler];
        v13[2](0.85);
      }
      __int16 v14 = NSTemporaryDirectory();
      v15 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v16 = [v15 UUIDString];
      v17 = [v14 stringByAppendingString:v16];

      v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v18 createDirectoryAtPath:v17 withIntermediateDirectories:0 attributes:0 error:0];

      BOMCopierNew();
      v19 = [MEMORY[0x1E4F1CA48] array];
      BOMCopierSetUserData();
      BOMCopierSetCopyFileFinishedHandler();
      v52 = @"extractPKZip";
      v53[0] = MEMORY[0x1E4F1CC38];
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v22 = v21;
      id v23 = v11;
      [v23 fileSystemRepresentation];

      id v24 = v17;
      [v24 fileSystemRepresentation];
      LODWORD(v17) = BOMCopierCopyWithOptions();
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v26 = v25;
      BOMCopierFree();
      if (v17)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke;
        double v48 = COERCE_DOUBLE(&unk_1E5B4CA88);
        __int16 v10 = v36;
        id v49 = v36;
        __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke((uint64_t)buf);
        id v27 = v49;
      }
      else
      {
        v28 = (void *)FCOperationLog;
        if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v28;
          v30 = [v8 shortOperationDescription];
          uint64_t v31 = [v19 count];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2048;
          double v48 = v26 - v22;
          _os_log_impl(&dword_1A460D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully extracted %lu files from zip archive in %.2fs", buf, 0x20u);
        }
        v32 = [v8 progressHandler];

        if (v32)
        {
          v33 = [v8 progressHandler];
          v33[2](0.95);
        }
        v34 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v35 = [v8 maxConcurrentFetchCount];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke_28;
        double v48 = COERCE_DOUBLE(&unk_1E5B50800);
        id v49 = v24;
        v50 = v8;
        id v51 = v34;
        id v27 = v34;
        objc_msgSend(v19, "fc_visitSubarraysWithMaxCount:block:", v35, buf);
        __int16 v10 = v36;
        v38((uint64_t)v36, v27, 0);
      }
    }
  }
}

uint64_t __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

void __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    double v21 = __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_4;
    double v22 = &unk_1E5B4BE70;
    id v23 = *(id *)(a1 + 32);
    id v24 = v5;
    [v23 finishedPerformingOperationWithError:v24];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_5;
    v17 = &unk_1E5B4C8F8;
    v18 = v7;
    id v8 = a2;
    uint64_t v9 = &v14;
    if (v7)
    {
      __int16 v10 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_35, v14, v15, v16, v17, v18);
      id v11 = [[FCAssetsFetchOperation alloc] initWithAssetHandles:v10];
      [(FCFetchOperation *)v11 setShouldFailOnMissingObjects:1];
      -[FCAssetsFetchOperation setMaxConcurrentFetchCount:](v11, "setMaxConcurrentFetchCount:", [v7 maxConcurrentFetchCount]);
      __int16 v12 = [v7 interestTokenHandler];
      [(FCAssetsFetchOperation *)v11 setInterestTokenHandler:v12];

      int v13 = [v7 archiveHandler];
      [(FCAssetsFetchOperation *)v11 setArchiveHandler:v13];

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_2;
      v28[3] = &unk_1E5B50848;
      v28[4] = v7;
      [(FCAssetsFetchOperation *)v11 setProgressHandler:v28];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_3;
      v25[3] = &unk_1E5B50870;
      id v27 = v9;
      id v26 = v8;
      [(FCFetchOperation *)v11 setFetchCompletionBlock:v25];
      [v7 associateChildOperation:v11];
      [(FCOperation *)v11 start];
    }
  }
}

uint64_t __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

void __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    __int16 v10 = *(void **)(a1 + 32);
    id v11 = v5;
    objc_msgSend(v10, "finishedPerformingOperationWithError:", v11, v9, 3221225472, __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_6, &unk_1E5B4BE70, v10);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      objc_storeStrong((id *)(v7 + 432), a2);
      id v8 = *(void **)(a1 + 32);
    }
    else
    {
      id v8 = 0;
    }
    [v8 finishedPerformingOperationWithError:0];
  }
}

uint64_t __51__FCResourceArchiveFetchOperation_performOperation__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:*(void *)(a1 + 40)];
}

- (void)setDownloadTask:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 424), a2);
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v9 = a3;
  if (self) {
    downloadTask = self->_downloadTask;
  }
  else {
    downloadTask = 0;
  }
  [(NSURLSessionDownloadTask *)downloadTask removeObserver:self forKeyPath:@"countOfBytesReceived"];
  -[FCResourceArchiveFetchOperation setDownloadTask:]((uint64_t)self, 0);
  id v5 = [(FCResourceArchiveFetchOperation *)self fetchCompletionHandler];

  if (v5)
  {
    uint64_t v6 = [(FCResourceArchiveFetchOperation *)self fetchCompletionHandler];
    uint64_t v7 = (void *)v6;
    if (self) {
      resultResources = self->_resultResources;
    }
    else {
      resultResources = 0;
    }
    (*(void (**)(uint64_t, NSArray *, id))(v6 + 16))(v6, resultResources, v9);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)FCResourceArchiveFetchOperationKVOContext == a6)
  {
    if (self) {
      downloadTask = self->_downloadTask;
    }
    else {
      downloadTask = 0;
    }
    uint64_t v8 = [(NSURLSessionDownloadTask *)downloadTask countOfBytesExpectedToReceive];
    if (v8 < 0)
    {
      objc_opt_class();
      if (self) {
        id v9 = self->_downloadTask;
      }
      else {
        id v9 = 0;
      }
      __int16 v10 = [(NSURLSessionDownloadTask *)v9 response];
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }
      id v12 = v11;

      int v13 = [v12 allHeaderFields];
      uint64_t v14 = [v13 objectForKeyedSubscript:@"Content-Length"];

      uint64_t v8 = [v14 longLongValue];
    }
    if (self) {
      uint64_t v15 = self->_downloadTask;
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = [(NSURLSessionDownloadTask *)v15 countOfBytesReceived];
    v17 = [(FCResourceArchiveFetchOperation *)self progressHandler];

    if (v17)
    {
      v18 = [(FCResourceArchiveFetchOperation *)self progressHandler];
      v18[2]((double)v16 / (double)v8 * 0.85 + 0.0);
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)FCResourceArchiveFetchOperation;
    -[FCResourceArchiveFetchOperation observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_unzipFailedErrorWithErrorCode:", *__error());
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __80__FCResourceArchiveFetchOperation__unzipResourcesFromArchiveFileURL_completion___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v23 = *(void *)v25;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v24 + 1) + 8 * v5);
        uint64_t v7 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v6];
        uint64_t v8 = *(void **)(a1 + 40);
        if (v8) {
          uint64_t v8 = (void *)v8[52];
        }
        id v9 = v8;
        __int16 v10 = [v9 internalContentContext];
        id v11 = [v10 contentDatabase];
        id v12 = [v11 permanentURLForRecordID:v6 field:3];

        uint64_t v13 = *(void *)(a1 + 40);
        if (v13) {
          uint64_t v14 = *(void **)(v13 + 416);
        }
        else {
          uint64_t v14 = 0;
        }
        uint64_t v15 = [v14 assetManager];
        uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
        v17 = [v15 assetHandleForURL:v12 prefetchedFileURL:v16 importMethod:1 lifetimeHint:0];

        v18 = [FCResource alloc];
        objc_super v19 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v20 = [(FCResource *)v18 initWithResourceID:v6 assetHandle:v17 fetchDate:v19];

        [*(id *)(a1 + 48) addObject:v20];
        ++v5;
      }
      while (v4 != v5);
      uint64_t v21 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v4 = v21;
    }
    while (v21);
  }
}

uint64_t __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetHandle];
}

void __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) progressHandler];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) progressHandler];
    v5[2](a2 * 0.05 + 0.95);
  }
}

void __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_4;
    v4[3] = &unk_1E5B4C7C0;
    id v6 = *(id *)(a1 + 40);
    id v5 = v3;
    __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_4((uint64_t)v4);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __77__FCResourceArchiveFetchOperation__ensureResourcesAreReadyForUse_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (unint64_t)maxConcurrentFetchCount
{
  return self->_maxConcurrentFetchCount;
}

- (void)setMaxConcurrentFetchCount:(unint64_t)a3
{
  self->_maxConcurrentFetchCount = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (void)setInterestTokenHandler:(id)a3
{
}

- (id)archiveHandler
{
  return self->_archiveHandler;
}

- (void)setArchiveHandler:(id)a3
{
}

- (id)fetchCompletionHandler
{
  return self->_fetchCompletionHandler;
}

- (void)setFetchCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultResources, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong(&self->_archiveHandler, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end