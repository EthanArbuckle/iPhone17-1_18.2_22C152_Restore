@interface CarSmallWidgetBrowsingModeController
- (BOOL)modeHandlesGestures;
- (BOOL)showsMapView;
- (CarSmallWidgetBrowsingModeController)init;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (NSArray)searchCategories;
- (int64_t)browsingState;
- (void)_addNoContentView;
- (void)_addSearchCategoriesView;
- (void)_addShortcutsView;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_clearFocusableItems;
- (void)_updateWidgetContents;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)dealloc;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setBrowsingState:(int64_t)a3;
- (void)setChromeViewController:(id)a3;
- (void)setSearchCategories:(id)a3;
- (void)shortcutsProviderUpdated:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CarSmallWidgetBrowsingModeController

- (CarSmallWidgetBrowsingModeController)init
{
  v13.receiver = self;
  v13.super_class = (Class)CarSmallWidgetBrowsingModeController;
  v2 = [(CarSmallWidgetBrowsingModeController *)&v13 initWithNibName:0 bundle:0];
  if (v2)
  {
    if (+[LibraryUIUtilities isMyPlacesEnabled])
    {
      v3 = +[MapsFavoritesManager sharedManager];
      [v3 registerObserver:v2];
    }
    else
    {
      v4 = objc_alloc_init(CarWidgetShortcutsProvider);
      shortcutsProvider = v2->_shortcutsProvider;
      v2->_shortcutsProvider = v4;

      [(CarShortcutsProvider *)v2->_shortcutsProvider setDelegate:v2];
      [(CarShortcutsProvider *)v2->_shortcutsProvider start];
    }
    v6 = [[BrowseManager alloc] initWithCacheKey:@"Stark"];
    browseManager = v2->_browseManager;
    v2->_browseManager = v6;

    v8 = [(BrowseManager *)v2->_browseManager imageManager];
    [v8 setDesiredImageSize:29.0, 29.0];

    [(BrowseManager *)v2->_browseManager readCategoriesFromDiskIfNeeded];
    v9 = [(BrowseManager *)v2->_browseManager cachedCategories];
    [(CarSmallWidgetBrowsingModeController *)v2 setSearchCategories:v9];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v3 = +[MapsFavoritesManager sharedManager];
    [v3 unregisterObserver:self];
  }
  else
  {
    [(CarShortcutsProvider *)self->_shortcutsProvider stop];
  }
  v4.receiver = self;
  v4.super_class = (Class)CarSmallWidgetBrowsingModeController;
  [(CarSmallWidgetBrowsingModeController *)&v4 dealloc];
}

- (BOOL)modeHandlesGestures
{
  return (char *)[(CarSmallWidgetBrowsingModeController *)self browsingState] - 1 < (char *)2;
}

- (void)_updateWidgetContents
{
  v3 = [(CarShortcutsProvider *)self->_shortcutsProvider shortcuts];
  if ([v3 count])
  {
    unsigned __int8 v4 = +[LibraryUIUtilities isMyPlacesEnabled];

    if ((v4 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  v5 = +[MapsFavoritesManager sharedManager];
  v6 = [v5 shortcutsForCarplay];
  if ([v6 count])
  {
    unsigned int v7 = +[LibraryUIUtilities isMyPlacesEnabled];

    if (v7)
    {
LABEL_7:
      [(CarSmallWidgetBrowsingModeController *)self setBrowsingState:1];
      shortcutsView = self->_shortcutsView;
      [(CarSmallWidgetShortcutsView *)shortcutsView refreshShortcuts];
      return;
    }
  }
  else
  {
  }
  v9 = [(CarSmallWidgetBrowsingModeController *)self searchCategories];
  id v10 = [v9 count];

  if (v10)
  {
    [(CarSmallWidgetBrowsingModeController *)self setBrowsingState:2];
    id v11 = [(CarSmallWidgetBrowsingModeController *)self searchCategories];
    [(CarSmallWidgetSearchCategoriesView *)self->_searchCategoriesView setCategories:v11];
  }
  else
  {
    [(CarSmallWidgetBrowsingModeController *)self setBrowsingState:3];
  }
}

- (void)setBrowsingState:(int64_t)a3
{
  if (self->_browsingState != a3)
  {
    v5 = sub_100577F64();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = self->_browsingState - 1;
      if (v6 > 2) {
        CFStringRef v7 = @"Unknown";
      }
      else {
        CFStringRef v7 = *(&off_1013137B8 + v6);
      }
      if ((unint64_t)(a3 - 1) > 2) {
        CFStringRef v8 = @"Unknown";
      }
      else {
        CFStringRef v8 = *(&off_1013137B8 + a3 - 1);
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v22 = v7;
      __int16 v23 = 2112;
      CFStringRef v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Set CarSmallWidgetBrowsingState from %@ to %@", buf, 0x16u);
    }

    self->_int64_t browsingState = a3;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = [(CarSmallWidgetBrowsingModeController *)self view];
    id v10 = [v9 subviews];

    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * i) removeFromSuperview];
        }
        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    [(CarSmallWidgetBrowsingModeController *)self _clearFocusableItems];
    int64_t browsingState = self->_browsingState;
    if (browsingState == 2)
    {
      [(CarSmallWidgetBrowsingModeController *)self _addSearchCategoriesView];
    }
    else if (browsingState == 1)
    {
      [(CarSmallWidgetBrowsingModeController *)self _addShortcutsView];
    }
    else
    {
      [(CarSmallWidgetBrowsingModeController *)self _addNoContentView];
    }
  }
}

- (void)setSearchCategories:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_searchCategories, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_searchCategories, a3);
    [(CarSmallWidgetBrowsingModeController *)self _updateWidgetContents];
  }
}

- (void)_addShortcutsView
{
  if (!self->_shortcutsView)
  {
    v3 = [[CarSmallWidgetShortcutsView alloc] initWithShortcutsProvider:self->_shortcutsProvider];
    shortcutsView = self->_shortcutsView;
    self->_shortcutsView = v3;

    [(CarSmallWidgetShortcutsView *)self->_shortcutsView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  id v5 = [(CarSmallWidgetBrowsingModeController *)self view];
  [v5 addSubview:self->_shortcutsView];

  unint64_t v6 = self->_shortcutsView;
  id v11 = [(CarSmallWidgetBrowsingModeController *)self view];
  CFStringRef v7 = [v11 safeAreaLayoutGuide];
  LODWORD(v8) = 1148846080;
  v9 = -[CarSmallWidgetShortcutsView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v6, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v7, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v8);
  id v10 = [v9 allConstraints];
  +[NSLayoutConstraint activateConstraints:v10];
}

- (void)_addSearchCategoriesView
{
  if (!self->_searchCategoriesView)
  {
    v3 = -[CarSmallWidgetCollectionView initWithFrame:]([CarSmallWidgetSearchCategoriesView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    searchCategoriesView = self->_searchCategoriesView;
    self->_searchCategoriesView = v3;

    [(CarSmallWidgetSearchCategoriesView *)self->_searchCategoriesView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  id v5 = [(CarSmallWidgetBrowsingModeController *)self view];
  [v5 addSubview:self->_searchCategoriesView];

  unint64_t v6 = self->_searchCategoriesView;
  id v11 = [(CarSmallWidgetBrowsingModeController *)self view];
  CFStringRef v7 = [v11 safeAreaLayoutGuide];
  LODWORD(v8) = 1148846080;
  v9 = -[CarSmallWidgetSearchCategoriesView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v6, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v7, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v8);
  id v10 = [v9 allConstraints];
  +[NSLayoutConstraint activateConstraints:v10];
}

- (void)_addNoContentView
{
  if (!self->_noContentView)
  {
    v3 = -[CarSmallWidgetNoContentView initWithFrame:]([CarSmallWidgetNoContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    noContentView = self->_noContentView;
    self->_noContentView = v3;

    [(CarSmallWidgetNoContentView *)self->_noContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  id v5 = [(CarSmallWidgetBrowsingModeController *)self view];
  [v5 addSubview:self->_noContentView];

  unint64_t v6 = self->_noContentView;
  id v11 = [(CarSmallWidgetBrowsingModeController *)self view];
  CFStringRef v7 = [v11 safeAreaLayoutGuide];
  LODWORD(v8) = 1148846080;
  v9 = -[CarSmallWidgetNoContentView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v6, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v7, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v8);
  id v10 = [v9 allConstraints];
  +[NSLayoutConstraint activateConstraints:v10];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarSmallWidgetBrowsingModeController;
  [(CarSmallWidgetBrowsingModeController *)&v4 viewWillDisappear:a3];
  [(CarSmallWidgetBrowsingModeController *)self _clearFocusableItems];
}

- (BOOL)showsMapView
{
  return 0;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CarSmallWidgetBrowsingModeController *)self _updateWidgetContents];
  objc_initWeak(&location, self);
  browseManager = self->_browseManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1009DB018;
  v9[3] = &unk_1012E6E78;
  objc_copyWeak(&v10, &location);
  [(BrowseManager *)browseManager getCategoriesWithCompletion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a3;
  [(CarSmallWidgetBrowsingModeController *)self _clearFocusableItems];
  id v6 = [v5 nextTopContext];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if ((v5 & 1) == 0)
  {
    id v8 = +[CarDisplayController sharedInstance];
    id v7 = [v8 routeGeniusManager];
    [v7 deactivateForAllChromes];
  }
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)_clearFocusableItems
{
  v3 = [(CarSmallWidgetBrowsingModeController *)self view];
  objc_super v4 = [v3 window];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(CarSmallWidgetBrowsingModeController *)self view];
    id v7 = [v6 window];

    [v7 _maps_safeSetFocusableViews:&__NSArray0__struct];
  }
}

- (void)shortcutsProviderUpdated:(id)a3
{
  objc_super v4 = sub_100577F64();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received an update through shortcutsProviderUpdated:", v5, 2u);
  }

  [(CarSmallWidgetBrowsingModeController *)self _updateWidgetContents];
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  objc_super v4 = sub_100577F64();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received an update through homeDataProvidingObjectDidUpdate:", v5, 2u);
  }

  [(CarSmallWidgetBrowsingModeController *)self _updateWidgetContents];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v5 = +[MapsFavoritesManager sharedManager];
    [v5 registerObserver:self];
  }
  else
  {
    shortcutsProvider = self->_shortcutsProvider;
    [(CarShortcutsProvider *)shortcutsProvider stop];
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v5 = +[MapsFavoritesManager sharedManager];
    [v5 unregisterObserver:self];
  }
  else
  {
    shortcutsProvider = self->_shortcutsProvider;
    [(CarShortcutsProvider *)shortcutsProvider stop];
  }
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (int64_t)browsingState
{
  return self->_browsingState;
}

- (NSArray)searchCategories
{
  return self->_searchCategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCategories, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_searchCategoriesView, 0);
  objc_storeStrong((id *)&self->_browseManager, 0);
  objc_storeStrong((id *)&self->_shortcutsView, 0);

  objc_storeStrong((id *)&self->_shortcutsProvider, 0);
}

@end