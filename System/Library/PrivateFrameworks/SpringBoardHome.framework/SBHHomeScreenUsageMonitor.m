@interface SBHHomeScreenUsageMonitor
- (BOOL)currentPageIndexDidChangeWhileScrolling;
- (BOOL)delayedLayoutDidChangeNotification;
- (BOOL)isContentVisible;
- (NSString)description;
- (SBFolderController)rootFolderController;
- (SBHHomeScreenUsageMonitor)initWithIconManager:(id)a3;
- (SBHIconManager)iconManager;
- (SBHIconModel)iconModel;
- (SBRootFolder)rootFolder;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)homeScreenDisappearanceReasons;
- (unint64_t)listModelIndexForRootFolderController:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5;
- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)iconManagerDidChangeIconModel:(id)a3;
- (void)iconManagerDidChangeRootViewController:(id)a3;
- (void)iconManagerEditingDidChange:(id)a3;
- (void)iconModelDidLayOut:(id)a3;
- (void)leafIcon:(id)a3 didAddIconDataSource:(id)a4;
- (void)leafIcon:(id)a3 didChangeActiveDataSource:(id)a4;
- (void)leafIcon:(id)a3 didRemoveIconDataSource:(id)a4;
- (void)noteAddWidgetSheetWillPresent;
- (void)noteCurrentPageIndexChanged:(unint64_t)a3;
- (void)noteEditingModeEntered;
- (void)noteIconManagerContentOccludedChanged;
- (void)noteIconManagerCoverSheetTodayViewDidAppear;
- (void)noteIconManagerCoverSheetTodayViewDidDisappear;
- (void)noteIconManagerListLayoutProviderChanged;
- (void)noteIconManagerOverlayTodayViewDidAppear;
- (void)noteIconManagerOverlayTodayViewDidDisappear;
- (void)noteIconManagerRootFolderControllerViewDidDisappear;
- (void)noteIconManagerRootFolderControllerViewWillAppear;
- (void)noteIconManagerTodayViewAtLocation:(int64_t)a3 didScrollToRevealIcons:(id)a4;
- (void)noteLayoutChanged;
- (void)noteUserAddedWidgetIconStackSuggestion:(id)a3;
- (void)noteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a3;
- (void)noteUserDislikedWidgetIconStackSuggestion:(id)a3;
- (void)noteUserTappedWidgetIcon:(id)a3 withURL:(id)a4;
- (void)noteWidgetDiscoverabilityDidAcceptSuggestion:(id)a3;
- (void)noteWidgetDiscoverabilityDidEnterEditingMode;
- (void)noteWidgetDiscoverabilityDidRejectSuggestion:(id)a3;
- (void)noteWidgetDiscoverabilityStarted;
- (void)noteWidgetIconAdded:(id)a3;
- (void)noteWidgetIconRemoved:(id)a3;
- (void)noteWidgetIconStack:(id)a3 changedActiveWidget:(id)a4;
- (void)notifyForEveryHomeScreenWidgetVisibility;
- (void)notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:(BOOL)a3;
- (void)notifyRootFolderControllerViewWillAppear;
- (void)removeObserver:(id)a3;
- (void)resetIconModel;
- (void)resetRootFolderController;
- (void)rootFolderControllerCurrentPageIndexDidChange:(id)a3;
- (void)rootFolderControllerDidEndScrolling:(id)a3;
- (void)setCurrentPageIndexDidChangeWhileScrolling:(BOOL)a3;
- (void)setDelayedLayoutDidChangeNotification:(BOOL)a3;
- (void)setHomeScreenDisappearanceReasons:(unint64_t)a3;
- (void)setIconModel:(id)a3;
- (void)setRootFolder:(id)a3;
- (void)setRootFolderController:(id)a3;
- (void)updateVisibilityReasons;
- (void)updateVisibleWidgetIcons;
@end

@implementation SBHHomeScreenUsageMonitor

void __53__SBHHomeScreenUsageMonitor_updateVisibleWidgetIcons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isWidgetIcon])
  {
    [v3 addObserver:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)rootFolderControllerDidEndScrolling:(id)a3
{
  id v4 = a3;
  v5 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "root folder controller did end scrolling", v7, 2u);
  }

  if ([(SBHHomeScreenUsageMonitor *)self currentPageIndexDidChangeWhileScrolling])
  {
    v6 = [v4 object];
    [(SBHHomeScreenUsageMonitor *)self noteCurrentPageIndexChanged:[(SBHHomeScreenUsageMonitor *)self listModelIndexForRootFolderController:v6]];
    [(SBHHomeScreenUsageMonitor *)self setCurrentPageIndexDidChangeWhileScrolling:0];
  }
}

- (void)rootFolderControllerCurrentPageIndexDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  BOOL v5 = [(SBFolderController *)self->_rootFolderController isScrolling];
  v6 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "root folder controller current page index did change (scrolling: %{BOOL}u)", (uint8_t *)v7, 8u);
  }

  if (v5) {
    [(SBHHomeScreenUsageMonitor *)self setCurrentPageIndexDidChangeWhileScrolling:1];
  }
  else {
    [(SBHHomeScreenUsageMonitor *)self noteCurrentPageIndexChanged:[(SBHHomeScreenUsageMonitor *)self listModelIndexForRootFolderController:v4]];
  }
}

- (void)setCurrentPageIndexDidChangeWhileScrolling:(BOOL)a3
{
  self->_currentPageIndexDidChangeWhileScrolling = a3;
}

- (void)noteCurrentPageIndexChanged:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteCurrentPageIndexChanged:", self, a3, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(SBHHomeScreenUsageMonitor *)self updateVisibleWidgetIcons];
}

- (unint64_t)listModelIndexForRootFolderController:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_msgSend(v3, "iconListModelIndexForPageIndex:", objc_msgSend(v3, "currentPageIndex"));

  return v4;
}

- (BOOL)currentPageIndexDidChangeWhileScrolling
{
  return self->_currentPageIndexDidChangeWhileScrolling;
}

- (void)noteIconManagerRootFolderControllerViewDidDisappear
{
  id v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Root folder controller view did disappear", v4, 2u);
  }

  [(SBHHomeScreenUsageMonitor *)self updateVisibilityReasons];
}

- (void)noteIconManagerContentOccludedChanged
{
  id v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Icon manager content occluded changed", v4, 2u);
  }

  [(SBHHomeScreenUsageMonitor *)self updateVisibilityReasons];
}

- (void)updateVisibilityReasons
{
  id v7 = [(SBHHomeScreenUsageMonitor *)self iconManager];
  if ([v7 contentVisibility]
    || ([v7 isOverlayTodayViewVisible] & 1) != 0
    || [v7 isMainDisplayLibraryViewVisible])
  {
    id v3 = v7;
    uint64_t v4 = 2;
  }
  else
  {
    id v3 = v7;
    uint64_t v4 = 0;
  }
  BOOL v5 = [v3 rootViewController];
  BOOL v6 = [v5 _appearState] == 0;

  [(SBHHomeScreenUsageMonitor *)self setHomeScreenDisappearanceReasons:v4 | v6];
}

- (void)setHomeScreenDisappearanceReasons:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v5 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    unint64_t v8 = a3;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "Set widget disappearance reasons: %lx", (uint8_t *)&v7, 0xCu);
  }

  unint64_t homeScreenDisappearanceReasons = self->_homeScreenDisappearanceReasons;
  if (homeScreenDisappearanceReasons != a3)
  {
    self->_unint64_t homeScreenDisappearanceReasons = a3;
    if ((a3 == 0) == (homeScreenDisappearanceReasons != 0)) {
      [(SBHHomeScreenUsageMonitor *)self notifyForEveryHomeScreenWidgetVisibility];
    }
  }
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void)updateVisibleWidgetIcons
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBHHomeScreenUsageMonitor *)self rootFolderController];
  uint64_t v4 = [v3 currentIconListModel];
  BOOL v5 = [(SBHHomeScreenUsageMonitor *)self isContentVisible];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __53__SBHHomeScreenUsageMonitor_updateVisibleWidgetIcons__block_invoke;
  v58[3] = &unk_1E6AB0B58;
  v58[4] = self;
  id v41 = v6;
  id v59 = v41;
  [v4 enumerateIconsUsingBlock:v58];
  int v7 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    visibleHomeScreenWidgetIcons = self->_visibleHomeScreenWidgetIcons;
    *(_DWORD *)buf = 138412802;
    v65 = visibleHomeScreenWidgetIcons;
    __int16 v66 = 2112;
    id v67 = v41;
    __int16 v68 = 1024;
    BOOL v69 = v5;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "update visible widget icons. old set: %@, new set: %@ (content visible: %{BOOL}u)", buf, 0x1Cu);
  }

  if (v5)
  {
    v33 = v4;
    v34 = v3;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = self->_visibleHomeScreenWidgetIcons;
    uint64_t v9 = [(NSMutableSet *)obj countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v55;
      uint64_t v35 = *(void *)v55;
      do
      {
        uint64_t v12 = 0;
        uint64_t v37 = v10;
        do
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(obj);
          }
          long long v13 = *(void **)(*((void *)&v54 + 1) + 8 * v12);
          if ((objc_msgSend(v41, "containsObject:", v13, v33, v34) & 1) == 0)
          {
            long long v14 = [v13 activeDataSource];
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            v15 = self->_observers;
            uint64_t v16 = [(NSHashTable *)v15 countByEnumeratingWithState:&v50 objects:v62 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v51;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v51 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                  if (objc_opt_respondsToSelector()) {
                    [v20 homeScreenUsageAggregator:self didNoteDataSourceDidDisappear:v14 forWidgetIcon:v13];
                  }
                }
                uint64_t v17 = [(NSHashTable *)v15 countByEnumeratingWithState:&v50 objects:v62 count:16];
              }
              while (v17);
            }

            uint64_t v11 = v35;
            uint64_t v10 = v37;
          }
          ++v12;
        }
        while (v12 != v10);
        uint64_t v10 = [(NSMutableSet *)obj countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v10);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obja = v41;
    uint64_t v21 = [obja countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v47;
      uint64_t v36 = *(void *)v47;
      do
      {
        uint64_t v24 = 0;
        uint64_t v38 = v22;
        do
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(obja);
          }
          v25 = *(void **)(*((void *)&v46 + 1) + 8 * v24);
          if ((-[NSMutableSet containsObject:](self->_visibleHomeScreenWidgetIcons, "containsObject:", v25, v33, v34) & 1) == 0)
          {
            v26 = [v25 activeDataSource];
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            v27 = self->_observers;
            uint64_t v28 = [(NSHashTable *)v27 countByEnumeratingWithState:&v42 objects:v60 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v43;
              do
              {
                for (uint64_t j = 0; j != v29; ++j)
                {
                  if (*(void *)v43 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  v32 = *(void **)(*((void *)&v42 + 1) + 8 * j);
                  if (objc_opt_respondsToSelector()) {
                    [v32 homeScreenUsageAggregator:self didNoteDataSourceDidAppear:v26 forWidgetIcon:v25];
                  }
                }
                uint64_t v29 = [(NSHashTable *)v27 countByEnumeratingWithState:&v42 objects:v60 count:16];
              }
              while (v29);
            }

            uint64_t v23 = v36;
            uint64_t v22 = v38;
          }
          ++v24;
        }
        while (v24 != v22);
        uint64_t v22 = [obja countByEnumeratingWithState:&v46 objects:v61 count:16];
      }
      while (v22);
    }

    uint64_t v4 = v33;
    id v3 = v34;
  }
  -[NSMutableSet setSet:](self->_visibleHomeScreenWidgetIcons, "setSet:", v41, v33, v34);
}

- (void)notifyForEveryHomeScreenWidgetVisibility
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHHomeScreenUsageMonitor *)self isContentVisible];
  uint64_t v4 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (v3) {
      BOOL v5 = @"visible";
    }
    else {
      BOOL v5 = @"gone";
    }
    uint64_t v6 = [(NSMutableSet *)self->_visibleHomeScreenWidgetIcons count];
    *(_DWORD *)buf = 138543618;
    v31 = v5;
    __int16 v32 = 2048;
    uint64_t v33 = v6;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "notifying that all home screen widgets are %{public}@: (%lu widgets)", buf, 0x16u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = self->_visibleHomeScreenWidgetIcons;
  uint64_t v18 = [(NSMutableSet *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v7;
        unint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
        uint64_t v9 = [v8 activeDataSource];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = self->_observers;
        uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
                if (v3) {
                  [v15 homeScreenUsageAggregator:self didNoteDataSourceDidAppear:v9 forWidgetIcon:v8];
                }
                else {
                  [v15 homeScreenUsageAggregator:self didNoteDataSourceDidDisappear:v9 forWidgetIcon:v8];
                }
              }
            }
            uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v12);
        }

        uint64_t v7 = v19 + 1;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [(NSMutableSet *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }
}

- (BOOL)isContentVisible
{
  return [(SBHHomeScreenUsageMonitor *)self homeScreenDisappearanceReasons] == 0;
}

- (unint64_t)homeScreenDisappearanceReasons
{
  return self->_homeScreenDisappearanceReasons;
}

- (SBFolderController)rootFolderController
{
  return self->_rootFolderController;
}

- (SBHHomeScreenUsageMonitor)initWithIconManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHHomeScreenUsageMonitor;
  BOOL v5 = [(SBHHomeScreenUsageMonitor *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel_iconManagerDidChangeIconModel_ name:@"SBHIconManagerIconModelDidChange" object:v4];
    [v7 addObserver:v6 selector:sel_iconManagerDidChangeRootViewController_ name:@"SBHIconManagerRootViewControllerDidChange" object:v4];
    [v7 addObserver:v6 selector:sel_iconManagerEditingDidChange_ name:@"SBHIconManagerEditingStateChanged" object:v4];
    unint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    visibleHomeScreenWidgetIcons = v6->_visibleHomeScreenWidgetIcons;
    v6->_visibleHomeScreenWidgetIcons = v8;

    v6->_unint64_t homeScreenDisappearanceReasons = 1;
    [(SBHHomeScreenUsageMonitor *)v6 resetIconModel];
    [(SBHHomeScreenUsageMonitor *)v6 resetRootFolderController];
  }
  return v6;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBHHomeScreenUsageMonitor;
  [(SBHHomeScreenUsageMonitor *)&v4 dealloc];
}

- (void)resetIconModel
{
  id v4 = [(SBHHomeScreenUsageMonitor *)self iconManager];
  BOOL v3 = [v4 iconModel];
  [(SBHHomeScreenUsageMonitor *)self setIconModel:v3];
}

- (void)setIconModel:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (SBHIconModel *)a3;
  uint64_t v6 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "Set icon model: %@", buf, 0xCu);
  }

  if (self->_iconModel != v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    unint64_t v8 = v7;
    if (self->_iconModel)
    {
      objc_msgSend(v7, "removeObserver:name:object:", self, @"SBIconModelDidLayoutIconStateNotification");
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      iconModel = self->_iconModel;
      uint64_t v10 = self;
      objc_super v11 = [(SBHIconModel *)iconModel iconsOfClass:v10];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * i) removeObserver:self];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v13);
      }
    }
    objc_storeStrong((id *)&self->_iconModel, a3);
    [(SBHHomeScreenUsageMonitor *)self updateVisibleWidgetIcons];
    if (v5)
    {
      [v8 addObserver:self selector:sel_iconModelDidLayOut_ name:@"SBIconModelDidLayoutIconStateNotification" object:v5];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v16 = self;
      uint64_t v17 = -[SBHIconModel iconsOfClass:](v5, "iconsOfClass:", v16, 0);

      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * j) addObserver:self];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v19);
      }
    }
  }
  long long v22 = [(SBHIconModel *)v5 rootFolder];
  [(SBHHomeScreenUsageMonitor *)self setRootFolder:v22];
}

- (void)setRootFolder:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (SBRootFolder *)a3;
  uint64_t v6 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "Set root folder: %@", (uint8_t *)&v8, 0xCu);
  }

  rootFolder = self->_rootFolder;
  if (rootFolder != v5)
  {
    [(SBFolder *)rootFolder removeFolderObserver:self];
    objc_storeStrong((id *)&self->_rootFolder, a3);
    [(SBFolder *)self->_rootFolder addFolderObserver:self];
  }
}

- (void)resetRootFolderController
{
  id v4 = [(SBHHomeScreenUsageMonitor *)self iconManager];
  BOOL v3 = [v4 rootFolderController];
  [(SBHHomeScreenUsageMonitor *)self setRootFolderController:v3];
}

- (void)setRootFolderController:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (SBFolderController *)a3;
  uint64_t v6 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "Set root folder controller: %@", (uint8_t *)&v8, 0xCu);
  }

  if (self->_rootFolderController != v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:@"SBFolderControllerCurrentPageIndexDidChangeNotification" object:self->_rootFolderController];
    [v7 removeObserver:self name:@"SBFolderControllerDidEndScrollingNotification" object:self->_rootFolderController];
    objc_storeStrong((id *)&self->_rootFolderController, a3);
    [(SBHHomeScreenUsageMonitor *)self updateVisibleWidgetIcons];
    if (v5)
    {
      [v7 addObserver:self selector:sel_rootFolderControllerCurrentPageIndexDidChange_ name:@"SBFolderControllerCurrentPageIndexDidChangeNotification" object:v5];
      [v7 addObserver:self selector:sel_rootFolderControllerDidEndScrolling_ name:@"SBFolderControllerDidEndScrollingNotification" object:v5];
    }
  }
}

- (void)noteIconManagerListLayoutProviderChanged
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Icon manager list layout provider changed", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "homeScreenUsageAggregatorDidNoteListLayoutProviderChanged:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)noteIconManagerRootFolderControllerViewWillAppear
{
  BOOL v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Root folder controller view will appear", v4, 2u);
  }

  [(SBHHomeScreenUsageMonitor *)self updateVisibilityReasons];
  [(SBHHomeScreenUsageMonitor *)self notifyRootFolderControllerViewWillAppear];
}

- (void)notifyRootFolderControllerViewWillAppear
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHHomeScreenUsageMonitor *)self rootFolderController];
  unint64_t v4 = [(SBHHomeScreenUsageMonitor *)self listModelIndexForRootFolderController:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteRootControllerWillAppearWithPageIndex:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)noteIconManagerCoverSheetTodayViewDidAppear
{
  BOOL v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Cover sheet today view did appear", v4, 2u);
  }

  [(SBHHomeScreenUsageMonitor *)self notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:1];
}

- (void)noteIconManagerCoverSheetTodayViewDidDisappear
{
  BOOL v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Cover sheet today view did disappear", v4, 2u);
  }

  [(SBHHomeScreenUsageMonitor *)self notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:1];
}

- (void)noteIconManagerOverlayTodayViewDidAppear
{
  BOOL v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Overlay today view did appear", v4, 2u);
  }

  [(SBHHomeScreenUsageMonitor *)self updateVisibilityReasons];
  [(SBHHomeScreenUsageMonitor *)self notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:0];
}

- (void)noteIconManagerOverlayTodayViewDidDisappear
{
  BOOL v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Overlay today view did disappear", v4, 2u);
  }

  [(SBHHomeScreenUsageMonitor *)self updateVisibilityReasons];
  [(SBHHomeScreenUsageMonitor *)self notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:0];
}

- (void)noteIconManagerTodayViewAtLocation:(int64_t)a3 didScrollToRevealIcons:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "Overlay today view did scroll to reveal icons", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = self->_observers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "homeScreenUsageAggregator:didNoteTodayViewAtLocation:scrolledWithIconVisibility:", self, a3, v6, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)noteWidgetDiscoverabilityStarted
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Widget discoverability started", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "homeScreenUsageAggregatorDidStartDiscoveringWidgets:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)noteWidgetDiscoverabilityDidAcceptSuggestion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "Widget discoverability suggestions accepted", buf, 2u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "homeScreenUsageAggregator:widgetDiscoverabilityDidAcceptSuggestion:", self, v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)noteWidgetDiscoverabilityDidRejectSuggestion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "Widget discoverability suggestions rejected", buf, 2u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "homeScreenUsageAggregator:widgetDiscoverabilityDidRejectSuggestion:", self, v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)noteWidgetDiscoverabilityDidEnterEditingMode
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Widget discoverability entering editing mode", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "homeScreenUsageAggregatorWidgetDiscoverabilityDidEnterEditingMode:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)noteAddWidgetSheetWillPresent
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Add Widget sheet will present", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "homeScreenUsageAggregatorAddWidgetSheetWillPresent:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)iconManagerDidChangeIconModel:(id)a3
{
  id v4 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "icon manager did change icon model", v5, 2u);
  }

  [(SBHHomeScreenUsageMonitor *)self resetIconModel];
}

- (void)iconManagerDidChangeRootViewController:(id)a3
{
  id v4 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "icon manager did change root view controller", v5, 2u);
  }

  [(SBHHomeScreenUsageMonitor *)self resetRootFolderController];
}

- (void)iconManagerEditingDidChange:(id)a3
{
  id v4 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_INFO, "icon manager editing did change", v6, 2u);
  }

  if ([(SBHHomeScreenUsageMonitor *)self delayedLayoutDidChangeNotification])
  {
    [(SBHHomeScreenUsageMonitor *)self setDelayedLayoutDidChangeNotification:0];
    [(SBHHomeScreenUsageMonitor *)self noteLayoutChanged];
  }
  uint64_t v5 = [(SBHHomeScreenUsageMonitor *)self iconManager];
  if ([v5 isEditing]) {
    [(SBHHomeScreenUsageMonitor *)self noteEditingModeEntered];
  }
}

- (void)iconModelDidLayOut:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "icon model did lay out", v8, 2u);
  }

  uint64_t v6 = [v4 object];

  uint64_t v7 = [v6 rootFolder];
  [(SBHHomeScreenUsageMonitor *)self setRootFolder:v7];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)noteLayoutChanged
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHHomeScreenUsageMonitor *)self iconManager];
  int v4 = [v3 isEditing];

  if (v4)
  {
    [(SBHHomeScreenUsageMonitor *)self setDelayedLayoutDidChangeNotification:1];
  }
  else
  {
    uint64_t v5 = SBLogHomeScreenUsageMonitor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "notifying for home screen layout change", buf, 2u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_observers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v11, "homeScreenUsageAggregatorDidNoteHomeScreenLayoutChanged:", self, (void)v12);
          }
        }
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)noteEditingModeEntered
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "homeScreenUsageAggregatorDidNoteEditingModeEntered:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)noteWidgetIconAdded:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 addObserver:self];
  long long v15 = [v4 activeDataSource];
  BOOL v5 = [(SBHHomeScreenUsageMonitor *)self isContentVisible];
  uint64_t v6 = [(SBHHomeScreenUsageMonitor *)self iconManager];
  int v7 = [v6 isDisplayingIcon:v4];

  if (v7) {
    [(NSMutableSet *)self->_visibleHomeScreenWidgetIcons addObject:v4];
  }
  uint64_t v8 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v4;
    __int16 v23 = 1024;
    int v24 = v7;
    __int16 v25 = 1024;
    BOOL v26 = v5;
    _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_INFO, "notifying for added widget icon %@ (icon visible: %{BOOL}u, content visible: %{BOOL}u)", buf, 0x18u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v9 = self->_observers;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v14 homeScreenUsageAggregator:self didNoteWidgetIconAdded:v4];
        }
        if (v5 & v7) != 0 && (objc_opt_respondsToSelector()) {
          [v14 homeScreenUsageAggregator:self didNoteDataSourceDidAppear:v15 forWidgetIcon:v4];
        }
      }
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)noteWidgetIconRemoved:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 removeObserver:self];
  uint64_t v14 = [v4 activeDataSource];
  BOOL v5 = [(SBHHomeScreenUsageMonitor *)self isContentVisible];
  int v6 = [(NSMutableSet *)self->_visibleHomeScreenWidgetIcons containsObject:v4];
  [(NSMutableSet *)self->_visibleHomeScreenWidgetIcons removeObject:v4];
  int v7 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v4;
    __int16 v22 = 1024;
    int v23 = v6;
    __int16 v24 = 1024;
    BOOL v25 = v5;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "notifying for removed widget icon %@ (icon visible: %{BOOL}u, content visible: %{BOOL}u)", buf, 0x18u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_observers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v13 homeScreenUsageAggregator:self didNoteWidgetIconRemoved:v4];
        }
        if (v5 & v6) != 0 && (objc_opt_respondsToSelector()) {
          [v13 homeScreenUsageAggregator:self didNoteDataSourceDidDisappear:v14 forWidgetIcon:v4];
        }
      }
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)noteWidgetIconStack:(id)a3 changedActiveWidget:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  uint64_t v26 = [v6 activeDataSource];
  BOOL v7 = [(SBHHomeScreenUsageMonitor *)self isContentVisible];
  long long v28 = v6;
  int v8 = v7 & [(NSMutableSet *)self->_visibleHomeScreenWidgetIcons containsObject:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  id v24 = WeakRetained;
  if ([WeakRetained isOverlayCoverSheetTodayViewVisible]) {
    int v10 = 1;
  }
  else {
    int v10 = objc_msgSend(WeakRetained, "isOverlayTodayViewVisible", WeakRetained);
  }
  uint64_t v11 = [(SBHHomeScreenUsageMonitor *)self rootFolder];
  uint64_t v12 = [v11 todayList];
  int v13 = [v12 directlyContainsIcon:v28];

  int v14 = v8 | v10 & v13;
  long long v15 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v16 = [(NSHashTable *)self->_observers count];
    *(_DWORD *)buf = 138413314;
    uint64_t v35 = v28;
    __int16 v36 = 1024;
    int v37 = v8 | v10 & v13;
    __int16 v38 = 1024;
    BOOL v39 = v7;
    __int16 v40 = 1024;
    int v41 = v10;
    __int16 v42 = 2048;
    NSUInteger v43 = v16;
    _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "notifying for widget icon active data source change %@ (icon visible: %{BOOL}u, content visible: %{BOOL}u, today view visible: %{BOOL}u, number of observers: %ld)", buf, 0x28u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v17 = self;
  long long v18 = self->_observers;
  uint64_t v19 = [(NSHashTable *)v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        int v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v23 homeScreenUsageAggregator:v17 didNoteWidgetIconStackChangedActiveWidget:v28];
        }
        if (v14)
        {
          if (v27 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v23 homeScreenUsageAggregator:v17 didNoteDataSourceDidDisappear:v27 forWidgetIcon:v28];
          }
          if (v26 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v23 homeScreenUsageAggregator:v17 didNoteDataSourceDidAppear:v26 forWidgetIcon:v28];
          }
        }
      }
      uint64_t v20 = [(NSHashTable *)v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }
}

- (void)noteUserAddedWidgetIconStackSuggestion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteUserAddedWidgetIconStackSuggestion:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)noteUserDislikedWidgetIconStackSuggestion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteUserDislikedWidgetIconStackSuggestion:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)noteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)noteUserTappedWidgetIcon:(id)a3 withURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_observers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "homeScreenUsageAggregator:didNoteUserTappedWidgetIcon:withURL:", self, v6, v7, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBHHomeScreenUsageMonitor *)self iconManager];
  id v6 = v5;
  if (v3) {
    int v7 = [v5 isOverlayCoverSheetTodayViewVisible];
  }
  else {
    int v7 = [v5 isTodayViewEffectivelyVisible];
  }
  int v8 = v7;
  uint64_t v9 = sel_homeScreenUsageAggregator_didNoteDataSourceDidAppear_forWidgetIcon_;
  uint64_t v10 = [(SBHHomeScreenUsageMonitor *)self rootFolder];
  uint64_t v11 = [v10 todayList];
  uint64_t v12 = SBLogHomeScreenUsageMonitor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (v8) {
      long long v13 = @"visible";
    }
    else {
      long long v13 = @"gone";
    }
    *(_DWORD *)buf = 138543618;
    long long v17 = v13;
    __int16 v18 = 2048;
    uint64_t v19 = [v11 numberOfIcons];
    _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_INFO, "notifying that all today view widgets are %{public}@ (%lu widgets)", buf, 0x16u);
  }
  if (!v8) {
    uint64_t v9 = sel_homeScreenUsageAggregator_didNoteDataSourceDidDisappear_forWidgetIcon_;
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__SBHHomeScreenUsageMonitor_notifyForEveryTodayViewWidgetVisibilityOnCoverSheet___block_invoke;
  v14[3] = &unk_1E6AB3A30;
  v14[4] = self;
  v14[5] = v9;
  char v15 = v8;
  [v11 enumerateIconsUsingBlock:v14];
}

void __81__SBHHomeScreenUsageMonitor_notifyForEveryTodayViewWidgetVisibilityOnCoverSheet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isWidgetIcon])
  {
    id v4 = v3;
    BOOL v5 = [v4 activeDataSource];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v12 = *(void *)(a1 + 32);
            if (*(unsigned char *)(a1 + 48)) {
              [v11 homeScreenUsageAggregator:v12 didNoteDataSourceDidAppear:v5 forWidgetIcon:v4];
            }
            else {
              objc_msgSend(v11, "homeScreenUsageAggregator:didNoteDataSourceDidDisappear:forWidgetIcon:", v12, v5, v4, (void)v13);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v13 isWidgetIcon]) {
          [(SBHHomeScreenUsageMonitor *)self noteWidgetIconAdded:v13];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        if (objc_msgSend(v19, "isWidgetIcon", (void)v20)) {
          [(SBHHomeScreenUsageMonitor *)self noteWidgetIconRemoved:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

  [(SBHHomeScreenUsageMonitor *)self noteLayoutChanged];
}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if ([v7 isWidgetIcon]) {
    [(SBHHomeScreenUsageMonitor *)self noteWidgetIconAdded:v7];
  }
  if ([v8 isWidgetIcon]) {
    [(SBHHomeScreenUsageMonitor *)self noteWidgetIconRemoved:v8];
  }
  [(SBHHomeScreenUsageMonitor *)self noteLayoutChanged];
}

- (void)leafIcon:(id)a3 didChangeActiveDataSource:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 isWidgetIcon]) {
    [(SBHHomeScreenUsageMonitor *)self noteWidgetIconStack:v7 changedActiveWidget:v6];
  }
}

- (void)leafIcon:(id)a3 didAddIconDataSource:(id)a4
{
  if ([a3 isWidgetIcon])
  {
    [(SBHHomeScreenUsageMonitor *)self noteLayoutChanged];
  }
}

- (void)leafIcon:(id)a3 didRemoveIconDataSource:(id)a4
{
  if ([a3 isWidgetIcon])
  {
    [(SBHHomeScreenUsageMonitor *)self noteLayoutChanged];
  }
}

- (NSString)description
{
  return (NSString *)[(SBHHomeScreenUsageMonitor *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBHHomeScreenUsageMonitor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBHHomeScreenUsageMonitor isContentVisible](self, "isContentVisible"), @"isContentVisible");
  id v6 = (id)[v4 appendObject:self->_visibleHomeScreenWidgetIcons withName:@"visibleWidgetIcons"];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBHHomeScreenUsageMonitor *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (BOOL)delayedLayoutDidChangeNotification
{
  return self->_delayedLayoutDidChangeNotification;
}

- (void)setDelayedLayoutDidChangeNotification:(BOOL)a3
{
  self->_delayedLayoutDidChangeNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFolderController, 0);
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_visibleHomeScreenWidgetIcons, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end