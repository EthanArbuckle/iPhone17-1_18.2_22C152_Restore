@interface HOSplitViewController
- (BOOL)initialLoadCompleted;
- (BOOL)wantsAccessoryControlsCard;
- (HOAppNavigator)appNavigator;
- (HOBaseController)baseController;
- (HOMainTabBarController)mainTabBarController;
- (HOSplitViewController)initWithStyle:(int64_t)a3;
- (HUDashboardNavigationBar)navBar;
- (HUSideBarViewController)sideBarViewController;
- (HUWallpaperView)wallpaperView;
- (NSMutableDictionary)tabClassToNavigationControllerMap;
- (UINavigationController)primaryNavigationController;
- (id)_loadNavigationViewControllerForIdentifier:(id)a3;
- (id)currentViewController;
- (id)navigationControllerFromMapWithClass:(Class)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)selectTabWithIdentifier:(id)a3;
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (void)_initialLoad;
- (void)_loadWallpaperWithAnimation:(BOOL)a3;
- (void)_setUpWallpaper;
- (void)contextDidUpdate;
- (void)didLoadHome:(id)a3;
- (void)didLoadLoadingViewController;
- (void)home:(id)a3 didUpdateWallpaperForRoom:(id)a4;
- (void)homeDidUpdateWallpaper:(id)a3;
- (void)loadSideBarWithDisplayModeChangeAllowed:(BOOL)a3;
- (void)selectDiscoverTab:(id)a3;
- (void)setAppNavigator:(id)a3;
- (void)setBaseController:(id)a3;
- (void)setInitialLoadCompleted:(BOOL)a3;
- (void)setLoadingViewController:(id)a3;
- (void)setMainTabBarController:(id)a3;
- (void)setNavBar:(id)a3;
- (void)setPrimaryNavigationController:(id)a3;
- (void)setSideBarViewController:(id)a3;
- (void)setTabClassToNavigationControllerMap:(id)a3;
- (void)setWallpaperView:(id)a3;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)switchToAccessoryTypeGroup:(id)a3;
- (void)switchToHomeForTabIdentifier:(id)a3;
- (void)switchToRoom:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HOSplitViewController

- (HOSplitViewController)initWithStyle:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HOSplitViewController;
  v3 = [(HOSplitViewController *)&v12 initWithStyle:a3];
  if (v3)
  {
    v4 = [[HOBaseController alloc] initWithRootController:v3];
    baseController = v3->_baseController;
    v3->_baseController = v4;

    v6 = (HUDashboardNavigationBar *)objc_alloc_init((Class)HUDashboardNavigationBar);
    navBar = v3->_navBar;
    v3->_navBar = v6;

    uint64_t v8 = objc_opt_new();
    tabClassToNavigationControllerMap = v3->_tabClassToNavigationControllerMap;
    v3->_tabClassToNavigationControllerMap = (NSMutableDictionary *)v8;

    v10 = +[HFHomeKitDispatcher sharedDispatcher];
    [v10 addHomeObserver:v3];

    [(HOSplitViewController *)v3 setDelegate:v3];
  }
  return v3;
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)HOSplitViewController;
  [(HOSplitViewController *)&v34 viewDidLoad];
  [(HOSplitViewController *)self setPrimaryBackgroundStyle:0];
  [(HOSplitViewController *)self _setUpWallpaper];
  v3 = &HFAnalyticsEventFieldNameUnsupportedServicesCount_ptr;
  if ([(HOSplitViewController *)self displayMode] == (id)2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = +[HFUtilities isAMac] ^ 1;
  }
  [(HOSplitViewController *)self setPresentsWithGesture:v4];
  v5 = +[HFHomeKitDispatcher sharedDispatcher];
  if ([v5 hasLoadedHomes])
  {
    v6 = +[HFHomeKitDispatcher sharedDispatcher];
    v7 = [v6 home];

    if (v7)
    {
      uint64_t v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "initial load", buf, 2u);
      }

      [(HOSplitViewController *)self _initialLoad];
      [(HOSplitViewController *)self setPreferredDisplayMode:0];
      [(HOSplitViewController *)self setInitialLoadCompleted:1];
      goto LABEL_13;
    }
  }
  else
  {
  }
  v9 = [(HOSplitViewController *)self baseController];
  v10 = [v9 loadLoadingViewController];

  [(HOSplitViewController *)self showDetailViewController:v10 sender:0];
  [(HOSplitViewController *)self setPreferredDisplayMode:1];
  v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = +[HFHomeKitDispatcher sharedDispatcher];
    unsigned int v13 = [v12 hasLoadedHomes];
    v14 = +[HFHomeKitDispatcher sharedDispatcher];
    v15 = [v14 home];
    *(_DWORD *)buf = 67109378;
    unsigned int v40 = v13;
    __int16 v41 = 2112;
    v42 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Showing loading screen and hide sidebar, hasLoadedHomes:%d, hasHome: %@", buf, 0x12u);
  }
LABEL_13:
  v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "set sidebar as primary column", buf, 2u);
  }

  id v17 = objc_alloc_init((Class)UINavigationController);
  [(HOSplitViewController *)self setPrimaryNavigationController:v17];

  v18 = +[NSBundle mainBundle];
  v19 = @"HOTabHomeTitle";
  v20 = [v18 localizedStringForKey:@"HOTabHomeTitle" value:@"_" table:@"HOLocalizable"];

  if ([@"_" isEqualToString:v20])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v21 = sub_10002B12C();
    id v22 = [v21 countByEnumeratingWithState:&v35 objects:buf count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v36;
LABEL_18:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * v25);
        v27 = +[NSBundle mainBundle];
        v28 = [v27 localizedStringForKey:@"HOTabHomeTitle" value:@"HOTabHomeTitle" table:v26];

        if (![(__CFString *)v28 isEqualToString:@"HOTabHomeTitle"]) {
          break;
        }

        if (v23 == (id)++v25)
        {
          id v23 = [v21 countByEnumeratingWithState:&v35 objects:buf count:16];
          if (v23) {
            goto LABEL_18;
          }
          v28 = @"_";
          break;
        }
      }
      v3 = &HFAnalyticsEventFieldNameUnsupportedServicesCount_ptr;
      v19 = @"HOTabHomeTitle";
    }
    else
    {
      v28 = @"_";
    }

    v20 = v28;
  }
  if ([@"_" isEqualToString:v20]) {
    NSLog(@"Sensitive key '%@' not found!", @"HOTabHomeTitle");
  }
  else {
    v19 = v20;
  }

  v29 = [(HOSplitViewController *)self primaryNavigationController];
  [v29 setTitle:v19];

  LODWORD(v29) = [v3[94] isAMac];
  v30 = [(HOSplitViewController *)self primaryNavigationController];
  v31 = v30;
  if (v29)
  {
    [v30 setNavigationBarHidden:1];

    [(HOSplitViewController *)self loadSideBarWithDisplayModeChangeAllowed:1];
  }
  else
  {
    v32 = [v30 navigationBar];
    [v32 setPrefersLargeTitles:1];
  }
  v33 = [(HOSplitViewController *)self primaryNavigationController];
  [(HOSplitViewController *)self setViewController:v33 forColumn:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HOSplitViewController;
  [(HOSplitViewController *)&v5 viewDidAppear:a3];
  uint64_t v4 = [(HOSplitViewController *)self baseController];
  [v4 reloadInitialSetup];
}

- (HOMainTabBarController)mainTabBarController
{
  mainTabBarController = self->_mainTabBarController;
  if (!mainTabBarController)
  {
    uint64_t v4 = objc_alloc_init(HOMainTabBarController);
    objc_super v5 = self->_mainTabBarController;
    self->_mainTabBarController = v4;

    mainTabBarController = self->_mainTabBarController;
  }

  return mainTabBarController;
}

- (void)loadSideBarWithDisplayModeChangeAllowed:(BOOL)a3
{
  id v5 = objc_alloc((Class)HUSideBarViewController);
  v6 = +[HFHomeKitDispatcher sharedDispatcher];
  v7 = [v6 home];
  id v8 = [v5 initWithDelegate:self forHome:v7];
  [(HOSplitViewController *)self setSideBarViewController:v8];

  v9 = +[HUSideBarSelectionManager sharedManager];
  v10 = [(HOSplitViewController *)self sideBarViewController];
  v11 = [(HOSplitViewController *)self sideBarViewController];
  objc_super v12 = [v11 itemManager];
  [v9 updateWithSideBarViewController:v10 sideBarItemManager:v12];

  objc_initWeak(&location, self);
  unsigned int v13 = [(HOSplitViewController *)self sideBarViewController];
  v14 = [v13 itemManager];
  v15 = [v14 firstFastUpdateFuture];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100028C60;
  v20[3] = &unk_1000C2A48;
  objc_copyWeak(&v21, &location);
  BOOL v22 = a3;
  id v16 = [v15 addSuccessBlock:v20];

  id v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "push actual sidebar view controller onto primary navigation controller", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028DE4;
  block[3] = &unk_1000C1CF8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (BOOL)wantsAccessoryControlsCard
{
  return [(HOSplitViewController *)self isCollapsed] ^ 1;
}

- (void)didLoadLoadingViewController
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "show only secondary view for side bar after setting loading view", v4, 2u);
  }

  [(HOSplitViewController *)self setPreferredDisplayMode:1];
}

- (id)currentViewController
{
  v2 = [(HOSplitViewController *)self viewControllers];
  v3 = [v2 lastObject];

  return v3;
}

- (void)setLoadingViewController:(id)a3
{
  id v4 = a3;
  if (([(HOSplitViewController *)self isCollapsed] & 1) == 0)
  {
    id v5 = [(HOSplitViewController *)self primaryNavigationController];
    [(HOSplitViewController *)self setViewController:v5 forColumn:0];

    [(HOSplitViewController *)self setViewController:0 forColumn:2];
    [(HOSplitViewController *)self showDetailViewController:v4 sender:0];
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "show loading view after home change result in no home", v7, 2u);
    }
  }
}

- (void)didLoadHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HOSplitViewController *)self sideBarViewController];
  [v5 switchToSelectedHome:v4];

  [(HOSplitViewController *)self setPreferredDisplayMode:0];
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "refresh sidebar after home change: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = [(HOSplitViewController *)self viewControllerForColumn:2];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "initial load after a home switch: %@", (uint8_t *)&v10, 0xCu);
    }

    [(HOSplitViewController *)self _initialLoad];
  }
}

- (id)selectTabWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[HFStateRestorationSettings sharedInstance];
  [v5 setSelectedHomeAppTabIdentifier:v4];

  id v6 = objc_alloc_init((Class)NAFuture);
  v7 = [(HOSplitViewController *)self hu_dismissViewControllerAnimated:0];
  id v8 = [(HOSplitViewController *)self _loadNavigationViewControllerForIdentifier:v4];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100029328;
  v16[3] = &unk_1000C2AC0;
  id v9 = v8;
  id v17 = v9;
  id v10 = v4;
  id v18 = v10;
  v19 = self;
  objc_copyWeak(&v21, &location);
  id v11 = v6;
  id v20 = v11;
  id v12 = [v7 addCompletionBlock:v16];
  unsigned int v13 = v20;
  id v14 = v11;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v14;
}

- (void)switchToHomeForTabIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  id v6 = [v5 home];

  if (objc_msgSend(v6, "hf_currentUserIsRestrictedGuest"))
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 currentUser];
      id v9 = [v8 hf_prettyDescription];
      int v37 = 136315906;
      long long v38 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
      __int16 v39 = 2112;
      id v40 = v4;
      __int16 v41 = 2112;
      v42 = v9;
      __int16 v43 = 2112;
      v44 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) Switching to 'home' tab instead of '%@' because current user is RG | user = %@ | home = %@", (uint8_t *)&v37, 0x2Au);
    }
    id v10 = HFHomeAppTabIdentifierHome;

    id v4 = v10;
  }
  id v11 = +[HFStateRestorationSettings sharedInstance];
  id v12 = [v11 selectedHomeAppTabIdentifier];
  unsigned int v13 = [v12 isEqualToString:v4];

  if (v13)
  {
    objc_opt_class();
    id v14 = [(HOSplitViewController *)self currentViewController];
    v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
    id v16 = v15;

    id v17 = [v16 viewControllers];

    id v18 = [v17 count];
    if (v18 == (id)1)
    {
      v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = +[HFHomeKitDispatcher sharedDispatcher];
        id v21 = [v20 home];
        int v37 = 136315650;
        long long v38 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
        __int16 v39 = 2112;
        id v40 = v4;
        __int16 v41 = 2112;
        v42 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "(%s) scrolling to top instead of tab switching since we are already displaying the tab: %@ for home %@", (uint8_t *)&v37, 0x20u);
      }
      BOOL v22 = [(HOSplitViewController *)self appNavigator];
      [v22 scrollToDefaultPositionInCurrentContextAnimated:1];
LABEL_25:

      goto LABEL_26;
    }
  }
  if ([v4 isEqualToString:HFHomeAppTabIdentifierTriggers])
  {
    id v23 = HFLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = +[HFHomeKitDispatcher sharedDispatcher];
      uint64_t v25 = [v24 home];
      int v37 = 136315394;
      long long v38 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
      __int16 v39 = 2112;
      id v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "(%s) show automation tab for %@", (uint8_t *)&v37, 0x16u);
    }
    BOOL v22 = [(HOSplitViewController *)self appNavigator];
    id v26 = [v22 showAutomationTab];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:HFHomeAppTabIdentifierHome])
  {
    v27 = HFLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = +[HFHomeKitDispatcher sharedDispatcher];
      v29 = [v28 home];
      int v37 = 136315394;
      long long v38 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
      __int16 v39 = 2112;
      id v40 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "(%s) show home tab for %@", (uint8_t *)&v37, 0x16u);
    }
    BOOL v22 = [(HOSplitViewController *)self appNavigator];
    v30 = +[HFHomeKitDispatcher sharedDispatcher];
    v31 = [v30 home];
    id v32 = [v22 showHome:v31 animated:0];

    goto LABEL_25;
  }
  if ([v4 isEqualToString:HFHomeAppTabIdentifierDiscover])
  {
    v33 = HFLogForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v34 = +[HFHomeKitDispatcher sharedDispatcher];
      long long v35 = [v34 home];
      int v37 = 136315394;
      long long v38 = "-[HOSplitViewController switchToHomeForTabIdentifier:]";
      __int16 v39 = 2112;
      id v40 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "(%s) show discover tab for %@", (uint8_t *)&v37, 0x16u);
    }
    BOOL v22 = [(HOSplitViewController *)self appNavigator];
    id v36 = [v22 showDiscoverTab];
    goto LABEL_25;
  }
LABEL_26:
}

- (void)switchToRoom:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "show room: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(HOSplitViewController *)self appNavigator];
  id v7 = [v6 showRoom:v4 animated:0];
}

- (void)switchToAccessoryTypeGroup:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "show accessory type group: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(HOSplitViewController *)self appNavigator];
  id v7 = +[HFHomeKitDispatcher sharedDispatcher];
  int v8 = [v7 home];
  id v9 = [v6 showAccessoryTypeGroup:v4 forHome:v8 animated:1];
}

- (void)_initialLoad
{
  v3 = +[HFStateRestorationSettings sharedInstance];
  id v4 = [v3 selectedHomeAppTabIdentifier];
  id v5 = [(HOSplitViewController *)self _loadNavigationViewControllerForIdentifier:v4];

  if (!v5)
  {
    id v5 = [(HOSplitViewController *)self _loadNavigationViewControllerForIdentifier:HFHomeAppTabIdentifierHome];
  }
  id v6 = [(HOSplitViewController *)self appNavigator];
  id v7 = +[HUSideBarSelectionManager sharedManager];
  int v8 = [v7 currentContext];
  [v6 configureDashboardContextWithDashboardContext:v8 navigationController:v5 animated:0];

  objc_initWeak(&location, self);
  id v9 = [v5 hu_preloadContent];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002A050;
  v12[3] = &unk_1000C2B10;
  v12[4] = self;
  objc_copyWeak(&v14, &location);
  id v10 = v5;
  id v13 = v10;
  id v11 = [v9 addCompletionBlock:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_setUpWallpaper
{
  if (!self->_wallpaperView)
  {
    v3 = [objc_alloc((Class)HUWallpaperView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    wallpaperView = self->_wallpaperView;
    self->_wallpaperView = v3;

    [(HUWallpaperView *)self->_wallpaperView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUWallpaperView *)self->_wallpaperView setHidden:1];
    id v5 = [(HOSplitViewController *)self view];
    [v5 addSubview:self->_wallpaperView];

    id v6 = [(HOSplitViewController *)self view];
    [v6 sendSubviewToBack:self->_wallpaperView];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002A280;
    v8[3] = &unk_1000C2B38;
    v8[4] = self;
    id v7 = sub_10002A280((uint64_t)v8);
    +[NSLayoutConstraint activateConstraints:v7];
  }
}

- (void)_loadWallpaperWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[HUSideBarSelectionManager sharedManager];
  id v6 = [v5 currentTabIdentifier];
  unsigned int v7 = [v6 isEqualToString:HFHomeAppTabIdentifierHome];

  if (v7
    && (+[HUSideBarSelectionManager sharedManager],
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 dashboarHomeKitObject],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        v9))
  {
    id v10 = [(HOSplitViewController *)self wallpaperView];
    [v10 setHidden:0];

    id v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "load wallpaper for hkObject: %@", buf, 0xCu);
    }

    id v12 = [(HOSplitViewController *)self wallpaperView];
    id v13 = [v12 refreshWallpaperForHomeKitObject:v9 withAnimation:v3];
  }
  else
  {
    id v14 = [(HOSplitViewController *)self wallpaperView];
    [v14 setHidden:1];
  }
}

- (id)_loadNavigationViewControllerForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:HFHomeAppTabIdentifierTriggers])
  {
    id v5 = +[HFHomeKitDispatcher sharedDispatcher];
    id v6 = [v5 home];
    if (objc_msgSend(v6, "hf_hasAnyVisibleTriggers"))
    {
LABEL_5:

      goto LABEL_10;
    }
    unsigned int v7 = +[HFHomeKitDispatcher sharedDispatcher];
    int v8 = [v7 home];
    if (objc_msgSend(v8, "hf_userCanCreateTrigger"))
    {

      goto LABEL_5;
    }
    HFForceAllowAutomationCreation();
  }
  else if ([v4 isEqualToString:HFHomeAppTabIdentifierDiscover])
  {
    +[HFStoreLocaleAvailability getAvailabilityDictionary];
  }
LABEL_10:
  id v9 = [(HOSplitViewController *)self navigationControllerFromMapWithClass:objc_opt_class()];

  return v9;
}

- (id)navigationControllerFromMapWithClass:(Class)a3
{
  id v5 = [(HOSplitViewController *)self tabClassToNavigationControllerMap];
  id v6 = [v5 objectForKeyedSubscript:a3];

  if (!v6)
  {
    [(objc_class *)a3 isEqual:objc_opt_class()];
    uint64_t v7 = objc_opt_class();
    if ([(objc_class *)a3 isEqual:objc_opt_class()])
    {
      int v8 = [HODiscoverWebViewController alloc];
      id v9 = +[HFStoreLocaleAvailability getAvailabilityDictionary];
      id v10 = [(HODiscoverWebViewController *)v8 initWithLocalizationDictionary:v9];
    }
    else
    {
      id v10 = (HODiscoverWebViewController *)objc_alloc_init(a3);
    }
    id v6 = [objc_alloc((Class)HUDashboardNavigationController) initWithNavigationBarClass:v7 toolbarClass:0];
    [v6 pushViewController:v10 animated:0];
    id v11 = [(HOSplitViewController *)self tabClassToNavigationControllerMap];
    [v11 setObject:v6 forKeyedSubscript:a3];
  }

  return v6;
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[HUSideBarSelectionManager sharedManager];
  int v8 = [v7 currentContext];

  if (a4 != 3)
  {
    id v9 = [(HOSplitViewController *)self mainTabBarController];
    [v6 setViewController:v9 forColumn:3];
  }
  id v10 = [(HOSplitViewController *)self mainTabBarController];
  id v11 = [(HOSplitViewController *)self appNavigator];
  [v11 setRootViewController:v10];

  id v12 = [(HOSplitViewController *)self mainTabBarController];
  id v13 = [v12 baseController];
  id v14 = [(HOSplitViewController *)self appNavigator];
  [v14 setBaseController:v13];

  v15 = [(HOSplitViewController *)self appNavigator];
  id v16 = [(HOSplitViewController *)self mainTabBarController];
  [v16 setNavigator:v15];

  id v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "initial load after switching to tab bar view", v20, 2u);
  }

  id v18 = [(HOSplitViewController *)self mainTabBarController];
  [v18 refreshAfterSidebarTabbarSwitchWithDashboardContext:v8];

  return 3;
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  id v6 = [(HOSplitViewController *)self baseController];
  uint64_t v7 = [(HOSplitViewController *)self appNavigator];
  [v7 setBaseController:v6];

  int v8 = [(HOSplitViewController *)self appNavigator];
  [v8 setRootViewController:self];

  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "initial load after switching to side bar view", v11, 2u);
  }

  [(HOSplitViewController *)self _initialLoad];
  return a4;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  if ((+[HFUtilities isAMac] & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002AC44;
    v7[3] = &unk_1000C2B60;
    v7[4] = self;
    v7[5] = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
    if (a4 != 1)
    {
      id v6 = [(HOSplitViewController *)self sideBarViewController];

      if (!v6) {
        [(HOSplitViewController *)self loadSideBarWithDisplayModeChangeAllowed:0];
      }
    }
  }
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [[HOSideBarPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (void)selectDiscoverTab:(id)a3
{
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "show learn tab", v7, 2u);
  }

  id v5 = [(HOSplitViewController *)self appNavigator];
  id v6 = [v5 showDiscoverTab];
}

- (void)contextDidUpdate
{
}

- (void)homeDidUpdateWallpaper:(id)a3
{
  id v9 = a3;
  id v4 = +[HUSideBarSelectionManager sharedManager];
  id v5 = [v4 currentTabIdentifier];
  if ([v5 isEqualToString:HFHomeAppTabIdentifierHome])
  {
    id v6 = +[HUSideBarSelectionManager sharedManager];
    id v7 = [v6 dashboarHomeKitObject];
    unsigned int v8 = [v7 isEqual:v9];

    if (v8) {
      [(HOSplitViewController *)self _loadWallpaperWithAnimation:1];
    }
  }
  else
  {
  }
}

- (void)home:(id)a3 didUpdateWallpaperForRoom:(id)a4
{
  id v10 = a4;
  id v5 = +[HUSideBarSelectionManager sharedManager];
  id v6 = [v5 currentTabIdentifier];
  if ([v6 isEqualToString:HFHomeAppTabIdentifierHome])
  {
    id v7 = +[HUSideBarSelectionManager sharedManager];
    unsigned int v8 = [v7 dashboarHomeKitObject];
    unsigned int v9 = [v8 isEqual:v10];

    if (v9) {
      [(HOSplitViewController *)self _loadWallpaperWithAnimation:1];
    }
  }
  else
  {
  }
}

- (HOAppNavigator)appNavigator
{
  return self->_appNavigator;
}

- (void)setAppNavigator:(id)a3
{
}

- (HOBaseController)baseController
{
  return self->_baseController;
}

- (void)setBaseController:(id)a3
{
}

- (HUSideBarViewController)sideBarViewController
{
  return self->_sideBarViewController;
}

- (void)setSideBarViewController:(id)a3
{
}

- (void)setMainTabBarController:(id)a3
{
}

- (UINavigationController)primaryNavigationController
{
  return self->_primaryNavigationController;
}

- (void)setPrimaryNavigationController:(id)a3
{
}

- (HUDashboardNavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
}

- (BOOL)initialLoadCompleted
{
  return self->_initialLoadCompleted;
}

- (void)setInitialLoadCompleted:(BOOL)a3
{
  self->_initialLoadCompleted = a3;
}

- (NSMutableDictionary)tabClassToNavigationControllerMap
{
  return self->_tabClassToNavigationControllerMap;
}

- (void)setTabClassToNavigationControllerMap:(id)a3
{
}

- (HUWallpaperView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setWallpaperView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_tabClassToNavigationControllerMap, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_primaryNavigationController, 0);
  objc_storeStrong((id *)&self->_mainTabBarController, 0);
  objc_storeStrong((id *)&self->_sideBarViewController, 0);
  objc_storeStrong((id *)&self->_baseController, 0);
  objc_storeStrong((id *)&self->_appNavigator, 0);

  objc_storeStrong((id *)&self->dashboardNavigator, 0);
}

@end