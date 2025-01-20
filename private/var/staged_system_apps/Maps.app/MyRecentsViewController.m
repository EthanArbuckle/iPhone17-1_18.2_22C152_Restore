@interface MyRecentsViewController
- (UIScrollView)pptTestScrollView;
- (id)initIncludingRecentSearches:(BOOL)a3;
- (id)keyCommands;
- (id)preferredFocusEnvironments;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (void)_updateHeaderHairlineAnimated:(BOOL)a3;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)loadDataSource;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MyRecentsViewController

- (id)initIncludingRecentSearches:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MyRecentsViewController;
  v4 = [(MyRecentsViewController *)&v9 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v6 = [(ContaineeViewController *)v4 cardPresentationController];
    [v6 setPresentedModally:1];

    v7 = [(ContaineeViewController *)v5 cardPresentationController];
    [v7 setTakesAvailableHeight:1];

    v5->_includeRecentSearches = a3;
  }
  return v5;
}

- (id)keyCommands
{
  v3 = [(MyRecentsViewController *)self presentedViewController];

  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)MyRecentsViewController;
    v4 = [(ContaineeViewController *)&v8 keyCommands];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MyRecentsViewController;
    v5 = [(ContaineeViewController *)&v9 keyCommands];
    v6 = [(MyRecentsDataSource *)self->_recentsDataSource keyCommands];
    v4 = [v5 arrayByAddingObjectsFromArray:v6];
  }

  return v4;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v7 = [(MyRecentsDataSource *)self->_recentsDataSource keyCommands];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8)
  {
    objc_super v9 = self->_recentsDataSource;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MyRecentsViewController;
    objc_super v9 = [(MyRecentsViewController *)&v12 targetForAction:a3 withSender:v6];
  }
  v10 = v9;

  return v10;
}

- (id)preferredFocusEnvironments
{
  tableView = self->_tableView;
  v2 = +[NSArray arrayWithObjects:&tableView count:1];

  return v2;
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)MyRecentsViewController;
  [(ContaineeViewController *)&v49 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(MyRecentsViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(ContaineeViewController *)self headerView];
  id v6 = [(ContaineeViewController *)self contentView];
  v7 = [ContainerHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[ContainerHeaderView initWithFrame:](v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(ContainerHeaderView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)v11 setDelegate:self];
  [(ContainerHeaderView *)v11 setHeaderSize:2];
  objc_super v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"[RecentlyViewed] Recents" value:@"localized string not found" table:0];
  [(ContainerHeaderView *)v11 setTitle:v13];

  [v5 addSubview:v11];
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v11;
  v15 = v11;

  v16 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  [(MapsThemeTableView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = +[UIColor clearColor];
  [(MapsThemeTableView *)v16 setBackgroundColor:v17];

  [(MapsThemeTableView *)v16 _setHeaderAndFooterViewsFloat:0];
  [(MapsThemeTableView *)v16 setPreservesSuperviewLayoutMargins:1];
  [v6 addSubview:v16];
  v48 = self;
  tableView = self->_tableView;
  self->_tableView = v16;
  v19 = v16;

  v47 = [(ContainerHeaderView *)v15 topAnchor];
  v46 = [v5 topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v50[0] = v45;
  v20 = v15;
  v44 = [(ContainerHeaderView *)v15 leadingAnchor];
  v42 = [v5 leadingAnchor];
  v41 = [v44 constraintEqualToAnchor:v42];
  v50[1] = v41;
  v40 = [(ContainerHeaderView *)v15 trailingAnchor];
  v43 = v5;
  v39 = [v5 trailingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v50[2] = v38;
  v37 = [(ContainerHeaderView *)v15 bottomAnchor];
  v36 = [v5 bottomAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v50[3] = v35;
  v33 = [(MapsThemeTableView *)v19 topAnchor];
  v32 = [v6 topAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v50[4] = v31;
  v30 = [(MapsThemeTableView *)v19 leadingAnchor];
  v29 = [v6 leadingAnchor];
  v21 = [v30 constraintEqualToAnchor:v29];
  v50[5] = v21;
  v22 = [(MapsThemeTableView *)v19 trailingAnchor];
  v34 = v6;
  v23 = [v6 trailingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v50[6] = v24;
  v25 = [(MapsThemeTableView *)v19 bottomAnchor];
  v26 = [v6 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v50[7] = v27;
  v28 = +[NSArray arrayWithObjects:v50 count:8];
  +[NSLayoutConstraint activateConstraints:v28];

  [(MyRecentsViewController *)v48 _updateHeaderHairlineAnimated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MyRecentsViewController;
  [(ContaineeViewController *)&v4 viewWillAppear:a3];
  [(MyRecentsViewController *)self loadDataSource];
  [(MyRecentsViewController *)self _updateHeaderHairlineAnimated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MyRecentsViewController;
  [(MyRecentsViewController *)&v4 viewDidAppear:a3];
  +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTMyRecentsViewControllerDidAppearNotification" object:self userInfo:0];
}

- (void)_updateHeaderHairlineAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MapsThemeTableView *)self->_tableView _maps_shouldShowTopHairline];
  BOOL v6 = v3 && [(MapsThemeTableView *)self->_tableView style] == (id)2;
  double v7 = 0.0;
  if (v5) {
    double v7 = 1.0;
  }
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10051369C;
  v9[3] = &unk_1012EB708;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005136B0;
  v8[3] = &unk_1012EB730;
  +[UIScrollView _maps_updateTopHairlineAlpha:v6 animated:v9 getter:v8 setter:v7];
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MyRecentsViewController;
  [(ContaineeViewController *)&v4 scrollViewDidScroll:a3];
  [(MyRecentsViewController *)self _updateHeaderHairlineAnimated:1];
}

- (void)loadDataSource
{
  BOOL v3 = [[MyRecentsDataSource alloc] initWithTableView:self->_tableView updateLocation:0 includeRecentSearches:self->_includeRecentSearches];
  recentsDataSource = self->_recentsDataSource;
  self->_recentsDataSource = v3;

  [self->_recentsDataSource setDelegate:self];
  unsigned int v5 = [(ControlContaineeViewController *)self delegate];
  BOOL v6 = [v5 appCoordinator];
  [(MyRecentsDataSource *)self->_recentsDataSource setShareDelegate:v6];

  [(MapsThemeTableView *)self->_tableView setDelegate:self->_recentsDataSource];
  [(MapsThemeTableView *)self->_tableView setDataSource:self->_recentsDataSource];
  double v7 = self->_recentsDataSource;

  [(DataSource *)v7 setActive:1];
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_recentsDataSource == a3)
  {
    [(MapsThemeTableView *)self->_tableView reloadData];
    [(MyRecentsViewController *)self _updateHeaderHairlineAnimated:0];
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_68;
  }
  id v6 = v5;
  double v7 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    objc_super v9 = v8;
  }
  else {
    objc_super v9 = 0;
  }
  id v10 = v9;

  if (v10
    && ([v10 historyEntry],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 conformsToProtocol:v7],
        v11,
        v12))
  {
    id v13 = v8;
  }
  else
  {
    id v13 = 0;
  }

  if (!v13)
  {
    id v32 = v8;
    v33 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
    objc_opt_class();
    id v34 = v32;
    if (objc_opt_isKindOfClass()) {
      v35 = v34;
    }
    else {
      v35 = 0;
    }
    id v36 = v35;

    if (v36
      && ([v36 historyEntry],
          v37 = objc_claimAutoreleasedReturnValue(),
          unsigned int v38 = [v37 conformsToProtocol:v33],
          v37,
          v38))
    {
      id v39 = v34;
    }
    else
    {
      id v39 = 0;
    }

    if (v39)
    {
      id v41 = v34;
      v42 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
      objc_opt_class();
      id v43 = v41;
      if (objc_opt_isKindOfClass()) {
        v44 = v43;
      }
      else {
        v44 = 0;
      }
      id v45 = v44;

      if (v45
        && ([v45 historyEntry],
            v46 = objc_claimAutoreleasedReturnValue(),
            unsigned int v47 = [v46 conformsToProtocol:v42],
            v46,
            v47))
      {
        id v48 = v43;
      }
      else
      {
        id v48 = 0;
      }

      objc_super v49 = [(ControlContaineeViewController *)self delegate];
      v50 = [v48 historyEntry];
      v51 = [v50 lineItem];
      [v49 viewController:self selectTransitLineItem:v51 zoomToMapRegion:1];
    }
    else
    {
      id v52 = v34;
      v53 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
      objc_opt_class();
      id v54 = v52;
      if (objc_opt_isKindOfClass()) {
        v55 = v54;
      }
      else {
        v55 = 0;
      }
      id v56 = v55;

      if (v56
        && ([v56 historyEntry],
            v57 = objc_claimAutoreleasedReturnValue(),
            unsigned int v58 = [v57 conformsToProtocol:v53],
            v57,
            v58))
      {
        id v59 = v54;
      }
      else
      {
        id v59 = 0;
      }

      if (!v59)
      {
        v89 = +[SearchFieldItem searchFieldItemWithObject:v54];
        if (v89)
        {
          v90 = [(ControlContaineeViewController *)self delegate];
          [v90 viewController:self doSearchItem:v89 withUserInfo:&off_1013AEA38];
        }
        goto LABEL_68;
      }
      id v60 = v54;
      v61 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
      objc_opt_class();
      id v62 = v60;
      if (objc_opt_isKindOfClass()) {
        v63 = v62;
      }
      else {
        v63 = 0;
      }
      id v64 = v63;

      if (v64
        && ([v64 historyEntry],
            v65 = objc_claimAutoreleasedReturnValue(),
            unsigned int v66 = [v65 conformsToProtocol:v61],
            v65,
            v66))
      {
        id v48 = v62;
      }
      else
      {
        id v48 = 0;
      }

      objc_super v49 = [(ControlContaineeViewController *)self delegate];
      v50 = [v48 historyEntry];
      v51 = [v50 placeCollection];
      [v49 viewController:self showCuratedCollection:v51];
    }

LABEL_68:
    uint64_t v31 = 2064;
    goto LABEL_69;
  }
  id v14 = v8;
  v15 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  objc_opt_class();
  id v16 = v14;
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (v18
    && ([v18 historyEntry],
        v19 = objc_claimAutoreleasedReturnValue(),
        unsigned int v20 = [v19 conformsToProtocol:v15],
        v19,
        v20))
  {
    id v21 = v16;
  }
  else
  {
    id v21 = 0;
  }

  v22 = [v21 historyEntry];
  v23 = [v22 endWaypoint];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v25 = [v22 endWaypoint];
    v26 = [(ControlContaineeViewController *)self delegate];
    v27 = [v25 route];
    [v26 viewController:self enterRouteCreationWithRoute:v27 withUserInfo:0];

    v28 = [v25 route];
    id v29 = [v28 source];

    if (v29 == (id)3) {
      unsigned int v30 = 468;
    }
    else {
      unsigned int v30 = 2064;
    }
    if (v29 == (id)2) {
      uint64_t v31 = 462;
    }
    else {
      uint64_t v31 = v30;
    }
  }
  else
  {
    v25 = +[SearchFieldItem searchFieldItemsForRouteHistoryEntry:v22];
    if (([v22 navigationWasInterrupted] & 1) != 0
      || (unint64_t)[v25 count] >= 3)
    {
      id v40 = [v22 transportType];
    }
    else
    {
      id v40 = 0;
    }
    v67 = [[DirectionItem alloc] initWithItems:v25 transportType:v40];
    if ([v22 navigationWasInterrupted])
    {
      v68 = [DrivePreferences alloc];
      v69 = [v22 automobileOptions];
      v70 = +[NSUserDefaults standardUserDefaults];
      v71 = [(DrivePreferences *)v68 initWithAutomobileOptions:v69 defaults:v70];
      [(DirectionItem *)v67 setDrivePreferences:v71];

      v72 = [TransitPreferences alloc];
      v73 = [v22 transitOptions];
      v74 = +[NSUserDefaults standardUserDefaults];
      v75 = [(TransitPreferences *)v72 initWithTransitOptions:v73 defaults:v74];
      [(DirectionItem *)v67 setTransitPreferences:v75];

      v76 = [WalkPreferences alloc];
      v77 = [v22 walkingOptions];
      v78 = +[NSUserDefaults standardUserDefaults];
      v79 = [(WalkPreferences *)v76 initWithWalkingOptions:v77 defaults:v78];
      [(DirectionItem *)v67 setWalkPreferences:v79];

      v80 = [CyclePreferences alloc];
      v81 = [v22 cyclingOptions];
      v82 = +[NSUserDefaults standardUserDefaults];
      v83 = [(CyclePreferences *)v80 initWithCyclingOptions:v81 defaults:v82];
      [(DirectionItem *)v67 setCyclePreferences:v83];
    }
    v91[0] = @"DirectionsSessionInitiatorKey";
    v91[1] = @"DirectionsRouteUUIDKey";
    v92[0] = &off_1013A74F8;
    v84 = [v22 identifier];
    v92[1] = v84;
    v85 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];

    v86 = [(ControlContaineeViewController *)self delegate];
    [v86 viewController:self doDirectionItem:v67 withUserInfo:v85];

    if ((unint64_t)[v25 count] > 2) {
      uint64_t v31 = 302;
    }
    else {
      uint64_t v31 = 303;
    }
  }
LABEL_69:
  v87 = +[NSNumber numberWithInteger:[(MyRecentsDataSource *)self->_recentsDataSource indexOfItem:v5]];
  v88 = [v87 stringValue];
  +[GEOAPPortal captureUserAction:v31 target:257 value:v88];
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end