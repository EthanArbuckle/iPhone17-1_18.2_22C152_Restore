@interface PXFlexMusicMediaProvider
+ (PXAudioAssetMediaProvider)sharedInstance;
- (PXFlexMusicMediaProvider)init;
- (PXFlexMusicMediaProvider)initWithQOSClass:(unsigned int)a3;
- (int64_t)_nextRequestID;
- (int64_t)requestMediaForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)_deliverResultForAsset:(id)a3 preferredDuration:(id *)a4 error:(id)a5 toHandler:(id)a6;
- (void)_handleDownloaderFinishedForAsset:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_queue_cancelRequest:(int64_t)a3;
- (void)_queue_handleDownloaderFinishedForAsset:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_queue_startDownloadIfNeededForRequest:(id)a3;
- (void)cancelRequest:(int64_t)a3;
@end

@implementation PXFlexMusicMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_downloaderByAsset, 0);
  objc_storeStrong((id *)&self->_queue_requestIDsByAsset, 0);
  objc_storeStrong((id *)&self->_queue_requestByID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_deliverResultForAsset:(id)a3 preferredDuration:(id *)a4 error:(id)a5 toHandler:(id)a6
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  double v22 = 0.0;
  double v23 = 0.0;
  v11 = (void (**)(id, void *, id, void *))a6;
  v12 = +[PXFlexMusicLibrary sharedLibrary];
  id v21 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a4;
  v13 = [v12 playableAssetForAsset:v9 preferredDuration:&buf audioMix:&v21 peakValue:&v23 loudness:&v22];
  id v14 = v21;

  v28[0] = @"PeakdBFS";
  v15 = [NSNumber numberWithDouble:v23];
  v29[0] = v15;
  v28[1] = @"ProgramLoudnessLKFS";
  v16 = [NSNumber numberWithDouble:v22];
  v29[1] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  if (v10)
  {
    v18 = (void *)[v17 mutableCopy];
    [v18 setObject:v10 forKeyedSubscript:@"Error"];
    uint64_t v19 = [v18 copy];

    v17 = (void *)v19;
  }
  v20 = PLAudioPlaybackGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.var0) = 138413058;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v9;
    LOWORD(buf.var2) = 2112;
    *(void *)((char *)&buf.var2 + 2) = v13;
    HIWORD(buf.var3) = 2112;
    id v25 = v14;
    __int16 v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEBUG, "Delivering download result for asset %@; Result: (%@; %@; %@)",
      (uint8_t *)&buf,
      0x2Au);
  }

  v11[2](v11, v13, v14, v17);
}

- (void)_queue_handleDownloaderFinishedForAsset:(id)a3 success:(BOOL)a4 error:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [(NSMutableDictionary *)self->_queue_requestIDsByAsset objectForKeyedSubscript:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v15 = [(NSMutableDictionary *)self->_queue_requestByID objectForKeyedSubscript:v14];
        [(NSMutableDictionary *)self->_queue_requestByID setObject:0 forKeyedSubscript:v14];
        v16 = [v15 options];
        v17 = v16;
        if (v16) {
          [v16 preferredDuration];
        }
        else {
          memset(v19, 0, sizeof(v19));
        }
        v18 = [v15 resultHandler];
        [(PXFlexMusicMediaProvider *)self _deliverResultForAsset:v7 preferredDuration:v19 error:v8 toHandler:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  [v9 removeAllObjects];
  [(NSMutableDictionary *)self->_queue_downloaderByAsset setObject:0 forKeyedSubscript:v7];
}

- (void)_handleDownloaderFinishedForAsset:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXFlexMusicMediaProvider__handleDownloaderFinishedForAsset_success_error___block_invoke;
  block[3] = &unk_1E5DC4710;
  objc_copyWeak(&v16, &location);
  BOOL v17 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __76__PXFlexMusicMediaProvider__handleDownloaderFinishedForAsset_success_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_handleDownloaderFinishedForAsset:success:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

- (void)_queue_startDownloadIfNeededForRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 asset];
  uint64_t v6 = [v4 requestID];
  id v7 = [(NSMutableDictionary *)self->_queue_downloaderByAsset objectForKeyedSubscript:v5];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [[PXFlexMusicDownloader alloc] initWithAsset:v5 resource:2];
    [(NSMutableDictionary *)self->_queue_downloaderByAsset setObject:v8 forKeyedSubscript:v5];
  }
  queue_requestByID = self->_queue_requestByID;
  uint64_t v10 = [NSNumber numberWithInteger:v6];
  [(NSMutableDictionary *)queue_requestByID setObject:v4 forKeyedSubscript:v10];

  id v11 = [(NSMutableDictionary *)self->_queue_requestIDsByAsset objectForKeyedSubscript:v5];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSMutableDictionary *)self->_queue_requestIDsByAsset setObject:v11 forKeyedSubscript:v5];
  }
  id v12 = [NSNumber numberWithInteger:v6];
  [v11 addObject:v12];

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PXFlexMusicMediaProvider__queue_startDownloadIfNeededForRequest___block_invoke;
  v14[3] = &unk_1E5DD2120;
  objc_copyWeak(&v16, &location);
  id v13 = v5;
  id v15 = v13;
  [(PXFlexMusicDownloader *)v8 startWithCompletion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __67__PXFlexMusicMediaProvider__queue_startDownloadIfNeededForRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleDownloaderFinishedForAsset:*(void *)(a1 + 32) success:a2 error:v6];
}

- (void)_queue_cancelRequest:(int64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  queue_requestByID = self->_queue_requestByID;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)queue_requestByID objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_queue_requestByID;
    id v9 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v8 setObject:0 forKeyedSubscript:v9];

    uint64_t v10 = [v7 asset];
    id v11 = [(NSMutableDictionary *)self->_queue_requestIDsByAsset objectForKeyedSubscript:v10];
    id v12 = [NSNumber numberWithInteger:a3];
    [v11 removeObject:v12];

    if (![v11 count])
    {
      id v13 = [(NSMutableDictionary *)self->_queue_downloaderByAsset objectForKeyedSubscript:v10];
      id v14 = v13;
      if (v13)
      {
        id v15 = [v13 progress];
        [v15 cancel];
      }
      [(NSMutableDictionary *)self->_queue_downloaderByAsset setObject:0 forKeyedSubscript:v10];
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
      uint64_t v19 = @"Error";
      v20[0] = v16;
      BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      v18 = [v7 resultHandler];
      ((void (**)(void, void, void, void *))v18)[2](v18, 0, 0, v17);
    }
  }
}

- (int64_t)_nextRequestID
{
  return (int)(atomic_fetch_add(&self->_requestIDCounter, 1u) + 1);
}

- (void)cancelRequest:(int64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXFlexMusicMediaProvider_cancelRequest___block_invoke;
  block[3] = &unk_1E5DD0260;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __42__PXFlexMusicMediaProvider_cancelRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_cancelRequest:", *(void *)(a1 + 40));
}

- (int64_t)requestMediaForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  uint64_t v10 = (PXAudioRequestOptions *)a4;
  id v11 = a5;
  if (!v10) {
    uint64_t v10 = objc_alloc_init(PXAudioRequestOptions);
  }
  int64_t v12 = [(PXFlexMusicMediaProvider *)self _nextRequestID];
  id v13 = v9;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v21 = (objc_class *)objc_opt_class();
      long long v22 = NSStringFromClass(v21);
      long long v23 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v20 handleFailureInMethod:a2, self, @"PXFlexMusicMediaProvider.m", 71, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"asset", v22, v23 object file lineNumber description];
    }
  }
  id v14 = [[_PXFlexMusicMediaProviderRequest alloc] initWithAsset:v13 options:v10 requestID:v12 resultHandler:v11];
  if (v10)
  {
    [(PXAudioRequestOptions *)v10 maximumDuration];
    if ((BYTE4(v32) & 0x1D) == 1)
    {
      id v15 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "PXAudioRequestOptions.maximumDuration is not currently supported by PXFlexMusicMediaProvider", (uint8_t *)buf, 2u);
      }
    }
    [(PXAudioRequestOptions *)v10 fadeOutDuration];
    if ((BYTE4(v29) & 0x1D) == 1)
    {
      id v16 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "PXAudioRequestOptions.fadeOutDuration is not currently supported by PXFlexMusicMediaProvider", (uint8_t *)buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v28 = 0;
  }
  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PXFlexMusicMediaProvider_requestMediaForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v26, buf);
  uint64_t v25 = v14;
  v18 = v14;
  dispatch_async(queue, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(buf);

  return v12;
}

void __71__PXFlexMusicMediaProvider_requestMediaForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_startDownloadIfNeededForRequest:", *(void *)(a1 + 32));
}

- (PXFlexMusicMediaProvider)initWithQOSClass:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXFlexMusicMediaProvider;
  if ([(PXFlexMusicMediaProvider *)&v4 init]) {
    px_dispatch_queue_create_serial();
  }
  return 0;
}

- (PXFlexMusicMediaProvider)init
{
  return [(PXFlexMusicMediaProvider *)self initWithQOSClass:21];
}

+ (PXAudioAssetMediaProvider)sharedInstance
{
  if (sharedInstance_onceToken_203174 != -1) {
    dispatch_once(&sharedInstance_onceToken_203174, &__block_literal_global_203175);
  }
  v2 = (void *)sharedInstance_sharedProvider_203176;
  return (PXAudioAssetMediaProvider *)v2;
}

void __42__PXFlexMusicMediaProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PXFlexMusicMediaProvider);
  v1 = (void *)sharedInstance_sharedProvider_203176;
  sharedInstance_sharedProvider_203176 = (uint64_t)v0;
}

@end