@interface PUParallaxLayerStackRadarController
+ (id)visualDiagnosticsActionForAsset:(id)a3 compoundLayerStack:(id)a4 segmentationItem:(id)a5 fromViewController:(id)a6 actionBeingHandler:(id)a7 actionEndHandler:(id)a8;
+ (id)visualDiagnosticsConfigurationForAsset:(id)a3 compoundLayerStack:(id)a4 segmentationItem:(id)a5;
+ (void)loadLayerStackForAsset:(id)a3 completion:(id)a4;
- (NSURL)baseTemporaryURL;
- (NSURL)screenshotURL;
- (PFPosterConfiguration)posterConfiguration;
- (PFPosterDescriptor)posterDescriptor;
- (PFWallpaperCompoundLayerStack)compoundLayerStack;
- (PHAsset)asset;
- (PISegmentationItem)segmentationItem;
- (PUParallaxLayerStackRadarController)initWithAsset:(id)a3 compoundLayerStack:(id)a4 segmentationItem:(id)a5 posterDescriptor:(id)a6 posterConfiguration:(id)a7;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)saveDebugLayerStack:(id)a3 toFileName:(id)a4 item:(id)a5 completion:(id)a6;
- (void)setAsset:(id)a3;
- (void)setCompoundLayerStack:(id)a3;
- (void)setScreenshotURL:(id)a3;
- (void)setSegmentationItem:(id)a3;
@end

@implementation PUParallaxLayerStackRadarController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotURL, 0);
  objc_storeStrong((id *)&self->_baseTemporaryURL, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterDescriptor, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_compoundLayerStack, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setScreenshotURL:(id)a3
{
}

- (NSURL)screenshotURL
{
  return self->_screenshotURL;
}

- (NSURL)baseTemporaryURL
{
  return self->_baseTemporaryURL;
}

- (PFPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (PFPosterDescriptor)posterDescriptor
{
  return self->_posterDescriptor;
}

- (void)setSegmentationItem:(id)a3
{
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setCompoundLayerStack:(id)a3
{
}

- (PFWallpaperCompoundLayerStack)compoundLayerStack
{
  return self->_compoundLayerStack;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)saveDebugLayerStack:(id)a3 toFileName:(id)a4 item:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PUParallaxLayerStackRadarController_saveDebugLayerStack_toFileName_item_completion___block_invoke;
  aBlock[3] = &unk_1E5F27380;
  aBlock[4] = self;
  id v29 = v12;
  id v14 = v12;
  id v15 = a5;
  v16 = _Block_copy(aBlock);
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F8A318]) initWithSegmentationItem:v15];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
  [v17 setPriority:v18];

  [v17 setLayerStackOptions:20];
  uint64_t v19 = [v15 isSettlingEffectAvailable];

  [v17 setSettlingEffectEnabled:v19];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__PUParallaxLayerStackRadarController_saveDebugLayerStack_toFileName_item_completion___block_invoke_2;
  v23[3] = &unk_1E5F273A8;
  id v26 = v13;
  SEL v27 = a2;
  v23[4] = self;
  id v24 = v11;
  id v25 = v16;
  id v20 = v13;
  id v21 = v16;
  id v22 = v11;
  [v17 submit:v23];
}

id __86__PUParallaxLayerStackRadarController_saveDebugLayerStack_toFileName_item_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) baseTemporaryURL];
  v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [v7 UUIDString];
  v9 = [v6 URLByAppendingPathComponent:v8];

  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v7) = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:a3];

  id v11 = 0;
  if (v7)
  {
    id v12 = [v9 URLByAppendingPathComponent:*(void *)(a1 + 40)];
    id v13 = [v12 URLByAppendingPathExtension:@"imagestack"];

    if ([MEMORY[0x1E4F8CCA0] saveCompoundLayerStack:v5 toURL:v13 options:0xFFFFLL error:a3])id v11 = v13; {
    else
    }
      id v11 = 0;
  }
  return v11;
}

void __86__PUParallaxLayerStackRadarController_saveDebugLayerStack_toFileName_item_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v21 = 0;
  v3 = [a2 result:&v21];
  id v4 = v21;
  if (v3)
  {
    id v5 = [v3 compoundLayerStack];
    v6 = [v5 portraitLayerStack];

    v7 = [v3 compoundLayerStack];
    v8 = [v7 landscapeLayerStack];

    if (!v6)
    {
      id v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"PUParallaxLayerStackRadarController.m" lineNumber:212 description:@"A portrait layer stack should always be available"];
    }
    v9 = [*(id *)(a1 + 40) portraitLayerStack];
    v10 = [v6 layers];
    id v11 = [v6 layout];
    [v11 imageSize];
    id v12 = objc_msgSend(v9, "layerStackByUpdatingLayers:imageSize:", v10);

    if (v8)
    {
      id v13 = [*(id *)(a1 + 40) landscapeLayerStack];
      id v14 = [v8 layers];
      id v15 = [v8 layout];
      [v15 imageSize];
      v16 = objc_msgSend(v13, "layerStackByUpdatingLayers:imageSize:", v14);
    }
    else
    {
      v16 = 0;
    }
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F8CE50]) initWithPortraitLayerStack:v12 landscapeLayerStack:v16];
    uint64_t v19 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v17 = v4;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v17 = v4;
  }
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke;
  aBlock[3] = &unk_1E5F27268;
  id v5 = v4;
  id v46 = v5;
  v47 = self;
  v6 = _Block_copy(aBlock);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_3;
  v42[3] = &unk_1E5F27290;
  id v7 = v5;
  id v43 = v7;
  v44 = self;
  v8 = _Block_copy(v42);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_228;
  v40[3] = &unk_1E5F272B8;
  v40[4] = self;
  id v9 = v7;
  id v41 = v9;
  v10 = _Block_copy(v40);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_234;
  v35[3] = &unk_1E5F272E0;
  id v11 = v8;
  id v37 = v11;
  id v27 = v6;
  id v38 = v27;
  v35[4] = self;
  id v12 = v10;
  id v39 = v12;
  id v13 = v9;
  id v36 = v13;
  id v14 = (void (**)(void *, void *, id))_Block_copy(v35);
  id v15 = [(PUParallaxLayerStackRadarController *)self compoundLayerStack];
  if (v15)
  {
    id v16 = [(PUParallaxLayerStackRadarController *)self segmentationItem];
    v14[2](v14, v15, v16);
  }
  else
  {
    id v17 = objc_msgSend(v13, "beginCollectionOperationWithName:timeout:", @"Load Layer Stack", 1.84467441e19, v27);
    v18 = objc_opt_class();
    uint64_t v19 = [(PUParallaxLayerStackRadarController *)self asset];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2_239;
    v32[3] = &unk_1E5F27308;
    v32[4] = self;
    id v33 = v17;
    v34 = v14;
    id v16 = v17;
    [v18 loadLayerStackForAsset:v19 completion:v32];
  }
  id v20 = [v13 beginCollectionOperationWithName:@"Asset Resource" timeout:10.0];
  id v21 = (void *)MEMORY[0x1E4F38EB8];
  id v22 = [(PUParallaxLayerStackRadarController *)self asset];
  v48[0] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_246;
  v29[3] = &unk_1E5F27330;
  id v30 = v13;
  id v31 = v20;
  id v24 = v20;
  id v25 = v13;
  objc_msgSend(v21, "px_generateResourceFilesForAssets:completionHandler:", v23, v29);

  id v26 = [(PUParallaxLayerStackRadarController *)self screenshotURL];
  [v25 addAttachment:v26];
}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 beginCollectionOperationWithName:@"Visual Diagnostics" timeout:10.0];
  id v12 = [(id)objc_opt_class() visualDiagnosticsConfigurationForAsset:v10 compoundLayerStack:v9 segmentationItem:v8];

  id v13 = (void *)MEMORY[0x1E4F908E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2;
  v15[3] = &unk_1E5F2E390;
  id v16 = *(id *)(a1 + 32);
  id v17 = v11;
  id v14 = v11;
  [v13 requestVisualDiagnosticsPDFDocumentURLWithConfiguration:v12 resultHandler:v15];
}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 beginCollectionOperationWithName:@"Save Debug Layer Stack" timeout:1.84467441e19];
  v6 = [*(id *)(a1 + 40) asset];
  id v7 = [v6 filename];
  uint64_t v8 = [v7 stringByDeletingPathExtension];
  id v9 = (void *)v8;
  id v10 = @"radarLayerStack";
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  id v11 = v10;

  id v12 = *(void **)(a1 + 40);
  id v13 = [v12 segmentationItem];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_4;
  v15[3] = &unk_1E5F2E390;
  id v16 = *(id *)(a1 + 32);
  id v17 = v5;
  id v14 = v5;
  [v12 saveDebugLayerStack:v4 toFileName:v11 item:v13 completion:v15];
}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_228(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [*(id *)(a1 + 32) baseTemporaryURL];
    v6 = [*(id *)(a1 + 32) asset];
    id v7 = [v6 uuid];
    uint64_t v8 = [(id)v5 URLByAppendingPathComponent:v7 isDirectory:1];

    id v20 = 0;
    LOBYTE(v5) = [v4 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v20];
    id v9 = v20;
    if ((v5 & 1) == 0)
    {
      id v10 = PLWallpaperGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v9;
        _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Failed to create destination directory for settling effect attachment, error: %@", buf, 0xCu);
      }
      id v14 = v9;
      goto LABEL_17;
    }
    id v10 = [v8 URLByAppendingPathComponent:@"SettlingEffect.mov"];
    id v11 = [v10 path];
    int v12 = [v4 fileExistsAtPath:v11];

    if (v12)
    {
      id v19 = v9;
      char v13 = [v4 removeItemAtURL:v10 error:&v19];
      id v14 = v19;

      if ((v13 & 1) == 0)
      {
        id v16 = PLWallpaperGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v14;
          id v17 = "Failed to remove old copy of settling effect video, error: %@";
          goto LABEL_15;
        }
LABEL_16:

        goto LABEL_17;
      }
      id v9 = v14;
    }
    id v18 = v9;
    char v15 = [v3 writeToURL:v10 options:1 error:&v18];
    id v14 = v18;

    if (v15)
    {
      [*(id *)(a1 + 40) addAttachment:v10];
LABEL_17:

      goto LABEL_18;
    }
    id v16 = PLWallpaperGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v14;
      id v17 = "Failed to write settling effect video, error: %@";
LABEL_15:
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_18:
}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_234(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  v6 = *(void (**)(uint64_t, id))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5, v8);
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [*(id *)(a1 + 32) asset];
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, v8, v7);

  uint64_t v11 = *(void *)(a1 + 64);
  int v12 = [*(id *)(a1 + 32) segmentationItem];
  char v13 = [v12 settlingEffectVideoData];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);

  id v14 = [*(id *)(a1 + 32) baseTemporaryURL];
  char v15 = [*(id *)(a1 + 32) posterDescriptor];
  id v25 = 0;
  LODWORD(v10) = [v15 saveToURL:v14 error:&v25];
  id v16 = v25;

  if (v10)
  {
    id v17 = *(void **)(a1 + 40);
    id v18 = [v14 URLByAppendingPathComponent:*MEMORY[0x1E4F8D148]];
    [v17 addAttachment:v18];
  }
  id v19 = [*(id *)(a1 + 32) posterConfiguration];
  id v24 = v16;
  int v20 = [v19 saveToURL:v14 error:&v24];
  id v21 = v24;

  if (v20)
  {
    id v22 = *(void **)(a1 + 40);
    uint64_t v23 = [v14 URLByAppendingPathComponent:*MEMORY[0x1E4F8D128]];
    [v22 addAttachment:v23];
  }
}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2_239(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  id v10 = v9;
  if (a3)
  {
    uint64_t v11 = [v9 compoundLayerStack];
    [*(id *)(a1 + 32) setCompoundLayerStack:v11];

    [*(id *)(a1 + 32) setSegmentationItem:v7];
    uint64_t v12 = *(void *)(a1 + 48);
    char v13 = [*(id *)(a1 + 32) compoundLayerStack];
    id v14 = [*(id *)(a1 + 32) segmentationItem];
    (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v14);
  }
  else
  {
    char v15 = PLWallpaperGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Failed to generate layer stack. Error: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  id v16 = *(void **)(a1 + 40);
  id v17 = [v10 compoundLayerStack];

  id v18 = [v17 portraitLayerStack];
  [v16 endWithSuccess:v18 != 0 error:v8];
}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_246(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) addAttachment:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "endWithSuccess:error:", objc_msgSend(v3, "count") != 0, 0);
}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) addAttachment:a2];
  }
  else
  {
    uint64_t v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to archive layer stack. Error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 40) endWithSuccess:a2 != 0 error:v5];
}

void __81__PUParallaxLayerStackRadarController_collectTapToRadarDiagnosticsIntoContainer___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addAttachment:a2];
  [*(id *)(a1 + 40) endWithSuccess:a2 != 0 error:v6];
}

- (PUParallaxLayerStackRadarController)initWithAsset:(id)a3 compoundLayerStack:(id)a4 segmentationItem:(id)a5 posterDescriptor:(id)a6 posterConfiguration:(id)a7
{
  id v27 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PUParallaxLayerStackRadarController;
  id v17 = [(PUParallaxLayerStackRadarController *)&v28 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_asset, a3);
    objc_storeStrong((id *)&v18->_compoundLayerStack, a4);
    objc_storeStrong((id *)&v18->_segmentationItem, a5);
    objc_storeStrong((id *)&v18->_posterDescriptor, a6);
    objc_storeStrong((id *)&v18->_posterConfiguration, a7);
    int v19 = (void *)MEMORY[0x1E4F1CB10];
    id v20 = NSTemporaryDirectory();
    uint64_t v21 = [v20 stringByAppendingPathComponent:@"photosradarfeedback"];
    uint64_t v22 = [v19 fileURLWithPath:v21];
    baseTemporaryURL = v18->_baseTemporaryURL;
    v18->_baseTemporaryURL = (NSURL *)v22;

    uint64_t v24 = [MEMORY[0x1E4F90200] captureScreenshot];
    screenshotURL = v18->_screenshotURL;
    v18->_screenshotURL = (NSURL *)v24;
  }
  return v18;
}

+ (id)visualDiagnosticsActionForAsset:(id)a3 compoundLayerStack:(id)a4 segmentationItem:(id)a5 fromViewController:(id)a6 actionBeingHandler:(id)a7 actionEndHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eye"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke;
  v30[3] = &unk_1E5F273F8;
  id v36 = v19;
  id v37 = a1;
  id v31 = v15;
  id v32 = v14;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v22 = v19;
  id v23 = v17;
  id v24 = v16;
  id v25 = v14;
  id v26 = v15;
  id v27 = v18;
  objc_super v28 = [v20 actionWithTitle:@"Parallax Diagnostics" image:v21 identifier:0 handler:v30];

  return v28;
}

void __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 80) visualDiagnosticsConfigurationForAsset:*(void *)(a1 + 40) compoundLayerStack:v5 segmentationItem:*(void *)(a1 + 48)];
    [MEMORY[0x1E4F908E0] showVisualDiagnosticsWithConfiguration:v6 fromViewController:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 72)];
  }
  else
  {
    int v7 = objc_opt_class();
    id v8 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke_2;
    v9[3] = &unk_1E5F273D0;
    uint64_t v14 = *(void *)(a1 + 80);
    id v10 = v8;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 72);
    [v7 loadLayerStackForAsset:v10 completion:v9];
  }
}

void __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a3)
  {
    id v8 = [*(id *)(a1 + 64) visualDiagnosticsConfigurationForAsset:*(void *)(a1 + 32) compoundLayerStack:*(void *)(a1 + 40) segmentationItem:a2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke_281;
    block[3] = &unk_1E5F2EBC8;
    id v11 = v8;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    uint64_t v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v9 = PLWallpaperGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Failed to generate layer stack. Error: %@", buf, 0xCu);
    }
  }
}

uint64_t __162__PUParallaxLayerStackRadarController_visualDiagnosticsActionForAsset_compoundLayerStack_segmentationItem_fromViewController_actionBeingHandler_actionEndHandler___block_invoke_281(void *a1)
{
  return [MEMORY[0x1E4F908E0] showVisualDiagnosticsWithConfiguration:a1[4] fromViewController:a1[5] completionHandler:a1[6]];
}

+ (id)visualDiagnosticsConfigurationForAsset:(id)a3 compoundLayerStack:(id)a4 segmentationItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(PUParallaxVisualDiagnosticsProvider);
  [(PUParallaxVisualDiagnosticsProvider *)v10 setAsset:v9];

  [(PUParallaxVisualDiagnosticsProvider *)v10 setCompoundLayerStack:v8];
  [(PUParallaxVisualDiagnosticsProvider *)v10 setSegmentationItem:v7];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F91300]) initWithRootProvider:v10];
  [v11 setName:@"ParallaxDiagnostics"];
  [v11 setIsPrivateDataAllowed:1];

  return v11;
}

+ (void)loadLayerStackForAsset:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F39358];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithPhotoAsset:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F8A390]) initWithParallaxAsset:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PUParallaxLayerStackRadarController_loadLayerStackForAsset_completion___block_invoke;
  v11[3] = &unk_1E5F27358;
  id v12 = v5;
  id v10 = v5;
  [v9 loadSegmentationItemWithCompletion:v11];
}

void __73__PUParallaxLayerStackRadarController_loadLayerStackForAsset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F8A318]) initWithSegmentationItem:v3];
    [v4 setLayerStackOptions:0xFFFFLL];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
    [v4 setPriority:v5];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__PUParallaxLayerStackRadarController_loadLayerStackForAsset_completion___block_invoke_2;
    v6[3] = &unk_1E5F2E448;
    id v8 = *(id *)(a1 + 32);
    id v7 = v3;
    [v4 submit:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __73__PUParallaxLayerStackRadarController_loadLayerStackForAsset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = 0;
  id v3 = [a2 result:&v5];
  id v4 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end