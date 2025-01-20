@interface PUMergedLivePhotosVideoRequest
- (NSError)error;
- (PUAssetReference)assetReference;
- (PUAssetsDataSource)assetsDataSource;
- (PUMergedLivePhotosVideo)mergedVideo;
- (PUMergedLivePhotosVideoRequest)init;
- (PUMergedLivePhotosVideoRequest)initWithAssetReference:(id)a3 dataSource:(id)a4 dataCache:(id)a5;
- (id)_workQueue_fetchMergeableAssets;
- (int64_t)state;
- (void)_stateQueue_signalStateChange;
- (void)_workQueue_finishWithMergedVideo:(id)a3 error:(id)a4;
- (void)_workQueue_generateVideoUsingAssets:(id)a3;
- (void)_workQueue_handleGeneratorDidChangeState;
- (void)_workQueue_start;
- (void)cancel;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)start;
@end

@implementation PUMergedLivePhotosVideoRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_stateQueue_error, 0);
  objc_storeStrong((id *)&self->_stateQueue_mergedVideo, 0);
  objc_storeStrong((id *)&self->_workQueue_generator, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (PUAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (PUMergedLivePhotosVideoRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUMergedLivePhotosVideoRequest.m", 223, @"%s is not available as initializer", "-[PUMergedLivePhotosVideoRequest init]");

  abort();
}

- (void)_stateQueue_signalStateChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PUMergedLivePhotosVideoRequest__stateQueue_signalStateChange__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PUMergedLivePhotosVideoRequest__stateQueue_signalStateChange__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PUMergedLivePhotosVideoRequest__stateQueue_signalStateChange__block_invoke_2;
  v3[3] = &unk_1E5F2E5A8;
  v3[4] = v1;
  return [v1 performChanges:v3];
}

uint64_t __63__PUMergedLivePhotosVideoRequest__stateQueue_signalStateChange__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:1];
}

- (void)_workQueue_finishWithMergedVideo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PUMergedLivePhotosVideoRequest__workQueue_finishWithMergedVideo_error___block_invoke;
  block[3] = &unk_1E5F2E908;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(stateQueue, block);
}

uint64_t __73__PUMergedLivePhotosVideoRequest__workQueue_finishWithMergedVideo_error___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 128) == 1)
  {
    uint64_t v2 = result;
    objc_storeStrong((id *)(v1 + 136), *(id *)(result + 40));
    objc_storeStrong((id *)(*(void *)(v2 + 32) + 144), *(id *)(v2 + 48));
    uint64_t v3 = 3;
    if (*(void *)(v2 + 48)) {
      uint64_t v3 = 4;
    }
    *(void *)(*(void *)(v2 + 32) + 128) = v3;
    v4 = PLLivePhotoPlaybackGetLog();
    v5 = v4;
    os_signpost_id_t v6 = *(void *)(*(void *)(v2 + 32) + 96);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)id v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "LivePhotoRequestProcessing", "", v7, 2u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "_stateQueue_signalStateChange");
  }
  return result;
}

- (void)_workQueue_handleGeneratorDidChangeState
{
  v5 = self->_workQueue_generator;
  if ([(PUCompositeVideoGenerator *)v5 state] == 2)
  {
    uint64_t v3 = [(PUCompositeVideoGenerator *)v5 playbackVideo];
    v4 = [(PUCompositeVideoGenerator *)v5 error];
    [(PUMergedLivePhotosVideoRequest *)self _workQueue_finishWithMergedVideo:v3 error:v4];
  }
}

- (void)_workQueue_generateVideoUsingAssets:(id)a3
{
  id v6 = a3;
  if ([(PUMergedLivePhotosVideoRequest *)self state] == 1)
  {
    if ([v6 count])
    {
      v4 = [[PUCompositeVideoGenerator alloc] initWithAssets:v6 outputType:0 onlyAllowOverlappingAssets:1 dataCache:self->_dataCache];
      [(PUCompositeVideoGenerator *)v4 registerChangeObserver:self context:GeneratorContext];
      [(PUCompositeVideoGenerator *)v4 start];
      workQueue_generator = self->_workQueue_generator;
      self->_workQueue_generator = v4;
    }
    else
    {
      [(PUMergedLivePhotosVideoRequest *)self _workQueue_finishWithMergedVideo:0 error:0];
    }
  }
}

- (id)_workQueue_fetchMergeableAssets
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUMergedLivePhotosVideoRequest *)self assetsDataSource];
  v4 = [(PUMergedLivePhotosVideoRequest *)self assetReference];
  v5 = [v4 asset];
  if ([v5 playbackStyle] == 3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [v4 asset];
    [v6 fetchPropertySetsIfNeeded];
    id v7 = PLLivePhotoPlaybackGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = [v6 localIdentifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "Determining mergeable assets from %@", (uint8_t *)&buf, 0xCu);
    }
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v6, 0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    id v10 = [v4 indexPath];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__PUMergedLivePhotosVideoRequest__workQueue_fetchMergeableAssets__block_invoke;
    v14[3] = &unk_1E5F222F0;
    id v15 = v3;
    p_long long buf = &buf;
    id v11 = v9;
    id v16 = v11;
    [v15 enumerateIndexPathsStartingAtIndexPath:v10 reverseDirection:0 usingBlock:v14];

    id v12 = (void *)[v11 copy];
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

void __65__PUMergedLivePhotosVideoRequest__workQueue_fetchMergeableAssets__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [*(id *)(a1 + 32) assetReferenceAtIndexPath:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  v8 = v9;
  if (v9)
  {
    id v10 = [v8 asset];
    id v11 = [v5 asset];
    id v12 = PLLivePhotoPlaybackGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v10 uuid];
      v14 = [v11 uuid];
      int v16 = 138412546;
      v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEBUG, "\tComparing last asset (%@) and candidate asset (%@)", (uint8_t *)&v16, 0x16u);
    }
    if (+[PUCompositeVideoGenerator canMergeAsset:v10 withConsecutiveAsset:v11])
    {
      id v15 = PLLivePhotoPlaybackGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEBUG, "\t\tTheir durations overlap", (uint8_t *)&v16, 2u);
      }

      [*(id *)(a1 + 40) addObject:v11];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    }
    else
    {
      *a3 = 1;
    }
  }
  else
  {
    objc_storeStrong(v7, v5);
  }
}

- (void)_workQueue_start
{
  if ([(PUMergedLivePhotosVideoRequest *)self state] == 1)
  {
    id v3 = [(PUMergedLivePhotosVideoRequest *)self _workQueue_fetchMergeableAssets];
    [(PUMergedLivePhotosVideoRequest *)self _workQueue_generateVideoUsingAssets:v3];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)GeneratorContext == a5)
  {
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__PUMergedLivePhotosVideoRequest_observable_didChange_context___block_invoke;
    v7[3] = &unk_1E5F2E530;
    objc_copyWeak(&v8, &location);
    dispatch_async(workQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __63__PUMergedLivePhotosVideoRequest_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workQueue_handleGeneratorDidChangeState");
}

- (NSError)error
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PUMergedLivePhotosVideoRequest_error__block_invoke;
  v5[3] = &unk_1E5F2E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __39__PUMergedLivePhotosVideoRequest_error__block_invoke(uint64_t a1)
{
}

- (PUMergedLivePhotosVideo)mergedVideo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PUMergedLivePhotosVideoRequest_mergedVideo__block_invoke;
  v5[3] = &unk_1E5F2E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PUMergedLivePhotosVideo *)v3;
}

void __45__PUMergedLivePhotosVideoRequest_mergedVideo__block_invoke(uint64_t a1)
{
}

- (int64_t)state
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PUMergedLivePhotosVideoRequest_state__block_invoke;
  v5[3] = &unk_1E5F2E200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__PUMergedLivePhotosVideoRequest_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 128);
  return result;
}

- (void)cancel
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PUMergedLivePhotosVideoRequest_cancel__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_barrier_async(stateQueue, block);
}

uint64_t __40__PUMergedLivePhotosVideoRequest_cancel__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 128) == 1)
  {
    uint64_t v2 = result;
    *(void *)(v1 + 128) = 2;
    int64_t v3 = PLLivePhotoPlaybackGetLog();
    v4 = v3;
    os_signpost_id_t v5 = *(void *)(*(void *)(v2 + 32) + 96);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_END, v5, "LivePhotoRequestProcessing", "", v6, 2u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "_stateQueue_signalStateChange");
  }
  return result;
}

- (void)start
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PUMergedLivePhotosVideoRequest_start__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_barrier_async(stateQueue, block);
}

void __39__PUMergedLivePhotosVideoRequest_start__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 128))
  {
    *(void *)(v1 + 128) = 1;
    int64_t v3 = PLLivePhotoPlaybackGetLog();
    v4 = v3;
    os_signpost_id_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "LivePhotoRequestProcessing", "", (uint8_t *)buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_stateQueue_signalStateChange");
    objc_initWeak(buf, *(id *)(a1 + 32));
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 104);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PUMergedLivePhotosVideoRequest_start__block_invoke_204;
    block[3] = &unk_1E5F2E530;
    objc_copyWeak(&v8, buf);
    dispatch_async(v6, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __39__PUMergedLivePhotosVideoRequest_start__block_invoke_204(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workQueue_start");
}

- (PUMergedLivePhotosVideoRequest)initWithAssetReference:(id)a3 dataSource:(id)a4 dataCache:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PUMergedLivePhotosVideoRequest;
  id v13 = [(PUMergedLivePhotosVideoRequest *)&v26 init];
  if (v13)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v13->_assetReference, a3);
        objc_storeStrong((id *)&v13->_assetsDataSource, a4);
        objc_storeStrong((id *)&v13->_dataCache, a5);
        v14 = PLLivePhotoPlaybackGetLog();
        v13->_requestLogID = os_signpost_id_generate(v14);

        id v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
        dispatch_queue_t v16 = dispatch_queue_create("com.apple.photos.merged-live-photos-video-request.work", v15);
        workQueue = v13->_workQueue;
        v13->_workQueue = (OS_dispatch_queue *)v16;

        workQueue_generator = v13->_workQueue_generator;
        v13->_workQueue_generator = 0;

        uint64_t v19 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
        dispatch_queue_t v20 = dispatch_queue_create("com.apple.photos.merged-live-photos-video-request.state", v19);
        stateQueue = v13->_stateQueue;
        v13->_stateQueue = (OS_dispatch_queue *)v20;

        v13->_stateQueue_state = 0;
        stateQueue_mergedVideo = v13->_stateQueue_mergedVideo;
        v13->_stateQueue_mergedVideo = 0;

        goto LABEL_5;
      }
    }
    else
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v13, @"PUMergedLivePhotosVideoRequest.m", 49, @"Invalid parameter not satisfying: %@", @"assetReference" object file lineNumber description];

      if (v11) {
        goto LABEL_4;
      }
    }
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, v13, @"PUMergedLivePhotosVideoRequest.m", 50, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v13;
}

@end