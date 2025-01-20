@interface PUWallpaperShuffleLayerStackLoadingOperation
- (BOOL)_canLoadLayerStackFromDirectory;
- (BOOL)_loadLayerStackFromDirectory;
- (BOOL)isPreloading;
- (BOOL)px_shouldWaitForCancel;
- (BOOL)tryLoadLayerStackFromDirectory;
- (NSError)error;
- (NSString)operationType;
- (NSURL)assetDirectory;
- (PFPosterEditConfiguration)editConfiguration;
- (PFPosterMedia)posterMedia;
- (PFWallpaperCompoundLayerStack)layerStack;
- (PIParallaxCompoundLayerStackRequest)layerStackRequest;
- (PIParallaxStyle)persistedStyle;
- (PIParallaxStyle)style;
- (PISegmentationItem)segmentationItem;
- (PUWallpaperShuffleLayerStackLoadingOperation)initWithPosterMedia:(id)a3 editConfiguration:(id)a4 assetDirectory:(id)a5 style:(id)a6 persistedStyle:(id)a7 isPreloading:(BOOL)a8;
- (void)_handleLayerStackResponse:(id)a3;
- (void)cancel;
- (void)px_finishIfPossible;
- (void)px_start;
- (void)setError:(id)a3;
- (void)setLayerStack:(id)a3;
- (void)setLayerStackRequest:(id)a3;
- (void)setSegmentationItem:(id)a3;
@end

@implementation PUWallpaperShuffleLayerStackLoadingOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerStackRequest, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_layerStack, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_assetDirectory, 0);
  objc_storeStrong((id *)&self->_persistedStyle, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_editConfiguration, 0);
  objc_storeStrong((id *)&self->_posterMedia, 0);
}

- (void)setLayerStackRequest:(id)a3
{
}

- (PIParallaxCompoundLayerStackRequest)layerStackRequest
{
  return self->_layerStackRequest;
}

- (NSString)operationType
{
  return self->_operationType;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 320, 1);
}

- (void)setLayerStack:(id)a3
{
}

- (PFWallpaperCompoundLayerStack)layerStack
{
  return (PFWallpaperCompoundLayerStack *)objc_getProperty(self, a2, 312, 1);
}

- (void)setSegmentationItem:(id)a3
{
}

- (PISegmentationItem)segmentationItem
{
  return (PISegmentationItem *)objc_getProperty(self, a2, 304, 1);
}

- (BOOL)isPreloading
{
  return self->_isPreloading;
}

- (NSURL)assetDirectory
{
  return self->_assetDirectory;
}

- (PIParallaxStyle)persistedStyle
{
  return self->_persistedStyle;
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (PFPosterEditConfiguration)editConfiguration
{
  return self->_editConfiguration;
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
    v4 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self posterMedia];
    v5 = [v4 assetUUID];
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    __int16 v9 = 1024;
    int v10 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self isCancelled];
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "Finished layer stack loading operation for shuffle asset %{public}@ (cancelled: %d)", buf, 0x12u);
  }
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperShuffleLayerStackLoadingOperation;
  [(PXAsyncOperation *)&v6 px_finishIfPossible];
}

- (BOOL)px_shouldWaitForCancel
{
  return 1;
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)PUWallpaperShuffleLayerStackLoadingOperation;
  [(PXAsyncOperation *)&v5 cancel];
  v3 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self layerStackRequest];
  v4 = [v3 renderContext];
  [v4 cancelAllRequests];
}

- (void)_handleLayerStackResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  v4 = [a3 result:&v15];
  id v5 = v15;
  if (v4)
  {
    objc_super v6 = [v4 compoundLayerStack];
    [(PUWallpaperShuffleLayerStackLoadingOperation *)self setLayerStack:v6];

    v7 = PLWallpaperGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self operationType];
      __int16 v9 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self posterMedia];
      int v10 = [v9 assetUUID];
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      __int16 v18 = 2114;
      v19 = v10;
      uint64_t v11 = "Finished %{public}@ layer stack for shuffle asset %{public}@";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 22;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v12, v13, v11, buf, v14);
    }
  }
  else
  {
    [(PUWallpaperShuffleLayerStackLoadingOperation *)self setError:v5];
    v7 = PLWallpaperGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self operationType];
      __int16 v9 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self posterMedia];
      int v10 = [v9 assetUUID];
      *(_DWORD *)buf = 138543874;
      v17 = v8;
      __int16 v18 = 2114;
      v19 = v10;
      __int16 v20 = 2114;
      id v21 = v5;
      uint64_t v11 = "Layer stack %{public}@ failed for shuffle asset %{public}@: %{public}@";
      v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
      goto LABEL_6;
    }
  }

  [(PUWallpaperShuffleLayerStackLoadingOperation *)self px_finishIfPossible];
}

- (BOOL)_loadLayerStackFromDirectory
{
  v3 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self assetDirectory];
  v4 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self posterMedia];
  id v5 = [v4 subpath];
  objc_super v6 = [v3 URLByAppendingPathComponent:v5];

  if (v6)
  {
    id v14 = 0;
    v7 = [MEMORY[0x1E4F8A390] loadCompoundLayerStackFromWallpaperURL:v6 options:2 error:&v14];
    id v8 = v14;
    __int16 v9 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self editConfiguration];
    int v10 = v9;
    if (v9)
    {
      uint64_t v11 = objc_msgSend(v7, "compoundLayerStackByUpdatingPortraitDepthEnabled:landscapeDepthEnabled:", objc_msgSend(v9, "isDepthEnabled"), objc_msgSend(v9, "isLandscapeDepthEnabled"));

      v7 = objc_msgSend(v11, "compoundLayerStackByUpdatingParallaxDisabled:", objc_msgSend(v10, "isPerspectiveZoomEnabled") ^ 1);
    }
    [(PUWallpaperShuffleLayerStackLoadingOperation *)self setLayerStack:v7];
    [(PUWallpaperShuffleLayerStackLoadingOperation *)self setError:v8];

    BOOL v12 = v7 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_canLoadLayerStackFromDirectory
{
  v3 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self assetDirectory];

  if (v3)
  {
    v4 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self posterMedia];
    id v5 = [v4 editConfiguration];

    if (v5)
    {
      id v6 = [v5 style];
    }
    else
    {
      id v8 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self persistedStyle];
      id v6 = [v8 bakedStyle];
    }
    __int16 v9 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self style];
    id v10 = [v9 bakedStyle];
    if (v6 == v10)
    {
    }
    else
    {
      uint64_t v11 = v10;
      char v12 = [v6 isEqual:v10];

      if ((v12 & 1) == 0)
      {
        BOOL v7 = 0;
LABEL_15:

        return v7;
      }
    }
    os_log_type_t v13 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self editConfiguration];
    BOOL v7 = 1;
    if (v13)
    {
      [v5 normalizedVisibleFrame];
      [v13 normalizedVisibleFrame];
      if (!PXRectApproximatelyEqualToRect()) {
        BOOL v7 = 0;
      }
    }

    goto LABEL_15;
  }
  return 0;
}

- (BOOL)tryLoadLayerStackFromDirectory
{
  BOOL v3 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self _canLoadLayerStackFromDirectory];
  if (v3)
  {
    LOBYTE(v3) = [(PUWallpaperShuffleLayerStackLoadingOperation *)self _loadLayerStackFromDirectory];
  }
  return v3;
}

- (void)px_start
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v4 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self posterMedia];
  id v5 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self assetDirectory];
  uint64_t v6 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self segmentationItem];
  BOOL v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 && !v6)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2 object:self file:@"PUWallpaperShuffleResourceManager.m" lineNumber:657 description:@"Invalid layer stack inputs"];
  }
  __int16 v9 = PLWallpaperGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self operationType];
    uint64_t v11 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self posterMedia];
    char v12 = [v11 assetUUID];
    *(_DWORD *)buf = 138543618;
    v47 = v10;
    __int16 v48 = 2114;
    v49 = v12;
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Started %{public}@ layer stack for shuffle asset %{public}@.", buf, 0x16u);
  }
  if ([(PUWallpaperShuffleLayerStackLoadingOperation *)self tryLoadLayerStackFromDirectory]|| v7 == 0)
  {
    [(PUWallpaperShuffleLayerStackLoadingOperation *)self px_finishIfPossible];
  }
  else
  {
    os_log_type_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F8A318]) initWithSegmentationItem:v7];
    [(PUWallpaperShuffleLayerStackLoadingOperation *)self setLayerStackRequest:v13];

    if ([(PUWallpaperShuffleLayerStackLoadingOperation *)self isPreloading]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:v14];
    v16 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self layerStackRequest];
    [v16 setPriority:v15];

    v17 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self style];
    __int16 v18 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self layerStackRequest];
    [v18 setStyle:v17];

    if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
      uint64_t v19 = 35;
    }
    else {
      uint64_t v19 = 3;
    }
    __int16 v20 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self layerStackRequest];
    [v20 setLayerStackOptions:v19];

    id v21 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self editConfiguration];
    if (v21 || ([v4 editConfiguration], (id v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v21 normalizedVisibleFrame];
      if (!CGRectIsNull(v51))
      {
        [v21 normalizedVisibleFrame];
        PXRectFlippedVertically();
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        [v21 normalizedLandscapeVisibleFrame];
        PXRectFlippedVertically();
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        v38 = [v7 originalLayout];
        v39 = objc_msgSend(v38, "layoutByUpdatingNormalizedPortraitVisibleFrame:landscapeVisibleFrame:", v23, v25, v27, v29, v31, v33, v35, v37);

        v40 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self layerStackRequest];
        [v40 setLayout:v39];

        v41 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self layerStackRequest];
        [v41 setUpdateClockZPosition:1];
      }
    }
    objc_initWeak((id *)buf, self);
    v42 = [(PUWallpaperShuffleLayerStackLoadingOperation *)self layerStackRequest];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __56__PUWallpaperShuffleLayerStackLoadingOperation_px_start__block_invoke;
    v44[3] = &unk_1E5F2B9A8;
    objc_copyWeak(&v45, (id *)buf);
    [v42 submit:v44];

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
  }
}

void __56__PUWallpaperShuffleLayerStackLoadingOperation_px_start__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleLayerStackResponse:v3];
}

- (PUWallpaperShuffleLayerStackLoadingOperation)initWithPosterMedia:(id)a3 editConfiguration:(id)a4 assetDirectory:(id)a5 style:(id)a6 persistedStyle:(id)a7 isPreloading:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PUWallpaperShuffleLayerStackLoadingOperation;
  uint64_t v19 = [(PXAsyncOperation *)&v26 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    posterMedia = v19->_posterMedia;
    v19->_posterMedia = (PFPosterMedia *)v20;

    uint64_t v22 = [v15 copy];
    editConfiguration = v19->_editConfiguration;
    v19->_editConfiguration = (PFPosterEditConfiguration *)v22;

    objc_storeStrong((id *)&v19->_assetDirectory, a5);
    objc_storeStrong((id *)&v19->_style, a6);
    objc_storeStrong((id *)&v19->_persistedStyle, a7);
    v19->_isPreloading = v8;
    if (v8) {
      double v24 = @"preloading";
    }
    else {
      double v24 = @"loading";
    }
    objc_storeStrong((id *)&v19->_operationType, v24);
  }

  return v19;
}

@end