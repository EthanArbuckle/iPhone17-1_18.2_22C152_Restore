@interface PUWallpaperShuffleResourceExportOperation
- (BOOL)_canExportFromDirectory;
- (BOOL)_exportFromDirectory;
- (BOOL)_tryExportFromDirectory;
- (BOOL)px_shouldWaitForCancel;
- (NSError)error;
- (NSURL)exportDirectory;
- (NSURL)sourceDirectory;
- (PFPosterEditConfiguration)editConfiguration;
- (PFPosterMedia)posterMedia;
- (PIParallaxStyle)persistedStyle;
- (PIParallaxStyle)style;
- (PISegmentationItem)segmentationItem;
- (PISegmentationLoading)exportTask;
- (unint64_t)options;
- (void)_handleExportCompletion:(id)a3;
- (void)cancel;
- (void)px_finishIfPossible;
- (void)px_start;
- (void)setEditConfiguration:(id)a3;
- (void)setError:(id)a3;
- (void)setExportDirectory:(id)a3;
- (void)setExportTask:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPersistedStyle:(id)a3;
- (void)setPosterMedia:(id)a3;
- (void)setSegmentationItem:(id)a3;
- (void)setSourceDirectory:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation PUWallpaperShuffleResourceExportOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_exportTask, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_exportDirectory, 0);
  objc_storeStrong((id *)&self->_sourceDirectory, 0);
  objc_storeStrong((id *)&self->_persistedStyle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_editConfiguration, 0);
  objc_storeStrong((id *)&self->_posterMedia, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 328, 1);
}

- (void)setExportTask:(id)a3
{
}

- (PISegmentationLoading)exportTask
{
  return (PISegmentationLoading *)objc_getProperty(self, a2, 320, 1);
}

- (void)setSegmentationItem:(id)a3
{
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setExportDirectory:(id)a3
{
}

- (NSURL)exportDirectory
{
  return self->_exportDirectory;
}

- (void)setSourceDirectory:(id)a3
{
}

- (NSURL)sourceDirectory
{
  return self->_sourceDirectory;
}

- (void)setPersistedStyle:(id)a3
{
}

- (PIParallaxStyle)persistedStyle
{
  return self->_persistedStyle;
}

- (void)setStyle:(id)a3
{
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (void)setEditConfiguration:(id)a3
{
}

- (PFPosterEditConfiguration)editConfiguration
{
  return self->_editConfiguration;
}

- (void)setPosterMedia:(id)a3
{
}

- (PFPosterMedia)posterMedia
{
  return self->_posterMedia;
}

- (void)px_finishIfPossible
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLWallpaperGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
    v5 = [v4 assetUUID];
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    __int16 v9 = 1024;
    int v10 = [(PUWallpaperShuffleResourceExportOperation *)self isCancelled];
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "Finished export operation for shuffle asset %{public}@ (cancelled: %d)", buf, 0x12u);
  }
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperShuffleResourceExportOperation;
  [(PXAsyncOperation *)&v6 px_finishIfPossible];
}

- (BOOL)px_shouldWaitForCancel
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperShuffleResourceExportOperation;
  [(PXAsyncOperation *)&v4 cancel];
  v3 = [(PUWallpaperShuffleResourceExportOperation *)self exportTask];
  [v3 cancel];
}

- (void)_handleExportCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLWallpaperGetLog();
  objc_super v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
      v8 = [v7 assetUUID];
      int v11 = 138543618;
      v12 = v8;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Error while exporting resources for shuffle asset %{public}@: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    [(PUWallpaperShuffleResourceExportOperation *)self setError:v4];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
      int v10 = [v9 assetUUID];
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_INFO, "Successfully exported shuffle asset %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [(PUWallpaperShuffleResourceExportOperation *)self px_finishIfPossible];
}

- (BOOL)_exportFromDirectory
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(PUWallpaperShuffleResourceExportOperation *)self sourceDirectory];
  id v4 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
  v5 = [v4 subpath];
  objc_super v6 = [v3 URLByAppendingPathComponent:v5];

  v7 = [(PUWallpaperShuffleResourceExportOperation *)self exportDirectory];
  v8 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
  __int16 v9 = [v8 subpath];
  int v10 = [v7 URLByAppendingPathComponent:v9];

  int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v21 = 0;
  char v12 = [v11 copyItemAtURL:v6 toURL:v10 error:&v21];
  id v13 = v21;

  id v14 = PLWallpaperGetLog();
  uint64_t v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
      v17 = [v16 assetUUID];
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_INFO, "Successfully copied existing data for shuffle asset %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
      v19 = [v18 assetUUID];
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      __int16 v24 = 2114;
      id v25 = v13;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Failed to copy shuffle asset %{public}@, error: %{public}@", buf, 0x16u);
    }
    [(PUWallpaperShuffleResourceExportOperation *)self setError:v13];
  }

  return v12;
}

- (BOOL)_canExportFromDirectory
{
  v3 = [(PUWallpaperShuffleResourceExportOperation *)self sourceDirectory];
  id v4 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
  v5 = [v4 subpath];
  objc_super v6 = [v3 URLByAppendingPathComponent:v5];

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 path];
  LODWORD(v5) = [v7 fileExistsAtPath:v8];

  if (v5)
  {
    __int16 v9 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
    int v10 = [v9 editConfiguration];

    if (v10)
    {
      id v11 = [v10 style];
    }
    else
    {
      id v13 = [(PUWallpaperShuffleResourceExportOperation *)self persistedStyle];
      id v11 = [v13 bakedStyle];
    }
    id v14 = [(PUWallpaperShuffleResourceExportOperation *)self style];
    id v15 = [v14 bakedStyle];
    if (v11 == v15)
    {
    }
    else
    {
      v16 = v15;
      char v17 = [v11 isEqual:v15];

      if ((v17 & 1) == 0)
      {
        LOBYTE(v12) = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    v18 = [(PUWallpaperShuffleResourceExportOperation *)self editConfiguration];
    if (!v18
      || ([v10 normalizedVisibleFrame],
          [v18 normalizedVisibleFrame],
          PXRectApproximatelyEqualToRect())
      && ([v10 normalizedLandscapeVisibleFrame],
          [v18 normalizedLandscapeVisibleFrame],
          PXRectApproximatelyEqualToRect())
      && (int v19 = [v18 isDepthEnabled], v19 == objc_msgSend(v10, "isDepthEnabled"))
      && (int v20 = [v18 isPerspectiveZoomEnabled],
          v20 == [v10 isPerspectiveZoomEnabled]))
    {
      uint64_t v48 = 0;
      id v21 = [MEMORY[0x1E4F8A390] loadCompoundLayerStackFromWallpaperURL:v6 options:0 error:&v48];
      v22 = [v21 portraitLayerStack];

      v23 = [v22 layout];
      [v23 visibleFrame];
      CGFloat v46 = v25;
      CGFloat v47 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;

      v30 = [v22 layout];
      [v30 inactiveFrame];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;

      uint64_t v39 = [v22 layout];
      [(id)v39 imageSize];
      CGFloat v41 = v40;
      v42 = [v22 layout];
      [v42 imageSize];
      CGFloat v44 = v43;

      v49.origin.x = 0.0;
      v49.origin.y = 0.0;
      v49.size.width = v41;
      v49.size.height = v44;
      v51.origin.y = v46;
      v51.origin.x = v47;
      v51.size.width = v27;
      v51.size.height = v29;
      LODWORD(v39) = CGRectContainsRect(v49, v51);
      v50.origin.x = 0.0;
      v50.origin.y = 0.0;
      v50.size.width = v41;
      v50.size.height = v44;
      v52.origin.x = v32;
      v52.origin.y = v34;
      v52.size.width = v36;
      v52.size.height = v38;
      int v12 = v39 ^ CGRectContainsRect(v50, v52) ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 0;
LABEL_19:

  return v12;
}

- (BOOL)_tryExportFromDirectory
{
  BOOL v3 = [(PUWallpaperShuffleResourceExportOperation *)self _canExportFromDirectory];
  if (v3)
  {
    LOBYTE(v3) = [(PUWallpaperShuffleResourceExportOperation *)self _exportFromDirectory];
  }
  return v3;
}

- (void)px_start
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = PLWallpaperGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
    objc_super v6 = [v5 assetUUID];
    *(_DWORD *)buf = 138543362;
    double v37 = v6;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Started exporting resources for shuffle asset %{public}@.", buf, 0xCu);
  }
  v7 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
  v8 = [(PUWallpaperShuffleResourceExportOperation *)self exportDirectory];
  if (!v7)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PUWallpaperShuffleResourceManager.m", 786, @"Invalid parameter not satisfying: %@", @"posterMedia != nil" object file lineNumber description];
  }
  if (!v8)
  {
    double v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PUWallpaperShuffleResourceManager.m", 787, @"Invalid parameter not satisfying: %@", @"exportDirectory" object file lineNumber description];
  }
  __int16 v9 = [(PUWallpaperShuffleResourceExportOperation *)self segmentationItem];
  if (!v9 || [(PUWallpaperShuffleResourceExportOperation *)self _tryExportFromDirectory])
  {
    [(PUWallpaperShuffleResourceExportOperation *)self px_finishIfPossible];
    goto LABEL_21;
  }
  int v10 = [(PUWallpaperShuffleResourceExportOperation *)self exportDirectory];
  id v11 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
  int v12 = [v11 subpath];
  CGFloat v32 = [v10 URLByAppendingPathComponent:v12];

  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = [v32 path];
  LODWORD(v11) = [v13 fileExistsAtPath:v14];

  if (!v11) {
    goto LABEL_14;
  }
  id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v35 = 0;
  char v16 = [v15 removeItemAtURL:v32 error:&v35];
  id v17 = v35;

  if (v16)
  {

LABEL_14:
    v18 = [(PUWallpaperShuffleResourceExportOperation *)self editConfiguration];
    int v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v21 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
      id v20 = [v21 editConfiguration];
    }
    v22 = [(PUWallpaperShuffleResourceExportOperation *)self style];
    v23 = [v22 bakedStyle];

    objc_initWeak((id *)buf, self);
    double v24 = (void *)MEMORY[0x1E4F8A390];
    unint64_t v25 = [(PUWallpaperShuffleResourceExportOperation *)self options];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __53__PUWallpaperShuffleResourceExportOperation_px_start__block_invoke;
    v33[3] = &unk_1E5F28050;
    objc_copyWeak(&v34, (id *)buf);
    double v26 = [v24 saveSegmentationItem:v9 layerStackOptions:v25 configuration:v20 style:v23 layout:0 toWallpaperURL:v32 completion:v33];
    [(PUWallpaperShuffleResourceExportOperation *)self setExportTask:v26];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);

    goto LABEL_21;
  }
  CGFloat v27 = PLWallpaperGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    double v28 = [(PUWallpaperShuffleResourceExportOperation *)self posterMedia];
    CGFloat v29 = [v28 assetUUID];
    *(_DWORD *)buf = 138543618;
    double v37 = v29;
    __int16 v38 = 2114;
    id v39 = v17;
    _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_ERROR, "Failed to delete wallpaper directory %{public}@, error: %{public}@", buf, 0x16u);
  }
  [(PUWallpaperShuffleResourceExportOperation *)self _handleExportCompletion:v17];

LABEL_21:
}

void __53__PUWallpaperShuffleResourceExportOperation_px_start__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleExportCompletion:v3];
}

@end