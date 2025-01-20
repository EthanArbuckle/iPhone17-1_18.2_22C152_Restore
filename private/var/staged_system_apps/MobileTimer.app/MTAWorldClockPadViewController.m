@interface MTAWorldClockPadViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldShowAddView;
- (BOOL)shouldToggleEditView;
- (MTAWorldClockCollectionViewController)collectionViewController;
- (MTAWorldClockMapView)mapView;
- (MTAWorldClockPadViewController)init;
- (NSLayoutConstraint)collectionBottomConstraint;
- (NSLayoutConstraint)horizontalMapHeightConstraint;
- (NSLayoutConstraint)verticalMapHeightConstraint;
- (double)mapHeight;
- (id)contentScrollView;
- (id)deferAddedCity;
- (id)deferRemovedCity;
- (id)viewLoadedAction;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)addCityWithoutUserInteraction:(id)a3;
- (void)addClock:(id)a3;
- (void)addClockViewController:(id)a3 addCity:(id)a4;
- (void)collectionView:(id)a3 didRemoveCity:(id)a4;
- (void)dismissAddViewController:(id)a3;
- (void)finishAddViewControllerDismissal:(BOOL)a3;
- (void)handleApplicationDidEnterBackground;
- (void)handleApplicationWillEnterForeground;
- (void)handleContentSizeChange:(id)a3;
- (void)prepareStateForUrlLaunch;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)reloadState;
- (void)removeCityWithoutUserInteraction:(id)a3;
- (void)restoreIndexPath:(id)a3;
- (void)restoreWithUserActivity:(id)a3;
- (void)saveState;
- (void)scrollToCityAtIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setCollectionBottomConstraint:(id)a3;
- (void)setCollectionViewController:(id)a3;
- (void)setDeferAddedCity:(id)a3;
- (void)setDeferRemovedCity:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHorizontalMapHeightConstraint:(id)a3;
- (void)setMapView:(id)a3;
- (void)setPrefersStatusBarHidden:(BOOL)a3;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)setVerticalMapHeightConstraint:(id)a3;
- (void)setViewLoadedAction:(id)a3;
- (void)setupConstraints;
- (void)showAddView;
- (void)startUpdates;
- (void)stopUpdates;
- (void)toggleEditView;
- (void)updateClocksForSize:(CGSize)a3 transitionCoordinator:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTAWorldClockPadViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTAWorldClockPadViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTAWorldClockPadViewController;
  v2 = [(MTAWorldClockPadViewController *)&v12 init];
  if (v2)
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 localizedStringForKey:@"WORLD_CLOCK" value:&stru_1000A2560 table:0];
    [(MTAWorldClockPadViewController *)v2 setTitle:v4];

    [(MTAWorldClockPadViewController *)v2 setEdgesForExtendedLayout:4];
    v5 = +[UIImage systemImageNamed:@"globe"];
    v6 = [(MTAWorldClockPadViewController *)v2 tabBarItem];
    [v6 setImage:v5];

    v2->_addedClockIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7 = [(MTAWorldClockPadViewController *)v2 title];
    uint64_t v8 = +[NSUserActivity mtUserActivityWithActivityType:@"com.apple.clock.worldclock" title:v7];
    userActivity = v2->_userActivity;
    v2->_userActivity = (NSUserActivity *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)restoreWithUserActivity:(id)a3
{
}

- (BOOL)shouldShowAddView
{
  return self->_addClockNavigationController == 0;
}

- (void)showAddView
{
  if ([(MTAWorldClockPadViewController *)self shouldShowAddView])
  {
    uint64_t v8 = objc_alloc_init(MTAAddClockViewController);
    [(MTAAddClockViewController *)v8 setDelegate:self];
    v3 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
    addClockNavigationController = self->_addClockNavigationController;
    self->_addClockNavigationController = v3;

    [(UINavigationController *)self->_addClockNavigationController setModalPresentationStyle:2];
    v5 = [(UINavigationController *)self->_addClockNavigationController presentationController];
    [v5 setDelegate:self];

    [(MTAWorldClockPadViewController *)self presentViewController:self->_addClockNavigationController animated:1 completion:0];
    v6 = +[MTAStateStore shared];
    v7 = +[MTAStateStoreEvent eventWithType:3];
    [v6 pushEvent:v7];
  }
}

- (void)addClock:(id)a3
{
  [(MTAWorldClockPadViewController *)self setEditing:0];

  [(MTAWorldClockPadViewController *)self showAddView];
}

- (BOOL)shouldToggleEditView
{
  return self->_addClockNavigationController == 0;
}

- (void)toggleEditView
{
  if ([(MTAWorldClockPadViewController *)self shouldToggleEditView])
  {
    uint64_t v3 = [(MTAWorldClockPadViewController *)self isEditing] ^ 1;
    [(MTAWorldClockPadViewController *)self setEditing:v3];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTAWorldClockPadViewController;
  [(MTAWorldClockPadViewController *)&v10 setEditing:a3 animated:a4];
  v6 = [(MTAWorldClockPadViewController *)self collectionViewController];
  [v6 setEditing:v4];

  v7 = +[MTAStateStore shared];
  if (v4) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 4;
  }
  v9 = +[MTAStateStoreEvent eventWithType:v8];
  [v7 pushEvent:v9];
}

- (void)updateClocksForSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = [(MTAWorldClockPadViewController *)self collectionViewController];
  id v31 = [v7 collectionView];

  uint64_t v8 = [(MTAWorldClockPadViewController *)self collectionViewController];
  v9 = [v8 collectionViewLayout];

  if (v31 && v9)
  {
    if (width > height) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    id v11 = [v9 rowsPerPage];
    objc_super v12 = +[UIApplication sharedApplication];
    v13 = [v12 preferredContentSizeCategory];

    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);
    NSComparisonResult v15 = UIContentSizeCategoryCompareToCategory(v13, UIContentSizeCategoryAccessibilityLarge);
    if (IsAccessibilityCategory)
    {
      v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      [v16 _scaledValueForValue:150.0];
      double v18 = v17;
    }
    else
    {
      double v18 = 225.0;
    }
    if (width <= height)
    {
      float v20 = 3.0;
      if (IsAccessibilityCategory) {
        float v20 = 2.0;
      }
    }
    else
    {
      float v19 = width / v18;
      float v20 = floorf(v19);
    }
    if (v15 == NSOrderedDescending) {
      unint64_t v21 = 1;
    }
    else {
      unint64_t v21 = (unint64_t)v20;
    }
    id v22 = [v9 columnsPerPage];
    if (v11 != (id)v10 || v22 != (id)v21)
    {
      [v9 setRowsPerPage:v10];
      [v9 setColumnsPerPage:v21];
      [v9 setScrollDirection:width > height];
      if (width <= height)
      {
        v29 = [(MTAWorldClockPadViewController *)self horizontalMapHeightConstraint];
        [v29 setActive:0];

        v25 = [(MTAWorldClockPadViewController *)self verticalMapHeightConstraint];
        [v25 setActive:1];
      }
      else
      {
        v23 = [(MTAWorldClockPadViewController *)self verticalMapHeightConstraint];
        [v23 setActive:0];

        v24 = [(MTAWorldClockPadViewController *)self horizontalMapHeightConstraint];
        [v24 setActive:1];

        v25 = [(MTAWorldClockPadViewController *)self collectionViewController];
        [v25 cellHeight];
        double v27 = -v26;
        v28 = [(MTAWorldClockPadViewController *)self horizontalMapHeightConstraint];
        [v28 setConstant:v27];
      }
      v30 = [v31 collectionViewLayout];
      [v30 invalidateLayout];

      [v31 setShowsHorizontalScrollIndicator:width > height];
      [v31 setShowsVerticalScrollIndicator:width <= height];
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (id)contentScrollView
{
  v2 = [(MTAWorldClockPadViewController *)self collectionViewController];
  uint64_t v3 = [v2 contentScrollView];

  return v3;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)MTAWorldClockPadViewController;
  [(MTAWorldClockPadViewController *)&v28 viewDidLoad];
  uint64_t v3 = [(MTAWorldClockPadViewController *)self editButtonItem];
  [v3 setTarget:self];

  BOOL v4 = [(MTAWorldClockPadViewController *)self editButtonItem];
  [v4 setAction:"toggleEditView"];

  v5 = [(MTAWorldClockPadViewController *)self editButtonItem];
  v6 = [(MTAWorldClockPadViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"addClock:"];
  uint64_t v8 = [(MTAWorldClockPadViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"handleApplicationDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

  uint64_t v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"handleApplicationWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"handleContentSizeChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  objc_super v12 = +[UIColor mtui_backgroundColor];
  v13 = [(MTAWorldClockPadViewController *)self view];
  [v13 setBackgroundColor:v12];

  v14 = [MTAWorldClockCollectionViewController alloc];
  NSComparisonResult v15 = objc_opt_new();
  v16 = [(MTAWorldClockCollectionViewController *)v14 initWithCollectionViewLayout:v15];
  [(MTAWorldClockPadViewController *)self setCollectionViewController:v16];

  double v17 = [(MTAWorldClockPadViewController *)self collectionViewController];
  [v17 setDelegate:self];

  double v18 = [(MTAWorldClockPadViewController *)self collectionViewController];
  [(MTAWorldClockPadViewController *)self addChildViewController:v18];

  float v19 = [(MTAWorldClockPadViewController *)self collectionViewController];
  float v20 = [v19 view];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  unint64_t v21 = [(MTAWorldClockPadViewController *)self view];
  id v22 = [(MTAWorldClockPadViewController *)self collectionViewController];
  v23 = [v22 view];
  [v21 addSubview:v23];

  v24 = [(MTAWorldClockPadViewController *)self collectionViewController];
  [v24 didMoveToParentViewController:self];

  v25 = -[MTAWorldClockMapView initWithFrame:]([MTAWorldClockMapView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MTAWorldClockPadViewController *)self setMapView:v25];

  double v26 = [(MTAWorldClockPadViewController *)self view];
  double v27 = [(MTAWorldClockPadViewController *)self mapView];
  [v26 addSubview:v27];

  [(MTAWorldClockPadViewController *)self setupConstraints];
}

- (void)setupConstraints
{
  id v44 = [(MTAWorldClockPadViewController *)self mapView];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = [(MTAWorldClockPadViewController *)self collectionViewController];
  BOOL v4 = [v3 view];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = objc_opt_new();
  v6 = [v44 topAnchor];
  id v7 = [(MTAWorldClockPadViewController *)self view];
  uint64_t v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v5 addObject:v9];

  uint64_t v10 = [v44 leadingAnchor];
  id v11 = [(MTAWorldClockPadViewController *)self view];
  objc_super v12 = [v11 leadingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v5 addObject:v13];

  v14 = [v44 trailingAnchor];
  NSComparisonResult v15 = [(MTAWorldClockPadViewController *)self view];
  v16 = [v15 trailingAnchor];
  double v17 = [v14 constraintEqualToAnchor:v16];
  [v5 addObject:v17];

  double v18 = [v44 heightAnchor];
  [(MTAWorldClockPadViewController *)self mapHeight];
  float v19 = [v18 constraintEqualToConstant:];
  [(MTAWorldClockPadViewController *)self setVerticalMapHeightConstraint:v19];

  float v20 = [v44 heightAnchor];
  unint64_t v21 = [(MTAWorldClockPadViewController *)self view];
  id v22 = [v21 safeAreaLayoutGuide];
  v23 = [v22 heightAnchor];
  v24 = [(MTAWorldClockPadViewController *)self collectionViewController];
  [v24 cellHeight];
  double v26 = [v20 constraintEqualToAnchor:v23 constant:-v25];
  [(MTAWorldClockPadViewController *)self setHorizontalMapHeightConstraint:v26];

  double v27 = [v4 leadingAnchor];
  objc_super v28 = [(MTAWorldClockPadViewController *)self view];
  v29 = [v28 leadingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v5 addObject:v30];

  id v31 = [v4 trailingAnchor];
  v32 = [(MTAWorldClockPadViewController *)self view];
  v33 = [v32 trailingAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [v5 addObject:v34];

  v35 = [v4 topAnchor];
  v36 = [v44 bottomAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v5 addObject:v37];

  v38 = [v4 bottomAnchor];
  v39 = [(MTAWorldClockPadViewController *)self view];
  v40 = [v39 safeAreaLayoutGuide];
  v41 = [v40 bottomAnchor];
  v42 = [v38 constraintEqualToAnchor:v41 constant:0.0];
  [(MTAWorldClockPadViewController *)self setCollectionBottomConstraint:v42];

  v43 = [(MTAWorldClockPadViewController *)self collectionBottomConstraint];
  [v5 addObject:v43];

  +[NSLayoutConstraint activateConstraints:v5];
}

- (double)mapHeight
{
  uint64_t v3 = [(MTAWorldClockPadViewController *)self collectionViewController];
  BOOL v4 = [v3 collectionViewLayout];

  if ([v4 scrollDirection] == (id)1)
  {
    v5 = [(MTAWorldClockPadViewController *)self view];
    v6 = [v5 safeAreaLayoutGuide];
    [v6 layoutFrame];
    double Height = CGRectGetHeight(v13);
    uint64_t v8 = [(MTAWorldClockPadViewController *)self collectionViewController];
    [v8 cellHeight];
    double v10 = Height - v9;
  }
  else
  {
    v5 = [(MTAWorldClockPadViewController *)self view];
    [v5 bounds];
    +[MTAWorldClockMapView mapHeightForWidth:CGRectGetWidth(v14)];
    double v10 = v11;
  }

  return v10;
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MTAWorldClockPadViewController;
  [(MTAWorldClockPadViewController *)&v12 viewWillLayoutSubviews];
  if (!self->_initializedCurrentPage)
  {
    self->_initializedCurrentPage = 1;
    uint64_t v3 = [(MTAWorldClockPadViewController *)self collectionViewController];
    BOOL v4 = [v3 collectionView];

    [v4 contentSize];
    if (v6 == CGSizeZero.width && v5 == CGSizeZero.height)
    {
      uint64_t v8 = [v4 collectionViewLayout];
      [v8 invalidateLayout];
    }
    double v9 = [(MTAWorldClockPadViewController *)self view];
    [v9 bounds];
    -[MTAWorldClockPadViewController updateClocksForSize:transitionCoordinator:](self, "updateClocksForSize:transitionCoordinator:", 0, v10, v11);
  }
}

- (void)startUpdates
{
  uint64_t v3 = [(MTAWorldClockPadViewController *)self mapView];
  [v3 startUpdatingTime];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = [(MTAWorldClockPadViewController *)self collectionViewController];
  double v5 = [v4 collectionView];
  double v6 = [v5 visibleCells];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) start];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)stopUpdates
{
  uint64_t v3 = [(MTAWorldClockPadViewController *)self mapView];
  [v3 stopUpdatingTime];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = [(MTAWorldClockPadViewController *)self collectionViewController];
  double v5 = [v4 collectionView];
  double v6 = [v5 visibleCells];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) stop];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MTAWorldClockPadViewController;
  [(MTAWorldClockPadViewController *)&v17 viewWillAppear:a3];
  BOOL v4 = +[WorldClockManager sharedManager];
  double v5 = [v4 cities];

  if (!v5) {
    [v4 loadCities];
  }
  if (self->_initializedCurrentPage)
  {
    double v6 = [(MTAWorldClockPadViewController *)self view];
    [v6 bounds];
    -[MTAWorldClockPadViewController updateClocksForSize:transitionCoordinator:](self, "updateClocksForSize:transitionCoordinator:", 0, v7, v8);

    uint64_t v9 = [(MTAWorldClockPadViewController *)self collectionViewController];
    double v10 = [v9 collectionView];
    [v10 reloadData];
  }
  if (!v5 || self->_initializedCurrentPage)
  {
    long long v11 = [(MTAWorldClockPadViewController *)self mapView];
    long long v12 = [v4 cities];
    [v11 setCities:v12];
  }
  [(MTAWorldClockPadViewController *)self startUpdates];
  long long v13 = [(MTAWorldClockPadViewController *)self deferAddedCity];

  if (v13)
  {
    long long v14 = [(MTAWorldClockPadViewController *)self deferAddedCity];
    [(MTAWorldClockPadViewController *)self addCityWithoutUserInteraction:v14];

    [(MTAWorldClockPadViewController *)self setDeferAddedCity:0];
  }
  NSComparisonResult v15 = [(MTAWorldClockPadViewController *)self deferRemovedCity];

  if (v15)
  {
    v16 = [(MTAWorldClockPadViewController *)self deferRemovedCity];
    [(MTAWorldClockPadViewController *)self removeCityWithoutUserInteraction:v16];

    [(MTAWorldClockPadViewController *)self setDeferRemovedCity:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MTAWorldClockPadViewController;
  [(MTAWorldClockPadViewController *)&v14 viewDidAppear:a3];
  BOOL v4 = [(NSUserActivity *)self->_userActivity keywords];
  double v5 = v4;
  if (!v4)
  {
    double v5 = +[NSSet set];
  }
  double v6 = +[WorldClockManager sharedManager];
  double v7 = [v6 cities];
  double v8 = [v7 na_map:&stru_1000A1370];
  uint64_t v9 = [v5 setByAddingObjectsFromArray:v8];
  [(NSUserActivity *)self->_userActivity setKeywords:v9];

  if (!v4) {
  [(NSUserActivity *)self->_userActivity becomeCurrent];
  }
  double v10 = [(MTAWorldClockPadViewController *)self collectionViewController];
  long long v11 = [v10 collectionView];
  [v11 flashScrollIndicators];

  viewLoadedAction = (void (**)(void))self->_viewLoadedAction;
  if (viewLoadedAction)
  {
    viewLoadedAction[2]();
    id v13 = self->_viewLoadedAction;
    self->_viewLoadedAction = 0;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSUserActivity *)self->_userActivity resignCurrent];
  [(MTAWorldClockPadViewController *)self stopUpdates];
  v5.receiver = self;
  v5.super_class = (Class)MTAWorldClockPadViewController;
  [(MTAWorldClockPadViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MTAWorldClockPadViewController;
  -[MTAWorldClockPadViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v8 = [(MTAWorldClockPadViewController *)self collectionViewController];
  uint64_t v9 = [v8 collectionView];

  double v10 = [v9 indexPathsForVisibleItems];
  long long v11 = [v10 sortedArrayUsingComparator:&stru_1000A13B0];
  long long v12 = [v11 firstObject];

  id v13 = [(MTAWorldClockPadViewController *)self mapView];
  [v13 viewWillTransitionToSize:v7 withTransitionCoordinator:width, height];

  objc_super v14 = [(MTAWorldClockPadViewController *)self view];
  NSComparisonResult v15 = [v14 window];

  if (v15 && width >= 668.0) {
    -[MTAWorldClockPadViewController updateClocksForSize:transitionCoordinator:](self, "updateClocksForSize:transitionCoordinator:", v7, width, height);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000E8C8;
  v20[3] = &unk_1000A13D8;
  v20[4] = self;
  id v21 = v12;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000E940;
  v18[3] = &unk_1000A1400;
  id v19 = v9;
  id v16 = v9;
  id v17 = v12;
  [v7 animateAlongsideTransition:v20 completion:v18];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTAWorldClockPadViewController;
  [(MTAWorldClockPadViewController *)&v12 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  id v7 = [(MTAWorldClockPadViewController *)self traitCollection];
  if ([v7 horizontalSizeClass] == (id)2)
  {
    id v8 = [v6 horizontalSizeClass];

    if (v8 == (id)1)
    {
      if (self->_addClockNavigationController)
      {
        uint64_t v9 = [(MTAWorldClockPadViewController *)self presentedViewController];
        addClockNavigationController = self->_addClockNavigationController;

        if (v9 == addClockNavigationController)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10000EA70;
          v11[3] = &unk_1000A1428;
          v11[4] = self;
          [(MTAWorldClockPadViewController *)self dismissViewControllerAnimated:1 completion:v11];
        }
      }
    }
  }
  else
  {
  }
}

- (void)handleApplicationWillEnterForeground
{
  BOOL v3 = [(MTAWorldClockPadViewController *)self mapView];
  [v3 startUpdatingTime];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = [(MTAWorldClockPadViewController *)self collectionViewController];
  objc_super v5 = [v4 collectionView];
  id v6 = [v5 visibleCells];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) start];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)handleApplicationDidEnterBackground
{
  BOOL v3 = [(MTAWorldClockPadViewController *)self mapView];
  [v3 stopUpdatingTime];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = [(MTAWorldClockPadViewController *)self collectionViewController];
  objc_super v5 = [v4 collectionView];
  id v6 = [v5 visibleCells];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) start];
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)handleContentSizeChange:(id)a3
{
  BOOL v4 = [(MTAWorldClockPadViewController *)self collectionViewController];
  [v4 handleContentSizeChange];

  id v5 = [(MTAWorldClockPadViewController *)self view];
  [v5 setNeedsUpdateConstraints];
}

- (void)collectionView:(id)a3 didRemoveCity:(id)a4
{
  id v5 = a4;
  id v6 = [(MTAWorldClockPadViewController *)self mapView];
  [v6 removeCity:v5];

  id v7 = +[WorldClockManager sharedManager];
  id v8 = [v7 cities];
  id v9 = [v8 count];

  if (!v9)
  {
    [(MTAWorldClockPadViewController *)self setEditing:0];
  }
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyle = a3;
  [(MTAWorldClockPadViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)setPrefersStatusBarHidden:(BOOL)a3
{
  self->_prefersStatusBarHidden = a3;
  [(MTAWorldClockPadViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (int64_t)preferredStatusBarStyle
{
  return self->_statusBarStyle;
}

- (BOOL)prefersStatusBarHidden
{
  return self->_prefersStatusBarHidden;
}

- (void)addCityWithoutUserInteraction:(id)a3
{
  [(MTAWorldClockPadViewController *)self addClockViewController:0 addCity:a3];

  [(MTAWorldClockPadViewController *)self dismissAddViewController:0];
}

- (void)addClockViewController:(id)a3 addCity:(id)a4
{
  id v5 = a4;
  id v6 = +[WorldClockManager sharedManager];
  id v7 = [(MTAWorldClockPadViewController *)self collectionViewController];
  id v8 = [v7 collectionView];

  id v9 = [v6 cities];
  id v10 = [v9 count];

  id v11 = [v6 addCity:v5];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    long long v12 = 0;
  }
  else
  {
    long long v12 = +[NSIndexPath indexPathForItem:v11 inSection:0];
    long long v13 = [v6 cities];
    id v14 = [v13 count];

    if (v10 != v14)
    {
      [v6 saveCities];
      id v17 = v12;
      NSComparisonResult v15 = +[NSArray arrayWithObjects:&v17 count:1];
      [v8 insertItemsAtIndexPaths:v15];

      id v16 = [v8 collectionViewLayout];
      [v16 invalidateLayout];

      +[MTAnalytics incrementEventCount:kMTCAWorldClockAdds];
    }
  }
  self->_addedClockIndex = (int64_t)v11;
}

- (void)removeCityWithoutUserInteraction:(id)a3
{
  id v4 = a3;
  id v5 = +[WorldClockManager sharedManager];
  id v6 = [v5 cities];
  id v7 = [v6 indexOfObject:v4];

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(MTAWorldClockPadViewController *)self collectionViewController];
    id v8 = +[NSIndexPath indexPathForRow:v7 inSection:0];
    [v9 removeCityAtIndexPath:v8];
  }
}

- (void)dismissAddViewController:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F1A4;
  v5[3] = &unk_1000A1428;
  v5[4] = self;
  [(MTAWorldClockPadViewController *)self dismissViewControllerAnimated:1 completion:v5];
  addClockNavigationController = self->_addClockNavigationController;
  self->_addClockNavigationController = 0;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  [(MTAWorldClockPadViewController *)self finishAddViewControllerDismissal:1];
  addClockNavigationController = self->_addClockNavigationController;
  self->_addClockNavigationController = 0;
}

- (void)finishAddViewControllerDismissal:(BOOL)a3
{
  int64_t addedClockIndex = self->_addedClockIndex;
  if (addedClockIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(MTAWorldClockPadViewController *)self scrollToCityAtIndex:addedClockIndex animated:1];
    id v5 = +[WorldClockManager sharedManager];
    id v6 = [v5 cities];
    id v7 = [v6 objectAtIndexedSubscript:self->_addedClockIndex];

    id v8 = [(MTAWorldClockPadViewController *)self mapView];
    [v8 addCity:v7];

    self->_int64_t addedClockIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v10 = +[MTAStateStore shared];
  id v9 = +[MTAStateStoreEvent eventWithType:4];
  [v10 pushEvent:v9];
}

- (void)scrollToCityAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(MTAWorldClockPadViewController *)self collectionViewController];
  id v6 = +[NSIndexPath indexPathForItem:a3 inSection:0];
  [v7 scrollToPageContainingIndexPath:v6 animated:v4];
}

- (void)reloadState
{
  id v2 = +[WorldClockManager sharedManager];
  [v2 loadCities];
}

- (void)saveState
{
  id v2 = +[WorldClockManager sharedManager];
  [v2 saveCities];
}

- (void)restoreIndexPath:(id)a3
{
  id v15 = a3;
  id v4 = [v15 section];
  id v5 = [(MTAWorldClockPadViewController *)self collectionViewController];
  id v6 = [v5 collectionView];
  if ((uint64_t)v4 < (uint64_t)[v6 numberOfSections])
  {
    id v7 = [v15 row];
    id v8 = [(MTAWorldClockPadViewController *)self collectionViewController];
    id v9 = [v8 collectionView];
    id v10 = [v9 numberOfItemsInSection:[v15 section]];

    if ((uint64_t)v7 >= (uint64_t)v10) {
      goto LABEL_8;
    }
    id v11 = +[UIDevice currentDevice];
    long long v12 = (char *)[v11 orientation] - 3;

    id v5 = [(MTAWorldClockPadViewController *)self collectionViewController];
    long long v13 = [v5 collectionView];
    id v6 = v13;
    if ((unint64_t)v12 >= 2) {
      uint64_t v14 = 4;
    }
    else {
      uint64_t v14 = 32;
    }
    [v13 scrollToItemAtIndexPath:v15 atScrollPosition:v14 animated:0];
  }

LABEL_8:
}

- (void)prepareStateForUrlLaunch
{
  addClockNavigationController = self->_addClockNavigationController;
  self->_addClockNavigationController = 0;

  id viewLoadedAction = self->_viewLoadedAction;
  self->_id viewLoadedAction = 0;
}

- (id)deferAddedCity
{
  return self->deferAddedCity;
}

- (void)setDeferAddedCity:(id)a3
{
}

- (id)deferRemovedCity
{
  return self->deferRemovedCity;
}

- (void)setDeferRemovedCity:(id)a3
{
}

- (id)viewLoadedAction
{
  return self->_viewLoadedAction;
}

- (void)setViewLoadedAction:(id)a3
{
}

- (MTAWorldClockCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void)setCollectionViewController:(id)a3
{
}

- (MTAWorldClockMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (NSLayoutConstraint)verticalMapHeightConstraint
{
  return self->_verticalMapHeightConstraint;
}

- (void)setVerticalMapHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)horizontalMapHeightConstraint
{
  return self->_horizontalMapHeightConstraint;
}

- (void)setHorizontalMapHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)collectionBottomConstraint
{
  return self->_collectionBottomConstraint;
}

- (void)setCollectionBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionBottomConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalMapHeightConstraint, 0);
  objc_storeStrong((id *)&self->_verticalMapHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);
  objc_storeStrong(&self->_viewLoadedAction, 0);
  objc_storeStrong((id *)&self->deferRemovedCity, 0);
  objc_storeStrong((id *)&self->deferAddedCity, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);

  objc_storeStrong((id *)&self->_addClockNavigationController, 0);
}

@end