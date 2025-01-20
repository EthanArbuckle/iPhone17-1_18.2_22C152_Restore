@interface PXFlexMusicDownloader
- (NSProgress)progress;
- (NSString)description;
- (PXFlexMusicAsset)asset;
- (PXFlexMusicDownloader)init;
- (PXFlexMusicDownloader)initWithAsset:(id)a3 resource:(int64_t)a4;
- (double)downloadFractionCompleted;
- (int64_t)resource;
- (void)_handleCancellation;
- (void)_queue_finishIfPossible;
- (void)_queue_handleDownloadFinished:(BOOL)a3 error:(id)a4;
- (void)_queue_handleDownloadProgressChanged;
- (void)_queue_startWithCompletion:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDownloadFractionCompleted:(double)a3;
- (void)startWithCompletion:(id)a3;
@end

@implementation PXFlexMusicDownloader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_queue_downloadExpectation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_queue_completionHandler, 0);
}

- (double)downloadFractionCompleted
{
  return self->_downloadFractionCompleted;
}

- (int64_t)resource
{
  return self->_resource;
}

- (PXFlexMusicAsset)asset
{
  return self->_asset;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 48, 1);
}

- (void)_queue_handleDownloadFinished:(BOOL)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!self->_queue_isFinished)
  {
    PLAudioPlaybackGetLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v10, "PXFlexMusicDownloaderDownload", " enableTelemetry=YES ", buf, 2u);
      }
    }

    self->_queue_isFinished = 1;
    if (a3)
    {
      v11 = 0;
    }
    else
    {
      if (objc_msgSend(v7, "px_isDomain:code:", @"PXExpectationErrorDomain", 1)) {
        objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXFlexMusicDownloaderErrorDomain", 1, v7, @"%@ timed out", self, v23);
      }
      else {
      v11 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXFlexMusicDownloaderErrorDomain", 0, v7, @"%@ encountered an unknown error: %@", self, v7);
      }
      v12 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v27 = self;
        __int16 v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "%{public}@ download failed with error %{public}@", buf, 0x16u);
      }
    }
    if (!self->_queue_completionHandler) {
      PXAssertGetLog();
    }
    int64_t v13 = [(PXFlexMusicDownloader *)self resource];
    switch(v13)
    {
      case 1:
        v14 = @"com.apple.photos.CPAnalytics.flexMusicSongArtworkDownloaded";
        break;
      case 2:
        v14 = @"com.apple.photos.CPAnalytics.flexMusicSongAudioDownloaded";
        break;
      case 0:
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2 object:self file:@"PXFlexMusicDownloader.m" lineNumber:204 description:@"Code which should be unreachable has been reached"];

        abort();
      default:
        v14 = 0;
        break;
    }
    v15 = (void *)MEMORY[0x1E4F56658];
    int64_t downloadSignpostID = self->_downloadSignpostID;
    uint64_t v17 = *MEMORY[0x1E4F56440];
    v24[0] = *MEMORY[0x1E4F56560];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v24[1] = *MEMORY[0x1E4F56580];
    v25[0] = v19;
    v25[1] = v14;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v15 endSignpost:downloadSignpostID forEventName:v17 withPayload:v20];

    self->_int64_t downloadSignpostID = 0;
    (*((void (**)(void))self->_queue_completionHandler + 2))();
    id queue_completionHandler = self->_queue_completionHandler;
    self->_id queue_completionHandler = 0;
  }
}

- (void)_queue_finishIfPossible
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = +[PXFlexMusicLibrary sharedLibrary];
  v4 = [(PXFlexMusicDownloader *)self asset];
  v5 = objc_msgSend(v3, "localURLForAsset:resourceType:", v4, -[PXFlexMusicDownloader resource](self, "resource"));

  if (v5)
  {
    v6 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      v8 = self;
      __int16 v9 = 2114;
      os_signpost_id_t v10 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ download finished with URL %{public}@", (uint8_t *)&v7, 0x16u);
    }

    [(PXExpectation *)self->_queue_downloadExpectation fulfill];
  }
}

- (void)_handleCancellation
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PXFlexMusicDownloader__handleCancellation__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__PXFlexMusicDownloader__handleCancellation__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  id v3 = +[PXFlexMusicLibrary sharedLibrary];
  v2 = [*(id *)(a1 + 32) asset];
  objc_msgSend(v3, "cancelDownloadForAsset:resourceType:", v2, objc_msgSend(*(id *)(a1 + 32), "resource"));
}

- (void)setDownloadFractionCompleted:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_downloadFractionCompleted != a3)
  {
    self->_downloadFractionCompleted = a3;
    v5 = PLAudioPlaybackGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543618;
      int v7 = self;
      __int16 v8 = 2048;
      double v9 = a3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ download progress changed: %.f", (uint8_t *)&v6, 0x16u);
    }

    if (a3 == -1.0) {
      [(PXExpectation *)self->_queue_downloadExpectation fulfill];
    }
    else {
      [(NSProgress *)self->_progress setCompletedUnitCount:(uint64_t)(a3 * 100.0)];
    }
    if (a3 >= 1.0) {
      [(PXFlexMusicDownloader *)self _queue_finishIfPossible];
    }
  }
}

- (void)_queue_handleDownloadProgressChanged
{
  if (!self->_queue_isFinished)
  {
    id v4 = +[PXFlexMusicLibrary sharedLibrary];
    id v3 = [(PXFlexMusicDownloader *)self asset];
    objc_msgSend(v4, "downloadProgressForAsset:resourceType:", v3, -[PXFlexMusicDownloader resource](self, "resource"));
    -[PXFlexMusicDownloader setDownloadFractionCompleted:](self, "setDownloadFractionCompleted:");
  }
}

- (void)_queue_startWithCompletion:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_queue_completionHandler) {
    PXAssertGetLog();
  }
  v5 = +[PXAudioSettings sharedInstance];
  int v6 = [v5 flexSimulateDownloadFailure];

  if (v6)
  {
    sleep(2u);
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  else
  {
    int v7 = +[PXFlexMusicLibrary sharedLibrary];
    [v7 registerChangeObserver:self context:LibraryContext];
    __int16 v8 = [(PXFlexMusicDownloader *)self asset];
    int64_t v9 = [(PXFlexMusicDownloader *)self resource];
    int v10 = [v7 hasLocalResourceForAsset:v8 resourceType:v9];
    uint64_t v11 = PLAudioPlaybackGetLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        v31 = self;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Found existing local resource. Skipping download for %{public}@", buf, 0xCu);
      }

      [(NSProgress *)self->_progress setCompletedUnitCount:100];
      self->_queue_isFinished = 1;
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        v31 = self;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Starting download for %{public}@", buf, 0xCu);
      }

      int64_t v13 = [PXExpectation alloc];
      queue = self->_queue;
      v15 = [(PXFlexMusicDownloader *)self description];
      v16 = [(PXExpectation *)v13 initWithQueue:queue, @"%@", v15 labelFormat];
      queue_downloadExpectation = self->_queue_downloadExpectation;
      self->_queue_downloadExpectation = v16;

      objc_initWeak((id *)buf, self);
      v18 = self->_queue_downloadExpectation;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __52__PXFlexMusicDownloader__queue_startWithCompletion___block_invoke;
      v28[3] = &unk_1E5DD0950;
      objc_copyWeak(&v29, (id *)buf);
      [(PXExpectation *)v18 performWhenFulfilled:v28 timeout:30.0];
      PLAudioPlaybackGetLog();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      id WeakRetained = objc_loadWeakRetained((id *)buf);
      os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v19, WeakRetained);

      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)v27 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PXFlexMusicDownloaderDownload", " enableTelemetry=YES ", v27, 2u);
      }

      self->_int64_t downloadSignpostID = [MEMORY[0x1E4F56658] startSignpost];
      [v7 requestDownloadForAsset:v8 resourceType:v9];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __52__PXFlexMusicDownloader__queue_startWithCompletion___block_invoke_27;
      aBlock[3] = &unk_1E5DCD9C8;
      objc_copyWeak(&v26, (id *)buf);
      id v25 = v4;
      v22 = _Block_copy(aBlock);
      id queue_completionHandler = self->_queue_completionHandler;
      self->_id queue_completionHandler = v22;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __52__PXFlexMusicDownloader__queue_startWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_queue_handleDownloadFinished:error:", a2, v5);
}

void __52__PXFlexMusicDownloader__queue_startWithCompletion___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  PLAudioPlaybackGetLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v5, WeakRetained);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)__int16 v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXFlexMusicDownloaderDownload", " enableTelemetry=YES ", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)LibraryContext != a5)
  {
    int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXFlexMusicDownloader.m" lineNumber:91 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  int v10 = v9;
  if (v6)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PXFlexMusicDownloader_observable_didChange_context___block_invoke;
    block[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v17, &location);
    dispatch_async(queue, block);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  if ((v6 & 2) != 0)
  {
    objc_initWeak(&location, self);
    BOOL v12 = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__PXFlexMusicDownloader_observable_didChange_context___block_invoke_2;
    v14[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v15, &location);
    dispatch_async(v12, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __54__PXFlexMusicDownloader_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_handleDownloadProgressChanged");
}

void __54__PXFlexMusicDownloader_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_finishIfPossible");
}

- (void)startWithCompletion:(id)a3
{
  id v4 = a3;
  PLAudioPlaybackGetLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXFlexMusicDownloaderDownload", " enableTelemetry=YES ", (uint8_t *)buf, 2u);
    }
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__PXFlexMusicDownloader_startWithCompletion___block_invoke;
  v10[3] = &unk_1E5DD1848;
  objc_copyWeak(&v12, buf);
  id v11 = v4;
  id v9 = v4;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

void __45__PXFlexMusicDownloader_startWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_startWithCompletion:", *(void *)(a1 + 32));
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(PXFlexMusicDownloader *)self asset];
  int64_t v6 = [(PXFlexMusicDownloader *)self resource];
  os_signpost_id_t v7 = @"Artwork";
  if (v6 == 2) {
    os_signpost_id_t v7 = @"Audio";
  }
  if (!v6) {
    os_signpost_id_t v7 = @"??";
  }
  __int16 v8 = v7;
  id v9 = (void *)[v3 initWithFormat:@"<%@ %p; Song: %@; Resource: %@>", v4, self, v5, v8];

  return (NSString *)v9;
}

- (PXFlexMusicDownloader)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFlexMusicDownloader.m", 59, @"%s is not available as initializer", "-[PXFlexMusicDownloader init]");

  abort();
}

- (PXFlexMusicDownloader)initWithAsset:(id)a3 resource:(int64_t)a4
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFlexMusicDownloader;
  if ([(PXFlexMusicDownloader *)&v9 init])
  {
    id v6 = [NSString alloc];
    os_signpost_id_t v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    [ objc_msgSend(v6 initWithFormat:@"%@-%@", objc_claimAutoreleasedReturnValue(), v5), "UTF8String"];
    px_dispatch_queue_create_serial();
  }

  return 0;
}

void __48__PXFlexMusicDownloader_initWithAsset_resource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleCancellation];
}

@end