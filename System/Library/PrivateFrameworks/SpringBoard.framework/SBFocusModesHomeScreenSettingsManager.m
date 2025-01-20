@interface SBFocusModesHomeScreenSettingsManager
- (SBFocusModesHomeScreenSettingsManager)init;
- (SBFocusModesHomeScreenSettingsServer)settingsServer;
- (void)_snapshotRemainingListViews:(id)a3 snapshotDelay:(double)a4 snapshotScale:(double)a5 excludeWallpaper:(BOOL)a6 forFocusModeIdentifier:(id)a7 iconManager:(id)a8 rootFolderView:(id)a9 accumulatedSnapshots:(id)a10 completion:(id)a11;
- (void)_snapshotRootFolderView:(id)a3 snapshotDelay:(double)a4 snapshotScale:(double)a5 excludeWallpaper:(BOOL)a6 focusModeIdentifier:(id)a7 iconManager:(id)a8 isSuggestedPage:(BOOL)a9 completion:(id)a10;
- (void)setSettingsServer:(id)a3;
- (void)settingsServer:(id)a3 addSuggestedHomeScreenPageWithRequest:(id)a4;
- (void)settingsServer:(id)a3 homeScreenSnapshotsForSuggestedPagesWithRequest:(id)a4 completion:(id)a5;
- (void)settingsServer:(id)a3 homeScreenSnapshotsWithRequest:(id)a4 completion:(id)a5;
- (void)settingsServer:(id)a3 updateFocusModeHomeScreenSettingsWithRequest:(id)a4;
@end

@implementation SBFocusModesHomeScreenSettingsManager

- (SBFocusModesHomeScreenSettingsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFocusModesHomeScreenSettingsManager;
  v2 = [(SBFocusModesHomeScreenSettingsManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBFocusModesHomeScreenSettingsServer);
    settingsServer = v2->_settingsServer;
    v2->_settingsServer = v3;

    [(SBFocusModesHomeScreenSettingsServer *)v2->_settingsServer setDelegate:v2];
    [(SBFocusModesHomeScreenSettingsServer *)v2->_settingsServer activate];
  }
  return v2;
}

- (void)settingsServer:(id)a3 homeScreenSnapshotsForSuggestedPagesWithRequest:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke;
  block[3] = &unk_1E6AF5FC8;
  id v12 = v7;
  v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __115__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke(uint64_t a1)
{
  v35 = [*(id *)(a1 + 32) focusModeIdentifier];
  v39 = +[SBIconController sharedInstance];
  v2 = [v39 iconManager];
  v3 = [v2 iconModel];
  v4 = [v2 rootFolder];
  [v3 saveIconStateIfNeeded];
  v37 = [v3 iconState];
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4FA6418]) initWithCurrentState:v37 desiredState:v37];
  objc_super v6 = [SBIconModel alloc];
  id v7 = [v3 applicationDataSource];
  v36 = (void *)v5;
  id v8 = [(SBHIconModel *)v6 initWithStore:v5 applicationDataSource:v7];

  v38 = v3;
  id v9 = [v3 delegate];
  [(SBHIconModel *)v8 setDelegate:v9];

  id v10 = objc_alloc(MEMORY[0x1E4FA6450]);
  v11 = [v4 uniqueIdentifier];
  id v12 = [v4 displayName];
  uint64_t v13 = [v4 maxListCount];
  unsigned int v14 = [v4 listGridSize];
  v15 = [v4 iconGridSizeClassSizes];
  v16 = (void *)[v10 initWithUniqueIdentifier:v11 displayName:v12 maxListCount:v13 listGridSize:v14 iconGridSizeClassSizes:v15];

  [v16 setModel:v8];
  v34 = v8;
  [(SBHIconModel *)v8 reloadIcons];
  id v17 = objc_alloc_init(MEMORY[0x1E4FA6460]);
  [v17 setFolder:v16];
  [v2 _configureRootFolderConfiguration:v17];
  v33 = (void *)[objc_alloc(MEMORY[0x1E4FA6458]) initWithConfiguration:v17];
  v18 = [v33 contentView];
  uint64_t v19 = objc_opt_class();
  id v20 = v18;
  if (v19)
  {
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }
  id v22 = v21;

  [v16 removeAllLists];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4FA6308]) initWithIconManager:v2 overridingRootFolder:v16];
  v24 = [*(id *)(a1 + 32) proactivePages];
  [v23 addSuggestedPages:v24 withFocusModeIdentifier:v35 forSnapshot:1 completion:0];
  v25 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) snapshotDelay];
  double v27 = v26;
  [*(id *)(a1 + 32) snapshotScale];
  double v29 = v28;
  uint64_t v30 = [*(id *)(a1 + 32) excludeWallpaper];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __115__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke_2;
  v40[3] = &unk_1E6AFEFB0;
  id v31 = *(id *)(a1 + 48);
  v41 = v34;
  id v42 = v31;
  v32 = v34;
  [v25 _snapshotRootFolderView:v22 snapshotDelay:v30 snapshotScale:v35 excludeWallpaper:v2 focusModeIdentifier:1 iconManager:v40 isSuggestedPage:v27 completion:v29];
}

uint64_t __115__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)settingsServer:(id)a3 homeScreenSnapshotsWithRequest:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsWithRequest_completion___block_invoke;
  block[3] = &unk_1E6AF5FC8;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __98__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsWithRequest_completion___block_invoke(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) focusModeIdentifier];
  v2 = +[SBIconController sharedInstance];
  v3 = [v2 iconManager];
  v4 = [v3 rootFolderController];
  uint64_t v5 = [v4 contentView];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) snapshotDelay];
  double v12 = v11;
  [*(id *)(a1 + 32) snapshotScale];
  objc_msgSend(v10, "_snapshotRootFolderView:snapshotDelay:snapshotScale:excludeWallpaper:focusModeIdentifier:iconManager:isSuggestedPage:completion:", v9, objc_msgSend(*(id *)(a1 + 32), "excludeWallpaper"), v14, v3, 0, *(void *)(a1 + 48), v12, v13);
}

- (void)settingsServer:(id)a3 updateFocusModeHomeScreenSettingsWithRequest:(id)a4
{
  id v4 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__SBFocusModesHomeScreenSettingsManager_settingsServer_updateFocusModeHomeScreenSettingsWithRequest___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __101__SBFocusModesHomeScreenSettingsManager_settingsServer_updateFocusModeHomeScreenSettingsWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v2 = SBLogFocusModes();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v65 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Update Focus Home Screen settings with request: %{public}@", buf, 0xCu);
  }

  v35 = +[SBIconController sharedInstance];
  v34 = [v35 iconManager];
  id v4 = [v34 rootFolder];
  v43 = [v4 lists];
  id v5 = objc_alloc(MEMORY[0x1E4FA6268]);
  uint64_t v6 = [*(id *)(a1 + 32) focusModeIdentifier];
  v33 = v4;
  id v7 = (void *)[v5 initWithIdentifier:v6 folder:v4];

  id v8 = [*(id *)(a1 + 32) listsToAdd];
  id v36 = [*(id *)(a1 + 32) listsToRemove];
  v32 = [v7 lists];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v8;
  uint64_t v41 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v57 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v11 = v43;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v53 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v52 + 1) + 8 * j);
              id v17 = [v16 uniqueIdentifier];
              int v18 = [v17 isEqualToString:v10];

              if (v18) {
                [v7 addToList:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v52 objects:v62 count:16];
          }
          while (v13);
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v41);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v37 = v36;
  uint64_t v42 = [v37 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v42)
  {
    uint64_t v40 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v49 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v20 = *(void *)(*((void *)&v48 + 1) + 8 * k);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v21 = v43;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v44 objects:v60 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v45;
          do
          {
            for (uint64_t m = 0; m != v23; ++m)
            {
              if (*(void *)v45 != v24) {
                objc_enumerationMutation(v21);
              }
              double v26 = *(void **)(*((void *)&v44 + 1) + 8 * m);
              double v27 = [v26 uniqueIdentifier];
              int v28 = [v27 isEqualToString:v20];

              if (v28) {
                [v7 removeFromList:v26];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v44 objects:v60 count:16];
          }
          while (v23);
        }
      }
      uint64_t v42 = [v37 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v42);
  }

  double v29 = [v7 lists];
  if (([v32 isEqualToArray:v29] & 1) == 0)
  {
    uint64_t v30 = [v34 focusModeManager];
    id v31 = [v7 identifier];
    [v30 addFocusModeRequiringIntroduction:v31];
  }
  [v35 updateRootFolderWithCurrentDoNotDisturbState];
}

- (void)settingsServer:(id)a3 addSuggestedHomeScreenPageWithRequest:(id)a4
{
  id v4 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = SBLogFocusModes();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Add suggested home screen page with request: %{public}@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) focusModeIdentifier];
  id v5 = +[SBIconController sharedInstance];
  uint64_t v6 = [v5 iconManager];
  id v7 = [v6 proactivePageSuggestionsManager];
  id v8 = [*(id *)(a1 + 32) proactivePages];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke_15;
  v15[3] = &unk_1E6AF4AC0;
  id v9 = v5;
  id v16 = v9;
  [v7 addSuggestedPages:v8 withFocusModeIdentifier:v4 forSnapshot:0 completion:v15];
  if ([*(id *)(a1 + 32) appendExistingPages])
  {
    uint64_t v10 = [v6 rootFolder];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FA6268]) initWithIdentifier:v4 folder:v10];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke_2;
    v13[3] = &unk_1E6AFEED8;
    id v14 = v11;
    id v12 = v11;
    [v10 enumerateListsWithOptions:4 usingBlock:v13];
  }
}

uint64_t __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRootFolderWithCurrentDoNotDisturbState];
}

void __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isHiddenByUser] & 1) == 0) {
    [*(id *)(a1 + 32) addToList:v3];
  }
}

- (void)_snapshotRootFolderView:(id)a3 snapshotDelay:(double)a4 snapshotScale:(double)a5 excludeWallpaper:(BOOL)a6 focusModeIdentifier:(id)a7 iconManager:(id)a8 isSuggestedPage:(BOOL)a9 completion:(id)a10
{
  BOOL v14 = a6;
  id v18 = a3;
  uint64_t v19 = (void *)MEMORY[0x1E4F29060];
  id v20 = a10;
  id v21 = a8;
  id v22 = a7;
  if (([v19 isMainThread] & 1) == 0)
  {
    int v28 = [MEMORY[0x1E4F28B00] currentHandler];
    double v29 = [NSString stringWithUTF8String:"-[SBFocusModesHomeScreenSettingsManager _snapshotRootFolderView:snapshotDelay:snapshotScale:excludeWallpaper:focusModeIdentifier:iconManager:isSuggestedPage:completion:]"];
    [v28 handleFailureInFunction:v29 file:@"SBFocusModesHomeScreenSettingsManager.m" lineNumber:197 description:@"this call must be made on the main thread"];
  }
  uint64_t v23 = [v18 folder];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __169__SBFocusModesHomeScreenSettingsManager__snapshotRootFolderView_snapshotDelay_snapshotScale_excludeWallpaper_focusModeIdentifier_iconManager_isSuggestedPage_completion___block_invoke;
  v30[3] = &unk_1E6AFEFF8;
  id v31 = v23;
  id v32 = v18;
  BOOL v34 = a9;
  id v33 = v24;
  id v25 = v24;
  id v26 = v18;
  id v27 = v23;
  [v27 enumerateListsWithOptions:4 usingBlock:v30];
  [(SBFocusModesHomeScreenSettingsManager *)self _snapshotRemainingListViews:v25 snapshotDelay:v14 snapshotScale:v22 excludeWallpaper:v21 forFocusModeIdentifier:v26 iconManager:0 rootFolderView:a4 accumulatedSnapshots:a5 completion:v20];
}

void __169__SBFocusModesHomeScreenSettingsManager__snapshotRootFolderView_snapshotDelay_snapshotScale_excludeWallpaper_focusModeIdentifier_iconManager_isSuggestedPage_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isTrailingEmptyList:"))
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) _createIconListViewForList:v7];
    [v6 showAllIcons];
    if (*(unsigned char *)(a1 + 56)) {
      [v6 enumerateIconViewsUsingBlock:&__block_literal_global_115];
    }
    [*(id *)(a1 + 48) addObject:v6];
  }
}

void __169__SBFocusModesHomeScreenSettingsManager__snapshotRootFolderView_snapshotDelay_snapshotScale_excludeWallpaper_focusModeIdentifier_iconManager_isSuggestedPage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 customIconImageViewController];

  SBSafeCast(v3, v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v6 widgetIcon];
  LODWORD(v2) = [v5 isWidgetStackIcon];

  if (v2) {
    [v6 setAlwaysShowsAsStack:1];
  }
}

- (void)_snapshotRemainingListViews:(id)a3 snapshotDelay:(double)a4 snapshotScale:(double)a5 excludeWallpaper:(BOOL)a6 forFocusModeIdentifier:(id)a7 iconManager:(id)a8 rootFolderView:(id)a9 accumulatedSnapshots:(id)a10 completion:(id)a11
{
  BOOL v15 = a6;
  id v19 = a3;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v48 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v49 = [NSString stringWithUTF8String:"-[SBFocusModesHomeScreenSettingsManager _snapshotRemainingListViews:snapshotDelay:snapshotScale:excludeWallpaper:forFocusModeIdentifier:iconManager:rootFolderView:accumulatedSnapshots:completion:]"];
    [v48 handleFailureInFunction:v49 file:@"SBFocusModesHomeScreenSettingsManager.m" lineNumber:228 description:@"this call must be made on the main thread"];
  }
  if ([v19 count])
  {
    long long v54 = self;
    long long v55 = v23;
    id v25 = [v19 firstObject];
    long long v56 = v22;
    id v26 = [v22 folder];
    id v27 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v28 = [v27 userInterfaceIdiom];

    long long v57 = v20;
    if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v29 = [v21 interfaceOrientation];
    }
    else {
      uint64_t v29 = 1;
    }
    SBScreenBoundsRotatedRoundCenter(v29);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    if (v15) {
      uint64_t v39 = 8259;
    }
    else {
      uint64_t v39 = 8195;
    }
    long long v53 = +[SBIconController sharedInstance];
    long long v52 = [v53 homeScreenViewController];
    uint64_t v40 = [v52 _sbWindowScene];
    long long v50 = -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:]([SBHomeScreenPreviewView alloc], "initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:", v21, 0, v39, 0, v25, v32, v34, v36, v38);
    long long v51 = (void *)v40;
    uint64_t v41 = [[SBViewSnapshotProvider alloc] initWithWindowScene:v40 view:v50 orientation:v29];
    [(SBViewSnapshotProvider *)v41 setIncludeWindowSceneWallpaper:!v15];
    if ([v25 containsWidget])
    {
      double v42 = 5.0;
      if (a4 <= 5.0) {
        double v42 = a4;
      }
      [(SBViewSnapshotProvider *)v41 setDelay:v42];
    }
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __196__SBFocusModesHomeScreenSettingsManager__snapshotRemainingListViews_snapshotDelay_snapshotScale_excludeWallpaper_forFocusModeIdentifier_iconManager_rootFolderView_accumulatedSnapshots_completion___block_invoke;
    v58[3] = &unk_1E6AFF020;
    double v68 = a5;
    id v59 = v25;
    id v60 = v57;
    id v61 = v26;
    id v23 = v55;
    id v62 = v55;
    id v63 = v19;
    v64 = v54;
    double v69 = a4;
    BOOL v70 = v15;
    id v65 = v21;
    v43 = v26;
    id v22 = v56;
    id v66 = v56;
    id v67 = v24;
    id v44 = v43;
    id v45 = v19;
    id v46 = v44;
    id v47 = v25;
    [(SBViewSnapshotProvider *)v41 snapshotWithImageBlock:v58];

    id v19 = v45;
    id v20 = v57;
  }
  else
  {
    uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4FA6A90]) initWithSnapshots:v23];
    (*((void (**)(id, void *, void))v24 + 2))(v24, v30, 0);
  }
}

void __196__SBFocusModesHomeScreenSettingsManager__snapshotRemainingListViews_snapshotDelay_snapshotScale_excludeWallpaper_forFocusModeIdentifier_iconManager_rootFolderView_accumulatedSnapshots_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 ioSurface];
  SBCreateScaledIOSurface(v3, 0, *(double *)(a1 + 104));
  buffer = (__IOSurface *)objc_claimAutoreleasedReturnValue();

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F4F770]) initWithPort:IOSurfaceCreateMachPort(buffer)];
  id v5 = [*(id *)(a1 + 32) model];
  id v6 = [v5 uniqueIdentifier];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA6AA0]) initWithListIdentifier:v6 focusModeIdentifier:*(void *)(a1 + 40) machPortSendRight:v4];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FA6268]) initWithIdentifier:*(void *)(a1 + 40) folder:*(void *)(a1 + 48)];
  objc_msgSend(v7, "setWantsListVisible:", objc_msgSend(v8, "wantsListVisible:", v5));
  id v9 = *(void **)(a1 + 56);
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  id v11 = v10;
  [v10 addObject:v7];
  id v12 = objc_msgSend(*(id *)(a1 + 64), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 64), "count") - 1);
  [*(id *)(a1 + 72) _snapshotRemainingListViews:v12 snapshotDelay:*(unsigned __int8 *)(a1 + 120) snapshotScale:*(void *)(a1 + 40) excludeWallpaper:*(void *)(a1 + 80) forFocusModeIdentifier:*(void *)(a1 + 88) iconManager:v11 rootFolderView:*(double *)(a1 + 112) accumulatedSnapshots:*(double *)(a1 + 104) completion:*(void *)(a1 + 96)];
}

- (SBFocusModesHomeScreenSettingsServer)settingsServer
{
  return self->_settingsServer;
}

- (void)setSettingsServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end