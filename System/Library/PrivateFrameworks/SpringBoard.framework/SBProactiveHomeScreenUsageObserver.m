@interface SBProactiveHomeScreenUsageObserver
- (ATXHomeScreenPrediction)currentPrediction;
- (SBIconController)iconController;
- (SBProactiveHomeScreenUsageObserver)initWithIconController:(id)a3;
- (SBProactiveHomeScreenUsageObserverDelegate)delegate;
- (id)iconModel;
- (id)proactiveStackForWidgetIcon:(id)a3 atIndex:(unint64_t)a4 gridCellInfo:(id)a5;
- (id)proactiveWidgetForIconDataSource:(id)a3 ofIcon:(id)a4;
- (id)proactiveWidgetForWidget:(id)a3 ofIcon:(id)a4;
- (id)rootFolder;
- (id)widgetIdentifiablesDictionaryForIconListModel:(id)a3;
- (void)deviceLockStateDidChange:(id)a3;
- (void)homeScreenUsageAggregator:(id)a3 didNoteCurrentPageIndexChanged:(unint64_t)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidAppear:(id)a4 forWidgetIcon:(id)a5;
- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidDisappear:(id)a4 forWidgetIcon:(id)a5;
- (void)homeScreenUsageAggregator:(id)a3 didNoteRootControllerWillAppearWithPageIndex:(unint64_t)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteTodayViewAtLocation:(int64_t)a4 scrolledWithIconVisibility:(id)a5;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserAddedWidgetIconStackSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedWidgetIconStackSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5;
- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 widgetDiscoverabilityDidAcceptSuggestion:(id)a4;
- (void)homeScreenUsageAggregator:(id)a3 widgetDiscoverabilityDidRejectSuggestion:(id)a4;
- (void)homeScreenUsageAggregatorDidStartDiscoveringWidgets:(id)a3;
- (void)homeScreenUsageAggregatorWidgetDiscoverabilityDidEnterEditingMode:(id)a3;
- (void)logHomeScreenPageDidAppearWithPageIndex:(unint64_t)a3;
- (void)logTodayViewDidAppear;
- (void)pushCurrentDockConfiguration;
- (void)pushCurrentHomeScreenConfiguration;
- (void)pushCurrentHomeScreenPagesConfiguration;
- (void)pushCurrentTodayConfiguration;
- (void)setCurrentPrediction:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBProactiveHomeScreenUsageObserver

void __84__SBProactiveHomeScreenUsageObserver_widgetIdentifiablesDictionaryForIconListModel___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  int v3 = [v13 isWidgetIcon];
  v4 = v13;
  if (v3)
  {
    v5 = [v13 activeDataSource];
    if (v5)
    {
      v6 = [*(id *)(a1 + 32) proactiveWidgetForIconDataSource:v5 ofIcon:v13];
    }
    else
    {
      v6 = 0;
    }
    uint64_t v7 = [v13 uniqueIdentifier];
    v8 = (void *)v7;
    if (v6 && v7)
    {
      v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v9)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      [v9 setObject:v6 forKey:v8];
    }

    v4 = v13;
  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteCurrentPageIndexChanged:(unint64_t)a4
{
}

- (void)logHomeScreenPageDidAppearWithPageIndex:(unint64_t)a3
{
  id v9 = [(SBProactiveHomeScreenUsageObserver *)self rootFolder];
  if ([v9 isValidListIndex:a3])
  {
    v5 = [v9 listAtIndex:a3];
    v6 = [(SBProactiveHomeScreenUsageObserver *)self widgetIdentifiablesDictionaryForIconListModel:v5];
    uint64_t v7 = [MEMORY[0x1E4F4B0C0] sharedInstance];
    v8 = [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
    [v7 logHomeScreenPageDidAppear:a3 topWidgetsByStackIdentifier:v6 prediction:v8];
  }
}

- (id)widgetIdentifiablesDictionaryForIconListModel:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__50;
  v12 = __Block_byref_object_dispose__50;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__SBProactiveHomeScreenUsageObserver_widgetIdentifiablesDictionaryForIconListModel___block_invoke;
  v7[3] = &unk_1E6B01940;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateIconsUsingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)rootFolder
{
  v2 = [(SBProactiveHomeScreenUsageObserver *)self iconModel];
  int v3 = [v2 rootFolder];

  return v3;
}

- (id)iconModel
{
  v2 = [(SBProactiveHomeScreenUsageObserver *)self iconController];
  int v3 = [v2 iconManager];
  id v4 = [v3 iconModel];

  return v4;
}

- (SBIconController)iconController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconController);
  return (SBIconController *)WeakRetained;
}

- (ATXHomeScreenPrediction)currentPrediction
{
  return self->_currentPrediction;
}

- (SBProactiveHomeScreenUsageObserver)initWithIconController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBProactiveHomeScreenUsageObserver;
  id v5 = [(SBProactiveHomeScreenUsageObserver *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconController, v4);
    uint64_t v7 = [v4 iconManager];
    [v7 setUsageMonitoringEnabled:1];
    uint64_t v8 = [v7 usageMonitor];
    [v8 addObserver:v6];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v6 selector:sel_deviceLockStateDidChange_ name:*MEMORY[0x1E4FA7A38] object:0];
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(SBProactiveHomeScreenUsageObserver *)self pushCurrentHomeScreenConfiguration];
    id v5 = obj;
  }
}

- (void)pushCurrentHomeScreenConfiguration
{
  int v3 = SBLogProactiveHome();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Gathering new home screen configuration", v4, 2u);
  }

  [(SBProactiveHomeScreenUsageObserver *)self pushCurrentHomeScreenPagesConfiguration];
  [(SBProactiveHomeScreenUsageObserver *)self pushCurrentDockConfiguration];
  [(SBProactiveHomeScreenUsageObserver *)self pushCurrentTodayConfiguration];
}

- (void)pushCurrentHomeScreenPagesConfiguration
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v3 = [(SBProactiveHomeScreenUsageObserver *)self iconController];
  id v4 = [v3 iconManager];
  id v5 = [v4 iconModel];
  v6 = [v5 rootFolder];
  uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = SBLogProactiveHome();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "(%{public}@) Preparing to push current home screen configuration", buf, 0xCu);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v10 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
  uint64_t v11 = [v5 maxRowCountForListInRootFolderWithInterfaceOrientation:1];
  uint64_t v12 = [v5 maxColumnCountForListInRootFolderWithInterfaceOrientation:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke;
  v20[3] = &unk_1E6B018C8;
  uint64_t v24 = v11;
  uint64_t v25 = v12;
  BOOL v26 = v10;
  id v13 = v7;
  id v21 = v13;
  v22 = self;
  id v14 = v9;
  id v23 = v14;
  [v6 enumerateListsWithOptions:4 usingBlock:v20];
  v15 = SBLogProactiveHome();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v14;
    _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pushing home screen configuration: %@", buf, 0x16u);
  }

  v16 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_19;
  v18[3] = &unk_1E6AFC6D0;
  id v19 = v13;
  id v17 = v13;
  [v16 writeHomeScreenPageConfigurations:v14 completionHandler:v18];
}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F4B098];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = [v6 uniqueIdentifier];
  [v7 setUniqueIdentifier:v8];

  [v7 setPageIndex:a3];
  objc_msgSend(v7, "setHidden:", objc_msgSend(v6, "isHidden"));
  [v7 setMaxPortraitRows:*(void *)(a1 + 56)];
  [v7 setMaxPortraitColumns:*(void *)(a1 + 64)];
  id v9 = [v6 gridCellInfoWithOptions:*(void *)(a1 + 72)];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_2;
  v20[3] = &unk_1E6B018A0;
  id v21 = v10;
  id v22 = *(id *)(a1 + 32);
  id v23 = v11;
  uint64_t v24 = *(void *)(a1 + 40);
  id v25 = v9;
  id v26 = v13;
  id v27 = v12;
  id v14 = v12;
  id v15 = v13;
  id v16 = v9;
  id v17 = v11;
  id v18 = v10;
  [v6 enumerateIconsUsingBlock:v20];
  [v7 setStacks:v14];
  [v7 setPanels:v15];
  [v7 setAppLocations:v18];
  [v7 setWebClipLocations:v17];
  id v19 = [v6 focusModeIdentifiers];

  [v7 setAssociatedModeUUIDs:v19];
  [*(id *)(a1 + 48) addObject:v7];
}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 isLeafIcon])
  {
    id v6 = [v5 applicationBundleID];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
      [*(id *)(a1 + 32) setObject:v7 forKey:v6];
      uint64_t v8 = SBLogProactiveHome();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v9;
        __int16 v26 = 2112;
        id v27 = v7;
        id v10 = "(%{public}@: iconLocation: %@";
LABEL_10:
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, v10, buf, 0x16u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    if ([v5 isBookmarkIcon])
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
      id v11 = *(void **)(a1 + 48);
      id v12 = [v5 uniqueIdentifier];
      [v11 setObject:v7 forKey:v12];

      uint64_t v8 = SBLogProactiveHome();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v13;
        __int16 v26 = 2112;
        id v27 = v7;
        id v10 = "(%{public}@: bookmark iconLocation: %@";
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }
    if (![v5 isWidgetIcon]) {
      goto LABEL_13;
    }
    id v7 = [*(id *)(a1 + 56) proactiveStackForWidgetIcon:v5 atIndex:a3 gridCellInfo:*(void *)(a1 + 64)];
    int v14 = objc_msgSend(v7, "sb_isAppPredictionStack");
    id v15 = SBLogProactiveHome();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        uint64_t v17 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v17;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@: Panel configuration: %@", buf, 0x16u);
      }

      id v18 = (id *)(a1 + 72);
    }
    else
    {
      if (v16)
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@: Stack configuration: %@", buf, 0x16u);
      }

      id v18 = (id *)(a1 + 80);
    }
    [*v18 addObject:v7];
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  if ([v5 isFolderIcon])
  {
    id v6 = [v5 folder];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_14;
    v20[3] = &unk_1E6B01878;
    uint64_t v23 = a3;
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 32);
    [v6 enumerateAllIconsUsingBlock:v20];

    id v7 = v21;
    goto LABEL_12;
  }
LABEL_14:
}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 isLeafIcon])
  {
    id v7 = [v5 applicationBundleID];
    if (v7)
    {
      v15[0] = *(void *)(a1 + 48);
      v15[1] = [v6 sbListIndex];
      uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v15 length:2];
      uint64_t v9 = SBLogProactiveHome();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 138543618;
        uint64_t v12 = v10;
        __int16 v13 = 2112;
        int v14 = v8;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "(%{public}@: iconLocation: %@", (uint8_t *)&v11, 0x16u);
      }

      [*(id *)(a1 + 40) setObject:v8 forKey:v7];
    }
  }
}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogProactiveHome();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_19_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pushed home screen configuration successfully!", (uint8_t *)&v7, 0xCu);
  }
}

- (void)pushCurrentDockConfiguration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(SBProactiveHomeScreenUsageObserver *)self iconController];
  id v3 = [v2 iconManager];
  id v4 = [v3 iconModel];
  id v5 = [v4 rootFolder];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int v7 = [v5 dock];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke;
  v11[3] = &unk_1E6B018F0;
  id v8 = v6;
  id v12 = v8;
  [v7 enumerateIconsUsingBlock:v11];

  uint64_t v9 = SBLogProactiveHome();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Pushing dock app list: %@", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  [v10 writeDockAppList:v8 completionHandler:&__block_literal_global_155];
}

void __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = [v6 isLeafIcon];
  id v4 = v6;
  if (v3)
  {
    id v5 = [v6 applicationBundleID];
    if (v5) {
      [*(id *)(a1 + 32) addObject:v5];
    }

    id v4 = v6;
  }
}

void __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    int v3 = SBLogProactiveHome();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke_22_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)pushCurrentTodayConfiguration
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v2 = [(SBProactiveHomeScreenUsageObserver *)self iconController];
  int v3 = [v2 iconManager];
  id v4 = [v3 iconModel];
  id v5 = [v4 rootFolder];
  uint64_t v6 = [v5 todayList];
  uint64_t v7 = [v5 favoriteTodayList];
  uint64_t v28 = v3;
  __int16 v29 = v2;
  __int16 v26 = v5;
  id v27 = v4;
  uint64_t v24 = (void *)v7;
  uint64_t v25 = (void *)v6;
  if (v6 && v7)
  {
    v47[0] = v7;
    v47[1] = v6;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v9 = v47;
    uint64_t v10 = 2;
LABEL_9:
    int v11 = objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v24, v6, v5, v4, v3, v2);
    goto LABEL_10;
  }
  if (v7)
  {
    uint64_t v46 = v7;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v9 = &v46;
LABEL_8:
    uint64_t v10 = 1;
    goto LABEL_9;
  }
  if (v6)
  {
    uint64_t v45 = v6;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v9 = &v45;
    goto LABEL_8;
  }
  int v11 = 0;
LABEL_10:
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v11;
  uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    uint64_t v17 = (id *)MEMORY[0x1E4F43630];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "gridCellInfoWithOptions:", objc_msgSend(*v17, "userInterfaceLayoutDirection", v24) == 1);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __67__SBProactiveHomeScreenUsageObserver_pushCurrentTodayConfiguration__block_invoke;
        v32[3] = &unk_1E6B01918;
        v32[4] = self;
        id v33 = v20;
        id v34 = v13;
        id v35 = v12;
        id v21 = v20;
        [v19 enumerateIconsUsingBlock:v32];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v15);
  }

  id v22 = SBLogProactiveHome();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v12;
    __int16 v42 = 2112;
    id v43 = v13;
    _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_INFO, "Pushing today list stacks: %@, app prediction stacks: %@", buf, 0x16u);
  }

  uint64_t v23 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  [v23 writeTodayPageStacks:v12 appPredictionPanels:v13 completionHandler:&__block_literal_global_26];
}

void __67__SBProactiveHomeScreenUsageObserver_pushCurrentTodayConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 isWidgetIcon])
  {
    uint64_t v6 = [*(id *)(a1 + 32) proactiveStackForWidgetIcon:v5 atIndex:a3 gridCellInfo:*(void *)(a1 + 40)];
    uint64_t v7 = SBLogProactiveHome();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      int v11 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Stack configuration for today: %@", (uint8_t *)&v10, 0xCu);
    }

    int v8 = objc_msgSend(v6, "sb_isAppPredictionStack");
    uint64_t v9 = 56;
    if (v8) {
      uint64_t v9 = 48;
    }
    [*(id *)(a1 + v9) addObject:v6];
  }
}

void __67__SBProactiveHomeScreenUsageObserver_pushCurrentTodayConfiguration__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    int v3 = SBLogProactiveHome();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke_22_cold_1((uint64_t)v2, v3);
    }
  }
}

- (id)proactiveStackForWidgetIcon:(id)a3 atIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F4B0B8]);
  int v11 = [v8 uniqueIdentifier];
  [v10 setIdentifier:v11];

  uint64_t v12 = [v8 gridSizeClass];
  [v10 setStackLayoutSize:SBHIconGridSizeClassToStackLayoutSize()];

  uint64_t v13 = objc_msgSend(v9, "coordinateForGridCellIndex:", objc_msgSend(v9, "gridCellIndexForIconIndex:", a4));
  [v10 setCoordinateRow:v14 - 1];
  [v10 setCoordinateColumn:v13 - 1];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v16 = objc_msgSend(v8, "iconDataSources", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForIconDataSource:*(void *)(*((void *)&v24 + 1) + 8 * i) ofIcon:v8];
        if (v21) {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  [v10 setWidgets:v15];
  if ((unint64_t)[v15 count] < 2)
  {
    [v10 setAllowsSmartRotate:0];
    uint64_t v22 = 0;
  }
  else
  {
    objc_msgSend(v10, "setAllowsSmartRotate:", objc_msgSend(v8, "allowsSuggestions"));
    uint64_t v22 = [v8 allowsExternalSuggestions];
  }
  [v10 setAllowsNewWidget:v22];

  return v10;
}

- (id)proactiveWidgetForIconDataSource:(id)a3 ofIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForWidget:v6 ofIcon:v7];
  }
  else
  {
    int v11 = self;
    char v12 = objc_opt_isKindOfClass();

    if (v12)
    {
      id v13 = v6;
      uint64_t v14 = [(id)objc_opt_class() elementIdentifier];
      id v10 = objc_alloc_init(MEMORY[0x1E4F4B0D0]);
      [v10 setExtensionBundleId:v14];
      id v15 = [(id)objc_opt_class() elementKind];
      [v10 setWidgetKind:v15];
      uint64_t v16 = [v13 uniqueIdentifier];
      [v10 setWidgetUniqueId:v16];

      objc_msgSend(v10, "setSuggestedWidget:", objc_msgSend(v13, "suggestionSource") == 1);
      uint64_t v17 = [v13 suggestionSource];

      [v10 setOnboardingWidget:v17 == 2];
    }
    else
    {
      id v10 = 0;
    }
  }
  uint64_t v18 = [v7 gridSizeClass];
  [v10 setSize:SBHIconGridSizeClassToStackLayoutSize()];

  return v10;
}

- (id)proactiveWidgetForWidget:(id)a3 ofIcon:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F4B0D0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = [v8 extensionBundleIdentifier];
  [v9 setExtensionBundleId:v10];

  int v11 = [v8 containerBundleIdentifier];
  [v9 setAppBundleId:v11];

  char v12 = [v8 uniqueIdentifier];
  [v9 setWidgetUniqueId:v12];

  id v13 = [v8 kind];
  [v9 setWidgetKind:v13];

  objc_msgSend(v9, "setSuggestedWidget:", objc_msgSend(v8, "suggestionSource") == 1);
  objc_msgSend(v9, "setOnboardingWidget:", objc_msgSend(v8, "suggestionSource") == 2);
  uint64_t v14 = [(SBProactiveHomeScreenUsageObserver *)self delegate];
  id v15 = [v14 proactiveHomeScreenUsageObserver:self intentForWidget:v8 ofIcon:v7];

  [v9 setIntent:v15];
  return v9;
}

- (void)logTodayViewDidAppear
{
  int v3 = [(SBProactiveHomeScreenUsageObserver *)self rootFolder];
  id v7 = [v3 todayList];

  id v4 = [(SBProactiveHomeScreenUsageObserver *)self widgetIdentifiablesDictionaryForIconListModel:v7];
  id v5 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  id v6 = [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
  [v5 logSpecialPageDidAppear:2 widgetsByStackId:v4 prediction:v6];
}

- (void)deviceLockStateDidChange:(id)a3
{
  int v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FA7B08]];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  int v9 = [v8 BOOLValue];
  id v10 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  if (v9) {
    [v10 logDeviceLock];
  }
  else {
    [v10 logDeviceUnlock];
  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteRootControllerWillAppearWithPageIndex:(unint64_t)a4
{
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4
{
  id v12 = a4;
  uint64_t v5 = [v12 activeDataSource];
  unint64_t v6 = [v12 stackChangeReason] - 1;
  if (v6 > 5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_1D8FD16D0[v6];
  }
  if (v5)
  {
    id v8 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForIconDataSource:v5 ofIcon:v12];
  }
  else
  {
    id v8 = 0;
  }
  int v9 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  id v10 = [v12 uniqueIdentifier];
  int v11 = [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
  [v9 logStackStatusDidChange:v10 widgetOnTop:v8 reason:v7 prediction:v11];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserAddedWidgetIconStackSuggestion:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [v10 firstSuggestedIconDataSource];
  if (v5)
  {
    unint64_t v6 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForIconDataSource:v5 ofIcon:v10];
  }
  else
  {
    unint64_t v6 = 0;
  }
  uint64_t v7 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  id v8 = [v10 uniqueIdentifier];
  int v9 = [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
  [v7 logSupplementaryActionInContextMenu:3 stackId:v8 widgetOnTop:v6 prediction:v9];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedWidgetIconStackSuggestion:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [v10 firstSuggestedIconDataSource];
  if (v5)
  {
    unint64_t v6 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForIconDataSource:v5 ofIcon:v10];
  }
  else
  {
    unint64_t v6 = 0;
  }
  uint64_t v7 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  id v8 = [v10 uniqueIdentifier];
  int v9 = [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
  [v7 logSupplementaryActionInContextMenu:2 stackId:v8 widgetOnTop:v6 prediction:v9];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [v10 firstSuggestedIconDataSource];
  if (v5)
  {
    unint64_t v6 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForIconDataSource:v5 ofIcon:v10];
  }
  else
  {
    unint64_t v6 = 0;
  }
  uint64_t v7 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  id v8 = [v10 uniqueIdentifier];
  int v9 = [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
  [v7 logSupplementaryActionInContextMenu:1 stackId:v8 widgetOnTop:v6 prediction:v9];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5
{
  id v18 = a4;
  id v7 = a5;
  id v8 = [v18 activeDataSource];
  if (v8)
  {
    int v9 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForIconDataSource:v8 ofIcon:v18];
  }
  else
  {
    int v9 = 0;
  }
  id v10 = [v18 activeWidget];
  int v11 = [v10 extensionBundleIdentifier];
  if ([v11 hasPrefix:@"com.apple.news"])
  {

LABEL_7:
    id v14 = v7;
    goto LABEL_9;
  }
  id v12 = [v10 containerBundleIdentifier];
  int v13 = [v12 hasPrefix:@"com.apple.news"];

  if (v13) {
    goto LABEL_7;
  }
  id v14 = 0;
LABEL_9:
  id v15 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  uint64_t v16 = [v18 uniqueIdentifier];
  uint64_t v17 = [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
  [v15 logStackDidTap:v16 engagedUrl:v14 widgetOnTop:v9 prediction:v17];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidAppear:(id)a4 forWidgetIcon:(id)a5
{
  id v11 = a5;
  unint64_t v6 = [v11 uniqueIdentifier];
  id v7 = [v11 activeDataSource];
  if (v7)
  {
    id v8 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForIconDataSource:v7 ofIcon:v11];
  }
  else
  {
    id v8 = 0;
  }
  int v9 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  id v10 = [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
  [v9 logWidgetDidAppear:v8 stackId:v6 prediction:v10];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteDataSourceDidDisappear:(id)a4 forWidgetIcon:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  id v8 = [v7 uniqueIdentifier];
  if (v12)
  {
    int v9 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForIconDataSource:v12 ofIcon:v7];
  }
  else
  {
    int v9 = 0;
  }
  id v10 = [MEMORY[0x1E4F4B0C0] sharedInstance];
  id v11 = [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
  [v10 logWidgetDidDisappear:v9 stackId:v8 prediction:v11];
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteTodayViewAtLocation:(int64_t)a4 scrolledWithIconVisibility:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    uint64_t v28 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v11 isWidgetIcon])
        {
          id v12 = v11;
          int v13 = [v12 uniqueIdentifier];
          id v14 = [v12 activeDataSource];
          if (v14)
          {
            id v15 = [(SBProactiveHomeScreenUsageObserver *)self proactiveWidgetForIconDataSource:v14 ofIcon:v12];
          }
          else
          {
            id v15 = 0;
          }
          uint64_t v16 = [v6 objectForKey:v12];
          objc_msgSend(v16, "bs_CGRectValue");
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;
          double v24 = v23;

          long long v25 = [MEMORY[0x1E4F4B0C0] sharedInstance];
          [(SBProactiveHomeScreenUsageObserver *)self currentPrediction];
          v27 = long long v26 = self;
          objc_msgSend(v25, "logStackVisibilityChanged:visibleRect:topWidget:prediction:", v13, v15, v27, v18, v20, v22, v24);

          self = v26;
          uint64_t v9 = v28;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }
}

- (void)homeScreenUsageAggregatorDidStartDiscoveringWidgets:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F4B0C0], "sharedInstance", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 logUserDidStartWidgetOnboarding];
}

- (void)homeScreenUsageAggregator:(id)a3 widgetDiscoverabilityDidAcceptSuggestion:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F4B0C0];
  id v5 = a4;
  id v6 = [v4 sharedInstance];
  [v6 logUserDidAcceptWidgetOnboardingSuggestion:v5];
}

- (void)homeScreenUsageAggregator:(id)a3 widgetDiscoverabilityDidRejectSuggestion:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F4B0C0];
  id v5 = a4;
  id v6 = [v4 sharedInstance];
  [v6 logUserDidRejectWidgetOnboardingSuggestion:v5];
}

- (void)homeScreenUsageAggregatorWidgetDiscoverabilityDidEnterEditingMode:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F4B0C0], "sharedInstance", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 logUserDidEnterEditModeForWidgetOnboarding];
}

- (void)setCurrentPrediction:(id)a3
{
}

- (SBProactiveHomeScreenUsageObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBProactiveHomeScreenUsageObserverDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPrediction, 0);
}

void __77__SBProactiveHomeScreenUsageObserver_pushCurrentHomeScreenPagesConfiguration__block_invoke_19_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "(%{public}@) Error pushing home screen configuration: %@", (uint8_t *)&v4, 0x16u);
}

void __66__SBProactiveHomeScreenUsageObserver_pushCurrentDockConfiguration__block_invoke_22_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Error writing dock app list: %@", (uint8_t *)&v2, 0xCu);
}

@end