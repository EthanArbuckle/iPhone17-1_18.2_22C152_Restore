@interface FBScene
@end

@implementation FBScene

void __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F08C38];
  id v7 = a2;
  v4 = [v3 UUID];
  v5 = [v4 UUIDString];
  [v7 setIdentifier:v5];

  v6 = [MEMORY[0x263F1C430] specification];
  [v7 setSpecification:v6];

  [v7 setClientIdentity:*(void *)(a1 + 32)];
}

void __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke_3;
  v5[3] = &unk_265471AF0;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v3 updateSettingsWithBlock:v5];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "pui_setRole:", v3);
  objc_msgSend(v4, "pui_setProvider:", *(void *)(a1 + 40));
}

void __50__FBScene_PosterUIFoundation___emptySnapshotImage__block_invoke()
{
  v0 = [MEMORY[0x263F1C688] defaultFormat];
  [v0 setPreferredRange:0x7FFFLL];
  [v0 setOpaque:0];
  v1 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", 1.0, 1.0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__FBScene_PosterUIFoundation___emptySnapshotImage__block_invoke_2;
  v9[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  __asm { FMOV            V0.2D, #1.0 }
  long long v10 = _Q0;
  uint64_t v7 = [v1 imageWithActions:v9];
  v8 = (void *)_emptySnapshotImage_fallbackSnapshotImage;
  _emptySnapshotImage_fallbackSnapshotImage = v7;
}

void __50__FBScene_PosterUIFoundation___emptySnapshotImage__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F1C550];
  id v4 = a2;
  uint64_t v3 = [v2 clearColor];
  [v3 setFill];

  BSRectWithSize();
  objc_msgSend(v4, "fillRect:");
}

uint64_t __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke()
{
  pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion__fallbackQueue = BSDispatchQueueCreateSerial();
  return MEMORY[0x270F9A758]();
}

void __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_3;
  v45[3] = &unk_265470EC8;
  v45[4] = *(void *)(a1 + 32);
  if (_block_invoke_onceTokenFallbackImage != -1) {
    dispatch_once(&_block_invoke_onceTokenFallbackImage, v45);
  }
  v25 = objc_opt_new();
  v24 = objc_opt_new();
  v2 = [*(id *)(a1 + 40) displayConfiguration];
  uint64_t v3 = objc_msgSend(v2, "pui_displayConfigurationIdentifier");

  v21 = (void *)v3;
  v23 = -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:]([PUIPosterSnapshotBundleBuilder alloc], "initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:", v3, objc_msgSend(*(id *)(a1 + 40), "pui_userInterfaceStyle"), objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"), objc_msgSend(*(id *)(a1 + 40), "pui_deviceOrientation"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x25A2F5E70]();
        long long v10 = objc_msgSend(*(id *)(a1 + 32), "pui_snapshotContextConfiguredForLevelSet:", v8);
        v11 = [*(id *)(a1 + 32) createSnapshotWithContext:v10];
        v12 = *(NSObject **)(a1 + 56);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_4;
        block[3] = &unk_265471B60;
        uint64_t v13 = *(void *)(a1 + 32);
        id v33 = v11;
        uint64_t v34 = v13;
        v35 = v23;
        uint64_t v36 = v8;
        id v37 = v24;
        id v38 = *(id *)(a1 + 48);
        id v39 = v10;
        id v40 = v25;
        id v14 = v10;
        id v15 = v11;
        dispatch_async(v12, block);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v5);
  }

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_5;
  v26[3] = &unk_265471B88;
  id v27 = v25;
  id v28 = v24;
  v16 = *(NSObject **)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  char v31 = *(unsigned char *)(a1 + 72);
  v29 = v23;
  id v30 = v17;
  v18 = v23;
  id v19 = v24;
  id v20 = v25;
  dispatch_async(v16, v26);
}

id __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_3(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _emptySnapshotImage];
}

void __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) capture])
  {
    v2 = [*(id *)(a1 + 32) IOSurface];
    uint64_t v3 = NSNumber;
    uint64_t v4 = [*(id *)(a1 + 40) settings];
    uint64_t v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "interfaceOrientation"));
    [v2 setAttachment:v5 forKey:kPaperboardIOSurfaceInterfaceOrientationPropertiesKey];

    uint64_t v6 = NSNumber;
    uint64_t v7 = [*(id *)(a1 + 40) settings];
    uint64_t v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "pui_deviceOrientation"));
    [v2 setAttachment:v8 forKey:kPaperboardIOSurfaceDeviceOrientationPropertiesKey];

    v9 = NSNumber;
    long long v10 = [*(id *)(a1 + 32) context];
    [v10 scale];
    v11 = objc_msgSend(v9, "numberWithDouble:");
    [v2 setAttachment:v11 forKey:kPaperboardIOSurfaceDeviceScalePropertiesKey];
  }
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  id v26 = 0;
  int v15 = [v13 captureSnapshot:v12 forLevelSet:v14 error:&v26];
  id v16 = v26;
  if (v15)
  {
    [*(id *)(a1 + 64) addObject:*(void *)(a1 + 56)];
  }
  else if ([*(id *)(a1 + 72) count] == 1)
  {
    id v17 = *(void **)(a1 + 56);
    v18 = +[PUIPosterLevelSet floatingLevelSet];
    LODWORD(v17) = [v17 isEqualToLevelSet:v18];

    if (v17)
    {
      id v19 = [*(id *)(a1 + 40) layerManager];
      id v20 = [v19 layers];
      uint64_t v21 = [v20 count];
      v22 = [*(id *)(a1 + 80) layersToExclude];
      uint64_t v23 = [v22 count];

      if (v21 == v23)
      {
        v24 = *(void **)(a1 + 48);
        v25 = [*(id *)(a1 + 40) _emptySnapshotImage];
        [v24 setImage:v25 forLevelSet:*(void *)(a1 + 56)];

        [*(id *)(a1 + 64) addObject:*(void *)(a1 + 56)];
        goto LABEL_11;
      }
    }
  }
  if (!v16) {
    return;
  }
  [*(id *)(a1 + 88) setObject:v16 forKeyedSubscript:*(void *)(a1 + 56)];
LABEL_11:
}

void __107__FBScene_PosterUIFoundation__pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion___block_invoke_5(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    v2 = (void *)MEMORY[0x263EFF980];
    uint64_t v3 = [*(id *)(a1 + 32) allValues];
    uint64_t v4 = [v2 arrayWithArray:v3];

    uint64_t v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F083F0];
    uint64_t v6 = (void *)[v4 copy];
    v27[0] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v8 = objc_msgSend(v5, "pui_errorWithCode:userInfo:", 7, v7);

    if (v8) {
      goto LABEL_10;
    }
  }
  if ([*(id *)(a1 + 40) count]) {
    goto LABEL_13;
  }
  uint64_t v21 = (void *)MEMORY[0x263F087E8];
  uint64_t v24 = *MEMORY[0x263F08338];
  v25 = @"No image data was returned by any capture method.";
  v22 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  uint64_t v8 = objc_msgSend(v21, "pui_errorWithCode:userInfo:", 7, v22);

  if (v8)
  {
LABEL_10:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
LABEL_13:
    if (*(unsigned char *)(a1 + 64))
    {
      v9 = *(void **)(a1 + 48);
      long long v10 = +[PUIPosterLevelSet compositeLevelSet];
      v11 = [v9 capturedSnapshotForLevelSet:v10];

      if (v11)
      {
        uint64_t v12 = +[PUIColorBoxes colorBoxesForImage:v11];
        unint64_t v23 = 0xBFF0000000000000;
        CGFloat v13 = *MEMORY[0x263F00190];
        CGFloat v14 = *(double *)(MEMORY[0x263F00190] + 8);
        CGFloat v15 = *(double *)(MEMORY[0x263F00190] + 16);
        CGFloat v16 = *(double *)(MEMORY[0x263F00190] + 24);
        id v17 = PUIAverageColorFromColorBoxes(v12, *MEMORY[0x263F00190], v14, v15, v16, 0.0);
        double v18 = PUICalculateContrastFromColorBoxes(v12, 0, (double *)&v23, v13, v14, v15, v16);
        id v19 = [PUIColorStatistics alloc];
        id v20 = -[PUIColorStatistics initWithAverageColor:contrast:](v19, "initWithAverageColor:contrast:", v17, v18, v23);
        [*(id *)(a1 + 48) captureColorStatistics:v20 error:0];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __60__FBScene_PosterUIFoundation__pui_invalidateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) signal])
  {
    uint64_t v4 = [v3 error];

    uint64_t v5 = PUILogCommon();
    uint64_t v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __60__FBScene_PosterUIFoundation__pui_invalidateWithCompletion___block_invoke_cold_1(a1, v3, v6);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_impl(&dword_25A0AF000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] ack from pui_isInvalidated to %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "pui_setPosterPath:", 0);
    objc_msgSend(*(id *)(a1 + 56), "pui_setPosterComponent:", 0);
    [*(id *)(a1 + 56) invalidate];
    uint64_t v9 = *(void *)(a1 + 64);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
}

void __56__FBScene_PosterUIFoundation__pui_postSignificantEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = a2;
  objc_msgSend(v5, "pui_setSignificantEventsCounter:", objc_msgSend(v5, "pui_significantEventsCounter") + 1);

  objc_msgSend(v6, "pui_setSignificantEvent:", *(void *)(a1 + 32));
}

void __64__FBScene_PosterUIFoundation__pui_postUserTapEventWithLocation___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v4, "pui_setUserTapEventWithLocation:", v2, v3);
  objc_msgSend(v4, "pui_setUserTapEventsCounter:", objc_msgSend(v4, "pui_userTapEventsCounter") + 1);
}

void __60__FBScene_PosterUIFoundation__pui_invalidateWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [a2 error];
  int v7 = 138543874;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  __int16 v12 = v6;
  _os_log_error_impl(&dword_25A0AF000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] ack from pui_isInvalidated to %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
}

@end