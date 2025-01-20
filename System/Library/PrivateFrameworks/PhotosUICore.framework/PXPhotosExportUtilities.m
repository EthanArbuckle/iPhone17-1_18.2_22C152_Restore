@interface PXPhotosExportUtilities
+ (id)_exportAssetUsingExportRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
+ (id)_exportRequestForAsset:(id)a3 analyticsActivityType:(id)a4 error:(id *)a5;
+ (id)_optionsForExportRequest:(id)a3 configuration:(id)a4;
+ (void)_downscaleAssetAtURLIfNeeded:(id)a3 configuration:(id)a4 completion:(id)a5;
+ (void)_downscaleImageAtURL:(id)a3 targetDimension:(id)a4 completion:(id)a5;
+ (void)_exportAssets:(id)a3 toURL:(id)a4 configuration:(id)a5 progress:(id)a6;
+ (void)_exportCollectionList:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6;
+ (void)_markURLAsPurgable:(id)a3 completionHandler:(id)a4;
+ (void)_replaceAssetAtURL:(id)a3 withItemAtURL:(id)a4 completionHandler:(id)a5;
+ (void)exportAsset:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6;
+ (void)exportAssets:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6;
+ (void)exportAssetsInContainer:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6;
@end

@implementation PXPhotosExportUtilities

+ (void)_replaceAssetAtURL:(id)a3 withItemAtURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x1E4F28CB8];
  v11 = (void (**)(id, void, id))a5;
  v12 = [v10 defaultManager];
  id v15 = 0;
  int v13 = [v12 replaceItemAtURL:v8 withItemAtURL:v9 backupItemName:0 options:0 resultingItemURL:0 error:&v15];
  id v14 = v15;

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Replaced existing file at URL (%@) with URL (%@).", buf, 0x16u);
    }
    [a1 _markURLAsPurgable:v8 completionHandler:v11];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to replace file at URL (%@) with URL (%@) with error: %@", buf, 0x20u);
    }
    v11[2](v11, 0, v14);
  }
}

+ (void)_markURLAsPurgable:(id)a3 completionHandler:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F8A6D8];
  v7 = (void (**)(id, id, void))a4;
  if ([v6 markPurgeableForFileAtURL:v5 withUrgency:0 outInode:0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Marked file provider URL (%@) as purgeable.", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to mark file provider URL (%@) as purgeable.", (uint8_t *)&v8, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Successfully provided file at URL: %@", (uint8_t *)&v8, 0xCu);
  }
  v7[2](v7, v5, 0);
}

+ (id)_exportAssetUsingExportRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PXPhotosExportUtilities.m", 313, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, a1, @"PXPhotosExportUtilities.m", 312, @"Invalid parameter not satisfying: %@", @"exportRequest" object file lineNumber description];

  if (!v10) {
    goto LABEL_15;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_16:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, a1, @"PXPhotosExportUtilities.m", 314, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  int v13 = [a1 _optionsForExportRequest:v9 configuration:v10];
  if (v13)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __83__PXPhotosExportUtilities__exportAssetUsingExportRequest_configuration_completion___block_invoke;
    v24[3] = &unk_1E5DCC4A8;
    id v25 = v10;
    id v14 = v9;
    id v26 = v14;
    id v15 = v12;
    id v27 = v15;
    id v28 = v11;
    [v14 exportWithOptions:v13 completionHandler:v24];
    v16 = [v14 progress];
    [v15 addChild:v16 withPendingUnitCount:1];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v13;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Exporting asset with options: %@ (export progress: %@)", buf, 0x16u);
    }

    id v17 = v25;
  }
  else
  {
    uint64_t v29 = *MEMORY[0x1E4F28228];
    v30 = @"Failed to find a variant.";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    __int16 v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFPAssetRequestErrorDomain" code:0 userInfo:v17];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = [v9 variants];
      *(_DWORD *)buf = 138412546;
      v32 = v20;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to find a supported variant in: %@ (export progress: %@)", buf, 0x16u);
    }
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v18);
  }
  return v12;
}

void __83__PXPhotosExportUtilities__exportAssetUsingExportRequest_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) itemType];
  switch(v7)
  {
    case 1:
      id v9 = [*(id *)(a1 + 40) asset];
      int v10 = [v9 isLoopingVideo];
      id v11 = (void *)MEMORY[0x1E4F393E0];
      if (!v10) {
        id v11 = (void *)MEMORY[0x1E4F393D8];
      }
      goto LABEL_15;
    case 3:
      int v8 = (void *)MEMORY[0x1E4F393E0];
      goto LABEL_9;
    case 2:
      int v8 = (void *)MEMORY[0x1E4F393C8];
LABEL_9:
      v12 = [v5 objectForKeyedSubscript:*v8];
      goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v21 = *(void **)(a1 + 32);
    int v22 = 138412290;
    v23 = v21;
    _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Trying to export unsupported media type: %@", (uint8_t *)&v22, 0xCu);
  }
  int v13 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F393D8]];
  id v9 = v13;
  if (!v13)
  {
    id v11 = (void *)MEMORY[0x1E4F393E0];
LABEL_15:
    id v14 = [v5 objectForKeyedSubscript:*v11];
    goto LABEL_16;
  }
  id v14 = v13;
LABEL_16:
  v12 = v14;

LABEL_17:
  if ([*(id *)(a1 + 48) isCancelled])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      int v22 = 138412802;
      v23 = v12;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v15;
      v16 = MEMORY[0x1E4F14500];
      id v17 = "Exporting asset (%@) cancelled with error: %@ (export progress: %@)";
      uint32_t v18 = 32;
LABEL_25:
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v18);
    }
  }
  else if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 48);
      int v22 = 138412802;
      v23 = v12;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exporting asset (%@) failed with error: %@ (export progress: %@)", (uint8_t *)&v22, 0x20u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = *(void **)(a1 + 48);
    int v22 = 138412546;
    v23 = v12;
    __int16 v24 = 2112;
    id v25 = v20;
    v16 = MEMORY[0x1E4F14500];
    id v17 = "Finished exporting asset: %@ (export progress: %@)";
    uint32_t v18 = 22;
    goto LABEL_25;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (id)_optionsForExportRequest:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PXPhotosExportUtilities.m", 284, @"Invalid parameter not satisfying: %@", @"exportRequest" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"PXPhotosExportUtilities.m", 285, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

LABEL_3:
  id v10 = objc_alloc_init(MEMORY[0x1E4F38F40]);
  id v11 = [v7 variants];
  v12 = [v7 asset];
  int v13 = [v9 variantToRequest:v11 asset:v12];

  if ([v9 itemType] == 2)
  {
    [v10 setTreatLivePhotoAsStill:0];
    if ([v9 encodingPolicy] == 2) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    [v10 setVariant:v14];
    [v10 setShouldBundleComplexAssetResources:1];
  }
  else if (v13)
  {
    [v10 setTreatLivePhotoAsStill:1];
    objc_msgSend(v10, "setVariant:", objc_msgSend(v13, "PHAssetExportRequestVariantValue"));
  }
  [v10 setFlattenSlomoVideos:1];
  objc_msgSend(v10, "setShouldStripLocation:", objc_msgSend(v9, "shouldIncludeLocation") ^ 1);
  objc_msgSend(v10, "setShouldStripCaption:", objc_msgSend(v9, "shouldIncludeCaption") ^ 1);
  if ([v9 shouldExportForMail]) {
    [v10 setVideoExportPreset:*MEMORY[0x1E4F15738]];
  }

  return v10;
}

+ (void)_exportAssets:(id)a3 toURL:(id)a4 configuration:(id)a5 progress:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v27 = a4;
  id v11 = a5;
  id v28 = a6;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v10;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v29 = *(void *)v37;
    uint64_t v15 = MEMORY[0x1E4F14500];
    *(void *)&long long v13 = 138412546;
    long long v25 = v13;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * v16);
        uint32_t v18 = objc_msgSend(v11, "activityTypeForAssetExportAnalytics", v25);
        id v35 = 0;
        uint64_t v19 = [a1 _exportRequestForAsset:v17 analyticsActivityType:v18 error:&v35];
        id v20 = v35;

        if (v19)
        {
          dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __70__PXPhotosExportUtilities__exportAssets_toURL_configuration_progress___block_invoke;
          v30[3] = &unk_1E5DCC480;
          id v34 = a1;
          id v22 = v11;
          id v31 = v22;
          id v32 = v27;
          dispatch_semaphore_t v33 = v21;
          v23 = v21;
          __int16 v24 = [a1 _exportAssetUsingExportRequest:v19 configuration:v22 completion:v30];
          [v28 addChild:v24 withPendingUnitCount:90];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            id v41 = v19;
            __int16 v42 = 2112;
            id v43 = v28;
            _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "Finished creating export request: %@ (progress: %@)", buf, 0x16u);
          }
          dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v25;
          id v41 = v20;
          __int16 v42 = 2112;
          id v43 = v28;
          _os_log_error_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Creating export request failed with error: %@ (progress: %@)", buf, 0x16u);
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v14);
  }
}

void __70__PXPhotosExportUtilities__exportAssets_toURL_configuration_progress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PXPhotosExportUtilities__exportAssets_toURL_configuration_progress___block_invoke_2;
    v9[3] = &unk_1E5DCC458;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v7 _downscaleAssetAtURLIfNeeded:v5 configuration:v8 completion:v9];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to export photo library asset with error: %@", buf, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __70__PXPhotosExportUtilities__exportAssets_toURL_configuration_progress___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 lastPathComponent];
    uint64_t v8 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v7];
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = 0;
    int v10 = [v9 moveItemAtURL:v5 toURL:v8 error:&v12];
    id v11 = v12;

    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v8;
        _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Moved %@ to %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v11;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed move file: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to downscale photo library asset with error: %@", buf, 0xCu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (void)_downscaleImageAtURL:(id)a3 targetDimension:(id)a4 completion:(id)a5
{
  v57[6] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (_downscaleImageAtURL_targetDimension_completion__onceToken != -1) {
    dispatch_once(&_downscaleImageAtURL_targetDimension_completion__onceToken, &__block_literal_global_256413);
  }
  int v10 = (void *)MEMORY[0x1E4F442D8];
  id v11 = [v7 lastPathComponent];
  id v12 = [v11 pathExtension];
  id v13 = [v10 typeWithFilenameExtension:v12];
  id v14 = [v13 identifier];

  v49 = v14;
  uint64_t v15 = PXPhotosFileProviderTypeIdentifierForDownscalingAssetWithTypeIdentifier(v14);
  v56[0] = *MEMORY[0x1E4F749F0];
  uint64_t v16 = [MEMORY[0x1E4F748B0] standardPolicy];
  v57[0] = v16;
  v56[1] = *MEMORY[0x1E4F74A20];
  uint64_t v17 = [NSString stringWithFormat:@"PUPhotosFileProviderItemProvider downscaling image to target length: %@", v8];
  uint64_t v18 = *MEMORY[0x1E4F74988];
  v57[1] = v17;
  v57[2] = MEMORY[0x1E4F1CC38];
  uint64_t v19 = *MEMORY[0x1E4F749E0];
  v56[2] = v18;
  v56[3] = v19;
  uint64_t v20 = *MEMORY[0x1E4F749D8];
  v57[3] = v8;
  v57[4] = &unk_1F02D9BF8;
  uint64_t v21 = *MEMORY[0x1E4F74A00];
  v56[4] = v20;
  v56[5] = v21;
  v48 = (void *)v15;
  v57[5] = v15;
  uint64_t v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:6];

  id v22 = [MEMORY[0x1E4F28CB8] defaultManager];
  v23 = [v22 temporaryDirectory];
  __int16 v24 = [MEMORY[0x1E4F29128] UUID];
  long long v25 = [v24 UUIDString];
  __int16 v26 = [v23 URLByAppendingPathComponent:v25 isDirectory:1];

  id v27 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v55 = 0;
  LODWORD(v23) = [v27 createDirectoryAtURL:v26 withIntermediateDirectories:1 attributes:0 error:&v55];
  id v28 = v55;

  if (v23)
  {
    uint64_t v29 = [MEMORY[0x1E4F29128] UUID];
    v30 = [v29 UUIDString];
    [v26 URLByAppendingPathComponent:v30];
    v32 = id v31 = v7;

    dispatch_semaphore_t v33 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v54 = 0;
    v46 = v31;
    LODWORD(v30) = [v33 moveItemAtURL:v31 toURL:v32 error:&v54];
    id v34 = v54;

    if (v30)
    {
      id v35 = [MEMORY[0x1E4F29128] UUID];
      long long v36 = [v35 UUIDString];
      long long v37 = [v26 URLByAppendingPathComponent:v36];

      uint64_t v38 = [MEMORY[0x1E4F748C8] collectionWithMainResourceURL:v32];
      long long v39 = [MEMORY[0x1E4F748C8] collectionWithMainResourceURL:v37];
      uint64_t v40 = _downscaleImageAtURL_targetDimension_completion__client;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __75__PXPhotosExportUtilities__downscaleImageAtURL_targetDimension_completion___block_invoke_112;
      v50[3] = &unk_1E5DCC430;
      id v53 = v9;
      id v51 = v37;
      id v52 = v26;
      id v41 = v37;
      __int16 v42 = (void *)v40;
      uint64_t v43 = v38;
      v44 = (void *)v38;
      uint64_t v45 = (void *)v47;
      [v42 convertImageAtSourceURLCollection:v43 toDestinationURLCollection:v39 options:v47 completionHandler:v50];
    }
    else
    {
      (*((void (**)(id, void, id))v9 + 2))(v9, 0, v34);
      uint64_t v45 = (void *)v47;
    }

    id v7 = v46;
  }
  else
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v28);
    uint64_t v45 = (void *)v47;
  }
}

void __75__PXPhotosExportUtilities__downscaleImageAtURL_targetDimension_completion___block_invoke_112(void *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[6];
  if (a2 == 1)
  {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], 0);
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = a1[5];
    id v11 = 0;
    int v6 = [v4 removeItemAtURL:v5 error:&v11];
    id v7 = v11;

    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = a1[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Deleted downscaling temp file at URL: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = a1[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to delete downscaling temp file at URL: %@ error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v9 = *(void (**)(void))(v3 + 16);
    v9();
  }
}

void __75__PXPhotosExportUtilities__downscaleImageAtURL_targetDimension_completion___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F74898]);
  v1 = (void *)_downscaleImageAtURL_targetDimension_completion__client;
  _downscaleImageAtURL_targetDimension_completion__client = (uint64_t)v0;
}

+ (void)_downscaleAssetAtURLIfNeeded:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 downscalingTargetDimension];
  if (v11 && (v12 = (void *)v11, uint64_t v13 = [v9 itemType], v12, v13 == 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [v9 downscalingTargetDimension];
      *(_DWORD *)buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Downscaling asset (%@) to target dimension: %@", buf, 0x16u);
    }
    id v15 = [v9 downscalingTargetDimension];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__PXPhotosExportUtilities__downscaleAssetAtURLIfNeeded_configuration_completion___block_invoke;
    v16[3] = &unk_1E5DCDAC0;
    id v17 = v10;
    [a1 _downscaleImageAtURL:v8 targetDimension:v15 completion:v16];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Don't need to downscale asset: %@", buf, 0xCu);
    }
    (*((void (**)(id, id, void))v10 + 2))(v10, v8, 0);
  }
}

uint64_t __81__PXPhotosExportUtilities__downscaleAssetAtURLIfNeeded_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_exportRequestForAsset:(id)a3 analyticsActivityType:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F38F38] exportRequestForAsset:a3 error:a5];
  id v9 = v8;
  if (v8)
  {
    [v8 setAnalyticsActivityType:v7];
    [v9 setShouldSendTimingIntervalsToAnalytics:1];
  }

  return v9;
}

+ (void)_exportCollectionList:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v35 = a4;
  id v34 = a5;
  id v32 = (void (**)(id, void *, id))a6;
  id v10 = NSString;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSinceReferenceDate];
  uint64_t v13 = objc_msgSend(v10, "stringWithFormat:", @"CollectionList-%lf", v12);

  __int16 v14 = (void *)MEMORY[0x1E4F1CB10];
  id v15 = NSTemporaryDirectory();
  id v31 = (void *)v13;
  uint64_t v16 = [v15 stringByAppendingPathComponent:v13];
  uint64_t v17 = [v14 fileURLWithPath:v16 isDirectory:1];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v30 = (void *)v17;
  id obj = +[PXExportContainer containersForRootCollection:v9 destinationURL:v17];
  uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = 0;
    uint64_t v21 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        v23 = v20;
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(obj);
        }
        __int16 v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v25 = [MEMORY[0x1E4F28CB8] defaultManager];
        __int16 v26 = [v24 url];
        id v37 = v20;
        int v27 = [v25 createDirectoryAtURL:v26 withIntermediateDirectories:0 attributes:0 error:&v37];
        id v20 = v37;

        if (v27)
        {
          id v28 = [v24 assets];
          uint64_t v29 = [v24 url];
          [a1 _exportAssets:v28 toURL:v29 configuration:v35 progress:v34];
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v20;
          _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to create export directory: %@", buf, 0xCu);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v19);
  }
  else
  {
    id v20 = 0;
  }

  v32[2](v32, v30, v20);
}

+ (void)exportAssets:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = NSString;
  __int16 v14 = (void *)MEMORY[0x1E4F1C9C8];
  id v15 = (void (**)(id, void *, id))a6;
  uint64_t v16 = [v14 now];
  [v16 timeIntervalSinceReferenceDate];
  uint64_t v18 = objc_msgSend(v13, "stringWithFormat:", @"AssetFetchResult-%lf", v17);

  uint64_t v19 = (void *)MEMORY[0x1E4F1CB10];
  id v20 = NSTemporaryDirectory();
  uint64_t v21 = [v20 stringByAppendingPathComponent:v18];
  uint64_t v22 = [v19 fileURLWithPath:v21 isDirectory:1];

  v23 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v26 = 0;
  int v24 = [v23 createDirectoryAtURL:v22 withIntermediateDirectories:0 attributes:0 error:&v26];
  id v25 = v26;

  if (v24)
  {
    [a1 _exportAssets:v10 toURL:v22 configuration:v11 progress:v12];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v25;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Failed to create export directory: %@", buf, 0xCu);
  }
  v15[2](v15, v22, v25);
}

+ (void)exportAssetsInContainer:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 _exportCollectionList:v10 configuration:v11 progress:v12 completion:v13];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [MEMORY[0x1E4F38EB8] fetchAssetsForPerson:v10 options:0];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [MEMORY[0x1E4F38EB8] fetchExclusiveAssetsForSocialGroup:v10 options:0];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v10 options:0];
LABEL_9:
    id v15 = (void *)v14;
    if (v14)
    {
      [a1 exportAssets:v14 configuration:v11 progress:v12 completion:v13];

      goto LABEL_13;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    id v17 = v10;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to determine assets contained in %@", (uint8_t *)&v16, 0xCu);
  }
LABEL_13:
}

+ (void)exportAsset:(id)a3 configuration:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [v10 activityTypeForAssetExportAnalytics];
  id v25 = 0;
  id v15 = [a1 _exportRequestForAsset:v13 analyticsActivityType:v14 error:&v25];

  id v16 = v25;
  if (v15)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __73__PXPhotosExportUtilities_exportAsset_configuration_progress_completion___block_invoke;
    uint64_t v21 = &unk_1E5DCC408;
    id v24 = a1;
    id v22 = v10;
    id v23 = v12;
    id v17 = [a1 _exportAssetUsingExportRequest:v15 configuration:v22 completion:&v18];
    objc_msgSend(v11, "addChild:withPendingUnitCount:", v17, 90, v18, v19, v20, v21);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v15;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Finished creating export request: %@ (progress: %@)", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Creating export request failed with error: %@ (progress: %@)", buf, 0x16u);
    }
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v16);
  }
}

void __73__PXPhotosExportUtilities_exportAsset_configuration_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__PXPhotosExportUtilities_exportAsset_configuration_progress_completion___block_invoke_2;
    v9[3] = &unk_1E5DCDAC0;
    id v8 = *(void **)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v8 _downscaleAssetAtURLIfNeeded:v5 configuration:v7 completion:v9];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to export photo library asset with error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __73__PXPhotosExportUtilities_exportAsset_configuration_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to downscale photo library asset with error: %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

@end