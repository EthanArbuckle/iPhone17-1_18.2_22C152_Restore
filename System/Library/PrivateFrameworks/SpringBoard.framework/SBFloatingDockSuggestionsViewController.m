@interface SBFloatingDockSuggestionsViewController
- (BOOL)_onHomescreen;
- (BOOL)_shouldDeferUpdateInvolvingContinuity:(BOOL)a3;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isVisible;
- (NSMutableArray)deferredIconUpdates;
- (NSSet)presentedIconLocations;
- (SBAppSuggestionManager)appSuggestionManager;
- (SBApplicationController)applicationController;
- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider;
- (SBFloatingDockSuggestionsModel)suggestionsModel;
- (SBFloatingDockSuggestionsViewController)initWithNumberOfRecents:(unint64_t)a3 homeScreenContextProvider:(id)a4 applicationController:(id)a5 layoutStateTransitionCoordinator:(id)a6 suggestionsModel:(id)a7 iconViewProvider:(id)a8;
- (SBFloatingDockSuggestionsViewControllerDelegate)delegate;
- (SBFloatingDockViewController)floatingDockViewController;
- (SBIconListModel)suggestionsIconListModel;
- (SBIconViewProviding)iconViewProvider;
- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator;
- (id)_iconForDisplayItem:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (int64_t)effectiveEnvironmentMode;
- (unint64_t)numberOfRecents;
- (void)_didChangeNumberOfIcons;
- (void)_emitPresentedEventInvolvingContinuity:(BOOL)a3 fromModel:(id)a4 atIndex:(unint64_t)a5;
- (void)_fadeInIcon:(id)a3 isReplacing:(BOOL)a4 completion:(id)a5;
- (void)_fadeOutIcon:(id)a3 atIndex:(unint64_t)a4 isReplacing:(BOOL)a5 completion:(id)a6;
- (void)_iconModelDidChange:(id)a3;
- (void)_listLayoutDidChange:(id)a3;
- (void)_loadAndPlaceIconsInViewForDisplayItems:(id)a3;
- (void)_performDeferredIconUpdates;
- (void)_performOrDefer:(BOOL)a3 iconUpdate:(id)a4;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)dealloc;
- (void)dockFolderDidEndTransitioning;
- (void)dockFolderWillBeginTransitioning;
- (void)dockSuggestionsModel:(id)a3 didInsertItem:(id)a4 atIndex:(unint64_t)a5 involvesContinuity:(BOOL)a6;
- (void)dockSuggestionsModel:(id)a3 didReloadItems:(id)a4 withItems:(id)a5;
- (void)dockSuggestionsModel:(id)a3 didRemoveItem:(id)a4 atIndex:(unint64_t)a5 involvesContinuity:(BOOL)a6;
- (void)dockSuggestionsModel:(id)a3 didReplaceItem:(id)a4 atIndex:(unint64_t)a5 withItem:(id)a6 atIndex:(unint64_t)a7 involvesContinuity:(BOOL)a8;
- (void)dockViewDidBecomeVisible;
- (void)dockViewDidResignVisible;
- (void)dockViewWillBecomeVisible;
- (void)dockViewWillResignVisible;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)loadView;
- (void)recycleIconView:(id)a3;
- (void)setDeferredIconUpdates:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectiveEnvironmentMode:(int64_t)a3;
- (void)setFloatingDockViewController:(id)a3;
- (void)setLayoutStateTransitionCoordinator:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SBFloatingDockSuggestionsViewController

- (SBFloatingDockSuggestionsViewController)initWithNumberOfRecents:(unint64_t)a3 homeScreenContextProvider:(id)a4 applicationController:(id)a5 layoutStateTransitionCoordinator:(id)a6 suggestionsModel:(id)a7 iconViewProvider:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)SBFloatingDockSuggestionsViewController;
  v19 = [(SBFloatingDockSuggestionsViewController *)&v28 initWithNibName:0 bundle:0];
  v20 = v19;
  if (v19)
  {
    v19->_numberOfRecents = a3;
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FA6400]) initWithFolder:0 maxIconCount:a3];
    suggestionsIconListModel = v20->_suggestionsIconListModel;
    v20->_suggestionsIconListModel = (SBIconListModel *)v21;

    objc_storeWeak((id *)&v20->_homeScreenContextProvider, v14);
    objc_storeStrong((id *)&v20->_applicationController, a5);
    objc_storeWeak((id *)&v20->_suggestionsModel, v17);
    [v17 setDelegate:v20];
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    deferredIconUpdates = v20->_deferredIconUpdates;
    v20->_deferredIconUpdates = (NSMutableArray *)v23;

    [v16 addObserver:v20];
    objc_storeWeak((id *)&v20->_layoutStateTransitionCoordinator, v16);
    v20->_effectiveEnvironmentMode = 0;
    objc_storeWeak((id *)&v20->_iconViewProvider, v18);
    v25 = [v14 iconManager];
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v20 selector:sel__iconModelDidChange_ name:*MEMORY[0x1E4FA6580] object:v25];
    [v26 addObserver:v20 selector:sel__listLayoutDidChange_ name:*MEMORY[0x1E4FA6588] object:v25];
  }
  return v20;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  [WeakRetained removeObserver:self];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SBFloatingDockSuggestionsViewController;
  [(SBFloatingDockSuggestionsViewController *)&v5 dealloc];
}

- (void)loadView
{
  id v12 = [(SBFloatingDockSuggestionsViewController *)self homeScreenContextProvider];
  v3 = [v12 iconManager];
  v4 = [SBDockSuggestionsIconListView alloc];
  suggestionsIconListModel = self->_suggestionsIconListModel;
  v6 = [v3 listLayoutProvider];
  v7 = [(SBDockIconListView *)v4 initWithModel:suggestionsIconListModel layoutProvider:v6 iconLocation:@"SBIconLocationFloatingDockSuggestions" orientation:1 iconViewProvider:self];

  [(SBIconListView *)v7 setIconViewConfigurationOptions:2];
  v8 = [v3 iconImageCache];
  [(SBIconListView *)v7 setIconImageCache:v8];

  v9 = [v3 folderIconImageCache];
  [(SBIconListView *)v7 setFolderIconImageCache:v9];

  [(SBIconListView *)v7 setAutomaticallyAdjustsLayoutMetricsToFit:0];
  [(SBFloatingDockSuggestionsViewController *)self setView:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  v11 = [WeakRetained currentDisplayItems];
  [(SBFloatingDockSuggestionsViewController *)self _loadAndPlaceIconsInViewForDisplayItems:v11];
}

- (void)dockViewWillBecomeVisible
{
  id v2 = [(SBFloatingDockSuggestionsViewController *)self listView];
  [v2 enumerateIconViewsUsingBlock:&__block_literal_global_116];
}

uint64_t __68__SBFloatingDockSuggestionsViewController_dockViewWillBecomeVisible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPaused:0 forReason:4];
}

- (void)dockViewWillResignVisible
{
  id v2 = [(SBFloatingDockSuggestionsViewController *)self listView];
  [v2 enumerateIconViewsUsingBlock:&__block_literal_global_24_0];
}

uint64_t __68__SBFloatingDockSuggestionsViewController_dockViewWillResignVisible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPaused:1 forReason:4];
}

- (void)dockViewDidResignVisible
{
  [(SBFloatingDockSuggestionsViewController *)self setVisible:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  [WeakRetained dockViewDidResignVisible];

  [(SBFloatingDockSuggestionsViewController *)self _performDeferredIconUpdates];
}

- (void)dockViewDidBecomeVisible
{
  [(SBFloatingDockSuggestionsViewController *)self setVisible:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  [WeakRetained dockViewDidBecomeVisible];
}

- (void)dockFolderWillBeginTransitioning
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  [WeakRetained beginPendingUpdatesForReason:@"Dock"];
}

- (void)dockFolderDidEndTransitioning
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  [WeakRetained endPendingUpdatesForReason:@"Dock"];
}

- (void)_performDeferredIconUpdates
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_deferredIconUpdates;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_deferredIconUpdates removeAllObjects];
}

- (void)_didChangeNumberOfIcons
{
  v3 = [(SBFloatingDockSuggestionsViewController *)self delegate];
  [v3 floatingDockSuggestionsViewControllerDidChangeNumberOfVisibleSuggestions:self];

  id v4 = [(SBFloatingDockSuggestionsViewController *)self floatingDockViewController];
  [v4 floatingDockSuggestionsViewControllerDidChangeNumberOfVisibleSuggestions:self];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  objc_msgSend(a4, "toLayoutState", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_effectiveEnvironmentMode = [v6 unlockedEnvironmentMode];
  if ([(SBFloatingDockSuggestionsViewController *)self _onHomescreen]) {
    [(SBFloatingDockSuggestionsViewController *)self _performDeferredIconUpdates];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  [WeakRetained beginPendingUpdatesForReason:@"Transitioning"];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  if ((objc_msgSend(a4, "isInterrupted", a3) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
    [WeakRetained endPendingUpdatesForReason:@"Transitioning"];
  }
}

- (void)_emitPresentedEventInvolvingContinuity:(BOOL)a3 fromModel:(id)a4 atIndex:(unint64_t)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = [a4 currentAppSuggestion];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4FA63C8] itemForContinuityInfo:v6];
      if (v7) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  v15[0] = *MEMORY[0x1E4FA74A8];
  long long v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v8, a4);
  v16[0] = v9;
  v15[1] = *MEMORY[0x1E4FA74A0];
  long long v10 = [NSNumber numberWithUnsignedInteger:a5];
  v16[1] = v10;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v12 = (void *)MEMORY[0x1E4FA5E78];
  id v13 = v11;
  id v14 = [v12 sharedInstance];
  [v14 emitEvent:17 withPayload:v13];
}

- (void)_performOrDefer:(BOOL)a3 iconUpdate:(id)a4
{
  if (a3)
  {
    deferredIconUpdates = self->_deferredIconUpdates;
    id v6 = (id)[a4 copy];
    [(NSMutableArray *)deferredIconUpdates addObject:v6];
  }
  else
  {
    uint64_t v5 = (void (*)(id))*((void *)a4 + 2);
    v5(a4);
  }
}

- (void)dockSuggestionsModel:(id)a3 didInsertItem:(id)a4 atIndex:(unint64_t)a5 involvesContinuity:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2048;
    unint64_t v26 = a5;
    _os_log_debug_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEBUG, "floating dock suggestions model: %@ did insert item: %@ at index: %lu", buf, 0x20u);
  }

  BOOL v13 = [(SBFloatingDockSuggestionsViewController *)self _shouldDeferUpdateInvolvingContinuity:v6];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didInsertItem_atIndex_involvesContinuity___block_invoke;
  void v16[3] = &unk_1E6AF7150;
  BOOL v20 = v6;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  unint64_t v19 = a5;
  id v14 = v11;
  id v15 = v10;
  [(SBFloatingDockSuggestionsViewController *)self _performOrDefer:v13 iconUpdate:v16];
}

void __105__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didInsertItem_atIndex_involvesContinuity___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _emitPresentedEventInvolvingContinuity:*(unsigned __int8 *)(a1 + 64) fromModel:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 56)];
  id v10 = [*(id *)(a1 + 32) listView];
  id v2 = [*(id *)(a1 + 32) _iconForDisplayItem:*(void *)(a1 + 48)];
  if (v2)
  {
    v3 = [v10 model];
    [v3 removeIcon:v2];
    unint64_t v4 = *(void *)(a1 + 56);
    if (v4 >= [v3 numberOfIcons]) {
      [v3 addIcon:v2];
    }
    else {
      id v5 = (id)[v3 insertIcon:v2 atIndex:v4];
    }
    BOOL v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = [v10 iconViewForIcon:v2];
      long long v9 = [*(id *)(a1 + 48) appSuggestion];
      [v8 setContinuityInfo:v9];
    }
    if ([*(id *)(a1 + 32) isVisible])
    {
      [*(id *)(a1 + 32) _fadeInIcon:v2 isReplacing:0 completion:0];
    }
    else
    {
      [v10 layoutIconsNow];
      [*(id *)(a1 + 32) _didChangeNumberOfIcons];
    }
  }
}

- (void)dockSuggestionsModel:(id)a3 didRemoveItem:(id)a4 atIndex:(unint64_t)a5 involvesContinuity:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2048;
    unint64_t v31 = a5;
    _os_log_debug_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEBUG, "floating dock suggestions model: %@ did remove old item: %@ at index: %lu", buf, 0x20u);
  }

  BOOL v13 = [(SBFloatingDockSuggestionsViewController *)self listView];
  if ([(NSMutableArray *)self->_deferredIconUpdates count]) {
    [(SBFloatingDockSuggestionsViewController *)self _performDeferredIconUpdates];
  }
  id v14 = [v13 model];
  if ([v14 numberOfIcons] <= a5)
  {
    id v15 = 0;
  }
  else
  {
    id v15 = [v14 iconAtIndex:a5];
    if (v15)
    {
      [v14 removeIcon:v15];
      if ([(SBFloatingDockSuggestionsViewController *)self isVisible])
      {
        id v16 = [v13 displayedIconViewForIcon:v15];
        id v17 = [v13 displayedIconViewForIcon:v15];
        [v17 continuityInfo];
        id v18 = v21 = v6;

        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __105__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didRemoveItem_atIndex_involvesContinuity___block_invoke;
        v22[3] = &unk_1E6AFD0F0;
        BOOL v25 = v21;
        id v23 = v16;
        id v24 = v18;
        id v19 = v18;
        id v20 = v16;
        [(SBFloatingDockSuggestionsViewController *)self _fadeOutIcon:v15 atIndex:a5 isReplacing:0 completion:v22];

LABEL_12:
        goto LABEL_13;
      }
      [v13 layoutIconsNow];
      [(SBFloatingDockSuggestionsViewController *)self _didChangeNumberOfIcons];
      if (v6)
      {
        id v20 = [v13 displayedIconViewForIcon:v15];
        [v20 setContinuityInfo:0];
        goto LABEL_12;
      }
    }
  }
LABEL_13:
}

void __105__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didRemoveItem_atIndex_involvesContinuity___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) continuityInfo];
    v3 = *(void **)(a1 + 40);

    if (v2 == v3)
    {
      unint64_t v4 = *(void **)(a1 + 32);
      [v4 setContinuityInfo:0];
    }
  }
}

- (void)dockSuggestionsModel:(id)a3 didReplaceItem:(id)a4 atIndex:(unint64_t)a5 withItem:(id)a6 atIndex:(unint64_t)a7 involvesContinuity:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = SBLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v16;
    __int16 v35 = 2048;
    unint64_t v36 = a7;
    _os_log_debug_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEBUG, "floating dock suggestions model: %@ did replace old item: %@ with new item: %@ at index: %lu", buf, 0x2Au);
  }

  BOOL v18 = [(SBFloatingDockSuggestionsViewController *)self _shouldDeferUpdateInvolvingContinuity:v8];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __123__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didReplaceItem_atIndex_withItem_atIndex_involvesContinuity___block_invoke;
  v22[3] = &unk_1E6AFF070;
  BOOL v28 = v8;
  void v22[4] = self;
  id v23 = v14;
  id v24 = v15;
  id v25 = v16;
  unint64_t v26 = a7;
  unint64_t v27 = a5;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  [(SBFloatingDockSuggestionsViewController *)self _performOrDefer:v18 iconUpdate:v22];
}

void __123__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didReplaceItem_atIndex_withItem_atIndex_involvesContinuity___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _emitPresentedEventInvolvingContinuity:*(unsigned __int8 *)(a1 + 80) fromModel:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 64)];
  id v2 = [*(id *)(a1 + 32) listView];
  v3 = [*(id *)(a1 + 32) _iconForDisplayItem:*(void *)(a1 + 48)];
  uint64_t v4 = [*(id *)(a1 + 32) _iconForDisplayItem:*(void *)(a1 + 56)];
  id v5 = (void *)v4;
  if (!v3)
  {
    BOOL v6 = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  BOOL v6 = [v2 displayedIconViewForIcon:v3];
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = [v2 displayedIconViewForIcon:v5];
  if (!*(unsigned char *)(a1 + 80)) {
    goto LABEL_12;
  }
LABEL_6:
  [v6 setContinuityInfo:0];
  BOOL v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [*(id *)(a1 + 56) appSuggestion];
    [v7 setContinuityInfo:v10];
  }
  if ([v3 isEqual:v5] && *(void *)(a1 + 72) == *(void *)(a1 + 64))
  {
    [v7 setAllowsCloseBox:0];
  }
  else
  {
LABEL_12:
    id v11 = [v2 model];
    id v12 = v11;
    if (v5 && [v11 directlyContainsIcon:v5])
    {
      [v12 removeIcon:v5];
      if ([*(id *)(a1 + 32) isVisible]) {
        [*(id *)(a1 + 32) _fadeOutIcon:v5 atIndex:*(void *)(a1 + 72) isReplacing:1 completion:0];
      }
      unint64_t v13 = *(void *)(a1 + 64);
      if (v13 <= [v12 numberOfIcons]) {
        id v19 = (id)[v12 insertIcon:v5 atIndex:*(void *)(a1 + 64)];
      }
      else {
        [v12 addIcon:v5];
      }
      if ([*(id *)(a1 + 32) isVisible]) {
        [*(id *)(a1 + 32) _fadeInIcon:v5 isReplacing:1 completion:0];
      }
      id v20 = [*(id *)(a1 + 40) currentDisplayItems];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      id v24 = __123__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didReplaceItem_atIndex_withItem_atIndex_involvesContinuity___block_invoke_2;
      id v25 = &unk_1E6AFF048;
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v29 = *(void *)(a1 + 64);
      uint64_t v26 = v21;
      id v27 = v12;
      id v28 = v2;
      [v20 enumerateObjectsUsingBlock:&v22];
    }
    else
    {
      int v14 = [*(id *)(a1 + 32) isVisible];
      if (v3)
      {
        if (v14)
        {
          [*(id *)(a1 + 32) _fadeOutIcon:v3 atIndex:*(void *)(a1 + 72) isReplacing:1 completion:0];
          unint64_t v15 = *(void *)(a1 + 64);
          if (v15 != *(void *)(a1 + 72) && v15 < [v12 numberOfIcons])
          {
            id v16 = [v12 iconAtIndex:*(void *)(a1 + 64)];
            [*(id *)(a1 + 32) _fadeOutIcon:v16 atIndex:*(void *)(a1 + 64) isReplacing:1 completion:0];
          }
        }
      }
      if (v5)
      {
        unint64_t v17 = *(void *)(a1 + 64);
        if (v17 >= [v12 numberOfIcons]) {
          [v12 addIcon:v5];
        }
        else {
          id v18 = (id)[v12 replaceIconAtIndex:v17 withIcon:v5 options:0];
        }
        [v2 layoutAndCreateIcon:v5 atIndex:v17];
        if ([*(id *)(a1 + 32) isVisible]) {
          [*(id *)(a1 + 32) _fadeInIcon:v5 isReplacing:1 completion:0];
        }
      }
    }
    objc_msgSend(v2, "layoutIconsNow", v22, v23, v24, v25, v26);
    [*(id *)(a1 + 32) _didChangeNumberOfIcons];
  }
}

uint64_t __123__SBFloatingDockSuggestionsViewController_dockSuggestionsModel_didReplaceItem_atIndex_withItem_atIndex_involvesContinuity___block_invoke_2(uint64_t result, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 56) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    unint64_t v4 = a3;
    id v5 = (id *)result;
    uint64_t v6 = [*(id *)(result + 32) _iconForDisplayItem:a2];
    if (v6)
    {
      uint64_t v10 = v6;
      if (objc_msgSend(v5[5], "indexForIcon:") != v4)
      {
        [v5[5] removeIcon:v10];
        unint64_t v7 = [v5[5] numberOfIcons];
        id v8 = v5[5];
        if (v7 <= v4)
        {
          [v8 addIcon:v10];
          unint64_t v4 = [v5[5] indexForIcon:v10];
        }
        else
        {
          id v9 = (id)[v8 replaceIconAtIndex:v4 withIcon:v10 options:0];
        }
        [v5[6] layoutAndCreateIcon:v10 atIndex:v4];
        if ([v5[4] isVisible]) {
          [v5[4] _fadeInIcon:v10 isReplacing:1 completion:0];
        }
      }
    }
    return MEMORY[0x1F4181820]();
  }
  return result;
}

- (void)dockSuggestionsModel:(id)a3 didReloadItems:(id)a4 withItems:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    __int16 v40 = 2112;
    id v41 = v10;
    _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "floating dock suggestions model: %@ did reload old items: %@ with new items: %@", buf, 0x20u);
  }

  if (([v9 isEqualToOrderedSet:v10] & 1) == 0)
  {
    id v27 = v9;
    [(SBFloatingDockSuggestionsViewController *)self _performDeferredIconUpdates];
    id v12 = [(SBFloatingDockSuggestionsViewController *)self listView];
    [v12 removeAllIconViews];
    uint64_t v29 = v12;
    id v30 = [v12 model];
    [v30 removeAllIcons];
    id v28 = v8;
    unint64_t v13 = [v8 currentAppSuggestion];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v20 = [(SBFloatingDockSuggestionsViewController *)self _iconForDisplayItem:v19];
          if (v20)
          {
            [v30 addIcon:v20];
            uint64_t v21 = [v13 bundleIdentifier];
            uint64_t v22 = [v19 bundleIdentifier];
            int v23 = [v21 isEqual:v22];

            if (v23)
            {
              id v24 = [v29 iconViewForIcon:v20];
              [v24 setContinuityInfo:v13];
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }

    [v29 layoutIconsNow];
    id v9 = v27;
    uint64_t v25 = [v27 count];
    if (v25 != [v14 count]) {
      [(SBFloatingDockSuggestionsViewController *)self _didChangeNumberOfIcons];
    }

    id v8 = v28;
    id v10 = v26;
  }
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationFloatingDockSuggestions"]
    && [(SBIconListModel *)self->_suggestionsIconListModel directlyContainsIcon:v6])
  {
    unint64_t v7 = [(SBFloatingDockSuggestionsViewController *)self listView];
    id v8 = [v7 displayedIconViewForIcon:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = -[SBFloatingDockSuggestionsViewController iconViewForIcon:location:](self, "iconViewForIcon:location:", v6, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12)
        {
          unint64_t v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  unint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockSuggestionsViewController *)self presentedIconLocations];
  id v6 = [v5 allObjects];
  id v7 = [(SBFloatingDockSuggestionsViewController *)self firstIconViewForIcon:v4 inLocations:v6];

  return v7;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return [(SBFloatingDockSuggestionsViewController *)self isDisplayingIcon:a3 inLocation:@"SBIconLocationFloatingDockSuggestions"];
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBFloatingDockSuggestionsViewController *)self presentedIconLocations];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [v9 minusSet:v6];
  uint64_t v10 = [v9 allObjects];
  id v11 = [(SBFloatingDockSuggestionsViewController *)self firstIconViewForIcon:v7 inLocations:v10];

  return v11;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationFloatingDockSuggestions"])
  {
    id v7 = [(SBFloatingDockSuggestionsViewController *)self listView];
    uint64_t v8 = [v7 model];
    char v9 = [v8 directlyContainsIcon:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[SBFloatingDockSuggestionsViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockSuggestionsViewController *)self listView];
  char v6 = [v5 isDisplayingIconView:v4];

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"SBIconLocationFloatingDockSuggestions"])
  {
    id v7 = [(SBFloatingDockSuggestionsViewController *)self listView];
    char v8 = [v7 isDisplayingIconView:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockSuggestionsViewController *)self listView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__SBFloatingDockSuggestionsViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E6AFF098;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateIconViewsUsingBlock:v7];
}

uint64_t __81__SBFloatingDockSuggestionsViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  uint64_t v9 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = [(SBFloatingDockSuggestionsViewController *)self listView];
  id v8 = [v7 displayedIconViewForIcon:v6];

  if (v8) {
    v9[2](v9, v8);
  }
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return [a3 isEqualToString:@"SBIconLocationFloatingDockSuggestions"];
}

- (NSSet)presentedIconLocations
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:@"SBIconLocationFloatingDockSuggestions"];
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  id v4 = [(SBFloatingDockSuggestionsViewController *)self iconViewProvider];
  id v5 = [v4 dequeueReusableIconViewOfClass:a3];

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockSuggestionsViewController *)self iconViewProvider];
  [v5 recycleIconView:v4];
}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockSuggestionsViewController *)self iconViewProvider];
  char v6 = [v5 isIconViewRecycled:v4];

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(SBFloatingDockSuggestionsViewController *)self iconViewProvider];
  [v7 configureIconView:v12 forIcon:v6];

  [v12 setIconContentScalingEnabled:1];
  [v12 setStartsDragMoreQuickly:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  uint64_t v9 = [WeakRetained currentAppSuggestion];

  uint64_t v10 = [v9 bundleIdentifier];
  id v11 = [v6 applicationBundleID];

  LODWORD(v6) = [v10 isEqualToString:v11];
  if (v6) {
    [v12 setContinuityInfo:v9];
  }
}

- (id)_iconForDisplayItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  id v6 = [(SBFloatingDockSuggestionsViewController *)self homeScreenContextProvider];
  id v7 = [v6 model];
  if ([v4 type] == 5)
  {
    id v8 = [v4 webClipIdentifier];
    uint64_t v9 = [v7 bookmarkIconForWebClipIdentifier:v8];
  }
  else
  {
    uint64_t v9 = [v7 applicationIconForBundleIdentifier:v5];
  }

  return v9;
}

- (void)_loadAndPlaceIconsInViewForDisplayItems:(id)a3
{
  id v4 = a3;
  id v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFloatingDockSuggestionsViewController _loadAndPlaceIconsInViewForDisplayItems:]((uint64_t)v4, v5);
  }

  id v6 = [(SBFloatingDockSuggestionsViewController *)self suggestionsModel];
  id v7 = [v6 currentAppSuggestion];

  id v8 = [(SBFloatingDockSuggestionsViewController *)self listView];
  uint64_t v9 = [v8 model];
  [v9 removeAllIcons];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__SBFloatingDockSuggestionsViewController__loadAndPlaceIconsInViewForDisplayItems___block_invoke;
  v13[3] = &unk_1E6AFF0C0;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  [v4 enumerateObjectsUsingBlock:v13];
}

void __83__SBFloatingDockSuggestionsViewController__loadAndPlaceIconsInViewForDisplayItems___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  id v5 = objc_msgSend(a1[4], "_iconForDisplayItem:");
  if (v5)
  {
    id v6 = (id)[a1[5] insertIcon:v5 atIndex:a3 options:0];
    [a1[6] layoutAndCreateIcon:v5 atIndex:a3];
    id v7 = [a1[7] bundleIdentifier];
    id v8 = [v11 bundleIdentifier];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      id v10 = [a1[6] iconViewForIcon:v5];
      [v10 setContinuityInfo:a1[7]];
    }
  }
}

- (BOOL)_shouldDeferUpdateInvolvingContinuity:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBFloatingDockSuggestionsViewController *)self isVisible];
  id v6 = [(UIViewController *)self _sbWindowScene];
  id v7 = [v6 switcherController];
  if ([v7 isChamoisWindowingUIEnabled]) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = v5 & ~(v3 | [(SBFloatingDockSuggestionsViewController *)self _onHomescreen]);
  }

  return v8;
}

- (BOOL)_onHomescreen
{
  return self->_effectiveEnvironmentMode == 1;
}

- (void)_iconModelDidChange:(id)a3
{
  id v8 = [(SBFloatingDockSuggestionsViewController *)self homeScreenContextProvider];
  id v4 = [v8 iconManager];
  BOOL v5 = [(SBFloatingDockSuggestionsViewController *)self listView];
  id v6 = [v4 iconImageCache];
  [v5 setIconImageCache:v6];

  id v7 = [v4 folderIconImageCache];
  [v5 setFolderIconImageCache:v7];
}

- (void)_listLayoutDidChange:(id)a3
{
  id v9 = [(SBFloatingDockSuggestionsViewController *)self homeScreenContextProvider];
  id v4 = [v9 iconManager];
  BOOL v5 = [(SBFloatingDockSuggestionsViewController *)self listView];
  id v6 = [v4 listLayoutProvider];
  [v5 setLayoutProvider:v6];

  id v7 = [v4 iconImageCache];
  [v5 setIconImageCache:v7];

  id v8 = [v4 folderIconImageCache];
  [v5 setFolderIconImageCache:v8];

  [v5 layoutIconsNow];
}

- (void)_fadeOutIcon:(id)a3 atIndex:(unint64_t)a4 isReplacing:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(SBFloatingDockSuggestionsViewController *)self listView];
  unint64_t v13 = [v12 icons];
  id v14 = [v12 iconViewForIcon:v11];

  [v14 setIconImageAndAccessoryAlpha:0.0];
  id v15 = [v14 matchingIconViewByAddingConfigurationOptions:4 removingConfigurationOptions:0];
  [v14 frame];
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  objc_msgSend(v15, "setFrame:");
  [v12 addSubview:v15];
  [v15 setIconImageAndAccessoryAlpha:1.0];
  [v14 iconContentScale];
  double v25 = v24;
  int v26 = [v14 isShowingContextMenu];
  double v27 = 1.15;
  if (!v26) {
    double v27 = 1.0;
  }
  [v15 setIconContentScale:v25 * v27];
  [v15 layoutIfNeeded];
  id v28 = (void *)MEMORY[0x1E4F42FF0];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __87__SBFloatingDockSuggestionsViewController__fadeOutIcon_atIndex_isReplacing_completion___block_invoke;
  v38[3] = &unk_1E6AFA7E8;
  BOOL v48 = a5;
  id v39 = v15;
  __int16 v40 = self;
  id v42 = v12;
  unint64_t v43 = a4;
  id v41 = v13;
  uint64_t v44 = v17;
  uint64_t v45 = v19;
  uint64_t v46 = v21;
  uint64_t v47 = v23;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __87__SBFloatingDockSuggestionsViewController__fadeOutIcon_atIndex_isReplacing_completion___block_invoke_2;
  v34[3] = &unk_1E6AFA2A0;
  id v35 = v39;
  id v36 = v14;
  id v37 = v10;
  id v29 = v10;
  id v30 = v14;
  id v31 = v39;
  id v32 = v12;
  id v33 = v13;
  [v28 animateWithDuration:v38 animations:v34 completion:0.5];
}

uint64_t __87__SBFloatingDockSuggestionsViewController__fadeOutIcon_atIndex_isReplacing_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIconContentScale:0.01];
  if (!*(unsigned char *)(a1 + 104))
  {
    [*(id *)(a1 + 40) _didChangeNumberOfIcons];
    unint64_t v2 = *(void *)(a1 + 64);
    if (v2 >= [*(id *)(a1 + 48) count])
    {
      [*(id *)(a1 + 56) bounds];
      double MaxX = CGRectGetMaxX(v18);
    }
    else
    {
      id v4 = *(void **)(a1 + 56);
      uint64_t v3 = *(void *)(a1 + 64);
      if (v3)
      {
        BOOL v5 = [*(id *)(a1 + 48) objectAtIndex:v3 - 1];
        id v6 = [v4 iconViewForIcon:v5];
        [v6 frame];
        double v8 = v7;

        id v9 = *(void **)(a1 + 56);
        id v10 = [*(id *)(a1 + 48) objectAtIndex:*(void *)(a1 + 64)];
        id v11 = [v9 iconViewForIcon:v10];
        [v11 frame];
        double v13 = v12;

        double MaxX = v8 + (v13 - v8) * 0.5;
      }
      else
      {
        [*(id *)(a1 + 56) bounds];
        double MaxX = CGRectGetMinX(v19);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", MaxX + *(double *)(a1 + 88) * -0.5, *(double *)(a1 + 80));
  }
  id v15 = *(void **)(a1 + 32);
  return [v15 setIconImageAndAccessoryAlpha:0.0];
}

uint64_t __87__SBFloatingDockSuggestionsViewController__fadeOutIcon_atIndex_isReplacing_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) setIconImageAndAccessoryAlpha:1.0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_fadeInIcon:(id)a3 isReplacing:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SBFloatingDockSuggestionsViewController *)self listView];
  id v11 = [v10 icons];
  unint64_t v12 = [v11 indexOfObject:v9];
  [v10 layoutAndCreateIcon:v9 atIndex:v12];
  double v13 = [v10 iconViewForIcon:v9];

  if (![v11 count] || v12 >= objc_msgSend(v11, "count") - 1)
  {
    [v10 bounds];
    double MaxX = CGRectGetMaxX(v36);
LABEL_6:
    double v22 = MaxX;
    goto LABEL_7;
  }
  if (!v12)
  {
    [v10 bounds];
    double MaxX = CGRectGetMinX(v37);
    goto LABEL_6;
  }
  id v14 = [v11 objectAtIndex:v12 - 1];
  id v15 = [v11 objectAtIndex:v12 + 1];
  uint64_t v16 = [v10 iconViewForIcon:v14];
  [v16 frame];
  double v18 = v17;

  CGRect v19 = [v10 iconViewForIcon:v15];
  [v19 frame];
  double v21 = v20;

  double v22 = v18 + (v21 - v18) * 0.5;
LABEL_7:
  [v13 frame];
  [v13 setFrame:v22 - v24 * 0.5];
  [v13 setIconImageAndAccessoryAlpha:0.0];
  [v13 setIconContentScale:0.01];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __78__SBFloatingDockSuggestionsViewController__fadeInIcon_isReplacing_completion___block_invoke;
  v33[3] = &unk_1E6AFF0E8;
  id v35 = v8;
  id v25 = v13;
  id v34 = v25;
  id v26 = v8;
  double v27 = (void *)MEMORY[0x1D948C7A0](v33);
  [v25 setDisallowCursorInteraction:1];
  id v28 = (void *)MEMORY[0x1E4F42FF0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __78__SBFloatingDockSuggestionsViewController__fadeInIcon_isReplacing_completion___block_invoke_2;
  v30[3] = &unk_1E6AF5770;
  BOOL v32 = a4;
  v30[4] = self;
  id v31 = v25;
  id v29 = v25;
  [v28 animateWithDuration:v30 animations:v27 completion:0.5];
}

uint64_t __78__SBFloatingDockSuggestionsViewController__fadeInIcon_isReplacing_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setDisallowCursorInteraction:0];
}

uint64_t __78__SBFloatingDockSuggestionsViewController__fadeInIcon_isReplacing_completion___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _didChangeNumberOfIcons];
  }
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) listView];
  [v3 iconContentScale];
  objc_msgSend(v2, "setIconContentScale:");

  id v4 = *(void **)(a1 + 40);
  return [v4 setIconImageAndAccessoryAlpha:1.0];
}

- (SBFloatingDockViewController)floatingDockViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingDockViewController);
  return (SBFloatingDockViewController *)WeakRetained;
}

- (void)setFloatingDockViewController:(id)a3
{
}

- (SBFloatingDockSuggestionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFloatingDockSuggestionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)numberOfRecents
{
  return self->_numberOfRecents;
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

- (SBAppSuggestionManager)appSuggestionManager
{
  return self->_appSuggestionManager;
}

- (SBIconListModel)suggestionsIconListModel
{
  return self->_suggestionsIconListModel;
}

- (SBFloatingDockSuggestionsModel)suggestionsModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsModel);
  return (SBFloatingDockSuggestionsModel *)WeakRetained;
}

- (NSMutableArray)deferredIconUpdates
{
  return self->_deferredIconUpdates;
}

- (void)setDeferredIconUpdates:(id)a3
{
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  return (SBLayoutStateTransitionCoordinator *)WeakRetained;
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
}

- (int64_t)effectiveEnvironmentMode
{
  return self->_effectiveEnvironmentMode;
}

- (void)setEffectiveEnvironmentMode:(int64_t)a3
{
  self->_effectiveEnvironmentMode = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_destroyWeak((id *)&self->_layoutStateTransitionCoordinator);
  objc_storeStrong((id *)&self->_deferredIconUpdates, 0);
  objc_destroyWeak((id *)&self->_suggestionsModel);
  objc_storeStrong((id *)&self->_suggestionsIconListModel, 0);
  objc_storeStrong((id *)&self->_appSuggestionManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_destroyWeak((id *)&self->_homeScreenContextProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_floatingDockViewController);
}

- (void)_loadAndPlaceIconsInViewForDisplayItems:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "floating dock suggestions view load display items: %@", (uint8_t *)&v2, 0xCu);
}

@end