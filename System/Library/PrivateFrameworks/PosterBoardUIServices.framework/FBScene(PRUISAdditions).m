@interface FBScene(PRUISAdditions)
- (id)_layersToExcludeForOptions:()PRUISAdditions;
- (id)pruis_createSnapshotWithContext:()PRUISAdditions;
- (id)pruis_snapshotContextConfiguredWithOptions:()PRUISAdditions;
- (uint64_t)_renderingContentForOptions:()PRUISAdditions;
- (uint64_t)pruis_restoreSceneAfterSnapshottingWithCompletion:()PRUISAdditions;
- (uint64_t)pruis_setupSceneForSnapshottingWithOptions:()PRUISAdditions traitCollection:completion:;
- (uint64_t)pruis_updateWithoutActivating:()PRUISAdditions;
- (void)pruis_restoreSceneAfterSnapshottingWithUpdater:()PRUISAdditions completion:;
- (void)pruis_setupSceneForSnapshottingWithOptions:()PRUISAdditions traitCollection:updater:completion:;
- (void)pruis_snapshotSceneWithOptions:()PRUISAdditions traitCollection:completion:;
- (void)pruis_updateWithoutActivating:()PRUISAdditions withCompletion:;
@end

@implementation FBScene(PRUISAdditions)

- (uint64_t)pruis_updateWithoutActivating:()PRUISAdditions
{
  return objc_msgSend(a1, "pruis_updateWithoutActivating:withCompletion:", a3, 0);
}

- (void)pruis_updateWithoutActivating:()PRUISAdditions withCompletion:
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = v8;
    if ([a1 isActive])
    {
      [a1 performUpdate:v7 withCompletion:v9];
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __72__FBScene_PRUISAdditions__pruis_updateWithoutActivating_withCompletion___block_invoke;
      v13[3] = &unk_26546B340;
      id v14 = v7;
      [a1 updateSettingsWithBlock:v13];
      if (v9)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __72__FBScene_PRUISAdditions__pruis_updateWithoutActivating_withCompletion___block_invoke_2;
        block[3] = &unk_26546B368;
        id v12 = v9;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"updater != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[FBScene(PRUISAdditions) pruis_updateWithoutActivating:withCompletion:](a2, (uint64_t)a1, (uint64_t)v10);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (uint64_t)pruis_setupSceneForSnapshottingWithOptions:()PRUISAdditions traitCollection:completion:
{
  return objc_msgSend(a1, "pruis_setupSceneForSnapshottingWithOptions:traitCollection:updater:completion:", a3, a4, 0, a5);
}

- (void)pruis_setupSceneForSnapshottingWithOptions:()PRUISAdditions traitCollection:updater:completion:
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  char IsFloatingLayerOnly = PRSPosterSnapshotOptionsIsFloatingLayerOnly();
  uint64_t v14 = [a1 _renderingContentForOptions:a3];
  if ((a3 & 0x40) != 0) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.0;
  }
  uint64_t v16 = [v10 userInterfaceStyle];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __105__FBScene_PRUISAdditions__pruis_setupSceneForSnapshottingWithOptions_traitCollection_updater_completion___block_invoke;
  v19[3] = &unk_26546BC18;
  char v25 = IsFloatingLayerOnly;
  id v21 = v11;
  uint64_t v22 = v14;
  double v23 = v15;
  uint64_t v24 = v16;
  BOOL v26 = (a3 & 2) != 0;
  BOOL v27 = (a3 & 4) != 0;
  id v20 = v10;
  id v17 = v11;
  id v18 = v10;
  [a1 performUpdate:v19 withCompletion:v12];
}

- (uint64_t)pruis_restoreSceneAfterSnapshottingWithCompletion:()PRUISAdditions
{
  return objc_msgSend(a1, "pruis_restoreSceneAfterSnapshottingWithUpdater:completion:", 0, a3);
}

- (void)pruis_restoreSceneAfterSnapshottingWithUpdater:()PRUISAdditions completion:
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__FBScene_PRUISAdditions__pruis_restoreSceneAfterSnapshottingWithUpdater_completion___block_invoke;
  v8[3] = &unk_26546BC40;
  id v9 = v6;
  id v7 = v6;
  [a1 performUpdate:v8 withCompletion:a4];
}

- (void)pruis_snapshotSceneWithOptions:()PRUISAdditions traitCollection:completion:
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__FBScene_PRUISAdditions__pruis_snapshotSceneWithOptions_traitCollection_completion___block_invoke;
  v10[3] = &unk_26546BC68;
  v10[4] = a1;
  id v11 = v8;
  uint64_t v12 = a3;
  id v9 = v8;
  objc_msgSend(a1, "pruis_setupSceneForSnapshottingWithOptions:traitCollection:completion:", a3, a4, v10);
}

- (id)pruis_createSnapshotWithContext:()PRUISAdditions
{
  v2 = objc_msgSend(a1, "createSnapshotWithContext:");
  if ([v2 capture])
  {
    v3 = [v2 IOSurface];
    v4 = NSNumber;
    v5 = [a1 settings];
    id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "interfaceOrientation"));
    [v3 setAttachment:v6 forKey:*MEMORY[0x263F5F5F8]];

    id v7 = NSNumber;
    id v8 = [a1 settings];
    id v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "pui_deviceOrientation"));
    [v3 setAttachment:v9 forKey:*MEMORY[0x263F5F5E8]];

    id v10 = NSNumber;
    id v11 = [v2 context];
    [v11 scale];
    uint64_t v12 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setAttachment:v12 forKey:*MEMORY[0x263F5F5F0]];
  }

  return v2;
}

- (id)pruis_snapshotContextConfiguredWithOptions:()PRUISAdditions
{
  v5 = [a1 snapshotContext];
  [v5 setOpaque:PRSPosterSnapshotOptionsAllowTransparency() ^ 1];
  id v6 = [a1 _layersToExcludeForOptions:a3];
  [v5 setLayersToExclude:v6];

  return v5;
}

- (uint64_t)_renderingContentForOptions:()PRUISAdditions
{
  return (a3 >> 7) & 1;
}

- (id)_layersToExcludeForOptions:()PRUISAdditions
{
  v4 = [a1 layerManager];
  v5 = [v4 layers];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__FBScene_PRUISAdditions___layersToExcludeForOptions___block_invoke;
  v9[3] = &__block_descriptor_40_e22_B16__0__FBSceneLayer_8l;
  v9[4] = a3;
  id v6 = objc_msgSend(v5, "bs_filter:", v9);
  id v7 = [v6 set];

  return v7;
}

- (void)pruis_updateWithoutActivating:()PRUISAdditions withCompletion:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  double v15 = @"PRUISSceneTypes.m";
  __int16 v16 = 1024;
  int v17 = 19;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_25A03F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end