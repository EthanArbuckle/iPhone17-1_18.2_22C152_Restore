@interface MTAWorldClockTableViewController
- (BOOL)_canShowWhileLocked;
- (MTAWorldClockTableViewController)init;
- (WorldClockCity)deferAddedCity;
- (WorldClockCity)deferRemovedCity;
- (float)itemsTableRowHeight;
- (id)addViewController;
- (id)noItemsText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfItems;
- (void)addCityWithoutUserInteraction:(id)a3;
- (void)addClockViewController:(id)a3 addCity:(id)a4;
- (void)dealloc;
- (void)finishAddViewControllerDismissal:(BOOL)a3;
- (void)handleTextSizeChange:(id)a3;
- (void)reloadState;
- (void)removeCityAtIndexPath:(id)a3;
- (void)removeCityWithoutUserInteraction:(id)a3;
- (void)restoreWithUserActivity:(id)a3;
- (void)saveScrollPoint;
- (void)saveState;
- (void)scrollToCityAtIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setDeferAddedCity:(id)a3;
- (void)setDeferRemovedCity:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setupEdgeAppearance;
- (void)setupForTest:(id)a3 options:(id)a4;
- (void)showAddView;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTAWorldClockTableViewController

- (void)reloadState
{
  v3 = +[WorldClockManager sharedManager];
  [v3 loadCities];

  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockTableViewController;
  [(MTATableViewController *)&v4 reloadState];
}

- (void)setupEdgeAppearance
{
  id v4 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v4 configureWithOpaqueBackground];
  [v4 setShadowColor:0];
  v3 = [(MTAWorldClockTableViewController *)self navigationItem];
  [v3 setScrollEdgeAppearance:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTAWorldClockTableViewController;
  [(MTAWorldClockTableViewController *)&v5 viewWillDisappear:a3];
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000CB50((uint64_t)self, v4);
  }

  [(NSUserActivity *)self->_userActivity resignCurrent];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTAWorldClockTableViewController;
  [(MTAWorldClockTableViewController *)&v8 setEditing:a3 animated:a4];
  objc_super v5 = +[MTAStateStore shared];
  if (v4) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 4;
  }
  v7 = +[MTAStateStoreEvent eventWithType:v6];
  [v5 pushEvent:v7];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)MTAWorldClockTableViewController;
  [(MTATableViewController *)&v6 viewDidLoad];
  v3 = [(MTAWorldClockTableViewController *)self tableView];
  [v3 _setMarginWidth:1.0];

  BOOL v4 = [(MTAWorldClockTableViewController *)self tableView];
  [v4 setLayoutMarginsFollowReadableWidth:1];

  objc_super v5 = [(MTAWorldClockTableViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"MTWorldClockCell"];

  [(MTAWorldClockTableViewController *)self setupEdgeAppearance];
}

- (MTAWorldClockTableViewController)init
{
  v18.receiver = self;
  v18.super_class = (Class)MTAWorldClockTableViewController;
  v2 = [(MTATableViewController *)&v18 initWithTableViewStyle:1];
  if (v2)
  {
    v3 = +[UIImage systemImageNamed:@"globe"];
    BOOL v4 = [(MTAWorldClockTableViewController *)v2 tabBarItem];
    [v4 setImage:v3];

    objc_super v5 = +[NSBundle mainBundle];
    objc_super v6 = [v5 localizedStringForKey:@"WORLD_CLOCK" value:&stru_1000A2560 table:0];
    [(MTAWorldClockTableViewController *)v2 setTitle:v6];

    v7 = [(MTAWorldClockTableViewController *)v2 title];
    uint64_t v8 = +[NSUserActivity mtUserActivityWithActivityType:@"com.apple.clock.worldclock" title:v7];
    userActivity = v2->_userActivity;
    v2->_userActivity = (NSUserActivity *)v8;

    v10 = +[UIScreen mainScreen];
    v11 = [v10 _defaultTraitCollection];
    v12 = [v11 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    v2->_shouldStackViewsInCell = IsAccessibilityCategory;
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"handleTextSizeChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000315E0, @"NanoMobileTimerWorldClockPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v16 = v2;
  }

  return v2;
}

- (int64_t)numberOfItems
{
  pptTestCities = self->_pptTestCities;
  if (pptTestCities)
  {
    v3 = pptTestCities;
  }
  else
  {
    BOOL v4 = +[WorldClockManager sharedManager];
    v3 = [v4 cities];
  }
  NSUInteger v5 = [(NSArray *)v3 count];

  return v5;
}

- (float)itemsTableRowHeight
{
  +[MTAWorldClockTableViewCell defaultHeight];
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NanoMobileTimerWorldClockPreferencesChangedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockTableViewController;
  [(MTATableViewController *)&v4 dealloc];
}

- (void)handleTextSizeChange:(id)a3
{
  objc_super v4 = +[UIScreen mainScreen];
  NSUInteger v5 = [v4 _defaultTraitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  self->_shouldStackViewsInCell = IsAccessibilityCategory;
  [(MTAWorldClockTableViewController *)self itemsTableRowHeight];
  double v9 = v8;
  v10 = [(MTAWorldClockTableViewController *)self tableView];
  [v10 setRowHeight:v9];

  id v11 = [(MTAWorldClockTableViewController *)self tableView];
  [v11 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  NSUInteger v5 = +[WorldClockManager sharedManager];
  objc_super v6 = [v5 cities];
  if (v6)
  {
  }
  else if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    [v5 loadCities];
  }
  v21.receiver = self;
  v21.super_class = (Class)MTAWorldClockTableViewController;
  [(MTATableViewController *)&v21 viewWillAppear:v3];
  v7 = +[NSUserDefaults standardUserDefaults];
  float v8 = [v7 objectForKey:@"WorldClockTableScrollPoint"];
  double v9 = v8;
  if (v8)
  {
    [v8 floatValue];
    if (v10 >= 0.0)
    {
      double v11 = v10;
      v12 = [(MTAWorldClockTableViewController *)self tableView];
      [v12 contentSize];
      double v14 = v13;

      if (v14 > v11)
      {
        v15 = [(MTAWorldClockTableViewController *)self tableView];
        [v15 setContentOffset:0.0 v11];
      }
    }
    [v7 removeObjectForKey:@"WorldClockTableScrollPoint"];
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 postNotificationName:@"com.apple.mobiletimer.user-preferences-dirty" object:0];
  }
  v17 = [(MTAWorldClockTableViewController *)self deferAddedCity];

  if (v17)
  {
    objc_super v18 = [(MTAWorldClockTableViewController *)self deferAddedCity];
    [(MTAWorldClockTableViewController *)self addCityWithoutUserInteraction:v18];

    [(MTAWorldClockTableViewController *)self setDeferAddedCity:0];
  }
  v19 = [(MTAWorldClockTableViewController *)self deferRemovedCity];

  if (v19)
  {
    v20 = [(MTAWorldClockTableViewController *)self deferRemovedCity];
    [(MTAWorldClockTableViewController *)self removeCityWithoutUserInteraction:v20];

    [(MTAWorldClockTableViewController *)self setDeferRemovedCity:0];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a3;
  objc_super v6 = [(MTAWorldClockTableViewController *)self traitCollection];
  id v7 = [v6 horizontalSizeClass];
  id v8 = [v5 horizontalSizeClass];

  if (v7 != v8)
  {
    [(MTATableViewController *)self dismissAddViewController:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MTAWorldClockTableViewController;
  [(MTATableViewController *)&v10 viewDidAppear:a3];
  objc_super v4 = +[WorldClockManager sharedManager];
  id v5 = [(NSUserActivity *)self->_userActivity keywords];
  objc_super v6 = v5;
  if (!v5)
  {
    objc_super v6 = +[NSSet set];
  }
  id v7 = [v4 cities];
  id v8 = [v7 na_map:&stru_1000A1C48];
  double v9 = [v6 setByAddingObjectsFromArray:v8];
  [(NSUserActivity *)self->_userActivity setKeywords:v9];

  if (!v5) {
  [(NSUserActivity *)self->_userActivity becomeCurrent];
  }
}

- (void)restoreWithUserActivity:(id)a3
{
}

- (void)saveState
{
}

- (void)setupForTest:(id)a3 options:(id)a4
{
  id v5 = +[ALCityManager sharedManager];
  objc_super v6 = objc_opt_new();
  char v7 = 1;
  do
  {
    char v8 = v7;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v9 = [v5 defaultCitiesShownInWorldClock];
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [objc_alloc((Class)WorldClockCity) initWithALCity:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          [v6 addObject:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    char v7 = 0;
  }
  while ((v8 & 1) != 0);
  v15 = (NSArray *)[v6 copy];
  pptTestCities = self->_pptTestCities;
  self->_pptTestCities = v15;

  [(MTAWorldClockTableViewController *)self reloadState];
}

- (id)noItemsText
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"NO_WORLD_CLOCKS" value:&stru_1000A2560 table:0];

  return v3;
}

- (void)saveScrollPoint
{
  if ([(MTAWorldClockTableViewController *)self isViewLoaded])
  {
    BOOL v3 = [(MTAWorldClockTableViewController *)self tableView];
    [v3 contentOffset];
    *(float *)&double v5 = v4;
    id v7 = +[NSNumber numberWithFloat:v5];

    objc_super v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setObject:v7 forKey:@"WorldClockTableScrollPoint"];
  }
}

- (void)showAddView
{
  BOOL v3 = +[WorldClockManager sharedManager];
  unsigned int v4 = [v3 canAddCity];

  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)MTAWorldClockTableViewController;
    [(MTATableViewController *)&v13 showAddViewWithCompletion:&stru_1000A1C68];
  }
  else
  {
    double v5 = +[NSBundle mainBundle];
    id v12 = [v5 localizedStringForKey:@"TOO_MANY_WORLD_CLOCKS_TITLE" value:&stru_1000A2560 table:0];

    objc_super v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"TOO_MANY_WORLD_CLOCKS_BODY" value:&stru_1000A2560 table:0];

    char v8 = +[UIAlertController alertControllerWithTitle:v12 message:v7 preferredStyle:1];
    double v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"OK" value:&stru_1000A2560 table:0];
    id v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
    [v8 addAction:v11];

    [(MTAWorldClockTableViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (id)addViewController
{
  BOOL v3 = objc_alloc_init(MTAAddClockViewController);
  [(MTAAddClockViewController *)v3 setDelegate:self];
  unsigned int v4 = [[MTAAddSheetNavigationController alloc] initWithRootViewController:v3];

  return v4;
}

- (void)addCityWithoutUserInteraction:(id)a3
{
  [(MTAWorldClockTableViewController *)self addClockViewController:0 addCity:a3];

  [(MTAWorldClockTableViewController *)self finishAddViewControllerDismissal:0];
}

- (void)removeCityWithoutUserInteraction:(id)a3
{
  id v4 = a3;
  double v5 = +[WorldClockManager sharedManager];
  objc_super v6 = [v5 cities];
  id v7 = [v6 indexOfObject:v4];

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = +[NSIndexPath indexPathForRow:v7 inSection:0];
    [(MTAWorldClockTableViewController *)self removeCityAtIndexPath:v8];
  }
}

- (void)addClockViewController:(id)a3 addCity:(id)a4
{
  id v5 = a4;
  objc_super v6 = +[WorldClockManager sharedManager];
  id v7 = [v6 cities];
  id v8 = [v7 count];

  id v9 = [v6 addCity:v5];
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = +[NSIndexPath indexPathForRow:v9 inSection:0];
    id v11 = [v6 cities];
    id v12 = [v11 count];

    if (v8 != v12)
    {
      [v6 saveCities];
      objc_super v13 = [(MTAWorldClockTableViewController *)self tableView];
      v15 = v10;
      id v14 = +[NSArray arrayWithObjects:&v15 count:1];
      [v13 insertRowsAtIndexPaths:v14 withRowAnimation:5];

      +[MTAnalytics incrementEventCount:kMTCAWorldClockAdds];
    }
    [(MTAWorldClockTableViewController *)self scrollToCityAtIndex:v9 animated:0];
  }
}

- (void)scrollToCityAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(MTAWorldClockTableViewController *)self tableView];
  objc_super v6 = +[NSIndexPath indexPathForRow:a3 inSection:0];
  [v7 scrollToRowAtIndexPath:v6 atScrollPosition:3 animated:v4];
}

- (void)finishAddViewControllerDismissal:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTAWorldClockTableViewController;
  [(MTATableViewController *)&v5 finishAddViewControllerDismissal:a3];
  BOOL v3 = +[MTAStateStore shared];
  BOOL v4 = +[MTAStateStoreEvent eventWithType:4];
  [v3 pushEvent:v4];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  id v9 = v8;
  if (a4 == 1 && v8 && !self->_pptTestCities) {
    [(MTAWorldClockTableViewController *)self removeCityAtIndexPath:v8];
  }
}

- (void)removeCityAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[WorldClockManager sharedManager];
  objc_super v6 = [(MTAWorldClockTableViewController *)self tableView];
  [v6 beginUpdates];

  [v5 removeCityAtIndex:[v4 row]];
  id v7 = [(MTAWorldClockTableViewController *)self tableView];
  id v8 = +[NSArray arrayWithObject:v4];
  [v7 deleteRowsAtIndexPaths:v8 withRowAnimation:2];

  id v9 = [(MTAWorldClockTableViewController *)self tableView];
  v11.receiver = self;
  v11.super_class = (Class)MTAWorldClockTableViewController;
  [(MTATableViewController *)&v11 tableView:v9 commitEditingStyle:1 forRowAtIndexPath:v4];

  id v10 = [(MTAWorldClockTableViewController *)self tableView];
  [v10 endUpdates];

  [v5 saveCities];
  +[MTAnalytics incrementEventCount:kMTCAWorldClockRemoves];
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  if (!self->_pptTestCities)
  {
    id v6 = a5;
    id v7 = a4;
    id v13 = +[WorldClockManager sharedManager];
    id v8 = [v13 cities];
    id v9 = [v8 count];

    id v10 = [v7 row];
    id v11 = [v6 row];

    if (v10 != v11 && (uint64_t)v10 < (uint64_t)v9 && (uint64_t)v11 < (uint64_t)v9)
    {
      [v13 moveCityFromIndex:v10 toIndex:v11];
      [v13 saveCities];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pptTestCities = self->_pptTestCities;
  if (pptTestCities)
  {
    id v9 = pptTestCities;
  }
  else
  {
    id v10 = +[WorldClockManager sharedManager];
    id v9 = [v10 cities];
  }
  id v11 = [v6 dequeueReusableCellWithIdentifier:@"MTWorldClockCell" forIndexPath:v7];
  [v11 updateShouldStackViewInCell:self->_shouldStackViewsInCell];
  id v12 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", [v7 row]);
  [v11 setCity:v12];

  id v13 = [v11 city];
  id v14 = [v13 name];
  [v11 setAccessibilityIdentifier:v14];

  return v11;
}

- (WorldClockCity)deferAddedCity
{
  return self->deferAddedCity;
}

- (void)setDeferAddedCity:(id)a3
{
}

- (WorldClockCity)deferRemovedCity
{
  return self->deferRemovedCity;
}

- (void)setDeferRemovedCity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->deferRemovedCity, 0);
  objc_storeStrong((id *)&self->deferAddedCity, 0);
  objc_storeStrong((id *)&self->_pptTestCities, 0);

  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end