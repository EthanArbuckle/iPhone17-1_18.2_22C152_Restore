@interface DOCTabbedBrowserViewController
+ (id)globalMapTable;
+ (id)globalTabbedBrowserControllerForIdentifier:(id)a3;
+ (void)setGlobalTabbedBrowserController:(id)a3 forIdentifier:(id)a4;
- (BOOL)_shouldForwardSelectorToDelegate:(SEL)a3;
- (BOOL)canHaveTabs;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canRevealSidebar;
- (BOOL)documentBrowser:(id)a3 shouldHandleLocation:(id)a4;
- (BOOL)documentBrowser:(id)a3 shouldShowActivityViewControllerForDocumentURLs:(id)a4 barButtonItem:(id)a5 popoverTracker:(id)a6;
- (BOOL)isAppLaunchOptimizationsActive;
- (BOOL)isShowingMovePanel;
- (BOOL)isShowingSearchResults;
- (BOOL)isSystemTabBarAllowedByTraits;
- (BOOL)isSystemTabBarPreferred;
- (BOOL)isSystemTabBarVisible;
- (BOOL)safeAreaUpdatesDisabledDuringTransitions;
- (BOOL)shouldDeferBrowserStateChanges;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (DOCAutoBarHidingTabBarController)tabBarController;
- (DOCFullDocumentManagerViewController)effectiveFullBrowser;
- (DOCFullDocumentManagerViewController)fullRecentsViewController;
- (DOCFullDocumentManagerViewController)fullSharedViewController;
- (DOCSourceObserver)sourceObserver;
- (DOCSplitBrowserViewController)splitBrowserViewController;
- (DOCTabbedBrowserViewController)initWithCoder:(id)a3;
- (DOCTabbedBrowserViewController)initWithConfiguration:(id)a3;
- (DOCTabbedBrowserViewControllerDelegate)tabbedBrowserViewControllerDelegate;
- (DOCUIPBrowserState)deferredBrowserStateChanges;
- (NSString)currentLocationTitle;
- (_TtC5Files24DOCNamedLocationResolver)namedLocationResolver;
- (_TtC5Files25DOCDefaultSourceUIManager)defaultSourceUIManager;
- (_TtC5Files29DOCBrowserContainerController)effectiveBrowserViewController;
- (id)_multitaskingDragExclusionRects;
- (id)_referenceViewControllerForDirectTabChildViewController:(id)a3;
- (id)documentBrowser:(id)a3 applicationActivitiesForDocumentURLs:(id)a4;
- (id)effectiveFullBrowserForTab:(unint64_t)a3;
- (id)forceBrowseTabDefaultsValue;
- (id)fullBrowserHierarchyController;
- (id)initForOpeningContentTypes:(id)a3;
- (id)newViewControllersSharing:(id)a3 tabBarItems:(id)a4;
- (id)preferredFocusEnvironments;
- (id)selectedTabDirectChildViewController;
- (id)selectedTabReferenceViewController;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)transitionControllerForDocumentAtURL:(id)a3;
- (int64_t)tabSwitcherStyleForCompactPresentation;
- (unint64_t)_mostRecentBrowsedPathEffectiveTab;
- (unint64_t)browserContentStrategy;
- (unint64_t)defaultInitialBrowsedPathEffectiveTab;
- (unint64_t)effectiveTabSwitcherTab;
- (unint64_t)fetchLastUsedTab;
- (unint64_t)tabBarCurrentRawTab;
- (unint64_t)tabControllerIndexForTab:(unint64_t)a3;
- (unint64_t)tabControllerIndexForTab:(unint64_t)a3 inViewControllers:(id)a4;
- (void)_applyBrowserStateChange:(id)a3 force:(BOOL)a4;
- (void)_beginSystemTabBarAllowed;
- (void)_beginSystemTabBarAlwaysDisallowed;
- (void)_beginSystemTabBarDisallowed;
- (void)_beginSystemTabBarHidden;
- (void)_loadFullHierarchy;
- (void)_loadMinimalHierarchy;
- (void)_performWhilePreventingHierarchyControllerLoading:(id)a3;
- (void)_setLocationsInBrowseTab:(id)a3;
- (void)_setShowSystemTabBar:(BOOL)a3 isEditing:(BOOL)a4;
- (void)_stopSearchingSources;
- (void)_updateColumnViewAvailablityFromTraitCollection:(id)a3 andSize:(CGSize)a4;
- (void)_updateTabButtonsVisibilityForTraits;
- (void)_viewController:(id)a3 wantsToShowSystemTabBar:(BOOL)a4 isEditing:(BOOL)a5;
- (void)actionController:(id)a3 presentError:(id)a4 completion:(id)a5;
- (void)actionControllerDidFinishAction:(id)a3 error:(id)a4;
- (void)actionControllerDidFinishAction:(id)a3 userInfo:(id)a4 error:(id)a5;
- (void)applyBrowserStateChange:(id)a3;
- (void)applyBrowserStateChange:(id)a3 force:(BOOL)a4;
- (void)configureTabBarForUIPIfNecessary;
- (void)configureUIPDocumentLandingStyleIfNecessary;
- (void)dealloc;
- (void)dismissAllPresentedViewControllers:(BOOL)a3 completion:(id)a4;
- (void)doc_commonInit;
- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5;
- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4;
- (void)documentBrowser:(id)a3 failedToImportDocumentAtURL:(id)a4 error:(id)a5;
- (void)documentBrowser:(id)a3 willPresentActivityViewController:(id)a4;
- (void)enumerateAllFullBrowserViewControllers:(id)a3;
- (void)fullDocumentManagerDidFinishGatheringItemsAndThumbnails:(id)a3;
- (void)fullDocumentManagerViewController:(id)a3 didUpdateHierarchy:(id)a4 displayedRootLocation:(id)a5;
- (void)importDocumentAtURL:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5;
- (void)importDocumentAtURL:(id)a3 nextToDocumentAtURL:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6;
- (void)itemCollectionViewControllerDidLoad;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performBrowserStateChange:(id)a3;
- (void)performConnectToServer:(id)a3;
- (void)performDeselectAll:(id)a3;
- (void)performGoToBrowse:(id)a3;
- (void)performGoToDesktop:(id)a3;
- (void)performGoToDocuments:(id)a3;
- (void)performGoToDownloads:(id)a3;
- (void)performGoToEnclosingFolder:(id)a3;
- (void)performGoToICloudDrive:(id)a3;
- (void)performGoToRecents:(id)a3;
- (void)performGoToShared:(id)a3;
- (void)presentBrowseTabFromFullBrowser;
- (void)presentConnectToServer:(id)a3;
- (void)presentConnectToServer:(id)a3 askPermission:(BOOL)a4;
- (void)presentGoToLocation;
- (void)presentRecentsTabFromFullBrowse;
- (void)presentSharedTabFromFullBrowser;
- (void)presentTab:(unint64_t)a3;
- (void)presentTab:(unint64_t)a3 rawTabSwitchOnly:(BOOL)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 completion:(id)a5;
- (void)revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 openDocument:(BOOL)a5 revealContents:(BOOL)a6 updateLastUsedDate:(BOOL)a7 completion:(id)a8;
- (void)saveSelectedTabState;
- (void)selectAll:(id)a3;
- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3;
- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3;
- (void)setAllowsDocumentCreation:(BOOL)a3;
- (void)setAllowsPickingMultipleItems:(BOOL)a3;
- (void)setCurrentLocationTitle:(id)a3;
- (void)setCustomActions:(id)a3;
- (void)setDefaultSourceUIManager:(id)a3;
- (void)setDeferredBrowserStateChanges:(id)a3;
- (void)setFullRecentsViewController:(id)a3;
- (void)setFullSharedViewController:(id)a3;
- (void)setIsAppLaunchOptimizationsActive:(BOOL)a3;
- (void)setIsShowingSearchResults:(BOOL)a3;
- (void)setIsSystemTabBarAllowedByTraits:(BOOL)a3;
- (void)setIsSystemTabBarPreferred:(BOOL)a3;
- (void)setIsSystemTabBarVisible:(BOOL)a3;
- (void)setNamedLocationResolver:(id)a3;
- (void)setSafeAreaUpdatesDisabledDuringTransitions:(BOOL)a3;
- (void)setSourceObserver:(id)a3;
- (void)setSplitBrowserViewController:(id)a3;
- (void)setTabBarController:(id)a3;
- (void)setTabbedBrowserViewControllerDelegate:(id)a3;
- (void)showConnectToServer:(id)a3;
- (void)splitViewController:(id)a3 didChangeFromState:(id)a4 toState:(id)a5 isUserDisplayModeChange:(BOOL)a6;
- (void)splitViewController:(id)a3 wantsToShowTabBar:(BOOL)a4;
- (void)startSearchingSourcesWithConfiguration:(id)a3;
- (void)switchToBrowse;
- (void)switchToLocation:(id)a3;
- (void)switchToRecents;
- (void)switchToShared;
- (void)switchToTab:(unint64_t)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)tabbedBrowserView:(id)a3 willMoveToWindow:(id)a4;
- (void)updateDeferredBrowserStateChangesWith:(id)a3;
- (void)updateForChangedHorizontalSizeClass;
- (void)updateLocationTitleFromCurrentState;
- (void)updateNavigationBarButtonItemsForViewController:(id)a3;
- (void)updateTabBarVisibility;
- (void)updateTraitCollectionTabBarSetting;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissSearchResultsController:(id)a3;
- (void)willPresentSearchResultsController:(id)a3;
@end

@implementation DOCTabbedBrowserViewController

- (BOOL)canHaveTabs
{
  v3 = [(DOCTabbedBrowserViewController *)self configuration];
  unsigned __int8 v4 = [v3 neverAllowsAnyTypeOfTabs];

  return (v4 & 1) == 0
      && (id)[(DOCTabbedBrowserViewController *)self browserContentStrategy] != (id)1;
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [v3 setDelegate:self];
  [(DOCTabbedBrowserViewController *)self setView:v3];
}

- (void)configureTabBarForUIPIfNecessary
{
  v2 = self;
  sub_100019778();
}

- (unint64_t)_mostRecentBrowsedPathEffectiveTab
{
  id v3 = [(DOCTabbedBrowserViewController *)self forceBrowseTabDefaultsValue];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    if ([v3 BOOLValue]) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 0;
    }
  }
  else
  {
    v6 = [(DOCTabbedBrowserViewController *)self deferredBrowserStateChanges];
    v7 = v6;
    if (v6 && [v6 tabIsSpecified])
    {
      unint64_t v5 = (unint64_t)[v7 tab];
    }
    else
    {
      v8 = +[DOCUserInterfaceStateStore sharedStore];
      v9 = [(DOCTabbedBrowserViewController *)self configuration];
      v10 = [v8 interfaceStateForConfiguration:v9];

      [(DOCTabbedBrowserViewController *)self enclosedInUIPDocumentLanding];
      unint64_t v5 = (unint64_t)[v10 mostRecentlyVisitedBrowseSourceWithFallback:0];
    }
  }

  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)DOCTabbedBrowserViewController;
  [(DOCTabbedBrowserViewController *)&v4 viewDidLoad];
  [(DOCTabbedBrowserViewController *)self _loadMinimalHierarchy];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"itemCollectionViewControllerDidLoad" name:@"DOCItemCollectionViewDidLoadContents" object:0];
}

- (id)initForOpeningContentTypes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  id v3 = [(DOCTabbedBrowserViewController *)&v7 initForOpeningContentTypes:a3];
  objc_super v4 = v3;
  if (v3)
  {
    [v3 doc_commonInit];
    id v5 = v4;
  }

  return v4;
}

- (void)updateForChangedHorizontalSizeClass
{
  id v3 = [(DOCTabbedBrowserViewController *)self traitCollection];
  objc_super v4 = [(DOCTabbedBrowserViewController *)self viewIfLoaded];
  [v4 frame];
  -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v3, v5, v6);

  [(DOCTabbedBrowserViewController *)self _updateTabButtonsVisibilityForTraits];
}

- (BOOL)shouldDeferBrowserStateChanges
{
  v2 = [(DOCTabbedBrowserViewController *)self tabBarController];
  id v3 = [v2 viewControllers];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (unint64_t)tabControllerIndexForTab:(unint64_t)a3 inViewControllers:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    unint64_t v7 = 0;
    while (1)
    {
      v8 = [v6 objectAtIndexedSubscript:v7];
      v9 = [v8 DOCTabBarItem];
      id v10 = [v9 tab];

      if (v10 == (id)a3) {
        break;
      }
      if (++v7 >= (unint64_t)[v6 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v11 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v11 = docLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100583A48((uint64_t)self, a3, v11);
    }
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)viewWillLayoutSubviews
{
  id v3 = [(DOCTabbedBrowserViewController *)self traitCollection];
  BOOL v4 = [(DOCTabbedBrowserViewController *)self viewIfLoaded];
  [v4 frame];
  -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v3, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  [(DOCTabbedBrowserViewController *)&v7 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(DOCTabbedBrowserViewController *)self traitCollection];
  BOOL v4 = [(DOCTabbedBrowserViewController *)self viewIfLoaded];
  [v4 frame];
  -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v3, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  [(DOCTabbedBrowserViewController *)&v7 viewDidLayoutSubviews];
}

- (void)setCustomActions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DOCTabbedBrowserViewController;
  [(DOCTabbedBrowserViewController *)&v9 setCustomActions:v4];
  double v5 = [(DOCSplitBrowserViewController *)self->_splitBrowserViewController sidebarViewController];
  [v5 setCustomActions:v4];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4F38;
  v7[3] = &unk_100689210;
  id v8 = v4;
  id v6 = v4;
  [(DOCTabbedBrowserViewController *)self enumerateAllFullBrowserViewControllers:v7];
}

- (id)_referenceViewControllerForDirectTabChildViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 actualViewController];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
    }
    else
    {
      id v5 = v4;
    }
  }
  id v6 = v5;

  return v6;
}

- (void)_updateTabButtonsVisibilityForTraits
{
  [(DOCTabbedBrowserViewController *)self updateTraitCollectionTabBarSetting];
  BOOL v3 = [(DOCTabbedBrowserViewController *)self enclosingTabSwitcherStyle] != 0;
  id v4 = [(DOCTabbedBrowserViewController *)self traitCollection];
  id v5 = [v4 contextPrefersVariableBlurBottomTabBar];
  id v6 = [(DOCTabbedBrowserViewController *)self tabBarController];
  [v6 setUsingVariableBlurBottomBar:v5];

  [(DOCTabbedBrowserViewController *)self setIsSystemTabBarAllowedByTraits:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  [(DOCTabbedBrowserViewController *)&v7 viewDidAppear:a3];
  self->_isAppLaunchOptimizationsActive = 0;
  id v4 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
  unsigned __int8 v5 = [v4 establishFirstResponder];

  if ((v5 & 1) == 0)
  {
    id v6 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
    [v6 setNeedsFirstResponder:1];
  }
}

+ (void)setGlobalTabbedBrowserController:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  objc_sync_enter(v8);
  if (v7)
  {
    if (v6)
    {
      objc_super v9 = +[DOCTabbedBrowserViewController globalMapTable];
      [v9 setObject:v6 forKey:v7];
    }
    else
    {
      v11 = +[DOCTabbedBrowserViewController globalMapTable];
      [v11 removeObjectForKey:v7];

      v12 = docUILogHandle;
      if (!docUILogHandle)
      {
        DOCInitLogging();
        v12 = docUILogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1005839D0((uint64_t)v7, v12);
      }
    }
  }
  else
  {
    id v10 = docUILogHandle;
    if (!docUILogHandle)
    {
      DOCInitLogging();
      id v10 = docUILogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10058398C(v10);
    }
  }
  objc_sync_exit(v8);
}

- (void)updateNavigationBarButtonItemsForViewController:(id)a3
{
  objc_super v9 = [(DOCTabbedBrowserViewController *)self _referenceViewControllerForDirectTabChildViewController:a3];
  id v4 = [(DOCSplitBrowserViewController *)self->_splitBrowserViewController fullDocumentManagerViewController];

  unsigned __int8 v5 = v9;
  if (v9 == v4)
  {
    unsigned __int8 v5 = self->_splitBrowserViewController;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = v5;
    id v7 = [(DOCTabbedBrowserViewController *)self additionalLeadingNavigationBarButtonItems];
    [(DOCSplitBrowserViewController *)v6 setAdditionalLeadingNavigationBarButtonItems:v7];

    id v8 = [(DOCTabbedBrowserViewController *)self additionalTrailingNavigationBarButtonItems];
    [(DOCSplitBrowserViewController *)v6 setAdditionalTrailingNavigationBarButtonItems:v8];
  }
}

- (void)presentTab:(unint64_t)a3 rawTabSwitchOnly:(BOOL)a4
{
  unint64_t v7 = [(DOCTabbedBrowserViewController *)self browserContentStrategy];
  if (v7) {
    BOOL v8 = a4;
  }
  else {
    BOOL v8 = 1;
  }
  if ([(DOCTabbedBrowserViewController *)self shouldDeferBrowserStateChanges])
  {
    id v28 = objc_alloc_init((Class)DOCUIPBrowserState);
    [v28 setTab:a3];
    [(DOCTabbedBrowserViewController *)self updateDeferredBrowserStateChangesWith:v28];
    goto LABEL_26;
  }
  objc_super v9 = +[DOCDeprecatedUIMenuController shared];
  [v9 hideMenu];

  id v10 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
  v11 = [v10 fullDocumentManagerViewController];
  [v11 setEditing:0];

  v12 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
  [v12 setEditing:0];

  v13 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
  [v13 setEditing:0];

  if (v7 == 1) {
    unint64_t v14 = 2;
  }
  else {
    unint64_t v14 = a3;
  }
  v15 = [(DOCTabbedBrowserViewController *)self tabBarController];
  id v16 = [v15 selectedOrInflightSelectedTab];

  if (v16 != (id)v14)
  {
    unint64_t v17 = [(DOCTabbedBrowserViewController *)self tabControllerIndexForTab:v14];
    v18 = [(DOCTabbedBrowserViewController *)self tabBarController];
    id v19 = [v18 selectedIndex];

    if (v19 != (id)v17)
    {
      v20 = [(DOCTabbedBrowserViewController *)self tabBarController];
      [v20 setSelectedIndex:v17];
    }
  }
  v21 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowserForTab:a3];
  id v22 = v21;
  id v28 = v21;
  if (!v8)
  {
    v23 = [v21 hierarchyController];
    v24 = [v23 locationForDeterminingCurrentEffectiveTab];

    if (v24)
    {
      id v25 = [v23 effectiveTabSwitcherTab];

      id v22 = v28;
      if (v25 == (id)a3) {
        goto LABEL_24;
      }
    }
    else
    {
      v26 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
      unsigned __int8 v27 = [v26 isViewLoaded];

      id v22 = v28;
      if ((v27 & 1) == 0) {
        goto LABEL_24;
      }
    }
    if (a3 == 2)
    {
      [(DOCTabbedBrowserViewController *)self presentBrowseTabFromFullBrowser];
    }
    else if (a3 == 1)
    {
      [(DOCTabbedBrowserViewController *)self presentSharedTabFromFullBrowser];
    }
    else
    {
      if (a3) {
        goto LABEL_24;
      }
      [(DOCTabbedBrowserViewController *)self presentRecentsTabFromFullBrowse];
    }
    id v22 = v28;
  }
LABEL_24:
  [(DOCTabbedBrowserViewController *)self updateNavigationBarButtonItemsForViewController:v22];
  [(DOCTabbedBrowserViewController *)self updateLocationTitleFromCurrentState];
  if (!self->_isAppLaunchOptimizationsActive) {
    [(DOCTabbedBrowserViewController *)self saveSelectedTabState];
  }
LABEL_26:
}

- (void)tabbedBrowserView:(id)a3 willMoveToWindow:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    unint64_t v7 = [(DOCTabbedBrowserViewController *)self configuration];
    BOOL v8 = [v7 sceneIdentifier];

    if (!v8)
    {
      objc_super v9 = [(DOCTabbedBrowserViewController *)self configuration];
      [v9 updateStateAndSceneIdentifiersWithWindow:v6];

      [v6 frame];
      if (!CGRectIsEmpty(v14))
      {
        [v12 frame];
        if (CGRectIsEmpty(v15))
        {
          [v6 bounds];
          [v12 setFrame:];
        }
      }
    }
  }
  [(DOCTabbedBrowserViewController *)self _loadFullHierarchy];
  id v10 = [(DOCTabbedBrowserViewController *)self configuration];
  v11 = [v10 sceneIdentifier];
  +[DOCTabbedBrowserViewController setGlobalTabbedBrowserController:self forIdentifier:v11];
}

- (void)setSafeAreaUpdatesDisabledDuringTransitions:(BOOL)a3
{
  if (self->_safeAreaUpdatesDisabledDuringTransitions != a3)
  {
    BOOL v3 = a3;
    self->_safeAreaUpdatesDisabledDuringTransitions = a3;
    id v4 = [(DOCTabbedBrowserViewController *)self tabBarController];
    [v4 setSafeAreaUpdatesDisabledDuringTransitions:v3];
  }
}

- (void)setIsShowingSearchResults:(BOOL)a3
{
  if (self->_isShowingSearchResults != a3)
  {
    self->_isShowingSearchResults = a3;
    if (a3)
    {
      id v7 = [(DOCTabbedBrowserViewController *)self tabBarController];
      [v7 hideBar];
    }
    else
    {
      if ([(DOCTabbedBrowserViewController *)self browserContentStrategy])
      {
        id v4 = [(DOCTabbedBrowserViewController *)self presentedViewController];
        unsigned int v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___DOCKeyCommandDismissible];

        if (v5)
        {
          id v6 = [(DOCTabbedBrowserViewController *)self presentedViewController];
          [v6 dismissViewControllerAnimated:1 completion:0];
        }
      }
      id v7 = [(DOCTabbedBrowserViewController *)self tabBarController];
      [v7 showBarIfAllowed];
    }
  }
}

- (NSString)currentLocationTitle
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)fullDocumentManagerDidFinishGatheringItemsAndThumbnails:(id)a3
{
  id v18 = a3;
  id v4 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];

  if (v4 == v18)
  {
    unint64_t v8 = 0;
  }
  else
  {
    id v5 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];

    if (v5 == v18)
    {
      unint64_t v8 = 1;
    }
    else
    {
      id v6 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
      id v7 = [v6 fullDocumentManagerViewController];

      if (v7 != v18) {
        goto LABEL_11;
      }
      unint64_t v8 = [(DOCTabbedBrowserViewController *)self effectiveTabSwitcherTab];
    }
  }
  didLoadStateByTab = self->_didLoadStateByTab;
  id v10 = +[NSNumber numberWithUnsignedInteger:v8];
  v11 = [(NSMutableDictionary *)didLoadStateByTab objectForKeyedSubscript:v10];
  unsigned int v12 = [v11 BOOLValue];

  if ((v12 & 1) == 0)
  {
    v13 = self->_didLoadStateByTab;
    CGRect v14 = +[NSNumber numberWithUnsignedInteger:v8];
    [(NSMutableDictionary *)v13 setObject:&__kCFBooleanTrue forKeyedSubscript:v14];
  }
  CGRect v15 = [(DOCTabbedBrowserViewController *)self tabbedBrowserViewControllerDelegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    unint64_t v17 = [(DOCTabbedBrowserViewController *)self tabbedBrowserViewControllerDelegate];
    [v17 tabbedBrowserViewController:self didFinishInitialLoad:v12 ^ 1 ofTab:v8];
  }
LABEL_11:
}

- (DOCTabbedBrowserViewControllerDelegate)tabbedBrowserViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabbedBrowserViewControllerDelegate);

  return (DOCTabbedBrowserViewControllerDelegate *)WeakRetained;
}

- (void)updateLocationTitleFromCurrentState
{
  id v6 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
  BOOL v3 = [v6 currentViewController];
  id v4 = [v3 navigationItem];
  id v5 = [v4 title];

  [(DOCTabbedBrowserViewController *)self setCurrentLocationTitle:v5];
}

- (void)itemCollectionViewControllerDidLoad
{
  BOOL v3 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
  [v3 establishFirstResponderIfNeeded];

  [(DOCTabbedBrowserViewController *)self _setNeedsUpdateOfMultitaskingDragExclusionRects];
}

- (void)setAllowsDocumentCreation:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController setAllowsDocumentCreation:](&v7, "setAllowsDocumentCreation:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D1930;
  v5[3] = &unk_1006891E8;
  BOOL v6 = a3;
  [(DOCTabbedBrowserViewController *)self enumerateAllFullBrowserViewControllers:v5];
}

- (void)enumerateAllFullBrowserViewControllers:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  BOOL v6 = v5;
  if (self->_fullRecentsViewController) {
    [v5 addObject:];
  }
  if (self->_fullSharedViewController) {
    [v6 addObject:];
  }
  objc_super v7 = [(DOCSplitBrowserViewController *)self->_splitBrowserViewController fullDocumentManagerViewController];

  if (v7)
  {
    unint64_t v8 = [(DOCSplitBrowserViewController *)self->_splitBrowserViewController fullDocumentManagerViewController];
    [v6 addObject:v8];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D1920;
  v10[3] = &unk_100689238;
  id v11 = v4;
  id v9 = v4;
  [v6 enumerateObjectsUsingBlock:v10];
}

- (void)_updateColumnViewAvailablityFromTraitCollection:(id)a3 andSize:(CGSize)a4
{
  BOOL v5 = +[DOCColumnViewController supportsDisplayInTraitCollection:availableArea:](_TtC5Files23DOCColumnViewController, "supportsDisplayInTraitCollection:availableArea:", a3, a4.width, a4.height);
  id v7 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
  BOOL v6 = [v7 fullDocumentManagerViewController];
  [v6 setEnvironmentSupportsColumnView:v5];
}

- (void)_loadFullHierarchy
{
  objc_initWeak(&location, self);
  if (*(_OWORD *)&self->_fullRecentsViewController == 0 && !self->_splitBrowserViewController)
  {
    if (![(DOCTabbedBrowserViewController *)self browserContentStrategy])
    {
      BOOL v3 = [(DOCTabbedBrowserViewController *)self configuration];
      id v4 = [v3 copy];

      [v4 configureContextForDisplayingTab:0];
      [v4 setPreferLastUsedDate:1];
      [v4 setRestoreLastVisitedLocation:0];
      BOOL v5 = +[DOCConcreteLocation recentDocumentsLocation];
      [v4 setDefaultLocation:v5];

      BOOL v6 = [[DOCFullDocumentManagerViewController alloc] initWithConfiguration:v4 sourceObserver:self->_sourceObserver];
      [(DOCTabbedBrowserViewController *)self setFullRecentsViewController:v6];

      id v7 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
      [v7 setShortDebugID:@"recents"];

      unint64_t v8 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
      [v8 setFullDocumentManagerDelegate:self];

      id v9 = [(DOCTabbedBrowserViewController *)self configuration];
      id v10 = [v9 copy];

      [v10 configureContextForDisplayingTab:1];
      [v10 setPreferLastUsedDate:1];
      [v10 setRestoreLastVisitedLocation:1];
      [v10 setSaveLastVisitedLocation:1];
      id v11 = [[DOCFullDocumentManagerViewController alloc] initWithConfiguration:v10 sourceObserver:self->_sourceObserver];
      [(DOCTabbedBrowserViewController *)self setFullSharedViewController:v11];

      unsigned int v12 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
      [v12 setShortDebugID:@"shared"];

      v13 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
      [v13 setFullDocumentManagerDelegate:self];
    }
    if ([(DOCTabbedBrowserViewController *)self browserContentStrategy]) {
      unint64_t v14 = [(DOCTabbedBrowserViewController *)self defaultInitialBrowsedPathEffectiveTab];
    }
    else {
      unint64_t v14 = 2;
    }
    CGRect v15 = [(DOCTabbedBrowserViewController *)self configuration];
    id v16 = [v15 copy];

    [v16 configureContextForDisplayingTab:v14];
    unint64_t v17 = [[DOCSplitBrowserViewController alloc] initWithConfiguration:v16 sourceObserver:self->_sourceObserver];
    [(DOCTabbedBrowserViewController *)self setSplitBrowserViewController:v17];

    id v18 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
    [v18 setShortDebugID:@"browser"];

    id v19 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
    v20 = [v19 fullDocumentManagerViewController];
    v21 = [v20 hierarchyController];
    [v21 setDefaultTab:v14];

    if ((id)[(DOCTabbedBrowserViewController *)self browserContentStrategy] == (id)2)
    {
      id v22 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
      v23 = [v22 fullDocumentManagerViewController];
      [v23 setViewDidLoadResetLocationDisabled:1];
    }
    v24 = [(DOCTabbedBrowserViewController *)self traitCollection];
    id v25 = [(DOCTabbedBrowserViewController *)self viewIfLoaded];
    [v25 frame];
    -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v24, v26, v27);

    id v28 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
    [v28 setSplitViewDelegate:self];

    [(DOCTabbedBrowserViewController *)self setAllowsDocumentCreation:[(DOCTabbedBrowserViewController *)self allowsDocumentCreation]];
    v29 = [_TtC5Files25DOCDefaultSourceUIManager alloc];
    v30 = [(DOCTabbedBrowserViewController *)self configuration];
    v31 = [(DOCDefaultSourceUIManager *)v29 initWithConfiguration:v30 sourceObserver:self->_sourceObserver presentAlertsOn:self];
    [(DOCTabbedBrowserViewController *)self setDefaultSourceUIManager:v31];

    v32 = [_TtC5Files24DOCNamedLocationResolver alloc];
    v33 = [(DOCTabbedBrowserViewController *)self configuration];
    v34 = [(DOCTabbedBrowserViewController *)self defaultSourceUIManager];
    v35 = [(DOCNamedLocationResolver *)v32 initWithConfiguration:v33 defaultSourceUIManager:v34];
    [(DOCTabbedBrowserViewController *)self setNamedLocationResolver:v35];

    v36 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
    [v36 setDelegate:self];

    v37 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
    [v37 setDelegate:self];

    v38 = +[DOCTabBarItem itemWithTab:0];
    v39 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
    [v39 setTabBarItem:v38];

    v40 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
    v41 = [v40 hierarchyController];
    [v41 setDefaultTab:0];

    v42 = +[DOCTabBarItem itemWithTab:1];
    v43 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
    [v43 setTabBarItem:v42];

    v44 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
    v45 = [v44 hierarchyController];
    [v45 setDefaultTab:1];

    v46 = +[DOCTabBarItem itemWithTab:2];
    v47 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
    v48 = [v47 fullDocumentManagerViewController];
    [v48 setDelegate:self];

    v49 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
    [v49 setTabBarItem:v46];

    v50 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
    v51 = [v50 fullDocumentManagerViewController];
    v52 = [v51 hierarchyController];
    [v52 setDefaultTab:2];

    if ((id)[(DOCTabbedBrowserViewController *)self browserContentStrategy] == (id)1)
    {
      v53 = [(DOCTabbedBrowserViewController *)self tabBarController];
      splitBrowserViewController = self->_splitBrowserViewController;
      v54 = +[NSArray arrayWithObjects:&splitBrowserViewController count:1];
      [v53 loadViewControllers:v54 initialIndex:0];

      v55 = +[DOCUserInterfaceStateStore sharedStore];
      v56 = [(DOCTabbedBrowserViewController *)self configuration];
      id v57 = [v55 interfaceStateForConfiguration:v56];

      v58 = [v57 mostRecentlyVisitedBrowsedState_FullBrowser];
      if (v58
        || ([(DOCTabbedBrowserViewController *)self forceBrowseTabDefaultsValue],
            (v58 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        v75 = [(DOCTabbedBrowserViewController *)self configuration];
        v76 = +[DOCConcreteLocation recentDocumentsLocation];
        unsigned int v77 = [v75 allowsDisplaying:v76];

        if (v77) {
          [(DOCTabbedBrowserViewController *)self presentRecentsTabFromFullBrowse];
        }
      }
    }
    else
    {
      unint64_t v59 = [(DOCTabbedBrowserViewController *)self fetchLastUsedTab];
      if ((id)[(DOCTabbedBrowserViewController *)self browserContentStrategy] == (id)2)
      {
        v83[0] = v38;
        v83[1] = v42;
        v83[2] = v46;
        v60 = +[NSArray arrayWithObjects:v83 count:3];
        v61 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
        id v57 = [(DOCTabbedBrowserViewController *)self newViewControllersSharing:v61 tabBarItems:v60];
      }
      else
      {
        fullSharedViewController = self->_fullSharedViewController;
        v82[0] = self->_fullRecentsViewController;
        v82[1] = fullSharedViewController;
        v82[2] = self->_splitBrowserViewController;
        id v57 = +[NSArray arrayWithObjects:v82 count:3];
      }
      unint64_t v63 = [(DOCTabbedBrowserViewController *)self tabControllerIndexForTab:v59 inViewControllers:v57];
      v64 = [(DOCTabbedBrowserViewController *)self tabBarController];
      v65 = v64;
      if (v63 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v66 = 0;
      }
      else {
        unint64_t v66 = v63;
      }
      [v64 loadViewControllers:v57 initialIndex:v66];

      [(DOCTabbedBrowserViewController *)self presentTab:v59];
    }

    if ([(DOCTabbedBrowserViewController *)self enclosedInUIPDocumentLanding])[(DOCTabbedBrowserViewController *)self configureUIPDocumentLandingStyleIfNecessary]; {
    [(DOCTabbedBrowserViewController *)self setDeferredBrowserStateChanges:0];
    }
    v67 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
    [v67 activateContainerViewControllersIfNeeded];

    v68 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
    [v68 addObserver:self forKeyPath:@"editing" options:1 context:off_100704CE8];

    v69 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
    [v69 addObserver:self forKeyPath:@"editing" options:1 context:off_100704CE8];

    v70 = +[NSNotificationCenter defaultCenter];
    v71 = +[DOCColumnViewController DOCColumnViewControllerUpdatedNavigationItem];
    [v70 addObserver:self selector:"columViewControllerDidUpdate:" name:v71 object:0];

    [(DOCTabbedBrowserViewController *)self updateForChangedHorizontalSizeClass];
    v72 = self;
    v81 = v72;
    v73 = +[NSArray arrayWithObjects:&v81 count:1];
    id v74 = [(DOCTabbedBrowserViewController *)self registerForTraitChanges:v73 withAction:"updateForChangedHorizontalSizeClass"];

    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000E4B00;
    v78[3] = &unk_100689188;
    objc_copyWeak(&v79, &location);
    [(DOCTabbedBrowserViewController *)self registerForTabSwitcherTraitChangesWithHandler:v78];
    objc_destroyWeak(&v79);
  }
  objc_destroyWeak(&location);
}

- (DOCSplitBrowserViewController)splitBrowserViewController
{
  return (DOCSplitBrowserViewController *)objc_getProperty(self, a2, 40, 1);
}

- (DOCFullDocumentManagerViewController)fullRecentsViewController
{
  return (DOCFullDocumentManagerViewController *)objc_getProperty(self, a2, 24, 1);
}

- (DOCFullDocumentManagerViewController)fullSharedViewController
{
  return (DOCFullDocumentManagerViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)doc_commonInit
{
  BOOL v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  didLoadStateByTab = self->_didLoadStateByTab;
  self->_didLoadStateByTab = v3;

  BOOL v5 = [(DOCTabbedBrowserViewController *)self configuration];
  unsigned __int8 v6 = [v5 isFilesApp];

  if ((v6 & 1) == 0)
  {
    id v7 = [(DOCTabbedBrowserViewController *)self configuration];
    unint64_t v8 = [v7 hostIdentifier];
    +[FINode setCurrentHostAppIdentifier:v8];
  }
  id v9 = [(DOCTabbedBrowserViewController *)self configuration];
  id v10 = [v9 hostIdentifier];
  id v11 = +[DOCAppProtectionManager sharedManager];
  [v11 setHostIdentifier:v10];

  unsigned int v12 = [(DOCTabbedBrowserViewController *)self configuration];
  v13 = [v12 hostIdentifier];
  unint64_t v14 = +[DOCManagedPermission defaultPermission];
  [v14 setHostIdentifier:v13];

  CGRect v15 = +[NSUserDefaults standardUserDefaults];
  [v15 registerDefaults:&off_1006BB4E0];

  [(DOCTabbedBrowserViewController *)self setCustomActions:&__NSArray0__struct];
  id v16 = [(DOCTabbedBrowserViewController *)self configuration];
  if ([v16 forPickingDocuments]) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }

  id v18 = [DOCSourceObserver alloc];
  id v19 = [(DOCTabbedBrowserViewController *)self configuration];
  v20 = [v19 hostIdentifier];
  v21 = [(DOCSourceObserver *)v18 initWithUserAction:v17 hostIdentifier:v20];
  sourceObserver = self->_sourceObserver;
  self->_sourceObserver = v21;

  self->_isSystemTabBarAllowedByTraits = 1;
  self->_isSystemTabBarPreferred = 1;
  self->_isSystemTabBarVisible = 1;
  self->_isAppLaunchOptimizationsActive = 1;
  v23 = objc_opt_new();
  [(DOCTabbedBrowserViewController *)self setTabBarController:v23];

  v24 = [(DOCTabbedBrowserViewController *)self tabBarController];
  [v24 setDelegate:self];

  BOOL v25 = (id)[(DOCTabbedBrowserViewController *)self browserContentStrategy] == (id)2;
  double v26 = [(DOCTabbedBrowserViewController *)self tabBarController];
  [v26 setUsingSharedSplitBrowserStrategy:v25];

  [(DOCTabbedBrowserViewController *)self configureTabBarForUIPIfNecessary];

  objc_storeWeak(&qword_100736DD0, self);
}

+ (id)globalTabbedBrowserControllerForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  if (v4)
  {
    unsigned __int8 v6 = +[DOCTabbedBrowserViewController globalMapTable];
    id v7 = [v6 objectForKey:v4];
  }
  else
  {
    unint64_t v8 = docUILogHandle;
    if (!docUILogHandle)
    {
      DOCInitLogging();
      unint64_t v8 = docUILogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10058398C(v8);
    }
    id v7 = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

+ (id)globalMapTable
{
  if (qword_10071D3C0 != -1) {
    dispatch_once(&qword_10071D3C0, &stru_1006890E8);
  }
  v2 = (void *)qword_10071D3B8;

  return v2;
}

- (id)effectiveFullBrowserForTab:(unint64_t)a3
{
  id v5 = [(DOCTabbedBrowserViewController *)self browserContentStrategy];
  if ((unint64_t)(v5 - 1) < 2) {
    goto LABEL_2;
  }
  if (!v5)
  {
    if (a3 == 2)
    {
LABEL_2:
      id v5 = [(DOCSplitBrowserViewController *)self->_splitBrowserViewController fullDocumentManagerViewController];
      goto LABEL_10;
    }
    if (a3 == 1)
    {
      uint64_t v6 = 32;
    }
    else
    {
      if (a3) {
        goto LABEL_10;
      }
      uint64_t v6 = 24;
    }
    id v5 = (char *)*(id *)((char *)&self->super.super.super.super.isa + v6);
  }
LABEL_10:

  return v5;
}

- (void)fullDocumentManagerViewController:(id)a3 didUpdateHierarchy:(id)a4 displayedRootLocation:(id)a5
{
  id v8 = a4;
  id v9 = [a3 parentViewController];

  if (a5)
  {
    if (v9)
    {
      if ((id)[(DOCTabbedBrowserViewController *)self browserContentStrategy] == (id)2)
      {
        id v10 = [v8 effectiveTabSwitcherTab];
        if (v10 != (id)[(DOCAutoBarHidingTabBarController *)self->_tabBarController selectedOrInflightSelectedTab])
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_1000E7324;
          v11[3] = &unk_100689110;
          v11[4] = self;
          v11[5] = v10;
          +[UIViewController doc_performWithDeferredTransitionsAndAnimationsDisabled:v11];
        }
      }
    }
  }
}

- (unint64_t)browserContentStrategy
{
  if (DOCDeviceIsPhone()) {
    return 0;
  }
  if (+[DOCFeature _UIPTabInfrastructureEnabled])return 2; {
  return 1;
  }
}

- (void)_loadMinimalHierarchy
{
  BOOL v3 = [(DOCTabbedBrowserViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  unsigned int v12 = [(DOCTabbedBrowserViewController *)self tabBarController];
  v13 = [v12 view];
  [v13 setFrame:v5, v7, v9, v11];

  unint64_t v14 = [(DOCTabbedBrowserViewController *)self tabBarController];
  CGRect v15 = [v14 view];
  [v15 setAutoresizingMask:18];

  id v16 = +[DOCAXIdentifier browsingModeTabBar];
  uint64_t v17 = [(DOCTabbedBrowserViewController *)self tabBarController];
  id v18 = [v17 tabBar];
  [v18 setAccessibilityIdentifier:v16];

  id v19 = [(DOCTabbedBrowserViewController *)self tabBarController];
  [(DOCTabbedBrowserViewController *)self addChildViewController:v19];

  v20 = [(DOCTabbedBrowserViewController *)self view];
  v21 = [(DOCTabbedBrowserViewController *)self tabBarController];
  id v22 = [v21 view];
  [v20 addSubview:v22];

  id v23 = [(DOCTabbedBrowserViewController *)self tabBarController];
  [v23 didMoveToParentViewController:self];
}

- (DOCFullDocumentManagerViewController)effectiveFullBrowser
{
  BOOL v3 = [(DOCTabbedBrowserViewController *)self tabBarController];
  double v4 = -[DOCTabbedBrowserViewController effectiveFullBrowserForTab:](self, "effectiveFullBrowserForTab:", [v3 selectedOrInflightSelectedTab]);

  return (DOCFullDocumentManagerViewController *)v4;
}

- (DOCAutoBarHidingTabBarController)tabBarController
{
  return (DOCAutoBarHidingTabBarController *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentLocationTitle:(id)a3
{
}

- (void)updateTraitCollectionTabBarSetting
{
  v2 = self;
  sub_10002B248();
}

- (void)setTabbedBrowserViewControllerDelegate:(id)a3
{
}

- (void)setTabBarController:(id)a3
{
}

- (void)setSplitBrowserViewController:(id)a3
{
}

- (void)setNamedLocationResolver:(id)a3
{
}

- (void)setIsSystemTabBarAllowedByTraits:(BOOL)a3
{
  if (self->_isSystemTabBarAllowedByTraits == a3)
  {
    [(DOCAutoBarHidingTabBarController *)self->_tabBarController updateBarVisibilityIfNecessary];
  }
  else
  {
    self->_isSystemTabBarAllowedByTraits = a3;
    if (a3) {
      [(DOCTabbedBrowserViewController *)self _beginSystemTabBarAllowed];
    }
    else {
      [(DOCTabbedBrowserViewController *)self _beginSystemTabBarDisallowed];
    }
  }
}

- (void)setFullSharedViewController:(id)a3
{
}

- (void)setFullRecentsViewController:(id)a3
{
}

- (void)setDeferredBrowserStateChanges:(id)a3
{
}

- (void)setDefaultSourceUIManager:(id)a3
{
}

- (void)presentTab:(unint64_t)a3
{
}

- (BOOL)isAppLaunchOptimizationsActive
{
  return self->_isAppLaunchOptimizationsActive;
}

- (id)forceBrowseTabDefaultsValue
{
  if (qword_10071D3D0[0] != -1) {
    dispatch_once(qword_10071D3D0, &stru_100689370);
  }
  v2 = (void *)qword_10071D3C8;

  return v2;
}

- (unint64_t)fetchLastUsedTab
{
  if (![(DOCTabbedBrowserViewController *)self canHaveTabs]) {
    return 2;
  }

  return [(DOCTabbedBrowserViewController *)self _mostRecentBrowsedPathEffectiveTab];
}

- (_TtC5Files25DOCDefaultSourceUIManager)defaultSourceUIManager
{
  return (_TtC5Files25DOCDefaultSourceUIManager *)objc_getProperty(self, a2, 96, 1);
}

- (DOCTabbedBrowserViewController)initWithConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  BOOL v3 = [(DOCTabbedBrowserViewController *)&v7 initWithConfiguration:a3];
  double v4 = v3;
  if (v3)
  {
    [(DOCTabbedBrowserViewController *)v3 doc_commonInit];
    double v5 = v4;
  }

  return v4;
}

- (DOCTabbedBrowserViewController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  BOOL v3 = [(DOCTabbedBrowserViewController *)&v7 initWithCoder:a3];
  double v4 = v3;
  if (v3)
  {
    [(DOCTabbedBrowserViewController *)v3 doc_commonInit];
    double v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  if ([(DOCTabbedBrowserViewController *)self isViewLoaded])
  {
    BOOL v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self];

    double v4 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
    [v4 removeObserver:self forKeyPath:@"editing"];

    double v5 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
    [v5 removeObserver:self forKeyPath:@"editing"];
  }
  double v6 = [(DOCTabbedBrowserViewController *)self configuration];
  objc_super v7 = [v6 sceneIdentifier];
  +[DOCTabbedBrowserViewController setGlobalTabbedBrowserController:0 forIdentifier:v7];

  double v8 = [(DOCTabbedBrowserViewController *)self configuration];
  double v9 = [v8 sceneIdentifier];
  +[DOCInteractionManager clearSharedControllerFor:v9];

  double v10 = [(DOCTabbedBrowserViewController *)self configuration];
  double v11 = [v10 sceneIdentifier];
  +[DOCPreviewController clearSharedControllerFor:v11];

  [(DOCTabbedBrowserViewController *)self _stopSearchingSources];
  v12.receiver = self;
  v12.super_class = (Class)DOCTabbedBrowserViewController;
  [(DOCTabbedBrowserViewController *)&v12 dealloc];
}

- (void)_beginSystemTabBarDisallowed
{
  if ([(DOCTabbedBrowserViewController *)self canHaveTabs])
  {
    [(DOCTabbedBrowserViewController *)self _beginSystemTabBarHidden];
  }
  else
  {
    [(DOCTabbedBrowserViewController *)self _beginSystemTabBarAlwaysDisallowed];
  }
}

- (void)_beginSystemTabBarHidden
{
  BOOL v3 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
  if ([v3 isEditing])
  {
    uint64_t v4 = 1;
  }
  else
  {
    double v5 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
    uint64_t v4 = (uint64_t)[v5 isEditing];
  }

  [(DOCTabbedBrowserViewController *)self _setShowSystemTabBar:0 isEditing:v4];
}

- (void)_beginSystemTabBarAlwaysDisallowed
{
  unint64_t v3 = [(DOCTabbedBrowserViewController *)self tabBarCurrentRawTab];
  if (v3 <= 1
    && (unint64_t v4 = v3,
        [(DOCTabbedBrowserViewController *)self view],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v5 window],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    if (v4) {
      objc_super v7 = &OBJC_IVAR___DOCTabbedBrowserViewController__fullSharedViewController;
    }
    else {
      objc_super v7 = &OBJC_IVAR___DOCTabbedBrowserViewController__fullRecentsViewController;
    }
    id v9 = *(id *)((char *)&self->super.super.super.super.isa + *v7);
    double v10 = [v9 hierarchyController];
    double v8 = [v10 locations];
  }
  else
  {
    double v8 = 0;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E3C18;
  v11[3] = &unk_100688C90;
  v11[4] = self;
  [(DOCTabbedBrowserViewController *)self _performWhilePreventingHierarchyControllerLoading:v11];
  if (v8) {
    [(DOCTabbedBrowserViewController *)self _setLocationsInBrowseTab:v8];
  }
}

- (void)_performWhilePreventingHierarchyControllerLoading:(id)a3
{
  unint64_t v4 = (void (**)(void))a3;
  double v5 = [(DOCSplitBrowserViewController *)self->_splitBrowserViewController fullDocumentManagerViewController];
  double v6 = [v5 hierarchyController];
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E3D3C;
    v7[3] = &unk_100688D50;
    double v8 = v4;
    [v6 performWhilePreventingLoading:v7];
  }
  else
  {
    v4[2](v4);
  }
}

- (void)_beginSystemTabBarAllowed
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000E3DCC;
  v2[3] = &unk_100689110;
  unint64_t v3 = self;
  unint64_t v4 = [(DOCTabbedBrowserViewController *)self effectiveTabSwitcherTab];
  [(DOCTabbedBrowserViewController *)v3 _performWhilePreventingHierarchyControllerLoading:v2];
}

- (void)_setLocationsInBrowseTab:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = [(DOCTabbedBrowserViewController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v7 = [(DOCTabbedBrowserViewController *)self presentedViewController];
      double v8 = [v7 sidebarViewController];
      id v9 = [v7 fullDocumentManagerViewController];
    }
    else
    {
      double v8 = [(DOCSplitBrowserViewController *)self->_splitBrowserViewController sidebarViewController];
      id v9 = [(DOCSplitBrowserViewController *)self->_splitBrowserViewController fullDocumentManagerViewController];
    }
    [v4 lastObject];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000E3FF0;
    v13[3] = &unk_100689138;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v9;
    id v16 = v8;
    id v17 = v4;
    id v10 = v8;
    id v11 = v9;
    id v12 = v14;
    [v11 showLocation:v12 fromRootAnimated:0 withCompletionBlock:v13];
  }
}

- (void)_viewController:(id)a3 wantsToShowSystemTabBar:(BOOL)a4 isEditing:(BOOL)a5
{
  BOOL v5 = a4;
  id v8 = a3;
  self->_isSystemTabBarPreferred = v5;
  if (v5) {
    unsigned int v7 = [(DOCTabbedBrowserViewController *)self isSystemTabBarAllowedByTraits];
  }
  else {
    unsigned int v7 = 0;
  }
  if (self->_isSystemTabBarVisible != v7) {
    -[DOCTabbedBrowserViewController _setShowSystemTabBar:isEditing:](self, "_setShowSystemTabBar:isEditing:");
  }
}

- (void)_setShowSystemTabBar:(BOOL)a3 isEditing:(BOOL)a4
{
  self->_isSystemTabBarVisible = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E42F8;
  v10[3] = &unk_100689160;
  void v10[4] = self;
  BOOL v11 = a3;
  BOOL v5 = objc_retainBlock(v10);
  double v6 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
  if (![v6 prefersAnimatedTabVibilityChanges])
  {

    goto LABEL_5;
  }
  unsigned __int8 v7 = [(DOCTabbedBrowserViewController *)self doc_hasAppeared];

  if ((v7 & 1) == 0)
  {
LABEL_5:
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000E43F0;
    v8[3] = &unk_100688D50;
    id v9 = v5;
    +[UIView performWithoutAnimation:v8];

    goto LABEL_6;
  }
  ((void (*)(void *))v5[2])(v5);
LABEL_6:
}

- (void)startSearchingSourcesWithConfiguration:(id)a3
{
  id v3 = [(DOCTabbedBrowserViewController *)self sourceObserver];
  [v3 startObservingSources];
}

- (void)_stopSearchingSources
{
  id v2 = [(DOCTabbedBrowserViewController *)self sourceObserver];
  [v2 stopObservingSources];
}

- (id)_multitaskingDragExclusionRects
{
  id v2 = self;
  v81.receiver = self;
  v81.super_class = (Class)DOCTabbedBrowserViewController;
  id v3 = [(DOCTabbedBrowserViewController *)&v81 _multitaskingDragExclusionRects];
  id v4 = [v3 mutableCopy];

  if ([(DOCTabbedBrowserViewController *)v2 isShowingMovePanel]) {
    [(DOCTabbedBrowserViewController *)v2 presentedViewController];
  }
  else {
  BOOL v5 = [(DOCTabbedBrowserViewController *)v2 splitBrowserViewController];
  }
  double v6 = [v5 fullDocumentManagerViewController];
  unsigned __int8 v7 = [v6 effectiveBrowserViewController];
  v71 = [v7 contentViewController];

  v72 = v2;
  if (v5 && [v5 displayMode] == (id)2)
  {
    v68 = v4;
    id v8 = [v5 sidebarViewController];
    id v9 = [v8 _multitaskingDragExclusionRects];

    id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v9;
    id v11 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v78;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v78 != v13) {
            objc_enumerationMutation(obj);
          }
          [*(id *)(*((void *)&v77 + 1) + 8 * i) CGRectValue];
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;
          id v23 = [(DOCTabbedBrowserViewController *)v2 view];
          v24 = [v23 coordinateSpace];
          [v5 sidebarViewController];
          v26 = BOOL v25 = v5;
          double v27 = [v26 view];
          id v28 = [v27 coordinateSpace];
          [v24 convertRect:v28 fromCoordinateSpace:v16, v18, v20, v22];
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;
          double v36 = v35;

          BOOL v5 = v25;
          id v2 = v72;
          v37 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v30, v32, v34, v36);
          [v10 addObject:v37];
        }
        id v12 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
      }
      while (v12);
    }

    id v4 = v68;
    [v68 addObjectsFromArray:v10];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v71 displayMode])
  {
    v69 = v4;
    v38 = [v71 _multitaskingDragExclusionRects];
    v39 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v38 count]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v40 = v38;
    id v41 = [v40 countByEnumeratingWithState:&v73 objects:v86 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v74;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v74 != v43) {
            objc_enumerationMutation(v40);
          }
          [*(id *)(*((void *)&v73 + 1) + 8 * (void)j) CGRectValue];
          double v46 = v45;
          double v48 = v47;
          double v50 = v49;
          double v52 = v51;
          v53 = [(DOCTabbedBrowserViewController *)v2 view];
          v54 = [v53 coordinateSpace];
          v55 = [v71 view];
          v56 = [v55 coordinateSpace];
          [v54 convertRect:v56 fromCoordinateSpace:v46, v48, v50, v52];
          double v58 = v57;
          double v60 = v59;
          double v62 = v61;
          double v64 = v63;

          id v2 = v72;
          v65 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v58, v60, v62, v64);
          [v39 addObject:v65];
        }
        id v42 = [v40 countByEnumeratingWithState:&v73 objects:v86 count:16];
      }
      while (v42);
    }

    id v4 = v69;
    [v69 addObjectsFromArray:v39];
  }
  unint64_t v66 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    unint64_t v66 = docLogHandle;
  }
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v83 = "-[DOCTabbedBrowserViewController _multitaskingDragExclusionRects]";
    __int16 v84 = 2112;
    id v85 = v4;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "%s setting multitasking system gesture exclusion rects: %@", buf, 0x16u);
  }

  return v4;
}

- (id)preferredFocusEnvironments
{
  if ((id)[(DOCTabbedBrowserViewController *)self browserContentStrategy] == (id)2)
  {
    id v3 = [(DOCTabbedBrowserViewController *)self selectedTabDirectChildViewController];
    id v9 = v3;
    id v4 = &v9;
LABEL_5:
    BOOL v5 = +[NSArray arrayWithObjects:v4 count:1];

    goto LABEL_7;
  }
  if ((id)[(DOCTabbedBrowserViewController *)self tabBarCurrentRawTab] == (id)2)
  {
    id v3 = [(DOCTabbedBrowserViewController *)self selectedTabReferenceViewController];
    id v8 = v3;
    id v4 = &v8;
    goto LABEL_5;
  }
  v7.receiver = self;
  v7.super_class = (Class)DOCTabbedBrowserViewController;
  BOOL v5 = [(DOCTabbedBrowserViewController *)&v7 preferredFocusEnvironments];
LABEL_7:

  return v5;
}

- (BOOL)canRevealSidebar
{
  return (id)[(DOCTabbedBrowserViewController *)self effectiveTabSwitcherTab] == (id)2
      || (id)[(DOCTabbedBrowserViewController *)self browserContentStrategy] == (id)2;
}

- (void)configureUIPDocumentLandingStyleIfNecessary
{
  id v3 = [(DOCTabbedBrowserViewController *)self configuration];
  [v3 setIsInUIPDocumentLanding:1];

  id v4 = +[UIColor clearColor];
  BOOL v5 = [(DOCTabbedBrowserViewController *)self view];
  [v5 setBackgroundColor:v4];

  double v6 = +[UIColor clearColor];
  objc_super v7 = [(DOCTabbedBrowserViewController *)self tabBarController];
  id v8 = [v7 view];
  [v8 setBackgroundColor:v6];

  id v9 = +[UIColor clearColor];
  id v10 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
  id v11 = [v10 view];
  [v11 setBackgroundColor:v9];

  id v12 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
  [v12 configureUIPDocumentLandingStyleIfNecessary];

  [(DOCTabbedBrowserViewController *)self enumerateAllFullBrowserViewControllers:&stru_1006891C8];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(DOCTabbedBrowserViewController *)self viewIfLoaded];
  [v8 frame];
  double v10 = v9;

  if (v10 != width)
  {
    [(DOCTabbedBrowserViewController *)self _updateTabButtonsVisibilityForTraits];
    id v11 = [(DOCTabbedBrowserViewController *)self traitCollection];
    -[DOCTabbedBrowserViewController _updateColumnViewAvailablityFromTraitCollection:andSize:](self, "_updateColumnViewAvailablityFromTraitCollection:andSize:", v11, width, height);
  }
  v12.receiver = self;
  v12.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DOCTabbedBrowserViewController;
  [(DOCTabbedBrowserViewController *)&v9 viewWillDisappear:a3];
  id v4 = [(DOCTabbedBrowserViewController *)self configuration];
  BOOL v5 = [v4 sceneIdentifier];
  double v6 = +[DOCInteractionManager sharedManagerFor:v5];
  [v6 setLastOpenedItem:0];

  id v7 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v7 = docLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[Interaction] Clearing lastOpenedItem in DOCTabbedBrowserVC viewWillDisappear", v8, 2u);
  }
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DOCTabbedBrowserViewController;
  [(DOCTabbedBrowserViewController *)&v5 setAdditionalLeadingNavigationBarButtonItems:a3];
  id v4 = [(DOCTabbedBrowserViewController *)self selectedTabReferenceViewController];
  [(DOCTabbedBrowserViewController *)self updateNavigationBarButtonItemsForViewController:v4];
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DOCTabbedBrowserViewController;
  [(DOCTabbedBrowserViewController *)&v5 setAdditionalTrailingNavigationBarButtonItems:a3];
  id v4 = [(DOCTabbedBrowserViewController *)self selectedTabReferenceViewController];
  [(DOCTabbedBrowserViewController *)self updateNavigationBarButtonItemsForViewController:v4];
}

- (_TtC5Files29DOCBrowserContainerController)effectiveBrowserViewController
{
  id v2 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
  id v3 = [v2 effectiveBrowserViewController];

  return (_TtC5Files29DOCBrowserContainerController *)v3;
}

- (id)selectedTabDirectChildViewController
{
  return [(DOCAutoBarHidingTabBarController *)self->_tabBarController selectedOrInflightSelectedViewController];
}

- (id)selectedTabReferenceViewController
{
  id v3 = [(DOCTabbedBrowserViewController *)self selectedTabDirectChildViewController];
  id v4 = [(DOCTabbedBrowserViewController *)self _referenceViewControllerForDirectTabChildViewController:v3];

  return v4;
}

- (BOOL)isShowingMovePanel
{
  id v2 = [(DOCTabbedBrowserViewController *)self presentedViewController];
  id v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)tabControllerIndexForTab:(unint64_t)a3
{
  objc_super v5 = [(DOCTabbedBrowserViewController *)self tabBarController];
  double v6 = [v5 viewControllers];

  unint64_t v7 = [(DOCTabbedBrowserViewController *)self tabControllerIndexForTab:a3 inViewControllers:v6];
  return v7;
}

- (unint64_t)tabBarCurrentRawTab
{
  id v2 = [(DOCTabbedBrowserViewController *)self selectedTabReferenceViewController];
  id v3 = [v2 DOCTabBarItem];
  id v4 = [v3 tab];

  return (unint64_t)v4;
}

- (unint64_t)effectiveTabSwitcherTab
{
  unint64_t result = [(DOCTabbedBrowserViewController *)self browserContentStrategy];
  if (result - 1 >= 2)
  {
    if (!result)
    {
      return [(DOCTabbedBrowserViewController *)self tabBarCurrentRawTab];
    }
  }
  else
  {
    id v4 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
    objc_super v5 = [v4 hierarchyController];
    id v6 = [v5 effectiveTabSwitcherTab];

    return (unint64_t)v6;
  }
  return result;
}

- (void)switchToTab:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      [(DOCTabbedBrowserViewController *)self switchToBrowse];
      break;
    case 1uLL:
      [(DOCTabbedBrowserViewController *)self switchToShared];
      break;
    case 0uLL:
      [(DOCTabbedBrowserViewController *)self switchToRecents];
      break;
  }
}

- (void)switchToRecents
{
}

- (void)switchToShared
{
}

- (void)switchToBrowse
{
}

- (void)switchToLocation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 effectiveTabSwitcherTab];
  [(DOCTabbedBrowserViewController *)self isSystemTabBarAllowedByTraits];
  unsigned int v6 = [(DOCTabbedBrowserViewController *)self isSystemTabBarAllowedByTraits];
  if (v5) {
    char v7 = 0;
  }
  else {
    char v7 = v6;
  }
  if (v6) {
    [(DOCTabbedBrowserViewController *)self switchToTab:v5];
  }
  if ((v7 & 1) == 0)
  {
    id v9 = v4;
    id v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [(DOCTabbedBrowserViewController *)self _setLocationsInBrowseTab:v8];
  }
}

- (id)fullBrowserHierarchyController
{
  id v2 = [(DOCSplitBrowserViewController *)self->_splitBrowserViewController fullDocumentManagerViewController];
  id v3 = [v2 hierarchyController];

  return v3;
}

- (void)presentRecentsTabFromFullBrowse
{
  id v2 = [(DOCTabbedBrowserViewController *)self fullBrowserHierarchyController];
  [v2 restoreLastBrowsedStateForTab:0];
}

- (void)presentSharedTabFromFullBrowser
{
  id v2 = [(DOCTabbedBrowserViewController *)self fullBrowserHierarchyController];
  [v2 restoreLastBrowsedStateForTab:1];
}

- (void)presentBrowseTabFromFullBrowser
{
  id v2 = [(DOCTabbedBrowserViewController *)self fullBrowserHierarchyController];
  [v2 restoreLastBrowsedStateForTab:2];
}

- (void)showConnectToServer:(id)a3
{
  id v4 = a3;
  [(DOCTabbedBrowserViewController *)self presentTab:2];
  [(DOCTabbedBrowserViewController *)self presentConnectToServer:v4];
}

- (void)willPresentSearchResultsController:(id)a3
{
}

- (void)willDismissSearchResultsController:(id)a3
{
}

- (void)splitViewController:(id)a3 wantsToShowTabBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  unsigned int v6 = [v9 fullDocumentManagerViewController];
  char v7 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];

  if (v6 == v7)
  {
    id v8 = [v9 fullDocumentManagerViewController];
    -[DOCTabbedBrowserViewController _viewController:wantsToShowSystemTabBar:isEditing:](self, "_viewController:wantsToShowSystemTabBar:isEditing:", v9, v4, [v8 isEditing]);
  }
}

- (void)splitViewController:(id)a3 didChangeFromState:(id)a4 toState:(id)a5 isUserDisplayModeChange:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a4;
  id v9 = a5;
  if (-[DOCTabbedBrowserViewController enclosedInUIPDocumentLanding](self, "enclosedInUIPDocumentLanding")&& ([v11 isSidebarShown] & 1) == 0&& objc_msgSend(v9, "isSidebarShown"))
  {
    id v10 = objc_alloc_init((Class)DOCUIPBrowserState);
    [v10 setDocumentLandingMode:0];
    if (v6) {
      [(DOCTabbedBrowserViewController *)self performBrowserStateChange:v10];
    }
  }
  [(DOCTabbedBrowserViewController *)self _setNeedsUpdateOfMultitaskingDragExclusionRects];
}

- (void)revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 completion:(id)a5
{
}

- (void)revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 openDocument:(BOOL)a5 revealContents:(BOOL)a6 updateLastUsedDate:(BOOL)a7 completion:(id)a8
{
  BOOL v29 = a4;
  BOOL v30 = a7;
  BOOL v28 = a5;
  id v10 = a3;
  id v11 = a8;
  unsigned int v12 = [v10 startAccessingSecurityScopedResource];
  v45[0] = NSURLIsDirectoryKey;
  v45[1] = NSURLIsPackageKey;
  uint64_t v13 = +[NSArray arrayWithObjects:v45 count:2];
  id v40 = 0;
  id v14 = [v10 promisedItemResourceValuesForKeys:v13 error:&v40];
  id v15 = v40;

  if (v15)
  {
    double v16 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      double v16 = docLogHandle;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v10;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to get promised item resource values for url: %@ error: %@", buf, 0x16u);
    }
  }
  double v17 = [v14 objectForKeyedSubscript:NSURLIsDirectoryKey];
  unsigned __int8 v18 = [v17 BOOLValue];

  double v19 = [v14 objectForKeyedSubscript:NSURLIsPackageKey];
  unsigned __int8 v20 = [v19 BOOLValue];

  if (v12) {
    [v10 stopAccessingSecurityScopedResource];
  }
  if ([(DOCTabbedBrowserViewController *)self isShowingMovePanel]) {
    [(DOCTabbedBrowserViewController *)self presentedViewController];
  }
  else {
  double v21 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
  }
  char v22 = v18 & (v20 ^ 1);
  if ((v22 & 1) != 0 || !v28)
  {
    [(DOCTabbedBrowserViewController *)self switchToBrowse];
    BOOL v25 = [v21 fullDocumentManagerViewController];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000E5908;
    v33[3] = &unk_100689350;
    v24 = (id *)v34;
    id v26 = v10;
    v34[0] = v26;
    BOOL v37 = v29;
    id v36 = v11;
    v34[1] = self;
    id v35 = v21;
    BOOL v38 = a6;
    char v39 = v22;
    [v25 revealDocumentAtURL:v26 importIfNeeded:0 updateLastUsedDate:v30 completion:v33];

    id v23 = v36;
  }
  else
  {
    [(DOCTabbedBrowserViewController *)self switchToRecents];
    id v23 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000E65EC;
    v31[3] = &unk_100688DA0;
    v24 = &v32;
    id v32 = v11;
    [v23 revealDocumentAtURL:v10 importIfNeeded:v29 updateLastUsedDate:v30 completion:v31];
  }
}

- (id)transitionControllerForDocumentAtURL:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DOCTabbedBrowserViewController;
  id v3 = [(DOCTabbedBrowserViewController *)&v5 transitionControllerForDocumentAtURL:a3];

  return v3;
}

- (BOOL)documentBrowser:(id)a3 shouldShowActivityViewControllerForDocumentURLs:(id)a4 barButtonItem:(id)a5 popoverTracker:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(DOCTabbedBrowserViewController *)self _shouldForwardSelectorToDelegate:a2])
  {
    uint64_t v13 = [(DOCTabbedBrowserViewController *)self delegate];
    unsigned __int8 v14 = [v13 documentBrowser:self shouldShowActivityViewControllerForDocumentURLs:v10 barButtonItem:v11 popoverTracker:v12];
  }
  else
  {
    unsigned __int8 v14 = 1;
  }

  return v14;
}

- (BOOL)documentBrowser:(id)a3 shouldHandleLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(DOCTabbedBrowserViewController *)self updateLocationTitleFromCurrentState];
  id v8 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];

  if (v8 == v7)
  {
    id v10 = [v6 fileProviderItem];
    id v11 = v10;
    if (v10 && [v10 isFolder])
    {
      id v12 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
      uint64_t v13 = [v12 fullDocumentManagerViewController];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000E6828;
      v15[3] = &unk_100688C90;
      v15[4] = self;
      [v13 revealLocation:v6 animated:0 completion:v15];

      BOOL v9 = 0;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v7 = a4;
  if ([(DOCTabbedBrowserViewController *)self _shouldForwardSelectorToDelegate:a2])
  {
    id v6 = [(DOCTabbedBrowserViewController *)self delegate];
    [v6 documentBrowser:self didPickDocumentsAtURLs:v7];
  }
  else
  {
    if (![(DOCTabbedBrowserViewController *)self _shouldForwardSelectorToDelegate:"documentBrowser:didPickDocumentURLs:"])goto LABEL_6; {
    id v6 = [(DOCTabbedBrowserViewController *)self delegate];
    }
    [v6 documentBrowser:self didPickDocumentURLs:v7];
  }

LABEL_6:
}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  id v7 = a4;
  if ([(DOCTabbedBrowserViewController *)self _shouldForwardSelectorToDelegate:a2])
  {
    id v6 = [(DOCTabbedBrowserViewController *)self delegate];
    [v6 documentBrowser:self didRequestDocumentCreationWithHandler:v7];
  }
}

- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  if ([(DOCTabbedBrowserViewController *)self _shouldForwardSelectorToDelegate:a2])
  {
    BOOL v9 = [(DOCTabbedBrowserViewController *)self delegate];
    [v9 documentBrowser:self didImportDocumentAtURL:v10 toDestinationURL:v8];
  }
}

- (void)documentBrowser:(id)a3 failedToImportDocumentAtURL:(id)a4 error:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  if ([(DOCTabbedBrowserViewController *)self _shouldForwardSelectorToDelegate:a2])
  {
    BOOL v9 = [(DOCTabbedBrowserViewController *)self delegate];
    [v9 documentBrowser:self failedToImportDocumentAtURL:v10 error:v8];
  }
}

- (id)documentBrowser:(id)a3 applicationActivitiesForDocumentURLs:(id)a4
{
  id v6 = a4;
  if ([(DOCTabbedBrowserViewController *)self _shouldForwardSelectorToDelegate:a2])
  {
    id v7 = [(DOCTabbedBrowserViewController *)self delegate];
    id v8 = [v7 documentBrowser:self applicationActivitiesForDocumentURLs:v6];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)documentBrowser:(id)a3 willPresentActivityViewController:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([(DOCTabbedBrowserViewController *)self _shouldForwardSelectorToDelegate:a2])
  {
    id v8 = [(DOCTabbedBrowserViewController *)self delegate];
    [v8 documentBrowser:v9 willPresentActivityViewController:v7];
  }
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DOCTabbedBrowserViewController;
  -[DOCTabbedBrowserViewController setAllowsPickingMultipleItems:](&v9, "setAllowsPickingMultipleItems:");
  objc_super v5 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
  [v5 setAllowsPickingMultipleItems:v3];

  id v6 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
  [v6 setAllowsPickingMultipleItems:v3];

  id v7 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
  id v8 = [v7 fullDocumentManagerViewController];
  [v8 setAllowsPickingMultipleItems:v3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if (off_100704CE8 == a6)
  {
    if ([a3 isEqualToString:@"editing"])
    {
      uint64_t v11 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
      if ((id)v11 == v10)
      {
      }
      else
      {
        id v12 = (void *)v11;
        id v13 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];

        if (v13 != v10) {
          goto LABEL_9;
        }
      }
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000E6DDC;
      v14[3] = &unk_100688C90;
      v14[4] = self;
      +[UIView performWithoutAnimation:v14];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DOCTabbedBrowserViewController;
    [(DOCTabbedBrowserViewController *)&v15 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
LABEL_9:
}

- (void)updateTabBarVisibility
{
  BOOL v3 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
  if ([v3 isEditing])
  {
    uint64_t v4 = 1;
  }
  else
  {
    objc_super v5 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
    if ([v5 isEditing])
    {
      uint64_t v4 = 1;
    }
    else
    {
      id v6 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
      id v7 = [v6 fullDocumentManagerViewController];
      uint64_t v4 = (uint64_t)[v7 isEditing];
    }
  }

  id v8 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
  if ([v8 prefersTabBarHidden])
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v10 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
    if ([v10 prefersTabBarHidden])
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v11 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
      id v12 = [v11 fullDocumentManagerViewController];
      uint64_t v9 = [v12 prefersTabBarHidden] ^ 1;
    }
  }

  [(DOCTabbedBrowserViewController *)self _viewController:0 wantsToShowSystemTabBar:v9 isEditing:v4];
}

- (BOOL)_shouldForwardSelectorToDelegate:(SEL)a3
{
  uint64_t v4 = [(DOCTabbedBrowserViewController *)self delegate];
  if (v4 == self)
  {
    char v6 = 0;
  }
  else
  {
    objc_super v5 = [(DOCTabbedBrowserViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();
  }
  return v6 & 1;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(DOCTabbedBrowserViewController *)self selectedTabDirectChildViewController];

  if (v6 == v5)
  {
    id v7 = [(DOCTabbedBrowserViewController *)self _referenceViewControllerForDirectTabChildViewController:v5];

    id v8 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
    if (v7 != v8)
    {
      uint64_t v9 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];

      if (v7 == v9)
      {
        uint64_t v11 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
      }
      else
      {
        id v10 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];

        if (v7 != v10)
        {
LABEL_17:

          goto LABEL_18;
        }
        uint64_t v11 = [(DOCTabbedBrowserViewController *)self fullSharedViewController];
      }
      id v12 = v11;
      [v11 resetNavigationStepwise];
LABEL_16:

      goto LABEL_17;
    }
    id v12 = [v7 fullDocumentManagerViewController];
    if (!+[UITraitCollection enclosingTabSwitcherCanBeFloating](UITraitCollection, "enclosingTabSwitcherCanBeFloating")|| ![v12 _canNavigateBack])
    {
      if ([v7 displayMode] == (id)1)
      {
        [v7 showSidebar];
        goto LABEL_16;
      }
      if ([v7 displayMode] == (id)3)
      {
        [v7 hideSidebar];
        goto LABEL_16;
      }
    }
    [v12 popToRootViewControllerAnimated:1];
    goto LABEL_16;
  }
  id v7 = v5;
LABEL_18:

  return v6 != v5;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v10 = [(DOCTabbedBrowserViewController *)self _referenceViewControllerForDirectTabChildViewController:a4];
  id v5 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];

  if (v10 != v5)
  {
    id v6 = [(DOCTabbedBrowserViewController *)self fullRecentsViewController];
    [v6 dismissSearch];
  }
  id v7 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];

  if (v10 != v7)
  {
    id v8 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
    uint64_t v9 = [v8 fullDocumentManagerViewController];
    [v9 dismissSearch];
  }
  [(DOCTabbedBrowserViewController *)self saveSelectedTabState];
  [(DOCTabbedBrowserViewController *)self updateNavigationBarButtonItemsForViewController:v10];
  [(DOCTabbedBrowserViewController *)self updateLocationTitleFromCurrentState];
}

- (unint64_t)defaultInitialBrowsedPathEffectiveTab
{
  unint64_t v3 = [(DOCTabbedBrowserViewController *)self _mostRecentBrowsedPathEffectiveTab];
  uint64_t v4 = [(DOCTabbedBrowserViewController *)self configuration];
  unsigned int v5 = [v4 canPresentContentForTab:v3];

  if (v5) {
    return v3;
  }
  else {
    return 2;
  }
}

- (void)saveSelectedTabState
{
  unint64_t v3 = +[DOCUserInterfaceStateStore sharedStore];
  uint64_t v4 = [(DOCTabbedBrowserViewController *)self configuration];
  id v7 = [v3 interfaceStateForConfiguration:v4];

  [v7 updateMostRecentlyVisitedBrowseSourceToTab:[self effectiveTabSwitcherTab]];
  unsigned int v5 = +[DOCUserInterfaceStateStore sharedStore];
  id v6 = [(DOCTabbedBrowserViewController *)self configuration];
  [v5 updateInterfaceState:v7 forConfiguration:v6];
}

- (void)dismissAllPresentedViewControllers:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v8 = (void (**)(void))a4;
  id v6 = [(DOCTabbedBrowserViewController *)self presentedViewController];

  if (v6)
  {
    id v7 = [(DOCTabbedBrowserViewController *)self presentedViewController];
    [v7 dismissViewControllerAnimated:v4 completion:v8];
  }
  else
  {
    v8[2]();
  }
}

- (void)importDocumentAtURL:(id)a3 nextToDocumentAtURL:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
  id v13 = [v14 documentManager];
  [v13 importDocumentAt:v12 nextTo:v11 mode:a5 completionHandler:v10];
}

- (void)importDocumentAtURL:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = [(DOCTabbedBrowserViewController *)self effectiveFullBrowser];
  id v10 = [v11 documentManager];
  [v10 importDocumentAt:v9 mode:a4 toCurrentBrowserLocationWithCompletion:v8];
}

- (void)setIsAppLaunchOptimizationsActive:(BOOL)a3
{
  self->_isAppLaunchOptimizationsActive = a3;
}

- (DOCSourceObserver)sourceObserver
{
  return (DOCSourceObserver *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSourceObserver:(id)a3
{
}

- (_TtC5Files24DOCNamedLocationResolver)namedLocationResolver
{
  return (_TtC5Files24DOCNamedLocationResolver *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)safeAreaUpdatesDisabledDuringTransitions
{
  return self->_safeAreaUpdatesDisabledDuringTransitions;
}

- (BOOL)isShowingSearchResults
{
  return self->_isShowingSearchResults;
}

- (DOCUIPBrowserState)deferredBrowserStateChanges
{
  return self->_deferredBrowserStateChanges;
}

- (BOOL)isSystemTabBarAllowedByTraits
{
  return self->_isSystemTabBarAllowedByTraits;
}

- (BOOL)isSystemTabBarPreferred
{
  return self->_isSystemTabBarPreferred;
}

- (void)setIsSystemTabBarPreferred:(BOOL)a3
{
  self->_isSystemTabBarPreferred = a3;
}

- (BOOL)isSystemTabBarVisible
{
  return self->_isSystemTabBarVisible;
}

- (void)setIsSystemTabBarVisible:(BOOL)a3
{
  self->_isSystemTabBarVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSourceUIManager, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_deferredBrowserStateChanges, 0);
  objc_storeStrong((id *)&self->_currentLocationTitle, 0);
  objc_storeStrong((id *)&self->_namedLocationResolver, 0);
  objc_storeStrong((id *)&self->_sourceObserver, 0);
  objc_destroyWeak((id *)&self->_tabbedBrowserViewControllerDelegate);
  objc_storeStrong((id *)&self->_splitBrowserViewController, 0);
  objc_storeStrong((id *)&self->_fullSharedViewController, 0);
  objc_storeStrong((id *)&self->_fullRecentsViewController, 0);

  objc_storeStrong((id *)&self->_didLoadStateByTab, 0);
}

- (id)newViewControllersSharing:(id)a3 tabBarItems:(id)a4
{
  type metadata accessor for DOCTabBarItem();
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_1002D6320(v6, v7, v8);

  swift_bridgeObjectRelease();
  sub_10009E6C4(0, (unint64_t *)&qword_100707710);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)selectAll:(id)a3
{
  if (a3)
  {
    BOOL v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    unsigned int v5 = self;
  }
  unint64_t v6 = [(DOCTabbedBrowserViewController *)self splitBrowserViewController];
  id v7 = [(DOCSplitBrowserViewController *)v6 fullDocumentManagerViewController];

  sub_100435F7C((uint64_t)&v8, 0);
  sub_1000CBBA4((uint64_t)&v8, (uint64_t *)&unk_100705D60);
}

- (void)performDeselectAll:(id)a3
{
  if (a3)
  {
    BOOL v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    unsigned int v5 = self;
  }
  sub_100300644();

  sub_1000CBBA4((uint64_t)v6, (uint64_t *)&unk_100705D60);
}

- (void)performGoToRecents:(id)a3
{
}

- (void)performGoToBrowse:(id)a3
{
}

- (void)performGoToEnclosingFolder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self;
  unint64_t v6 = [(DOCTabbedBrowserViewController *)v5 splitBrowserViewController];
  [(DOCSplitBrowserViewController *)v6 showSidebar];
}

- (void)performConnectToServer:(id)a3
{
  uint64_t v5 = type metadata accessor for DOCAnalyticsConnectToServerShownEvent.Origin();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DOCAnalyticsConnectToServerShownEvent();
  uint64_t v10 = *(void *)(v9 - 8);
  double v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, double))(v6 + 104))(v8, enum case for DOCAnalyticsConnectToServerShownEvent.Origin.keyCommand(_:), v5, v11);
  id v14 = a3;
  objc_super v15 = self;
  DOCAnalyticsConnectToServerShownEvent.init(bundleID:origin:)();
  type metadata accessor for DOCAnalyticsManager();
  double v16 = (void *)static DOCAnalyticsManager.shared.getter();
  DOCAnalyticsManager.sendConnectToServerShownEvent(_:)();

  [(DOCTabbedBrowserViewController *)v15 presentConnectToServer:0];
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (void)performGoToDocuments:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10030141C();
}

- (void)performGoToDesktop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100301600();
}

- (void)performGoToDownloads:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(DOCTabbedBrowserViewController *)v5 namedLocationResolver];
  uint64_t v7 = (void *)swift_allocObject();
  v7[3] = 0;
  void v7[4] = 0;
  v7[2] = v5;
  long long v8 = v5;
  sub_1003FF82C(2, (uint64_t)sub_100301B18, (uint64_t)v7);

  swift_release();
}

- (void)performGoToICloudDrive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003017EC();
}

- (void)performGoToShared:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = [v5 sharedItemsLocation];
  [(DOCTabbedBrowserViewController *)v7 switchToLocation:v8];
}

- (void)applyBrowserStateChange:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  *(void *)(v5 + 24) = a3;
  void v10[4] = sub_10044CC14;
  void v10[5] = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1000666D8;
  v10[3] = &unk_1006AC118;
  id v6 = _Block_copy(v10);
  id v7 = a3;
  id v8 = self;
  id v9 = v7;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v6);
}

- (void)applyBrowserStateChange:(id)a3 force:(BOOL)a4
{
}

- (void)performBrowserStateChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DOCTabbedBrowserViewController.performBrowserStateChange(_:)((uint64_t)v4);
}

- (void)_applyBrowserStateChange:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100447434(v6, a4);
}

- (void)updateDeferredBrowserStateChangesWith:(id)a3
{
  uint64_t v5 = type metadata accessor for DOCUIPBrowserState();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  uint64_t v10 = self;
  static DOCUIPBrowserState._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100447708();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }
  unsigned __int8 v8 = DOCTabbedBrowserViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_1000CBBA4((uint64_t)v10, (uint64_t *)&unk_100705D60);
  return v8 & 1;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    uint64_t v7 = self;
  }
  DOCTabbedBrowserViewController.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v16, (uint64_t)v17);

  sub_1000CBBA4((uint64_t)v16, (uint64_t *)&unk_100705D60);
  uint64_t v8 = v18;
  if (v18)
  {
    id v9 = sub_1000A6B78(v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    double v11 = __chkstk_darwin(v9);
    id v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v10 + 16))(v13, v11);
    id v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    sub_10009B1B8((uint64_t)v17);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)presentConnectToServer:(id)a3 askPermission:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  double v11 = self;
  if (v4)
  {
    sub_100527364((uint64_t)v9);
  }
  else
  {
    URL._bridgeToObjectiveC()(v10);
    id v13 = v12;
    [(DOCTabbedBrowserViewController *)v11 presentConnectToServer:v12];

    double v11 = v13;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)presentConnectToServer:(id)a3
{
  uint64_t v5 = sub_1000CBE70(&qword_1007076B0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  uint64_t v10 = self;
  sub_100527A40((uint64_t)v7);

  sub_1000CBBA4((uint64_t)v7, &qword_1007076B0);
}

- (void)presentGoToLocation
{
  id v2 = self;
  sub_100527FC4();
}

- (void)actionControllerDidFinishAction:(id)a3 userInfo:(id)a4 error:(id)a5
{
  if (a4) {
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = self;
  DOCTabbedBrowserViewController.actionControllerDidFinishAction(_:userInfo:error:)(v9, v8, (uint64_t)a5);

  swift_bridgeObjectRelease();
}

- (void)actionControllerDidFinishAction:(id)a3 error:(id)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  if (a4)
  {
    id v8 = a4;
    uint64_t v9 = _convertErrorToNSError(_:)();
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = (id)v9;
  -[DOCTabbedBrowserViewController actionControllerDidFinishAction:userInfo:error:](v7, "actionControllerDidFinishAction:userInfo:error:", v6, 0);
}

- (void)actionController:(id)a3 presentError:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  id v12 = a4;
  id v10 = self;
  uint64_t v11 = (void *)_convertErrorToNSError(_:)();
  DOCPresentAlertForError();

  _Block_release(v8);
}

- (int64_t)tabSwitcherStyleForCompactPresentation
{
  id v2 = self;
  int64_t v3 = sub_100528B54();

  return v3;
}

@end