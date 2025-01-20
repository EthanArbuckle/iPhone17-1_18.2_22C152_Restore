@interface FBScene(PosterUIFoundation)
+ (id)pui_createPosterSceneWithRole:()PosterUIFoundation processIdentity:extensionRecord:configureParameters:;
- (id)_emptySnapshotImage;
- (id)pui_buildSnapshotBundleForLevelSets:()PosterUIFoundation determineColorStatistics:error:;
- (id)pui_posterComponent;
- (id)pui_posterPath;
- (id)pui_shortDescription;
- (id)pui_snapshotContextConfiguredForLevelSet:()PosterUIFoundation;
- (uint64_t)pui_isLegacyProvider;
- (uint64_t)pui_sceneIsReadyToSnapshot:()PosterUIFoundation;
- (void)pui_executeSnapshotForLevelSets:()PosterUIFoundation determineColorStatistics:onQueue:completion:;
- (void)pui_invalidateWithCompletion:()PosterUIFoundation;
- (void)pui_postSignificantEvent:()PosterUIFoundation;
- (void)pui_postUserTapEventWithLocation:()PosterUIFoundation;
- (void)pui_setPosterComponent:()PosterUIFoundation;
- (void)pui_setPosterPath:()PosterUIFoundation;
- (void)pui_setShortDescription:()PosterUIFoundation;
@end

@implementation FBScene(PosterUIFoundation)

- (uint64_t)pui_sceneIsReadyToSnapshot:()PosterUIFoundation
{
  uint64_t v5 = [a1 contentState];
  v6 = [a1 layerManager];
  v7 = [v6 layers];
  unint64_t v8 = [v7 count];

  uint64_t result = 0;
  v10 = @"no content";
  if (v5 == 2 && v8 >= 2)
  {
    v11 = [a1 clientSettings];
    int v12 = objc_msgSend(v11, "pui_inExtendedRenderSession");

    v10 = @"is in extended render session";
    if (!v12) {
      v10 = 0;
    }
    uint64_t result = v12 ^ 1u;
  }
  if (a3)
  {
    if (v10) {
      *a3 = v10;
    }
  }
  return result;
}

- (id)pui_posterPath
{
  return objc_getAssociatedObject(a1, &__PUIPosterPathToken);
}

+ (id)pui_createPosterSceneWithRole:()PosterUIFoundation processIdentity:extensionRecord:configureParameters:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  int v12 = (void *)MEMORY[0x263F3F500];
  id v13 = a5;
  v14 = objc_msgSend(v12, "pui_posterWorkspace");
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke;
  v31[3] = &unk_265471AC8;
  id v15 = v10;
  id v32 = v15;
  v16 = [v14 createScene:v31];

  v17 = [v13 bundleIdentifier];
  v18 = [v13 infoDictionary];
  v19 = [v13 entitlements];

  if (objc_msgSend(v18, "pf_wantsLocation")) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 0;
  }
  v21 = [v19 objectForKey:@"com.apple.posterkit.enhanced-memory-limits" ofClass:objc_opt_class()];
  v22 = -[PUIPosterSceneComponent initWithScene:bundleIdentifier:processIdentity:options:]([PUIPosterSceneComponent alloc], "initWithScene:bundleIdentifier:processIdentity:options:", v16, v17, v15, v20 | [v21 BOOLValue]);
  objc_msgSend(v16, "pui_setPosterComponent:", v22);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v16, "pr_setupSceneExtensionsForSceneRole:", v9);
  }
  else {
    [v16 addExtension:objc_opt_class()];
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __113__FBScene_PosterUIFoundation__pui_createPosterSceneWithRole_processIdentity_extensionRecord_configureParameters___block_invoke_2;
  v27[3] = &unk_265471B18;
  id v28 = v9;
  id v29 = v17;
  id v30 = v11;
  id v23 = v11;
  id v24 = v17;
  id v25 = v9;
  [v16 configureParameters:v27];

  return v16;
}

- (id)pui_buildSnapshotBundleForLevelSets:()PosterUIFoundation determineColorStatistics:error:
{
  v81[2] = *MEMORY[0x263EF8340];
  id v60 = a3;
  BSDispatchQueueAssertMain();
  id v73 = 0;
  char v6 = objc_msgSend(a1, "pui_sceneIsReadyToSnapshot:", &v73);
  v7 = (__CFString *)v73;
  if (v6)
  {
    v59 = v7;
    id v8 = v60;
    if (![v8 count])
    {
      id v9 = +[PUIPosterLevelSet compositeLevelSet];
      v79 = v9;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];

      id v8 = (id)v10;
    }
    if (a4)
    {
      id v11 = +[PUIPosterLevelSet compositeLevelSet];
      char v12 = [v8 containsObject:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = +[PUIPosterLevelSet compositeLevelSet];
        uint64_t v14 = [v8 arrayByAddingObject:v13];

        id v8 = (id)v14;
      }
    }
    v64 = objc_opt_new();
    v62 = objc_opt_new();
    id v15 = [a1 settings];
    v16 = [v15 displayConfiguration];
    v57 = objc_msgSend(v16, "pui_displayConfigurationIdentifier");

    context = (void *)MEMORY[0x25A2F5E70]();
    v17 = [PUIPosterSnapshotBundleBuilder alloc];
    v18 = [a1 settings];
    uint64_t v19 = objc_msgSend(v18, "pui_userInterfaceStyle");
    uint64_t v20 = [a1 settings];
    uint64_t v21 = [v20 interfaceOrientation];
    v22 = [a1 settings];
    v65 = -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:](v17, "initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:", v57, v19, v21, objc_msgSend(v22, "pui_deviceOrientation"));

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v8;
    uint64_t v23 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v70 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          v27 = (void *)MEMORY[0x25A2F5E70]();
          id v28 = objc_msgSend(a1, "pui_snapshotContextConfiguredForLevelSet:", v26);
          id v29 = [a1 createSnapshotWithContext:v28];
          [v29 capture];
          id v68 = 0;
          BOOL v30 = [(PUIPosterSnapshotBundleBuilder *)v65 captureSnapshot:v29 forLevelSet:v26 error:&v68];
          id v31 = v68;
          if (v30)
          {
            id v32 = v62;
            objc_sync_enter(v32);
            [v32 addObject:v26];
            objc_sync_exit(v32);
          }
          if (v31)
          {
            id v33 = v64;
            objc_sync_enter(v33);
            [v33 setObject:v31 forKeyedSubscript:v26];
            objc_sync_exit(v33);
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v23);
    }

    if ([v64 count])
    {
      v34 = (void *)MEMORY[0x263EFF980];
      v35 = [v64 allValues];
      v36 = [v34 arrayWithArray:v35];

      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v76 = *MEMORY[0x263F083F0];
      v38 = (void *)[v36 copy];
      v77 = v38;
      v39 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      objc_msgSend(v37, "pui_errorWithCode:userInfo:", 7, v39);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ([v62 count])
      {
        if (a4)
        {
          v44 = +[PUIPosterLevelSet compositeLevelSet];
          v45 = [(PUIPosterSnapshotBundleBuilder *)v65 capturedSnapshotForLevelSet:v44];

          if (v45)
          {
            v46 = +[PUIColorBoxes colorBoxesForImage:v45];
            unint64_t v67 = 0xBFF0000000000000;
            CGFloat v47 = *MEMORY[0x263F00190];
            CGFloat v48 = *(double *)(MEMORY[0x263F00190] + 8);
            CGFloat v49 = *(double *)(MEMORY[0x263F00190] + 16);
            CGFloat v50 = *(double *)(MEMORY[0x263F00190] + 24);
            v51 = PUIAverageColorFromColorBoxes(v46, *MEMORY[0x263F00190], v48, v49, v50, 0.0);
            v52 = [[PUIColorStatistics alloc] initWithAverageColor:v51 contrast:PUICalculateContrastFromColorBoxes(v46, 0, (double *)&v67, v47, v48, v49, v50)];
            [(PUIPosterSnapshotBundleBuilder *)v65 captureColorStatistics:v52 error:0];
          }
        }
        id v66 = 0;
        v41 = [(PUIPosterSnapshotBundleBuilder *)v65 buildWithError:&v66];
        id v40 = v66;
        goto LABEL_32;
      }
      v54 = (void *)MEMORY[0x263F087E8];
      uint64_t v74 = *MEMORY[0x263F08338];
      v75 = @"No image data was returned by any capture method.";
      v55 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      objc_msgSend(v54, "pui_errorWithCode:userInfo:", 7, v55);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
    }
    v41 = 0;
LABEL_32:

    if (a5 && v40) {
      *a5 = v40;
    }

    goto LABEL_36;
  }
  if (!a5)
  {
    v41 = 0;
    goto LABEL_37;
  }
  v42 = (void *)MEMORY[0x263F087E8];
  v80[0] = *MEMORY[0x263F08338];
  v80[1] = @"reason";
  v43 = @"(unknown)";
  v59 = v7;
  if (v7) {
    v43 = v7;
  }
  v81[0] = @"Scene is not ready to snapshot.";
  v81[1] = v43;
  id obj = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
  objc_msgSend(v42, "pui_errorWithCode:userInfo:", 7, obj);
  v41 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

  v7 = v59;
LABEL_37:

  return v41;
}

- (id)_emptySnapshotImage
{
  if (_emptySnapshotImage_onceToken != -1) {
    dispatch_once(&_emptySnapshotImage_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)_emptySnapshotImage_fallbackSnapshotImage;
  return v0;
}

- (void)pui_executeSnapshotForLevelSets:()PosterUIFoundation determineColorStatistics:onQueue:completion:
{
  v37[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v34 = 0;
    char v13 = objc_msgSend(a1, "pui_sceneIsReadyToSnapshot:", &v34);
    uint64_t v14 = (__CFString *)v34;
    id v15 = v14;
    if (v13)
    {
      id v16 = v10;
      if (![v16 count])
      {
        v17 = +[PUIPosterLevelSet compositeLevelSet];
        v35 = v17;
        uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];

        id v16 = (id)v18;
      }
      if (a4)
      {
        uint64_t v19 = +[PUIPosterLevelSet compositeLevelSet];
        char v20 = [v16 containsObject:v19];

        if ((v20 & 1) == 0)
        {
          uint64_t v21 = +[PUIPosterLevelSet compositeLevelSet];
          uint64_t v22 = [v16 arrayByAddingObject:v21];

          id v16 = (id)v22;
        }
      }
      uint64_t v23 = [a1 settings];
      if (pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion__onceToken != -1) {
        dispatch_once(&pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion__onceToken, &__block_literal_global_37);
      }
      uint64_t v24 = (void *)pui_executeSnapshotForLevelSets_determineColorStatistics_onQueue_completion__fallbackQueue;
      if (v11) {
        uint64_t v24 = v11;
      }
      id v25 = v24;
      id v32 = v16;
      id v33 = v12;
      id v26 = v25;
      id v27 = v16;
      id v28 = v23;
      BSDispatchMain();
    }
    else
    {
      id v29 = (void *)MEMORY[0x263F087E8];
      v36[0] = *MEMORY[0x263F08338];
      v36[1] = @"reason";
      BOOL v30 = @"(unknown)";
      if (v14) {
        BOOL v30 = v14;
      }
      v37[0] = @"Scene is not ready to snapshot.";
      v37[1] = v30;
      id v31 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
      objc_msgSend(v29, "pui_errorWithCode:userInfo:", 7, v31);
      id v28 = (id)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, void, void, id))v12 + 2))(v12, 0, 0, v28);
    }
  }
}

- (id)pui_snapshotContextConfiguredForLevelSet:()PosterUIFoundation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    BSDispatchQueueAssertMain();
    uint64_t v5 = [a1 snapshotContext];
    if (([v4 isCompositeLevelSet] & 1) == 0)
    {
      [v5 setOpaque:0];
      char v6 = objc_opt_new();
      v7 = [a1 layerManager];
      id v8 = [v7 layers];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            objc_msgSend(v14, "level", (void)v17);
            if (([v4 containsLevel:(uint64_t)v15] & 1) == 0) {
              [v6 addObject:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v11);
      }

      [v5 setLayersToExclude:v6];
    }
  }
  else
  {
    uint64_t v5 = [a1 snapshotContext];
  }

  return v5;
}

- (void)pui_invalidateWithCompletion:()PosterUIFoundation
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if ([a1 isValid] && objc_msgSend(a1, "isActive"))
  {
    uint64_t v5 = [a1 settings];
    char v6 = objc_msgSend(v5, "pui_isInvalidated");

    if ((v6 & 1) == 0)
    {
      v7 = objc_opt_new();
      id v8 = objc_msgSend(a1, "pui_shortDescription");
      id v9 = [a1 settings];
      uint64_t v10 = objc_msgSend(v9, "pui_provider");

      uint64_t v11 = PUILogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = v8;
        __int16 v27 = 2114;
        id v28 = v10;
        _os_log_impl(&dword_25A0AF000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending pui_isInvalidated to %{public}@", buf, 0x16u);
      }

      uint64_t v12 = [PUISceneInvalidationAction alloc];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __60__FBScene_PosterUIFoundation__pui_invalidateWithCompletion___block_invoke;
      v19[3] = &unk_265471BD8;
      id v20 = v7;
      id v21 = v8;
      id v22 = v10;
      uint64_t v23 = a1;
      uint64_t v24 = v4;
      id v13 = v10;
      id v14 = v8;
      id v15 = v7;
      id v16 = [(PUISceneInvalidationAction *)v12 initWithInfo:0 timeout:MEMORY[0x263EF83A0] forResponseOnQueue:v19 withHandler:5.0];
      long long v17 = [a1 settings];
      long long v18 = (void *)[v17 mutableCopy];

      [v18 setForeground:0];
      objc_msgSend(v18, "pui_setInvalidated:", v16);
      [a1 updateSettings:v18 withTransitionContext:0];
    }
  }
  else
  {
    objc_msgSend(a1, "pui_setPosterPath:", 0);
    objc_msgSend(a1, "pui_setPosterComponent:", 0);
    [a1 invalidate];
    if (v4) {
      v4[2](v4);
    }
  }
}

- (uint64_t)pui_isLegacyProvider
{
  v1 = [a1 settings];
  v2 = objc_msgSend(v1, "pui_provider");
  uint64_t v3 = [v2 isEqualToString:@"com.apple.PaperBoard.LegacyPoster"];

  return v3;
}

- (void)pui_setPosterPath:()PosterUIFoundation
{
}

- (id)pui_posterComponent
{
  return objc_getAssociatedObject(a1, &__PUIPosterComponentToken);
}

- (void)pui_setPosterComponent:()PosterUIFoundation
{
  id v4 = a3;
  objc_msgSend(a1, "pui_posterComponent");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 invalidate];
  objc_setAssociatedObject(a1, &__PUIPosterComponentToken, v4, (void *)1);
}

- (id)pui_shortDescription
{
  return objc_getAssociatedObject(a1, &__PUIPosterDescriptionToken);
}

- (void)pui_setShortDescription:()PosterUIFoundation
{
}

- (void)pui_postSignificantEvent:()PosterUIFoundation
{
  id v5 = [a1 clientSettings];
  BOOL v6 = PUIPosterSignificantEventOptionsContainsEvent(objc_msgSend(v5, "pui_significantEventOptions"), a3);

  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__FBScene_PosterUIFoundation__pui_postSignificantEvent___block_invoke;
    v7[3] = &__block_descriptor_40_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
    v7[4] = a3;
    [a1 performUpdate:v7];
  }
}

- (void)pui_postUserTapEventWithLocation:()PosterUIFoundation
{
  BOOL v6 = [a1 clientSettings];
  int v7 = objc_msgSend(v6, "pui_userTapEventsRequested");

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__FBScene_PosterUIFoundation__pui_postUserTapEventWithLocation___block_invoke;
    v8[3] = &__block_descriptor_48_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
    *(double *)&v8[4] = a2;
    *(double *)&v8[5] = a3;
    [a1 performUpdate:v8];
  }
}

@end