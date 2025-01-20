@interface PUWallpaperShuffleResourceManager
- (BOOL)depthEnabledForAllMedia;
- (NSDictionary)initialPosterMediaByAssetUUIDs;
- (NSMutableDictionary)segmentationLoadingOperationsByAssetUUIDs;
- (NSOperationQueue)exportOperationQueue;
- (NSOperationQueue)operationQueue;
- (NSOperationQueue)requestOperationQueue;
- (NSURL)assetDirectory;
- (PHPhotoLibrary)photoLibrary;
- (PIParallaxStyle)persistedStyle;
- (PIParallaxStyle)style;
- (PUWallpaperShuffleLayerStackLoadingOperation)currentLayerStackOperation;
- (PUWallpaperShuffleLayerStackLoadingOperation)nextLayerStackOperation;
- (PUWallpaperShuffleResourceManager)initWithPosterMedia:(id)a3 style:(id)a4 assetDirectory:(id)a5 persistedStyle:(id)a6 photoLibrary:(id)a7 shuffleType:(int64_t)a8;
- (id)_loadResourceForPosterMedia:(id)a3 isPreloading:(BOOL)a4 completion:(id)a5;
- (id)segmentationItemLoadingOperationForPosterMedia:(id)a3;
- (int64_t)shuffleType;
- (void)_handleSetStyle:(id)a3;
- (void)_preloadNextMedia;
- (void)cancelPreloading;
- (void)exportResourcesForFinalPosterMedia:(id)a3 options:(unint64_t)a4 assetDirectory:(id)a5 progressHandler:(id)a6 completion:(id)a7;
- (void)preloadResourceForPosterMedia:(id)a3;
- (void)requestResourceForPosterMedia:(id)a3 completion:(id)a4;
- (void)setCurrentLayerStackOperation:(id)a3;
- (void)setDepthEnabledForAllMedia:(BOOL)a3;
- (void)setNextLayerStackOperation:(id)a3;
- (void)setStyle:(id)a3;
- (void)startPreloadingResourcesForPosterMedia:(id)a3;
- (void)stopPreloadingResources;
- (void)stopPreloadingResourcesWithTimeout:(double)a3;
@end

@implementation PUWallpaperShuffleResourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetDirectory, 0);
  objc_storeStrong((id *)&self->_nextLayerStackOperation, 0);
  objc_storeStrong((id *)&self->_currentLayerStackOperation, 0);
  objc_storeStrong((id *)&self->_segmentationLoadingOperationsByAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_exportOperationQueue, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_persistedStyle, 0);
  objc_storeStrong((id *)&self->_initialPosterMediaByAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (void)setNextLayerStackOperation:(id)a3
{
}

- (PUWallpaperShuffleLayerStackLoadingOperation)nextLayerStackOperation
{
  return self->_nextLayerStackOperation;
}

- (void)setCurrentLayerStackOperation:(id)a3
{
}

- (PUWallpaperShuffleLayerStackLoadingOperation)currentLayerStackOperation
{
  return self->_currentLayerStackOperation;
}

- (NSMutableDictionary)segmentationLoadingOperationsByAssetUUIDs
{
  return self->_segmentationLoadingOperationsByAssetUUIDs;
}

- (NSOperationQueue)exportOperationQueue
{
  return self->_exportOperationQueue;
}

- (NSOperationQueue)requestOperationQueue
{
  return self->_requestOperationQueue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (PIParallaxStyle)persistedStyle
{
  return self->_persistedStyle;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (NSDictionary)initialPosterMediaByAssetUUIDs
{
  return self->_initialPosterMediaByAssetUUIDs;
}

- (BOOL)depthEnabledForAllMedia
{
  return self->_depthEnabledForAllMedia;
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (id)segmentationItemLoadingOperationForPosterMedia:(id)a3
{
  id v4 = a3;
  v5 = [(PUWallpaperShuffleResourceManager *)self segmentationLoadingOperationsByAssetUUIDs];
  v6 = [v4 assetUUID];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8 = [PUWallpaperShuffleSegmentationLoadingOperation alloc];
    v9 = [(PUWallpaperShuffleResourceManager *)self assetDirectory];
    v10 = [(PUWallpaperShuffleResourceManager *)self photoLibrary];
    v7 = [(PUWallpaperShuffleSegmentationLoadingOperation *)v8 initWithPosterMedia:v4 assetDirectory:v9 photoLibrary:v10 isPreloading:0];

    v11 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
    [v11 addOperation:v7];
  }
  return v7;
}

- (void)exportResourcesForFinalPosterMedia:(id)a3 options:(unint64_t)a4 assetDirectory:(id)a5 progressHandler:(id)a6 completion:(id)a7
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v54 = a6;
  id v53 = a7;
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v59 = [(PUWallpaperShuffleResourceManager *)self style];
  v13 = [PUWallpaperExportProgress alloc];
  v14 = PXMap();
  v60 = [(PUWallpaperExportProgress *)v13 initWithAssetUUIDs:v14 progressHandler:v54];

  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v15 = PLWallpaperGetLog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  v17 = v15;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "exportResourcesForFinalPosterMedia", "", buf, 2u);
  }
  os_signpost_id_t v51 = v16;
  v52 = v18;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v50 = mach_absolute_time();
  v19 = PLWallpaperGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
    v21 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
    v22 = [v21 operations];
    *(_DWORD *)buf = 134218242;
    v96 = v20;
    __int16 v97 = 2114;
    v98 = v22;
    _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_INFO, "Starting shuffle export with current operations in the queue %p:\n%{public}@", buf, 0x16u);
  }
  v63 = [(PUWallpaperShuffleResourceManager *)self assetDirectory];
  id v61 = v12;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v11;
  uint64_t v62 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
  if (v62)
  {
    uint64_t v56 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v90 != v56) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        v25 = [v24 assetUUID];
        v26 = [(PUWallpaperShuffleResourceManager *)self segmentationLoadingOperationsByAssetUUIDs];
        v27 = [v26 objectForKeyedSubscript:v25];

        if (!v27)
        {
          v28 = [PUWallpaperShuffleSegmentationLoadingOperation alloc];
          v29 = [(PUWallpaperShuffleResourceManager *)self photoLibrary];
          v27 = [(PUWallpaperShuffleSegmentationLoadingOperation *)v28 initWithPosterMedia:v24 assetDirectory:v63 photoLibrary:v29 isPreloading:0];

          [v64 addObject:v27];
        }
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_54;
        v86[3] = &unk_1E5F25348;
        v30 = v60;
        v87 = v30;
        id v31 = v25;
        id v88 = v31;
        [(PUWallpaperShuffleSegmentationLoadingOperation *)v27 setDownloadProgressHandler:v86];
        v32 = objc_alloc_init(PUWallpaperShuffleResourceExportOperation);
        [(PUWallpaperShuffleResourceExportOperation *)v32 setSourceDirectory:v63];
        [(PUWallpaperShuffleResourceExportOperation *)v32 setExportDirectory:v61];
        v33 = [(PUWallpaperShuffleResourceManager *)self initialPosterMediaByAssetUUIDs];
        uint64_t v34 = [v33 objectForKeyedSubscript:v31];
        v35 = (void *)v34;
        if (v34) {
          v36 = (void *)v34;
        }
        else {
          v36 = v24;
        }
        [(PUWallpaperShuffleResourceExportOperation *)v32 setPosterMedia:v36];

        v37 = [v24 editConfiguration];
        [(PUWallpaperShuffleResourceExportOperation *)v32 setEditConfiguration:v37];

        [(PUWallpaperShuffleResourceExportOperation *)v32 setStyle:v59];
        v38 = [(PUWallpaperShuffleResourceManager *)self persistedStyle];
        [(PUWallpaperShuffleResourceExportOperation *)v32 setPersistedStyle:v38];

        [(PUWallpaperShuffleResourceExportOperation *)v32 setOptions:a4];
        objc_initWeak((id *)buf, v32);
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_2;
        v81[3] = &unk_1E5F2D3F0;
        objc_copyWeak(&v85, (id *)buf);
        id v82 = v58;
        v39 = v30;
        v83 = v39;
        id v40 = v31;
        id v84 = v40;
        [(PUWallpaperShuffleResourceExportOperation *)v32 setCompletionBlock:v81];
        objc_initWeak(&location, v27);
        v41 = (void *)MEMORY[0x1E4F28B48];
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_3;
        v75[3] = &unk_1E5F25370;
        objc_copyWeak(&v78, (id *)buf);
        objc_copyWeak(&v79, &location);
        v76 = v39;
        id v42 = v40;
        id v77 = v42;
        v43 = [v41 blockOperationWithBlock:v75];
        [v43 addDependency:v27];
        [(PUWallpaperShuffleResourceExportOperation *)v32 addDependency:v43];
        [v64 addObject:v43];
        [v64 addObject:v32];

        objc_destroyWeak(&v79);
        objc_destroyWeak(&v78);
        objc_destroyWeak(&location);

        objc_destroyWeak(&v85);
        objc_destroyWeak((id *)buf);
      }
      uint64_t v62 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
    }
    while (v62);
  }

  v44 = [(PUWallpaperShuffleResourceManager *)self exportOperationQueue];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_4;
  v73[3] = &unk_1E5F2ED10;
  v45 = v60;
  v74 = v45;
  [v44 addBarrierBlock:v73];
  [v44 addOperations:v64 waitUntilFinished:0];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_5;
  v65[3] = &unk_1E5F25398;
  v66 = v45;
  v67 = v52;
  id v69 = v53;
  uint64_t v70 = v50;
  os_signpost_id_t v71 = v51;
  mach_timebase_info v72 = info;
  id v68 = v58;
  id v46 = v58;
  id v47 = v53;
  v48 = v52;
  v49 = v45;
  [v44 addBarrierBlock:v65];
}

uint64_t __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportDownloadProgress:forAssetUUID:", *(void *)(a1 + 40));
}

void __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = [WeakRetained error];

  if (v2)
  {
    v3 = [WeakRetained error];
    id v4 = *(void **)(a1 + 32);
    v5 = [WeakRetained posterMedia];
    v6 = [v5 assetUUID];
    [v4 setObject:v3 forKeyedSubscript:v6];
  }
  [*(id *)(a1 + 40) reportProcessingProgress:*(void *)(a1 + 48) forAssetUUID:1.0];
}

void __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = [v2 segmentationItem];

  if (v3)
  {
    id v4 = [v2 segmentationItem];
    [WeakRetained setSegmentationItem:v4];
  }
  else
  {
    id v4 = [v2 error];
    [WeakRetained setError:v4];
  }

  [*(id *)(a1 + 32) reportDownloadProgress:*(void *)(a1 + 40) forAssetUUID:1.0];
}

uint64_t __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) begin];
}

void __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) finish];
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = *(void *)(a1 + 64);
  unsigned int v5 = *(_DWORD *)(a1 + 80);
  unsigned int v4 = *(_DWORD *)(a1 + 84);
  v6 = *(id *)(a1 + 40);
  v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 72);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "exportResourcesForFinalPosterMedia", "", buf, 2u);
  }

  v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "exportResourcesForFinalPosterMedia";
    __int16 v14 = 2048;
    double v15 = (float)((float)((float)((float)(v2 - v3) * (float)v5) / (float)v4) / 1000000.0);
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  px_dispatch_on_main_queue();
}

uint64_t __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __122__PUWallpaperShuffleResourceManager_exportResourcesForFinalPosterMedia_options_assetDirectory_progressHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetUUID];
}

- (void)preloadResourceForPosterMedia:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PUWallpaperShuffleResourceManager *)self cancelPreloading];
  unsigned int v5 = PLWallpaperGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 assetUUID];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "Preloading shuffle asset %{public}@", buf, 0xCu);
  }
  v7 = PLWallpaperGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "preloadResourceForPosterMedia", "", buf, 2u);
  }

  *(void *)buf = 0;
  mach_timebase_info((mach_timebase_info_t)buf);
  uint64_t v11 = mach_absolute_time();
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __67__PUWallpaperShuffleResourceManager_preloadResourceForPosterMedia___block_invoke;
  v17 = &unk_1E5F25300;
  v18 = v10;
  uint64_t v19 = v11;
  os_signpost_id_t v20 = v8;
  uint64_t v21 = *(void *)buf;
  id v12 = v10;
  v13 = [(PUWallpaperShuffleResourceManager *)self _loadResourceForPosterMedia:v4 isPreloading:1 completion:&v14];
  -[PUWallpaperShuffleResourceManager setNextLayerStackOperation:](self, "setNextLayerStackOperation:", v13, v14, v15, v16, v17);
}

void __67__PUWallpaperShuffleResourceManager_preloadResourceForPosterMedia___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  unsigned int v6 = *(_DWORD *)(a1 + 56);
  unsigned int v5 = *(_DWORD *)(a1 + 60);
  uint64_t v7 = *(void *)(a1 + 40);
  os_signpost_id_t v8 = *(id *)(a1 + 32);
  v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v9, OS_SIGNPOST_INTERVAL_END, v10, "preloadResourceForPosterMedia", "", (uint8_t *)&v16, 2u);
  }

  uint64_t v11 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    v17 = "preloadResourceForPosterMedia";
    __int16 v18 = 2048;
    double v19 = (float)((float)((float)((float)(v4 - v7) * (float)v6) / (float)v5) / 1000000.0);
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v16, 0x16u);
  }
  id v12 = [v3 layerStack];
  if (!v12)
  {
    if ([v3 isCancelled]) {
      goto LABEL_8;
    }
    id v12 = PLWallpaperGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v3 posterMedia];
      uint64_t v14 = [v13 assetUUID];
      uint64_t v15 = [v3 error];
      int v16 = 138543618;
      v17 = v14;
      __int16 v18 = 2114;
      double v19 = *(double *)&v15;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Failed to preload shuffle asset %{public}@, error: %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }

LABEL_8:
}

- (void)cancelPreloading
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUWallpaperShuffleResourceManager *)self nextLayerStackOperation];

  if (v3)
  {
    uint64_t v4 = PLWallpaperGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unsigned int v5 = [(PUWallpaperShuffleResourceManager *)self nextLayerStackOperation];
      unsigned int v6 = [v5 posterMedia];
      uint64_t v7 = [v6 assetUUID];
      int v9 = 138543362;
      os_signpost_id_t v10 = v7;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_INFO, "Canceling preloading for shuffle asset %{public}@", (uint8_t *)&v9, 0xCu);
    }
    os_signpost_id_t v8 = [(PUWallpaperShuffleResourceManager *)self nextLayerStackOperation];
    [v8 cancel];

    [(PUWallpaperShuffleResourceManager *)self setNextLayerStackOperation:0];
  }
}

- (id)_loadResourceForPosterMedia:(id)a3 isPreloading:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v8 = a5;
  int v9 = [(PUWallpaperShuffleResourceManager *)self initialPosterMediaByAssetUUIDs];
  os_signpost_id_t v10 = [v45 assetUUID];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  id v12 = (void *)v11;
  v13 = v45;
  if (v11) {
    v13 = (void *)v11;
  }
  id v44 = v13;

  uint64_t v14 = [(PUWallpaperShuffleResourceManager *)self segmentationLoadingOperationsByAssetUUIDs];
  uint64_t v15 = [v45 assetUUID];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];

  v17 = (PUWallpaperShuffleSegmentationLoadingOperation *)v16;
  if (v16)
  {
    if (v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v39 = [PUWallpaperShuffleSegmentationLoadingOperation alloc];
  id v40 = [(PUWallpaperShuffleResourceManager *)self assetDirectory];
  v41 = [(PUWallpaperShuffleResourceManager *)self photoLibrary];
  v17 = [(PUWallpaperShuffleSegmentationLoadingOperation *)v39 initWithPosterMedia:v44 assetDirectory:v40 photoLibrary:v41 isPreloading:v6];

  if (!v6)
  {
LABEL_5:
    -[PUWallpaperShuffleSegmentationLoadingOperation setQueuePriority:](v17, "setQueuePriority:", 8, v44);
    [(PUWallpaperShuffleSegmentationLoadingOperation *)v17 setQualityOfService:25];
  }
LABEL_6:
  __int16 v18 = [PUWallpaperShuffleLayerStackLoadingOperation alloc];
  double v19 = [v45 editConfiguration];
  uint64_t v20 = [(PUWallpaperShuffleResourceManager *)self assetDirectory];
  uint64_t v21 = [(PUWallpaperShuffleResourceManager *)self style];
  v22 = [(PUWallpaperShuffleResourceManager *)self persistedStyle];
  uint64_t v23 = [(PUWallpaperShuffleLayerStackLoadingOperation *)v18 initWithPosterMedia:v44 editConfiguration:v19 assetDirectory:v20 style:v21 persistedStyle:v22 isPreloading:v6];

  objc_initWeak(&location, v23);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __89__PUWallpaperShuffleResourceManager__loadResourceForPosterMedia_isPreloading_completion___block_invoke;
  v50[3] = &unk_1E5F29240;
  objc_copyWeak(&v52, &location);
  id v24 = v8;
  id v51 = v24;
  [(PUWallpaperShuffleLayerStackLoadingOperation *)v23 setCompletionBlock:v50];
  if (!v6)
  {
    [(PUWallpaperShuffleLayerStackLoadingOperation *)v23 setQueuePriority:8];
    [(PUWallpaperShuffleLayerStackLoadingOperation *)v23 setQualityOfService:25];
  }
  if (v16 && [(PXAsyncOperation *)v17 isFinished])
  {
    v25 = PLWallpaperGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = [v45 assetUUID];
      *(_DWORD *)buf = 138543362;
      v55 = v26;
      _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_INFO, "Shuffle poster media already segmented: %{public}@", buf, 0xCu);
    }
    uint64_t v27 = [(PUWallpaperShuffleSegmentationLoadingOperation *)v17 segmentationItem];
    [(PUWallpaperShuffleLayerStackLoadingOperation *)v23 setSegmentationItem:v27];

    v28 = [(PUWallpaperShuffleSegmentationLoadingOperation *)v17 segmentationItem];
    LOBYTE(v27) = v28 == 0;

    if (v27)
    {
      v29 = [(PUWallpaperShuffleSegmentationLoadingOperation *)v17 error];
      [(PUWallpaperShuffleLayerStackLoadingOperation *)v23 setError:v29];
    }
    else
    {
      v29 = [(PUWallpaperShuffleSegmentationLoadingOperation *)v17 segmentationItem];
      [(PUWallpaperShuffleLayerStackLoadingOperation *)v23 setSegmentationItem:v29];
    }

    if ([(PUWallpaperShuffleLayerStackLoadingOperation *)v23 tryLoadLayerStackFromDirectory])
    {
LABEL_26:
      (*((void (**)(id, PUWallpaperShuffleLayerStackLoadingOperation *))v24 + 2))(v24, v23);
      v38 = 0;
      goto LABEL_28;
    }
    id v42 = [(PUWallpaperShuffleResourceManager *)self requestOperationQueue];
    [v42 addOperation:v23];

    v38 = v23;
  }
  else
  {
    if ([(PUWallpaperShuffleSegmentationLoadingOperation *)v17 tryLoadSegmentationFromDirectory]&& [(PUWallpaperShuffleLayerStackLoadingOperation *)v23 tryLoadLayerStackFromDirectory])
    {
      v30 = PLWallpaperGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = [v45 assetUUID];
        *(_DWORD *)buf = 138543362;
        v55 = v31;
        _os_log_impl(&dword_1AE9F8000, v30, OS_LOG_TYPE_INFO, "Shuffle poster media was loaded from directory: %{public}@", buf, 0xCu);
      }
      v32 = [(PUWallpaperShuffleSegmentationLoadingOperation *)v17 segmentationItem];
      [(PUWallpaperShuffleLayerStackLoadingOperation *)v23 setSegmentationItem:v32];

      goto LABEL_26;
    }
    v33 = [(PUWallpaperShuffleResourceManager *)self requestOperationQueue];
    if (!v16)
    {
      uint64_t v34 = [(PUWallpaperShuffleResourceManager *)self segmentationLoadingOperationsByAssetUUIDs];
      v35 = [v45 assetUUID];
      [v34 setObject:v17 forKeyedSubscript:v35];

      [v33 addOperation:v17];
    }
    objc_initWeak((id *)buf, v17);
    objc_initWeak(&from, v23);
    v36 = (void *)MEMORY[0x1E4F28B48];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __89__PUWallpaperShuffleResourceManager__loadResourceForPosterMedia_isPreloading_completion___block_invoke_49;
    v46[3] = &unk_1E5F252D8;
    objc_copyWeak(&v47, (id *)buf);
    objc_copyWeak(&v48, &from);
    v37 = [v36 blockOperationWithBlock:v46];
    [v37 addDependency:v17];
    [(PUWallpaperShuffleLayerStackLoadingOperation *)v23 addDependency:v37];
    [v33 addOperation:v37];
    [v33 addOperation:v23];
    v38 = v23;

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)buf);
  }
LABEL_28:

  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);

  return v38;
}

void __89__PUWallpaperShuffleResourceManager__loadResourceForPosterMedia_isPreloading_completion___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_loadWeakRetained(&to);
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  objc_destroyWeak(&to);
}

void __89__PUWallpaperShuffleResourceManager__loadResourceForPosterMedia_isPreloading_completion___block_invoke_49(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained segmentationItem];

  if (v3)
  {
    uint64_t v4 = [WeakRetained segmentationItem];
    [v2 setSegmentationItem:v4];
  }
  else
  {
    uint64_t v4 = [WeakRetained error];
    [v2 setError:v4];
  }
}

- (void)requestResourceForPosterMedia:(id)a3 completion:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLWallpaperGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  os_signpost_id_t v10 = v8;
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "requestResourceForPosterMedia", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = mach_absolute_time();
  v13 = [(PUWallpaperShuffleResourceManager *)self style];
  uint64_t v14 = [v13 bakedStyle];

  int64_t v15 = [(PUWallpaperShuffleResourceManager *)self shuffleType];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke;
  aBlock[3] = &unk_1E5F252B0;
  uint64_t v52 = v12;
  mach_timebase_info v55 = info;
  os_signpost_id_t v53 = v9;
  int64_t v54 = v15;
  v43 = v11;
  id v48 = v43;
  v49 = self;
  id v42 = v14;
  id v50 = v42;
  id v16 = v7;
  id v51 = v16;
  v41 = _Block_copy(aBlock);
  v17 = [(PUWallpaperShuffleResourceManager *)self nextLayerStackOperation];
  __int16 v18 = [v17 posterMedia];
  id v19 = [v18 assetUUID];
  uint64_t v20 = v6;
  id v21 = [v6 assetUUID];
  if (v19 == v21)
  {
  }
  else
  {
    char v22 = [v19 isEqual:v21];

    if ((v22 & 1) == 0)
    {

LABEL_10:
      [(PUWallpaperShuffleResourceManager *)self cancelPreloading];
      v28 = PLWallpaperGetLog();
      v29 = v20;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v30 = [v20 assetUUID];
        *(_DWORD *)buf = 138543362;
        id v58 = v30;
        _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_INFO, "Shuffle asset was NOT preloaded %{public}@", buf, 0xCu);
      }
      id v31 = v20;
      v32 = v41;
      v33 = [(PUWallpaperShuffleResourceManager *)self _loadResourceForPosterMedia:v31 isPreloading:0 completion:v41];
      [(PUWallpaperShuffleResourceManager *)self setCurrentLayerStackOperation:v33];

      goto LABEL_21;
    }
  }
  id v23 = v16;
  id v24 = [v17 style];
  id v25 = [(PUWallpaperShuffleResourceManager *)self style];
  if (v24 == v25)
  {
  }
  else
  {
    v26 = v25;
    char v27 = [v24 isEqual:v25];

    id v16 = v23;
    if ((v27 & 1) == 0) {
      goto LABEL_10;
    }
  }
  int v34 = [v17 isFinished];
  v35 = PLWallpaperGetLog();
  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
  v29 = v20;
  if (v34)
  {
    v32 = v41;
    if (v36)
    {
      v37 = [v29 assetUUID];
      *(_DWORD *)buf = 138543362;
      id v58 = v37;
      _os_log_impl(&dword_1AE9F8000, v35, OS_LOG_TYPE_INFO, "Shuffle asset was preloaded %{public}@", buf, 0xCu);
    }
    (*((void (**)(void *, void *))v41 + 2))(v41, v17);
  }
  else
  {
    v32 = v41;
    if (v36)
    {
      v38 = [v29 assetUUID];
      *(_DWORD *)buf = 138543362;
      id v58 = v38;
      _os_log_impl(&dword_1AE9F8000, v35, OS_LOG_TYPE_INFO, "Shuffle asset is still preloading %{public}@", buf, 0xCu);
    }
    v39 = [(PUWallpaperShuffleResourceManager *)self requestOperationQueue];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke_46;
    v44[3] = &unk_1E5F2EA60;
    id v46 = v41;
    id v40 = v17;
    id v45 = v40;
    [v39 addBarrierBlock:v44];

    [(PUWallpaperShuffleResourceManager *)self setCurrentLayerStackOperation:v40];
    [(PUWallpaperShuffleResourceManager *)self setNextLayerStackOperation:0];

    id v16 = v23;
  }
LABEL_21:
}

void __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = mach_absolute_time();
  uint64_t v5 = *(void *)(a1 + 64);
  unsigned int v7 = *(_DWORD *)(a1 + 88);
  unsigned int v6 = *(_DWORD *)(a1 + 92);
  id v8 = *(id *)(a1 + 32);
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 72);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v9, OS_SIGNPOST_INTERVAL_END, v10, "requestResourceForPosterMedia", "", buf, 2u);
  }

  uint64_t v11 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v42 = "requestResourceForPosterMedia";
    __int16 v43 = 2048;
    double v44 = (float)((float)((float)((float)(v4 - v5) * (float)v7) / (float)v6) / 1000000.0);
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v12 = [v3 segmentationItem];
  v13 = [v3 layerStack];
  uint64_t v14 = [v3 error];
  if (!v13 && ([v3 isCancelled] & 1) == 0)
  {
    int64_t v15 = PLWallpaperGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v3 posterMedia];
      v17 = [v16 assetUUID];
      __int16 v18 = [v3 error];
      *(_DWORD *)buf = 138543618;
      id v42 = v17;
      __int16 v43 = 2114;
      double v44 = *(double *)&v18;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Failed to load shuffle asset %{public}@, error: %{public}@", buf, 0x16u);
    }
  }
  id v19 = [v3 editConfiguration];
  if (*(void *)(a1 + 80) != 1)
  {
    uint64_t v20 = objc_msgSend(v13, "compoundLayerStackByUpdatingPortraitDepthEnabled:landscapeDepthEnabled:", objc_msgSend(*(id *)(a1 + 40), "depthEnabledForAllMedia"), objc_msgSend(*(id *)(a1 + 40), "depthEnabledForAllMedia"));

    objc_msgSend(v19, "setIsDepthEnabled:", objc_msgSend(*(id *)(a1 + 40), "depthEnabledForAllMedia"));
    v13 = (void *)v20;
  }
  if (v13 && !v19)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F8CD08]);
    id v21 = [v13 layout];
    char v22 = [v21 portraitLayout];
    [v22 normalizedVisibleFrame];
    PXRectFlippedVertically();
    objc_msgSend(v19, "setNormalizedVisibleFrame:");

    id v23 = [v13 layout];
    id v24 = [v23 landscapeLayout];
    [v24 normalizedVisibleFrame];
    PXRectFlippedVertically();
    objc_msgSend(v19, "setNormalizedLandscapeVisibleFrame:");

    id v25 = [v13 portraitLayerStack];
    objc_msgSend(v19, "setIsDepthEnabled:", objc_msgSend(v25, "depthEnabled"));

    v26 = [v13 landscapeLayerStack];
    objc_msgSend(v19, "setIsLandscapeDepthEnabled:", objc_msgSend(v26, "depthEnabled"));

    char v27 = [v13 portraitLayerStack];
    if ([v27 parallaxDisabled])
    {
      [v19 setIsPerspectiveZoomEnabled:0];
    }
    else
    {
      v28 = [v13 layout];
      v29 = [v28 portraitLayout];
      if ([v29 canApplyParallax])
      {
        [v13 layout];
        v30 = v37 = v14;
        id v31 = [v30 landscapeLayout];
        objc_msgSend(v19, "setIsPerspectiveZoomEnabled:", objc_msgSend(v31, "canApplyParallax"));

        uint64_t v14 = v37;
      }
      else
      {
        [v19 setIsPerspectiveZoomEnabled:0];
      }
    }
  }
  v32 = [v12 adjustedStyleForHeadroom:*(void *)(a1 + 48)];
  [v19 setStyle:v32];

  id v40 = *(id *)(a1 + 56);
  v38 = v12;
  v39 = v13;
  id v33 = v14;
  id v34 = v19;
  id v35 = v13;
  id v36 = v12;
  px_dispatch_on_main_queue();
}

uint64_t __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __78__PUWallpaperShuffleResourceManager_requestResourceForPosterMedia_completion___block_invoke_44(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (void)_preloadNextMedia
{
  id v3 = [(PUWallpaperShuffleResourceManager *)self nextLayerStackOperation];

  if (v3)
  {
    uint64_t v4 = [(PUWallpaperShuffleResourceManager *)self nextLayerStackOperation];
    id v5 = [v4 posterMedia];

    [(PUWallpaperShuffleResourceManager *)self preloadResourceForPosterMedia:v5];
  }
}

- (void)setDepthEnabledForAllMedia:(BOOL)a3
{
  if (self->_depthEnabledForAllMedia != a3)
  {
    self->_depthEnabledForAllMedia = a3;
    objc_initWeak(&location, self);
    id v5 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__PUWallpaperShuffleResourceManager_setDepthEnabledForAllMedia___block_invoke;
    v6[3] = &unk_1E5F2D918;
    objc_copyWeak(&v7, &location);
    BOOL v8 = a3;
    [v5 addBarrierBlock:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __64__PUWallpaperShuffleResourceManager_setDepthEnabledForAllMedia___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSetDepthEnabledForAllMedia:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_handleSetStyle:(id)a3
{
  id v7 = a3;
  id v4 = [(PUWallpaperShuffleResourceManager *)self style];
  if (v4 == v7)
  {

    goto LABEL_5;
  }
  id v5 = v4;
  int v6 = objc_msgSend(v4, "isEqual:");

  if (v6) {
LABEL_5:
  }
    [(PUWallpaperShuffleResourceManager *)self _preloadNextMedia];
}

- (void)setStyle:(id)a3
{
  id v5 = (PIParallaxStyle *)a3;
  int v6 = self->_style;
  if (v6 == v5)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = [(PIParallaxStyle *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_style, a3);
      objc_initWeak(&location, self);
      os_signpost_id_t v9 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __46__PUWallpaperShuffleResourceManager_setStyle___block_invoke;
      v10[3] = &unk_1E5F2E4E8;
      objc_copyWeak(&v12, &location);
      uint64_t v11 = v5;
      [v9 addBarrierBlock:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __46__PUWallpaperShuffleResourceManager_setStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleSetStyle:*(void *)(a1 + 32)];
}

- (void)stopPreloadingResources
{
  id v3 = [(PUWallpaperShuffleResourceManager *)self requestOperationQueue];
  [v3 cancelAllOperations];

  id v4 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
  [v4 cancelAllOperations];

  id v5 = [(PUWallpaperShuffleResourceManager *)self exportOperationQueue];
  [v5 cancelAllOperations];
}

- (void)stopPreloadingResourcesWithTimeout:(double)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = PLWallpaperGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  char v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "stopPreloadingResourcesWithTimeout", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = mach_absolute_time();
  os_signpost_id_t v10 = dispatch_group_create();
  uint64_t v11 = PLWallpaperGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
    uint64_t v13 = [v12 operationCount];
    uint64_t v14 = [(PUWallpaperShuffleResourceManager *)self requestOperationQueue];
    uint64_t v15 = [v14 operationCount];
    *(_DWORD *)buf = 134217984;
    id v40 = (const char *)(v15 + v13);
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_INFO, "Cancelling %lu shuffle operations...", buf, 0xCu);
  }
  dispatch_group_enter(v10);
  id v16 = [(PUWallpaperShuffleResourceManager *)self requestOperationQueue];
  [v16 cancelAllOperations];

  v17 = [(PUWallpaperShuffleResourceManager *)self requestOperationQueue];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke;
  v36[3] = &unk_1E5F2ED10;
  __int16 v18 = v10;
  v37 = v18;
  [v17 addBarrierBlock:v36];

  dispatch_group_enter(v18);
  id v19 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
  [v19 cancelAllOperations];

  uint64_t v20 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke_2;
  v34[3] = &unk_1E5F2ED10;
  id v21 = v18;
  id v35 = v21;
  [v20 addBarrierBlock:v34];

  dispatch_group_enter(v21);
  char v22 = [(PUWallpaperShuffleResourceManager *)self exportOperationQueue];
  [v22 cancelAllOperations];

  id v23 = [(PUWallpaperShuffleResourceManager *)self exportOperationQueue];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke_3;
  v32[3] = &unk_1E5F2ED10;
  id v24 = v21;
  id v33 = v24;
  [v23 addBarrierBlock:v32];

  dispatch_time_t v25 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  if (dispatch_group_wait(v24, v25))
  {
    v26 = PLWallpaperGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_FAULT, "Timed out waiting for shuffle operations", buf, 2u);
    }
  }
  uint64_t v27 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v30 = v8;
  id v31 = v30;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v31, OS_SIGNPOST_INTERVAL_END, v6, "stopPreloadingResourcesWithTimeout", "", buf, 2u);
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v40 = "stopPreloadingResourcesWithTimeout";
    __int16 v41 = 2048;
    double v42 = (float)((float)((float)((float)(v27 - v9) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

void __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke(uint64_t a1)
{
}

void __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke_2(uint64_t a1)
{
}

void __72__PUWallpaperShuffleResourceManager_stopPreloadingResourcesWithTimeout___block_invoke_3(uint64_t a1)
{
}

- (void)startPreloadingResourcesForPosterMedia:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLWallpaperGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  char v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "startPreloadingResourcesForPosterMedia", "", buf, 2u);
  }
  id v34 = v8;
  os_signpost_id_t v35 = v6;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v32 = mach_absolute_time();
  uint64_t v9 = [v4 count];
  os_signpost_id_t v10 = PLWallpaperGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v56 = v9;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_INFO, "Started preloading resources for %ld shuffle assets.", buf, 0xCu);
  }

  v38 = [(PUWallpaperShuffleResourceManager *)self photoLibrary];
  v37 = [(PUWallpaperShuffleResourceManager *)self assetDirectory];
  id v36 = [(PUWallpaperShuffleResourceManager *)self operationQueue];
  id v33 = self;
  uint64_t v11 = [(PUWallpaperShuffleResourceManager *)self segmentationLoadingOperationsByAssetUUIDs];
  id v12 = (void *)[v11 mutableCopy];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v19 = [v18 assetUUID];
        uint64_t v20 = [v11 objectForKeyedSubscript:v19];

        if (!v20)
        {
          uint64_t v20 = [[PUWallpaperShuffleSegmentationLoadingOperation alloc] initWithPosterMedia:v18 assetDirectory:v37 photoLibrary:v38 isPreloading:1];
          [(PUWallpaperShuffleSegmentationLoadingOperation *)v20 setQueuePriority:-4];
          [(PUWallpaperShuffleSegmentationLoadingOperation *)v20 setQualityOfService:17];
          id v21 = [v18 assetUUID];
          [v11 setObject:v20 forKeyedSubscript:v21];

          [v36 addOperation:v20];
        }
        char v22 = [v18 assetUUID];
        [v12 removeObjectForKey:v22];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v15);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v23 = v12;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        v29 = [v23 objectForKeyedSubscript:v28];
        [v29 cancel];

        [v11 setObject:0 forKeyedSubscript:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v25);
  }

  v30 = [(PUWallpaperShuffleResourceManager *)v33 operationQueue];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __76__PUWallpaperShuffleResourceManager_startPreloadingResourcesForPosterMedia___block_invoke;
  v39[3] = &unk_1E5F2D670;
  id v40 = v34;
  uint64_t v41 = v32;
  os_signpost_id_t v42 = v35;
  mach_timebase_info v43 = info;
  id v31 = v34;
  [v30 addBarrierBlock:v39];
}

void __76__PUWallpaperShuffleResourceManager_startPreloadingResourcesForPosterMedia___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = mach_absolute_time();
  unsigned int v4 = *(_DWORD *)(a1 + 56);
  unsigned int v3 = *(_DWORD *)(a1 + 60);
  uint64_t v5 = *(void *)(a1 + 40);
  os_signpost_id_t v6 = *(id *)(a1 + 32);
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "startPreloadingResourcesForPosterMedia", "", (uint8_t *)&v10, 2u);
  }

  uint64_t v9 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    uint64_t v11 = "startPreloadingResourcesForPosterMedia";
    __int16 v12 = 2048;
    double v13 = (float)((float)((float)((float)(v2 - v5) * (float)v4) / (float)v3) / 1000000.0);
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v10, 0x16u);
  }
}

- (PUWallpaperShuffleResourceManager)initWithPosterMedia:(id)a3 style:(id)a4 assetDirectory:(id)a5 persistedStyle:(id)a6 photoLibrary:(id)a7 shuffleType:(int64_t)a8
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v45 = a7;
  v50.receiver = self;
  v50.super_class = (Class)PUWallpaperShuffleResourceManager;
  __int16 v18 = [(PUWallpaperShuffleResourceManager *)&v50 init];
  id v19 = v18;
  if (v18)
  {
    id v42 = v17;
    id v43 = v16;
    id v44 = v15;
    v18->_shuffleType = a8;
    objc_storeStrong((id *)&v18->_style, a4);
    objc_storeStrong((id *)&v19->_assetDirectory, a5);
    objc_storeStrong((id *)&v19->_persistedStyle, a6);
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v14, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v21 = v14;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v27 = objc_msgSend(v26, "copy", v42, v43, v44);
          uint64_t v28 = [v26 assetUUID];
          [v20 setObject:v27 forKeyedSubscript:v28];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v23);
    }

    uint64_t v29 = [v20 copy];
    initialPosterMediaByAssetUUIDs = v19->_initialPosterMediaByAssetUUIDs;
    v19->_initialPosterMediaByAssetUUIDs = (NSDictionary *)v29;

    objc_storeStrong((id *)&v19->_photoLibrary, a7);
    id v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    segmentationLoadingOperationsByAssetUUIDs = v19->_segmentationLoadingOperationsByAssetUUIDs;
    v19->_segmentationLoadingOperationsByAssetUUIDs = v31;

    id v33 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(NSOperationQueue *)v33 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v33 setName:@"com.apple.photos.wallpaper-shuffle-loading"];
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v33;
    os_signpost_id_t v35 = v33;

    id v36 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(NSOperationQueue *)v36 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v36 setName:@"com.apple.photos.wallpaper-shuffle-requests"];
    requestOperationQueue = v19->_requestOperationQueue;
    v19->_requestOperationQueue = v36;
    v38 = v36;

    v39 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(NSOperationQueue *)v39 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v39 setName:@"com.apple.photos.wallpaper-shuffle-export"];
    exportOperationQueue = v19->_exportOperationQueue;
    v19->_exportOperationQueue = v39;

    id v16 = v43;
    id v15 = v44;
    id v17 = v42;
  }

  return v19;
}

@end