@interface SBFloatingDockSuggestionsModel
- (APSubjectMonitorSubscription)appProtectionSubscription;
- (BOOL)_displayItemContainedInUserDock:(id)a3;
- (BOOL)_isPendingAppSuggestionsUpdate;
- (BOOL)_shouldProcessAppSuggestion:(id)a3;
- (BOOL)dataStore:(id)a3 shouldRestorePersistedDisplayItem:(id)a4;
- (BOOL)recentDisplayItemsController:(id)a3 shouldAddItem:(id)a4;
- (BOOL)recentDisplayItemsControllerShouldRepresentAppClipsAsWebClips:(id)a3;
- (BOOL)recentsEnabled;
- (BOOL)shouldAddItem:(id)a3;
- (NSMutableOrderedSet)currentRecentDisplayItems;
- (NSMutableOrderedSet)currentRecentDisplayItemsSortedByRecency;
- (NSMutableSet)pendingSuggestionUpdateReasons;
- (NSOrderedSet)currentDisplayItems;
- (PTSingleTestRecipe)stressTestRecipe;
- (SBAppSuggestionManager)appSuggestionManager;
- (SBApplication)requestedSuggestedApplication;
- (SBApplicationController)applicationController;
- (SBBestAppSuggestion)currentAppSuggestion;
- (SBFloatingDockDefaults)floatingDockDefaults;
- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider;
- (SBFloatingDockSuggestionsModel)initWithMaximumNumberOfSuggestions:(unint64_t)a3 homeScreenContextProvider:(id)a4 recentsController:(id)a5 recentsDataStore:(id)a6 recentsDefaults:(id)a7 floatingDockDefaults:(id)a8 appSuggestionManager:(id)a9 applicationController:(id)a10;
- (SBFloatingDockSuggestionsModelDelegate)delegate;
- (SBIconListModel)userDockListModel;
- (SBIconModel)iconModel;
- (SBRecentDisplayItemsController)recentsController;
- (SBRecentDisplayItemsDataStore)recentsDataStore;
- (SBRecentDisplayItemsDefaults)recentsDefaults;
- (id)_displayItemForAppSuggestion:(id)a3;
- (id)_dockListModelFromContextProvider;
- (id)_filterRecentDisplayItems:(id)a3 filteredOutItems:(id *)a4;
- (id)_moveOrAddRecentThenCull:(id)a3;
- (id)_oldestRecent;
- (id)persistedDisplayItemsForDataStore:(id)a3;
- (unint64_t)_indexForAppSuggestion:(id)a3;
- (unint64_t)maxSuggestions;
- (void)_addStateCaptureHandlers;
- (void)_appSuggestionsChanged:(id)a3;
- (void)_handleNewRecentItem:(id)a3;
- (void)_iconModelDidChange:(id)a3;
- (void)_iconModelDidLayout:(id)a3;
- (void)_initializeAndObserveDefaults;
- (void)_performAppSuggestionChangedWithNewSuggestion:(id)a3;
- (void)_reloadRecentsAndSuggestions;
- (void)_runStressTestWithCompletion:(id)a3;
- (void)_setRecentsEnabled:(BOOL)a3;
- (void)_updateCurrentDisplayItemsAfterContinuityChange:(BOOL)a3 notifyDelegate:(BOOL)a4;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)beginPendingUpdatesForReason:(id)a3;
- (void)dataStore:(id)a3 persistDisplayItems:(id)a4;
- (void)dealloc;
- (void)dockViewDidBecomeVisible;
- (void)dockViewDidResignVisible;
- (void)endPendingUpdatesForReason:(id)a3;
- (void)recentDisplayItemsController:(id)a3 didAddItem:(id)a4;
- (void)recentDisplayItemsController:(id)a3 didAddItem:(id)a4 andDropItem:(id)a5;
- (void)recentDisplayItemsController:(id)a3 didMoveItemToFront:(id)a4;
- (void)recentDisplayItemsController:(id)a3 didRemoveItem:(id)a4;
- (void)resetRecentsAndSuggestions;
- (void)setCurrentDisplayItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setRecentsEnabled:(BOOL)a3;
- (void)setRequestedSuggestedApplication:(id)a3;
- (void)setUserDockListModel:(id)a3;
@end

@implementation SBFloatingDockSuggestionsModel

- (SBFloatingDockSuggestionsModel)initWithMaximumNumberOfSuggestions:(unint64_t)a3 homeScreenContextProvider:(id)a4 recentsController:(id)a5 recentsDataStore:(id)a6 recentsDefaults:(id)a7 floatingDockDefaults:(id)a8 appSuggestionManager:(id)a9 applicationController:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v41 = a7;
  id v40 = a8;
  id v39 = a9;
  id v19 = a10;
  v44.receiver = self;
  v44.super_class = (Class)SBFloatingDockSuggestionsModel;
  v20 = [(SBFloatingDockSuggestionsModel *)&v44 init];
  v21 = v20;
  if (v20)
  {
    v20->_maxSuggestions = a3;
    objc_storeWeak((id *)&v20->_recentsDataStore, v18);
    objc_storeWeak((id *)&v21->_recentsController, v17);
    objc_storeStrong((id *)&v21->_appSuggestionManager, a9);
    objc_storeWeak((id *)&v21->_homeScreenContextProvider, v16);
    objc_storeStrong((id *)&v21->_applicationController, a10);
    objc_storeStrong((id *)&v21->_floatingDockDefaults, a8);
    [(SBFloatingDockSuggestionsModel *)v21 _setRecentsEnabled:[(SBFloatingDockDefaults *)v21->_floatingDockDefaults recentsEnabled]];
    [v18 setPersistenceDelegate:v21];
    objc_storeStrong((id *)&v21->_recentsDefaults, a7);
    v22 = [v18 displayItems];
    [v17 setRecentDisplayItems:v22];

    [(SBFloatingDockSuggestionsModel *)v21 _initializeAndObserveDefaults];
    v23 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    currentDisplayItems = v21->_currentDisplayItems;
    v21->_currentDisplayItems = v23;

    v25 = [(SBFloatingDockSuggestionsModel *)v21 _dockListModelFromContextProvider];
    [(SBFloatingDockSuggestionsModel *)v21 setUserDockListModel:v25];

    [(SBFloatingDockSuggestionsModel *)v21 _reloadRecentsAndSuggestions];
    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingSuggestionUpdateReasons = v21->_pendingSuggestionUpdateReasons;
    v21->_pendingSuggestionUpdateReasons = v26;

    [(SBFloatingDockSuggestionsModel *)v21 _addStateCaptureHandlers];
    uint64_t v28 = [v16 model];
    iconModel = v21->_iconModel;
    v21->_iconModel = (SBIconModel *)v28;

    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v21 selector:sel__appSuggestionsChanged_ name:@"SBSuggestedAppChangedNotification" object:v21->_appSuggestionManager];
    [v30 addObserver:v21 selector:sel__iconModelDidLayout_ name:*MEMORY[0x1E4FA66F0] object:v21->_iconModel];
    [v30 addObserver:v21 selector:sel__iconModelDidChange_ name:SBIconControllerIconModelDidChangeNotification object:v16];
    v31 = (void *)MEMORY[0x1E4F941D0];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __210__SBFloatingDockSuggestionsModel_initWithMaximumNumberOfSuggestions_homeScreenContextProvider_recentsController_recentsDataStore_recentsDefaults_floatingDockDefaults_appSuggestionManager_applicationController___block_invoke;
    v42[3] = &unk_1E6AF4AC0;
    v32 = v21;
    v43 = v32;
    uint64_t v33 = [v31 recipeWithTitle:@"Run Dock Suggestions Stress Test" prepareBlock:0 action:v42 cleanupBlock:0];
    stressTestRecipe = v32->_stressTestRecipe;
    v32->_stressTestRecipe = (PTSingleTestRecipe *)v33;

    [MEMORY[0x1E4FA6270] registerTestRecipe:v32->_stressTestRecipe];
    v35 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    uint64_t v36 = [v35 addMonitor:v32 subjectMask:1 subscriptionOptions:1];
    appProtectionSubscription = v32->_appProtectionSubscription;
    v32->_appProtectionSubscription = (APSubjectMonitorSubscription *)v36;
  }
  return v21;
}

uint64_t __210__SBFloatingDockSuggestionsModel_initWithMaximumNumberOfSuggestions_homeScreenContextProvider_recentsController_recentsDataStore_recentsDefaults_floatingDockDefaults_appSuggestionManager_applicationController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runStressTestWithCompletion:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SBIconListModel *)self->_userDockListModel removeListObserver:self];
  [(APSubjectMonitorSubscription *)self->_appProtectionSubscription invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBFloatingDockSuggestionsModel;
  [(SBFloatingDockSuggestionsModel *)&v4 dealloc];
}

- (void)dockViewDidBecomeVisible
{
}

- (void)dockViewDidResignVisible
{
}

- (void)beginPendingUpdatesForReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_pendingSuggestionUpdateReasons addObject:v4];
  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Beging pending app suggestions update because %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)endPendingUpdatesForReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SBFloatingDockSuggestionsModel *)self _isPendingAppSuggestionsUpdate];
  [(NSMutableSet *)self->_pendingSuggestionUpdateReasons removeObject:v4];
  int v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "End pending app suggestions update because %@", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = [(SBFloatingDockSuggestionsModel *)self _isPendingAppSuggestionsUpdate];
  if (v5 && !v7)
  {
    uint64_t v8 = [(SBAppSuggestionManager *)self->_appSuggestionManager currentSuggestedApp];
    [(SBFloatingDockSuggestionsModel *)self _performAppSuggestionChangedWithNewSuggestion:v8];
  }
}

- (void)setRequestedSuggestedApplication:(id)a3
{
  BOOL v5 = (SBApplication *)a3;
  if (self->_requestedSuggestedApplication != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_requestedSuggestedApplication, a3);
    [(SBFloatingDockSuggestionsModel *)self _updateCurrentDisplayItemsAfterContinuityChange:0 notifyDelegate:1];
    BOOL v5 = v6;
  }
}

- (void)dataStore:(id)a3 persistDisplayItems:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "plistRepresentation", (void)v13);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(SBRecentDisplayItemsDefaults *)self->_recentsDefaults setDockRecentsPlistRepresentation:v6];
}

- (id)persistedDisplayItemsForDataStore:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(SBRecentDisplayItemsDefaults *)self->_recentsDefaults dockRecentsPlistRepresentation];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v18 = v3;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v12 = [[SBDisplayItem alloc] initWithPlistRepresentation:v11];
          if (!v12)
          {

            long long v16 = SBLogCommon();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[SBFloatingDockSuggestionsModel persistedDisplayItemsForDataStore:](v11, v16);
            }

            id v4 = 0;
            goto LABEL_19;
          }
          long long v13 = v12;
          long long v14 = [(SBDisplayItem *)v12 bundleIdentifier];
          if (!v14 || ([v5 containsObject:v14] & 1) == 0)
          {
            long long v15 = SBLogCommon();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v13;
              _os_log_debug_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEBUG, "found persisted dock recent display item: %@", buf, 0xCu);
            }

            [v4 addObject:v13];
            [v5 addObject:v14];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
LABEL_19:
      v3 = v18;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)dataStore:(id)a3 shouldRestorePersistedDisplayItem:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SBFloatingDockSuggestionsModel *)self homeScreenContextProvider];
  uint64_t v7 = [v6 model];
  if ([v5 type])
  {
    char v8 = 0;
  }
  else
  {
    uint64_t v9 = [v5 bundleIdentifier];
    if (v9)
    {
      uint64_t v10 = [v7 expectedIconForDisplayIdentifier:v9];
      int v11 = [v7 isIconVisible:v10];
      v12 = [(SBApplicationController *)self->_applicationController restrictionController];
      int v13 = [v12 isApplicationIdentifierRestricted:v9];

      char v8 = v11 & (v13 ^ 1);
      long long v14 = SBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 138413058;
        id v17 = v5;
        __int16 v18 = 1024;
        int v19 = v11 & (v13 ^ 1);
        __int16 v20 = 1024;
        int v21 = v11;
        __int16 v22 = 1024;
        int v23 = v13;
        _os_log_debug_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEBUG, "should restore persisted dock recent display item %@: %{BOOL}u (visible: %{BOOL}u, restricted: %{BOOL}u)", (uint8_t *)&v16, 0x1Eu);
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (id)_moveOrAddRecentThenCull:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency sb_indexOfFloatingDockSuggestionDisplayItem:v5];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency removeObjectAtIndex:v6];
  }
  [(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency insertObject:v5 atIndex:0];
  if ((int64_t)([(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency count]
                      - self->_maxSuggestions) >= 2)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBFloatingDockSuggestionsModel.m" lineNumber:236 description:@"shouldn't be getting updates that are adding more than 1 item at a time"];
  }
  if ([(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency count] <= self->_maxSuggestions)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency lastObject];
    [(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency removeObject:v7];
  }

  return v7;
}

- (id)_oldestRecent
{
  return (id)[(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency lastObject];
}

- (void)_handleNewRecentItem:(id)a3
{
  id v13 = a3;
  if ([(SBFloatingDockSuggestionsModel *)self shouldAddItem:v13])
  {
    id v4 = [(SBFloatingDockSuggestionsModel *)self _moveOrAddRecentThenCull:v13];
    currentAppSuggestion = self->_currentAppSuggestion;
    if (v4)
    {
      if (!currentAppSuggestion
        || (uint64_t v6 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItems sb_indexOfFloatingDockSuggestionDisplayItem:v4], [(SBFloatingDockSuggestionsModel *)self _displayItemForAppSuggestion:self->_currentAppSuggestion], v7 = objc_claimAutoreleasedReturnValue(), v8 = [(SBFloatingDockSuggestionsModel *)self _indexForAppSuggestion:v7], v7, v6 != v8))
      {
        [(NSMutableOrderedSet *)self->_currentRecentDisplayItems replaceObjectAtIndex:[(NSMutableOrderedSet *)self->_currentRecentDisplayItems sb_indexOfFloatingDockSuggestionDisplayItem:v4] withObject:v13];
LABEL_12:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsDataStore);
        [WeakRetained setDisplayItems:self->_currentRecentDisplayItems];

        [(SBFloatingDockSuggestionsModel *)self _updateCurrentDisplayItemsAfterContinuityChange:0 notifyDelegate:1];
        goto LABEL_13;
      }
      uint64_t v9 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency lastObject];
      uint64_t v10 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItems indexOfObject:v9];
      uint64_t v11 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItems indexOfObject:v4];
      [(NSMutableOrderedSet *)self->_currentRecentDisplayItems replaceObjectAtIndex:v10 withObject:v13];
      [(NSMutableOrderedSet *)self->_currentRecentDisplayItems replaceObjectAtIndex:v11 withObject:v9];
    }
    else
    {
      if (!currentAppSuggestion
        || [(NSMutableOrderedSet *)self->_currentRecentDisplayItems count] != self->_maxSuggestions - 1)
      {
        [(NSMutableOrderedSet *)self->_currentRecentDisplayItems insertObject:v13 atIndex:0];
        goto LABEL_12;
      }
      uint64_t v9 = [(SBFloatingDockSuggestionsModel *)self _oldestRecent];
      [(NSMutableOrderedSet *)self->_currentRecentDisplayItems replaceObjectAtIndex:[(NSMutableOrderedSet *)self->_currentRecentDisplayItems indexOfObject:v9] withObject:v13];
      [(NSMutableOrderedSet *)self->_currentRecentDisplayItems addObject:v9];
    }

    goto LABEL_12;
  }
LABEL_13:
  MEMORY[0x1F4181820]();
}

- (BOOL)shouldAddItem:(id)a3
{
  currentRecentDisplayItems = self->_currentRecentDisplayItems;
  id v4 = a3;
  LOBYTE(currentRecentDisplayItems) = [(NSMutableOrderedSet *)currentRecentDisplayItems sb_containsFloatingDockSuggestionDisplayItem:v4];
  id v5 = (void *)MEMORY[0x1E4F4B7E0];
  uint64_t v6 = [v4 bundleIdentifier];

  uint64_t v7 = [v5 applicationWithBundleIdentifier:v6];
  LOBYTE(v5) = [v7 isHidden];

  return (v5 | currentRecentDisplayItems) ^ 1;
}

- (BOOL)recentDisplayItemsController:(id)a3 shouldAddItem:(id)a4
{
  id v5 = a4;
  char v6 = [(SBFloatingDockSuggestionsModel *)self _displayItemContainedInUserDock:v5];
  uint64_t v7 = [v5 type];
  iconModel = self->_iconModel;
  if (v7 == 5) {
    [v5 webClipIdentifier];
  }
  else {
  uint64_t v9 = [v5 bundleIdentifier];
  }

  uint64_t v10 = [(SBHIconModel *)iconModel expectedIconForDisplayIdentifier:v9];

  BOOL v11 = [(SBIconModel *)self->_iconModel isIconVisible:v10] & ~v6;
  return v11;
}

- (void)recentDisplayItemsController:(id)a3 didAddItem:(id)a4
{
  id v5 = a4;
  BSDispatchQueueAssertMain();
  [(SBFloatingDockSuggestionsModel *)self _handleNewRecentItem:v5];
}

- (void)recentDisplayItemsController:(id)a3 didAddItem:(id)a4 andDropItem:(id)a5
{
  id v6 = a4;
  BSDispatchQueueAssertMain();
  [(SBFloatingDockSuggestionsModel *)self _handleNewRecentItem:v6];
}

- (void)recentDisplayItemsController:(id)a3 didMoveItemToFront:(id)a4
{
  id v9 = a4;
  BSDispatchQueueAssertMain();
  BOOL v5 = [(SBFloatingDockSuggestionsModel *)self _displayItemContainedInUserDock:v9];
  id v6 = v9;
  if (!v5)
  {
    if ([(NSMutableOrderedSet *)self->_currentRecentDisplayItems sb_containsFloatingDockSuggestionDisplayItem:v9])
    {
      uint64_t v7 = [(SBFloatingDockSuggestionsModel *)self _moveOrAddRecentThenCull:v9];
      if (v7)
      {
        [(NSMutableOrderedSet *)self->_currentRecentDisplayItems replaceObjectAtIndex:[(NSMutableOrderedSet *)self->_currentRecentDisplayItems sb_indexOfFloatingDockSuggestionDisplayItem:v7] withObject:v9];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsDataStore);
        [WeakRetained setDisplayItems:self->_currentRecentDisplayItems];

        [(SBFloatingDockSuggestionsModel *)self _updateCurrentDisplayItemsAfterContinuityChange:0 notifyDelegate:1];
      }
    }
    else
    {
      [(SBFloatingDockSuggestionsModel *)self _handleNewRecentItem:v9];
    }
    id v6 = v9;
  }
}

- (void)recentDisplayItemsController:(id)a3 didRemoveItem:(id)a4
{
  id v13 = a4;
  BSDispatchQueueAssertMain();
  uint64_t v5 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItems sb_indexOfFloatingDockSuggestionDisplayItem:v13];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v5;
    if (self->_currentAppSuggestion
      && ((uint64_t v7 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItems count],
           unint64_t maxSuggestions = self->_maxSuggestions,
           v7 == maxSuggestions)
        ? (BOOL v9 = v6 >= maxSuggestions - 1)
        : (BOOL v9 = 1),
          !v9
       && ([(NSMutableOrderedSet *)self->_currentRecentDisplayItems lastObject],
           (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0)))
    {
      BOOL v11 = (void *)v10;
      [(NSMutableOrderedSet *)self->_currentRecentDisplayItems removeObject:v10];
      [(NSMutableOrderedSet *)self->_currentRecentDisplayItems replaceObjectAtIndex:v6 withObject:v11];
    }
    else
    {
      [(NSMutableOrderedSet *)self->_currentRecentDisplayItems removeObjectAtIndex:v6];
    }
    [(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency removeObject:v13];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsDataStore);
    [WeakRetained setDisplayItems:self->_currentRecentDisplayItems];

    [(SBFloatingDockSuggestionsModel *)self _updateCurrentDisplayItemsAfterContinuityChange:0 notifyDelegate:1];
  }
}

- (BOOL)recentDisplayItemsControllerShouldRepresentAppClipsAsWebClips:(id)a3
{
  return 1;
}

- (void)_updateCurrentDisplayItemsAfterContinuityChange:(BOOL)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v34 = a3;
  uint64_t v5 = self;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = [(SBFloatingDockSuggestionsModel *)self currentDisplayItems];
  unint64_t v6 = (void *)[(NSMutableOrderedSet *)v5->_currentRecentDisplayItems mutableCopy];
  uint64_t v7 = [(SBFloatingDockSuggestionsModel *)v5 requestedSuggestedApplication];
  unint64_t v8 = (unint64_t)v7;
  if (v7)
  {
    BOOL v9 = [v7 bundleIdentifier];
    uint64_t v10 = +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:v9 sceneIdentifier:0];

    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    BOOL v11 = [v10 bundleIdentifier];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __97__SBFloatingDockSuggestionsModel__updateCurrentDisplayItemsAfterContinuityChange_notifyDelegate___block_invoke;
    v39[3] = &unk_1E6AFAE48;
    id v40 = v11;
    id v12 = v11;
    id v13 = [v6 indexesOfObjectsPassingTest:v39];
    [v6 removeObjectsAtIndexes:v13];
    [v6 addObject:v10];

    goto LABEL_7;
  }
  if (v5->_currentAppSuggestion)
  {
    uint64_t v10 = -[SBFloatingDockSuggestionsModel _displayItemForAppSuggestion:](v5, "_displayItemForAppSuggestion:");
    if (v10) {
      goto LABEL_6;
    }
  }
LABEL_7:
  unint64_t v14 = [v6 count];
  unint64_t maxSuggestions = v5->_maxSuggestions;
  unint64_t v16 = v14 - maxSuggestions;
  if (v14 > maxSuggestions) {
    objc_msgSend(v6, "removeObjectsInRange:", maxSuggestions - ((v8 | (unint64_t)v5->_currentAppSuggestion) != 0), v16);
  }
  if ((objc_msgSend(v6, "isEqualToOrderedSet:", v33, v16) & 1) == 0)
  {
    if (v4)
    {
      v31 = (void *)v8;
      id v17 = v5;
      id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
      v32 = v6;
      int v19 = [v6 differenceFromOrderedSet:v33 withOptions:4];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            v25 = objc_msgSend(v24, "object", v31);
            uint64_t v26 = [v24 changeType];
            uint64_t v27 = [v24 index];
            uint64_t v28 = [v24 associatedIndex];
            uint64_t v29 = v28;
            if (v26 == 1)
            {
              if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
                [WeakRetained dockSuggestionsModel:v17 didRemoveItem:v25 atIndex:v27 involvesContinuity:v34];
              }
            }
            else if (!v26)
            {
              if (v28 == 0x7FFFFFFFFFFFFFFFLL)
              {
                [WeakRetained dockSuggestionsModel:v17 didInsertItem:v25 atIndex:v27 involvesContinuity:v34];
              }
              else
              {
                v30 = [v33 objectAtIndex:v28];
                [WeakRetained dockSuggestionsModel:v17 didReplaceItem:v30 atIndex:v29 withItem:v25 atIndex:v27 involvesContinuity:v34];
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v21);
      }

      uint64_t v5 = v17;
      unint64_t v8 = (unint64_t)v31;
      unint64_t v6 = v32;
    }
    -[SBFloatingDockSuggestionsModel setCurrentDisplayItems:](v5, "setCurrentDisplayItems:", v6, v31);
  }
}

uint64_t __97__SBFloatingDockSuggestionsModel__updateCurrentDisplayItemsAfterContinuityChange_notifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_displayItemContainedInUserDock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 5)
  {
    unint64_t v6 = [v4 webClipIdentifier];
    char v8 = [(SBIconListModel *)self->_userDockListModel directlyContainsLeafIconWithIdentifier:v6];
  }
  else
  {
    if (v5)
    {
      char v8 = 0;
      goto LABEL_7;
    }
    unint64_t v6 = [v4 bundleIdentifier];
    uint64_t v7 = [(SBIconListModel *)self->_userDockListModel lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:v6];
    char v8 = v7 != 0;
  }
LABEL_7:

  return v8;
}

- (id)_filterRecentDisplayItems:(id)a3 filteredOutItems:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if (a4)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    *a4 = v23;
  }
  else
  {
    id v23 = 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v26;
    *(void *)&long long v9 = 138412290;
    long long v22 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v14 = (void *)MEMORY[0x1E4F4B7E0];
        long long v15 = objc_msgSend(v13, "bundleIdentifier", v22);
        unint64_t v16 = [v14 applicationWithBundleIdentifier:v15];
        int v17 = [v16 isHidden];

        if (v17)
        {
          __int16 v18 = SBLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = [v13 bundleIdentifier];
            *(_DWORD *)buf = v22;
            v30 = v19;
            _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Removing %@ because it's hidden by AppProtection", buf, 0xCu);
          }
        }
        else
        {
          if ([(SBFloatingDockSuggestionsModel *)self _displayItemContainedInUserDock:v13])
          {
            uint64_t v20 = v23;
LABEL_17:
            [v20 addObject:v13];
            continue;
          }
          if ([v24 count] < self->_maxSuggestions)
          {
            uint64_t v20 = v24;
            goto LABEL_17;
          }
          if ([v24 count] >= self->_maxSuggestions) {
            goto LABEL_21;
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v10);
  }
LABEL_21:

  return v24;
}

- (BOOL)_shouldProcessAppSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4
    && ([v4 bundleIdentifier], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    if ([v5 isHandoff])
    {
      if (self->_currentAppSuggestion)
      {
        id v7 = [v5 uniqueIdentifier];
        uint64_t v8 = [(SBBestAppSuggestion *)self->_currentAppSuggestion uniqueIdentifier];
        int v9 = [v7 isEqual:v8] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 1;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
    userDockListModel = self->_userDockListModel;
    id v12 = [v5 bundleIdentifier];
    LOBYTE(userDockListModel) = [(SBIconListModel *)userDockListModel directlyContainsLeafIconWithIdentifier:v12];

    currentRecentDisplayItems = self->_currentRecentDisplayItems;
    unint64_t v14 = [(SBFloatingDockSuggestionsModel *)self _displayItemForAppSuggestion:v5];
    long long v15 = [v14 displayItemForFloatingDockSuggestionsComparison];
    LOBYTE(currentRecentDisplayItems) = [(NSMutableOrderedSet *)currentRecentDisplayItems sb_containsFloatingDockSuggestionDisplayItem:v15];

    char v10 = v9 | (userDockListModel | currentRecentDisplayItems) ^ 1;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SBFloatingDockSuggestionsModel_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __79__SBFloatingDockSuggestionsModel_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadRecentsAndSuggestions];
}

- (unint64_t)_indexForAppSuggestion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItems count];
  currentRecentDisplayItems = self->_currentRecentDisplayItems;
  if (v5 >= self->_maxSuggestions)
  {
    unint64_t v8 = [(NSMutableOrderedSet *)currentRecentDisplayItems count] - 1;
  }
  else
  {
    unsigned int v7 = [(NSMutableOrderedSet *)currentRecentDisplayItems sb_containsFloatingDockSuggestionDisplayItem:v4];
    unint64_t v8 = [(NSMutableOrderedSet *)self->_currentRecentDisplayItems count] - v7;
  }

  return v8;
}

- (void)_appSuggestionsChanged:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SBFloatingDockSuggestionsModel *)self _isPendingAppSuggestionsUpdate])
  {
    unint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      pendingSuggestionUpdateReasons = self->_pendingSuggestionUpdateReasons;
      int v9 = 138412290;
      char v10 = pendingSuggestionUpdateReasons;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring app suggestions changed because %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    unsigned int v7 = [v4 userInfo];
    unint64_t v8 = [v7 objectForKey:@"SBNewSuggestedAppKey"];

    [(SBFloatingDockSuggestionsModel *)self _performAppSuggestionChangedWithNewSuggestion:v8];
  }
}

- (void)_performAppSuggestionChangedWithNewSuggestion:(id)a3
{
  id v4 = (SBBestAppSuggestion *)a3;
  BSDispatchQueueAssertMain();
  currentAppSuggestion = self->_currentAppSuggestion;
  self->_currentAppSuggestion = v4;

  [(SBFloatingDockSuggestionsModel *)self _updateCurrentDisplayItemsAfterContinuityChange:1 notifyDelegate:1];
}

- (BOOL)_isPendingAppSuggestionsUpdate
{
  return [(NSMutableSet *)self->_pendingSuggestionUpdateReasons count] != 0;
}

- (void)_initializeAndObserveDefaults
{
  objc_initWeak(&location, self);
  floatingDockDefaults = self->_floatingDockDefaults;
  id v4 = [NSString stringWithUTF8String:"recentsEnabled"];
  uint64_t v5 = MEMORY[0x1E4F14428];
  id v6 = MEMORY[0x1E4F14428];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  char v10 = __63__SBFloatingDockSuggestionsModel__initializeAndObserveDefaults__block_invoke;
  uint64_t v11 = &unk_1E6AF4B10;
  objc_copyWeak(&v12, &location);
  id v7 = (id)[(SBFloatingDockDefaults *)floatingDockDefaults observeDefault:v4 onQueue:v5 withBlock:&v8];

  [(SBFloatingDockSuggestionsModel *)self _setRecentsEnabled:[(SBFloatingDockDefaults *)self->_floatingDockDefaults recentsEnabled]];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __63__SBFloatingDockSuggestionsModel__initializeAndObserveDefaults__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setRecentsEnabled:", objc_msgSend(WeakRetained[15], "recentsEnabled"));
    id WeakRetained = v2;
  }
}

- (void)_setRecentsEnabled:(BOOL)a3
{
  if (self->_recentsEnabled != a3)
  {
    id v4 = [(SBFloatingDockSuggestionsModel *)self recentsController];
    id v5 = v4;
    if (self->_recentsEnabled)
    {
      self->_recentsEnabled = 0;
      [v4 setDelegate:0];
      [(SBFloatingDockSuggestionsModel *)self resetRecentsAndSuggestions];
    }
    else
    {
      self->_recentsEnabled = 1;
      [v4 setDelegate:self];
      [(SBFloatingDockSuggestionsModel *)self _reloadRecentsAndSuggestions];
    }
  }
}

- (id)_displayItemForAppSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  id v5 = [v3 bundleIdentifier];
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = [v4 uniqueIdentifier];

  if (v6)
  {
    id v7 = [v4 bundleIdentifier];
    id v5 = +[SBContinuityDisplayItem continuityAppDisplayItemWithBundleIdentifier:v7 appSuggestion:v4];
  }
  else
  {
LABEL_5:
    id v5 = 0;
  }
LABEL_6:

  return v5;
}

- (void)_addStateCaptureHandlers
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x1E4F14428];
  v7[1] = (id)MEMORY[0x1E4F143A8];
  v7[2] = (id)3221225472;
  v7[3] = __58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke;
  v7[4] = &unk_1E6AF76A8;
  objc_copyWeak(&v8, &location);
  id v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  v6[1] = (id)MEMORY[0x1E4F143A8];
  v6[2] = (id)3221225472;
  v6[3] = __58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke_2;
  v6[4] = &unk_1E6AF76A8;
  objc_copyWeak(v7, &location);
  id v4 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_copyWeak(v6, &location);
  id v5 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

__CFString *__58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained[17] description];
  }
  else
  {
    id v3 = &stru_1F3084718;
  }

  return v3;
}

__CFString *__58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  id v3 = &stru_1F3084718;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[3] bundleIdentifier];
    id v5 = (void *)v4;
    if (v4) {
      id v6 = (__CFString *)v4;
    }
    else {
      id v6 = &stru_1F3084718;
    }
    id v3 = v6;
  }
  return v3;
}

id __58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained currentDisplayItems];
  id v3 = [v2 description];

  return v3;
}

- (void)resetRecentsAndSuggestions
{
  id v3 = [(SBFloatingDockSuggestionsModel *)self recentsController];
  [v3 reset];
  [(SBFloatingDockSuggestionsModel *)self _reloadRecentsAndSuggestions];
}

- (void)_reloadRecentsAndSuggestions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBFloatingDockSuggestionsModel *)self currentDisplayItems];
  if (self->_recentsEnabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsController);
    id v5 = [WeakRetained recentDisplayItems];
    id v6 = [(SBFloatingDockSuggestionsModel *)self _filterRecentDisplayItems:v5 filteredOutItems:0];
    currentRecentDisplayItems = self->_currentRecentDisplayItems;
    self->_currentRecentDisplayItems = v6;

    objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", -[NSMutableOrderedSet count](self->_currentRecentDisplayItems, "count"));
    id v8 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    currentRecentDisplayItemsSortedByRecency = self->_currentRecentDisplayItemsSortedByRecency;
    self->_currentRecentDisplayItemsSortedByRecency = v8;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    char v10 = self->_currentRecentDisplayItems;
    uint64_t v11 = [(NSMutableOrderedSet *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          -[NSMutableOrderedSet addObject:](self->_currentRecentDisplayItemsSortedByRecency, "addObject:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        }
        uint64_t v12 = [(NSMutableOrderedSet *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    currentAppSuggestion = self->_currentAppSuggestion;
    self->_currentAppSuggestion = 0;
  }
  else
  {
    [(NSMutableOrderedSet *)self->_currentRecentDisplayItems removeAllObjects];
    [(NSMutableOrderedSet *)self->_currentRecentDisplayItemsSortedByRecency removeAllObjects];
  }
  -[SBFloatingDockSuggestionsModel _updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:](self, "_updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:", 0, 0, (void)v18);
  unint64_t v16 = [(SBFloatingDockSuggestionsModel *)self currentDisplayItems];
  id v17 = objc_loadWeakRetained((id *)&self->_delegate);
  [v17 dockSuggestionsModel:self didReloadItems:v3 withItems:v16];
}

- (id)_dockListModelFromContextProvider
{
  id v2 = [(SBFloatingDockSuggestionsModel *)self homeScreenContextProvider];
  id v3 = [v2 model];
  uint64_t v4 = [v3 rootFolder];
  id v5 = [v4 dock];

  return v5;
}

- (void)setUserDockListModel:(id)a3
{
  id v5 = (SBIconListModel *)a3;
  userDockListModel = self->_userDockListModel;
  if (userDockListModel != v5)
  {
    id v7 = v5;
    [(SBIconListModel *)userDockListModel removeListObserver:self];
    objc_storeStrong((id *)&self->_userDockListModel, a3);
    [(SBIconListModel *)self->_userDockListModel addListObserver:self];
    id v5 = v7;
  }
}

- (void)_iconModelDidLayout:(id)a3
{
  uint64_t v4 = [(SBFloatingDockSuggestionsModel *)self _dockListModelFromContextProvider];
  [(SBFloatingDockSuggestionsModel *)self setUserDockListModel:v4];

  [(SBFloatingDockSuggestionsModel *)self _reloadRecentsAndSuggestions];
}

- (void)_iconModelDidChange:(id)a3
{
  uint64_t v9 = [(SBFloatingDockSuggestionsModel *)self _dockListModelFromContextProvider];
  if (self->_userDockListModel != v9)
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *MEMORY[0x1E4FA66F0];
    [v4 removeObserver:self name:*MEMORY[0x1E4FA66F0] object:self->_iconModel];
    id v6 = [(SBFloatingDockSuggestionsModel *)self homeScreenContextProvider];
    id v7 = [v6 model];
    iconModel = self->_iconModel;
    self->_iconModel = v7;

    [(SBFloatingDockSuggestionsModel *)self setUserDockListModel:v9];
    [v4 addObserver:self selector:sel__iconModelDidLayout_ name:v5 object:self->_iconModel];
    [(SBFloatingDockSuggestionsModel *)self _reloadRecentsAndSuggestions];
  }
}

- (void)_runStressTestWithCompletion:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SBFloatingDockSuggestionsModel__runStressTestWithCompletion___block_invoke;
  v8[3] = &unk_1E6B0DD78;
  char v10 = v13;
  uint64_t v11 = v12;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v7 = (id)[v5 scheduledTimerWithTimeInterval:1 repeats:v8 block:0.05];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);
}

void __63__SBFloatingDockSuggestionsModel__runStressTestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  *(void *)(v4 + 24) = v5 + 1;
  id v23 = v3;
  switch(v5)
  {
    case 0:
      id v9 = *(void **)(a1 + 32);
      char v10 = [SBDisplayItem alloc];
      uint64_t v11 = SBMapsBundleIdentifier;
      goto LABEL_22;
    case 1:
      id v9 = *(void **)(a1 + 32);
      char v10 = [SBDisplayItem alloc];
      uint64_t v11 = SBMusicBundleIdentifier;
      goto LABEL_22;
    case 2:
      id v9 = *(void **)(a1 + 32);
      char v10 = [SBDisplayItem alloc];
      uint64_t v11 = SBMessagesBundleIdentifier;
      goto LABEL_22;
    case 3:
    case 4:
      id v6 = *(void **)(a1 + 32);
      id v7 = [SBDisplayItem alloc];
      id v8 = SBMusicBundleIdentifier;
      goto LABEL_11;
    case 5:
      uint64_t v13 = *(void **)(a1 + 32);
      unint64_t v14 = [[SBDisplayItem alloc] initWithType:0 bundleIdentifier:@"com.apple.Maps" uniqueIdentifier:0];
      [v13 recentDisplayItemsController:0 didRemoveItem:v14];
      goto LABEL_28;
    case 6:
      id v6 = *(void **)(a1 + 32);
      id v7 = [SBDisplayItem alloc];
      id v8 = SBMessagesBundleIdentifier;
LABEL_11:
      long long v15 = *v8;
      goto LABEL_27;
    case 7:
      id v9 = *(void **)(a1 + 32);
      char v10 = [SBDisplayItem alloc];
      uint64_t v11 = SBNotesBundleIdentifier;
      goto LABEL_22;
    case 8:
      unint64_t v16 = *(void **)(a1 + 32);
      id v17 = [SBPPTFakeAppSuggestion alloc];
      long long v18 = SBNotesBundleIdentifier;
      goto LABEL_16;
    case 9:
      unint64_t v16 = *(void **)(a1 + 32);
      id v17 = [SBPPTFakeAppSuggestion alloc];
      long long v18 = SBMessagesBundleIdentifier;
      goto LABEL_16;
    case 10:
      unint64_t v16 = *(void **)(a1 + 32);
      id v17 = [SBPPTFakeAppSuggestion alloc];
      long long v18 = SBFilesBundleIdentifier;
LABEL_16:
      long long v19 = *v18;
      goto LABEL_18;
    case 11:
      unint64_t v16 = *(void **)(a1 + 32);
      id v17 = [SBPPTFakeAppSuggestion alloc];
      long long v19 = @"com.apple.not-found";
LABEL_18:
      unint64_t v14 = [(SBPPTFakeAppSuggestion *)v17 initWithBundleIdentifier:v19];
      [v16 _performAppSuggestionChangedWithNewSuggestion:v14];
      goto LABEL_28;
    case 12:
      [*(id *)(a1 + 32) _performAppSuggestionChangedWithNewSuggestion:0];
      goto LABEL_29;
    case 13:
      id v9 = *(void **)(a1 + 32);
      char v10 = [SBDisplayItem alloc];
      uint64_t v11 = SBFacetimeBundleIdentifier;
      goto LABEL_22;
    case 14:
    case 19:
      id v9 = *(void **)(a1 + 32);
      char v10 = [SBDisplayItem alloc];
      uint64_t v11 = SBClockBundleIdentifier;
      goto LABEL_22;
    case 15:
      id v9 = *(void **)(a1 + 32);
      char v10 = [SBDisplayItem alloc];
      uint64_t v11 = SBCalendarBundleIdentifier;
LABEL_22:
      long long v20 = *v11;
      goto LABEL_23;
    case 16:
      id v9 = *(void **)(a1 + 32);
      char v10 = [SBDisplayItem alloc];
      long long v20 = @"com.apple.not-found";
LABEL_23:
      long long v21 = 0;
      goto LABEL_24;
    case 17:
      id v6 = *(void **)(a1 + 32);
      id v7 = [SBDisplayItem alloc];
      long long v15 = @"com.apple.not-found";
LABEL_27:
      unint64_t v14 = [(SBDisplayItem *)v7 initWithType:0 bundleIdentifier:v15 uniqueIdentifier:0];
      [v6 recentDisplayItemsController:0 didMoveItemToFront:v14];
      goto LABEL_28;
    case 18:
      id v9 = *(void **)(a1 + 32);
      char v10 = [SBDisplayItem alloc];
      long long v20 = @"com.apple.mobiletimer";
      long long v21 = @"scene";
LABEL_24:
      unint64_t v14 = [(SBDisplayItem *)v10 initWithType:0 bundleIdentifier:v20 uniqueIdentifier:v21];
      [v9 _handleNewRecentItem:v14];
LABEL_28:

      goto LABEL_29;
    default:
      uint64_t v12 = v3;
      if (++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > 9uLL)
      {
        [v3 invalidate];
        uint64_t v12 = v23;
        uint64_t v22 = *(void *)(a1 + 40);
        if (v22)
        {
          (*(void (**)(uint64_t, id))(v22 + 16))(v22, v23);
LABEL_29:
          uint64_t v12 = v23;
        }
      }
      else
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }

      return;
  }
}

- (NSOrderedSet)currentDisplayItems
{
  return self->_currentDisplayItems;
}

- (void)setCurrentDisplayItems:(id)a3
{
}

- (SBBestAppSuggestion)currentAppSuggestion
{
  return self->_currentAppSuggestion;
}

- (SBApplication)requestedSuggestedApplication
{
  return self->_requestedSuggestedApplication;
}

- (SBFloatingDockSuggestionsModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFloatingDockSuggestionsModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)maxSuggestions
{
  return self->_maxSuggestions;
}

- (SBAppSuggestionManager)appSuggestionManager
{
  return self->_appSuggestionManager;
}

- (SBRecentDisplayItemsController)recentsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsController);
  return (SBRecentDisplayItemsController *)WeakRetained;
}

- (SBRecentDisplayItemsDataStore)recentsDataStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsDataStore);
  return (SBRecentDisplayItemsDataStore *)WeakRetained;
}

- (SBRecentDisplayItemsDefaults)recentsDefaults
{
  return self->_recentsDefaults;
}

- (SBIconListModel)userDockListModel
{
  return self->_userDockListModel;
}

- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeScreenContextProvider);
  return (SBFloatingDockHomeScreenContextProviding *)WeakRetained;
}

- (SBApplicationController)applicationController
{
  return self->_applicationController;
}

- (SBIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
}

- (SBFloatingDockDefaults)floatingDockDefaults
{
  return self->_floatingDockDefaults;
}

- (BOOL)recentsEnabled
{
  return self->_recentsEnabled;
}

- (void)setRecentsEnabled:(BOOL)a3
{
  self->_recentsEnabled = a3;
}

- (NSMutableSet)pendingSuggestionUpdateReasons
{
  return self->_pendingSuggestionUpdateReasons;
}

- (NSMutableOrderedSet)currentRecentDisplayItems
{
  return self->_currentRecentDisplayItems;
}

- (NSMutableOrderedSet)currentRecentDisplayItemsSortedByRecency
{
  return self->_currentRecentDisplayItemsSortedByRecency;
}

- (PTSingleTestRecipe)stressTestRecipe
{
  return self->_stressTestRecipe;
}

- (APSubjectMonitorSubscription)appProtectionSubscription
{
  return self->_appProtectionSubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProtectionSubscription, 0);
  objc_storeStrong((id *)&self->_stressTestRecipe, 0);
  objc_storeStrong((id *)&self->_currentRecentDisplayItemsSortedByRecency, 0);
  objc_storeStrong((id *)&self->_currentRecentDisplayItems, 0);
  objc_storeStrong((id *)&self->_pendingSuggestionUpdateReasons, 0);
  objc_storeStrong((id *)&self->_floatingDockDefaults, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_destroyWeak((id *)&self->_homeScreenContextProvider);
  objc_storeStrong((id *)&self->_userDockListModel, 0);
  objc_storeStrong((id *)&self->_recentsDefaults, 0);
  objc_destroyWeak((id *)&self->_recentsDataStore);
  objc_destroyWeak((id *)&self->_recentsController);
  objc_storeStrong((id *)&self->_appSuggestionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestedSuggestedApplication, 0);
  objc_storeStrong((id *)&self->_currentAppSuggestion, 0);
  objc_storeStrong((id *)&self->_currentDisplayItems, 0);
}

- (void)persistedDisplayItemsForDataStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "failed to create display item from dock plist rep -- aborting loading of items. failed plist rep: %@", (uint8_t *)&v2, 0xCu);
}

@end