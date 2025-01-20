@interface PUCameraTransientAssetsMediaProvider
- (BOOL)_requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (NSMutableDictionary)_livePhotoRequestsByRequestID;
- (OS_dispatch_queue)_livePhotoRequestQueue;
- (PUCameraTransientAssetsMediaProvider)init;
- (PUCameraTransientAssetsMediaProvider)initWithTransientImageManager:(id)a3 supplementaryLivePhotoImageSource:(id)a4;
- (PUTransientImageManager)_transientImageManager;
- (id)_livePhotoRequestWithID:(int)a3;
- (id)_playerItemForVideoURL:(id)a3;
- (id)_videoCompositionForAVAsset:(id)a3 filterName:(id)a4;
- (id)supplementaryLivePhotoImageSource;
- (int)_nextRequestId;
- (int)_requestLivePhotoForTransientAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)_handleDelegateImageRequestResultWithImage:(id)a3 info:(id)a4 requestID:(int)a5;
- (void)_handleLivePhotoPairedVideoRequestResultURL:(id)a3 filterName:(id)a4 stillDisplayTime:(id *)a5 error:(id)a6 requestID:(int)a7;
- (void)_removeLivePhotoRequestWithID:(int)a3;
- (void)_requestAVAssetForVideoURL:(id)a3 resultHandler:(id)a4;
- (void)_setLivePhotoRequest:(id)a3 forRequestID:(int)a4;
- (void)_updateResultForLivePhotoRequestID:(int)a3;
- (void)setSupplementaryLivePhotoImageSource:(id)a3;
@end

@implementation PUCameraTransientAssetsMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__livePhotoRequestQueue, 0);
  objc_storeStrong((id *)&self->__livePhotoRequestsByRequestID, 0);
  objc_storeStrong((id *)&self->__transientImageManager, 0);
  objc_storeStrong(&self->_supplementaryLivePhotoImageSource, 0);
  objc_storeStrong((id *)&self->_videoFrameGeneratorQueue, 0);
}

- (OS_dispatch_queue)_livePhotoRequestQueue
{
  return self->__livePhotoRequestQueue;
}

- (NSMutableDictionary)_livePhotoRequestsByRequestID
{
  return self->__livePhotoRequestsByRequestID;
}

- (PUTransientImageManager)_transientImageManager
{
  return self->__transientImageManager;
}

- (void)setSupplementaryLivePhotoImageSource:(id)a3
{
}

- (id)supplementaryLivePhotoImageSource
{
  return self->_supplementaryLivePhotoImageSource;
}

- (id)_videoCompositionForAVAsset:(id)a3 filterName:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    v6 = [MEMORY[0x1E4F1E040] filterWithName:a4];
    v7 = v6;
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E4F166D8];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __79__PUCameraTransientAssetsMediaProvider__videoCompositionForAVAsset_filterName___block_invoke;
      v11[3] = &unk_1E5F244F0;
      id v12 = v6;
      v9 = [v8 videoCompositionWithAsset:v5 applyingCIFiltersWithHandler:v11];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __79__PUCameraTransientAssetsMediaProvider__videoCompositionForAVAsset_filterName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 sourceImage];
  [*(id *)(a1 + 32) setValue:v5 forKey:*MEMORY[0x1E4F1E480]];
  v4 = [*(id *)(a1 + 32) valueForKey:*MEMORY[0x1E4F1E520]];
  [v3 finishWithImage:v4 context:0];
}

- (id)_playerItemForVideoURL:(id)a3
{
  id v3 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__18802;
  v29 = __Block_byref_object_dispose__18803;
  id v30 = 0;
  v4 = [MEMORY[0x1E4F16330] assetWithURL:v3];
  id v5 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v4];
  v6 = [v5 firstObject];
  [v6 nominalFrameRate];
  objc_msgSend(MEMORY[0x1E4F8CE18], "defaultSlowMotionRateForNominalFrameRate:");
  float v8 = v7;
  if (v7 >= 1.0)
  {
    uint64_t v12 = [MEMORY[0x1E4F16620] playerItemWithAsset:v4];
    v13 = (void *)v26[5];
    v26[5] = v12;
  }
  else
  {
    long long v23 = 0uLL;
    uint64_t v24 = 0;
    if (v4) {
      [v4 duration];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    long long v17 = v23;
    *(void *)&long long v18 = v24;
    [MEMORY[0x1E4F8CE18] defaultSlowMotionTimeRangeForDuration:&v17];
    id v9 = objc_alloc(MEMORY[0x1E4F8CE18]);
    long long v17 = v20;
    long long v18 = v21;
    long long v19 = v22;
    v10 = objc_msgSend(v9, "initWithSlowMotionTimeRange:rate:", &v17, COERCE_DOUBLE(__PAIR64__(DWORD1(v22), LODWORD(v8))));
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v4 videoAdjustments:v10];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__PUCameraTransientAssetsMediaProvider__playerItemForVideoURL___block_invoke;
    v16[3] = &unk_1E5F244C8;
    v16[4] = &v25;
    [v11 requestPlayerItemWithResultHandler:v16];
  }
  id v14 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v14;
}

void __63__PUCameraTransientAssetsMediaProvider__playerItemForVideoURL___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_requestAVAssetForVideoURL:(id)a3 resultHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F16330];
  id v6 = a4;
  float v7 = [v5 assetWithURL:a3];
  float v8 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v7];
  id v9 = [v8 firstObject];
  [v9 nominalFrameRate];
  objc_msgSend(MEMORY[0x1E4F8CE18], "defaultSlowMotionRateForNominalFrameRate:");
  float v11 = v10;
  if (v10 >= 1.0)
  {
    v13 = 0;
  }
  else
  {
    long long v21 = 0uLL;
    uint64_t v22 = 0;
    if (v7) {
      [v7 duration];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    long long v15 = v21;
    *(void *)&long long v16 = v22;
    [MEMORY[0x1E4F8CE18] defaultSlowMotionTimeRangeForDuration:&v15];
    id v12 = objc_alloc(MEMORY[0x1E4F8CE18]);
    long long v15 = v18;
    long long v16 = v19;
    long long v17 = v20;
    v13 = objc_msgSend(v12, "initWithSlowMotionTimeRange:rate:", &v15, COERCE_DOUBLE(__PAIR64__(DWORD1(v20), LODWORD(v11))));
  }
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v7 videoAdjustments:v13];
  [v14 requestAVAssetWithResultHandler:v6];
}

- (void)_removeLivePhotoRequestWithID:(int)a3
{
  id v5 = [(PUCameraTransientAssetsMediaProvider *)self _livePhotoRequestQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PUCameraTransientAssetsMediaProvider__removeLivePhotoRequestWithID___block_invoke;
  v6[3] = &unk_1E5F244A0;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

void __70__PUCameraTransientAssetsMediaProvider__removeLivePhotoRequestWithID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _livePhotoRequestsByRequestID];
  v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v3 removeObjectForKey:v2];
}

- (void)_setLivePhotoRequest:(id)a3 forRequestID:(int)a4
{
  id v6 = a3;
  int v7 = [(PUCameraTransientAssetsMediaProvider *)self _livePhotoRequestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PUCameraTransientAssetsMediaProvider__setLivePhotoRequest_forRequestID___block_invoke;
  block[3] = &unk_1E5F24478;
  int v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __74__PUCameraTransientAssetsMediaProvider__setLivePhotoRequest_forRequestID___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _livePhotoRequestsByRequestID];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v4 setObject:v2 forKeyedSubscript:v3];
}

- (id)_livePhotoRequestWithID:(int)a3
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__18802;
  id v14 = __Block_byref_object_dispose__18803;
  id v15 = 0;
  id v5 = [(PUCameraTransientAssetsMediaProvider *)self _livePhotoRequestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PUCameraTransientAssetsMediaProvider__livePhotoRequestWithID___block_invoke;
  block[3] = &unk_1E5F25528;
  block[4] = self;
  void block[5] = &v10;
  int v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __64__PUCameraTransientAssetsMediaProvider__livePhotoRequestWithID___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _livePhotoRequestsByRequestID];
  uint64_t v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_updateResultForLivePhotoRequestID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = -[PUCameraTransientAssetsMediaProvider _livePhotoRequestWithID:](self, "_livePhotoRequestWithID:");
  id v6 = [v5 resultHandler];
  if ([v5 imageRequestFinished] && objc_msgSend(v5, "videoRequestFinished"))
  {
    uint64_t v7 = [v5 image];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = [v5 videoURL];
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        int v11 = [v5 stillDisplayTime];

        if (v11)
        {
          uint64_t v12 = [v5 asset];
          v13 = [v5 image];
          uint64_t v27 = [v5 videoURL];
          id v14 = objc_msgSend(MEMORY[0x1E4F16330], "assetWithURL:");
          long long v30 = 0uLL;
          uint64_t v31 = 0;
          id v15 = [v5 stillDisplayTime];
          long long v16 = v15;
          if (v15)
          {
            [v15 CMTimeValue];
          }
          else
          {
            long long v30 = 0uLL;
            uint64_t v31 = 0;
          }

          uint64_t v26 = [v12 hasPhotoColorAdjustments];
          long long v19 = [v5 filterName];
          long long v20 = [(PUCameraTransientAssetsMediaProvider *)self _videoCompositionForAVAsset:v14 filterName:v19];

          id v25 = objc_alloc(MEMORY[0x1E4F39138]);
          id v18 = v13;
          uint64_t v24 = [v18 CGImage];
          uint64_t v21 = [v18 imageOrientation];
          uint64_t v22 = [v12 uuid];
          long long v28 = v30;
          uint64_t v29 = v31;
          long long v23 = (void *)[v25 initWithImage:v24 uiOrientation:v21 videoAsset:v14 photoTime:&v28 assetUUID:v22 options:v26 videoComposition:v20];

          ((void (**)(void, void *, void))v6)[2](v6, v23, 0);
LABEL_15:

          [(PUCameraTransientAssetsMediaProvider *)self _removeLivePhotoRequestWithID:v3];
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    uint64_t v17 = [v5 error];
    id v18 = (id)v17;
    if (v17)
    {
      uint64_t v32 = *MEMORY[0x1E4F39698];
      v33[0] = v17;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    }
    else
    {
      uint64_t v12 = 0;
    }
    ((void (**)(void, void, void *))v6)[2](v6, 0, v12);
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_handleLivePhotoPairedVideoRequestResultURL:(id)a3 filterName:(id)a4 stillDisplayTime:(id *)a5 error:(id)a6 requestID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a4;
  id v15 = [(PUCameraTransientAssetsMediaProvider *)self _livePhotoRequestWithID:v7];
  long long v16 = v15;
  if (v12)
  {
    [v15 setVideoURL:v12];
  }
  else
  {
    uint64_t v17 = PLOneUpGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v19) = 138412290;
      *(void *)((char *)&v19 + 4) = v13;
      _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_ERROR, "Failed to load video URL for iris placeholder asse. Error: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if (a5->var2)
  {
    long long v19 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    id v18 = [MEMORY[0x1E4F29238] valueWithCMTime:&v19];
    [v16 setStillDisplayTime:v18];
  }
  else
  {
    id v18 = PLOneUpGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v19) = 138412290;
      *(void *)((char *)&v19 + 4) = v13;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_ERROR, "Failed to load still display time for iris placeholder asset. Error: %@", (uint8_t *)&v19, 0xCu);
    }
  }

  [v16 setFilterName:v14];
  [v16 setError:v13];
  [v16 setVideoRequestFinished:1];
  [(PUCameraTransientAssetsMediaProvider *)self _updateResultForLivePhotoRequestID:v7];
}

- (void)_handleDelegateImageRequestResultWithImage:(id)a3 info:(id)a4 requestID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(PUCameraTransientAssetsMediaProvider *)self _livePhotoRequestWithID:v5];
  int v11 = v10;
  if (v8)
  {
    [v10 setImage:v8];
  }
  else
  {
    id v12 = PLOneUpGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Failed to load image for iris placeholder asset: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v13 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
  [v11 setError:v13];

  [v11 setImageRequestFinished:1];
  [(PUCameraTransientAssetsMediaProvider *)self _updateResultForLivePhotoRequestID:v5];
}

- (int)_requestLivePhotoForTransientAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void (**)(id, void *, void *))a7;
  if (v10)
  {
    int v11 = [(PUCameraTransientAssetsMediaProvider *)self _nextRequestId];
    id v12 = v9;
    id v13 = [v12 placeholderImage];
    id v14 = objc_alloc(MEMORY[0x1E4F39138]);
    id v15 = v13;
    uint64_t v16 = [v15 CGImage];
    uint64_t v17 = [v15 imageOrientation];
    id v18 = [v12 uuid];
    long long v30 = *MEMORY[0x1E4F1F9F8];
    uint64_t v31 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    long long v19 = (void *)[v14 initWithImage:v16 uiOrientation:v17 videoAsset:0 photoTime:&v30 assetUUID:v18 options:0 videoComposition:0];

    uint64_t v32 = *MEMORY[0x1E4F396F8];
    v33[0] = MEMORY[0x1E4F1CC38];
    long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v10[2](v10, v19, v20);

    uint64_t v21 = [(PUCameraTransientAssetsMediaProvider *)self _transientImageManager];
    uint64_t v22 = [v12 uuid];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __120__PUCameraTransientAssetsMediaProvider__requestLivePhotoForTransientAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v26[3] = &unk_1E5F24450;
    v26[4] = self;
    id v27 = v15;
    id v28 = v12;
    uint64_t v29 = v10;
    id v23 = v12;
    id v24 = v15;
    [v21 requestPairedVideoURLForUUID:v22 resultHandler:v26];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

void __120__PUCameraTransientAssetsMediaProvider__requestLivePhotoForTransientAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v23 = 0uLL;
  uint64_t v24 = 0;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyStillDisplayTime"];
  id v8 = v7;
  if (v7)
  {
    [v7 CMTimeValue];
  }
  else
  {
    long long v23 = 0uLL;
    uint64_t v24 = 0;
  }

  if (v5 && (BYTE12(v23) & 1) != 0)
  {
    id v12 = [MEMORY[0x1E4F16330] assetWithURL:v5];
    uint64_t v27 = *MEMORY[0x1E4F396F8];
    v28[0] = MEMORY[0x1E4F1CC28];
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v14 = *(void **)(a1 + 32);
    id v15 = [v6 objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyFilterName"];
    uint64_t v10 = [v14 _videoCompositionForAVAsset:v12 filterName:v15];

    id v16 = objc_alloc(MEMORY[0x1E4F39138]);
    uint64_t v17 = [*(id *)(a1 + 40) CGImage];
    uint64_t v18 = [*(id *)(a1 + 40) imageOrientation];
    long long v19 = [*(id *)(a1 + 48) uuid];
    long long v21 = v23;
    uint64_t v22 = v24;
    long long v20 = (void *)[v16 initWithImage:v17 uiOrientation:v18 videoAsset:v12 photoTime:&v21 assetUUID:v19 options:0 videoComposition:v10];
  }
  else
  {
    id v9 = [v6 objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyError"];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUMediaProviderErrorDomain" code:-1 userInfo:0];
    }
    long long v19 = v11;
    uint64_t v25 = *MEMORY[0x1E4F39698];
    id v26 = v11;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    long long v20 = 0;
    id v12 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (BOOL)_requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v24 = a6;
  id v25 = a7;
  uint64_t v14 = [(PUCameraTransientAssetsMediaProvider *)self _nextRequestId];
  id v15 = [(PUCameraTransientAssetsMediaProvider *)self supplementaryLivePhotoImageSource];
  id v16 = [[PUCameraPlaceholderLivePhotoRequest alloc] initWithAsset:v13 resultHandler:v25];
  [(PUCameraTransientAssetsMediaProvider *)self _setLivePhotoRequest:v16 forRequestID:v14];
  id v17 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  objc_msgSend(v17, "setNetworkAccessAllowed:", objc_msgSend(v24, "isNetworkAccessAllowed"));
  [v17 setDeliveryMode:1];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5F24400;
  objc_copyWeak(&v30, &location);
  int v31 = v14;
  uint64_t v18 = _Block_copy(aBlock);
  if (v15
    && (((uint64_t (**)(void, id, int64_t, id, void *, double, double))v15)[2](v15, v13, a5, v17, v18, width, height) & 1) != 0)
  {
    long long v19 = [(PUCameraTransientAssetsMediaProvider *)self _transientImageManager];
    long long v20 = [v13 uuid];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke_44;
    v26[3] = &unk_1E5F24428;
    objc_copyWeak(&v27, &location);
    int v28 = v14;
    [v19 requestPairedVideoURLForUUID:v20 resultHandler:v26];
    objc_destroyWeak(&v27);

    BOOL v21 = 1;
  }
  else
  {
    uint64_t v22 = PLOneUpGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = self;
      __int16 v35 = 2112;
      id v36 = v13;
      _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_ERROR, "%@ cannot provide a live photo for iris placeholder asset %@ because its supplementary source cannot provide an image.", buf, 0x16u);
    }

    [(PUCameraPlaceholderLivePhotoRequest *)v16 setImageRequestFinished:1];
    [(PUCameraTransientAssetsMediaProvider *)self _updateResultForLivePhotoRequestID:v14];
    BOOL v21 = 0;
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v21;
}

void __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v7 = v5;
  id v8 = v6;
  int v10 = *(_DWORD *)(a1 + 40);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v7 = v5;
  id v8 = v6;
  int v10 = *(_DWORD *)(a1 + 40);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke_2_45(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyFilterName"];
  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyStillDisplayTime"];
  id v6 = v5;
  if (v5) {
    [v5 CMTimeValue];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyError"];
  [WeakRetained _handleLivePhotoPairedVideoRequestResultURL:v3 filterName:v4 stillDisplayTime:v8 error:v7 requestID:*(unsigned int *)(a1 + 56)];
}

void __150__PUCameraTransientAssetsMediaProvider__requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleDelegateImageRequestResultWithImage:*(void *)(a1 + 32) info:*(void *)(a1 + 40) requestID:*(unsigned int *)(a1 + 56)];
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (-[PUCameraTransientAssetsMediaProvider _requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset:targetSize:contentMode:options:resultHandler:](self, "_requestLivePhotoWithSupplementaryImageSourceIfPossibleWithAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v14, v15, width, height)|| (objc_opt_respondsToSelector() & 1) == 0)
  {
    int v16 = 0;
  }
  else
  {
    int v16 = -[PUCameraTransientAssetsMediaProvider _requestLivePhotoForTransientAsset:targetSize:contentMode:options:resultHandler:](self, "_requestLivePhotoForTransientAsset:targetSize:contentMode:options:resultHandler:", v13, a5, v14, v15, width, height);
  }

  return v16;
}

- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, uint64_t, uint64_t, void))a5;
  uint64_t v11 = [v8 mediaType];
  if ([v8 canPlayPhotoIris]) {
    int v12 = 1;
  }
  else {
    int v12 = [v8 isPhotoIrisPlaceholder];
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  int v31 = __Block_byref_object_copy__18802;
  uint64_t v32 = __Block_byref_object_dispose__18803;
  id v33 = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__18802;
  id v26 = __Block_byref_object_dispose__18803;
  id v27 = 0;
  if (v11 == 2)
  {
    id v13 = v8;
    id v14 = [v13 persistenceURL];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke;
    v21[3] = &unk_1E5F24388;
    v21[4] = &v28;
    v21[5] = &v22;
    [(PUCameraTransientAssetsMediaProvider *)self _requestAVAssetForVideoURL:v14 resultHandler:v21];
    if (v10) {
      v10[2](v10, v29[5], v23[5], 0);
    }
    int v15 = 0;
  }
  else
  {
    if (!v12)
    {
      int v15 = 0;
      goto LABEL_12;
    }
    id v13 = [(PUCameraTransientAssetsMediaProvider *)self _transientImageManager];
    id v14 = [v8 uuid];
    int v15 = [(PUCameraTransientAssetsMediaProvider *)self _nextRequestId];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2;
    v17[3] = &unk_1E5F243B0;
    v17[4] = self;
    long long v19 = &v28;
    long long v20 = &v22;
    uint64_t v18 = v10;
    [v13 requestPairedVideoURLForUUID:v14 resultHandler:v17];
  }
LABEL_12:
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyStillDisplayTime"];
  id v8 = v7;
  if (v7)
  {
    [v7 CMTimeValue];
  }
  else
  {
    long long v20 = 0uLL;
    uint64_t v21 = 0;
  }

  if (v5 && (BYTE12(v20) & 1) != 0)
  {
    int v12 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_3;
    v18[3] = &unk_1E5F24388;
    long long v19 = *(_OWORD *)(a1 + 48);
    [v12 _requestAVAssetForVideoURL:v5 resultHandler:v18];
    uint64_t v24 = @"PUMediaProviderStillDisplayTimeKey";
    long long v16 = v20;
    uint64_t v17 = v21;
    int v10 = [MEMORY[0x1E4F29238] valueWithCMTime:&v16];
    v25[0] = v10;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  }
  else
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyError"];
    int v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUMediaProviderErrorDomain" code:-1 userInfo:0];
    }
    id v14 = v11;
    uint64_t v22 = *MEMORY[0x1E4F39698];
    id v23 = v11;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, void, void, void *))(v15 + 16))(v15, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
  }
}

void __85__PUCameraTransientAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  uint64_t v9 = [v7 mediaType];
  if (([v7 canPlayPhotoIris] & 1) == 0)
  {
    int v10 = [v7 isPhotoIrisPlaceholder];
    if (v9 != 2)
    {
      if (!v10)
      {
        int v13 = 0;
        goto LABEL_11;
      }
      goto LABEL_9;
    }
LABEL_5:
    id v11 = [v7 persistenceURL];
    int v12 = [(PUCameraTransientAssetsMediaProvider *)self _playerItemForVideoURL:v11];
    if (v8) {
      v8[2](v8, v12, 0);
    }

    int v13 = 0;
    goto LABEL_10;
  }
  if (v9 == 2) {
    goto LABEL_5;
  }
LABEL_9:
  int v12 = [(PUCameraTransientAssetsMediaProvider *)self _transientImageManager];
  id v14 = [v7 uuid];
  int v13 = [(PUCameraTransientAssetsMediaProvider *)self _nextRequestId];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__PUCameraTransientAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  v16[3] = &unk_1E5F2D7A8;
  uint64_t v17 = v8;
  [v12 requestPairedVideoURLForUUID:v14 resultHandler:v16];

LABEL_10:
LABEL_11:

  return v13;
}

void __88__PUCameraTransientAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  id v7 = [v6 objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyStillDisplayTime"];
  id v8 = v7;
  if (v7)
  {
    [v7 CMTimeValue];
  }
  else
  {
    long long v18 = 0uLL;
    uint64_t v19 = 0;
  }

  if (v5 && (BYTE12(v18) & 1) != 0)
  {
    int v10 = [MEMORY[0x1E4F16330] assetWithURL:v5];
    int v12 = [MEMORY[0x1E4F16620] playerItemWithAsset:v10];
    uint64_t v22 = @"PUMediaProviderStillDisplayTimeKey";
    long long v16 = v18;
    uint64_t v17 = v19;
    int v13 = [MEMORY[0x1E4F29238] valueWithCMTime:&v16];
    v23[0] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  }
  else
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"PUTransientImageManagerInfoKeyError"];
    int v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUMediaProviderErrorDomain" code:-1 userInfo:0];
    }
    int v13 = v11;
    uint64_t v20 = *MEMORY[0x1E4F39698];
    id v21 = v11;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    int v12 = 0;
  }

  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v12, v14);
  }
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void, id))a5 + 2))(a5, 0, 0, a4);
  }
  return 0;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void, void, void))a5 + 2))(a5, 0, 0, 0, 0);
  }
  return 0;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double width = a4.width;
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  char v14 = objc_opt_respondsToSelector();
  if (v13 && (v14 & 1) != 0)
  {
    id v15 = v11;
    long long v16 = [v15 placeholderImage];
    if ([v15 mediaType] != 2) {
      goto LABEL_6;
    }
    [v16 size];
    if (width <= v17) {
      goto LABEL_6;
    }
    uint64_t v18 = [v12 deliveryMode];
    videoFrameGeneratorQueue = self->_videoFrameGeneratorQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __106__PUCameraTransientAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    v21[3] = &unk_1E5F2EA60;
    id v22 = v15;
    id v23 = v13;
    dispatch_async(videoFrameGeneratorQueue, v21);

    if (v18 != 1)
    {
LABEL_6:
      if (v16) {
        (*((void (**)(id, void *, void))v13 + 2))(v13, v16, 0);
      }
    }
  }
  return 0;
}

void __106__PUCameraTransientAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) persistenceURL];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F166C8]) initWithURL:v2 options:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:v3];
  [v4 setAppliesPreferredTrackTransform:1];
  id v14 = 0;
  *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
  *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  id v5 = (CGImage *)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v4 atTime:buf actualTime:0 error:&v14];
  id v6 = v14;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v5];
    CGImageRelease(v5);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__PUCameraTransientAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    block[3] = &unk_1E5F2EA60;
    id v8 = *(id *)(a1 + 40);
    id v12 = v7;
    id v13 = v8;
    uint64_t v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v9 = PLCameraGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Unable to generate image from video asset %@ for transient asset %@. Error: %@", buf, 0x20u);
    }
  }
}

uint64_t __106__PUCameraTransientAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (int)_nextRequestId
{
  return atomic_fetch_add(&self->_latestRequestId, 1u) + 1;
}

- (PUCameraTransientAssetsMediaProvider)initWithTransientImageManager:(id)a3 supplementaryLivePhotoImageSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUCameraTransientAssetsMediaProvider;
  uint64_t v9 = [(PUCameraTransientAssetsMediaProvider *)&v20 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id supplementaryLivePhotoImageSource = v9->_supplementaryLivePhotoImageSource;
    v9->_id supplementaryLivePhotoImageSource = (id)v10;

    id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    livePhotoRequestsByRequestID = v9->__livePhotoRequestsByRequestID;
    v9->__livePhotoRequestsByRequestID = v12;

    uint64_t v14 = px_dispatch_queue_create_serial();
    livePhotoRequestQueue = v9->__livePhotoRequestQueue;
    v9->__livePhotoRequestQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = px_dispatch_queue_create_serial();
    videoFrameGeneratorQueue = v9->_videoFrameGeneratorQueue;
    v9->_videoFrameGeneratorQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v9->__transientImageManager, a3);
    atomic_store(0x186A0u, (unsigned int *)&v9->_latestRequestId);
    uint64_t v18 = v9;
  }

  return v9;
}

- (PUCameraTransientAssetsMediaProvider)init
{
  return [(PUCameraTransientAssetsMediaProvider *)self initWithTransientImageManager:0 supplementaryLivePhotoImageSource:0];
}

@end