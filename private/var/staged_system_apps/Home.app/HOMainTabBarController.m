@interface HOMainTabBarController
+ (id)preloadTabIcons;
+ (void)_checkForTestingFlags;
- (BOOL)_debug_viewHasEverAppeared;
- (BOOL)_shouldShowOnboardingWelcomeOrLoadingView;
- (BOOL)changingSelectedViewControllerProgrammatically;
- (BOOL)isViewVisible;
- (BOOL)shouldScrollToDefaultPosition;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (HOAppNavigator)navigator;
- (HOBaseController)baseController;
- (HOMainTabBarController)init;
- (HOMainTabBarItemManager)itemManager;
- (HUWallpaperView)wallpaperView;
- (NAFuture)dataSyncStateChangeProcessingFuture;
- (NAFuture)loadTabsFuture;
- (NSMutableArray)viewVisibleFutures;
- (NSMutableDictionary)tabClassToNavigationControllerMap;
- (id)_displayedIdentifiersArray;
- (id)_itemForMainTabIdentifier:(id)a3;
- (id)_navigationControllerForInitialSelection;
- (id)_navigationControllerForItem:(id)a3;
- (id)_navigationControllerForMainTabIdentifier:(id)a3;
- (id)dismissPresentedViewControllersAnimated:(BOOL)a3;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5;
- (id)selectCurrentTab;
- (id)selectTabWithIdentifier:(id)a3;
- (id)tabBarController:(id)a3 animationControllerForTransitionFromViewController:(id)a4 toViewController:(id)a5;
- (unint64_t)_indexOfTabForIdentifier:(id)a3;
- (void)_configureTabBarWithImageNamed:(id)a3 forViewController:(id)a4;
- (void)_persistLastSelectedTab;
- (void)_reloadNavigationControllers;
- (void)_setSelectedViewController:(id)a3 persistSelection:(BOOL)a4;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)refreshAfterSidebarTabbarSwitchWithDashboardContext:(id)a3;
- (void)selectDiscoverTab:(id)a3;
- (void)setBaseController:(id)a3;
- (void)setChangingSelectedViewControllerProgrammatically:(BOOL)a3;
- (void)setDashboardNavigator:(id)a3;
- (void)setDataSyncStateChangeProcessingFuture:(id)a3;
- (void)setItemManager:(id)a3;
- (void)setLoadTabsFuture:(id)a3;
- (void)setLoadingViewController:(id)a3;
- (void)setNavigator:(id)a3;
- (void)setShouldScrollToDefaultPosition:(BOOL)a3;
- (void)setTabClassToNavigationControllerMap:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)set_debug_viewHasEverAppeared:(BOOL)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HOMainTabBarController

+ (id)preloadTabIcons
{
  if (qword_1000DE968 != -1) {
    dispatch_once(&qword_1000DE968, &stru_1000C3F68);
  }
  v2 = (void *)qword_1000DE960;

  return v2;
}

- (HOMainTabBarController)init
{
  v20.receiver = self;
  v20.super_class = (Class)HOMainTabBarController;
  v3 = [(HOMainTabBarController *)&v20 init];
  v4 = v3;
  if (v3)
  {
    [(HOMainTabBarController *)v3 setDelegate:v3];
    v5 = [(HOMainTabBarController *)v4 tabBar];
    [v5 setBarStyle:0];

    uint64_t v6 = +[NSMutableDictionary dictionary];
    tabClassToNavigationControllerMap = v4->_tabClassToNavigationControllerMap;
    v4->_tabClassToNavigationControllerMap = (NSMutableDictionary *)v6;

    uint64_t v8 = +[NSMutableArray array];
    viewVisibleFutures = v4->_viewVisibleFutures;
    v4->_viewVisibleFutures = (NSMutableArray *)v8;

    v10 = (NAFuture *)objc_alloc_init((Class)NAFuture);
    loadTabsFuture = v4->_loadTabsFuture;
    v4->_loadTabsFuture = v10;

    v12 = [[HOBaseController alloc] initWithRootController:v4];
    baseController = v4->_baseController;
    v4->_baseController = v12;

    v14 = [[HOMainTabBarItemManager alloc] initWithDelegate:v4];
    itemManager = v4->_itemManager;
    v4->_itemManager = v14;

    id v16 = [(HOMainTabBarItemManager *)v4->_itemManager reloadAndUpdateAllItemsFromSenderSelector:a2];
    uint64_t v17 = +[NAFuture futureWithNoResult];
    dataSyncStateChangeProcessingFuture = v4->_dataSyncStateChangeProcessingFuture;
    v4->_dataSyncStateChangeProcessingFuture = (NAFuture *)v17;
  }
  return v4;
}

- (void)setViewVisible:(BOOL)a3
{
  if (self->_viewVisible != a3)
  {
    self->_viewVisible = a3;
    v5 = [(HOMainTabBarController *)self viewVisibleFutures];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004306C;
    v7[3] = &unk_1000C3DB0;
    BOOL v8 = a3;
    [v5 na_each:v7];

    uint64_t v6 = [(HOMainTabBarController *)self viewVisibleFutures];
    [v6 removeAllObjects];
  }
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HOMainTabBarController;
  [(HOMainTabBarController *)&v11 viewDidLoad];
  if ([(HOMainTabBarController *)self _shouldShowOnboardingWelcomeOrLoadingView])
  {
    id v3 = objc_alloc((Class)HUWallpaperView);
    v4 = [(HOMainTabBarController *)self view];
    [v4 bounds];
    v5 = [v3 initWithFrame:];
    wallpaperView = self->_wallpaperView;
    self->_wallpaperView = v5;

    [(HUWallpaperView *)self->_wallpaperView setAutoresizingMask:18];
    v7 = [(HOMainTabBarController *)self view];
    [v7 addSubview:self->_wallpaperView];

    BOOL v8 = [(HOMainTabBarController *)self view];
    [v8 sendSubviewToBack:self->_wallpaperView];

    v9 = +[HFWallpaperManager sharedInstance];
    v10 = [v9 defaultWallpaperForCollectionType:0];

    [(HUWallpaperView *)self->_wallpaperView populateWallpaper:v10 withAnimation:1 onlyIfNeeded:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HOMainTabBarController;
  [(HOMainTabBarController *)&v12 viewDidAppear:a3];
  [(HOMainTabBarController *)self setViewVisible:1];
  if (+[HFUtilities isInternalInstall])
  {
    v4 = [(HOMainTabBarController *)self loadTabsFuture];
    id v5 = [v4 addCompletionBlock:&stru_1000C3DF0];
  }
  uint64_t v6 = [(HOMainTabBarController *)self baseController];
  [v6 reloadInitialSetup];

  if (![(HOMainTabBarController *)self _debug_viewHasEverAppeared])
  {
    [(HOMainTabBarController *)self set_debug_viewHasEverAppeared:1];
    objc_initWeak(&location, self);
    v7 = [(HOMainTabBarController *)self loadTabsFuture];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100043324;
    v9[3] = &unk_1000C3E18;
    objc_copyWeak(&v10, &location);
    id v8 = [v7 addCompletionBlock:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(HOMainTabBarController *)self setViewVisible:0];
  v5.receiver = self;
  v5.super_class = (Class)HOMainTabBarController;
  [(HOMainTabBarController *)&v5 viewDidDisappear:v3];
}

- (id)selectCurrentTab
{
  BOOL v3 = +[HFStateRestorationSettings sharedInstance];
  uint64_t v4 = [v3 selectedHomeAppTabIdentifier];
  objc_super v5 = (void *)v4;
  uint64_t v6 = (void *)HFHomeAppTabIdentifierHome;
  if (v4) {
    uint64_t v6 = (void *)v4;
  }
  id v7 = v6;

  id v8 = [(HOMainTabBarController *)self selectTabWithIdentifier:v7];

  return v8;
}

- (id)selectTabWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[HOMainTabBarController selectTabWithIdentifier:]";
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, tabIdentifier: %@", buf, 0x16u);
  }

  id v6 = objc_alloc_init((Class)NAFuture);
  objc_initWeak((id *)buf, self);
  id v7 = [(HOMainTabBarController *)self loadTabsFuture];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004379C;
  v14[3] = &unk_1000C3E90;
  objc_copyWeak(&v17, (id *)buf);
  id v8 = v4;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v10 = [v7 addCompletionBlock:v14];

  objc_super v11 = v16;
  id v12 = v9;

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

  return v12;
}

- (id)dismissPresentedViewControllersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = [(HOMainTabBarController *)self hu_dismissViewControllerAnimated:v3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100043D44;
  v8[3] = &unk_1000C3EB8;
  objc_copyWeak(&v9, &location);
  BOOL v10 = v3;
  id v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  id v6 = a5;
  if ([(HOMainTabBarController *)self isViewVisible]
    || ([v6 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 BOOLValue],
        v7,
        (v8 & 1) != 0))
  {
    id v9 = +[NAFuture futureWithNoResult];
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100043F40;
    v14[3] = &unk_1000C36D0;
    id v10 = objc_alloc_init((Class)NAFuture);
    id v15 = v10;
    objc_super v11 = +[NAFuture futureWithBlock:v14];
    id v12 = [(HOMainTabBarController *)self viewVisibleFutures];
    [v12 addObject:v11];

    id v9 = v10;
  }

  return v9;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  [a4 performWithOptions:0];

  [(HOMainTabBarController *)self _reloadNavigationControllers];
}

- (id)tabBarController:(id)a3 animationControllerForTransitionFromViewController:(id)a4 toViewController:(id)a5
{
  if ([(HOMainTabBarController *)self changingSelectedViewControllerProgrammatically])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_alloc_init((Class)HUPreloadedTransitionController);
  }

  return v5;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a4;
  id v7 = [a3 selectedViewController];
  [(HOMainTabBarController *)self setShouldScrollToDefaultPosition:v7 == v6];

  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if ([(HOMainTabBarController *)self shouldScrollToDefaultPosition] && v10)
  {
    objc_super v11 = [v10 viewControllers];
    -[HOMainTabBarController setShouldScrollToDefaultPosition:](self, "setShouldScrollToDefaultPosition:", [v11 count] == (id)1);
  }
  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[HOMainTabBarController tabBarController:didSelectViewController:]";
    __int16 v9 = 2048;
    id v10 = [(HOMainTabBarController *)self selectedIndex];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%s) User selected tab index %lu", (uint8_t *)&v7, 0x16u);
  }

  [(HOMainTabBarController *)self _persistLastSelectedTab];
  if ([(HOMainTabBarController *)self shouldScrollToDefaultPosition])
  {
    id v6 = [(HOMainTabBarController *)self navigator];
    [v6 scrollToDefaultPositionInCurrentContextAnimated:1];

    [(HOMainTabBarController *)self setShouldScrollToDefaultPosition:0];
  }
}

+ (void)_checkForTestingFlags
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  BOOL v3 = [v2 home];

  id v4 = objc_alloc((Class)HFUserItem);
  id v5 = [v3 currentUser];
  id v6 = [v4 initWithHome:v3 user:v5 nameStyle:0];

  if (HFCheckAndClearResetIdentifyVoicePreference())
  {
    id v7 = [v6 setDismissIdentifyVoiceOnboarding:0];
    id v8 = [v6 setDismissIdentifyVoiceReminderBanner:0];
  }
  if (HFCheckAndClearResetAnnouncePreference()) {
    id v9 = [v6 setDismissAnnounceOnboarding:0];
  }
  if (HFCheckAndClearResetHomeTheaterPreference()) {
    id v10 = [v6 setDismissHomeTheaterOnboarding:0];
  }
  if (HFCheckAndClearResetTVViewingProfilesPreference())
  {
    id v11 = [v6 setDismissTVViewingProfilesOnboarding:0];
    id v12 = [v6 setDismissTVViewingProfilesReminderBanner:0];
  }
  if (HFCheckAndClearResetNaturalLightingPreference()) {
    id v13 = [v6 setDismissNaturalLightingOnboarding:0];
  }
  if (HFCheckAndClearResetCameraRecordingPreference())
  {
    id v14 = [v6 setDismissCameraRecordingOnboarding:0];
    id v15 = [v6 setDismissCameraRecordingReminderBanner:0];
  }
  if (HFCheckAndClearResetWalletKeyExpressModePreference()) {
    id v16 = [v6 setDismissWalletKeyExpressModeOnboarding:0 forWalletKeyUUID:0];
  }
  if (HFCheckAndClearResetAccessCodePreference()) {
    id v17 = [v6 setDismissAccessCodeOnboarding:0];
  }
  if (HFCheckAndClearResetAccessoryFirmwareUpdatePreference()) {
    id v18 = [v6 setDismissAccessoryFirmwareUpdateOnboarding:0];
  }
  if (HFCheckAndClearResetUtilityPreference()) {
    id v19 = [v6 setDismissUtilityOnboarding:0];
  }
  if (HFCheckAndClearResetRedesignMigrationPreference())
  {
    __int16 v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Resetting hf_homeHasMigratedForRedesign", v22, 2u);
    }

    id v21 = [v3 hf_setHomeHasMigratedForRedesign:0];
  }
}

- (void)_setSelectedViewController:(id)a3 persistSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(HOMainTabBarController *)self setChangingSelectedViewControllerProgrammatically:1];
  [(HOMainTabBarController *)self setSelectedViewController:v6];

  if (v4) {
    [(HOMainTabBarController *)self _persistLastSelectedTab];
  }

  [(HOMainTabBarController *)self setChangingSelectedViewControllerProgrammatically:0];
}

- (void)_reloadNavigationControllers
{
  BOOL v3 = [(HOMainTabBarController *)self itemManager];
  uint64_t v4 = [v3 displayedItemsInSection:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004477C;
  v19[3] = &unk_1000C2008;
  v19[4] = self;
  id v5 = [v4 na_map:v19];

  id v6 = [(HOMainTabBarController *)self loadTabsFuture];
  LOBYTE(v4) = [v6 isFinished];

  if ((v4 & 1) == 0)
  {
    if ([v5 count])
    {
      id v7 = +[HFHomeKitDispatcher sharedDispatcher];
      if ([v7 hasLoadedHomes])
      {
        id v8 = +[HFHomeKitDispatcher sharedDispatcher];
        id v9 = [v8 home];

        if (v9) {
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    id v10 = [(HOMainTabBarController *)self baseController];
    id v11 = [v10 loadLoadingViewController];

    __int16 v20 = v11;
    id v12 = +[NSArray arrayWithObjects:&v20 count:1];
    [(HOMainTabBarController *)self setViewControllers:v12];
  }
LABEL_8:
  if ([v5 count])
  {
    id v13 = [(HOMainTabBarController *)self wallpaperView];
    [v13 removeFromSuperview];

    id v14 = [(HOMainTabBarController *)self loadTabsFuture];
    unsigned int v15 = [v14 isFinished];

    if (v15)
    {
      [(HOMainTabBarController *)self setViewControllers:v5 animated:0];
    }
    else
    {
      id v16 = [(HOMainTabBarController *)self _navigationControllerForInitialSelection];
      id v17 = [v16 hu_preloadContent];
      [(HOMainTabBarController *)self setViewControllers:v5 animated:0];
      [(HOMainTabBarController *)self _setSelectedViewController:v16 persistSelection:0];
      id v18 = [(HOMainTabBarController *)self loadTabsFuture];
      [v18 finishWithNoResult];
    }
  }
}

- (unint64_t)_indexOfTabForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HOMainTabBarController *)self itemManager];
  id v6 = [v5 displayedItemsInSection:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100044858;
  v10[3] = &unk_1000C3EE0;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v6 indexOfObjectPassingTest:v10];

  return (unint64_t)v8;
}

- (id)_itemForMainTabIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HOMainTabBarController *)self itemManager];
  id v6 = [v5 allDisplayedItems];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000449A0;
  v10[3] = &unk_1000C3F08;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v6 na_firstObjectPassingTest:v10];

  return v8;
}

- (id)_navigationControllerForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 latestResults];
  id v6 = (objc_class *)[v5 objectForKeyedSubscript:@"HOResultTabClassKey"];

  id v7 = [v4 latestResults];
  id v8 = [v7 objectForKeyedSubscript:@"HOResultTabTitleKey"];

  id v9 = [v4 latestResults];
  id v10 = [v9 objectForKeyedSubscript:HFResultDisplayIconNamesKey];

  if (v6) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v10 == 0)
  {
    NSLog(@"Tab does not have required keys for item: %@", v4);
    id v14 = 0;
  }
  else
  {
    id v13 = [(HOMainTabBarController *)self tabClassToNavigationControllerMap];
    id v14 = [v13 objectForKeyedSubscript:v6];

    if (v14)
    {
      id v15 = [v14 topViewController];
      [(HOMainTabBarController *)self _configureTabBarWithImageNamed:v10 forViewController:v15];
    }
    else
    {
      id v15 = objc_alloc_init(v6);
      if ([(objc_class *)v6 isEqual:objc_opt_class()])
      {
        id v16 = [v4 latestResults];
        id v17 = [v16 objectForKeyedSubscript:@"HOResultMainTabIdentifierKey"];
        unsigned int v18 = [v17 isEqualToString:HFHomeAppTabIdentifierDiscover];

        if (v18)
        {
          id v19 = [HODiscoverWebViewController alloc];
          __int16 v20 = [v4 latestResults];
          id v21 = [v20 objectForKeyedSubscript:HFResultStoreLocaleDictionaryArgumentsKey];
          v22 = [(HODiscoverWebViewController *)v19 initWithLocalizationDictionary:v21];

          id v15 = v22;
        }
      }
      v23 = [v15 tabBarItem];
      [v23 setTitle:v8];

      v24 = +[NSString stringWithFormat:@"Home.Tab.%@", v8];
      v25 = [v15 tabBarItem];
      [v25 setAccessibilityIdentifier:v24];

      [(HOMainTabBarController *)self _configureTabBarWithImageNamed:v10 forViewController:v15];
      v26 = [v4 latestResults];
      v27 = [v26 objectForKeyedSubscript:@"HOResultNavigationBarClassKey"];
      uint64_t v28 = (uint64_t)v27;
      if (!v27) {
        uint64_t v28 = objc_opt_class();
      }

      id v14 = [objc_alloc((Class)HUDashboardNavigationController) initWithNavigationBarClass:v28 toolbarClass:0];
      [v14 pushViewController:v15 animated:0];
      v29 = [(HOMainTabBarController *)self tabClassToNavigationControllerMap];
      [v29 setObject:v14 forKeyedSubscript:v6];
    }
  }

  return v14;
}

- (void)_configureTabBarWithImageNamed:(id)a3 forViewController:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [(id)qword_1000DE958 objectForKey:v9];
  if (!v6)
  {
    id v7 = +[UIImage systemImageNamed:v9];
    id v6 = [v7 _imageThatSuppressesAccessibilityHairlineThickening];
  }
  id v8 = [v5 tabBarItem];
  [v8 setImage:v6];
}

- (id)_navigationControllerForMainTabIdentifier:(id)a3
{
  id v4 = [(HOMainTabBarController *)self _itemForMainTabIdentifier:a3];
  if (v4)
  {
    id v5 = [(HOMainTabBarController *)self _navigationControllerForItem:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_displayedIdentifiersArray
{
  v2 = [(HOMainTabBarController *)self itemManager];
  BOOL v3 = [v2 displayedItemsInSection:0];
  id v4 = [v3 na_map:&stru_1000C3F48];

  return v4;
}

- (id)_navigationControllerForInitialSelection
{
  id v4 = +[HFStateRestorationSettings sharedInstance];
  id v5 = [v4 selectedHomeAppTabIdentifier];

  if ([UIApp launchedToTest])
  {
    id v6 = HFHomeAppTabIdentifierHome;

    id v5 = v6;
  }
  id v7 = [(HOMainTabBarController *)self _navigationControllerForMainTabIdentifier:v5];
  if (!v7)
  {
    if (v5)
    {
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100083904((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    id v7 = [(HOMainTabBarController *)self _navigationControllerForMainTabIdentifier:HFHomeAppTabIdentifierHome];
    if (!v7)
    {
      id v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"HOMainTabBarController.m" lineNumber:553 description:@"We should always have a navigation controller for the Home tab"];

      id v7 = 0;
    }
  }

  return v7;
}

- (void)_persistLastSelectedTab
{
  id v3 = [(HOMainTabBarController *)self selectedIndex];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(@"UITabBarController doesn't have a selected tab!", 0);
  }
  else
  {
    id v4 = v3;
    id v5 = [(HOMainTabBarController *)self itemManager];
    id v6 = +[NSIndexPath indexPathForItem:v4 inSection:0];
    id v7 = [v5 displayedItemAtIndexPath:v6];

    id v8 = [v7 latestResults];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"HOResultMainTabIdentifierKey"];

    if (v9)
    {
      uint64_t v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v15 = "-[HOMainTabBarController _persistLastSelectedTab]";
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%s) Persisting tab: %@", buf, 0x16u);
      }

      uint64_t v11 = +[HFStateRestorationSettings sharedInstance];
      [v11 setSelectedHomeAppTabIdentifier:v9];

      if ([v9 isEqualToString:HFHomeAppTabIdentifierDiscover])
      {
        uint64_t v12 = +[NSMutableDictionary dictionary];
        uint64_t v13 = +[NSNumber numberWithInt:1];
        [v12 setObject:v13 forKeyedSubscript:HFAnalyticsDiscoverTabTapCountKey];

        +[HFAnalytics sendEvent:10 withData:v12];
      }
    }
    else
    {
      NSLog(@"Tab item: %@ is missing a persistant identifier", v7);
    }
  }
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HOMainTabBarController *)self presentedViewController];
  unsigned __int8 v8 = [v6 naui_isDescendantOfViewController:v7];

  if ((v8 & 1) == 0) {
    NSLog(@"Presented view controller %@ is requesting dismissal when it was not presented by %@!", v6, self);
  }
  uint64_t v9 = +[UIDevice currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  if (!v10)
  {
    uint64_t v11 = +[UIDevice currentDevice];
    [v11 setOrientation:1 animated:0];
  }
  uint64_t v12 = [(HOMainTabBarController *)self hu_dismissViewControllerAnimated:v4];

  return v12;
}

- (BOOL)_shouldShowOnboardingWelcomeOrLoadingView
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  id v3 = [v2 homeManager];

  BOOL v4 = +[HFHomeKitDispatcher sharedDispatcher];
  id v5 = [v4 home];
  if (v5) {
    unsigned int v6 = [v3 hf_hasSeenOnboardingWelcomeView] ^ 1;
  }
  else {
    LOBYTE(v6) = 1;
  }

  if ([v3 dataSyncState] == (id)1) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)setLoadingViewController:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];

  -[HOMainTabBarController setViewControllers:](self, "setViewControllers:", v5, v6);
}

- (void)refreshAfterSidebarTabbarSwitchWithDashboardContext:(id)a3
{
  id v10 = a3;
  id v4 = +[HFStateRestorationSettings sharedInstance];
  id v5 = [v4 selectedHomeAppTabIdentifier];
  id v6 = [(HOMainTabBarController *)self _navigationControllerForMainTabIdentifier:v5];

  if (!v6)
  {
    id v6 = [(HOMainTabBarController *)self _navigationControllerForMainTabIdentifier:HFHomeAppTabIdentifierHome];
  }
  BOOL v7 = [(HOMainTabBarController *)self childViewControllers];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8) {
    [(HOMainTabBarController *)self _setSelectedViewController:v6 persistSelection:1];
  }
  if (v10)
  {
    uint64_t v9 = [(HOMainTabBarController *)self navigator];
    [v9 configureDashboardContextWithDashboardContext:v10 navigationController:v6 animated:0];
  }
}

- (void)selectDiscoverTab:(id)a3
{
  id v4 = [(HOMainTabBarController *)self navigator];
  id v3 = [v4 showDiscoverTab];
}

- (HOAppNavigator)navigator
{
  return self->_navigator;
}

- (void)setNavigator:(id)a3
{
}

- (void)setDashboardNavigator:(id)a3
{
}

- (HOBaseController)baseController
{
  return self->_baseController;
}

- (void)setBaseController:(id)a3
{
}

- (HOMainTabBarItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (NAFuture)loadTabsFuture
{
  return self->_loadTabsFuture;
}

- (void)setLoadTabsFuture:(id)a3
{
}

- (BOOL)changingSelectedViewControllerProgrammatically
{
  return self->_changingSelectedViewControllerProgrammatically;
}

- (void)setChangingSelectedViewControllerProgrammatically:(BOOL)a3
{
  self->_changingSelectedViewControllerProgrammatically = a3;
}

- (NAFuture)dataSyncStateChangeProcessingFuture
{
  return self->_dataSyncStateChangeProcessingFuture;
}

- (void)setDataSyncStateChangeProcessingFuture:(id)a3
{
}

- (NSMutableDictionary)tabClassToNavigationControllerMap
{
  return self->_tabClassToNavigationControllerMap;
}

- (void)setTabClassToNavigationControllerMap:(id)a3
{
}

- (BOOL)_debug_viewHasEverAppeared
{
  return self->__debug_viewHasEverAppeared;
}

- (void)set_debug_viewHasEverAppeared:(BOOL)a3
{
  self->__debug_viewHasEverAppeared = a3;
}

- (BOOL)shouldScrollToDefaultPosition
{
  return self->_shouldScrollToDefaultPosition;
}

- (void)setShouldScrollToDefaultPosition:(BOOL)a3
{
  self->_shouldScrollToDefaultPosition = a3;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (NSMutableArray)viewVisibleFutures
{
  return self->_viewVisibleFutures;
}

- (HUWallpaperView)wallpaperView
{
  return self->_wallpaperView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_viewVisibleFutures, 0);
  objc_storeStrong((id *)&self->_tabClassToNavigationControllerMap, 0);
  objc_storeStrong((id *)&self->_dataSyncStateChangeProcessingFuture, 0);
  objc_storeStrong((id *)&self->_loadTabsFuture, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_baseController, 0);
  objc_storeStrong((id *)&self->_dashboardNavigator, 0);

  objc_storeStrong((id *)&self->_navigator, 0);
}

@end