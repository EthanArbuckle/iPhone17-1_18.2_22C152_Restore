@interface PUPhotoKitMediaProvider
- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int)a3;
@end

@implementation PUPhotoKitMediaProvider

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [MEMORY[0x1E4F390D0] defaultManager];
  [v4 cancelImageRequest:v3];
}

- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4F390D0];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 defaultManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__PUPhotoKitMediaProvider_requestAsynchronousVideoURLForAsset_options_resultHandler___block_invoke;
  v15[3] = &unk_1E5F2D7A8;
  id v16 = v7;
  id v12 = v7;
  int v13 = [v11 requestURLForVideo:v10 options:v9 resultHandler:v15];

  return v13;
}

uint64_t __85__PUPhotoKitMediaProvider_requestAsynchronousVideoURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PUPhotoKitMediaProvider.m", 414, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  id v12 = v10;
  int v13 = _Block_copy(v11);
  v14 = [(PUMediaProvider *)self loadingStatusManager];
  v15 = v14;
  if (v14)
  {
    *(void *)buf = 0;
    v50 = buf;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__62605;
    v53 = __Block_byref_object_dispose__62606;
    id v54 = 0;
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    v44 = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
    v45 = &unk_1E5F2E0D0;
    v48 = buf;
    id v46 = v14;
    id v47 = v9;
    px_dispatch_on_main_queue();
    id v16 = [v12 progressHandler];
    v17 = _Block_copy(v13);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2;
    v38[3] = &unk_1E5F29A80;
    id v18 = v16;
    id v40 = v18;
    id v19 = v46;
    id v39 = v19;
    v41 = buf;
    [v12 setProgressHandler:v38];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E5F29BE8;
    id v36 = v17;
    id v35 = v19;
    v37 = buf;
    id v20 = v17;
    v21 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    int v13 = v21;
  }
  v22 = +[PUOneUpSettings sharedInstance];
  int v23 = [v22 simulateAssetContentLoading];

  if (v23)
  {
    v24 = PLUIGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating animated image loading because of debug 1-up settings", buf, 2u);
    }

    v25 = objc_alloc_init(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation);
    v26 = [v12 progressHandler];
    [(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *)v25 setExternalProgressHandler:v26];

    [(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *)v25 setExternalResultHandler:v13];
    v27 = (void *)[v12 copy];

    v28 = [(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *)v25 internalProgressHandler];
    [v27 setProgressHandler:v28];

    uint64_t v29 = [(PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *)v25 internalResultHandler];

    int v13 = (void *)v29;
  }
  else
  {
    v27 = v12;
  }
  v30 = [MEMORY[0x1E4F390D0] defaultManager];
  int v31 = [v30 requestAnimatedImageForAsset:v9 options:v27 resultHandler:v13];

  return v31;
}

void __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5F2C898;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E5F29AA8;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    int v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = *(void *)(a1 + 48) != 0;
      id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v8 error:v9];
    }
  }
}

uint64_t __78__PUPhotoKitMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PUPhotoKitMediaProvider.m", 349, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  id v12 = (void *)[v10 copy];
  [v12 setLoadingMode:0x10000];
  id v13 = _Block_copy(v11);
  id v14 = [(PUMediaProvider *)self loadingStatusManager];
  id v15 = v14;
  if (v14)
  {
    *(void *)buf = 0;
    id v54 = buf;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__62605;
    v57 = __Block_byref_object_dispose__62606;
    id v58 = 0;
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    v48 = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
    v49 = &unk_1E5F2E0D0;
    v52 = buf;
    id v50 = v14;
    id v51 = v9;
    px_dispatch_on_main_queue();
    uint64_t v16 = [v12 progressHandler];
    v17 = _Block_copy(v13);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_2;
    v42[3] = &unk_1E5F29A80;
    id v18 = v16;
    id v44 = v18;
    id v19 = v50;
    id v43 = v19;
    v45 = buf;
    [v12 setProgressHandler:v42];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E5F29BC0;
    id v40 = v17;
    id v39 = v19;
    v41 = buf;
    id v20 = v17;
    v21 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    id v13 = v21;
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_6;
  v36[3] = &unk_1E5F2DA80;
  id v22 = v13;
  id v37 = v22;
  int v23 = _Block_copy(v36);
  v24 = +[PUOneUpSettings sharedInstance];
  int v25 = [v24 simulateAssetContentLoading];

  if (v25)
  {
    v26 = PLUIGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating image URL loading because of debug 1-up settings", buf, 2u);
    }

    v27 = objc_alloc_init(PUPhotoKitMediaProviderImageDownloadSimulation);
    v28 = [v12 progressHandler];
    [(PUPhotoKitMediaProviderImageDownloadSimulation *)v27 setExternalProgressHandler:v28];

    [(PUPhotoKitMediaProviderImageDownloadSimulation *)v27 setExternalResultHandler:v23];
    uint64_t v29 = (void *)[v12 copy];

    v30 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)v27 internalProgressHandler];
    [v29 setProgressHandler:v30];

    uint64_t v31 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)v27 internalResultHandler];

    int v23 = (void *)v31;
    id v12 = v29;
  }
  v32 = [MEMORY[0x1E4F390D0] defaultManager];
  int v33 = objc_msgSend(v32, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 0, v12, v23, *MEMORY[0x1E4F396D8], *(double *)(MEMORY[0x1E4F396D8] + 8));

  return v33;
}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5F2C898;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E5F29AA8;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F396C8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:v4];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    int v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = *(void *)(a1 + 48) != 0;
      id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v8 error:v9];
    }
  }
}

uint64_t __73__PUPhotoKitMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PUPhotoKitMediaProvider.m", 290, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  id v17 = v15;
  id v18 = _Block_copy(v16);
  id v19 = [(PUMediaProvider *)self loadingStatusManager];
  id v20 = v19;
  if (v19)
  {
    *(void *)buf = 0;
    v56 = buf;
    uint64_t v57 = 0x3032000000;
    id v58 = __Block_byref_object_copy__62605;
    v59 = __Block_byref_object_dispose__62606;
    id v60 = 0;
    uint64_t v48 = MEMORY[0x1E4F143A8];
    uint64_t v49 = 3221225472;
    id v50 = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    id v51 = &unk_1E5F2E0D0;
    id v54 = buf;
    id v52 = v19;
    id v53 = v14;
    px_dispatch_on_main_queue();
    v21 = [v17 progressHandler];
    id v22 = _Block_copy(v18);
    int v23 = (void *)[v17 copy];

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    v44[3] = &unk_1E5F29A80;
    id v24 = v21;
    id v46 = v24;
    id v25 = v52;
    id v45 = v25;
    uint64_t v47 = buf;
    [v23 setProgressHandler:v44];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E5F29B98;
    id v42 = v22;
    id v41 = v25;
    id v43 = buf;
    id v26 = v22;
    v27 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    id v18 = v27;
  }
  else
  {
    int v23 = v17;
  }
  v28 = +[PUOneUpSettings sharedInstance];
  int v29 = [v28 simulateAssetContentLoading];

  if (v29)
  {
    v30 = PLUIGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v30, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating Live Photo loading because of debug 1-up settings", buf, 2u);
    }

    uint64_t v31 = objc_alloc_init(PUPhotoKitMediaProviderLivePhotoDownloadSimulation);
    v32 = [v23 progressHandler];
    [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)v31 setExternalProgressHandler:v32];

    [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)v31 setExternalResultHandler:v18];
    int v33 = (void *)[v23 copy];

    v34 = [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)v31 internalProgressHandler];
    [v33 setProgressHandler:v34];

    uint64_t v35 = [(PUPhotoKitMediaProviderLivePhotoDownloadSimulation *)v31 internalResultHandler];

    id v18 = (void *)v35;
    int v23 = v33;
  }
  id v36 = [MEMORY[0x1E4F390D0] defaultManager];
  int v37 = objc_msgSend(v36, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v14, a5, v23, v18, width, height);

  return v37;
}

void __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5F2C898;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E5F29AA8;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    int v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = *(void *)(a1 + 48) != 0;
      id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v8 error:v9];
    }
  }
}

uint64_t __97__PUPhotoKitMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PUPhotoKitMediaProvider.m", 232, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  id v12 = v10;
  id v13 = _Block_copy(v11);
  id v14 = [(PUMediaProvider *)self loadingStatusManager];
  id v15 = v14;
  if (v14)
  {
    *(void *)buf = 0;
    id v51 = buf;
    uint64_t v52 = 0x3032000000;
    id v53 = __Block_byref_object_copy__62605;
    id v54 = __Block_byref_object_dispose__62606;
    id v55 = 0;
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    id v45 = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke;
    id v46 = &unk_1E5F2E0D0;
    uint64_t v49 = buf;
    id v47 = v14;
    id v48 = v9;
    px_dispatch_on_main_queue();
    uint64_t v16 = [v12 progressHandler];
    id v17 = _Block_copy(v13);
    id v18 = (void *)[v12 copy];

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2;
    v39[3] = &unk_1E5F29A80;
    id v19 = v16;
    id v41 = v19;
    id v20 = v47;
    id v40 = v20;
    id v42 = buf;
    [v18 setProgressHandler:v39];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E5F29B70;
    id v37 = v17;
    id v36 = v20;
    v38 = buf;
    id v21 = v17;
    id v22 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    id v13 = v22;
  }
  else
  {
    id v18 = v12;
  }
  int v23 = +[PUOneUpSettings sharedInstance];
  int v24 = [v23 simulateAssetContentLoading];

  if (v24)
  {
    id v25 = PLUIGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating AVAsset loading because of debug 1-up settings", buf, 2u);
    }

    id v26 = objc_alloc_init(PUPhotoKitMediaProviderAVAssetDownloadSimulation);
    v27 = [v18 progressHandler];
    [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)v26 setExternalProgressHandler:v27];

    [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)v26 setExternalResultHandler:v13];
    v28 = (void *)[v18 copy];

    int v29 = [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)v26 internalProgressHandler];
    [v28 setProgressHandler:v29];

    uint64_t v30 = [(PUPhotoKitMediaProviderAVAssetDownloadSimulation *)v26 internalResultHandler];

    id v13 = (void *)v30;
    id v18 = v28;
  }
  uint64_t v31 = [MEMORY[0x1E4F390D0] defaultManager];
  int v32 = [v31 requestAVAssetForVideo:v9 options:v18 resultHandler:v13];

  return v32;
}

void __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5F2C898;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, uint64_t, id))(v9 + 16))(v9, v7, a3, v8);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_5;
  v14[3] = &unk_1E5F29AA8;
  id v15 = v8;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 48);
  id v17 = v7;
  uint64_t v18 = v11;
  id v16 = v10;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    BOOL v6 = *(void *)(a1 + 48) != 0;
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v6 error:v7];
  }
}

uint64_t __72__PUPhotoKitMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PUPhotoKitMediaProvider.m", 172, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  id v12 = v10;
  [v12 setLiveRenderVideoIfNeeded:1];
  id v13 = +[PUPhotoEditProtoSettings sharedInstance];
  objc_msgSend(v12, "setLiveRenderAndOnDemandRenderVideoConcurrently:", objc_msgSend(v13, "enableLiveVideoRender") ^ 1);

  id v14 = _Block_copy(v11);
  id v15 = [(PUMediaProvider *)self loadingStatusManager];
  id v16 = v15;
  if (v15)
  {
    *(void *)buf = 0;
    uint64_t v52 = buf;
    uint64_t v53 = 0x3032000000;
    id v54 = __Block_byref_object_copy__62605;
    id v55 = __Block_byref_object_dispose__62606;
    id v56 = 0;
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    id v46 = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
    id v47 = &unk_1E5F2E0D0;
    id v50 = buf;
    id v48 = v15;
    id v49 = v9;
    px_dispatch_on_main_queue();
    id v17 = [v12 progressHandler];
    uint64_t v18 = _Block_copy(v14);
    id v19 = (void *)[v12 copy];

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2;
    v40[3] = &unk_1E5F29A80;
    id v20 = v17;
    id v42 = v20;
    id v21 = v48;
    id v41 = v21;
    uint64_t v43 = buf;
    [v19 setProgressHandler:v40];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E5F29B48;
    id v38 = v18;
    id v37 = v21;
    id v39 = buf;
    id v22 = v18;
    int v23 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    id v14 = v23;
  }
  else
  {
    id v19 = v12;
  }
  int v24 = +[PUOneUpSettings sharedInstance];
  int v25 = [v24 simulateAssetContentLoading];

  if (v25)
  {
    id v26 = PLUIGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating AVPlayerItem loading because of debug 1-up settings", buf, 2u);
    }

    v27 = objc_alloc_init(PUPhotoKitMediaProviderPlayerItemDownloadSimulation);
    v28 = [v19 progressHandler];
    [(PUPhotoKitMediaProviderPlayerItemDownloadSimulation *)v27 setExternalProgressHandler:v28];

    [(PUPhotoKitMediaProviderPlayerItemDownloadSimulation *)v27 setExternalResultHandler:v14];
    int v29 = (void *)[v19 copy];

    uint64_t v30 = [(PUPhotoKitMediaProviderPlayerItemDownloadSimulation *)v27 internalProgressHandler];
    [v29 setProgressHandler:v30];

    uint64_t v31 = [(PUPhotoKitMediaProviderPlayerItemDownloadSimulation *)v27 internalResultHandler];

    id v14 = (void *)v31;
    id v19 = v29;
  }
  int v32 = [MEMORY[0x1E4F390D0] defaultManager];
  int v33 = [v32 requestPlayerItemForVideo:v9 options:v19 resultHandler:v14];

  return v33;
}

void __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5F2C898;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E5F29AA8;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    int v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = *(void *)(a1 + 48) != 0;
      id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v8 error:v9];
    }
  }
}

uint64_t __75__PUPhotoKitMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PUPhotoKitMediaProvider.m", 110, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  id v12 = v10;
  id v13 = _Block_copy(v11);
  id v14 = [(PUMediaProvider *)self loadingStatusManager];
  id v15 = v14;
  uint64_t v16 = &unk_1AEFF7000;
  if (v14)
  {
    *(void *)buf = 0;
    id v55 = buf;
    uint64_t v56 = 0x3032000000;
    uint64_t v57 = __Block_byref_object_copy__62605;
    id v58 = __Block_byref_object_dispose__62606;
    id v59 = 0;
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    id v49 = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
    id v50 = &unk_1E5F2E0D0;
    uint64_t v53 = buf;
    id v51 = v14;
    id v52 = v9;
    px_dispatch_on_main_queue();
    id v17 = [v12 progressHandler];
    uint64_t v18 = _Block_copy(v13);
    id v19 = (void *)[v12 copy];

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_2;
    v43[3] = &unk_1E5F29A80;
    id v20 = v17;
    id v45 = v20;
    id v21 = v51;
    id v44 = v21;
    id v46 = buf;
    [v19 setProgressHandler:v43];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_4;
    aBlock[3] = &unk_1E5F29AF8;
    id v41 = v18;
    id v40 = v21;
    id v42 = buf;
    id v22 = v18;
    int v23 = _Block_copy(aBlock);

    _Block_object_dispose(buf, 8);
    id v13 = v23;
    uint64_t v16 = (void *)&unk_1AEFF7000;
  }
  else
  {
    id v19 = v12;
  }
  int v24 = +[PUOneUpSettings sharedInstance];
  int v25 = [v24 simulateAssetContentLoading];

  if (v25)
  {
    id v26 = PLUIGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating image data loading because of debug 1-up settings", buf, 2u);
    }

    v27 = objc_alloc_init(PUPhotoKitMediaProviderImageDataDownloadSimulation);
    v28 = [v19 progressHandler];
    [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)v27 setExternalProgressHandler:v28];

    [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)v27 setExternalResultHandler:v13];
    int v29 = (void *)[v19 copy];

    uint64_t v30 = [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)v27 internalProgressHandler];
    [v29 setProgressHandler:v30];

    uint64_t v31 = [(PUPhotoKitMediaProviderImageDataDownloadSimulation *)v27 internalResultHandler];

    id v13 = (void *)v31;
    id v19 = v29;
  }
  int v32 = [MEMORY[0x1E4F390D0] defaultManager];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = v16[59];
  v37[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_45;
  v37[3] = &unk_1E5F29B20;
  id v38 = v13;
  id v33 = v13;
  int v34 = [v32 requestImageDataAndOrientationForAsset:v9 options:v19 resultHandler:v37];

  return v34;
}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5F2C898;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t, id))(v11 + 16))(v11, v9, a3, a4, v10);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_5;
  v16[3] = &unk_1E5F29AA8;
  id v17 = v10;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  id v19 = v9;
  uint64_t v20 = v13;
  id v18 = v12;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_45(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v8 = a5;
    id v9 = a3;
    id v11 = a2;
    uint64_t v10 = PLImageOrientationFromExifOrientation();
    (*(void (**)(uint64_t, id, id, uint64_t, id))(v5 + 16))(v5, v11, v9, v10, v8);
  }
}

void __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    BOOL v6 = *(void *)(a1 + 48) != 0;
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v6 error:v7];
  }
}

uint64_t __74__PUPhotoKitMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"PUPhotoKitMediaProvider.m", 28, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:[PHAsset class]]" object file lineNumber description];
  }
  id v17 = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5F2DA80;
  id v18 = v16;
  id v65 = v18;
  id v19 = _Block_copy(aBlock);
  uint64_t v20 = [(PUMediaProvider *)self loadingStatusManager];
  id v21 = v20;
  if (v20)
  {
    *(void *)buf = 0;
    id v59 = buf;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__62605;
    v62 = __Block_byref_object_dispose__62606;
    id v63 = 0;
    uint64_t v51 = MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    uint64_t v53 = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_37;
    id v54 = &unk_1E5F2E0D0;
    uint64_t v57 = buf;
    id v55 = v20;
    id v56 = v14;
    px_dispatch_on_main_queue();
    id v22 = [v17 progressHandler];
    int v23 = _Block_copy(v19);
    int v24 = (void *)[v17 copy];

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    v47[3] = &unk_1E5F29A80;
    id v25 = v22;
    id v49 = v25;
    id v26 = v55;
    id v48 = v26;
    id v50 = buf;
    [v24 setProgressHandler:v47];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4;
    v43[3] = &unk_1E5F29AD0;
    id v45 = v23;
    id v44 = v26;
    id v46 = buf;
    id v27 = v23;
    v28 = _Block_copy(v43);

    _Block_object_dispose(buf, 8);
    id v19 = v28;
  }
  else
  {
    int v24 = v17;
  }
  int v29 = +[PUOneUpSettings sharedInstance];
  int v30 = [v29 simulateAssetContentLoading];

  if (v30)
  {
    uint64_t v31 = PLUIGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_DEFAULT, "PhotoKitMediaProvider: Simulating image loading because of debug 1-up settings", buf, 2u);
    }

    int v32 = objc_alloc_init(PUPhotoKitMediaProviderImageDownloadSimulation);
    id v33 = [v24 progressHandler];
    [(PUPhotoKitMediaProviderImageDownloadSimulation *)v32 setExternalProgressHandler:v33];

    [(PUPhotoKitMediaProviderImageDownloadSimulation *)v32 setExternalResultHandler:v19];
    int v34 = (void *)[v24 copy];

    uint64_t v35 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)v32 internalProgressHandler];
    [v34 setProgressHandler:v35];

    uint64_t v36 = [(PUPhotoKitMediaProviderImageDownloadSimulation *)v32 internalResultHandler];

    id v19 = (void *)v36;
    int v24 = v34;
  }
  if ([v14 isCloudPlaceholder])
  {
    id v37 = [v24 progressHandler];

    if (v37)
    {
      buf[0] = 0;
      id v38 = [v24 progressHandler];
      ((void (**)(void, void, uint8_t *, void, double))v38)[2](v38, 0, buf, 0, 0.0);
    }
  }
  id v39 = [MEMORY[0x1E4F390D0] defaultManager];
  int v40 = objc_msgSend(v39, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v14, a5, v24, v19, width, height);

  return v40;
}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F396E8]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  unint64_t v8 = v7 - 9997;
  id v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F39710]];
  uint64_t v10 = [v9 BOOLValue];

  id v11 = v5;
  id v12 = v11;
  if ((v10 & 1) != 0 || (uint64_t v13 = v11, v8 <= 3))
  {
    uint64_t v13 = (void *)[v11 mutableCopy];
    id v14 = [NSNumber numberWithBool:v8 < 4];
    [v13 setObject:v14 forKeyedSubscript:@"PUMediaProviderResultIsFullSizeFormat"];

    id v15 = [NSNumber numberWithBool:v10];
    [v13 setObject:v15 forKeyedSubscript:@"PHImageResultIsPlaceholderKey"];
  }
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(uint64_t, id, void *))(v16 + 16))(v16, v17, v13);
  }
}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_37(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v2 willBeginLoadOperationWithItemIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(__n128))(v4 + 16))(a2);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E5F2C898;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  unint64_t v10 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
  v12[3] = &unk_1E5F29AA8;
  id v13 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v15 = v5;
  uint64_t v16 = v9;
  id v14 = v8;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v4 didCancelLoadOperationWithTrackingID:v5];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    int v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = *(void *)(a1 + 48) != 0;
      id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      [*(id *)(a1 + 40) didCompleteLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withSuccess:v8 error:v9];
    }
  }
}

uint64_t __93__PUPhotoKitMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateLoadOperationWithTrackingID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withProgress:*(double *)(a1 + 48)];
}

@end