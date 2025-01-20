@interface PUWallpaperConfigurationUpdater
- (NSURL)targetAssetDirectory;
- (PFPosterConfiguration)sourceConfiguration;
- (PHPhotoLibrary)photoLibrary;
- (PUPosterOverrideConfiguration)overrideConfiguration;
- (PUWallpaperConfigurationUpdater)initWithPhotoLibrary:(id)a3 sourceConfiguration:(id)a4 targetAssetDirectory:(id)a5 overrideConfiguration:(id)a6;
- (void)_handleSegmentationItem:(id)a3 error:(id)a4 completionBlock:(id)a5;
- (void)attemptUpdateWithCompletionBlock:(id)a3;
@end

@implementation PUWallpaperConfigurationUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideConfiguration, 0);
  objc_storeStrong((id *)&self->_targetAssetDirectory, 0);
  objc_storeStrong((id *)&self->_sourceConfiguration, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (PUPosterOverrideConfiguration)overrideConfiguration
{
  return self->_overrideConfiguration;
}

- (NSURL)targetAssetDirectory
{
  return self->_targetAssetDirectory;
}

- (PFPosterConfiguration)sourceConfiguration
{
  return self->_sourceConfiguration;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)_handleSegmentationItem:(id)a3 error:(id)a4 completionBlock:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(PUWallpaperConfigurationUpdater *)self sourceConfiguration];
  v12 = v11;
  if (v8)
  {
    v54 = (void *)[v11 copy];
    v13 = [(PUWallpaperConfigurationUpdater *)self overrideConfiguration];
    v14 = [v12 editConfiguration];
    v15 = [v14 style];

    v16 = [MEMORY[0x1E4F8A328] defaultOriginalStyle];
    v17 = [v15 kind];
    v18 = [v8 availableStyleOfKind:v17];

    if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F8A340] styleWithBakedStyle:v15];

      v16 = (void *)v19;
    }
    if (([v13 includeBackfillLayers] & 1) != 0
      || [MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration])
    {
      uint64_t v20 = 67;
    }
    else
    {
      uint64_t v20 = 65;
    }
    v56 = v10;
    if (PFPosterWantsLowLuminanceContent() && [v13 includeInactiveLayers]) {
      v20 |= 4uLL;
    }
    v55 = v15;
    id v57 = v9;
    char v23 = [v13 applySmartCrop];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F8A318]) initWithSegmentationItem:v8];
    [v24 setResponseQueue:MEMORY[0x1E4F14428]];
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
    [v24 setPriority:v25];

    [v24 setLayerStackOptions:v20];
    [v24 setStyle:v16];
    v26 = [v12 editConfiguration];
    objc_msgSend(v24, "setSettlingEffectEnabled:", objc_msgSend(v26, "isSettlingEffectEnabled"));

    if ((v23 & 1) == 0)
    {
      v27 = [v8 originalLayout];
      v28 = [v27 portraitLayout];

      v29 = [v8 originalLayout];
      v30 = [v29 landscapeLayout];

      [v28 normalizedVisibleFrame];
      PXSizeGetAspectRatio();
      PXRectWithAspectRatioFittingRect();
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      [v30 normalizedVisibleFrame];
      PXSizeGetAspectRatio();
      PXRectWithAspectRatioFittingRect();
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      id v47 = objc_alloc(MEMORY[0x1E4F8CD10]);
      v48 = objc_msgSend(v28, "layoutByUpdatingNormalizedVisibleFrame:", v32, v34, v36, v38);
      v49 = objc_msgSend(v30, "layoutByUpdatingNormalizedVisibleFrame:", v40, v42, v44, v46);
      v50 = (void *)[v47 initWithPortraitLayout:v48 landscapeLayout:v49];
      [v24 setLayout:v50];

      [v24 setUpdateClockZPosition:1];
    }
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __81__PUWallpaperConfigurationUpdater__handleSegmentationItem_error_completionBlock___block_invoke;
    v58[3] = &unk_1E5F2EB08;
    id v59 = v54;
    id v60 = v13;
    id v61 = v16;
    id v62 = v12;
    id v10 = v56;
    id v64 = v56;
    id v63 = v8;
    id v51 = v16;
    id v52 = v13;
    id v53 = v54;
    [v24 submit:v58];

    id v9 = v57;
    v22 = v55;
  }
  else
  {
    v21 = PLWallpaperGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v66 = v9;
      _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_ERROR, "Loading segmentation item failed during configuration update: %{public}@", buf, 0xCu);
    }

    v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUWallpaperPosterErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, void *, void, void, void, void *))v10 + 2))(v10, v12, 0, 0, 0, v22);
  }
}

void __81__PUWallpaperConfigurationUpdater__handleSegmentationItem_error_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v45 = 0;
  v3 = [a2 result:&v45];
  id v4 = v45;
  v5 = PLWallpaperGetLog();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v3 statistics];
      *(_DWORD *)buf = 138543362;
      id v48 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Segmentation stats: %{public}@", buf, 0xCu);
    }
    id v8 = [v3 compoundLayerStack];
    id v9 = [v8 compoundLayerStackByUpdatingPortraitDepthEnabled:0 landscapeDepthEnabled:0];

    id v10 = objc_alloc(MEMORY[0x1E4F8CD18]);
    v11 = (void *)MEMORY[0x1E4F391D0];
    v12 = [*(id *)(a1 + 40) assetIdentifier];
    v13 = [v11 uuidFromLocalIdentifier:v12];
    v14 = (void *)[v10 initWithAssetUUID:v13];
    double v46 = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    [*(id *)(a1 + 32) setMedia:v15];

    v16 = [v9 portraitLayerStack];
    v17 = [v16 layout];
    [v17 normalizedVisibleFrame];
    PXRectFlippedVertically();
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26 = [*(id *)(a1 + 32) editConfiguration];
    objc_msgSend(v26, "setNormalizedVisibleFrame:", v19, v21, v23, v25);

    v27 = [v9 landscapeLayerStack];
    v28 = [v27 layout];
    [v28 normalizedVisibleFrame];
    PXRectFlippedVertically();
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v37 = [*(id *)(a1 + 32) editConfiguration];
    objc_msgSend(v37, "setNormalizedLandscapeVisibleFrame:", v30, v32, v34, v36);

    double v38 = [*(id *)(a1 + 48) bakedStyle];
    double v39 = [*(id *)(a1 + 32) editConfiguration];
    [v39 setStyle:v38];

    objc_msgSend(*(id *)(a1 + 32), "setOptions:", objc_msgSend(*(id *)(a1 + 32), "options") & 0xFFFFFFFFFFFFFFF7);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v48 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Segmentation failed during configuration update: %{public}@", buf, 0xCu);
    }

    id v9 = 0;
  }
  uint64_t v40 = 32;
  if (!v3) {
    uint64_t v40 = 56;
  }
  uint64_t v41 = *(void *)(a1 + 72);
  double v42 = *(void **)(a1 + 48);
  id v43 = *(id *)(a1 + v40);
  double v44 = [v42 bakedStyle];
  (*(void (**)(uint64_t, id, void *, void *, void, id))(v41 + 16))(v41, v43, v9, v44, *(void *)(a1 + 64), v4);
}

- (void)attemptUpdateWithCompletionBlock:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PUWallpaperConfigurationUpdater *)self overrideConfiguration];
  uint64_t v7 = [v6 assetURL];
  uint64_t v8 = [v6 assetIdentifier];
  id v9 = (void *)v8;
  if (!(v7 | v8))
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"PUWallpaperConfigurationUpdater.m" lineNumber:57 description:@"Either asset URL or asset identifier are required to update the configuration."];

    goto LABEL_12;
  }
  if (v7)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F8A2F0]) initWithFileURL:v7];
  }
  else
  {
    if (!v8) {
      goto LABEL_12;
    }
    v11 = (void *)MEMORY[0x1E4F38EB8];
    v27[0] = v8;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v13 = [(PUWallpaperConfigurationUpdater *)self photoLibrary];
    v14 = [v13 librarySpecificFetchOptions];
    v15 = [v11 fetchAssetsWithLocalIdentifiers:v12 options:v14];
    v16 = [v15 firstObject];

    if (v16) {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F39358]) initWithPhotoAsset:v16];
    }
    else {
      id v10 = 0;
    }
  }
  if (v10)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F8A390]) initWithParallaxAsset:v10];
    objc_initWeak((id *)location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__PUWallpaperConfigurationUpdater_attemptUpdateWithCompletionBlock___block_invoke;
    v21[3] = &unk_1E5F2EAE0;
    objc_copyWeak(&v23, (id *)location);
    id v22 = v5;
    [v17 loadSegmentationItemWithCompletion:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
    goto LABEL_15;
  }
LABEL_12:
  double v19 = PLWallpaperGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v7;
    __int16 v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_INFO, "Failed to load asset for configuration update: assetURL: %@, assetIdentifier: %@", location, 0x16u);
  }

  double v20 = [(PUWallpaperConfigurationUpdater *)self sourceConfiguration];
  id v10 = (void *)[v20 copy];

  objc_msgSend(v10, "setOptions:", objc_msgSend(v10, "options") & 0xFFFFFFFFFFFFFFF7);
  v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUWallpaperPosterErrorDomain" code:-1 userInfo:0];
  (*((void (**)(id, void *, void, void, void, void *))v5 + 2))(v5, v10, 0, 0, 0, v17);
LABEL_15:
}

void __68__PUWallpaperConfigurationUpdater_attemptUpdateWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleSegmentationItem:v7 error:v6 completionBlock:*(void *)(a1 + 32)];
}

- (PUWallpaperConfigurationUpdater)initWithPhotoLibrary:(id)a3 sourceConfiguration:(id)a4 targetAssetDirectory:(id)a5 overrideConfiguration:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperConfigurationUpdater;
  v15 = [(PUWallpaperConfigurationUpdater *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibrary, a3);
    objc_storeStrong((id *)&v16->_sourceConfiguration, a4);
    objc_storeStrong((id *)&v16->_targetAssetDirectory, a5);
    objc_storeStrong((id *)&v16->_overrideConfiguration, a6);
  }

  return v16;
}

@end