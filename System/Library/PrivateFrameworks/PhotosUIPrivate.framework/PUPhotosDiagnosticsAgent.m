@interface PUPhotosDiagnosticsAgent
+ (id)localDiagnosticsAgent;
- (id)__currentTimestamp;
- (id)_currentAsset;
- (id)_currentAssetDetailedDescription;
- (id)_currentAssetIdentifierDescription;
- (id)_currentAssetIdentifierUUID;
- (id)_currentAssetMetadata;
- (id)_currentAssetViewModelDescription;
- (id)_currentPrivacyController;
- (id)_currentWindows;
- (id)_descriptionForAllUIState;
- (id)_descriptionOfUIState:(int64_t)a3;
- (id)_selectedAssetIdentifiersDescription;
- (id)_selectedAssetUUIDsDescription;
- (id)_selectedAssets;
- (id)_uuidsShownInGrid;
- (id)_viewControllerHierarchyDescription;
- (id)_viewModelDescription;
- (id)_windowRecursiveDescription;
- (void)_captureCurrentAssetResourcesToDirectory:(id)a3 withResultHandler:(id)a4;
- (void)captureDescriptionOfCloudPhotoLibraryWithResultHandler:(id)a3;
- (void)captureDescriptionOfPhotoAnalysisWithResultHandler:(id)a3;
- (void)captureDescriptionOfStatisticsWithResultHandler:(id)a3;
- (void)captureDescriptionOfUIState:(int64_t)a3 resultHandler:(id)a4;
- (void)dumpState:(int64_t)a3 toDirectoryURL:(id)a4 resultHandler:(id)a5;
- (void)postNotificationWithName:(id)a3 userInfo:(id)a4 resultHandler:(id)a5;
- (void)setContentPrivacyState:(int64_t)a3 resultHandler:(id)a4;
- (void)setSystemAuthenticationType:(int64_t)a3 resultHandler:(id)a4;
- (void)startTungstenRecordingToDirectoryURL:(id)a3 resultHandler:(id)a4;
- (void)stopTungstenRecordingWithResultHandler:(id)a3;
- (void)timelineForAlbum:(id)a3 widgetSize:(id)a4 jsonFormat:(BOOL)a5 resultHandler:(id)a6;
- (void)timelineForWidgetSize:(id)a3 jsonFormat:(BOOL)a4 resultHandler:(id)a5;
@end

@implementation PUPhotosDiagnosticsAgent

void __49__PUPhotosDiagnosticsAgent_localDiagnosticsAgent__block_invoke()
{
  v0 = objc_alloc_init(PUPhotosDiagnosticsAgent);
  v1 = (void *)localDiagnosticsAgent_localDiagnosticsAgent;
  localDiagnosticsAgent_localDiagnosticsAgent = (uint64_t)v0;
}

+ (id)localDiagnosticsAgent
{
  if (localDiagnosticsAgent_onceToken != -1) {
    dispatch_once(&localDiagnosticsAgent_onceToken, &__block_literal_global_66949);
  }
  v2 = (void *)localDiagnosticsAgent_localDiagnosticsAgent;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsNotificationCenter, 0);
  objc_storeStrong((id *)&self->_recordingSessions, 0);
}

- (void)captureDescriptionOfPhotoAnalysisWithResultHandler:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v5 = [v4 photoAnalysisClient];
  v6 = v5;
  if (v5)
  {
    id v11 = 0;
    v7 = [v5 dumpAnalysisStatusError:&v11];
    id v8 = v11;
    v9 = v8;
    if (v7) {
      PLPrettyPrintPList();
    }
    else {
    v10 = [v8 localizedDescription];
    }
    v3[2](v3, v10);
  }
  else
  {
    v3[2](v3, &stru_1F06BE7B8);
  }
}

- (void)captureDescriptionOfCloudPhotoLibraryWithResultHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F598A0]);
    v5 = (void *)[v4 initForManagementWithLibraryIdentifier:*MEMORY[0x1E4F59798]];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __83__PUPhotosDiagnosticsAgent_captureDescriptionOfCloudPhotoLibraryWithResultHandler___block_invoke;
    v7[3] = &unk_1E5F2A470;
    id v8 = v5;
    id v9 = v3;
    id v6 = v5;
    [v6 openWithCompletionHandler:v7];
  }
}

void __83__PUPhotosDiagnosticsAgent_captureDescriptionOfCloudPhotoLibraryWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [a2 localizedDescription];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__PUPhotosDiagnosticsAgent_captureDescriptionOfCloudPhotoLibraryWithResultHandler___block_invoke_2;
    v6[3] = &unk_1E5F2A448;
    id v4 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    [v4 getStatusForComponents:0 completionHandler:v6];
  }
}

uint64_t __83__PUPhotosDiagnosticsAgent_captureDescriptionOfCloudPhotoLibraryWithResultHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a3)
  {
    id v5 = [a3 localizedDescription];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(void))(v4 + 16))(*(void *)(a1 + 40));
  }
  id v6 = *(void **)(a1 + 32);
  return [v6 closeWithCompletionHandler:&__block_literal_global_367];
}

- (void)captureDescriptionOfStatisticsWithResultHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    dispatch_queue_t v5 = dispatch_queue_create("PUPhotosDiagnosticsAgent.output", 0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke;
    aBlock[3] = &unk_1E5F2A1F8;
    dispatch_queue_t v32 = v5;
    id v6 = v4;
    id v33 = v6;
    id v7 = v5;
    id v8 = _Block_copy(aBlock);
    dispatch_group_t v9 = dispatch_group_create();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_3;
    v28[3] = &unk_1E5F2A3D8;
    v10 = v9;
    v29 = v10;
    id v11 = v8;
    id v30 = v11;
    v12 = _Block_copy(v28);
    dispatch_group_enter(v10);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_5;
    block[3] = &unk_1E5F2E958;
    id v26 = v12;
    id v27 = v11;
    v13 = v10;
    v25 = v13;
    id v14 = v11;
    id v15 = v12;
    v16 = MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], block);
    dispatch_group_enter(v13);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_8;
    v22[3] = &unk_1E5F2ED10;
    v23 = v13;
    v17 = v13;
    dispatch_async(v7, v22);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_9;
    v19[3] = &unk_1E5F2EA60;
    id v20 = v6;
    id v21 = v3;
    id v18 = v6;
    dispatch_group_notify(v17, v16, v19);
  }
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_2;
  v6[3] = &unk_1E5F2ECC8;
  id v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = *(NSObject **)(a1 + 32);
  id v9 = a4;
  id v10 = a3;
  dispatch_group_enter(v8);
  id v11 = [MEMORY[0x1E4F900A0] defaultController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_4;
  v13[3] = &unk_1E5F2A3B0;
  id v16 = *(id *)(a1 + 40);
  id v14 = v7;
  id v15 = *(id *)(a1 + 32);
  id v12 = v7;
  [v11 collectStatisticsForViewModel:v10 extendedTraitCollection:v9 resultHandler:v13];
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v3 = [v2 windows];
  id v4 = [v3 firstObject];
  id v5 = [v4 rootViewController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_6;
  v9[3] = &unk_1E5F2EC30;
  id v11 = &v12;
  id v10 = *(id *)(a1 + 40);
  objc_msgSend(v5, "px_enumerateDescendantViewControllersWithOptions:usingBlock:", 0, v9);

  if (!*((unsigned char *)v13 + 24)) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_7;
  aBlock[3] = &unk_1E5F2A400;
  id v8 = *(id *)(a1 + 40);
  id v6 = (void (**)(void *, __CFString *, uint64_t, uint64_t))_Block_copy(aBlock);
  v6[2](v6, @"iPhone", 5, 1);
  v6[2](v6, @"iPad Portrait", 7, 1);
  v6[2](v6, @"iPad Landscape", 7, 2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  _Block_object_dispose(&v12, 8);
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_8(uint64_t a1)
{
}

uint64_t __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "px_isVisible"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v3 = v7;
    id v4 = [v3 viewProvider];
    id v5 = [v4 viewModel];

    id v6 = objc_msgSend(v3, "px_extendedTraitCollection");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (objc_class *)MEMORY[0x1E4F90350];
  id v8 = a2;
  id v14 = (id)[[v7 alloc] initWithFormFactor:a3 orientation:a4 visibleChromeElements:9];
  id v9 = objc_alloc(MEMORY[0x1E4F900B0]);
  id v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v11 = (void *)[v9 initWithPhotoLibrary:v10 extendedTraitCollection:v14];

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = [v11 viewModel];
  (*(void (**)(uint64_t, id, void *, id))(v12 + 16))(v12, v8, v13, v14);
}

void __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [NSString stringWithFormat:@"==== Curated Library (%@) ====\n\n", *(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  uint64_t v8 = *(void *)(a1 + 48);
  if (v10) {
    [v10 summaryDescription];
  }
  else {
  id v9 = [NSString stringWithFormat:@"failed to capture curated library statistics: %@", v5];
  }
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __76__PUPhotosDiagnosticsAgent_captureDescriptionOfStatisticsWithResultHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) containsString:@"\n"];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 appendString:@"\n"];
  }
  return result;
}

- (void)_captureCurrentAssetResourcesToDirectory:(id)a3 withResultHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v6 = a4;
  v29 = [MEMORY[0x1E4F1CA48] array];
  group = dispatch_group_create();
  id v7 = objc_msgSend(MEMORY[0x1E4FB1438], "pu_debugCurrentAsset");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = (void *)&unk_1AEFF7000;
  id v32 = v8;
  if (v32 && [MEMORY[0x1E4F39228] authorizationStatusForAccessLevel:2] == 3)
  {
    id v27 = v7;
    v28 = [(PUPhotosDiagnosticsAgent *)self __currentTimestamp];
    [MEMORY[0x1E4F38F60] assetResourcesForAsset:v32];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v47;
      do
      {
        uint64_t v13 = 0;
        uint64_t v33 = v11;
        do
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
          if (([v14 type] & 0xFFFFFFFFFFFFFFFBLL) != 2)
          {
            char v15 = NSString;
            id v16 = [v32 uuid];
            uint64_t v17 = [v14 type];
            uint64_t v18 = [v14 originalFilename];
            v19 = (void *)v18;
            id v20 = @".unknown";
            if (v18) {
              id v20 = (__CFString *)v18;
            }
            id v21 = [v15 stringWithFormat:@"%@/AssetResource_%@_%@_%ld_%@", v31, v28, v16, v17, v20];

            dispatch_group_enter(group);
            v22 = [MEMORY[0x1E4F38F78] defaultManager];
            v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v21 isDirectory:0];
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke;
            v38[3] = &unk_1E5F2A388;
            id v39 = v31;
            id v40 = v28;
            id v41 = v32;
            v42 = v14;
            id v43 = v29;
            id v44 = v21;
            v45 = group;
            id v24 = v21;
            [v22 writeDataForAssetResource:v14 toFile:v23 options:0 completionHandler:v38];

            uint64_t v11 = v33;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v11);
    }

    id v7 = v27;
    id v9 = &unk_1AEFF7000;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = v9[59];
  block[2] = __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke_331;
  block[3] = &unk_1E5F2EA60;
  id v36 = v29;
  id v37 = v6;
  id v25 = v29;
  id v26 = v6;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);
}

void __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke_2;
  v8[3] = &unk_1E5F2A360;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(void **)(a1 + 64);
  id v12 = v4;
  uint64_t v13 = v5;
  id v14 = v6;
  id v15 = *(id *)(a1 + 72);
  id v16 = *(id *)(a1 + 80);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke_331(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __87__PUPhotosDiagnosticsAgent__captureCurrentAssetResourcesToDirectory_withResultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = NSString;
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = [*(id *)(a1 + 56) uuid];
    id v6 = [v2 stringWithFormat:@"%@/AssetResource_%@_%@_%ld_error.txt", v3, v4, v5, objc_msgSend(*(id *)(a1 + 64), "type")];

    id v7 = [*(id *)(a1 + 32) description];
    uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
    id v13 = 0;
    char v9 = [v7 writeToURL:v8 atomically:1 encoding:4 error:&v13];
    id v10 = v13;

    if ((v9 & 1) == 0)
    {
      id v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        id v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Error writing debug asset resource to path:%@ error:%@ writeError:%@", buf, 0x20u);
      }
    }
    [*(id *)(a1 + 72) addObject:v6];
  }
  else
  {
    [*(id *)(a1 + 72) addObject:*(void *)(a1 + 80)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

- (id)__currentTimestamp
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"yyyy_MM_dd_HH_mm_ssZ"];
  uint64_t v4 = [v3 stringFromDate:v2];

  return v4;
}

- (id)_currentWindows
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v3 = [v2 windows];

  return v3;
}

- (id)_windowRecursiveDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(PUPhotosDiagnosticsAgent *)self _currentWindows];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 recursiveDescription];
        id v11 = objc_msgSend(v10, "pu_stringByIndentingNewLines");
        [v3 appendFormat:@"%@:\n\t%@\n", v9, v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_viewControllerHierarchyDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(PUPhotosDiagnosticsAgent *)self _currentWindows];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) rootViewController];
        id v10 = [v9 _printHierarchy];

        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v3 componentsJoinedByString:@"\n"];

  return v11;
}

- (id)_viewModelDescription
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1438], "pu_debugCurrentViewModel");
  id v3 = [v2 debugDetailedDescription];

  return v3;
}

- (id)_currentAssetDetailedDescription
{
  v2 = [(PUPhotosDiagnosticsAgent *)self _currentAsset];
  id v3 = [v2 photoLibrary];
  uint64_t v4 = [v3 photoLibrary];
  uint64_t v5 = [v2 detailedDebugDescriptionInLibrary:v4];

  return v5;
}

- (id)_currentAssetMetadata
{
  v2 = [(PUPhotosDiagnosticsAgent *)self _currentAsset];
  id v3 = [v2 metadataDebugDescription];

  return v3;
}

- (id)_currentAssetViewModelDescription
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1438], "pu_debugCurrentViewModel");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 currentAssetReference];
    if (v3)
    {
      uint64_t v4 = [v2 assetViewModelForAssetReference:v3];
      uint64_t v5 = [v4 debugDetailedDescription];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_selectedAssetUUIDsDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(PUPhotosDiagnosticsAgent *)self _selectedAssets];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = objc_msgSend(v9, "uuid", (void)v13);
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v3 componentsJoinedByString:@","];

  return v11;
}

- (id)_selectedAssetIdentifiersDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(PUPhotosDiagnosticsAgent *)self _selectedAssets];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = objc_msgSend(v9, "localIdentifier", (void)v13);
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v3 componentsJoinedByString:@","];

  return v11;
}

- (id)_uuidsShownInGrid
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1438], "pu_debugCurrentPhotosViewController");
  id v3 = [v2 visibleUUIDs];

  id v4 = [v3 description];

  return v4;
}

- (id)_currentAssetIdentifierUUID
{
  v2 = [(PUPhotosDiagnosticsAgent *)self _currentAsset];
  id v3 = [v2 uuid];

  return v3;
}

- (id)_currentAssetIdentifierDescription
{
  v2 = [(PUPhotosDiagnosticsAgent *)self _currentAsset];
  id v3 = [v2 localIdentifier];

  return v3;
}

- (id)_selectedAssets
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1438], "pu_debugCurrentlySelectedAssets");
}

- (id)_currentAsset
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1438], "pu_debugCurrentAsset");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)_descriptionOfUIState:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = [MEMORY[0x1E4F900C8] sharedController];
      id v4 = [v3 currentItemProviders];
      uint64_t v5 = [v3 servicesWithItemProviders:v4];
      uint64_t v6 = [v3 consoleDescriptionForServices:v5];

      goto LABEL_22;
    case 2:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _currentAssetIdentifierDescription];
      goto LABEL_19;
    case 3:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _currentAssetIdentifierUUID];
      goto LABEL_19;
    case 4:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _currentAssetViewModelDescription];
      goto LABEL_19;
    case 5:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _currentAssetDetailedDescription];
      goto LABEL_19;
    case 6:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _currentAssetMetadata];
      goto LABEL_19;
    case 7:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _selectedAssetIdentifiersDescription];
      goto LABEL_19;
    case 8:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _selectedAssetUUIDsDescription];
      goto LABEL_19;
    case 9:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _viewModelDescription];
      goto LABEL_19;
    case 10:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _viewControllerHierarchyDescription];
      goto LABEL_19;
    case 11:
      uint64_t v7 = [MEMORY[0x1E4FB1EC0] _allDescriptions];
      goto LABEL_19;
    case 12:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _windowRecursiveDescription];
      goto LABEL_19;
    case 13:
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      char v9 = (void *)MEMORY[0x1E4F90240];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__PUPhotosDiagnosticsAgent__descriptionOfUIState___block_invoke;
      v13[3] = &unk_1E5F2A338;
      id v14 = v8;
      id v3 = v8;
      [v9 enumerateAllViewsUsingBlock:v13];
      uint64_t v6 = (void *)[v3 copy];

      goto LABEL_22;
    case 14:
      uint64_t v7 = [MEMORY[0x1E4F907A0] allDiagnosticDescriptions];
      goto LABEL_19;
    case 15:
      id v10 = (void *)MEMORY[0x1E4F90538];
      id v3 = [(PUPhotosDiagnosticsAgent *)self _currentWindows];
      uint64_t v11 = [v10 diagnosticDescriptionForWindows:v3];
      goto LABEL_21;
    case 16:
      uint64_t v7 = [(PUPhotosDiagnosticsAgent *)self _uuidsShownInGrid];
LABEL_19:
      uint64_t v6 = (void *)v7;
      break;
    case 17:
      id v3 = +[PUSearchDebugUtilities assetRetrievalMap];
      uint64_t v11 = [v3 description];
LABEL_21:
      uint64_t v6 = (void *)v11;
LABEL_22:

      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  return v6;
}

void __50__PUPhotosDiagnosticsAgent__descriptionOfUIState___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = [v5 diagnosticDescription];
  [v3 appendString:v4];
}

- (id)_descriptionForAllUIState
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  id v8 = self;
  char v9 = v3;
  id v4 = v3;
  PLDiagnosticsEnumerateAllUIStatesUsingBlock();
  id v5 = objc_msgSend(v4, "copy", v7, 3221225472, __53__PUPhotosDiagnosticsAgent__descriptionForAllUIState__block_invoke, &unk_1E5F2A310, v8);

  return v5;
}

void __53__PUPhotosDiagnosticsAgent__descriptionForAllUIState__block_invoke(uint64_t a1, uint64_t a2)
{
  PLDiagnosticsTitleOfUIState();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [*(id *)(a1 + 32) _descriptionOfUIState:a2];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = objc_msgSend(v4, "pu_stringByIndentingNewLines");
    [v6 appendFormat:@"%@:\n\t%@\n\n", v8, v7];
  }
}

- (id)_currentPrivacyController
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1438], "pu_debugCurrentPrivacyController");
}

- (void)setSystemAuthenticationType:(int64_t)a3 resultHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PUPhotosDiagnosticsAgent_setSystemAuthenticationType_resultHandler___block_invoke;
  v7[3] = &unk_1E5F2A2E8;
  id v8 = v5;
  int64_t v9 = a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __70__PUPhotosDiagnosticsAgent_setSystemAuthenticationType_resultHandler___block_invoke(uint64_t a1)
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v2 = [MEMORY[0x1E4F907E0] sharedObserver];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = NSString;
  id v5 = PXDebugDescriptionFromSystemAuthenticationType();
  id v6 = [v4 stringWithFormat:@"System authentication type simulation set to %@", v5];
  [v9 addObject:v6];

  [v2 setForcedSystemAuthenticationType:v3];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v9 componentsJoinedByString:@"\n"];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4 resultHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  diagnosticsNotificationCenter = self->_diagnosticsNotificationCenter;
  if (!diagnosticsNotificationCenter)
  {
    uint64_t v11 = (PXDiagnosticsNotificationCenter *)objc_alloc_init(MEMORY[0x1E4F900D8]);
    uint64_t v12 = self->_diagnosticsNotificationCenter;
    self->_diagnosticsNotificationCenter = v11;

    diagnosticsNotificationCenter = self->_diagnosticsNotificationCenter;
  }
  [(PXDiagnosticsNotificationCenter *)diagnosticsNotificationCenter postNotificationWithName:v13 userInfo:v8 resultHandler:v9];
}

- (void)stopTungstenRecordingWithResultHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PUPhotosDiagnosticsAgent_stopTungstenRecordingWithResultHandler___block_invoke;
  v6[3] = &unk_1E5F2EA60;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __67__PUPhotosDiagnosticsAgent_stopTungstenRecordingWithResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isStopped", (void)v11) & 1) == 0) {
          [v7 stop];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startTungstenRecordingToDirectoryURL:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PUPhotosDiagnosticsAgent_startTungstenRecordingToDirectoryURL_resultHandler___block_invoke;
  block[3] = &unk_1E5F2EBC8;
  long long v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__PUPhotosDiagnosticsAgent_startTungstenRecordingToDirectoryURL_resultHandler___block_invoke(void *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v22 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v2 = (void *)a1[4];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v22 temporaryDirectory];
  }
  uint64_t v4 = v3;
  id v36 = 0;
  char v5 = [v22 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v36];
  id v6 = v36;
  id v21 = v6;
  if (v5)
  {
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__66872;
    v34 = __Block_byref_object_dispose__66873;
    id v35 = [MEMORY[0x1E4F1CA48] array];
    id v7 = (void *)MEMORY[0x1E4F90240];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__PUPhotosDiagnosticsAgent_startTungstenRecordingToDirectoryURL_resultHandler___block_invoke_2;
    v27[3] = &unk_1E5F2A2C0;
    id v28 = v4;
    v29 = &v30;
    [v7 enumerateAllViewsUsingBlock:v27];
    id v8 = [MEMORY[0x1E4F28E78] stringWithString:@"No recordings were started. Ensure that current renderers support recording."];
    if ([(id)v31[5] count])
    {
      id v9 = (void *)MEMORY[0x1E4F28E78];
      unint64_t v10 = [(id)v31[5] count];
      id v11 = &stru_1F06BE7B8;
      if (v10 > 1) {
        id v11 = @"s";
      }
      long long v12 = [v9 stringWithFormat:@"Started recording%@:\n  ", v11];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = (id)v31[5];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v37 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = [*(id *)(*((void *)&v23 + 1) + 8 * i) recordingURL];
            uint64_t v18 = [v17 path];
            [v12 appendFormat:@"%@\n  ", v18];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v37 count:16];
        }
        while (v14);
      }
    }
    else
    {
      long long v12 = v8;
    }
    objc_storeStrong((id *)(a1[5] + 8), (id)v31[5]);
    (*(void (**)(void))(a1[6] + 16))();

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    uint64_t v19 = a1[6];
    uint64_t v20 = [v6 localizedDescription];
    (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
  }
}

void __79__PUPhotosDiagnosticsAgent_startTungstenRecordingToDirectoryURL_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 engine];
  id v3 = [v4 startRecordingToDirectoryURL:*(void *)(a1 + 32)];
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
  }
}

- (void)setContentPrivacyState:(int64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PUPhotosDiagnosticsAgent_setContentPrivacyState_resultHandler___block_invoke;
  block[3] = &unk_1E5F2B448;
  id v9 = v6;
  int64_t v10 = a3;
  void block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__PUPhotosDiagnosticsAgent_setContentPrivacyState_resultHandler___block_invoke(uint64_t a1)
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = [*(id *)(a1 + 32) _currentPrivacyController];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      if (v4 != 1) {
        goto LABEL_8;
      }
      [v2 lockImmediately];
      char v5 = @"Privacy controller set to LOCKED";
    }
    else
    {
      [v2 unlock];
      char v5 = @"Privacy controller set to UNLOCKED";
    }
  }
  else
  {
    char v5 = @"Couldn't find a privacy controller in current view hierarchy";
  }
  [v8 addObject:v5];
LABEL_8:
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [v8 componentsJoinedByString:@"\n"];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (void)timelineForAlbum:(id)a3 widgetSize:(id)a4 jsonFormat:(BOOL)a5 resultHandler:(id)a6
{
  BOOL v6 = a5;
  id v9 = (void *)MEMORY[0x1E4F90808];
  int64_t v10 = (void (**)(id, id))a6;
  id v11 = [v9 timelineDiagnosticForAlbum:a3 widgetSize:a4 jsonFormat:v6];
  v10[2](v10, v11);
}

- (void)timelineForWidgetSize:(id)a3 jsonFormat:(BOOL)a4 resultHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = (void *)MEMORY[0x1E4F90808];
  id v8 = (void (**)(id, id))a5;
  id v9 = [v7 timelineDiagnosticForWidgetSize:a3 jsonFormat:v5];
  v8[2](v8, v9);
}

- (void)dumpState:(int64_t)a3 toDirectoryURL:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = v10;
  if (v8)
  {
    id v12 = v8;
  }
  else
  {
    id v12 = [v10 temporaryDirectory];
  }
  id v13 = v12;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__66872;
  id v28 = __Block_byref_object_dispose__66873;
  id v29 = 0;
  id obj = 0;
  char v14 = [v11 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&obj];
  objc_storeStrong(&v29, obj);
  if (v14)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke;
    block[3] = &unk_1E5F2A298;
    int64_t v22 = a3;
    id v17 = v13;
    uint64_t v18 = self;
    id v19 = v11;
    id v21 = &v24;
    id v20 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);

    uint64_t v15 = v17;
  }
  else
  {
    uint64_t v15 = [(id)v25[5] localizedDescription];
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
  }

  _Block_object_dispose(&v24, 8);
}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  switch(*(void *)(a1 + 72))
  {
    case 0:
      id v2 = NSString;
      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "__currentTimestamp");
      BOOL v5 = [v2 stringWithFormat:@"PhotosUI_%@", v4];
      id v6 = [v3 URLByAppendingPathComponent:v5];

      id v7 = *(void **)(a1 + 48);
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
      id v72 = *(id *)(v8 + 40);
      LOBYTE(v4) = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v72];
      objc_storeStrong((id *)(v8 + 40), v72);
      if (v4)
      {
        id v9 = [*(id *)(a1 + 40) _descriptionForAllUIState];
        int64_t v10 = [v6 URLByAppendingPathComponent:@"PhotosUIDescription.txt"];
        [v9 writeToURL:v10 atomically:1 encoding:4 error:0];

        uint64_t v65 = MEMORY[0x1E4F143A8];
        uint64_t v66 = 3221225472;
        v67 = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_2;
        v68 = &unk_1E5F2A220;
        uint64_t v69 = *(void *)(a1 + 40);
        id v70 = v6;
        id v71 = v44;
        uint64_t v57 = MEMORY[0x1E4F143A8];
        uint64_t v58 = 3221225472;
        v59 = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_4;
        v60 = &unk_1E5F2A248;
        id v6 = v70;
        id v61 = v6;
        id v62 = *(id *)(a1 + 32);
        id v63 = v71;
        id v64 = *(id *)(a1 + 56);
        PXIterateAsynchronously();

        id v11 = v70;
        goto LABEL_17;
      }
      uint64_t v40 = *(void *)(a1 + 56);
      id v41 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) localizedDescription];
      (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v41);

      goto LABEL_19;
    case 1:
      uint64_t v43 = a1;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v12 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v13 = [v12 windows];

      id obj = v13;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v73 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v54;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v54 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void **)(*((void *)&v53 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector())
            {
              id v19 = [NSString stringWithFormat:@"Naming layer tree for %@", v18];
              [v44 addObject:v19];

              [v18 _recursivelyNameLayerTree];
            }
            id v20 = NSString;
            id v21 = *(void **)(v43 + 32);
            int64_t v22 = objc_msgSend(*(id *)(v43 + 40), "__currentTimestamp");
            long long v23 = [v20 stringWithFormat:@"PhotosLayerHierarchy_%p_%@.caar", v18, v22];
            uint64_t v24 = [v21 URLByAppendingPathComponent:v23];

            long long v25 = [v18 layer];
            id v26 = [v24 path];
            [v26 UTF8String];
            CAEncodeLayerTreeToFile();

            id v27 = NSString;
            id v28 = [v24 path];
            id v29 = [v27 stringWithFormat:@"Dumped layer tree to %@", v28];
            [v44 addObject:v29];

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [obj countByEnumeratingWithState:&v53 objects:v73 count:16];
        }
        while (v15);
      }

      uint64_t v30 = *(void *)(v43 + 56);
      id v6 = [v44 componentsJoinedByString:@"\n"];
      (*(void (**)(uint64_t, id))(v30 + 16))(v30, v6);
      goto LABEL_19;
    case 2:
      id v31 = (void *)MEMORY[0x1E4F90240];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_5;
      v50[3] = &unk_1E5F2A270;
      id v51 = *(id *)(a1 + 32);
      id v32 = v44;
      id v52 = v32;
      [v31 enumerateAllViewsUsingBlock:v50];
      uint64_t v33 = *(void *)(a1 + 56);
      v34 = [v32 componentsJoinedByString:@"\n"];
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v34);

      id v6 = v51;
      goto LABEL_19;
    case 3:
      id v35 = *(void **)(a1 + 40);
      id v36 = [*(id *)(a1 + 32) path];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_6;
      v48[3] = &unk_1E5F2B760;
      id v49 = *(id *)(a1 + 56);
      [v35 _captureCurrentAssetResourcesToDirectory:v36 withResultHandler:v48];

      id v6 = v49;
      goto LABEL_19;
    case 4:
      id v37 = objc_msgSend(*(id *)(a1 + 32), "px_URLByAppendingPathComponentFollowedByCurrentDateAndTime:", @"Memories");
      uint64_t v38 = (void *)MEMORY[0x1E4F907A0];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_7;
      v45[3] = &unk_1E5F2D848;
      id v39 = *(id *)(a1 + 56);
      id v46 = v37;
      id v47 = v39;
      id v6 = v37;
      [v38 dumpTapToRadarDiagnosticAttachmentsToURL:v6 completionHandler:v45];

      id v11 = v47;
LABEL_17:

LABEL_19:
      break;
    default:
      break;
  }
}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 index] + 1;
  BOOL v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_3;
  v8[3] = &unk_1E5F2A1F8;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v7 = v3;
  [v5 dumpState:v4 toDirectoryURL:v6 resultHandler:v8];
}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v2 = (void *)getDEUtilsClass_softClass;
  uint64_t v15 = getDEUtilsClass_softClass;
  if (!getDEUtilsClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getDEUtilsClass_block_invoke;
    v11[3] = &unk_1E5F2E228;
    v11[4] = &v12;
    __getDEUtilsClass_block_invoke((uint64_t)v11);
    id v2 = (void *)v13[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v12, 8);
  uint64_t v4 = (void *)[v3 copyItem:*(void *)(a1 + 32) toDestinationDir:*(void *)(a1 + 40) zipped:1];
  BOOL v5 = *(void **)(a1 + 48);
  uint64_t v6 = NSString;
  id v7 = [v4 path];
  uint64_t v8 = [v6 stringWithFormat:@"\nArchive of Photos UI state available at %@\n\nEnjoy.", v7];
  [v5 addObject:v8];

  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [*(id *)(a1 + 48) componentsJoinedByString:@"\n"];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  BOOL v5 = [v3 preferredFileNameForExportingDebugHierarchy];
  uint64_t v6 = [v4 URLByAppendingPathComponent:v5];

  id v15 = 0;
  int v7 = [v3 exportDebugHierarchyToURL:v6 error:&v15];
  id v8 = v15;
  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = NSString;
  if (v7)
  {
    id v11 = [v6 path];
    uint64_t v12 = [v10 stringWithFormat:@"Dumped Tungsten hierarchy to %@", v11];
    [v9 addObject:v12];
  }
  else
  {
    id v13 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v13);
    uint64_t v12 = [v8 localizedDescription];
    uint64_t v14 = [v10 stringWithFormat:@"Failed to export Tungsten hierarchy of <%@: %p>: %@", v11, v3, v12];
    [v9 addObject:v14];

    id v8 = (id)v14;
  }
}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = NSString;
  id v5 = [a2 componentsJoinedByString:@"\n"];
  uint64_t v4 = [v3 stringWithFormat:@"Captured current asset resources:\n%@", v5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

void __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_7(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = NSString;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) path];
    id v5 = [v4 stringWithFormat:@"Dumped Memory diagnostics to: %@\n", v6];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"Failed to dump Memory diagnostics: %@\n", a3];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

uint64_t __67__PUPhotosDiagnosticsAgent_dumpState_toDirectoryURL_resultHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 next];
}

- (void)captureDescriptionOfUIState:(int64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  int v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PUPhotosDiagnosticsAgent_captureDescriptionOfUIState_resultHandler___block_invoke;
    block[3] = &unk_1E5F2B448;
    int64_t v10 = a3;
    void block[4] = self;
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __70__PUPhotosDiagnosticsAgent_captureDescriptionOfUIState_resultHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = (void *)a1[4];
  if (v2) {
    objc_msgSend(v3, "_descriptionOfUIState:");
  }
  else {
  id v4 = [v3 _descriptionForAllUIState];
  }
  (*(void (**)(void))(a1[5] + 16))();
}

@end