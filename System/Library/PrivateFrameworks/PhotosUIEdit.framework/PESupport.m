@interface PESupport
+ (BOOL)assetCanRenderStyles:(id)a3;
+ (BOOL)assetHasUnsupportedOriginalAdjustments:(id)a3;
+ (BOOL)canPerformEditOnAsset:(id)a3;
+ (BOOL)photoLibraryIsEligibleForStylesSetupTip:(id)a3;
+ (BOOL)photoWasTakenWithoutFlashWithImageProperties:(id)a3;
+ (BOOL)sharedPhotoLibraryIsEligibleForStylesSetupTip;
+ (id)originalAdjustmentVersionForAsset:(id)a3;
+ (id)pe_bundle;
+ (id)repairedAsShotCompositionController:(id)a3 forCurrentCompositionController:(id)a4 isLivePhoto:(BOOL)a5 metadata:(id)a6;
+ (void)assetAudioMixMode:(id)a3 queue:(id)a4 handler:(id)a5;
+ (void)assetHasDepthEnabled:(id)a3 queue:(id)a4 handler:(id)a5;
+ (void)assetPlaybackRate:(id)a3 queue:(id)a4 handler:(id)a5;
+ (void)revertEditsForAsset:(id)a3 mediaDestination:(id)a4 currentCompositionController:(id)a5 completionHandler:(id)a6;
+ (void)syncMainThread:(id)a3;
@end

@implementation PESupport

+ (BOOL)photoLibraryIsEligibleForStylesSetupTip:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  v4 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"subtype = %d OR subtype = %d", 1201, 1202);
  [v3 setPredicate:v4];

  [v3 setFetchLimit:4];
  v5 = [MEMORY[0x263F14F50] fetchSuggestionsWithOptions:v3];
  BOOL v6 = (unint64_t)[v5 count] > 3;

  return v6;
}

+ (BOOL)sharedPhotoLibraryIsEligibleForStylesSetupTip
{
  v2 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
  BOOL v3 = +[PESupport photoLibraryIsEligibleForStylesSetupTip:v2];

  return v3;
}

+ (id)pe_bundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

+ (BOOL)assetCanRenderStyles:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 fetchSmartStyleExtendedProperties];
    char v5 = [v4 originallySmartStyleable];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)canPerformEditOnAsset:(id)a3
{
  id v3 = a3;
  if ([v3 isPhotoIrisPlaceholder]) {
    BOOL v4 = [v3 deferredProcessingNeeded] != 2;
  }
  else {
    BOOL v4 = 0;
  }
  int v5 = [v3 isAnimatedImage];
  int v6 = [v3 isVideo];
  if (v6) {
    LOBYTE(v6) = [v3 canPlayLoopingVideo];
  }
  LOBYTE(v7) = 0;
  if (((v4 | v5) & 1) == 0 && (v6 & 1) == 0) {
    int v7 = [v3 isTrashed] ^ 1;
  }

  return v7;
}

+ (BOOL)assetHasUnsupportedOriginalAdjustments:(id)a3
{
  id v3 = +[PESupport originalAdjustmentVersionForAsset:a3];
  if (v3)
  {
    BOOL v4 = [MEMORY[0x263F5D590] locallySupportedFormatVersions];
    uint64_t v5 = [v4 indexOfObject:v3];

    BOOL v6 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)originalAdjustmentVersionForAsset:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [MEMORY[0x263F14D70] assetResourcesForAsset:v3];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v8 type] == 16)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2394;
  v24 = __Block_byref_object_dispose__2395;
  id v25 = 0;
  if (v5)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F14D88]);
    [v9 setNetworkAccessAllowed:1];
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = [MEMORY[0x263F14D80] defaultManager];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __47__PESupport_originalAdjustmentVersionForAsset___block_invoke;
    v19[3] = &unk_2642BF450;
    v19[4] = &v20;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__PESupport_originalAdjustmentVersionForAsset___block_invoke_2;
    v17[3] = &unk_2642BF478;
    v12 = v10;
    v18 = v12;
    [v11 requestDataForAssetResource:v5 options:v9 dataReceivedHandler:v19 completionHandler:v17];

    dispatch_time_t v13 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v12, v13);

    v14 = (void *)v21[5];
  }
  else
  {
    v14 = 0;
  }
  id v15 = v14;
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __47__PESupport_originalAdjustmentVersionForAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  id v9 = 0;
  id v3 = [MEMORY[0x263F08AC0] propertyListWithData:a2 options:0 format:0 error:&v9];
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x263F5DB98];
    id v5 = v9;
    uint64_t v6 = [v3 objectForKeyedSubscript:v4];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __47__PESupport_originalAdjustmentVersionForAsset___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_217B65000, v4, OS_LOG_TYPE_ERROR, "PESupport: Unable to retrieve original adjustment data: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)assetAudioMixMode:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__PESupport_assetAudioMixMode_queue_handler___block_invoke;
  v9[3] = &unk_2642BF428;
  id v10 = v7;
  id v8 = v7;
  +[PEAdjustmentDataCache requestCompositionControllerForAsset:a3 networkAccessAllowed:0 queue:a4 completion:v9];
}

void __45__PESupport_assetAudioMixMode_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 cinematicAudioAdjustmentController];
  uint64_t v4 = [v3 renderingStyle];
  int v5 = (void *)v4;
  id v6 = (void *)*MEMORY[0x263F5D6C8];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)assetPlaybackRate:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__PESupport_assetPlaybackRate_queue_handler___block_invoke;
  v9[3] = &unk_2642BF428;
  id v10 = v7;
  id v8 = v7;
  +[PEAdjustmentDataCache requestCompositionControllerForAsset:a3 networkAccessAllowed:0 queue:a4 completion:v9];
}

void __45__PESupport_assetPlaybackRate_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 slomoAdjustmentController];
  if (v3)
  {
    uint64_t v4 = [v7 slomoAdjustmentController];
    [v4 rate];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6);
}

+ (void)assetHasDepthEnabled:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__PESupport_assetHasDepthEnabled_queue_handler___block_invoke;
  v9[3] = &unk_2642BF428;
  id v10 = v7;
  id v8 = v7;
  +[PEAdjustmentDataCache requestCompositionControllerForAsset:a3 networkAccessAllowed:0 queue:a4 completion:v9];
}

void __48__PESupport_assetHasDepthEnabled_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 depthAdjustmentController];
  uint64_t v4 = [v6 enabled];
  double v5 = [v3 depthAdjustmentController];

  (*(void (**)(uint64_t, uint64_t, BOOL))(v2 + 16))(v2, v4, v5 != 0);
}

+ (id)repairedAsShotCompositionController:(id)a3 forCurrentCompositionController:(id)a4 isLivePhoto:(BOOL)a5 metadata:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  v12 = (void *)[v11 copy];
  dispatch_time_t v13 = [v11 depthAdjustmentController];

  int v14 = [v13 enabled];
  id v15 = [v12 depthAdjustmentController];
  if (v15)
  {
  }
  else
  {
    v16 = [v9 depthAdjustmentController];

    if (v16)
    {
      if (v10) {
        unint64_t v17 = ((unint64_t)[v10 photoProcessingFlags] >> 24) & 1;
      }
      else {
        LOBYTE(v17) = 0;
      }
      uint64_t v18 = *MEMORY[0x263F5D6F8];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke;
      v26[3] = &unk_2642BF3B8;
      id v27 = v9;
      char v28 = v17;
      [v12 modifyAdjustmentWithKey:v18 modificationBlock:v26];
    }
  }
  v19 = [v12 portraitVideoAdjustmentController];
  if (v19) {
    goto LABEL_11;
  }
  uint64_t v20 = [v9 portraitVideoAdjustmentController];

  if (v20)
  {
    uint64_t v21 = *MEMORY[0x263F5D788];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke_2;
    v24[3] = &unk_2642BF3E0;
    id v25 = v9;
    [v12 modifyAdjustmentWithKey:v21 modificationBlock:v24];
    v19 = v25;
LABEL_11:
  }
  if (((!v7 | v14) & 1) == 0)
  {
    uint64_t v22 = [v12 depthAdjustmentController];

    if (v22) {
      [v12 modifyAdjustmentWithKey:*MEMORY[0x263F5D6F8] modificationBlock:&__block_literal_global_2401];
    }
  }

  return v12;
}

void __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [*(id *)(a1 + 32) composition];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F5D6F8]];
  [v9 setFromAdjustment:v4];

  double v5 = [v9 capturedAperture];

  if (v5)
  {
    id v6 = [v9 capturedAperture];
    [v6 floatValue];
    [v9 setAperture:v7];
  }
  id v8 = [v9 capturedFocusRect];
  [v9 setFocusRect:v8];

  [v9 setEnabled:*(unsigned char *)(a1 + 40) == 0];
}

void __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = a2;
  id v3 = [v2 composition];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F5D788]];
  [v5 setFromAdjustment:v4];

  [v5 setEnabled:1];
  [v5 setAperture:0];
  [v5 setDisparityKeyframes:0];
  [v5 setCinematographyState:0];
  [v5 setDebugMode:0];
}

void __102__PESupport_repairedAsShotCompositionController_forCurrentCompositionController_isLivePhoto_metadata___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v2 = [v6 capturedAperture];

  if (v2)
  {
    id v3 = [v6 capturedAperture];
    [v3 floatValue];
    [v6 setAperture:v4];
  }
  id v5 = [v6 capturedFocusRect];
  [v6 setFocusRect:v5];

  [v6 setEnabled:0];
}

+ (void)revertEditsForAsset:(id)a3 mediaDestination:(id)a4 currentCompositionController:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x263F14DD0]);
  [v13 setResultHandlerQueue:MEMORY[0x263EF83A0]];
  [v13 setNetworkAccessAllowed:1];
  objc_msgSend(v13, "setOriginalChoice:", objc_msgSend(v9, "originalResourceChoice"));
  [v13 setForceRunAsUnadjustedAsset:1];
  [v13 setForceReturnFullLivePhoto:1];
  [v13 setSkipDisplaySizeImage:1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __97__PESupport_revertEditsForAsset_mediaDestination_currentCompositionController_completionHandler___block_invoke;
  v18[3] = &unk_2642BF390;
  id v19 = v11;
  id v20 = v10;
  id v21 = v9;
  id v22 = v12;
  id v14 = v9;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  [v14 requestContentEditingInputWithOptions:v13 completionHandler:v18];
}

void __97__PESupport_revertEditsForAsset_mediaDestination_currentCompositionController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    id v27 = 0;
    id v6 = +[PESerializationUtility editSourceForContentEditingInput:v5 useEmbeddedPreview:0 error:&v27];
    id v7 = v27;
    if (v6)
    {
      id v26 = 0;
      id v8 = +[PESerializationUtility compositionControllerForContentEditingInput:v5 asShot:1 source:v6 error:&v26];
      id v9 = v26;
      if (v8)
      {
        id v10 = objc_alloc(MEMORY[0x263F5DF20]);
        id v11 = [v5 fullSizeImageURL];
        id v12 = (void *)[v10 initWithMediaURL:v11 timeZoneLookup:0];

        uint64_t v13 = *(void *)(a1 + 32);
        id v14 = [v5 livePhoto];
        id v15 = +[PESupport repairedAsShotCompositionController:v8 forCurrentCompositionController:v13 isLivePhoto:v14 != 0 metadata:v12];
      }
      else
      {
        id v15 = 0;
      }
      id v17 = *(void **)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __97__PESupport_revertEditsForAsset_mediaDestination_currentCompositionController_completionHandler___block_invoke_2;
      v20[3] = &unk_2642BF368;
      id v21 = v15;
      id v25 = *(id *)(a1 + 56);
      id v22 = v5;
      id v23 = *(id *)(a1 + 48);
      id v24 = *(id *)(a1 + 40);
      id v19 = v15;
      [v17 revertEditsForAsset:v18 completionHandler:v20];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v16 = [a3 objectForKeyedSubscript:*MEMORY[0x263F15068]];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __97__PESupport_revertEditsForAsset_mediaDestination_currentCompositionController_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([MEMORY[0x263F5D8D0] isIdentityCompositionController:*(void *)(a1 + 32)])
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v6 = +[PESerializationUtility contentEditingOutputForContentEditingInput:*(void *)(a1 + 40) compositionController:*(void *)(a1 + 32) asset:*(void *)(a1 + 48) async:0 onlyChangingOriginalChoice:0];
    [*(id *)(a1 + 56) saveInternalEditsForAsset:v7 usingCompositionController:*(void *)(a1 + 32) contentEditingOutput:v6 version:1 livePhotoState:0 completionHandler:*(void *)(a1 + 64)];
  }
}

+ (void)syncMainThread:(id)a3
{
  id v3 = (void (**)(void))a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    float v4 = (void *)MEMORY[0x21D4583F0]();
    v3[2](v3);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__PESupport_syncMainThread___block_invoke;
    block[3] = &unk_2642BF340;
    id v6 = v3;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

void __28__PESupport_syncMainThread___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x21D4583F0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)photoWasTakenWithoutFlashWithImageProperties:(id)a3
{
  id v3 = [a3 metadata];
  float v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F0F248]];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0F280]];
  BOOL v7 = ([v5 integerValue] & 1) == 0 && v5 != 0;

  return v7;
}

@end