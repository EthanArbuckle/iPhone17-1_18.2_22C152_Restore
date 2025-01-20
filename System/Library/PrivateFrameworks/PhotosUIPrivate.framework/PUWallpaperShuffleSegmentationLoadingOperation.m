@interface PUWallpaperShuffleSegmentationLoadingOperation
- (BOOL)isPreloading;
- (BOOL)px_shouldWaitForCancel;
- (BOOL)tryLoadSegmentationFromDirectory;
- (NSError)error;
- (NSString)operationType;
- (NSURL)assetDirectory;
- (PFPosterMedia)posterMedia;
- (PHPhotoLibrary)photoLibrary;
- (PISegmentationItem)segmentationItem;
- (PISegmentationLoader)loader;
- (PUWallpaperShuffleSegmentationLoadingOperation)initWithPosterMedia:(id)a3 assetDirectory:(id)a4 photoLibrary:(id)a5 isPreloading:(BOOL)a6;
- (id)downloadProgressHandler;
- (void)_handleSegmentationResult:(id)a3 forAssetUUID:(id)a4 loadingError:(id)a5;
- (void)cancel;
- (void)px_finishIfPossible;
- (void)px_start;
- (void)setDownloadProgressHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setLoader:(id)a3;
- (void)setSegmentationItem:(id)a3;
@end

@implementation PUWallpaperShuffleSegmentationLoadingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetDirectory, 0);
  objc_storeStrong((id *)&self->_posterMedia, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong(&self->_downloadProgressHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
}

- (BOOL)isPreloading
{
  return self->_isPreloading;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (PFPosterMedia)posterMedia
{
  return self->_posterMedia;
}

- (void)setLoader:(id)a3
{
}

- (PISegmentationLoader)loader
{
  return self->_loader;
}

- (NSString)operationType
{
  return self->_operationType;
}

- (void)setDownloadProgressHandler:(id)a3
{
}

- (id)downloadProgressHandler
{
  return self->_downloadProgressHandler;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setSegmentationItem:(id)a3
{
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)px_finishIfPossible
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self segmentationItem];
  if (!v4)
  {
    v4 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self error];
    if (!v4)
    {
      if ([(PUWallpaperShuffleSegmentationLoadingOperation *)self isCancelled]) {
        goto LABEL_6;
      }
      v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2, self, @"PUWallpaperShuffleResourceManager.m", 621, @"Operation finished, but has invalid output." object file lineNumber description];
    }
  }

LABEL_6:
  v5 = PLWallpaperGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self posterMedia];
    v7 = [v6 assetUUID];
    *(_DWORD *)buf = 138543618;
    v10 = v7;
    __int16 v11 = 1024;
    int v12 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self isCancelled];
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Finished segmentation loading operation for shuffle asset %{public}@ (cancelled: %d)", buf, 0x12u);
  }
  v8.receiver = self;
  v8.super_class = (Class)PUWallpaperShuffleSegmentationLoadingOperation;
  [(PXAsyncOperation *)&v8 px_finishIfPossible];
}

- (BOOL)px_shouldWaitForCancel
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperShuffleSegmentationLoadingOperation;
  [(PXAsyncOperation *)&v4 cancel];
  v3 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self loader];
  [v3 cancel];
}

- (void)_handleSegmentationResult:(id)a3 forAssetUUID:(id)a4 loadingError:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    __int16 v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self operationType];
      int v15 = 138543874;
      v16 = v12;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "Finished %{public}@ segmentation for shuffle asset %{public}@: %{public}@", (uint8_t *)&v15, 0x20u);
    }
    [(PUWallpaperShuffleSegmentationLoadingOperation *)self setSegmentationItem:v8];
    [(PUWallpaperShuffleSegmentationLoadingOperation *)self setError:0];
  }
  else
  {
    [(PUWallpaperShuffleSegmentationLoadingOperation *)self setError:v10];
    uint64_t v13 = PLWallpaperGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self operationType];
      int v15 = 138543874;
      v16 = v14;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "Segmentation %{public}@ failed for shuffle asset %{public}@: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  [(PUWallpaperShuffleSegmentationLoadingOperation *)self px_finishIfPossible];
}

- (BOOL)tryLoadSegmentationFromDirectory
{
  v3 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self assetDirectory];
  objc_super v4 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self posterMedia];
  v5 = [v4 subpath];
  v6 = [v3 URLByAppendingPathComponent:v5];

  if (v6)
  {
    id v11 = 0;
    v7 = [MEMORY[0x1E4F8A390] loadSegmentationItemFromWallpaperURL:v6 error:&v11];
    id v8 = v11;
    BOOL v9 = v7 != 0;
    if (v7) {
      [(PUWallpaperShuffleSegmentationLoadingOperation *)self setSegmentationItem:v7];
    }
    else {
      [(PUWallpaperShuffleSegmentationLoadingOperation *)self setError:v8];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)px_start
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self posterMedia];
  if (!v3) {
    [(PUWallpaperShuffleSegmentationLoadingOperation *)self px_finishIfPossible];
  }
  objc_super v4 = PLWallpaperGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self operationType];
    v6 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self posterMedia];
    v7 = [v6 assetUUID];
    *(_DWORD *)buf = 138543618;
    v25 = v5;
    __int16 v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Started %{public}@ segmentation for shuffle asset %{public}@.", buf, 0x16u);
  }
  if ([(PUWallpaperShuffleSegmentationLoadingOperation *)self tryLoadSegmentationFromDirectory])
  {
    [(PUWallpaperShuffleSegmentationLoadingOperation *)self px_finishIfPossible];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F38EB8];
    BOOL v9 = [v3 assetUUID];
    v23 = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    id v11 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self photoLibrary];
    int v12 = [v11 librarySpecificFetchOptions];
    uint64_t v13 = [v8 fetchAssetsWithUUIDs:v10 options:v12];
    v14 = [v13 firstObject];

    if (v14)
    {
      [(PUWallpaperShuffleSegmentationLoadingOperation *)self setError:0];
      int v15 = (void *)[objc_alloc(MEMORY[0x1E4F39358]) initWithPhotoAsset:v14];
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F8A390]) initWithParallaxAsset:v15];
      [v16 setDisableSettlingEffect:1];
      __int16 v17 = [(PUWallpaperShuffleSegmentationLoadingOperation *)self downloadProgressHandler];
      [v16 setDownloadProgressHandler:v17];

      objc_initWeak((id *)buf, self);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __58__PUWallpaperShuffleSegmentationLoadingOperation_px_start__block_invoke;
      v20[3] = &unk_1E5F253C0;
      objc_copyWeak(&v22, (id *)buf);
      id v21 = v14;
      [v16 loadSegmentationItemWithCompletion:v20];
      [(PUWallpaperShuffleSegmentationLoadingOperation *)self setLoader:v16];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v18 = PLWallpaperGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = [v3 assetUUID];
        *(_DWORD *)buf = 138543362;
        v25 = v19;
        _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_ERROR, "Failed to fetch asset %{public}@", buf, 0xCu);
      }
      [(PUWallpaperShuffleSegmentationLoadingOperation *)self px_finishIfPossible];
    }
  }
}

void __58__PUWallpaperShuffleSegmentationLoadingOperation_px_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [*(id *)(a1 + 32) uuid];
  [WeakRetained _handleSegmentationResult:v7 forAssetUUID:v8 loadingError:v6];
}

- (PUWallpaperShuffleSegmentationLoadingOperation)initWithPosterMedia:(id)a3 assetDirectory:(id)a4 photoLibrary:(id)a5 isPreloading:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperShuffleSegmentationLoadingOperation;
  uint64_t v13 = [(PXAsyncOperation *)&v18 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    posterMedia = v13->_posterMedia;
    v13->_posterMedia = (PFPosterMedia *)v14;

    objc_storeStrong((id *)&v13->_assetDirectory, a4);
    objc_storeStrong((id *)&v13->_photoLibrary, a5);
    v13->_isPreloading = v6;
    if (v6) {
      v16 = @"preloading";
    }
    else {
      v16 = @"loading";
    }
    objc_storeStrong((id *)&v13->_operationType, v16);
  }

  return v13;
}

@end