@interface SBHFocusModeManager
- (NSHashTable)observers;
- (NSMutableDictionary)focusModesBySourceNumber;
- (SBHFocusMode)activeFocusMode;
- (SBHFocusModeFeatureIntroductionItem)focusModeFeatureIntroductionItem;
- (SBHFocusModeManager)initWithIconManager:(id)a3;
- (SBHIconManager)iconManager;
- (SBIconListModel)cachedDock;
- (id)_focusModesRequiringIntroduction;
- (id)computeCurrentFocusMode;
- (void)_iconEditingDidChange:(id)a3;
- (void)_iconModelDidChange:(id)a3;
- (void)_notifyObserversOfActiveFocusModeChange;
- (void)_updateDockWithActiveFocusMode:(id)a3 rootFolder:(id)a4;
- (void)addFocusModeRequiringIntroduction:(id)a3;
- (void)addObserver:(id)a3;
- (void)applyFocusMode:(id)a3;
- (void)dealloc;
- (void)dismissAllFocusModePopovers;
- (void)donateFocusMode:(id)a3 fromSource:(int64_t)a4;
- (void)folder:(id)a3 didAddList:(id)a4;
- (void)removeFocusModeRequiringIntroduction:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setActiveFocusMode:(id)a3;
- (void)setCachedDock:(id)a3;
- (void)setFocusModeFeatureIntroductionItem:(id)a3;
- (void)setIconManager:(id)a3;
- (void)updateFocusModePopoverVisibility;
@end

@implementation SBHFocusModeManager

- (SBHFocusMode)activeFocusMode
{
  return self->_activeFocusMode;
}

- (SBHFocusModeManager)initWithIconManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHFocusModeManager;
  v5 = [(SBHFocusModeManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    uint64_t v7 = objc_opt_new();
    focusModesBySourceNumber = v6->_focusModesBySourceNumber;
    v6->_focusModesBySourceNumber = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__iconEditingDidChange_ name:@"SBHIconManagerEditingStateChanged" object:v4];
    [v11 addObserver:v6 selector:sel__iconModelDidChange_ name:@"SBHIconManagerIconModelDidChange" object:v4];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBHFocusModeManager;
  [(SBHFocusModeManager *)&v4 dealloc];
}

- (void)setActiveFocusMode:(id)a3
{
}

- (void)donateFocusMode:(id)a3 fromSource:(int64_t)a4
{
  id v6 = a3;
  BSDispatchQueueAssertMain();
  [v6 setSource:a4];
  uint64_t v7 = [(SBHFocusModeManager *)self focusModesBySourceNumber];
  v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v6 forKeyedSubscript:v8];

  id v9 = [(SBHFocusModeManager *)self computeCurrentFocusMode];
  [(SBHFocusModeManager *)self applyFocusMode:v9];
}

- (id)computeCurrentFocusMode
{
  BSDispatchQueueAssertMain();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = -1;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  id v12 = 0;
  v3 = [(SBHFocusModeManager *)self focusModesBySourceNumber];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__SBHFocusModeManager_computeCurrentFocusMode__block_invoke;
  v6[3] = &unk_1E6AB16E0;
  v6[4] = v13;
  v6[5] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

void __46__SBHFocusModeManager_computeCurrentFocusMode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 > *(void *)(v7 + 24))
  {
    *(void *)(v7 + 24) = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)applyFocusMode:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SBLogFocusModes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412546;
    v49 = v8;
    __int16 v50 = 2114;
    id v51 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "[%@] applying focus mode: %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_activeFocusMode, a3);
  uint64_t v9 = [(SBHFocusModeManager *)self iconManager];
  v10 = [v9 rootFolderController];
  v11 = [v10 contentView];
  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  id v15 = v14;

  v37 = v15;
  uint64_t v36 = [v15 currentIconListModel];
  uint64_t v34 = [v10 currentPageIndex];
  uint64_t v33 = [v10 trailingCustomViewPageIndex];
  int v32 = [v9 isMainDisplayLibraryViewVisible];
  v16 = [v9 rootFolder];
  [(SBHFocusModeManager *)self _updateDockWithActiveFocusMode:v5 rootFolder:v16];
  v35 = v16;
  v17 = [v16 lists];
  if (v5 && [v5 customizedHomeScreenPagesEnabled])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "updateForFocusModeActivated:wantsListVisible:", 1, objc_msgSend(v5, "wantsListVisible:", *(void *)(*((void *)&v42 + 1) + 8 * i)));
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v20);
    }
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v23 = v17;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * j) updateForFocusModeActivated:0 wantsListVisible:0];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v25);
    }
  }

  if (v34 == v33) {
    int v28 = v32;
  }
  else {
    int v28 = 0;
  }
  if (v28 == 1)
  {
    uint64_t v29 = [v10 trailingCustomViewPageIndex];
    v31 = (void *)v36;
    v30 = v37;
LABEL_33:
    [v10 setCurrentPageIndex:v29 animated:0];
    goto LABEL_34;
  }
  v31 = (void *)v36;
  v30 = v37;
  if (v36)
  {
    uint64_t v29 = [v37 pageIndexForIconListModel:v36];
    if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v29 = [v37 defaultPageIndex];
    }
    goto LABEL_33;
  }
LABEL_34:
  [v9 updateIconViewAccessoryVisibility];
  [(SBHFocusModeManager *)self updateFocusModePopoverVisibility];
  [(SBHFocusModeManager *)self _notifyObserversOfActiveFocusModeChange];
}

- (void)dismissAllFocusModePopovers
{
  v3 = [(SBHFocusModeManager *)self focusModeFeatureIntroductionItem];
  if (v3)
  {
    id v6 = v3;
    [v3 tearDown];
    id v4 = [(SBHFocusModeManager *)self iconManager];
    id v5 = [v4 featureIntroductionManager];
    [v5 removeFeatureIntroductionAtAllLocationsWithItem:v6];
    [(SBHFocusModeManager *)self setFocusModeFeatureIntroductionItem:0];

    v3 = v6;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [(SBHFocusModeManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  id v5 = [(SBHFocusModeManager *)self observers];
  [v5 removeObject:v4];
}

- (void)addFocusModeRequiringIntroduction:(id)a3
{
  id v8 = a3;
  id v4 = [(SBHFocusModeManager *)self iconManager];
  id v5 = [v4 homeScreenDefaults];
  id v6 = [v5 focusModesRequiringIntroduction];
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  if (([v6 containsObject:v8] & 1) == 0)
  {
    uint64_t v7 = [v6 arrayByAddingObject:v8];

    [v5 setFocusModesRequiringIntroduction:v7];
    id v6 = (id)v7;
  }
}

- (void)removeFocusModeRequiringIntroduction:(id)a3
{
  id v4 = a3;
  id v8 = [(SBHFocusModeManager *)self iconManager];
  id v5 = [v8 homeScreenDefaults];
  id v6 = [(SBHFocusModeManager *)self _focusModesRequiringIntroduction];
  [v6 removeObject:v4];

  uint64_t v7 = [v6 allObjects];
  [v5 setFocusModesRequiringIntroduction:v7];
}

- (void)updateFocusModePopoverVisibility
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(SBHFocusModeManager *)self activeFocusMode];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 identifier];
    id v6 = [(SBHFocusModeManager *)self _focusModesRequiringIntroduction];
    if ([v6 containsObject:v5])
    {
      uint64_t v7 = [(SBHFocusModeManager *)self focusModeFeatureIntroductionItem];
      if (v7) {
        [(SBHFocusModeManager *)self dismissAllFocusModePopovers];
      }
      id v8 = SBLogFocusModes();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        int v15 = 138412290;
        v16 = v10;
        _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "[%@] Creating feature introduction item for Focus", (uint8_t *)&v15, 0xCu);
      }
      v11 = [(SBHFocusModeManager *)self iconManager];
      uint64_t v12 = [[SBHFocusModeFeatureIntroductionItem alloc] initWithIconManager:v11];

      [(SBHFocusModeManager *)self setFocusModeFeatureIntroductionItem:v12];
      [v11 displayFeatureIntroductionItemIfUnlocked:v12];
    }
    else
    {
      SBLogFocusModes();
      uint64_t v12 = (SBHFocusModeFeatureIntroductionItem *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        int v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_1D7F0A000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "[%@] Focus does not require feature introduction", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    [(SBHFocusModeManager *)self dismissAllFocusModePopovers];
  }
}

- (void)_notifyObserversOfActiveFocusModeChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  v3 = [(SBHFocusModeManager *)self observers];
  id v4 = [v3 allObjects];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "focusModeManagerDidUpdateActiveFocusMode:", self, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_focusModesRequiringIntroduction
{
  v2 = [(SBHFocusModeManager *)self iconManager];
  v3 = [v2 homeScreenDefaults];
  id v4 = [v3 focusModesRequiringIntroduction];
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v4];
    uint64_t v6 = [v5 allObjects];
    [v3 setFocusModesRequiringIntroduction:v6];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_updateDockWithActiveFocusMode:(id)a3 rootFolder:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ([v6 dockList], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    uint64_t v9 = SBLogFocusModes();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = (objc_class *)objc_opt_class();
      long long v11 = NSStringFromClass(v10);
      int v24 = 138412290;
      uint64_t v25 = v11;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_INFO, "[%@] Configuring the dock for the active focus mode", (uint8_t *)&v24, 0xCu);
    }
    long long v12 = [v6 dockList];
    if (self->_cachedDock) {
      goto LABEL_14;
    }
    long long v13 = SBLogFocusModes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      int v24 = 138412290;
      uint64_t v25 = v15;
      _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_INFO, "[%@] Caching original dock configuration", (uint8_t *)&v24, 0xCu);
    }
    v16 = [v7 dock];
    uint64_t v17 = (SBIconListModel *)[v16 copy];
    cachedDock = self->_cachedDock;
    self->_cachedDock = v17;
  }
  else
  {
    if (!self->_cachedDock) {
      goto LABEL_16;
    }
    uint64_t v19 = SBLogFocusModes();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      int v24 = 138412290;
      uint64_t v25 = v21;
      _os_log_impl(&dword_1D7F0A000, v19, OS_LOG_TYPE_INFO, "[%@] Restoring original dock configuration", (uint8_t *)&v24, 0xCu);
    }
    long long v12 = self->_cachedDock;
    v16 = self->_cachedDock;
    self->_cachedDock = 0;
  }

LABEL_14:
  if (v12)
  {
    v22 = [v7 dock];
    id v23 = (id)[v22 setIconsFromIconListModel:v12];
  }
LABEL_16:
}

- (void)folder:(id)a3 didAddList:(id)a4
{
  id v7 = a4;
  id v5 = [(SBHFocusModeManager *)self activeFocusMode];
  id v6 = v5;
  if (v5 && [v5 customizedHomeScreenPagesEnabled]) {
    [v6 addToList:v7];
  }
}

- (void)_iconEditingDidChange:(id)a3
{
  id v4 = [a3 object];
  if ([v4 isEditing]) {
    [(SBHFocusModeManager *)self dismissAllFocusModePopovers];
  }
}

- (void)_iconModelDidChange:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 rootFolder];
  [v4 addFolderObserver:self];
}

- (SBHFocusModeFeatureIntroductionItem)focusModeFeatureIntroductionItem
{
  return self->_focusModeFeatureIntroductionItem;
}

- (void)setFocusModeFeatureIntroductionItem:(id)a3
{
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void)setIconManager:(id)a3
{
}

- (NSMutableDictionary)focusModesBySourceNumber
{
  return self->_focusModesBySourceNumber;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (SBIconListModel)cachedDock
{
  return self->_cachedDock;
}

- (void)setCachedDock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_focusModesBySourceNumber, 0);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_focusModeFeatureIntroductionItem, 0);
  objc_storeStrong((id *)&self->_activeFocusMode, 0);
}

@end